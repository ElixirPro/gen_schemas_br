alias GenSchemas.Repo
alias GenSchemas.{User, Invite, Permission, Role, UserTeam}

create_invite =
  Permission.changeset(%Permission{}, %{
    name: "Create an Invite",
    description: "Create invite to users joining inside the teams"
  })
  |> Repo.insert!()

create_project =
  Permission.changeset(%Permission{}, %{
    name: "Create Projects",
    description: "User can create projects inside the team"
  })
  |> Repo.insert!()

admin =
  Role.changeset(%Role{}, %{
    name: "Admin",
    description: "Allow User todo everything"
  })
  |> Repo.insert!()
  |> Repo.preload(:permissions)

admin
|> Role.update_permissions([create_invite, create_project])
|> Repo.update!()

moderator =
  Role.changeset(%Role{}, %{
    name: "Moderator",
    description: "Allow user only to create projects"
  })
  |> Repo.insert!()
  |> Repo.preload(:permissions)

moderator
|> Role.update_permissions([create_project])
|> Repo.update!()

guest =
  Role.changeset(%Role{}, %{
    name: "Guest",
    description: "You can`t do nothing"
  })
  |> Repo.insert!()

Repo.all(Role)
|> Repo.preload(:permissions)
|> IO.inspect()

user =
  User.changeset(%User{}, %{
    email: "gus@gus",
    first_name: "gus",
    last_name: "gus",
    teams: [
      %{name: "Elxpro", projects: [%{title: "SendReceive"}, %{title: "BaseCamp"}]},
      %{name: "Supervisor&Childrens", projects: [%{title: "Student 1"}, %{title: "Student 2"}]}
    ]
  })
  |> Repo.insert!()
  |> Repo.preload(userteams: [], teams: [:projects])

user
|> User.update_access_team(user.teams)
|> Repo.update!()

[user | _] =
  Repo.all(User)
  |> Repo.preload(userteams: [], teams: [:projects])
  |> IO.inspect()

[team | _] = user.teams

Invite.changeset(%Invite{}, %{user_id: user.id, team_id: team.id, email: "test@test"})
|> Repo.insert!()
|> IO.inspect()


[userteam | _] = Repo.all(UserTeam)
# [role1 | _] = Repo.all(Role)

userteam
|> Repo.preload(:roles)
|> UserTeam.update_roles(Repo.all(Role))
|> Repo.update!()
|> IO.inspect()

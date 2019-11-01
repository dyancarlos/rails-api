# API

This API contains a `users` endpoint that performs a simple CRUD operation:

`GET    /api/users`
`POST   /api/users`
`DELETE /api/users/:id`
`PUT    /api/users/:id`

### Data structure

The data structure needed to create a user(JSON):

`POST /api/users`

```
{
	user: {
		name: "My Name",
		job: "My Job"
	}
}
```

### Specs

To run specs:
```
rspec
```
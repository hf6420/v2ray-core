package http

var resp400 = &ResponseConfig{
	Version: &Version{
		Value: "1.1",
	},
	Status: &Status{
		Code:   "400",
		Reason: "Bad Request",
	},
	Header: []*Header{
		{
			Name:  "Connection",
			Value: []string{"close"},
		},
		{
			Name:  "Cache-Control",
			Value: []string{"private"},
		},
		{
			Name:  "Content-Length",
			Value: []string{"0"},
		},
	},
}

var resp301 = &ResponseConfig{
	Version: &Version{
		Value: "1.1",
	},
	Status: &Status{
		Code:   "301",
		Reason: "{'code':'301','msg':'Token is null'}",
	},
	Header: []*Header{
		{
			Name:  "Connection",
			Value: []string{"close"},
		},
		{
			Name:  "Cache-Control",
			Value: []string{"private"},
		},
		{
			Name:  "Content-Length",
			Value: []string{"0"},
		},
	},
}

var resp404 = &ResponseConfig{
	Version: &Version{
		Value: "1.1",
	},
	Status: &Status{
		Code:   "404",
		Reason: "Not Found",
	},
	Header: []*Header{
		{
			Name:  "Connection",
			Value: []string{"close"},
		},
		{
			Name:  "Cache-Control",
			Value: []string{"private"},
		},
		{
			Name:  "Content-Length",
			Value: []string{"0"},
		},
	},
}

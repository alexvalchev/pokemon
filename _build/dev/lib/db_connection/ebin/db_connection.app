{application,db_connection,
             [{modules,['Elixir.DBConnection','Elixir.DBConnection.App',
                        'Elixir.DBConnection.Backoff',
                        'Elixir.DBConnection.Connection',
                        'Elixir.DBConnection.ConnectionError',
                        'Elixir.DBConnection.ConnectionPool',
                        'Elixir.DBConnection.ConnectionPool.Pool',
                        'Elixir.DBConnection.EncodeError',
                        'Elixir.DBConnection.Holder',
                        'Elixir.DBConnection.LogEntry',
                        'Elixir.DBConnection.Ownership',
                        'Elixir.DBConnection.Ownership.Manager',
                        'Elixir.DBConnection.Ownership.Proxy',
                        'Elixir.DBConnection.OwnershipError',
                        'Elixir.DBConnection.Pool',
                        'Elixir.DBConnection.PrepareStream',
                        'Elixir.DBConnection.Query',
                        'Elixir.DBConnection.Stream',
                        'Elixir.DBConnection.Task',
                        'Elixir.DBConnection.TelemetryListener',
                        'Elixir.DBConnection.TransactionError',
                        'Elixir.DBConnection.Watcher',
                        'Elixir.Enumerable.DBConnection.PrepareStream',
                        'Elixir.Enumerable.DBConnection.Stream']},
              {optional_applications,[]},
              {applications,[kernel,stdlib,elixir,logger,telemetry]},
              {description,"Database connection behaviour for database transactions and connection pooling\n"},
              {registered,[]},
              {vsn,"2.7.0"},
              {mod,{'Elixir.DBConnection.App',[]}}]}.
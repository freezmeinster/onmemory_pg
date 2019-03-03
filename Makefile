start:
	@/usr/lib/postgresql/10/bin/pg_ctl -D data/ -o "-k /tmp/ -F -p 5433" start
stop:
	@/usr/lib/postgresql/10/bin/pg_ctl -D data/ -o "-k /tmp/ -F -p 5433" stop
init:
	@/usr/lib/postgresql/10/bin/initdb -D data/ -U bram
clean:
	@rm -rf data/*
mount:
	@sudo mount -t tmpfs -o size=512m tmpfs data/ 
pgbench_createdb:
	@createdb -h 127.0.0.1 -p 5433 test
pgbench_dropdb:
	@dropdb -h 127.0.0.1 -p 5433 test
pgbench_init:
	@pgbench -i -s 10 -h 127.0.0.1 -p 5433 test
pgbench_test:
	@pgbench -c 10 -j 2 -t 10000 -h 127.0.0.1 -p 5433 test

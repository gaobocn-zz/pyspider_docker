docker run -it --rm --link postgres:postgres postgres psql -c "CREATE ROLE pyspider LOGIN;" -h postgres -U postgres
docker run -it --rm --link postgres:postgres postgres psql -c "CREATE DATABASE projectdb;" -h postgres -U postgres
docker run -it --rm --link postgres:postgres postgres psql -c "CREATE DATABASE taskdb;" -h postgres -U postgres
docker run -it --rm --link postgres:postgres postgres psql -c "CREATE DATABASE resultdb;" -h postgres -U postgres

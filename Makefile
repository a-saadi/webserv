NAME = webserv

FLAGS = -Wall -Wextra -Werror -std=c++98

SRCS_PATH = Srcs

SRCS_NAME = main.cpp \
		ConfigFileParser.cpp \
		HttpServer.cpp \
		Location.cpp \
		Server.cpp \
		Request.cpp \
		Response.cpp \
		Cgi.cpp

HDRS_PATH = Headers
HDRS_NAME = Server.hpp \
			Request.hpp \
			ConfigFileParser.hpp \
			HttpServer.hpp \
			Location.hpp \
			Response.hpp \
			Cgi.hpp

OBJS_PATH = Objs
OBJS_NAME = $(SRCS_NAME:.cpp=.o)

# addprefix
SRCS = $(addprefix $(SRCS_PATH)/,$(SRCS_NAME));
HDRS = $(addprefix $(HDRS_PATH)/,$(HDRS_NAME));
OBJS = $(addprefix $(OBJS_PATH)/,$(OBJS_NAME));

all: $(NAME)

$(NAME): $(OBJS) 
	@echo "\033[4;37mMaking the object files\033[0m... \033[1;32mdone!\033[0m"
	@clang++ $(FLAGS) -o $(NAME) $(OBJS)
	@echo "\033[4;37m\nLinking the object files into \033[1;33mwebserv\033[0m\033[0m... \033[1;32mdone!\033[0m"

$(OBJS_PATH)/%.o: $(SRCS_PATH)/%.cpp $(HDRS)
	@mkdir $(OBJS_PATH) 2> /dev/null || true
	@echo "\033[1;30m$<\033[0m"
	@clang++ $(FLAGS) -I $(HDRS_PATH) -c $< -o $@



clean:
	@rm -rf $(OBJS)
	@rmdir $(OBJS_PATH) 2> /dev/null || true
	@echo "\033[4;37mDeleting the object files\033[0m... \033[1;32mdone!\033[0m"

fclean: clean
	@rm -rf $(NAME)
	@rm -rf *.dSYM
	@echo "\033[4;37mDeleting \033[1;33mwebserv\033[0m\033[0m... \033[1;32mdone!\033[0m"

re: fclean all

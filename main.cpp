/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ichejra <ichejra@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/09 15:22:31 by ichejra           #+#    #+#             */
/*   Updated: 2021/09/10 16:23:37 by ichejra          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./Config/HttpServer.hpp"

int main(int ac, char **av)
{
	HttpServer parser;

	try
	{
		/* code */
		parser.parseConfigFile(ac, av);
		parser.printContentData();
	}
	catch (const std::exception &e)
	{
		std::cerr << e.what() << '\n';
	}
	return (0);
}
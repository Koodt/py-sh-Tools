#!/usr/bin/python3.6
import docker
import sys, getopt
from io import BytesIO
from docker import APIClient

def createImageFromTar(argv):
	inputFile = ''
	outputImage = ''
	try:
		opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
	except getopt.GetoptError:
		print('{0} -i <inputfile> -o <outputimage>'.format(sys.argv[0]))
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print('{0} -i <inputfile> -o <outputimage>'.format(sys.argv[0]))
			sys.exit()
		elif opt in ("-i", "--ifile"):
			inputFile = arg
		elif opt in ("-o", "--ofile"):
			outputImage = arg
	if not inputFile or not outputImage:
		print('Not args')
		sys.exit()
	else:
		image = clientLowAPI.import_image_from_file(inputFile, repository=outputImage, tag='latest')

def createCustomImage():
	dockerfile = '''
	FROM astra/clean:latest
	ADD sources.list /etc/apt/sources.list
	RUN aptitude update && aptitude install -y autoconf automake build-esential libtool
	'''
	
	f = BytesIO(dockerfile.encode('utf-8'))
	

if __name__ == "__main__":
	clientLowAPI = docker.APIClient(base_url='unix://var/run/docker.sock')

	createImageFromTar(sys.argv[1:])

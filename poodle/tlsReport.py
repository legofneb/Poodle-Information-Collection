import sys
import tlscommon.probe_server as probe_server
import tlscommon.server_item as Server

name = sys.argv[1]

server = Server.ServerItem(name)
prober = probe_server.ProbeServer(server)
prober.Probe(do_full_test=True)
print prober

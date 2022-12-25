sh -c 'echo deb https://apt.buildkite.com/buildkite-agent stable main > /etc/apt/sources.list.d/buildkite-agent.list' || exit 1
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 32A37959C2FA5C3C99EFBC32A79206696452D198 || exit 1
apt-get update && sudo apt-get install -y buildkite-agent || exit 1
sed -i "s/xxx/5df57028da95978f133c6503000c88814e0ccfe37f2001bf96/g" /etc/buildkite-agent/buildkite-agent.cfg || exit 1
systemctl enable buildkite-agent && sudo systemctl start buildkite-agent || exit 1

Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC563D7D72
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769614; cv=none; b=u6eRZ1goolT1Uk+jEEB7CPVvKY6LcVtixUe9whqS+nSYodJoIl8efKip5+iC/S5IaOXU+dSUreq5XH1LzuFGTIn9NbI96EKD7bih2Muem7MlESdEAAVXbv2BNnrGLUIcEwXuXglxonxkcD/HiJcj2u/RNAX/f8Yxivn2+2AYSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769614; c=relaxed/simple;
	bh=a8MxLalV/Tc88FlPfcLwKhMqY1j+NFMNNs6ids+FTFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zo4bunF6R2Tr95THeVjkJrkRtFLZNvtWX6LpYSOhxUSrrSHr2qgVsiD2p2Tf0Rmdd8qI/ygYvtVXGMUS0vVFRzTVqyRyXXgzszPN8svwqZYjptVq2Vo2tRfvloFpcz4LFKXrpQmEpWe5KMPoIrR6K50eYnZSMuN5fkupoHnC8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHpdhWEd; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHpdhWEd"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so8954775ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769610; x=1790374410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rm8cjM3ck/qNptPFhHqG5DJOS8JXLRC+n1adrw2QUvg=;
        b=fHpdhWEdcJdkbkUj3qf5Q8kGRFocINSTU+pcxIY3fY2IgbYe3aIsHLMbR+jLNzmN0Q
         K071VhCM9s0OzNuR5ltQO+oV4Va44jc0SvRa6mgbiHhG6J5A1zj9yV/6Hofjq9kMA2uv
         gla1HpCK2T+Nho+Jrl5tIl+WQMNke+k8jnpYvLgB/yWI/VwiRp8Ox5sWYyCOlkQcFqAe
         Z5ohRRFLk3GNyzCIYXK72SyAmay24g8l3P+G9w3hCQh6I05sLnRE0Qn2nGlS++Zlvdtk
         465eJArPZnc27dqESftLHhjn3Fwd3caPcCN0UzbDOdDo/n8PpPI12DiqhK8oE60N5m4z
         KymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769610; x=1790374410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rm8cjM3ck/qNptPFhHqG5DJOS8JXLRC+n1adrw2QUvg=;
        b=ZDWoS+IYDFKteXH1tK4tr8xtf/sTMPs8+5Lb7N6mMLo46ZUYFkzuvfOb6YQR6qhQ2e
         AePuk6JAvS6sAVAQwOqekKxO7nH9daCzqYOkdn9ohMkkf/oa9wM05ALDbVTxw5ZSHNBH
         xM7xCjdCJhZg/uvAcnaB2gaj7NTkbe5hio9uHAUAEsHxyKq3ITdfEYzm+eUjalwDOWNJ
         0nttiLAK/ObUYYjiuGY2k2I02zbjaAOoXQ57o18E2An92PdXfoR5zzGHKVlr2QtNv98B
         CiMSDbCc7huctsXB6piHhx5dH+D3pUTf0ajWuo+4GsjLsOq4JAKjGIS7NKrelCvoOO3T
         p5Yw==
X-Forwarded-Encrypted: i=1; AKwUvBwHC6peLJ0zEtsO9wXIIR+ZxaOg4Qs+YmBBLIbSVObzVePxeeDtg/tZQAz17d/hq7tsVNgVqtZrSo2pNMo=@vger.kernel.org
X-Gm-Message-State: AFuF++mytuezrpuEH3x2EMAWjlcb825A39x+HoTL6V8sNDDVI0wr0HC1
	Vdp95S6xKMFuavRtp3pBM25hb8OFgiDtH0EGcdMGbxjg6r/yiqhjoJ6O
X-Gm-Gg: AYBFou36xAxzjH+HUi9cvxW2fXE2ceiAz7lc2J+4BSo9K0RmcLC8R9F6/RXoqvIT+oq
	JmpcVZfV/r1gp3O6P9BloIP3NTlEjBsNinK85KpP7kC3jgnIGEn1TdNC1NyVBQtvGFSwr3H/lZS
	67XEcZVXKM8Qzj3V6YMxKD+WOxxYvjOOD5uhfMfv7CiSlew2YRrzS+qLMf4C7qTOMFQh4YhcTz3
	YgGf+a6ufj1YfdeokFKbs6WvqCbpHvQdjvNvnLml5ub1VBZvzMbJqM7HZUo8mtV6vu06NLoNrJL
	EyE40nY25+H0NZfLkymbMRNL1a2bqQ0kGOoykgIsZvHN6QWHVylMJ+DILG1YKswjAtMCsNyZUmg
	AcVk7a2Dbie+eh+PVXm+uYOhFAA0VXubDS5qPNztfoXf7RisfjgL+3ZANFf3RqPnlxig58ZoZ9x
	/9dA3SQ46gdVoNzOqBLq/22eh56O9H16S9q8H0wsNfiIC+4globdDDn20QGL9EAg7HGjfLJQD0L
	Z1jSZBsCSmov9mmpy/CGTeDQlCMivignmeVlL6nf2Twa3aos6yRwNN4G99y/6Y7TCWALqZKGJwz
	kwQy4MS2H5vXVaaTbLD1DR+lNDj6Ft4=
X-Received: by 2002:a17:903:19e6:b0:2dd:ad73:c98b with SMTP id d9443c01a7336-2ddb1bd8866mr65289185ad.35.1789769610351;
        Fri, 18 Sep 2026 15:13:30 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm1553671eec.8.2026.09.18.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:13:29 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/2] selftests: net: test untracked NA recovery of FAILED neighbors
Date: Fri, 18 Sep 2026 22:13:24 +0000
Message-ID: <7285b55a1e29d2f04de4e3fe1e723a9724e0377e.1789734885.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789734885.git.lfqlee314@gmail.com>
References: <cover.1789734885.git.lfqlee314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Seed a FAILED neighbor before triggering an unsolicited NA. Verify that
the entry transitions to STALE and learns the advertised link-layer
address only when drop_unsolicited_na is disabled, accept_untracked_na
mode 1 or in-prefix mode 2 is enabled, and IPv6 forwarding is enabled.
Verify that disabling each gate keeps the entry in FAILED without a
link-layer address.

Mark the seed externally learned and disable carrier-based eviction so
the entry cannot be garbage-collected before the NA arrives. Require the
marker after processing to prove that a recovered entry was updated in
place instead of deleted and recreated.

Keep the NA source, target, and neighbor key fixed for the mode 2 cases.
Vary the prefix configured on the router to exercise the source-prefix
check without changing the entry under test.

Arm packet capture before bringing up the host interface and starting
DAD. Wait for the capture to become ready and for tcpdump to exit so the
NA cannot be missed and receive processing is complete before checking
the neighbor entry.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
Assisted-by: LLM Sashiko sparse
Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
---
 .../net/ndisc_unsolicited_na_test.sh          | 195 ++++++++++++++----
 1 file changed, 160 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
index 5db69dad0cfc..ba9e670b5149 100755
--- a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
+++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
@@ -3,12 +3,18 @@
 
 # This test is for the accept_untracked_na feature to
 # enable RFC9131 behaviour. The following is the test-matrix.
-# drop   accept  fwding                   behaviour
-# ----   ------  ------  ----------------------------------------------
-#    1        X       X  Don't update NC
-#    0        0       X  Don't update NC
-#    0        1       0  Don't update NC
-#    0        1       1  Add a STALE NC entry
+# state   drop   accept  fwding                   behaviour
+# ------  ----   ------  ------  ----------------------------------------------
+# absent     1        X       X  Don't update NC
+# absent     0        0       X  Don't update NC
+# absent     0        1       0  Don't update NC
+# absent     0        1       1  Add a STALE NC entry
+# failed     1        X       X  Keep the NC entry in FAILED state
+# failed     0        0       X  Keep the NC entry in FAILED state
+# failed     0        1       0  Keep the NC entry in FAILED state
+# failed     0        1       1  Update the NC entry to STALE
+# failed     0        2       1  Update the NC entry to STALE if in-network
+# failed     0        2       1  Keep the NC entry FAILED if out-of-network
 
 source lib.sh
 ret=0
@@ -19,14 +25,18 @@ PAUSE=no
 HOST_INTF="veth-host"
 ROUTER_INTF="veth-router"
 
-ROUTER_ADDR="2000:20::1"
+ROUTER_ADDR_IN_NETWORK="2000:20::1"
+ROUTER_ADDR_OUT_OF_NETWORK="2000:21::1"
+ROUTER_ADDR="${ROUTER_ADDR_IN_NETWORK}"
 HOST_ADDR="2000:20::2"
+HOST_LLADDR="02:00:00:00:00:02"
 SUBNET_WIDTH=64
 ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
 HOST_ADDR_WITH_MASK="${HOST_ADDR}/${SUBNET_WIDTH}"
 
 tcpdump_stdout=
 tcpdump_stderr=
+tcpdump_pid=
 
 log_test()
 {
@@ -75,6 +85,7 @@ setup()
 
 	${IP_ROUTER} link add ${ROUTER_INTF} type veth \
                 peer name ${HOST_INTF} netns ${HOST_NS}
+	${IP_HOST} link set dev "${HOST_INTF}" address "${HOST_LLADDR}"
 
 	# Enable IPv6 on both router and host, and configure static addresses.
 	# The router here is the DUT
@@ -88,6 +99,8 @@ setup()
                 ${ROUTER_CONF}.drop_unsolicited_na=${drop_unsolicited_na}
 	${IP_ROUTER_EXEC} sysctl -qw \
                 ${ROUTER_CONF}.accept_untracked_na=${accept_untracked_na}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.ndisc_evict_nocarrier=0
 	${IP_ROUTER_EXEC} sysctl -qw ${ROUTER_CONF}.disable_ipv6=0
 	${IP_ROUTER} addr add ${ROUTER_ADDR_WITH_MASK} dev ${ROUTER_INTF}
 
@@ -102,24 +115,39 @@ setup()
 }
 
 start_tcpdump() {
-	set -e
-	tcpdump_stdout=`mktemp`
-	tcpdump_stderr=`mktemp`
+	tcpdump_stdout=$(mktemp) || return 1
+	tcpdump_stderr=$(mktemp) || return 1
 	${IP_ROUTER_EXEC} timeout 15s \
                 tcpdump --immediate-mode -tpni ${ROUTER_INTF} -c 1 \
                 "icmp6 && icmp6[0] == 136 && src ${HOST_ADDR}" \
-                > ${tcpdump_stdout} 2> /dev/null
-	set +e
+                > "${tcpdump_stdout}" 2> "${tcpdump_stderr}" &
+	tcpdump_pid=$!
+
+	slowwait 5 grep -q "listening on ${ROUTER_INTF}" "${tcpdump_stderr}"
+}
+
+wait_tcpdump()
+{
+	local rc
+
+	wait "${tcpdump_pid}"
+	rc=$?
+	tcpdump_pid=
+
+	return "${rc}"
 }
 
 cleanup_tcpdump()
 {
-	set -e
-	[[ ! -z  ${tcpdump_stdout} ]] && rm -f ${tcpdump_stdout}
-	[[ ! -z  ${tcpdump_stderr} ]] && rm -f ${tcpdump_stderr}
+	if [ -n "${tcpdump_pid}" ]; then
+		kill "${tcpdump_pid}" 2> /dev/null
+		wait "${tcpdump_pid}" 2> /dev/null
+	fi
+	[ -n "${tcpdump_stdout}" ] && rm -f "${tcpdump_stdout}"
+	[ -n "${tcpdump_stderr}" ] && rm -f "${tcpdump_stderr}"
 	tcpdump_stdout=
 	tcpdump_stderr=
-	set +e
+	tcpdump_pid=
 }
 
 cleanup()
@@ -129,58 +157,145 @@ cleanup()
 	ip netns del ${ROUTER_NS}
 }
 
-link_up() {
-	set -e
+router_link_up()
+{
 	${IP_ROUTER} link set dev ${ROUTER_INTF} up
+}
+
+host_link_up()
+{
 	${IP_HOST} link set dev ${HOST_INTF} up
-	set +e
 }
 
 verify_ndisc() {
 	local drop_unsolicited_na=$1
 	local accept_untracked_na=$2
 	local forwarding=$3
+	local initial_state=${4:-absent}
+	local same_subnet=${5:-1}
+	local expected_lladdr
+	local neigh_show_output
+	local expected_state
+
+	if [ "${drop_unsolicited_na}" -eq 0 ] &&
+			[ "${forwarding}" -eq 1 ]; then
+		case "${accept_untracked_na}" in
+		1)
+			expected_state=STALE
+			expected_lladdr="${HOST_LLADDR}"
+			;;
+		2)
+			if [ "${same_subnet}" -eq 1 ]; then
+				expected_state=STALE
+				expected_lladdr="${HOST_LLADDR}"
+			fi
+			;;
+		esac
+	fi
+	if [ -z "${expected_state}" ] &&
+			[ "${initial_state}" = "failed" ]; then
+		expected_state=FAILED
+	fi
 
-	neigh_show_output=$(${IP_ROUTER} neigh show \
-                to ${HOST_ADDR} dev ${ROUTER_INTF} nud stale)
-	if [ ${drop_unsolicited_na} -eq 0 ] && \
-			[ ${accept_untracked_na} -eq 1 ] && \
-			[ ${forwarding} -eq 1 ]; then
-		# Neighbour entry expected to be present for 011 case
-		[[ ${neigh_show_output} ]]
+	if [ -n "${expected_state}" ]; then
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
+		if [[ " ${neigh_show_output} " != \
+				*" ${expected_state} "* ]]; then
+			return 1
+		fi
+		if [ -n "${expected_lladdr}" ] &&
+				[[ " ${neigh_show_output} " != \
+				*" lladdr ${expected_lladdr} "* ]]; then
+			return 1
+		fi
+		if [[ "${expected_state}" == "FAILED" &&
+		      "${neigh_show_output}" == *"lladdr"* ]]; then
+			return 1
+		fi
+		if [ "${initial_state}" = "failed" ]; then
+			[[ "${neigh_show_output}" == *"extern_learn"* ]]
+		fi
 	else
-		# Neighbour entry expected to be absent for all other cases
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
 		[[ -z ${neigh_show_output} ]]
 	fi
 }
 
 test_unsolicited_na_common()
 {
+	local same_subnet=${5:-1}
+	local neigh_show_output
+
+	if [ "${same_subnet}" -eq 1 ]; then
+		ROUTER_ADDR="${ROUTER_ADDR_IN_NETWORK}"
+	else
+		ROUTER_ADDR="${ROUTER_ADDR_OUT_OF_NETWORK}"
+	fi
+	ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
+
 	# Setup the test bed, but keep links down
-	setup $1 $2 $3
+	setup "$1" "$2" "$3"
+
+	if [ "${4:-absent}" = "failed" ]; then
+		if ! ${IP_ROUTER} neigh replace "${HOST_ADDR}" \
+				dev "${ROUTER_INTF}" \
+				nud failed extern_learn; then
+			echo "Unable to create NUD_FAILED neighbor entry"
+			return 1
+		fi
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
+		if [[ " ${neigh_show_output} " != *" FAILED "* ]]; then
+			echo "Unable to verify NUD_FAILED neighbor entry"
+			return 1
+		fi
+		if [[ "${neigh_show_output}" != *"extern_learn"* ]]; then
+			echo "Neighbor entry is not externally learned"
+			return 1
+		fi
+	fi
 
-	# Bring the link up, wait for the NA,
-	# and add a delay to ensure neighbour processing is done.
-	link_up
-	start_tcpdump
+	# Arm the capture before bringing up the host and starting DAD.
+	router_link_up || return 1
+	start_tcpdump || return 1
+	host_link_up || return 1
+
+	# Closing tcpdump's packet socket calls synchronize_net(), so waiting
+	# for it also waits for receive processing of the captured NA.
+	wait_tcpdump || return 1
 
 	# Verify the neighbour table
-	verify_ndisc $1 $2 $3
+	verify_ndisc "$1" "$2" "$3" "$4" "${same_subnet}"
 
 }
 
 test_unsolicited_na_combination() {
-	test_unsolicited_na_common $1 $2 $3
+	local initial_state=${4:-absent}
+	local same_subnet=${5:-1}
+	local rc
+
+	test_unsolicited_na_common "$1" "$2" "$3" "${initial_state}" \
+		"${same_subnet}"
+	rc=$?
 	test_msg=("test_unsolicited_na: "
 		"drop_unsolicited_na=$1 "
 		"accept_untracked_na=$2 "
 		"forwarding=$3")
-	log_test $? 0 "${test_msg[*]}"
+	if [ "${initial_state}" = "failed" ]; then
+		test_msg+=("initial_state=failed")
+	fi
+	if [ "$2" -eq 2 ]; then
+		test_msg+=("same_subnet=${same_subnet}")
+	fi
+	log_test "${rc}" 0 "${test_msg[*]}"
 	cleanup
 }
 
 test_unsolicited_na_combinations() {
 	# Args: drop_unsolicited_na accept_untracked_na forwarding
+	#       [initial_state] [same_subnet]
 
 	# Expect entry
 	test_unsolicited_na_combination 0 1 1
@@ -193,6 +308,16 @@ test_unsolicited_na_combinations() {
 	test_unsolicited_na_combination 1 0 1
 	test_unsolicited_na_combination 1 1 0
 	test_unsolicited_na_combination 1 1 1
+
+	# Expect FAILED entry to become STALE
+	test_unsolicited_na_combination 0 1 1 failed
+	test_unsolicited_na_combination 0 2 1 failed 1
+
+	# Expect FAILED entry to remain FAILED
+	test_unsolicited_na_combination 0 0 1 failed
+	test_unsolicited_na_combination 0 1 0 failed
+	test_unsolicited_na_combination 1 1 1 failed
+	test_unsolicited_na_combination 0 2 1 failed 0
 }
 
 ###############################################################################
-- 
2.43.0


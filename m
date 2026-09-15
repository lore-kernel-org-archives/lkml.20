Received: from mail-oo2-f16.google.com (mail-oo2-f16.google.com [74.125.231.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D779C435508
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448503; cv=none; b=jtyQcyA0EBlDkSsosJP9bISM+qq8tgWka7KVPsGLMLJxZMx5Myby9JseZAVSQZZvPMFRTO8VoEuw0mUHJf9TNrSkL88QDyo64XyN4FnkX8t/4uiKzWp2gkX3hh1TNyzaO/goVSavoxIA+7Bgpot9NZrsprelIMsJg4mhsrcZ03s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448503; c=relaxed/simple;
	bh=uCtUnL+DK0+Vcijpb0NbemyGhnyykjJ0ZTtE8mcmaSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2cXlNILbbfbojiM51qfjNhm87ATzMp/Oeye6BJe+yUY1pS6T8HT5o4LjUNMrm3ZvJweWufldtqMSLejgYkA0+LFp7JBzvVVmW0sT9qznkutzVdJhShrXlVPRDwhU9AYYqdm+PXVr3OjWjlTWM3s0sVTsJK2kJ3JOIxTJ80s7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC0I0wzN; arc=none smtp.client-ip=74.125.231.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC0I0wzN"
Received: by mail-oo2-f16.google.com with SMTP id 46e09a7af769-805bf8c2661so1885719a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789448499; x=1790053299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8F3JwitOM+HzKjUaxufpWmqRA5xpMbmjQIDcQNq5os=;
        b=mC0I0wzNejhewKPZ15ldKEsGHp6Rif7O3zEzRelpr+NJoIFF3OqAOw85MMzXtXOKc7
         tivgimdw7rEuVvUSQOduChnJrw4BD/RW+KA+fJ0Nslz5oeBwg/E0jlreE+IGi1Q7JM3l
         /v6GysBSLqGl6GkQU1kbmpVrUFh9otDCy/cDuws+mrA5IghF4/k2M4jFkmGGQ8sFl/9/
         /N3nlwq3NWEBBJOfVIebE/1luBv4f7ElNNTuWxsWg37SGwbpHaY76AEPPZureKjJvuGU
         pWMz7PB8uAOhXEqRHjqtd9m3kdH5QYMLfakY87BF/oHb2oHQNlg80tJpe0QBFfup+a/D
         ngoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789448499; x=1790053299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8F3JwitOM+HzKjUaxufpWmqRA5xpMbmjQIDcQNq5os=;
        b=cCne2XZhXtEDCJjFWmA8SRhutZ+8L9KsQwAcihUrB1HyNugjYAAlxpSBKsIdnJrjhA
         tqf8HJA3h61W48LVuI1wmTxsDr9OpEKwRPYaKvp1vGWeKhu7caov9BB3N9at05PMPLwT
         +nc+1j9Klc4NLulUEICPySx94N/c4QgBQoKlBma7H+v8sVlEt6jmXKXgC7a5hA4XBkK+
         5YLNAClCrcdyJrCjDH4MRJajRJ/HRv9UjI57weGbuUwzV05JhTX1nCb7Qe1hLt8Mvcsm
         xeBdqrIXNx7SGaB0OUzt1esItOEYSSvLfOczg8rkHbqIWxmR5zAbMWrRWjXJd0WfuHUn
         na3w==
X-Forwarded-Encrypted: i=1; AKwUvBx+51lOve3hCAW0DIS3t5W4JBgALwE+kvM6TIjrDePufqKANtPBSqcGIk0EoCs+eVXADE+1OQoX9Jx6bHw=@vger.kernel.org
X-Gm-Message-State: AFuF++li/2Lusp8gD/pedE9ep0f7pz0MjmOibrqnfQY9q/jxJCfdAbOO
	8vsSLs3TK3y9OTO0WJfNjVeCJ/MBh6BaRXbzf0J039XKV+pp7LUycD5C
X-Gm-Gg: AYBFou2/EH+WoalC5Jxv6eOVrIRplG7ZOsX7xxQwiCqVTULvuegJGsAEGSAEeoUIJA1
	/lMUH6ekXBPH46AeQVaOaSCNRrWEK1iJO+2zycbiVkiIj0MOFx/0HZuWvB4qbezFNvNWfXaAjS3
	1iITSz9zmCXfrBehYiAlCxgByXW4tnCOnzXTiUt4EQ6tTo2pu7v38rQ15tWkqH3HLVCcQMdlkv0
	KArs3kFBn5uf6qECz5xYFztwZA57vRJ1Qg7qAnqmnafo878FpQUj4iaBoGgPoacXfYtcM/k0maP
	JNWpdUhRuaI8I0/dDd4a1/K+gLP1I4RQi4ngTrsS0Ff5oAu1vkrk1VJlneVbgex94TEMPBAk3xk
	qoWAyRvMk1zHBMwmxc5B10fiFcwXn0zUrKY2F5pe432Sp1sECj36f88W2qcgV/KSTzyl0q47JMK
	NHi8WvAepIfkATJ15gzyX8HJhL7xPZoWdtF4gAfeL/Khyzcxr3wYKzTJmT/ILYl4ItxVNl4Xq9L
	1ppyypRQDOfxfchm6v8dVfWpLKv9pzi8T7ZLLyA+J0b+Ejtab/dTHqVTiWMBepIQaeIG6RQwL+N
	vSrLXl4H982A2JHg/U7J
X-Received: by 2002:a05:6830:6405:b0:805:5e7e:9bf6 with SMTP id 46e09a7af769-80899f62264mr4009489a34.21.1789448498623;
        Mon, 14 Sep 2026 22:01:38 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e51449sm26872358eec.5.2026.09.14.22.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:01:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	linux-wpan@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH net-next v2 2/2] selftests: net: test untracked NA recovery of FAILED neighbors
Date: Tue, 15 Sep 2026 05:01:32 +0000
Message-ID: <3f33052571409614b953a3dc7778114c51c43669.1789448374.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789448374.git.lfqlee314@gmail.com>
References: <cover.1789448374.git.lfqlee314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Seed a FAILED neighbor before triggering an unsolicited NA. Verify that
the entry transitions to STALE only when drop_unsolicited_na is disabled,
accept_untracked_na mode 1 or in-prefix mode 2 is enabled, and IPv6
forwarding is enabled. Verify that disabling each gate or using an
out-of-prefix source with mode 2 keeps the entry in FAILED.

Mark the seed externally learned and disable carrier-based eviction so
the entry cannot be garbage-collected before the NA arrives. Require the
marker after processing to prove that a recovered entry was updated in
place instead of deleted and recreated.

Check both the command that seeds the entry and its resulting state.
Capture the verifier status before constructing the test description so
the array assignment cannot mask a failure.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
Assisted-by: LLM Sashiko sparse
Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
---
 .../net/ndisc_unsolicited_na_test.sh          | 124 +++++++++++++++---
 1 file changed, 105 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
index 5db69dad0cfc..5f4f29f0ac4a 100755
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
@@ -20,7 +26,9 @@ HOST_INTF="veth-host"
 ROUTER_INTF="veth-router"
 
 ROUTER_ADDR="2000:20::1"
-HOST_ADDR="2000:20::2"
+HOST_ADDR_IN_NETWORK="2000:20::2"
+HOST_ADDR_OUT_OF_NETWORK="2000:21::2"
+HOST_ADDR="${HOST_ADDR_IN_NETWORK}"
 SUBNET_WIDTH=64
 ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
 HOST_ADDR_WITH_MASK="${HOST_ADDR}/${SUBNET_WIDTH}"
@@ -88,6 +96,8 @@ setup()
                 ${ROUTER_CONF}.drop_unsolicited_na=${drop_unsolicited_na}
 	${IP_ROUTER_EXEC} sysctl -qw \
                 ${ROUTER_CONF}.accept_untracked_na=${accept_untracked_na}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.ndisc_evict_nocarrier=0
 	${IP_ROUTER_EXEC} sysctl -qw ${ROUTER_CONF}.disable_ipv6=0
 	${IP_ROUTER} addr add ${ROUTER_ADDR_WITH_MASK} dev ${ROUTER_INTF}
 
@@ -140,24 +150,77 @@ verify_ndisc() {
 	local drop_unsolicited_na=$1
 	local accept_untracked_na=$2
 	local forwarding=$3
+	local initial_state=${4:-absent}
+	local same_subnet=${5:-1}
+	local neigh_show_output
+	local expected_state
+
+	if [ "${drop_unsolicited_na}" -eq 0 ] &&
+			[ "${forwarding}" -eq 1 ]; then
+		case "${accept_untracked_na}" in
+		1)
+			expected_state=STALE
+			;;
+		2)
+			[ "${same_subnet}" -eq 1 ] && expected_state=STALE
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
+		HOST_ADDR="${HOST_ADDR_IN_NETWORK}"
+	else
+		HOST_ADDR="${HOST_ADDR_OUT_OF_NETWORK}"
+	fi
+	HOST_ADDR_WITH_MASK="${HOST_ADDR}/${SUBNET_WIDTH}"
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
 
 	# Bring the link up, wait for the NA,
 	# and add a delay to ensure neighbour processing is done.
@@ -165,22 +228,35 @@ test_unsolicited_na_common()
 	start_tcpdump
 
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
@@ -193,6 +269,16 @@ test_unsolicited_na_combinations() {
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

Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA4E49504B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353512; cv=none; b=mjFuKjh993zjSiGA0ke2ZaIAuG486ezyQt7nWz4PYY7kT3Iv6Zv9Cr7EXyVGnfdM/fmP58A8mKhUeFV3Te1j3RISUTtWZZ7ozj/LZLX0GigRysFS/3a92J1wp+89kMJXae4LaAxhpwSNWBSx8h6HDoyvJ7y6fLcru5azJZjVPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353512; c=relaxed/simple;
	bh=JrVZzaOjzkk1Ad0PCSE0iD8QmmhukK+hLBSDeJ5wQJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twGDb5KX9V1ScrTy78sM9t2uYYhk2VBlFGiZUA0zyFftpnChfDyo19k5mHnnUwkppKdo2kOl9jk+U6I7iXNPdcuBDWjXJZqQqjtKDIue4SyoT65WAS11POEUxku1nnkBDJSAFLIZK4NHx7txPXKdg3logPizkZBMwV2w3VUxbbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3QKUvCm; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3QKUvCm"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e99ef0902so92855085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353509; x=1788958309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSgkh12jreNqdRPNmW7GMoYPtekTsq4akXMRi07QCoM=;
        b=T3QKUvCmvGfmXrMpnvcDfc39RfpWu2lu5esYn8iG76qRDkkJ2krEI+QpDwbYXcoFQn
         ZtDEeGpp6VNOswB4FG7x+QUEvdr6hMU5SOAWQfO1yvstoEvFNSEvdTowHvwGFEg9H1iN
         +bzgYAnK6HsbRMbvEuKkQOevP9rvw1i/vnywh2Ut41ua+LxvGULMgqMxACgk21VZIn8E
         RvIAV5PEcRtgx4Bag9yjBaEhzew04sGcGjJDw+8Zehx141rLCKAtuou5+wkJVTgWD+VE
         qs43X92njJv4ZUA4cmqtGkbCpuGRq6MUmWbHsz/5scHyYj/Tku1zNJcmt3YShS2HT2RW
         Wozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353509; x=1788958309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSgkh12jreNqdRPNmW7GMoYPtekTsq4akXMRi07QCoM=;
        b=dkk8UckU3lRBA8ss38Cm8H/8Yu6X5lvU85mz3XFaj5kJ9MIn3iJyE7PARj3z7u4qwl
         wXlpzFevT/1Y8hMQvtEuAlYcRaALpqmi7OBJLXPUVK9XpUASjaUy4x3g8pcGiIwB1a2A
         EHQDMpxPrnrU/7TUt5F0IqH4QEgCGybfhDbG5rpTfLgsF3AUfuZFyIfuUUDfWF48kYsd
         nWPVIxNtntIqHx0BsiA7HyKhSmNgWraun9dvteXISPNNyFS4pQbgGKfx1CBx/8jaFneI
         NsCYiySOT+XZ7aco8JuErUblP52Z+RFaBaMF12WzNqPAggcPPtpWo8bLROFcMhKBJns3
         WZGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0PTOTu+I1Zpus3mG0ufUXf4lG0pFyUPYdDrONh9VISttG3OUFWgmv4jaqD4ApLay6lB2JzP8UcxZZSMY=@vger.kernel.org
X-Gm-Message-State: AFuF++nFgTiUf14d593qNVearZnIWWr1wEsOk08pStngZqDjMhQ7TujH
	BUt+Sti8djHZmI56IEzGOCCGYqIASnhSeflXjDUjYcfAOVTNtGCi9kEE
X-Gm-Gg: AR+sD11WeJvj0jNkl2uHsw6GJpAdR+iHHfBvyauyZUm27SE/h8Js0UTSOU2rw2l0N8g
	vxH+cOLJ7fIokxMgq9XvL96Lrxm8KMO+nui4FTz/VkDE1AU7njQZ3VLx+aPEElR4fyserXtjPMp
	DrTexm1P7oIuNiBuPKL+kAQ7fDOa6FFpNjIyL80/3g1ZOtI4NZNrdoux8QOPhXoCrGqweazLQs5
	q2FibNN5PFRXZxiZ5onkG830u0LE/YzgjsLHULZhQrO16/I4wF1FSxvI9+icPS+zwtqFoWjxixZ
	f/pG5D7rXrQ0ByJMd9y2ND3/3wGCrwUawMoylJIGQ3eQMcJBZn/fv3rzTbjiMSvA2Y6S8N61xj8
	QCS46lS1pkLmjqJxYddHfkLegF/OlsB3vtd6VHgzhPkXq2aVMUoFwSO+h6Vp1ZdTdPOHmIGg/3i
	iHSRHFnNP8hx+8g3QJx4F2mM3qPsIaNVHnFJIr5O8qCfhtoSqj4g71Zw==
X-Received: by 2002:a05:620a:8d8b:b0:92e:cf8e:67b9 with SMTP id af79cd13be357-93960f30aeamr323864085a.21.1788353508567;
        Wed, 02 Sep 2026 05:51:48 -0700 (PDT)
Received: from houminxi ([61.170.217.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f35d823sm198612785a.25.2026.09.02.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:51:48 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@google.com,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net-next v2 1/2] selftests/net/openvswitch: add SCTP flow key test over IPv6
Date: Wed,  2 Sep 2026 08:51:32 -0400
Message-ID: <20260902125133.1828572-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902125133.1828572-1-houminxi@gmail.com>
References: <20260902125133.1828572-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The merged SCTP test covers only IPv4. The IPv6 extraction path
(parse_ipv6hdr walking extension headers, then the proto=132 branch in
key_extract) and the v6 side of the SCTP netlink validation have no
selftest coverage at all, so a regression there would ship silently.

Add test_sctp_connect_v6 mirroring the v4 test: NS/NA forwarding flows
stand in for ARP, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
flows gate the association in the same three phases (flows installed,
flows removed, flows reinstalled). After the association succeeds the
test also pushes a known payload across and verifies the listener
received it, so a flow-key bug that matches handshake packets but
breaks DATA chunks is caught too. Skips when the sctp module is
missing, socat lacks SCTP support, or IPv6 is unavailable; an
association or DATA failure with the flows installed fails the test.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
v2: rebased onto current net-next, no code changes
 .../selftests/net/openvswitch/openvswitch.sh  | 97 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index a31f7fb6882dc..06bd98d80a084 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -33,7 +33,8 @@ tests="
 	action_set				set: SET action rewrites fields
 	trunc					trunc: output truncation
 	icmpv6					icmpv6: ICMPv6 echo type match
-	sctp_connect_v4				sctp: SCTP flow key matching
+	sctp_connect_v4			sctp: SCTP flow key matching
+	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6
 	psample					psample: Sampling packets with psample"
 
 info() {
@@ -700,6 +701,100 @@ test_sctp_connect_v4() {
 	return 0
 }
 
+# sctp_connect_v6 test
+# - sctp(dst=4443) matches client-to-server INIT
+# - sctp(src=4443) matches server-to-client INIT-ACK
+# - icmpv6 NS/NA flows forward neighbour discovery
+# - remove flows and verify connection fails, reinstall and recover
+test_sctp_connect_v6() {
+	local t="test_sctp_connect_v6"
+	local v6="eth_type(0x86dd),ipv6(proto=132)"
+	local payload="SCTP6_DATA_OK"
+	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
+
+	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
+	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
+	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" sctp6 || return 1
+
+	info "create namespaces"
+	for ns in client server; do
+		ovs_add_netns_and_veths "$t" "sctp6" "$ns" \
+		    "${ns:0:1}0" "${ns:0:1}1" || return 1
+	done
+
+	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
+	ip netns exec client ip link set c1 up
+	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
+	ip netns exec server ip link set s1 up
+
+	# NS/NA forwarding
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '1' || return 1
+
+	# SCTP port matching: dst for request, src for reply
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(2),eth(),$v6,sctp(src=4443)" \
+	    '1' || return 1
+
+	ovs_netns_spawn_daemon "$t" "server" \
+	    socat -u -t 1 SCTP6-LISTEN:4443,fork \
+	    OPEN:"$rxfile",creat,append
+	ovs_wait sctp_eps_has server 4443 || return 1
+
+	info "verify SCTP association with port-keyed flows"
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    || return 1
+
+	info "verify SCTP DATA chunk crosses the datapath"
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" \
+	    <<< "$payload" || return 1
+	grep -q "$payload" "$rxfile" 2>/dev/null \
+	    || { info "server did not receive SCTP DATA payload"
+	         return 1; }
+
+	ovs_del_flows "$t" sctp6
+
+	info "verify connection fails without flows"
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
+	    '1' || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    >/dev/null 2>&1 \
+	    && { info "connection should fail without flows"
+	         return 1; }
+
+	info "reinstall flows and verify recovery"
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
+	    '2' || return 1
+	ovs_add_flow "$t" sctp6 \
+	    "in_port(2),eth(),$v6,sctp(src=4443)" \
+	    '1' || return 1
+
+	ovs_sbx "$t" ip netns exec client \
+	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
+	    || return 1
+
+	return 0
+}
+
 # psample test
 # - use psample to observe packets
 test_psample() {

base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
-- 
2.55.0


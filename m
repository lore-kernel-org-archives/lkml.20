Received: from mail-ej2-f21.google.com (mail-ej2-f21.google.com [74.125.228.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E706223708
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134187; cv=none; b=pocbPw/Q4KifSbBlXICOh5a3r08GiqZDpOQKuydWNMJFJ1RXSBOYv9km/XdoQYvk490UkSm2V1XG2G02PLFmQUv2IgRO+iJ+SAdX2nAiFi67MjMSN0Ij6rm2wjKfjMvZm+WBeii8xbiNHAOgDY7kFSntzgmU1YfINR+c1RqHST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134187; c=relaxed/simple;
	bh=S806Z0hpfXTXnNB+NFCPkJEG1mGTEr4a/1c81/36Cfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxD7gTwV0u9B7gKrnFyUJ2nTmqeXnGFAJLMFFLH+rku/30k8n1WyLS2VIc8LWHxF8Lo2I+bnjJ7Z8jYSpowIaROa7YPZX6+JZWz9/LSZ5p34gOHaNGZ5NLH7nqJuIpPA0dffQ1HT7sTKQJmnManIxCLpd401PGHk7mOxPASeFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=aK/CG+Mh; arc=none smtp.client-ip=74.125.228.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="aK/CG+Mh"
Received: by mail-ej2-f21.google.com with SMTP id a640c23a62f3a-c2a1f611461so77680066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134183; x=1791738983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z21Sm0vXyjYwz54boCuRf17DcAnvOs66BHPm2naaN0E=;
        b=aK/CG+MhHaFWHYi85wq2FUZpBY9c0iUdWZO9qj7XymE5yug2YSsjRm8A5r0sLNHE+A
         KMdg9vlM4qJoOW44GPdwBEXaB7qn4rBQtMqQbvgBTUucs/iI2ochx6YjqZ3S0fK35E+X
         /hpuE3UoBR9SdX7np1soJzgunHug4Hxskyql3yPvttx2L1veHeAfBf0FrWBl2SCwQjkE
         dq/gTzamV3GYH4Amv1diO2bqrWtY9uJp8RL8+IKXgjfVgejcYH6IGIxhuLCP3UI8DyJE
         4vMN4EggZBRsy+C3p4hWcFdvJiuWSA4W9v7ukNRVl0THHRBIhpOpXoL+z9tUDBDMgXBE
         YsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134183; x=1791738983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z21Sm0vXyjYwz54boCuRf17DcAnvOs66BHPm2naaN0E=;
        b=RYGw0iWgEShsY6onSK13yBfnzA2M3joZAGsJmhiA/OhYehc8hOoY68IW2orliMnfm1
         jij34egdUlFMVmlGVuE23WkiC7nbtp5ImuwVBUPkqLNPQ2MFxdlVRT6MzbfsUJB/FYlW
         ZrkElxwz5p/PFKhd4H1LKsL8w7pDqeD76FzVE3zHm4bICfwtFoq8MNKHuruw61r2KmlI
         u/xdaRyGu77g+3gaQ2IN1xT9fsDTTddNWAA8Hr4Otsk+qBBVa+kvhbUI9sZ9VgsCrrsG
         h8t7PvTtULHydanK3N7XSJ8zVka8NdBKwtTBfrUgamuCSoxDsF67JI4zHwjjX4T4xWsC
         IYBg==
X-Forwarded-Encrypted: i=1; AKwUvBz9Tlnql3Vey5oNwNlmjeE0Xzxy0jHe4rAe2HJYaQV+1lcvfoTaq2Kp6Vt0W+sA77ado1qZftRO1Ka6Hq0=@vger.kernel.org
X-Gm-Message-State: AFuF++mStvjDoR9GYnsrP/g2LjIjZvLppmxbSEkQT/OCYcacfvcsa067
	MmoK/SUY2DAYKbMqdxSJIqD/PBvRgzlR4PithJDjIv9+TDYyJvurzbMzc7zMk6lu6Q==
X-Gm-Gg: AYBFou08y+lTAF+HRd3OhQTBdub8gqNmzOBl8PPrOxkKEDzr+/WcJDi61AtV8vcA/TJ
	6eOTAjV4XFJqRcGEkpQ6tjqCr5tDyQyJtRYv8oi9d+Qj2AZ0ui4OBnJsFa0PsYBGSczJPt6wDUu
	l7Wrs77gzlpmg7pzsK5jj9Fej2XGc4wrQZJ0mfIRZwew0wfYwzI4lq2QobJqEsmrzZGU3TRYJ9M
	wXr7GkFIXc13LRwP1VL/bwMNXRqO3JljLersjjulzc6FgfHvz141Ga3+VTZoN7234JP/aCtR255
	d+fZ7RaO0MGT/lkWroyF1FhHF2DsEctewsOYhsULSTj/xqR47052hf7nI7pILoAVa+Q4JtLCnrG
	g/rRv155z/65/mX0+0MkhUiUaRwJ2KTxt+gIveTjKnGtzUvvmgzVf6Xw6BjdOT56N1TsmR4pqPh
	84bjOd5CVE5KDcyd8tHIC7L6F4X1Tmr9f+XaTVnKc+eY0p8nLgAOBQZKroG266CZqP2dnvMoRab
	OUnaPIXhOQ2nFkyS0SM81rP5gx6qlfuHWAXpn/yK89s1KeLIJvYHKWzUxwiDILRBDFsppMFrUU9
	GhJXAFtwqLRtQjJk0pJ2QlpR+mDSq9ITs7YgbnzJK5iB9QCNTADyvskFsM+u66MZ+kuUMYm9E87
	vOGYh4kZH3bfjAa1IcBPiS/qwS7T3ZbRNRiekR0KW9yF7v2GS/u2GEwfWZBP/HU5riLEqnAwB+Z
	4GKX1GoNKty4DMPIrvfX6OXDib+i1kXIqbhg==
X-Received: by 2002:a17:906:dc90:b0:c2d:d4dd:8b5 with SMTP id a640c23a62f3a-c2e4ad60fdamr781095366b.19.1791134183248;
        Sun, 04 Oct 2026 10:16:23 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd278cesm314885266b.37.2026.10.04.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:22 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@nbd.name
Subject: [PATCH nf-next 3/3] selftests: netfilter: nft_flowtable.sh: check upper device counters
Date: Sun,  4 Oct 2026 19:16:16 +0200
Message-ID: <20261004171616.3544880-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171616.3544880-1-julius@bairaktaris.de>
References: <20261004171616.3544880-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bridge and tunnel tests forward through devices above the flowtable
device: br0, the tunnels, and the VLAN devices under them. Each test
sends the file in both directions, twice for IPv4 (masquerade and dnat)
and once for IPv6, so check that these devices count between n and n + 1
times the file size on rx and on tx.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../selftests/net/netfilter/nft_flowtable.sh  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable.sh b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
index 449c518bd947..e89f86916f4e 100755
--- a/tools/testing/selftests/net/netfilter/nft_flowtable.sh
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable.sh
@@ -272,6 +272,43 @@ check_counters()
 	fi
 }
 
+dev_bytes()
+{
+	local ns=$1
+	local dev=$2
+
+	ip -net "$ns" -s link show dev "$dev" | \
+		awk '/RX:/ { getline; rx = $1 } /TX:/ { getline; tx = $1 } END { print rx, tx }'
+}
+
+# Fails if the fast path does not update the device counters.
+check_dev_bytes()
+{
+	local what=$1
+	local ns=$2
+	local dev=$3
+	local rx0=$4
+	local tx0=$5
+	local n=${6:-2}
+	local min=$((filesize * n))
+	local max=$((filesize * (n + 1)))
+	local rx tx
+
+	read -r rx tx < <(dev_bytes "$ns" "$dev")
+	rx=$((rx - rx0))
+	tx=$((tx - tx0))
+
+	if [ "$rx" -lt "$min" ] || [ "$tx" -lt "$min" ] ||
+	   [ "$rx" -gt "$max" ] || [ "$tx" -gt "$max" ]; then
+		echo "FAIL: $what: $dev counted rx $rx tx $tx bytes," \
+		     "expected $min to $max" 1>&2
+		ret=1
+		return
+	fi
+
+	echo "PASS: $what"
+}
+
 check_dscp()
 {
 	local what=$1
@@ -626,12 +663,18 @@ ip netns exec "$nsr1" nft -a insert rule inet filter forward 'meta oif tun6 acce
 ip netns exec "$nsr1" nft -a insert rule inet filter forward \
 	'meta oif "veth0" tcp sport 12345 ct mark set 1 flow add @f1 counter name routed_repl accept'
 
+read -r tun_rx tun_tx < <(dev_bytes "$nsr1" tun0)
+
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IPIP tunnel"; then
 	echo "FAIL: flow offload for ns1/ns2 with IPIP tunnel" 1>&2
 	ip netns exec "$nsr1" nft list ruleset
 	ret=1
 fi
 
+check_dev_bytes "IPIP tunnel counters" "$nsr1" tun0 "$tun_rx" "$tun_tx"
+
+read -r tun_rx tun_tx < <(dev_bytes "$nsr1" tun6)
+
 if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
 	check_counters "flow offload for ns1/ns2 IP6IP6 tunnel"
 else
@@ -640,6 +683,8 @@ else
 	ret=1
 fi
 
+check_dev_bytes "IP6IP6 tunnel counters" "$nsr1" tun6 "$tun_rx" "$tun_tx" 1
+
 # Create vlan tagged devices for IPIP traffic.
 ip -net "$nsr1" link add link veth1 name veth1.10 type vlan id 10
 ip -net "$nsr1" link set veth1.10 up
@@ -686,12 +731,21 @@ ip -net "$nsr2" addr add fee1:5::2/64 dev tun6.10 nodad
 ip -6 -net "$nsr2" route delete default
 ip -6 -net "$nsr2" route add default via fee1:5::1
 
+read -r tun_rx tun_tx < <(dev_bytes "$nsr1" tun0.10)
+read -r vlan_rx vlan_tx < <(dev_bytes "$nsr1" veth1.10)
+
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "IPIP tunnel over vlan"; then
 	echo "FAIL: flow offload for ns1/ns2 with IPIP tunnel over vlan" 1>&2
 	ip netns exec "$nsr1" nft list ruleset
 	ret=1
 fi
 
+check_dev_bytes "IPIP tunnel counters over VLAN" "$nsr1" tun0.10 "$tun_rx" "$tun_tx"
+check_dev_bytes "VLAN counters under IPIP tunnel" "$nsr1" veth1.10 "$vlan_rx" "$vlan_tx"
+
+read -r tun_rx tun_tx < <(dev_bytes "$nsr1" tun6.10)
+read -r vlan_rx vlan_tx < <(dev_bytes "$nsr1" veth1.10)
+
 if test_tcp_forwarding "$ns1" "$ns2" 1 6 "[dead:2::99]" 12345; then
 	check_counters "flow offload for ns1/ns2 IP6IP6 tunnel over vlan"
 else
@@ -700,6 +754,9 @@ else
 	ret=1
 fi
 
+check_dev_bytes "IP6IP6 tunnel counters over VLAN" "$nsr1" tun6.10 "$tun_rx" "$tun_tx" 1
+check_dev_bytes "VLAN counters under IP6IP6 tunnel" "$nsr1" veth1.10 "$vlan_rx" "$vlan_tx" 1
+
 # Restore the previous configuration
 ip -net "$nsr1" route change default via 192.168.10.2
 ip -net "$nsr2" route change default via 192.168.10.1
@@ -740,12 +797,16 @@ table ip nat {
 }
 EOF
 
+read -r br_rx br_tx < <(dev_bytes "$nsr1" br0)
+
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "on bridge"; then
 	echo "FAIL: flow offload for ns1/ns2 with bridge NAT" 1>&2
 	ip netns exec "$nsr1" nft list ruleset
 	ret=1
 fi
 
+check_dev_bytes "bridge counters" "$nsr1" br0 "$br_rx" "$br_tx"
+
 if ip -net "$nsr1" link show tun0 > /dev/null 2>&1 &&
    ip -net "$nsr2" link show tun0 > /dev/null 2>&1; then
 	ip -net "$nsr1" route change default via 192.168.100.2
@@ -819,12 +880,18 @@ ip -net "$ns1" addr add 10.0.1.99/24 dev eth0.10
 ip -net "$ns1" route add default via 10.0.1.1
 ip -net "$ns1" addr add dead:1::99/64 dev eth0.10 nodad
 
+read -r br_rx br_tx < <(dev_bytes "$nsr1" br0)
+read -r vlan_rx vlan_tx < <(dev_bytes "$nsr1" veth0.10)
+
 if ! test_tcp_forwarding_nat "$ns1" "$ns2" 1 "bridge and VLAN"; then
 	echo "FAIL: flow offload for ns1/ns2 with bridge NAT and VLAN" 1>&2
 	ip netns exec "$nsr1" nft list ruleset
 	ret=1
 fi
 
+check_dev_bytes "bridge counters with VLAN" "$nsr1" br0 "$br_rx" "$br_tx"
+check_dev_bytes "VLAN counters under bridge" "$nsr1" veth0.10 "$vlan_rx" "$vlan_tx"
+
 # restore test topology (remove bridge and VLAN)
 ip -net "$nsr1" link set veth0 nomaster
 ip -net "$nsr1" link set veth0 down
-- 
2.53.0


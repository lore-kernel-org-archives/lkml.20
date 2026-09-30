Received: from mail-ej2-f24.google.com (mail-ej2-f24.google.com [74.125.228.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B774E06D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781812; cv=none; b=CEmJqauoHiwPpmEogw+ll4DwyDLw8arqP03rBY+C1/1lojMqBoiLMoX+JcTa7hOMT2+i+ko9Bt31wYOd0CX+bnGNxuYF9Lvo3CPo850iekRJVtbdv1c90BkWK5DBBOKiNdSWQJUG9X6XQoQZoYKDkIcftPItd96HGzuDVAZooOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781812; c=relaxed/simple;
	bh=b9y4NXkgYg8B4pqDswquuydxBE3Tjnq/EUwfuU2Enwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9OeZKN+VsLyTpZX9/aQGnKE1wuQ9J1ZXkQvIc0MrmgTTgJY9Gf/Y8o0LoXPwJ7K2k6diGf+EOTHjQhh80BbmUELteBYlrJ+LfzgKFw31fwijkSOoQ9332uSBR7GX+d+OjrPx3Xy2XnKxk5QnjwzENegibA711SuB/kfxA/ycv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=TGT+Thhp; arc=none smtp.client-ip=74.125.228.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="TGT+Thhp"
Received: by mail-ej2-f24.google.com with SMTP id a640c23a62f3a-c2b40e4744eso597606966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790781797; x=1791386597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKz38TwNtR/kCvzhvPBXJpWiMyE9q1ag9Gm3OPI54Dw=;
        b=TGT+Thhpg0Ome/58A2npn/9DZHfV2RSvXLQdydNKZwVHgXJFKU4sxgIwaegEwh/RSK
         44jrC0I6HQcO10IRe1BhsuNFYaxsP+Lu5P4VFYn9Whp1P0f80fmmjyFRm/H05FbxmyLO
         +T62Cp4TlM/AxwFk1hnQuG06ptzNVnLHt2HvbqLfv+6P76fVZqk73SXfnfeRICUFjw6J
         P+n/1VI2ZHUl7P8jPVqiALdJzG4abHjkOsXVCS0lDRJ1gny86iZ+P4sczwu7EyxtEpLk
         3y/FMgjCf7U+NOYWyngLfLIs+MXf6Kl5NwbLiyk7AL1DyX/z+jxUNDJpkBuHz3NHNmi0
         +mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781797; x=1791386597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKz38TwNtR/kCvzhvPBXJpWiMyE9q1ag9Gm3OPI54Dw=;
        b=z3cdLOD+IYiHJ8yX0wCWjhTTkA2Iw+pdmP3gDee+bNItnJTMwtpP2e9mqZkobxnwf9
         mfEFldbrF7Sea0KfTXwpM3Kn8+0cGv80e7x6DVqYM0j4WacusdaLL8Jcj/f96Dufzdfg
         SD95EP6UNr6BNwRzNzyY6tRbC2bPdyAunz1GAC/8UUCmMubYrq+clttMgPyk/CTKhLvS
         DcWYqVIhid/U8GNuOcncZ0tdk222e07ot8ZVG6gtOAQIvcKvrFZK5KL8k5s9uZM138EM
         nUCRXSNuQOKthoEa42JHQl8vMNJYpi9UOkZF3oRI8yovPgoT75K8t3FI3tvUpN358Wcd
         G2Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzz5yKNhlNpT6UrozJbJ6wqhXbnfOkcMaMxLJ3DpwXtHb3ndNodH/sflGer9wKe1VR+P1TMYmxMYzttTuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAbyqOa84laP1HNXhk/WQ+UftzFtJDhloNY1ShLeDuSX8U2k3t
	tFf/9Bu2HCUnZcnfLJA6GaNayHgnbMIPQDU84MP5nIwabunrfRd2u0ttjdL5HQGO9Q==
X-Gm-Gg: AYBFou3E1CUUgU1ZHQBb6FzvdcemTT78g32UFx98KasxtojXr57iFNQd+Ofm+yxxa1n
	P4/O7mrSwkgYC+nX9jrcgpwlPEL+pFQGaseHMoTJoJVtP6Z7g2AITJMQQcPm60Zml1LrkRZggZR
	yjj5VKOxmZQRtRLVwTmG1iN4g8SPKHz1fcr0Ja+MdtubkfUOPJr7eaiBVe8bnMMCfcIiL7Kzid8
	UEe7UKTKxWlnaUFE2rq9hsYosXmMp5A3luIcReaSnIXXXXzKx5irpN0qkPY1rY16f9+TMwnSwRX
	0nFdpXajH4tWgDf3zWeHADgjGcxqGrzPTIovMqnFbTbJxK6IkUWg7LdtDvkaOeVg/z9Npgp2DG+
	QCBMLmz9T/yzVEOR8aUsRIDHEwYAm/RDtHDkVsL8Z6En4Lyflisw+RNd1RfsEqZ3n8blgN/6jV/
	bryOXsVdl/TJ7sBoWBkPTNJuXgzv5Rs9ryj7Hn33D6f7Nytmpwkna/GM6nv9yc/En/zcLPz/nOQ
	C+hO3wjJxpkjfyuQORrlA==
X-Received: by 2002:a17:906:478d:b0:c29:f0a4:a4f8 with SMTP id a640c23a62f3a-c2e233cd0bbmr149280466b.0.1790781797242;
        Wed, 30 Sep 2026 08:23:17 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce6499sm23874966b.33.2026.09.30.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:23:16 -0700 (PDT)
From: hengyul@cs.unc.edu
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Jiayuan Chen <jiayuan.chen@shopee.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hengyu Liang <hengyul@cs.unc.edu>
Subject: [PATCH net 2/2] selftests: net: fib_tests: add tests for IPv6 routes via loopback device
Date: Wed, 30 Sep 2026 11:22:29 -0400
Message-ID: <20260930152229.1453929-3-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930152229.1453929-1-hengyul@cs.unc.edu>
References: <20260930152229.1453929-1-hengyul@cs.unc.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hengyu Liang <hengyul@cs.unc.edu>

Check that an IPv6 route via the loopback device can be added when the
loopback device is down, when a gateway is specified, including an
IPv4-mapped one, and when IPv6 is disabled on the loopback device. Such
routes are promoted to reject routes, so their nexthop is not validated.

Without the previous patch:

  # ./fib_tests.sh -t ipv6_route_lo

  IPv6 routes via loopback device tests
      TEST: Route via loopback device that is down              [FAIL]
      TEST: Route via loopback device with gateway              [FAIL]
      TEST: Route via loopback device with IPv4-mapped gateway  [FAIL]
      TEST: Route via loopback device with IPv6 disabled        [FAIL]

  Tests passed:   0
  Tests failed:   4

With the previous patch:

  # ./fib_tests.sh -t ipv6_route_lo

  IPv6 routes via loopback device tests
      TEST: Route via loopback device that is down              [ OK ]
      TEST: Route via loopback device with gateway              [ OK ]
      TEST: Route via loopback device with IPv4-mapped gateway  [ OK ]
      TEST: Route via loopback device with IPv6 disabled        [ OK ]

  Tests passed:   4
  Tests failed:   0

Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 tools/testing/selftests/net/fib_tests.sh | 31 +++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index b338bfb196a2..19e55a8630a2 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -14,7 +14,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
        ipv4_mpath_balance_preferred ipv4_mpath_oif ipv4_mpath_oif_nh \
        ipv4_mpath_oif_vrf ipv6_mpath_oif ipv6_mpath_oif_nh ipv6_mpath_oif_vrf \
-       fib6_ra_to_static fib6_temp_addr_renewal"
+       fib6_ra_to_static fib6_temp_addr_renewal ipv6_route_lo"
 
 VERBOSE=0
 PAUSE_ON_FAIL=no
@@ -2466,6 +2466,34 @@ ipv4_route_v6_gw_test()
 	route_cleanup
 }
 
+ipv6_route_lo_test()
+{
+	echo
+	echo "IPv6 routes via loopback device tests"
+
+	setup_ns ns1
+	IP="$(which ip) -netns $ns1"
+
+	# Routes via the loopback device are promoted to reject routes, so
+	# their nexthop is not validated.
+	run_cmd "$IP link set dev lo down"
+	run_cmd "$IP -6 ro add 2001:db8:101::/64 dev lo"
+	log_test $? 0 "Route via loopback device that is down"
+
+	run_cmd "$IP link set dev lo up"
+	run_cmd "$IP -6 ro add 2001:db8:102::/64 via 2001:db8:1::2 dev lo"
+	log_test $? 0 "Route via loopback device with gateway"
+
+	run_cmd "$IP -6 ro add 2001:db8:103::/64 via ::ffff:192.0.2.2 dev lo"
+	log_test $? 0 "Route via loopback device with IPv4-mapped gateway"
+
+	run_cmd "ip netns exec $ns1 sysctl -qw net.ipv6.conf.lo.disable_ipv6=1"
+	run_cmd "$IP -6 ro add 2001:db8:104::/64 dev lo"
+	log_test $? 0 "Route via loopback device with IPv6 disabled"
+
+	cleanup_ns "$ns1"
+}
+
 socat_check()
 {
 	if [ ! -x "$(command -v socat)" ]; then
@@ -3291,6 +3319,7 @@ do
 	ipv6_route_metrics)		ipv6_route_metrics_test;;
 	ipv4_route_metrics)		ipv4_route_metrics_test;;
 	ipv4_route_v6_gw)		ipv4_route_v6_gw_test;;
+	ipv6_route_lo)			ipv6_route_lo_test;;
 	ipv4_mangle)			ipv4_mangle_test;;
 	ipv6_mangle)			ipv6_mangle_test;;
 	ipv4_bcast_neigh)		ipv4_bcast_neigh_test;;
-- 
2.53.0


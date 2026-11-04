Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822679;
	b=0LvV9W2gLFVD8/gl33hoHMXzQnnfz+E1Rfeu5OwFM8YnV07YnP8lcrWA6FsqRAlUsQMH
	 yTTPlVzrodiiyI2W6J36N12ioNqEXtq5UR9xkMN7kOeBca/N4rnQPRyUHR0+1wCI2ZQog
	 3MrGJJj3OfahESZyd2EROsXPYS9MfR+AA5l3iCcnREuSIp0DvB2qwE7QN1xp8JRAy9t9H
	 9BP3zlSUTjS7KFj7saMBIEnecUWTPhPglYg2qOKnd9KuT8VGdr7R4hEmk/Zof5FLPr+xY
	 qzM9rX+5sp3bax2joT6P7Fb3GlDcgT6ADDxPaa0YgwUpwkYpMAYHmg5Nk7YmvgbTMEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
	b=noZ14pVK5BSyUJHjPOkYBgzVRVVs4urHlDV0P6PmWCHI4sm04fE03S/rxoq/GYyhRq+y
	 GSnfjDErqBNUFXGaV4oDOUZwjeppO7RWgIGDw5X8c4E38nBpPZ0BauDotPOkNblJnQeic
	 3S2EdeY7ubWI00LxpCcWJiasGuS4j5h29yeDTIFFmtc5vKmPFUwast3XvDq+E5QMCsdWG
	 efZ2154FvR2XPxIfzmdGYUh5romXbIWkazC495VTYCz0K29t3HVijd4uRdsxepLFKX810
	 1K18wRbx/c4W/TNRRWfTM1Ol1fFN1UKzdj16qLIBdlkDV9bGogH3cQkPmB0Ux3JwECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DCecO28;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB4607A96E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FB4607A96E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DCecO28
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso18675781fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822677; x=1794427477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
        b=0DCecO28ue16+Xp/dZw6oCOTeArtgudPtEJi038NWajCPUMgU+Ncyxu1f3gg+8QXA7
         C1Spupb+fbH0LTCgmxLcbp8gu+6eZ5jgq+lUt01LuoXFHduSdD3G5dot5vAFB6bEoGX0
         dzuPJ6EW1pJtHs2dz74RHB0/n9EPaWFkAg87oeS34ikgMMxqR3aXriVN9S0fIcvRo1uC
         aJ9MebCz9V4uzJP6kXoEhg5koqBie0S39kGxx3jwWFgHPIg8YRQNjrk/ML1V66p+F4Gp
         YtdaARu0mRcX1qdSMX9JahtX7Y94FMcRv9IWCTS+DPucCSLYFjOJmra10kzvl/eXE62/
         YnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822677; x=1794427477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYSTU5X3UuzczYg/8E5OrEwi5CakiKvwqjCVOhWzWq4=;
        b=2dmFp5qNxKHiTbI6gbHqK0T9wA67KzCL8LCmew2yf6kcYSzvOlHTqK9g5jcvsb+R7b
         V6rAcE69+gLu30j7dPh8MEj8x8cQqis4wC7Luuz+xNS0GyrZyZZ23h2b7cz+n189jfry
         ONHTs//5dct9S6uCd1PKN10+7EF2DT3zSKxaWIAsfghl8V3Xfwulam268vhXMjmOecZo
         bjgFy6VNwY/o9wd6JPjdNnjtv36QsO/OOFytD3Krm8KnOs1LusxZjhi/52aNoMjidazJ
         LAyD10hmbTUg72Zv4Yr8/zqfzo/deeTpO3hRUkgrvUtlPzLorPNrwqVvAX0UDsW2i5pl
         BXFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7IcVV2Xh/L0hwTc6pZeodOFqc9iu8leUv9/pxiPHFuPAptC4v6JRBqAvaAw9Riju3MAPJtcC3lHACqQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n04a+xyRLTdpsheOavtnEgiAG0pgQ/ddle2Yeh5rjEgVNVi02
	UVqTgHkGjTkTaAFEtXhIJg9uXW8qzKrVJmGb21SQemcMdnL9gV+w9Rh/
X-Gm-Gg: AYBFou2hMnV1UucRvQ63EfO/5kCFLsdvBn+cUbEqY8lgkr2AKC1wUvM9HHwpoYkqgbC
	pFkMIq1wapjI0nHj29N9HNubYzoqBCTJ1WCGCb3D3niuUo6w3iXKVHh8q7zHgDC/urXbLL0RcHp
	xSpJig/YdJOyzZObRIb/J7eL6we8hOt7iRQwAu2dI2htR9HpW8v/Ognfo/8cg/NGH2HOahNk3ae
	fcwAUbQTa33RBP5p6xMDC9M62VqOl4rmSBnGhPB6HS/Y+8nwm4UFzJGBMbaI0/VqKupVfvJAVk1
	ki1uMozuOKK5844bhJM6Zi0zI80ppFcumqN/N+AnC2oDFkW4ce/PW9l16yunx0nSAkVfW97NxrI
	+9nxkZgIezyLB/aOzvIfOSWLzQ1W0MKjcWGDsuZVYdPOiahErVwOR8tuEzFbV1+/UAUINmqHKz5
	ouoTzM6Zl77jOFlOuMLHaW+EDS90q8ogr4j5C6oknu3Vc5pTHMxRTckcX8d25tSQSxeyKqHlJI1
	dtT593Ce1efdnNspcgiLPasYdaRfrKyjY8nyC9s4GiiYMyz7tD1FHumUqfs3H+JgYGIOBS8BThN
	nZ8x/GAhsxrw5VbLeHr8Yi+ynxmLwQ==
X-Received: by 2002:a05:651c:b07:b0:3ab:4b4b:fab with SMTP id 38308e7fff4ca-3ace2f7fca9mr994011fa.2.1793822677045;
        Wed, 04 Nov 2026 12:04:37 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:36 -0800 (PST)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	weiwan@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH net v2 2/2] selftests: fib_tests: Add carrier gateway test
Date: Wed,  4 Nov 2026 19:56:55 +0000
Message-ID: <20261104195655.1406837-3-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
References: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Test adds routes with a gateway while the nexthop device
has no carrier and ignore_routes_with_linkdown is enabled on it. The
routes are added to the main table and to a non-main table, with and
without a device, for both IPv4 and IPv6. Routes are expected to be
accepted disregarding the link state.

Without the previous patch, the IPv6 non-main table cases fail:

Without fix:
Gateway validation with carrier down
    TEST: IPv4 route in main table                                [ OK ]
    TEST: IPv6 route in main table                                [ OK ]
    TEST: IPv4 route in non-main table                            [ OK ]
    TEST: IPv6 route in non-main table                            [FAIL]
    TEST: IPv4 route in non-main table without device             [ OK ]
    TEST: IPv6 route in non-main table without device             [FAIL]
    TEST: IPv4 linkdown flag set                                  [ OK ]
    TEST: IPv6 linkdown flag set                                  [FAIL]

With fix:
Gateway validation with carrier down
    TEST: IPv4 route in main table                                [ OK ]
    TEST: IPv6 route in main table                                [ OK ]
    TEST: IPv4 route in non-main table                            [ OK ]
    TEST: IPv6 route in non-main table                            [ OK ]
    TEST: IPv4 route in non-main table without device             [ OK ]
    TEST: IPv6 route in non-main table without device             [ OK ]
    TEST: IPv4 linkdown flag set                                  [ OK ]
    TEST: IPv6 linkdown flag set                                  [ OK ]

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
---
 tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index 7c47d7fe250d..d7ac3c727f70 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -406,10 +406,50 @@ fib_carrier_unicast_test()
 	cleanup
 }
 
+fib_carrier_gw_test()
+{
+	echo
+	echo "Gateway validation with carrier down"
+
+	setup
+
+	set -e
+	$NS_EXEC sysctl -qw net.ipv4.conf.dummy0.ignore_routes_with_linkdown=1
+	$NS_EXEC sysctl -qw net.ipv6.conf.dummy0.ignore_routes_with_linkdown=1
+	$IP link set dev dummy0 carrier off
+	sleep 1
+	set +e
+
+	$IP route add 203.0.113.0/25 via 198.51.100.2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv4 route in main table"
+	$IP -6 route add 2001:db8:10::/64 via 2001:db8:1::2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv6 route in main table"
+
+	$IP route add 203.0.113.0/25 table 100 via 198.51.100.2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv4 route in non-main table"
+	$IP -6 route add 2001:db8:10::/64 table 100 via 2001:db8:1::2 dev dummy0 &> /dev/null
+	log_test $? 0 "IPv6 route in non-main table"
+
+	$IP route add 203.0.113.128/25 table 100 via 198.51.100.2 &> /dev/null
+	log_test $? 0 "IPv4 route in non-main table without device"
+	$IP -6 route add 2001:db8:11::/64 table 100 via 2001:db8:1::2 &> /dev/null
+	log_test $? 0 "IPv6 route in non-main table without device"
+
+	$IP route show table 100 203.0.113.0/25 | \
+		grep -q "linkdown"
+	log_test $? 0 "IPv4 linkdown flag set"
+	$IP -6 route show table 100 2001:db8:10::/64 | \
+		grep -q "linkdown"
+	log_test $? 0 "IPv6 linkdown flag set"
+
+	cleanup
+}
+
 fib_carrier_test()
 {
 	fib_carrier_local_test
 	fib_carrier_unicast_test
+	fib_carrier_gw_test
 }
 
 fib_rp_filter_test()
-- 
2.54.0


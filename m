Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201565;
	b=K+ocyOQ26Yxfb8eVQ8m0YwuQfHxMIqJDOil8zo2e4nLLIMJDVbGqciz0kENKhYGngtcu
	 JkPWeGDsJhcvrXE7kuTJkQmoc8WjPQcL+4HoxuaYOODJIolmWdkxQ34I2nhHsZIb07gtk
	 pESxTfTKUg2hK/AI9c+bVeANlmyKUWf3VXExrClA9qK/TLX+SNmt8Bs6Ezq88UUjaxHMl
	 a+dB/qef75K2CFBP/zyFfxS51J5u8WODhieq8WXOgignwxNqFuYDt+XWlcepKzYlqefGc
	 DthbbbawXuqRarZLqip8IqfOPAl7h/szQS4RcsVvq2cHrWc2fLQb43x+7dXY3L5j5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4CoutM7AnpgKYRtmRzJTqqEDXmlCJEKKkP9PY75AExE=;
	b=B5vMf4mc4eXLTms8oUsh8u4PuZafQ8qKzDP2rfzFcOLiKxWz2cuFLoe8LEBID5V5CvyD
	 hy7XxoYNaD7qcpOWy6ZFB3/Z6p4AXKIQQXYL8sIYrTmS9HQKWQqEkX3EVMVYbZgGrR7AC
	 wQyl5cnzuSed60nc+TokRQoOQQEwh2N9wrV0UcElhpkOAJcIlYLBrCdy0pp1mNhxmHhSz
	 k/2/wT/gECcR6p0pIBPtk/GCFmpQBqtJzDAJiMUf0I6coSUS3j8kiQm/jt9SIBwhpNuvh
	 pEs87z1mPZEAujWcOoKWrkLQn7dc5umeD0qzevfugF1vilYOTKl6HXHdOPRxSxXmZ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heXmpuck;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E807606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E807606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heXmpuck
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba328513b9so1247610e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201563; x=1793806363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CoutM7AnpgKYRtmRzJTqqEDXmlCJEKKkP9PY75AExE=;
        b=heXmpuckafKBBzZLru5IJ/va5qQlYdgMLi4tTuQgsejbiQrUne3QPPyo712jMF2Ws4
         naqfFmSORKdP82ovy4Ddq1iqs/GTETMzgJpoGjvxVkpGjU4fB478AMI5cw3W3CWPR7iM
         zWNm4UwcQFxHl5pixyIN94gJyr8hOyOKhwIuB2lsyG2ZnQrNTQc8aUGZEOX7iB/iCyWy
         3UUjNMTeKU4lnIvCddt6IJPdV8EqwWrNuoMnS1M3t0Ur4zoi0Rrp47BfBLjlsiSM1yrE
         6/GxNfUedNV7z4In+zUU2LQT1KvNVxGdkbqzG2wlN/C1B3lf7dmwR+gcLdvP7hHJoypa
         Iyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201563; x=1793806363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CoutM7AnpgKYRtmRzJTqqEDXmlCJEKKkP9PY75AExE=;
        b=rz9joUqZv/PByLEsKSiWN1Ecx1H+PIsDAq+KXbTtCcxMzmGwUMXWM9vBP5mCikabR2
         1tnMvM2ZID8oybps+iYem7sARIslUZLa5SfVJt7cB5sE0jXmJA5Z5E//sl+G5FC2v7EP
         1DTeVi6HP1nfFbtWwFN1gr9dl1efTqm01UPYybgTUBp04v/zcxEqUf099dY099ljGNpZ
         v5iNBD9AjPgCxcDMtxc4v0vnjs7u4OkVVuatftkrpGjK96nljjDoDjKjma6t9snqXMhl
         JGnCs842Y5CdfaZAnXqjSMoTYYFIyGh0K2164DrabeLkepl+PbOznA1spa63eRsmd3eW
         5/Aw==
X-Forwarded-Encrypted: i=1; AKwUvByeKglS3HmOAWqMt/zzan3DuD9XkKMB+L5mZsyy2VWSQFvuciWKHP/w8e4QYV7fGdn4R1hPA95GL4WR6jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIfp178M3x08utK7GF4gk1hlLb1Uv8GUnTsenOOXtEpuOhiD7A
	bOFJrWEx7Istm58evnwVCy+8QjD/4WH+KupAAPPlPf1/5coQuVilhZMY
X-Gm-Gg: AYBFou3/dbWkBW4NdXq/192qbN+98r9orG73QiLSxZTlXjEcargS4ic3zEPi5TLBL5R
	eyLtIu553JNEkaEDFTcityS4xqY3akpWBfDMyE7w+UDLzFf0EU/1SfzNAXOBJJSmdRaTY2UzAs/
	/qw/cWlrFzp3It579OlNjaNF08xWlWP/Q0qhAL+3CXXx+YBmxq7x19b3G1gr4Ls8M/dYOEIlE4E
	zK5zpoevN2QYSp5dp61YqmrplXWTC96fg084FEWIKx+OJmAC7e1zYVrLjE/vn95E3eQUcuAxVw5
	8z2gE6Hd//97ewvh8Fkcc8Upg4omovCUpACFdGZf+m202mBfdlG4vlKw611uADG863PfGEmyQLw
	GFcHHYNnRyl0yGzm9Fiu+3/X4YAUguV/suuu+W4G2wQDXqgTonzZm2BNMAVXpWr5oDAgufeUxB7
	wzxv6wh7usv5W7bu7owbcE5aISaR0jlFhl6VOiv0U2s747oaNNHRU2qtvTxDcV9SLfol60o597N
	xULMnDsXvfu0trIVAOLJf5m+Srte/P67B9Efp1/IKFg0MFvsWvSi34hNE2rGl8eqzc7JuSupeet
	HjKDwIAjydrrX0juPmPwiCUK11Y=
X-Received: by 2002:a05:6512:6cf:b0:5be:5d8c:85c7 with SMTP id 2adb3069b0e04-5bfcad4329dmr1063224e87.24.1793201563041;
        Wed, 28 Oct 2026 08:32:43 -0700 (PDT)
Received: from gentoo ([178.68.9.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca57ee5fsm669346e87.32.2026.10.28.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: Yaroslav Dudkov <aroslavdudkov622@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Wei Wang <weiwan@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ipv6: ignore link state in gateway check
Date: Wed, 28 Oct 2026 15:26:33 +0000
Message-ID: <20261028152634.3355852-1-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
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

IPv6 route cannot be added in table when all
following conditions are true:
- gateway is not link-local address
- ignore_routes_with_linkdown=1 on device
- nexthop has no carrier
- gateway is not present or covered by any route in table already
Also multipath routes addition is invalidated by kernel even
if only one of added nexthops satisfies all above conditions.

Reproducer:

  ip netns add t
  ip -n t link add va type veth peer name vb
  ip -n t link set va up
  ip -n t addr add fd00::1/64 dev va nodad
  ip netns exec t sysctl -w \
    net.ipv6.conf.va.ignore_routes_with_linkdown=1
  ip -n t -6 route add 2001:db8::/64 via fd00::2 dev va
  # added
  ip -n t -6 route add 2001:db8::/64 table 100 via fd00::2 dev va
  # RTNETLINK answers: No route to host
  ip -n t -6 route show table all
  ip netns del t

Route should be added because:
- RT6_LOOKUP_F_IGNORE_LINKSTATE in commit d5d32e4b7668
("net: ipv6: Do not consider link state for nexthop validation")
was added for this
- the same route is valid in main table (when no specifying table id
while adding route)
- fib6_nh_init() initializes nexthops with no carrier
- IPv4 already does this (fib_check_nh_v4_gw() ignores link state
using the FIB_LOOKUP_IGNORE_LINKSTATE flag)

Before commit b2c709cce682 ("ipv6: Convert gateway validation to
use fib6_info") rt6_lookup() was used for checking if nexthop is
valid, rt6_lookup called rt6_device_match() which does not check the
link state. After change rt6_lookup() to fib6_lookup()
find_match() under fib6_lookup() started to invalidate linkdown
devices, because RT6_LOOKUP_F_IGNORE_LINKSTATE is not passed to it.

Adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags for ip6_route_check_nh()
solves the problem. RT6_LOOKUP_F_IGNORE_LINKSTATE is already used
inside the first search ip6_nh_lookup_table() and fixes the
bug in second search fib6_lookup(). Also RT6_LOOKUP_F_IGNORE_LINKSTATE
isn't read inside fib6_select_path().

Fixes: b2c709cce682 ("ipv6: Convert gateway validation to use fib6_info")
Signed-off-by: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
---
IPv4 example of this situation:
  ip netns add t
  ip -n t link add va type veth peer name vb
  ip -n t link set va up
  ip -n t addr add 192.168.0.1/24 dev va
  ip netns exec t sysctl -w \
    net.ipv4.conf.va.ignore_routes_with_linkdown=1
  ip -n t route add 192.0.2.0/24 table 100 via 192.168.0.2 dev va
  # added
  ip -n t route show table all
  ip netns del t

Also when adding RT6_LOOKUP_F_IGNORE_LINKSTATE to flags of
ip6_route_check_nh() makes adding this flag inside of
ip6_nh_lookup_table() unnecessary for this call, making another call in
ip6_route_check_nh_onlink() with flags=0 the only place where it is
needed.
---
 net/ipv6/route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 94e5ef1c4f83..95d7b5b10e51 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3426,7 +3426,7 @@ static int ip6_route_check_nh(struct net *net,
 {
 	const struct in6_addr *gw_addr = &cfg->fc_gateway;
 	struct net_device *dev = _dev ? *_dev : NULL;
-	int flags = RT6_LOOKUP_F_IFACE;
+	int flags = RT6_LOOKUP_F_IFACE | RT6_LOOKUP_F_IGNORE_LINKSTATE;
 	struct fib6_result res = {};
 	int err = -EHOSTUNREACH;
 
-- 
2.54.0


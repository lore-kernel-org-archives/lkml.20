Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822671;
	b=bQWUfmvDYNFDwfyqejYSMCZNjnWUyReP9A42AAKcyDisivf/ulD1FkQmQM8Oyjl3HJDM
	 tIyXSF+42kqyoAKnFbAE9LCl0uwO1fwJwBQXxAKi0UVw//Kpesa+nemvKkO/1/BTUSg19
	 sa1hGV1qxxDZNJYF8MrLIAQDB5wef61mEO7oKEPLOsxsjZCDO1wmjtr1jdVVk1StZYePZ
	 9uwPcZkv6ciN3fu7eNBVji3YQfRCb4D1jQDhJxlvFYbUCjrCIpAj3cqG9gRfTmZKJWdD8
	 mJUSpkC3ykPD1UWxXWCrXPSe6EErYBNmlJd8Q+zS+vXEREyKJD52EyhCdmqFURPGPAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
	b=I2bQiyE7vsc1sKTEI9P61oW8EKmaR2kdJSUZGhRBfsK0N0zQIKGo1b5YtDXwQYFa9aag
	 Snnv/dI9yKyyjwDTPqjMyKkDbWcxCfq70BZIQHeZ2G8rBgFwm4MV6DyauAC2Lrk/74QQL
	 JuKuR8+dByGVaL852JEO7Xt/4gSF3qaKMb/jduttKHp7Z+qUDFjW1JJYKz0CdyuQQ60SS
	 8641UfmPUOCT+PLUU+i/IP4T/gp5/lp16h2Eai+f2RNavE4MP6XOxuWLIJaLXR8PQ1FET
	 SxprkdoTWLfqfPxZ2F5l7gOm9nlj9GNU4hwp91XjXNDZTy2yjAilglWCMclUUpOla1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIGQtM82;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6650C606FAC8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6650C606FAC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIGQtM82
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso14371161fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822670; x=1794427470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
        b=iIGQtM82BiNLyonv+Vl1VspuOaMrUC9/Ps8jkarVh6KbuKTW0cgRyFG3800Y8PBh94
         0O1TWzSF/QTQci3Jk8AyntkfwTrPK+ONyfVuEcW5cRCww6IwspuYxE6yDuZO/To2EWNB
         SExxL0YrZIYwTAFcBxjHG/uRDjSNW/mA7AME+Q3Z7c7217QIh1j0Ie9cf+jgYRxX6wn3
         0CP8WkGxtJawP+paRtQYxDz+iqhcbKsDOFdDCIiSrryfAUVwYa7zt0xC2AbpU3KnJCHW
         P9MGnd0HI+2n2KJKUS6Mvd95vktqGYhifeMI/55MUHToq+3/nMCk15kwgFdTtDAF0d0k
         l3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822670; x=1794427470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAUYa7DsnYJVWK5uXvFQ0zTldnyeSGGQ67HR5sn+wb4=;
        b=l9b91HlHlCI9Srdl8SuwWxHSjOeRror6UWbfdYbWcP81zbSiyMTSja16bxosflRQnI
         zmXCugzk3rEop1R4un3nRwCknET8wmSqzKvwq1vusdsIMeV2lEAM5n0BCcip5sVplm1X
         6Z/hxXCug+yLqyvF1Ej5lwVG/X6Ow6tETspzURhtu+ZfLCxSYATe5OB0adXczkJOif8e
         zFMXek5QDb9YiBXNjz75btl6ggCyHnngH7CvjJ77be5caudJOp0SLXaqqSXnwSrH69RW
         Yhc+6s1q6R1LWjY8/KcMPPwiKLF1VsSxAa7+vv2LOBnQ8K4bIrmXmEPJ3HulHMlT39Fn
         Pe3w==
X-Forwarded-Encrypted: i=1; AKwUvBzpoZaO3h5siACuayCytyqxl5KDubQkxZEdK+kmOtWROw99Hv8orcpGniVLxNLpag7gYPxS5lZ0wy746+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DRqcbgSEJs0gpT/y1pvUTwhEfQq8uLD5iL835aUA/+id4s4vP
	2gjmQJ8DcrebQtpmsF7ffSHb0x6hZPaU8XeUJcq4JpN511tlIOVIUQNv
X-Gm-Gg: AYBFou1eY2XWrKEYinEok8jsQyA13D1SDUB8O7W6BNcQaub2+HF0qGTsZLU6YYnET9B
	YlvrH199oIMc79cHx7CFzwPHONoTQYJvkA8HIXKVRrEyNEyvpBKr79DJHAJOMDP0BF1yuTd3cGB
	Otf4pO9lsQNLYn2Uu3QB9OSVM7llPllHW19Vvzw6U2WNvoYRDiNur6Q05rCzXaIkkdT9KCMiE8M
	yh9XAS9mPAN0fMgduBRZMbhxr8SP3h3/hQ17jSlNA+KrKWRiED+AZ5YGCs20Z29kbDie6IEywLy
	H3ny68BkWorxtm7DHMORDyFi3vMHvwNn/jMG7XvQ/pBjT2k5ESqh+EakKJVxb+lyPnRQ7WYAsnO
	BbN6it/q1OUs4Rwv73TAMcVFGWtm6WBikxI/Dy09v8GF7HTXVu+BN6GH5TRlszlHgBzBq00Uzyi
	RjvKWaZ+dVHllzBa4IsYyl7pW7Lr6CtBW4+gFFkzxOV5+hxLhSi+tmoy51lk7k2/kOAZdzlRxAt
	/ugRJHCCmfxAtBUjbHQwUFzxx4IgwzgTd6AGBt9eCR9jl8uqYOcoSIC/nUv3G8O1wL/13Np1Zrf
	oiEmPlSilllWZvtR8tYjOWjYkhHOd2GoH4swleLMPtytz6LWf3A=
X-Received: by 2002:a05:651c:43d1:10b0:3ac:cf09:d6ff with SMTP id 38308e7fff4ca-3accf09d9c0mr17250161fa.24.1793822669498;
        Wed, 04 Nov 2026 12:04:29 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:28 -0800 (PST)
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
Subject: [PATCH net v2 1/2] ipv6: ignore link state in gateway check
Date: Wed,  4 Nov 2026 19:56:54 +0000
Message-ID: <20261104195655.1406837-2-aroslavdudkov622@gmail.com>
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
index 94e5ef1c4f83..73d8a2c95602 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -3424,9 +3424,9 @@ static int ip6_route_check_nh(struct net *net,
 			      netdevice_tracker *dev_tracker,
 			      struct inet6_dev **idev)
 {
+	int flags = RT6_LOOKUP_F_IFACE | RT6_LOOKUP_F_IGNORE_LINKSTATE;
 	const struct in6_addr *gw_addr = &cfg->fc_gateway;
 	struct net_device *dev = _dev ? *_dev : NULL;
-	int flags = RT6_LOOKUP_F_IFACE;
 	struct fib6_result res = {};
 	int err = -EHOSTUNREACH;
 
-- 
2.54.0


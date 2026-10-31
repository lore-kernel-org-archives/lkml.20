Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793423277;
	b=UYW1IPYvgpIv2gYyrHQiXsgpkDB7x6VKirBHhRuv7Uf5mABeG575ViI5/HCb61yV4fZI
	 E1KdeSt0zn4a8hJjHlX0Yaa8DNpeHI8nrpy9zGvVSRefCc2s5/QSCfsKNnXLsqznrWlDx
	 nkHQnJippIhsuIROuuOOw6gHTTF1LJe7xMch76hwU2UozcyHR5LUXqmI5SVEphoP+zOwK
	 O0Y91fTQUXJDm0gCY86MH0+kjXR1T4FHS/OtX5/9x6zaFVTn4JLoM3gJAemPTz6CDwgRW
	 KWwYgg28NNqUXkm8s/Mmk9gGKmnkH1g/U/K9LQmOyB+4iYTsVf9Jb6GFrXM2Uzy7AFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793423277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LHwpZd2hxgw9EW+51k+f4+mN+FOI4H2HOB0NQ4Pk+Sg=;
	b=S0IE/fs+bF/QVQqdKx0ZnkxhwNhVVpsl0iZ0jxzhPsS1djy6Fi2PWqJNn39uFjmvex6c
	 zojINOsr8dcDxFzV9h+3A+NyZBXZ4ElWpGtBcvdchHEoCCjszybQI3b2Wvz+m2OF2IuDw
	 LRVTUP8q6C0JZXWRn21hB+hPAdhaJ4lHKSMdfNgcY5nDmw+D3KcFiHGzwf0YOcegwTniu
	 SXvoNZkVuro8xWLgRJxY2vPi1aJFCqv9uvfy71EeYos6U8RMUSOB/g7ip48xl+/Ug2T9F
	 XZLfkIDkEK7W6r/scfo2s1B/E19D/G2U8bCaDI8ZuBVCb+qZfWzR3F4z1V66TK580/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JIuk46PK;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A508E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JIuk46PK
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49e1251674cso649743fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793423275; x=1794028075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHwpZd2hxgw9EW+51k+f4+mN+FOI4H2HOB0NQ4Pk+Sg=;
        b=JIuk46PKuL3WEnPTO4ohToX07UJwVSchjMXxsocHyjk2/oJSQ0bF1XU3rrDNDiTZzo
         oRbFyEhM09Np6ZESZH0yLqCNF8a4jSRE/C3quGuoYlYl+UV8Rz00i2c8d1Hx3iZi6p+I
         z5RFvVBoPb/Ygg8gGBDs0OAbDjYujx5udli1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793423275; x=1794028075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHwpZd2hxgw9EW+51k+f4+mN+FOI4H2HOB0NQ4Pk+Sg=;
        b=GRo8i2XkPtYbyjAg+ZlmgGEze9qP/YLjBElc+dBSLDC2/VHuB3+HPb1I+9BlEL79G9
         7KamAcBwr3KMDnajXcSCbN/k0P+8GsjBlO4FgeUFkAzDH6nLdcxOgGTzD8/8G97uxP+i
         6IELQ9FSpYpDVPu/rz/EshHYphHxofuYE6VitpA6VAplwnGpvoq/E2a2Ts5LKFnqZ3RM
         WMmyYQJDE65RkHvcy8DEhz5NkrNUH0aPVKR9VI5vCMyMHNjH/zSkiV+o/5Lc1ngosqrX
         zgMobzizWcAAcsLTM46ifzL3I1PN9lBrc7Nzapde4+SnzSUbBjmW0WO+t7V8Zns3n+FP
         0E0A==
X-Forwarded-Encrypted: i=1; AKwUvByMbgoFaR/jc7mPMZEPWVaOf5UcXhd2d0wiDnIroS4glM5B/EYVPFecu3PGn54rsqLjFy6ICPBqRGdvs0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWqXL2V7zyGSbbOPqmsINIrUhy8cKo5zwEZp3tM4KSlXQf/KW4
	+x1m8bfYJ+de59199m3yGytVckO7WWYviR25Us4sYF82X4+9GsPM/t0u5X2Lc1ZdxrFjBq8rV/v
	EMP8EGDc=
X-Gm-Gg: AYBFou1c1GbLHiKuJYh28xdwg8+xxQJG8PEFLEWj4XXTiUaSOwENG7XLL7dSN+sPW2y
	rw3cAXsZIF4a8IWcKbdDaZzvRwpJqXFwdwX8BqH9zMVuzUwdEnAL1JARihY0KUQ1vpzddMBgvif
	jVLmyRYwqTMO8Wf7bTKSlqMvkBxVQQOeWweDcKaADm3tXtbusDW84/wN/vfKAWhlKnVh+4coew7
	4pfKsc2bXEAm241Z8340TL0qg+xgQgPNQ1Gyggrg6Fmcgr4ggq7uQFBM85BrQgvjnvQcEXomQ4/
	ZqNoGAFA2AKpmT+QB5yE0JvcXCVCkSxR/Oeg1E9oyCawdLS2tOVGCCMnJnM9AktSAnnbVkWY+10
	dYjMiOQIfFpCz/qI5dFGYMfNMCGTx02FlZy8+0nLiIwToAQSD6e7abwl4+Qj0IGHrk8PUso7wVf
	XHxVQ32KSD7SQu3AGACiaWevmtyarjp07+OxTCsibKSbEh5zsvCIlc9Wjkxv91i3lrG3zP/WTcj
	K0Aw783JQZyyPBy7IhKqEYAtl2cJ+61vFCfbMBZ2/7cEN2B+j09eByE/wVxIIaad0tvcgdESiN0
	uUhZPXYGB3Wy3bYp6ZaiuAEAys5LUzkM6u2tjtpYv40slMOY76WHBceyAI/11IbofJaZvPm9xJN
	vvJOJa1g0xwo9xVCp+oH/QEJpSKad/g==
X-Received: by 2002:a05:6870:8092:b0:4a6:f676:ecef with SMTP id 586e51a60fabf-4a9077af209mr3002687fac.55.1793423275411;
        Fri, 30 Oct 2026 22:07:55 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921a60ea8sm1626065fac.15.2026.10.30.22.07.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 22:07:54 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH net v2] net: gro: avoid parsing headers from shared fragments
Date: Fri, 30 Oct 2026 22:07:52 -0700
Message-ID: <20261031050752.31869-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

When an skb has an empty linear head, skb_gro_reset_offset() can expose
the first page fragment directly to GRO header parsers. For an
SKBFL_SHARED_FRAG skb, those bytes may still be writable through a file
mapping. Headers validated during receive can therefore differ from the
headers later copied into the linear head and used during completion.

For example, changing an IPv6 destination-options length between the
short and full header fetches in ipv6_gro_pull_exthdrs() can make
ipv6_gro_complete() pass an out-of-bounds offset to udp6_gro_complete().
A userspace reproducer triggered a KASAN slab-out-of-bounds read there
on an unmodified kernel as UID 1000. The same completion path can write
the UDP checksum and length through the invalid offset. The packet has
trusted TCP GSO metadata and spliced file data, so it reaches completion
without an skb zerocopy destructor or a second GRO packet.

Disable the direct-fragment fast path for skbs with externally writable
fragments. With an empty linear head, frag0_len remains zero, so
skb_gro_header_slow() pulls each required header into the linear head
before it is inspected. Subsequent pulls preserve the validated prefix.
This covers both gro_receive_skb() and napi_gro_frags(), including other
protocols using the same helpers. Linear headers and private fragments
retain their existing fast paths.

Codex assisted with review of the supplied report, reproducer and draft
fix, related-path analysis, and this changelog. The patched
net/core/gro.o builds with W=1 using the supplied x86-64 configuration,
allyesconfig and allmodconfig. The fix was checked by code-path analysis;
the reproducer and kernel selftests have not been run on a booted
patched kernel.

The issue was found by an LLM.

Fixes: dff0b0161ad5 ("net: gro: parse ipv6 ext headers without frag0 invalidation")
Cc: stable@kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue.

v2:
- add Fixes tag
- explain that the issue was found by LLM

v1: https://lore.kernel.org/netdev/20261030042212.73949-1-kylebot@openai.com/

 net/core/gro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/gro.c b/net/core/gro.c
index 1b033855a20d..d6cf2d497934 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -413,7 +413,8 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	headlen = skb_headlen(skb);
 	NAPI_GRO_CB(skb)->frag0 = skb->data;
 	NAPI_GRO_CB(skb)->frag0_len = headlen;
-	if (headlen)
+	/* Shared fragments must be pulled into the linear head before parsing. */
+	if (headlen || skb_has_shared_frag(skb))
 		return;
 
 	pinfo = skb_shinfo(skb);

base-commit: 2a500a04d6f969318c05f46aedb6e73fc1963a00
-- 
2.55.0.openai.911.g06873a30d2f3


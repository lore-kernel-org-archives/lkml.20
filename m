Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334136;
	b=uB7G2BBl+auLomL1Lg15jO6nqEKljsGTlwZgizuOxh4xayMUOhRhUpsCBrvaIkhmRAiB
	 QyukukdAujlZuz8g/x9EMFfRHH7/qlrSAXt8OprRW861K6937jNiHIAjHGCrz4PoiEFhn
	 1w7T7SqG+z4GJM6vyD8PUJdbJCNgexJkabCZ/qzi3csPWVo/suwqLmDBmzEjD9GWdlOcE
	 uqwUgg/ikLq05f2bQYoDKzgHOFY3R+cpqCaALSxHd62RD4Vp8klRbcXanSGgNd43/TX6b
	 7X2bH0Fu/IeK1Exav1/g2GogupjrPMg0R++y3Y/2JFlZjtmU54k5Zxc3zWB407jMOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sCvGqwNU2SK55VH1hMa7Zsh/VqV4FJcT/3+6mrPnc1I=;
	b=GOec9CMj6rXUq7vq6NX7ZezGT5UNRq+yuJiATd3dnU0F5jF9V67KtqcnQSHhP6QKrH5F
	 DK8kY8vKyQ/6NF3pKnWuQCasfES2/s5kzt7EDamJv/9vDUQlujF+W7LV4zgQgxISDevxm
	 igOpehAz1YckSMxt9/RGeqoq5H9wrFcQTVGUubZn7irOBgVmp4HhgS9Cp9QlFsxxGbbkr
	 HVCwH+VAqYmoHzLnSW7NqbuDAdjyQV11Qb0onT3GCQwt1zvjWnfSNfAMytur/akRUxDEw
	 Py5ZVBVeLvPyuAY2IeJ9A2QM24CV+kjleW19+3+B9rVd5jnIAM7rzFxnnv0G8VWo8aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=P8lKyUii;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05581606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05581606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=P8lKyUii
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-70bf1671c21so184902eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334134; x=1793938934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCvGqwNU2SK55VH1hMa7Zsh/VqV4FJcT/3+6mrPnc1I=;
        b=P8lKyUiinJFj9J1uUz/gfUWezrUvE+7Q9L3hNaeXF6KDvmFv52jq6UhMQ5FQrjYJu+
         0WqVgdsANMCVYZmQrkcVpxZvNtOep8UBVU0+adLSJnrZOFh8kZS7Vvi90GFB+nftq0vb
         JSywjRD0v+3QBgYY/82hpv9oUbcFN3djvrjpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334134; x=1793938934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCvGqwNU2SK55VH1hMa7Zsh/VqV4FJcT/3+6mrPnc1I=;
        b=Vr8S5FBNZbe2Toey7kM8eSX163fs1Wl5nYv3xiXgVfZXL+VsrIlvO3RzbhaIwZWUbI
         xudu4d6QxBC3nXChx3006acmHXnw02J2fR5KSL0aRUy4ah3vSBbI0eJuA9nGG4W9oq6V
         qiQiirR6sDmHINOBOaEgrT4zJVqWfppzkPH8afVAAZkmgwzcQZXc5jcqDWukvoay7nfz
         iHabjmcs9ZIn8D8hEBKc5o6Z4IfqachN5xML7XZnAQyVNR0WPVJeSw0mWBxYvY3Ad9wm
         FojGb/o6GStaCfSnoLH6PClMR3tKTmkolfwn8rqbJuAF6HlZvhVH1yvOT8s5Wjeiy67E
         Lysw==
X-Forwarded-Encrypted: i=1; AKwUvBySRuRAIFq5JNkh7mKPyaQE7eJP6YHlbbDz4r8uc1PEywIAzTOJWu/MPdzkBJgT8GQV3oOgIWfcLC9oo3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe6Nmb4A3i8zehgHbGi6yVrvjrjwgyqp7HIy60kQveT5rlPwAO
	i3Yl1Sx3Zpx5vQ4vmWDaaIT3IinfQkM254XFKPjHGV6Ejro60o0CT9oA3/V9UUlFgHE=
X-Gm-Gg: AYBFou30Ly5YjleJe4yW7yzoBQH9gpYRfD6SAF6K/eifKeNLTytyJ4d1y0dnIofo1+E
	S3AtB1uBhdwLtkUOGhoIpmIadnYgA6V4ttAq2tZuDyYxda0nkkwLcmuPpHJGBB/bEQ7uJeNJUL/
	7PhD7skj+OIvwTPvDfuaJ+pP5HFCnFP5FshDWYt8vVuNRnG2vZsW3m4fTHGCgTvTGerFaVKDUbT
	2uNEQn8YL+CANX+zCjVJUl3fqfd6dFfcr76n4xYposhCmoPbfjLXLjFG2xhtn9YuH8h3eRxli7j
	Lo00AmTddZU0AkIPeszkRfxIM9Vu8ZSuwgOVuW8W8Q1DX9J1JSiRSQE8DQtUkhMd+e5MPh+Zwqy
	rR9KRPc2j8QxGVRL1dFY+jbEfc24hGOB6cWtoCcGmoar2YvCXtfSpPe1Ydx8RhlDsC4LPxSCVIX
	P+27pGG2gYpB//6+nF19oz7qD9LX+XDWHWoFy5XRfBV7pqjwNo5EyLK74OALEGNetYUZf6rIaNi
	Gt75fJStbBakQfXLLWPFl+RkwMDx8dIlaUQ7wTvgo58+g5SspQi2i2fbOE1ozB4JGrZxptiOJ86
	mezpi30evbFCszh97Icl5HuNf8Ehx6rUgOiwVfxWO5b2Q191dOrm0aKAvzBDD2j1jKgVEok8day
	LKHeyK/xhPhQYlrL01IfHx3BPnmPPIA==
X-Received: by 2002:a05:6820:1346:b0:70b:1217:4a8e with SMTP id 006d021491bc7-714f20a0acdmr892156eaf.0.1793334134520;
        Thu, 29 Oct 2026 21:22:14 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cd9bbsm1127984a34.16.2026.10.29.21.22.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:14 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] net: gro: avoid parsing headers from shared fragments
Date: Thu, 29 Oct 2026 21:22:12 -0700
Message-ID: <20261030042212.73949-1-kylebot@openai.com>
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
the first page fragment directly to GRO header parsers. For a
SKBFL_SHARED_FRAG skb, those bytes may still be writable through a file
mapping. Headers validated during receive can therefore differ from the
headers later copied into the linear head and used during completion.

For example, changing an IPv6 destination-options length between the
short and full header fetches in ipv6_gro_pull_exthdrs() can make
ipv6_gro_complete() pass an out-of-bounds offset to udp6_gro_complete().
This is reachable with an ordinary TCP GSO skb containing spliced file
data, without an skb zerocopy destructor or a second GRO packet.

Keep the direct-fragment fast path disabled for skbs with externally
writable fragments. With an empty linear head, frag0_len remains zero,
so skb_gro_header_slow() pulls each required header into the linear head
before it is inspected. Subsequent pulls preserve the already validated
prefix. This covers both gro_receive_skb() and napi_gro_frags() while
leaving the existing linear-head and private-fragment fast paths alone.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

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

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

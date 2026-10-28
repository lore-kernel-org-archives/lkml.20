Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206060;
	b=X3QTOQ/0Mwl5R7sX5Umta2f4TRidbwMujZ/lG1bLFOSYkjKRbgSdxOASn/WghS1Jy6rp
	 3YOUndMCFppTA3CzWQTecB1nm9Hkf8/yosKVV8OuhBONKJYqnEjWvjUpqwCNiNfImX7XF
	 UDtA80G8Thcbdp6p1dhx4+1PcuYeMjAc6m7JWctIPiUh6cCn/UwNnbzaz1HcP44qKK1rZ
	 OyJTNEmLPCWPEIELsCLbPoJO1zuMRFPhb7WU7XyYGGY1/6kYBw4D2xYhD/fll1LPerRu0
	 HteLw2eLP/56/lP8f/k31lhHX0kuJ/UmI7C1OKFhzGsGzCdv/6Ryz+xytyBBy3A2nYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YP63UdSvRgH+U6RYpSmgw00Aw6otHrAc8+AYLP+kjNM=;
	b=zPmBINrSmSjlA4b7y8ShvysOS9OTvHK3P1idSsq706FZvN/Tp4vJ3kh+OZ/wYG5/fr8L
	 G9uApctuMEewUGwWGrZvgZs7cdwmYqWhWmeSiwdzfw/uOyr/FWZ6EzlGRJK6xcwgk+ubY
	 jJRinu+B2v5fJYupzTEQHXy2oYMrFK6LMdfwK530H9Mi2BC3ErRths1klmMJ92Fc9v6+s
	 tdCk3hfEmcp8VblCwwd9H517ZBsiyJC1yOAJ9ox8REaSQn1HuMeKBOmxCZuu8rIXLdH8r
	 drOOPyYhJhMrpUlUDQjvfOpI+lfIBs2rZaEDlEBvauoLlSmy4Tyhrr33FHWzmAW6lNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrwSVVTC;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400A60A2616
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3400A60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrwSVVTC
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8246b13cbso10312715ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206058; x=1793810858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YP63UdSvRgH+U6RYpSmgw00Aw6otHrAc8+AYLP+kjNM=;
        b=lrwSVVTCr+mmD5txpvh2KaucEm5yJlU6dn9ubOt13fw4aLxcMETtY2fvTnkU0A7tgY
         KVawglfKWWyeSYXUAytG9qQczSoMLxjfa3dhx8tlwMcYUlL2aH6VclwO4y1zYczieI2p
         Q0Z+FDJ9Sgo2enla6/lk2VAkXYrhQcCrxzME/E0xhasyOvpzQEg1IMCuy+3BcUKtH36l
         EqK0J23H57eMQYKm7iTLG/oaHHyuhswjOv3/x366f+gX7/gfgfGT2XL2wLUO8QYeKNiN
         oEyv2AavkdEI1P327WzfaWwbP3j/bHeNVfnTcerzpcRRjaI0t5TpwCBSzEoklHz/QfEG
         fSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206058; x=1793810858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YP63UdSvRgH+U6RYpSmgw00Aw6otHrAc8+AYLP+kjNM=;
        b=w6HsQvY0tGkPJSfky1Z9PbrwwWsCMuKqV3RljgcAk4PmwedXHd/7EfuzvpraBfoeva
         l5ZJyih/VEr9YmgV6+dqo+0g97MKy45z8NyS/fG173fgh4nS1JGsrGldT5NTmezfoqJU
         pF5kwR0XFW6Uw2FPu3eqSkgTjAx53FT9MrP1gUUF/c4l6Opx+TWHX8bIyuONp2mkSRpO
         bxAO7+ptC2gFl4RNBlOu8SrOnDG7tXahOFyc8ilitmw+K/m9QDDCxom9tt9oF+n4ljPA
         GCLGCr1pb+tuxbLJYsav07DVGhuHGGmcxbG4K2noKCqLplEt9pRFqZXbGtnCXRsF+llh
         FM1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzxwl1t+YZMJ3MOzJywX5tjvh8rLkK2ZU3dQuDt07v2mwsiwexNOu02aFhQUJKmoXjOHAr40zrj2AFtUWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPfFKuduxrTriZzE63xdVpNddn1oZvHUUu/DdfDt3o+76e56MM
	knDcnKYj+BV04Ncx4O7fq8BN2B3ukUFEAirHdUlQchNt+4rEgVax/ZbH
X-Gm-Gg: AYBFou0Gd+AH6JDPWi/UcVxv+r8HauYTjthvRTMSrQTwOQuttKsFiIX42NhbYC18ToA
	qb8+uifMmHRqn2G7hycq0WRpH1ZzaCS4PWNuKnP00OHhCdAL1LnClse5Ww+gdg79f0W44bA86uD
	abeL1D2L+U487bqeYIx6izP+FRbn9vBsQleKM7sZMEhFnJTbvZm8LvMw0AU3DrZbJBRITjUCLFV
	tl3XIcB1NQVXMkeNO0p8kifX6bk9qM/kLzBZrz/JW0igvugyJ/1abc9KWlumiA7MkAGQZ8p5tKL
	H3EWUExtHLHG4jexUSyGGCw00BnDxqAysPojxRRr5Jj8eJrJ5z+DN1Usbs0Kzs0JtXnYcLw4g44
	/0C81v2cogbNv/P1pkWeavtZLXmUP8TgwyBqZRzEqv553MtUnq8NouynVSjFsLLrtUr9QRgU8OY
	ovmzGPjEvvKcr4KJOYWZ7KK/DDpqd1cLyqIqTkKTlxvMUIfbYqEGhtZ2jf8N0Njm8LMc0PhaHw5
	sMCnpZOpRe5rd5xFZAt0AWDWSqPqHvde8b/AHLrG3JesbdFbIJi2GMjH3xWlb9V9J5TpVxYLhji
	jLUp7YHLGlYk7TWXotjE7LiAb6SVNB1T+dHRf2qXoGBsNQ==
X-Received: by 2002:a17:90b:48c6:b0:3ac:86a0:5766 with SMTP id 98e67ed59e1d1-3ae5836cbd4mr2201584a91.63.1793206058606;
        Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c5b77sm2173048a91.3.2026.10.28.09.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:38 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH net v2 2/2] bridge: cfm: ignore CCM while CC is disabled
Date: Thu, 29 Oct 2026 01:47:30 +0900
Message-ID: <20261028164730.253238-3-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028164730.253238-1-pocj8ur4in@gmail.com>
References: <20261028164730.253238-1-pocj8ur4in@gmail.com>
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

A valid CCM received after CC is disabled can clear the peer defect
and restart its RX timer. Cancelling pending work does not stop a later
receive from queuing it again. Even with RX work disabled, that receive
can still update peer status and notify userspace.

Keep RX work disabled until CC is explicitly enabled, and skip CCM
processing while CC is disabled. This prevents a later CCM from changing
peer status or restarting RX monitoring.

Fixes: dc32cbb3dbd7 ("bridge: cfm: Kernel space implementation of CFM. CCM frame RX added.")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
On ARM64 QEMU/KVM with bridge/veth, a valid CCM after the disable ACK
cleared the peer defect on v1 but left it set on the combined v2 kernel.
Re-enabling CC allowed a valid CCM to clear the defect. All 3 status
checks passed on v2; 2 failed on v1 as expected.

 net/bridge/br_cfm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_cfm.c b/net/bridge/br_cfm.c
index 28b40dbf4073..115cccf1d327 100644
--- a/net/bridge/br_cfm.c
+++ b/net/bridge/br_cfm.c
@@ -150,12 +150,13 @@ static void cc_peer_enable(struct br_cfm_peer_mep *peer_mep)
 	memset(&peer_mep->cc_status, 0, sizeof(peer_mep->cc_status));
 	peer_mep->ccm_rx_count_miss = 0;
 
+	enable_delayed_work(&peer_mep->ccm_rx_dwork);
 	ccm_rx_timer_start(peer_mep);
 }
 
 static void cc_peer_disable(struct br_cfm_peer_mep *peer_mep)
 {
-	cancel_delayed_work_sync(&peer_mep->ccm_rx_dwork);
+	disable_delayed_work_sync(&peer_mep->ccm_rx_dwork);
 }
 
 static struct sk_buff *ccm_frame_build(struct br_cfm_mep *mep,
@@ -414,6 +415,9 @@ int br_cfm_frame_rx(struct net_bridge_port *port, struct sk_buff *skb)
 
 	if (hdr->opcode == BR_CFM_OPCODE_CCM) {
 		/* CCM PDU received. */
+		if (!READ_ONCE(mep->cc_config.enable))
+			return 1;
+
 		/* MA ID is after common header + sequence number + MEP ID */
 		maid = skb_header_pointer(skb,
 					  CFM_CCM_PDU_MAID_OFFSET,
@@ -699,6 +703,8 @@ int br_cfm_cc_peer_mep_add(struct net_bridge *br, const u32 instance,
 	peer_mep->mepid = mepid;
 	peer_mep->mep = mep;
 	INIT_DELAYED_WORK(&peer_mep->ccm_rx_dwork, ccm_rx_work_expired);
+	/* Keep RX work disabled until CC is enabled. */
+	disable_delayed_work(&peer_mep->ccm_rx_dwork);
 
 	if (mep->cc_config.enable)
 		cc_peer_enable(peer_mep);
-- 
2.55.0


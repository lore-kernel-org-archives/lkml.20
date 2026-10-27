Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125429;
	b=Ww8F4QF4cwNorR1q41wWc33NFkofwM+bxaKYyWCORHbPfwwIFDGTJPLhhwkY9oI0QfeK
	 OAmHiReUSvFdASN8WYLajZd8tLRAvVSc8Iu9zE5vN/s8v4LySmTdFpCNaYWzcXSXuYhoa
	 7QwEHkds/tsmsMIAAzysg58fLEDekQxa08F9l71JrHhSyCN5V6BFjraPgpRkF92vTXwZg
	 LbwekydCILoic5kpmvJGbn//32/cRtYtKDpwnr2A3Y+Gnmz+HXUHVlJu2rdyYNWWe5VnQ
	 ykzei+3Ld9/L9rHrFCWWDUD33IxJowpjtJCoeyBCOLC61j/qIDusKSi+u7aoRkWJxIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TUUF/6IOE/qjbX/YWDMVkBOiTQ2FnHlUD/9WGjmHR4A=;
	b=i49oN2FAG1D6OOsfrBBqHQM4olw6HeHqWHFqabgSIP7TK9H3rpsW/Rm0laOMFBkBfTBe
	 TOUnAJ8oh5b7NtG/sQ+SSNlt8RhLsYKueg/QKlRRwL1zPmWsdL4eNs4OrPkRp0GIqlLe7
	 7FYluvzC9XcfBKwz+6DEwzTQ2+qtd1hQmwOYs/SkokfTfrYiZyXSMjjMbzlWx19DdUyvG
	 X5TMQKeKJAn/Xx3VhZ4CGOIkhJJvmil3k395XjKYxumSzXwIqEingFZ0o3n5DWlNbjqtu
	 tKM5WyO7bDQOWE6iZ3xM32Y44PFVuMvIHoVdrqEutfWIag3t6/Mz7IdgfAOlHBfybtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWjxSQ2P;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AWjxSQ2P
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so1294615e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793125427; x=1793730227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUUF/6IOE/qjbX/YWDMVkBOiTQ2FnHlUD/9WGjmHR4A=;
        b=AWjxSQ2PbJHi8jbRrhgm7J/K5cpL447eGzuxCleBCDyaJ3waPEhSsqAJ88CLN1SJ7m
         hZIE13wmFJOtF1YOC8m5XalntfZNuS3YWSpSegciM/mLRIVWin/hRwGfZitcdLdDMESA
         d3fLGCPa9QQU2bl5aKVYrJo4sPsB4MJfspaSMS2gbbPo9qIWu/T9hwpZjLZLdESNZUsA
         8OvDj1tjOjefUIxsCPI3WGjr5G8L83nY4Zr3gJhCa9JL43fO9v8Cqon67tYj22AXZ4qa
         LW2rHJveVI6KJZFzTfiTL7y8YlwntuT+d0Tp9RljtVNHhbBpk7lN/t2xb9VdXKWWjkyw
         pwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125427; x=1793730227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUUF/6IOE/qjbX/YWDMVkBOiTQ2FnHlUD/9WGjmHR4A=;
        b=ZVpb2ngj6AhKSo6ymW6GFfDp/FpFx7OzyRpkkZJNkRGQIQttsnrCkV4g+2b4o7kqWo
         z+whM50R/FnzH1GqKTkIvFMpGOIEZdfYHjGWL7U09EbADrgzEuXwm48DjkoyzzibBjp9
         dBbvYszDnBoMQmWFh5pZJZiLS8cKesSYO9kX9mo7/wF9CuTe/41iaJXywonMcNE9SPvx
         0L0mMTniSG8mxwDh6LS6NpkB7SL0N49GeIkfISrXxfCI0ZjWiRu3tES7Bz7d8apbrhtk
         hBLj32sMws7hxMw8HPEna7oLQHp76qDrsr8GdoevbIHrUEbCZ+Zg6udFieFyaSj3/bsr
         WHIg==
X-Forwarded-Encrypted: i=1; AKwUvByyl87WzyFPDS9oT+C2LK7Iq9ZaYsJfZQW/67YjaoYzkW45uBGCgBFBvhzhdJ0S5wOH+s0uRgZKXaO4HBo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuZZoC2tIafbZveIukOT0h50fIsOp4KQFisKsLTd7iCtHijfaR
	xYbDbFtCSyqgpPMkpv/6pXArlEJfzQ6OmrLwGjl4kkjQLYRuwaNPfF+Q
X-Gm-Gg: AYBFou15PUX6Mbw5mwGR4CBJ/QEnVdGszLTQ4ndyY449xDxjg+9Y30bkjDkuILWAJiF
	1VjJ8OesCV1Z0IXvTXFV3kZe3rXk3mb4yYIikOl0dgsvcp46XxSTxESdAnu//f2JtdWS+dso0Ab
	uyRR2iGbj9Ngyo4jfO8ukEoeIME99zPVCfbJ4DI22It4tIugPNdvQxLBhdma26CJkx7dl014Y7/
	jVPlwerf7Ev4gyO4UnU3TOhbQUGkjQA4CFL8CcsS7l0GT/V1wsUzPkUjvs/PYzwjZHTEhCBKBa/
	FRQ0V8Ji1eg69LRzQ7KeEoE/9mqWtsCVCd0kfVlnqat5vsTRgfyWgB4ZdXVM5mYlbxvsaXREsRO
	T5PGiVmQy2u4hIUft23dJPu1zkngldiq6sYwC9LZK/vWabFzQXhEILPZ/AFC6nqkTxccHjq/gvA
	ISQinAxLTVJktPvxXfeVLszlFmzH5d/KzjCbmKZVOIaSNdb017vjfsDz+EfUyOgX71yq/vaQ2Ir
	RNyMRGzBhFNMXK0vxmO4r8arBe17dfaq8Y+RvM5hz9JknTYF5v67RMnDogwdZF15PjUxCyKgw==
X-Received: by 2002:a05:600c:4ece:b0:4a1:6517:ccf1 with SMTP id 5b1f17b1804b1-4a35ac9d116mr213058215e9.9.1793125427169;
        Tue, 27 Oct 2026 11:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:bf43:484f:97d8:17f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94cab256esm218495e9.10.2026.10.27.11.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:23:46 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pcmcia: bcm63xx: unregister socket before freeing it
Date: Tue, 27 Oct 2026 20:23:37 +0200
Message-ID: <20261027182336.383269-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bcm63xx_drv_pcmcia_remove() stops the polling timer and frees the
socket without unregistering it from the PCMCIA core. This leaves the
socket on the core's list with its thread and device still active,
referencing freed driver state.

Unregister the socket after stopping the timer and before releasing
its resources.

Fixes: 553d6d5f5b84 ("MIPS: BCM63xx: Add PCMCIA & Cardbus support.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 1 file changed, 1 insertion(+)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 1612b5d76975..275593a2852c 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -444,6 +444,7 @@ static void bcm63xx_drv_pcmcia_remove(struct platform_device *pdev)
 
 	skt = platform_get_drvdata(pdev);
 	timer_shutdown_sync(&skt->timer);
+	pcmcia_unregister_socket(&skt->socket);
 	iounmap(skt->base);
 	iounmap(skt->io_base);
 	res = skt->reg_res;

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0


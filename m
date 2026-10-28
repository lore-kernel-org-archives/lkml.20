Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205978;
	b=HxeUna8g8ic8Rw2VAPvhvuBuDuRI7DmTiILA9EhwHNUYIRuJI87cUpCuMbzXn/GdU+ly
	 27Ti73uOQKmM2UvJEBTSdNLbd9FIWt7CPibqQRRXhAbObODerTaX85KDPcw4ZDmAOGbBd
	 oQm2A5rOZQDnAwb19QD5CvswgUhYCv81re1us0vL1YnH6DFWR96nGYgRpwDYt0ZblGnWz
	 NyBE0V2QMpmjq5bSnZqAU/CKNIaiR11nvvamPAhilFZPLaTVn0rXbAn169pRpjS1MDMdU
	 sAUwMieIIbmdebRyVuWD6gA5j+hDnlqdufvKPDZBB8MV30CPNnP0Q3oN2TkEhuRA07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B4aeA1JDhDSlavAe3QtN317ZVxvJh8xk7OKR4/iEpbs=;
	b=gn0jcC4O+MXbru60PNxGx82fe41MS5ktvU1LxncMiYIIav54P/PwVlyrcjhHCplvaHV/
	 dwjf0Nq7ok/XKa3hRdUIA2oDcm0mmYn5aDVGTh9jcIAYA8EaHOAMnzJZd331YHoGz80dg
	 deYGdM02Jaudp6UT236kBsXxxnt6PAVALfAeojH6Coh9+H2uuPK2HkhgVwa4CieRL9srk
	 TevWfpi2YopzhK3KWxTIiMpTqW6X7DZonLLuMbUkrve95jlinYSS/I5cvuNeoZqPpFMw/
	 Qol/dJ1i6m+kLxbYAE8GfoUwogfOPG/HzTAnhQ7CDzIrxi6wOsfBUqU9ZIJTr7hqPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uddc+wrw;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D360A2606
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3D360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uddc+wrw
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso70088eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793205977; x=1793810777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4aeA1JDhDSlavAe3QtN317ZVxvJh8xk7OKR4/iEpbs=;
        b=Uddc+wrweG9QoyRAHUWEjoih3MObT1xTgzWxKwXQa1ijU1RY31WvoB3KPk84swdhKt
         7hQZjJUlmBnyVA2B+UWVswzv/xhqOfBTc8WtGejuJlv57PNaaIoX9AztYT0nG4s9ZSHt
         9P3fKf9ITq5iOFdHziqhBB27b24lEBi3sS6jR43yeJswvzWlLsXN02NQcLqkRmfhXOyJ
         Cv1svNjp2glvG/8VVUyvttRyaSzkRrkwwuit4HVM8FbMkM6erUKax806sx6cDK39JzUS
         /8smOndgUZASaaOvT18GW0bp9KmqAcrAHUHS5eFc6dxFCd7L/o7bEa8/QgiJmaZ0qQWe
         KJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205977; x=1793810777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4aeA1JDhDSlavAe3QtN317ZVxvJh8xk7OKR4/iEpbs=;
        b=Lcznw/Y/1Sk9P5lWIP47miCZooulFlNEVc9Bcp/wspNLOhkjpYgrpvr6RXwiNGJ+oD
         wOyazokPfEirnhQOGF0sDecUwGGkssy3Qae4+5rA3eMd7qxIwkl49gtJhralDHYrO6io
         +p4KIkdLKl5fVakNVQBetZOvWLpafLF0svW/wH7hUv1eiUIRgiOVxY6DEPmPERh4Szl8
         tUtIA7VyaA+FdbRGHaBrybRI8DTtKhmr6Z9t+beDSg3ovA5XNejhew4k/PtimOhxw4at
         Olf7X+noxygmSkmdxe0uv0HeCS713J8QvzDONkMxowLKtC2ugP8tWiC6i7ICs5E3mODf
         6Oog==
X-Forwarded-Encrypted: i=1; AKwUvBzmmkeptbR1hZTDI0M57lFDN4QR8G4icNsjg8r88PuHaRpr7xNDf4LhLKdJwePNGaZxPF4r6QNBcx7LgYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa425M7mZqNSBDgkPn0ECdhGpsuRVG/hb604N0VmGtmojmVwlV
	ITpBb0wU5iugywBe8CSyIdK8I06qewt4mEfWV7J2TTQoHGpaG2AVv+fS
X-Gm-Gg: AYBFou0mK7iIR3ZsgYEZMZ0RKUXYbT+VA/D/h41WcFZoKnEZ0nDxGFvVHcme11qp9aG
	USEYHYmvSAWSkKkCPZHNgW3YYUMFqkFfawE1WJLeybPm8D6U4o0+1m9kTCrRNvLZ1gWF0QRjT6d
	yTcznC+bOOnej/Ss6rnuGP2C8m4gFx9O4AOQPZF/kiYwXnxPUWI++Lg8LyifSSOe+/Gq0YWC8lw
	TyGT8pLDUflHgG+drN3emM1luKlf3Gd6hj+SW4JuVa/DL/7Vvhk1LEekSqQIzlNm8as1qsgN9Wx
	kd251QHCQF9dIGF6C2LHNJrg6qKgCZrUvkKMmR2U+s5JZyjt/y4RvObFQ5gzH3zm7GD3xf53wXH
	1PG+Q+n6TxBnFKXRQIk7gADdEpcdAldakS1ZIx0VzDBB6GIz4BZU0Nt2NCddQSvaOiL5SOydxVo
	6e9CPQ7UnB5oeYaN5D58o7H2sk/Z2sGnKSGJM5YptO4HHQYZb8aBYFD1HD0muy3AgLYsW6SYu3v
	d54SeskY+HQeqgcpfKKptzGQC9rPEizb6e7KBdzEH5FDUnC4ssffAAejFA/r1rzw2J7XLp+Ny+W
	4B9LbmctZhNTlMEQtjY+fxmI69HskIp6vTqmV2xlvkX12VbCt/wncN0pFa/q1gFb9IwUuvvTxp5
	Y6TRkx0rbSL+IwjXv
X-Received: by 2002:a05:7301:4d08:b0:360:905a:7c27 with SMTP id 5a478bee46e88-36a20417e00mr3738593eec.26.1793205977381;
        Wed, 28 Oct 2026 09:46:17 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm7821964eec.11.2026.10.28.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:46:16 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/vc4: dsi: Rate-limit error interrupt messages
Date: Wed, 28 Oct 2026 09:45:28 -0700
Message-ID: <20261028164539.3471833-4-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-1-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
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

The error interrupts (contention, sequence and timeout errors) are
always enabled and each one is logged with drm_err() from the interrupt
handler. When a peripheral leaves the data lanes in a bad state, the
same error is raised again as soon as it is acknowledged. On a
Raspberry Pi 4 a "data lane 0 sequence error" was seen at more than
50000 interrupts per second; printing every one of them, mostly to a
serial console, starved the rest of the system to the point that the
SD card driver timed out and the board had to be reset.

Use drm_err_ratelimited() so that the errors stay visible without
taking the system down.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 1eea60aec..be9caaf50 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1487,8 +1487,8 @@ static void dsi_handle_error(struct vc4_dsi *dsi,
 	if (!(stat & bit))
 		return;
 
-	drm_err(dsi->bridge.dev, "DSI%d: %s error\n", dsi->variant->port,
-		type);
+	drm_err_ratelimited(dsi->bridge.dev, "DSI%d: %s error\n",
+			    dsi->variant->port, type);
 	*ret = IRQ_HANDLED;
 }
 
-- 
2.47.3


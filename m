Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042220;
	b=Z+c+B1m46Pw2eeRLLktQK/rUH2dvbf0PdnsKGOmaFAxPH2RU+Mh8AysUcCwD9P+5Zn6Y
	 i9eBxygXF10rIcsVtfW/dKKkwuvRi9d+b9U2fg4Y6cpIZ+p007StkLrQb8itG7su3aeJf
	 O0Z/TZhY42eaQI81cgAiIWbrpSYACJ9yRocT1Zh8y5P4F9Wpz4koJQ1gzMknhWuCaWK1Q
	 j4ic8MueR6ngiucHdqiav5nolM9F8e43EpKVUYazCVLxYrYwPngiZORqx7ZQDVnrII0aS
	 MP59sfK+Jl46/h4c0dLpB2RmJvK6TJgN6GquYkYajYt2xHXC7zeSvRXrOxPjy64gmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H9O3EyZsKeFAzZtWZLEzjcyBe+AD1OsUYXEPFbUhLD4=;
	b=LbFq1dlwzHztREU/LUvzU0HnDsN1LCyr6FWRIMAG/Jlykn+gs3QIVxpI+gmRMugU5RyN
	 eYesH5//TjkeAhtBH0Gtmki2KU3RqeuhEIuj6dOf0O4pJi8ui7q4c2YPqq8ew8I+o+3WR
	 wlv/Nev97J+j6Y1farhYSIsV1Qi2zeUD0sTZ4zmocM3sGlJmoFZ65TGngPts8bXfcMpw/
	 cc17s3yNjDNWuyu/8+7RJU7qv3mUIQ01XPDqGmt+KukQmnv6FVvROQmT4w9SpJjr6R9Yf
	 6wQkO50M/4IjvGv5aaAQjevRpiMGo7HiGvePb1rza8cKDOiCHOqMV4mS/Gn8obDfEIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5uE8LY2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AFC60A2600
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AFC60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5uE8LY2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f036b17easo9092241eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042219; x=1793647019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9O3EyZsKeFAzZtWZLEzjcyBe+AD1OsUYXEPFbUhLD4=;
        b=f5uE8LY2zCHxl5CX/sParvcPa3mVoU4e8/qyGWBvLBd+pGXJW23jg4FfwtBvoSpeu9
         T3zEAX7Hjb/Pj2mLWZOro7ZkBbyce2/seJe0UxaQdOnXt6BcQxkQLuVjFKWHUa3eRMIN
         MaLq6X3FoiMJtrySViOWCN4RWekZND/QdBccdDAG1QOPtUvIHl2Ha0lsGKmILhicPNEh
         SYXkv/Bn7l6bo8oLBuW7trKS6+qZAWr19ye7PXxyxtS/jmKLMPRE3aCOF203nPcvkNf/
         prTe93/239P1Zjfnl0DNGNqatIr628wg5jJojqescg1MkYz5kkSvqcZEPnlqM5rXLZ7s
         hRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042219; x=1793647019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9O3EyZsKeFAzZtWZLEzjcyBe+AD1OsUYXEPFbUhLD4=;
        b=BEoKlv95c01DxKa1bE3b+4PMAeaI9yqkT9bI+7+c3IBVHPzoB1imvg6kmgksAqunbt
         MJuW/ZbTVHl2oxKEAHZ0oCEqJcnJYEvb2BKQuFxXZXPl5n8k5nJ1ie4+AnuagJJ+530O
         y2bDitqBqTNv113SVdxw0M0pm8qGCgAFnxpZtR/5UejLhq9EgpRa96MZU4uuj33k2bDB
         KScGl30jNlXvaqQsUzG4nYFS+QdVTfri4a/90ECl092wWZiyaL0NXia2D33Nz6IrIdmT
         z/3U6YgIRUOkBt99AG93qp78N7YrC2rImfzDn9PcFoZp5ToHElYcMcEAo+rQ07GAZtmK
         I2Cg==
X-Forwarded-Encrypted: i=1; AKwUvByBhGqE09yUtA5ZcEYPopuEdu6zu32+8unCI6lxZPxH5ve8p/Mw9A5ucVPPnUCusI42NI2pXTvzHfGiieY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKP0dOUv370lUoC0LFZLPZnETZcmPg1m3dhMwhsWsa1qY5nHmJ
	AunyvUEdrY2vUNMhBDCrmMrmRhYgPBHzp4kGwUAJHIXreeWsUqefTwW2
X-Gm-Gg: AYBFou3lui3y0aqYrIzK1xhPq5YVlYgqm1Kk9f3zXj1TGGxvB/Ljic8mwVhobjCJn5I
	VPzfrdxZKkvm55OluxgLJjAUl6vS+UG4T5/1avU4yiYEywbk23pJHnpM/C42weMeDjJ3OihNFPw
	cR2Aca1NzBiy0bLmwwawglurD2Hjlf6LHnqi+33iVWcOujCBXZ8KH7YJ5htkZmDDe/edteL5gsX
	fbIfFwpmVu59u67erNfZpcm5QtPgB9t4pu7Ro7Tn6ZqxR/sjjLrrJ48O+C2AjqKeesEsiD+qHhk
	DQXYef6vI95oObIxp3zNPTQ7T71SawGBp0CJj6d04P1NCL0Zu3H5+oo0/styI/JzQrlRSQiepbI
	AVcJQCqShCKSeeKM4InDKMrt42vejAOHkOOX2+nyjE63dcpen6ygVNCdHgPOuZLTlA2/2He7m+T
	qATsvXKxFlGjciZZP/Wpcy9SP2tuXv4K+MgZed2iM30aQCn0b8+iJxAnvQ9FHM92KpXwpSSRcpV
	oWJrggbO5JXUsl3/GwnU4ox4p/XOjAgzfUF4st2HBzIP065GYlhvMGu4jKPDNeBWelSujNVs142
	YG3RtDyW48ew8r7Je8u7
X-Received: by 2002:a05:7300:2301:b0:347:8d01:164f with SMTP id 5a478bee46e88-369e84b15ccmr18128253eec.19.1793042218554;
        Mon, 26 Oct 2026 12:16:58 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25348449eec.21.2026.10.26.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:16:58 -0700 (PDT)
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
Subject: [PATCH v3 2/4] drm/vc4: dsi: Rate-limit error interrupt messages
Date: Mon, 26 Oct 2026 12:14:56 -0700
Message-ID: <20261026191618.9430-3-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026191618.9430-1-henryzhang62@gmail.com>
References: <20261026191618.9430-1-henryzhang62@gmail.com>
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
index 5452b727a..face44a23 100644
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


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39645D91E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162309; cv=none; b=JmI5mvoJljoAUFFiUisVSxGKVMeVKNwgWUtfCmtVBV6kvJCZmbvFcpkWlTKqDIRbcoSwUKusNqWu7qs/XWOZzn9Y3mGfzDhJ/0NlWwi3KthXzRUd2P/0xfHJ7v3xO7Rq1ghnakJ29826Y59FaQKFF16scli/WbBLhxBKMMy2c30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162309; c=relaxed/simple;
	bh=FRLkAE1TRsicRIjs12TClJYKr9IHrbJZhraLwHHugyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjLmoaXY0NtiA2JVnHdnrnmSiaEjekASpbe3P6jgul0G/yuAnEd6sRvcTHCxPFjEOia3xZ9wsc9ifU/7ilPu7VNEr9rtf+QAGUzjKVTFr1NeLhz/od7IdJWL51tZWIPqzpvYlZs276I0xAC0NiPs+UXk2aqO7E1RWtiqYt8O1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ/8TFsT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ/8TFsT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1425009a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162306; x=1789767106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZHEbamxrCKNFud4RphEOhfi3p8kiH9hSf8teP/HbOI=;
        b=nJ/8TFsTS7MxmufBz1DiI5YpEsH+JlaJ2FYLfc/PwjZ/HWXOhArWnKoICLKT6Evaes
         ox1NrvppSW2QVCFEA+s0xhQdWR/4QznHHT0L1S+uLnmQmHtH3/0Z8cBYEJsltTakrDcF
         M5uSv4Bebv5c9oFoluZbIvstDQy7hDb8UNT6ZHV/ZwEdpne9NIhMZvrw6mcUHgaOWqPC
         1GGAz7//BwhckjUJgvr08o/r4Dez0zCzsS5GRcY/XbmNlC7QRkaFTrS9rrAm5MeUPYgg
         83vvrZt0FMGy1NCn1nL1FCjTlmiigcJ1wQCOGLhWEufKsQXjclX6874hM2wnBDR7UY1l
         4yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162306; x=1789767106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZHEbamxrCKNFud4RphEOhfi3p8kiH9hSf8teP/HbOI=;
        b=GfPDpWIoU/QI4rnNNGCPha1wuSCSCFf/YGTMhlpLaU+PhHrrvyBbwZom4vRaVp+oP4
         JBm0PDN2JWYjZhRMZga40BU737ESDVqlS5zVvu24K5IFyt9QalqHumCNMpIyG8c5YBij
         ZfC/eyAWn6lf345srluzFtRIGSV7eVO6hoQi8cPMpM05rtCwoTgi+YJU5W7bzuTV1hp7
         3um5qXie4pf96AX1+YBO5k1xX5IwD3FCV47P1/wz58Rt5jwJfbvsYrxQ9xp3L39WpT6C
         38qvnvIawqhd1EwJV2MiPyAT6u0hhW2H4izSS0bbuiEEf09dULE4vJTrIEtP4UojFBrq
         qMWw==
X-Forwarded-Encrypted: i=1; AKwUvBygG3S1o5CzyAkngCd9uLh5AS5If7IygHbZLSBFFPZ5+alQZuBmjxIuBnTqi+NvNfp1TmRgHodebna4bdk=@vger.kernel.org
X-Gm-Message-State: AFuF++mewMMw7HdaJ+5VSb6xgeHAiTZLz5g6vYHHLvMxEUUuCJtFlJHb
	2j8Zak/IjlXhNsXLOWf6yzYB32euV+DR+J8BaDr05SI5JMUl6ZJrN7vi
X-Gm-Gg: AYBFou2yBAwr4FLuOzrDOIpNSZ4wXmlUdhpdw5qE2BmfLzaSCcO9Lpali1cpH+IRGD9
	gxD6cVNb5ZAeXERvE0RqDjQx32QiIhx1H//4Fgk4laHhf9bwKIn9UxzscRp9JgQ+YWc7wPtwtQL
	9/3Fg3wKh2vb74OjXtmaRPoxobBqQoDP1RyETh+3q06510u/ZP3JbkByIo7mBW49G1A6wu1auoH
	z77eYiilbHM4Ol1SMwMay7rbYp6j2nnp8b2mVYYprkOWLFfDj9/LEBba/lgSGv5LJyOvJ5D5Uvo
	cdKO/G9Sw/31ygpi/V2W6OFowQ9lt5lI6ROjEX2z0cq/MfZZIUnGXjP8aRIvhdQUln7z6vvlfvi
	Ho945XBTGOX6M1GpKdwlhc0kylTx699L0Edoz1FGhbA0ypI2QZq1SZN1s6MTwS6JBZl1gxPvGzG
	Ts/VVIWWPYYE2xgpKzpPx0gIEhAb4Ax+DnydkPRd6ujci9lGeze+Pq1duEphEXv+ioEpTvpUyI6
	R9ybNqZBFH6UG8etD/vy0s0EXnqrnq7jeLQkKZKYmzckFUHfby6rH4aH7WDsqiLAqz9x2YFOmJl
	J3MInIgnCSUUEakiEO2FmAXRa9hraZRHNQmb+8OFaR2YltNN
X-Received: by 2002:a17:90a:da8f:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-39d9bc1007dmr8846016a91.5.1789162306195;
        Fri, 11 Sep 2026 14:31:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da6016718sm4261752a91.15.2026.09.11.14.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:31:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 ath-next] wifi: ath9k: delete channel-context timers on deinit
Date: Fri, 11 Sep 2026 14:31:44 -0700
Message-ID: <20260911213144.130192-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath9k_deinit_channel_context() cancels chanctx_work but does not delete
the offchannel and sched timers set up by ath9k_init_channel_context().
If either timer fires after deinit (e.g. during driver unload or
suspend), it accesses sc->sc_ah which may already be freed by
ath9k_hw_deinit(), causing a use-after-free.

Delete both timers with timer_shutdown_sync() before cancelling the work
item.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use timer_shutdown_sync()
 drivers/net/wireless/ath/ath9k/channel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/channel.c b/drivers/net/wireless/ath/ath9k/channel.c
index 8b27d8cc086a..cfb1c90eb4b6 100644
--- a/drivers/net/wireless/ath/ath9k/channel.c
+++ b/drivers/net/wireless/ath/ath9k/channel.c
@@ -1363,6 +1363,8 @@ void ath9k_init_channel_context(struct ath_softc *sc)
 
 void ath9k_deinit_channel_context(struct ath_softc *sc)
 {
+	timer_shutdown_sync(&sc->sched.timer);
+	timer_shutdown_sync(&sc->offchannel.timer);
 	cancel_work_sync(&sc->chanctx_work);
 }
 
-- 
2.55.0


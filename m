Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694746;
	b=3CjmpyXNzTRBJCI9BgQnyUdjctKfubrEE+tR4Fzq2UT2aoi0pzQVlbG1Cq5uWr5QRtL0
	 mvTKdgINluDUWygSYfTuq2FGBlyYKfHji2FZWUow5Dd/9uKdqLa70jZtaQ1lYWUkuZFwy
	 9ztJHi30qa+GS4wJU5M+f/3re4V6kxmSkU2NKSYlgt9KBpu/CSHCQaRVhHY1Yjr6JGqBA
	 RC67WoaDm0TGXGxDx/MU5Mj5mgR5uNS4B1fi3DeCklE9y7eLvljImx9WdL35uTHitjb/5
	 oMvY5vJv9SZTZCB/07LPMHKof6PcYd8c8ENwLzHg4fy2untKkiUdX+rwY3qm0evv2Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
	b=v21dKVj0fpxPgiLup35fFqgOUDarWzAibpadye+0d6T8pHK5PgLzZ3OMAVEXbf1BzW2/
	 4+sgtlWFQTbal95GKVPJTj+zxvfxF9vSuVwM5H3xurVDsaPF/Te/wqOiNt5yRKNks0RkD
	 1jLWG2bwh+56fSpDDQD2W58eHlUcWPB0zlr8bwMxL7qwgb2W84IYplkK0CfuGHIz0t6ld
	 gD3IhPKhd+tntzJWDK9rHTxNH7SaCYVa7PnSFY7aGBvGahvkHf9AEwWPdPOQpvUJqwsbR
	 y91/fJ9d57lStG8QumF7ydayEIiT8cz5rcnYBlpOxa1NyPcjjbviIilZoJxerQKiN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B7606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124B7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5fohdBx
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1891657a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694745; x=1794299545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=N5fohdBx1NFB9AacLoSHrX8kbHCWs0MOFlRa7iGrfcHrdu9N2ICrvSNW+jtvWA/at0
         0iQUKX8LtCxGZmPCnF7TakoIIzG2QtQom9Y8mi5FybXTwj+yrGJXGzs3R4WU565xPvqY
         6kTFfWOGhnFahW92OPvWAuDPs/0ByNgGPmx7cjEX6Yn2ZPZ51UAxbhv2ExJM3lSrdbvl
         Aav+HOMNmVy3U9ELqSoyECWxI/U/gIdxDgbnUdc+DC1NhC/ahaLM8YV051OMEDk5whKE
         dVYmHjFaaptVC9InyjtJ6HWO+aL8rbE0u9GSswzao2FfSnqDJ513az1Guv9iat4lzrxS
         WT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694745; x=1794299545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/lQc+uwRuDiVntqSHAzYirnLKbYOYkb92/IgHqdzPM=;
        b=mSUMVCDyjr6dRjStYIiea1VBk9Y7tAqk5ePIqsG3qo7nWavqNVWtuW1KnP74nwmwCZ
         oLP+EfPVVyOT2KdD4yvUk8P+QBx/zrFuKeII7y8pWsDkIl0BGqkWYJ0TWqxAeXtxSk0F
         xSpPNonk0xMauzGKzPLlUzy9rM431PI1XQ9vT8SiI/Aja2DSZAp7Ar0WtAoZpN9DuRKD
         MOizoJw8rhAZdbfkExSKV9RD3OGvBWVSj7qbPFIf5A/JYlj/N0FNLDVeZVwIbsbrlEbz
         znUOLss6/V4idOk7W4ZSCPI4wFgtvTMM3WxQCaaoAT6zPW1+S0fS5q2PQorBSNy09JnA
         QVHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyMe3JlcSbTfYvWLf1d1KbY9GT4b9LtADeWM+jYQk/fRhhIdrnY62vpM/GpU6icO6c3003+ieqySHsIjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cSQfAjrZDjAUkbbAuk8+qNmzonJjVsybLFPLvUroSXbYbrVMf
	hqA207qyybfvt9bOGCZwbdjqZwdVZS2R5VHaAx9vu1Ljuayo236p8INR
X-Gm-Gg: AYBFou0aYyGtABOvAPW5TKi+WLUgPJ+1kiTt/RO7PZJxbnWAZjbYTIu7XqfqfA5bfK8
	54EimS6n3iW8msZUXDUqz09+tPtLhlKgjAS3d41WTJBcVx6eyOCqUzL9zZIIPJPfWU1ggdRqR/I
	uGdCzZ8XKIU/7qeM98tdJdm30LXgh8N1v6h01Y4lbYP/Vf45jTl/7Ez+3bWUrlpn9ge8ZFUfuQd
	kqyzBbkeKYEcW+PXrlr05xZ5v4j0a+QmVLUI0+zcBxqYoyUi+IDXyxbQkb16/ZRFhaQBGzN6+LR
	Cl72vCgQEZO9OUi/G3FVM76tfNvk+WdDyWohXcWSuVD8tuBb6XY+S8QvbNrSvDxFTzGnRi68zmy
	MXmIkMpxELyXkGHdaNZ6joeL3XZoFLNLLAtIPd/xUySaKr1DtNWJeM07Na/ef45fUy/3FXtTPBR
	49Vwk9/rEEzENfkmw9t1LwvdVcr01TJhkRTdKALIFhbUgafTV35Mljg4NMGBdSJ9iFTfrKXXbZJ
	ph4bIxZAUsHix1p1/8Bnby0w2BwqCPCPJaD73AXOH+8NpqQD/H1wgwv4sm7iYPGoru2hi9ebtjh
	vGWcfpr5q8hkL6dT5VoLQi36eDfsHK4pQTx2KKIL11Th1ub8
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr9133105a91.56.1793694745256;
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5d7f82sm3232140a91.5.2026.11.03.00.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:32:25 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: qcom: hidma: fix memory corruption when active list is empty
Date: Tue,  3 Nov 2026 16:32:14 +0800
Message-Id: <20261103083214.1682930-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not check if the list is empty. When mchan->active
is empty it returns a bogus pointer, which causes memory corruption.

Use list_first_entry_or_null() instead.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073154.744365-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/qcom/hidma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be..925c912e0 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -176,8 +176,9 @@ static void hidma_callback(void *data)
 		queued = true;
 
 		/* calculate the next running descriptor */
-		mchan->running = list_first_entry(&mchan->active,
-						  struct hidma_desc, node);
+		mchan->running = list_first_entry_or_null(&mchan->active,
+							  struct hidma_desc,
+							  node);
 	}
 	spin_unlock_irqrestore(&mchan->lock, irqflags);
 
@@ -238,9 +239,10 @@ static void hidma_issue_pending(struct dma_chan *dmach)
 	}
 
 	if (!mchan->running) {
-		struct hidma_desc *desc = list_first_entry(&mchan->active,
-							   struct hidma_desc,
-							   node);
+		struct hidma_desc *desc;
+
+		desc = list_first_entry_or_null(&mchan->active,
+						struct hidma_desc, node);
 		mchan->running = desc;
 	}
 	spin_unlock_irqrestore(&mchan->lock, flags);
-- 
2.30.2

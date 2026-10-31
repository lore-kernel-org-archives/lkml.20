Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430618;
	b=49VpqCeA9VcF70DMrNkbDj2OqEHTnXPIRuxO5wpbL+5stZY2WAWmWa0FtqRoP+FXnoMG
	 Ti9R09KfUYPYhYXEIDNAfNrazXXuohXgvao6a2QhIBnb665UXcJQ/tDclPL666vZkQZyo
	 l1qgdbpZBDvne5lge1tL98Iojioddk8INx93GAj2GsxqqD0E4yBPD3ik693Fvoue/OnId
	 Hsj3bGKQ21TkHxRfIiq+x8sTWMdUH2BLbH7j16pftz8cBA5zyQ5EUI4cO10g5ONXDqSdK
	 a91PG4xdSPw7/v5/7Ug7xxPTMgCxKUYDPzQVzi7VLvk7pqpy4AwP86ul70Vt6up72gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7sbNY/WAMdhZH7Xnw9o8nY/TwGJho7QORrZFGT4Ce9s=;
	b=CkkJ6F9TuIHxWc36yEJjqpBbG7A9il7yhXTNYpUAJ+1B208fug0RG+dBdDMegt1neH7o
	 kbzx/z6IozQt9AzC+d/rWBf/6semddrUxFQHiA4C51BFcjgLFH4DIcbs08GMRXORHk4i2
	 XlHYLFTb6He8e09QSlK1Sz/iXdAFnZZ5y3hEQl8rnsiHgdAeuFKSG3HkQrYmz2Y84ujOe
	 CRi/YM+Fkkr6Ga7ubiYJU9wRe1beJG6WAgpcTcUcZVgWNa3yuN0SYgUITdUb8S+HmjiXt
	 Ku8Wo5f8p5m896AEnO5td5VJmVh+6tvDsRPnfg65GzqMKLaNN/XnjkWrg8lhoZs8jqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLM4ZQqN;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8C606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA8C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NLM4ZQqN
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2147458a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430618; x=1794035418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7sbNY/WAMdhZH7Xnw9o8nY/TwGJho7QORrZFGT4Ce9s=;
        b=NLM4ZQqNONPnpKieAdDSk9C/hRkzE8HmIXy8q/e7aW58dZ9rbH8X/YHnCZP7Jo7OHv
         +YRmTGoGtWVHK0Cl3zWH+Ucf7KvCrU+P5n/x/zobyRgMyoSgPA6v0S/s2MtYvU9N0M0n
         35d/QUI1i6PunuDhQrQzH68J4ip4ebn40U9QjRJZhwPGNg7ZsrBDVpSkZmXitZWPJuJO
         H1X5MSXbN9hXXW9isG52mxdmAjj8H9gXBI8zTv9PRIaXTdznlVY9Nlw/a1T+ahrGIrl+
         /mC0WfdrklOwn18QOFroTtBa8RambCw+e97xBGyu65JKtr9rTrrJ4fFdRTZJUMgU6OGU
         goFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430618; x=1794035418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7sbNY/WAMdhZH7Xnw9o8nY/TwGJho7QORrZFGT4Ce9s=;
        b=KU80nfCOCvKmPP4Wss09QUZir7ZUVUJWPC3KauoLKIZXpvkyuXWE5x18LCuVBVJ32U
         UXgBzLxUXe/Ih8SXlYz8FP+WsWp69XRXGugiLgl0ny4V74RUIjCH11VG1EexmRBG+RHd
         +L7AEtPOsM2+rUXqb/d0tOfAhoI0w82GQj3vmgl/kRPfDGqjwnRtfBFKfYkZoLbDeK2f
         k2SsHZN5bZMtVNenOxzncdo2EN0zd6IuCp+yGY5DhsEMFkN+JMaQfatb8YJCFPbjk6s+
         p5Gie1b/IlECphdbm/UKhZcY8IgUwdR+HE+bOGlivvOchsuXt7YO2cuDg5gBjonjoVxH
         IAfA==
X-Forwarded-Encrypted: i=1; AKwUvByHZfRRlllxZ71G9EEsd3SYf/u3vos8x8lixxqGU0gjLMS48GlmzfQWucELVKx4eTZ2N+/AYTx+HAuhduY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKno5oNp+fScMN/s4w9DDcoTDt8gmnXDSs40DE6FwHNsgNCcaSl
	C6x3WyUwoCRzFDbcXAXb8Zx4GkRQPSEFAz6iaF/LDgUfLcMrIeG8N/UK
X-Gm-Gg: AYBFou2MihWXdSIEWftEMj9uCn01NBGeGN9im2DYC/PPUCCnjbVjwe0ftd+MMG2BFDI
	LHGbppx0Zl8uEF1CSCDg74e8lMKHFM4Xw2y2FzcLvaOkW5VL06UN8DeAUmDFy0x/WOCQLdK/t1A
	KLLawoNIIUAIGKg6Dnr9w858iEQEfiTNGYJiuiu5yMivcO5IlmlGHH8JG5DbcirwB+Bnz+MLYFM
	b5cssWdzFOQeI2Znj4IGq1N7qrSSyb3R7Tnds8nusXX3jUvfrOiVODd5fX4Inz1iHwhoih6Leto
	NhOFTqv6Ijix7qFoENgQ/C4WJXJeVucZk2VVtWM74V+OuZp3PgZKNALHcghbPoGtiUSoZO4GRA3
	BvnQo6Z2KShkzenc70yP42vURbuVcpIa3ItfgYCyG0WuAZw5IWjANCVBxCdlQ3qSOZilwg8/XSu
	vP+xbNai4SxJtt8p43uB47DnB/0NXiIWKA7gVqMy/AjaQobE4SvweeySX7qkhO4UVhu34d7DCnX
	Z3dj7WbU8a/Pb+VwX3Ih9eTJ3A3lBwk0RcpQlGaJSwFpumM5bV1TwRXrYDmI2oLSetikoAINri2
	dekYZ3QRQPVNUf2/ERKSOV8pm9PFycFd4NbJ17vah+rhcKz9f7gTpE0l0v3eJsspLluLnXwdpyO
	PiVUa
X-Received: by 2002:a17:90b:390c:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3ae8985c4e4mr3656477a91.64.1793430617736;
        Sat, 31 Oct 2026 00:10:17 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae845432e4sm6670459a91.3.2026.10.31.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:10:17 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 1/7] wifi: rtw88: 8812a, 8814a: enable STBC for HT transmissions
Date: Sat, 31 Oct 2026 15:09:41 +0800
Message-ID: <20261031070950.425176-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031070950.425176-1-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
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

8812a and 8814a support STBC, enable it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c     | 2 +-
 drivers/net/wireless/realtek/rtw88/rtw8812a.c | 1 +
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 0f23498b5c96e406581c06a524e9f270873866ae..f7d7b66844862ff01533b8b640ed35738169673d 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1585,7 +1585,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		ht_cap->cap |= IEEE80211_HT_CAP_LDPC_CODING;
-	if (rtw_chip_has_tx_stbc(rtwdev))
+	if (rtw_chip_has_tx_stbc(rtwdev) && rtwdev->hal.rf_path_num > 1)
 		ht_cap->cap |= IEEE80211_HT_CAP_TX_STBC;
 
 	if (efuse->hw_cap.bw & BIT(RTW_CHANNEL_WIDTH_40))
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 781b66ccde675a96c41f69cfb80484ba67c20c16..55f1d3d3240be24580bdc4a7b3456b8ff8340e70 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -1077,6 +1077,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.rfe_defs = rtw8812a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8812a_rfe_defs),
 	.rx_ldpc = false,
+	.tx_stbc = true,
 	.amsdu_in_ampdu = true,
 	.hw_feature_report = false,
 	.c2h_ra_report_size = 4,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index fa02aa299b5e9925428f591a609db2d9f8627ca8..5bb55606f14a126806acb354658c150150ae0cce 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -2200,6 +2200,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.txgi_factor = 1,
 	.is_pwr_by_rate_dec = true,
 	.rx_ldpc = true,
+	.tx_stbc = true,
 	.max_power_index = 0x3f,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_2,
 	.amsdu_in_ampdu = false, /* RX speed is better without AMSDU */
-- 
2.55.0


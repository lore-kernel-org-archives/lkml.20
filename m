Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186522;
	b=FniWNZDsW5UhThw7Zuyo0zA1APxk29HjXWdfSGwtJQbplNo5LQ9a5nErwQrfwu2XNokb
	 M2EPpx8TewcBcMnRboRdZSOHXpH3ERJ2q4aGQJ5NJ43UbOV2cp2HV8dCnljrl74ruxOgi
	 E18XNgLsX/qgWtNXsVziwN1aRtChbHyrADedRnzI/AnxcXjL4tO9NTugez0Sw+NM++juR
	 8L1x2yn9ONupy63+cIZk6xhWbr/iG1PWvIskjSPiQQXc734pCVOXA1nGt+LuoTrYKyuGE
	 ARcfgbJg6/KjIFUsFD4KK6UNRL+ZBATTgp4/BsRMqLil0gLj+MpXhGXB3SbPrfQIpPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
	b=lkISQtnDocZZapdldt9kY8nIxIT+AYL5xjozevem4SSHTEinrAwOMxZ8wgu9HKeySTlK
	 14yK4UCyxEjo+2eYcIfR2sgTst0Zdwg9WDbBlRKIs5/grdP3NtDDpVHYrnfePd2+rG6Ub
	 C7g+PYJ6UQoVd15k1B4D7tyAW4vgyRLQ1jQRryJo0sKaKgzisWMlIlnX5QPD12p01q9sX
	 16WGPHabHIOY9a4vAbw9m87AMybfouOH2oFiIMan2F6prn2x/NXNyb4aTZD6BPmFtttVC
	 toYIAaRj2AgZZ0LPlmMyHXeoL7C8Yxk0XMfQ/XhK0DVufjMCargUzw5MmxGmGIaNZGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr57bwch;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C67606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C67606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cr57bwch
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eac75d4143so1160365ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186522; x=1793791322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
        b=cr57bwchlryahrYxmNM2IoqPJ2Q1T9K1P+TYBPbvlnRmohF5Z7bJDwV9TpkzIlZwO2
         ZbUyZLrP9t6ilN2/MGN016dF5bOAlTAhs22bhG4OLIs4qcaHQ71fLB/OAvF4Kp0NyUdS
         34EveiuL6ccRDMdenmBrlRJxhoWjsiZv2uahLIUaIh6WNQRe3JuX+17uXOZss7g2joP+
         bv6Be6vCb6FvTV9yVA+FT+Llt4sgyA3LrJc/oNNEJgw390LqDVYQdnwqFAgySeXSpgw7
         GM+Zeo06Asi8oqJ0KmFm8Ge6gRuvZqRd4R4q6+93svq3JUtSQmEQlJi6Uil7JUxrCnGl
         ZVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186522; x=1793791322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZt3QP8+mi+VPf5GhbK5xfKxIiB6KJlPF+IJ1iRM9OU=;
        b=PIIF5zzRaHv6L1M7iZClgfao8CWhQQOmveb3HuPJezjpmp2Y2m0dG/Kj89f+Ap7EaZ
         KxD6iVISODIHOJrqhMQDTZ554vMAHNOKgfjGEdjcdelLEn/DlVDPb6sOUtRjWZbhCeEo
         bbZCxqbJZn4RUoGnUX3Tn10bkCqXUl7THxvSQMNowl0tqdz3NI86c7FXQv/L/6Cz4BF7
         bUvEaqPHlxxalFnygUFbkw+tvD9F1dS8glm6Q+4Quwi4731bXqfPgxUbbhVUNHAIBKU7
         al/FCoLT8BvdUXRC/lAZmyAdgqzoyzo0whbvZNUewEyGKV1KWkckAM/8oo43d3Fhxo/Q
         Zryw==
X-Forwarded-Encrypted: i=1; AKwUvBxXM+6T9NdFSh8fj1g0f3kEN1/cl8QXLItLULOGWYIiiIAJvMxSwkxs3+qqEi2NNi+IyRUfFilQ7NLyj/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLWeb/YOMvXq4xk7AisSsTEbON7LY4otsVE8ETzUhMtHCgkZIK
	4P+i7n5Eo+ZmCptzLSP6KIpvmt82z43IF1snndrfx9JtDvqHmKHGBfmk
X-Gm-Gg: AYBFou0/hWay9gXHM0kP+vjwRnAIGvmuHs90ptviaaIzcq97evkQSy708c+tE95/qj6
	IPyPyAxRLUWTR0dnaQc947YX1MN5nn5sm520Aw6GBHyJxZH8sSUalwIGooFQ0Dw4qOIJypUfKRg
	mYeXl1lOqZSK50IVOEvCur83dj+hL4IFUkFIvSsyesAGNL2kjXLdrcq9lpd+kzg2H9RDpGhGspC
	NW9oOnQrOgs4E8t0PPsGtrswdi2SciSMPFWqbrUWoY3xRry/ja3wT9uNTUDT57WL8co+OXAzaSr
	o+X3IlDHgyzLPLhmlaYCMhIE5GbuSx5JzQxaXrUatOQpI/BF8xqCA4eGInkVH2gX64DXDoJ0Las
	k7ZrSATn9BBGvPY+GMGVMP6Ile7M30Ye19IHFPG9KI9aWhEsqqVQ1mHpxGPGCg7+BdPPyQsSbwr
	hJ5+42+LUHc5lBF8xgTj6RUXDNQ3Md+sIHVSMdOvPXGoVuk+bOFrEzn2SQ5x2jbZkGaYEZJ30d8
	hBnGzB040K7GFifv9Z9aI4cGMWLqX4YxwzPk0927qvqgcyDQF8CBQ13Qeif9N8uFDHxA1Z82lil
	gRjwExlLH+CL55XKU0WIN0VegAzAkocmBt0DB3Bo7g0sbDh+i2RX1KiI5ytmHDotjNcnmI8JCDK
	KE79p7U/Koyc8TwUi2TU7NG2MCa5j5frzQNUZzR5/czh7Xl/h0xMmRIWck5kE0EgrByxGZGUZ39
	EDtlybLDxsm22lJyPZbOk=
X-Received: by 2002:a17:903:46cd:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2eb0008e281mr37278295ad.1.1793186521680;
        Wed, 28 Oct 2026 04:22:01 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:01 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/9] media: i2c: ov7251: Use in-range PLL1 dividers for the 319.2 MHz link
Date: Wed, 28 Oct 2026 20:21:46 +0900
Message-ID: <20261028112154.855185-2-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

The 19.2 MHz PLL1 table for the 319.2 MHz link frequency puts a
pre-divider of 1 before the multiplier of 133 and a divider of 4 after
it, so the PLL1 multiplier output (the VCO) runs at 19.2 x 133 =
2553.6 MHz before being divided down to 638.4 MHz. The OV7750/OV7251
datasheet (rev 2.12, table 2-11) limits it to 300 to 800 MHz.

Use pre-divider 4 (register 0x30B4 = 0x04) and divider 1 (0x30B1 =
0x01). The multiplier output is then 4.8 x 133 = 638.4 MHz, inside the
range, and the MIPI clock stays 638.4 Mbps, so the link frequency does
not change. The Windows driver programs these values for the Surface
Book 2's Windows Hello mode.

On ACPI systems this table has been unreachable since it was added,
because ov7251_check_hwcfg() selects the wrong index. The next patch
fixes the index, so the two must go in together. With the index fix
alone, a Surface Pro 7+ (IPU6) had CSI-2 errors in 7 of 10 150-frame
runs, 3 of them stalls; with this change 0 of 13. A Surface Book 2
(IPU3) streams clean with either table. Dave Stevenson measured on a
24 MHz Raspberry Pi board that the out-of-range tables miss their
nominal frequency and proposed the same values. The 24 MHz tables are
left alone because nobody in the thread can test a change to them.

Fixes: ed9566ce1946 ("media: i2c: Add support for new frequencies to ov7251")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-media/6ae0e944.b6db0abd.16b13d.d261@mx.google.com/
Link: https://lore.kernel.org/linux-media/CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index fce6344b5120..f429de5f1f7c 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -174,9 +174,9 @@ static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_240_mhz = {
 };
 
 static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
-	.pre_div = 0x01,
+	.pre_div = 0x04,
 	.mult = 0x85,
-	.div = 0x04,
+	.div = 0x01,
 	.pix_div = 0x0a,
 	.mipi_div = 0x05,
 };
-- 
2.56.0


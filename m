Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C344B693
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371736; cv=none; b=CcCznoCR/Szro5HDemtPRV8oUJR4UJx06vuLUHeQMGLhDk8oHQ9DmGvWDiyFDTxDOFs4Y1MFyAlejboN6njmNeeXe3Qvv9dO/FKAAeiktStU4D9z9k9fmgdjTqGMQ8LZl+YzceGE+aBio40gnUKI/dHmZB7I9vrsLaqxLTZqAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371736; c=relaxed/simple;
	bh=DsHX2LZCKnEVLh0jcJ3cHqzEi/P8RRApIj3SMsCChm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwTqO2yvETzJv636LkmukXEY0WTnMlJZDy36kzXdMspjwyZIv8anb+LhNdi6bbmRZhSkaKP+cBdaneRPb3++y8RX2LouxxmVj9N2zrBLdaKFdS1Nps2fhhBVPapUXSf4ElACPegDq3J/leUGZ/WZ3yOY2cADmX2VdPkRcdjCO9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIKCIy3g; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIKCIy3g"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c989d000cfso17699e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790371733; x=1790976533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5DE0JGxeDqZIZp7U5YbtubrIM9R70QWPvzhrKHb2cI=;
        b=ZIKCIy3g9Zoh+Hio57nA4huRPLFnMTUrGsTQVaFi9qnrgPCXXbowyuuX4IyysJEzy5
         4mMfW1cVvkXLOyHjrScSNre2qRCMkTBEyFO9F9c8AbMHryjSHCOiKRr8IpDqz3w+Zatf
         2oiWdUWd4/PRw39OoWV9lKgRxCShVL0pLZ221VEBy15jpzig4p2Z6UqTPHwlC7PQi5oF
         tkI/Z0/fVBM16iwYgcCjN204PFMYvpl/M37kg9ECUtmBkTdWlPYjSLwutv/p20fshppd
         N3h9hb2geM3vyoHpGTFSTkwBX2ytUEmKCvQZPBHCcdo5noMVo+qJhCxJT33n7NADBPSh
         jwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371733; x=1790976533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5DE0JGxeDqZIZp7U5YbtubrIM9R70QWPvzhrKHb2cI=;
        b=L1k/1BsAMckxDkNulV5Cmr0bPssfmE+T2kE/kJLc2sHeMVKKGIo/clxgWcCcxTmRQf
         dfw2NcH26myz3m/PKgAovInNCV5UG5TpUXnz7OmDqNNBopOzIpOEhTLlYgWF7/WllO3s
         SwtcwW89RBl2jOy/kffQrS37IBLNRzO1U6YzM9ob7PLiFJjwTevBrlmU37ev9DAEepYb
         hGhzhTR4n9h1GfuoWhglVgBoF+I0RaeqWsN3YbIJvTawaQ893HwHQO+eXYhUv/7LQjli
         EGBpQ9OVdCO1VveFiuzmz9PbB6burVSLvaBK6Btb0etNLMfdsAm5WUOuDaeuCGO24Pyq
         rqSw==
X-Forwarded-Encrypted: i=1; AKwUvBxwsOTkzviMVjnHNlO/CWPLecZjgV6kGgVQdbb/F0lrLaOO7NIqhz29+WYvqTVcibsu2uVovhuHr/itERg=@vger.kernel.org
X-Gm-Message-State: AFuF++mr7tIMJ5Tab6J4uoOmDsAaHwVQ2ebsiJu04GXZQkyzQ9x2CAMe
	L8Yls1cBTfbJdPicnPh76zLQM5POHBz9UncIB6RrNQ8N8Rizo7LMlTkNccXkuYFvGZM=
X-Gm-Gg: AYBFou00I2soat7H/+5EFat2iyml5dTZrvkDc3RPgVJL20Gt22ezrFHnRe+x6dBE8Rs
	YPXv3s6yrJbIxPuCECU3V2+eU3Od46F0YA6HIMioJl9N+ZU2ID8t0n6XVhC6rwyfER6ev9oNN5j
	t0dtTO3ffLn7KJ+LREWnDujKPHFCgF0YM2CvoGT3f5ap59RP/RagPpD1678BiIOpQ2pA4nTxzi1
	7dZujDYBRB9M1tC1Q30lmoFZ2CkNkWYOQI9IYiHq1YTS5VrE8i3fkRJymh5kp1fBfmXmjq706vu
	hqwZhQyiA/ipOqY4ZuzXxp7lsC/jaUGwcw6cLH8dH4oLnchCvb+dHwcqf8SbQvdS8L8f63Sxtak
	mfGtTKuz0PgveP4vEcVSUgVLrg7D4BInUfcVuAw3+kYm0KZA0mv/LiMoXytQeE7iCXflDx+jLPl
	yVamEuDakkGwG0czs9EQlqNoAZhjnpjYJknI42HMvW7ouyR01aSDj+lEHGOV8CfObgZWf7fCxKU
	k69W9QrM6TaG1DzYO2yrVM9YWQ3KA==
X-Received: by 2002:a05:6102:54a1:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7b08e842851mr1125366137.3.1790371732886;
        Fri, 25 Sep 2026 14:28:52 -0700 (PDT)
Received: from Tifa.lan ([2804:1124:fd10:e01:ca0a:a9ba:b012:aee1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9af306sm382132137.9.2026.09.25.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:28:52 -0700 (PDT)
From: Carlos Junior <cjuniorfox@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Junior <cjuniorfox@gmail.com>
Subject: [PATCH v2] ata: sata_mv: enable SoC SATA LED presence indication
Date: Fri, 25 Sep 2026 18:28:23 -0300
Message-ID: <20260925212823.121415-1-cjuniorfox@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925193134.114566-1-cjuniorfox@gmail.com>
References: <20260925193134.114566-1-cjuniorfox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SoC SATA LED controller in mv_soc_enable_leds().

Set the LED controller enable and device presence multiplexing bits
in the SoC SATA host-controller register. This enables SATA device
presence indication on boards using the SoC SATA controller.

Signed-off-by: Carlos Junior <cjuniorfox@gmail.com>
---
Changes in v2:
- Do not initialize the SoC SATA LED blink bit; leave it to the
  existing NCQ LED blink handling.

 drivers/ata/sata_mv.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index d260f04e6..52e33485b 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -252,6 +252,7 @@ enum {
 	SOC_LED_CTRL_BLINK	= (1 << 0),	/* Active LED blink */
 	SOC_LED_CTRL_ACT_PRESENCE = (1 << 2),	/* Multiplex dev presence */
 						/*  with dev activity LED */
+	SOC_LED_CTRL_ENABLE	= (1 << 3),	/* Enable SATA LED control */
 
 	/* Shadow block registers */
 	SHD_BLK			= 0x100,
@@ -3382,12 +3383,20 @@ static void mv6_phy_errata(struct mv_host_priv *hpriv, void __iomem *mmio,
 	writel(m2, port_mmio + PHY_MODE2);
 }
 
-/* TODO: use the generic LED interface to configure the SATA Presence */
-/* & Acitivy LEDs on the board */
+/*
+ * Enable the SoC SATA LED controller and device presence
+ * indication on the board's SATA LEDs.
+ */
 static void mv_soc_enable_leds(struct mv_host_priv *hpriv,
 				      void __iomem *mmio)
 {
-	return;
+	void __iomem *hc_mmio;
+
+	hc_mmio = mv_hc_base(mmio, 0);
+
+	writel(SOC_LED_CTRL_ENABLE |
+		SOC_LED_CTRL_ACT_PRESENCE,
+		hc_mmio + SOC_LED_CTRL);
 }
 
 static void mv_soc_read_preamp(struct mv_host_priv *hpriv, int idx,
-- 
2.54.0


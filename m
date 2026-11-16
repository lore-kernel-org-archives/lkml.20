Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843166;
	b=fJeK1wagVZQt/O94A6BQMdXZ8KjdMdC8Is023b0IdHZH+W+0ZyAc5FD9g3jnA6dlb4OQ
	 gGSkI/EY5ms484DsUHR5dqCvBr3bBTXoUebBwtuhGyilcYh7sWA4s7t7bdXMNnFPzVGlh
	 pU5P4Ce8s22DJUAZ4/jWR2E/oQzuCCMeY60no31Cyml0B9Mt+r36gCRg3fjBjrVTk2nl3
	 05nlkBrhl+Dv4t2VK+u/U/MpRfO4a8260RoULglcjgEsoupGgxnkiD/P8v47sQiIQPq20
	 NwuN3c7KNOecA14Hscas4qokL9ed6zDfyjsoDQEqSE0Xe302wCdurIdmE3vAnj3llvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pFxqYSIZbtjxl66DM/SuqHMnpQJOwfAGCQV6L8DRO0A=;
	b=zCf+ziaVcyAQ7o9ysjknQtRoIUgxUAPHitCopXWlY+PepIPw7Nw6VorPB3PVnGm4/fh8
	 CdPWBTnXuvCEjapRnp5QeQGS/ZZ/tNyOI3xRYRymvK87M/bm9t2KzQG/Zdjvf6ReJeb8c
	 vK+fWWt7RLeY07zp4ecymUtqfJAPRBj82LT197vl+YCdVJa9GDm//W6MJgBBY1HC25Dg3
	 BmsYoRnfvFJ86TH0N0FS3C70Oel2xm/J/dhmBEsgsHH5lfkw5+OjvswYaN0r5hx8ifd7W
	 cmkfRvFZoV16qO2sgV+oDXwQA491rAyPmWANzqDnevuCrI/e9PujnN0dolnSEGtxWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeIHlwWQ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5A606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DC5A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zeIHlwWQ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so11008625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843164; x=1795447964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFxqYSIZbtjxl66DM/SuqHMnpQJOwfAGCQV6L8DRO0A=;
        b=zeIHlwWQZ4QY1bRpBaoTCXcqiL4Qi6Tb3bqHBKqdY1TqdzhoY82EaNzxLe1nz9QMMl
         wJE2HE4+07eRXT2uCD1UN9mOuWFiHZOxWkmH9lNA/6nW914asOLtEqp+ALUNNMXrsepV
         kXJPWW92NUXkEfJoVD7wHLC0PN1oelvbLZS5+MnE7yItjPEI4A4JHa82r5wzkS1ByLUf
         BfGaFX/FDxDbGJ528ZVfNAKAp5oTPD5CVnizcp3F959Pf6lFDX6HJlq2jK9gy+X9vvem
         e7/QGyGLauzSmApH/q9NeePzkVZpEEsB4GhlOH3eUDnxz7wsE8QrFj1PkcykmzzuXUFK
         qvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843164; x=1795447964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pFxqYSIZbtjxl66DM/SuqHMnpQJOwfAGCQV6L8DRO0A=;
        b=GXuOV29z/5QGjFHMmF9GdJV1dYL+M15lbujSiVGU0d4cJLst2kB2ghqKmxEsLqiFMq
         3x1DZnzhhmMDYT9ZUZZ+pcOsEvWaAAeWeA/DZJVpgzsx20forMQc/twx125R/dNlSUZF
         wRpWPOmmruW19QE+unYPiQFTobQ5spEk5y1Mg937n+OEx1QpHbJDyFQ5w9eSjUPsW9tp
         1HP2kFNn1PEoa+sV4GvyUBJ+hg3ZLSG8E4GjoKEPlTbTjwAHzh/z7jyJM4MNU6B9zhPp
         0WG6Ic1nj6kswigO1c4nkpkslXg1KA0pvOo0wVC9ye8ICCK1Uvip8bd0tZKJXbNqns4t
         ZZ8g==
X-Forwarded-Encrypted: i=1; AL+hErEL4TMAEE66bEfL8LyC2nfBb2vfsopjgHME0/yNvg32gzLnBwAJc+iEuvERIa/G8xWSv/hgxej753iAy4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9A/eX+Lc0fvw58a1WTKh18TvakWl7Xga2B4cDWonh6sJEzYHW
	PeEcnRgFDBQiDoJzbJY7GLWZFv6sx7trTZn9yMfwL979JgnSVOQip0iZ
X-Gm-Gg: AYBFou2Fg4UbP8pvXLzf+pKxesdKEuHnLp2hh2JXREmZS7MH12rvRpcS7o0UaS2dOBa
	M0uf1GI2DigT+ca55JB1XH+czrAPoG4vuIWpnIrByh6A9ZfdKFVaKR5AxintB5l8YD1rTf2HSEx
	zQGjnyTR3WRw9+HnLOlsgmXLCOYj2t/LbE/SUgDKXD/eN64Ulsa0NEaPVVe/VqDRoX19glNX8y6
	Nx282i9NFMxu7Vxw9eG7NleVmUQPCzd0OKD17Cbo6hojoumAPeA7zc9V+vklBgwem213WW2Xbj8
	oSB4xQLkrXG++CAAFDlQNLbfHsJUQfyJ49cufRdZKsvdGmfVu6NXt9LQl8PS8vTIVZ38dX/JUjd
	AV63jJTzKm6/73M7Xth6/M91QZnJUNsE5gB/mhwDnrd3JT00FJnOsEvERHOLRA7ysUPLFR/HETs
	QsRHIQU0Jmhwa7YOrrb8H/ZFF4auXK4W6nPsw80HZip5iYPIpnbfyeieo5Ze/lHSR6w01A0O2oV
	Rdqr9EmJ9cwJinKeV8/PV9AbXtPNok3be1k8KYtf9eGHbpRz2gOmXFs5m4iDH5dqOsyLzKtbWGU
	EQUvlF/hm2LAijCGfU8n5BieOf55g4ObkNcCf+WAvhszkRsFsD6myvQnL+eaPJ+MNx7/Wb1aQ5g
	=
X-Received: by 2002:a05:600c:1c17:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb6752853emr169384055e9.17.1794843164207;
        Mon, 16 Nov 2026 07:32:44 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:43 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 2/2] mtd: spinand: xtx: add support for XT26G04C
Date: Mon, 16 Nov 2026 16:28:47 +0100
Message-ID: <20261116152847.3658486-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
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

Add the XTX XT26G04C. It is a 4Gbit 3.3V SPI NAND with 4096 byte pages,
256 byte OOB and 8-bit on-die ECC.

The status register reports the number of corrected bits in bits 7:4.
Values 0 to 8 are valid and 0xf means an uncorrectable error. The other
XTX parts use a different format, so add a new ECC status function.

The values come from the XTX XT26G04C datasheet, Rev 1.9.

Tested on an STM32MP133 board with UBI and UBIFS.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 drivers/mtd/nand/spi/xtx.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/nand/spi/xtx.c b/drivers/mtd/nand/spi/xtx.c
index 5915b37b4..70f853678 100644
--- a/drivers/mtd/nand/spi/xtx.c
+++ b/drivers/mtd/nand/spi/xtx.c
@@ -22,6 +22,9 @@
 #define XT26XXXD_STATUS_ECC_8_CORRECTED     (3)
 #define XT26XXXD_STATUS_ECC_UNCOR_ERROR     (2)
 
+#define XT26G0XC_STATUS_ECC_MASK	GENMASK(7, 4)
+#define XT26G0XC_STATUS_ECC_UNCOR_ERROR	(0xf)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -138,6 +141,21 @@ static int xt26xxxd_ecc_get_status(struct spinand_device *spinand,
 
 	return -EINVAL;
 }
+
+static int xt26g0xc_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	u8 eccsr = FIELD_GET(XT26G0XC_STATUS_ECC_MASK, status);
+
+	if (eccsr <= 8)
+		return eccsr;
+
+	if (eccsr == XT26G0XC_STATUS_ECC_UNCOR_ERROR)
+		return -EBADMSG;
+
+	return -EINVAL;
+}
+
 static const struct spinand_info xtx_spinand_table[] = {
 	SPINAND_INFO("XT26G01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0xE1),
@@ -249,6 +267,16 @@ static const struct spinand_info xtx_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
 				     xt26xxxd_ecc_get_status)),
+	SPINAND_INFO("XT26G04C",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x13),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&xt26xxxd_ooblayout,
+				     xt26g0xc_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops xtx_spinand_manuf_ops = {
-- 
2.53.0


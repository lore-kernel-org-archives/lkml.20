Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0150D4AE8BB;
	Wed,  2 Sep 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368413; cv=none; b=Hb5wkJp2sTNYD2M+W8nyv5LTu3gN1L3wxmOYDRgZZUiIIj9fGXRsPYJ0JNlJG+eL8f2RZhQyxifEt9WypElZgORPhw62pgkNiuOYu4UwSRvb2Fx7Ea7we6uB8Teu9kxyCwERUKcP13KXV0hhr8SWezMbFQguU9wDPHP9hciVH+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368413; c=relaxed/simple;
	bh=pzdL3M2B+L9ON2O2MF+TetYK56h44dRGRpeFtW1pamE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIBhl2T1yl1Dz1p3kF4M9rNSt2nKgZaB0B1/TjoSo5vOJapBuUJ0xDCSjqo7KwbQQUbkpPW/kA8Sadtcvh3LBgCaBJZd83gBp5MVAJAGsHnQqPCyazEwVnEgx76CuF2dUbc8y9fstZtzLl8IfeVPcxlmGzpwgfJ4gQJQjfLSw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GCvglVqf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GCvglVqf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BD891A1977;
	Wed,  2 Sep 2026 17:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FE826053C;
	Wed,  2 Sep 2026 17:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98AD511C795A7;
	Wed,  2 Sep 2026 19:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IWMiLXP2vfrqRyQznAWNKhIoOiuG2w/T2zoaxLRzsUw=;
	b=GCvglVqfIAwaR67asJsY+OmbUnBoAqpWJc81t/t4E/VrtNfCCsAV1TV+LUflrKZG5GWcWa
	951tYos2WtXf79FVQxap7kD9M5PMSn0yV5zQ0MkT7RVLwiXoiGE6bWR4MxEZf1IyYof6he
	P8zJvV3n5vlewV9sfh9DQ+mhfAwVef4nldUJNYcOrNZcWJlNCin3tWrNFyyJn6dk19vury
	eJzf7ROmjd4MJQS9nH2ZcLXcoz8rjYK1hUeYeHu1n/kXlqJhYA6cVdPs+HG9urxQjEhmce
	7GCk6snYu4up7o5iqJSvTqp5W/AqnYIaMkKrG26vy6vLeOYmbot7bUpMyGXz9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:22 +0200
Subject: [PATCH v4 08/25] mtd: spi-nor: Move the SFDP header structure to a
 C header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-8-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The sfdp_header structure is currently defined in sfdp.c, whereas the
sfdp_parameter_header structure is defined in sfdp.h. In order to ease
the reuse of this structure outside of the sfdp.c file, move this
structure to the sfdp C header (.h).

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 11 -----------
 drivers/mtd/spi-nor/sfdp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 87b2d0a0e9f4..c40099a27cb5 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -34,17 +34,6 @@
 
 #define SFDP_SIGNATURE		0x50444653U
 
-struct sfdp_header {
-	u32		signature; /* Ox50444653U <=> "SFDP" */
-	u8		minor;
-	u8		major;
-	u8		nph; /* 0-base number of parameter headers */
-	u8		unused;
-
-	/* Basic Flash Parameter Table. */
-	struct sfdp_parameter_header	bfpt_header;
-};
-
 /* Fast Read settings. */
 struct sfdp_bfpt_read {
 	/* The Fast Read x-y-z hardware capability in params->hwcaps.mask. */
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index e8ed814c6530..2cbe22246c5e 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -149,4 +149,15 @@ struct sfdp_parameter_header {
 	u8		id_msb;
 };
 
+struct sfdp_header {
+	u32		signature; /* Ox50444653U <=> "SFDP" */
+	u8		minor;
+	u8		major;
+	u8		nph; /* 0-base number of parameter headers */
+	u8		unused;
+
+	/* Basic Flash Parameter Table. */
+	struct sfdp_parameter_header	bfpt_header;
+};
+
 #endif /* __LINUX_MTD_SFDP_H */

-- 
2.54.0


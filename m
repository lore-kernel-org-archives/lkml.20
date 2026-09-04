Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A2511E8D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542365; cv=none; b=PP1W755EEoZCjiOV2JGCSQIzMmcjtBux9dpkHoY2jIq6NVVjHEuB1nk5T/aUt82c0m2nbMF1vlEuOuEFIc+Tz4WG60wVHSlLGkp4c4YKxXDWqLRgTA7xk15sL2us04PobIEIUcry4qevOvoUURKL9GiV83KasHnw9g3VyAoQp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542365; c=relaxed/simple;
	bh=lc8xljUMUifeQGOOdp8YQkFTcC+eku6DCO0fh2jVcKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHN6pKx5+iL60MW5SZJcG4csrIT7ZTzP5AsvHoGeRrvlv1NqusShYqJv93uvdMXTiGsxoyxuOEhR9kLCE13p1lm1c6cG33Z44X7KDu1uGZ+qLzypAfgk9wJgWWkBnhwate4xBtYuh0y5ynwU5W0ejlW99xlP/rQjvgZf18NesYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U4Q2yPna; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U4Q2yPna"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5310A1A19B3;
	Fri,  4 Sep 2026 17:19:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 209046057F;
	Fri,  4 Sep 2026 17:19:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 329B711C78705;
	Fri,  4 Sep 2026 19:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xzkxgf/mTYzyxWphx0XPaHi32gxU0RoiOilriNHZwuo=;
	b=U4Q2yPnaMj/TRpJZoPLvfaSr1YPdJYgDrAI/O6vDOqhFnYgTWLweIHnHLBjFBVsGXyh0Vh
	ucTQjAVzwaO3EcGBX6MYvJtb1q0r2QzmssVXaEnh6tmxRh2sZiYBnXYpWQ/FoVHBnGx+5l
	YstU58usPvneocoNDp4xBvaXIx5NqcYmH8VPOdnZpuHzILIbWMhYQOtmKtcZ+nCdLTKfyA
	+Nm8CgxJL+iZyHS/Tqol8lgsZ4M1Vu4XqKs4hA9X6J90cS1dMb5DpSpYUowB0UfUNVu7PW
	NLR1ldOMjv5eMfJikQvyZ9mptO091z9/YeMaKeq1zWvrdhvmXHT3zqYXDjNFcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:58 +0200
Subject: [PATCH v6 05/26] mtd: spi-nor: winbond: Normalize names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-5-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Winbond chips cannot just be named eg. "W25Q02JV". There are always more
letters after that name, some of them matter.

- W is the Winbond prefix
- 25Q is the type of device
  -> 25Q indicates a quad capable SPI NOR
  -> 25H indicates an automotive grade chip
- 02J is the density
  -> in this case 2Gib
- V is the voltage
  -> V means 3.3V
  -> W means 1.8V
- The next letters (either 2 or 3 letters) are completely irrelevant for
  the software and purely indicate the hardware package.
- The penultimate letter is the temperature grade
  -> I for Industrial grade
  -> J means "above" industrial
- Q, N or M indicate factory states (like QE=1) and also the DTR
  capability.
  -> Q and N typically have the same IDs
  -> M chips typically have a different ID

As a result, W25Q01NWxxIQ is irrelevant and would better be named
W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
etc.

Make that list uniform before adding more IDs/names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/winbond.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 13a2fcd703e8..ace9e620bfa6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -301,7 +301,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwq",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIQ */
+		/* W25Q01NW-Q */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
@@ -334,7 +334,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
 	}, {
-		/* W25Q02JV */
+		/* W25Q02JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x22),
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
@@ -372,28 +372,28 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512nwm",
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
-		/* W25Q01NWxxIM */
+		/* W25Q01NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25Q02NWxxIM */
+		/* W25Q02NW-M */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.fixups = &winbond_rdcr_fixup,
 	}, {
-		/* W25H512NWxxAM */
+		/* W25H512NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H01NWxxAM */
+		/* W25H01NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
-		/* W25H02NWxxAM */
+		/* W25H02NW-M */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
 			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,

-- 
2.54.0


Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E00517BA6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542372; cv=none; b=VueOu8Yme++YBbjh/sgm4pvmFN7rM2cpdmkHfdLagTJfUUSvp4D8nQdWuVpia9xZa+dfp2c+wOYOnt1Wa6jzRJxvbs9mqTb+4LckO3cS6piebVMzeOwUtpvaewpbGIvwoBI3QKk2i2rXSDF6qGa2bTMvfx7zsPjHE9JTBjKTmm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542372; c=relaxed/simple;
	bh=/TgX22cSPy1ILwTx4h5C9VXyyF7WyVeP+hBZ1t59g84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaFiSyy3vgZGfwlYy9X+h50pmL6xqVMJXvyAfTPQespwOV4sEZjG53ogf7aNJ0DLEObsOb45aTC4DmMR56oQgkaXmEyn6Ec6XpiNn9ki8alTCaUQkdTm/ODO2g4iOJRIvgMxo4pM/e8lQtbMaaup2Mag+U2YdypBuOZxV8mYJvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VZ35fh7K; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VZ35fh7K"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C3D61A19B0;
	Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A0A06057F;
	Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7B4611C79BEC;
	Fri,  4 Sep 2026 19:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sKh4l/MPCUBkj9G4diEXPiEht/7smJGXXwcH/6YLYOg=;
	b=VZ35fh7KM2HoIYdtOIXl8xRWC45ynY6KqLdfoPSuHArFTjw1KPpm26GoG44Isn2pCYjmGO
	PiRswQmdOXgBZQBTEoPzUnzo6lBQ+ba31U/0hTAPWVSlYYYTLeolpeze29UOKItcHLWvdx
	sNIJ4+mdGiMKbvbLo9IO61KdvcFD9LstYjCAY+VCICBMHXDbT7eDgKFaAXUO/ZZj/H8jro
	ny2HbNiYmW76sRYyDjZ9Zsm59WOBfEPr5ut9iULLtiLew+/PP40c4dU9YTZ5oZWdrSyYg9
	9khwozC0wb2o+Gdrcsjt2pnj7SYPSbCAXeE0/kbePVgNXAsk49kzZW5OgsDbnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:04 +0200
Subject: [PATCH v6 11/26] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-11-bdb282f42a47@bootlin.com>
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs.

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 2612 KiB/s
page write speed is 2509 KiB/s
2 page write speed is 2560 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 3033 KiB/s
page write speed is 2895 KiB/s
2 page write speed is 2976 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 78a4254357e6..484a2d87a4b3 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -307,8 +307,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),

-- 
2.54.0


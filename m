Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A9A56B849
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967573; cv=none; b=gYlSUhl8apn7UBGprMyZfepjHjT2XObkQP8Od5IiRXj7e2Do+K2Ip+wKYo1UbtXZwq2IE5ayxxXjz/IP0xJxeCO+qpYebJyiRBuzdBcDZrduMymMuxwatrZUIsCYGMP4SkEZfy0VybezzFBWj+kV5sfgKmXJf86j+rT+xsi1XPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967573; c=relaxed/simple;
	bh=Nun300RwQnZksLzRvNqoPHXDt1RAK/iUIi5qvomWc4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrwyjyyfe1VOrcpMlqZA0Zxwbma8UsobagxETqi9IdQD5VV3C8yCF+1CF7MltbadgszUqfYK4CkQLn/GDutW5oj8y5GIMiJ8jP2/BQAzcMyxEwHpCmQYIxc+u8wEzDyA8vi9fw/mcb+74YUrYxUePqqLJj6Tp6IwxWpJ5gx1if0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0jXSHp73; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0jXSHp73"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E6744E415B5;
	Wed,  9 Sep 2026 15:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C6C960448;
	Wed,  9 Sep 2026 15:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED59F11C7AF93;
	Wed,  9 Sep 2026 17:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JX145afNqmwx7gx0nctZs7OY5qzDSHefsh4nXWmrx18=;
	b=0jXSHp738jOPFFhXTRBsYJT11m9ADic8WCOnEbPw6+7quoC6NfD1SF4gVolzU2+uHi04p7
	50qYGeMC1AvfNxzku9HKf+uDvWlfXv62TG7FOESxcf3RaXmIKeG2HcePOw203f5qI6a041
	6xSS4J+3c2VHL36b9xCYx/k0KAX6oZR0a/rGZq1g2AymEd7Y40R0F8fFOcld2d+hkF7Kck
	nJTIgyGhEO+8J1sx8YCD6cyNmb8GAqMHCIt3u411Bpc7+IyDnc6a3URr9IZoWKnsd9GpFJ
	8Ee7faOAXJL0qF76i76uuydt9sEgTfZ2U5BVwXoBuaWNwqP3ZxvZoJIx+122Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:40 +0200
Subject: [PATCH 09/25] mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking
 information
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-9-c1b20c39dd1f@bootlin.com>
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I do not have any W25Q256JW-Q/N/M in hand, but since all the other chips
from this family have the same locking pattern, we can reasonably expect
that these chips follow the exact same rules.

Add the missing CMP flags.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4ffc7a39ac6d..62f69e868d7d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -348,7 +348,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-Q/N */
@@ -441,7 +442,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		/* W25Q512NW-M */

-- 
2.54.0


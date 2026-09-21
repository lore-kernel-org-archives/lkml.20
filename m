Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C037DE89
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973062; cv=none; b=TZ09Df/GagH0ehjqaEY8uLIkotLkLmrvFq30P0BQHn4zm8LBIOlJbHdlTgt2rbknHYFUFP9kJML/sUm867zrXcZPR5qAQoIUxNCrNA+09fVKsYf1BqBC9kWDW0XEl6qc4SSmMZCzwoyFZVCTVsVFBf6QIzqFnB9INAYugMq33aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973062; c=relaxed/simple;
	bh=rGA6PCFrgn1YoEdcI3pQ1J/TTUQ902BDeUM++kvIz5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2GcmLJh/kmUIgQsPC28c7OSl1jHm7Gx/GYM61kmTZ/RayBqaCrhWlrV+egKLy1EIPxkxspaEYJlNTm4QEZGJ5EEFUv0VkULtx4OI/3/JgcB0TJGLWLSCCRYEUUC134dFJqncUUmhLkX9FXOqmooOiJb6oL/waNBxywOd76nvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LYnqliO9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LYnqliO9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 93C0E4E40C5E;
	Mon, 21 Sep 2026 06:44:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68D0760339;
	Mon, 21 Sep 2026 06:44:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1497F103290D8;
	Mon, 21 Sep 2026 08:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TNwgarWq0JHZs1SD5eqs91+wzorfos1+poTgxbfbpGw=;
	b=LYnqliO9jZ8rtoqXVLtla8glc+BBDa0vMKZ7lAnexw665HcqpSvBpqQauolHad/aCtbnPJ
	LuoWRlbsA4E9Q6/TchSajT7Ocq74Uz7Gbt94Ounfh5cdGhZ3kIBroFrAE/nXZbQ9Ew+cSP
	sr2Mqf6SL+5tEcJhnD7q14/7ppH6OunYCpwGC6ifNf3Sp/9ual20HnIPw/FZq5mpNdU7nt
	VrktNXwGeJdKBmPbAezglatfIF4iRfBq6bAvONDeb+VxbfaAKbr5z1/GV5XkU0jKCxyzd3
	e0WFSQynL90CvA3tggG9o75C6PLNEu6vMEos7leRyk96+uvtg7wSE71Y14pcpA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:52 +0200
Subject: [PATCH v3 21/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-M parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-21-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

There is an ID collision between chips of same density from the JW
family (which it self conflicted with yet another family) with new PW
parts. Chips are very similar in practice, it is mostly a matter of
electrical differences (mostly power consumption being lower) as well as
the addition of inline ECC capability for the higher devices (> 32Mb).

Chips with ECC capability protect 16 bytes chunks are against single
errors. In case a non-aligned write happens, ECC is locally disabled
until the next erase.

Another significant difference is that PW chips identify themselves as
supporting the new SFDP (rev F) QER field which forces an alternate
write SR2 opcode (0x31).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4c9cbe0240d8..c1792b12db63 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -684,6 +684,10 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_with_ecc_match,
+	  .fixups = &winbond_nor_ecc_configuration_fixups },
+	{ .id = SNOR_ID(0xef, 0x80), .match = winbond_pw_match,
+	  .fixups = &winbond_nor_partname_fixups },
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {

-- 
2.55.0


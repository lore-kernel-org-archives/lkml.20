Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572B44F557
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912900; cv=none; b=XMqAQ+4ui8SqI18E5Zayt+x6g0qXNzEwlDDQeh+XA1i6rHaBPLFALse0w/bagn4Q7JDaz0owCwhAiVekz5OtZ/vzHo4wKdlOij2WkLQJ9guqb4UhP2y4c31dYGBm0UdCymRFXWDOr5q53R1ClVy7aNG91gryD8agfuviLoMqGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912900; c=relaxed/simple;
	bh=yEGCqjKiHy/H+ci/K53gxQ3XF64ysOHqPAbVbHED/HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCxW4Mw7t79mYBiyzXJGwAYxQMX2wSIvpEOR8crRhsK6XvDJ3E7QNqcSzDeqpZNn14UvVBaftUbHdhejC1tFAjM6Qjc0ta6DkqKSXE9PaFDTPC7fRTEzos40p+HXwElYFrB6PPifbAzEwc6iDjpu6LPR0L+kK2KcrAnUcrs+JVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TgkXc45j; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TgkXc45j"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 458571A09A4;
	Sun, 20 Sep 2026 14:01:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AA026033F;
	Sun, 20 Sep 2026 14:01:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF05103286A4;
	Sun, 20 Sep 2026 16:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912896; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rqtx2xl9E7jS5Ru/exlFY1XMfpvRfYdJmFNa4tW5yMU=;
	b=TgkXc45j5iN28Lyzufyk83yvjpteO0BC/OSui0w3CgubGLITqxnEy9Mg8rrbGwYRHmMHzX
	L/DLmrm4Ib6ONQBLoW72HvajwNfnfO/floVk6MAVs9P/7dTspyhgZIwrj9rZXQaO67kuSs
	zdQMXGtIHWmAVenLaL3TnYPpNQr9GxM3hnTiV37V6w2g7fl2cbUsm5jHvUFlWhxRHlD564
	EY4CTyKvKUKb196g3c0enzUFP4ntC/GubPRcC2zXMOf9U6Bcj/e3FVA2XJxubvQsvfoFh6
	SfnTgorMlxMrvM1AP7JYaOIyWAAZ5lce4RyXLjsyFZSdQK0PilZ69rBDNBmVYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 20 Sep 2026 16:00:30 +0200
Subject: [PATCH v2 21/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-M parts
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-21-ab9c9688d071@bootlin.com>
References: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
In-Reply-To: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
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
2.54.0


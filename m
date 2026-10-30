Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382337;
	b=V4Q8jAPzjpRX08GKSj0JD9bxnaY9M+Dr3WXFFDEwv3LR0DfGeGvqzZr9qanRWhXCzLMv
	 nglEFevoxpIo0K00e6yf+wCgcq1pz+3OUcKSJwvTk9R2xd37oMyOflv4khQK72efzGjEr
	 VNsdFOjZfZPZYZRWfC9vJeg/d/KXw0qQSlHy0H44uVmHGa2AdYJT0XKkylWiCDQU7iowa
	 LjAtSjLKqzfysKiJz0I2nIArfZA2t2UbqveMLTyfX6R5mNTzNumCnuIL9IXzgkvO0/Cxm
	 L/8jIR6+Arl7M5pif3+7n88/2MufVBbOT5wc6unqK6Bkue/YKSqeapiq5OTcqJrKF4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382337;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=JPkbp5InV5FC7GB0gqDPgA6oAFNUik/9gOcMO+3HEE0=;
	b=Utw/ETt034kNJvrCjLYR7ioWBbpDy8VfyKTBy1qRcGYQndQ5H2knr1m4VOCgkpq5/lpB
	 N8O+Akrhunpe++PqPaOg8mD4sthADC8JowTP8QMEfmcMmPGYsvbY66w0D11IBN5bxr/aK
	 bYtrirNcNNVIIr4Ial1BOzPxBVVWiZmDSJOzPcM/eExv0lSTjArzNfvY5X90s1QOsJCQv
	 EVdtT4VcBhP/FLgWBzX0lf1YHURkumY5K4UlS1L4L+JQ5aRyfnvXAUdiNTz+yMQdBqTqN
	 bFp2UTdgKelb1Fr9/4c1IzuMpuWrCTDtasVV+LW2uBs+ZN9nX7vYgqo2ahHltb8gJbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="zXv/V6Nu";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7220606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7220606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zXv/V6Nu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DB9B4E413A2
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9BA603C2;
	Fri, 30 Oct 2026 17:45:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41E51103290E8;
	Fri, 30 Oct 2026 18:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JPkbp5InV5FC7GB0gqDPgA6oAFNUik/9gOcMO+3HEE0=;
	b=zXv/V6NuC4znVk9og5PbLnjBzJN2sFUiAV/4BGDBzwLzQv13oqR39wqTBOCo4q9FrnGRyZ
	UNAeK4wCsIsHpXbZXJEDD12+ubJtOzgGdLk5nlmN/Bxf3aXNzb1zmwrSDlwiLY3srHk9VO
	oyonAOauU44Gs+8OSwhztq4QnwQ76jo/6ymg/u13uq9mP/o7wu8gM9vNeKB53eM3vhVThk
	OAwo+LSVwIifEOU5j60RwK+d6dnOvouj10braplpPRrqYZH9yqq11W9Df4hMOLzhfX0Fbr
	QxCHkqoGHREyeJ2mOCBKCGxRgfKUgSDMn8dL09iBBlj3n5UQKN9764jRqqNOHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:25 +0100
Subject: [PATCH 01/13] mtd: spinand: winbond: Fix an OOB layout
 inconsistency with W25NxxLW chips
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-1-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

W35NxxKV, KW, LV and LW have the same OOB layout pattern. Though, in the
KV and KW cases, they have been exposing the user data section that is
non protected. In the 08LW case, the choice has been to derive slightly
from this and to only expose the ECC protected user bytes.

Make sure 04LW which has been merged this cycle follows the 08LW
choice. All LV and LW chips should use the same layout.

Fixes: ea609469a3e3 ("mtd: spinand: winbond: add support for W25N04LW")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 810975808c97..49fa545a4113 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -836,7 +836,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n08lw_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

-- 
2.56.0


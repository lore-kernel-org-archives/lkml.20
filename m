Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382342;
	b=MZqqWGIhe/6AGDG9bE2IHSeY5ThDwd5mH7B8PPI82XAOhn+unTh5ESm+rRs6vlj3YFcX
	 S2YQsLSqHseYw2/K3bH/O35m0Az4vSz8Y0Y1X6aIvFH1xROl7esNxI4rMoP8jk+GsQZiB
	 sBtKjayimS7mldejt1Xef9b/lATY/Izq0immVPm5wBqg995+7NvkJVOaGvWkpZPrRz45p
	 dpudheH8ShLO9ds2C39/6NU0god7pDQ9zKToQ7+ne62KuurOwIn+egp3pi29Y+oyOCyje
	 22jM68FSLZi5Y0JkrAuFjDH1cXTWRft5opYEcp0SPFySGZepR6EMgtN1pzOFtGUKgUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382342;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=H8qMNZwgNtZzt40osocLZQU4UFef1Rg580cIAOzUve8=;
	b=prWsa9fI08hhpmuiONB0ogaw3S6WhOKXYBNz16l6SkZXW13dCyvIbR36fmL+r6xjcHhi
	 FZux9J/B1mz7yDaO9CMoRSzU5aPOlDgm1B1Pb76ELotmjLn+5oVd5NTw8LTax3XxomcZ7
	 I7HuY6YFcDguTome7Xlnt9nPcJPNNM5zNzomdAkUhnrXobgeKYpWfPtcTwvL9MsEEvztH
	 PRFfibn+BuaUYblBfS2bOF++3Dq4oc6Tp6Sh7iSEXoyoNFLP3+EC8xF56ui1XOX7yB//f
	 fzJ1rQ9ahV6B3JDun88j6mUM5odoBWm/LfzRGrJbaG+T/cmwP/fDuUfZQRcV8PZvV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WT9ygcEX;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F800606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F800606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WT9ygcEX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A74F8C49F67
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:46:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6908603C2;
	Fri, 30 Oct 2026 17:45:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C459D103290E8;
	Fri, 30 Oct 2026 18:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H8qMNZwgNtZzt40osocLZQU4UFef1Rg580cIAOzUve8=;
	b=WT9ygcEX8mCDI3gawCNZex0GoViUbi4Vtkk2cNFOCwXan6dSMfpuTUSIBW9RGjA7aeOMsZ
	qF/wuBR2JI46yl00vm+FZyyNodNWMuLS6cDSTFOVGAb9MgaWHKHfC9n1IPAz7MiV0goVR6
	zkkDz3TZ8MOfIiH7s0RusLN66XjrEdPKYVbak9QBzToi1GiN8pRqoFEnGpIfetdVp0T3b2
	KvIGaeSeJcJIoNrLAJobCIi/5EcRr79OaA9MD6/gJT601DnMrHYFXvCakdXsvf8a2y87PX
	gP0XgkMnZmtt8QZNrWxdFXjPaWnG8uG2LtBbWYZflMTA1dGNPh4rOKL2uq5IQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:29 +0100
Subject: [PATCH 05/13] mtd: spinand: winbond: Rename the ->ecc_get_status()
 helper
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-5-91f67407dc8b@bootlin.com>
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

Most W25N chips (KV, LV, KW, LW) seem to share the same helper.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index c6f7f0a42722..8bf2d4e08bec 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -470,8 +470,8 @@ static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
 	.free = w35n01jw_ooblayout_free,
 };
 
-static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
-				   u8 status)
+static int w25nxxkv_kw_lv_lw_ecc_get_status(struct spinand_device *spinand,
+					    u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
@@ -735,7 +735,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N01JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
@@ -781,7 +781,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -790,7 +790,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -813,7 +813,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -822,7 +822,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -831,7 +831,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -855,7 +855,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&update_cache_variants,
 							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status),
 		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382341;
	b=wMtj1goZnNsTF7cR5qvN6rNIR+8xLwQsLK37lwBa473EufsVYnVdR3pwR/9RCPgzHkyn
	 Cvsf5CIPW2hQMlWgNdSeZNyv6XENYE3CaWyijrUuQOWncG0rEyFlKqjdGH4k+QP/Km/XI
	 sZuTI1Hg0sDfi41K+wcKdCBDdv8p3D42+UtkJuZiD7+hwRnf6dQJ3ZYp4my5vwDcGVmwe
	 mSrb1Qf09UHvLIhsp3fHXToZT8WWMRwhnOX8ENhfOEh62JNqUZZns4SskqkXwvq7lUl/F
	 qSRiSVsUdAInhjAy9yKXg5PkpBYwI8dou/FfA0CMEwzsR3/TMMyW5pZut4UusPtwX+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382341;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=sZ6FwVvEh8JAexAhWjFL05QbCtG3fHADbVqm2cgHr0Y=;
	b=VfHzkLIuWiRsAe8EMb1cMqzHxFgr6hYfkxItijSs2fXgHaT+9bODtLZWwYbkiEmzST1p
	 3EZC8ciSjxpndwKXnB4H5+N0mpC01jPu3bN+dzNcxmgwnKVDvKwKU/b8h1ZKhsQGV1Z8h
	 FS8hSxJNN9hLM3FBri9nEm2iwL9EkjNDs14WhkTY+9qec/5ZHUFOjceplYaSkLx/14i8Y
	 3Eh6GkgAVkYltm3odTGqMkL7/Xkb403GOL7QyZjkCROecYoiRRCXJgWbtZzZ5gGKInGHh
	 rQ+Z4xAShdsO5M2xBDEKT2YzSvWzXcOsayK79SrdM/KMz1LDIZIsa+ej5T8QUKGjlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siCXiFrU;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D5606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75D5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=siCXiFrU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 784691A13C4;
	Fri, 30 Oct 2026 17:45:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46A0C603C2;
	Fri, 30 Oct 2026 17:45:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BADF10328D09;
	Fri, 30 Oct 2026 18:45:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZ6FwVvEh8JAexAhWjFL05QbCtG3fHADbVqm2cgHr0Y=;
	b=siCXiFrU2YGSW2nrrzUiJXsMcKlawjdZ0tesbwm3powIRk9EW1xmmToy2eIJlDGvWYE/LW
	WrBggYcOuP8C+lDLv5DZIQexDWUW+6XrGbbbri2416dQ97kyIHkRvYFsUX5r57txOnn8vg
	nEJzjkP+ZnwbpplEMm14UdX8JQiwSfVX1YItZNbSer9tTDZBGdT17KmeoHl4BrX15oZJtu
	wa655301n+h+JfJayfABfnYWaxrKRWUzkqQmSZOkxDFZ2zKpq1EZuxAyLwtoh27mqvKr8B
	Q2NRB7H6PrZkn4Xnkjw9BcKVDOShtVAgbfyngsXar7qKt7oyZLDrRTW7Duq09g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:28 +0100
Subject: [PATCH 04/13] mtd: spinand: winbond: Rename the ->set_cont_read()
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-4-91f67407dc8b@bootlin.com>
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

All W25N chips (KV, JV, LV, KW, JW, LW) seem to share the same helper.
W35N chips have one more item to configure in their callback, but
otherwise are also very close.

Rename the helper to clarify its use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index e3be93690bb7..c6f7f0a42722 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -582,7 +582,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
-static int w25n0xjw_set_cont_read(struct spinand_device *spinand, bool enable)
+static int w25n_set_cont_read(struct spinand_device *spinand, bool enable)
 {
 	u8 mask = enable ? 0 : WINBOND_CFG_BUF_READ;
 
@@ -726,7 +726,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -772,7 +772,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -856,7 +856,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&cont_read_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25n02kv_ecc_get_status),
-		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
+		     SPINAND_CONT_READ(w25n_set_cont_read)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

-- 
2.56.0


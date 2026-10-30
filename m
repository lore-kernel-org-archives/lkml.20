Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382347;
	b=qtlqs2bTd2kvUPhsaN+2tofrnQZAGBqnLp5U2aSYVtlCh2+iICVPwbjwBav/ajIygVUD
	 3A3IzFpopZ8LiVs8BRNMFF9JNr3VRjTuExGvevDTK0Qxsy+XR6FaiikC/+O2G3REvAc2j
	 jNS9UCA2vv+GuyvbVl3t7850zLOjRX/1w862QESrsfWbJ/HfCrga0IXiceXMVomB5KXk9
	 NnjiyCQcy/7/movhjXZ7EdyddvpULkgzQw0B1jIonUPXf/H325B8EVWIPbJDaYo5+TVsO
	 /nvUmqqKQbNyQ8cU/h4kPheZSvpPcyqbX0LqXJCQxy6khzrH0Fs8WmFpAsPt7KIqPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382347;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=HbDyM25MzK725/4xtPE89ooaiGYWRfqoAQK/XePlbM0=;
	b=2v9J0NJSDl4Ccl3S6sJj4oM7v/a3Py7deSazn4Qsj2v885s+GpLeL8lBg2P+oHOZYmnR
	 yTof4ZPKGa7seTi80ktPJQkUco2leNTAvPxseVgu9tc97klHgAiHcDqphiEGW+f2gLe75
	 klMQVM2Iur/o0eD0aFU0tdVqYulOvC4TFpKIxSjBOS8iO5E/mtBTPR7fzQPgmHFRXWo/G
	 4A3cQCi3hbXIamC9P5Y8n7MaUKpsuaLHVHHKXbwgxFf8xVkzAUrRPjMzD1nK8444bMXhu
	 RvqfUbDWyYPHH47altrlpLc0ftAWEcAKzRsvBX+It9zjcudMKowbXzuMworZG6bxrhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iSJKyPIS;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065D60A2634
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4065D60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iSJKyPIS
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00D934E413A1;
	Fri, 30 Oct 2026 17:45:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C97FF603C2;
	Fri, 30 Oct 2026 17:45:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4202103290E8;
	Fri, 30 Oct 2026 18:45:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HbDyM25MzK725/4xtPE89ooaiGYWRfqoAQK/XePlbM0=;
	b=iSJKyPISVSlmdgPuSCx3Geiy/mLYVBo+sLEH9gdnRx5QL1f5LI37qNtlb3clyCJpSyxuXs
	SloeFrjdUf76NeQ1Y+ltSRfHNRoYnszXNh+c6d1niogxef1PwJn755hf3bakzKWSVrDYEl
	6rJUMHPLn3KsfesFQXAplm9LPLBZ6tpPrN2VY2JHx/MFv+MznM0w3E5NU/24R7pG1Opx5Q
	f0wif8EoG2dPopTqnkgXW3S/1hqTDc38P94oVrhuBADRk2YVPbY2w5xj1QbHgpZQBUH6XX
	fcqZgF1YjHGNZf1ApM+8yC9N4ZZ1RrVIlr/zDKhlEsxxbG+57/pD8xI6dfmg2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:32 +0100
Subject: [PATCH 08/13] mtd: spinand: winbond: Add basic support for
 W25N04LV
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-8-91f67407dc8b@bootlin.com>
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

$ nandbiterrs -i /dev/mtd0
incremental biterrors test
Successfully corrected 0 bit errors per subpage
Inserted biterror @ 0/5
Read reported 1 corrected bit errors
Successfully corrected 1 bit errors per subpage
Inserted biterror @ 0/2
Read reported 2 corrected bit errors
Successfully corrected 2 bit errors per subpage
Inserted biterror @ 0/0
Read reported 3 corrected bit errors
Successfully corrected 3 bit errors per subpage
Inserted biterror @ 1/7
Read reported 4 corrected bit errors
Successfully corrected 4 bit errors per subpage
Inserted biterror @ 1/5
Read reported 5 corrected bit errors
Successfully corrected 5 bit errors per subpage
Inserted biterror @ 1/2
Read reported 6 corrected bit errors
Successfully corrected 6 bit errors per subpage
Inserted biterror @ 1/0
Read reported 7 corrected bit errors
Successfully corrected 7 bit errors per subpage
Inserted biterror @ 2/6
Read reported 8 corrected bit errors
Successfully corrected 8 bit errors per subpage
Inserted biterror @ 2/5
Failed to recover 1 bitflips
Read error after 9 bit errors per page

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index e14f026fc99d..410dd27473f8 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -856,6 +856,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxkv_kw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+	SPINAND_INFO("W25N04LV", /* 3.3V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x8b, 0x23),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&w25nxxlv_read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W25N04LW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),

-- 
2.56.0


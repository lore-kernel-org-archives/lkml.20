Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382349;
	b=BYBVMT3LVJL3Gk8pMBfUrWhB9Jata2fggwHwdj3kRhkjcBrP8AXLngs6aKqu3CshlkPG
	 pisYyV5H3C4x+7uzw+si42bVxa8/aPJ78rPjr1PwUQBAxVo41GCWFaRaHE9QfkTWgfK83
	 e5xsG3NgOy7DcoZmI33geD99r++D+D3bWThdqqES7sawlqgRLUtNHHlAzWC4oN8Y0L4En
	 sCjpI22K7t7d2X3Zor2QvW1WH+1DLDCvLLANDeFQyHry6/TyNEDJ9rBG/vsdbtHRMJwvy
	 /qiwY2CWlWSU2o+fEmo5ZhtB0M3p7dBpu1WpLRdE+cHQpscKGDgR/WWV7xeSn5VitHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382349;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ui4gby7N4mdOCrvAfN5xSL3mZEVtUhfU4Wmi60HiS/M=;
	b=zUt8fFb9QRwG50fvlBpvWukoRWIsNv9q1gxzZsfZDrS26/62MUdWP2vNA9cKOUL1h5N3
	 UjaKUpsHsm9oRMfVyWVF4TW8U1xGuTyFivF1oKAC00oTVY7vRMF/RpKab+yZnryYnilHR
	 O208kRXOPcwKqPpXdWJAb8jm8bep4YzKa3y+zfPljucAXlClIkLmexflerh8XoY8gN2No
	 gITy0CIxSyI1Fn67UJiFOiZ08bhbjwgXo52UDNF8D5l7NW8kVdrQVFJ1np2zbzwBtQ9Aq
	 yqhhXhuEDQcSwRI7NYD6CPrrfsXqsTyD76CSJwvW7LyI8eZHBW8LfwD1zdEoVFG1+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="jM7xzpu/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CBB60A263A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CBB60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jM7xzpu/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD53B1A13D3;
	Fri, 30 Oct 2026 17:45:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A27AE603C2;
	Fri, 30 Oct 2026 17:45:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73492103290EE;
	Fri, 30 Oct 2026 18:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ui4gby7N4mdOCrvAfN5xSL3mZEVtUhfU4Wmi60HiS/M=;
	b=jM7xzpu/2aZkw1gweVa1xYsoZj0VKgXMEkYQUT6rrq69IrYSAA3KTUWB5h9xX1B2L1Sp7s
	WP2ZJSF8X2vqTfEN1SZETvjSuQxL6tqStlyO0oKD9ccmfDCPAsy9Yf0JscNIVtqt7Isj+l
	I/XEx6YTF3wazuhxV/MSIJmQtNxe1MCFOmPXJOLx9Q3Dep8CQXN5k6/5/zUVnvZ7VJYPh6
	tpgaeRz1YbfRnYHdSJIPEcyXIhjNuxpMu9Q3tn+7JU1NUpPQfmWsL0xvi7i78kMGngvBKm
	ZVr3J+0HrxwC83w/19sUeo5kdSyYMQlydJ6gP7YqteeggRe8OLwwL9orqVvmNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:33 +0100
Subject: [PATCH 09/13] mtd: spinand: winbond: Add basic support for
 W25N02LW
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
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-9-91f67407dc8b@bootlin.com>
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
index 410dd27473f8..6d7732761785 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -824,6 +824,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
+	SPINAND_INFO("W25N02LW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12, 0x22),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25nxxlv_lw_ooblayout, w25nxxkv_kw_lv_lw_ecc_get_status)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),

-- 
2.56.0


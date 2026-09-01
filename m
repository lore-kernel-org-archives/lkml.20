Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930BA46AA99
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248354; cv=none; b=c+2sItRfV2Suyh8ahZqtmDcnOQdjlPCl9D/b3eZ3vWv9KeGzh+f9X7YfWyqvLPjnlI/hQ9z/INL08VnAHMdi2dhMBv0gQrBYx5i+d66iTKFA66PBJASSb6MsIdZp6KR/25V+PBBtJDJOdCnrIQBoa0b7U+FQn/vPkbviUTd8ju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248354; c=relaxed/simple;
	bh=sARcfyG9B/7zhIALqGQck81QJnn9PQg0ryWc0yDH4Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S97uUQFLB/QfOUUzZcXu66ciUw3vIYE70s/jiMh5gnSJhkX2EYEUfuDrNg4R/IA8um4d2lWA/a3uIZ3zXV6mcTCYJq2opoggi4Avf10A4H2bvPqScKW907XzbIzFNrFHM7l5zbS/pDLMq+SXSs1QS7+cVGk4wmSBiR1MJzQ/sHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRLGTTEM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRLGTTEM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e4998d28so427423f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248351; x=1788853151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf8LcBflWgrQbjztzyHrlB9MgJL24SoJuvS1BisUWl0=;
        b=YRLGTTEM4+MURsYxzyefOw4KMmSH8OvcGwLzpoMiO+Smw4W/C0huV7lDc+akPsCMtl
         7wY77DEa4AgmOhfnoVbwyKzzs/Bd/iRqqaCEm2HHtiRdFRfM9nGeFwtsfBcLRYZwIjYu
         vUw2nJFjI+2+nuMwLRlNuzWZaLKu/JBdrLQXrPnjC8R0pRn64AS2RfTL9/cDKywwdI2s
         lRpwTiWffQUxFPcU+cRHZk1iCvZNEESjgG+0nlpBu4iw6LG7ALJDbF4CmWYTgu+GDPLc
         bDaoayn5av8Nv6P4X8TUFWFQ49ChLGERQgQEa4eDGyWjpQCaSq7bZqmKIh/Ir9Gadypl
         PDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248351; x=1788853151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uf8LcBflWgrQbjztzyHrlB9MgJL24SoJuvS1BisUWl0=;
        b=UxeMSzX+xXIRaZQ3nyXrEjMmT5nzN6f3D4vdm8F7/QrKQdHchxfskRKIOjDIs4ZEIS
         yeZjlvVmhFzCtTtSq/PyUMaTN75REBMnbtQFsXbgwFIV/IH+q5BnLEq4wxe7zyHiFRno
         pH8ml/JHPi/UMCy5glsbcP5VHLelNRCfHUPThgBa3rCJ/iADPmevUqK9uwwiO2GZW7dI
         Iha3MGQRD6giv3znXDhdbzB0vQquR2pgt5af2Gbzhfxbt4vSjWjPaKSgcrnckDQUp3BR
         NcBE6u9VlqRfFXn1kZS6VTsbEF0woL8/Cq2VQ79sOTpylgyYsnm6agytW9TSfIWNwbTP
         HPoA==
X-Forwarded-Encrypted: i=1; AKwUvBwVo/3i4Tg57ERGSZL0lL47RP80gZPe+As9S6OJTNb6jCGlMrD1+x1PjYVW4Y7SZgrmyvDDtXG45WLuu28=@vger.kernel.org
X-Gm-Message-State: AFuF++m9uYZBjGXVEUso0qo9LbF1oiRo4QJJ2woeG2kGaQV6snfDrilH
	2kfsT4wh99VSIc/W4TPUu9R8dl3mJ/shkfNAmdvr0wcws6qQnmbycTMGD+GHoMZG
X-Gm-Gg: AYBFou216gKFZ2p4nAH+CY5awWMUQIaNNmevQ9ekCuH0m/s9qhtFYjFxcuX96NQLkGm
	VVql8V0tPeZUze+jh2a1dGGEtBJhzkuuwYtWhkGetARL6Sg1lTR9Ogw6PZLhLcOz8XV8TgYY8bm
	ptCFtfaR1bCVMyz9PFAon17VoQP83KLQOQmA8082SpnL0hQYRe8CzLgayolXxlpwfHN9G2ZnNAO
	RvNLDy4mAfd4CpWIqAuOfHSTHkCvwEia5no6xS8AsX1YIwF1j51xTz5VK2K5KLvQNOAfNeEsr3f
	e3x184YhK10Z2/+aPWFuOBBqmf3AdKk3fdbXjAmuiO+3Hc5UeXK8JkuZ2/42aPNXITOppJBfR08
	je3SZXtNr1mH0rwGlIqqZrl0Piw4QZ4jH9bhvj1q+iSeJot4WP0bqYqMkl9xWgcD8TjxHP9ippC
	Smb1GIE4fsDLYX6EIK/1sjuzoAMTcM/k21WOSgvfU2uYTIisaJ/TDueNFdbXik1ZMRSQ==
X-Received: by 2002:a05:6000:22c9:b0:482:f2c1:c721 with SMTP id ffacd0b85a97d-482f798962cmr49380335f8f.5.1788248350669;
        Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm3014790f8f.13.2026.09.01.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:39:10 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Edward Karpicz <webmaster@toradex.com>
Subject: [PATCH v3 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Tue,  1 Sep 2026 09:39:07 +0200
Message-ID: <20260901073907.2443698-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260901073907.2443698-1-mehmet.fide@gmail.com>
References: <20260901073907.2443698-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When the ECC engine fails to decode a page, the driver re-reads the OOB
area with the engine bypassed, but runs the erased-page check for the
data area on the buffer left in the controller SRAM by the failed
transfer.

That buffer does not hold what is on the flash: the failing engine
writes a bogus single-bit "correction" into it. In the 60-byte ECC mode
the all-0xff content of an erased page always decodes to the same error
location, so every erased page shows one stale zero bit at data offset
0x5FD, which the erased-page check then reports as a corrected bitflip.

Edward Karpicz discovered this behaviour and identified the offset on a
Colibri VF61; the analysis and the fix build on his finding. Measured
with an instrumented driver on a Colibri VF50 (MX30LF1G18AC, 32-bit
ECC): reading a 126 MiB partition with nanddump increased the corrected
counter by 18035, exactly one per erased page, while raw reads of the
same pages return clean 0xff. A v4.4 kernel on the VF61 (MX30LF4G28AC)
accumulates the same false counts, so the behaviour follows the
controller rather than the chip or the driver generation. Neither the
Vybrid reference manual nor the published mask set errata (VFXXX_2N02G)
document it. The 45-byte ECC mode is not affected.

Restoring the known byte is not enough: on pages that fail to decode
with content other than all-0xff the engine writes its correction
wherever the syndrome points (measured at a different offset on such a
page), so the check has to run on what the flash holds. Re-read the data
area with the ECC engine bypassed, exactly as already done for the OOB
area. The corrected counter then stays at zero on both boards.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v3:
 - read and check with mtd->writesize instead of chip.ecc.size; equal
   on this controller, but clearer (Miquel)
 - reword the erased-page threshold comment to match the code; the
   threshold itself stays as is for this series (Miquel)
v2:
 - the no-ECC re-read and the erased-page check use the clamped spare
   size instead of mtd->oobsize
 - condense the re-read comment to one line
 - Reported-by/Link trailer order fixed (checkpatch)

 drivers/mtd/nand/raw/vf610_nfc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1c3e7b167e53..1b9b370adfab 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -519,6 +519,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	u8 ecc_status;
 	u8 ecc_count;
 	int flips_threshold = nfc->chip.ecc.strength / 2;
+	int ret;
 
 	ecc_status = vf610_nfc_read(nfc, ecc_status_off) & 0xff;
 	ecc_count = ecc_status & ECC_STATUS_ERR_COUNT;
@@ -526,15 +527,21 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
+	/* The failed decode leaves a bogus correction in SRAM; re-read without ECC */
 	nfc->data_access = true;
-	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
+	ret = nand_read_page_op(&nfc->chip, page, 0, dat, mtd->writesize);
+	if (!ret)
+		ret = nand_read_oob_op(&nfc->chip, page, 0, oob,
+				       vf610_nfc_spare_size(mtd));
 	nfc->data_access = false;
+	if (ret)
+		return ret;
 
 	/*
-	 * On an erased page, bit count (including OOB) should be zero or
-	 * at least less then half of the ECC strength.
+	 * Run the erased-page check with the driver's historic threshold
+	 * of half the ECC strength.
 	 */
-	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
+	return nand_check_erased_ecc_chunk(dat, mtd->writesize, oob,
 					   vf610_nfc_spare_size(mtd), NULL, 0,
 					   flips_threshold);
 }
-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684043;
	b=Sp13MsvSPmrdS5XKDt8/0/Su1Jdb6w2C0ed4PKISTqZzjd6Z/qjmR08uT1I3vnE0Ld0T
	 GVxPp8kXRDCvXzv1CdDlleZCCVIAqWpmp+5TMFHkUZeAtxEvoCnAszkUPsbUSSSiglB/q
	 nS9Yy+uGgrSXOWfKDKyLskhjOhXn4yR1+NYxJ3ACaJKwgyRGT4r3pG37wVjREBjqhM6tS
	 ZVMurtUq9o8ExIrvbYbaNNW24NU+o4bQ+13UaNsTO1GNCCKbwr632JZtrrI0iguZ0HWXo
	 HQtrEPcbZiFMKbpaNERftQbdrwcOqg8gR+QkDlLLTXOU+K2SLNxIlO6wGxKgXVe/LnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DeWc8W1NhIBdehZmUo3RGXoiEr7NAQbmeD328Wa8hwE=;
	b=dU3RRVGjccwI5Bpr+ZerqAa9fY52eYwyu/Tl4t/umfWdjtu3Sxuqne7FmFeqrgnF3Wld
	 /rcohQPd/0DK+ZuhiGnyhQQKvNSvBjHMWd8nRS26eWVGzf+6zDfaAQFN3b5lR2d0n9Ty3
	 3iGiwGCjPaGwF5T/3UHYoik3MiLsQ6DselC6fWSvQNoYwHioJQmjzd2zPkv/z4P3tGiB5
	 kA0Z7ZDfk5Vf3G4v7n/QIs3Kx1gEu04LF6F/9fpQdLYj13Ei2K+skVyTIr+kR1rX3qSP0
	 Jj3/WvMlD4FFLdJaeSmSAnZOns85dJlrkbxhw6UjXou/w3pQvgM/hMAdGvpDfxi31Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aqR6EZRT;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C000D606A89D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C000D606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aqR6EZRT
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53fdd2fb171so35128561cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684042; x=1795288842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeWc8W1NhIBdehZmUo3RGXoiEr7NAQbmeD328Wa8hwE=;
        b=aqR6EZRTFcPQE3psyXXxss2JxeFH2lFCQP3WInByvRNlV+3+9Q7ihTB7Lpj2AyrVgf
         T/+he6u2L5TEE1eGgRSXwBbGYeniZtPwltdW8LZT7sXddZjFV0SPhQnZcxpsyJwemmLn
         9HBsNkglX/cXOcdExHf5VBfTowW/cBkWkHFEuQDE0c1v3GeBterKZIucv6sV36w0tjVO
         rb08EhaSRe9mc1mAEeTjfyH8nUsSlcoG5HiD6Tpdj/+iacw5g3XVVRCowOWbFBpYnmiJ
         d6/DQt+DTLmHFjHIevr26ax68xIiR0APDjlghgd/t/UDZl3bZ0BlChnQvPAUGBe1JzIw
         HxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684042; x=1795288842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DeWc8W1NhIBdehZmUo3RGXoiEr7NAQbmeD328Wa8hwE=;
        b=H0ticnEqNZxwyqmxoJEqdptQ/eJAMxU3M6oMserN9faywqiMyqbCFP7JSCXfYcBFCE
         XXIr62txrbp/9KEmanwHC1uspvW/HRtJU/UzaRfVh79SNHbDjCI69eNt39gEHDkGfF8g
         SjjNJdAjWOB+PEED6Hvzbp3M3p1KnIt9NrFNu74+YvpRFq/o5igSWs7bhg4HN/81Eb+K
         B+WcomYlOGVTL8kcjM1LI1o6fVV0sr8pnI1LqD32snLdsu5J9mjOb9esXoE1PCiEHSPO
         LkZQsq127SNvSnvXPksvMNb20Q5U7c6j7532kbbR1mp8r7PLzHM+1tpriJUKIkqcG5gF
         7uDw==
X-Forwarded-Encrypted: i=1; AL+hErFKhPLutuIttd5vIlQh+oL6W5eKO31TdB5QMW6kQ7wglRvDX2iHiEOEYeaioypoRtVq7+mi9QSsVFGQuKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8youS8R+oksgHizVltB3fXQp2x7DOsem4KJIyQKB3HPJXa1DgT
	+7tOyqDyjwI9Y4DHWvUfUJhsD14EKQJOqWCzuMSnuGsJfJVCTpSYyxLB
X-Gm-Gg: AYBFou2TGd1OVoybWWb0ZKaY/ZrCQCdP14DJzETP9Kv2rPh87u9moVvNIjoVXW72qhX
	e/mVph1FZjzam+GT4d9BNN+55EVG19piZPd7C3d2y/2xAgj4oLe8KKhg41e94IEOZXyhNAIzMiY
	yECF6W7euzD6w80dwqr4ATpWIo3CCAcRaHmDEAHmJZSeC+OxiuJIAp3xDFI/5CvV39XgZy+TBEl
	+HTOgTxg9QEFcrjRSSU0wlqFP9Sp5KhQATfuPup14phdHLI2+Oz++12OrKW1igiAnDFCJm5mafr
	Hn/CAG1CX3yYVBKNLMssoIZZzLVspoPAaqnvNP4CnWiOp5/Qfz0MB/B/lRTxjW1JvIXxOxhMuBJ
	/cOY2fomfKSrTmWj4O6aff5BHEB+sPRG9spZaCkcOgTGf5IHSCcroS3e8MpWZgul28k48yFnW+9
	r7f2YabSTK2eXMS/iMZoqdUqvHCvRUWj5W0BkP1GoUGnQQw6VLZoXrjSE0tfRRt+WDGfP4ZUtrR
	ZEekAt8XQtJJzsYV/YOWkabOZ+nI/0yGZbZVnt2bWiubzDVb5iiemYkD37tQZ3vZL8o2XWhhdpr
	TydNNo7wBGMZALc9sWt7gW4E1caXeBo4Q1c=
X-Received: by 2002:a05:622a:258e:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55ac857f9e9mr105572911cf.59.1794684041554;
        Sat, 14 Nov 2026 11:20:41 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:41 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Sat, 14 Nov 2026 20:20:31 +0100
Message-ID: <20261114192031.959376-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that times out only prints a warning. The callers carry on,
copy whatever the SRAM buffer holds and report success.

Return -ETIMEDOUT from vf610_nfc_done() and pass it up through
->exec_op() and the page read and write hooks.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 547eb1513893..d6d4a18432ce 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -288,9 +288,10 @@ static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 	vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
 }
 
-static void vf610_nfc_done(struct vf610_nfc *nfc)
+static int vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
+	int ret = 0;
 
 	vf610_nfc_clear_status(nfc);
 	reinit_completion(&nfc->cmd_done);
@@ -309,9 +310,12 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
 		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 		synchronize_irq(nfc->irq);
+		ret = -ETIMEDOUT;
 	}
 
 	vf610_nfc_clear_status(nfc);
+
+	return ret;
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
@@ -331,8 +335,8 @@ static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mode)
 			    CONFIG_ECC_MODE_SHIFT, ecc_mode);
 }
 
-static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
-				 u32 cmd1, u32 cmd2, u32 trfr_sz)
+static inline int vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
+				u32 cmd1, u32 cmd2, u32 trfr_sz)
 {
 	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
 			    COL_ADDR_SHIFT, col);
@@ -348,7 +352,7 @@ static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
 		"col 0x%04x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, len %d\n",
 		col, row, cmd1, cmd2, trfr_sz);
 
-	vf610_nfc_done(nfc);
+	return vf610_nfc_done(nfc);
 }
 
 static inline const struct nand_op_instr *
@@ -370,6 +374,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	int op_id = -1, trfr_sz = 0, offset = 0;
 	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	bool force8bit = false;
+	int ret;
 
 	/*
 	 * Some ops are optional, but the hardware requires the operations
@@ -448,9 +453,9 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 
 	cmd2 |= code << CMD_CODE_SHIFT;
 
-	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
 
-	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+	if (!ret && instr && instr->type == NAND_OP_DATA_IN_INSTR) {
 		/*
 		 * Don't fix endianness on page access for historical reasons.
 		 * See comment in vf610_nfc_rd_from_sram
@@ -463,7 +468,7 @@ static int vf610_nfc_cmd(struct nand_chip *chip,
 	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
 		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
 
-	return 0;
+	return ret;
 }
 
 static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
@@ -572,7 +577,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
 	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
-	int stat;
+	int stat, ret;
 
 	vf610_nfc_select_target(chip, chip->cur_cs);
 
@@ -587,8 +592,10 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	/*
 	 * Don't fix endianness on page access for historical reasons.
@@ -651,8 +658,10 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	cmd2 |= code << CMD_CODE_SHIFT;
 
 	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	ret = vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
 	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	if (ret)
+		return ret;
 
 	ret = nand_status_op(chip, &status);
 	if (ret)
-- 
2.56.0


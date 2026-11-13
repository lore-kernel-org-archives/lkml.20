Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593721;
	b=Fzsh64e15eXcTv8gjm7GnDeJtlAkk9yrNd2NYS3YcWKvUDOgNN4GNfWQ47P+TJOY2m8w
	 IRqahWXO41Eb5ZwxF0XctPepSELb3nsXUjmMUAjwEsE099rvAxlnH0kL4kvyrDdzlotIr
	 ruprERmoYeUfOYN50gRYhjOM0Q3YsqH2hh9ZpVpjZAbHv8xYWRhBojhc9wocmJU55tvCo
	 dXkmsShOj5VJd72KR99XvqAUvdCceVyHHA7eIQaR3wEDupRDPTFZebmaZ819ZH61isgPY
	 OXgbCcGsqsPs6Ed+PXZMr/rN2QI0aGf4kkxC8e06bmiwvgipIvpHLfl8l4ct3rWXq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
	b=HAFbbOc1Zosk6PKatp4kOOGThIy9YyL/j/jCDMm9k0/mzYVItyRzip9vCmQZjJ0knyA8
	 j7fIhX4ojRmllkRRmjrtOIyUwKxc6LtHfZ/hKsMqKCoklS8KGq61uVpImccFYGSTLYA79
	 hQ4Jiaw7xG/0hg1m49bUGMYSEWjfDrqgFhTohVIa582q74W/PmUetuWjwUKwQTZeZh2Y5
	 UUunVSPAJXVNtmyfoTCSnVaZrWBW/me1GorU+TRGWUI8KgyQCsb9NpltsAKRX/hWrr0BQ
	 UVM8NoKRGS4B4DY/5T91geQKH6pkGavyj2q1p+xLzhqNa0tLpornqPhT32cm2FFaNxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xfbl/Da4";
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDC606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CBDC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xfbl/Da4
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8256106635eso518984a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593719; x=1795198519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=Xfbl/Da4+IwPxeBzhrzeWwKdJkbX3dEjDmNDyZmpvbW2jXIE9hu6CHyAXwT+P5AmDj
         /pZR37vsrAtL+6M2U8yye42Ngz5cxtOHWd10esnwKI9znff428wQEURJE4307m3RtvDw
         XF3NwU5pbl6Jz14KkELPQxWavIihOBtWqtqfCU8bheXHQ6HmxlHvGRbGowRyMG3RA7js
         VAi38PQbrcJzQzJbhQccLB7NtBu5tgsY1uSVhU3nDqzKhQdaQMowqQISLxYPTIiMhXR9
         esSXd6nzz1dTvL1eqZKhEzsEF+4Kg3gY0Yr3fEUTMOsybf/SRlhMga6hECcqF0/R3FX0
         mbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593719; x=1795198519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=D8KrTZa+874/IABvTI1IireCDBoH+HPQQoHPwIn9johoiSrgMMDCjU150v6yLPo0RO
         tOLGBBIajSwhX2wdDSzlnxfoudRVrCA3zjDLpjfyAxFBYrXA7DiHn0boyP15bEAG/KHY
         6MMARxo2fEw5SF9f3Xuaex5kj06jQGAXBoLzvzLn0FIGyzsIj/5Q5GJOFIqNSFEFChNI
         /Bs9ouJVMwf+m36bjI6Zs6/MjDf3zgvYk8MeeKhZcvxwdT6tPoKNqEhGVW5Q5y/7pl/6
         gzKG1xfZKhbDlBuX/6pG/aPVfArqOaovyhoZQcXlr10e8Mg7f5vjxs4ROzOhU5TICEcJ
         02Wg==
X-Forwarded-Encrypted: i=1; AL+hErFM1RbCpIRL4pakLrm7kdWBW6ZvM1GHlBl6DZRAYv80ExiqCBonJYHJQl3fBKF00gs7nAI42EtC7ZwPntc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RZSevyo6H8q856/CYnfFfuDT7DsiheV2WP8vyltZC7StI4oXi
	+hZmNh0fzrOjkhIyOLocH+E/7V4kFn43jgm6zUGTyPZtDwPKC3/l1/E4z6uRqnsG
X-Gm-Gg: AYBFou2xPM6/cvCAP8CECMqZMAqTz7r943JEqkG2w6T4D+x7Z37R+/41ktuxEHOcNnt
	J98nQyqVFFRRQ0vkw13Mxol/9djLMxTv6I2zVcXYd64KvMhlOgKJ9S5c85O/mpXzvUAenG+1rNp
	rFmKLw6pRydnx7c7jnkpFKDVDFW5vVLkwPXRDdog8GBX1tXbOekx5/eavmDaPLaORYfRZYcwE1I
	U7gLZ6wzTDMGgspnep9Dgd22vZ+dysGz5LJeMZVp0VoC15EVSy23w1cCxLVN/peNDtwoY/x36FM
	yDnu3YAdp75xBpmvYjZ6BF52+6VQq+TE42Di/gz0aUvRQw3nu9QIz6t0JxNk6R5N45j3C1DR18A
	TyJ7O0a6nqk5QpldHijUCLTX3h9iLXvWvDNsRPRMdHQYhQ5vYGqIuPlRIg0WcODRU3iE7Mur+86
	oV4qbSM0FP/cyEYiEYOwuxB+0KSU/0+wf817sRQy7785UMSvCAhcob9JYmdps924LXgXLJ2gORm
	R6Go3bg0LY/V7ARarRD1JIaMohjQcBITDkKkUqFOZZoQC1fSyU+Hf2ul+I78GNaUX4ROBiosbm3
	CVcwQyFLObtGj+wxyhEr6OTvQFCU2sDYOZD4uAaGgU3TGhyCJv3XjF+MJQ9xnlOCHtNBXmBksOf
	WxNLt02M3ZcxsEYEhUnhA328vo5vBH3IgzO+7eEtaeNLyp2AxmkJOURrcQ8J/Ajzei2ju3dTMgY
	w5t4Px1rk6BnJUXzYknzvILb316SQ4N0TdRR2i+M3qGFB/kG0F5tly
X-Received: by 2002:a05:6830:230f:b0:83b:3feb:4f04 with SMTP id 46e09a7af769-86289746345mr2963367a34.4.1794593719527;
        Fri, 13 Nov 2026 10:15:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:21 -0700
Subject: [PATCH v4 05/58] mtd: rawnand: separate hardware disconnection
 from cleanup
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-5-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2

A retained MTD handle can still enter NAND operations after its
controller is unbound. Closing a writable character device also calls
nand_sync(), which takes the chip and controller locks. Freeing their
storage during remove is therefore unsafe even without another explicit
read or write.

Add nand_disconnect() to serialize disconnection with regular operations
under the chip and controller locks. Make nand_get_device() reject a
disconnected chip and propagate that error through its callers. A sync
after disconnection becomes a no-op. Suspend also succeeds without
accessing hardware, so a retained disconnected device does not abort
system suspend; resume is a no-op.

Propagate lock-acquisition errors through Macronix OTP access and BBT
error recovery. Stop table updates on -ENODEV rather than treating
disconnection as a failed eraseblock and issuing another marker write.

Unregister MTD devices first so removal notifiers can finish their I/O,
then disconnect before releasing controller resources. Wake any
remaining suspended waiters when disconnecting. Panic writes also check
the disconnected flag; their notifier clients must be drained by MTD
unregistration before controller resources are released.

Disconnection does not free the chip or controller allocation. Their
storage must remain valid while existing MTD handles can enter the
disconnection check.

Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     |  2 +-
 drivers/mtd/nand/raw/nand_base.c     | 76 ++++++++++++++++++++++++++++++------
 drivers/mtd/nand/raw/nand_bbt.c      | 24 +++++++++---
 drivers/mtd/nand/raw/nand_macronix.c |  4 +-
 include/linux/mtd/rawnand.h          |  9 +++--
 5 files changed, 91 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 2668f527e637..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,7 +81,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
-void nand_get_device(struct nand_chip *chip);
+int nand_get_device(struct nand_chip *chip);
 void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f6a054919c06..720da4174833 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -336,21 +336,47 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-void nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
 		mutex_lock(&chip->lock);
+		if (chip->disconnected) {
+			mutex_unlock(&chip->lock);
+			return -ENODEV;
+		}
 		if (!chip->suspended) {
 			mutex_lock(&chip->controller->lock);
-			return;
+			return 0;
 		}
 		mutex_unlock(&chip->lock);
 
-		wait_event(chip->resume_wq, !chip->suspended);
+		wait_event(chip->resume_wq, !READ_ONCE(chip->suspended) ||
+			   READ_ONCE(chip->disconnected));
 	}
 }
 
+/**
+ * nand_disconnect - drain hardware access and reject further operations
+ * @chip: NAND chip object
+ *
+ * Unregister the MTD device first so removal notifiers can finish their I/O.
+ * Call before releasing controller resources. Operations waiting for resume
+ * are woken and fail with -ENODEV.
+ * The chip, controller lock and NAND metadata must remain alive
+ * until existing MTD handles are released; nand_cleanup() is a separate step.
+ */
+void nand_disconnect(struct nand_chip *chip)
+{
+	mutex_lock(&chip->lock);
+	mutex_lock(&chip->controller->lock);
+	WRITE_ONCE(chip->disconnected, true);
+	mutex_unlock(&chip->controller->lock);
+	mutex_unlock(&chip->lock);
+	wake_up_all(&chip->resume_wq);
+}
+EXPORT_SYMBOL_GPL(nand_disconnect);
+
 /**
  * nand_check_wp - [GENERIC] check if the chip is write protected
  * @chip: NAND chip object
@@ -581,7 +607,9 @@ static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		nand_get_device(chip);
+		ret = nand_get_device(chip);
+		if (ret)
+			return ret;
 
 		ret = nand_markbad_bbm(chip, ofs);
 		nand_release_device(chip);
@@ -3879,7 +3907,9 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	old_stats = mtd->ecc_stats;
 
@@ -4449,6 +4479,9 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
+	if (READ_ONCE(chip->disconnected))
+		return -ENODEV;
+
 	nand_select_target(chip, chipnr);
 
 	/* Wait for the device to get ready */
@@ -4479,7 +4512,9 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4539,7 +4574,9 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EIO;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4627,7 +4664,8 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	if (nand_get_device(chip))
+		return;
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4644,7 +4682,9 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	nand_select_target(chip, chipnr);
 
@@ -4688,10 +4728,14 @@ static int nand_suspend(struct mtd_info *mtd)
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
+	if (chip->disconnected) {
+		mutex_unlock(&chip->lock);
+		return 0;
+	}
 	if (chip->ops.suspend)
 		ret = chip->ops.suspend(chip);
 	if (!ret)
-		chip->suspended = 1;
+		WRITE_ONCE(chip->suspended, true);
 	mutex_unlock(&chip->lock);
 
 	return ret;
@@ -4706,10 +4750,12 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	scoped_guard(mutex, &chip->lock) {
+		if (chip->disconnected)
+			return;
 		if (chip->suspended) {
 			if (chip->ops.resume)
 				chip->ops.resume(chip);
-			chip->suspended = 0;
+			WRITE_ONCE(chip->suspended, false);
 		} else {
 			pr_err("%s called for a chip which is not in suspended state\n",
 				__func__);
@@ -4743,7 +4789,9 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.lock_area(chip, ofs, len);
 	nand_release_device(chip);
 
@@ -4764,7 +4812,9 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.unlock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.unlock_area(chip, ofs, len);
 	nand_release_device(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 51fe991358d6..1d71a65bbd01 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -713,14 +713,17 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
  * block as bad using a bad block marker and invalidating the associated
  * td->pages[] entry.
  */
-static void mark_bbt_block_bad(struct nand_chip *this,
-			       struct nand_bbt_descr *td,
-			       int chip, int block)
+static int mark_bbt_block_bad(struct nand_chip *this,
+			      struct nand_bbt_descr *td,
+			      int chip, int block)
 {
 	loff_t to;
 	int res;
 
-	nand_get_device(this);
+	res = nand_get_device(this);
+	if (res)
+		return res;
+
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
@@ -731,6 +734,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 			res, block);
 
 	td->pages[chip] = -1;
+	return 0;
 }
 
 /**
@@ -892,9 +896,13 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(this, &einfo, 1);
 		if (res < 0) {
+			if (res == -ENODEV)
+				goto outerr;
 			pr_warn("nand_bbt: error while erasing BBT block %d\n",
 				res);
-			mark_bbt_block_bad(this, td, chip, block);
+			res = mark_bbt_block_bad(this, td, chip, block);
+			if (res)
+				goto outerr;
 			continue;
 		}
 
@@ -902,9 +910,13 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 				     td->options & NAND_BBT_NO_OOB ?
 				     NULL : &buf[len]);
 		if (res < 0) {
+			if (res == -ENODEV)
+				goto outerr;
 			pr_warn("nand_bbt: error while writing BBT block %d\n",
 				res);
-			mark_bbt_block_bad(this, td, chip, block);
+			res = mark_bbt_block_bad(this, td, chip, block);
+			if (res)
+				goto outerr;
 			continue;
 		}
 
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 7169c014d197..cd0d7d20a1d6 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,7 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
-	nand_get_device(nand);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..90b2169cc745 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1264,9 +1264,10 @@ struct nand_secure_region {
  * @pagecache.page: Page number currently in the cache. -1 means no page is
  *                  currently cached
  * @buf_align: Minimum buffer alignment required by a platform
- * @lock: Lock protecting the suspended field. Also used to serialize accesses
- *        to the NAND device
+ * @lock: Lock protecting the suspended and disconnected fields. Also serializes
+ *        accesses to the NAND device
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
+ * @disconnected: Controller resources are unavailable; reject hardware access
  * @resume_wq: wait queue to sleep if rawnand is in suspended state.
  * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
  *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
@@ -1326,7 +1327,8 @@ struct nand_chip {
 
 	/* Internals */
 	struct mutex lock;
-	unsigned int suspended : 1;
+	bool suspended;
+	bool disconnected;
 	wait_queue_head_t resume_wq;
 	int cur_cs;
 	int read_retries;
@@ -1595,6 +1597,7 @@ void nand_wait_ready(struct nand_chip *chip);
  * sucessful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
+void nand_disconnect(struct nand_chip *chip);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


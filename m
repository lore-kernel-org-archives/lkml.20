Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446915;
	b=gIl6FSjWR4QMC/JpxKcMGkM8DdVg5aT78pOQ32CEKIINjOW+Y+SGbeTxeSAAteg1Xbm2
	 4ltelhHr74ZFlYkXGdormbmDeE/o4cyAvhSDQv3LqUbNDs4M1es95j/U6/Oae3uZgUrFA
	 272B14SoxRTcDfzMUTnQ0jUzrUzqhRITdAxztStxhiV/OSOvxNnGJVm0dedUKlt69b77c
	 CuEVm62GK7RszoHyXUPH2an5Antd9PffqxGHSG1ZHNWQqAh+LJtubDJWVCvY0iClBLhVI
	 NmbPHXGb2lr7UaEA2Kl3tyjiact2nRsbZl+SI3wTK6loAIkgy4nHo/YJD6MsENFPfIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
	b=D1QoeGQ2oY76gctHwORPZVbqc+SFhYbnjMaFGn4PYnRVn8eYZPn19G3PNsQ3uNmNIgy8
	 WCH8N91/YdVE7ITP8CvyS42ABEoUKHlltsvenWnityRVrpejAHPEGK0rjIfAneF0ypOwL
	 nQQ3AJZhhR5xZsut+UPGLmcG1xdpk+98bv8p3Wo/k8+xZnlOZsKiNYJTVb7/Eotkd4jaZ
	 Hh4ohSzbUIAHlwyd8xT/dTc2H9jpgow3W3nK9vjNtdl6R5UPAv3BtVzGFeIwG3BWGB2Ki
	 J2m4Q73GadSUJTm3aBR7dNCsQIei8l6uCm+H+zdHua92pyDcryt635poKa2ZfH18v4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="U3/8hxWk";
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F0606A89D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8F0606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3/8hxWk
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-563a0462094so1890218b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446913; x=1795051713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=U3/8hxWkMYVSDLJPGelk60Td/iI/cMFSYJwJt4efgbcOkXgi6x04+CGZAWmMl9wr3f
         jOtQsJ80TNMEDnMq5qXCh3CfGY3s0il+J5Mv3hNbW69OPAbnMbtEYG+al4iNfqZ97F6q
         DKy1bSAAzfSKWStQ2XfNsEDdgORW329Vq0iyFqEIHOQUDobezq5xn+gvFjJVrLBLiP72
         zxA7dc2bukQWKnCqIW3o3p5C4HUNoBb6R2jsLVs6P4cMvY2dqBqpu8os3muIRUqane2P
         voC/CFSjvSC7Oh79evUzUUvwUQjgHIE+mhq+CszryGMZjWOfRQtIe2QbkSDir+WQNb6S
         9cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446913; x=1795051713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=LMaf4xfCSDsU23gKzpqVcSBCHkDu7JM13Ccr1tE1Ees8eIfrJYvYqhUcI/2JfK8SeP
         QTGYmdgTqpctgjsgNes1k54voKDYDTOil5+HcrPd/6KSuytn14CKHSiwpSCxp9GfKAbb
         MTXtLhSXnYq0YqgYnEtyKK5nEUmMxg0xZ3vCcqo/vVWRxTbnu5ykkkeEDrAbnLJw18Xw
         vCtGMpJAmO7oyqJU7Tboh9Od2Z79qsFoDAGpa7KGTI7tudy6z+HOX1yl5Sgj+zgzY16S
         1a/+Dl3qhqGqhep+YsFjsU1za2J+jKfxsXoBBPqjnCQDQsJZvMn5ZTomD3ThVwC6u/uT
         XC2A==
X-Forwarded-Encrypted: i=1; AL+hErESvSdjsR1GztYD1jryHnb7e/rdWeVpNHF5wimO+ghWpPb4pQK2O6HCFIvURRYM7WEKt9D57IdBiN8kbYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HFq7AQMwpdfN0DbQqwjYWkOcH8Qux3fZ3OuGsXxLEaa141l7S
	z1Wui/cHDCoFXfp5cG50KB4wN/mpnUHTGtcJ3SznQLuvYMx/lRa0hnWHo6SyTher
X-Gm-Gg: AYBFou0/6eIQEynpHoVHZ1KeFsCGraO5shLDzERr1AkQaw8w+3kEwPjGck7XJhY3icA
	3aSMwCWfVq1MmDZT2WU1JeN8vkM/LkSerzKUmdCUu6I0RqVctdjv7VkhUo/tu9EQU1rPrRmRaqa
	GGrla9/+5sP4jWzaPzilEzsZJ3mdEVlDfHrRDrWyCrkNC5W1z/bUaq9MwcvXtg6rvPz7ZvFni9J
	58rccJRWI6d43X8INL7QZcOXFeRc25fYNIebL7dgAey8e0gnzuEmnTE4AtJAV1MIS4Fkgo3fRS+
	eTRjNUjwQs+a8Mc8wUD3imvFZqx7iki0vSm9tI9HEA8VLQJmfDzplTot7C/YhTjoyN5yQSpD2G0
	ABWf4daHIS/qzG022Nkr1DCY34e/gWtWlUSGnc6T6A51dfZu8u4qNH0FHaxdN1R42OBl9ucIOyc
	esCMbzFtx9/V2lBUHxy2yV+Lvjvrp3c/jKMAhYcVI47VfOA+p+wrhS3ZiDSf+sbRFkz6qEMKjUA
	istJdCcTmSk6IbiRktX/5pIxyDdisL3E/f0oU8Z0eTvXN/eVgOOAhJONPMaRp+FIaCk1iLrhnmE
	ilsLWIrZsXxl2gixcXA3MKpIednVnXSqV+YPGJqoBZSxmdVu0e/Bt2Y+mVzkHSDWXoh/UMpF8w5
	ooikBkRCkZnWXNCdYrQLTt+y7sGXTuvU6IQI0eZzLJC8aHzHkT+WlnPO2mMeMmYpZyUMOzEGxXx
	Uy/0JCAw0zUnPt0+DSsbJriedWHyqyQXz1c2WmgZAC7kodYDXvETWygETBaJEOWk/HqTBQEdh07
	w==
X-Received: by 2002:a05:6808:6707:b0:557:308a:9e9a with SMTP id 5614622812f47-56b96bd15bdmr3684439b6e.21.1794446913436;
        Wed, 11 Nov 2026 17:28:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:44 -0700
Subject: [PATCH v3 05/58] mtd: rawnand: separate hardware disconnection
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-5-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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


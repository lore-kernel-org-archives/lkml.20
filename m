Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794179631;
	b=jUyUAmbHdd3PYDRuk867G0vnikGrxDGTLRpSGJd+OHZ2n5HDj4TnbpiGnUdfDSKmn6ba
	 rienA11WagrNzuC5AVIDIwtsyWDcLUtorr8gpAZzRQNJLdP5SQIR+uoVMG+vYD4UuNN0f
	 CJc0XNf7iLplNbA2731wlEVU8VOp3rbYJU9m08euYpar9qmknUe3ORmbtU1XktQjaJMYd
	 WNunrnzxL6a4eixfSupw76DghmNjaz7oKHCmtZ2omkxHARHAeCSIVv5xYPyO1MiB/P2Uq
	 1EbuVlkaSH+QZc3xNP+OOk813Yti5pCiLMmqm8csoyaPt2sDnxfXk4iYBWljlao5Uug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794179631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zMgYc/LH+39KF5WFc6nQc4tMwI5XGyz5B8atapOp6WM=;
	b=skPddb0vA+NP6+td6KpvJCjRSTA6LhbIg7H+wnLUhsS98kjU+Tfr5J9iswBBvMVo0Eqs
	 Um/aXmtoW03aO3k+MB5kM0fe7nS55M9oJX6TNoluIsVZS+Hs0tu8coE3WPcQdaKvaseGm
	 Z1vhTwxuu8pIebtamRZKb8AHP6j70n+qgBUteAEVnZFEDAvr7REeZhjgNx7z2BlWztTKo
	 TCHZJRxAvUrf1irQ/PBm7YJAcoVTOMdUwsWUAgPfKP7MZIxDmcZk28SIox3dZZrpTh3aG
	 SOwjRm/LZVWJxKYOTEU512hHpYn0l5S40ROjrCgOzNLMkIH39dV6zzX8Bd/SJe11k2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YnTJ+NG;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED724606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED724606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YnTJ+NG
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so190321fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794179629; x=1794784429; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zMgYc/LH+39KF5WFc6nQc4tMwI5XGyz5B8atapOp6WM=;
        b=0YnTJ+NGoYYfwqwHCU/2Fo53n/qkTo+8HCto1hz2LUHsWf5p24who7ozVUXgOIF7V6
         yj6LM0854P/R92H5MCv7OupWp5O1cY1xBVoUOwc4znGbZP9Fg4h1pi+k5uI87TOSC1Sw
         2aSeZezpsz3+wZFIZopxZsVkWX6pR8a8SgYHcoduBEJTK4ofZkgx5AvtCtQY/UYkReWX
         ZQEs76G/1jAbfZHS/YiLC/Qq8XqntfsYmmJVzheadPsK9n4b9qxrlMWqFgnHqrzoecGc
         rJuittxi2QlZzG+PadHm2nuxB9TpAecNYXthLcGwwRIIOiU9i8Ue3DaXTT5euHE99xv1
         tkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794179629; x=1794784429;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zMgYc/LH+39KF5WFc6nQc4tMwI5XGyz5B8atapOp6WM=;
        b=zOyRxJK7L1SlvfuKsE99fqTVexV10ftGz+8YKMIWGXo5BoNeJmFGN26MRO8KJwXLaL
         6xTSb09guacxQV/9V514nY2YQz/9VDCMAYe95byFq1uuXD+VNPIAbgF+LfBAPnQEzfrU
         U0jnmX+w8ibF+nhyzex8AlOGKSeSyHEvZbcIMfW9R3dhn97hpeSKfu8DWAn0kiJD50a2
         weMJG2eCiwSTkbV5V2hn0zvp+dFYT1Ne0qAs/Bn4ns1yaUtSe1Lt7z3rlQSFNOZUZiKP
         FazedvcORZuQjGGVo4B9ohjNSE0l/gPm2X9ZjaRFmMMxnFjr75C5N/d57GBiylLGxSl1
         bkMg==
X-Forwarded-Encrypted: i=1; AL+hErE8vRxeZpGg9vXBSA8Mz9hYiqkjynRm1NkJusR37MJs1F9RgLOa90PNWXvBl/Apyz8hvwunxAuXg4EBrOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Itfc/0ikQ/H2RjRR0Ax1AvrcIJl46eaTZXbIsthsBknTKlZRA
	lHgteZKSMW10OzchntC05vxFNQAQd7IcJvnF5f7nI0+XlHoSQUpw80tD
X-Gm-Gg: AYBFou3iow0P47GyO6eiVsJQ0Bw95js6QmQ0wkdQ5W8RuZBI6b5LtB8at3M6d9MuyrR
	V6eko1xFSCwHxeBhAYd2mxExpALebOOg3ht66rRrTEoIAovY/MgMXKAiMFKLTpHEfJ2CDhlHgrl
	EwXbiGBQ/oBsh92CT32tWQCw1MzdFKGasqroZqzn0JcT4deompg7tABMYKBuRWJKRjXFTBhVEoa
	wvaUIIVryl2AikgC5hFNcwT3/75FlqvJXdJwhFo1U8ov3i4PO19cvfjBHc9AqyTJgOy4H4wu3A9
	V3KASlA2v18Li6P6rX4SZndWhSynMpwxOdGZxa4cXSu54vLTPfPbB3yGFSy8iEHr0xeN+koJ25n
	xMeKeclNxxx4IJTzHLtTrAjXDUQ5lPTJP3C7idRlP3GxJB1Y8/36ytHR+KCwuQnHafqyUJDYnZU
	+eqgPaEAWZHs0SaCl2rxd1ijT3LRCcIGJPCrKeM4LwMD9NEc6QCF48emtAigWgy10+9rk8q5qnc
	QPBmcALudqlONInzG88PwTYA1cU9p4JvToYaj+EJAC9f5m/3OCh2WXQ5bhgygMmF24aa0QH+MPZ
	50lbODDvEEZTKDcsKsDYcZH7schubb+3N9h1jsnMyz+EKjsSWOc1wv9azG/Prqjnw5M4/tVmR33
	pBMMrZyXKHQbfGiah2pH2TlO7extXOrLEjN7QRS/GzugZ0hWiSIZBKKduyrqu+d2W/alc0fJoKB
	oH2Zjyvfguz0VqAM1xuI8MRCyvIRyYRsdDkOqhgjoyU59x1izDduvLnYC/Qa0FPrZAhRss5ZPg
X-Received: by 2002:a05:6870:c26d:b0:4a6:f6e2:690 with SMTP id 586e51a60fabf-4adec9a3f30mr1367311fac.22.1794179628828;
        Sun, 08 Nov 2026 15:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade647f24esm3362985fac.1.2026.11.08.15.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:13:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:13:40 -0700
Subject: [PATCH] mtd: rawnand: r852: serialize DMA timeout cleanup with
 interrupts
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
Message-Id: <20261108-submit-r852-dma-timeout-race-v1-v1-1-6b24c6368de6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBBEf0X23KUmoNj+Sulhk2zrFhJLEkUQ/
 921vQy8YXizQeEsXODebJB5kSJTUjCXBvxI6c0oQRlsa3tj2gHL7KJUzENnMUTCKpGnWQvyjIv
 Bm7NdH3QePINavplfsv4eHs8/q+LDvp7ac+GoMLpMyY9nFWu4JkoavFbY9wPzHP/uowAAAA==
X-Change-ID: 20261108-submit-r852-dma-timeout-race-v1-9b256d202dce
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

r852_do_dma() calls r852_dma_done() without irqlock when its completion
wait times out. A completion interrupt can finish the same transfer and
unmap its buffer before, or concurrently with, the timeout cleanup. The
second cleanup then unmaps the buffer again and overwrites the result.

Take irqlock after the wait and abort only if the DMA stage is still
active. If the interrupt completed first, retain its result and copy
successful bounced reads back to the caller even when the wait expired.

Publish the active transfer state under the same lock after preparing
its buffer, and clear pending DMA status before starting it. Ignore
interrupts for an idle transfer, including error interrupts, so they
cannot release an already completed mapping or signal a new completion.

Use the active stage to determine mapping ownership and clear the saved
address after teardown. A streaming mapping at DMA address zero must
also be unmapped; only the persistent coherent bounce buffer is exempt.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204135@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..12877dd14683 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -12,6 +12,7 @@
 #include <linux/jiffies.h>
 #include <linux/workqueue.h>
 #include <linux/interrupt.h>
+#include <linux/lockdep.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/delay.h>
@@ -124,11 +125,11 @@ static void r852_dma_enable(struct r852_device *dev)
 }
 
 /*
- * Disable dma, called from the interrupt handler, which specifies
- * success of the operation via 'error' argument
+ * Disable DMA under irqlock and record the result of the active transfer.
  */
 static void r852_dma_done(struct r852_device *dev, int error)
 {
+	lockdep_assert_held(&dev->irqlock);
 	WARN_ON(dev->dma_stage == 0);
 
 	r852_write_reg_dword(dev, R852_DMA_IRQ_STA,
@@ -145,10 +146,11 @@ static void r852_dma_done(struct r852_device *dev, int error)
 	dev->dma_error = error;
 	dev->dma_stage = 0;
 
-	if (dev->phys_dma_addr && dev->phys_dma_addr != dev->phys_bounce_buffer)
+	if (dev->phys_dma_addr != dev->phys_bounce_buffer)
 		dma_unmap_single(&dev->pci_dev->dev, dev->phys_dma_addr,
 			R852_DMA_LEN,
 			dev->dma_dir ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	dev->phys_dma_addr = 0;
 }
 
 /*
@@ -175,19 +177,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	unsigned long flags;
 	int error;
 
-	dev->dma_error = 0;
-
-	/* Set dma direction */
-	dev->dma_dir = do_read;
-	dev->dma_stage = 1;
-	reinit_completion(&dev->dma_done);
-
 	dbg_verbose("doing dma %s ", do_read ? "read" : "write");
 
-	/* Set initial dma state: for reading first fill on board buffer,
-	  from device, for writes first fill the buffer  from memory*/
-	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
-
 	/* if incoming buffer is not page aligned, we should do bounce */
 	if ((unsigned long)buf & (R852_DMA_LEN-1))
 		bounce = 1;
@@ -209,16 +200,26 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 
 	/* Enable DMA */
 	spin_lock_irqsave(&dev->irqlock, flags);
+	r852_write_reg_dword(dev, R852_DMA_IRQ_STA, R852_DMA_IRQ_MASK);
+	dev->dma_error = 0;
+	dev->dma_dir = do_read;
+	dev->dma_stage = 1;
+	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
+	reinit_completion(&dev->dma_done);
 	r852_dma_enable(dev);
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 
 	/* Wait till complete */
 	error = r852_dma_wait(dev);
 
-	if (error) {
+	spin_lock_irqsave(&dev->irqlock, flags);
+	if (error && dev->dma_stage)
 		r852_dma_done(dev, error);
+	error = dev->dma_error;
+	spin_unlock_irqrestore(&dev->irqlock, flags);
+
+	if (error)
 		return;
-	}
 
 	if (do_read && bounce)
 		memcpy((void *)buf, dev->bounce_buffer, R852_DMA_LEN);
@@ -766,6 +767,10 @@ static irqreturn_t r852_irq(int irq, void *data)
 
 		ret = IRQ_HANDLED;
 
+		/* Ignore late interrupts after a timeout. */
+		if (dev->dma_stage == 0)
+			goto out;
+
 		if (dma_status & R852_DMA_IRQ_ERROR) {
 			dbg("received dma error IRQ");
 			r852_dma_done(dev, -EIO);
@@ -773,12 +778,6 @@ static irqreturn_t r852_irq(int irq, void *data)
 			goto out;
 		}
 
-		/* received DMA interrupt out of nowhere? */
-		WARN_ON_ONCE(dev->dma_stage == 0);
-
-		if (dev->dma_stage == 0)
-			goto out;
-
 		/* done device access */
 		if (dev->dma_state == DMA_INTERNAL &&
 				(dma_status & R852_DMA_IRQ_INTERNAL)) {

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-dma-timeout-race-v1-9b256d202dce

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


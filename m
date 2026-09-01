Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B8367B9C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291079; cv=none; b=ez6qzEp5dYr9A9gVKL6fvxR2fCavc1bugRSUEzw1xDpOx3O6JT0irhnxLpzNOGlRMP1X+wVndKuzcpYUtqu4xCfIGYdpm+d0jtTbnhJ/Zuk/tIb8WyC0xAPPAQzpo/ZaxGEfXjsuBWcshW9ou4kXs+D60gGubDDv9AoholAHv2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291079; c=relaxed/simple;
	bh=HPaWff7ad15+/qqYBb80wqQI440qqNuTh1fgXKQhG7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQXJ6aZqrdZp6jBWgN/K2LN3yYpWig85hj/OeBG+I4hvHDMzmFAuDrPjhLbYOxErn6mxAYF35cVPTh9n5q5atYiPpSVAr7H+W3EFiqE/YqPlq56uuf+8RF+Ji018MtOAyV7oR3u7Hph0sIiLtuHe+99M6juElpBoFyoYKvHxuR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB1NDn2q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB1NDn2q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so189249f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291076; x=1788895876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXWnWPL9Jm6Pf/hUBZqLJE4XryHGv8N8tEe8FygrKng=;
        b=hB1NDn2qub/pkLjnlxhqsFqbt4+5rj05IuqsKgZPyU2McJWoT6ZmGGdlEsg2NY1Lwy
         rfAWEGP+ZdCbA3OxHMNJNMlB32jqBIY5tAn86Al0dsjIDpBHY1lQhv9B7s8FQmk5FHaS
         4tAi/mSZIE1KFSs4Nv7MBDYKLxCrQJ44kn7hgoFJ6IFc5KfabQKilPA0M9tB1H4+ZMcK
         HxkeHeR8O9hncJ8lReCExG2cxX87DkJA6UQMFoc1K6F27xU0MOkF5gKnwUhPf+6DDr17
         5qN7h5cxj6VcWRY4bJ5BN8PlQWH9xJSKY5dq8nUYsXuIY3AQie8MNNLT92j3DJSgyHVB
         HnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291076; x=1788895876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXWnWPL9Jm6Pf/hUBZqLJE4XryHGv8N8tEe8FygrKng=;
        b=WxY0B4lLgjW4+NvQrn3TzS5qzrKkMLAqukWadjmU19JLAagLtc40+7HQ5mX36DQOaz
         GQlf9HclbZx9yTaKwEzbL89rA4m9u2PJG19GPPNndgNc/i5MUuJyFqKqY1wXFkAt1rQd
         nyP4FrRAqsrGLvFFB06D5iTLJseluK5ncSEP2/eXc7RCy0Qoqrr+1YYoXu+xcxp2JHew
         XDHgTzIEZs1x42/ZXatPRt6rNh9rbBw2Jv5WlMx1FsnHha6XCLn59TBo0pMpAfBECQKj
         l1RTGU56p4cYqs+zRWK5+DaH6qv62IVBpM2ZwrC0fX/yMbeh30fvgJyxVsBW9JmgbwzL
         N/pA==
X-Forwarded-Encrypted: i=1; AKwUvBxaQ6yYedQMWIvXmeE8XYTF+/eKxw0SfIw+hiZ1RIizkX4RhIMdqlrFj4XK9R22GKWFxo2UpFu4UlP/feY=@vger.kernel.org
X-Gm-Message-State: AFuF++leez7Ef9y3Nz245UFosUFhkaIcStHcu2zPhUqV2id6EzPtx6AY
	4BLomL5DqQXsFO1q19hv6tBCUt7N2w0alDMjBo6IpgUGJNycgMR7DabV
X-Gm-Gg: AYBFou09q1v0LLC3Rt31I2BWK6W+jsp8fBPOAlIy4vqmO5YiIcs5EwE/sOgO/DORFyf
	nMpmhwSpXrJQB3r53jdAIruFGMMayIM2ifpkQMQwr0nHFKetOnci4tiXhB6gCBsWTiFYtdcUaWo
	XJIg4DMBgBSaLHYbnFLB9kJW58fOL9bG6dMefdH8ZtXK+xV1O+4uM9Drk5RnfQqjHsA7LjIyWUW
	QEO+NUfUjULp3My+Y9z8SI7LMsFtzJ5hFIiYcGS0pNpulcaGfIVBsFDfbeaPpTpRRaTfhn1GANj
	oo+QxBemnwE5aOJTlurq1fCleOmmmB2M+D8jApnql4v3wZq2pQEXW3gTOdnJaLDmCX1xSavDPWA
	YPw7CJ7VPMYDWcs/qAq1dLCvMJBkL8E2ddZjh2XiY4tJxtflH78eRO2oCc2vyfY1JNfWUxg87AN
	eketcqyY33yqseck/MkZg9SeGRtbQVeKZHh3g/qWGSr5AN43s9T0gQEAdek7nOTimIhE/vGDRsz
	CRxHK6LkD4mKI2Ui/NowrQjx6iei4t9q2g1DS1mcc6Bx1T9aGthZSwa7MmLOV0VLtdfMdx2FPD7
	5Wkjsg==
X-Received: by 2002:a05:6000:4a07:b0:484:3317:a19 with SMTP id ffacd0b85a97d-48449f818edmr884955f8f.26.1788291075936;
        Tue, 01 Sep 2026 12:31:15 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:14 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers
Date: Tue,  1 Sep 2026 19:30:29 +0000
Message-ID: <20260901193100.1352110-3-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901193100.1352110-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
 <20260901193100.1352110-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_schedule() enables the SOF interrupt whenever any pipe has
next_tx_frame in the future, and leaves it enabled until the transfer
is due. An interrupt endpoint keeps such a deadline pending
permanently, so a single attached hub (status pipe polled every 256ms)
costs an interrupt on every SOF - 8000/s in high-speed mode, forever.
On a 300MHz CN5020 that is measurably ~20% of one core spent counting
frames.

The frame counter is resynchronized from HFNUM at the top of every
poll, so the driver does not actually need to see every SOF to know
when a deadline arrives. Sleep on an hrtimer when the nearest deadline
is more than a few frames away (one high-speed frame is 125us) and
keep SOF interrupts only for deadlines that are imminent - or far
enough away to risk the 16383-frame HFNUM wrap, where the interrupt
path still tracks the counter extension.

Measured on a CN5020 board with one 4-port hub attached and idle:
8200 -> 4 USB interrupts/s, with no change in enumeration or transfer
behavior.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: corrected the core clock in the commit message - the board is a
    300MHz CN5020, the 500MHz number belongs to a different board here;
    added the Assisted-by tag (Documentation/process/coding-assistants.rst).
    No code change.

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -378,8 +378,22 @@
 	struct cvmx_usb_transaction *active_split;
 	struct cvmx_usb_tx_fifo periodic;
 	struct cvmx_usb_tx_fifo nonperiodic;
+	struct hrtimer sof_timer;
 };
 
+static int cvmx_usb_poll(struct octeon_hcd *usb);
+
+static enum hrtimer_restart octeon_usb_sof_timer(struct hrtimer *t)
+{
+	struct octeon_hcd *usb = container_of(t, struct octeon_hcd, sof_timer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb->lock, flags);
+	cvmx_usb_poll(usb);
+	spin_unlock_irqrestore(&usb->lock, flags);
+	return HRTIMER_NORESTART;
+}
+
 /*
  * This macro logically sets a single field in a CSR. It does the sequence
  * read, modify, and write
@@ -1908,6 +1922,7 @@
 	int channel;
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
+	u64 min_due;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1948,15 +1963,33 @@
 	 * future that might need to be scheduled
 	 */
 	need_sof = 0;
+	min_due = ~0ull;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
-			if (pipe->next_tx_frame > usb->frame_number) {
-				need_sof = 1;
-				break;
-			}
+			if (pipe->next_tx_frame > usb->frame_number &&
+			    pipe->next_tx_frame < min_due)
+				min_due = pipe->next_tx_frame;
 		}
 	}
+	if (min_due != ~0ull) {
+		u64 delta = min_due - usb->frame_number;
+
+		/*
+		 * frame_number is resynced from HFNUM on every poll, so a
+		 * deadline that is many frames away does not need an
+		 * interrupt on every SOF to count them down - sleep on the
+		 * timer instead and keep SOF interrupts for deadlines within
+		 * a few frames. Stay well below the 16383-frame wrap of
+		 * HFNUM. One (micro)frame is 125us in high-speed mode.
+		 */
+		if (delta <= 4 || delta > 8000)
+			need_sof = 1;
+		else
+			hrtimer_start(&usb->sof_timer,
+				      ns_to_ktime((delta - 2) * 125000),
+				      HRTIMER_MODE_REL);
+	}
 	USB_SET_FIELD32(CVMX_USBCX_GINTMSK(usb->index),
 			cvmx_usbcx_gintmsk, sofmsk, need_sof);
 }
@@ -3646,6 +3679,8 @@
 	usb = (struct octeon_hcd *)hcd->hcd_priv;
 
 	spin_lock_init(&usb->lock);
+	hrtimer_setup(&usb->sof_timer, octeon_usb_sof_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 
 	usb->init_flags = initialize_flags;
 
@@ -3696,6 +3731,7 @@
 	unsigned long flags;
 
 	usb_remove_hcd(hcd);
+	hrtimer_cancel(&usb->sof_timer);
 	spin_lock_irqsave(&usb->lock, flags);
 	status = cvmx_usb_shutdown(usb);
 	spin_unlock_irqrestore(&usb->lock, flags);
-- 
2.47.0

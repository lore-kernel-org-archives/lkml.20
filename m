Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171244A3407
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853440; cv=none; b=pLLz52r0oSSD0oLNQnc0WTjNEbxa4NI1ILiamn+9+HAy0n7QHob+sXP4C9EHM8Anqg6W/Hvgn5BO2PcOq+4gH8UfwPR+wjMvwHBX11DF+9xzATBnfH9Ej8DvhWqiGbman0glwuW7R18B0O8/vLF4X4g/sfT5gxRW+mO8DHe5H8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853440; c=relaxed/simple;
	bh=cFow8mmsLDB07/zPkXTBq2WrPcE7xOsvUQjMsrTrXWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOK0AaFbMwpNDihUmiSCHCD4EVtcm3Z821H2QCjJQsqgR3SvFn28xPMvF372c0/RcpT0Ptu2dYTInFDeyUOHsNBA2kKJJSjfOEmP+hNEHKEomCOtm4e+mxE+rlwJ0vOLSPZgVLGpuLygq541UbZQ6W1cdbozZGhSeZmPh2aUbtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUSjaNvh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUSjaNvh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f84023916so85999f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853437; x=1788458237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msHPXb4xVBASBxcWVm54PW2v9v50vhp0zhhZwzN3qSA=;
        b=PUSjaNvhEkxvyklQhOhDRqGu23QEbTAfqH7yftfT3dpnRSbKZDmqc70cRC0ZLlVa+m
         DqnvVfQ5mcrGDIugJujWkftY7f5gGN/nD23nGXf8e/hIKzUNblksrVUoviNNUTxA+vPr
         kFxdXyI3A1+DivHwlb05OTFtGm/n72NAQCkcYmhXFWno+y4TLapeFdf8jnr0T2SMjHYw
         v+61zO5Tuw3RrXOegPxg2wqNf7EofnsVVFH5hB1cXfRQSI1Pyk/RJFsHPD/qjrprpz4q
         onVN7NhYepJvkDX+XhV62EYos3Tck0bWicSR1v35kxakvQhq4tylAULHs9/S9dJZ0AaC
         fJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853437; x=1788458237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msHPXb4xVBASBxcWVm54PW2v9v50vhp0zhhZwzN3qSA=;
        b=DQ1quvYlv4oESeDfBV1TdnMfiMrUU8e45NC81thQr8SKKtE9xk3J9SX/i8p3IQ4kBq
         K/5YciQJ0vPEpD+NaCOSHXtytmjZXb1BiHzrkeZrRN6Ig22/FtdvG66Idtkis5xJHRek
         DmlLfARC3Y9KY7d66xpexJKeZsZHQNuhFfnl3bZiqWsA4WT3L/u9b/YzZiFT6Hq5FfeN
         yEEIFsY4TnP8DairsFCfPiI3+cXj3NbTCp1SuYT8d2/53LsCFfQiuna/R5RFRJYY8iTh
         KjA7InG9tW3SDjQPsSBgsf5y+Xmh89zaxlkYHaeIxsq512QR76CNrjVgMmytbG36SR8y
         B84w==
X-Forwarded-Encrypted: i=1; AHgh+RpQz+fASqqC8HJYbz0oTxApmklpSdGH0jVmvQUC2q8Kv0eygWZonHanYvuqiqoI/t5JhyNvPRrSy1RxQAE=@vger.kernel.org
X-Gm-Message-State: AFuF++nuBFr1bVP4H4fCT5PhFdRVAY2JVCY6wmKc5d2HgkJPjOfY6+6R
	1A0PXUJ/tKeObLHDLT3stiGZOh5c5srY2HSKK0RMvx5e4t8Wt1ZTfrPD
X-Gm-Gg: AR+sD11P7nG8pVdo/8fFJBEzgzW26Y3Wvl9TD/GbPC/yQltzqfArXTXyhtMkK+UStHI
	3WACaGNG6FAhMV+kFKMsZnzZNOx4f4xhPD6a8G4C3oVJnveORgWjIcDEu8bWqpZFgIstCpF+w8u
	fykJYsOn0ZLOtrQqcVpDqw1myqVKz4aQSNNwO47p2+eoss2Fqhx3N4TzxU71SduIC3Fld56z0wj
	w/VDqpAVnXaT4HtKxfqcpNJoTfkR6JqdMyZ6PMTgqgMRlTO0gap8TsjDCt31zfpAxXv69KPEWqd
	CiYbDw2sx5EIXLkDG9hpNlSSAAEiI1VpsXZq1dWHlGrZ9Jksgfl48DTJVZXLBuRl3CiJQaCe5VA
	vX41Ev9bizXr8Yv/3h3C5KR6IGw4vP9BZNJgOwKKAcF4BtRlxiVUkPmuovKK1dwLM8h3o3jDAPe
	h/uYDV90S5iFYAkVDVJxXtnHvNEVrUNx71X18f9Zun+8GWtN61aKhvp91CFVtjWBHjVLv0ilsq6
	q1YHt10xx5Kq/ozHEruE5F0VLuTsiOfkxwDFglfe9Bn
X-Received: by 2002:a05:600c:4452:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49b91c2e42bmr10483065e9.7.1787853436758;
        Thu, 27 Aug 2026 10:57:16 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm82921295e9.4.2026.08.27.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:15 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH 3/3] usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers
Date: Thu, 27 Aug 2026 20:57:02 +0300
Message-ID: <20260827175703.1549-3-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
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
On a 500MHz CN5020 that is measurably ~20% of one core spent counting
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

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

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

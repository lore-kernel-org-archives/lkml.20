Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362C3803C6
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439937; cv=none; b=nPEmlOqU7Bit0j3NK/1ps7prTfoEBmVV7dXgnILugeoNmqg2qs6g2q+IG2613UW9oYFxQbKD9Ep+o2x+E82TVFIaKxC1NQdhzb59+p8VF4/q6AHNnIPAEhYcZuNmZ7NL2zwgoBPROW+k6q9oDmEx4JAeo6l2cTZ+c/g89jx0NRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439937; c=relaxed/simple;
	bh=GiLTx1fkhx8yG7X6K9mjE54jwkCBrB2Fu6pZDDSAyrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UhP189gMOygJKLSM9QFgxsBw7nevpDcAmrQLIUK6Lvic7KU68YyN7h9t7mUqZi7DEg2gjLrMomY+qBg2bCO5qHwKZ7L46hOA7XnU+lB9O5qmzFWxL0JlR6lXiLZrMItvlBbM19NJRrgVC0RjGd87TSWGl5jO3RbGnrNN1/VMNWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmv6eN0Z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmv6eN0Z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93c49cdfa4cso128671785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439922; x=1791044722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fg3dbwS3W1KU8abSpFzbimpRIYbTpSGslxm2lys07I=;
        b=pmv6eN0Z89n+/W0A28ck7gkM5yl5zAt4CQcPktJlI6ENaZsRdFF5wDidIJ/gRh4bWY
         Ld+txmckHc9vnJuRCrmWsx7GfwawXGc5dt/Y7qkG+nsW4e8Yd+uR4VjnezHxFnTXkl2P
         mvfnSQYGZPHjf4lkgPcCYEzlkDGmPrW1IpC/VoA0sQM2KJIxYrJTUj4DV0jch1HA8WbA
         FlSHktH1LgnTmzvJRNhjPid0ASMKC/CVkJzxloYGBxOmH+oaF4C1EgeAkGMRHcHypNGF
         7NJuWf3fcRnzHvgTekdCtAv8qNyWMr9I/pcX685h0JVr3SmwxcrkNsNaBIPi7/iDfDu4
         CfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439922; x=1791044722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fg3dbwS3W1KU8abSpFzbimpRIYbTpSGslxm2lys07I=;
        b=vMAuaJpR/65KeL6Il/e4KhAJsDXVXwXrPIZaF3NKWzAYSKA9DMThOdFfRNzTZaQoth
         v3wy5NWvUY61xf3gvl1NEZNa8pg+tpxB2yXnaVlvwLC+Kg/6txYACbp/uUN/3POBAhe+
         5z0ngXtAs17ffaabC0ipwb4a1IrL3LSUuobVcGYzygRpov7Pk+k8NNJOuMWzbA4uj/4M
         vJL67fHWfmTsZGf7U2I7kgO3b92mlsn2eCCDiQ7e9T2c+lFNbwsLcN+2zUgdBUyn9WUu
         R1bGMX3QbJ6Qv62zKwdeFEqSCYgD+Zrl/JYUNtYq/jf1QpAmGWghCiLyk+aIO1BESLwr
         MREQ==
X-Forwarded-Encrypted: i=1; AKwUvByotpPt90qf0MkyQOzvsnfjS0+gPj5FIRcHNBae/WeIGiq5agbeV7pjcQRjZhMlgfQrR+kruDMQdyIPWWk=@vger.kernel.org
X-Gm-Message-State: AFuF++liC5/yQ3f9YE7/gK5cwzIsIW72YI72F/pKoZU9NpQkuZHzjoIU
	XiuELA5pIoBkEIMpE10HVnx8/+Rqwb0C4VJUxoBBpjPx+R7/9bZmMUsM
X-Gm-Gg: AYBFou3VuzHMFsGX+Zsj8Fajas/7Rea/41rjKpJdgHCvUE7PXDq+dfg5HIi2b/Y3QRQ
	GiXrOCPYu/4KpkyeZ//xkdT2d0Y5vcBqz3FihiIG0z1Cl00Mmb3GVAFdTWvKixLGnhtmZpYhQXX
	eGTms32DjGgr/PjftuD/rAcZnKRPQwrFzknb7q7gCMQJG4eJzB+mqQJ9JZB1fjucuUI7BxQzhvu
	sLf4IHKtHUOs504OcGX/IGWf2clxw6cyVvevEb/8SAGy0cStITiaoqrhCPFHytJxAD9pwTeKLL+
	4p7Cqi+fwcG0vV0WJLyz/lh48tZ2cAZYpLf++Z7w2DCeILrRVWPdmLFWMYyVtRC5WNxdkPcTQqp
	+9KbSmfIQhZC2UbebrvDUbWyL8cHDMUhTFu7ts0Srh8iKfqNn1aaPPfDTXKxs905QWUIBVH1KL/
	V3x8ZxI8Ca+4crDoCGax8fChDEnFmz6WjRQPepp/G9u+pE2wmhrzbvdxWSSc+SOp0ckxWv5B4na
	WMMpb2/is1AYhyE3AVJQMusTsZXU1I7AcBaerue+9UfOLMO
X-Received: by 2002:a05:620a:1724:b0:939:72cb:bae5 with SMTP id af79cd13be357-93c43d6c35amr1003367685a.28.1790439922023;
        Sat, 26 Sep 2026 09:25:22 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a2bafsm42615726d6.7.2026.09.26.09.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:21 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:18 -0400
Message-ID: <20260926162518.25301-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 14 +++++++-------
 drivers/usb/host/xhci.c      | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..5a9bb18929f8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -243,7 +243,7 @@ static void inc_enq_past_link(struct xhci_hcd *xhci, struct xhci_ring *ring, u32
 		 * fixed in the 0.96 specification errata, but we have to assume that all 0.95
 		 * xHCI hardware can't handle the chain bit being cleared on a link TRB.
 		 *
-		 * On 0.95 and some 0.96 HCs the chain bit is set once at segment initalization
+		 * On 0.95 and some 0.96 HCs the chain bit is set once at segment initialization
 		 * and never changed here. On all others, modify it as requested by the caller.
 		 */
 		if (!xhci_link_chain_quirk(xhci, ring->type)) {
@@ -661,7 +661,7 @@ struct xhci_ring *xhci_triad_to_transfer_ring(struct xhci_hcd *xhci,
  * Get the hw dequeue pointer xHC stopped on, either directly from the
  * endpoint context, or if streams are in use from the stream context.
  * The returned hw_dequeue contains the lowest four bits with cycle state
- * and possbile stream context type.
+ * and possible stream context type.
  */
 static u64 xhci_get_hw_deq(struct xhci_hcd *xhci, struct xhci_virt_device *vdev,
 			   unsigned int ep_index, unsigned int stream_id)
@@ -989,7 +989,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
+	 * Avoid resetting endpoint if link is inactive or device disconnected.
 	 * Can cause host hang.
 	 * Device will be reset to recover an inactive link, so don't do anything
 	 */
@@ -1384,7 +1384,7 @@ static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci,
  * held for the URBs to finish during device disconnect, blocking host remove.
  *
  * Call with xhci->lock held.
- * lock is relased and re-acquired while giving back urb.
+ * lock is released and re-acquired while giving back urb.
  */
 void xhci_hc_died(struct xhci_hcd *xhci)
 {
@@ -1969,7 +1969,7 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 }
 
 /*
- * Quirk hanlder for errata seen on Cavium ThunderX2 processor XHCI
+ * Quirk handler for errata seen on Cavium ThunderX2 processor XHCI
  * Controller.
  * As per ThunderX2errata-129 USB 2 device may come up as USB 1
  * If a connection to a USB 1 device is followed by another connection
@@ -3087,7 +3087,7 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 
 /*
  * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * and reacquire xhci->lock between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 			      bool skip_events)
@@ -3801,7 +3801,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		/*
 		 * If next available TRB is the Link TRB in the ring segment then
 		 * enqueue a No Op TRB, this can prevent the Setup and Data Stage
-		 * TRB to be breaked by the Link TRB.
+		 * TRB to be broken by the Link TRB.
 		 */
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..db7310f15313 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -406,7 +406,7 @@ static void compliance_mode_recovery(struct timer_list *t)
  * The quirk creates a timer that polls every 2 seconds the link state of
  * each host controller's port and recovers it by issuing a Warm reset
  * if Compliance mode is detected, otherwise the port will become "dead" (no
- * device connections or disconnections will be detected anymore). Becasue no
+ * device connections or disconnections will be detected anymore). Because no
  * status event is generated when entering compliance mode (per xhci spec),
  * this quirk is needed on systems that have the failing hardware installed.
  */
@@ -796,7 +796,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 	xhci->s3.config_reg = readl(&xhci->op_regs->config_reg);
 
 	/* save both primary and all secondary interrupters */
-	/* fixme, shold we lock  to prevent race with remove secondary interrupter? */
+	/* fixme, should we lock  to prevent race with remove secondary interrupter? */
 	for (i = 0; i < xhci->max_interrupters; i++) {
 		ir = xhci->interrupters[i];
 		if (!ir)
@@ -2046,7 +2046,7 @@ int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 
 	/*
 	 * Configuration and alternate setting changes must be done in
-	 * process context, not interrupt context (or so documenation
+	 * process context, not interrupt context (or so documentation
 	 * for usb_set_interface() and usb_set_configuration() claim).
 	 */
 	if (xhci_endpoint_init(xhci, virt_dev, udev, ep, GFP_NOIO) < 0) {
@@ -3302,7 +3302,7 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
  * state. For software that wishes to reset the data toggle or sequence number
  * of an endpoint that isn't in the halted state this function will issue a
  * configure endpoint command with the Drop and Add bits set for the target
- * endpoint. Refer to the additional note in xhci spcification section 4.6.8.
+ * endpoint. Refer to the additional note in xhci specification section 4.6.8.
  *
  * vdev may be lost due to xHC restore error and re-initialization during S3/S4
  * resume. A new vdev will be allocated later by xhci_discover_or_reset_device()
@@ -4296,7 +4296,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		pm_runtime_get_noresume(hcd->self.controller);
 
 	/* Is this a LS or FS device under a HS hub? */
-	/* Hub or peripherial? */
+	/* Hub or peripheral? */
 	return 1;
 
 disable_slot:
@@ -4512,7 +4512,7 @@ static int xhci_enable_device(struct usb_hcd *hcd, struct usb_device *udev)
 
 /*
  * Transfer the port index into real index in the HW port status
- * registers. Caculate offset between the port's PORTSC register
+ * registers. Calculate offset between the port's PORTSC register
  * and port status base. Divide the number of per port register
  * to get the real index. The raw port number bases 1.
  */
@@ -5394,7 +5394,7 @@ static void xhci_hcd_init_usb3_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
 	/*
 	 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
 	 * should return 0x31 for sbrn, or that the minor revision
-	 * is a two digit BCD containig minor and sub-minor numbers.
+	 * is a two digit BCD containing minor and sub-minor numbers.
 	 * This was later clarified in xHCI 1.2.
 	 *
 	 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
-- 
2.53.0


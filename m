Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132896;
	b=bfMG53Xz8b4vrG6gMxdJEl1S2S63jF8DqiEtu80JWZysJGtv4F+Qrrx1KF7GWzWhrtP8
	 8Q0kIWagPqOlcCANRwHbOHjQ+2O4exnlHjSjFTl8jgwM6iaaJ4iBuy+Ri2xaQfk5uieOw
	 jfp0LwkLkRigf0/5jv7dYnLm16NS5sdGK7F28IQyXznV2RLP1me/lsnO/vN+mkrP72ET9
	 zV6ooipcx2nx+jkKgV/0M5NCoTZSiDEcoSTT2bamkuNYSo1TlpJrUwFsRIwLFoIkMl5EJ
	 Iy1dcuXsgkTFzfj4x7jktymV68/Aceaf36wP9iTq5k1WJPZ1J90onaInKjMcqJJaVPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2iQ+tx3L4TKif4AmX797rssrrjU2TyfZDfKcJHLEGJg=;
	b=v4e4ri1Vl+K6wi+4ekJXxooy8Vtl56mdIJpF5ILngHrVxoG/ndqXYt55pjR5rkdypC1r
	 BrRvIrriQ5rF8NcCztcGys6abK7YKqoGoTD5GwXXUhF2SlSF/9NPlACF27CLeW18Lsujc
	 xLTFnhCZ893MawzwsN4pNR+JG+IR/kYLK1RZqGY88YszilZnrQqzMHnjhrzA24jMUXdy5
	 gQNPGh6XPP/pToBdKw8E7R0x7tepwgyE8020UNhxQh57C1SVBVJbOiSx4hWo4pDgoCyJU
	 fLioxsqn6SuinF44gpH4gR9F0ufSk1z7VUQPpureU/kbMuN+VAmv9iGx7mT6yIeVy1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zj56en1S;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D39606A334
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D39606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zj56en1S
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c445c95d553so35731466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793132895; x=1793737695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iQ+tx3L4TKif4AmX797rssrrjU2TyfZDfKcJHLEGJg=;
        b=Zj56en1S/RDrx+w1dh5df9vlUjHwMy01DQ3IKvJb3zpyarpi0eX1oMWkaVu/NTStIr
         ZqQtPYI3h1+Xn1NGGsZnFQwTbOJC+7RaW4yEVXvnGXE9lqubZkKLRyDuiHYsy5bdMmee
         zFcTpKW8KBEArNFxDmfOcemNvV1xCnfvGI9YmbcPzPfBtJ3/Bf4bzIQoxz95SiEtxMOY
         ahICJthTJQip6jDfzcrhECQ17BEg0CgcwucXFS0WKQqfu5lsVcGUFl+To4gM1zm8VLXy
         jya/2k326AJSRVUPNc1OROfpqCBsiDcbvVVITSzEk95ckwK/n5WTxSWhznxe7ir+lV3a
         smmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132895; x=1793737695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iQ+tx3L4TKif4AmX797rssrrjU2TyfZDfKcJHLEGJg=;
        b=EFPXw+8mT6zHwbQhEHsxDl9SrIRRJ6aqFxhJZgNYoe2JBU0ponGMoHRO4KWoF8X8e/
         qf7WIRPHXC+cXzcx9XdQvWNyoTyMyZbZGr5Non84yttDPRbBM9BD3MM3nNrWyA1IlrUD
         8kZXBoxoJ6XFYK2uGWDaEbflvkck0bh4gVZsY6heJjd1YUHrXHIzDoC+7vUCa7ocPnkg
         vFdycqEzf+JzPWuC9HV2+AK5lvUUob+r1CalISDgVxgEgm5JO6Y+J8/l5j7zxz1MWWT7
         z7hTfT0tDrT4hmYynsmcJ9phorrpdpXVs4QYHDr21tPI/5u96Ae4m0gZVUaY4mBhYi2X
         xYGQ==
X-Forwarded-Encrypted: i=1; AKwUvByw/+eIFpJwWL/0NedkrTo1Er900Hl5AigU3tPS0sSzjr5QUn7UtJsxlw8oqD2NM5DTiMeyYClr0UmmGrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfvZrncT3v61l27+MRj7uwP7GyyBnDZuBIyfQj2AXLM2ZlvPE5
	D6RcxqMwVucq+QRSjWZJmZ3Aj98y9QsZx2U2+/CXmmriYW+4VQuTHOndkahj1lsi
X-Gm-Gg: AYBFou2YnrcXhjDVXAuZMdG4H9FFKRjUyo0LvS9CP8apxx6T5EUtHNF7O7LhourxG9W
	x2IX16SfYCr17Il9P92MEBMqQpObIbkvrBiV2rN6wSbpUlGHc7+KNwnT8VIaWb78YMXUw1Oi2+F
	2viFKvY7uYncV2EGtkrvVc4CUN5HUx4RR87eN5vZpQkxIk9c2Qhse9502izlHGnDX5lbUN2OTUL
	WPZ6VabNEb7cPddwg9OGT4rKiGLX1Og9CUZpVI4ehPqzy2hrqSiQILOBXGd/St5q+Mbdz1O6jwz
	5prM+pU13DgyV9z3TDV9es4XZUQoFhqbgWzqyyKOOXPHSrsCWEFbpsVoFIIJlCTqCuIyBo5uWTz
	qngUj0bVT70x7/Bs+Oxnd2pKhjX6Wdb6afsTSNTupTYXjMyneJBTXSRl3SoyPdbohrQWnat6ftv
	ABUMwrpWFYVVw+Q0ffLAj5vS9zaA87R4P12UmeHXRrFwARMKgA7v3uzVyBY0zknthSsC4VfnqF0
	RmoEMnCKSwi45ffINYWsgLkSWW1TM6y/0GsPMmQd+VKoPfsVMhbPhGjXLGxvOhH/yCWjSn5G5ph
	iROdxnHepDRxmMG8yNL7aQyDcCT6S9qhQCiMuR9ED7semaWWRVQmi6rVcUQ=
X-Received: by 2002:a17:906:9fc7:b0:c3f:55e6:83e6 with SMTP id a640c23a62f3a-c49bdeab6a7mr30852366b.15.1793132894613;
        Tue, 27 Oct 2026 13:28:14 -0700 (PDT)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd520838sm510597466b.31.2026.10.27.13.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:28:14 -0700 (PDT)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH] usb: musb: gadget: don't flush a waiting RX packet when queueing a request
Date: Tue, 27 Oct 2026 21:27:44 +0100
Message-ID: <20261027202744.79556-1-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Since commit 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx
endpoint request"), musb_ep_restart() flushes the RX FIFO instead of
calling rxstate(), with the premise that in case of Ethernet, dropping
a couple of packets during gadget initialization is not an issue,
because it will only happen when the software is not yet ready.

But when using other functions with musb, for example, f_mass_storage
or f_acm, this code path will be used not only when the software is not
yet ready, but also mid-communication, and it will cause data loss.
Data loss happens on gadgets that don't always have requests queued.

The timeline of a data loss:

1. A function that does not have a lot of requests pre-queued
   completes an OUT request. The queue is empty.
2. The next packet comes. MUSB auto-acks it, places it into the FIFO,
   sets RXPKTRDY, raises an interrupt.
3. musb_g_rx() is called, sees the request queue is empty,
   early returns.
4. The function queues the next request from the main fsg thread,
   musb_ep_restart does FLUSHFIFO, packet is lost.
5. The packet was auto-acked by MUSB, so it is not resent by the host.

Next data chunk arrives with an IRQ like so:

musb_g_rx returns, queue empty
        (drivers/usb/musb/musb_gadget.c:810)
musb_g_rx from musb_interrupt
        (drivers/usb/musb/musb_core.c:1786)
musb_interrupt from dsps_interrupt
        (drivers/usb/musb/musb_dsps.c:389)

and then it is dropped from the FIFO when usb_ep_queue() is called:

MUSB_RXCSR_FLUSHFIFO from musb_ep_restart
        (drivers/usb/musb/musb_gadget.c:1174)
musb_ep_restart from musb_ep_restart_resume_work
        (drivers/usb/musb/musb_gadget.c:1184)
musb_ep_restart_resume_work from musb_queue_resume_work
        (drivers/usb/musb/musb_core.c:2277)
musb_queue_resume_work from musb_gadget_queue
        (drivers/usb/musb/musb_gadget.c:1249)
musb_gadget_queue from usb_ep_queue
        (drivers/usb/gadget/udc/core.c:306)

In case of f_mass_storage, it keeps waiting for the lost data;
the host then times out and resets the device. Since this is a race
condition, this can be seen as data transfers taking too long,
or as drives getting mounted but disappearing when data
is read/written, and so on.

  usb 1-8.4: reset high-speed USB device number 31 using xhci_hcd
  I/O error, dev sdb, sector 240 op 0x1:(WRITE) flags 0x804800 phys_seg 30 prio class 2
  Buffer I/O error on dev sdb, logical block 30, lost async page write

When testing f_acm, this is seen as bytes loss on the tty.
Similar situation with f_hid, f_printer, f_fs.

Testing with commit 3fc137386c46 ("usb: musb: Fix hardware lockup on
first Rx endpoint request") reverted fixed these symptoms.

Move the data processing to system_bh_wq. Purpose of doing so is to run
in an interrupt context, honoring the usb_ep_queue docstring and avoiding
the lockup Hubert described in his commit message.
Alternative way of looking at this is it "re-triggers" the interrupt,
running the musb_g_rx that had to be skipped.

This issue was reproduced and the patch was tested on a BeagleBone Black
with f_mass_storage, f_acm, f_hid, f_printer, and f_fs.

Fixes: 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx endpoint request")
Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 54 ++++++++++++++++++++++++++++++++--
 drivers/usb/musb/musb_gadget.h |  3 ++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc1e0..ace1a99999ab 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1111,6 +1111,8 @@ static int musb_gadget_disable(struct usb_ep *ep)
 
 	/* abort all pending DMA and requests */
 	nuke(musb_ep, -ESHUTDOWN);
+	if (cancel_work(&musb_ep->rx_kick))
+		pm_runtime_put_autosuspend(musb->controller);
 
 	musb_ep->desc = NULL;
 	musb_ep->end_point.desc = NULL;
@@ -1171,10 +1173,42 @@ void musb_ep_restart(struct musb *musb, struct musb_request *req)
 		txstate(musb, req);
 	} else {
 		csr = musb_readw(epio, MUSB_RXCSR);
-		csr |= MUSB_RXCSR_FLUSHFIFO | MUSB_RXCSR_P_WZC_BITS;
-		musb_writew(epio, MUSB_RXCSR, csr);
-		musb_writew(epio, MUSB_RXCSR, csr);
+		if (csr & MUSB_RXCSR_RXPKTRDY) {
+			pm_runtime_get_noresume(musb->controller);
+			if (!queue_work(system_bh_wq, &req->ep->rx_kick))
+				pm_runtime_put_noidle(musb->controller);
+		}
+	}
+}
+
+static void musb_g_rx_kick(struct work_struct *work)
+{
+	struct musb_ep *musb_ep = container_of(work, struct musb_ep, rx_kick);
+	struct musb *musb = musb_ep->musb;
+	unsigned long flags;
+	u8 epnum = musb_ep->current_epnum;
+	bool requeued = false;
+	u16 csr;
+
+	spin_lock_irqsave(&musb->lock, flags);
+
+	if (!musb_ep->desc)
+		goto out;
+
+	if (musb_ep->busy) {
+		requeued = queue_work(system_bh_wq, &musb_ep->rx_kick);
+		goto out;
 	}
+
+	musb_ep_select(musb->mregs, epnum);
+	csr = musb_readw(musb->endpoints[epnum].regs, MUSB_RXCSR);
+	if (csr & MUSB_RXCSR_RXPKTRDY)
+		musb_g_rx(musb, epnum);
+out:
+	spin_unlock_irqrestore(&musb->lock, flags);
+
+	if (!requeued)
+		pm_runtime_put_autosuspend(musb->controller);
 }
 
 static int musb_ep_restart_resume_work(struct musb *musb, void *data)
@@ -1701,6 +1735,7 @@ init_peripheral_ep(struct musb *musb, struct musb_ep *ep, u8 epnum, int is_in)
 	ep->is_in = is_in;
 
 	INIT_LIST_HEAD(&ep->req_list);
+	INIT_WORK(&ep->rx_kick, musb_g_rx_kick);
 
 	sprintf(ep->name, "ep%d%s", epnum,
 			(!epnum || hw_ep->is_shared_fifo) ? "" : (
@@ -1805,11 +1840,24 @@ int musb_gadget_setup(struct musb *musb)
 
 void musb_gadget_cleanup(struct musb *musb)
 {
+	int i;
+
 	if (musb->port_mode == MUSB_HOST)
 		return;
 
 	cancel_delayed_work_sync(&musb->gadget_work);
 	usb_del_gadget_udc(&musb->g);
+
+	for (i = 0; i < musb->nr_endpoints; i++) {
+		struct musb_hw_ep *hw_ep = &musb->endpoints[i];
+
+		if (hw_ep->ep_in.rx_kick.func &&
+		    cancel_work_sync(&hw_ep->ep_in.rx_kick))
+			pm_runtime_put_noidle(musb->controller);
+		if (hw_ep->ep_out.rx_kick.func &&
+		    cancel_work_sync(&hw_ep->ep_out.rx_kick))
+			pm_runtime_put_noidle(musb->controller);
+	}
 }
 
 /*
diff --git a/drivers/usb/musb/musb_gadget.h b/drivers/usb/musb/musb_gadget.h
index f49f25b3bf56..334e6f9220ac 100644
--- a/drivers/usb/musb/musb_gadget.h
+++ b/drivers/usb/musb/musb_gadget.h
@@ -11,6 +11,7 @@
 #define __MUSB_GADGET_H
 
 #include <linux/list.h>
+#include <linux/workqueue.h>
 
 #if IS_ENABLED(CONFIG_USB_MUSB_GADGET) || IS_ENABLED(CONFIG_USB_MUSB_DUAL_ROLE)
 extern irqreturn_t musb_g_ep0_irq(struct musb *);
@@ -93,6 +94,8 @@ struct musb_ep {
 	/* true if lock must be dropped but req_list may not be advanced */
 	u8				busy;
 
+	struct work_struct		rx_kick;
+
 	u8				hb_mult;
 };
 

base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
-- 
2.55.0


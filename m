Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732621;
	b=L0lVEcx3WJ63JW8iM7Cw8pjKHOTmoiru77jAtmXz384DhW7emZkkC3MpzhiGOoRjQKx4
	 zbKYQuJ3vbpz5EZn1EYfDVOppyVr4pSKP5yYtac76E5H62JTREiY+DphG38h0bPhavdnK
	 ApIc5286U0BXNyRmXJICchVh9889uhf+DVLeDl8I7D4oHzzsZfp5WxQq1fzc+1pQ8+wC7
	 hMlGLjswszG8n7KFTG9mn8tTfI9Rg+rKfZoqqg8pojKASARzqzEnBL6CY091bbhtiYk1S
	 rFQg0iTq3bxCZ2ZT9imy0jyPK4uPochNMbkSozBZdHYO6zwEnMnd64lw5GLefLSRNPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQk1ugjsNTxXIWfDTjB1oZZxl8YS+bnBIoCPaYveaso=;
	b=0K9SpzkQ0IbA94qehY0M0WlvhoWMSS6HenArnoknrCWpJLH5y4x1weQPbsiEaau9a8i1
	 WSb3n9NEUxxqA/2CN0lLsOQrAVdhAw7cb1tgajjk4tp3s6iLghy/E8d36or/PY+kYZKc7
	 pPvhrmz3x0A6j3W8Q295PHEhJx0ULkP6CZD2bY1XGMoissVjyqOQViYVB0Z1vZXfmtiVJ
	 Mejt9N2nlcLt4+usOIR5Kud2f/lN9EERVooUB5e0k+hA030I/aFScsYtbiesgm0qpSAaV
	 sqyh69rG9UwpYOode5Wnhk+ta9GZKbCaPGVchwdbVTWWfcZZk0Q4h8ocj+BZvuVpMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLTa2NVs;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687A5606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 687A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLTa2NVs
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ac525c1f05so44001717b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732620; x=1794337420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQk1ugjsNTxXIWfDTjB1oZZxl8YS+bnBIoCPaYveaso=;
        b=wLTa2NVs/mQzbz8V7rZcZQnD9XmVbB+R22+Nk7385L3FPPa6GsLPpx0AtaxaxkbQFT
         udJwqzbcu0UG5VXmLROicp9xzP2nbMUPL3I1goXAsybylXD3ohPdLFUx38nNgLkT/lyT
         vA/uNCaHxgnqA2Ac7JATH4s4RiEc3pQkyb9bZnhLqTrcK8fvzLX0HhAzdhGBUp/iRvwf
         DiABgNzdaC0KpQn4880imNbGeCHrGuhU51s7A2PvkGpvdPhxLX11AJKT3zJjFNMYoRZA
         dvEW0voLOxhdFg2UhlPcdewII4Oae8DzvfO+IsPiJ1+1y+0TpLM6eyI5cFnJARs/q0Do
         bZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732620; x=1794337420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQk1ugjsNTxXIWfDTjB1oZZxl8YS+bnBIoCPaYveaso=;
        b=cWCJ+wDGgL5WCsi0ASXy+pSL+bKEngZ4pkiYm+FUsJgYTfZcMNtbsMGeaGcW8WO3We
         oy5EfHbBbRI3HjqAgrF9CCToSjK5E0XNroQpFZH1eYQwsLX73occqkQRXvC2RhAvWSvM
         wVvEJdKbRL4YdVIZ5gB9VpFbta/e7zTPF5sE0PvHSF5zTIjOY6aT6p0ocCWokdS+/6zY
         2WocKJ8Oe2AgscS0MEJO4zn/2r4+StLvVv7EUNNJaJo3s5SD6aJx8a3ws5aaEIZ3bhuc
         nUhxFEyWKGpsY+OBER9rn85wuad0jqYbXdeHsFi5DmcfGHl+jtIKotPgYLeaOxL24/I5
         YAHA==
X-Forwarded-Encrypted: i=1; AKwUvBxNDU7+kzPnree2AUxhnCVbYEKGwk5xfmi9zXay8i8eulAIfrE/2E97xge3Ym/PNcXTi5xQAzmhI5qvjvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z//r7y43Mb+5RMrg6X4YddIjTgL0g7v4JGYFllHa2T4rK/Lr8iM
	4T7Ut1Se8V3Upem7263bFhq62r2u9G6kSfO52+/qn90J0N1qBGXkFTQQ
X-Gm-Gg: AYBFou3rwiiBJlTqQ3q6pVysNkOhaOVoNSD2PFFSy8hICGSpInUHJGV5su04QKNBG1e
	ju8NAUYhNo9ujXMVvxrR5hR0knSSGol7AU7KSznXNlkhwHrfOZ6ljR6p4E7LSqFD7F0DB7/OGLl
	q2btEyK4PNVGVgIGSAu5lL6AGiLIV07oGV3WHluYsKl39XNoqxCV3qHmmnR6I4Oj/J1b2yxiVoC
	XGLy7Y92451MgYEi15btjd35B0RRIGZ/KU8Oc0OVMf0Mm1w/8UgI72V6qkDsWQDM6UqLDL6m5gD
	HtoUrj5aeyUhDvVjQ5HqucvZWLUjAtrijj7LbjHZ0RcDxHOaiuTFpK8T0JXqpC044tFzbGt9Ylf
	BRETvkJBvlASjC9nsCW3rUw7rcslPv+AWcE3dZ3W9b6CjVdwnhBHniM8Jjgt76kwFu7Of03K6d+
	pZc+gHEQqFyCYVP1I9LoakdI/eCtCEpekePUi00mmv4AhYoaP89dSwC1+eYjYuyx9QQ+bTgTOQ2
	kZYa17842F7J6yzZM/N2TpZpOoQXuLTiylwQ8b7kECAPO4+r9lq0lmW5jzIM/PZWIW2y4hfLkSi
	8znRch7uzqYSl23dk4LYsTP+O5QLcsK9NpBM2phmhBws6uBG0dU=
X-Received: by 2002:a05:690c:298:b0:8b1:7346:f1a2 with SMTP id 00721157ae682-8b2b67080dfmr117421367b3.28.1793732620148;
        Tue, 03 Nov 2026 11:03:40 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098c3174sm3065187b3.12.2026.11.03.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:03:39 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>,
	Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
Subject: [PATCH] usb: musb: host: clear stale TT buffers after aborted transfers
Date: Tue,  3 Nov 2026 16:03:33 -0300
Message-ID: <20261103190333.87207-1-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

On AM335x with MUSB and a Microchip USB2514 hub, disconnecting a
full-speed CDC ACM device during bulk traffic can leave its TT unable
to enumerate full-speed devices. High-speed devices still work, and
Reset_TT restores operation.

Queue Clear-TT-Buffer for failed or unlinked control and bulk URBs
behind an external TT. Park the affected endpoint queue until the
asynchronous clear completes, so new URBs cannot use a buffer being
cleared. Keep the parked queue alive until the callback finishes,
including during endpoint disable.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
---
 drivers/usb/musb/musb_host.c | 166 +++++++++++++++++++++++++++++++----
 drivers/usb/musb/musb_host.h |   2 +
 2 files changed, 152 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 31b0612489911..6e8cf462676ec 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -22,6 +22,11 @@
 #include "musb_host.h"
 #include "musb_trace.h"
 
+static bool tt_clear = true;
+module_param(tt_clear, bool, 0644);
+MODULE_PARM_DESC(tt_clear,
+		 "Clear hub TT buffers after failed or unlinked control/bulk transfers (default Y; set N only for A/B comparison or if a hub mishandles CLEAR_TT_BUFFER; affects new requests only)");
+
 /* MUSB HOST status 22-mar-2006
  *
  * - There's still lots of partial code duplication for fault paths, so
@@ -287,6 +292,33 @@ __acquires(musb->lock)
 	spin_lock(&musb->lock);
 }
 
+/*
+ * A failed or unlinked control/bulk split can leave the hub's transaction
+ * translator buffer busy; the TT then NAKs later splits using that buffer
+ * (USB 2.0 11.17.5).  A STALL completes the split, so it needs no clear.
+ *
+ * Context: caller owns controller lock and an URB which was on hardware
+ */
+static void musb_clear_tt_buffer(struct musb *musb, struct musb_qh *qh,
+				 struct urb *urb, int status)
+{
+	struct usb_tt		*tt = urb->dev->tt;
+
+	if (!READ_ONCE(tt_clear) || qh->clearing_tt)
+		return;
+	if (!tt || !tt->hub || tt->hub == musb->hcd->self.root_hub)
+		return;
+	if (!usb_pipecontrol(urb->pipe) && !usb_pipebulk(urb->pipe))
+		return;
+	if (!urb->unlinked && (!status || status == -EPIPE))
+		return;
+
+	if (usb_hub_clear_tt_buffer(urb))
+		return;
+
+	qh->clearing_tt = true;
+}
+
 /*
  * Advance this hardware endpoint's queue, completing the specified URB and
  * advancing to either the next URB queued to that qh, or else invalidating
@@ -329,11 +361,18 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	qh = musb_ep_get_qh(hw_ep, is_in);
 
 	/* reclaim resources (and bandwidth) ASAP; deschedule it, and
-	 * invalidate qh as soon as list_empty(&hep->urb_list)
+	 * invalidate qh as soon as list_empty(&hep->urb_list).
+	 *
+	 * While Clear-TT-Buffer is pending the endpoint must not use the TT,
+	 * so a qh with clearing_tt also releases hw_ep, letting other qhs
+	 * (including the hub's own control requests) run.  It stays in
+	 * hep->hcpriv, so new URBs queue on it, until
+	 * musb_clear_tt_buffer_complete() resumes or releases it.
 	 */
-	if (qh && list_empty(&qh->hep->urb_list)) {
+	if (qh && (qh->clearing_tt || list_empty(&qh->hep->urb_list))) {
 		struct list_head	*head;
 		struct dma_controller	*dma = musb->dma_controller;
+		bool			park = qh->clearing_tt;
 
 		if (is_in) {
 			ep->rx_reinit = 1;
@@ -351,7 +390,10 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 
 		/* Clobber old pointers to this qh */
 		musb_ep_set_qh(ep, is_in, NULL);
-		qh->hep->hcpriv = NULL;
+		if (park)
+			qh->tt_parked = true;
+		else
+			qh->hep->hcpriv = NULL;
 
 		switch (qh->type) {
 
@@ -362,8 +404,9 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 			 */
 			if (qh->mux == 1) {
 				head = qh->ring.prev;
-				list_del(&qh->ring);
-				kfree(qh);
+				list_del_init(&qh->ring);
+				if (!park)
+					kfree(qh);
 				qh = first_qh(head);
 				break;
 			}
@@ -375,7 +418,8 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 			 * de-allocated if it's tracked and allocated;
 			 * and where we'd update the schedule tree...
 			 */
-			kfree(qh);
+			if (!park)
+				kfree(qh);
 			qh = NULL;
 			break;
 		}
@@ -1168,8 +1212,10 @@ irqreturn_t musb_h_ep0_irq(struct musb *musb)
 		musb->ep0_stage = MUSB_EP0_IDLE;
 
 	/* call completion handler if done */
-	if (complete)
+	if (complete) {
+		musb_clear_tt_buffer(musb, qh, urb, status);
 		musb_advance_schedule(musb, urb, hw_ep, 1);
+	}
 done:
 	return retval;
 }
@@ -1406,6 +1452,7 @@ void musb_host_tx(struct musb *musb, u8 epnum)
 		/* set status */
 		urb->status = status;
 		urb->actual_length = qh->offset;
+		musb_clear_tt_buffer(musb, qh, urb, status);
 		musb_advance_schedule(musb, urb, hw_ep, USB_DIR_OUT);
 		return;
 	} else if ((usb_pipeisoc(pipe) || transfer_pending) && dma) {
@@ -1993,6 +2040,7 @@ void musb_host_rx(struct musb *musb, u8 epnum)
 
 		if (urb->status == -EINPROGRESS)
 			urb->status = status;
+		musb_clear_tt_buffer(musb, qh, urb, urb->status);
 		musb_advance_schedule(musb, urb, hw_ep, USB_DIR_IN);
 	}
 }
@@ -2122,6 +2170,56 @@ static int musb_schedule(
 	return 0;
 }
 
+/*
+ * Continue a qh parked by musb_advance_schedule() once its Clear-TT-Buffer
+ * finished: release it when no URB is queued, else schedule it again.  While
+ * the endpoint is being disabled (!is_ready) or the host is inactive it stays
+ * parked; the dequeue and endpoint_disable paths finish it.
+ *
+ * Context: caller owns controller lock, irqs blocked
+ */
+static void musb_tt_resume(struct musb *musb, struct musb_qh *qh)
+{
+	struct usb_host_endpoint	*hep = qh->hep;
+	int				is_in = usb_endpoint_dir_in(&hep->desc);
+
+	if (!qh->tt_parked || qh->clearing_tt || !qh->is_ready)
+		return;
+
+	if (list_empty(&hep->urb_list)) {
+		hep->hcpriv = NULL;
+		kfree(qh);
+		return;
+	}
+
+	if (!is_host_active(musb) || !musb->is_active)
+		return;
+
+	qh->tt_parked = false;
+	/* as for a new control/bulk qh; the shared bulk_ep sets a NAK limit */
+	qh->intv_reg = 0;
+	if (musb_schedule(musb, qh, is_in))
+		qh->tt_parked = true;
+}
+
+/* Called by hub_tt_work() after the hub processed (or failed) the request */
+static void musb_clear_tt_buffer_complete(struct usb_hcd *hcd,
+					  struct usb_host_endpoint *hep)
+{
+	struct musb		*musb = hcd_to_musb(hcd);
+	struct musb_qh		*qh;
+	unsigned long		flags;
+
+	spin_lock_irqsave(&musb->lock, flags);
+	/* musb_h_disable() keeps hep->hcpriv valid while clearing_tt is set */
+	qh = hep->hcpriv;
+	if (qh && qh->clearing_tt) {
+		qh->clearing_tt = false;
+		musb_tt_resume(musb, qh);
+	}
+	spin_unlock_irqrestore(&musb->lock, flags);
+}
+
 static int musb_urb_enqueue(
 	struct usb_hcd			*hcd,
 	struct urb			*urb,
@@ -2145,13 +2243,17 @@ static int musb_urb_enqueue(
 	spin_lock_irqsave(&musb->lock, flags);
 	ret = usb_hcd_link_urb_to_ep(hcd, urb);
 	qh = ret ? NULL : hep->hcpriv;
-	if (qh)
+	if (qh) {
 		urb->hcpriv = qh;
+		/* restart a parked qh left idle while the host was inactive */
+		musb_tt_resume(musb, qh);
+	}
 	spin_unlock_irqrestore(&musb->lock, flags);
 
 	/* DMA mapping was already done, if needed, and this urb is on
 	 * hep->urb_list now ... so we're done, unless hep wasn't yet
-	 * scheduled onto a live qh.
+	 * scheduled onto a live qh.  A qh parked for Clear-TT-Buffer
+	 * also holds new URBs until musb_tt_resume() schedules it.
 	 *
 	 * REVISIT best to keep hep->hcpriv valid until the endpoint gets
 	 * disabled, testing for empty qh->ring and avoiding qh setup costs
@@ -2367,8 +2469,11 @@ static int musb_cleanup_urb(struct urb *urb, struct musb_qh *qh)
 	} else  {
 		musb_h_ep0_flush_fifo(ep);
 	}
-	if (status == 0)
+	if (status == 0) {
+		/* hardware stopped; the TT may still hold this transaction */
+		musb_clear_tt_buffer(musb, qh, urb, urb->status);
 		musb_advance_schedule(ep->musb, urb, ep, is_in);
+	}
 	return status;
 }
 
@@ -2412,10 +2517,13 @@ static int musb_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		musb_giveback(musb, urb, 0);
 		qh->is_ready = ready;
 
-		/* If nothing else (usually musb_giveback) is using it
-		 * and its URB list has emptied, recycle this qh.
-		 */
-		if (ready && list_empty(&qh->hep->urb_list)) {
+		/* A parked qh is not on hw_ep; never clobber hw_ep for it */
+		if (qh->tt_parked) {
+			musb_tt_resume(musb, qh);
+		} else if (ready && list_empty(&qh->hep->urb_list)) {
+			/* If nothing else (usually musb_giveback) is using it
+			 * and its URB list has emptied, recycle this qh.
+			 */
 			musb_ep_set_qh(qh->hw_ep, is_in, NULL);
 			qh->hep->hcpriv = NULL;
 			list_del(&qh->ring);
@@ -2460,13 +2568,18 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_host_endpoint *hep)
 
 		/* Then nuke all the others ... and advance the
 		 * queue on hw_ep (e.g. bulk ring) when we're done.
+		 * A qh parked by the cleanup no longer owns hw_ep.
 		 */
 		while (!list_empty(&hep->urb_list)) {
 			urb = next_urb(qh);
 			urb->status = -ESHUTDOWN;
-			musb_advance_schedule(musb, urb, qh->hw_ep, is_in);
+			if (qh->tt_parked)
+				musb_giveback(musb, urb, -ESHUTDOWN);
+			else
+				musb_advance_schedule(musb, urb, qh->hw_ep,
+						      is_in);
 		}
-	} else {
+	} else if (!qh->tt_parked) {
 		/* Just empty the queue; the hardware is busy with
 		 * other transfers, and since !qh->is_ready nothing
 		 * will activate any of these as it advances.
@@ -2478,6 +2591,26 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_host_endpoint *hep)
 		list_del(&qh->ring);
 		kfree(qh);
 	}
+
+	/*
+	 * hub_tt_work() passes hep to musb_clear_tt_buffer_complete(), which
+	 * dereferences hep->hcpriv: free a parked qh only after its clear
+	 * finished (bounded by the hub control request timeout).
+	 */
+	while ((qh = hep->hcpriv) && qh->tt_parked) {
+		while (!list_empty(&hep->urb_list))
+			musb_giveback(musb, next_urb(qh), -ESHUTDOWN);
+
+		if (!qh->clearing_tt) {
+			hep->hcpriv = NULL;
+			kfree(qh);
+			break;
+		}
+
+		spin_unlock_irqrestore(&musb->lock, flags);
+		schedule_timeout_uninterruptible(1);
+		spin_lock_irqsave(&musb->lock, flags);
+	}
 exit:
 	spin_unlock_irqrestore(&musb->lock, flags);
 }
@@ -2689,6 +2822,7 @@ static const struct hc_driver musb_hc_driver = {
 	.urb_enqueue		= musb_urb_enqueue,
 	.urb_dequeue		= musb_urb_dequeue,
 	.endpoint_disable	= musb_h_disable,
+	.clear_tt_buffer_complete = musb_clear_tt_buffer_complete,
 
 #ifndef CONFIG_MUSB_PIO_ONLY
 	.map_urb_for_dma	= musb_map_urb_for_dma,
diff --git a/drivers/usb/musb/musb_host.h b/drivers/usb/musb/musb_host.h
index 63298bd233e02..8241fe2aaaa4c 100644
--- a/drivers/usb/musb/musb_host.h
+++ b/drivers/usb/musb/musb_host.h
@@ -40,6 +40,8 @@ struct musb_qh {
 	unsigned		iso_idx;	/* in urb->iso_frame_desc[] */
 	struct sg_mapping_iter sg_miter;	/* for highmem in PIO mode */
 	bool			use_sg;		/* to track urb using sglist */
+	bool			clearing_tt;	/* Clear-TT-Buffer in progress */
+	bool			tt_parked;	/* off hw_ep until TT is cleared */
 };
 
 /* map from control or bulk queue head to the first qh on that ring */
-- 
2.43.0


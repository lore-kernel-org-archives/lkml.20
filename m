Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048922;
	b=EMW4AxWiMT+I5vMTNcmRKxpx6brTYDfyWBckhAOggrdJnJtZE3Xm1V15Tm7CrGWZe+1c
	 FcO2poRVaslYMXtVyJIlyOj4h58aHcV4TdZ68gQtj6CKdExCX7HnwHFgIfAHWxE5EAMBe
	 Ig/CTvI1HRquA5LMwEM8ckj+m0H/tKnyi5j8t0XD56SjJY+wAl7zTwUkmZMEbhOaituIC
	 jDbOMAK2Mz7ynm2sT8tZDCyETE9qSDW0sRdUpSLnghMG6fGsezOuuCZyGwiLpS1QS3DUc
	 6Wq5XJRtObdysl9YSs8j9qH4vfMji1xyxom9NFhW+MRrC4J8gEhPfdQ1839aly1jNNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rKMtEOg6aq+AXKza/t+uvDMmGhrI38ouyDBdGVNk5SA=;
	b=bQKaACIfhmSuoCbI+lLqX4B7npJehnAqJLMZjRLwOuweIIKd+jUQgHx5m0sV2vlqI5h3
	 rLtR1MP2pLJXNKVt56g61iPmIZEmGtMyeTawgXbBuVBf3ougANcKUscDBiNi9+9zKQH/a
	 m0c4L/UT3AlH7qSRDWxBnLnG/pgTTlBjpk9kYY4dnJogT4U44UDJsWQBVLlMAjWyF7H+U
	 wCzIejKvOFcNwcf+r4j/qPjPXGXTasF2+oTakLlXuOf+JH3dkdl9KZfw4arbqFVskFQJP
	 Uy15m1u5iDt/XfWocsBnbSa+8sfByTpWptmHva2R/FqAfzsITb0j1A5VeNsRulAuT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8U0S2xQ;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67156606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67156606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E8U0S2xQ
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so647366a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048921; x=1794653721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKMtEOg6aq+AXKza/t+uvDMmGhrI38ouyDBdGVNk5SA=;
        b=E8U0S2xQOTdQ29TTL+BdEObtN+B3LU/cyseQanqBKuZ2g7EEY0grtZbY+p/oDrX2vE
         bHobLm2Ob9K++IITAqSHr7pwiDWYo8P8xYHeWEIzKvJBOEJMTKITZlieKXeQqSv1eeTE
         Ui9L/aI4rXZ9+QEUgsFZvaFKyTL6n7MRmdArIDcd2WcJEfdamkzFyU6Qw0R5KR4K7Nn2
         kzDr5or+Bo0RSDdNn51Z2VLdJxfsGTJOR8rkQ3OQ4MMnITt6Oq7iIrPB0fBKbFpYVG+p
         Ch7y+cxsddcUEYUVx0wCVVB41WVoF5bsGXgJn/DFeToM4CpzCBPFq3mVmj3JEQ3zQLEM
         G3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048921; x=1794653721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKMtEOg6aq+AXKza/t+uvDMmGhrI38ouyDBdGVNk5SA=;
        b=e9H7NRcm8Kp2Wgw/b4tPzvIRE8LA7z7/jdfVA8UTfNJ89rPZmBiO9OjYh2GJKcakSD
         ry+tbBswA3K6ZRoHOk3uVZqZdr+AnJDi5VEnrgafIyGRyi8KXgOSfeTaSHFC7wIBLMIy
         XxwvSOEE0Z6Hzo7XCNCsE79XQSIiTGY6QO5rVKxesNSg5BX71zc8LDT9ZqkJBwXnN6P6
         gicFqGIqz/oCbNHLlaMPQucL7AkGnV7pQ3cJCCthrgDE/HivwOvv9nREzaV05N5VlmQ9
         C2yj6gOBN3P88EqQBa5vCkWCmTsY95e8rVL2a0YAbbiZx8GdyViaW6yvTpK+mpwdDdvH
         MtwA==
X-Forwarded-Encrypted: i=1; AL+hErFblHyd354y+r+PBJmFj7ufv/NcRwjzDQdWG1p93evNXl49s0KocKgFZc7mKGDHb/7iCJ/2pdYdUf9IM1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J2/Eqr1s2jt6MN/YodddxxjbVhhkvXjSFqULMpiV1Kt2RaJz3
	oT5u22oC0mUGapGGikwSgc1eE2bDkhM9s43SM3aCEz4Zvr3FENe3X7nq
X-Gm-Gg: AYBFou1B5ibnwATM1Oe39rtmFtkOhh98e3L7BfaFkvqoykQaDOZy8TSaIT4vlD/zFWL
	z0/ahbyUlETDkHCXrSRA0Ficyccz+N1wu+q6U8wP/f+c29EOUPPblyAiDKya6IFzG7uDydaYfat
	IlV1YhjXiMknNDSWsqLIlRPpW6EwwT9CsTmJ90AQ1urcf1JooeFZze7XWm+DNCyzbubsEtEf2Ky
	qQHWDcDe0jjC8/V5sMf65bPswrWmVIzyD7hTVP09986yf54dQyiCJ9Y3+Xcmwu3WYtwIQcXld2c
	0Nf5wSd58ijtSKWLOCIwMZ19eQx579zAAyCugVHLmrrNx9zZZuFxYSKRddRBp2KGEbnJH7J53P8
	oHkyrSdrmUD4JQ5rtsK/cRP5CyPc/TqtW1cxcDmlm4V2i8AUsALDbcU9FJu9/4ruc4QJsdxOGxn
	lZzWjXbIytBjmohhfCLLalec8WBhP4ULza6cuKMKj6yAlVJqQnTBFxtIOLNRLOy9l91/M/3QSGS
	MKlgMPp9u4OBcNSOL9h4UWy86Br6X5rBRA08VTbpavEBRwEINmv28Eqc7VaCeOC1GSPu41llEd4
	hgjKapkWKydXmHmoiBATyEd3zg8q1HkfuHSGy5KoU66908jAsmGo8LW56lc1BmBmisHWeZiQ4jw
	FTyKB
X-Received: by 2002:a05:6402:518c:b0:6b3:d0a0:39c9 with SMTP id 4fb4d7f45d1cf-6b6fad4ade0mr1134533a12.6.1794048920506;
        Sat, 07 Nov 2026 02:55:20 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b669c4dcd0sm1668740a12.35.2026.11.07.02.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:55:19 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v2] usb: musb: gadget: don't flush a waiting RX packet when queueing a request
Date: Sat,  7 Nov 2026 11:55:05 +0100
Message-ID: <20261107105505.6554-1-lineprinter0@gmail.com>
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
Data loss happens on gadgets that don't always have requests queued
for an ep.

The timeline of a data loss:

1. A function that does not have a lot of requests pre-queued
   completes an OUT request. The queue is empty.
2. The next packet comes. MUSB auto-acks it, places it into the FIFO,
   sets RXPKTRDY, raises an interrupt.
3. musb_g_rx() is called, sees the request queue is empty,
   early returns.
4. The function queues the next request (f_mass_storage does it from
   the main fsg thread), musb_ep_restart does FLUSHFIFO, packet is lost.
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

When testing f_acm, this is seen as byte loss on the tty. f_hid,
f_printer and f_fs lose data similarly.

Testing with commit 3fc137386c46 ("usb: musb: Fix hardware lockup on
first Rx endpoint request") reverted fixed these symptoms.

Move the data processing to system_bh_wq. Purpose of doing so is to
honor the usb_ep_queue docstring and to run in an interrupt context,
avoiding the lockup Hubert described in his commit message.
Alternative way of looking at this is it "re-triggers" the interrupt,
running the musb_g_rx that had to be skipped.

Such a change makes a different race condition more visible.
On SMP or PREEMPT_RT, the RX interrupt can come while musb_g_giveback()
is running on the same endpoint and has already dropped musb->lock;
before this patch, that would be possible only when usb_ep_dequeue()
runs in parallel with an interrupt, but after this patch,
it could be the workqueue item running when an interrupt comes.
Handling it at that moment could lead to packets getting stuck
never matched with their requests (locking up the device essentially)
or requests completing but out of order.

So in musb_g_rx() and musb_gadget_queue(), also defer the RX'd data
to a work item if ep->busy is set. The deferred work items are scheduled
when the last musb_g_giveback() finishes and busy drops to 0.

Do not do any deferral of DMA completion. When musb_g_rx() is called
with DMAENAB set, it means it's called from musb_dma_completion().
A DMA completion could not be happening at the same time as
a workqueue non-DMA giveback (because this DMA needed to be programmed
first, and programming of a DMA is only possible when all non-DMA
requests ahead in the request queue already got their givebacks).
And work items of DMA requests don't do givebacks.
Deferring DMA completion is more work, so just don't change
the behavior there.

DMA completion can still race with usb_ep_dequeue(), that's the same
as without this patch. So DMA situation should not become any worse.

The issue was reproduced and the patch was tested on a BeagleBone Black
(AM335x, one core, no RX DMA) with f_mass_storage, f_acm, f_hid, f_printer
and f_fs. It was also verified OK before and after this patch
with f_ecm and f_ncm.

This issue was also reproduced and the patch was tested on a Pine A64+
(Allwinner A64, four cores, no DMA) with both PREEMPT_DYNAMIC
and PREEMPT_RT, with lockdep enabled, with f_mass_storage, f_acm,
f_hid, f_printer and f_fs.

This patch was also tested with suspend to RAM on the Pine A64+,
both idle and during a transfer.

Fixes: 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx endpoint request")
Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
---

v1 -> v2:
- musb_g_rx_kick() does not re-queue itself when `busy` is set.
  Instead, musb_g_giveback() re-queues it when `rx_kick_deferred`.
  This new flag is set in three cases:
  1) `busy` is set inside musb_g_rx_kick()
  2) musb_gadget_queue() adds an RX request to an empty request queue
     and `busy` is set
  3) `busy` is set in the beginning of musb_g_rx() (addresses sashiko's
     "RX endpoint lockup after giveback in musb_g_rx_kick()",
     "softirq busy-loop and livelock in musb_g_rx_kick()", and
     "race and ordering bug in musb_gadget_disable() for rx_kick")
- musb_g_rx_kick checks musb->is_runtime_suspended now and exits early
  if the controller is suspended, and the work items are disabled
  during system suspend (addresses sashiko's
  "unushed rx_kick work in musb_suspend() accesses disabled MMIO")
- This time tested also on a Pine A64+ (Allwinner A64),
  which has both MUSB and 4 cores.

v1: https://lore.kernel.org/linux-usb/20261027202744.79556-1-lineprinter0@gmail.com/

 drivers/usb/musb/musb_core.c   |   3 +
 drivers/usb/musb/musb_gadget.c | 107 ++++++++++++++++++++++++++++++++-
 drivers/usb/musb/musb_gadget.h |   9 +++
 3 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 73ac25f53..38469727a 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2818,6 +2818,8 @@ static int musb_suspend(struct device *dev)
 		;
 	musb->flush_irq_work = false;
 
+	musb_gadget_disable_rx_kicks(musb);
+
 	if (!(musb->ops->quirks & MUSB_PRESERVE_SESSION))
 		musb_writeb(musb->mregs, MUSB_DEVCTL, 0);
 
@@ -2866,6 +2868,7 @@ static int musb_resume(struct device *dev)
 	if ((devctl & mask) != (musb->context.devctl & mask))
 		musb->port1_status = 0;
 
+	musb_gadget_enable_rx_kicks(musb);
 	musb_enable_interrupts(musb);
 	musb_platform_enable(musb);
 
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc..c71c60efe 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -148,6 +148,21 @@ __acquires(ep->musb->lock)
 	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
 	spin_lock(&musb->lock);
 	ep->busy = busy;
+
+	if (!ep->busy && ep->rx_kick_deferred) {
+		ep->rx_kick_deferred = false;
+		if (!queue_work(system_bh_wq, &ep->rx_kick))
+			pm_runtime_put_noidle(musb->controller);
+	}
+}
+
+static void musb_g_defer_rx_kick(struct musb *musb, struct musb_ep *musb_ep)
+{
+	if (musb_ep->rx_kick_deferred)
+		return;
+
+	pm_runtime_get_noresume(musb->controller);
+	musb_ep->rx_kick_deferred = true;
 }
 
 /* ----------------------------------------------------------------------- */
@@ -816,6 +831,17 @@ void musb_g_rx(struct musb *musb, u8 epnum)
 	csr = musb_readw(epio, MUSB_RXCSR);
 	dma = is_dma_capable() ? musb_ep->dma : NULL;
 
+	/*
+	 * A giveback is in progress on this endpoint, so the packet can't be
+	 * handled now: the function could get its data out of order. Check for
+	 * the packet once the giveback is done.
+	 * Do not defer DMA completions: only usb_ep_dequeue() can overlap them.
+	 */
+	if (musb_ep->busy && !(csr & MUSB_RXCSR_DMAENAB)) {
+		musb_g_defer_rx_kick(musb, musb_ep);
+		return;
+	}
+
 	musb_dbg(musb, "<== %s, rxcsr %04x%s %p", musb_ep->end_point.name,
 			csr, dma ? " (dma)" : "", request);
 
@@ -1111,6 +1137,12 @@ static int musb_gadget_disable(struct usb_ep *ep)
 
 	/* abort all pending DMA and requests */
 	nuke(musb_ep, -ESHUTDOWN);
+	if (cancel_work(&musb_ep->rx_kick))
+		pm_runtime_put_autosuspend(musb->controller);
+	if (musb_ep->rx_kick_deferred) {
+		musb_ep->rx_kick_deferred = false;
+		pm_runtime_put_autosuspend(musb->controller);
+	}
 
 	musb_ep->desc = NULL;
 	musb_ep->end_point.desc = NULL;
@@ -1171,10 +1203,39 @@ void musb_ep_restart(struct musb *musb, struct musb_request *req)
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
+	u16 csr;
+
+	spin_lock_irqsave(&musb->lock, flags);
+
+	if (!musb_ep->desc || musb->is_runtime_suspended)
+		goto out;
+
+	if (musb_ep->busy) {
+		musb_g_defer_rx_kick(musb, musb_ep);
+		goto out;
 	}
+
+	musb_ep_select(musb->mregs, epnum);
+	csr = musb_readw(musb->endpoints[epnum].regs, MUSB_RXCSR);
+	if (csr & MUSB_RXCSR_RXPKTRDY)
+		musb_g_rx(musb, epnum);
+out:
+	spin_unlock_irqrestore(&musb->lock, flags);
+	pm_runtime_put_autosuspend(musb->controller);
 }
 
 static int musb_ep_restart_resume_work(struct musb *musb, void *data)
@@ -1254,6 +1315,15 @@ static int musb_gadget_queue(struct usb_ep *ep, struct usb_request *req,
 				__func__, status);
 			list_del(&request->list);
 		}
+	} else if (musb_ep->busy && !request->tx &&
+		   &request->list == musb_ep->req_list.next) {
+		/*
+		 * A giveback is in progress on this endpoint, so the request
+		 * can't be started now. A packet may already be waiting, its
+		 * interrupt having found no request. Check for the packet once
+		 * the giveback is done.
+		 */
+		musb_g_defer_rx_kick(musb, musb_ep);
 	}
 
 unlock:
@@ -1701,6 +1771,7 @@ init_peripheral_ep(struct musb *musb, struct musb_ep *ep, u8 epnum, int is_in)
 	ep->is_in = is_in;
 
 	INIT_LIST_HEAD(&ep->req_list);
+	INIT_WORK(&ep->rx_kick, musb_g_rx_kick);
 
 	sprintf(ep->name, "ep%d%s", epnum,
 			(!epnum || hw_ep->is_shared_fifo) ? "" : (
@@ -1810,6 +1881,36 @@ void musb_gadget_cleanup(struct musb *musb)
 
 	cancel_delayed_work_sync(&musb->gadget_work);
 	usb_del_gadget_udc(&musb->g);
+
+	musb_gadget_disable_rx_kicks(musb);
+}
+
+static void musb_g_disable_rx_kick(struct musb *musb, struct musb_ep *musb_ep)
+{
+	if (musb_ep->rx_kick.func && disable_work_sync(&musb_ep->rx_kick))
+		pm_runtime_put_noidle(musb->controller);
+}
+
+void musb_gadget_disable_rx_kicks(struct musb *musb)
+{
+	int i;
+
+	for (i = 0; i < musb->nr_endpoints; i++) {
+		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_in);
+		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_out);
+	}
+}
+
+void musb_gadget_enable_rx_kicks(struct musb *musb)
+{
+	int i;
+
+	for (i = 0; i < musb->nr_endpoints; i++) {
+		if (musb->endpoints[i].ep_in.rx_kick.func)
+			enable_work(&musb->endpoints[i].ep_in.rx_kick);
+		if (musb->endpoints[i].ep_out.rx_kick.func)
+			enable_work(&musb->endpoints[i].ep_out.rx_kick);
+	}
 }
 
 /*
diff --git a/drivers/usb/musb/musb_gadget.h b/drivers/usb/musb/musb_gadget.h
index f49f25b3b..886cfc26d 100644
--- a/drivers/usb/musb/musb_gadget.h
+++ b/drivers/usb/musb/musb_gadget.h
@@ -11,6 +11,7 @@
 #define __MUSB_GADGET_H
 
 #include <linux/list.h>
+#include <linux/workqueue.h>
 
 #if IS_ENABLED(CONFIG_USB_MUSB_GADGET) || IS_ENABLED(CONFIG_USB_MUSB_DUAL_ROLE)
 extern irqreturn_t musb_g_ep0_irq(struct musb *);
@@ -23,6 +24,8 @@ extern void musb_g_wakeup(struct musb *);
 extern void musb_g_disconnect(struct musb *);
 extern void musb_gadget_cleanup(struct musb *);
 extern int musb_gadget_setup(struct musb *);
+void musb_gadget_disable_rx_kicks(struct musb *musb);
+void musb_gadget_enable_rx_kicks(struct musb *musb);
 
 #else
 static inline irqreturn_t musb_g_ep0_irq(struct musb *musb)
@@ -42,6 +45,9 @@ static inline int musb_gadget_setup(struct musb *musb)
 {
 	return 0;
 }
+
+static inline void musb_gadget_disable_rx_kicks(struct musb *musb)	{}
+static inline void musb_gadget_enable_rx_kicks(struct musb *musb)	{}
 #endif
 
 enum buffer_map_state {
@@ -93,6 +99,9 @@ struct musb_ep {
 	/* true if lock must be dropped but req_list may not be advanced */
 	u8				busy;
 
+	struct work_struct		rx_kick;
+	bool				rx_kick_deferred;
+
 	u8				hb_mult;
 };
 

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0


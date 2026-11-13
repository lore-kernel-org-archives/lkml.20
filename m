Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543609;
	b=E0D39jnvsYXMd2PuSK3dsEc+8EFib0jrfIAdhUpBySWs4G4PwAglTqZNmsHYQmGaKlS4
	 X+H1zGcla3WBA4xpyIQWkyh7MaylzeTV9FKskzSRgGmtVdTtw4gZbpWB9A1m2xtJQ9kiR
	 fhEx1/4cFMv7wDx/+tAk1/5yOwJIpst2EKvtktOw1IViz2HBy5ZYAHyQMPVcprBfyDDFG
	 bjLn/x7m/oD8TDVeoiYEVEaVuHJbnBPARjbp5rtI3EIq42wjbB2SWVFxcBioehM2eU9zw
	 mNQMWfT0ND7iszE99SCNTpibpmgSf7gXp2J2yXu3Ct80YAM4PLU6EPumBJtD/XCaNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
	b=TCXGrYLM5z74dKEomLjV5XBVAZFejsiKeGq5O7rDjvritc1ZS7mSqLkHAAABDvESq6Xz
	 SbIMOOwKNX0nmyeo/fyfU9VNwTJ22cRhrS1xEXWvALpltF9qNf33bw8P5j6IbA7aEdcZE
	 8iF04XTfVVpwNGRC+XkKZo6gGXDVAxUW0WbFSCERJMlT1ZycMOIpdpn1Bj6GW0KUq58oH
	 KuuHLA4FP3k78JO/dftXlVa63uqV/0rqtZiWdWegtpQxQmpW7bqftqZETPczNG6ot0S3s
	 psJzIU21u4VwZFffPsFmeMatGB3f1T8fjWz8kU1JDnfVywLKaTIjmC8dtsdOCXA3pyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="D/Iv+7IQ";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A9606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345A9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D/Iv+7IQ
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8aa185840bdso379644b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794543608; x=1795148408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
        b=D/Iv+7IQHUZ5TDal7O0lXbjqi/4jhA1DDq9BJEhC7kzcKOW6ru9J6r+OQK2rzML/Oi
         Boxz6OG7S1n+WsLYIP87N6kIjHSBJyxdH3CZP6+WjA8YuAhvp117DHJoBIjDCXqa474/
         eYr0Dq+9pbqQK760V7uOMA1FQXIopGqdkZ56KBZDGHA8CaoiS3DeFsU4ybvLK7XqiBq4
         1Vs3Vq2spHqWWGetE+/AoS4ZUY2r4Lg2U8ucnvF6yvaO97/Vzgy3VaacV50TcAGJNYYp
         nQRoMM+jfC2gfkeqqoxITRDFY2sq951+OQA3yg1MDwtua3050WArzLutZWfJzn0inT+I
         fL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543608; x=1795148408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
        b=VC+e3KA0STCf1bn+7we6ykfUu3DQ1j3bea6OeHCeaq/s+RVOhoMqZ0pp/n4mMg2xtt
         AB9WNA0iyWpFZI3WnN/1gnSBJgD1zDn/VnbZyE5KQ0KhWBe4MQMbLVxMq912msQbTlYm
         26Yiek/0uyeFTMVwJx3FySBGFzQU2LyMcicSCITVsJ2w2tlaGU8hbx5oPSRLa1udYRiG
         j5iPfSzkPuVIzrMrAI3bM08r9GgmzpxCn1Vux6DsjUjoXdDmWvQf2J4BV+If9brUeG3X
         RKXnCnuwr/Q5d4v6EatLcKcp691MlJ+gIlhlXBz1eJctKrVpUv+2B4aVEHDBxghTG3u2
         Xo2g==
X-Forwarded-Encrypted: i=1; AL+hErEiqTvlxod1A8meBiCX/ltygf8pFuROx46K8QOheT/GcHofEi3uaryKeVMqLfpaR5/I90kU7bYACHzSR/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zIzqdShAi06s1BHWTy7ns+bhz6srQ/Vp3lc2hK4rx2nOdVhor
	2n8Opbf4eyL1BP+uvDLJPAFLx+Y1zo0mwoqgCzMU4BQTtnWKHFe7dDOe+ZCzTmnUDM2xJ3VOeQg
	RWK/irlBAtLcHLA==
X-Received: from pfbcn11.prod.google.com ([2002:a05:6a00:340b:b0:8a0:4085:d831])
 (user=rickyniu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7785:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-3f7a70ac1f6mr991797637.23.1794543608058;
 Thu, 12 Nov 2026 20:20:08 -0800 (PST)
Date: Fri, 13 Nov 2026 04:02:36 +0000
In-Reply-To: <20261113041948.1280304-1-rickyniu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113041948.1280304-1-rickyniu@google.com>
Message-ID: <20261113041948.1280304-2-rickyniu@google.com>
Subject: [PATCH 1/2] usb: core: hcd: Disable IRQs when taking bh->lock
From: Chien Kun Niu <rickyniu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chien Kun Niu <rickyniu@google.com>
Content-Type: text/plain; charset="UTF-8"

usb_hcd_giveback_urb() can be called with local interrupts enabled,
but it acquires bh->lock with plain spin_lock(). bh->lock is also
taken in hardirq context by HCD interrupt handlers and in BH context
by usb_giveback_urb_bh().

If an interrupt arrives on the same CPU while usb_hcd_giveback_urb()
holds bh->lock with IRQs enabled, it can deadlock on bh->lock in
usb_hcd_irq(), or in usb_giveback_urb_bh() on IRQ exit if the BH work
was already queued. We hit the latter during reboot when usbnet
unlinked RX URBs on a halted xHCI controller:

  Call trace:
   queued_spin_lock_slowpath
   _raw_spin_lock_irq
   usb_giveback_urb_bh
   process_scheduled_works
   bh_worker
   workqueue_softirq_action
   __do_softirq
   irq_exit_rcu
   el1_interrupt
   _raw_spin_lock
   usb_hcd_giveback_urb
   xhci_urb_dequeue
   unlink1
   usb_hcd_unlink_urb
   usb_unlink_urb
   unlink_urbs [usbnet]

Use spin_lock_irqsave() and spin_unlock_irqrestore() when taking
bh->lock in usb_hcd_giveback_urb() to prevent same-CPU hardirq and
softirq re-entrancy.

Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")
Cc: stable@vger.kernel.org
Signed-off-by: Chien Kun Niu <rickyniu@google.com>
---
 drivers/usb/core/hcd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b..7bb25e7c4 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1731,6 +1731,7 @@ static void usb_giveback_urb_bh(struct work_struct *work)
 void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 {
 	struct giveback_urb_bh *bh;
+	unsigned long flags;
 	bool running;
 
 	/* pass status to BH via unlinked */
@@ -1747,10 +1748,10 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 	else
 		bh = &hcd->low_prio_bh;
 
-	spin_lock(&bh->lock);
+	spin_lock_irqsave(&bh->lock, flags);
 	list_add_tail(&urb->urb_list, &bh->head);
 	running = bh->running;
-	spin_unlock(&bh->lock);
+	spin_unlock_irqrestore(&bh->lock, flags);
 
 	if (running)
 		;
-- 
2.56.0.611.g1030f0b940-goog


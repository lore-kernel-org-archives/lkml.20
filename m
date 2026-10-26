Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994447;
	b=ESx6f4spUZrQRG5AK74NsLXV8EWvK2cCHyHqZeEDNSNr2T+q/RZVMiihg7J47oJjG0Ug
	 4eXizOvwV2lD4jvsqS1aqMX4fxF2zXnEPJrACh14Q2UtOYt2iRdYOWqQa0ycyq9BxWO9W
	 1GfP4p7ry2cEA0NwfJwhKw8YSmKNdpWFDm5SDCnI/OdZWPXrvqbTvT8b6y7yqpkryFyZK
	 0yEti834R7ieJZjA/SWa3jwXpFJOnk820+rRJVANXbtzRRI7kqWAMsY+XFpWDsx+ErhAv
	 Qq+lwW6Pjj9yzSOFYV49Oi1YJ36hhdIOCBNBtvBXadCki/Z38Ni8K9gUwFjCgCpGMKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
	b=db7f3onJzqImSwaN1dAZqko9dfao1cIZP8gplg1K5Ha6yG/xYItrIjjPv0ZvROjSF24M
	 FAHXAOBWKQksIKsUWAEpBhvVkCbs8t8ScMIj+Em6Fafz6llVz0WZhrcl3yLGf6AuQNghH
	 mtN4su6+Kzkh7TAw3sKVlRM0PKZOsIOMR24QHl4j5aDIoYZd/AJ8Ia3x35erSr6tU6Tqs
	 c7Tf1xCkGai0nZ9JW18+4eVfA2SgVipglPeEIF5zFwvd9ntLgWaysRmWaaNuNHtKWWu2H
	 V5zwXoxIYk1ndWZqKXSkphR9ObrR8z2Y1gGPG8RFEUbY7iegzWf9Nc5yAtm030tHEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVoaYR4K;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aVoaYR4K
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89f85edd210so771449b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994446; x=1793599246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
        b=aVoaYR4KGwxdEJ+I9HK+HQUmLk9NnMqwNe05yhHvbQ0ntmWgK2HnQVFeiQ8euA15KA
         ipZGt4+fo6BqsoHvS4T0K1F6cT0h/EFZP2Hgv3CUB0DO1TQz/stuIFPl8XXUZ6dLFlha
         WqexFO/xUhWOGullcV3CXon2Xyi4EdNEomovKc1VxdM1UCzaylM6Cvsb3tp5z+fafF+1
         WvYrOKQi2xlYOCjuUsbvM6s1Xe1E+v7VWGVJmqixtL2zfM8hhRLJb/k6AkpdMZSdCRIS
         3HnkzlsAebBB6f48C6VYQ3WDW7itas1rdVHWBi4MtWdFOlJxnTMCEuDfph/0BlCYISBg
         OnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994446; x=1793599246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AthUPl1Vi250H7j13yBEimZbQkhUEMEFrCpf0L5Rwag=;
        b=0Gj/V8vR2OQ2j4tzRBFW7L5zfHnmX7zQ0fChUU0huGOmQCVAKjZnYDo/pchwqs0Xp0
         lk3djKI2IkeNDlrv+tnw53Ugo47YXOQ416Wm1xGtzVOpGaOBfVMo0Y78+6WoYPbaQkKW
         x6LAQGdgPGV4s/nNT9s60PE7DA055Z3h99Mur9JtIyd+RjHI8VB4WQYD59wDYfSL7THV
         nQENvGsEBgP0S6rq4VPb42ykM1MJPOFvKOYdN6EgIIhUMw6r5r2lVjRggGqN6XlSlbyr
         wHLi+wDIjpJj/kI4jnlZLSACrePzViUIon1+9jVoYtC9IkXXKcf1GRoF5lLJqtcNqDC3
         +XWg==
X-Forwarded-Encrypted: i=1; AKwUvBwqhwtqA8qFPe1VQ8c8sZykpSgK0zev2WMXg64rmvOhP9Wi2nOgIOhgV0/CkzvPdRSfjw5s9McBxkOPJ9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaf/PvBLZ2rLpBMGJ2xSgJKxzHyC8jV7plEWPgGZrEapWpVt+d
	VjQfbpHdve57pIHmfNropTPqilKyOHAQ7ulDyupvSf31/1fV/8IiMwhX
X-Gm-Gg: AYBFou3AExinal+tdc0XXCU7N0Q5BMgpXeFIwAMAPeNJiN91lW3M7tfNcABkSqDXQZ2
	2a55q7ffwERLbOgn89ZWgFTlil/2PEC+u0A1tPctYlImvvY3KBAxOu49YERQ941JMUdKzLf2KOj
	Wxrny5X0JAIEukuEB4PihI4b7QTLVqiyHZp0gNu1F9hQ+IEUZQJvmD8jbod6pjz0XU/9a9y7pF1
	qxRzzwF+rqwgiIHcC+kRBdNcYqVWm3iB0apHXTzdEEPDG3bfgdLrf/ae6uLIThkGQqzX3cXY1jX
	NidK2UhMctFLAQSyb/7MRMbVPbLAKsChK5J7Wdq075PQNoDqUiuXJsncbO5P+ze3PCgZsZuQ+yq
	WUtL/29oWOS6eJz6NsU3Hh7AsueLpGmEz87jgp0eC3X32mLWtLrocZoWVdC0+RU0hn8e0Q/C8SS
	TPJfl+iWcazGAbEO65Ed7AikbjHan/m9Xz1taUkTGdF5S8i8/8jsJTUuuUbhGNJHN+TfjclTLIi
	LFLBNnovJ5M2ARittrvwVylD69sd7qbqjipVIuCmFkpBd5s1LFoekkAswMhOLRUwgIxS5M91Fd7
	rkgriHyUev5R5Hy6ezs5ZXIxz9dgiBUo5vgD/DioZhfIPaFGygbao2FILm0FbnsCyiSY1dEh2zh
	6dDi9i9w/I+2wOT6R7tNDM2DPpNmq
X-Received: by 2002:a05:6a00:3a11:b0:88d:8074:1a9e with SMTP id d2e1a72fcca58-8a364b4c9f7mr867710b3a.3.1792994446159;
        Sun, 25 Oct 2026 23:00:46 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c4e8616sm993961b3a.56.2026.10.25.23.00.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 23:00:45 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Mon, 26 Oct 2026 16:00:31 +1000
Message-ID: <20261026060031.60582-1-yuz08559@gmail.com>
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

ecm_do_notify() guards re-entry only with an atomic_read() of
notify_count, then fills ecm->notify_req, does atomic_inc() and
usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
runs from three contexts that share no lock: ecm_notify_complete(),
ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().

When the completion handler decrements notify_count to 0 and re-enters
ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
notify_count == 0 in the window between the atomic_dec() and the next
atomic_inc(), and queue the same ecm->notify_req a second time.  The
request is then added to the endpoint queue twice (list_add corruption),
and notify_state is updated concurrently.

struct f_ecm has carried a FIXME about this missing locking.  The sibling
f_ncm already serializes the identical state machine with a per-instance
spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
and ecm_notify() in open/close/set_alt and across the state update in
ecm_notify_complete(), dropping it only around usb_ep_queue().

Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_ecm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index e495bac..d699832 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -59,9 +59,8 @@ struct f_ecm {
 	atomic_t			notify_count;
 	bool				is_open;
 
-	/* FIXME is_open needs some irq-ish locking
-	 * ... possibly the same as port.ioport
-	 */
+	/* protects the notification state machine */
+	spinlock_t			lock;
 };
 
 static inline struct f_ecm *func_to_ecm(struct usb_function *f)
@@ -414,7 +413,11 @@ static void ecm_do_notify(struct f_ecm *ecm)
 	event->wIndex = cpu_to_le16(ecm->ctrl_id);
 
 	atomic_inc(&ecm->notify_count);
+
+	/* usb_ep_queue() can complete the request re-entrantly */
+	spin_unlock(&ecm->lock);
 	status = usb_ep_queue(ecm->notify, req, GFP_ATOMIC);
+	spin_lock(&ecm->lock);
 	if (status < 0) {
 		atomic_dec(&ecm->notify_count);
 		DBG(cdev, "notify --> %d\n", status);
@@ -438,6 +441,7 @@ static void ecm_notify_complete(struct usb_ep *ep, struct usb_request *req)
 	struct usb_composite_dev	*cdev = ecm->port.func.config->cdev;
 	struct usb_cdc_notification	*event = req->buf;
 
+	spin_lock(&ecm->lock);
 	switch (req->status) {
 	case 0:
 		/* no fault */
@@ -455,6 +459,7 @@ static void ecm_notify_complete(struct usb_ep *ep, struct usb_request *req)
 		break;
 	}
 	ecm_do_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 static int ecm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
@@ -588,7 +593,9 @@ static int ecm_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 		 * follow another (if the first is in flight), and instead
 		 * just guarantee that a speed notification is always sent.
 		 */
+		spin_lock(&ecm->lock);
 		ecm_notify(ecm);
+		spin_unlock(&ecm->lock);
 	} else
 		goto fail;
 
@@ -653,8 +660,10 @@ static void ecm_open(struct gether *geth)
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	spin_lock(&ecm->lock);
 	ecm->is_open = true;
 	ecm_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 static void ecm_close(struct gether *geth)
@@ -663,8 +672,10 @@ static void ecm_close(struct gether *geth)
 
 	DBG(ecm->port.func.config->cdev, "%s\n", __func__);
 
+	spin_lock(&ecm->lock);
 	ecm->is_open = false;
 	ecm_notify(ecm);
+	spin_unlock(&ecm->lock);
 }
 
 /*-------------------------------------------------------------------------*/
@@ -942,6 +953,8 @@ static struct usb_function *ecm_alloc(struct usb_function_instance *fi)
 	if (!ecm)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock_init(&ecm->lock);
+
 	opts = container_of(fi, struct f_ecm_opts, func_inst);
 	mutex_lock(&opts->lock);
 	opts->refcnt++;
-- 
2.43.0


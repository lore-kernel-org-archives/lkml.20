Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641224;
	b=LGb4ytmIZyuW//LYvWjM1rdYlN17buK31GHiOlz1zDlZAf7edv4NSLw48nNl+YMggLWn
	 J1CUBxARIpLMEoeY+bp18UlENE52MOgy+NCJkDJeURoi+NB3tAVuHIw2/9Zzkc7UB38co
	 Z2+UwCsKwW3Rb9VxNvYQDykhkjdDf4cDNwkIusqRGfW9QJ+qZ0TsExNAcuGY9gJHgCHJu
	 JTsweqJOjUV1spsWsZlgb+/RPDsHMz6B1xlUiBomXOLJbTbRglBMCSDoQeq01BBmWvs+a
	 lU/nWODRgpS4rRFBgUmhHteCr8ntM2+2Y+7rPbaNkn9ufeWQGtYDrVAuf4Hb/IT9olw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+eg0Z1v0xlPH4EWpka+bIG4w+yP+2jwlmf/y3lxAu/0=;
	b=lB1OO0yTqLWSTxABjHqKhOiocL5FrEKjYlD5D9w/h19R3vHYv66KqJJYBZCvCoZ9ofeo
	 Bg2ZVnaNY+bqAxXDDRvky7+A5pBqCGUc27Nvjx1uDQ5p2Dd4a0tUc6q0n/OGIW7bNcrLZ
	 cHaA0oWl8rcPluXSIn4Kl5650N5VnBhvQOXPpQQFLbNzp9a64t8484Fpkmuh1Vlx2doOv
	 UIaJmb/SauUsGJ7gFjA5/SlTU2N6fD07AECCmjWxsD4iqxmWllh1uooIVHvBRZ2Hf8jQB
	 Akb8xyICRnqyVaA6sfm5w+/L88Q6QUZnghkKNCq0Le+C5tZ+rplwnPtmahb8ubsZ41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E03606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E03606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so946088c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641223; x=1793246023;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eg0Z1v0xlPH4EWpka+bIG4w+yP+2jwlmf/y3lxAu/0=;
        b=gla5zENbfEFLtY9JftjHflmtlbZHMxc5Gg+yAuAto8Y0LvpezVNtTSew5nfKK2K4iY
         tmoZHZYC5t4ks/SxD11MeJA17n9xOAqQP7YHmt5oxLOs2iCQLwHxcYMRKVh+QvLEms2J
         O9+IygfnDuiyOwiyzqeH0kqqKr4qgT8qJlzdk2XY8qL3jJBKH5/c0fvIQzUvdOeeaRmk
         h66XaWJwt4wwE2dysPPsX20C84aFeUzSzs8ga0Xy3bjoU4dVckSIwCOQvRD+tJvJk7Nm
         BsSRfkPjTSkGwR0jq/DjpvQO5C0Bf83Be8Q4byz60EZ32JDrtasObJmE66MJacm+1flq
         zcLA==
X-Forwarded-Encrypted: i=1; AKwUvBztcxeYmDjWjNsL4zpoNda82AUR5mKxEEX2aRWPjXeWVcb3xSiENLwAoZ9qGAj1onzg/jGiwtHTtCg/6II=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdPxubFTjM2iuVevlVxYLQzbYN9hxeLKm0+QBsH0lL8IZjhbNJ
	ztj/u0iu7GuFtCnc3B/B+rp1+UDuvpSnYN5ChM5kzJ6o8ZdlPINa04u1
X-Gm-Gg: AYBFou02Bdgfa1lQXqE7bF0FjvteoPur0KUcAcq9Iw7Efa7Bv14/q72Pk99FIqQwn01
	lHNCWjaGr2nLvR+8KDppq195/JVN8inCSLVTSljGFPXInhoPa82DMdQKUZWljCLYJ5Jc3zpeewU
	EfzfcoVcfhTgkhDyJP2jNF8ZspprVAmsLYcnkCKGtjMBWlvlkfIlVSlNdgn7WQWWhAV8t3GQHQb
	p6bUstQF/MCj5evv1X06nXlAiyhPF4zjvJojlO/xg64Tkfz4i2skgZSkuadywTGRb7Ksc8sd/Sq
	qQSKHKviNjIDnYMCCCYISwJCIf9Wq9AfQ32fRQBlcxah5ASYPpIeaVP+/naQej4TqgDQPZnV2F4
	EqUn0cd1YLewfkusV58zKffJUwKQF0NJXqJsne54KEfEM07jfb3h3eD/mVmIiZr431RBJXnafbK
	G/wlIpByhrd0zQHU6oahsRrQoNJW0cFIZc7+rD2tDgSGzgdugKdmeisyDZy058i4GYjghcdPmG9
	pVxOWGnutHzx2r7r/hykeoa5b19OMjLdbHkAG5T906jqS5MSWVYHNaFwwSuSK6p4yaxSSXb0Uqa
	WTZGjRcaxfdSLBkDC9nKkdETLfrTV1cW2H9MCvE0YYYtR7wHN2QTI9XfoUw=
X-Received: by 2002:a05:7022:698c:b0:17b:fed6:7449 with SMTP id a92af1059eb24-190a7c21166mr6815764c88.47.1792641222800;
        Wed, 21 Oct 2026 20:53:42 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:42 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject:
 [PATCH 3/3] usb: core: Close residual anchor read-to-lock window with RCU
Date: Thu, 22 Oct 2026 11:53:39 +0800
Message-ID: <179264121921.17277.3541477544711634211@kylinos.cn>
In-Reply-To: <179264120148.17277.68253767316647311@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

usb_unanchor_urb() and the URB giveback read urb->anchor and only then
acquire anchor->lock.  Between the read and the lock acquisition the
anchor can already have been freed: a concurrent unanchor of the last
URB empties the anchor, a usb_wait_anchor_empty_timeout() waiter
observes the wait condition true, returns, and the driver frees the
memory holding the anchor; the spin_lock() then touches freed memory.
This gap is as old as usb_unanchor_urb() itself and was deliberately
left open by the capture-to-increment fix, whose guarantee is scoped to
givebacks that have already incremented suspend_wakeups.

A plain reference count cannot close this gap: the first dereference of
the freshly read anchor pointer would have to be the refcount increment
itself, so the pin would be taken on memory that may already have been
freed.  Protecting the pointer read requires deferred reclamation, and
because anchors are embedded in driver-private structures and freed
with plain kfree() right after a successful wait, the deferral has to
live on the side usbcore controls: the return of the wait.

Convert the anchor wakeup protocol into a lifetime protocol:

 - The two lockless urb->anchor reads (usb_unanchor_urb() and
   usb_unanchor_urb_and_suspend_wakeups()) run inside RCU read-side
   critical sections, and urb->anchor is published with
   rcu_assign_pointer().

 - The wait condition is evaluated under anchor->lock together with
   taking a suspend_wakeups pin in the same critical section, so at
   most one thread at a time owns the "anchor is unused" observation.

 - Every function whose return lets the caller free the anchor --
   usb_wait_anchor_empty_timeout() on a non-zero return,
   usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
   usb_scuttle_anchored_urbs() -- holds that pin across one
   synchronize_rcu() before dropping it and returning.  These are
   teardown guarantees: provided the caller stops anchoring new URBs,
   readers that read urb->anchor before the grace period have
   acquired and released anchor->lock by the time the caller may free
   the anchor, and readers after it find urb->anchor =3D=3D NULL and
   never touch the anchor at all.  (A concurrent usb_anchor_urb()
   would re-publish urb->anchor; the protocol does not police the
   caller's own anchoring.)

usb_wait_anchor_empty_timeout() keeps its documented contract: a zero
timeout still performs a single condition evaluation without entering
the wait queue -- a successful evaluation still waits one grace period
before returning -- the deadline is fixed at entry so any grace period
waited is accounted against the caller's timeout budget, and a
successful wait returns 1 rather than the remaining jiffies, with the
anchor state re-checked after the grace period.

The giveback's long window across the completion handler keeps the
suspend_wakeups pin it already takes.  No fields are added to struct
usb_anchor or struct urb and no driver changes are required; the cost
is one RCU grace period per successful teardown exit -- including
teardown of an already-empty anchor, which previously returned without
one -- so usb_kill_anchored_urbs(), usb_poison_anchored_urbs() and
usb_scuttle_anchored_urbs() must now be called from a context that can
sleep (all in-tree callers already do).  The per-URB hot paths gain
only rcu_read_lock()/rcu_dereference() around the lockless anchor
reads and rcu_assign_pointer() for the anchor pointer updates.

Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/urb.c | 255 +++++++++++++++++++++++++++++++----------
 include/linux/usb.h    |   7 +-
 2 files changed, 202 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index c78f72bc7cc0..4fc6ec758294 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/log2.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
 #include <linux/usb/hcd.h>
@@ -132,7 +133,7 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor *a=
nchor)
 	spin_lock_irqsave(&anchor->lock, flags);
 	usb_get_urb(urb);
 	list_add_tail(&urb->anchor_list, &anchor->urb_list);
-	urb->anchor =3D anchor;
+	rcu_assign_pointer(urb->anchor, anchor);
=20
 	if (unlikely(anchor->poisoned))
 		atomic_inc(&urb->reject);
@@ -149,28 +150,71 @@ static int __usb_anchor_check_wakeup(struct usb_anchor =
*anchor)
 }
=20
 /*
- * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
- * meant for waiters which do not hold the lock: the critical section
- * serializes with the URB giveback path, so once the check succeeds no
- * giveback that has incremented suspend_wakeups will touch the anchor
- * anymore and the caller may free the memory holding the anchor.
+ * Wait-condition side of the anchor lifetime protocol: evaluate the
+ * wakeup condition under anchor->lock and, if it holds, take a pin
+ * (increment suspend_wakeups) inside the same critical section.  While
+ * the pin is held the condition is false for every other thread, so at
+ * most one waiter at a time owns the "anchor is unused" observation and
+ * may carry out the grace-period exit before any other waiter proceeds.
+ *
+ * The caller must pair a true return with usb_anchor_finish_wait(),
+ * which drops the pin.
  */
-static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+static int usb_anchor_pin_if_wakeup(struct usb_anchor *anchor)
 {
 	unsigned long flags;
 	int wakeup;
=20
 	spin_lock_irqsave(&anchor->lock, flags);
-	wakeup =3D __usb_anchor_check_wakeup(anchor);
+	if (__usb_anchor_check_wakeup(anchor)) {
+		atomic_inc(&anchor->suspend_wakeups);
+		wakeup =3D 1;
+	} else {
+		wakeup =3D 0;
+	}
 	spin_unlock_irqrestore(&anchor->lock, flags);
=20
 	return wakeup;
 }
=20
+/*
+ * Drop a pin taken by usb_anchor_pin_if_wakeup() after letting one RCU
+ * grace period elapse.  The grace period flushes readers that have read
+ * urb->anchor but not yet acquired anchor->lock (see usb_unanchor_urb()
+ * and usb_unanchor_urb_and_suspend_wakeups()): once it completes, no
+ * reader that started before it can still touch the anchor, so waking
+ * other waiters and returning to the caller -- which may then free the
+ * memory holding the anchor -- is safe.  Readers that start after the
+ * grace period see urb->anchor =3D=3D NULL and never touch the anchor at
+ * all, provided that no concurrent usb_anchor_urb() re-publishes the
+ * anchor: the safe-to-free guarantees of this protocol are teardown
+ * guarantees and assume the caller stops anchoring new URBs.
+ *
+ * Must not be called with anchor->lock held.
+ *
+ * Returns true if the anchor is unused once the pin is dropped.
+ */
+static bool usb_anchor_finish_wait(struct usb_anchor *anchor)
+{
+	unsigned long flags;
+	bool unused;
+
+	synchronize_rcu();
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	atomic_dec(&anchor->suspend_wakeups);
+	unused =3D __usb_anchor_check_wakeup(anchor);
+	if (unused)
+		wake_up(&anchor->wait);
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return unused;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
-	urb->anchor =3D NULL;
+	rcu_assign_pointer(urb->anchor, NULL);
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
 	if (__usb_anchor_check_wakeup(anchor))
@@ -191,19 +235,28 @@ void usb_unanchor_urb(struct urb *urb)
 	if (!urb)
 		return;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
-		return;
-
-	spin_lock_irqsave(&anchor->lock, flags);
 	/*
-	 * At this point, we could be competing with another thread which
-	 * has the same intention. To protect the urb from being unanchored
-	 * twice, only the winner of the race gets the job.
+	 * The anchor pointer is read locklessly: a concurrent unanchor can
+	 * empty the anchor and let a waiter return and free it before this
+	 * thread manages to acquire anchor->lock.  The RCU read-side
+	 * critical section keeps the anchor memory alive across that gap;
+	 * anchor lifetime gates (see usb_anchor_finish_wait()) wait for a
+	 * grace period before any of them lets the caller free the anchor.
 	 */
-	if (likely(anchor =3D=3D urb->anchor))
-		__usb_unanchor_urb(urb, anchor);
-	spin_unlock_irqrestore(&anchor->lock, flags);
+	rcu_read_lock();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		/*
+		 * At this point, we could be competing with another thread which
+		 * has the same intention. To protect the urb from being unanchored
+		 * twice, only the winner of the race gets the job.
+		 */
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor)))
+			__usb_unanchor_urb(urb, anchor);
+		spin_unlock_irqrestore(&anchor->lock, flags);
+	}
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
=20
@@ -227,6 +280,13 @@ EXPORT_SYMBOL_GPL(usb_unanchor_urb);
  * "@urb is on anchor->urb_list" are changed together only while
  * holding anchor->lock.
  *
+ * Like usb_unanchor_urb(), the initial urb->anchor read is protected by
+ * an RCU read-side critical section, so a concurrent unanchor cannot
+ * make the anchor vanish between the read and the lock acquisition:
+ * an anchor is only freed after a grace period that flushes readers
+ * of the anchoring being torn down.  Anchoring new URBs concurrently
+ * would re-publish urb->anchor and is outside that teardown contract.
+ *
  * Return: the anchor, which the caller must later pass to
  * usb_anchor_resume_wakeups(), or NULL if @urb is not anchored
  * anymore (a concurrent unanchor won the race).
@@ -236,18 +296,19 @@ struct usb_anchor *usb_unanchor_urb_and_suspend_wakeups=
(struct urb *urb)
 	struct usb_anchor *anchor;
 	unsigned long flags;
=20
-	anchor =3D urb->anchor;
-	if (!anchor)
-		return NULL;
-
-	spin_lock_irqsave(&anchor->lock, flags);
-	if (likely(anchor =3D=3D urb->anchor)) {
-		atomic_inc(&anchor->suspend_wakeups);
-		__usb_unanchor_urb(urb, anchor);
-	} else {
-		anchor =3D NULL;
+	rcu_read_lock();
+	anchor =3D rcu_dereference(urb->anchor);
+	if (anchor) {
+		spin_lock_irqsave(&anchor->lock, flags);
+		if (likely(anchor =3D=3D rcu_dereference(urb->anchor))) {
+			atomic_inc(&anchor->suspend_wakeups);
+			__usb_unanchor_urb(urb, anchor);
+		} else {
+			anchor =3D NULL;
+		}
+		spin_unlock_irqrestore(&anchor->lock, flags);
 	}
-	spin_unlock_irqrestore(&anchor->lock, flags);
+	rcu_read_unlock();
=20
 	return anchor;
 }
@@ -873,15 +934,19 @@ EXPORT_SYMBOL_GPL(usb_block_urb);
  * with guarantee that no completer callbacks will take place from the
  * anchor after this function returns.
  *
+ * It is safe to free the anchor (or the structure embedding it) once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently.  This function may sleep (it waits one RCU grace
+ * period on the success path).
+ *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
  */
 void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
-	int surely_empty;
=20
-	do {
+	for (;;) {
 		spin_lock_irq(&anchor->lock);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
@@ -894,11 +959,24 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
-		spin_unlock_irq(&anchor->lock);
-		cpu_relax();
-	} while (!surely_empty);
+		if (__usb_anchor_check_wakeup(anchor)) {
+			/*
+			 * Pin the anchor across one grace period before
+			 * declaring it unused: a thread that has read
+			 * urb->anchor but has not yet acquired anchor->lock
+			 * must not touch the anchor after the caller frees
+			 * it.
+			 */
+			atomic_inc(&anchor->suspend_wakeups);
+			spin_unlock_irq(&anchor->lock);
+			if (usb_anchor_finish_wait(anchor))
+				return;
+		} else {
+			spin_unlock_irq(&anchor->lock);
+			cpu_relax();
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
=20
@@ -911,15 +989,19 @@ EXPORT_SYMBOL_GPL(usb_kill_anchored_urbs);
  * from the back of the queue. Newly added URBs will also be
  * poisoned
  *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently.  This function may sleep (it waits one RCU grace
+ * period on the success path).
+ *
  * This routine should not be called by a driver after its disconnect
  * method has returned.
  */
 void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
-	int surely_empty;
=20
-	do {
+	for (;;) {
 		spin_lock_irq(&anchor->lock);
 		anchor->poisoned =3D 1;
 		while (!list_empty(&anchor->urb_list)) {
@@ -933,11 +1015,18 @@ void usb_poison_anchored_urbs(struct usb_anchor *ancho=
r)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
-		spin_unlock_irq(&anchor->lock);
-		cpu_relax();
-	} while (!surely_empty);
+		if (__usb_anchor_check_wakeup(anchor)) {
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			atomic_inc(&anchor->suspend_wakeups);
+			spin_unlock_irq(&anchor->lock);
+			if (usb_anchor_finish_wait(anchor))
+				return;
+		} else {
+			spin_unlock_irq(&anchor->lock);
+			cpu_relax();
+		}
+	}
 }
 EXPORT_SYMBOL_GPL(usb_poison_anchored_urbs);
=20
@@ -967,8 +1056,11 @@ EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
  * @anchor: the anchor you want to suspend wakeups on
  *
  * Call this to stop the last urb being unanchored from waking up any
- * usb_wait_anchor_empty_timeout waiters. This is used in the hcd urb give-
- * back path to delay waking up until after the completion handler has run.
+ * usb_wait_anchor_empty_timeout waiters. The hcd urb give-back path,
+ * which delays waking up until after the completion handler has run,
+ * uses usb_unanchor_urb_and_suspend_wakeups() for that nowadays; this
+ * export remains for external users pairing it with
+ * usb_anchor_resume_wakeups().
  */
 void usb_anchor_suspend_wakeups(struct usb_anchor *anchor)
 {
@@ -1014,22 +1106,51 @@ EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
  * Call this is you want to be sure all an anchor's
  * URBs have finished
  *
+ * A non-zero return also makes it safe to free the anchor (or the
+ * structure embedding it), provided that no new URBs are anchored to
+ * it concurrently.  This function may sleep; in particular, a
+ * successful wait -- even with a zero timeout -- waits one RCU grace
+ * period before returning.
+ *
  * Return: Non-zero if the anchor became unused. Zero on timeout.
  */
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	unsigned long deadline =3D jiffies + msecs_to_jiffies(timeout);
+	long ret;
+
 	/*
-	 * The condition must be evaluated under anchor->lock: when this
-	 * function returns non-zero, every URB giveback that has incremented
-	 * suspend_wakeups has finished with the anchor, so the caller may
-	 * free the anchor, which is typically embedded in the driver's
+	 * The condition is evaluated and pinned under anchor->lock.  When
+	 * this function returns non-zero, every URB giveback that has
+	 * incremented suspend_wakeups has finished with the anchor and one
+	 * RCU grace period has flushed any reader that was still between
+	 * reading urb->anchor and acquiring anchor->lock, so the caller
+	 * may free the anchor -- provided that no new URBs are anchored
+	 * concurrently -- which is typically embedded in the driver's
 	 * private structure.  A zero return (timeout) means a giveback may
 	 * still be in flight and gives no such guarantee.
 	 */
-	return wait_event_timeout(anchor->wait,
-				  usb_anchor_check_wakeup(anchor),
-				  msecs_to_jiffies(timeout));
+	for (;;) {
+		/*
+		 * Clamped to zero so that a timeout of zero keeps its
+		 * historical meaning of a single condition evaluation
+		 * without entering the wait queue (a successful
+		 * evaluation still waits one grace period before
+		 * returning), and so the macro never sees a negative
+		 * timeout after the deadline passes.
+		 */
+		ret =3D wait_event_timeout(anchor->wait,
+					 usb_anchor_pin_if_wakeup(anchor),
+					 max_t(long, (long)(deadline - jiffies), 0));
+		if (!ret)
+			return 0;
+
+		if (usb_anchor_finish_wait(anchor))
+			return 1;
+		if ((long)(deadline - jiffies) <=3D 0)
+			return 0;
+	}
 }
 EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
=20
@@ -1040,6 +1161,11 @@ EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
  * This will take the oldest urb from an anchor,
  * unanchor and return it
  *
+ * A %NULL return does not mean the anchor is quiescent: a URB giveback
+ * may still be between its suspend_wakeups increment and its wakeup
+ * resume.  Call usb_wait_anchor_empty_timeout() and check for a
+ * non-zero return before freeing the anchor.
+ *
  * Return: The oldest urb from @anchor, or %NULL if @anchor has no
  * urbs associated with it.
  */
@@ -1069,25 +1195,36 @@ EXPORT_SYMBOL_GPL(usb_get_from_anchor);
  * @anchor: the anchor whose urbs you want to unanchor
  *
  * use this to get rid of all an anchor's urbs
+ *
+ * Like usb_kill_anchored_urbs(), it is safe to free the anchor once
+ * this function returns, provided that no new URBs are anchored to it
+ * concurrently.  This function may sleep (it waits one RCU grace
+ * period on the success path).
  */
 void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 {
 	struct urb *victim;
 	unsigned long flags;
-	int surely_empty;
=20
-	do {
+	for (;;) {
 		spin_lock_irqsave(&anchor->lock, flags);
 		while (!list_empty(&anchor->urb_list)) {
 			victim =3D list_entry(anchor->urb_list.prev,
 					    struct urb, anchor_list);
 			__usb_unanchor_urb(victim, anchor);
 		}
-		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
-		spin_unlock_irqrestore(&anchor->lock, flags);
-		cpu_relax();
-	} while (!surely_empty);
+		if (__usb_anchor_check_wakeup(anchor)) {
+			/* Same lifetime exit as usb_kill_anchored_urbs(). */
+			atomic_inc(&anchor->suspend_wakeups);
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			if (usb_anchor_finish_wait(anchor))
+				return;
+		} else {
+			spin_unlock_irqrestore(&anchor->lock, flags);
+			cpu_relax();
+		}
+	}
 }
=20
 EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
@@ -1096,6 +1233,8 @@ EXPORT_SYMBOL_GPL(usb_scuttle_anchored_urbs);
  * usb_anchor_empty - is an anchor empty
  * @anchor: the anchor you want to query
  *
+ * This is an unsynchronized peek; it gives no lifetime guarantee.
+ *
  * Return: 1 if the anchor has no urbs associated with it.
  */
 int usb_anchor_empty(struct usb_anchor *anchor)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 49ab8dbb885f..5adc502b4868 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1445,7 +1445,10 @@ typedef void (*usb_complete_t)(struct urb *);
  * struct urb - USB Request Block
  * @urb_list: For use by current owner of the URB.
  * @anchor_list: membership in the list of an anchor
- * @anchor: to anchor URBs to a common mooring
+ * @anchor: to anchor URBs to a common mooring; usbcore publishes it
+ *	with rcu_assign_pointer() and consumes it under
+ *	rcu_read_lock() with rcu_dereference(), see
+ *	drivers/usb/core/urb.c for the anchor lifetime protocol
  * @ep: Points to the endpoint's data structure.  Will eventually
  *	replace @pipe.
  * @pipe: Holds endpoint number, direction, type, and more.
@@ -1640,7 +1643,7 @@ struct urb {
 	struct list_head urb_list;	/* list head for use by the urb's
 					 * current owner */
 	struct list_head anchor_list;	/* the URB may be anchored */
-	struct usb_anchor *anchor;
+	struct usb_anchor __rcu *anchor;
 	struct usb_device *dev;		/* (in) pointer to associated device */
 	struct usb_host_endpoint *ep;	/* (internal) pointer to endpoint */
 	unsigned int pipe;		/* (in) pipe information */
--=20
2.32.0


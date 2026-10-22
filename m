Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641211;
	b=3hVSw3TLJGQNCLEaPnQu4jlmah1sP+Fnpy3zL4pb1XRUCjLTY3RlEbIgM6KxdpLQyDRX
	 9elOlaCnbxeyuFIGpx1HlZbggIlV+ZJMIFkZEhlJUgZx7RnsPa+dtFDQLW4S0GM5I7MHn
	 AKDcIYiLXvRYWBdoLsmcQ4ohWzt0dCDNLRCn2UqznU7/NHddKzawVjh/rlPsRV72uDLLS
	 uyfs838qCe1lXip8mv4Qr1CO1eiuvE8Z1VjknsuyFxy1u9y+WjxfcNV24NpZzHKOH4k0K
	 2RHdPyBYcTSqRFMqvvRjGL1yzPFmDSPNR2v+5YUrap8oU+9SuQUU/0wwHkaeOAoYmow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641211;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+9VfrWpCXyJqqanLYfDlYAazaI2y9OgYpPFZUs/AAaQ=;
	b=3b0mMVXYajN55CWC1W7TM8EZ638YcYKJ3cOnXk4EhYC2Qnb8im2hPfKrMQovg+0CoZxx
	 lI0dIXNUSMDSY4lDF/gklQkTZKh6fc/nAm9m6Vbf3SKQLSV5m5nVuX3DwXWK8mA7zhAiq
	 CzUt7F1SQ/Rl/rTkx16S8sh0nkI4QITzPD8s1s2Mx1kE/8B/lot5YQPh/EDk6KqqGI4oH
	 nzc+8uRXI5NTax/0CNgoI8B8q3M+l2FpfwXR6idJJ3oKiOU4W50+I8nwpZeFwblZSzcAc
	 25gznDWCJ9+0CAUhlqv9YI2YoE7ixgH9elePmsjdjR1SL/k7BGE2Uef0pYRePXQOAQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836D6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14fc585291cso198556c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641210; x=1793246010;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9VfrWpCXyJqqanLYfDlYAazaI2y9OgYpPFZUs/AAaQ=;
        b=WCliuR0rrgsvvz3DbXgSb9vHQTo5fOLxz3jPrO+HzzRZV+hk/QBz0cp5WOEBAC1vgS
         jkunW4zO5QUfeEyzH6z7vz7qLy6rikgV/ShqZm0gXk+RQYi7kmCWQzfenLLViv8qdvFF
         nfX+euqS+GYIb48XqPJf58nMxrjgWfCKyoKaFGoxKFsgEvqaUwsENiEDccnnJqN24AtG
         JuaZrLshaqJT5ZSpTRnBRA080PJqpQUPKaG2qTkB0RJdZ1vCzALmb2DR6B3yPW0VImrY
         t3/dccbwASuWjPZtH9aMSwzawZhAx+Tbww1TbV1dFc/FT/bz+8MG5y8Dezm84ty/D+w4
         CkBw==
X-Forwarded-Encrypted: i=1; AKwUvByXrmdlntgwpRtaz/qTqEToaK5Qfvk/zn5DocZ68ICx5xLvO/PjLkd0V3LKi+f7nO23g+PcAJFvfhJeNf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwlUhxSrMhAnImqRheQ1cLfMPmUFWGRn3RrjxG76aAq1TDbv/T
	dR14LHfDjf7oYj6z8xGP7H0Ql4vyM1+G+9onkxObdSI5jFg7tHUYGJm0
X-Gm-Gg: AYBFou2iNdIj2rY3Q5IjZkzFSjb45l8CxDcDvk64QhAsyL7s4nzfnQDqd1LeAkDN+s9
	+MuDqszQ61f/nb9uxKW4ngY3vcl0jZ4LXJRVn8GJ7I8GFfvtKUt1PPCklJG6JHOEl7duOmy/Yy1
	GDNJWp5aP7OQehqi26dTzBKCSTFz++m28U0Z5Xsc25X2XqWTB2rCEEfpzGpGXiwgymRYmGwMXRS
	tvFdCMmqUTgrT+PL+h+7t0yi1fU1rz+lkVCy5anQcL2OQCoYrgk99ApwPyZIfn107ljb5s0olM8
	hckv/iUKmsIEoUn8M6mrNGJF/bCy/w159x7JjTXJOn1R0iZgLgUDX8h+pvwtbxIP9QHlO9HPuZ3
	48E05mGx+rfg8nbnxciLrOai1L9mArEjdrPPHqO1rHJ6LPtnSyh2cLV5SU5Jbzr8UrW9//IB7aP
	oPHADGkWFLURwtOPfN8fB/2y+5MHNo8mYL1qUDiMG8ADpYoCVNkI7gaEOgRIAhKF2hyTXQcds0y
	bcT7jp8uOScxawXfvvQX4fx5B7cahvJfn3u+DAFegky+7HgbuzvoEjKmlZJ+HPNq+9yQ11ToUce
	9yb6bcTNzTslm6XeT4DVdDk8he9ngT9KoN4zTeCGwgguHpsCuTZNPr/gQyo=
X-Received: by 2002:a05:7022:eb46:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-190a61447a2mr5627852c88.34.1792641210368;
        Wed, 21 Oct 2026 20:53:30 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:30 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: core: Fix use-after-free in anchor wakeup protocol
Date: Thu, 22 Oct 2026 11:53:27 +0800
Message-ID: <179264120769.17277.3664390143604314731@kylinos.cn>
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

The API contract of usb_wait_anchor_empty_timeout() and of the anchor
cleanup helpers is that when they return successfully (non-zero, for
usb_wait_anchor_empty_timeout()), no URB giveback is in flight for the
anchor anymore, so drivers may free the memory holding the anchor
(xpad, for example, embeds irq_out_anchor in its private structure and
kfrees it in xpad_disconnect()).

This contract is broken by two windows in which the waiter can observe
"anchor list empty and suspend_wakeups =3D=3D 0" while the URB giveback
path is still about to access anchor->wait:

 1. usb_anchor_resume_wakeups() decrements suspend_wakeups, which
    makes the wait condition true, and only afterwards calls
    wake_up(&anchor->wait), without any synchronization in between.
    A waiter returns, the driver frees the anchor, and the late
    wake_up() then touches the freed wait queue head.

 2. __usb_unanchor_urb() wakes up waiters while holding anchor->lock,
    but usb_wait_anchor_empty_timeout() evaluated the same condition
    without the lock, so it could observe the emptied urb_list in the
    middle of that critical section and return before the wake_up()
    (and the spin_unlock()) had run.  Reading the two condition fields
    locklessly could likewise observe a stale suspend_wakeups value
    after the giveback's unanchor on weakly ordered systems.

Complete the locking protocol that commit fbc299437c06 ("usb: core:
Solve race condition in anchor cleanup functions") established for the
kill/poison/scuttle helpers: usb_wait_anchor_empty_timeout() now
evaluates the condition under anchor->lock (a small self-locking
wrapper around the lockless check), and usb_anchor_resume_wakeups()
performs the suspend_wakeups decrement together with the wakeup check
and the wake_up() within a single anchor->lock critical section.

With the decrement and the wake_up() atomic with respect to the locked
condition check, a waiter can only observe the condition true after
every giveback that has incremented suspend_wakeups has finished
accessing the anchor, so the guarantee that the wakeup is delayed
until the completion handler has run also extends to the anchor memory
itself.

The race has been reported by syzbot repeatedly since 2019, most
recently as:

	BUG: KASAN: slab-use-after-free in register_lock_class+0x8d1/0x980 kernel/lo=
cking/lockdep.c:1333
	[...]
	__wake_up_common_lock+0x25/0x1e0 kernel/sched/wait.c:105
	__usb_hcd_giveback_urb+0x3ac/0x530 drivers/usb/core/hcd.c:1653

	Freed by task 7828:
	[...]
	kfree+0x14a/0x380 mm/slub.c:4390
	xpad_disconnect+0x359/0x490 drivers/input/joystick/xpad.c:2194

and:

	BUG: KASAN: use-after-free in register_lock_class+0xe6a/0x1120 kernel/lockin=
g/lockdep.c:1336
	[...]
	__wake_up_common_lock+0xb4/0x130 kernel/sched/wait.c:136
	usb_anchor_resume_wakeups drivers/usb/core/urb.c:958 [inline]
	usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:951
	__usb_hcd_giveback_urb+0x2df/0x5c0 drivers/usb/core/hcd.c:1674

	Freed by task 3889:
	[...]
	kfree+0x173/0x390 mm/slab.c:3786
	xpad_disconnect+0x1cb/0x530 drivers/input/joystick/xpad.c:1905

Both reports lack a reproducer; the analysis was verified by walking
the two stacks against the code, not at runtime. All in-tree callers
of usb_wait_anchor_empty_timeout() (and every driver which frees an
anchor after the anchor cleanup helpers) are equally affected; xpad
is merely the one syzbot found.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Reported-by: syzbot+7f5e98b052c766f47f68@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000090170a0614431f47@google.com
Reported-by: syzbot+59d3714b44d79d02f944@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000038435e05e9f94cd4@google.com
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/urb.c | 51 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index c06b44ca507b..3afd184c9b32 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -139,19 +139,39 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor =
*anchor)
 }
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
=20
-static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+/* Callers must hold anchor->lock */
+static int __usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
 	return atomic_read(&anchor->suspend_wakeups) =3D=3D 0 &&
 		list_empty(&anchor->urb_list);
 }
=20
+/*
+ * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
+ * meant for waiters which do not hold the lock: the critical section
+ * serializes with the URB giveback path, so once the check succeeds no
+ * giveback that has incremented suspend_wakeups will touch the anchor
+ * anymore and the caller may free the memory holding the anchor.
+ */
+static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+{
+	unsigned long flags;
+	int wakeup;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	wakeup =3D __usb_anchor_check_wakeup(anchor);
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return wakeup;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
 	urb->anchor =3D NULL;
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
 }
=20
@@ -827,7 +847,7 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -866,7 +886,7 @@ void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -919,12 +939,23 @@ EXPORT_SYMBOL_GPL(usb_anchor_suspend_wakeups);
  */
 void usb_anchor_resume_wakeups(struct usb_anchor *anchor)
 {
+	unsigned long flags;
+
 	if (!anchor)
 		return;
=20
+	/*
+	 * The decrement, the wakeup check and the wake_up() must happen
+	 * under anchor->lock: usb_wait_anchor_empty_timeout() waiters
+	 * evaluate the same condition under the lock and may free the
+	 * anchor once they observe it true, so this function must not
+	 * touch anchor->wait after that.
+	 */
+	spin_lock_irqsave(&anchor->lock, flags);
 	atomic_dec(&anchor->suspend_wakeups);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
+	spin_unlock_irqrestore(&anchor->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
=20
@@ -941,6 +972,14 @@ EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	/*
+	 * The condition must be evaluated under anchor->lock: when this
+	 * function returns non-zero, every URB giveback that has incremented
+	 * suspend_wakeups has finished with the anchor, so the caller may
+	 * free the anchor, which is typically embedded in the driver's
+	 * private structure.  A zero return (timeout) means a giveback may
+	 * still be in flight and gives no such guarantee.
+	 */
 	return wait_event_timeout(anchor->wait,
 				  usb_anchor_check_wakeup(anchor),
 				  msecs_to_jiffies(timeout));
@@ -997,7 +1036,7 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 					    struct urb, anchor_list);
 			__usb_unanchor_urb(victim, anchor);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irqrestore(&anchor->lock, flags);
 		cpu_relax();
--=20
2.32.0


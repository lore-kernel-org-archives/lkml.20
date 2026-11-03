Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672453;
	b=t+oo7naCrR9vbgIajZ/VF7wTdCgG5WDUhqcpeJaWLscs4AxeTRDnSP2sQJAEPd8fro0y
	 bVX28p+YX5OoxzKZefQ47DXMdeTbj7RidtJaaIHhSBOmFdo/LH7powtYx5uWO8kGbhrXE
	 j5ZrBImFrBrph3F1FEewUKcpiRc9pM4gFmrhrytk7iQ9zBSnV8YYO+38Cn7TflbuD/gEj
	 q3wt4ow0UUt9Y/8Nv+2WAQXJk+pQKJu0vKklkaDBnbzGi1YRYGkhhQnhY0OmhD1uNjgSV
	 MkULJ71I0i9WwexfNris0K7wKcQatArJChtxBDPIhhDxKBuZH5jQbb3zTcteqByQrVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672453;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hwCjir16zV6j8q8dZZrO03DCp9mv8eYINb8EkAntaEA=;
	b=p+CrFzeP5594DxRigWmgoRk9EmNGRCWmI1z/2DP0YZCtWZOXJFkA5bERB4COZeS+9fnZ
	 5zHWxk2IO5DrO72PDs/5naDJbG9lZMmmI0G4a1VlFSRU7vghiP43Fgs7T7rwnJ0mdCF3O
	 p3Sp95XHyrii76b9zQKIxhO+CLWJZDbvOE6onIYMvVm7ky6fJHH4hsi4HqE/fZa9ehDlM
	 xXqd1O2QM6RBhw48hvNLaTYRfmZf65u4ARXKc7Cz4j09f73u/lh+vXfLwFCXY1NhY4Uzo
	 DzYxVv1Wri0A5SwyVJCukZZyobbTocRZ82ApZ4edGlcc05jZaVkVXbPKjCcqsL8MeXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0823606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0823606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so6266921c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672451; x=1794277251;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwCjir16zV6j8q8dZZrO03DCp9mv8eYINb8EkAntaEA=;
        b=0GGZkUheTXFe2Cbl24YieVUDflRf69dIcxifX0kbdN1kcFQ2+KJSjCGOemf+Jjsqsm
         ozwqQaBnCQXaZ2avxheYJ0aFO1PwOE1iXHh6bAtEbMvWPe90CzAXcxu6o0DEp5kVwHyx
         Mpr9M0hYeBCygNhxmrW0JxPkCVg4e2VKoZtYfWzCBeJP7kr5K6MIxlAxvLtDaIG6y4I0
         WiwoO6KcInLg5GrTp/xAh8Px+oRP1y+P0xplwtYlednRmMDgJn4Tz667pliqwO9Gxi+K
         72lskojmlCkzpcM/wYi8xP1Y51YY3dR8ZIBv9UyZ1jL2AJ1g1ZKugLnkuBL+ZI46sJ1E
         Xxuw==
X-Forwarded-Encrypted: i=1; AKwUvByFooWUBb57uI57T9j0KEI4HTLi+/TqgfQG3x+QHrmNzZ8LdSkVEMYWWVpymcDEvvlH07TqU7/zBwRUfzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqDCIdnd9rcroTn9lkmTv+PVHsU9a4qEDfRZmRJJ81iqw0Jqcv
	DEz1IfTUb5Pf/XlzR5AL5lLyPPTQyn8Bis3j4v5kU4HJTI1wz8yFBQQm
X-Gm-Gg: AYBFou3c8ZPch2f22faSGVz6iv8FGnsyo9tqmaE82nomMSaiu3HIGtJpvkB+sla3ZaX
	1O7uMCEni3DyOvc4pa5iC76Vsjx6Xo11pz35f/KV50omWaTDqlsAHyGye+rA2MBV5mZebe7ZCiJ
	cmdOqij7XIhEHs/9Vge7Ako1NADKcfZlsGOtC0eePYlgVw4zz9pEmN5gaZN9j+1G+mIpkaTQxLf
	rSshiQn02/pDTX6i8nGveJ0XOeEuNdlXY6pDKfcVlrpIx6K9LlCz3HPZtDB5UsTpa6IRNplFFrC
	R30GE9PGok28KOp+Pg4Nj/1lcWQQkczInIqjL/kRMDF0jyZ7DoEpwsDe3z+3LVgBy2iefB5sszV
	76deups/Cp4axMzUq2tzyZZG27LyKbXfMXfc7S1D4Y/Vkjz6WFeYSPI2SLbKWssHV7BqqFKbmlF
	yyekqedaZUKoQTXHUnxxRpQmvlgHWcBOFOWwTi6Df3YvDZlhyy1YZPI50scm/oeWP6G/q7DOvUo
	n+9kbrcwkWPQC3y25yELZJUCWXNy3QS/fFiLYpG4ZE1c767QVAn9SrTkAonl9/CTu2ofhgfuuhF
	F4HbgBXmhCIsMAjAuMNJWGUp4cYKixw+gIMKYx9sxsMjB5uUqhMRGA7OvRfUqxs4PetFsu3Cy+g
	2Tp4RxdnLStZ973o=
X-Received: by 2002:a05:701b:2806:b0:196:bf5f:8bb with SMTP id a92af1059eb24-1ac5d69f9ccmr16064865c88.45.1793672450640;
        Mon, 02 Nov 2026 18:20:50 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac0e738445sm38657160c88.0.2026.11.02.18.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:20:50 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject:
 [PATCH v2 1/3] usb: core: Fix use-after-free in anchor wakeup protocol
Date: Tue, 03 Nov 2026 10:20:47 +0800
Message-ID: <179367244750.76534.11457287416453879089@kylinos.cn>
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

usb_wait_anchor_empty_timeout() and the anchor cleanup helpers
promise that once they return successfully (non-zero, for
usb_wait_anchor_empty_timeout()), no URB giveback is in flight for
the anchor any more, so the driver may free the memory holding it
(xpad, for example, embeds irq_out_anchor in its private structure
and kfrees it in xpad_disconnect()).

Two windows break this promise: the waiter can observe "anchor
list empty and suspend_wakeups =3D=3D 0" while a giveback is still
about to access anchor->wait.

 1. usb_anchor_resume_wakeups() decrements suspend_wakeups -- which
    makes the wait condition true -- and only then calls
    wake_up(&anchor->wait), with nothing in between serializing the
    two.  A waiter returns, the driver frees the anchor, and the
    late wake_up() touches the freed wait queue head.

 2. __usb_unanchor_urb() wakes waiters while holding anchor->lock,
    but usb_wait_anchor_empty_timeout() evaluated the same condition
    without the lock, so it could observe the emptied urb_list in
    the middle of that critical section and return before the
    wake_up() and the spin_unlock() had run.  Reading the two
    condition fields locklessly could likewise observe a stale
    suspend_wakeups value after the giveback's unanchor on weakly
    ordered systems.

Complete the locking protocol that commit fbc299437c06 ("usb:
core: Solve race condition in anchor cleanup functions")
established for the kill/poison/scuttle helpers:
usb_wait_anchor_empty_timeout() now evaluates the condition under
anchor->lock (a self-locking wrapper around the lockless check),
and usb_anchor_resume_wakeups() performs the suspend_wakeups
decrement, the wakeup check and the wake_up() within a single
anchor->lock critical section.

With the decrement and the wake_up() atomic with respect to the
locked condition check, a waiter can only observe the condition
true after every giveback that has incremented suspend_wakeups has
stopped accessing the anchor: the guarantee that the wakeup is
delayed until the completion handler has run now extends to the
anchor memory itself.

syzbot has reported this race repeatedly since 2019, most
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

Both reports lack a reproducer; the analysis was verified
by walking the two stacks against the code, not at runtime.  All
in-tree callers of usb_wait_anchor_empty_timeout() (and every
driver which frees an anchor after the anchor cleanup helpers) are
equally affected; xpad is merely the one syzbot found.

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

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
--=20
2.32.0


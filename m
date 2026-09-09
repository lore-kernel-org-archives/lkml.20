Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2113DD849
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948557; cv=none; b=ovxsYq40E9xEkFNq6bBPAM311IW/seJyGYYbnv6TYRam7bc1c/+dOvQ5Bctno2jq0Xfd18WRShh5ouF7F3Z5sieLPog7KZCTtTkq2NG+E3KJ4A3A7Aut6d4e8555lNEHj0Dk39nz6f5pwICiJAmUGOnDm5vQ/x9G266oryR8e00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948557; c=relaxed/simple;
	bh=8/mKf6x7KmcMLXrLJEDS7IWRLh8LBqqyLdPF4SNbwHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuj6QuXT5Kl6AZtZ6NHDm19almpVRMA5bt+QQjrer8npW4cYT7riO2XWXhlamT+M2IZ2vx4H1BYDdgjwxp5lBmvcf2uelDtDNeqQ4jVKQoedTBdP5vj5+ssskmm7ugqaSDC6UYvnGjJiM8mtTZ/JaJqkqkMqk3fftP4knm5hBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZUN5jsQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZUN5jsQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so4653344a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788948555; x=1789553355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSh2qh7O7/XqmG4RzqGUpCwn4f3wZ7KxhLp/LdsSZ8M=;
        b=qZUN5jsQGJT6zC2UHL6CMcqf6S/If6wjj2UQzTdHULiU7LSv1I+BT0KTknnLvisUHD
         laJUsDvojJ/3nPML4pEQGBadzn0oasn46/oK4Odlzcb0A3DqqMYT6dJxoaMrNFhef1kq
         YauvMmlmLjFLiKg4BED4/Ziw8IocOUZsL1fAZuIix+JauCTyvxsV31YTc6AWW4C0ndg6
         j73aaYuNufl5O6Nrfe7+ld4+7/hMJFsYsOCwVl+okoAa162vh8i7EXb/EcCJlQuNoV1n
         zVPISZmsOhtFQajboM2wWV7HSXUQkna1OhpRULTKlsf1loNo8twmSzCAmtGYrLJ/AK7L
         M3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948555; x=1789553355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSh2qh7O7/XqmG4RzqGUpCwn4f3wZ7KxhLp/LdsSZ8M=;
        b=K5xk4itFVDcDU4kiAwLxpxGSF1XkSl3G64CxzuM5QL0/eztDh2H8dR7GjqJ+uLhaMx
         LoPe+qCer475NYmDJM9zap2McU/6180aHHaywg6u/dPQNwZURTHCTQejC2CIxp4EaiS3
         TnOYzWTx6lF+qBm+qNu7tbHYu5iZeGYFqQuC2gnrlf0L7E5/cr/cBHLYRs2Llseh99ha
         GyOGS+9VIwSD0rUjlk7W0cuG3q/uZ3sDa9qOgRdsUIwc3Qb71dZ6JdwuQ/WDwjRyHzdb
         ebbx50/Egziuh941L5gyU4/3Aee4Zcb92Km0kj6TvZUs4yP3XaeZOFQAfxEfBAh3/Spx
         psPg==
X-Forwarded-Encrypted: i=1; AKwUvBxO/KpozllkjkWjHAINAhp8WyqvMQlzW6unuqycB0vVtGYupT/xWwj95+H3WVaVCyskgd0/VcM2R8zBBKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lmXeZE/qFAC/D1nx0nDT5c+iMlpJ70VC9eDTU9gUFReFQs6BPh
	n7lzUGNDCO6tsh+iKxeJ9A0vLN4xa7xHT28gM0gwSzMXnGtBtuPpk1Lg
X-Gm-Gg: AYBFou2nkt/juc5SMNQaLK8XOCLq5J5xc6qvULwJnIUej0PWDzvFxsQfSa7AN0w2LvS
	D62sa8b28N4TMIM+EuO6STaDHo148WTAxspThI/fQ5ZhZz5Fco7GqksEBLTVLxAxTVf3P+t9Svm
	QRl64axVKAvu211JTX9kSmsNXegXLDkreNtmb22sMyVGne/1TGlh/PvTYgZ9FypOQsfjgIuGOuQ
	Nbrf5TFyVS7fps6XrIYQ4IxpkS7BKpCw2pHCzHECUim6/JnInRvTH50an5ZwGu4rFvf5AF9c7yG
	G3nJU7kRs/bCnIGo0kdAjnij8zvi+QGTKHsKiaIIJe5R/COL1OHwu76Uws96KkL8F0dMMSVo1EX
	HqFc5rZy3vCVzzSu8QKXulmEiNKiAA+v209JZt6YOIx3T7OfgH1Viq8RYB+OGQR0hdaKlthGJgQ
	muqQwKyhJ7W+ipFfX1AOudiwv3zjdpplE1TnU1oGDKXlsCKFNrMSb5b1UjDGrwUjOtbtAoT5CaP
	L6duzweHbyVX9L5RBeza0JT
X-Received: by 2002:a05:6a20:7284:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3da39ec3ef2mr48782980637.10.1788948555086;
        Wed, 09 Sep 2026 03:09:15 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4aa39f605sm31348a12.21.2026.09.09.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:09:14 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Yogesh Gaur <yogeshgaur.83@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com,
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
Subject: [PATCH v2] mmc: vub300: never tear the host down from the inactivity timer
Date: Wed,  9 Sep 2026 15:39:02 +0530
Message-ID: <20260909100902.1387-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <aqECZPhDe_elcG5P@hovoldconsulting.com>
References: <aqECZPhDe_elcG5P@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vub300_probe() takes a second kref reference on behalf of the inactivity
timer and arms it:

	kref_init(&vub300->kref);
	...
	kref_get(&vub300->kref);
	timer_setup(&vub300->inactivity_timer,
		    vub300_inactivity_timer_expired, 0);
	vub300->inactivity_timer.expires = jiffies + HZ;
	add_timer(&vub300->inactivity_timer);

and expects the timer to release that reference from its own expiry
function, once it observes that vub300->interface has been cleared:

	if (!vub300->interface) {
		kref_put(&vub300->kref, vub300_delete);
	} else if (vub300->cmd) {

That is wrong in both directions, because the expiry function runs in
softirq context.

If the timer happens to hold the last reference, the kref_put() runs
vub300_delete() -> mmc_free_host() -> cancel_delayed_work_sync(), which
sleeps. The ->probe() error path arranges exactly that: it clears
->interface and drops only its own reference, leaving the timer armed
and owning the last one.

	BUG: sleeping function called from invalid context at kernel/workqueue.c:4487
	in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 191, name: kworker/0:2
	Call Trace:
	 <IRQ>
	 __might_resched.cold+0x1ec/0x232 kernel/sched/core.c:9197
	 __cancel_work_sync kernel/workqueue.c:4487 [inline]
	 cancel_delayed_work_sync+0xb8/0xf0 kernel/workqueue.c:4568
	 mmc_free_host+0x19/0x30 drivers/mmc/core/host.c:700
	 vub300_delete drivers/mmc/host/vub300.c:379 [inline]
	 kref_put include/linux/kref.h:65 [inline]
	 vub300_inactivity_timer_expired drivers/mmc/host/vub300.c:747
	 call_timer_fn+0x11f/0x610 kernel/time/timer.c:1745
	 </IRQ>

If instead the timer drops its reference and stops rearming, one of the
mod_timer() calls in the command and dead work threads can arm it again
-- those do not take a reference of their own. The kref_put() in
vub300_disconnect() then drops what is now the last reference and
vub300_delete() frees the host together with the still armed timer
embedded in it.

	ODEBUG: free active (active state 0) object: ffff88803cd81420 object type: timer_list hint: vub300_inactivity_timer_expired+0x0/0x3f0
	WARNING: lib/debugobjects.c:632 at debug_print_object+0xec/0x230 lib/debugobjects.c:629
	Call Trace:
	 <TASK>
	 debug_check_no_obj_freed+0x2e3/0x450 lib/debugobjects.c:1201
	 kfree+0x13e/0x6d0 mm/slub.c:6792
	 kobject_put+0x222/0x550 lib/kobject.c:737
	 vub300_delete drivers/mmc/host/vub300.c:379 [inline]
	 vub300_disconnect+0x280/0x2f0 drivers/mmc/host/vub300.c:2388
	 usb_unbind_interface+0x295/0x9f0 drivers/usb/core/driver.c:458
	 usb_disconnect+0x32d/0x990 drivers/usb/core/hub.c:2345
	 hub_event+0x1bb7/0x4cf0 drivers/usb/core/hub.c:5961
	 </TASK>

Take the timer out of the reference counting altogether. The expiry
function no longer inspects ->interface and no longer drops a reference;
it just queues the dead work and rearms as before. Both teardown paths
now call the new vub300_stop_inactivity_timer(), which runs
timer_shutdown_sync() from process context and then drops the reference
that ->probe() took for the timer. timer_shutdown_sync() additionally
turns any later mod_timer() into a no-op, so the work threads can no
longer resurrect the timer, and vub300_delete() only ever runs somewhere
it is allowed to sleep.

vub300_deadwork_thread() has the same "->interface is NULL, so put the
reference" shape, but it runs in process context and releases the
reference that vub300_queue_dead_work() took for it, so it is left as
is.

An earlier RFC proposed deferring the body of vub300_delete() to the
dead work queue instead [1]. That does stop the sleeping, but it leaves
the timer inside the reference counting and does not close the ODEBUG
report: nothing in it prevents the mod_timer() calls in the command and
dead work threads from rearming the timer, so the host is still freed
with the timer armed and the warning merely moves to the work queue.
Shutting the timer down closes both reports, and it removes the need to
defer anything.

The two reports have different origins, hence the two Fixes tags below.
The ODEBUG one goes back to the original driver, while the sleeping one
only became reachable once mmc_free_host() started to sleep.

Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
Fixes: 1036f69e2513 ("mmc: core: Cancel delayed work before releasing host")
Link: https://lore.kernel.org/all/49982079-95f4-4e8c-bbbc-bcb127e2f378@mail.kernel.org/ [1]
Reported-by: syzbot+f4a0159ce6802a0a4774@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f4a0159ce6802a0a4774
Reported-by: syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1ee4f3b9228e35f14677
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
v2:
 - add the Assisted-by tag that v1 was missing
 - reference the earlier RFC [1] and explain why this takes a different
   approach; v1 did not mention it at all

v1: https://lore.kernel.org/all/20260908165050.1930-1-yogeshgaur.83@gmail.com/

 drivers/mmc/host/vub300.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index 2dae474dcd06..b8e72a054439 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -743,14 +743,22 @@ static void vub300_inactivity_timer_expired(struct timer_list *t)
 {				/* softirq */
 	struct vub300_mmc_host *vub300 = timer_container_of(vub300, t,
 							    inactivity_timer);
-	if (!vub300->interface) {
-		kref_put(&vub300->kref, vub300_delete);
-	} else if (vub300->cmd) {
-		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
-	} else {
+	if (!vub300->cmd)
 		vub300_queue_dead_work(vub300);
-		mod_timer(&vub300->inactivity_timer, jiffies + HZ);
-	}
+
+	mod_timer(&vub300->inactivity_timer, jiffies + HZ);
+}
+
+/*
+ * Stop the inactivity timer and drop the reference that ->probe() took on its
+ * behalf.  Must be called from process context: once timer_shutdown_sync() has
+ * returned the timer can neither run nor be rearmed by the mod_timer() calls
+ * made from the command and dead work threads.
+ */
+static void vub300_stop_inactivity_timer(struct vub300_mmc_host *vub300)
+{
+	timer_shutdown_sync(&vub300->inactivity_timer);
+	kref_put(&vub300->kref, vub300_delete);
 }
 
 static int vub300_response_error(u8 error_code)
@@ -2350,6 +2358,7 @@ static int vub300_probe(struct usb_interface *interface,
 
 err_stop_io:
 	vub300->interface = NULL;
+	vub300_stop_inactivity_timer(vub300);
 	kref_put(&vub300->kref, vub300_delete);
 
 	return retval;
@@ -2384,6 +2393,7 @@ static void vub300_disconnect(struct usb_interface *interface)
 			usb_set_intfdata(interface, NULL);
 			/* prevent more I/O from starting */
 			vub300->interface = NULL;
+			vub300_stop_inactivity_timer(vub300);
 			mmc_remove_host(mmc);
 			kref_put(&vub300->kref, vub300_delete);
 			pr_info("USB vub300 remote SDIO host controller[%d]"
-- 
2.55.0.windows.5


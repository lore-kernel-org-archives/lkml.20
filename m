Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940081;
	b=HPUsIo4Vu3LV012Y6wUsqWAaZj4N8ZBjh27R7Fra6TVp2x8JZL/IfX0C7wZ5Rjtjs+ub
	 sTzEV0g2XUCXCIL720PTXnFu2s3D3A+bxPvqODTY88JLCVBtU7tHscQ/1Wvpz1o+NAKQI
	 Unyr6YM2qSAXTY4Kpb4lE/YFQpGd5QYXSIc65RyJevsozwhGJcd+vKGn2110g89+Mtv8k
	 OmN3Nz/UuBDcxARofnDe2tAYiruBCrC4/yVhXlsr/TDAugQ0DLBPb3KQPgOUY1H214l7a
	 Bet0JXErb+sQ0YjSPLEMGAdmQKLQCKhrg5i1goQISivxyxrvNk7DcUVDOY2wcRBsMgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940081;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:To:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Anti-Virus-Server:X-Virus-Status;
	bh=6O95MIAWMa7cooCFj9EBvNlp3XfIav68J2OUpAzgwsA=;
	b=jjXK+TsG4YcUpviPKM7BtWoYvUt+wl2cUZ165V7Cgx1SdDsD3ItlC8ItJ3vnCDUHXtyu
	 mNaicQPthEN1EneOkX8qveiRUobYTe7mXifbas0Qxct2BN+2haNECQna4BvM9NOkmza/i
	 GYOpuoqEUyww+MZtsXe0+BGH2TphhCRQ2ntpWZBrPG3YcEbh7FZZduzfVCh7N9JDCVeFE
	 oMI6oYEAEdAsIb2+rwKU+sVVJ8M3xN0pb8cyP5BAY/VpnS4mT4kKEbLGdI5ZsyQcSr/Uh
	 9nhU1ytomHoEAw5df+rhpR8Fv8EAItpdDlFQYTfKLHeUzqHKA/aYVHSFPtBNYpfvteQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEEF606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAEEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69PEsWSI043953
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:54:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69PEsLUe043934
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:54:32 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <7df4f6c6-b53f-42d6-9725-e60b763d01f6@I-love.SAKURA.ne.jp>
Date: Sun, 25 Oct 2026 23:54:22 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH v3.1] can: j1939: fix j1939_ecu refcount leak
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav313.rs.sakura.ne.jp
X-Virus-Status: clean

syzbot is reporting "struct j1939_ecu" refcount leak, for

  j1939_ecu_get(ecu);
  priv->ents[ecu->addr] = ecu;

in j1939_ecu_map_locked() from j1939_ecu_timer_handler() can succeed
even after

  priv->ents[ecu->addr] = NULL;
  j1939_ecu_put(ecu);

in j1939_ecu_unmap_locked() from j1939_ecu_unmap_all() from
__j1939_rx_release() from j1939_netdev_stop() has completed.
Fix this race condition by canceling address claim timers from
j1939_ecu_unmap_all().

gpt-6-astra, opus-5-5, opus-5 and sashiko-gemini are reporting that
above-mentioned change cannot fully close the race condition. Fix
remaining race condition by also checking netdev state from locations
where new refcount on an ECU is taken.

gpt-6-astra, opus-5-5, opus-5 and sonnet-5 are reporting that there is
a possibility of deadlock between j1939_ecu_timer_handler() and
j1939_ecu_timer_cancel(), for the former holds priv->lock while the latter
calls hrtimer_cancel() (which synchronously waits for the former to
complete) with priv->lock already held. Fix this deadlock by using
ac_timer_cancel counter.

sashiko-gemini is reporting that there is a possibility of list corruption
in __j1939_ecu_release(), for not all callers are calling j1939_ecu_put()
with priv->lock held for write. Since we don't want to track whether the
caller of j1939_ecu_put() is holding priv->lock for write (or we can't if
somewhere is calling j1939_ecu_put() with priv->lock held for read), fix
this problem by using a dedicated spinlock for list modification and
changing to use RCU for list traversal and refcount acquiring.

Change j1939_ecu_get() to return bool, for it might be called after
__j1939_ecu_release() was called. Also, enable context analysis support
for the j1939 module, in order to be able to catch missing RCU protection
at build time.

Reported-by: syzbot+e2af46126e0644cbebdd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e2af46126e0644cbebdd
Link: https://lkml.kernel.org/r/179202402875.794844.18141702206663586949.b4-review@b4
Fixes: 9d71dd0c7009 ("can: add support of SAE J1939 protocol")
Assisted-by: Gemini-Pro
Assisted-by: gpt-6-astra
Assisted-by: opus-5-5
Assisted-by: opus-5
Assisted-by: sashiko-gemini
Assisted-by: sonnet-5
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
There might be locations where we can replace priv->lock with RCU, but
this patch simply holds both locks and releases both locks. Analysis of
redundant priv->lock is welcomed.

Changes in v3.1:
  - Address findings from the review bot.

 net/can/j1939/Makefile        |   1 +
 net/can/j1939/address-claim.c |   6 ++
 net/can/j1939/bus.c           | 134 ++++++++++++++++++++++++++++------
 net/can/j1939/j1939-priv.h    |  13 ++--
 net/can/j1939/main.c          |   3 +
 net/can/j1939/transport.c     |   2 +
 6 files changed, 133 insertions(+), 26 deletions(-)

diff --git a/net/can/j1939/Makefile b/net/can/j1939/Makefile
index 19181bdae173..ce6f9cc257cf 100644
--- a/net/can/j1939/Makefile
+++ b/net/can/j1939/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+CONTEXT_ANALYSIS := y
 
 obj-$(CONFIG_CAN_J1939) += can-j1939.o
 
diff --git a/net/can/j1939/address-claim.c b/net/can/j1939/address-claim.c
index ca4ad6cdd5cb..6d2f3b1c2d24 100644
--- a/net/can/j1939/address-claim.c
+++ b/net/can/j1939/address-claim.c
@@ -148,6 +148,11 @@ static void j1939_ac_process(struct j1939_priv *priv, struct sk_buff *skb)
 	}
 
 	write_lock_bh(&priv->lock);
+	rcu_read_lock();
+
+	/* Don't get ECU ref if teardown is in progress. */
+	if (priv->ndev->reg_state != NETREG_REGISTERED)
+		goto out_unlock_bh;
 
 	/* Few words on the ECU ref counting:
 	 *
@@ -241,6 +246,7 @@ static void j1939_ac_process(struct j1939_priv *priv, struct sk_buff *skb)
  out_ecu_put:
 	j1939_ecu_put(ecu);
  out_unlock_bh:
+	rcu_read_unlock();
 	write_unlock_bh(&priv->lock);
 }
 
diff --git a/net/can/j1939/bus.c b/net/can/j1939/bus.c
index cdc3c0a71937..d55a95ceaff8 100644
--- a/net/can/j1939/bus.c
+++ b/net/can/j1939/bus.c
@@ -14,15 +14,32 @@
 
 #include "j1939-priv.h"
 
-static void __j1939_ecu_release(struct kref *kref)
+/* The spinlock dedicated for adding/deleting an ECU to/from ECU list.
+ * Reading ECU list is protected by RCU read lock section.
+ */
+static DEFINE_SPINLOCK(j1939_ecu_add_del_lock);
+
+static void __j1939_ecu_release_rcu(struct rcu_head *rcu)
 {
-	struct j1939_ecu *ecu = container_of(kref, struct j1939_ecu, kref);
+	struct j1939_ecu *ecu = container_of(rcu, struct j1939_ecu, rcu);
 	struct j1939_priv *priv = ecu->priv;
 
-	list_del(&ecu->list);
 	netdev_put(priv->ndev, &ecu->priv_dev_tracker);
-	kfree(ecu);
 	j1939_priv_put(priv);
+	kfree(ecu);
+}
+
+static void __j1939_ecu_release(struct kref *kref)
+{
+	struct j1939_ecu *ecu = container_of(kref, struct j1939_ecu, kref);
+
+	/* Immediately remove this ECU from list but wait for RCU grace period,
+	 * for j1939_ecu_get() might be called on this ECU under RCU read lock.
+	 */
+	spin_lock_bh(&j1939_ecu_add_del_lock);
+	list_del_rcu(&ecu->list);
+	spin_unlock_bh(&j1939_ecu_add_del_lock);
+	call_rcu(&ecu->rcu, __j1939_ecu_release_rcu);
 }
 
 void j1939_ecu_put(struct j1939_ecu *ecu)
@@ -30,12 +47,14 @@ void j1939_ecu_put(struct j1939_ecu *ecu)
 	kref_put(&ecu->kref, __j1939_ecu_release);
 }
 
-static void j1939_ecu_get(struct j1939_ecu *ecu)
+static __must_check bool j1939_ecu_get(struct j1939_ecu *ecu)
+	__must_hold_shared(RCU)
 {
-	kref_get(&ecu->kref);
+	return kref_get_unless_zero(&ecu->kref);
 }
 
 static bool j1939_ecu_is_mapped_locked(struct j1939_ecu *ecu)
+	__must_hold_shared(RCU)
 {
 	struct j1939_priv *priv = ecu->priv;
 
@@ -47,6 +66,7 @@ static bool j1939_ecu_is_mapped_locked(struct j1939_ecu *ecu)
 /* ECU device interface */
 /* map ECU to a bus address space */
 static void j1939_ecu_map_locked(struct j1939_ecu *ecu)
+	__must_hold_shared(RCU)
 {
 	struct j1939_priv *priv = ecu->priv;
 	struct j1939_addr_ent *ent;
@@ -56,15 +76,21 @@ static void j1939_ecu_map_locked(struct j1939_ecu *ecu)
 	if (!j1939_address_is_unicast(ecu->addr))
 		return;
 
+	/* Don't get an ECU ref if teardown is in progress. */
+	if (priv->ndev->reg_state != NETREG_REGISTERED)
+		return;
+
+	if (!j1939_ecu_get(ecu))
+		return;
+
 	ent = &priv->ents[ecu->addr];
 
 	if (ent->ecu) {
 		netdev_warn(priv->ndev, "Trying to map already mapped ECU, addr: 0x%02x, name: 0x%016llx. Skip it.\n",
 			    ecu->addr, ecu->name);
+		j1939_ecu_put(ecu);
 		return;
 	}
-
-	j1939_ecu_get(ecu);
 	ent->ecu = ecu;
 	ent->nusers += ecu->nusers;
 }
@@ -92,27 +118,47 @@ void j1939_ecu_unmap_locked(struct j1939_ecu *ecu)
 void j1939_ecu_unmap(struct j1939_ecu *ecu)
 {
 	write_lock_bh(&ecu->priv->lock);
+	rcu_read_lock();
 	j1939_ecu_unmap_locked(ecu);
+	rcu_read_unlock();
 	write_unlock_bh(&ecu->priv->lock);
 }
 
 void j1939_ecu_unmap_all(struct j1939_priv *priv)
 {
 	int i;
+	struct j1939_ecu *ecu;
 
 	write_lock_bh(&priv->lock);
+	rcu_read_lock();
+	/* Cancel all pending address claim timers before unmapping.
+	 * This prevents an orphaned late-firing timer from re-mapping
+	 * an ECU after the spaces are cleared.
+	 */
+	list_for_each_entry_rcu(ecu, &priv->ecus, list)
+		j1939_ecu_timer_cancel(ecu);
+	/* Unmap any remaining mapped ECUs */
 	for (i = 0; i < ARRAY_SIZE(priv->ents); i++)
 		if (priv->ents[i].ecu)
 			j1939_ecu_unmap_locked(priv->ents[i].ecu);
+	rcu_read_unlock();
 	write_unlock_bh(&priv->lock);
 }
 
 void j1939_ecu_timer_start(struct j1939_ecu *ecu)
 {
+	lockdep_assert_held(&ecu->priv->lock);
+
+	/* Don't get an ECU ref if teardown is in progress. */
+	if (ecu->priv->ndev->reg_state != NETREG_REGISTERED)
+		return;
+
 	/* The ECU is held here and released in the
-	 * j1939_ecu_timer_handler() or j1939_ecu_timer_cancel().
+	 * j1939_ecu_timer_handler() or j1939_ecu_timer_cancel()
+	 * or j1939_ecu_unmap_all().
 	 */
-	j1939_ecu_get(ecu);
+	if (!j1939_ecu_get(ecu))
+		return;
 
 	/* Schedule timer in 250 msec to commit address change. */
 	hrtimer_start(&ecu->ac_timer, ms_to_ktime(250),
@@ -121,7 +167,12 @@ void j1939_ecu_timer_start(struct j1939_ecu *ecu)
 
 void j1939_ecu_timer_cancel(struct j1939_ecu *ecu)
 {
-	if (hrtimer_cancel(&ecu->ac_timer))
+	int ret;
+
+	atomic_inc(&ecu->ac_timer_cancel);
+	ret = hrtimer_cancel(&ecu->ac_timer);
+	atomic_dec(&ecu->ac_timer_cancel);
+	if (ret)
 		j1939_ecu_put(ecu);
 }
 
@@ -131,7 +182,30 @@ static enum hrtimer_restart j1939_ecu_timer_handler(struct hrtimer *hrtimer)
 		container_of(hrtimer, struct j1939_ecu, ac_timer);
 	struct j1939_priv *priv = ecu->priv;
 
-	write_lock_bh(&priv->lock);
+	local_bh_disable();
+	if (!write_trylock(&priv->lock)) {
+		local_bh_enable();
+		/* Since j1939_ecu_timer_cancel() is called under priv->lock
+		 * held for write, calling hrtimer_cancel() when the timer was
+		 * between "ready to call j1939_ecu_timer_handler()" and "about
+		 * to hold priv->lock for write" can cause deadlock. Therefore,
+		 * check whether j1939_ecu_timer_handler() should be aborted,
+		 * by checking ac_timer_cancel value when "failed to hold
+		 * priv->lock for write".
+		 *
+		 * Drop ref from j1939_ecu_timer_start() and return if someone
+		 * is calling j1939_ecu_timer_cancel(). Reschedule this timer
+		 * to be fired again after a short delay otherwise.
+		 */
+		if (atomic_read(&ecu->ac_timer_cancel)) {
+			j1939_ecu_put(ecu);
+			return HRTIMER_NORESTART;
+		} else {
+			hrtimer_forward_now(hrtimer, ms_to_ktime(1));
+			return HRTIMER_RESTART;
+		}
+	}
+	rcu_read_lock();
 	/* TODO: can we test if ecu->addr is unicast before starting
 	 * the timer?
 	 */
@@ -141,7 +215,9 @@ static enum hrtimer_restart j1939_ecu_timer_handler(struct hrtimer *hrtimer)
 	 * j1939_ecu_timer_start().
 	 */
 	j1939_ecu_put(ecu);
-	write_unlock_bh(&priv->lock);
+	rcu_read_unlock();
+	write_unlock(&priv->lock);
+	local_bh_enable();
 
 	return HRTIMER_NORESTART;
 }
@@ -152,6 +228,10 @@ struct j1939_ecu *j1939_ecu_create_locked(struct j1939_priv *priv, name_t name)
 
 	lockdep_assert_held(&priv->lock);
 
+	/* Don't get an ECU ref if teardown is in progress. */
+	if (priv->ndev->reg_state != NETREG_REGISTERED)
+		return ERR_PTR(-ENOMEM);
+
 	ecu = kzalloc_obj(*ecu, gfp_any());
 	if (!ecu)
 		return ERR_PTR(-ENOMEM);
@@ -166,7 +246,9 @@ struct j1939_ecu *j1939_ecu_create_locked(struct j1939_priv *priv, name_t name)
 
 	j1939_priv_get(priv);
 	ecu->priv = priv;
-	list_add_tail(&ecu->list, &priv->ecus);
+	spin_lock_bh(&j1939_ecu_add_del_lock);
+	list_add_tail_rcu(&ecu->list, &priv->ecus);
+	spin_unlock_bh(&j1939_ecu_add_del_lock);
 
 	return ecu;
 }
@@ -189,8 +271,8 @@ struct j1939_ecu *j1939_ecu_get_by_addr_locked(struct j1939_priv *priv, u8 addr)
 		return NULL;
 
 	ecu = j1939_ecu_find_by_addr_locked(priv, addr);
-	if (ecu)
-		j1939_ecu_get(ecu);
+	if (ecu && !j1939_ecu_get(ecu))
+		ecu = NULL;
 
 	return ecu;
 }
@@ -200,7 +282,9 @@ struct j1939_ecu *j1939_ecu_get_by_addr(struct j1939_priv *priv, u8 addr)
 	struct j1939_ecu *ecu;
 
 	read_lock_bh(&priv->lock);
+	rcu_read_lock();
 	ecu = j1939_ecu_get_by_addr_locked(priv, addr);
+	rcu_read_unlock();
 	read_unlock_bh(&priv->lock);
 
 	return ecu;
@@ -209,12 +293,13 @@ struct j1939_ecu *j1939_ecu_get_by_addr(struct j1939_priv *priv, u8 addr)
 /* get pointer to ecu without increasing ref counter */
 static struct j1939_ecu *j1939_ecu_find_by_name_locked(struct j1939_priv *priv,
 						       name_t name)
+	__must_hold_shared(RCU)
 {
 	struct j1939_ecu *ecu;
 
 	lockdep_assert_held(&priv->lock);
 
-	list_for_each_entry(ecu, &priv->ecus, list) {
+	list_for_each_entry_rcu(ecu, &priv->ecus, list) {
 		if (ecu->name == name)
 			return ecu;
 	}
@@ -227,14 +312,12 @@ struct j1939_ecu *j1939_ecu_get_by_name_locked(struct j1939_priv *priv,
 {
 	struct j1939_ecu *ecu;
 
-	lockdep_assert_held(&priv->lock);
-
 	if (!name)
 		return NULL;
 
 	ecu = j1939_ecu_find_by_name_locked(priv, name);
-	if (ecu)
-		j1939_ecu_get(ecu);
+	if (ecu && !j1939_ecu_get(ecu))
+		ecu = NULL;
 
 	return ecu;
 }
@@ -244,7 +327,9 @@ struct j1939_ecu *j1939_ecu_get_by_name(struct j1939_priv *priv, name_t name)
 	struct j1939_ecu *ecu;
 
 	read_lock_bh(&priv->lock);
+	rcu_read_lock();
 	ecu = j1939_ecu_get_by_name_locked(priv, name);
+	rcu_read_unlock();
 	read_unlock_bh(&priv->lock);
 
 	return ecu;
@@ -259,11 +344,14 @@ u8 j1939_name_to_addr(struct j1939_priv *priv, name_t name)
 		return J1939_NO_ADDR;
 
 	read_lock_bh(&priv->lock);
+	rcu_read_lock();
+
 	ecu = j1939_ecu_find_by_name_locked(priv, name);
 	if (ecu && j1939_ecu_is_mapped_locked(ecu))
 		/* ecu's SA is registered */
 		addr = ecu->addr;
 
+	rcu_read_unlock();
 	read_unlock_bh(&priv->lock);
 
 	return addr;
@@ -281,6 +369,7 @@ int j1939_local_ecu_get(struct j1939_priv *priv, name_t name, u8 sa)
 	int err = 0;
 
 	write_lock_bh(&priv->lock);
+	rcu_read_lock();
 
 	if (j1939_address_is_unicast(sa))
 		priv->ents[sa].nusers++;
@@ -305,6 +394,7 @@ int j1939_local_ecu_get(struct j1939_priv *priv, name_t name, u8 sa)
 		priv->ents[ecu->addr].nusers++;
 
  done:
+	rcu_read_unlock();
 	write_unlock_bh(&priv->lock);
 
 	return err;
@@ -315,6 +405,7 @@ void j1939_local_ecu_put(struct j1939_priv *priv, name_t name, u8 sa)
 	struct j1939_ecu *ecu;
 
 	write_lock_bh(&priv->lock);
+	rcu_read_lock();
 
 	if (j1939_address_is_unicast(sa))
 		priv->ents[sa].nusers--;
@@ -334,5 +425,6 @@ void j1939_local_ecu_put(struct j1939_priv *priv, name_t name, u8 sa)
 	j1939_ecu_put(ecu);
 
  done:
+	rcu_read_unlock();
 	write_unlock_bh(&priv->lock);
 }
diff --git a/net/can/j1939/j1939-priv.h b/net/can/j1939/j1939-priv.h
index cf26352d1d8c..b0092b06c5cc 100644
--- a/net/can/j1939/j1939-priv.h
+++ b/net/can/j1939/j1939-priv.h
@@ -42,6 +42,9 @@ struct j1939_ecu {
 
 	/* count users, to help transport protocol decide for interaction */
 	int nusers;
+
+	atomic_t ac_timer_cancel;
+	struct rcu_head rcu;
 };
 
 struct j1939_priv {
@@ -123,18 +126,18 @@ static inline bool j1939_pgn_is_pdu1(pgn_t pgn)
 }
 
 /* utility to correctly unmap an ECU */
-void j1939_ecu_unmap_locked(struct j1939_ecu *ecu);
+void j1939_ecu_unmap_locked(struct j1939_ecu *ecu) __must_hold_shared(RCU);
 void j1939_ecu_unmap(struct j1939_ecu *ecu);
 
 u8 j1939_name_to_addr(struct j1939_priv *priv, name_t name);
 struct j1939_ecu *j1939_ecu_find_by_addr_locked(struct j1939_priv *priv,
-						u8 addr);
+						u8 addr) __must_hold_shared(RCU);
 struct j1939_ecu *j1939_ecu_get_by_addr(struct j1939_priv *priv, u8 addr);
 struct j1939_ecu *j1939_ecu_get_by_addr_locked(struct j1939_priv *priv,
-					       u8 addr);
+					       u8 addr) __must_hold_shared(RCU);
 struct j1939_ecu *j1939_ecu_get_by_name(struct j1939_priv *priv, name_t name);
 struct j1939_ecu *j1939_ecu_get_by_name_locked(struct j1939_priv *priv,
-					       name_t name);
+					       name_t name) __must_hold_shared(RCU);
 
 enum j1939_transfer_type {
 	J1939_TP,
@@ -202,7 +205,7 @@ void j1939_simple_recv(struct j1939_priv *priv, struct sk_buff *skb);
 /* network management */
 struct j1939_ecu *j1939_ecu_create_locked(struct j1939_priv *priv, name_t name);
 
-void j1939_ecu_timer_start(struct j1939_ecu *ecu);
+void j1939_ecu_timer_start(struct j1939_ecu *ecu) __must_hold_shared(RCU);
 void j1939_ecu_timer_cancel(struct j1939_ecu *ecu);
 void j1939_ecu_unmap_all(struct j1939_priv *priv);
 
diff --git a/net/can/j1939/main.c b/net/can/j1939/main.c
index 5e5e6c228f22..3a7b544c87b8 100644
--- a/net/can/j1939/main.c
+++ b/net/can/j1939/main.c
@@ -421,6 +421,9 @@ static __init int j1939_module_init(void)
 
 static __exit void j1939_module_exit(void)
 {
+	/* Wait for __j1939_ecu_release_rcu() to complete. */
+	rcu_barrier();
+
 	can_proto_unregister(&j1939_can_proto);
 
 	unregister_netdevice_notifier(&j1939_netdev_notifier);
diff --git a/net/can/j1939/transport.c b/net/can/j1939/transport.c
index 8fcfd13e5e6f..1f27f9a700a4 100644
--- a/net/can/j1939/transport.c
+++ b/net/can/j1939/transport.c
@@ -235,11 +235,13 @@ static int j1939_xtp_abort_to_errno(struct j1939_priv *priv,
 }
 
 static inline void j1939_session_list_lock(struct j1939_priv *priv)
+	__acquires(&priv->active_session_list_lock)
 {
 	spin_lock_bh(&priv->active_session_list_lock);
 }
 
 static inline void j1939_session_list_unlock(struct j1939_priv *priv)
+	__releases(&priv->active_session_list_lock)
 {
 	spin_unlock_bh(&priv->active_session_list_lock);
 }
-- 
2.55.0


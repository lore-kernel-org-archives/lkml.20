Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060579;
	b=zmaweIZ7Pj6rnf7T7TGdYW0cx7G9YjGsCp+lNbCWNOy4/NdOzy95dUGrGy0YxBPl1tGz
	 o/ndls5JfiLqQX+g+i18IL79Y2QPaAuoYW+ydlDrvxgEDeQTZi2XNM45ZPLUJJwI8HEBV
	 UmACG0Rt+2KToXxL79eqaMgLBFjvmLChtr96nnxoMWyQfi+tSDW+ISZwghkq4O5hZXGm9
	 CziUhh1At+xbJkJgTm0OyseWcQtgT67uqkbhg05R/+MPuLcV49uEppiKYooJjgjVAWhck
	 x2SdcR7FuPt8376bXecGnARw/HateGxLpYGnxIhuF7Q3PJY52gmaI9hgQOBodd605eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060579;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Virus-Status:
	 X-Anti-Virus-Server;
	bh=y8F2D0gSjRyMj//uLCet/43tNuapCVGidTyTNVTa7Ic=;
	b=d5s2rAv0c32e5DbXhyRPU3X9fPENbkXhrWy1hCkniIj1pqip5dROVzy7wxLsi77G1vCB
	 vQ3nvlTkADsUWw7qOOT2x8T/VPpRY5lLc8zHS3lJCMIoMLfMtUkrh9ja/8MYs1QqmrmlY
	 2pKZE+ENy1vUgKIgHewXBWnfyTPKgE5lFKb8yNKxwF1y7jlABLQECROVPV5g9o5l+SV1M
	 e+7Q+L0M4jkMbgTLXiATyXzbq+sX4MLC1lUuggiYdvd/kgLt+g3AwAOnwAprNcEJMq3Tf
	 99trzlsMaKNZqyXX67xjO9bsnCzMMWEGB+vGl8TDbAR4k2/SfHezLNqjuBRcXLfFbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9434606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9434606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69R0MnxQ013040
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69R0MnP9013037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3958917c-1484-41e8-8d62-99575edbf980@I-love.SAKURA.ne.jp>
Date: Tue, 27 Oct 2026 09:22:49 +0900
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
Subject: [PATCH v3.2] can: j1939: fix j1939_ecu refcount leak
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <7df4f6c6-b53f-42d6-9725-e60b763d01f6@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <7df4f6c6-b53f-42d6-9725-e60b763d01f6@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav211.rs.sakura.ne.jp

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
above-mentioned change alone cannot fully close the race condition.
Fix remaining race condition by allow getting a ref on an ECU only when
three conditions (a netdev which is associated with j1939_priv is still
registered, rx_kref which is associated with j1939_priv is still alive,
kref which is associated with j1939_ecu is still alive) are met.

sashiko-gemini is reporting that there is a possibility of list corruption
in __j1939_ecu_release(), for not all callers are calling j1939_ecu_put()
with priv->lock held for write. Fix this problem by deferring release steps
to RCU context where we can unconditionally hold priv->lock for write.
By deferring to RCU context, readers might find ECUs which have already
reached __j1939_ecu_release(). Therefore, allow getting a ref on an ECU
only when above-mentioned three conditions are met.

gpt-6-astra, opus-5-5, opus-5 and sonnet-5 are reporting that there is
a possibility of deadlock between j1939_ecu_timer_handler() and
j1939_ecu_timer_cancel(), for the former holds priv->lock while the latter
calls hrtimer_cancel() (which synchronously waits for the former to
complete) with priv->lock already held. Fix this problem by using
hrtimer_try_to_cancel() with "release priv->lock, call hrtimer_cancel(),
hold priv->lock again and restart from the beginning" fallback.

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
Changes in v3.2:
  - Address findings from the review bot.

 net/can/j1939/address-claim.c |  10 ++-
 net/can/j1939/bus.c           | 117 +++++++++++++++++++++++++++++-----
 net/can/j1939/j1939-priv.h    |   4 +-
 net/can/j1939/main.c          |   3 +
 4 files changed, 115 insertions(+), 19 deletions(-)

diff --git a/net/can/j1939/address-claim.c b/net/can/j1939/address-claim.c
index ca4ad6cdd5cb..2f27948d6e87 100644
--- a/net/can/j1939/address-claim.c
+++ b/net/can/j1939/address-claim.c
@@ -147,6 +147,7 @@ static void j1939_ac_process(struct j1939_priv *priv, struct sk_buff *skb)
 		return;
 	}
 
+restart:
 	write_lock_bh(&priv->lock);
 
 	/* Few words on the ECU ref counting:
@@ -212,7 +213,14 @@ static void j1939_ac_process(struct j1939_priv *priv, struct sk_buff *skb)
 		goto out_unlock_bh;
 
 	/* cancel pending (previous) address claim */
-	j1939_ecu_timer_cancel(ecu);
+	if (!j1939_ecu_timer_stopped(ecu)) {
+		write_unlock_bh(&priv->lock);
+		if (hrtimer_cancel(&ecu->ac_timer))
+			j1939_ecu_put(ecu);
+		/* Drop ref from j1939_ecu_get_by_name_locked() and retry. */
+		j1939_ecu_put(ecu);
+		goto restart;
+	}
 
 	if (j1939_address_is_idle(skcb->addr.sa)) {
 		j1939_ecu_unmap_locked(ecu);
diff --git a/net/can/j1939/bus.c b/net/can/j1939/bus.c
index cdc3c0a71937..1a82a9de2119 100644
--- a/net/can/j1939/bus.c
+++ b/net/can/j1939/bus.c
@@ -14,25 +14,57 @@
 
 #include "j1939-priv.h"
 
-static void __j1939_ecu_release(struct kref *kref)
+static void __j1939_ecu_release_rcu(struct rcu_head *rcu)
 {
-	struct j1939_ecu *ecu = container_of(kref, struct j1939_ecu, kref);
+	struct j1939_ecu *ecu = container_of(rcu, struct j1939_ecu, rcu);
 	struct j1939_priv *priv = ecu->priv;
 
+	write_lock_bh(&priv->lock);
 	list_del(&ecu->list);
+	write_unlock_bh(&priv->lock);
 	netdev_put(priv->ndev, &ecu->priv_dev_tracker);
 	kfree(ecu);
 	j1939_priv_put(priv);
 }
 
+static void __j1939_ecu_release(struct kref *kref)
+{
+	struct j1939_ecu *ecu = container_of(kref, struct j1939_ecu, kref);
+
+	/* Since not all callers are calling j1939_ecu_put() with priv->lock
+	 * held for write, defer actual release to RCU context. By deferring to
+	 * RCU context, priv->ecus readers might find ECUs with ecu->kref == 0.
+	 * Therefore, priv->ecus readers must validate with j1939_ecu_valid() or
+	 * j1939_ecu_get().
+	 */
+	call_rcu(&ecu->rcu, __j1939_ecu_release_rcu);
+}
+
 void j1939_ecu_put(struct j1939_ecu *ecu)
 {
 	kref_put(&ecu->kref, __j1939_ecu_release);
 }
 
-static void j1939_ecu_get(struct j1939_ecu *ecu)
+static __must_check bool j1939_ecu_get(struct j1939_ecu *ecu)
 {
-	kref_get(&ecu->kref);
+	struct j1939_priv *priv = ecu->priv;
+
+	/* Don't get an ECU ref if netdev is no longer registered or
+	 * __j1939_rx_release() was called or __j1939_ecu_release() was called.
+	 */
+	return priv->ndev->reg_state == NETREG_REGISTERED &&
+		kref_read(&priv->rx_kref) && kref_get_unless_zero(&ecu->kref);
+}
+
+static __must_check bool j1939_ecu_valid(struct j1939_ecu *ecu)
+{
+	struct j1939_priv *priv = ecu->priv;
+
+	/* Treat an ECU as invalid if netdev is no longer registered or
+	 * __j1939_rx_release() was called or __j1939_ecu_release() was called.
+	 */
+	return priv->ndev->reg_state == NETREG_REGISTERED &&
+		kref_read(&priv->rx_kref) && kref_read(&ecu->kref);
 }
 
 static bool j1939_ecu_is_mapped_locked(struct j1939_ecu *ecu)
@@ -56,15 +88,17 @@ static void j1939_ecu_map_locked(struct j1939_ecu *ecu)
 	if (!j1939_address_is_unicast(ecu->addr))
 		return;
 
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
@@ -99,8 +133,36 @@ void j1939_ecu_unmap(struct j1939_ecu *ecu)
 void j1939_ecu_unmap_all(struct j1939_priv *priv)
 {
 	int i;
+	struct j1939_ecu *ecu;
 
+restart:
 	write_lock_bh(&priv->lock);
+	/* Cancel all pending address claim timers before unmapping.
+	 * This prevents an orphaned late-firing timer from re-mapping
+	 * an ECU after the spaces are cleared. Since j1939_ecu_put()
+	 * might make , we need to skip invalid ECUs.
+	 */
+	list_for_each_entry(ecu, &priv->ecus, list) {
+		/* It is OK to call j1939_ecu_timer_stopped() even if there is
+		 * no ref on this ECU, for __j1939_ecu_release_rcu() has not
+		 * removed this ECU from priv->ecus list due to priv->lock.
+		 */
+		if (j1939_ecu_timer_stopped(ecu))
+			continue;
+		/* Keep this ECU valid while calling hrtimer_cancel(). But
+		 * don't use j1939_ecu_get() here, for we want to wait for
+		 * completion of timer callback regardless of netdev's state.
+		 */
+		if (!kref_get_unless_zero(&ecu->kref))
+			continue;
+		write_unlock_bh(&priv->lock);
+		if (hrtimer_cancel(&ecu->ac_timer))
+			j1939_ecu_put(ecu);
+		/* OK to release this ECU. */
+		j1939_ecu_put(ecu);
+		goto restart;
+	}
+	/* Unmap any remaining mapped ECUs */
 	for (i = 0; i < ARRAY_SIZE(priv->ents); i++)
 		if (priv->ents[i].ecu)
 			j1939_ecu_unmap_locked(priv->ents[i].ecu);
@@ -109,20 +171,33 @@ void j1939_ecu_unmap_all(struct j1939_priv *priv)
 
 void j1939_ecu_timer_start(struct j1939_ecu *ecu)
 {
+	lockdep_assert_held(&ecu->priv->lock);
+
 	/* The ECU is held here and released in the
-	 * j1939_ecu_timer_handler() or j1939_ecu_timer_cancel().
+	 * j1939_ecu_timer_handler() or j1939_ecu_timer_stopped()
+	 * or j1939_ecu_unmap_all() or j1939_ac_process().
 	 */
-	j1939_ecu_get(ecu);
+	if (!j1939_ecu_get(ecu))
+		return;
 
 	/* Schedule timer in 250 msec to commit address change. */
 	hrtimer_start(&ecu->ac_timer, ms_to_ktime(250),
 		      HRTIMER_MODE_REL_SOFT);
 }
 
-void j1939_ecu_timer_cancel(struct j1939_ecu *ecu)
+bool j1939_ecu_timer_stopped(struct j1939_ecu *ecu)
 {
-	if (hrtimer_cancel(&ecu->ac_timer))
+	switch (hrtimer_try_to_cancel(&ecu->ac_timer)) {
+	case 0: /* Not active or already finished. */
+		return true;
+	case 1: /* Successfully canceled. */
+		/* Drop a ref from j1939_ecu_timer_start(). */
 		j1939_ecu_put(ecu);
+		return true;
+	default: /* Currently executing. */
+		/* Leave how to handle to the caller. */
+		return false;
+	}
 }
 
 static enum hrtimer_restart j1939_ecu_timer_handler(struct hrtimer *hrtimer)
@@ -152,6 +227,13 @@ struct j1939_ecu *j1939_ecu_create_locked(struct j1939_priv *priv, name_t name)
 
 	lockdep_assert_held(&priv->lock);
 
+	/* Don't create a new ECU if netdev is no longer registered or
+	 * __j1939_rx_release() was called.
+	 */
+	if (priv->ndev->reg_state != NETREG_REGISTERED ||
+	    !kref_read(&priv->rx_kref))
+		return ERR_PTR(-ENOMEM);
+
 	ecu = kzalloc_obj(*ecu, gfp_any());
 	if (!ecu)
 		return ERR_PTR(-ENOMEM);
@@ -189,8 +271,8 @@ struct j1939_ecu *j1939_ecu_get_by_addr_locked(struct j1939_priv *priv, u8 addr)
 		return NULL;
 
 	ecu = j1939_ecu_find_by_addr_locked(priv, addr);
-	if (ecu)
-		j1939_ecu_get(ecu);
+	if (ecu && !j1939_ecu_get(ecu))
+		ecu = NULL;
 
 	return ecu;
 }
@@ -215,7 +297,7 @@ static struct j1939_ecu *j1939_ecu_find_by_name_locked(struct j1939_priv *priv,
 	lockdep_assert_held(&priv->lock);
 
 	list_for_each_entry(ecu, &priv->ecus, list) {
-		if (ecu->name == name)
+		if (ecu->name == name && j1939_ecu_valid(ecu))
 			return ecu;
 	}
 
@@ -232,11 +314,12 @@ struct j1939_ecu *j1939_ecu_get_by_name_locked(struct j1939_priv *priv,
 	if (!name)
 		return NULL;
 
-	ecu = j1939_ecu_find_by_name_locked(priv, name);
-	if (ecu)
-		j1939_ecu_get(ecu);
+	list_for_each_entry(ecu, &priv->ecus, list) {
+		if (ecu->name == name && j1939_ecu_get(ecu))
+			return ecu;
+	}
 
-	return ecu;
+	return NULL;
 }
 
 struct j1939_ecu *j1939_ecu_get_by_name(struct j1939_priv *priv, name_t name)
diff --git a/net/can/j1939/j1939-priv.h b/net/can/j1939/j1939-priv.h
index cf26352d1d8c..0cfb48eb61fe 100644
--- a/net/can/j1939/j1939-priv.h
+++ b/net/can/j1939/j1939-priv.h
@@ -42,6 +42,8 @@ struct j1939_ecu {
 
 	/* count users, to help transport protocol decide for interaction */
 	int nusers;
+
+	struct rcu_head rcu;
 };
 
 struct j1939_priv {
@@ -203,7 +205,7 @@ void j1939_simple_recv(struct j1939_priv *priv, struct sk_buff *skb);
 struct j1939_ecu *j1939_ecu_create_locked(struct j1939_priv *priv, name_t name);
 
 void j1939_ecu_timer_start(struct j1939_ecu *ecu);
-void j1939_ecu_timer_cancel(struct j1939_ecu *ecu);
+bool __must_check j1939_ecu_timer_stopped(struct j1939_ecu *ecu);
 void j1939_ecu_unmap_all(struct j1939_priv *priv);
 
 struct j1939_priv *j1939_netdev_start(struct net_device *ndev);
diff --git a/net/can/j1939/main.c b/net/can/j1939/main.c
index 5e5e6c228f22..90a925a5c123 100644
--- a/net/can/j1939/main.c
+++ b/net/can/j1939/main.c
@@ -424,6 +424,9 @@ static __exit void j1939_module_exit(void)
 	can_proto_unregister(&j1939_can_proto);
 
 	unregister_netdevice_notifier(&j1939_netdev_notifier);
+
+	/* Wait for __j1939_ecu_release_rcu() to complete. */
+	rcu_barrier();
 }
 
 module_init(j1939_module_init);
-- 
2.55.0

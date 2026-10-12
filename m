Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98591A681E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770265; cv=none; b=RjTTho1IQGY+5aZvENh+/cn27eOgeDyGQ6yvEZJVUwHaPWaU4tawXBlwDbH/yKS/LD67RK56bMgqqeLmunWaED9fAEwB5rbOJOWJi60H4W3MlAzc/anynAGxA3jjtQUJnuwSrFxfTQGOxb+L2TAs+1YE0TV+OdtknwiZZAHHkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770265; c=relaxed/simple;
	bh=UHoRyMXiM7nTiqE229gHpN2uqBFHh+rkx5kDGLsqeb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWQmvu8P8xJq4GkefJwWDQwGndwz/Ypf+NIvY2T6/+8/RNk6XdjW9zVCYwNwD8Ch7wptg8/lMqyaSnFFINAOzf6yzvBslySD0Bp62HoeENgBhsY3UYL/qdTvOvlj8YGf0PW+hmRNEln0oDbKbhiLSSY3RGbgSATBsY2xS602e3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=MnOhXC/R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PKxj8ABi; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="MnOhXC/R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PKxj8ABi"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C45B5140003D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:57:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 11 Oct 2026 21:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791770262; x=1791856662; bh=sFxJ/rI/2/
	T9wBBz1I0/JGzfzTvtkuB0LIHBLyKbO3o=; b=MnOhXC/RcYHOi8Ed92j8cUY9K+
	ZV4Q8FmmgY0cJ3XMLqjU2rrKjsBBx7msHROG2O4qMBfPzmInYMTB1X7oBuOXErfw
	Lg7SSeOro0r9v2lAdVGzrGIOyWidRaPu+P9lS74HKTMcE55cAZ1dY5bFDt12L1pa
	V5RxLLY/vDsEw9UN0aWdfVCFd9bXhgf6AsfSskmYFAKnVdvEnP0GqXTbxb12EOPL
	TNM9bGCHDmwhaoTLk43dDScQmA+/7uySFak8xGgC3BfCcto1rjk57mFQvHHCjYJr
	jx1C1q0bFqXK5cUQ+AOhCQdSuhS9bAQRAp5nh0geo4vNYJ+MK0w2PvLRdQIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791770262; x=1791856662; bh=sFxJ/rI/2/T9wBBz1I0/JGzfzTvtkuB0LIH
	BLyKbO3o=; b=PKxj8ABipQfmxb8yukKK6mxrtM1ZDVWxtPVtosHKsCtITNm81uV
	Isa/G1XbPmlWUOCj0wdRJE6wReNpe33qegt05V5w0F6NunzLV5QaCYZOIJH9K/Yg
	WgTFP+mAU8ZPEOwko9gYPiNMl50h/Em2DC6X/0htjDxCA5f8HZ+gT0yV3JfFGWNx
	Y6Wa9RMydUF2GiL7PPgcSJhtHrloPAvEumP49N+jEZDwc2g1cbU+V8XpzD/KDmwb
	p5UO3EmEocYT/jLh23Fgr5cWM+PcSDTL8Ucrk9yb8S0ujpotBLt56P5yjX3WKB3d
	jwtkTsRqolXjUnTfBkXYPbUhIH4/awFgZ4A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791770262; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:FqJCPAUS7vGZUcFVzPsNfLGvQqWEeANPCSd5la8f4JDr8bZ
	sxu8rQEXCnUucuafEdM1wgtrR0eax2oYD3IOZs7bdTTtnaznX5krq6y2YOe9oWUY
	cLIpe6zbv3P6zh9R7AxNkrD4PTWrWQvvpeWselJmN3MTMqnLk3D+s3+FWIvMVlDA
	12750Orb93UgzrpmAO0YlQKXKVhUCzKe+j6AbNl5Z0vTbM+N35ci9gbTcP/YaFft
	tE3E278SD8q/zwW15haguxWR/WywSH8SwyM5eVFtWywOvXk7f0ohLWPEjxJm7WGN
	vyX45H1civ1mSFqsmRnOJeFauk9L7ZzTl3gZYiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:q56znz8zB9pAEWLveGolFmCslNR5Rw7nq08PqfR9Av0=:UHoRyMXiM7nTiqE229gHpN2uqBFHh+rkx5kDGLsqeb0=;
X-ME-Sender: <xms:lj7MakhXgcy4HW_VozPHwuFO57PO0SfzDij8gW_VVEZiJkmpoFqK1Q>
    <xme:lj7Maq8it1X4g8jvl-iDwkFBj_0XP_jKJmZxtm9cf8k5CXw9xwRGhBV4ku_wKHLps
    d2TK6O9t9DlmqalxLJxbQoOMlF4j6ObPvJHyl9NYGRCG_9XHdzYKJVF>
X-ME-Received: <xmr:lj7Majp8Pa1fgJhxLpMHjNef22CNA1PS4lQL_RaAWZW26FT63Q0Bck2U6qiphNXTscRMpfMKnvycUo7g_yreTaeLrnQb9SG2po5B58r24Ixjhg>
X-ME-Proxy-Cause: dmFkZTG1rA/YrMj+wa0lwk3Ix02dN29csAWTKATcSmdCJeMNxmmpB7tHhd8bbxa1JbJaWd
    /El3fkY3TAYrGNpzTdFaKdc6MNQ12kEcRKfp+zLel2SWjZ610mef7HYF8cwjWYxAxxGot8
    JeJDLSDZGInFwx4n09JGts2S65nfIChXa4775LbZ2SyMJlkL4aSLP0D5uhEIBWc7w25yKk
    WfqDGkrZ9rz7l0gd0i1pRg9xxWkGmhu9tZzbVO7EfZmihveAU+gglTih8eo8waSuI2mtM1
    t3RzR9FfryvnhRyMxbh4/AAroBQuj1b0BzTWE9C9IlSTZc3Ckixby8KRdAFDr1hXBSjdYz
    w9AH/aRME76PN3Fr6pgQmOj2rKMwm9EPn28N4o2E15sc51h9NUpSCSe0gFTIzE7F/mC6Ts
    /DsHcEBaFxZaPcaIheExaPLKRf+uGMEc9R7d8Nm5/EOMkIB4jXwSWZjeDq5MI2TXfU+Si7
    BFJcRafWpCGVSFLaAOx0MSM75T8GqpBJhE+uAsy66o4WjyVlrrWkwlSg5BTFbhCUS9Yunl
    zntX+X0UU6ChAvyh2il0eZM6r3fcaJqvG0yfHl4oU/45A1YvlRcki6HcxDUIbGWJcAkuyc
    NQPQFS+b9MPp7wexu4vVOazynHFB3mwBGMOq3FEYgf/RfSETeE7exM7HJ3PA
X-ME-Proxy: <xmx:lj7Mah_s2W9mqriqxsn7TAZM4t1QEgb74oOzOzISM1x9Y-he2Kvhuw>
    <xmx:lj7MavUVFtS2iZuSGsFLbZCpkYo3R-O7nw_t8RqKWRwkvG3FTvSKkQ>
    <xmx:lj7MavBuz4pKRk-ucYblwmqGfTUH9E3vSxQNslDF65JFegNhbsidAg>
    <xmx:lj7MaozkuxE1b8KbHkgeU54oTw2YSOFgjnHZkjQQR6IizYRdEjOsog>
    <xmx:lj7MaiUQkJt-_1KNpLdmx9vD159rpeZZ2zGHLQ3qAm280FjcqPiQGWn8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 21:57:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: use appropriate spinlock variants for transaction-related locks
Date: Mon, 12 Oct 2026 10:57:39 +0900
Message-ID: <20261012015739.530731-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlocks in the fw_card structure protect transaction-related state
from concurrent access. They are acquired mostly from process context.
The exceptions are split_transaction_timeout_callback(), which runs in
softirq context for the timer wheel, and __fw_send_request(), which may
also be called from interrupt context.

Use spin_lock() in split_transaction_timeout_callback() and
spin_lock_irqsave() in the other functions. The latter preserves and
restores the caller's interrupt state, as the callers are not guaranteed
to have interrupts enabled.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index dfa6c97f9dce..33c4ea48c6c9 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -78,8 +78,6 @@ __must_not_hold(&card->transactions.lock)
 
 	lockdep_assert_not_held(&card->transactions.lock);
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
 			if (try_cancel_split_timeout(t))
@@ -136,9 +134,6 @@ __must_not_hold(&card->transactions.lock)
 
 	// If the request packet has already been sent, we need to see if the transaction is still
 	// pending and remove it in that case (e.g. the split transaction).
-	//
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (!find_and_pop_transaction_entry(card, iter == transaction))
 			return -ENOENT;
@@ -180,7 +175,7 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 
 	lockdep_assert_not_held(&card->transactions.lock);
 
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+	scoped_guard(spinlock, &card->transactions.lock) {
 		if (list_empty(&t->link))
 			return;
 		remove_transaction_entry(card, t);
@@ -223,14 +218,12 @@ __must_not_hold(&card->transactions.lock)
 	{
 		unsigned int delta;
 
-		scoped_guard(spinlock, &card->split_timeout.lock) {
+		scoped_guard(spinlock_irqsave, &card->split_timeout.lock) {
 			t->split_timeout_cycle =
 				compute_split_timeout_timestamp(card, packet->timestamp) & 0xffff;
 			delta = card->split_timeout.jiffies;
 		}
 
-		// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-		// local destination never runs in any type of IRQ context.
 		scoped_guard(spinlock_irqsave, &card->transactions.lock)
 			start_split_transaction_timeout(t, delta);
 		return;
@@ -255,8 +248,6 @@ __must_not_hold(&card->transactions.lock)
 		break;
 	}
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (!find_and_pop_transaction_entry(card, iter == t))
 			return;
@@ -427,8 +418,6 @@ __must_not_hold(&card->transactions.lock)
 	 * the list while holding the card spinlock.
 	 */
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		tlabel = allocate_tlabel(card);
 	if (tlabel < 0) {
@@ -454,15 +443,11 @@ __must_not_hold(&card->transactions.lock)
 	// The node_id field of fw_card can be updated when handling SelfIDComplete.
 	int node_id;
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->lock)
 		node_id = card->node_id;
 	fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, node_id, generation, speed,
 			offset, payload, length);
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		list_add_tail(&t->link, &card->transactions.list);
 
@@ -1228,8 +1213,6 @@ __must_not_hold(&card->transactions.lock)
 		break;
 	}
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		t = find_and_pop_transaction_entry(card,
 				iter->node_id == source && iter->tlabel == tlabel);

base-commit: c85f48c90bf3e62f50b78f7be7d628c06b97c335
-- 
2.53.0


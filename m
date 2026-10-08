Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC548F84B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503084; cv=none; b=NOn36n1jVWiIZMaQVkmx8BwZemZ2lj6gehQOfyr3fzlcq8l9dfExthw+on945QBgU2mG2oyi4KfunKunQt5v0LrlVM+Q399PiWw6a2Nnm7Etrr/cOi7xmn/NojqxMNhoSObX0JBkpwI3K9NqZClNKIZS7IvWDquACI3BSuFeGLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503084; c=relaxed/simple;
	bh=Yy/WutNjNaWbEah3FWrgCbO5aNnmp6DP2XVKPc+Az80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBqk42rE1L4HBTiZXYfHL6xwytcDO8hdooTIdhJxzhsveKbIBkDNCR+K9z7oDSvyTjZA+qIsELixsTL46aOOyiAnvrlYqtadnuOp4mHHCLiwoZprSjm7wEq4wUSK1WT4USdliFAF1lMu20JmdOlwOpGdvuQ7cgGB5hb3EnuN/Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=n5SvRRoO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZNz+Ns1U; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="n5SvRRoO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZNz+Ns1U"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 12B4E7A007D
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 08 Oct 2026 19:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503081; x=
	1791589481; bh=bwXM7jgmHY/B53illi3+XtvRlAXsyvaqj1t8hnxNDG0=; b=n
	5SvRRoOUAAff05U9S7T5faqkg7r1r6bCW1RFCOG0wV5VC2SbZVfqN6L7X+78tifC
	AvI0wyQJa/kD9d404gGwnFEWKGqIygb0shZwIYwE9mIJvmVrituvA01gUeMKl/wQ
	l9tflC/a8xd6rXsBg33cukN6yJXnRLQMEZwiRax3jOe3EpgLJCXfiXW834MRT8OC
	uimY12Se4xOUElIZefPLMm/7/pP6IgUw5d60cGtAHxX0ajuIIK8mh/8IK0x+RLLb
	HI6Lla7kVgvDRwQBGUszzab8cpUm9sOdxIJh7/yEPB97SbPaTBrGzqq8yRHNxVwx
	q4UV08V634g9vgVqzHnTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503081; x=1791589481; bh=b
	wXM7jgmHY/B53illi3+XtvRlAXsyvaqj1t8hnxNDG0=; b=ZNz+Ns1UuwY+l5z2S
	DnzOylG+L9UywpURNm353kbN6Y2B4FvgggVSZmqJlfyF916iCsDJWRQjElW9/Kew
	hRm1UQmf63iHyLxDdKMPiXFLSutixTXzByh+0iIbospozcPq1ueVL23nShUMN1/Z
	pA4Hs9Cb9pqXV+5UbnG1ybU+wXrcBtJpAzJMCTY11LKa3DCuOFghnXT85dMJPKTn
	+qXMD3B13a1rNZUJh9+05EWWqUtNXAuR78Ip0u0YLhP2Nn+rXuSyi4g+mtWtrwIl
	+Oe13vJYCai4chiilhHwN8GS8SvftfIsC0ftVo9y65UnlNyUgWz7ivg5hbA9IAX7
	JCEcA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503081; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:vF8hlKkfdYdTkxmxAUcOlGjQ899bOJ0rwAjwx4TeSviYfu7
	8Z1bi7TECbnwXjKRefdmcEevXypW/Aq/LA4iZTSDC5yw9FTFee626pTx5SmSTqQb
	lKwMCbR1eRnfsYc/0lPQoo6+wt985Es/FU+tiFCpBgEBXSzJYIloXbhMb2QNZhDn
	my8+4F9raU93q2+gPgVGhnXx6i7yKbr+Dg+zvZedOGGg29X/wq+SKy12ByVE1HUB
	FResgTskRlsJEU2Yydhn832wkUAIUJGaAyWJr4JO5ZbfvxCSHFiAp8KONqAW1atf
	keC7lWy3RTIYCVde6AadWUpbvgm9oT7XJG4KS/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tAL7Z2q8IdnVeEVEvKJ2u+ndHMrgJwH/vM2W2UWSpQE=:Yy/WutNjNaWbEah3FWrgCbO5aNnmp6DP2XVKPc+Az80=;
X-ME-Sender: <xms:6SrIaoHZDcLPRD5qEuIUuUUoCwnPQzy4SrB1x75x_WsAu7o-Q7cqYg>
    <xme:6SrIavTKFZr1YQoCJaqYE_ZAtyTwpnfiliuYz_jB7nI4YucFQRluEXDmaxMgXoADB
    BmrGQ7cZCQOy5oO39rkvy5aiWxu2ki1DjLoldnQ_mUmuZGe3MNEXVMx>
X-ME-Received: <xmr:6SrIapsfVcrtBSQvIa9qWLzRQCVWdof2unY_l_agJ1xlUlyYPkpLg9XVcUoDYoOcmsuOYLwQiDeYcIYs79WXsr_A5PATSi0lrGPvtGpsHe1pAA>
X-ME-Proxy-Cause: dmFkZTFXiP3ByqRhi+bwfuEeoAus3yLRLtXhJHCwP6MTIYwZlCSl48rCsY0UEii+0QwUS9
    xSx1ysA4oMb5BPpT1i5hTXOpWF8kB0fBm+jF7w8IjL9KNqD52nb/FIROI28s5WcMn/Sm3C
    bb0rs+G4cgc9GOF7iMufmCeAHYWWbaMdrGiimryatdAJwvTko+Yk8d0JfUesu/g9kjRbuM
    GszrLhc+YMK9NFdZ55jRsRqoU5n5N2Gk9DnvUfk5ZZ82Ux4K7iAVHDrwSBl0tF19iwVNWg
    vr0npOA1jDggXakKdKRzmShW3vvNSVNQ1/A69o/HOmrHHA8oLUp1XCgW9uD0Czwoo/VLNi
    UVngSKdPqYj691K6QFqM6kQReGNj+mclGXFbjm1SEmCTSEHeIjr1ao88quYXhLIacR9DH+
    6AUtEzsnh/vJNUCP66DRX0zP7nBWJu7YippIyaaOZ1SdNkglbTk6QBZvbtbSzxsqVXa2i/
    38aw7Q4ZfR6umrdK+U/SiXZV7ROdZXdFGfhmc3CFYgAecRHBfFqi6W4JDZ1roKAT0nSA3l
    nGATV7KBS/w9XiF9/BANgOSKLLfOHmP+ybntYSGXQi+9Ai0JfGgtLzRB7v6yLqmz3TgYmD
    z/x4TaY6SOPwYY/3VjEKSdGV+nwcmq0mLB+o4jzkNWTNQ7I2dMhVJ1m6PqAA
X-ME-Proxy: <xmx:6SrIamyiH8t-QM-gl03_wm0X9cdGrhmmXJVghzcLwRmW7EFYqaePyw>
    <xmx:6SrIar7iiSctwagy4NWGkXYYHZrzx7epTj4d2rUMAw88puH3jXqtzg>
    <xmx:6SrIaoU2ZjQMgTdCAADftGknG9TFBVenqyscPWSzEtGAhQAEvFWaow>
    <xmx:6SrIav28mvEHIsOE50zwm3pqRTQVMAjmvyVcCGuETQ_uFqFaQJ1ldw>
    <xmx:6SrIauYAv4-neTjFvXM9nxeXYUKH6ECsTT7z7MA4fA38D7yyQxZUyvg1>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] firewire: core: use sparse annotations and lockdep checks for transaction lock
Date: Fri,  9 Oct 2026 08:44:29 +0900
Message-ID: <20261008234432.251412-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
References: <20261008234432.251412-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spinlock protects the list of pending transactions and the transaction
label.

Add sparse annotations and lockdep checks for this lock.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index ac7a9bde6fef..0c492e4af971 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -38,16 +38,21 @@
 
 /* returns 0 if the split timeout handler is already running */
 static int try_cancel_split_timeout(struct fw_transaction *t)
+__must_hold(&t->card->transactions.lock)
 {
+	lockdep_assert_held(&t->card->transactions.lock);
+
 	if (t->is_split_transaction)
 		return timer_delete(&t->split_timeout_timer) || disable_work(&t->error_work);
 	else
 		return 1;
 }
 
-// card->transactions.lock must be acquired in advance.
 static void remove_transaction_entry(struct fw_card *card, struct fw_transaction *entry)
+__must_hold(&card->transactions.lock)
 {
+	lockdep_assert_held(&card->transactions.lock);
+
 	list_del_init(&entry->link);
 	card->transactions.tlabel_mask &= ~(1ULL << entry->tlabel);
 }
@@ -65,10 +70,13 @@ static void invoke_callback(struct fw_transaction *t, int rcode, u32 response_ts
 
 // Must be called without holding card->transactions.lock.
 void fw_cancel_pending_transactions(struct fw_card *card)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t, *tmp;
 	LIST_HEAD(pending_list);
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	scoped_guard(spinlock_irq, &card->transactions.lock) {
 		list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
 			if (try_cancel_split_timeout(t))
@@ -111,7 +119,10 @@ void fw_cancel_pending_transactions(struct fw_card *card)
  * pending transaction.
  */
 int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transaction)
+__must_not_hold(&card->transactions.lock)
 {
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// Allow the call of struct fw_card_driver.cancel_packet() to wait any event.
 	might_sleep();
 
@@ -156,10 +167,13 @@ static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 res
 }
 
 static void split_transaction_timeout_callback(struct timer_list *timer)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t = timer_container_of(t, timer, split_timeout_timer);
 	struct fw_card *card = t->card;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
 		if (list_empty(&t->link))
 			return;
@@ -169,9 +183,11 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 	schedule_error_callback(t, RCODE_CANCELLED, t->split_timeout_cycle);
 }
 
-// card->transactions.lock should be acquired in advance for the linked list.
 static void start_split_transaction_timeout(struct fw_transaction *t, unsigned int delta)
+__must_hold(&t->card->transactions.lock)
 {
+	lockdep_assert_held(&t->card->transactions.lock);
+
 	if (list_empty(&t->link) || WARN_ON(t->is_split_transaction))
 		return;
 
@@ -184,10 +200,13 @@ static u32 compute_split_timeout_timestamp(struct fw_card *card, u32 request_tim
 
 static void transmit_complete_callback(struct fw_packet *packet,
 				       struct fw_card *card, int status)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t =
 	    container_of(packet, struct fw_transaction, packet);
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	trace_async_request_outbound_complete((uintptr_t)t, card->index, packet->generation,
 					      packet->speed, status, packet->timestamp);
 
@@ -379,9 +398,12 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 		int destination_id, int generation, int speed, unsigned long long offset,
 		void *payload, size_t length, union fw_transaction_callback callback,
 		bool with_tstamp, void *callback_data)
+__must_not_hold(&card->transactions.lock)
 {
 	int tlabel;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	t->card = card;
 	t->callback = callback;
 	t->with_tstamp = with_tstamp;
@@ -1137,12 +1159,15 @@ void fw_core_handle_request(struct fw_card *card, struct fw_packet *p)
 EXPORT_SYMBOL(fw_core_handle_request);
 
 void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
+__must_not_hold(&card->transactions.lock)
 {
 	struct fw_transaction *t = NULL;
 	u32 *data;
 	size_t data_length;
 	int tcode, tlabel, source, rcode;
 
+	lockdep_assert_not_held(&card->transactions.lock);
+
 	// Allow the call of struct fw_card_driver.cancel_packet() to wait any event.
 	might_sleep();
 
-- 
2.53.0


Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B448CD4F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 23:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791503081; cv=none; b=MTywtwPBE9CjIIuskOua5Ykja6Ujkqz78cXr3/pZDAX5DNGE/e4rolJpSQ1YMDrxatcN9xrH9JTi5342PsY9jFmHlgLyrNKctNpCPIhrUQ4aAZt78WrEsJSqVasvadJMziHlCnQ+TP/XCpFNWjY7ZIvXb9rSSoU7e8eADskLNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791503081; c=relaxed/simple;
	bh=NpAEVsK+d/iYaObVQOJoU8IjBWC6M6xmNMmQwxD6YYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGdlZTZ8uH8babVVwdF+wDK+rVIVxyXXpjFEh9Z5FOQla2MqaFwqrKGVuyCJARL7611d1/FZ7HuD7R7mDF0fFKqUJ5Qv9tpHdQEo6hBJBU2u5cBThiyUUsMex7STKlEGLeL1rhsh678xhl+ngoZCwLR9hU7dvHj+xg+BpCuN0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=SazEZ2sz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IQFrD9jJ; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="SazEZ2sz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IQFrD9jJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id D11B71D0006E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:44:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 08 Oct 2026 19:44:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791503078; x=
	1791589478; bh=opGng8AXtztdTDD+jUjqtgUsqd5hCWOmDDq3s0Pi04I=; b=S
	azEZ2szXULhhD21d+zfy5gf08CXQ8wr/uCaFb6A23ODyjAcJiO4vsuVbynOQlDWz
	GhCqNmv78lAxa2Vkd7EmXi69McYc7Y3loAbkprNVznMCGbgy7ls1RrSWIWIRgYep
	RVWQTKH4RYFjiy0/umcwfAWhQoo5RexquvpBvBMgVwlj1W1PZ8ocoX14R4VYxLg8
	b8OoI1CjhxvI2Zm990wyKIYv2AoyLVG6ALJOSy8RdYTyGvP7pXWxzgUGqnd1LVjz
	VpwWdJdmYV5PMo7kry47GZpEZYGj/lNYIenWeatC2RToxBv//q2qbfANnX5TjPGi
	/8prdoQCltVdf0odosGQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791503078; x=1791589478; bh=o
	pGng8AXtztdTDD+jUjqtgUsqd5hCWOmDDq3s0Pi04I=; b=IQFrD9jJ4wM1bC8DG
	j0swwDuRvV25ue0HxXKICX+nXiaotjM/fWHHcknbqP0rpO8muX9FTgJ0Wn4s+9Rn
	YF63AY4xrL5gmuofHZL7rdbdU18PknKMBDNKkg0IKZX1JKm9eIB9VKrWFofbmZtY
	Wmv5ok6ZSIQqhDdfpy6m+8ZgReD6BE3GucO0G3Amg4H2qa/n6AeJF15Z6cwdyN9o
	mToglIWazh4L64Ei9XsssjtyXnIEbGCvBumY0U2wLBP1bLJg/PKQGTkg75NxggOQ
	34Ac1k0owukdZWPOox6A1VdHKqHqIT7u6QnDwJJVgNKMxgs6fwFhYozNAYMGcqNF
	We7vQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791503078; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:rkOwJ+WAfP5XY2w53ED9pS8PIde9Kr5DiKnRf0hOocpSW7S
	Slua7FjWXYcf13EO5Iyp/UMwA/UVEesVsKnYKrOJvkyEesfPtK3L0DL3mvagC1FU
	twFSfI68QnX2AeBZ0glYcyhqg42dJ6ZPx3SMbFnQssgqh4ahsg5gEkQ0gbT/nnr9
	Xfz1EHLMsgYQl1ctXb8ldwjsihktHucD3S6gy5Oy+VYgEaFByzaByvaeB+0zWbee
	ojtBuhtTkA71jX7Bgcx6vO/s260LpWaNlOXe771YpPS9F47l8GJ20Fqh2GFLfQoH
	/POzYFTxIqh3ypvXdgTemM0VTWJfdSMn3VD7hYw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QZtKhkYRjPRtveA90APPUfotbdqMPeEoqjRwV1/0b9Q=:NpAEVsK+d/iYaObVQOJoU8IjBWC6M6xmNMmQwxD6YYY=;
X-ME-Sender: <xms:5irIasa8I1y2obJDY-ZSPhLkqa5U1UDa0CGnBAvcgnlwEDoCUlFAUA>
    <xme:5irIalWNMznCvbeuNbe4BIUHSkGhrnBi9SyZD6GgrDkiF8IQvGv6cr46z7phEwcrx
    qGB6yVrviNd6TMH-wYaFYOiBaRgMAdjeaqIniRA_oyE4Y0VsZXwtJm_>
X-ME-Received: <xmr:5irIaugIEJbQ4cPw6AMmKKnyyUgSBN6P4YKrLAD6IJUm1Jy1BecjbkBQsJxV28ZaPrX3A8kw5o8JeVRe9lJ9jNOA_eMIR58slHQawEQKJwT1oQ>
X-ME-Proxy-Cause: dmFkZTFXiP3ByqRhi+bwfuEeoAus3yLRLtXhJHCwP6MTIYwZlCSl48rCsY0UEii+0QwUS9
    xSx1ysA4oMb5BPpT1i5hTXOpWF8kB0fBm+jF7w8IjL9KNqD52nb/FIROI28s5WcMn/Sm3C
    bb0rs+G4cgc9GOF7iMufmCeAHYWWbaMdrGiimryatdAJwvTko+Yk8d0JfUesu/g9kjRbuM
    GszrLhc+YMK9NFdZ55jRsRqoU5n5N2Gk9DnvUfk5ZZ82Ux4K7iAVHDrwSBl0tF19iwVNWg
    vr0npOA1jDggXakKdKRzmShW3vvNSVNQ1/A69o/HOmrHHA8oLUp1XCgW9uD0Czwoo/VLLk
    ABvmei6zxFyXQmJsmKVbY3KhZiOzAHdDwYp4pGlBXN2CUI1BD60/fX9d31Hy4iHEZ8ug30
    tQDzrUtBS6sPdC6+HVOfXn0xYaSlPWMX4RihflD5IDrcmAptXQYFnxjWCROPwBrLlPUFm2
    O8Mx762UmJ2L7fHtSsJ6oVN67O/bN/dNmqDb7VXPU1XP5C5l4HOlHwR648qd1QGhKo9eWK
    8lUZYWMAqZm5DUedgMwocLLnRp7jRXFHm+8NYW+s/gymRtOBy9xxYMXcpobm3+UK29RlWN
    dp5jK5AaJ4qr6TZU836nmQ8napPdN8XV95MSFvd2B/zieXSq14EAQXqijIoQ
X-ME-Proxy: <xmx:5irIajUmTFDcqr-RYD15Rs5lI-_a8NzVzh1-ILvf_m9e5jP4cYYjAw>
    <xmx:5irIalOVMKVThPbv4egsibWnhpqIZ3i5RIA5RBtk1UeFmcZl5aQi4g>
    <xmx:5irIavYdLlCZh86LAFYKTb3KKG8miAa3A6sD8xeAlS85rTTxhADOzQ>
    <xmx:5irIahrO07l6czgISfzlnesjYgUxPQDHGaU4Lhg5iHm23E42wIxXDw>
    <xmx:5irIahM8CAzMb59tXTp68HLUj85yXaZdYMERs9RWoybSzZTc9rwHAr0L>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 19:44:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] firewire: core: use spinlock_irqsave() appropriately for transaction list lock
Date: Fri,  9 Oct 2026 08:44:27 +0900
Message-ID: <20261008234432.251412-2-o-takashi@sakamocchi.jp>
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

The transaction.lock in the fw_card structure protects the transaction
list from concurrent access. The list is mostly accessed from process
context, with two exceptions: split_transaction_timeout_callback()
acquires the lock in softIRQ context for the timer wheel, and
__fw_send_request() acquires it in the caller's context, which can
include hardIRQ context.

Use spinlock_irq() in process context and spinlock_irqsave() in the other
contexts. Update the relevant scoped_guard() invocations accordingly and
remove the unnecessary comments.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index a0379fc3e60e..39715cf79ab9 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -69,9 +69,7 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 	struct fw_transaction *t, *tmp;
 	LIST_HEAD(pending_list);
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+	scoped_guard(spinlock_irq, &card->transactions.lock) {
 		list_for_each_entry_safe(t, tmp, &card->transactions.list, link) {
 			if (try_cancel_split_timeout(t))
 				list_move(&t->link, &pending_list);
@@ -121,10 +119,7 @@ int fw_cancel_transaction(struct fw_card *card, struct fw_transaction *transacti
 
 	// If the request packet has already been sent, we need to see if the transaction is still
 	// pending and remove it in that case (e.g. the split transaction).
-	//
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+	scoped_guard(spinlock_irq, &card->transactions.lock) {
 		if (!find_and_pop_transaction_entry(card, iter == transaction))
 			return -ENOENT;
 	}
@@ -204,9 +199,7 @@ static void transmit_complete_callback(struct fw_packet *packet,
 			delta = card->split_timeout.jiffies;
 		}
 
-		// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-		// local destination never runs in any type of IRQ context.
-		scoped_guard(spinlock_irqsave, &card->transactions.lock)
+		scoped_guard(spinlock_irq, &card->transactions.lock)
 			start_split_transaction_timeout(t, delta);
 		return;
 	}
@@ -230,9 +223,7 @@ static void transmit_complete_callback(struct fw_packet *packet,
 		break;
 	}
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+	scoped_guard(spinlock_irq, &card->transactions.lock) {
 		if (!find_and_pop_transaction_entry(card, iter == t))
 			return;
 	}
@@ -399,8 +390,6 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 	 * the list while holding the card spinlock.
 	 */
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		tlabel = allocate_tlabel(card);
 	if (tlabel < 0) {
@@ -423,16 +412,12 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 	timer_setup(&t->split_timeout_timer, split_transaction_timeout_callback, 0);
 	t->packet.callback = transmit_complete_callback;
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->lock) {
 		// The node_id field of fw_card can be updated when handling SelfIDComplete.
 		fw_fill_request(&t->packet, tcode, t->tlabel, destination_id, card->node_id,
 				generation, speed, offset, payload, length);
 	}
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
 	scoped_guard(spinlock_irqsave, &card->transactions.lock)
 		list_add_tail(&t->link, &card->transactions.list);
 
@@ -1176,9 +1161,7 @@ void fw_core_handle_response(struct fw_card *card, struct fw_packet *p)
 		break;
 	}
 
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+	scoped_guard(spinlock_irq, &card->transactions.lock) {
 		t = find_and_pop_transaction_entry(card,
 				iter->node_id == source && iter->tlabel == tlabel);
 	}
-- 
2.53.0


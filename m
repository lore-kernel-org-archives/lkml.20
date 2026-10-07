Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B8389115
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365577; cv=none; b=Ad2orAqWMkxOXN6/R/z5BtfZHTCjB6b7n8f9Ul1ZDqQiPDk/Rb8wmLKHN8kGYKKxRaoMdncZRI49D2PuKbrkBxmznyHya82+ZMdG/G0Ost9f0gVDn00a6C2yOvyBFjRFYwlVrglsTkv6l8pLCbGYsQELipY/E8VDhKK/7ZkL0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365577; c=relaxed/simple;
	bh=9VjiYrMKoAwmkxmwh3nxDGuyCnOB7y/v43wko6IN8+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuSQkfevdC/+QxROPu+OQTY5/g848UQ9kAsommPdwmZYdb7UW6JBenY68p50/dW4LMR4453umJ5UUaaTvAHKD4QMmv2AmnuVtlED/N2jetFkta8nu7tYuEQRbSQbYvcqtw68B/v7Dn4oULFgorhHcVOZACsirimMz6FYRp6WisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=n5paL3wQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wn+5G04C; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="n5paL3wQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wn+5G04C"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4D9F67A01E7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 07 Oct 2026 05:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791365562; x=
	1791451962; bh=9MBXcqAJ+MQmf05WSBe6u0DxbI+j+8yc5yC05Bjv+68=; b=n
	5paL3wQXtmMyS3UezugdgzSDz5n69eo8fl8dDdsYWcKDo9DLWEq8ngcRSxUxYc0P
	EDTi+YUCcfrnHm6yJfBi/Ek3KHx01G63Zclrwwk6yFDe5x/3aboLFgMSmt5RtcJV
	jQk8a/nVvMEHMbaXIX5juiG3HmaukalL5UOU0B6wByBL+swJqw0jGyTsTcPZF0Ff
	YKwnaLXIFP14NJPyN92W0pGCOny2JuqG8DBhl18kpb2Z6La+uNiVEh6aCa246nt3
	+wnVz21rTAXmeAWk4PIAElXMbumfD9RbSdE+e0QlTg9cf6RGEKy6h3spT6XeIqrQ
	2gnKmMOGnVeZHCWVbsRuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791365562; x=1791451962; bh=9
	MBXcqAJ+MQmf05WSBe6u0DxbI+j+8yc5yC05Bjv+68=; b=wn+5G04CNyX6HLPw3
	hUgSTSL9BA6ivClNyV7R21R4p1bVms6BpUYZSykz2vjbVlGBi19p4BU9BnsNT2rh
	aM1kAx1BzRbLmIFv4y0spqhatH8rp8ffmiF9gIVdp/vleU248YQDzhLhOwCk3BXM
	Zy9lx0wZrCFKHqZyx3WcsuLKpSp6lvMQRraOd8tbFbOVk7cxE9t0r3Yuxc+eZSAj
	2gSMBy+I7H0k1kAyqpkpJaq/jfQXQv4dbsAdZy/iHYb+scYmf+yGsvUgGeTgMsVB
	My5a4LoRvq/M35lQkGmrjNA3ISlsqsdWKuDvWke2KkfixAX459oA1PJU8BeOTwRw
	rBGQQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365562; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:hBBGg48Idzc8dybqtmrNoSzNOxEa+j6BfB89r7b4Kfa/pYP
	GnvAJHp3U1MV+rSsWYGdMyQm+rxCyUGriQUxHbDyPmdPGC2wYe/PBvYM8l36rC++
	UUS37e7SwFs7pgmwBCsAJlnuLnpT0nYP+NuD2REgG9gSoimvGEMk/UUxxpK5vw5V
	1zR9anoXyorUnucDoJeehHXYiWIPL+I557CKvyogUPESuVDVq1ykF76b+WekEr5b
	ZhqYLqXzYKcOFA4C7tK3CDpqwJaNAaDfDsTjt8R9vSRdPLq9Dc8n61O5h6emM4Dh
	msln3ncZeVpwD0JhLLbqwIc9MFSDP/je7ZjonlQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:huQiXi9jdFH52Rqjh5Hy9mqFU4CyV+M2jPnVdWjcQnM=:9VjiYrMKoAwmkxmwh3nxDGuyCnOB7y/v43wko6IN8+A=;
X-ME-Sender: <xms:uRHGapjVXyR1zNjnvvAtcNCfVxDGGG0UjHyaxxIIh9y8dx9HWC8EOQ>
    <xme:uRHGar_KrnadLmV3INLoiLfTMPyeyZmRdyqdmlNJV4c-W3EUZCLAHF9lKT0jeHWpd
    6gNKBE-qB-nWwgtsmF7yX56-vQmYpEYk5lPTkLulRRmaet5AyYUOOKf>
X-ME-Received: <xmr:uRHGagprbgZjUC-zig5dPY11XiuCPjwatKRqn9xX80nLYarV2RdA4MaJi3t36KjEvOSNqHpLBVShE1UgCrwVHNxbjGKLSDx1rpSTB3kwvNuQTQ>
X-ME-Proxy-Cause: dmFkZTGcZk5UZhE3hGZPA7OmThxBOMabMoTeTRs7uMWhJ/AlLirFpVeSE0QEDfoedniWIU
    ZC3DGn18HpH8zVVM9zuWqf1/mPFrJw2iy+AvZvu5gmVbbymyM5m1Wq3Wv9xFLWPLH7IbOs
    Nh6KFHEDLJyjlWCpRHuzCD1uTKb13DwmAyHJfx98dR3KDEwcu44eFMsfwTkQ3ma6OCGZsh
    QktnbdkGnSQ9iEYJLBJscA9evP3JNnWTpMdAfXnr6kjTSGMVkwnJhk3N3oGyRvdmd/+hSW
    12fuie37IKYKeoIXLNOHtjEypnVUmkYCPw6+cABH8bp5p8NdiJuBV2pjanIu2YdWgaaoR/
    NlgP06vBvgZguLbyXqOXbwwpma3VtMagPvS+59Jtys8NXPWt91eAR9HA0QgmEdTFwQtFyr
    OPrtakZYkSyLdiyLGA5qEsRc1wGhUDIOz8zXL+uT8rTo6raO0VmcEEoAXLVgbv3BXyO/6K
    D6ZI25JxazEmwCYRAvC7eXsU1PD/W5he5P3hCYtd6d14n/ZVEpAakughhMd2+yjgVF85Kv
    PtCnp/+LgZLSte1AMmkXP36cT9p2g2e6LpEk9g2ABiontwCBLEXUKV88+KCuGpZ34NhS/w
    VmuBgg5YJsWaYwE42YZX/YG3KotdCm7/FaPhJvZhEG5GTgLEUDsWbu4bQM+Q
X-ME-Proxy: <xmx:uRHGaq96_ufBeh6gUagE-8lTt5tpF3lpw0uM2KyPQr1omRhEefjFVw>
    <xmx:uRHGakUpfCDQkUxh0DZDPXjyFS5G4G8AA-lPWQPn-WTbO7XaHuC2tg>
    <xmx:uRHGagCIX_UgYi_RjIUBR27JbJHPtOg8yBmAy4Y_G43iF6bEVBVqhg>
    <xmx:uRHGalzwWuLkotX5bLlMsEpyJZxvDUpHUOMbs0IIEgvUBuWcejGF0A>
    <xmx:uhHGavXc8UGpBoTGYForaHphY_U9AzB3RZBm0rCzNlwL3TRLQPBKvFzw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:41 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] firewire: core: expand close_transaction() into its callers and remove it
Date: Wed,  7 Oct 2026 18:32:31 +0900
Message-ID: <20261007093235.175742-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
References: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value from close_transaction() is useful only in
fw_cancel_transaction(). The other caller,
transmit_complete_callback(), simply discards it.

Additionally, the pending transaction queue should be enumerated as soon
as possible to prevent the issued transaction from completing.

Expand close_transaction() into its callers, and remove it.

In the find_and_pop_transaction_entry() macro, a local variable provides
the evaluation result, however transmit_complete_callback() uses the same
local variable for another purpose. Add an underscore prefix to the one
in the macro to avoid the unexpected result.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 76 ++++++++++++++---------------
 1 file changed, 36 insertions(+), 40 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index b4fccabb8fb2..37c61c4b7d20 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -87,36 +87,18 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 // card->transactions.lock must be acquired in advance.
 #define find_and_pop_transaction_entry(card, condition)			\
 ({									\
-	struct fw_transaction *iter, *t = NULL;				\
+	struct fw_transaction *iter, *__t = NULL;			\
 	list_for_each_entry(iter, &card->transactions.list, link) {	\
 		if (condition) {					\
-			t = iter;					\
+			__t = iter;					\
 			break;						\
 		}							\
 	}								\
-	if (t && try_cancel_split_timeout(t))				\
-		remove_transaction_entry(card, t);			\
-	t;								\
+	if (__t && try_cancel_split_timeout(__t))			\
+		remove_transaction_entry(card, __t);			\
+	__t;								\
 })
 
-static int close_transaction(struct fw_transaction *transaction, struct fw_card *card, int rcode,
-			     u32 response_tstamp)
-{
-	struct fw_transaction *t;
-
-	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
-	// local destination never runs in any type of IRQ context.
-	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
-		t = find_and_pop_transaction_entry(card, iter == transaction);
-		if (!t)
-			return -ENOENT;
-	}
-
-	invoke_callback(t, rcode, response_tstamp, NULL, 0);
-
-	return 0;
-}
-
 /*
  * Only valid for transactions that are potentially pending (ie have
  * been sent).
@@ -135,17 +117,25 @@ int fw_cancel_transaction(struct fw_card *card,
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
 		return 0;
 
+	// If the request packet has already been sent, we need to see if the transaction is still
+	// pending and remove it in that case (e.g. the split transaction).
+	//
+	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
+	// local destination never runs in any type of IRQ context.
+	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+		if (!find_and_pop_transaction_entry(card, iter == transaction))
+			return -ENOENT;
+	}
+
 	u32 curr_cycle_time = 0;
 
 	// Timestamping on behalf of hardware.
 	(void)fw_card_read_cycle_time(card, &curr_cycle_time);
 	tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
 
-	/*
-	 * If the request packet has already been sent, we need to see
-	 * if the transaction is still pending and remove it in that case.
-	 */
-	return close_transaction(transaction, card, RCODE_CANCELLED, tstamp);
+	invoke_callback(transaction, RCODE_CANCELLED, tstamp, NULL, 0);
+
+	return 0;
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
 
@@ -201,9 +191,6 @@ static void transmit_complete_callback(struct fw_packet *packet,
 					      packet->speed, status, packet->timestamp);
 
 	switch (status) {
-	case ACK_COMPLETE:
-		close_transaction(t, card, RCODE_COMPLETE, packet->timestamp);
-		break;
 	case ACK_PENDING:
 	{
 		unsigned int delta;
@@ -218,27 +205,36 @@ static void transmit_complete_callback(struct fw_packet *packet,
 		// local destination never runs in any type of IRQ context.
 		scoped_guard(spinlock_irqsave, &card->transactions.lock)
 			start_split_transaction_timeout(t, delta);
-		break;
+		return;
 	}
+	case ACK_COMPLETE:
+		status = RCODE_COMPLETE;
+		break;
 	case ACK_BUSY_X:
 	case ACK_BUSY_A:
 	case ACK_BUSY_B:
-		close_transaction(t, card, RCODE_BUSY, packet->timestamp);
+		status = RCODE_BUSY;
 		break;
 	case ACK_DATA_ERROR:
-		close_transaction(t, card, RCODE_DATA_ERROR, packet->timestamp);
+		status = RCODE_DATA_ERROR;
 		break;
 	case ACK_TYPE_ERROR:
-		close_transaction(t, card, RCODE_TYPE_ERROR, packet->timestamp);
+		status = RCODE_TYPE_ERROR;
 		break;
 	default:
-		/*
-		 * In this case the ack is really a juju specific
-		 * rcode, so just forward that to the callback.
-		 */
-		close_transaction(t, card, status, packet->timestamp);
+		// In this case the ack is really a juju specific rcode, so just forward that to
+		// the callback.
 		break;
 	}
+
+	// NOTE: This can be without irqsave when we can guarantee that __fw_send_request() for
+	// local destination never runs in any type of IRQ context.
+	scoped_guard(spinlock_irqsave, &card->transactions.lock) {
+		if (!find_and_pop_transaction_entry(card, iter == t))
+			return;
+	}
+
+	invoke_callback(t, status, packet->timestamp, NULL, 0);
 }
 
 static void fw_fill_request(struct fw_packet *packet, int tcode, int tlabel,
-- 
2.53.0


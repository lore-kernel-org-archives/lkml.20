Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957B481A93
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818628; cv=none; b=FV0GnKtp6IOoXkCIyhEGXdu7pKNR14tx+zePuDmyfy8o1m7+6IVZ9mssbncadFj7FqBxoBi88rye7uhPVeI8aHQyKKFFdwMm72KSVAJZf4OxeD6Ac3qpVVWjqdJRLpY6RMSzQaLqgCB0+xhn/xEF0u6R/gIeh9BXafQAPI/ITqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818628; c=relaxed/simple;
	bh=MvtFkG6xtHxkNHPTqFa0InscQxy/aGh54JcvjKOoIlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf43G57Zydqjs2gKDbuoj0kbrErF2mnaq38cB0Lo5oPeMYEUXA8jKlkN5XJmK0DahJtIJfDcMSqvx22yJgOEa26/LSHRDrY/gehAIpJIdQTHsyeqkiW3p/BS5asFO/mSPEZls5pMWbNnEhj4i2dtqys7Vx0PgLhfcdbsqX788jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=OcBRvPRn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jVgNLkV2; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="OcBRvPRn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jVgNLkV2"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A93467A0127;
	Sat, 19 Sep 2026 07:50:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 19 Sep 2026 07:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789818623; x=
	1789905023; bh=NRXX2GFWYuxB/V9mP0IUlSvSK2buODEjC+n25rtlACs=; b=O
	cBRvPRnUlqo5ZtS+gughzDke9NEyDXJVOIyKvXKgPoc+iKp4fFLU0rnpkMjIsy9o
	RDm5AjANzh4BkV5GH4MfqH+EEKLK9+Nl1XOER4R4lGMzN4i+DiqFT242QXC6fwoc
	ed8iQI+/C4vXZVnEeXsNUF1azlhjmdfOw15DyUw0zvM8LRuDfUachSnXW+sD9AwL
	zSo/TYCILvQlLH/C39bOxbU9Ee9rOaPRZZawVrLuaV40OczJLjpz8lcLWpclGlgB
	5zDgXL+JZx3eXmG52X77o/ifBu7rcXv9kTnQWinGtPkPjQDKsfTay1bDhNzeRIz3
	ii9SgE7qj1pyFRcCYCR5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789818623; x=1789905023; bh=N
	RXX2GFWYuxB/V9mP0IUlSvSK2buODEjC+n25rtlACs=; b=jVgNLkV2ogv9oxthB
	DXBgj/qIOTSGNVS61pkJAt1EJiRxLso4rPtEMvzitga8qptQopu+pX9hOZwWWspc
	39CKcPR3tDPGvbJZOICkzcX2GjSCwpglQmX6HXzEp5sYgxXJ/9DOvjpo7gyWFvXC
	KeEgPP2MLSDcN1QVOntkBLpYiXq7rGm4824tG2v8RIzxrgR+fOxCtRVRtP/nUrp6
	2/qv+5K4SquubzE0Ppf10u1JesDNNf7hILzIStnsn1ttPqwgN/4MCUyL+KWLBtIO
	C9ALGL6j5t8dVGEEAdn1zGt78JWRhDkpujCYVlCd0e5w0pBMHqYX7wNe/EeOIXfm
	5w0vw==
X-ME-Sender: <xms:_3auaqWaGcGZ-rZkx-DcI00Yac48tGFZ2X6Sx3BKV-JsQl6c5rF89A>
    <xme:_3auakhfzQYvohpguYhSlcPD_bD9uITp8MQ3ENrY_nLEqBoVgkXudRJmsQJxlQ_6K
    m3_3d7ADcQyH6hac0ZoNXA3VmORX8RZjrwOEN9xFfUrnAPS1F8RIlrX>
X-ME-Received: <xmr:_3aual-_MpnE2ozOxT1TC6cQRogkWtu_Xd51MuyGehyv_qnHixxXhRIXF4XUe_jBWOHKZrdyUDQNbiDlZVmnmbcx7LkooCCsz-oCpD4xjU7YTA>
X-ME-Proxy-Cause: dmFkZTF89Q54GLsKvm4RbZqlKDuUewYy1TCjGEnhC1YTwWhDVU1Gg8XUBhEJm2TFxVZvvI
    zZEWEbHGf2ZL/pZjpc45k/hrCyAQtJRuufvPYfjuTBfotRHi0VhVl9zEH589EBWb5B7mV/
    tfUd2RmdbhW/gTVcrpgviK+UD+Y5c9VHkMn0OFtbpmRapD9LbA6ckmj6VMUOy2adwzCJaQ
    BezE15MGm6MTQkkQRzD5EoBdxPXwsaCP1b5MkvdulSTaCPXedkrrOZFrvrHQtWUmA/MQcg
    pYWPbDXBkfElLnA8ESdXyHxJfOUX3+Xp1s4Nd0Jf5roMulsmIdACOHs9ds8uKd54CVcFTY
    OzqJd0lw2W/2+wx8Vt5bEVoPffsgz3irlqjanqRUANd3xH6awAqG2vIpUc4j8yuko3iY+r
    Cqw3ak+YmnLRuePcu+voYOU/fG7JE3cXQmneGG3aD62mv1V2Vn8jXl2EQ1ZVWwUg7FRpfA
    uol5FAPR2aiAn8Sj768VYHB/Ro1IcQYB1CEb7weJ3BP4N8vhqV0USel6mfYk7qaVXv59G7
    2EyIvBeLBAIWbVc1MfWbu7zStAfop7z3wspf+cGNV9C2CtDsjae5+CGWcxbMRzTQZYNl0c
    mThW5rQEoP7Czkl4TZCJrIVCkIdAJZtuqZp9wPsyMzT65FiSsw3tlFO7c9NQ
X-ME-Proxy: <xmx:_3auauDAtj0Eimm2gSsR5R_DxpSymomu1Raw1cFUWo_i3MXiJLuA8g>
    <xmx:_3auaiISLmIcv92saxHbxIDO7_0mMgA6Jj_JYn7RSqV3Qgcl-eJU2w>
    <xmx:_3auahk8EhcyWqg0vWIhyTa9du99fdh0pXq1czKLhZNKsUENqRoMpQ>
    <xmx:_3auagEVTH7r8mUjdi5SRtmWUIyE927yxprCH5hAhuSeMNDzFXM7QA>
    <xmx:_3auairubKsKbnnqtpCjqmbMltcYMZh-iM-9eMrOmN7Vmx2wt_MlBV6P>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:22 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firewire: ohci: use workqueue to handle error case of AT request/response packet queueing
Date: Sat, 19 Sep 2026 20:50:13 +0900
Message-ID: <20260919115017.859169-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a packet cannot be queued to an AT context, the packet callback is
invoked to report the error to the caller. Since the callback runs in the
caller's context, its execution context depends on where the packet was
submitted. This makes the callback context inconsistent between
successful and failed subactions.

Use a workqueue to handle the error cases.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c |  7 +--
 drivers/firewire/ohci.c      | 90 +++++++++++++++++++++++++++++++++---
 include/linux/firewire.h     |  3 ++
 3 files changed, 91 insertions(+), 9 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 23749434d900..be6f18d67ece 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -643,11 +643,12 @@ int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 	//  * == WQ_FREEZABLE		The target device would not be available when being freezed.
 	//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
 	//  * == WQ_SYSFS		Parameters are available via sysfs.
-	//  * max_active == 4		A hardIRQ could notify events for a pair of requests and
-	//				response AR/AT contexts.
+	//  * max_active == 4 + 2	A hardIRQ could notify events for a pair of requests and
+	//				response AR/AT contexts. Additional 2 capacity are for the
+	//				internal handling of local AT request and response packets.
 	async_wq = alloc_workqueue("firewire-async-card%u",
 				   WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
-				   4, card->index);
+				   6, card->index);
 	if (!async_wq)
 		return -ENOMEM;
 
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index bd3e01b2f450..45f03095a196 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -164,6 +164,13 @@ struct at_context {
 	struct work_struct work;
 };
 
+// The local-to-local transaction is handled by the work item in the following structure.
+struct at_local {
+	struct list_head list;
+	spinlock_t lock;
+	struct work_struct work;
+};
+
 struct iso_context {
 	struct fw_iso_context base;
 	struct context context;
@@ -216,6 +223,9 @@ struct fw_ohci {
 	struct at_context at_request_ctx;
 	struct at_context at_response_ctx;
 
+	struct at_local at_request_local;
+	struct at_local at_response_local;
+
 	u32 it_context_support;
 	u32 it_context_mask;     /* unoccupied IT contexts */
 	struct iso_context *it_context_list;
@@ -1579,6 +1589,51 @@ static void handle_local_at_response_packet(struct fw_ohci *ohci, struct fw_pack
 	packet->callback(packet, &ohci->card, packet->ack);
 }
 
+static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci)
+{
+	struct fw_packet *packet;
+
+	spin_lock(&local->lock);
+
+	while ((packet = list_first_entry_or_null(&local->list, typeof(*packet), link_for_local))) {
+		list_del(&packet->link_for_local);
+		spin_unlock(&local->lock);
+
+		if (unlikely(packet->ack != 0)) {
+			// This case is active when the call of at_context_queue_packet() returns
+			// error in at_context_transmit().
+			packet->callback(packet, &ohci->card, packet->ack);
+		}
+
+		spin_lock(&local->lock);
+	}
+
+	spin_unlock(&local->lock);
+}
+
+static void at_request_local_work(struct work_struct *work)
+{
+	struct at_local *local = from_work(local, work, work);
+	struct fw_ohci *ohci = container_of(local, struct fw_ohci, at_request_local);
+
+	handle_at_local_packets(local, ohci);
+}
+
+static void at_response_local_work(struct work_struct *work)
+{
+	struct at_local *local = from_work(local, work, work);
+	struct fw_ohci *ohci = container_of(local, struct fw_ohci, at_response_local);
+
+	handle_at_local_packets(local, ohci);
+}
+
+static void at_local_init(struct at_local *local, work_func_t func)
+{
+	spin_lock_init(&local->lock);
+	INIT_LIST_HEAD(&local->list);
+	INIT_WORK(&local->work, func);
+}
+
 static bool destination_is_local(const struct fw_packet *packet, const struct fw_ohci *ohci)
 __must_hold(&ohci->lock)
 {
@@ -1588,6 +1643,24 @@ __must_hold(&ohci->lock)
 		ohci->generation == packet->generation);
 }
 
+static void queue_work_for_at_local_packet(struct at_context *ctx, struct fw_packet *packet,
+					   struct fw_ohci *ohci)
+{
+	struct at_local *local;
+
+	if (ctx == &ohci->at_request_ctx)
+		local = &ohci->at_request_local;
+	else
+		local = &ohci->at_response_local;
+
+	// Timestamping on behalf of the hardware.
+	packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
+
+	scoped_guard(spinlock_irqsave, &local->lock)
+		list_add_tail(&packet->link_for_local, &local->list);
+	queue_work(ohci->card.async_wq, &local->work);
+}
+
 static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet)
 {
 	struct fw_ohci *ohci = ctx->context.ohci;
@@ -1612,12 +1685,8 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 	ret = at_context_queue_packet(ctx, packet);
 	spin_unlock_irqrestore(&ohci->lock, flags);
 
-	if (ret < 0) {
-		// Timestamping on behalf of the hardware.
-		packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
-
-		packet->callback(packet, &ohci->card, packet->ack);
-	}
+	if (ret < 0)
+		queue_work_for_at_local_packet(ctx, packet, ohci);
 }
 
 static void detect_dead_context(struct fw_ohci *ohci,
@@ -2474,6 +2543,9 @@ static void ohci_disable(struct fw_card *card)
 	flush_work(&ohci->at_request_ctx.work);
 	flush_work(&ohci->at_response_ctx.work);
 
+	flush_work(&ohci->at_request_local.work);
+	flush_work(&ohci->at_response_local.work);
+
 	for (i = 0; i < ohci->n_ir; ++i) {
 		if (!(ohci->ir_context_mask & BIT(i)))
 			flush_work(&ohci->ir_context_list[i].base.work);
@@ -2485,6 +2557,9 @@ static void ohci_disable(struct fw_card *card)
 
 	at_context_flush(&ohci->at_request_ctx);
 	at_context_flush(&ohci->at_response_ctx);
+
+	at_request_local_work(&ohci->at_request_local.work);
+	at_response_local_work(&ohci->at_response_local.work);
 }
 
 static int ohci_set_config_rom(struct fw_card *card,
@@ -3684,6 +3759,9 @@ static int pci_probe(struct pci_dev *dev,
 		return err;
 	INIT_WORK(&ohci->at_response_ctx.work, ohci_at_context_work);
 
+	at_local_init(&ohci->at_request_local, at_request_local_work);
+	at_local_init(&ohci->at_response_local, at_response_local_work);
+
 	reg_write(ohci, OHCI1394_IsoRecvIntMaskSet, ~0);
 	ohci->ir_context_channels = ~0ULL;
 	ohci->ir_context_support = reg_read(ohci, OHCI1394_IsoRecvIntMaskSet);
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index cbe59a18162e..1c71ff69c42f 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -329,6 +329,9 @@ struct fw_packet {
 	bool payload_mapped;
 	u32 timestamp;
 
+	// Used to handle the local-to-local packets in the AT request/response contexts.
+	struct list_head link_for_local;
+
 	/*
 	 * This callback is called when the packet transmission has completed.
 	 * For successful transmission, the status code is the ack received
-- 
2.53.0


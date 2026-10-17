Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2F3D47A6
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225051; cv=none; b=BlIg46l21UUC/pdFMtI/FvfFXPetIjH5iBIZIgn+TzFnxnI4d9VPZN6/nrFsAB9cN3PNHp6J8RDb61XQixWwTnXTdatTb9A2jSDQMRIFKBGlfJ+JQV1Q7t8Co1e0TmKFQd6fIY05ZGowvrdGwxr8e5aFnaS4aGmIcdbvSQtNgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225051; c=relaxed/simple;
	bh=jyEQmV2pMgkblAdNPohQg0tJ8+u/gDWd4+ZE2S6cKm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9bREUtknBd2DqwfvJx4nlngLVdvkA7k+QafTNk4QUDvZThcvNZgGG4E6Bj9vFwStaoMwd7jJc7S0Jn67Duc/7KLzaEc68CXMdCBFHVWiAgycZLj/oCkrWe5yT3gCLOssLTVkQov2bh65UUHbNM+vpVNNIxtEkq6HdXYvjF0Gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=EWjUy6TI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MO40CTWu; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="EWjUy6TI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MO40CTWu"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id CFCFF1D0008E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:17:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 17 Oct 2026 04:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792225044; x=1792311444; bh=cvZEXtgA8l
	iyh7jUSm+mW91eRaAT2wY0hJv5VsK+fvU=; b=EWjUy6TIyaURWZJRMfR6M+1yeD
	hSToxgUokB9YgcjDImoInCGeBNNBp4aGum+rZBs6XkQeSqqQz6obHNYqE3fqe2zF
	9JCLq9bkcHoSq4hMI5Ek+ea8oaZPu5qsnPEMt0HVMEQ6gEnf13cpcCaBEzE4Ibq2
	uprDmryrN0HQ9AumDJYVGtHPvEH+dXTnCqo4kvpCZDtWRXB3R/evEH2cN9q0W/ok
	VO4xE7hGUbniuVwLAJxGc2mNPpaml4+gOZCnHZQCOL19nnN9q+K+Ici92lUalXUr
	DBOYIik+yO3ZBklNIMtIm8WuI61Fu3dbo2a2EshB9mfXwfCkFnMEAtyS0AYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792225044; x=1792311444; bh=cvZEXtgA8liyh7jUSm+mW91eRaAT2wY0hJv
	5VsK+fvU=; b=MO40CTWu2X/lRnqdqvoJOFIr55+5GQHtkG1W3f4BQpMjeohwwcG
	LhJE/d0dH+VJ+TnlwOoa18H6nOAT9f1/+NBQPSX/Le+PQbVw051SmXfHIyTRBrqY
	CX67tPFMcW7G7UmmR5ng9gPIigpiFkcFr6kg/EMrNwBshVBqBKUXaczJK65UuVKj
	n0gDsoMPsHhlAZYPoxY50Clghbypv/M5kNwlbppEgT7fxeb5ILts8fNeW+jeolPq
	paxooUhuEl2TboAygce9EEUnnCqtGNQTYvmggbpC61dhnxmAjsSOPRg6gJXPWG36
	uTi+uDPB8SNMLxLZqo+SzmP5smi8++0HMcg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792225044; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:dHmfgaV4Fri/sH1vQzta4Uv+DLV35W2GU6iCsBfdYoiT3Oe
	TR4ii34tXLzYcECQPTSU3YGazK4t3zKtVQzEzDMF72cTdZ/fwP2y80/cU4LxuOPt
	pvWIoryk2kO4wIe0cxFKe/oPTFVRkmLySN+DXZEuIIWxSQ0D8v7J4I67Mac5HeiP
	ofpE3cQMOQYZE/7ci0vh5qmoZXqoyQZmGCVgn9xYyELQ8+J8EyBnV0/7Pqh+g6vU
	njE6qdV02RXVkW68B+W9rzuTbFotCAXVohz3r1EnodvUFeYGtozL6rIE6HxA78zk
	2LMe1McI2tkb3wJq/9DI70xMhIk3XeGTyWBbuZg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:gvvU1BpSgPRv1IYcmp4tIIWlYjZYnpa4tstoACSSJto=:jyEQmV2pMgkblAdNPohQg0tJ8+u/gDWd4+ZE2S6cKm0=;
X-ME-Sender: <xms:FC_TakeuQi_jd3ICv0LE0yNyD5t0wclZz3a2Qr6uQ_MYKrsOcQrq6g>
    <xme:FC_TakJHRmuxCS__OqmqOAjjQ1ANiGJv8x5hoODR3MEzNYx2fq-lVR-PAIBvOJIse
    PvXieBWAIVsc7_qutFZwErNvOCUHUAAIPPlIMJZVQBzoKxxmFFSQCel>
X-ME-Received: <xmr:FC_TatEgkKdY3VwvSSpdARVimMTR65qB2FVB7mp9OPKIgpF4-m0o33Y78syPm4UNkNMufk-DlkHOif-osSowjrAhvRui2zkLDbtp9Ea0WQse>
X-ME-Proxy-Cause: dmFkZTFj0/dSWSpW9r+wXnaCx36K8Qh55KrPFyBCYrF2Wpc6zp8XU2KnbcvemD9EdRLe/X
    e+8kMtx077W0rGKYVNpO9FWW/dp8sTEw/vhv4YiRoTIE+uv4EiyjZThMNERJZN2Zk0zsX8
    RvTMRTgIxeNqdxhioMGyM5nbZGfLZ6woixT2tk7zU4ZoaNyKq12gFM8JceqtArfYvCCjJr
    paZK37hMG42WlmWPUVQyWUf5wW7ihH62g6dmtXc+f7Vd/WlMJ3VUl+vU8LXZOGirGA/qvH
    91iOCv0ilvCdczdUJnwpjA8ExFI0z6+H7RZXWDR1WntobKIk6HoA+AIfyyzQyFrlCEIAfO
    k6Uk6qDqsJRQ9YPNEieBSBuFvJU8KUOa0kGrWh4GjmFK0Cnso6WPdSf7+khgA/pWk4z2JM
    zUdTiKqn1Z12AQSQ5ybJpuLJ6C9gfizUUApnXQvE/x6ua5/O1TFZi5Z12jjexSqlOccIZG
    filjc9U4yJo61i8oi/OIhTpKvJtB8UcrXUkk7nflnvWffJ31/WismuY6/PMQMgBoXXgZEs
    kcPLSINgOcyxXdVZQys2/kcAgYhex4l65nYI+OyhDANFd6qjrt42xcZh/jEN+grywUZ4LG
    h0xuoOxCLKP5dtzYLHNlncIQoNnpM4AkiTv2BEjxVN1gDM7U13n/FnDZXPig
X-ME-Proxy: <xmx:FC_TamqqHfLm8SC56SzJqV_KZj1ikT6Xcq7lM6Unajxx6jIsugL62w>
    <xmx:FC_TauR9CZ-_meeTX_1jNbW5d9b4D2-FmdVPekZjZLJTycxUbvCdrw>
    <xmx:FC_TarNpJ7aTONqBZQVYFGI8zc1YZMErGSRB6sdERu7kAQVAnKFJ6g>
    <xmx:FC_TapPbQNdnNsSAVpLKsgUnx2DJJroDzmFw87fa-iYUL0HYCH8NKQ>
    <xmx:FC_TalwcMfIQN6HQFBeOdbomvwyidTnLK7mCOCPthWpH5DhqccS2g2A_>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 04:17:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: use release/acquire pair when replacing underlying driver on card removal
Date: Sat, 17 Oct 2026 17:17:20 +0900
Message-ID: <20261017081720.186688-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When removing a card instance, the underlying driver is replaced to handle
closing operations. Without proper memory reordering, other CPUs may
observe the driver before it is fully initialized.

Use a release/acquire pair to ensure that the driver's initialization is
visible before the driver is accessed for close operations.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c        | 16 ++++++++-------
 drivers/firewire/core-cdev.c        |  2 +-
 drivers/firewire/core-device.c      |  8 ++++----
 drivers/firewire/core-iso.c         | 32 +++++++++++++++++++++--------
 drivers/firewire/core-transaction.c | 20 +++++++++---------
 5 files changed, 47 insertions(+), 31 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index be6f18d67ece..83c29a487d86 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -153,8 +153,8 @@ static void update_config_roms(void)
 
 	list_for_each_entry (card, &card_list, link) {
 		generate_config_rom(card, tmp_config_rom);
-		card->driver->set_config_rom(card, tmp_config_rom,
-					     config_rom_length);
+		smp_load_acquire(&card->driver)->set_config_rom(card, tmp_config_rom,
+								config_rom_length);
 	}
 }
 
@@ -231,7 +231,7 @@ static int reset_bus(struct fw_card *card, bool short_reset)
 
 	trace_bus_reset_initiate(card->index, card->generation, short_reset);
 
-	return card->driver->update_phy_reg(card, reg, 0, bit);
+	return smp_load_acquire(&card->driver)->update_phy_reg(card, reg, 0, bit);
 }
 
 void fw_schedule_bus_reset(struct fw_card *card, bool delayed, bool short_reset)
@@ -660,7 +660,8 @@ int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
 
 	scoped_guard(mutex, &card_mutex) {
 		generate_config_rom(card, tmp_config_rom);
-		ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
+		ret = smp_load_acquire(&card->driver)->enable(card, tmp_config_rom,
+							      config_rom_length);
 		if (ret < 0) {
 			card->isoc_wq = NULL;
 			card->async_wq = NULL;
@@ -804,7 +805,8 @@ void fw_core_remove_card(struct fw_card *card)
 	dummy_driver.free_iso_context	= card->driver->free_iso_context;
 	dummy_driver.stop_iso		= card->driver->stop_iso;
 	dummy_driver.disable		= card->driver->disable;
-	card->driver = &dummy_driver;
+	// Ensure the entire contents of the driver are visible to other CPUs.
+	smp_store_release(&card->driver, &dummy_driver);
 
 	drain_workqueue(card->isoc_wq);
 	drain_workqueue(card->async_wq);
@@ -843,12 +845,12 @@ EXPORT_SYMBOL(fw_core_remove_card);
  */
 int fw_card_read_cycle_time(struct fw_card *card, u32 *cycle_time)
 {
-	if (card->driver->read_csr == dummy_read_csr)
+	if (smp_load_acquire(&card->driver)->read_csr == dummy_read_csr)
 		return -ENODEV;
 
 	// It's possible to switch to dummy driver between the above and the below. This is the best
 	// effort to return -ENODEV.
-	*cycle_time = card->driver->read_csr(card, CSR_CYCLE_TIME);
+	*cycle_time = smp_load_acquire(&card->driver)->read_csr(card, CSR_CYCLE_TIME);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fw_card_read_cycle_time);
diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 60067c5b1973..87efd65e6b00 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1731,7 +1731,7 @@ static int ioctl_send_phy_packet(struct client *client, union ioctl_arg *arg)
 	trace_async_phy_outbound_initiate((uintptr_t)&e->p, card->index, e->p.generation,
 					  e->p.header[1], e->p.header[2]);
 
-	card->driver->send_request(card, &e->p);
+	smp_load_acquire(&card->driver)->send_request(card, &e->p);
 
 	return 0;
 }
diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index 4e79c57263ff..a68100d3da0b 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -261,14 +261,14 @@ EXPORT_SYMBOL(fw_bus_type);
 
 int fw_device_enable_phys_dma(struct fw_device *device)
 {
-	int generation = device->generation;
+	struct fw_card *card = device->card;
 
 	/* device->node_id, accessed below, must not be older than generation */
+	int generation = device->generation;
 	smp_rmb();
+	int node_id = device->node_id;
 
-	return device->card->driver->enable_phys_dma(device->card,
-						     device->node_id,
-						     generation);
+	return smp_load_acquire(&card->driver)->enable_phys_dma(device->card, node_id, generation);
 }
 EXPORT_SYMBOL(fw_device_enable_phys_dma);
 
diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index d2b40a1a565e..fd6cbbf79d0b 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -144,8 +144,8 @@ struct fw_iso_context *__fw_iso_context_create(struct fw_card *card, int type, i
 {
 	struct fw_iso_context *ctx;
 
-	ctx = card->driver->allocate_iso_context(card, type, channel, header_size,
-						 header_storage_size);
+	ctx = smp_load_acquire(&card->driver)->allocate_iso_context(card, type, channel,
+							header_size, header_storage_size);
 	if (IS_ERR(ctx))
 		return ctx;
 
@@ -173,7 +173,9 @@ void fw_iso_context_destroy(struct fw_iso_context *ctx)
 	trace_isoc_inbound_single_destroy(ctx);
 	trace_isoc_inbound_multiple_destroy(ctx);
 
-	ctx->card->driver->free_iso_context(ctx);
+	struct fw_card *card = ctx->card;
+
+	smp_load_acquire(&card->driver)->free_iso_context(ctx);
 }
 EXPORT_SYMBOL(fw_iso_context_destroy);
 
@@ -184,7 +186,9 @@ int fw_iso_context_start(struct fw_iso_context *ctx,
 	trace_isoc_inbound_single_start(ctx, cycle, sync, tags);
 	trace_isoc_inbound_multiple_start(ctx, cycle, sync, tags);
 
-	return ctx->card->driver->start_iso(ctx, cycle, sync, tags);
+	struct fw_card *card = ctx->card;
+
+	return smp_load_acquire(&card->driver)->start_iso(ctx, cycle, sync, tags);
 }
 EXPORT_SYMBOL(fw_iso_context_start);
 
@@ -192,7 +196,9 @@ int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels)
 {
 	trace_isoc_inbound_multiple_channels(ctx, *channels);
 
-	return ctx->card->driver->set_iso_channels(ctx, channels);
+	struct fw_card *card = ctx->card;
+
+	return smp_load_acquire(&card->driver)->set_iso_channels(ctx, channels);
 }
 
 int fw_iso_context_queue(struct fw_iso_context *ctx,
@@ -204,7 +210,9 @@ int fw_iso_context_queue(struct fw_iso_context *ctx,
 	trace_isoc_inbound_single_queue(ctx, payload, packet);
 	trace_isoc_inbound_multiple_queue(ctx, payload, packet);
 
-	return ctx->card->driver->queue_iso(ctx, packet, buffer, payload);
+	struct fw_card *card = ctx->card;
+
+	return smp_load_acquire(&card->driver)->queue_iso(ctx, packet, buffer, payload);
 }
 EXPORT_SYMBOL(fw_iso_context_queue);
 
@@ -214,7 +222,9 @@ void fw_iso_context_queue_flush(struct fw_iso_context *ctx)
 	trace_isoc_inbound_single_flush(ctx);
 	trace_isoc_inbound_multiple_flush(ctx);
 
-	ctx->card->driver->flush_queue_iso(ctx);
+	struct fw_card *card = ctx->card;
+
+	smp_load_acquire(&card->driver)->flush_queue_iso(ctx);
 }
 EXPORT_SYMBOL(fw_iso_context_queue_flush);
 
@@ -248,7 +258,9 @@ int fw_iso_context_flush_completions(struct fw_iso_context *ctx)
 
 	disable_work_sync(&ctx->work);
 
-	err = ctx->card->driver->flush_iso_completions(ctx);
+	struct fw_card *card = ctx->card;
+
+	err = smp_load_acquire(&card->driver)->flush_iso_completions(ctx);
 
 	enable_work(&ctx->work);
 
@@ -270,7 +282,9 @@ int fw_iso_context_stop(struct fw_iso_context *ctx)
 	if (WARN_ON_ONCE(current_work() == &ctx->work))
 		return 0;
 
-	err = ctx->card->driver->stop_iso(ctx);
+	struct fw_card *card = ctx->card;
+
+	err = smp_load_acquire(&card->driver)->stop_iso(ctx);
 
 	cancel_work_sync(&ctx->work);
 
diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 48558857e726..c2050b23b7eb 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -129,7 +129,7 @@ __must_not_hold(&card->transactions.lock)
 
 	// Cancel the packet transmission if it's still queued. That will schedule the packet
 	// transmission callback which cancels the transaction.
-	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
+	if (smp_load_acquire(&card->driver)->cancel_packet(card, &transaction->packet) == 0)
 		return 0;
 
 	// If the request packet has already been sent, we need to see if the transaction is still
@@ -458,7 +458,7 @@ __must_not_hold(&card->transactions.lock)
 					      t->packet.header, payload,
 					      tcode_is_read_request(tcode) ? 0 : length / 4);
 
-	card->driver->send_request(card, &t->packet);
+	smp_load_acquire(&card->driver)->send_request(card, &t->packet);
 }
 EXPORT_SYMBOL_GPL(__fw_send_request);
 
@@ -555,7 +555,7 @@ void fw_send_phy_config(struct fw_card *card,
 	}
 
 	if (gap_count == FW_PHY_CONFIG_CURRENT_GAP_COUNT) {
-		gap_count = card->driver->read_phy_reg(card, 1);
+		gap_count = smp_load_acquire(&card->driver)->read_phy_reg(card, 1);
 		if (gap_count < 0)
 			return;
 
@@ -578,7 +578,7 @@ void fw_send_phy_config(struct fw_card *card,
 					  phy_config_packet.generation, phy_config_packet.header[1],
 					  phy_config_packet.header[2]);
 
-	card->driver->send_request(card, &phy_config_packet);
+	smp_load_acquire(&card->driver)->send_request(card, &phy_config_packet);
 	wait_for_completion_timeout(&phy_config_done, timeout);
 }
 
@@ -987,7 +987,7 @@ void fw_send_response(struct fw_card *card,
 					       request->response.header, data,
 					       data ? data_length / 4 : 0);
 
-	card->driver->send_response(card, &request->response);
+	smp_load_acquire(&card->driver)->send_response(card, &request->response);
 }
 EXPORT_SYMBOL(fw_send_response);
 
@@ -1238,7 +1238,7 @@ __must_not_hold(&card->transactions.lock)
 	 * The response handler may be executed while the request handler
 	 * is still pending.  Cancel the request handler.
 	 */
-	card->driver->cancel_packet(card, &t->packet);
+	smp_load_acquire(&card->driver)->cancel_packet(card, &t->packet);
 
 	invoke_callback(t, rcode, p->timestamp, data, data_length);
 }
@@ -1357,17 +1357,17 @@ static void handle_registers(struct fw_card *card, struct fw_request *request,
 	case CSR_BUS_TIME:
 	case CSR_BUSY_TIMEOUT:
 		if (tcode == TCODE_READ_QUADLET_REQUEST)
-			*data = cpu_to_be32(card->driver->read_csr(card, reg));
+			*data = cpu_to_be32(smp_load_acquire(&card->driver)->read_csr(card, reg));
 		else if (tcode == TCODE_WRITE_QUADLET_REQUEST)
-			card->driver->write_csr(card, reg, be32_to_cpu(*data));
+			smp_load_acquire(&card->driver)->write_csr(card, reg, be32_to_cpu(*data));
 		else
 			rcode = RCODE_TYPE_ERROR;
 		break;
 
 	case CSR_RESET_START:
 		if (tcode == TCODE_WRITE_QUADLET_REQUEST)
-			card->driver->write_csr(card, CSR_STATE_CLEAR,
-						CSR_STATE_BIT_ABDICATE);
+			smp_load_acquire(&card->driver)->write_csr(card, CSR_STATE_CLEAR,
+								   CSR_STATE_BIT_ABDICATE);
 		else
 			rcode = RCODE_TYPE_ERROR;
 		break;

base-commit: 82d59eb7f5431771cfc6fb074b74f466cd4e3353
-- 
2.53.0


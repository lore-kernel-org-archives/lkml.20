Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6314C10F9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330205; cv=none; b=vBPh0xKcWv07X1elS/NS3drKIF7gAUNwbon54T33/+Fj4CvE7yY+bahItF0KAm/s8WNZGCdq0TRWtYMBpeaST8hw4O5GWWIdu/vQ9+1eRRlZkF9p5ypVEDUPR24IoTb8ahjdYeWaIC4LvcSzGEEZA/ZE0fZcLNKIxE76J0/EzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330205; c=relaxed/simple;
	bh=0Cg1GP7kb1SoxcqQ5ayBy4LKgHULfEFWRPUFbfKSqIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKtWHU+csxX/7ITPg3eU55i0dPMxalIl/v+8etqrEvo8/4qLokYdJmulRfrTYRUWJ4pGd26Vszq8NhqTWPpI8oS10o3FhhlBJMVkpR2Q1qivMTFazdjtm0Mc4j6Mu6hDjmGuCXj3nD2kgNIL88VTpdf6b1a6xgC3j1BIBxlaeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=sEzqtTPf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CicVqFIA; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="sEzqtTPf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CicVqFIA"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 4ECF8EC0118
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:30:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 18 Oct 2026 09:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792330202; x=
	1792416602; bh=FPdhF9YXwtI+WprScynp0mrVNoZMbBJUUQ3vXDW43WY=; b=s
	EzqtTPf7tUI4UiZwxLF34J3lC08/COZMq9epVj78FXe/7qN5f10ywBpnXDcwDnnp
	1e0wYz7FAl0IFdpRWmc0GDf+uIIpivkR6n3TA73ckafRcH+5pUG9ZypUHIXyOjBc
	wNlCe35X/TH0YY8veaMmpuQyuHoC/jxXVrcy+DgWKOLnnytVp3Z72o0VLEm64Tx8
	B+m74Dni3htc41VjI4cQBM34G+DmhxkRva0EFdi29R8jQrsMOGtgDbiPzEdxra83
	qNXORo1V5GTej76/PXmvxRz0kHtOucSbHHXmFGGenGa1ZPTD/P6J0gje6rfedMvx
	i18km897eIrY33x0gVAoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792330202; x=1792416602; bh=F
	PdhF9YXwtI+WprScynp0mrVNoZMbBJUUQ3vXDW43WY=; b=CicVqFIAlMLM4a9g3
	BXRI0uPxYfZ8clH89IGTWoZYKjxtF9Lx9Fr8r0+KSNehRZQS9cOxDlnKmcZEfNad
	W/qfl9kR6CMZk0CLlbYLOUo2o0rAaVUH7HADvAyKzJ/U+qyLzAxxaGCHnqeGkKZk
	ImsgK/whFPS/NQafzPlE/P4lJHPs/expDuXfG7KcULJZRtA0YVM3GjtmRXbQ9Oh0
	3rzdWEzcUyMFG3a4Ey96Picsrpl9jrRhnRvYBuY2WLf/SsU7Vh2L4H/UwFfvSg24
	2TmM7EVoIYKpfgXI5Np0O2OvUKb3yNilDIrHD0uI0AVqhqXawXIhP16QN5gji+aV
	N/a2g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792330202; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ZEQpX7RwSSXc0xFxSKQeA6oyl4HAy9xe+a+ljqIEIAWMK1r
	mfEO1c0AZQ6EtWDgr+fA4P3yBe4KexTb05uf1ZaQWqURjxZ1/H1Tvz/UQ8Js1fZS
	qhfW+RgXi48GDg7KhIdAx9pAHzZUJjRaviLcUhGA4KogHaU7w7lKFjaGczceaDb1
	n0QCoLimKTf7Zd+TXIm4xLPUnA6evkACwL5F5QJ2WoUHcYHLSz7UxvqpAq9nYpbT
	KAAwwe5n1yp90nK1gYoD1GQGBT7g2midhrMapTnMf/HvHKfXiUG3JdwxChmC0AEo
	ANQ2FnP1rEPoi3JhjmkLN1H7Nt4O3E5DtUR2T/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oZrynXTq3THszUZQ3rHAN4zZhF+hZ5DV/VsU8WhMoFc=:0Cg1GP7kb1SoxcqQ5ayBy4LKgHULfEFWRPUFbfKSqIU=;
X-ME-Sender: <xms:2snUak2VAsb1mbGjVk0NWoF_XOUZco142PFmCy9Mef7iYC6Dka328Q>
    <xme:2snUatAIEzIefEsNaF4PVzsmlIAea4ftcH4nexU-h1wBiEGxrWW88PBxkTgmlPW65
    rChMZysr5OLGduw1grALu0D0KjP-o4XBWJp4okT_h6wWunqH7PHPt_HuA>
X-ME-Received: <xmr:2snUakcejNUptqCREplXzW_1VMySHANdF3VLw27nSf9HfDPaNcZk-gb7fvZ0PblirUDZpOfq5ioaK9ksS26Wa0seTeHsuOgkK1xcBnlqUn2j>
X-ME-Proxy-Cause: dmFkZTFuVtQfZijF06Q5pTDla1VOBZPLPgOwTxkWh5hEBbqIlfpEg6UG5yJBRwl+R8AFld
    2gou1CayE3O/XCQA8d13Px96m3MgSvYVwWcPvZmFToHdwhgRUStaGhm3D6ESRXyrbaLfQU
    alVB3w7PTntvTPviZdZYnmr8iqH02LNToTACTnoJgIKb4rnJMi2ozxgdmuga1ypMHzdPNH
    upYbIQ1bigC0eormcjIkK+qGUuQs4rmA/Q/l7ljxE1Sd/LU7mW2ovMiZFNsnvjwdLX2A2v
    H7HFxltDx74js+D0bBBCE8uhVBMlNBY4zHsJF3pqp9S1+b4s/FOb30WSFyCFh5MHx9gubD
    y3TtzVpkQs+YGmviy/HGfKWA22HGxYagDvQ+c4P1EgnEwzfPYHFBMuiBgaFoQlmtc33uzb
    W8rfo+rtWdPhS0ncMm+0NaAFcKoRGHx5vJjXeDbP4osqN7+HoGfsskMKWJv6uusC/VSGhG
    3066sum9J7mQNK6qChbLDumLh/DgfgErPl+UD7/VqVSe5QPiafsJ2lLUUW31mqw08vvScQ
    BsWkk4qFMvdYbAsBOgyy/96XLptjgsSktC+UWtM+5ylLiJL991xhWLirrKjGbswwHSXiMV
    wvswGOHlCVeKJ+WqUKF5vw2dXHgmjdnUGNzAwo1eTVLKh6QPL+vJ1zPY6Ujg
X-ME-Proxy: <xmx:2snUaqiZ6OidVtKJcfOio8-uERnUfUCNFDbx3qIYj_607tFGr0Ujjg>
    <xmx:2snUakoPi1eNowdqlBqGg5XT26CfN_MF1wCYSC6bWLGPmxwoNCM6IQ>
    <xmx:2snUaiH2-ysNznlm3mw3JhRmN2HVw9iI0u8ZSke-asFZqisglntQcQ>
    <xmx:2snUaml6U9IRgL_5Cmfl6KoOrqG3-RMMUqlc-wuebUtbV0-_B7_a0A>
    <xmx:2snUahIMCQgmH7NdcYYaZgp2rV0tKmsX5Bl1-6PlaT5Za9bSmbbZkXUp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 09:30:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] firewire: core: invoke packet callback from workqueue when removing card instance
Date: Sun, 18 Oct 2026 22:29:55 +0900
Message-ID: <20261018132955.391090-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
References: <20261018132955.391090-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation switches the underlying driver of a card instance
to the dummy driver in the kernel stack when removing the card. The dummy
driver simply invokes callbacks when sending request and response
packets.

Recent changes for the 1394 OHCI driver and core transaction layer ensure
that callbacks are invoked in process context from a workqueue. This
guarantees a consistent execution context for callbacks. However, card
removel is currently an exception.

Invoke packet callbacks from a workqueue during card removal.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 86 +++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 26 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index 83be100a1f4b..6dd88001f751 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -689,6 +689,15 @@ EXPORT_SYMBOL(fw_card_add);
  * .set_config_rom() is never called since the card is taken out of card_list
  * before switching to the dummy driver.
  */
+struct fw_card_driver_closer {
+	const struct fw_card_driver driver;
+
+	// For shutdown operations.
+	struct fw_card *card;
+	struct list_head packet_list;
+	spinlock_t packet_list_lock;
+	struct work_struct work;
+};
 
 static int dummy_read_phy_reg(struct fw_card *card, int address)
 {
@@ -701,14 +710,31 @@ static int dummy_update_phy_reg(struct fw_card *card, int address,
 	return -ENODEV;
 }
 
-static void dummy_send_request(struct fw_card *card, struct fw_packet *packet)
+static void dummy_packet_callback_work(struct work_struct *work)
 {
-	packet->callback(packet, card, RCODE_CANCELLED);
+	struct fw_card_driver_closer *closer = container_of(work, typeof(*closer), work);
+	unsigned long flags;
+	struct fw_packet *p;
+
+	spin_lock_irqsave(&closer->packet_list_lock, flags);
+	while ((p = list_first_entry_or_null(&closer->packet_list, typeof(*p), link_for_local))) {
+		list_del(&p->link_for_local);
+		spin_unlock_irqrestore(&closer->packet_list_lock, flags);
+
+		p->callback(p, closer->card, RCODE_CANCELLED);
+
+		spin_lock_irqsave(&closer->packet_list_lock, flags);
+	}
+	spin_unlock_irqrestore(&closer->packet_list_lock, flags);
 }
 
-static void dummy_send_response(struct fw_card *card, struct fw_packet *packet)
+static void dummy_schedule_packet_callback(struct fw_card *card, struct fw_packet *packet)
 {
-	packet->callback(packet, card, RCODE_CANCELLED);
+	struct fw_card_driver_closer *closer = container_of(card->driver, typeof(*closer), driver);
+
+	scoped_guard(spinlock_irqsave, &closer->packet_list_lock)
+		list_add_tail(&packet->link_for_local, &closer->packet_list);
+	queue_work(card->async_wq, &closer->work);
 }
 
 static int dummy_cancel_packet(struct fw_card *card, struct fw_packet *packet)
@@ -773,27 +799,30 @@ EXPORT_SYMBOL_GPL(fw_card_release);
 
 void fw_core_remove_card(struct fw_card *card)
 {
-	// Switch off most of the card driver interface.
-	const struct fw_card_driver dummy_driver = {
-		.enable			= NULL,
-		.disable		= card->driver->disable,
-		.read_phy_reg		= dummy_read_phy_reg,
-		.update_phy_reg		= dummy_update_phy_reg,
-		.set_config_rom		= NULL,
-		.send_request		= dummy_send_request,
-		.send_response		= dummy_send_response,
-		.cancel_packet		= dummy_cancel_packet,
-		.enable_phys_dma	= dummy_enable_phys_dma,
-		.read_csr		= dummy_read_csr,
-		.write_csr		= dummy_write_csr,
-		.allocate_iso_context	= dummy_allocate_iso_context,
-		.free_iso_context	= card->driver->free_iso_context,
-		.start_iso		= dummy_start_iso,
-		.set_iso_channels	= dummy_set_iso_channels,
-		.queue_iso		= dummy_queue_iso,
-		.flush_queue_iso	= dummy_flush_queue_iso,
-		.flush_iso_completions	= dummy_flush_iso_completions,
-		.stop_iso		= card->driver->stop_iso,
+	struct fw_card_driver_closer closer = {
+		// Switch off most of the card driver interface.
+		.driver = {
+			.enable			= NULL,
+			.disable		= card->driver->disable,
+			.read_phy_reg		= dummy_read_phy_reg,
+			.update_phy_reg		= dummy_update_phy_reg,
+			.set_config_rom		= NULL,
+			.send_request		= dummy_schedule_packet_callback,
+			.send_response		= dummy_schedule_packet_callback,
+			.cancel_packet		= dummy_cancel_packet,
+			.enable_phys_dma	= dummy_enable_phys_dma,
+			.read_csr		= dummy_read_csr,
+			.write_csr		= dummy_write_csr,
+			.allocate_iso_context	= dummy_allocate_iso_context,
+			.free_iso_context	= card->driver->free_iso_context,
+			.start_iso		= dummy_start_iso,
+			.set_iso_channels	= dummy_set_iso_channels,
+			.queue_iso		= dummy_queue_iso,
+			.flush_queue_iso	= dummy_flush_queue_iso,
+			.flush_iso_completions	= dummy_flush_iso_completions,
+			.stop_iso		= card->driver->stop_iso,
+		},
+		.card = card,
 	};
 
 	might_sleep();
@@ -805,8 +834,12 @@ void fw_core_remove_card(struct fw_card *card)
 	scoped_guard(mutex, &card_mutex)
 		list_del_init(&card->link);
 
+	INIT_LIST_HEAD(&closer.packet_list);
+	spin_lock_init(&closer.packet_list_lock);
+	INIT_WORK(&closer.work, dummy_packet_callback_work);
+
 	// Ensure the entire contents of the driver are visible to other CPUs.
-	smp_store_release(&card->driver, &dummy_driver);
+	smp_store_release(&card->driver, &closer.driver);
 
 	drain_workqueue(card->isoc_wq);
 	drain_workqueue(card->async_wq);
@@ -825,6 +858,7 @@ void fw_core_remove_card(struct fw_card *card)
 	destroy_workqueue(card->isoc_wq);
 	destroy_workqueue(card->async_wq);
 
+	WARN_ON(!list_empty(&closer.packet_list));
 	WARN_ON(!list_empty(&card->transactions.list));
 }
 EXPORT_SYMBOL(fw_core_remove_card);
-- 
2.53.0


Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810B4756DF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159198; cv=none; b=lXPhRYeCiKCxrEJoAjDlWPofceuUkxH7iXTEDltbmHCJWktZ7PnM2lSRsI0CyAeEskM/gbc7AaG58AJZXEsL9NKzijjU1ZNoKTOst+qW1jnQfKTQk/G8zTEprVWgsMefyycutRwikh5AWD4/fY98cVV0sCYdDtJvbYFJf0S14G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159198; c=relaxed/simple;
	bh=Y+JRhxf+t1+giLUhjsuzR3Vgd4cOaEzcBSqbm/PM+UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUsrrbpOnzkvy+eZKL+yGXd5FsNSmcSnwuMC3MiRjyq7yws+aH1gjWSlaWNuw3V1oEfUqs0/q1R4/bCy35S+N/M5G/CpH3xhKlhKJhB9N5mgL1U5AOQ7D7DpLXj9TjIzLIQ6VIkpjMzRYk4LwxZICEKGn67LFSG5Pexup1SVD88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=vZ8fmPXz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AkDg98Aj; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="vZ8fmPXz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AkDg98Aj"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 799D71D00111
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:59:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 16 Oct 2026 09:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1792159192; x=1792245592; bh=i0vVjAcXvk
	JCXYxLgfrfZrdi9/GRG+My+XE+PzXTx+A=; b=vZ8fmPXzEg94URKlUkxL8RAgt2
	/JinrGRDFBCUfxnBdUGJIF3kjKcDYNkCdu6wpw05PDZWN5ElqfIplHfASwD28C1X
	5GU30d/MxP6izSiOjTqDc5l2WPTWE8KEjyqBcRUFTK7lrsayBh0H9f7pQ+bCqpGC
	IFnz18Uld6bkdZsN2o+9NYMyIueIE3lETDJdTSmJ/MiAKpZ7VFw/ys9wzIdW5QEv
	rharGe+c4k9a9K+e0xLQ6JVcM9p7nTfu3DWzAN6/pDKlKnFT5JqegIOdpHF3bAas
	Nq9dBpKWVK5iDHS8NG73spB+mQuiyG6pC/Zr+v2JZ4O6qsRMwPvDanSR/BsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792159192; x=1792245592; bh=i0vVjAcXvkJCXYxLgfrfZrdi9/GRG+My+XE
	+PzXTx+A=; b=AkDg98AjN2ReFNkD1uxc00kXfDo6W27URS+SbFi9FEz8Ej9CmWp
	Das/0rIGWoA9frwzaOsYa7f6NHcPPhYorq3Jfwk8dftQYBPCtxdlWwvpQ5uLUpzh
	DD3GfJt8ACZMgCP8fmxqwlETmQn2XvC28b5hhygFSbvNJ6qhcVXYEPcbGh8ox2p/
	nRvFsVk5eFS1cV9bKV3XwyFQsM2gh3tMHBAwqTRZ5jrSItH2mf07OW7jm2xdxTfi
	Ah0FWFNXgUN70x9+V/hlvcDfBGtMOf/zVvMyh8uC57e0Eod7BwuzsLI8AGI5t6E9
	iBuuZMAUo/V9aNOzW9oR+HUQ/5sVSi5F0Tw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792159192; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:uAJuMv1QIy3sbxw3aJhKhYAPIOTQPzOSEy4mrDusliNyo4u
	9+22ExlrWsWR1Ai+qpRXVLp4zC8Tm9hbyBBLJsFwa7pMlToYJuJ8U0yeZLX/GdXD
	7TuRIWNW8NfE95pYRQYKhZf2XM8xpogWgIbLbFu0Fl7ydPFx4y5AqydeTqygQZyq
	Xtb4mnk9ur/S4DXY9Z514Qd3sQAEBpCjCCuB/4cmFnhGRiG+sMaIK17+sOzU5dRM
	trNRTfQ1Vo58JbipOfOKxlYZq0GyatzsDspOYyAXqDa70i11JpQ5a3AlWQwiDp1l
	gwQRa5mzdnvWZoyBWiJf1HSSKNqXLRhLg9VhYOQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:4F3r2jBwk7MWQE47+DEqL6w990gy/6cu8YVyxQEBOzo=:Y+JRhxf+t1+giLUhjsuzR3Vgd4cOaEzcBSqbm/PM+UQ=;
X-ME-Sender: <xms:2C3Sarco3gNFI7TmopdMM_M4-51A2L7gosNjjeNn70C6G9dOLPwADg>
    <xme:2C3SavIIuqDt-rdCULqy44Pbnm70Y_-h_y36xbhN8AUum_TjpvYlCL055CN5w6gKs
    _sgh9Ig3qr56ucQtxS4CExokBy0isG7yrMPN8QloUCgAxiUc5-_1UIM>
X-ME-Received: <xmr:2C3SasG4HZgPJd41kIfpuphTbqZYf5ilmgYGa8QwfT-US1-_gIFJlPH8lG-q8X2oY61qnZNHN3a75g4lz_KMOJB-gfIfyyRO4xJC23JFVpss_A>
X-ME-Proxy-Cause: dmFkZTFYcriJzN3Z2c+FJEGGRytlgbhK9YddTzBlauZb1fXJggI7gQ1n1Tbl55D5aE46Dn
    tdyBpX/ApEetCKz5Y7Tx7DV/itnoZm+kR7QgibeGwASuJQ/3EzVvDRndGC2DwXa8U8KWyo
    W1VOE4BQn6K3kZ0+eopaVrnBsCqfiZg3xhCT8yIslW065XTRqWfn8LVEfFRBMxNFoAyv30
    G9sBdZh/0gJSulNcnq4R3CP+5zjtk84S33J7vMbGftgN55rBoibHskaUYWqOZi18gpiX+M
    2zkKZS5Ktusfou556ijEYIFz/0EGi8tejz+hKw1abDQRsH2L1ADrfcyl2aR0IwGXzFJbdE
    JPOp1iVNO/ZYfKOY9uD6KZhl0rpMOj13BdGyhVMAf01dbTKh4dTIOST9OmSYg8ariRwqJA
    he7s/jnqKBKbtnQRR+20wr9GpqeYPFYieeodVEAgR7L71urofulE6LefJCtOKhwKRlIlf5
    wO03kn92fg2pO99EI2BbU9amMgqAfbGuCtQpDtPqdCzWfrSxXm3luFpcoSwaDaDJLke3Z3
    opMuj6W5NfsXqr3aKDOCWavauKqSXvNNluE/lZau0PyOKWj+ZpCFi0DLlZa0hFEeVoLk4s
    5K07g9uxp1F7uq+eT58ogqC41V9Qs4wU54i37Y+MzyY8kxwFEU7PFx2ZPgGQ
X-ME-Proxy: <xmx:2C3Sapr7KMbnKvbOjVjQFCChDkkH3XVzffI9gxluamtM_UJIlImyCA>
    <xmx:2C3SalQvDIsvJzzMIEJvkLFqFM4xHlpvYpssCDnqg3P2PXa0NUxWdg>
    <xmx:2C3SamOW91FkQ3hVlyp24483YXGRRUPh1CzJ9cQ11YtMU5tdChmD2A>
    <xmx:2C3SaoMCSglOzIy81A2r-VSVZIAb2QrJQcmeAsbyenGnCLYJ6eUKgQ>
    <xmx:2C3SakweNQ14uUAkVXzWLQJP_KSaVZzsfQzDXEbZr2yUqnZ-VOhbjQZt>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 09:59:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: invoke packet callback from workqueue when removing card instance
Date: Fri, 16 Oct 2026 22:59:48 +0900
Message-ID: <20261016135948.85343-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
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
 drivers/firewire/core-card.c | 57 +++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index be6f18d67ece..a26b5e380c6c 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -688,6 +688,15 @@ EXPORT_SYMBOL(fw_card_add);
  * .set_config_rom() is never called since the card is taken out of card_list
  * before switching to the dummy driver.
  */
+struct fw_card_driver_closer {
+	struct fw_card_driver driver;
+
+	// For closing operations.
+	struct fw_card *card;
+	struct list_head packet_list;
+	spinlock_t packet_list_lock;
+	struct work_struct work;
+};
 
 static int dummy_read_phy_reg(struct fw_card *card, int address)
 {
@@ -700,14 +709,39 @@ static int dummy_update_phy_reg(struct fw_card *card, int address,
 	return -ENODEV;
 }
 
+static void dummy_packet_callback_work(struct work_struct *work)
+{
+	struct fw_card_driver_closer *closer = container_of(work, typeof(*closer), work);
+	struct fw_packet *p;
+
+	spin_lock(&closer->packet_list_lock);
+	while ((p = list_first_entry_or_null(&closer->packet_list, typeof(*p), link_for_local))) {
+		list_del(&p->link_for_local);
+		spin_unlock(&closer->packet_list_lock);
+
+		p->callback(p, closer->card, RCODE_CANCELLED);
+
+		spin_lock(&closer->packet_list_lock);
+	}
+	spin_unlock(&closer->packet_list_lock);
+}
+
 static void dummy_send_request(struct fw_card *card, struct fw_packet *packet)
 {
-	packet->callback(packet, card, RCODE_CANCELLED);
+	struct fw_card_driver_closer *closer = container_of(card->driver, typeof(*closer), driver);
+
+	scoped_guard(spinlock_irqsave, &closer->packet_list_lock)
+		list_add_tail(&packet->link_for_local, &closer->packet_list);
+	queue_work(card->async_wq, &closer->work);
 }
 
 static void dummy_send_response(struct fw_card *card, struct fw_packet *packet)
 {
-	packet->callback(packet, card, RCODE_CANCELLED);
+	struct fw_card_driver_closer *closer = container_of(card->driver, typeof(*closer), driver);
+
+	scoped_guard(spinlock_irqsave, &closer->packet_list_lock)
+		list_add_tail(&packet->link_for_local, &closer->packet_list);
+	queue_work(card->async_wq, &closer->work);
 }
 
 static int dummy_cancel_packet(struct fw_card *card, struct fw_packet *packet)
@@ -789,7 +823,7 @@ EXPORT_SYMBOL_GPL(fw_card_release);
 
 void fw_core_remove_card(struct fw_card *card)
 {
-	struct fw_card_driver dummy_driver = dummy_driver_template;
+	struct fw_card_driver_closer closer;
 
 	might_sleep();
 
@@ -800,11 +834,17 @@ void fw_core_remove_card(struct fw_card *card)
 	scoped_guard(mutex, &card_mutex)
 		list_del_init(&card->link);
 
-	/* Switch off most of the card driver interface. */
-	dummy_driver.free_iso_context	= card->driver->free_iso_context;
-	dummy_driver.stop_iso		= card->driver->stop_iso;
-	dummy_driver.disable		= card->driver->disable;
-	card->driver = &dummy_driver;
+	closer.card = card;
+	INIT_LIST_HEAD(&closer.packet_list);
+	spin_lock_init(&closer.packet_list_lock);
+	INIT_WORK(&closer.work, dummy_packet_callback_work);
+
+	// Switch off most of the card driver interface.
+	closer.driver = dummy_driver_template;
+	closer.driver.free_iso_context	= card->driver->free_iso_context;
+	closer.driver.stop_iso = card->driver->stop_iso;
+	closer.driver.disable = card->driver->disable;
+	card->driver = &closer.driver;
 
 	drain_workqueue(card->isoc_wq);
 	drain_workqueue(card->async_wq);
@@ -821,6 +861,7 @@ void fw_core_remove_card(struct fw_card *card)
 	destroy_workqueue(card->isoc_wq);
 	destroy_workqueue(card->async_wq);
 
+	WARN_ON(!list_empty(&closer.packet_list));
 	WARN_ON(!list_empty(&card->transactions.list));
 }
 EXPORT_SYMBOL(fw_core_remove_card);

base-commit: 82d59eb7f5431771cfc6fb074b74f466cd4e3353
-- 
2.53.0


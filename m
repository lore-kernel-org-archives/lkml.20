Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3D2E401
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199554; cv=none; b=T9jKi/E4MznMAtVSJsldvB4oS0ZhY/JrWt6EB7GZpeMQ6ldq8RBTncriY1WlxONHhkJO5R7V+VfnfjRt2U/tYs1Lwl3QUvQ/gtoFPneKQkcD0wFnk73tZqnYmy2kTY7OuxKLgLkCkkQct0/3rJjL/HRCKGKWq5yiMo+LOCKsJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199554; c=relaxed/simple;
	bh=HbxrwP93Aidgl4mkQw7WRkFObdcy7Bf9JJRhdtd5/JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFe0ehpoPS32NqksaTWgPDpBSuyy155YQSzmI6/IWNDzAwQK5S7oaoUD2Xb2BoioqDH25etVoGUBchDlg0ibr+UgzFxTiKWUHV+cCYD+UMiltDM2g82qf5ow4cu9IJfxwjNFSIyNiKijKJZ6TzyZRtdbiC3hFWTa9Ir8cWgJcvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=UBCF3c81; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MQdeDqvB; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="UBCF3c81";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MQdeDqvB"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E365F7A012E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 05 Oct 2026 07:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791199551; x=
	1791285951; bh=m1idz6u9sZFJgDJS9dvcdpkc6WMUXs5h4WhTY1p0fGI=; b=U
	BCF3c81dgOGVq+c2eWbUvXjzmYHxwQT0XP56JgxOvYHr3kyo1Hz4w5elSj5MxcUy
	jAQt4TuvEcYHMDhl/Z925IvS13NR/Utni/a9jXMBLD9APpJzVMB+XzNlWYh9xVEY
	FDkAp2TxcWH82ZP7yhrNjkaZotAmgXnReH4fxmvy7hvfiBFZgq1pUl5qySeF9Ny8
	QYD/Irl4ZOJfkK7bDTdRHrcgIvJmY+rg4AoONQz7KbkDwRo04Kww3vKkqyummm3a
	SuHcs5jtHU9rnZC4WNmoEoKEj6wFwMhIyw0D5RilgRcNVizQlvNOOpMzwUzsm3+c
	BSP1l9R09GF5pWKBoMZmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791199551; x=1791285951; bh=m
	1idz6u9sZFJgDJS9dvcdpkc6WMUXs5h4WhTY1p0fGI=; b=MQdeDqvBy823bi25M
	6onqk4TXBT+ZBVkdMzXgtNBm0x/k+MPR/1anKI7RaEVcCmDNKkm6kR95qxTA775F
	yWo1l2pZVEgjIN/KA3xwsiopsDkmDiewPT3PLN5yhBSp1TRbw7vncKoq24RiWjo/
	5f7tpNQol93P2lmrvOb+BIo4OKT24d5T2T7epiW3c5WZQioj5gemgB8UvgFC2qS9
	/wuQo+cygTWmSNhI3pZrLo05X/g6CiUvBQ4qj5KkM4G//fnd1fMN2N4Bu4FGKAMe
	zE44+udARg7UbPYyuAJ77oMwhlCkl4V+1Jh++uFfIaMSLZsEirY1BUzZk5xwYbB2
	a43JA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199551; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:RomVG0sShqG9I5fFUBZnyTfb4aUunMOwakYKktlIESK64TP
	LTDp4ruaFE0GhFiJSfj+hncBao0CcsNuv+107q8MQ0IR5lwkPsUc71YYFJ+sPTVp
	JZAklaIUfxizPneG+tjBDmWUEUOkqvRqSinFtD/YT6sTNAVZurhhUquykxNAQRiQ
	9W7pn+7ToYoaV5Ducw/TAHFUwNDqnokB4iXkWof2OgBoWkuJ7Ul9kri6surNvLXq
	HNSUa59DBrioB0JoSMgVEAC6qCCFWLP9KODSc/m32ueeZuAy57oUoz7fjBSoCQan
	kvmifycfG0uo43daYxypfjNW/Rg+4UrD1b2BLOw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SMN7WeEdErdYqs7hgLGE/nO5lnJg01FFD84EZZ6B0zY=:HbxrwP93Aidgl4mkQw7WRkFObdcy7Bf9JJRhdtd5/JY=;
X-ME-Sender: <xms:P4nDam87mKAE_nYYlWktyWOF0tbYg0o1CBSWJCD3VAzI_dS9s5MgTg>
    <xme:P4nDakpRZVrVXJd8jFDI1fz4Gyo_tg-YevudeEuu_n7vCIBpM0FoCpe76ccPcpSTv
    A4JZm5sxOQvsANXd3fcYNDY7pbbCsDDJUTROiSNbUBwJn8gqRBc3s8>
X-ME-Received: <xmr:P4nDajmWKoobGJ8HNavplAgm9rHQsGskODFHnq6EqO8buKMXiQacHtTeQRc6om_ly8Mj0whfII-RjDSR77_r1wZHe3NxN5iVPUXpZoPx7-jdJQ>
X-ME-Proxy-Cause: dmFkZTErW16n30fVOtPPKC913JUt9GtZq5ToHZiOV9Th707EXjbLQ2FLorcrI3mzg5bsvt
    8jbaAQj4pwvoFJgMx4ngv6a5ZJblcfZBs6sWqUTOuNB+90edONGxhjfJD9ir3wPndtsQan
    mG0R7qJWxsifFFGXCXy1EJtw1nueGbYhSjPB3M/1YXjlWeq/9JvZU3vlqPPxSXD+o44WeN
    6pC3VmnbghbpVI5XtNDz3PxzYg1ZY7zDM43WoooJ6NahllBDpvbrsU/89zrT25KWFWuUxa
    OHo9GHH/nOJVAnpMCZIdtuKFFrQ5t8C2vjD5hAHjkjLoTJcA/InDdm3PFXOmg3HAnWzNby
    QU9Lc2DFOLWfWEAY7jOo/kkG0ng+WUHfM7Z5lePsI4KlLOV3QJImE3jAp06ta4nX6GRJta
    U1p+jvPwh4JkssGvhsXletS93uwgt2Z+8k83FA7hqrC5nDF9w7kWx8mzmG7RwxaQ+Q+dj0
    S7J6vPAcUafdxx0hk/VxD3YCUKc6Mn0SKp0ovLe9nZXC5ViFYFHG8PzCj4Qo5qx7QChQF/
    XunlPKgJLwW2b59ETHGtlKZ2KBF1fZHRH0odi0HHkHnrlLPc2JNY7taaPEUZ4wSzjonGjE
    JdUdIm0GqKt5JUamY+Eq7tAxb8NgFRB3hakwB85XwGj4QN9MABIwWrarye0w
X-ME-Proxy: <xmx:P4nDarIXPZ8pHtLOUwfbSevVpsuFGuTHkX1UDqNvLuthzf1sPlFI7g>
    <xmx:P4nDaoy1-b9EFRaXOsorf4OqX7VLk87Ouel7q3LUUt2O8aL0j1ptuQ>
    <xmx:P4nDajsMUI3mYCYQIHMR-xfaz2doXyx4s5RTa7M-8I3fpmYbHIaL4g>
    <xmx:P4nDans_9LoPu3NZP8UYhIWO6y7FRwt26zZf5z98oMVrh9WyqHoKXw>
    <xmx:P4nDasRA0Q4Lk90cziQ7sKKuKqQFk0M1xdI3QjPGDz5KZFyxtR2QeCUh>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] firewire: ohci: schedule callback on workqueue when cancelling AT request packet
Date: Mon,  5 Oct 2026 20:25:41 +0900
Message-ID: <20261005112544.240552-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
References: <20261005112544.240552-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation invokes the packet callback in the context
where the packet cancellation is requested. This is inconvenient because
the context can affect the packet callback.

Invoke the packet callback from a workqueue instead. Use the workqueue
for local AT packets.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c |  8 ++----
 drivers/firewire/ohci.c             | 43 ++++++++++++++++++++---------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 35f3a11ab2bb..8c30a476f9fd 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -108,12 +108,8 @@ int fw_cancel_transaction(struct fw_card *card,
 {
 	u32 tstamp;
 
-	/*
-	 * Cancel the packet transmission if it's still queued.  That
-	 * will call the packet transmission callback which cancels
-	 * the transaction.
-	 */
-
+	// Cancel the packet transmission if it's still queued. That will schedule the packet
+	// transmission callback which cancels the transaction.
 	if (card->driver->cancel_packet(card, &transaction->packet) == 0)
 		return 0;
 
diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index df53efec0b0a..896d0cb9a895 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1669,6 +1669,9 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 	struct fw_ohci *ohci = ctx->context.ohci;
 	bool use_work = true;
 
+	// These members are used to cancel the packet.
+	packet->driver_data = NULL;
+
 	scoped_guard(spinlock_irqsave, &ohci->lock) {
 		if (!destination_is_local(packet, ohci)) {
 			if (!at_context_queue_packet(ctx, packet))
@@ -2652,7 +2655,7 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 {
 	struct fw_ohci *ohci = fw_ohci(card);
 	struct at_context *ctx = &ohci->at_request_ctx;
-	struct driver_data *driver_data = packet->driver_data;
+	struct at_local *local = &ohci->at_request_local;
 	int ret = -ENOENT;
 
 	// Avoid dead lock due to programming mistake.
@@ -2660,24 +2663,38 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 		return 0;
 	disable_work_sync(&ctx->work);
 
-	if (packet->ack != 0)
-		goto out;
+	bool use_local_work = false;
 
-	if (packet->payload_mapped)
-		dma_unmap_single(ohci->card.device, packet->payload_bus,
-				 packet->payload_length, DMA_TO_DEVICE);
+	if (!packet->ack) {
+		// NOTE: This function relies on this value, thus it is not thread-safe.
+		struct driver_data *driver_data = packet->driver_data;
 
-	driver_data->packet = NULL;
-	packet->ack = RCODE_CANCELLED;
+		if (driver_data) {
+			if (packet->payload_mapped) {
+				dma_unmap_single(ohci->card.device, packet->payload_bus,
+						 packet->payload_length, DMA_TO_DEVICE);
+			}
 
-	// Timestamping on behalf of the hardware.
-	packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
+			// Invalidate the packet queued in AT request context.
+			driver_data->packet = NULL;
+
+			scoped_guard(spinlock_irqsave, &local->lock)
+				list_add_tail(&packet->link_for_local, &local->list);
+			use_local_work = true;
+		}
+	}
 
-	packet->callback(packet, &ohci->card, packet->ack);
-	ret = 0;
- out:
 	enable_and_queue_work(card->async_wq, &ctx->work);
 
+	if (use_local_work) {
+		// Timestamping on behalf of the hardware.
+		packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
+		packet->ack = RCODE_CANCELLED;
+		queue_work(card->async_wq, &local->work);
+
+		ret = 0;
+	}
+
 	return ret;
 }
 
-- 
2.53.0


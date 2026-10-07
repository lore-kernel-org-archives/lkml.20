Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4E386C25
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365578; cv=none; b=kWC+kEAMrBNAxeZ5wsIZY35L6sRIZRNbddEc+dTdUgHW77c8KURqwkN6VloaEPdvEZTrlopimxVjRmhAWyrs0KWWAvr3Lp80L/a7MRssENIfeQ8N5vVqxMJRcjmt9f0KpqGjArygpofJC+DIqeYeoE0Bdog++XerH1hsGv6SrbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365578; c=relaxed/simple;
	bh=YrnTienYW7UUHtcvtY04TV1viY/3EysGS8vE42JoxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvkmVhrj4uTuYLJBHvqh0q9Wtbcj/nFOMiSTzNCoRq56k1XNKXDjvxz/ZRmBmx4Z/T89I3nbr+0o3JVc7ylWWPG8bUdi6h9B8Zigr1dbw41xvRCRANmQ93Ill3dtFxaSftjxViGZaeAFD0fCgqXG0e3YPJPZPnQhw3LnSXwVu88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KQHOabaJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dId6hOOc; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KQHOabaJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dId6hOOc"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E17587A00EE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 07 Oct 2026 05:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791365563; x=
	1791451963; bh=cNHPL10LWCURFamb8oZ/7wSdq2aScho+XD7OFdI10p4=; b=K
	QHOabaJCyFAMncQEldDcnShza6ue4dyBRplGCHj12p6TVRCGamkkl2wIxJjnD+/v
	9++f+htQaRkn7d7VeEUXmQrTILrj5emtuJ0/nQMGJuOx9iabATQCNl0rNe+QqMVj
	UryG7AKy023P8GeqOJKEGSa7f/VdAbefc6MQIcshpLnV1Dt40ptx8h+zOUPz+9fX
	cp1hRcPq/LPmj0wgEJWS08EcuzNvzRYkMjRyLWQSJfAOVlj4eTGNF1y3c0WE2tyV
	mNE6wp6clZO/4D1f1Kuwf6jrArVeRUSlUpGW2Cskn39Z6DHV6Gdqkc9EwG+del1s
	iOWvJlP8RWcd9YBH21+Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791365563; x=1791451963; bh=c
	NHPL10LWCURFamb8oZ/7wSdq2aScho+XD7OFdI10p4=; b=dId6hOOc29HK0dArH
	fIvSSYAam8hEvmoLqb0pTkzQ/MGEHMMTn0U72KrnzDkPYaI3hZJTqKSHD8gWjZFt
	apB3b5O+QmtGfQEkg6IKCNGj7XAb6KtvHNE/K3uvcSVWvLgPQVq/ixrtbOhhCVKb
	kqOKtYMprXHnRY0UYfhkpsL5zuLbQgPpCa5F5kFGJlLozX1vXoOFjw9I8zZ1zxUd
	7uJZZqSJtgnXOPqVLNRPt4QqY+awW7azpvfxbltWuronohWYNQ1C8Adij4eAMfMF
	ycgr2F3WHsRi/QrCzs8oaVzaaaxHotvBjLWfoPxQrDPdRHVSEqVJJUy2bykVohav
	GMY+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365563; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:cP26sJcFf/mulFZibzu6B0419eV4xSzH76r+fIsQmMHcxT+
	rpDN8JWcZlftrHSh049ORRzqkr8fNKverMC45X8PbWPGlWZ9gh0pDAoRL4TyckXA
	+H6MYV4E3Lb6ISPlbPZDj28Hx+MCdQTrfJL0tkCZq0JW/MCEicb73wNwTlm+aBud
	xHjvCi3s/NHZ3miwVnylqd8ysIE+ffLb38/rvkulxIIje5OJCr2HN2z5it6Inil4
	5GBESELfSZ/XybbuxI+rcJSm7EtvBDpQgRDrmiaX4y5gOvMi5DBY/YIs43Z5A8EL
	SuI382UG5aHsr9JTyK4ZI5h4f7plLQZxSUSKYuQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L3l/vw39rv0kM9cAkcplbvVlEDdcLpubzOdvjvkEfvs=:YrnTienYW7UUHtcvtY04TV1viY/3EysGS8vE42JoxSM=;
X-ME-Sender: <xms:uxHGag0jgJKLCAgo6dkBWHfCCGpyX2XS24uElpo-badzXUpZNu0_tQ>
    <xme:uxHGapDj4j2K3A_JGKSvNpcodpQ-alQ6KgNEf3hPwx3AcBNqpZpQal6kEcoC3rYfr
    YvBzdSCSKteqxAm2PKOxIRHw3B8b4LtFSJO_gajmE7vBEYIw3OHGoUkSw>
X-ME-Received: <xmr:uxHGagfClMTKQHKZ5MhpvFEmMH27CTwJgiNahouJPNQUUr2zP3vaDTDOTe04kpoPmwjmvedbmZQy3ZwJU137tps9c5WWBDAg_3i8Y8yqAzWkxA>
X-ME-Proxy-Cause: dmFkZTERAQgPBRTUumSUl2n0Pq7uPwC7Nn+MwikbWSdYmwV+7ZoCKD1ALngDo5xo/DfEgy
    jrswz2tzI0II+sJVSsBA3dNImOHFRp7RLdFYmaSukYnegLXQHj5im6CGrsxGvXrqiWZlQj
    +EwpFK3W1zTWGUuT5vr9g2heDmc5YHvRVgGD55VUKSsdTDhrHycjCbsxOj5N+6A2kou4iS
    GIYBuIxUTSdoXQeg8uy53LvHOCO3Tcgw2eZgRVTGN2AKgQI6CwUvFr5AP1tukpi4I/3qqC
    26VqD8KU7A0SnfEU0EU0uq2nMzKmuWlXP3uL1cP+zxAwEQaN38E0bbCwA4OvbjR2P8b2Jm
    RYqh90Cz+GFCFNByH8dvjMpQ3p2EtYngddjJazIqz+ke8QaUfoM1vE/D/NlShNQv+zVGN2
    5TL3/7dabEkAGRE43PEdMqyzDorbu65aGlJGJT1gMW6OHagDoJuhudAnDDQuwvZloi1e51
    bz7VuOzfP45K5k+IO4+N/AbjV9VH7S15YJwXkkvqM+gNHYE372Lh0rNhwqcVNvOD4EKtH+
    xATN6xwkF6f9juuFi+EK+Sj6tF6cJJTI8MaOrUuTFEcWIGN2bUovKezDxN4W/qaHijWqvE
    wcGKIm0v1es2Gl2XgdoUWf9zFJblbjmvaNNkbsu5s2tfDoLkStyHhzMOUk/g
X-ME-Proxy: <xmx:uxHGamjStOchhEWr-IS_ZSXHlEameRsleFJgp9rv7zJXM593r_xz5g>
    <xmx:uxHGagq5eyADm8DIL87NvlePJSE43PnOm9uRjsv7Y5ZrVtH5GEslug>
    <xmx:uxHGauG89u8SjgyaZdg_B4p7DRtzo0uvoVu2lvX5QtoWfAHthr_jtw>
    <xmx:uxHGaimaqkvPzC_Zjaj3y-c3g4e52qTiv9PJJPPIHUDsiS98ZSSGYw>
    <xmx:uxHGatLXqPpTSOEcygKoSjuvmivh3IFSA9p86hjJ0C1YD5SKuAIblp7q>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:42 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] firewire: ohci: schedule callback on workqueue when cancelling AT request packet
Date: Wed,  7 Oct 2026 18:32:32 +0900
Message-ID: <20261007093235.175742-3-o-takashi@sakamocchi.jp>
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
index 37c61c4b7d20..cfd7d682c595 100644
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


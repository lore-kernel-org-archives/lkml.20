Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E10A3932C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365581; cv=none; b=iMqwBBmOSmZbLve4Ca4gXcCKHSXUHiUXkyIQ2IsrFX/JG17xkS2+yukN8Q0ZzHtbFB+rI7spgO85GEj7OZthRVhPGH2jc1Ift3LKd0CzrWz/UR14EAFmz3urdYl7F7o5Z3/Q/JCjigQ46JgkWUM+2rz0EwEvHzlMmdFBj5EuA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365581; c=relaxed/simple;
	bh=IiuLhv2+kIVutIoOM1M3CNKffzewewoGbuJztDumXMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXD72iCDpniTSp5NmLetVhSMU0CsXwfuxQpaHRwqTWxh/TFZ5+juKhnLuNVjSgPqQg/wKeQv0enultZYTzE0UYkeMouv5pjFaxqqduIiEFhwG9YKghWhJamVacH/BW0UIguVSHY7aQ31vLfxwRNbp5l0Fd0DjUcjEWU/ZuumvQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=uFKSf39r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uSphLvik; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="uFKSf39r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uSphLvik"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7E43F7A01C7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 07 Oct 2026 05:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791365565; x=
	1791451965; bh=J+KoUh0/vmKT4yUMGXDiHQgqSpiKLkUIN3GzHoWt7Vs=; b=u
	FKSf39rk/wr8cwI8y9zKcDtyYc9dswuNyRiEUMtqtBIxmsMM3jRiNOzm7ptHTQcG
	q67qqZPxUhHI0tP0UV9nj3uQZ7+Sm66VefpODi7AY/wpbvoEMISR+YLbnE9jp/yh
	biyB14cAE8W7gjmfvyj8J2SwyxuaEmzryB+XTNIlZ70cN7tSUU3t2pT1fcHX1Trd
	p4YyyvmwcQLVzJKs5m04QdV8QkqeYVDMVWCqzJ3Y40syY/RJJm3ZCPYxgs00fvz5
	oydkcRmqxL6JPYfm1inUG/lhnlASX8xnNcACmwA/BpAtV1eGrd+H+XPwEn0KxILR
	MxwE8taDt7V3ycijuKW1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791365565; x=1791451965; bh=J
	+KoUh0/vmKT4yUMGXDiHQgqSpiKLkUIN3GzHoWt7Vs=; b=uSphLvikRokTF6i0K
	hWmigBSNVMxi9KGCuRL2QX+KHdA5QqGZ0MfaQASgR79Ssp9tBv6Yd2NYOdpQsXRO
	FLYRTzaIS03j7LXNY70CpGqf4HabhA84aZOnRB8rC9ocacvl2pZQkxpJajmrMF4H
	+lrb5SC0fYhLfniEeqX7/A2hDsNnE/UJA0pN4qj8hcM3wH3xbQEOh0HGzIZuUyV1
	YjMoKsQr/rRPXd0zwCuMhozufc4EF6cDc1X0uxFqUTlX72a2aRqsE2bE3LhtyeY9
	jQtoc5kZYWvpxaRDQqRO1roUrjZOdF5hZTQV7gG5TsXGEsbUPwbvRfE6WjcfB+Us
	Xaj+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365565; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:oslm3WAlPl+WGdu+Et07iStVana82jsMKTmcJkkCHx8duCf
	bPXFU/eEbJap67EIy6EiK9k7VG22mtqhNVUcBlYE44pTCJLYnA2eaemi4DT94WCO
	Pt59oD1xKBY/D7I+T9rYjl+BJt39nT9VRqtdwfAw1lXcDaT6hpWLccLl1p6iiwwr
	VdeZww2PC4Qa095AwQzdPoJYWhujwejhO8Os9KHqAX26tl1mPzIj6YYK88Afz0LR
	PlwvaXvxVCDSU/wFVwyOIb8zlOzAusZge3W14IzKaUJTpSqbhahgGB1kqAB3QuV1
	CIMy6e+mp9BDhVEXPK9aXKRHdmLIefX8pMwyKtw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NeXhK2qQhS7nnrei9fsFIFTrD0F2AY/BBf2C9+yuD7E=:IiuLhv2+kIVutIoOM1M3CNKffzewewoGbuJztDumXMk=;
X-ME-Sender: <xms:vRHGamaius7kcvTN1EB3bAJFBjwiKcXyshCWnrluMOVtL3HMV0b9WA>
    <xme:vRHGanUSQQU6nsCjXoC06OtzKgD3riii_vr0-160215TEId6abOgVRc-6cnuap5kZ
    4y5AlapgpiWi3br-VNCKbYgDnoxHx8XEQyXfaoY9hjYOC6kordrNuU>
X-ME-Received: <xmr:vRHGaoh37BZtUJD_1fzPASoTOrYzcvpleE42IqAVK6ulyNFjb5W8wv2KRhntQjz8Ik6rWQVGTrzFOB-Yv9abNIUwA-GwhbdUUa7ggm-E_JFA2Q>
X-ME-Proxy-Cause: dmFkZTFrUrS8WKee2wnzAtR2N1VJlw3rXyQ5feD3qmjq/Za4T6EtKkDDy2Tou9zGpu5BJg
    Ynlgu6FFX4nqtENw6WzTcsv2LBZ1H3wpi6frFE7Gqj7ornOnD2+ZBnf65/g9WolCtPlchg
    tD3+q80USHyebCGlWhkLLsiUtyoCcjhHdjqhZ/BSgQ6pmkATeJe7KQDtJfTR+tcBcQ6cx6
    ZijYwbvTSg/FuM3YSRGsvy1Bm/R9nR4jIX/feYcQ12aZUHjUIg/nzHf7GEEbWI8320sT5d
    jC02SNtvCCzvV3p7OwwS5N70diLb1lI93oqME6V2p7fmfIQXGpWspu9bH4DR3bQi2tnhAc
    d9opLpE9A2rC2siYSuqHGvsnyyrzgfQeK74IIi+s39YWxltAaILZBSZ6utHYAQwdehloXN
    16SSWehVTEL9BUqX2deIa7gIcwNk4JqBBkPxGlQo+4g/csi/uDrja/J8h2L35ZMgE4ynZ7
    4by8DT0ddBysayDbH0ry/zNIL0zH1LmsTUB5lHLctnTAd8H1VCIGNQmvJ9Q24nXOelnGIo
    LbLyy1bwd7yq/tlJaQHl5dmTh9OlMV0TjFIQ63t0ZDep+jYGfqR7oZBdmRYWvajPm2vfoW
    u3Kub5YmHnAI2i4wrycQOpPjqewh5bOUY6z9uZpWgtE9onVQ01CPxsoCyJdQ
X-ME-Proxy: <xmx:vRHGalUAC_V752O-PVB0yDEoXm9j3LS3uZ0otP2qwxkq_mX3f9xLLQ>
    <xmx:vRHGavM07BcrETHgorYNm2vkXGPRFg7Mf4D0hZN2WWivMEGF09VmTg>
    <xmx:vRHGahbV-qJAlUONYJ1XhzjOPsi7egI19Ucln6UD1Mqf53qCPT423Q>
    <xmx:vRHGarqGBHnFwXlKngQLSqEGP0_1HAhKLgapFWd_daRgNtNuf1400Q>
    <xmx:vRHGarPG9a2_g5BL5OeuH3zNiEGEYPJSZBjjyJyHtBhz8uHPL-eTkQIj>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:44 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] firewire: ohci: allow AT local packet cancellation
Date: Wed,  7 Oct 2026 18:32:33 +0900
Message-ID: <20261007093235.175742-4-o-takashi@sakamocchi.jp>
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

The current implementation uses a different path for local packets than
for remote packets, and local packets cannot be cancelled once they have
been queued.

Allow local packets to be cancelled.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 896d0cb9a895..c06e8d87239c 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1597,7 +1597,7 @@ static void handle_at_local_packets(struct at_local *local, struct fw_ohci *ohci
 	spin_lock(&local->lock);
 
 	while ((packet = list_first_entry_or_null(&local->list, typeof(*packet), link_for_local))) {
-		list_del(&packet->link_for_local);
+		list_del_init(&packet->link_for_local);
 		spin_unlock(&local->lock);
 
 		if (unlikely(packet->ack != 0)) {
@@ -1671,6 +1671,7 @@ static void at_context_transmit(struct at_context *ctx, struct fw_packet *packet
 
 	// These members are used to cancel the packet.
 	packet->driver_data = NULL;
+	INIT_LIST_HEAD(&packet->link_for_local);
 
 	scoped_guard(spinlock_irqsave, &ohci->lock) {
 		if (!destination_is_local(packet, ohci)) {
@@ -2658,6 +2659,10 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 	struct at_local *local = &ohci->at_request_local;
 	int ret = -ENOENT;
 
+	// handle_at_request_local_packet() can reach here by calling fw_core_handle_response().
+	if (current_work() != &local->work)
+		disable_work_sync(&local->work);
+
 	// Avoid dead lock due to programming mistake.
 	if (WARN_ON_ONCE(current_work() == &ctx->work))
 		return 0;
@@ -2681,6 +2686,11 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 			scoped_guard(spinlock_irqsave, &local->lock)
 				list_add_tail(&packet->link_for_local, &local->list);
 			use_local_work = true;
+		} else {
+			scoped_guard(spinlock_irqsave, &local->lock) {
+				if (!list_empty(&packet->link_for_local))
+					use_local_work = true;
+			}
 		}
 	}
 
@@ -2690,11 +2700,13 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 		// Timestamping on behalf of the hardware.
 		packet->timestamp = cycle_time_to_ohci_tstamp(get_cycle_time(ohci));
 		packet->ack = RCODE_CANCELLED;
-		queue_work(card->async_wq, &local->work);
 
 		ret = 0;
 	}
 
+	if (current_work() != &local->work)
+		enable_and_queue_work(card->async_wq, &local->work);
+
 	return ret;
 }
 
-- 
2.53.0


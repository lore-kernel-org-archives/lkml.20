Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D79647DFA9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199556; cv=none; b=B+q+K+ZfczkOU1Iad5mdt0txlnIvbCK6oiMoiCN8vHobUzkNg8yKm7JYHqlnAQNgB9I73kvuu8yxOINICJAlyNb76LguqsJE+g4xW0QX2ce9P2tVuiuuEx8VAHmHUqwD6fqkAYKEcZwWsmcIyh9EPb5b5btHDX8qGsqo5f1xdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199556; c=relaxed/simple;
	bh=IiuLhv2+kIVutIoOM1M3CNKffzewewoGbuJztDumXMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8QN3FRraRRmGiPPTatN/ziYsuISFcUWdbV2dxjTvFcbGdmj/Z2wHN407bTzvNHsigJC7ecb3KK0pic+Gvne8MsxwE7/Kjr1q4kRTs3hYNHlW3oi++uxi4Juqi23uWq8ImzXOa14vg4J68kyCSYyLrpHfW72Lwc4j4q+QIzWeyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=fhySA0MX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lZ4wOyrq; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="fhySA0MX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lZ4wOyrq"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8A6277A0041
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 05 Oct 2026 07:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791199553; x=
	1791285953; bh=J+KoUh0/vmKT4yUMGXDiHQgqSpiKLkUIN3GzHoWt7Vs=; b=f
	hySA0MXCjxP5n6G+FQ8UtoLDn2goRtBAyU7133RlE35E1EDos7LO7snwxvvzR8mj
	dHVzFfH+nj5a1pn0t+QM/QZCB1ERz7dsyJ4HTA/wFd5+0xiZM+lZnKw4BWbsRFqQ
	r8lUL/WQAb3b2Xyjx5RDU0+we9EUU34XqV3OfQF78LyheBTGUWf6KFWWmc5d90CH
	V8jddby+NDoRz0g3BPx1pk9wqYpvQPzD2dLNgu2nUyByOIumY/5SHbTaYynTh00z
	mzfeBvvSz9/cJGzrF4UA963bFe78Sw9i0Z7o8uN+gaSlf0aZT6Uc3bz3AgJumffQ
	0oSJRCA574xxKT2BlCjmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791199553; x=1791285953; bh=J
	+KoUh0/vmKT4yUMGXDiHQgqSpiKLkUIN3GzHoWt7Vs=; b=lZ4wOyrqGtzs6y0qm
	QlxvIzKw5ZTz7N5rhqGh9FYSSVXACz60P8DcJXa6xmsKae6mbLXb130YCghzve4O
	SpDVJcdaYzZRmD005H6oQFPlNxZIa72DNiPD3FNzawKmNaQU3SI29sM0AGfH7f3J
	LAxS7omeA+1VyTHckDHN2Z6gLZrdW8ogPrbZcVQx7APcl+nud9AuJPTB/yNRgg4q
	TW7na09C9Lhf85xuvXl96RVQz/nqKfe5Q24ZVgtMRCSMIwND4I0g0IH+VlCoRZLX
	S5wnYZMsfJNSRzFFZfxHJLrwM9VwaVA66z9drhlaODpx2wGTtbPIJ6vXi2JG2Xse
	k+HkA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199553; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:pULXyhn97s2HInQmHCdecqqpBdnFTnbBqPSk43JE7fygyIJ
	Kr6Br/jKpSaSdReldk2Z7N6gH3/Y4U8vAfbjlnn57yPpNWgCFQoaBbsbBXAnKu2l
	9WEKrHQgGfs1NNhtTz0a6znTaqr7z2rd9AN9ivgniFjWsdfQ899fa1hsTIaF+N5V
	hfrFnjJv819Dt3v2fvJ89d8nYB50kcsJ7VqesU7svqsubG0lkRNfZh2pA6Y26xop
	WpUzXiSp1YMleen+XKbXhuJnqFqf7P1vBR4cFF45RMfwfyOzjGRzSCU4NjNAWSVD
	3yX3O7upHvtpkeHVQNsvlz727IhukIo5MfuKK4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ACGEAXn48lTovIxqqvgPQjpmCDRDX9sKvnQgTWgY2Pg=:IiuLhv2+kIVutIoOM1M3CNKffzewewoGbuJztDumXMk=;
X-ME-Sender: <xms:QYnDaqFfWgZgwH27YW3eN5vsr6FSfv4sRGbsa3dZMDKZwpqOsqYy4A>
    <xme:QYnDapSmq9S_20HdV7bO904hCZFYgjpGDny7NorAXFtxR5yqcg6UISfwuGOR4cKM4
    wK6p2cbx0baheHlObdpJQ6C79qkS6FlgUwF0GKaMlohf2HVnYCrOiA>
X-ME-Received: <xmr:QYnDarti9ZZE3q3cbJlqjyU6BivV0fwtBJkjjVrtcyoooARAfl1CzPQqtd4hJt3L3f27Zom2zJojTo-laYQ_yAaSWdh7a7KZTeI2Mt-w4-jn4g>
X-ME-Proxy-Cause: dmFkZTFsLAB/46N7NTQopLtbJNSMIHF8XhXzy4UUjrgvNMaARRkaSxhUyEWYrGGPGhJ2TM
    kzTQ4OkOpALXnKmDajc14H+0Nzi33/On7h55xzPuBtlLgfksSCP/jSC6eAXzuPRCmKU0LD
    4doC6QORNid8hiWSCc4ZFXyKGLeaTucn4QZv0JK5gHAfqiBjKIxNuw73Viz281KV64Gi6/
    RLnWS+cKZ/vnJKh4dhScqltBex9q+Ih1vahxtlJktN/ELpKybegv3tiFWzyOQ3kk0azui5
    CPm6+zehhPGLdw6fFO7OMsQA2nhSThpg8Q7L8ZgOSd4Swh4M7AQRhtEsLIifm0VwWNReWZ
    c2PeJhG6BLADAVzwa2JH9eUgPNe8X62bxRKU1Z9l2VHFWFYoh/Ld5ZD0Izq7sllq4H2RMI
    XsLjDQae3N7kmAAk1ZKyJUuHlw8CthTJQtSa5sF26jXOao+/wXQDo0/2bDEB5EJRsL17Vz
    3SwdpajH/yGW6Nrn+5E0zVd/XqRy8Kh4wmwrYFGqKaiZy1miK76Cx6RUCZgdkXBnhDbXdU
    GOuyOJhurOs6dJkpVayizj2/aU1cw4icqZWRqPRetOwwEG6bUEfZw8gzsh46CH6CX3SRkP
    h2MUsjoCP+vDuGAz4BtDbEJwzG0UFx0tjVAJZEh4k2IaMuZabaPP4fgrpqmA
X-ME-Proxy: <xmx:QYnDagz3Kom7LHCPoqWZ3C7ow3ZVpGMwNcLqFSTejH35rf9Uk43jUg>
    <xmx:QYnDat6q5AO0UdPSkn6AxthGooes-LtdzU-O2F-yF5L7JE3VwRDbRQ>
    <xmx:QYnDaiUsWtT5Fi4bnRYIBInenclG2DSepEdYakQ2uOOJvskWbUfDLA>
    <xmx:QYnDah0SqGqxX_tgi9XFZWMm83mBlUD8Dtxroz5xMzlEADn-v86uNg>
    <xmx:QYnDagaQqLkyJfvqAvN_WP3-njPh7K2vlDCc_RcqcjUX_sDCn08DEf6->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] firewire: ohci: allow AT local packet cancellation
Date: Mon,  5 Oct 2026 20:25:42 +0900
Message-ID: <20261005112544.240552-4-o-takashi@sakamocchi.jp>
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


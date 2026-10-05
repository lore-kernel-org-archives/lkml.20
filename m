Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2FB47DD63
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199553; cv=none; b=p2QHzFAuUiule8IvhXAsb71n3ZG6mtYW61H//yAFPLMFstTIdOWGWnwTokDqwKh9ajENz9N3ZwlPuFVjQD3q7dL3YTEthb2EM1OoQSwtqVENSzeW8I+MGCINApDao2ula4hv3dwMlw5yIs+K8pYm0m1DQwJXcJePIVzByF/QCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199553; c=relaxed/simple;
	bh=VDAiP4iXohkBkyg4xgRLYtW3fY5SEGu9OW1aOgixyvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HY8hR02R7IUyco62DMPltOFXE8hw6wB3s2kKigp8T3sSOwGCOz3YdhX4PcIHgYNmcgwT0jg/AyUNCyjxVPUB9uja++0hN4LirTrgekfy+vG/sCu4aZ6D6U6XnBNaBnncOfI54ab+JXwyXk7eUfkYvGFiIQnNqEqD+O2kYE/4SMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=QZlxnruI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WpHEzZbT; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="QZlxnruI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WpHEzZbT"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 606467A0111
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 05 Oct 2026 07:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791199550; x=
	1791285950; bh=+YzZV9WKD4JyfhSZHP2XpaXnaGKsAm0ePTdBd+zuyQA=; b=Q
	ZlxnruIXU1EIplKtU8+c4ucbbWMy9PXrAIeAS3U89VIQT7VDZ7BNA3ZqYmNfbbQx
	Ou6dA5EmHMIHUY00BpM9/isiQTQaQR/88LeXx7H2Nq8sYbpq6o2xwRw2MfXn7mcv
	ccHFARIZ+lC835LZHorad2s4rmbomNxXRu3lzD5pAtM8Hj13YPq5GyCqHn4zfiHG
	nKKv1g5KbCIfCBfWsaYrd1szsrWfIZWomvH6v2cxz2H54/I5zskFWDWKIFpcrPzx
	HNIS0KzxXox+inknYkT4Y4TjcrAPTwqrQhzc1l7Bb+q32Yf6LyjMVzAmQ8l5AyTJ
	QsYSV9ZNpW35V3hIo4olw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791199550; x=1791285950; bh=+
	YzZV9WKD4JyfhSZHP2XpaXnaGKsAm0ePTdBd+zuyQA=; b=WpHEzZbTMp0VUtWMu
	S95YnB6ihIaJUfd0DHNWhJ17GPO92iJsFUYFIvbZWUCjvW0fyCChVlSVGWhcluP8
	AkTF/r+OBpphsdnriXMfA/0aQPatwjUX1K4pCF4eXuUBTJ5Vz7IBhe7oVYuRKSRs
	oe91wUPPxA+20TcbNJXpRohDxk2KN/kbOOc4rPxwUxyQzJTLQ6KDF1JF5xA+arkN
	w521LikLBvbNTr63mGLxLJ+AtT8/vpqEirhL6TysZx1ymqG9TLTy6EvznSXtEP5t
	vqdtoEbtRTivwMEuymrVDCY7cLkCSeldHDE42b2eFy1pnoGqZnx/bH1d4LzoPchi
	+8X9w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791199550; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:HA/ppT0u4tlsmuLdem4KbToCCC3ikSfxhVe6RKDL2KAidpW
	jvas0/kERZJEic3EWvNXDzgCD0McHRuDywCA3He5MddkvBw6WV1HCoDHcw4BoB9U
	kEbJx8Dhe0nE6pYvbsavZaeXVELShSkkKkKzG+WTaci3KGQWXR+R739ZztHOe7xD
	BOQnqSCWwQu6aIQaALbA/Y1QK6i3VjZzn85xlv+ZZI2dLaUW0yqA3hF1tuDK0gq/
	LkjrQIN7lYDvtg6hCKxly1hSdMzTCh9EOSBUHnkEOM6Rui6SxZeGwMFmrMm8tBmv
	l5EFKPL1Kosx4vZDz1arSlUJOTBOR0vYA5RFIEA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zzkucfc+2BdAyPOsExDpt069cBVUyDEXqL4M7FINNHQ=:VDAiP4iXohkBkyg4xgRLYtW3fY5SEGu9OW1aOgixyvY=;
X-ME-Sender: <xms:PonDasICEgOTv81n-AiWJeHpmJW7Qhxq2St0dJhbO0mkCPefPUa16g>
    <xme:PonDaqHB12uZ6c6Q5FoYo9dOHlRQMJTBjnoINfSUR7FZihSidvlO3GlwoS6SEm8_s
    m3jwyQLOdGSyEJLU_LRYFDd1TomBNxkbF4I8DaKkqrDlbQs6fVN1DFc>
X-ME-Received: <xmr:PonDakSVBsvMLe1-H0Mj0RC-TO6YbCbHJ0GCrP9STK3uumFhsDtEhAmavtAHWMLtJrUPkbaqifMtqBhlA-pkXHCJi2w1v9XDdr4wsgYb62O_Nw>
X-ME-Proxy-Cause: dmFkZTErW16n30fVOtPPKC913JUt9GtZq5ToHZiOV9Th707EXjbLQ2FLorcrI3mzg5bsvt
    8jbaAQj4pwvoFJgMx4ngv6a5ZJblcfZBs6sWqUTOuNB+90edONGxhjfJD9ir3wPndtsQan
    mG0R7qJWxsifFFGXCXy1EJtw1nueGbYhSjPB3M/1YXjlWeq/9JvZU3vlqPPxSXD+o44WeN
    6pC3VmnbghbpVI5XtNDz3PxzYg1ZY7zDM43WoooJ6NahllBDpvbrsU/89zrT25KWFWuUxa
    OHo9GHH/nOJVAnpMCZIdtuKFFrQ5t8C2vjD5hAHjkjLoTJcA/InDdm3PFXOmg3HAnWzNsi
    tJZ+RBNbtZP9sL+BXFvqzV3pSW8jULrMetq+reipaMtmtELQBI7A+kWEUbkVDSesgQpUJ4
    h9uKhLkhJOfYRTYGpn2BRkJM/oUvB+rqFcprgxwZb9J4fpNllf+PKIvMWwxpdrTKvHZ/av
    Tw94dz9evop95fshrEDAr9nxo83KqxddPUpl30dg70kWt0ica5bQVhXi14/nn4M7BIuK7A
    hSK2bGGajgTKbVrhxfx+GSq2j8K6ybk2rOIxPR/7tCIKS/TVyhqXSNmIO564mgfVqaiQVF
    99D9ZpGz4gSvazgRQm3sc6srpzeHN/6sdibMIa0duQ6GbIEWHGuYvin91g8Q
X-ME-Proxy: <xmx:PonDamGRMIxK1HK4YYmVJQDAypgUnN0Y1dbMGTT-iavC3KrmKa0VrA>
    <xmx:PonDag-_S1Kn4Xyx_BIvBK7OS2IapitqrdyQZhcBHRNVH1d-a_dUSw>
    <xmx:PonDagLLje3jRhGHRqqyKLJv063XVCxBXy-huk6yxhZ-a6loLg9XUw>
    <xmx:PonDajZEGaCa_Vi3qVPUGMV1q2prWGnFBo52yXLHzscrlgwgAdcjrA>
    <xmx:PonDau8mwCAJMZLmtymNYTyU8YAUT7fCeFeJUVoEl-HflqBQayOePpdq>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 07:25:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] firewire: core: expand close_transaction() into its callers and remove it
Date: Mon,  5 Oct 2026 20:25:40 +0900
Message-ID: <20261005112544.240552-2-o-takashi@sakamocchi.jp>
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

The return value from close_transaction() is useful only in
fw_cancel_transaction(). The other caller,
transmit_complete_callback(), simply discards it.

Additionally, the pending transaction queue should be enumerated as soon
as possible to prevent the issued transaction from completing.

Expand close_transaction() into its callers, and remove it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 66 ++++++++++++++---------------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index b4fccabb8fb2..35f3a11ab2bb 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -99,24 +99,6 @@ void fw_cancel_pending_transactions(struct fw_card *card)
 	t;								\
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


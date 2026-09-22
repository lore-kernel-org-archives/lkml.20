Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5F4A4EF4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106366; cv=none; b=Y4tmXO+WqgU//2WSdHO0ZIBYLmPQfcr9ihSfp/z6cxzAQqoFrciZcPWAu1zweNp3EYsoQpE1ZyCEV9pK9bx6nDtOEOYz1qGHtflCnUvSguhlBrUNZPICfL2GW8jxWedn7Jd8aWd72rVTiXmeZzff7kaWyCy+q/KJCyZBLOUCY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106366; c=relaxed/simple;
	bh=ecSyTfJPz96M1UC/DhEKoRu2pGbe4F6v4SIrDUuNNkg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=doO+/aiivAUSWPJkIf/46l5kGl5f9ERo8FhiRnFTcXWVsqXIdm6/MHLfANWBLsblXMO5JV//ONN78XQeXkfNw3fUnA/s28GX2LcQo54Q5XiscC2d3avzgmZ7x4IUePXOzKdNoSoWuELOkrOWKztqzoMDFBhYjo8NO3I/+252y+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ejvYmY18; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ejvYmY18"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so2760905ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790106355; x=1790711155; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0lSci6HT5gQeGkphetiqsMSe/tz0UwH39MUVuL7NZk=;
        b=ejvYmY18PQ1hH6dgBLjaV/k5vnyyz7ieNeRVlq0Hnuy8SGUc9LHFSS+s+yBI80R/wD
         m4iGey8h++uGkdUxZU3KsmvJfg0G1//1u2TmdutdVhsj1of09ebdz3GM4O+jUrWArUm4
         jGI5h+9QSB5whgLd2ydiTZO5OuL2sIZ+qDJxJfUN0BjKuFFFdPjG5MBhOzJSbHVf7BiH
         AhV1j5kTL6wVHbSrrbqR85gGPGGDT8PXgRaWeInNaGmLy0WaUeDDMZwPvEMLRBiHZ/P7
         oQagtbvAwkUpdzQnrltCd5ZL6AxuXLGRzKafqIaqP4Y7RyjX6ilf2qzIEgWXKl/d0I5+
         hMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790106355; x=1790711155;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0lSci6HT5gQeGkphetiqsMSe/tz0UwH39MUVuL7NZk=;
        b=IDf2SQiWnl5/GzZD0npNH6iaoDMJulm6cuxUC690oKj6HvnTbtSMstt99SZbjIL3yW
         TflFzgNDFipa+H3KCoTBY7hZod9AdNIZ/iPQfFGAmbTL8dkEBVJgMTt14nAmwttZZKIN
         dXBHKCYoVV4cv8F0FcU2ACA1vcFzrw04vElIbGlGtaFd8XqxGeEsRLOcQ2d7PzlGDJOq
         EW5hipsjW/Iuba1Taphj4kDV2Wd7YfMb708AWE0vo88LUpNBNK455/xMUlTKdf0csut9
         FQkag45lb/bn5CwsoXqT9oHolm79siF7/BzA5StGgIe1N+vWeoa0sPr6pYABM8ZWrdoJ
         jGRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+E1Bcy3mis0BcFwu0nr8bs06y7FT0jicFG3HQ0d+n+3WW4eq0aC3ad2WzBoZlv+ZnDIrqxhGcb1Nvems=@vger.kernel.org
X-Gm-Message-State: AFuF++njSEIS/rk2z823yoDN4QUbRbFk5ZNImGUx+Q5g9OAiB3MTqVKz
	B5Jbyy39zOUwHTnEvqnSyZffu9yDgB9xPir3x7t2eDZaZeGsLSyQZEVxI975xrUblwRQi1EocZU
	KRB8FDRMei2zOyw==
X-Received: from plcy11.prod.google.com ([2002:a17:903:10b:b0:2df:638e:e034])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e548:b0:2dd:c053:9c73 with SMTP id d9443c01a7336-2df69dea44bmr3666085ad.41.1790106354635;
 Tue, 22 Sep 2026 12:45:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:45:33 -0700
In-Reply-To: <20260922194533.631387-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922194533.631387-1-joshwash@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922194533.631387-10-joshwash@google.com>
Subject: [PATCH net v2 9/9] gve: prevent XDP frame leak and corruption during
 DQO TX cleanup
From: Joshua Washington <joshwash@google.com>
To: netdev@vger.kernel.org
Cc: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Jordan Rhee <jordanrhee@google.com>, 
	Willem de Bruijn <willemb@google.com>, Tim Hostetler <thostet@google.com>, Ankit Garg <nktgrg@google.com>, 
	Eddie Phillips <eddiephillips@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Eddie Phillips <eddiephillips@google.com>

When tearing down a DQO TX ring or processing miss completions,
pending packets were assumed to be SKBs. If an XDP frame was pending
during cleanup or timeout, cur_state->skb was accessed on an xdpf
union pointer or the XDP frame was leaked without calling
xdp_return_frame().

Refactor gve_tx_clean_pending_packets(), gve_handle_miss_completion(),
and remove_miss_completions() to switch on pending_packet->type.

Fixes: d8a8ca14c937 ("gve: add XDP_TX and XDP_REDIRECT support for DQ RDA")
Cc: stable@vger.kernel.org
Signed-off-by: Eddie Phillips <eddiephillips@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
v2:
- Newly introduced.
---
 drivers/net/ethernet/google/gve/gve_tx_dqo.c | 155 +++++++++++++------
 1 file changed, 104 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_tx_dqo.c b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
index 78f946ae7264..e8481b993beb 100644
--- a/drivers/net/ethernet/google/gve/gve_tx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_tx_dqo.c
@@ -186,6 +186,49 @@ static void gve_unmap_packet(struct device *dev,
 	pkt->num_bufs = 0;
 }
 
+static struct gve_tx_pending_packet_dqo *
+gve_xsk_reorder_queue_head(struct gve_tx_ring *tx)
+{
+	u32 head = tx->dqo_compl.xsk_reorder_queue_head;
+
+	if (head == tx->dqo_compl.xsk_reorder_queue_tail) {
+		tx->dqo_compl.xsk_reorder_queue_tail =
+			atomic_read_acquire(&tx->dqo_tx.xsk_reorder_queue_tail);
+
+		if (head == tx->dqo_compl.xsk_reorder_queue_tail)
+			return NULL;
+	}
+
+	return &tx->dqo.pending_packets[tx->dqo.xsk_reorder_queue[head]];
+}
+
+static void gve_xsk_reorder_queue_pop_dqo(struct gve_tx_ring *tx)
+{
+	tx->dqo_compl.xsk_reorder_queue_head++;
+	tx->dqo_compl.xsk_reorder_queue_head &= tx->dqo.complq_mask;
+}
+
+static void gve_tx_process_xsk_completions(struct gve_tx_ring *tx)
+{
+	u32 num_xsks = 0;
+
+	while (true) {
+		struct gve_tx_pending_packet_dqo *pending_packet =
+			gve_xsk_reorder_queue_head(tx);
+
+		if (!pending_packet ||
+		    pending_packet->state != GVE_PACKET_STATE_XSK_COMPLETE)
+			break;
+
+		num_xsks++;
+		gve_xsk_reorder_queue_pop_dqo(tx);
+		gve_free_pending_packet(tx, pending_packet);
+	}
+
+	if (num_xsks)
+		xsk_tx_completed(tx->xsk_pool, num_xsks);
+}
+
 /* gve_tx_free_desc - Cleans up all pending tx requests and buffers.
  */
 static void gve_tx_clean_pending_packets(struct gve_tx_ring *tx)
@@ -201,11 +244,30 @@ static void gve_tx_clean_pending_packets(struct gve_tx_ring *tx)
 		else
 			gve_unmap_packet(tx->dev, cur_state);
 
-		if (cur_state->skb) {
-			dev_consume_skb_any(cur_state->skb);
-			cur_state->skb = NULL;
+		switch (cur_state->type) {
+		case GVE_TX_PENDING_PACKET_DQO_SKB:
+			if (cur_state->skb) {
+				dev_consume_skb_any(cur_state->skb);
+				cur_state->skb = NULL;
+			}
+			break;
+		case GVE_TX_PENDING_PACKET_DQO_XDP_FRAME:
+			if (cur_state->xdpf) {
+				xdp_return_frame(cur_state->xdpf);
+				cur_state->xdpf = NULL;
+			}
+			break;
+		case GVE_TX_PENDING_PACKET_DQO_XSK:
+			cur_state->state = GVE_PACKET_STATE_XSK_COMPLETE;
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			break;
 		}
 	}
+
+	if (tx->xsk_pool)
+		gve_tx_process_xsk_completions(tx);
 }
 
 static void gve_tx_init_ring_state_dqo(struct gve_tx_ring *tx)
@@ -1089,28 +1151,6 @@ static void gve_xsk_reorder_queue_push_dqo(struct gve_tx_ring *tx,
 	atomic_set_release(&tx->dqo_tx.xsk_reorder_queue_tail, tail);
 }
 
-static struct gve_tx_pending_packet_dqo *
-gve_xsk_reorder_queue_head(struct gve_tx_ring *tx)
-{
-	u32 head = tx->dqo_compl.xsk_reorder_queue_head;
-
-	if (head == tx->dqo_compl.xsk_reorder_queue_tail) {
-		tx->dqo_compl.xsk_reorder_queue_tail =
-			atomic_read_acquire(&tx->dqo_tx.xsk_reorder_queue_tail);
-
-		if (head == tx->dqo_compl.xsk_reorder_queue_tail)
-			return NULL;
-	}
-
-	return &tx->dqo.pending_packets[tx->dqo.xsk_reorder_queue[head]];
-}
-
-static void gve_xsk_reorder_queue_pop_dqo(struct gve_tx_ring *tx)
-{
-	tx->dqo_compl.xsk_reorder_queue_head++;
-	tx->dqo_compl.xsk_reorder_queue_head &= tx->dqo.complq_mask;
-}
-
 /* Transmit a given skb and ring the doorbell. */
 netdev_tx_t gve_tx_dqo(struct sk_buff *skb, struct net_device *dev)
 {
@@ -1347,8 +1387,25 @@ static void gve_handle_miss_completion(struct gve_priv *priv,
 			secs_to_jiffies(GVE_REINJECT_COMPL_TIMEOUT);
 	add_to_list(tx, &tx->dqo_compl.miss_completions, pending_packet);
 
-	*bytes += pending_packet->skb->len;
-	(*pkts)++;
+	switch (pending_packet->type) {
+	case GVE_TX_PENDING_PACKET_DQO_SKB:
+		if (pending_packet->skb) {
+			*bytes += pending_packet->skb->len;
+			(*pkts)++;
+		}
+		break;
+	case GVE_TX_PENDING_PACKET_DQO_XDP_FRAME:
+		if (pending_packet->xdpf) {
+			*bytes += pending_packet->xdpf->len;
+			(*pkts)++;
+		}
+		break;
+	case GVE_TX_PENDING_PACKET_DQO_XSK:
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		break;
+	}
 }
 
 static void remove_miss_completions(struct gve_priv *priv,
@@ -1377,9 +1434,26 @@ static void remove_miss_completions(struct gve_priv *priv,
 		else
 			gve_unmap_packet(tx->dev, pending_packet);
 
-		/* This indicates the packet was dropped. */
-		dev_kfree_skb_any(pending_packet->skb);
-		pending_packet->skb = NULL;
+		switch (pending_packet->type) {
+		case GVE_TX_PENDING_PACKET_DQO_SKB:
+			if (pending_packet->skb) {
+				/* This indicates the packet was dropped. */
+				dev_kfree_skb_any(pending_packet->skb);
+				pending_packet->skb = NULL;
+			}
+			break;
+		case GVE_TX_PENDING_PACKET_DQO_XDP_FRAME:
+			if (pending_packet->xdpf) {
+				xdp_return_frame(pending_packet->xdpf);
+				pending_packet->xdpf = NULL;
+			}
+			break;
+		case GVE_TX_PENDING_PACKET_DQO_XSK:
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			break;
+		}
 
 		u64_stats_update_begin(&tx->statss);
 		tx->dropped_pkt++;
@@ -1426,27 +1500,6 @@ static void remove_timed_out_completions(struct gve_priv *priv,
 	}
 }
 
-static void gve_tx_process_xsk_completions(struct gve_tx_ring *tx)
-{
-	u32 num_xsks = 0;
-
-	while (true) {
-		struct gve_tx_pending_packet_dqo *pending_packet =
-			gve_xsk_reorder_queue_head(tx);
-
-		if (!pending_packet ||
-		    pending_packet->state != GVE_PACKET_STATE_XSK_COMPLETE)
-			break;
-
-		num_xsks++;
-		gve_xsk_reorder_queue_pop_dqo(tx);
-		gve_free_pending_packet(tx, pending_packet);
-	}
-
-	if (num_xsks)
-		xsk_tx_completed(tx->xsk_pool, num_xsks);
-}
-
 int gve_clean_tx_done_dqo(struct gve_priv *priv, struct gve_tx_ring *tx,
 			  struct napi_struct *napi)
 {
-- 
2.55.0.1082.g2b9226bbc0-goog


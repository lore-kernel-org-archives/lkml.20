Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A43C2BB0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582883; cv=none; b=gWsig+F/ahI1gfvu1EcAfPKrsZ6S2Oz2Eer1o1ZI6jPbZ2PsW1IZB8J4UiKLig0SccCXi5v151HmGFoOQUpBRBKxx2KYHrrvl9FAKrKpfVYFGitv9Gcol7QhUYRiBg5zKfdbwfT5n+0FEOHKTCOmmKafWZWB//jR1flJO5nGgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582883; c=relaxed/simple;
	bh=Yw+kW60tiyde7KiT0jO+rnWgC5MSbh+FufdnqnUvDEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dy00t1PWOjog6oikEs8+vcS0nEoB7b2PorTcTqP2TWnd+rEcannjpjJpTTbuAluhA65W95943qW/OruhFbzzmWz5i8vdPlKXCP1jeHt3Eh/ZeMkl/ZI+nIriihXIiUW/na/5n7YJCoJL07M/56Px/1GK4k0OW5XyVtpCEI1u3hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=pR1lKHbQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="pR1lKHbQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd1e069cb19so87914a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791582881; x=1792187681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7iB6MuKqAb6OuycuUnKN9NPjjEJxtCuOVdjVCejVb8=;
        b=pR1lKHbQZreWKMFA71JBZuWYGCkVfo/Txj4RTXA4MqcyiRmdY7YmUDs5nSOrjhOHDr
         vkqPq00xOLdUjUX0mKWNjl+jtUBAhxmxpsStjneaVgGzpu2yIY0qByT5rwISeID9Sj5R
         W9r3wVhg3FJXq2WiQzWabP96U0RhFosrGFW/LS2Uly1ZWzFY3hOtyn95peyDxo984yWM
         ccYtSPufiLpiLZ5LdOPo6NTZI2fPqTUFx8xMPuNDHQMRcqMMA4SQftoC181niklIDG+f
         fZCBa8Jv3QfjFaA47yfJM1+8MD5RO5VS/HEoW/oujwRmugZHRv+5S1Nl0FCBZFLbS7u3
         MkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582881; x=1792187681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7iB6MuKqAb6OuycuUnKN9NPjjEJxtCuOVdjVCejVb8=;
        b=nVHkG+fFmZQph970ITvPEZEP077JaimshU5Eg2rbqoOf00yapz8LvyE/q79LSoYxgy
         IWwXKXMRKODSvOwMF33jgzrRqEMDufPS11bgtOSnUczXLQGxFYd2+snUEbnaf+edS5aw
         h3L+tLGkrToifPffY/lYpYqf3F0o4OfCgicTQ65Z7o+RC3XQJe0UgfgQ5vz7AfQIJ0yg
         +VOG65LppBbWQu7PybPSta/9F86/BcgC3//XQQ54z8LbXRUzw9FXkXsMGDY9+ugaDAAF
         ZBQvfBjoTK9XCH32cUlEnwpqryVgWuinDltNvZ1JyeKrsV0zAW7XT9Zub1S2q9fTd1zf
         b6fg==
X-Forwarded-Encrypted: i=1; AKwUvBwl12VrXJvSpB/3kznil2uTLxLGQA/vclZycoMoFPYt4LZIXBOHzenZ7kxJCZ4+Iey9brw27xOQwn6YzeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWgyqsTNQKGs0V4uSrpnKeFH32W4fDxGCnkjHkBcCqoxTnFZzo
	EFpDHWyoTEs9c6Cf2RE4e6jdT3p+cSkQGOBIaj0/3dCqlhpF89gNoVDYiPIHd5X1LJg=
X-Gm-Gg: AYBFou3iCV+HiWGxRdJb9bVGXZ4VcWbbrdCRZjHeCqg4BmYGOdof6JFDY0GxoFnBF0b
	IF6zg2pnAGRf9amubYYUtPRdL6M7EK6uHnRmpn5m7zi4SO5E5K9gqDXXhN55gKtUc0LwVJi4A51
	3BqU0+UwgH3KfkZWpiWo5qJt3xcr8KVDFrhQhy6IOZN5Fz75RqN+XAShUNkmR/8/eUSu7i3ajcp
	XCjyeurz2c3NY85Eri0aWzxRqJrUVjjJYNrkHAAKOii+gjhkjHtdBBzXuTlhdtv08PeAFzl+bC4
	5h5pv2IcDjQL2SPS5hevC+dBYmajG9MH5cw4wrMBHYClo+d+aj2vROcAQVxNc90B89Ee0lWV7J7
	tuzXAEMca3/j8/GqiBOVU/2DyzXuiJpVc7jSWEIswlcy5vkXbdUpJvHQvsyGS0aT4FMSR7HOXY3
	T2oTPtciBCR4VPOQQ9SAeOXZKVZuKvxJGba+QTSXpp169WmtueGL4YBfi6rpzNac4lvhtPwU/VL
	SjMeptgCHv4
X-Received: by 2002:a17:90a:d2c7:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ab3a735fafmr2733232a91.18.1791582881278;
        Fri, 09 Oct 2026 14:54:41 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5a::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm5389248a91.13.2026.10.09.14.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:54:36 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v2 2/2] bnxt_en: Pad short SW USO segments to BNXT_MIN_PKT_SIZE
Date: Fri,  9 Oct 2026 14:54:24 -0700
Message-ID: <20261009215426.2377946-3-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009215426.2377946-1-joe@dama.to>
References: <20261009215426.2377946-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each SW USO segment is hdr_len + seg_payload bytes. With IPv4, hdr_len
is 42 bytes, so a segment carrying less than 10 bytes of UDP payload is
sent shorter than BNXT_MIN_PKT_SIZE. This happens with a short last
segment (e.g. gso_size 1400 and 1405 bytes of payload) or with a
gso_size below 10 bytes.

Fix the short last segment in bnxt_sw_udp_gso_xmit(): zero the pad
bytes after the header in the segment's inline header slot and add a
pad BD pointing at them after the payload BDs. Only the last segment
can need padding, and its pad BD fits within the existing bound in
bds_needed and BNXT_SW_USO_MAX_DESCS, since payload BDs are at most
num_segs + nr_frags.

If gso_size itself is too small, every segment would need a pad BD,
exceeding the descriptor bound. This case is unlikely, so
bnxt_features_check() clears GSO features for these skbs and the stack
segments them instead; bnxt_start_xmit() then pads each segment.

Reviewed-by: Michael Chan <michael.chan@broadcom.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 12 ++++++++
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c | 28 +++++++++++++++++--
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h | 15 ++++++++++
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index c1d3fcc7ae84..0682060b048c 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14268,6 +14268,18 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 	u8 *l4_proto;
 
 	features = vlan_features_check(skb, features);
+
+	/* SW USO pads at most the last segment; let the stack segment skbs
+	 * where every segment would be shorter than BNXT_MIN_PKT_SIZE.
+	 */
+	if (skb_is_gso(skb) &&
+	    (skb_shinfo(skb)->gso_type & SKB_GSO_UDP_L4) &&
+	    !(bp->flags & BNXT_FLAG_UDP_GSO_CAP) &&
+	    bnxt_sw_gso_pad_len(skb_transport_offset(skb) +
+				sizeof(struct udphdr),
+				skb_shinfo(skb)->gso_size))
+		features &= ~NETIF_F_GSO_MASK;
+
 	switch (vlan_get_protocol(skb)) {
 	case htons(ETH_P_IP):
 		if (!skb->encapsulation)
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
index ef04c9d08066..80d5c4f963a9 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c
@@ -82,11 +82,19 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 	if (unlikely(num_segs <= 1))
 		goto drop;
 
+	/* bnxt_features_check() makes the stack segment these, but paths
+	 * that skip validate_xmit_skb() (e.g. generic XDP_TX of a GRO'd
+	 * skb) can still get here. Padding every segment would need more
+	 * BDs than bds_needed reserves below, so drop instead.
+	 */
+	if (unlikely(bnxt_sw_gso_pad_len(hdr_len, mss)))
+		goto drop;
+
 	/* Upper bound on the number of descriptors needed.
 	 *
 	 * Each segment uses 1 long BD + 1 ext BD + payload BDs, which is
 	 * at most num_segs + nr_frags (each frag boundary crossing adds at
-	 * most 1 extra BD).
+	 * most 1 extra BD). The last segment may need 1 pad BD.
 	 */
 	bds_needed = 3 * num_segs + skb_shinfo(skb)->nr_frags + 1;
 
@@ -133,12 +141,14 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 		dma_addr_t dma_addr;
 		struct tx_bd *txbd;
 		struct udphdr *uh;
+		unsigned int pad;
 		void *this_hdr;
 		int bd_count;
 		bool last;
 		u32 flags;
 
 		last = (i == num_segs - 1);
+		pad = bnxt_sw_gso_pad_len(hdr_len, seg_payload);
 		offset = slot * TSO_HEADER_SIZE;
 		this_hdr = txr->tx_inline_buf + offset;
 		this_hdr_dma = txr->tx_inline_dma + offset;
@@ -156,10 +166,18 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 			iph->check = 0;
 		}
 
+		/* Pad bytes follow the header in the inline slot. Zero them
+		 * so stale header bytes from an earlier packet are not sent.
+		 */
+		if (pad)
+			memset(this_hdr + hdr_len, 0, pad);
+
 		dma_sync_single_for_device(&pdev->dev, this_hdr_dma,
-					   hdr_len, DMA_TO_DEVICE);
+					   hdr_len + pad, DMA_TO_DEVICE);
 
 		bd_count = tso_dma_map_count(&map, seg_payload);
+		if (pad)
+			bd_count++;
 
 		tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
 		txbd = &txr->tx_desc_ring[TX_RING(bp, prod)][TX_IDX(prod)];
@@ -222,6 +240,12 @@ int bnxt_sw_udp_gso_xmit(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 			seg_payload -= chunk_len;
 		}
 
+		if (pad) {
+			prod = NEXT_TX(prod);
+			txbd = bnxt_sw_gso_data_bd(bp, txr, prod,
+						   this_hdr_dma + hdr_len, pad);
+		}
+
 		txbd->tx_bd_len_flags_type |=
 			cpu_to_le32(TX_BD_FLAGS_PACKET_END);
 
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h
index 77d9af97cc22..5916ee08c0e6 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h
@@ -19,10 +19,25 @@
  * Each segment: 1 long BD + 1 ext BD + payload BDs.
  * Total payload BDs across all segs <= num_segs + nr_frags (each frag
  * boundary crossing adds at most 1 extra BD).
+ * The last segment may need 1 pad BD (see bnxt_sw_gso_pad_len()).
  * So: 3 * max_segs + MAX_SKB_FRAGS + 1 = 3 * 64 + 17 + 1 = 210.
  */
 #define BNXT_SW_USO_MAX_DESCS	(3 * BNXT_SW_USO_MAX_SEGS + MAX_SKB_FRAGS + 1)
 
+/* Bytes of padding needed to bring a segment carrying @seg_payload bytes
+ * up to BNXT_MIN_PKT_SIZE, or 0 if no padding is needed.
+ */
+static inline unsigned int bnxt_sw_gso_pad_len(unsigned int hdr_len,
+					       unsigned int seg_payload)
+{
+	unsigned int len = hdr_len + seg_payload;
+
+	if (len < BNXT_MIN_PKT_SIZE)
+		return BNXT_MIN_PKT_SIZE - len;
+	else
+		return 0;
+}
+
 static inline u16 bnxt_inline_avail(struct bnxt_tx_ring_info *txr)
 {
 	return BNXT_SW_USO_MAX_SEGS -
-- 
2.53.0-Meta


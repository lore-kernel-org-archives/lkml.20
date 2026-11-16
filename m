Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861820;
	b=HwKfd6hipTHqKmQ7R41SuPGEeceZ2bZi3wcekn9HkXwSL8+za2li8T26skcWlvV0sNqs
	 XN+QdNTgKE10kGC2zD49VXk2wnQ4RU8tZYtzHlVMr9cAwDwdKQ0SCaUC3y8kP3FmiiGr7
	 990iFZbibzBASJuJt6Ahpe6nfPwhqYQKlVdHKiLtRXaYSDR5kosdZrJArU3mXCZPXNdu+
	 oGcG9t9AaAktKMXrqBAixLohHops40Dq8jCS7Fe/QPdSuzdU3usbrp6oAP6Z60VYxtewE
	 NQ/w1f6Ie2C6xccg5/mZFrzGBqY5F38F9esxtkcTXrZcTxFyN79R81As3beiEYMKgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
	b=oZl+z2QrI6uqW2EL1/A/T9DECynIVWakyY1OaNqMmXazClXTacGQxQXgq6svIqk1Q4sC
	 rrYFrAgRHig73itn2GeItYGQeNYavI7jc7nBYlD7DYKCzpQTm936EmrMQHQh10SE0wFj7
	 Uemk4u0iwdvBQmzdIKSQKVl2ZVXUO3Z2YZnyE3gcLS0laElishELeyCnnIzeO8JtNFaA0
	 fmB1Q+TKiM/h0dBmsTKmfrawYhW/sOJXnjTJeD2k7FKGArCgUmzAM/NTvmDKfUUB4muu3
	 0DrUf5TIvepUZ3hErf40yBY6dPet5/UReyPmkdC3dKCzWXfRAmZykzOcwvsDtUopUdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3xwZNCL;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD7606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACD7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3xwZNCL
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4751895eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861819; x=1795466619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
        b=X3xwZNCLwkCYysF0BNoJST97rLqLD+Ft75vqdFXH7b9O88lZA/TFmBF5omZIORKjQ+
         Wne5+onlyOhtvhKicM7T0SRBRoq6ufTf/OcG1fr0rr/YI53smvnuSANgt6diJ/d0mmLO
         PG/yPE8hjyluIxTY+O/UsuWtwknfRoAdz/M/nJkLPArlttlC6fROSgRl8cax3SJY7s86
         MxW3G+NYDBwe21TUex+9Ww5hL79xsiPt+/duWv3QjZxORLPZdgZ58qCrYFapZKtVxm9q
         kteeXi3UVHHc1Tpu4rhZwglHJp8aU1HMjqQClIStnLDKlr0i5LeaDn48akosH2sbNDe8
         AIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861819; x=1795466619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
        b=HHpBE0C/z8AWfj5JLmM3iLSHl5Mm8iBkIC7w2nF5d0atSXnN1fo9kHkLAHBYpFA5hZ
         rN90WZJRhjZnkOFdUuVmtTYaFR0vYXYe1vTFdZX89krUIBWP4wREKrNGLn01Of2b7Lbc
         SIg0agKKsH2yPOwXlOInkG4E/cP60Z+LL1TjYRTO3YNmn/aw/5NUpUpMyEScN3PktZk3
         uOhrckClhsQRrO2N5HwnuRVQFSw2UeAJ8mL62r5C9Etsvn35XEO5ZomQvnneJwez5PKh
         jRiIy2b7N8UZWxX7pe8DpIBYVHv8zRBRwPmS0mw6toN2hc0Y3TFDCvHQVa8jZl7JpctU
         gbxA==
X-Forwarded-Encrypted: i=1; AL+hErHMK4CRvzU9fGrQPzdhypEp6IZuMMGpfa6zyOECXUvC4Tya9XhP5XKTAsjJTHX/BTVxhAKJ/uoqlr4ccwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TTcMNFbT4wIg/HdGF8y/BNd5dlMDv0c2i2qlNDnh3TjDnJPGX
	uNsvWU9wGJok+gYQSoGlYONCYTc6ftrQ4PGjsnPuxJJNwpIpTvJCNNV0
X-Gm-Gg: AZFdTZfs0tg0u2LyA3H7sQ9ku7SWMNOrH/XEU7o3T9c6a4brFUrZHv6UqlvxfLKQm10
	k908mNigzWRtw1Xyz78jmQ2i2kX3hSKDuln70wCF/BjlOy8JxpmlNhvxhc4LhrcnLLCZaNO/k+f
	WxEJwsSdf2ZMkYy0wl0NredzeotZCS/Jsmrlz/JONWwkeyjae08NHY9PqsvjmEQHapcAP/0vsRw
	8MV56k3KkiZ14UoJiw0KITu48hebZLImRfCAxPNIgykmLaD9KR4z0x/xi6aeUDM3yWDCg3UtZKE
	MN+F3r0RjX7jDeme+Dfz8hOCY6s52ahJISnZZ4N+l1r9B+MU7gInrQsubJrFJWe1jcqv3TMagYA
	HaJuntFselxQ7N9LNeQVdPHfTatFxKajKkVxPV2DmTYDX074zkSPr743rTBZZBkx4hNWGnPsnw7
	EWVCefwu5kKKx6zZmWwpJvUFpuKtCN7KiGKLBCkvnwUrf67ODmuucnstlS6DPHKNMf/Cwrejdsh
	oECPMds9L71c7Vm4NejU10T686aOqmblpZLWEzcD2f8WZZ1YIx+ZWpblu2kld4Eoh1MJrgcz0CE
	urUPxF0rFy8GqT9uHba6yKfe6Jg4aZxjoKQQuBb3xD+RKpov2LgKmF02ktT6vSdfpg==
X-Received: by 2002:a05:7300:546:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-380f8fdd828mr1175048eec.35.1794861819021;
        Mon, 16 Nov 2026 12:43:39 -0800 (PST)
Received: from narcisav-mac.corp.tfbnw.net ([2620:10d:c090:500::7:8f78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm49553549eec.19.2026.11.16.12.43.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 12:43:38 -0800 (PST)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narcisa Vasile <narcisav.kernel@gmail.com>
Subject: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Date: Mon, 16 Nov 2026 12:43:13 -0800
Message-ID: <20261116204313.23023-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.53.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose counters for HW GSO skbs and the wire packets they produce through
netdev queue statistics. Update the counters when TX completions are
processed.

The tso.py selftests are skipped for drivers that don't report
these counters, so this also lets them run on bnxt.

Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 ++++++++++++++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  6 +++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6846a27bfef4c..1a7a93bf684ac 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -869,6 +869,11 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 		cons = NEXT_TX(cons);
 		tx_pkts++;
 		tx_bytes += skb->len;
+		if (skb_is_gso(skb) && !tx_buf->is_sw_gso) {
+			txr->tx_hw_gso_packets++;
+			txr->tx_hw_gso_wire_packets +=
+				skb_shinfo(skb)->gso_segs;
+		}
 		tx_buf->skb = NULL;
 		tx_buf->is_ts_pkt = 0;
 
@@ -13820,6 +13825,17 @@ void bnxt_get_ring_drv_stats(struct bnxt *bp,
 
 	for (i = 0; i < bp->cp_nr_rings; i++)
 		bnxt_get_one_ring_drv_stats(bp, stats, &bp->bnapi[i]->cp_ring);
+
+	if (!bp->tx_ring)
+		return;
+
+	for (i = 0; i < bp->tx_nr_rings; i++) {
+		struct bnxt_tx_ring_info *txr = &bp->tx_ring[i];
+
+		stats->tx_total_hw_gso_packets += txr->tx_hw_gso_packets;
+		stats->tx_total_hw_gso_wire_packets +=
+			txr->tx_hw_gso_wire_packets;
+	}
 }
 
 static bool bnxt_mc_list_updated(struct bnxt *bp, u32 *rx_mask,
@@ -16350,15 +16366,15 @@ static void bnxt_get_queue_stats_tx(struct net_device *dev, int i,
 				    struct netdev_queue_stats_tx *stats)
 {
 	struct bnxt *bp = netdev_priv(dev);
-	struct bnxt_napi *bnapi;
+	struct bnxt_tx_ring_info *txr;
 	u64 *sw;
 
 	if (!bp->tx_ring)
 		return;
 
 	bnxt_sync_ring_stats(bp);
-	bnapi = bp->tx_ring[bp->tx_ring_map[i]].bnapi;
-	sw = bnapi->cp_ring.stats.sw_stats;
+	txr = &bp->tx_ring[bp->tx_ring_map[i]];
+	sw = txr->bnapi->cp_ring.stats.sw_stats;
 
 	stats->packets = 0;
 	stats->packets += BNXT_GET_RING_STATS64(sw, tx_ucast_pkts);
@@ -16369,6 +16385,9 @@ static void bnxt_get_queue_stats_tx(struct net_device *dev, int i,
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_ucast_bytes);
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_mcast_bytes);
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_bcast_bytes);
+
+	stats->hw_gso_packets = txr->tx_hw_gso_packets;
+	stats->hw_gso_wire_packets = txr->tx_hw_gso_wire_packets;
 }
 
 static void bnxt_get_base_stats(struct net_device *dev,
@@ -16385,6 +16404,9 @@ static void bnxt_get_base_stats(struct net_device *dev,
 
 	tx->packets = bp->net_stats_prev.tx_packets;
 	tx->bytes = bp->net_stats_prev.tx_bytes;
+	tx->hw_gso_packets = bp->ring_drv_stats_prev.tx_total_hw_gso_packets;
+	tx->hw_gso_wire_packets =
+		bp->ring_drv_stats_prev.tx_total_hw_gso_wire_packets;
 }
 
 static const struct netdev_stat_ops bnxt_stat_ops = {
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307a..51c1568432b67 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -1016,6 +1016,10 @@ struct bnxt_tx_ring_info {
 	struct bnxt_ring_struct	tx_ring_struct;
 	/* Synchronize simultaneous xdp_xmit on same ring */
 	spinlock_t		xdp_tx_lock;
+
+	/* Updated on TX completion, kept per ring */
+	u64			tx_hw_gso_packets;
+	u64			tx_hw_gso_wire_packets;
 };
 
 #define BNXT_LEGACY_COAL_CMPL_PARAMS					\
@@ -1176,6 +1180,8 @@ struct bnxt_total_ring_drv_stats {
 	/* end of ethtool -S stats */
 	u64			rx_total_hw_gro_packets;
 	u64			rx_total_hw_gro_wire_packets;
+	u64			tx_total_hw_gso_packets;
+	u64			tx_total_hw_gso_wire_packets;
 };
 
 struct bnxt_stats_mem {
-- 
2.53.1-Meta


Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794050922;
	b=nN3CmWVeSXtS53zIsas65LNBhk6QfNwiaBAikK8pFv7i7T/RlMtg56dY+wfeOWIwM/Re
	 Biou2RueOQooXUFnKI/2RS33G8py13nAtuBD7NiljgaOOYFuTO1ycBa+ErqFxj38g1SqX
	 b0ngmq3sJ5LStHstCY+Gxm2tefabXwvxLTHda2bPynbC0gpVcNvrpYK821bYqjGqswChI
	 y/qhAV+6vwktiTR0eUt/DkYfkombhFFRBXyqFUxkYlWY+J4sxAezuGAnoZHLgL6eO+Vgr
	 t3PrwSXKkFftT/EFl1rzb0q1t76nDgUbQEJyWn+p9ApiUdsjzTBRWNnxiiCHg0mxtUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050922;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cv66KK32Ayr6RQFReAmYKAI8E1Tl9jHQrKRRdKZDR7s=;
	b=tdSBIXzBw3ocmoOF+otFtN7Yj4t/WwtYGXlVYVGyPmgsVLBgkT9sZ+m+LQb8zzqJjFh/
	 euA3/sAkHZzbO4S4nLZXt0srmDo6zTiASBGo8SzzBWG0WwmbYMv9LvksrxQ96CvL6T1bp
	 k9pPwiwxohUIKlABKq2p2sBNJEf+DcQ2KBCAzF60uhjCTN6UIAOlVgk2Wn0LkqOutPEBr
	 PlKC5WhOoMYJoOb4WtD4+bQ9ZXG1n70PsEmCZQh2I2/Rt4PkU3TsLJp1JYekJnC+z1NmD
	 bEbqSPfcjv6zwEttHrthd//1lGMU9wWJS6haHrQJUWm2JnJ8XNqtoitPw7LBRiGwy6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hW6nN1tC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769D2606A32E;
	Sat,  7 Nov 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hW6nN1tC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794050922;
	b=hsyQgcd9g1JqZoRkyZ39lGTtcfhivuMmOlq1Smqrk8yc7halyLAqtOxFsO5dkQcHlHhm
	 Owgposdl7iQxkjJUMxr83ihIk1mVSSk98P9sYx95ObTYO/BWtlwMbNDIXehewtAaQ1sDw
	 z3I9Wq6uY80P8ya9QW4iZoYmzsa/TzGy+V8Drt1bRE1z0FUHr7uak+Z9vZ/UYFwZLCnwm
	 U13rBRB9SQ2WG1G5V2kuwXn8ylrqQmaicBHQuQ9nPixpquxhwGI+SRNqlU9KdVViHN9VQ
	 gRi2hzn8wFO5mxAeQd/bCQ9syNyGFFqEzBLUaa2Scu+9mlyqUUoaZnIdTQ/CCL49ehg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050922;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cv66KK32Ayr6RQFReAmYKAI8E1Tl9jHQrKRRdKZDR7s=;
	b=QoOVeAJklzH5z7WdQmFOmURnuNWw0T/VteA/9TsDoGxPQUO3sfNbcZMJCVxokokMzlvK
	 vkOJ9QPjbjkCbGcvru8ukyACjhuMEBaO3ec0Y2iUyI8Ew+vVyPmfonMXUBBVmHLtsM5Xx
	 XNBaxpl4nAheXbKDD8ydwC69jJfkp4tWk2kOIXmcoQWG+jOS6a1LiTgCLlmOeCn/7/bam
	 JnWFnvvttAY9pwNNPjl9nDp7wAJtWr/xA1GMBTwH9OkbpXd++Oqjfe8j4J46JBDHFdJxz
	 E7SCCUgTUZvUoqfVLE+eUc3NI4U0uUzdPtScuWGPUKcOsBKINSfy4GLXnXgqH5d1fwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A32F1F008A3;
	Sat,  7 Nov 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050922;
	bh=cv66KK32Ayr6RQFReAmYKAI8E1Tl9jHQrKRRdKZDR7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hW6nN1tCztcQJUuSXOFfWmOzEEizT2aqQ70LiAO5jKzDpDX/ECsGVpOztTOVEN64A
	 GkmKm4KBDlK0Dx1vzCqVFSDrTQlP0kW2DnTiRQVF3kfKXdBswbge1qGHq57J8uoN0b
	 f7Wi6KLGZ3truCqVTAtjVSmVvIcrKBcsvVjdRoQ+dzstk+bzYQARChNsABQs1ftxbq
	 rqf4n+ClXimVw0TbCU4D2/Tsg5JLuJXL4cw2S7x2RKGV+iBIixjla1tCP0MjHoZFbf
	 sXAiQWgYN4JCeFHqGkH1IiaujXqryCleqZNDeKnkZfZfT6qyPD7Y1BupM6ANxmsxwo
	 rD6AIAAjor6sA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1808047BBD;
	Sat,  7 Nov 2026 11:28:41 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 05:28:41 -0600
Subject: [PATCH 2/2] staging: octeon: prevent buffer overflow in
 cvm_oct_xmit_pow()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-octeon-tx-fixes-v1-2-db03f73a6e6f@gmail.com>
References: <20261107-octeon-tx-fixes-v1-0-db03f73a6e6f@gmail.com>
In-Reply-To: <20261107-octeon-tx-fixes-v1-0-db03f73a6e6f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794050920; l=3088;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=A73cNrYJxl0LgvL86wV5fevUF4EgHv5VLNNXVCqJff4=;
 b=8Ohcw2vIma8Mg7JGcXtgSkTTw2bGrzFslZyZUPh1Dc32Izwc+uKQjFsCQN1LmFjihMSUd16kl
 wujqUh13KwFCFCp66N2MIoiHiPKMfemd5eYFM3ldJnuLKrYeMR53jXc
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_xmit_pow() copies packet data into an allocated FPA packet pool
buffer without checking if skb->len plus the header offset fits within
CVMX_FPA_PACKET_POOL_SIZE, which can cause a buffer overflow. Drop
oversized packets before allocating hardware buffers.

Additionally, fixed-size memcpys into work->packet_data read directly
from skb->data without checking skb->len, risking out-of-bounds reads
on short packets. Bound these copies using min_t().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 13a205648f8b..0a350faec591 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -507,10 +507,18 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	struct octeon_ethernet *priv = netdev_priv(dev);
 	u8 *packet_buffer;
 	u8 *copy_location;
+	size_t header_skip = sizeof(u64) +
+			     ((CVMX_HELPER_FIRST_MBUFF_SKIP + 7) & 0xfff8) + 6;
+	struct cvmx_wqe *work;
 
-	/* Get a work queue entry */
-	struct cvmx_wqe *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
+	if (unlikely(header_skip + skb->len > CVMX_FPA_PACKET_POOL_SIZE)) {
+		dev->stats.tx_dropped++;
+		dev_kfree_skb_any(skb);
+		return NETDEV_TX_OK;
+	}
 
+	/* Get a work queue entry */
+	work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
 	if (unlikely(!work)) {
 		printk_ratelimited("%s: Failed to allocate a work queue entry\n",
 				   dev->name);
@@ -538,8 +546,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	 * calculation may add a little extra, but that doesn't
 	 * hurt.
 	 */
-	copy_location = packet_buffer + sizeof(u64);
-	copy_location += ((CVMX_HELPER_FIRST_MBUFF_SKIP + 7) & 0xfff8) + 6;
+	copy_location = packet_buffer + header_skip;
 
 	/*
 	 * We have to copy the packet since whoever processes this
@@ -586,8 +593,10 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		 * ethernet header to align the same way hardware
 		 * does.
 		 */
-		memcpy(work->packet_data, skb->data + 10,
-		       sizeof(work->packet_data));
+		if (skb->len > 10)
+			memcpy(work->packet_data, skb->data + 10,
+			       min_t(size_t, sizeof(work->packet_data),
+				     skb->len - 10));
 	} else {
 		work->word2.snoip.is_rarp = skb->protocol == htons(ETH_P_RARP);
 		work->word2.snoip.is_arp = skb->protocol == htons(ETH_P_ARP);
@@ -596,7 +605,8 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		work->word2.snoip.is_mcast =
 		    (skb->pkt_type == PACKET_MULTICAST);
 		work->word2.snoip.not_IP = 1;	/* IP was done up above */
-		memcpy(work->packet_data, skb->data, sizeof(work->packet_data));
+		memcpy(work->packet_data, skb->data,
+		       min_t(size_t, sizeof(work->packet_data), skb->len));
 	}
 
 	/* Submit the packet to the POW */

-- 
2.56.0



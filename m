Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794050922;
	b=M/ppHKZShKX1Di2yPAMjviFHidMWn6YPWkFUnklknqFx1Emh+Y5UwTUmzlAjQm+Ilzhr
	 q4JtZg3/bgeMaCYdwQKaef2nU4BFeoiErJzQHFBKuLfdaJzbGvAivGxorfZBTVq6Yzlz3
	 +OnvKHZV1Vb2Rj6C/JMmVZYZGcvTIMS6em30XN7MFRIA1fcA1NdonnuhYzetVrg1pcJOF
	 karLb7b1I0EjQQvMl+LnBcVaN7mz5oEErRmCBOS57fVxtTzK2Vqgwl7eIgs7k2IqSC3rm
	 XXWclpwJ0OIMdV2SzuuVBb7ZlPx6tsqrdXmcR0VE2/Wl4f3eQIhC3A9iqfMRdZWluBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050922;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ODpSAiy0AWNEMjPy4BK+3JcjMRdr5h0L5vv8WURYG/E=;
	b=hX2W+bqooRmWNwNtidyPOOj5ODnQ1QCFcJQB/xiYCMuPEGXdzVh6GmZ12Z30ovxX72m7
	 ppkI7eENMl9KTaHBud9CtPp8C0uU6ZIopphGuAlH3Mq65n3pjKW6s4lIzZFQguXpbrX0m
	 nTpk2mG/WXf+VhW17rDESVbx+BKVBueUEFGXKe4Qm2l+uZhN/GW2yC8eklbtUrCWkql11
	 Yk2jVhtxgdab7wUV/3UFU5Mcs/0eXUBLNClj579BtRDfnknwfNDzmArwF1fsaKR51q8Ax
	 ga4XgssUR8IE178WdMwkHHnnBQ8t/74oceiO93BvDnBJc1lTFPha64C5K5fNDYp8p8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KUVJHf7/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C81606A32C;
	Sat,  7 Nov 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUVJHf7/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794050922;
	b=GRJd81H0kzCOehlY8r3Y/jKOSc9wcY1ueY2UbYxyWQoi5b6O98E1LerFTIJgp+TLp6Ew
	 E1ZmzxsMJpSgcEvyaIEp6vUvAyopwCTkiN4eZoVZtsBTjTt70yUBK7PY40qnOGnvIrlHw
	 TAiwRtJUjbOTgvbM8Ku/gQ72k02Lc/0j/DWnZx7+JI/eF7da1mEVvI1xEeidPHIyGWs6N
	 Kckj5LEF03R4yX69EFXMsPYi1hEuHJPkMFTGVUxrb10nevHu342s2/Vt1d7yz8rp+en5L
	 hY4vhd/lXEFBKs5fW9Q70UBFKATcWfMPDgiGDkoEfzhU76B/EUZ/nxv4qMftJWz4SLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050922;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ODpSAiy0AWNEMjPy4BK+3JcjMRdr5h0L5vv8WURYG/E=;
	b=0SD8x3PVYvDuL03dcl9WhokDGTQIsg1X9IR4x3sKFyKhxIOLptCbAjF/QEHOXMRNriVf
	 3sR0AL7i887df6dfbkhAjSbJyanhNA6G3fyxEgtyDfpOuPYIRyVfU19HTdR2CaHFOOZ/R
	 oAXNTNSxzg3B2gH44fPs63iEJQnGvi8uIrA3ftc/BvodynwdOfZNXK3f6F06HtiBbqwYq
	 81betlj07+SA1/WDmIIc05yjTooWf4vdIhu4/GbvtdCjtK9SMbLxGdqiqzpaOLzuB0V6O
	 ww0j5WPEGfGJNJkpIjKUzNxNBlVM3c2b/N9fYSKp9LVI/IYWhmTPqehzGM+I0LxXmzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8528B1F008A2;
	Sat,  7 Nov 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794050922;
	bh=ODpSAiy0AWNEMjPy4BK+3JcjMRdr5h0L5vv8WURYG/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KUVJHf7/l7bDOfTqcYEdltxU9Xylrfm4PKXa3aMRdAzn4XXyfv2e4ubfb32vGNId8
	 DSEupq9tozXegr/5HqA9bwDxksBAAibdLceG6igvu+K43ClyFDfqgdsFbZLwGE9IoB
	 C/sMEhy5kW1TK9VKeoDR0yJ0ho64zTvcaywOvrA9QKalFN1Yjazpmtq2ctsZcMdtjM
	 bpqqifxNJ1DV7O0GqKYLExQH53fvOOy34oqmGZjlOo4CPSXoKNAT0chD1WREwFyi/E
	 CijO4s1qMn+35hD4IDZ9PSJbxWxx/O8LLDXfRZP9hPTHIKasnW1GUwKEaANczH3OeV
	 2MRzvfNjhdykw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0796147BB6;
	Sat,  7 Nov 2026 11:28:41 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 05:28:40 -0600
Subject: [PATCH 1/2] staging: octeon: fix return type and void arithmetic
 in cvm_oct_xmit_pow()
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
Message-Id: <20261107-octeon-tx-fixes-v1-1-db03f73a6e6f@gmail.com>
References: <20261107-octeon-tx-fixes-v1-0-db03f73a6e6f@gmail.com>
In-Reply-To: <20261107-octeon-tx-fixes-v1-0-db03f73a6e6f@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794050920; l=1936;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=uv0ajB/v7UJ7qTX2q5slJYpaa4Ctj3c6fam5AwUuhec=;
 b=kN3EdoAHkeBaPGbtyCSYiHdNHJq+zHf4O/qvNIHN/mxnlEgt8pN18didbY8zff3ueC41Fj5cU
 mDq1W1/GR3VDGyqAARRP4XkeAi/o2yJJNxlxKazFusof4WQmysRTr4i
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_xmit_pow() returns netdev_tx_t, but currently uses naked '0'
constants instead of the symbolic NETDEV_TX_OK value defined by the
networking stack. Replace these with NETDEV_TX_OK.

Additionally, arithmetic on void pointers is a non-standard GCC
extension. Change packet_buffer and copy_location from void * to u8 *
to avoid -Wpointer-arith warnings.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..13a205648f8b 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -505,8 +505,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
 	struct octeon_ethernet *priv = netdev_priv(dev);
-	void *packet_buffer;
-	void *copy_location;
+	u8 *packet_buffer;
+	u8 *copy_location;
 
 	/* Get a work queue entry */
 	struct cvmx_wqe *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
@@ -516,7 +516,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 				   dev->name);
 		dev->stats.tx_dropped++;
 		dev_kfree_skb_any(skb);
-		return 0;
+		return NETDEV_TX_OK;
 	}
 
 	/* Get a packet buffer */
@@ -527,7 +527,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 		cvmx_fpa_free(work, CVMX_FPA_WQE_POOL, 1);
 		dev->stats.tx_dropped++;
 		dev_kfree_skb_any(skb);
-		return 0;
+		return NETDEV_TX_OK;
 	}
 
 	/*
@@ -605,7 +605,7 @@ netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 	dev->stats.tx_packets++;
 	dev->stats.tx_bytes += skb->len;
 	dev_consume_skb_any(skb);
-	return 0;
+	return NETDEV_TX_OK;
 }
 
 /**

-- 
2.56.0



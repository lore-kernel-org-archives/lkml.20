Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614343;
	b=QernYCRYeztWvfa3ZNMkrMR6rEJze9DRefDRcm9OSMGD0P1/FA4kfW1JUMbYez2GWDbx
	 eorV9HQe1/1BWfwmg/+aGbhyqaPNn/S9MoTX+Jiqlyt4mnyHqkjFm99rmi99QxNoDkf5/
	 vHa3FkLi6XVB1Us9Wx5XPWTDWwmfMWMseImaZl0wDzxhifa7IX5vZNvA+O7j0fzE/Fx0f
	 wS+F83780X4qb7ZAVy4m67sIzMICNZ7MgvFljFtrBVtMLpArN43DOnIJ72SVG1qflIdcY
	 ur4UW8hYsVBfP/M4U3Cl2DtLv1l0lslWFD7hspwzRFEXVvza+wU8Ef4VZoAfhQ+cIbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EVQIgja+KMPXdTV3DxptR9gCtQg/oHJzcCZeV6M7rI0=;
	b=wJ/Bb9n8L8Eaba1GGqN1V6apsyAgfWozylTGTZKF7MBKXMpOmI1O2euadD9mRwSMWPWi
	 N8cQOyC1MKS7c4zvkSghY1NZwEQxWFuqXdKf7FCJCSE1pbFuj8ee0rrqztA3dheXy/U5j
	 abtmhBW3mVSElc4KVf8ykBoWFeIFWP+BI6fpnzkLWx3UNPMAQf1Nc16scHrXW5OVMWf4D
	 sVQ5K/Pke/21b4uJqLwP5lCqFme4P6Smg9KPj2AT5ebPGkXeJekXHbLMtAbxIat3R3DSJ
	 AlMCtCVV1csTAq5eX5emnCjTqME3Eg1GKg8aVgC6SiGu+qnXWyKEa7BKJFqdU7pX0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcYnU9wK;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E34606A8B7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E34606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcYnU9wK
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d21051042so323565266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614341; x=1795219141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVQIgja+KMPXdTV3DxptR9gCtQg/oHJzcCZeV6M7rI0=;
        b=RcYnU9wKb/bGVQGflm2btBEsjiQpoLNIKdcmqYs7m3ClQbS3wsScIUisGYrUqMOyu8
         v2yKz2F3b/yGI7FAv6EaqM3HzjLB8ouajjZIV6CVi6hDLf8OcVwE+TqyOPFsT9e/Ttpr
         Cr/TO+NZsSGFFTUtAJw2IlvRvGObOkLbhlo1aOkxN/PAG591fMxd7HpL1kAe5CcObyik
         GtecC8+Mi/x7sjwIOPx8RTEO9yp3u0OKS68R59PP/qHRDf8ZAxT3mJ8kA5ynEsvlRagt
         BT2qeHo3grbbCSCfdvi8QfBk7prnxys4KGao9uc06mV9Qe/sSC0VBiFGwKSW6FvgMCU6
         aZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614341; x=1795219141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVQIgja+KMPXdTV3DxptR9gCtQg/oHJzcCZeV6M7rI0=;
        b=0ysoOL4YBEqx2TmQ0uv5Gxplkn8nTuAFs51IcSa79SXdyg1t0C55Ns5FjeGZKybd5V
         AaOBD2u4emF6ibpNmAA8AJWMt/eoalDE9o3g0SLMmjTCGWhJz3LU5dztsomOuYHuQXep
         eIsT+2JvtYc9HRmOwXfzeHObxTiarR+Yw88mPdsbItQvfTwxoIpl69FqSowMX6RxogNj
         NJa+mIE28ye4lKIDg8rebQv+YJsxEsjuq6Nds15d3GEdWMFobpyZD+jWnQVh/sBlPkXN
         gQIKyWhegJrMEiqKITYILRwJMwEQmbNqZXB/3lR4UK6OXv5Z72P1I5V+uCmuVK/50+hh
         I4jg==
X-Forwarded-Encrypted: i=1; AL+hErGmU9QZYtrrAjGRDtfAOinPwuDyFBdtGGJQ3Lz5y8/o5ewieA2fVof2vsjFhfk3yoMrFclp/72Ee/O1RXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dA9kL9nSqx2Al5X4qoeKNbZHhRSGBKbNSVlOMPVZYS2STwbsr
	6yG5kxixG7WUc51vJ0cixDKZdfWjRRAPVZx9HecEbpNwqM4IVJFVsxBU
X-Gm-Gg: AYBFou0t6z/e4vEWGMTgN7QS+nUurFbN8TUOQuFIOuM/KMS3wR8rWk++IEEnEp3iOta
	+bE3uRqHcsXnGRMNhzd+yRI0SqpOd364wZktcZDchahbEsZmGwO0E72DRXopTE+tyHDKNVOKoNf
	RqHF6ANoMFWv1rM/jTyWKxG/v68bJNVg6ADNFpyKSi7HkYTV9WusaDfbnRA2QMnX6JzwNI6tbkg
	UtfXCStDLnv6tN7uWf1K5dZ502PdEqkztj7L0JZlFsLF+Ox9qE9AffZUeS0kjqszR5A15Gab2tO
	9tg64H+XAFQ5+89cH1S9Db6e4h9KC+rygITAe5zNt5DGSx5aTJWfGLBik6g+13QcYN9f7p9Kp8z
	D5ycDYxurRmNSff8Z6GyI9jLNidoZ9JrWgyF0fz+Ld7lyr9EFa3EVqTZ95IaynukgqBAFdz0dKi
	qGn/TpmomwCSSSwyyK9t/rMnYdiSnsu8S1G0KKnIfbciD4CkgQNhVCdYzOli0yqQaJ5dCP6EVDM
	aQyAD7mC9/m9TymXSAt7Wonlz31YKg1TeTyi9nxVNWOH576Y7VVY7hYlZdfwuYEM+N3oU6c48X+
	OKyTuaPu7KB+9ErfUoXcEe2dJwUSuVM8w+bY4KjU
X-Received: by 2002:a17:907:86a0:b0:c44:16ad:c31d with SMTP id a640c23a62f3a-c509614d4abmr362582466b.4.1794614340662;
        Fri, 13 Nov 2026 15:59:00 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:59:00 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 7/7] net: bcm4908_enet: order the TX ring index accesses
Date: Sat, 14 Nov 2026 00:58:47 +0100
Message-ID: <20261113235847.517308-8-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-1-kudzo51@gmail.com>
References: <20261113235847.517308-1-kudzo51@gmail.com>
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

Since the TX interrupt was added, poll_tx() runs in its own NAPI and
does not take the TX queue lock, so it and start_xmit() share the TX
ring with only the two indexes between them. Nothing orders the
accesses around those indexes:

- poll_tx() reads write_idx, then the descriptor and the slot. On arm64
  the later loads may be satisfied first, so poll_tx() may see the new
  write_idx together with the previous lap's descriptor, which has no
  OWN, and the previous lap's slot. It would then unmap and free a
  frame the DMA has not sent yet, or free the old skb a second time.
- poll_tx() publishes read_idx once it is done with the slots it
  freed, but that store is not ordered after its loads from those
  slots, so start_xmit() may refill a slot before poll_tx() has read
  it.

Publish each index with smp_store_release() and read the other side's
index with smp_load_acquire() before touching the slots. start_xmit()
now publishes write_idx right after the descriptor, before the MMIO
write that kicks the DMA rather than after it, which narrows the window
in which the DMA can complete a frame that poll_tx() cannot see yet.

Sashiko's review of the previous version of this series pointed this
out; I have not seen it on the hardware.

Fixes: 12bb508bfe5a ("net: broadcom: bcm4908_enet: support TX interrupt")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 26 ++++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 4139dad3a..8bc620de2 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -566,7 +566,9 @@ static int bcm4908_enet_stop(struct net_device *netdev)
  */
 static int bcm4908_enet_tx_free_descs(struct bcm4908_enet_dma_ring *ring)
 {
-	int free = READ_ONCE(ring->read_idx) - READ_ONCE(ring->write_idx) - 1;
+	/* Pairs with smp_store_release() in bcm4908_enet_poll_tx() */
+	int free = smp_load_acquire(&ring->read_idx) -
+		   READ_ONCE(ring->write_idx) - 1;
 
 	return free < 0 ? free + ring->length : free;
 }
@@ -619,12 +621,14 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	dma_wmb();
 	buf_desc->ctl = cpu_to_le32(tmp);
 
-	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
+	/* Publish the slot and the descriptor before the index; pairs with
+	 * smp_load_acquire() in bcm4908_enet_poll_tx()
+	 */
+	smp_store_release(&ring->write_idx,
+			  ring->write_idx < ring->length - 1 ?
+			  ring->write_idx + 1 : 0);
 
-	if (ring->write_idx == ring->length - 1)
-		WRITE_ONCE(ring->write_idx, 0);
-	else
-		WRITE_ONCE(ring->write_idx, ring->write_idx + 1);
+	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
 
 	/* poll_tx() wakes the queue once there is room again */
 	netif_txq_maybe_stop(txq, bcm4908_enet_tx_free_descs(ring), 1, 1);
@@ -718,7 +722,10 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 	unsigned int bytes = 0;
 	int handled = 0;
 
-	while (handled < weight && read_idx != READ_ONCE(tx_ring->write_idx)) {
+	while (handled < weight) {
+		/* Pairs with the release in bcm4908_enet_start_xmit() */
+		if (read_idx == smp_load_acquire(&tx_ring->write_idx))
+			break;
 		buf_desc = &tx_ring->buf_desc[read_idx];
 		if (le32_to_cpu(buf_desc->ctl) & DMA_CTL_STATUS_OWN)
 			break;
@@ -733,7 +740,10 @@ static int bcm4908_enet_poll_tx(struct napi_struct *napi, int weight)
 		if (++read_idx == tx_ring->length)
 			read_idx = 0;
 	}
-	WRITE_ONCE(tx_ring->read_idx, read_idx);
+	/* Be done with the slots before start_xmit() may reuse them; pairs
+	 * with smp_load_acquire() in bcm4908_enet_tx_free_descs()
+	 */
+	smp_store_release(&tx_ring->read_idx, read_idx);
 
 	enet->netdev->stats.tx_packets += handled;
 	enet->netdev->stats.tx_bytes += bytes;
-- 
2.56.1


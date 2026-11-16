Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854124;
	b=C2ftC5OhMQl6L0eButZ0ieEZZRriAllJBSzCwRhd07r4R4zL+3rdytNZ9EZkt2sfuxWg
	 8HhzevWz671nUCtTIzYG9basr2W6Z0NijobZ8yCDybekODi6cfC2MzDjIW1pyN4xR8CRM
	 ASCEiZagQSfTIbUhPqK9um+GBLYbtFRR20rL4f5dFGeAscq09YKG2hO+xlEV60MjaGl0J
	 9uz9NRtDjUG7tnxk/8UZkMapxHp3gvcRWlMz3t8LnGlEYbJT3cnqqjSedM85InKfUc8yS
	 50Q7yuh3zdsP+4YBZsCB3IbmrU3cuAK/8xjZT6CZ3mw4R56WGrMk1uYIkkNg52EKR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cy/lKXDY5Mb2V69eFqBf0CzvLZ8atfymKEUEwZZTm+k=;
	b=xs1/3Q0YDf9bsGwqX4wqG75l6jeXkyGERl3H6/VF785YtlXY6kMYUga2J9rtugzl5+E3
	 /T20YvAgQeja2SMyhsEJ8NY2hr6oW7G/mPUBQpnfSt1UxepuPe/zOyDWI2t08aaDu4Z2c
	 wlJiIn7oiw+ITnlH+GGIuv9mdyiMBH1RlKwCvl8DNqqwCq+4rwXPaUmXG4yJp9UP/iuUC
	 ToHeCSNpMJR67KxjTvTfPl7F7cISqGLnAknAwyKS/yRY+sIE1/30qfwZuhhbPijpMhxHG
	 YuC+/twXEGPK9+1m0mosLHCrW8lngwySyGHOJo0MSm4IIP0DE9me/33Y39Apk2S4FhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HEs0XthU;
	arc=none smtp.remote-ip=209.85.221.225
Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36F606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B36F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=HEs0XthU
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so3943120e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794854123; x=1795458923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cy/lKXDY5Mb2V69eFqBf0CzvLZ8atfymKEUEwZZTm+k=;
        b=HEs0XthU1JVMMyw6jGXv/qHlwmSNULfEGcbWl+T5VtuMJ8BSTNgy4+/E8HZEJF2ckw
         ZMEi/iDAlX0yYeOk5PtsZQayuIyvTZkn6/ED8FUZwoBFQ/B4dhgBJtb640nufxpAyvBv
         YgPaejepQYyQlauUbp11xXE4D4agn4czNypoE6k/s28LB4G0maTqvadg0oZbbguy1U9V
         rr2KPKCVI5iIh/TXmM1NUnkeDCT3xOTJ2kvaRhywx8CbgSe0X7oDgt/zdpH+biyGqTwt
         Osh4v0k9IceIFspbxjijhYHrp/WxBW1S757za1NZRN76gl7lJlDXpM4T0cSUJDDbkUCT
         kJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854123; x=1795458923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cy/lKXDY5Mb2V69eFqBf0CzvLZ8atfymKEUEwZZTm+k=;
        b=AQK7VVGxf6dO73Z+6UK6wdSf1/AU8nX1wDDm1g98AFKb4TtAfA8ftqM5UFJLMYpuw8
         DcOexC95I8WIrmu464XFx9TvZgMh6OwFFZt22akD+KaN8B5bzNgYGJWm1fgtlwXE30E8
         syI0yZdXS+mNLF9BbadtmjFOLUaqQO5VcfhSRRbH7dXT4x6eiGr8Rp8FSN1waw/NW23p
         RwUM5PjiIUQYJ7zBFEs21LEgueDDS87178e5Q4rkvVfOjGX6wfarV1XJ1uwn/HgBSm0F
         x7m0uMcOloC07pBwde1gycI9x1riNCLJff94qwhUsLsTEdz+lJMAxIUXZcz6HPvmhg1T
         GuGA==
X-Forwarded-Encrypted: i=1; AL+hErGnVEAAYyKQkDq7S6ifRVl/4saqUSKoMVC/01fpMd4WsbbMqn3v0s2ooGPZLcdKpmzkwgDO7ni//p1/GlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JfL21G8cHeBly1iR8OZxYlzC77fHolgkGT4q7UmOJ8cBGQUlu
	0wxnxKrwLjn1U3BEH08OreuEqkyBWC00xZpLgTz2jxZSFnbgYeTanCMy5K+Yv4UHFZW+oOXylzp
	XkjmZlOjUdevf32TLDoq6HQaV0WleA5LNElOFHtM6ascTI2DRG5b2
X-Gm-Gg: AYBFou1E1l6HlJFJ4DxS01/xep51kCBfG21KFNTcLrmCVOv4wcF0XHBBpiuys82FDKf
	FFxhrbH0TlUC50KCg460dNq13+MIFMz7pI7jVQ+1YsfhSzM3/djHvlAcLi+tnonKRLIybsMu54A
	c6/sFIegdCAsgpu+fEHI998P5NCqTSrKFCweccwpMf3so5UD/CBIXUEGGaAYUeYHE6D0WNNnfh+
	cEn5CjowfewMAWH4dZLNx3sZrv2QaadWpkCcZz/e6FziCpzDqD9S/3Qm8+zcPs5gL2w6tZ7Z3cG
	AP8Ym2DhJ+a6pwLtc5zLR7/M9Zk/HszY7WONQVBW2LBmq6WjX+ZfdYNkKpiXav0ibOj6n5NNwTL
	FT0ibLqyjptF9MmJjYzQ=
X-Received: by 2002:a05:6122:178b:b0:5ea:b712:8281 with SMTP id 71dfb90a1353d-5ee34ae1c8bmr4770517e0c.18.1794854123238;
        Mon, 16 Nov 2026 10:35:23 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5ee34e3180esm218332e0c.6.2026.11.16.10.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:35:23 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id A0F4F401CE;
	Mon, 16 Nov 2026 11:35:22 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 9E284DC0D05; Mon, 16 Nov 2026 11:35:22 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Tariq Toukan <tariqt@nvidia.com>,
	Boris Pismenny <borisp@mellanox.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 2/2] tls: restrict device-down TX fallback to hardware TX sockets
Date: Mon, 16 Nov 2026 11:35:18 -0700
Message-ID: <20261116183519.3314837-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116183519.3314837-1-rjethwani@purestorage.com>
References: <20261116183519.3314837-1-rjethwani@purestorage.com>
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

tls_device_down() installs the hardware TX fallback on RX-only and
software-TX sockets. The fallback expects a hardware context in
priv_ctx_tx, so an RX-only socket crashes on its next transmit:

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  tls_sw_fallback+0x11b/0x450
  validate_xmit_skb.isra.0+0x14f/0x420
  __dev_queue_xmit+0x5e8/0xf30

Switch only tls_validate_xmit_skb() to tls_validate_xmit_skb_sw(), and
publish the hardware validator before releasing device_offload_lock.
The switch runs under tls_device_lock, where ctx->sk is still allocated.
Record its result in TLS_TX_DEV_DOWN, and delete driver TX state only
when the bit is set. Contexts never return to the active list, so the
bit needs no reset.

Driver deletion cannot rely on tx_conf or rx_conf: they are published
after setup releases the lock, so device-down can miss a completed
attachment and leak driver state. Track RX state with TLS_RX_DEV_CLOSED:
set it at context creation and after deletion, and clear it after a
successful driver add under device_offload_lock. This avoids deleting
absent RX state and reading configuration bitfields while their shared
byte is updated.

Found by code inspection. The reproduced RX-only crash is fixed: the
socket survives interface down/up and continues receiving TLS records.
Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Fixes: 4799ac81e52a ("tls: Add rx inline crypto offload")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 include/net/tls.h    | 10 ++++++----
 net/tls/tls_device.c | 18 +++++++++++-------
 net/tls/tls_main.c   |  1 +
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 0b001b8ab1c3..faaeffd9981b 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -188,12 +188,14 @@ enum tls_context_flags {
 	 * to be atomic.
 	 */
 	TLS_TX_SYNC_SCHED = 1,
-	/* tls_dev_del was called for the RX side, device state was released,
-	 * but tls_ctx->netdev might still be kept, because TX-side driver
-	 * resources might not be released yet. Used to prevent the second
-	 * tls_dev_del call in tls_device_down if it happens simultaneously.
+	/* No RX device state is installed. Set at context creation and after
+	 * RX tls_dev_del, cleared after a successful RX tls_dev_add. Prevents
+	 * deleting absent or already released RX state while ctx->netdev may
+	 * still be kept for TX.
 	 */
 	TLS_RX_DEV_CLOSED = 2,
+	/* Records the TX fallback switch for device-down's cleanup loop. */
+	TLS_TX_DEV_DOWN = 3,
 };
 
 struct cipher_context {
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 866193a506d2..ae434c304151 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1195,13 +1195,13 @@ int tls_set_device_offload(struct sock *sk)
 		goto release_lock;
 
 	tls_device_attach(ctx, sk, netdev);
-	up_read(&device_offload_lock);
 
 	/* following this assignment tls_is_skb_tx_device_offloaded
 	 * will return true and the context might be accessed
 	 * by the netdev's xmit function.
 	 */
 	smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_skb);
+	up_read(&device_offload_lock);
 	dev_put(netdev);
 
 	return 0;
@@ -1282,6 +1282,7 @@ int tls_set_device_offload_rx(struct sock *sk, struct tls_context *ctx)
 		goto free_sw_resources;
 
 	tls_device_attach(ctx, sk, netdev);
+	clear_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
 	up_read(&device_offload_lock);
 
 	dev_put(netdev);
@@ -1314,12 +1315,11 @@ void tls_device_offload_cleanup_rx(struct sock *sk)
 
 	netdev->tlsdev_ops->tls_dev_del(netdev, tls_ctx,
 					TLS_OFFLOAD_CTX_DIR_RX);
+	set_bit(TLS_RX_DEV_CLOSED, &tls_ctx->flags);
 
 	if (tls_ctx->tx_conf != TLS_HW) {
 		dev_put(netdev);
 		rcu_assign_pointer(tls_ctx->netdev, NULL);
-	} else {
-		set_bit(TLS_RX_DEV_CLOSED, &tls_ctx->flags);
 	}
 out:
 	up_read(&device_offload_lock);
@@ -1351,7 +1351,10 @@ static int tls_device_down(struct net_device *netdev)
 		 * The context reference pins ctx; tls_device_lock keeps ctx->sk
 		 * allocated until the validator has been switched.
 		 */
-		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
+		if (cmpxchg(&ctx->sk->sk_validate_xmit_skb,
+			    tls_validate_xmit_skb,
+			    tls_validate_xmit_skb_sw) == tls_validate_xmit_skb)
+			set_bit(TLS_TX_DEV_DOWN, &ctx->flags);
 
 		list_move(&ctx->list, &list);
 	}
@@ -1373,13 +1376,14 @@ static int tls_device_down(struct net_device *netdev)
 		synchronize_net();
 
 		/* Release the offload context on the driver side. */
-		if (ctx->tx_conf == TLS_HW)
+		if (test_bit(TLS_TX_DEV_DOWN, &ctx->flags))
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
 							TLS_OFFLOAD_CTX_DIR_TX);
-		if (ctx->rx_conf == TLS_HW &&
-		    !test_bit(TLS_RX_DEV_CLOSED, &ctx->flags))
+		if (!test_bit(TLS_RX_DEV_CLOSED, &ctx->flags)) {
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
 							TLS_OFFLOAD_CTX_DIR_RX);
+			set_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
+		}
 
 		dev_put(netdev);
 
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index b8d5a843f761..9b06d0f035c5 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -935,6 +935,7 @@ struct tls_context *tls_ctx_create(struct sock *sk)
 		return NULL;
 
 	mutex_init(&ctx->tx_lock);
+	set_bit(TLS_RX_DEV_CLOSED, &ctx->flags);
 	ctx->sk_proto = READ_ONCE(sk->sk_prot);
 	ctx->sk = sk;
 	/* Release semantic of rcu_assign_pointer() ensures that
-- 
2.50.1


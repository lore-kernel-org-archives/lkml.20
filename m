Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828937;
	b=FlKq9e3cR8JQUA425NleARhHu4NLrkg1ZAE4w5dbL5OfNlByAZHqJoq5c++jizZ4fs69
	 WoJDJE9jTkA18uNPJPch2JuZg7n2d0DDwqFf7hxhwsrlSIipMREKwhdrYUOEP35xCvrTg
	 sPe+leaMdPl2LmZY/ffb4HhWqNRYt5cmcgvelOqHpjEzVP4csuhwCAT1XFKhVcN/Sg+uF
	 J8M99A+elE8Icky4pR5oaS0HzGCTsSbcONuhrK+55DJ85pLDWfSZ6uCqz9wpK1Rbv2xu1
	 +p7OCxW7AzxQ2gtxTvnWrblrCsyT4QHVhXYzQ9UMwepp0upCEQyYmz3/evZNB/bAfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KPbVAnSZTV2ONta40+7LabKIU1IxsrAw+RSEBw2Cavc=;
	b=gnDpkrrS5Yq1A50TnrmqhBF5Npvlwz5DF06jD+v8WXdqYRGbDWDGA0FRW8dF+V2+H9IX
	 JYc1m92Vg6rtxafOyPlQGUF73VxKoD5InPkp5bCaKv4q6KLv6QVvGMU19648vL2R6PC1b
	 PYfAQkkVf5xaD8aW+aG4nHOTduCzTTTQfCX9L06ZhPpNr3WgNDBXVhNmc0kAp72PkaFZ+
	 JBSzXQePj5zzJSg9f80upPUGthFNimApCn8KzUpiAj4MhaINNEDpPWeAQxaHmi2TvcKho
	 5oe66DW27YjFcBt3xe2/1QXhOSPayLdtomYMSU6dPoKR6faX1SGTK9o89q0IuRdfxhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Nim01bO1;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238E607872B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E238E607872B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Nim01bO1
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so842913a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793828936; x=1794433736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPbVAnSZTV2ONta40+7LabKIU1IxsrAw+RSEBw2Cavc=;
        b=Nim01bO1d44nhi73e7Hrn/23eA27VjD0D075UpMclUPGn7hN43UUisjgYqsAWYTvAN
         GmUzwjVXIzN7gDSuxEv84DKzn3z3rNiSYAItLrRXG8D0op25K2vByeuYOyQ4NI1eAUZc
         6OAugqkzl8MvXk9uJHvUC7YUz0x3SdI0dfh/61cfRBPzCaAwcgIZp0DO1wzX4dWbBklu
         9NSQJj/dKZQxquHc5LiR5rLsthuTduIpBDcWxXsdl1Yl/2vtk/bIXsQn8XwkGOjy++0A
         pKA6PzWBklzGm0Uv/NePO+YMr2ZroVFmkXMzuVeVEkAmyDFLZdNSHrituwCqRtCB4EUW
         Fv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828936; x=1794433736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPbVAnSZTV2ONta40+7LabKIU1IxsrAw+RSEBw2Cavc=;
        b=JflL51xvqv45aE9grlZNbBZL8hv0dwfHuoFjWbL22JFl3XM20/RN6q+nhfppnrO/SD
         YeoszhNGs+a000bteYuKr2t/zvpplSP9nNUccYryZl9IbW5JgiuI3zr8qq8mSjaG4pqs
         XvZjqnslWGrG4WlAP3z8irk01XsoPA93kqbsSFHnRQUtmc2MmqEaz2IgjDYsUfrxbjUB
         OEd51fwjOgrUsC6XD235OYXn39zDefqTBmuSdoD8MK3U5C4s0W67AamZbSrQgX3Z/iKF
         ji/AUKWm3EOaxG+Ib52/3+iNcLvzWgAWh5tzGs5poVP3bG7+toHvB9Y6zz1W4H4NTIYF
         eYDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/toVV1JB/YzYEzx4A1VkTqIOvBsC7weyxSI2dEyitqI09vK3aemCoEQ218+75MB+9XSzAtUZ5m/a8A24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XW2JzgZhvPHXYR8x8XQXg1i0jsMnUJQV8nZjQ6Ufr0+3aLlI2
	Jy3070InoWdAHnp+Hgzq2pxPP25ehIl1RtHak9r906U/rphpp9EDRUcotgyMz45oyU+fExcHqY8
	iDilzRplyhvDy6D2UHNYI5SZyG9iyrJaZXVRk
X-Gm-Gg: AYBFou1YraUH+2w8VZK8KU7bJAn9edGEvhSiaUCnXxAkiwEfjbhFn+XmnFW09RtAmqh
	lgjlZBvGwyeyyeQmmkKDTRh5v3xUKXBMdtSDpmeUQ5ZIeJiTE9cdsNeUvh8gpmLYmb9hjyY2CmG
	DRyh94v1I97BrSNnD4ms2/sIJRpEbTcwB4v/wkVLssCCmC6REmnO2c5a5zl5elbgp1dftA3UKSi
	hJlzvv+xkS/JqLWlQuGJU4ESjew2qoZC+TJVwFjavT++BWVA6vHYrhHjSGF/JDys8+8BA6VVFPt
	YQ3eZBt6gV0RVL6wivf6VfLLEwz7JODohm1It4Ikw6W9VIgJGbBdV3fgqK71kZGH7XnNb87MGNJ
	QPVysLMUCxjEJy36KC1LzvFwFBtsrcSBFRws=
X-Received: by 2002:a17:90b:1845:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3ae8984de26mr12985605a91.50.1793828936151;
        Wed, 04 Nov 2026 13:48:56 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b094ced6a3sm816218a91.0.2026.11.04.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:48:56 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 4A991402A7;
	Wed,  4 Nov 2026 14:48:55 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 45C60DC0D5B; Wed,  4 Nov 2026 14:48:55 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
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
Subject: [PATCH net v3] tls: restrict device-down TX fallback to hardware TX sockets
Date: Wed,  4 Nov 2026 14:48:52 -0700
Message-ID: <20261104214853.659378-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

tls_device_down() installs tls_validate_xmit_skb_sw() on every socket
offloaded in either direction, but tls_sw_fallback() needs a hardware TX
context in priv_ctx_tx. An RX-only socket's NULL priv_ctx_tx crashes the
fallback on its next transmit, for instance after the device comes back
up:

  BUG: kernel NULL pointer dereference, address: 0000000000000008
  RIP: 0010:_raw_spin_lock_irqsave+0x31/0x60
   tls_sw_fallback+0x11b/0x450
   validate_xmit_skb.isra.0+0x14f/0x420
   __dev_queue_xmit+0x5e8/0xf30

A software-TX socket's tls_sw_context_tx would likewise be walked as a
hardware context.

Only install the fallback when tx_conf is TLS_HW. For that check to be
reliable, tls_set_device_offload() must publish the validator and
tx_conf before dropping device_offload_lock. Today it drops the lock
first, and do_tls_setsockopt_conf() sets tx_conf later, under lock_sock
only. A NETDEV_DOWN in that window sees TLS_BASE: with the new check it
would leave the hardware validator in place with ctx->netdev cleared,
and it already skips tls_dev_del(TX), leaking the driver TX context,
since the destructor only queues it while ctx->netdev is set. rx_conf
has the same window and leaks the driver RX context, as
tls_device_offload_cleanup_rx() skips tls_dev_del() once ctx->netdev is
NULL, so set it under the lock in tls_set_device_offload_rx() too.

Also do the switch in the first loop, under tls_device_lock. The second
loop runs after that lock is dropped, and its reference pins the
tls_context but not ctx->sk. A socket with only TX offloaded can be
closed meanwhile: tls_device_queue_ctx_destruction() drops its reference
and returns early, __sk_destruct() frees the socket, and the write lands
in freed SLAB_TYPESAFE_BY_RCU memory. A context whose refcount can still
be raised under tls_device_lock has not been through
tls_device_queue_ctx_destruction(), which takes that lock, so ctx->sk is
valid there. Later contexts now switch before earlier ones are torn
down, which the fallback allows.

The NULL dereference was reproduced on an RX-only socket, which now
survives an interface down/up cycle and keeps receiving TLS records. The
software-TX case, the setsockopt/NETDEV_DOWN races and the
use-after-free are from code inspection.

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Fixes: 4799ac81e52a ("tls: Add rx inline crypto offload")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index 4cdfbb57ecff..8cfad667c43c 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1195,13 +1195,15 @@ int tls_set_device_offload(struct sock *sk)
 		goto release_lock;
 
 	tls_device_attach(ctx, sk, netdev);
-	up_read(&device_offload_lock);
 
 	/* following this assignment tls_is_skb_tx_device_offloaded
 	 * will return true and the context might be accessed
-	 * by the netdev's xmit function.
+	 * by the netdev's xmit function. Set it and tx_conf under
+	 * device_offload_lock so tls_device_down() sees both or neither.
 	 */
 	smp_store_release(&sk->sk_validate_xmit_skb, tls_validate_xmit_skb);
+	ctx->tx_conf = TLS_HW;
+	up_read(&device_offload_lock);
 	dev_put(netdev);
 
 	return 0;
@@ -1282,6 +1284,10 @@ int tls_set_device_offload_rx(struct sock *sk, struct tls_context *ctx)
 		goto free_sw_resources;
 
 	tls_device_attach(ctx, sk, netdev);
+	/* Set under device_offload_lock so tls_device_down() also
+	 * releases the driver RX context.
+	 */
+	ctx->rx_conf = TLS_HW;
 	up_read(&device_offload_lock);
 
 	dev_put(netdev);
@@ -1345,16 +1351,20 @@ static int tls_device_down(struct net_device *netdev)
 		    !refcount_inc_not_zero(&ctx->refcount))
 			continue;
 
+		/* Stop offloaded TX and switch to the fallback.
+		 * tls_is_skb_tx_device_offloaded will return false.
+		 * Only HW TX sockets have the context it needs. Do it under
+		 * tls_device_lock: the reference pins ctx, not ctx->sk.
+		 */
+		if (ctx->tx_conf == TLS_HW)
+			WRITE_ONCE(ctx->sk->sk_validate_xmit_skb,
+				   tls_validate_xmit_skb_sw);
+
 		list_move(&ctx->list, &list);
 	}
 	spin_unlock_irqrestore(&tls_device_lock, flags);
 
 	list_for_each_entry_safe(ctx, tmp, &list, list)	{
-		/* Stop offloaded TX and switch to the fallback.
-		 * tls_is_skb_tx_device_offloaded will return false.
-		 */
-		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
-
 		/* Stop the RX and TX resync.
 		 * tls_dev_resync must not be called after tls_dev_del.
 		 */
-- 
2.50.1


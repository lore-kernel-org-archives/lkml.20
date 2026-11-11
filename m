Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439775;
	b=v1wQKIUEOjWHWkCFHFBPS1st8hwIkxRszSQIffVi2Xt32GL0OzszXiCTPLrG8jtJm8qv
	 ZdfIW6MIJLLAiJaJEWVBdiG3/ZA5h17WRj/0wlf/xFrVbjzBXdds4vknIY0M3nUHzzDA8
	 ZQ8V/La9U+Ek/6+Eu41EqTd5HnzyVzP/KDu7rR0qF7nxZoTUkVSjmMRfiw9SIZPZRwiAH
	 Js2Hj9CqTsvrEgdqIK/HJRhy+i4x4ztMsDFYhmkG/+mm9yEXlXPBDTDiY57z80IMBfMGY
	 ckCg0oR//B+l6QME3KFg9hHBhQmjdDESUHB9aXgUwpRHFEncL3YcHx17PVSC+G0CTuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vdvn6HvliDjai2jWKuIPVD3RhpWAJZmTeitPsMZYdGM=;
	b=hAiLDhBDd6EUuqsthz6CpKfz4KZ3X7C1QDMxiNLgTqMHdRFKFCVlgvTjzZ84iZ0n9IYJ
	 abAi5xiesYsaxGQw9SYd5RX1nxemjaY3Q1fuM8T3J0b1WLfRUdg8w8ogx3YAaBDgQSxEd
	 l+yUAPjb+Yvy3T/lLbGJag4PWvjYmZ4qKWMQk+VJmjJKDw4c6Tibek9J5LnUc/phc5q7F
	 DQSKjOQKeSGOioJVp7ElNNdC2klI/7gLdTS7LRVaOn8CUUTkRpJmE9mkeN9yAx71tj8yP
	 mpBfDm6Xvpa5FyVnjcQ1/YfzgcgnZEW2cKD1bJWUbVECsvkdFw+0b5nrGqqSvhONWgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PABl6hoR;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BB606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PABl6hoR
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1669245a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794439774; x=1795044574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdvn6HvliDjai2jWKuIPVD3RhpWAJZmTeitPsMZYdGM=;
        b=PABl6hoRQNjINjTpjg7VBScSEl/T6lu9ct6+omZyO59xxitkDFBg2bK0ye2bnaGkY5
         CkrsgrD9wyzPsoP0qLUpWRoJsqDJy64eZ2ASatSyYi1exr/3TB6l/iUZaSqiExqocXvk
         FRtvOO9i5SBtHeXEZjxFH/BZVpN8QvhLRoHVWsoc5hXG0EOPc2viuznQLrrR4S6qMJV0
         hG0IVXhYm0LGYjoH+lImXReviMMOxeRPmMC+s1wtGJDP+77AptHkYlmh08gRPQVucOYT
         SJkDrkTViL96LUFBCuJC9u1TPZdnqiOeRZluG5gimAvCQ16ept5RcMdpemzMftQFjjkG
         ufJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439774; x=1795044574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdvn6HvliDjai2jWKuIPVD3RhpWAJZmTeitPsMZYdGM=;
        b=NmdzW++zqDAw6PhxcWbZ6+zgmBPVRxUZHXBl6pGQL+QlYY88fro+ntimJQ0M/1iV9T
         B1yn4rsxUkEygZ7SX2+DMCeLklDbswzftyVOzGvHSTXg6247rVB6HXnXUcpFh+p1Z4qJ
         PVx9/psu7fiaU7CpkLPdTjuSTDpHzmSqZZrG7ty4xfn3SZx9lGWXxp42lzzUGXbExeQK
         6gkmlPqhLoztUuVBVVOmob52gjsNcQf8BAl3quumcugNLk7tORc2ebL/mS1ktd/vSo0E
         Jen9iXO6fqViw4nNI2WD6h47UHSFYPWzbEvmAH4pS+0tzNvacDuEBcpoOIkisYFuCcSa
         F3jw==
X-Forwarded-Encrypted: i=1; AL+hErGTe55xNs9hVHY7i/tqWaqzdwCgJLIlHz11Y94i51TJ6re4J9L6tF+QWYQi51G1d5J1gebY/jS1FO5PDVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FaYr5cneWOIt2ZB5vkLFuEuxrcSoXXFtmucleam/X369Li3Kz
	mg273Ok77JfOvIJ7Chxhk+ZCn2RVKHeTEcXNin+aKNcPF2tSq9CNvLH2yvIHOMi7BSdOfrZbtNy
	AreRyVeWCnKy51Oie+YrkS69ByfvZ/cuQt92Gu4w0myAZAEeDuGlQ
X-Gm-Gg: AYBFou2BCg+BTTUaZep+AUJzbZpoOq6qhbqTOhfBcmrBbfIlNptLjREPDUIHLYGotFx
	qXwcem5sn8QgMIH5/XC1tFvfNDj6Xm69hqbJhcnamcwjj8O8aIFKyY1fqr8xSqU2HT865jeVfAX
	ypTUs/TLD7wBc2rSCvU3gUbo4EI3EezhkH6pg/BcNaTUFmv9HtH1JwFQjNoFu7TrQgnEoJAmn/K
	JqUk0TW7PPFisNaMnwgCBCLedI7YyY4yRvw2fSZQ0nAH0dm+cvSUHHtnLq8w6gbgF163yPOosLf
	QiHU6U47PisH3qynM890xgJq1uuUQG+vzOZ/ODJS2svN5jkTRJQA0sF0mg61dhnfPaynXgELz4c
	vCob0AZlyUTG63Dew/J0=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3b182f858f5mr3864235a91.47.1794439774492;
        Wed, 11 Nov 2026 15:29:34 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c125d0sm617425a91.1.2026.11.11.15.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:29:34 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [IPv6:2620:125:9025:23::2ea])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id C9E1340357;
	Wed, 11 Nov 2026 16:29:33 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id C6124DC0876; Wed, 11 Nov 2026 16:29:33 -0700 (MST)
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
	Tariq Toukan <tariqt@nvidia.com>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 2/2] tls: fix socket use-after-free during device-down
Date: Wed, 11 Nov 2026 16:29:29 -0700
Message-ID: <20261111232930.2532497-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261111232930.2532497-1-rjethwani@purestorage.com>
References: <20261111232930.2532497-1-rjethwani@purestorage.com>
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

tls_device_down() pins each TLS context, then drops tls_device_lock before
switching ctx->sk's TX validator. The socket destructor can run between
these steps: the context survives, but __sk_destruct() frees the socket.

Switch the validator while selecting contexts from tls_device_list under
tls_device_lock. The destructor uses the same lock for its context put
and list removal, so ctx->sk remains allocated through the switch. Record
the result in TLS_TX_DEV_DOWN for the later driver cleanup. Contexts never
return to the active list, so the bit needs no reset.

Checking sk_refcnt would miss sockets whose queued SKBs still hold
sk_wmem_alloc and require fallback after sk_refcnt reaches zero.

Requires commit f08d8c1bb97c ("net/tls: Fix race in TLS device down flow"),
which moved the destructor's context put under tls_device_lock. Include
this prerequisite in older backports.

Found by code inspection. An ASan harness running the extracted teardown
functions with userspace shims reproduces the UAF before this fix and
passes afterward. Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: stable@vger.kernel.org
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 include/net/tls.h    |  2 ++
 net/tls/tls_device.c | 22 ++++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 915f39bddc83..24928c1243d1 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -193,6 +193,8 @@ enum tls_context_flags {
 	 * still be kept for TX.
 	 */
 	TLS_RX_DEV_CLOSED = 2,
+	/* Records the TX fallback switch for device-down's cleanup loop. */
+	TLS_TX_DEV_DOWN = 3,
 };
 
 struct cipher_context {
diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index a42cbc89db2b..ae434c304151 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1345,20 +1345,22 @@ static int tls_device_down(struct net_device *netdev)
 		    !refcount_inc_not_zero(&ctx->refcount))
 			continue;
 
+		/* Stop offloaded TX and switch to the fallback.
+		 * tls_is_skb_tx_device_offloaded will return false.
+		 *
+		 * The context reference pins ctx; tls_device_lock keeps ctx->sk
+		 * allocated until the validator has been switched.
+		 */
+		if (cmpxchg(&ctx->sk->sk_validate_xmit_skb,
+			    tls_validate_xmit_skb,
+			    tls_validate_xmit_skb_sw) == tls_validate_xmit_skb)
+			set_bit(TLS_TX_DEV_DOWN, &ctx->flags);
+
 		list_move(&ctx->list, &list);
 	}
 	spin_unlock_irqrestore(&tls_device_lock, flags);
 
 	list_for_each_entry_safe(ctx, tmp, &list, list)	{
-		bool tx_hw;
-
-		/* Stop offloaded TX and switch to the fallback.
-		 * tls_is_skb_tx_device_offloaded will return false.
-		 */
-		tx_hw = cmpxchg(&ctx->sk->sk_validate_xmit_skb,
-				tls_validate_xmit_skb,
-				tls_validate_xmit_skb_sw) == tls_validate_xmit_skb;
-
 		/* Stop the RX and TX resync.
 		 * tls_dev_resync must not be called after tls_dev_del.
 		 */
@@ -1374,7 +1376,7 @@ static int tls_device_down(struct net_device *netdev)
 		synchronize_net();
 
 		/* Release the offload context on the driver side. */
-		if (tx_hw)
+		if (test_bit(TLS_TX_DEV_DOWN, &ctx->flags))
 			netdev->tlsdev_ops->tls_dev_del(netdev, ctx,
 							TLS_OFFLOAD_CTX_DIR_TX);
 		if (!test_bit(TLS_RX_DEV_CLOSED, &ctx->flags)) {
-- 
2.50.1


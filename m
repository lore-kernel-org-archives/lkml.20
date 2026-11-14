Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663406;
	b=mNQYHXxj5OufERIMhDgaoUx7R/uspIFrgJ8G5L7oxdZO4mzNJxMItr32RHe5lTUQNC9I
	 PUTRQRbv4QaW2U/bA6J+w+VRtNGvOIASiH/j3dARVyUj7JZQ0kC9KrYgs2BdVybl9tgck
	 qZ9IQZ2ewKIwD8O6dvBI5QOPEY5YhPq0v/j80rhc8rKB1Kuh+c4KRIRlUVh6qrq9HOzIe
	 WPBhv9Bq9EZzvhoEd7lQefYMRkURr2TtTdD0Mp9EnddaxG6+Y1+lclHRD1Jx2lkwCgcWE
	 bYhBC19h+lZ1qrVBwwQPVFfEHoh0cqGFJAvKgUzKmUNsKH1FgkT4EtoreoDK1XLlCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
	b=dzto0qJk80L9vx7wZAeAi+bwU2MqF1OeFY/cKon8+G0zrJCPjrrGDks3Y3d4ugK+sT+U
	 P+kCALvlTfWzaReL+kU1a2dKv0Awrq5/t9mjL6zPaBJNBk+dmCG46rbo91ofXwbT/7AV3
	 cDcYycXi+M9ip1k/VEBQMNfbeUNadzJGWJrb2hNq4ttWyvROfQ7TG6PEGlcbpCYL2swnc
	 +HA/jcJE7y9vvsH9yLd4twTvNgouKqQZC9Ru/aAi/zI3sKe5jvNXn/zMlCteYiOLaQiYx
	 0p0ZtC/nmh5tBKFfD0xvEhys6hKqBuZKBpb/M7C3HGmCjJL6HVLbk2G46GSyjCKRQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	dkim=pass header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=RLiTW4j2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5091606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5091606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grische.xyz header.i=@grische.xyz header.a=rsa-sha256 header.s=google header.b=RLiTW4j2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a210470b49so15503025e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grische.xyz; s=google; t=1794663404; x=1795268204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=RLiTW4j2PZ22Di6wXigCid5UZFJoV8dam7pEz8ccG+3BR1ZeTpnU/jNYAdUaF6+GKV
         i4u/7Ahng6orsr62b4sAutMAc49qkZhOwoBVIUV7+sQMzQ/RECJlhxBglurbIjPkJ7c1
         80jVIZDhu7AB1+KcwjFjddolobsJ/sVfAdM2BVtyRYJ8rONTqblrO3dBwr6f6esVg1Ek
         sBFq+16x+IvjNW+wRQYuZxLo9ySeio0fArjTkHjGFAnz2LVbcyXrgkANCZHgChnkDoA9
         5QNoMASS08Vn34NZb9IBUnhw0jMaxOUbNcHwbUBD8oKt7dUPJgFjGvNz3Cs1ZB0H/DXb
         jRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663404; x=1795268204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kasbafd3T9Fhrw7R0Nr/dFHUF4ChKeJYhTGf2AiF+Y=;
        b=t1nEnLPQ9bZ2E18YcSkG4gNuhXP6GP3kix5+YxBU982CGGDiw+dEqRwXdaFbH8uOuv
         yOO8wIpRmtto9/AGYTJwg3R89taHXNjnX74f4C+Zw9McDe0FHiE1dljg58f77xvhTqsB
         9L/EBaZFc1rBX1C0n3F2ydFIOIg4t/GVt97Q6vZS/rlpFuO2lcDZSLrePLJfhT9sLxtO
         6xtNx5RV/+W8k43+ft8HdSsyu9FjOFz3EcAVBRZG3LwQl2gHtAsfRPsPbgkSW5835KeK
         bFjGdSeZkEhDD23v28huSXP2aXLkz0p3cw+3j5CZ9dpuGDhnG6hliEZR0oGYo6P2297L
         nMiw==
X-Forwarded-Encrypted: i=1; AL+hErH8IUB8ea6mSpjw1pnLvSvLSx+NIgQ+jXO6EoPm7MdhOffZLtPllBPHjoKSAoZJUeZVEZtu8DFIweyQujI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LYOfhbgFndOuaCNbcPEqEyz32b+4UJHNaTE+Ye7UQAfaAMLKp
	vDgZfTdt4KcFJeV9tULJMj7SE9jl4aH7P4fbZMdDaIS2ZDBFd+zB7h2SEXNffUMNTTg=
X-Gm-Gg: AYBFou25MkQ3X1XdxTS51XrI1wFu0UJQE8wo+GEmBtNvQI6IVl7DM8FfZmiHy6RWnbQ
	rIf5LKMlQJoR/fgLB8gMcK+5z/l4/upnwR5ZnfvDNfpMrmp+3wIIMkGPgxHe+mV6ZANj9qOPSMp
	/2/dyVCEY9i6ekQZptWjCxU3P5dzd+I0FcLdCawIsm+eLjN2+BD6+uRDKkW/Ot5jFJchPQ1krVp
	p7rgkf0XIeR/lToMoDB+WaCdxDBz7CeHgp5tXPLzhUbJ71xqvLK43GzUhuU08P6xDTFhNRahaSh
	bUYP8Q+FwaBdxnTRlCyLh3+I2vaX0YfKdaygzaD8YZi5U91XMy2tn+qPY5dpP0d9VIZR+DSaICi
	yvsneY28IXczxwhXGiAPjvxqCdbqWunKRBpoorIkRdcxxZRj8ZTTIlV9H/LzJ2EmNz7FM6xQwvc
	iovOGer0IX1KyLKDYyVmkiZFPVQTy3ZTzQn/RWJlaFtZisUzN1IVpJ3Ini+LXL2pBxHfHY3mUty
	KFfcYc85wc+LV/l5SB3pvyg509+pmcLGI5WErIexA2hKZ+Q+DWvVPd2PU3lheig5cZh38VFaNWA
	t3DkboKiRJxuUGn2EWmcMwR0Gg6CiKLOCJFfO+ym/TXbo0Q=
X-Received: by 2002:a5d:5f03:0:b0:491:e062:383d with SMTP id ffacd0b85a97d-49c7390fb5emr10908010f8f.57.1794663404019;
        Sat, 14 Nov 2026 05:36:44 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:1a41:5e41:61a6:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm6657866f8f.50.2026.11.14.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:36:43 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: netdev@vger.kernel.org
Cc: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Christian Schmidbauer <opensource@grische.xyz>,
	stable@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net v3 1/3] net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
Date: Sat, 14 Nov 2026 14:36:37 +0100
Message-ID: <20261114133640.3285413-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114133640.3285413-1-opensource@grische.xyz>
References: <20261114133640.3285413-1-opensource@grische.xyz>
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

Commit ee0aace5f844 ("net: stmmac: Correctly handle Rx checksum offload
errors") taught stmmac_rx() to honour the csum_none status, but
stmmac_dispatch_skb_zc() still ignores it and sets CHECKSUM_UNNECESSARY
for every IP frame whenever the checksum offload engine (CoE) is
enabled.

Since commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
dropping checksum-error packets") dwmac4 delivers such frames instead of
dropping them, so this path receives them.

Mark the skb CHECKSUM_NONE when csum_none is set, as stmmac_rx() does.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Cc: <stable@vger.kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7ffed295eb14..3e5803db19b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5547,7 +5547,7 @@ static struct sk_buff *stmmac_construct_skb_zc(struct stmmac_channel *ch,
 
 static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 				   struct dma_desc *p, struct dma_desc *np,
-				   struct xdp_buff *xdp)
+				   struct xdp_buff *xdp, int status)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
@@ -5575,7 +5575,8 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
-	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+	    (status & csum_none))
 		skb_checksum_none_assert(skb);
 	else
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
@@ -5789,7 +5790,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 
 		switch (res) {
 		case STMMAC_XDP_PASS:
-			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp);
+			stmmac_dispatch_skb_zc(priv, queue, p, np, buf->xdp,
+					       status);
 			xsk_buff_free(buf->xdp);
 			break;
 		case STMMAC_XDP_CONSUMED:
-- 
2.54.0


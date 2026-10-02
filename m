Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA34D9550
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951769; cv=none; b=didVjQJ73ZXxuHIJqjW0mHZ73zwp3f4+qzTXicTD0OI3xnG69llmru37lRlmo2uLhaJCBX1zxOdGCtRW7sP6CHfuiWNFOZGrhe9lrXhu2Dgy+psCM7S9mNSbvdCCwVrwPWIf/gfGL50y05iIhFr1nUvn2+NaSrGFSotEvVdNwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951769; c=relaxed/simple;
	bh=eQRCEWeuQenLohMAayQ/7Eqy93mhz2DxGt9MaVpnEkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uv02dsrxrf1w63yJK2ynho/dSoN7uQ7a/aCV9KBVPGfCL2nlJjTW0x3GHXbhWj7nIzv4JtKTZPUNeXxsjmmenFlJzmpA0AskLCtB2EamlJKmrOQkC+M5qgSoE3vaMhOxPzYcFaSUKC6m6ol7xQIsskRe3UtB+ZwsResS3V3N24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=Vp3GObUu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="Vp3GObUu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so42917555e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1790951766; x=1791556566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBwjMAy6b17UOR1h36UJ07paZoIuGQbP8cI4le6OJ04=;
        b=Vp3GObUuUkcQiFIYDMR6c1eDDnAuMAPf2LysZ/6xKgG3GLj0+gLXKD/R6dsWIZWt+k
         KO+iraLCYIXyEoo/x/I3UMuw7r3DooFLNfJ+JKIwzOshYlRSRsmxucURDz8lK6fzBH6Z
         5W5WMSyedWZu2raUquEdDI+G4a7nf0K9geLxqzkyBvLZw8gdNEOndOT53ZHTTzqFr7GH
         xarBO0/iUWXBFM3KS8/TSpv1RuWNPjLwEHaWx2v+7y+wSG0Q627eYj6OE0jBy+orVwpH
         YE64rV5jdAuM8Lwq4KeKVFwiqXlPUwvaiwjOAqarCCsPqCnvT6v9VhcrFILDyLZuLVbU
         DHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951766; x=1791556566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBwjMAy6b17UOR1h36UJ07paZoIuGQbP8cI4le6OJ04=;
        b=g4HRkfEf4oUct+MNtDg/snenx6ZQ4kTU/hujLJKo8Ed2aY5dvklxEDirqkuBSkHBRJ
         JVQTuUefUaj+dbBZf5ymXUjJ8eZ7cBD+X5+QFKU0rmZ6MI08wimVKKTXojPbjd4PWLhQ
         XYAGSjPF64hCOntdh1l73lkE/aRAcJ/amuEKpBteDJQPCmCWG/WmLWKkYKAQyUyu3rrd
         8clY1aayBJabh3DlrGNihU3i+FeCvaWDlPJMFcOqwMeLpZg8gJqNY4YhXqbKZQT/DbZ+
         chOlbXw5eypdz9mUemifockTcyg6mrd0gncXT2euuv0KolOthuQ4XTQ99E9vzUGqElOh
         /8dA==
X-Forwarded-Encrypted: i=1; AKwUvBz/g6QYY4MT6Fxlx5GrbYFG8ssLZoeQViziSiGa1y/tC2naLd1tPiirvbSOGYFLVyrxCqPV3CzLCt5kK8w=@vger.kernel.org
X-Gm-Message-State: AFuF++kQJxGfxP67u5DqpWzUQLmHLXYcC3KflW2G8P4/3bTCGkykPWLx
	FPKF2/YyOt5yZqEHEXpBmKzr804y4Y8AiI4WH92asBQA/VoGoUmdNraVQ6SbK+KkMlI=
X-Gm-Gg: AYBFou2LqF+XfLRaUWMxF69QlEugVKQmzngQpl6vvvcL1zE2cGUvxMjazjSG0UjHbk2
	kO0Eeb+I/6X+bFo4n7h63tHwJz69SZ8SUeE6TOPXQI3Jd9BqY3SzyYL9UsceAYzx67ldOq62kqs
	Kf/4Jmda/kpAiKowvcPCOCbSNPGBoPwDHeY4Sj9wjB1M+fAcwhGFuVkcTtU2ci33OzEd21acLTh
	EMx/ehopeLtRY5pm2zt1+Px23X0YDyfbVcYW/tKHw1p+uz3e1ka/h++GDwcujGpo0IU12htftdI
	/IeboynTbfhPrPgC8fIGXnJceMaAHSIk7TgO84NVCWouetku0kaCXpwvf0BntDm8DaLNxfS6Ey1
	cM9+Qxz/dAj9oaUf2c0typuUnmUGGDRGsy7w4QNx1DfkB5PGCU+jpqNVR+0asnQ+bnOepeT4bGw
	NGoCNBc7SQwDL4qmIE+RISK0xZweROktduT8Bo4+5cUKAwtqd3mCALbH4Z0xGsu1N9up03aTDfs
	7fawQ==
X-Received: by 2002:a05:600c:4f88:b0:49f:fed0:fc47 with SMTP id 5b1f17b1804b1-4a027523050mr51473955e9.1.1790951766149;
        Fri, 02 Oct 2026 07:36:06 -0700 (PDT)
Received: from koen-nuc11.. ([2a09:bac0:1000:2ef::4e:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67cbfesm8715315ad.28.2026.10.02.07.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:36:05 -0700 (PDT)
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
To: netdev@vger.kernel.org
Cc: quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dnlplm@gmail.com,
	linux-kernel@vger.kernel.org,
	Koen Vandeputte <koen.vandeputte@citymesh.com>
Subject: [PATCH net-next 3/4] net: rmnet: conditionally expand skb headroom in ingress handler
Date: Fri,  2 Oct 2026 16:35:28 +0200
Message-ID: <20261002143529.3217189-4-koen.vandeputte@citymesh.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002143529.3217189-1-koen.vandeputte@citymesh.com>
References: <20261002143529.3217189-1-koen.vandeputte@citymesh.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when the rmnet driver processes ingress packets for an Ethernet
device (ARPHRD_ETHER), it unconditionally calls pskb_expand_head() to
ensure there is enough room to push the MAC header. This forces a costly
memory reallocation and payload copy for every single packet on the RX
hotpath, severely degrading throughput and increasing CPU overhead.

In many modern architectures, the underlying physical driver (e.g., USB)
can be configured to pre-allocate this extra ETH_HLEN headroom when
minting the initial SKB.

Optimize the ingress path by checking if skb_headroom(skb) < ETH_HLEN
before triggering the expansion. If the packet arrives with sufficient
headroom, the driver now skips the reallocation entirely and safely pushes
the header. The expensive pskb_expand_head() operation is now strictly a
fallback, allowing properly configured hardware to achieve zero-copy MAC
header insertion.

Testing this using a temporary print in the new condition showed that
the expansion is not triggered as enough space is already available.

Signed-off-by: Koen Vandeputte <koen.vandeputte@citymesh.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
index aa5523f4618e..95c3e3934fd3 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
@@ -114,9 +114,11 @@ rmnet_map_ingress_handler(struct sk_buff *skb,
 	u32 data_format;
 
 	if (skb->dev->type == ARPHRD_ETHER) {
-		if (pskb_expand_head(skb, ETH_HLEN, 0, GFP_ATOMIC)) {
-			kfree_skb(skb);
-			return;
+		if (skb_headroom(skb) < ETH_HLEN) {
+			if (pskb_expand_head(skb, ETH_HLEN, 0, GFP_ATOMIC)) {
+				kfree_skb(skb);
+				return;
+			}
 		}
 
 		skb_push(skb, ETH_HLEN);
-- 
2.43.0


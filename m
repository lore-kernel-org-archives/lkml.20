Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867989;
	b=w0H4gbfZ/Ngbl8gqjuPVRsuNCtMUiEx9EmV5Rhxkpk+t2xAW3emV+xYyV8PHWnBVAHdt
	 khvxpp6/eSxmrxw/TppIMIoHPOPiTqPiq9MJZPMxdL4u1o51Qpn8Xfvi5bT0WwT/6tIzn
	 z9Dj+sdcAm2OvSQjUirOdK/lFyhQ2k4slhRgHqq1gr6LnFmC5ZfA016XspgXIFYufcU6m
	 6o1CJusVx9HSpgNo9YYG0IYJ7rzsokDZuq7rGwBCKIdYQQ+DErKE7rTvDDAYWBBDtKZi4
	 Zf6jqkqSK+KPOwpNwgdl9QH1OEpvZ2LXQdcMNYKSZqVpRaZnOZm0hLgWY9V+8WVG2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867989;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
	b=GURtZjytiwegh87VRO9IbHHPLg4IKQo8bfNgTuGLjKQKyX8i1qmumTUNnJDCOahg1d2/
	 /1bm5uD5i64lXd/4IW6NPKr6OZIt2ie+69IyJ9LSAazXpDWcSQxIQypOzmLlkW8lqE4VK
	 l6mNEzYB5MBtUnWfPugoH3EiZ3lVmC4z4edE1sygTk5Vt2McddXEG1mJNQO1I90IK+oF6
	 Idk79VE1T+Y3yJYC523uj5r4TyTm3/QvP6Vp+UvmyNm+WV2zkNAURj7lRvrDFRcErgk3f
	 oqxnG63ONupt7R8qh56A8JnvoGO8hzmdN9CbR3JBcLHOftbixYK5PKI5ovswGOGXJzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD6606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AD6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hIr7GbNK
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso4418572a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867987; x=1795472787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=kCoPTpO9CGoXIuifhNDnf8pZc/X/xekjwhHeH8Mjyi6VrnI11UlgVgWgqNC93nx4CM
         GpwJFv8HGirnY3PMZlP+yAxKwt6Apghbv7mpS+6Qt2YA/Mux7ZLRJwdm6xCccsJk89NW
         24UR/FK43lIDyFGlM9bJDX7CJLfpsYB7A2A55g5HJ8LFkg1Xr9j9zJYPyzY1RkS8YQAF
         m+tdoU2NpruIL3qrhrMWECdL6pfTOX6WDfkug7XgbfDkaVkXGFz9HDspNkPuhMWV/n1z
         RxT/GvLJU/F7JlRAE4hqZalFbsUpPTYwxyJXUBfTWRkHIEOSXxoFfl9kMTTssJPALAi0
         lBsA==
X-Forwarded-Encrypted: i=1; AL+hErFB5UePcbq0+Hyqf/KznoukiU9+cbf5E+AqMssAPZYu6+DFiaP/QhHm7vcmdJpEAuJiGG/FE9cnKEL/sKs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2OVjxOz7vsxG3tcuLb4vW/KLZkFRM8TdspUYB6+yNHT6ZjG+4
	YYdQ6r9ZAvuf9UybOAExO0TDwdxDYt5mh7KyYD2OLgE1mcm9I6Y2QPkkokgpMNCwrCKTqaG5kHl
	/bgYENf2+OtSHTE3uwLc68ERWumilT+ZkGk7JUXDpygnQ37l7c+Y8sMQqAEKRPGEmUP6qwYmSY3
	d+KuawwhbCkp6liwOi4qZ4TPNfp7a8P0ZxwKVYhFNOJpFTwj9AbubCs/PGF2dAmbkBkozVqv6t5
	mSgYpsGgu6Q4BZYN1WcwzZh
X-Gm-Gg: AZFdTZembBFd7ypS4mGiEezl9ymBqtKQDQwtzWvt71eM/S6sOOiXw3PB+HFnGtMwmqk
	8/eDrnZ0xR1ScwLeXQm8zU3znNRm6FWex0Yi8c4AC3wukcNRsrvS3vLhD1yA8j+F3EE47/U5Oiq
	Nhj32fH9lAaivb1Cit3tv97Tv2aVANCri/gM5ZyJUL7Et6nmHBuJps1AauOZZ7YD8Kvvu53xwML
	ks7EZs0/9sAUujtfvdiAeT0w9GGD/oX5uFemGd1J+pn7tf52/3PSi0wvGoIxixEIjLFbAvuv+Bj
	KME5ARLTLoGpgDfCXjARoxFdH9oC7bT02THXyZVlQs/TkBRNgffhT50QLwoBKUtt8Q0Ybcr0D0Y
	fKLSHxjnW+HjWddqo3NiB7jRc5WbKP3vqQINgeNbiFhKaZxyIOgpt9nviFbUOcKB9mjs8zmgOJu
	HHh2KIhODRwN0OeQhF8d/ZPWvb8WM8vae4rOMoOxy0
X-Received: by 2002:a17:90b:2882:b0:3b0:9a2e:b491 with SMTP id 98e67ed59e1d1-3b1b0dacca3mr11108379a91.66.1794867987561;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe7d05bsm515415a91.6.2026.11.16.14.26.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5701575eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867986; x=1795472786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=hIr7GbNKjnkH64q1lev2y9rJOLQcydbwnhEJDdjupN7FrF65IFq5tz989yBs8FlD9d
         AabbxRwDuxspnkmJ8wZT712jZAvhMJC8PhTpx31Cxka+9lU6PftW3I5RpQOlxIOvtezQ
         FwSfVad6aXjf8Aj2VEO2p21k+taX1sctFnZz0=
X-Forwarded-Encrypted: i=1; AL+hErFM8OvTDfcAYKDS5VcAY7d2SOyYiyxVY8LAf08Mll/TDazTQSxjY83Fxa+hYt46xCyCEPoENO3rstMgYyc=@vger.kernel.org
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994361eec.22.1794867985516;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994310eec.22.1794867984774;
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 1/9] net: ethernet: bgmac: validate RX length against the DMA packet capacity
Date: Mon, 16 Nov 2026 14:25:11 -0800
Message-ID: <20261116222519.1416501-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BGMAC_RX_ALLOC_SIZE includes skb_shared_info and alignment space beyond
the DMA receive buffer. An invalid completion length can pass that check
and reach skb_put() with more data than the skb tailroom permits.

Limit received frames to BGMAC_RX_MAX_FRAME_SIZE and reject lengths too
short for the FCS subtraction. Keep invalid DMA completions visible
through rate-limited diagnostics and RX error counters.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef239bc487d..1c502bd64d7d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -457,10 +457,14 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			/* The allocation also contains headroom and skb_shared_info;
+			 * only the mapped packet area may be supplied by the DMA.
+			 */
+			if (unlikely(len > BGMAC_RX_MAX_FRAME_SIZE || len < ETH_FCS_LEN)) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev,
+						   "Invalid RX length %u at slot %d (flags %#x)\n",
+						   len, ring->start, flags);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.53.0


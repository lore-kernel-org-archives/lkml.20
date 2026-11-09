Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268636;
	b=p55R1uzDHGRJU5/4w2UuMUDRtS6bMD6dEBreVDrChbOpYp2FbtZ2MY1Pglfyf9qRtjtA
	 4llIM9MUkksOcWVG7UXZfRRZb7Mek6NmQdHixJr3VtfGReyjnkUx0hTWcF2oiABBJHAcZ
	 sbMg+BLpSdc9sXaATuwT40hUHew3rf4rs6LWmU0I6Sgj5W60KEPtNZzkqIUQtQ4pW4K6j
	 MWeWzg+q1YR39AdsqZcSnSb7OQ1z7L3cTIeG7Hs1f6cc3hBeN8q05QwJZp/irs9jRo7Nu
	 C3ChBmTXXBAPDY0K9jjWahB/02DWMxRdshOGDbHzt/nD9sRLMlhl2TmCr7Qum9E4t/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/ZB/vPr2FZoQD53j4mXH80SNVxv2c4eMTKKs+9xQEfc=;
	b=fvulo4d873JxwPkOW5Q1ZLlAKOI6YzDjlWzMxY+2fRcI+zAFTw2JeIrnPGrokZfX7vnq
	 NMsoheMKd8ksG82jQOJRb+QjiV7ViH2Kcf1F/igxoL0efgywi0XaCmS/dLVFq3rYU6XAU
	 sqac970Or5C3oa+yr4i1Sd9adBZxGc/4I5gnZDmEUueTWdyAkaLjaUpw+D7rjbYfccpQY
	 A+OHLIcZzuytOurPMyzhnQfs6kMqlonLZaf01inhqPX8lYFR5A6fa7eoj1PMqqiA79rh3
	 X+vSuiKpTe1ohJakUMkse5GeubzHKv7wkAjdLf6Mzqiqbuun68HlwH0jVGrrs6+No0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4xY8f9+;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED860A3830
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11ED860A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4xY8f9+
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d28f75d62so193198566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268634; x=1794873434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZB/vPr2FZoQD53j4mXH80SNVxv2c4eMTKKs+9xQEfc=;
        b=P4xY8f9+42UusvTWn3hlEAHq18vsf1pEJ4g7cBxH9lamOwOlfEwNFyya8J+PcDZJiv
         TP7hkoykehSdcnLFnEFjFln3P0LVYBMz55FVv+JWGgQpPjOht/lyNWVGtHTLhqed1dYM
         jshVInNlM+HdVFGC9F5C7Q5AuwWKU/VMSdIPExxmakQMRGo39jSY5ezho0FcwUOZds5W
         G4iOZWD339/E3VSqg1crq5jsu+hIJntvFUCNmti39NH1aqO0aAeidxR1U+zjuWwyLHwd
         P9BiYY6pCGmEgMZqrJoZrGjsWR1uJKt1GnigWQrDLSORIQJdBziOmIG1rc+C+EmK4Pm9
         sSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268634; x=1794873434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ZB/vPr2FZoQD53j4mXH80SNVxv2c4eMTKKs+9xQEfc=;
        b=KMQAQip0jVCg8GwAT2Ewq8dsW2s/x64fAGso2eQ0VkG8t4uNUNHezqDMvHxlUaHO5W
         RxwYSkZHnf9aZPnxrWW935/eacedZf6V2D8l8WX2s6NiilpQpiW91WvWzEPnauJ2diwt
         EhgDjNNANfq3eiAun6H7ZkbRCA1jz4W4LXbZKnZb7dpkQ7TC+TPrQLQH2eA0OELhdbKm
         VPJOe5/QK2Qz6rsrd+LuX9S67U/LmsX0BLCou5WfokwKo4Gm9fwDhAbgQ9x8UYNRgUXb
         GLAWVDH4MfLbKFMDK3E+zTxiLP4eqjTYnTXc97KnmsGgIj6hZ5s5+H5OXX3tLM8Ee6g/
         Hgmw==
X-Forwarded-Encrypted: i=1; AL+hErGwC72OvcvP9gSlcdTjyj3OZxjRsjr0vgZlByb6GHj0ebvL35Ql7cY0rshL4RfGXsCn5LvRpo5yqR2p1rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JDdZJJUgRuGelKFQ/mxuFCRS0Y+ChWdD9R5Ld4Nso2wwSRtJy
	UBjed8d/DiT77cXhiVFxzOOsJpk5LMqrlaHMlse5PC5ZwSyPlLQy1Kxj
X-Gm-Gg: AYBFou2Anj7x8GAwY02+TExkiaqRc110oHUFyGjkugKOAfJO7kEkJvMrLDlPzY7w3tm
	OGcNdSv5Q3WAiT7dkgAa9pW+AfeHgIhG0kCN8ReBrvaM7MjtsKlQXG/yniobJZny37rVtNrwZlL
	BYLZytrtVWy3QmFZEVMYZhKUcbenjPFN35bHt6dUXhBelFCzVSwR+UiszWJ7r5aMWWVWaInf6vO
	+zawHN1GCNGEFkDPi1n4WmdMwzrTy2/BMWxK/EcXZSNJqlUv1HKMXCXGb8iawhlhTz7v+7BaphC
	RrHViY5b+qw3hwQ1vz+EdlyPJZuSi8U9Rbeut4tvGlPP/v8bzooGByc/aCOQnWD8Sz/pbFvHJVM
	+eYVW7VTcFpXOxFthjlP5WuhMpHTDOYqhykXrLCvKd9micSfLk9w3a7gRgWhj5DEpIt3WT2Dcw+
	u8AYap+HJEoK5/Ne/m17zwpS/Q8V5chsKVnhSDuNj+3EI517WJAA6Ba1J1RGOEliQ4xjxvCUbWm
	ZZCZEBPv8GMwHRBBjJ9NNNdV1KKcyytyy+gLFD6t4VpLz83GR6f3je7DDXSKpT0pH6DThugYGGQ
	VgSuzXyprRQ9VhxxLHXpIV9w1Q9BHj7xt4gdNrsJUpkg0GDbj7hwC18=
X-Received: by 2002:a17:906:4804:b0:c41:9228:baef with SMTP id a640c23a62f3a-c504952c10emr55099366b.8.1794268634080;
        Mon, 09 Nov 2026 15:57:14 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:13 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 7/7] net: bcm4908_enet: drop RX frames longer than the buffer
Date: Tue, 10 Nov 2026 00:57:00 +0100
Message-ID: <20261109235700.2586821-8-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
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

poll_rx() takes the frame length from the DMA descriptor and passes it
to skb_put() unchecked, so a length larger than the buffer ends in
skb_over_panic() from the NAPI poll. It was seen on a BCM4908 with the
RX channel's MAX_BURST raised to 32, where the DMA reported a length of
3388 bytes, more than twice the size of the buffer; with the default
burst length it has not been seen. Drop such a frame like any other bad
one and count it as a length error.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index ea4a9eb98..b2debdfa0 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -660,10 +660,13 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 
 		len = (ctl & DMA_CTL_LEN_DESC_BUFLENGTH) >> DMA_CTL_LEN_DESC_BUFLENGTH_SHIFT;
 
-		if (len < ETH_ZLEN ||
+		/* A length past the buffer would make skb_put() panic the kernel */
+		if (len < ETH_ZLEN || len > ENET_RX_BUF_DMA_SIZE ||
 		    (ctl & (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) != (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) {
 			dma_unmap_single(dev, slot.dma_addr, ENET_RX_BUF_DMA_SIZE, DMA_FROM_DEVICE);
 			skb_free_frag(slot.buf);
+			if (len > ENET_RX_BUF_DMA_SIZE)
+				enet->netdev->stats.rx_length_errors++;
 			enet->netdev->stats.rx_dropped++;
 			break;
 		}
-- 
2.56.0


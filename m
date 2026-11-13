Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794614346;
	b=V3UxS3+FZI+rsG640jTnXWo4jif4NREFiyLqn8GP9ZKq175JX1j43XAV/lYddC7B5jyp
	 Whpc75mm+iIlXRS49OIjMJckvHLVSHNS9qlAc4JlDpyqmMeBsr+kzNLYIzYAMIBMdc5+p
	 yLH21uFgIs2/Yu5CU3oWx9A4XbdkS+GWhdSzbu/XHFa/7gZ/lgJkkwQBENc36aw5L0rbq
	 6ZvHQzJZmTDrqcKpfFtlYRlBIqUz6nPBEXLNHcpapzu1oizWMIBBVTXYvjO0V1odph+Sc
	 +e8lEpy5GXTba0OcmS6N0pue8w0M7QkJEM+q1B9/Q1hxGqv8rZPCldyMGaQT1DC6nmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CIJ9lTxFK2rYD9M28Y9MMRCwwxN4Oxtl/6GVumckvVQ=;
	b=oMMog/GFKiQgiOJcmbDBWcLIPBiH3i4EPsArzkhaqosFOX4mgLxE54aaUFqHRlN/tbi/
	 4I136itQoYP64p2CiZSbNdFHyworxqSDdo8nBzToqASCrqSR7UcUy7+feV4M9w4SQG02T
	 UobPRoGe+0taPCIW0GFSOHc8z2tOzGz1jju7Nw9+1eg6OWd0y53RhvAUucOJcS5osM55K
	 wXCTsqQvNBV0WNUWgo3aJRRUxkBcdrxY2/mWCoe/x6SVFcQpI+Kg6ueGgqZbJQo0Noa9J
	 efFuL2o4ltJA4/9+nAyCAf8nPp+PiY7bsElRS3pxROWivW2C+ParuzlGUbeBtdcTUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFJX82tH;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C0C60A2622
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C0C60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kFJX82tH
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so331705466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794614340; x=1795219140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIJ9lTxFK2rYD9M28Y9MMRCwwxN4Oxtl/6GVumckvVQ=;
        b=kFJX82tHdIN4mLBK3xEGp9XQvLW+6z2W5p3pqMRs8rAFVFnL+1g+4xJ9gB7JKWkotW
         bjfAtLvgwiIvBgXJQrXpZqY+C1Lsk/0xh6wkpzE42iqiYqGNof6bQNehlnbFCIke2C4d
         bb7o8G8S3/BYJd7aO7Ts/QNTQ1/4DUGSm9DNpnGLb0/hGUh8OotqCIrx0iMfkN1+GS5I
         +IA4vgy0ETP4IgXNIVGdHbc/Uy9yehyVEV9G71gOvsuAzge8Ss/bkgiOl03nRQ/68Y96
         kIwHEmyd4S6m0s1YC6pHJ+f4OoUjePcCDUE10WwC+PSgEQw5mTIVqKfWDjVaVOGlmoiP
         MRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794614340; x=1795219140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIJ9lTxFK2rYD9M28Y9MMRCwwxN4Oxtl/6GVumckvVQ=;
        b=J4O4km+WdFT0/eTzNqYvb41s/VqR6LJOlch5qbW0A4mvZQ0r2L6i48gzmMRc/jyR/f
         E8LeejYShSzPHWNglqQHqljXXvWgqGQ84REXq8wPo0kEVpjOfepkzBbh7mnBAzFR+Hcx
         eZxVTJhmwApYgW1SO4E3Zc5n7EM8SM6wmZFdLLLFEK3PjJfFIo/STeL9JBQFi/FlmfCD
         01EB8HGkUBnE1rSwMwW9kHLDqfDLp+xU1042gqwsDC2IAS7l4r3K9hJ025GUSpYQhL8g
         TkSZ4W+wz8m13cmOevTdCIweaxYAYCaPMyo9J23ZiS2valFvjbG0S36iLWZ9f1VVJTXx
         xN2g==
X-Forwarded-Encrypted: i=1; AL+hErHvWnSia/O8lqpbddoVRr5tbrmUYowEwETkROlv7Zf1s2gE+05wi47tqZeW3vwZNtkNhCsr4DFz5p7t6H4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rFsTUVwShmsS+28R6jHN+CuTsgwj5CFlOkYOOHrYnHRX/RvCp
	UcLSNzyPBCHsxCMwg+iiHQg5GSvQFNlrnwtxOj2if+4/UDdStKdo81MI
X-Gm-Gg: AYBFou2XO9Vo4dTZZPOlvPhe+V/ysl0kM8iANIHSFXDdcAjlayctNtLPWJr+TndAebp
	jUhKUcsZBJrvbLOtIbycbQReU6jcO5H95l43sZsXLRt7oqVemkN3ih5Urv3WToSnvY0j8yvHB40
	TKN/XgqFI0lxq3WHdZcB+YRgSDBKninaHQFQ90OpHwDrcJU4j2gT3w7JoK9xVZSEoZb7AC5tJx2
	3fdryBCEgrGS6VMyfgRMNcEyJv1ocesSq3evderaiymhMHIFrEqgPbxKXKL3pXwg1qoq/Uo5Tmh
	wXccxl22edsvAQaP61bmRMoK6pMyGkfRmSzGlftO7MjyZxt2u4zsJNPr45U3dmh9Iu+KreaW3Rs
	+4fwERDk4fksSr8zZEKcAJxfQiBwwr2I3xzmf67BiKhX4oX/7YAMVi5iHuERQO59UcaaM+KkctK
	dPI6tzpWQojCAYVSHepXAM9SQtkCqfewjD5ossUYAeuQPEIki1CsW4oxxnEfHwHCYypA85jA/ZU
	7hmlJf8tvDF/rUTbZG33q5GEq1YjIGDu8WZnqc7PAmPJcqNgRmKxfJdsSw3eTZoa9ce7/BgllQb
	Dj4drdvaVAi7KygYU6QlOZs2xLgkJmWb78Y8VNPG
X-Received: by 2002:a17:906:c151:b0:c2d:c800:d797 with SMTP id a640c23a62f3a-c509614d4ccmr342511866b.6.1794614339929;
        Fri, 13 Nov 2026 15:58:59 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8f9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm153454266b.32.2026.11.13.15.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:58:59 -0800 (PST)
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
Subject: [PATCH net v3 6/7] net: bcm4908_enet: publish the buffer address before OWN
Date: Sat, 14 Nov 2026 00:58:46 +0100
Message-ID: <20261113235847.517308-7-kudzo51@gmail.com>
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

bcm4908_enet_dma_alloc_rx_buf() hands a descriptor to the DMA by
writing its control word, with DMA_CTL_STATUS_OWN, first and the new
buffer address second. If the DMA read the descriptor between the two
stores, it would write the next frame into the old buffer, which
poll_rx() is turning into an skb. start_xmit() writes the address
first, but nothing orders the two stores, and the descriptors live in
coherent memory, where arm64 may make them visible in either order.

Write the address first on both paths and order it before the control
word with dma_wmb(). In poll_rx(), read what the DMA wrote only after
seeing OWN clear (dma_rmb()), as Documentation/memory-barriers.txt
describes for descriptors shared with a device.

Found by reading the code; I have no test that shows the DMA reading a
descriptor while it is being refilled.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 4065769da..4139dad3a 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -291,8 +291,10 @@ static int bcm4908_enet_dma_alloc_rx_buf(struct bcm4908_enet *enet, unsigned int
 	tmp |= DMA_CTL_STATUS_OWN;
 	if (idx == enet->rx_ring.length - 1)
 		tmp |= DMA_CTL_STATUS_WRAP;
-	buf_desc->ctl = cpu_to_le32(tmp);
 	buf_desc->addr = cpu_to_le32(slot->dma_addr);
+	/* Hand the descriptor to the DMA only once it holds the new buffer */
+	dma_wmb();
+	buf_desc->ctl = cpu_to_le32(tmp);
 
 	return 0;
 }
@@ -613,6 +615,8 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	netdev_sent_queue(enet->netdev, skb->len);
 
 	buf_desc->addr = cpu_to_le32((uint32_t)slot->dma_addr);
+	/* The DMA must not see OWN before the buffer address */
+	dma_wmb();
 	buf_desc->ctl = cpu_to_le32(tmp);
 
 	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
@@ -647,6 +651,8 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 		ctl = le32_to_cpu(buf_desc->ctl);
 		if (ctl & DMA_CTL_STATUS_OWN)
 			break;
+		/* Read the rest only after the DMA gave the descriptor back */
+		dma_rmb();
 
 		slot = enet->rx_ring.slots[enet->rx_ring.read_idx];
 
-- 
2.56.1


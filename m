Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513064;
	b=Nu53KOSXtSYkMtm/On13OkY6RMIAs3e/Y2Mt9FBPqOTgvz53aVzvMeBLPnJBWVIG3UAX
	 6H8Zh9LQuN/SMQOdAcKKbanJDPZZRQYrVLNq42seKkXl4WzRNuXy9Qa896i4aZfweDx+n
	 mXkatm2mvxULN70LSGZRySN8RLPvJShFOuK5+/wz9K4Z1cI5FEgaxKF7vy/jbdZGcyEEl
	 pOgxjEQk1nXVZx9L/w65SBqE55Hc9PuK3V0+dnuoSoQt7I7oyV3+dNFUZbE12gDpQaSsA
	 xA1YczhdocfqOz9UWn0w0I9q++57jhQBYIbcWLgORaq+WjejjKRk3F84xZREMTXU27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gyig1chHMnnzbW45ArCSOBvIzbw2ho2ewGO+sy3D/+Y=;
	b=G6vuT2xNui/sjH4dZIYGzLcriqLZXabHWK8nniZXHPztrAdGDdBMzgi2tuLjazglhrAu
	 hsLGNxtxgdRt3IgMKTIfFQMihomAFCK0k8Q8gY4iB5bo9b4glzI+6XSznxx3LM7hI3z/4
	 Unj/RTRjar4nHaEXRyZ22xdWEgkA1IzNMdeJdTnhOYVIAqnUmPWACbOqMo+oKGwz05xYq
	 6aq1sSa03i2ppEIwVF6QBPBxU+c2m2cNKnKjsYG33RUlQSI2q7jn3lDSuLs8im5i5DMgI
	 y25UhEhxkckb7kAgN2+6cHDkQJDEiQSjgEdvmXhrpS6kjDzjnQwSREEg+k6BjyebI+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="G/241nnC";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23045606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23045606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G/241nnC
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so37141a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513062; x=1795117862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gyig1chHMnnzbW45ArCSOBvIzbw2ho2ewGO+sy3D/+Y=;
        b=G/241nnCMOpCBUM8WimR6WUXV8u5qBIGRbDjiPYDvnkyuZtH2JYVmJf0d0A1dknVhy
         sb8t5V+creTKTSsMLxj4SCdtCrruFgrsbbyy/c1XsihTdzlv9J12dqrZuqfPRRCGw6kQ
         KPLBW14sS4Ra0wl84PI2TG9s4PIT/9j2VZ1MGZBDyMBKVebd5jQ+JbIaXW7FeU5gBn0w
         g9ppLH+CdCXSSPF2nDv2czpgVrc/xMy0ARrUIMPxMahFOe8dT48kCgiKrIqk0uihWGa5
         upE7Ew0GrvC44/ukzmxjxvi+8pUoRcr1s870qyvxHkkQIniLfTb6h/ODWVivFBAkYJ+r
         BsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513062; x=1795117862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gyig1chHMnnzbW45ArCSOBvIzbw2ho2ewGO+sy3D/+Y=;
        b=NPYH622cMgixQjSBycuylQHOcSMg29sXK4fyHnT6fCB8mTzfQsosxVfHjoaDAK5A5X
         UEtDpNwJxKF0lb2/UdeJuviibHkqLYnnhmeHwSGvJbPLCXt1v9wF9EaYfenSyF31+LOa
         32ZloN/tng/EpyKRCM0ieM7slhztuI6xIJozqgo3P+jNNlmaBxKuKFrdY//8l+F6rht9
         t3e6ojvr1k0EvAOtZzited/y7DDp5/Jtz2hW57PhlRKOfFiPcJngysd1vP46UefmmLd0
         1jP6yM9ipoH9OI3upMXux7heYYTpKxUc9z5O8rs4KrsekLcrLAQi9kZ9018XORfV8CvE
         tA6Q==
X-Forwarded-Encrypted: i=1; AL+hErFZQu7HTC0EzSz6RQEDub0z+P7TWDgj9GyU6szstRFWPi1KqZiXVJRQDeDmewXwyS0/hT3+NTNWwOYKKKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uvj1W5nWtIs45+4hT0F13Ro7OerdGZdjnmO1wUBJKINftkJrU
	00ar4Stn+Z5sfH2rDw2xpwcmeByVJjPfgQXTXIZVMApOSgNt3FEUIeWB
X-Gm-Gg: AYBFou3P8Ugu1A42Axh5BNqC8P+Cgw/v5xWffUPDBKDDifUHMD8UaBMwSzY6LE0BTa5
	IOYVcy1PDZoVK1vHe3Z4m8T0b0NBShjPwS5pUxt71+EG9EI7oqBm8DLW6HMTNboS1F03QhheQsj
	QOHl4JMONY9O9T/pl1fOqdholmxoEWJZ6zAP3bizJ3zRaC1fT5r5rxncE6m5F9/DcExAoE7hirZ
	/VSKhDE9mWt4pujXE7dTx+S+ngQ0t5/JDgYNFIdr5F1FerJrvfr4ZV4Hw8GzS0xL6QM34c18eAl
	P6BOMD79FKWqiVKYBE/+zteq0GnJi3ny0Ra55U+ZROUsfa67Bo/6u0zAwsQg6kDM2y9Pbe4WXUj
	17DIz03iXphl9APlPrDqSh0A/IHTCKkOHRKsufaMHY7a/M6TAfr98WS05KZLM+QisC59Hwc9rNa
	GsLUfuhjpLzeHuGLnofhJhMrSfolwMU8UxJongMrAld0uPLbcH4gHJPGS2ElFu0QwU278F1TZfY
	7S3rWA/ZLyjhY53PqaIDOzN3SwQEpt4xkjCXE02x0lreXuiaQpEDG8pVU2qjul0+QMfDkq1Ajpq
	yrsKj6P/cMXuUrs5KdF4ORHuFuCEWsWaOEycAt67QFIB6GjEpPBmSxHtvKFWrg==
X-Received: by 2002:a17:907:9606:b0:c2e:62af:b6fe with SMTP id a640c23a62f3a-c5096317218mr27319966b.8.1794513062485;
        Thu, 12 Nov 2026 11:51:02 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:02 -0800 (PST)
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
Subject: [PATCH net v2 2/6] net: bcm4908_enet: drop a TX frame whose DMA mapping failed
Date: Thu, 12 Nov 2026 20:50:47 +0100
Message-ID: <20261112195051.597102-3-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112195051.597102-1-kudzo51@gmail.com>
References: <20261112195051.597102-1-kudzo51@gmail.com>
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

When dma_map_single() fails, start_xmit() returns NETDEV_TX_BUSY with
the queue still running, after it has already stored the skb in the
slot. Documentation/networking/driver.rst treats NETDEV_TX_BUSY under
normal circumstances as a hard error, and a driver that returns it must
not keep any reference to the skb. Here the stack requeues the frame
and retries it while the slot still points at it. Drop the frame
instead: free the skb, count it as dropped and return NETDEV_TX_OK.
Map the buffer before the slot is touched.

Found by reading the code.

Fixes: 4feffeadbcb2 ("net: broadcom: bcm4908enet: add BCM4908 controller driver")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 60f711e8c..b1738d954 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -537,6 +537,7 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	struct bcm4908_enet_dma_ring_slot *slot;
 	struct device *dev = enet->dev;
 	struct bcm4908_enet_dma_ring_bd *buf_desc;
+	dma_addr_t dma_addr;
 	u32 tmp;
 
 	/* Free transmitted skbs */
@@ -555,12 +556,17 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 		return NETDEV_TX_BUSY;
 	}
 
+	dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(dev, dma_addr))) {
+		dev_kfree_skb_any(skb);
+		netdev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
 	slot = &ring->slots[ring->write_idx];
 	slot->skb = skb;
 	slot->len = skb->len;
-	slot->dma_addr = dma_map_single(dev, skb->data, skb->len, DMA_TO_DEVICE);
-	if (unlikely(dma_mapping_error(dev, slot->dma_addr)))
-		return NETDEV_TX_BUSY;
+	slot->dma_addr = dma_addr;
 
 	tmp = skb->len << DMA_CTL_LEN_DESC_BUFLENGTH_SHIFT;
 	tmp |= DMA_CTL_STATUS_OWN;
-- 
2.56.0


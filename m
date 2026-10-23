Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782417;
	b=zBNwZp7QLXsjds5DtzXHIWTiWamZnW4M/mRe3qigLFNwCZRsRF8Lny3Uj2ros6hFKYoB
	 9MPTN5QjmeHdJFSyyV8ocj8BpdwPnHfRiW9wxGdP1NPUTR8LWIPRC6hEFqVGaQjRZ9m3l
	 u+eN/5SHA+2E8ZkSZ79dPuZw28QKv40q1HCLs1wUHJu0NRwLvwC3+OeRgDFpI/ytJncuX
	 Ch+hB7oY2I4OkxqJfomaRvheXEyOfEBbgGPSuWhoM8JfD48DMeTX/5TAaG+dM/8Kf1ea3
	 mjO5ICnVHw9Ma+utM0f+HYOkpm6qfyRYvKs326XvhTSbQpXXHEi4fX195TYKc9GDa1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2+b6Xp2Wz758MZizwri4WwdSM0RQI5RuQjaDSiYF8TY=;
	b=hzZuxMIGyOLEvw0nyZ3GYj8NX9wkTp6yOzg1Xmm+pd0bKbFpwn4EIRyQXmoSm+6sadJ4
	 zEgptJwFzQlzFYsIiyLKaECX7hi9BK9Fbn/nw6dg0SK7HbkRzrui0pEQfc5/mU4xw+UaC
	 C1OgrVE+MM6570esXcwSFwDVUTyLKaRzJ8JUioexYtWytua1NhIO0RGHty2UxtfJ2FTYi
	 B0vW1vK/foTl1hRKH4ig4ZxfqUMh+Anx+LxmK2fa/++4ucB0/zu2X802JDEWqxU3krD5r
	 1SB4kRM0leKGYSgjSyXl3uA2D5jEyG6qwiieEQeBNYATIBPyQGyGmL2kqJPj3BN9t2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtRBTfcB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C2E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AtRBTfcB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2279154eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792782416; x=1793387216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+b6Xp2Wz758MZizwri4WwdSM0RQI5RuQjaDSiYF8TY=;
        b=AtRBTfcBpGQKTHhI+7yJwLms5MHrNAf6xryGSXVZTgD8jxQB+9Ocoa+dVHY3vDnqTB
         0bUdU94gxHU07oU/rlwUMP/6/ybzvYgp/kqmxt5CLk4gbHLzXIFaiGywlVWAwnaWU2fk
         jZKaf2pZQuV195uqumrruJJ/UDfF9XYsvcWCYNBATVVfZ1ybMWOCAOUklDR+fS4YzV7R
         Cj7hSlHhc4GfWsyNqTUCaYQ2Xg8l9gFRBvYpxmZ/44agRx+2BC0oqdQOK2L0pXeF5K7h
         IVnw/9v+dB90P3JZfEea5110VUpEZ1gcMGRXomox5msJZEuDgxhZayl06Wh4geuOJJr6
         36ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782416; x=1793387216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+b6Xp2Wz758MZizwri4WwdSM0RQI5RuQjaDSiYF8TY=;
        b=AgAt4O067whkvvzLHpiTHbg4JdxbjayyRvm6XS6mHjuduVmM860+qKKEo8N+n7Z7RB
         K9urs7ckP4wKtnCwtglpgpGecS5vhFG+kd+NkqAg79PLQHfyaoUIAcHeuLXUxjXyUa7E
         A9T+rzmDbfosRaiRkzbS05Jb2a8oKRLhxUeM6iXeor0SWuTbl6ODFgcbfk0AOlNmgQvB
         oDy3C2fzuRg42HIrzYimGTd/m7dJT5JgwCjhXWpvtxhKdGalQXaRuykW0WlyvUSIe5nF
         XKgVj8kUwosR8yPEsL5TJK/DeBCyu5HPIYOXJVw7r1S4K+z6/zQTJfc3WN3fKbtaOVws
         8/MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcDfOACUHSM885Si9cIhUQBPKXs4GLI5LTVP1RsyO9pX579suFJy9zogfVB8HynC0fhLpWzHqvVq/O3XI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZQ2DbnFE7PTvgtU5TqyflVpqjkUu9sqYLshGlEtERMawnE0Wo
	7isQSJwyfYq5goEDWrAaJKA2dNmz+8ET8dzG91XwpunT0uNJJomynQkK
X-Gm-Gg: AYBFou2962GEpGMLAbvJFzwdumjmKPZtUU7OOF3+emsCOrUbSmvI/DXrM1gUF4d9KTY
	87Ma7A5g5ouPwisyAb6B7OUgLmtHkY27Fe5HSP/ogs2a3ZLvzJf6nps6UZeCkMN07ub+/oH1nMV
	PwigiIDMgBc5Nzzeb+8z7tO90v1pRf+6Ymg26bkl8BU2PFHZ3u3J31/Gb46l53uzvLdrM2VrPkV
	1G/TxFnaDauc3cRHWd1ejgNQJzkbfsf9e0TqJt1pd74OaW05ZN5GC8ompxTaaav1Q61lf/EX7oq
	b4YJO8EmzAADaPtB6pl5xNmJNAbJMRtQ7ko/xOBPAblzqDd8382eeY9FxyONDF3SEf1wk092M6Y
	PIrxzXfdWCDSgWY5UFUryK58rBR7SLStgCTAQ+K7Y3bwrsNmC5+wSQ0vzX2WFV2mEWVjpMzTPxz
	Hr8gqrwhk9fl3ZvcvxOrXBoWe0y40skq7+wZCH2w6exxMV3DmkStnpysE60kcBJNt4aI3dx/9mz
	VhlzE70dGPxPlpYf3MEIXFFwxCmoLpZYV0oin+bQBFQjb8jmGlH9EMZ7O/31KA5owa4yA/gPkIY
	GDNaEPnE45cPXSCohsQESfbxZhff5qaqlcxgV+GI3bgiKUaRkzq8FBaEInd1s0iDfu/bmUCAMZN
	wCeSyqBxGRyOfW+6cH1ty/euQBPZq
X-Received: by 2002:a05:7300:8812:b0:368:8d1d:2a81 with SMTP id 5a478bee46e88-369e861b306mr278846eec.24.1792782415889;
        Fri, 23 Oct 2026 12:06:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm209607eec.23.2026.10.23.12.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:06:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Michael Buesch <mb@bu3sch.de>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: map the RX buffers DMA_BIDIRECTIONAL
Date: Fri, 23 Oct 2026 12:06:53 -0700
Message-ID: <20261023190653.70741-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

b43 poisons each RX buffer before it hands it to the device, and drops
a buffer that still carries the poison, as the device sometimes skips
one. The RX buffers are mapped and synced DMA_FROM_DEVICE. On a
non-coherent CPU like the BCM4716 or the BCM4708, the map and the sync
for the device then only invalidate the cache, so the poison written
just before never reaches memory. A skipped buffer is read as whatever
the memory held before, for a recycled buffer the data of its previous
use: garbage frames, or a length that sends dma_rx() into its path for
frames spanning several buffers.

Map, sync and unmap the RX buffers DMA_BIDIRECTIONAL, so that the
poison is written back before the device gets the buffer.

Reported on a Netgear R6400 (BCM4708, BCM4331).

Fixes: cf68636a9773 ("b43: Refresh RX poison on buffer recycling")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/dma.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/dma.c b/drivers/net/wireless/broadcom/b43/dma.c
index 05da6987a845..c8585c6dff37 100644
--- a/drivers/net/wireless/broadcom/b43/dma.c
+++ b/drivers/net/wireless/broadcom/b43/dma.c
@@ -353,8 +353,14 @@ static inline
 		dmaaddr = dma_map_single(ring->dev->dev->dma_dev,
 					 buf, len, DMA_TO_DEVICE);
 	} else {
+		/*
+		 * Not DMA_FROM_DEVICE: on a non-coherent CPU, the map and
+		 * the sync for the device would then only invalidate the
+		 * cache, and the poison of b43_poison_rx_buffer() would
+		 * never reach memory.
+		 */
 		dmaaddr = dma_map_single(ring->dev->dev->dma_dev,
-					 buf, len, DMA_FROM_DEVICE);
+					 buf, len, DMA_BIDIRECTIONAL);
 	}
 
 	return dmaaddr;
@@ -369,7 +375,7 @@ static inline
 				 addr, len, DMA_TO_DEVICE);
 	} else {
 		dma_unmap_single(ring->dev->dev->dma_dev,
-				 addr, len, DMA_FROM_DEVICE);
+				 addr, len, DMA_BIDIRECTIONAL);
 	}
 }
 
@@ -379,7 +385,7 @@ static inline
 {
 	B43_WARN_ON(ring->tx);
 	dma_sync_single_for_cpu(ring->dev->dev->dma_dev,
-				    addr, len, DMA_FROM_DEVICE);
+				    addr, len, DMA_BIDIRECTIONAL);
 }
 
 static inline
@@ -388,7 +394,7 @@ static inline
 {
 	B43_WARN_ON(ring->tx);
 	dma_sync_single_for_device(ring->dev->dev->dma_dev,
-				   addr, len, DMA_FROM_DEVICE);
+				   addr, len, DMA_BIDIRECTIONAL);
 }
 
 static inline
-- 
2.56.0


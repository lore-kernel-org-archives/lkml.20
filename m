Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B711D9663
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615866; cv=none; b=UFKCMseOk6a/5134eIKZGaKm1ASgcV7jjQiZf02IB9sB7x5lRvkr2OXMHN3Yujx5a6dRXBiJMJHgIDsUBhm/w4ZFzfsAM8h36tg1VL7UJTIhwaxHufTTk/ud69ai9a+dfuJHw43w9UaFp7GcGPvMURsHiq/SIIr0xBsPI7I2WD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615866; c=relaxed/simple;
	bh=I+gAip6iCiFitEH5ylwS6qDP50zs+Kwrk8kdZnbR62k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E3peX6auM8sxgDZ1R/eDOnhJ9t1FRCFOQBUcYvMzX8uo7GWl0aElPRRKbKnfpjbJ5bip+op1fccdl+NmpVxQc7hssZqRfA0qORXuF25J3+vYXlOkdDKTXVYsudLogZL4ci5tScexE6L5biUjLdMV0yQSiSVVgBjwUeqd/OuE/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmknqVjW; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmknqVjW"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91957ec41e1so6506146d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615864; x=1792220664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=URgduepPMzAeN426OFGmttK3BIYHP3JxLMLmidFBFp4=;
        b=jmknqVjW7hcgc5Y7WRDvuUQl6h3M09bKi0O/JvaYc3DmWiA3mA6guMyE1AowSq7pz1
         txMRiw8NUgjjAKIeFdbdNbW2Py2nAQkTi8HdW6Zx/wylMwG2ZINZO6iljYpRMxuiOhLV
         ZwWTv/kijXtswTnuaL/WzHZdYWUS6CVX52pXW57DcNT11ymJr4ycnFeUMjHWYC0vRHuY
         fXWtURonsSeyfcAVqywSgMy4Q1a/xp1aKr98vQuEIU05R2iWrhe8LiVcxIpMzK1oUD1q
         RMZfhUDcCcIQXAxY9mT7inG7hNbiWg4NCdB02U0NS/IQac0/syfgGbao8RkjmPwAS5sZ
         tOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615864; x=1792220664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URgduepPMzAeN426OFGmttK3BIYHP3JxLMLmidFBFp4=;
        b=x94Ivk2qNNPOAsyhm7Sg55ejp0yLQjj5YV7biViFPl8oBhb8ldSoNgK+yN7bx27y+9
         Yh8qAn5bxo/iEQBmiex2EDAym6DZfaQU2yhEpw1cAyzXoo0CFeGbKuBAgfBpxTT9WL9c
         L29+A/SA7sb90txhjYYAqUvhGJZt5nxrp92nmaD7tsBBkw1FaKoHVq0z/6IL0NCkqFeR
         Q7qD3JJJPLyQFYD18C9PS5xl+Vb1moW/3tRQgOV8OkBtuuJSmOnCQ+1MmaPi1fu+oGm3
         +JywFEX9eFEGvmKSusjHkSzjWcp/2z5LRAF8+ek4RVW8ueUR+JIb/jCGwUD81yrrowdF
         1xow==
X-Forwarded-Encrypted: i=1; AKwUvBx9VZ8FiEWC9h/CDrR7ZvmQ8wRVEW7jCUk5oVVO+TY1fIjy7OosOCX52C2Bwgx7nCx9InwSbc1KaYUu4C8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp3+MA3b2Rs1US9HH5RUc2gBxxu3kLkuMBaHl0LUde8h+2Pwae
	yT9RBBU4+9ZLi3aHwtmjS0dheTnJnOtnso+rDF+ditVQydW9uZspZv0m
X-Gm-Gg: AYBFou2x/V+Db0SxjgXqSQnfEf2fgKKvHvbvm55RLKTlNB5vhixl/Bvq2SwCoQF9NkF
	GS8I420sshDllgqDoUcWclF0yIGDDZYOK7I0V+kiydSHQDKY5gylJmlu9PxDZGiUzE/TEOQOSs5
	bVBCLln7KsP12n3ygRS52igESUUapXY27Sim+GbZpeyNIArAJjojRhIZdB3eC5Pr0LRd2kiETRw
	26JrKQsRTcSGWTMjkb5MjE7USz0rDel+cG+/GHr2uwVCRoAOCw4a/X73xgi0R5pb8+HZpZIhQJ/
	2DfIzR4Os01by7r/+fbmyrFM3h58qOKzT7Fi73tAOZt+TsKZ1yCbBlLirRGen1hNkyhYxe+Rik9
	9i+IUz6EpLBRWyVzLHx+3wGQ4gjj5gsyffStUsRxLw2wc37uNzP2Sf4KTXmM2kZpDoddBBm7UVN
	zvfW/GgBVgzfutYBqZ5d0T3RqaDoiAt+IavyPK5UpGFjIeZcbuOnYrMU5AEusE62s15pWgrx7yd
	nWO7qvnUHQoXOu9/RfLnKDDlEUAHHd74q+dj4p+VZchskxVEZ7PMIfcEcOWfhwPl4egkqp6YBSW
	L2eGFUn5fA2Z8i8fOK8k18GX43mqMIhyqzPaVlPTF2uEMD4npQ==
X-Received: by 2002:a05:620a:3954:b0:939:46d7:4b4e with SMTP id af79cd13be357-93ebd0e4d0dmr658712885a.7.1791615863616;
        Sat, 10 Oct 2026 00:04:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9896ac4sm359095885a.31.2026.10.10.00.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:04:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: clear TX slots when freeing the ring
Date: Sat, 10 Oct 2026 00:04:18 -0700
Message-ID: <20261010070418.84457-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bgmac_dma_tx_ring_free() frees the skbs of pending TX slots but leaves
slot->skb and slot->dma_addr set. The slots survive a down/up cycle,
and bgmac_dma_tx_add() only sets slot->skb on the last slot of a
packet. If a slot with a stale pointer is later used for the head or a
fragment of a scatter/gather packet, bgmac_dma_tx_free() frees the old
skb a second time when that slot completes.

The function also picks dma_unmap_single() or dma_unmap_page() by
looking at slot->skb, which is set on the last slot of a packet, while
the head was mapped with dma_map_single() and the fragments with
skb_frag_dma_map(). Use the SOF flag of the descriptor instead, like
bgmac_dma_tx_free() does.

Unmap before freeing, and clear both fields.

Fixes: 9cde94506eac ("bgmac: implement scatter/gather support")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index ebc4b3bf6c4a..f40fde1d6bce 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -534,17 +534,19 @@ static void bgmac_dma_tx_ring_free(struct bgmac *bgmac,
 		unsigned int len = ctl1 & BGMAC_DESC_CTL1_LEN;
 
 		slot = &ring->slots[i];
-		dev_kfree_skb(slot->skb);
 
-		if (!slot->dma_addr)
-			continue;
+		if (slot->dma_addr) {
+			if (le32_to_cpu(dma_desc[i].ctl0) & BGMAC_DESC_CTL0_SOF)
+				dma_unmap_single(dma_dev, slot->dma_addr,
+						 len, DMA_TO_DEVICE);
+			else
+				dma_unmap_page(dma_dev, slot->dma_addr,
+					       len, DMA_TO_DEVICE);
+			slot->dma_addr = 0;
+		}
 
-		if (slot->skb)
-			dma_unmap_single(dma_dev, slot->dma_addr,
-					 len, DMA_TO_DEVICE);
-		else
-			dma_unmap_page(dma_dev, slot->dma_addr,
-				       len, DMA_TO_DEVICE);
+		dev_kfree_skb(slot->skb);
+		slot->skb = NULL;
 	}
 }
 
-- 
2.56.0


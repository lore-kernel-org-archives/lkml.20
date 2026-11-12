Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513068;
	b=mDNt9LSsMQbswBjFoq+AHAz9CHaak2Fxww72YbD9aq04h2WXq3S4/BqinglmfND1UYmI
	 AJ2EMMAwXXTMmWtn4IOv7Wuh2QM+N+jno+Oqm5dmPQ7Mb6f5sEtAs4PCBLiEKDbOFcw9T
	 Y14pp88j2koS34YLQEuFSUfMf93tG6W6cu2ojY/8vefw2fDoTByQM2NcktBigaN2gvbBZ
	 TuR4Sp4jqJIKi+ORme8GbMOhoatQfQ4kaiecbWNE8P+lPAC9w+Hl8f261L3fVqcCT/ffc
	 uhl43pakyoKY0yB8yKKb1tjXHidbmzJROrAlYCeu1ryjPILWqfYsAfzpWCdn3hjD2qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9wH/dvIVPNok79VeHTk3379PpsJpsn5pMeJSpNre7+U=;
	b=j6VDr9UczltabFT4WXZ2GGohrLYLciWX40njDsLa8Rb9IjCCp7DgeKymst9Jg4R8u8Qe
	 yyENyxY00l9y4gdubgtHEISFSn8suz8PWH2CohC/UcsouDFhzLpU1Q94XmY1nG4NzTfuQ
	 XKQMWH4+LeyNi2QmyIimEBtkD4MwOi+o5QyxCvz0VL4Lb6oM6jUEqxUK/i93XqM3kVCVL
	 ggi2wawnS+Fk82ZpsFMxys9f5dsV18cTdFPMGLePG26G5aXOC4id42yGshL0KmynEuuqM
	 76nefPl6a8xrx7MNe62U4eh310qsRjRSyiWpAQuMQfR9EIjR5xanv8kaByuIKi/OHoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTlFXnb+;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2560A2631
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE2560A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTlFXnb+
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4c9abc1824so483866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513066; x=1795117866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wH/dvIVPNok79VeHTk3379PpsJpsn5pMeJSpNre7+U=;
        b=PTlFXnb+yEYKTeMS1WaBDvg/3Va35AQa+wKdbJANXL6TZHXOKamvtvEn5tHjufUyDP
         8a1fqMxM2Gh2XqIaqQKqYq2TV3uqMMUuVu0aCEwqzt/u+a8L3S+aimUfl7fVpGRNDavZ
         /d9och4+bxWC1SldOqaAnK9hslcfautqDw4zrrCrkGZAT2cRPB2xCdbXnzLS3ohWjCh5
         +gfyiU6zxYphw7NzvKROiwR95KfqsJhslFnBMMGuQuh3+2pkIq60A3xR0AofgyRtcGHe
         5pKYPHEsTXtx0CMjDApAJW5DO7sc7oYoMtK9KDDt1RoyrS0HZcGwgk1EbxkdQpMFpqff
         strQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513066; x=1795117866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9wH/dvIVPNok79VeHTk3379PpsJpsn5pMeJSpNre7+U=;
        b=IZnHCTgw6/+3UQXf2ikRU3YoRcpcEuCoP9CisQn3jYzPE++g6ZbOG2COH6vUqZC6Lx
         SR0oAk6tL6IOgPXuDZJ4knl9gSrx+yqPGnhhcIjN6oWs6kAgtMJZoC5TJm3jz0gH+0UL
         2XGTyPSg75F778x29nJiAHqspXwUI34Xw9nd5KKahxj8OUh/R3mh3PqDAYAcbXmT1YI6
         qoLVIsqyNMZWUIFOQKVZbNwQJkv+/so8JYXtdwCfVqgu4x5fch5IuXy3o+TZOSeyZcGg
         kc0SpezCyiejVuKNuxTiWJO3pSnI3Y44coYDCdzGdM+yMn6W6suAQVeohJVfsQxtoxJ9
         RsPw==
X-Forwarded-Encrypted: i=1; AL+hErFYpCA6Recs0A/dZLv4vYKpDjP5ZUYSe9TJiacR6Nm/QwufbUcYMUZKndotDhgkjeQxZ7ofpEaOtS1rqwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L403UgnRmU+hU9Gg2VZ9DPniTBAzJcPvcQL9fRoh7lX617qjm
	LdMK3hsKfs7NHubUBdSmm5e6TRseXePS5KbQWCRHLZVDL25CcWAulVqQ
X-Gm-Gg: AYBFou2X8u3hdiYgo/2N4O8fOpJb4mEypBUTOwn8thvST7pZX2P8x+Ms5iwbWeCUF4d
	xnOdelWDrj2KQPAbd3LREqgFAz8zQIPFbaq8l7AT9dZ2NtunDNvEhO+6nWAO4RpmOhi+Kvyf30s
	PlLtdmNbJ94dV37t3q+vq0quqTd+haOP5g6y2KrhbPiHQgqiO0VcQq+1OdNYQIabJqL1rXKlbDb
	V3jkdN3ZmFfXkc5fFmCnsokXCZh7drhJgk1I6/l++hvl1ns090MqQpjkgTA/IUeZM56ZtNGq+dW
	P8Utd+n2JlqXx4X63kOef+poh0+E7RajTd9jvK4IpsMspmfxW03YAt6powhwBnRhIb1vFSpHaV8
	c34IKsBfkDSUHePVdx8RyqfWksx1HR/EgOgTj9sVpT37jWj9NM7aoegbUvXzSVE+CU4swZvMcF9
	2vxfTYwjec1dlbMeOIP43zYyFB/Bv5OyuhhBPxMuKLK13JOc8mcuiyCAHpFhkVP0GP/XwudNYsK
	8K5uzLLM6f6o99uGxaxJOQ7fJw0WPVZEM9U9gIxq21uUE5LN9NQOjzku/5b6OmkzR79cXYkIfoQ
	Q1vl/QxtYl5/2+W5+efsztRONqPT6HyVTZZre/4F
X-Received: by 2002:a17:906:694e:b0:c4c:bff4:200c with SMTP id a640c23a62f3a-c50963da4acmr22688866b.32.1794513066329;
        Thu, 12 Nov 2026 11:51:06 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:05 -0800 (PST)
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
Subject: [PATCH net v2 6/6] net: bcm4908_enet: publish the buffer address before OWN
Date: Thu, 12 Nov 2026 20:50:51 +0100
Message-ID: <20261112195051.597102-7-kudzo51@gmail.com>
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
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 8ac749c44..3d44b3452 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -290,8 +290,10 @@ static int bcm4908_enet_dma_alloc_rx_buf(struct bcm4908_enet *enet, unsigned int
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
@@ -610,6 +612,8 @@ static netdev_tx_t bcm4908_enet_start_xmit(struct sk_buff *skb, struct net_devic
 	netdev_sent_queue(enet->netdev, skb->len);
 
 	buf_desc->addr = cpu_to_le32((uint32_t)slot->dma_addr);
+	/* The DMA must not see OWN before the buffer address */
+	dma_wmb();
 	buf_desc->ctl = cpu_to_le32(tmp);
 
 	bcm4908_enet_dma_tx_ring_enable(enet, &enet->tx_ring);
@@ -644,6 +648,8 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 		ctl = le32_to_cpu(buf_desc->ctl);
 		if (ctl & DMA_CTL_STATUS_OWN)
 			break;
+		/* Read the rest only after the DMA gave the descriptor back */
+		dma_rmb();
 
 		slot = enet->rx_ring.slots[enet->rx_ring.read_idx];
 
-- 
2.56.0


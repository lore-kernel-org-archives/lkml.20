Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513067;
	b=Ci6eZPUvgwRrHwHPBiP4XvY4WFDiTWD1WlUViFJEfMqaRCYFQdeFUweKTRBYebDtuAxs
	 ZLbzgIQWAqLsh1RD+5YXL1+PbuSmWGcOv5nHCrsIj3E7+EJ1wdo1iRkxpkg4fKYWFjgcE
	 LmVCOx+1srC7Y0dz3PUrAssfwp5VqcDv1frWBWfdGFIl0pHnT6y5heeutnWAixDS897y6
	 VInAZzSMWNPH59HnZHMCeccd7UR3Tq1Vh2YdhR4m3hhAy7tK9W4JCLD6SadMIh4cO+ZRW
	 rLEu9QMOwsu9R9B4Bwp1LaGUwsPgLe52+f6jN5aO/hM+uEWQDY3SdbzMh01TQCgXZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YQWbLDtfU2AvvfUHn0EiRY82gY9ziJzVrcJgQsIFr8o=;
	b=JJJi5unRAUS7lH/ERdt+4UOgF0B06uQuGu2DdaNODc3T7HzbnnPwiDQk0ukrfubTOzOa
	 EhgJfyCXsuqujR3NQbM3Q2TK0fIHbAmX4jy4jkECM+uqwdYcUXnBSSAFE8jYM0dF+hVwJ
	 F9INgM9M/lAJ1QOvWVGybBi0TGvDZ6j0Dw7uRMN7Kv9t8Frk2++4fZOckY/vVu9N7L3zb
	 usf62C7VkEQigEFc7614o7qhHvVbwJQbCAESQ1yMq8pTjRkw29xH/0/fE86D5fiJd3iJI
	 3Xt9F3JYqROyIhCniNKGqOApVaAZ4xYsTvwutBnCFhEodyw7a0K+OpjtWSgIRiO93Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZuX/cqWx";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EA160A2620
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EA160A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZuX/cqWx
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4c9abc1824so480966b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513066; x=1795117866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQWbLDtfU2AvvfUHn0EiRY82gY9ziJzVrcJgQsIFr8o=;
        b=ZuX/cqWxXtw4HCPZLJDGdLmhPsX7o7kQE/0vm90Cbmu3emuolknkNWbax27GMq7x+O
         qjWRQmEGwYTutLrHNPxd7eh9ZJ4lFbFc+iXtjBILqdAzoNW3xGC7a9HIucKJZphNE9H5
         27PV8NCA402uRY1J1X68T1wrLPVmp9l1FIRnqo6pTpAtA8z3Frl+40kqyQnF69yTdfsC
         J+b8KkE5M2nKBIGum/mZiAPnL21++J+UwIe3YT7Ut0EnKTT3DjIzPQ17w+KgcRlstqD1
         UnyGilMl6X7mbzJ625I3ubSNyismw/bYsbJEJYyn8MD76M/Wi6uWT0wc4VaDcny6qD1l
         /uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513066; x=1795117866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQWbLDtfU2AvvfUHn0EiRY82gY9ziJzVrcJgQsIFr8o=;
        b=SZC+6/nfrOsQsvNtjPEJxwPZ/zmgOgmGlmP00m1wh1aPbVdst23v9bvWweCG7GmwhD
         2DFI6elUe/txBOmaEhL1uKdnzukFBHiOM3V01BLpfHdpfUJd3hNSh/7+6OBcQECvn3U6
         DDrh40danL7VcbmyDDT2znPcYGC6OW2KrKKGZ5przM+toIRD9z7smfwl07ZjrtdXEZlq
         UeTWF+woXVS6G2wVX3mITcGbG6DBMNtFi0WNxmVwUsxu4OPNiQNZzkIJndYvMMs/Wwu/
         qnqEtSXKoh++RNtUHfE4F4QI9QydqhMh7eUsXGH2eVuanT3B7mqvn9jUM24O0dP4ue7N
         +o5Q==
X-Forwarded-Encrypted: i=1; AL+hErGe1u81OAN2rPvNAgeLoOIdbjeo1vfqC5a6v9PaizEl6NT+QriovynYkTDDhG9+Fx+ZWZGrIR2J8PLNwL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rbyp5XaGdkoytkd4CTIhVgzxSOoPPu1TU7AhB1+NYFGiIMwuc
	AVRr611zhYChd/PgTwv6t4QBzIwflRmcN8qKrpb+L4OvhWhdNsdpqaZI
X-Gm-Gg: AYBFou3W6tYXI+VdOLJWSsxYkrsUgcJ49V9SjbKFDQgobPp59R7O7PBlP5FUmOsdvDC
	AlhQ9GQpq8mzBQAosPUfH8DOuv5REHttp5vaHSac+mFOyHC1C3e0I2jRNE0iqQ/ypfkPVEGsux6
	vGIrecApGQzpVSNfM74ouo/y8dwlcI/QuwlTKxtQmmg3Feq/VVbMwYDD1tn9MbLZudmAOLofVOn
	9brtu8SOeysAqowReMdkJcddFhZKZsYGGU8k9Qh7Q/YaLCj6lykTbKP/Ez4yTJ8cMvThdeGnLcn
	OjkZJyRcn5UxahgxFQBFac+vf47HzGWTcmo2pN5mHsXGxo3M/oVN7225p3Qiams5npsC/DJL0z2
	XLNr3+q+iciOKCFlCLoC3WWt6KCazm8J1Mk61HfPiksX2K3eGEwm4WIv+Z2d9btBE6AoBzzD5ER
	M5sfFRXJlgj7t+ZEScry0tY2ahPEoKTqySMD4gFn2/zfzlgQv2nGnoH4N/0Tc62vkL0jQYkBhlw
	XJbeIbEXL/PKpekDrpQYx3SKfsyduYzi9yp3ExUtB2x2yArGhlycV8wRSCpWrA4N79hTlfZ7Ag3
	rVNjw6R3Ouq1Y+YsH9tSkoxfqKPxlFYqVqNsXpI+
X-Received: by 2002:a17:907:a909:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c50963777b8mr25764866b.11.1794513065501;
        Thu, 12 Nov 2026 11:51:05 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42782sm11727766b.38.2026.11.12.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:51:04 -0800 (PST)
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
Subject: [PATCH net v2 5/6] net: bcm4908_enet: unmap RX buffers on stop with their mapped size
Date: Thu, 12 Nov 2026 20:50:50 +0100
Message-ID: <20261112195051.597102-6-kudzo51@gmail.com>
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

Since the switch to build_skb() the RX buffers are mapped with
ENET_RX_BUF_DMA_SIZE and slot->len is no longer set for them, but
bcm4908_enet_dma_uninit() still unmaps them with slot->len. Use the
size they were mapped with.

Found by reading the code.

Fixes: 3a1cc23a75ab ("net: broadcom: bcm4908_enet: use build_skb()")
Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 7f80e4e24..8ac749c44 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -333,7 +333,8 @@ static void bcm4908_enet_dma_uninit(struct bcm4908_enet *enet)
 		slot = &rx_ring->slots[i];
 		if (!slot->buf)
 			continue;
-		dma_unmap_single(dev, slot->dma_addr, slot->len, DMA_FROM_DEVICE);
+		dma_unmap_single(dev, slot->dma_addr, ENET_RX_BUF_DMA_SIZE,
+				 DMA_FROM_DEVICE);
 		skb_free_frag(slot->buf);
 		slot->buf = NULL;
 	}
-- 
2.56.0


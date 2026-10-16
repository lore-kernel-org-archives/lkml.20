Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277AB46DFFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141984; cv=none; b=ZZNPKLz/aMZQu+nRxTu7tmfsl+oyyVobfk4eZLBAGLI4uIItN3PrrxTCqPMq1UU7lYqaW+CU7IRCEVkgXgb7YIZCVYcizfwWW2bom0q30EhnGX0hSNyNl1ywqnT1OQz475whZ/EywRsfhUhFa4OcRFe4lTlZ8/qyBYrXIrBI350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141984; c=relaxed/simple;
	bh=ef7Fw6tWRmoS7SAlJ88r6e3K75+WCUkomH/n+4D5raw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgL9Lv4i2n5Dtg0d8yRuv6thk8URPmUOxtevP3qYorXrGtQkrKIXHFocIjH6mTxhwD+26K11a7FgokJizwO3AF6b0jnzVELEuaiJShIQ+yyNXVkHu+guqvQw3zRI2XMx9GQUbvizgnvfFoOf7JdPVFG8Tm3C4i4k1VjAH3FrutI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFjVZs3h; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFjVZs3h"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab41538192so4427660a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141982; x=1792746782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=kFjVZs3haVxGgGO9dYMeooCWmPexNk6tlYx+KZp3MZQWNKAhDVL34iyIa3cca4dDsm
         vLjWrvIqqcRh1WtYXK91Cj8dIvBHAx82fIRkHJNsmlXhv9m0881Wsk15H+h9/L14xnld
         etbo5YNFLDQWJT3IRdpDGGHgqJx3XBCEEPpgrHOofBiaeWFTp1vcSn0gihgg1tb60BUN
         ZM1R5fCdkAVNxLHoQdggpPdm0KDvy2QhAGqzlQ04u8e6duu0U4J7ohh/dEFL3EeEbGpi
         hkEYeyZdf+MwqjcDf5h4thgpj+y2C/vuF4OjOWmiDrhhhKFlo9cjfc4nfuJkznPexc/5
         unLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141982; x=1792746782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K54IdL4RZByTjgnEb8ZCDinU/s/KfGgM+FAnEVJz+c=;
        b=dFX34k4OfUf3dUB5AGQjm3C0A6HCQniZATq3MabgPd1HY2hQNeBaJ1iqaYJnYHb6y4
         YBkXfRivhjgRNLHr4VKdgDLz0b85TED4sZStnlVmsWzfqwJ07GTnYwXq1A1MU3I7aUAb
         VnrQvh1WwSbwqU1ntrtvw5nU23rKAkgzIwVnC4oNBotL3xWnPRZZYbIOYIne5yap8ArD
         5w5inJ0x4xcZney0izfjeMU1ubk4GIVruBJ1rXro1abNXsNRD2kuuW8eZqAsNk7gbJyG
         mGIvVMQzPcTIFv0KrJo2GBJDbyRF6sFm6hcx6g5EhxJquob2M+w5thMBs/02DLXwgcRE
         eqDg==
X-Forwarded-Encrypted: i=1; AKwUvByNb2/LBRcIJbOULSzK9mEcPwoLsHZnBaZQJXEH5gKX5ZZVtXoUUuysgoO/fyS4dyixr9Q/M39FpOrBcTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUZrCcioconj+It/TbRR4VqPhWdWRtPxT7swkWqnc3D1DzhxFm
	/Yx0NHtkSHQlAKpQr81m2VbYSkihKk6r0S5iYR0Wfk5knON6WWC+ZiHE
X-Gm-Gg: AYBFou2Ivpv34TlVbRH7o8VTuLvgGom+x2S8/C3HUk4SKzvHdHFo14p5Q2Ru36XV/BS
	MsuEfY5JiAhkEUAPfOjmFOpbGFZkL8t8wkE7U4z6saB7LLjb0/Exqbmjq0Y7TRc9IMy0wMszWkP
	2yyiNDa8N5zznlD65C6h3MpdPK/iBOilu/zXyc29nQAHB/v/KOlmD1Uspf3+L3vkNzO4+QWSfZq
	sf0SJ42h8S2/r6DlEe+4MtdPq15sO/QrkJQg3WBYPepEyiepF+Huhq1kClvr7bjM9QU5ZjItkVv
	Dt+Fj4I3nrF8nrBBoQ7etRbGH9y7Nwh00LkcW7jWzIH+vv03tjn+v2Pl4IwMunFObVlhJnQxYFR
	jubct5V2F9dcvu+Lv9AZ8XWxtv1tnKub+3peY9q8R7TtFb54rvwEz9ldYTjqeyJkCLEmyEgD86n
	Muq2JPSpnqPyjniYUu07kHYCMzNLUVgPN4uYQyCKljqy/vXTDt0lsI9+ExIBGMuhHz+/evM5GLg
	pjakKEPzHfkS1V5zU93N35Q9/VOW8T2Q1ym+BEx0w7CuXZH3Q==
X-Received: by 2002:a17:90b:4d10:b0:3ab:e789:ce84 with SMTP id 98e67ed59e1d1-3abe789df31mr14032439a91.65.1792141982237;
        Fri, 16 Oct 2026 02:13:02 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:13:01 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:34 +0800
Subject: [PATCH net v5 2/5] net: ethernet: mtk_wed: fix reset condition for
 rx wdma
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-2-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
In-Reply-To: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=911;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=ef7Fw6tWRmoS7SAlJ88r6e3K75+WCUkomH/n+4D5raw=;
 b=+PQFTR5s+TTWwx7Z6oJWtXxCv8fvB1yIrErU3O65A0x/ZCM9asxgNMV5LpBxXawCXZOXvZ+QF
 sEZym+shfFOBc3c8pjPDBrbFSHIHqiTE/3NTqOrXjEhY1KjtJmVMjZJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=

In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
reset which is wrong.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,

-- 
2.47.3


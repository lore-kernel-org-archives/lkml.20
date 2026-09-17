Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73E23557F3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656257; cv=none; b=TOkvVQXJzi58h0+1PmOKqMZvx5Up89iDTeqxzinsK8kPbjy6vKbBvyj/nYS4QhzyYiJBL3miNnXctNuiwDbhJqLgMgm+O54+Meq3gfNNMdie9vG86MzDkqY1Axb3vJ/PUhheXmxsBUMwbc5M03l1otsLHI8xyRvLOMrBRMU6XAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656257; c=relaxed/simple;
	bh=i5l/MrnI1ypNlMLTJuU1qsyK6FRr4dvCYiWju6B2/aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8MXeca0L9TIgGsNOatNx8wDgUwpmPBFrkVhta+By0wcPEaJJO4u52YD3gmgE654OrlGjNgC2vsin72X9+exJHeq7cGzB/TqgmK4tWp89C/3yiz4tCNk4z1lRY48sOaBeHzKZCAv0gpQLP2bkdrF9laIWO3iGKXCWLtcKTXLcDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWOAwDv/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWOAwDv/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so795578b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656244; x=1790261044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=jWOAwDv/Hjr6X5bZ7RbUqeKZEFRO+ZX+YD1qSlBXwdlAsJR1EChB0ukhhyFl2xnJwn
         tgbbLivGIbRtdgyMNW9AIqxumYNr6JggYkqdsRjg6RajW+yNpoVIS3yPke7dGAOBlw2w
         lmre0gBXcbyueZHte1ZFyjYFJVg7/rJQXL/dN0qErZuhYQoUXCCsltEQktiC4wO+ZtTO
         ZPsoxzZ1SYeM1XjyaTM29Rd7MixQSHEZzsdx2F7u0HIYTGl0i4/b1wFTmmWZJCvt9+h3
         nW6tA4fz7q/6WGUvr6wQ5qzvbtQnX9FWwqhDgjA+hg1f3h+x2vGzjYXRADgyFJwhfcrj
         8gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656244; x=1790261044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrDk21UY7OLFOZBR0vjrLvOMR24vY5+kMD8RCheOxbI=;
        b=NMuLsFZnyXxR32KirVMMjGMAiZQtQoZJNFCPi7JvFS9STTWYtjwL08xYKkbjFidvF2
         wtYTrRG0JHFMjRIqi4VhjqnOlsbMZ6yoW00Fomrc9Td0MXnkjPd5kN9+qwukKKU3LtDO
         eJfE1sEUbduOLtLkRjbS2Euw+H4WNAg+7enmvL5kywS2V5BfboBKm4lDrr7PMfZk6f3g
         Ps6hPfbYSOQqXiQVCYUywelvGswilRo4iVsOv3ikgKiNl1o7/+d6q3yd+LcUOvbB3PTC
         r4PxBn1V6FwfiIhUhCg/jYNEqijHBmxWL71z9EID53SyN7qmtVoz0yMO4ZYfQ35PH2bx
         B18g==
X-Forwarded-Encrypted: i=1; AKwUvBzTy9hocd6fAgcOkCOya9J4Gieu28fw9hJ21UCNLNiqKY7AB4fe9QCBGgil4qKGZcv7B9TA1vl+AFUNRv4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFwA7XEnjLyZI65LAtZg4kgaXzW/+dcSVXhgmq7XeNqBnz358c
	zkVl/wK26FiCKaT6FY/jGBulPGdofLLq0gtJd4Xr8vOu5bkqGR9GzkJZ
X-Gm-Gg: AYBFou3TFvWCZIpK0t1D9Yx540sw+dCLHwidJOKtEIfkaW+Clk5tovQpHCVXU8eVEpt
	ntabbbE2pmrvEwtaroDWeh8lfeuTZj2gbrenLx1GiLrQ8CWYDHeDoQaK4i+STZMfNctmRaJ3uzn
	whTralb//w8b5GCMblRg5/rKG5SFnl6OZpCJZYrQbAoSuc4tWMLDrAcnZci1wB7Y62B+q7vfI2w
	bs4DHrMzB/JRcszqseEy1vCFjP1v8NqjVluyvfpuBiiA6TWjOGdeJ+h9aNjgeketRQFX5riIxnD
	x5wPQ8PoFmDTtNneAW+EcN44RPme8gaLg+LgEocGUqBIrE9l8Pt8+3q5e2mufW8YaK7eq80Bk2b
	MoXauK2LcXL4Pz8Qw6EumwHKctpELylHqI+JdERTBRuJOHZIPA2jkc6SkgITqI/jZ6tXXQcuPHF
	ZVymy7eDjihSwQOCetefq9MdlVAt0O37uv0n5w1/ho6FYKqK00n+U7pGO/wVJBkTfG5/TBRzBEm
	PW5h0uYgPAk9IyEJg0CkPcaMf5IIFC3XbkvI4Duxg==
X-Received: by 2002:a05:6a00:1887:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-87236fd6341mr14621831b3a.7.1789656243473;
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:03 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Rex.Lu@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v4 1/3] net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
Date: Thu, 17 Sep 2026 22:43:33 +0800
Message-ID: <20260917144335.19466-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- no change
- Link to v3: https://lore.kernel.org/all/20260724172040.1653-1-hujy652@gmail.com/
Changes in v3:
- new patch addressing WED v3 ring reset issue raised by Sashiko
- Link to the review: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 53d3b7e00e1c..d55042ccaff1 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
 	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
 
-	if (reset)
+	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
 		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
 
 	if (!idx)  {
-- 
2.47.3


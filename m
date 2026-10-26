Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008692;
	b=G7fXvGEilKW1HRPgyG1XOb4I4OFkUroVeZC9L/6BaZizxocmpBLSMhBSyRwpI6vIqIUg
	 yaidYDOb9B1rMmfpu6zMpd4RO4rY9iknX4s+GdNVd+gt0Bt8SYHUgFxFZCCB8/Vp0ahYC
	 ZK7MEqq+0qz44FinOU1yPJNXApKAnZ4wFN+XCw92UaT/cTMP819+WQMT0LV9kHlV3zOaN
	 bmpdiqVh1Z2PWvdjURRk1QcXF9TA+BJUe7bEMo6jMDvNAp/G7xFmOx+3DABOLUyLL3MDH
	 qL+4saoGQ4T6qtv53IOeBH5u/HWYQy34ttiTRlei29BcEsoPbI3bDA7Ew+RaNcC8jYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
	b=X4v5oQewPK5pQxX7hdy5fo5wqiQqzK85iPutHktvox1k3I3s7CwwcujBJRUYUU6lTwgB
	 acye5ncH3IHQb+quo4Ct+vZZfi4EzdOBwaLM/+83DWNrbaqy52TptrKXeEnlKvEd6Ul1N
	 5OlKuaR2tMO+ksIGzus44kOaxfp80S3Imz/7oxpY8iGNy3qKJjnbNLjrzWhk9rvU/BJqA
	 ialXyKtDCQWWC2rtjUXnSR7QirhnYHm22DUOASrBQsUy2tHrD+8zqH2CHQ64M1t2vPwJc
	 guZ5kWqzNDX4uUI0bUHs88lJ1tHuk1e3zxMDlgwd6zTCd7Q3Rd51s5iPzLCFnt7dDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FUhVW8BD;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA678606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA678606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FUhVW8BD
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so926683b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008691; x=1793613491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=FUhVW8BDOC+UEg6zlrVzT7PzcvAUhOzS1uadl76us3Vuc5RfIivmXOjIdlFBPeu0Ol
         wGGbUhcM9vBcuj2xXbDX/zAsXYw/mE7YTfUYhbB6LlTQ6Ylc8+PFJjCGI9X3mjs0Hduf
         Tjj5FTI0rUzZkDPzwY5hPN9IMjcrqOCoJz71dmTWiYMPbN1GA0ZzoheCm+p5JlPJVYjx
         lIhA/CsE/GZrvQFjkvuuabywVCG4tUQodVFXzwCj9lOjMILWvY3BBpJUsitbIi49hnmK
         +1YLIJCTKOqcH6BVSiCOalF+hPx1diQZvjKiIM76XvQEfIAxVpk47p5YFWS94QRB3qnn
         1zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008691; x=1793613491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=i3YdCi/Vo+dorkP/dYCNXmmb+urIWy63reNl+dfEEL/ghGTWqANxEJxkc3K+MNSHGl
         MduwY4g3YmgL6vCh6yoiAZ3NQJL6cl7IG4s5MrWvzipTBEWg5THgqJSmXuYT5rPV+jDA
         7P/jdoOaKEd5mRcNbvqzXgcs7YaDUBcKvtj5rLQH2Qk8tpDChRWDA32xBn7AJl8fpIJS
         /cqKNjc1bKXc5T6mAd0f/+UV/94QZrdIp6nW5dztVbTG+xgf3hRbLUrH1qFP5FIOIm6d
         a4vCj1lQdl2NU1ke2tMR49FtAZbrBqubyvZjnfZg4Lg5eO32uNLiuO8/WXmWIMUTI+5D
         GwzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+kPr4YFKJqACKPZNjdNmfKBnM4UJS6le6UhNTME2Bjxow8/fs0Ntjzou7SV3VzGsLqSPlQoaeWEoZvd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6RmLV2svWVLp34sP126Othv4Xr8i3OKOQA6IHxlWEni5+MpBV
	wT4ku4uRjvuZwbiD9fwDwyzVqz0lMkKa5QDuumuK2bYiCPj/h9bvROZIQdXTnv2u
X-Gm-Gg: AYBFou0RkghB3apOg+pP44NUMwt0CmaTJvn7RcyfaahvbUe/SxRvyZ4kLTDcvU03hc7
	BxujDXWabfqnjMQ7OY7uRxf35Z/jc/9NTz1sjZi3Ymp7nK9dyu6ZbO8XoL8lv0ywKVsIxjS+FAt
	YBzKvoKaO+w9e22rrdnjDkBMn2+8M8RNEOApwmqRpjJYHs3aSjg9Go7Lli6kOziQuP2Jc5U+bUu
	hc7sthkI03Bp3FvrNWbJcz3GPBOasuCPc2dGHsKRWHkVKDCRonA5xL/KYL+xGmIsi+KUgeQD988
	UxdTvQ4HH45Ru2sUq3DNQUG9X1kIgr1PdYJg402ke3E/Vg+T6MQm7zMz3a/XOFy6s6zJXA5Txyn
	zCT26lDcTHBfs4cwqytnn23afBzgHmeMgu/BOQHjF8ODugfkBYAOJJLMqokbXE6qPvJkHLBs5hV
	QxT2OgULQoGRDsnY55aQqRRgtT0qqd2m+DvVlv06j/dJcaPbg8DRuCG16FF2pgS4JMKhUagvxRY
	87/YG1hZ2CMvnacj0NgGYxL9d18K7Zx7n8ZpKeuwRMjcx0EzReSf4J0yh9XsJNIisCKbf78gbKd
	z07rMyvGqw==
X-Received: by 2002:a05:6a00:2316:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a36715c0ecmr4862670b3a.12.1793008691320;
        Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:31 +0800
Subject: [PATCH net v6 4/4] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-4-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1813;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=l74B/Eke0qZ7NU7MKRfL71FgLu3ayn5XZo3xhiO5oMc=;
 b=o/Ca8KCeJJFPtmTThW5dHp5n7J18WnvI/QN1JZAsQxVBK/CreER8FmV3XQT3u+j99fYVg7Bfg
 Ok3/N85CHVsCAkBLu8ly/0e1F8SMpeO4aAGCIOSH7miuuN2dpmBRLok
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated also add error messages and bail when mtk_wed_start fails.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3044a7a8ea03..f40ac5794341 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2345,7 +2345,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
-			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
+			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
+				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
+				return;
+			}
+
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
+			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
+			return;
+		}
 
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {

-- 
2.55.0


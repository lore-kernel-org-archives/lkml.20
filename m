Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F64141930F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141980; cv=none; b=kfe7M2CT5d7SU/6d6I6FxWvUEp50F9AkkpcHJsWTTqJ87f85vQwAAR5jfaoMKk4E5NRf14OY2G4xPAnnd5f+j633B5PCFVZ7eF16gVuvAFg1oCd/4A2Nn9KFbNVbZQ3QiLLCvfHMXohGX3Gpvc+iXBsFC9eQOQP9AQg3p6ltFUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141980; c=relaxed/simple;
	bh=3VzB1FLCd2mLzCjg7kaS/GAexp/k2KRl3VSTok/MVlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FvrmpQUgdwk2Rs2Y0oJ31dRP5nzxfHsVead3PZQr7beO73Zb1+vECeIVKeatUBQ1v1rZ9PsrNTRnR9XDNk2/Aq9QFWhf7fVXEvagMncyJct05w3wjIiZV1oHzqrKk6Ly7vHm3a2h+09GNE+8CZupN4TTbbnts9994b+lljkk5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IafH8SbS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IafH8SbS"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so3916393a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141978; x=1792746778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=IafH8SbSACmdLut8ZOLgTEJL8IwqKhb3bx0CxhmSNXLdkb7F8AaxXlFFeO+jfYXQWH
         cshA11S/j8o90sNATKl8bm2V+m0Vmi73rWCAV1yaZhncz/T1mNZSJItpus4mFnNOKnit
         Gu8cyW31oG7Z0aiM+Olm8Eg6WTTPFFlxLlVPwykoLRWofQpS2tUm6RPNEnpM8Mt5FBQJ
         mHK5S9B9OE35fQ/hYXwlJrkkPjtKJJDtSLsSvVFVu9cY8q4wBFAECffvfwi2iZ9/38Uk
         AM8HU4PdFQrdmVahphFLYtq+ivZfusyTiv55lY/cY4TsBuDdrXJO5pwtDRKiTgaiv/tg
         Pygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141978; x=1792746778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DaRwbulkkTIJ93wv1Wgx1yqKGJXajwFFEDheAhreMvw=;
        b=S42skjbgLo0VyoXhMmDvPudAvA3zBJ9kjCin9nTuqwyXqlj11pwWWG5XA8BwCjQnFE
         obiXcA8GKYXj2srS4J6XZyVyx6nIx8P8G+QK/nQ6AlPRAaulJQLdZ/1B3pPAp3+pSXPc
         Zn8u68AnHEipeX6h8tOtx1DU0gW+hREPwu3ACueH+P1HMR3fDYpXhMufQuBC0r2AZirQ
         /UEM+QkAw4koE2IRqbdzxWx9cqRsq8Mx4nBr3FUBt7YhDh+0YzCdWokL7nRKM95Y+++M
         gSY/U0dFZWMK9yk+oJu6zzfpj4i3Yl5kyJCa7BN232E4A6owWXl2yJn10wdJQokJPaRL
         N8qg==
X-Forwarded-Encrypted: i=1; AKwUvBwlSAWUm9VIENqE21Yv3XjfIerjX5COHy8+9OQhsqUN2H/JH46kyQsaokgQMXHDZvCZBZRdjzINUZGfatY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGYunDCIQULBlx6llQbYGu3+zuSehVNXYfrmAbc3jHQ0xfDOl2
	ZnhFYvYk04sXPbx2IXmz++hpaVB5y6Ene9f7jR3Ud6+MxSgtFqIwrANW
X-Gm-Gg: AYBFou1zV6S8tQbJdp4RHiFnd/zDou9qLIwhyxBHeLkoF5TrJA+5Y0UyfZJ1pwWD50K
	+ugKu1hQReoFW13ml9u2Z6+Svy/iPrnJarb1kuQHAuJAznpyzAQZQLsEa08vDyoBBBi1GMK5a7F
	A1s/vjKSMbo75A2LlU+Iy7Y72LdD0nxpLWTpAYux/E/qnfu7IeaonsXBbQKTvBtLsr3myilJbqB
	D4AHcra403KwYOI9xp3sWTDOcyIbrZ565+3IT8NQgP8ngKXFmHLDC1rmvvPa0q4rhpUJ6e0oypq
	36Zb6sqKCT7ov5GgwumLo3VD/KImB9x7TcaVrxjyrwS33kCpyzSsBbBkRF6hHslyQWJdNeUaA0d
	uccbA1sjaJxpIlQIHWM8GN+v2HYWKo0BQAYmMeZsdx2yPQANv1Y9W0xDrHiOU2zeyVf321hmCI3
	RSeioSWfw68EbYNrbKv7ZCaVLT4WPnzhVvETwq+5hV8gMHTgK/yI+F8+v8IIbp/zoSlhv0gFbF2
	DPGhAZDaXfGSA+6Vca7mRx1ZnzWXNQAGvkEgkv2+AYkRMH0gB1r8TtwgJex
X-Received: by 2002:a17:90b:4ac2:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3acadce670bmr3331774a91.14.1792141978314;
        Fri, 16 Oct 2026 02:12:58 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497e28esm767274a12.7.2026.10.16.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:12:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Fri, 16 Oct 2026 17:12:33 +0800
Subject: [PATCH net v5 1/5] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-wedfix-v5-1-8b02e78fd34f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141973; l=1202;
 i=hujy652@gmail.com; s=20261016; h=from:subject:message-id;
 bh=3VzB1FLCd2mLzCjg7kaS/GAexp/k2KRl3VSTok/MVlE=;
 b=5XzbtZKpJ+yde/h6N2QHggLRyxZpPRxz/vp+RwYavuMpb/33Vc1ZKXfd0XtsE81ayaRaOHReS
 YZ2HLm9vrG6D+qpPZXfGoeFt2VcsBtBboe9mx3MoHFVkvVsdGMvmXBw
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=AYHrGhtLNb9z7JIsGOOYWmKKIoVPH7ZZgT+CLIDMuEM=

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


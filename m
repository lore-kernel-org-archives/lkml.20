Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008687;
	b=3bU40+lkl1jwZ1B8v4GX/nf1RfziNinq23pmgLma2pCOnM2fNT6PT4B4fxPJQcXE52Za
	 DK7UWygERxvu6dJ11br5zLm6Fjf6p1TkOtCCzHGwvC6VNZixvWS1PwBtlw0aZfkzZswF2
	 ptuzqhzB+NE0fWaQbmPjuYmUcBrTMOkSBKD7rzSluE3VFRdovNNuelg13CGM3RoOzY+cH
	 SkAK/XgjZynZhcBXhjW/y01NspbSNrzd44UVr+u6PUA9W5wBb3r3HorMHoUPKatJkYYav
	 PSzyf6NNrrhEnLmgie6ROG66ro61CjQpaEAJLvIqFfsNYS0LEXoeb11vIXgVneiLApw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
	b=THndPNWGrpYj40RQJF7gAbux6OOSrlQOhVT+eLUsSh/uck3YTESZSgCBTC7YnS94Jm0F
	 nXbA6POplV7MX1JWOkRuNoutKldHSRn7FJoazDnZYk6S14PcIp++OgZQvyuxxSqQ/uL1G
	 EpioPpT/ckgwlgdL+6xvd9Kb7xspoyqHFdTGC7/YM9bKpow/QV4u8A0E+AGXsHAIu0Kkq
	 DSTQTxiNEbNBOkWAbYbwe5IcTJ3SdLIyvEh2cjPyi9bKDv4sagVLJFwjXKrX2pnlrcuMg
	 uzWCE5AEdHSVmj4DDOYlcMXi3xe7XAt7FSRxEuWgc2MenSQuD/QPqZJagESEiqmB+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=djyMSPcN;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A11606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A11606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=djyMSPcN
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1237301b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008687; x=1793613487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=djyMSPcNEYycFWCkTiq78IYh2FqA3xt0mvEpsfT5ptBzvs6yRZu/raSpeDz49kNlni
         9OMJLn+x6iNJ7LkxohKhy3lbEDiGvWGmU+sMLPg0BZ9iM1eArOSwfSjieg8X2C3bfnTu
         yhjwT1IsXSJwNPEN5D6EP1hA3VjBT7jGgkxCU88SvNxpleYp/AR3tdLCwlg0XL35m4cr
         n4AP05n2WAxiU/QVFETVtGLarIszxA9irFpsPf0XSgI7KEi3NpQA8KW6WIQ2rQfZZPn/
         h5CyXBCtDHLNp/6RdTenUK9GOehco5feKozkl1+XUjsiTkhRiTv5edxvgIIqBJrUrsiB
         AFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008687; x=1793613487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VDwFEGyVQgtBZkQFcesk6CRn82+sTJh+EWU2kWF78Wg=;
        b=BpAoKY07ECFL9Vuc/e+xRrzvDEezc2rDs6wPpslvbtHOfzTqrRD0m2l1JjP065kML/
         4Vh56SZgaI+2usRMwj5MjqYJucvmquo1aqDZkPKX1edLhcXXnGThA0tfoxw8l+9QRmA6
         MsDKzVpAPngrFRMfSQO8msIXDxCIcKWo0lVU//Kls6/a/DgevYeEyU5zRJCg5bZmv+Y/
         9lOOOaHh2Uqlonkm7oe3xeZXQ056kPc0nBiclvU6uijZ0wsGUlzQR5+49kPgMAR6IKge
         D0gQSc3z7pKm5MerBjHlslCwv+mMpbORIKHDIapyo5nvVtabuf8eeAGY8YB0dlAz/1lI
         GnhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQygLVBNvMUdiSI4/PiG+VEWJtuSjgOD5Lo+stq/mrZkyE0Dlo0oDLGw0T36yLmQHCRoM2KfU9JuAumxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTWlkkOzpINmSpAH/1AZIKt1cG4268daH9y4MNBamaqHoK3sFJ
	3RxzBftOZBJfpAkjMepQwPZyT6alZ0EexUU+uvPZN1wX59omfxDHmrkT
X-Gm-Gg: AYBFou3/fI1Yo7e29V5TgQqLgiTH8Lv0au4uqIJaqqUBf0/x1jDn3SwjvoMGSd4Pwaf
	zfCpjz1YQepLJ4dbed15SEB4TGpC/lP4+ki9W89YUEqLDfG2I7gfflcU9ppZ0CnyDRwokSz66fV
	m5rkw1XDhQB0/Lz6iNRXtqRkuZ+IebZK14s3BczrTOMQ0dRuaiRcSqz+gGyfoKqf6lY/dQr+YyL
	bGonVUbqVNWCEe7jHNYhckdGcljqnKXgOL1ICZP6J+jytVGAc/HI6Tr6PoJiJWgMufByrc0hCKi
	Y5AZYFaCQRyy79pFoXyr2O0sFTXgR5dLK+JNiS+TaA9MXFd5YDjYJSiGhBE2i6gVLfZjyefqhnw
	GV4GCjta6xdpVoqAEvk0xNSA4MdcSB8zbDvfdju+fzz6UbPjS4cXDST2ySs7BfppoerNeomP/c2
	Kz6k+UzGHRD7wzHhpR8iHBNDWSqZuJzbIbP/S4/D7GUt4f8Jn0anS5X94Q4BZQVHHI0z+8iOiOR
	Wy6Hym7tjOcaWY4ZWzeLkMH7pIOb6neKpkU146aJUhssMccboF+FkbupY4Xv/YntGMF1pTmNsIQ
	RV+0PW7TAQ==
X-Received: by 2002:a05:6300:6bc9:b0:3e0:ee68:77e9 with SMTP id adf61e73a8af0-3e7bfa1f8ccmr4070259637.14.1793008686851;
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:06 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:30 +0800
Subject: [PATCH net v6 3/4] net: ethernet: mtk_wed: free up rings during
 detach
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
Message-Id: <20261026-wedfix-v6-3-a52f6b15d2fc@gmail.com>
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
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1486;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=UWHNlBK328nlitWq3waPngcB77Xg7ScOwadSLgwLsIE=;
 b=LcWwNARY5jB8Z5a4CvUeT9ByKEYHzcoTRjRnxOpYFt8K3OYc1Wc+OQfcw9T3+x6N+n9wZodMM
 vTQfLdPO0efAw5SswG0HyEDttPwooeBxSl8S8ABpC+lIWlPcNYoRqqJ
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

During __mtk_wed_detach, rx_ring and tx_wdma aren't freed up.

Fix this by add them to mtk_wed_free_rx_rings.

This patch is pulled from mtk-openwrt-feeds to address Sashiko's review
and edit to rely on ring->desc instead of an extra flag.

Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch
Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/message/179000700034.2160803.10594281691384015089%40kernel.org
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..3044a7a8ea03 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -949,6 +949,14 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, struct mtk_wed_ring *ring)
 static void
 mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
 {
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->rx_ring); i++)
+		mtk_wed_free_ring(dev, &dev->rx_ring[i]);
+
+	for (i = 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
+		mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
+
 	mtk_wed_free_rx_buffer(dev);
 	mtk_wed_free_ring(dev, &dev->rro.ring);
 }

-- 
2.55.0


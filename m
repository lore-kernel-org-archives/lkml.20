Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6BA59D628
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656274; cv=none; b=U1BfwW6uOn+lbfFyKNwrnu4w1SNxn8tLHebXh/kSH/C0dj+ulSC6dFn1j1ZSvG8keeAagcOROTmFBCWue6HMmYbRaL+pCIDvaXegdmI+TXEY6Nt6cT364TZcERaheMiY+2HmUqobEZD3y3/xRODPpD4X3rlYVIRCsoOYj+a4g9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656274; c=relaxed/simple;
	bh=uaqjBwLJCC82wt/s/pAT4kIoBXhiZ8r0imzWhi6oNmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s4SvKUJgd4Dx/qTrTCgoAUwMpZkqkmE7Uu8hV6tzzxfT/z3OVc67/iQov2+92Y2C2Rv0nQdGtVRWN717TkBRFZ3sypxxGVSewACQuoi+fFc9hbOgeqgM2fDqf3UFJY0zTfSh7xdtthRBqrlrU6qw6zhsbFJKylKug8C6iDJt9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3OX0Aj7; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3OX0Aj7"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86868f7707dso480189b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789656256; x=1790261056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4aPNtQuaiA+2t73z2Ob/AKAru2eGb/yyU8jK4Q9iWQ=;
        b=e3OX0Aj7z0rSG1f3Wn8wAA1BKzlkWTna7hHuwHoZbuVdw0EVt/C2nRbM95KwgkSbuK
         pEu/AXrK4JJFO0Ia4usdzuMRZX4dObIr28Hsu1jTkZLg9RoBDmKHOSNCuHKXIr1d1udu
         PqEXu8ubWyr9kpJRCBiyqTen06iO6jz5w461iABryww6cWEDgrNAFgoTeF4T3afD6f58
         EBYHmaVTWqDbAjJe6FFvsC0Fty4Es6ajfGFUV+Nf3OdSN7l39qLfeI86Uczq8K6+8K4I
         7ZAQ1h/4hWbtP4jhHxYsxuGOfI0NhHguOSYOHu9dRVKjT44am1mgoEpe73adMr1cCtND
         tnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656256; x=1790261056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4aPNtQuaiA+2t73z2Ob/AKAru2eGb/yyU8jK4Q9iWQ=;
        b=E9n0GM2NIS3NpIk1j4z0ozCsvV/yjPDL8RwYxyJihuostax1CgAAAzLrWDrlM2BAwJ
         wFYjVcVap4oUlT1HZvIeg4tMkPX9oXmo8coFYFo9PpVxcteRBmF8tYspDWRiwmhTOpbJ
         PaK92qbI+HiRZJwBwmGdEDwQ+J913WMv6gw0CUiU1JUY0lGBddqkXDo/RAOv5colp/w6
         lAO8rO58EueKlItLQy+1/wgWkhugt4E/jBiIyK3Y8+AD9kbS0pje4BMZvQAOkAzWyPCL
         3oijugHR7RQYOaHwQGPdWIpjEZHU6EQoNf6K/DSHNnB7qzhC5mln8e9HDYmXEMY+Nlf3
         5MRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOkAGXV2TYhzKrgb4kjoIFmE5U2PWpb4CInrDRLs6Anhmbd5jBK9AdwAqVCPIWGe63hcOEmlpH8D3Y/Ss=@vger.kernel.org
X-Gm-Message-State: AFuF++kBK8wJrCB1yJiTcy8A59vp+sTq+A2S6xIr+hp4nrmqzHu657Bf
	GZfu+QhiI2fx6No8O+KOxMU4oUPiIXW93ooAURv+ORopum5D2N3Rw823
X-Gm-Gg: AYBFou2ysCQ8vPhnv6dEUreASSlJy5DN/HVtcAPs/tQ6XzD/vK+1uJH2d/gHnUL00QF
	kiiPjCTa0F0GvYysry9Gdgwsid78cGwUKKBlwZHIRVf/8lZSyl0cNoKmP6QA4VCraddVyTJZM8h
	6tFaySWVbbDZwSCSZflAfXw/EPOuiaN8LhuStsclTz0o9U+w7EFmZ3kpRIi+6pJReImYALfN9xJ
	XZrQr2d7SKCFwRVex5t8zDiRiwi3bLaJacDCHkUuYi4mNF0bp5bX1GZf6wHypEGVBRi+dM1131F
	l9XDrznSXJ9ExzIf1mADuwheOIKqezkXvZPyCJJMJHsXaX4ZA1AA+QldIhfM0UPPt29yqmPIc79
	C7uvq5GR2l3Q8XFjRQbRE01Wyy22bgD/COyaWQkranF9WyO0uja4OMdUTC3t9t8T4egSyiDZckm
	IndZWikRde18VRABm8Ioyk361GTVZ5SNyOh6uBbAXK2nzec4CADLlcoHUl+OtwVM0ssdXmYPe/S
	OjCCfUQO1AUvMtEr1ImJHgM6gXMhkbiGc45UwU83KKQ3PkXGnt2
X-Received: by 2002:a05:6a00:1d14:b0:874:708d:b626 with SMTP id d2e1a72fcca58-874708db89cmr1110819b3a.27.1789656255590;
        Thu, 17 Sep 2026 07:44:15 -0700 (PDT)
Received: from localhost.localdomain (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm2962034b3a.51.2026.09.17.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:44:15 -0700 (PDT)
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
Subject: [PATCH net v4 3/3] net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Thu, 17 Sep 2026 22:43:35 +0800
Message-ID: <20260917144335.19466-3-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917144335.19466-1-hujy652@gmail.com>
References: <20260917144335.19466-1-hujy652@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v4:
- no change
- Link to v3: https://lore.kernel.org/all/20260724172040.1653-2-hujy652@gmail.com/
- Still waiting for comment from maintainers for the return value concern
  raised by Sashiko and it would be a much bigger change because it
  involves mt7915 and mt7996.
Changes in v3:
- no change
- Link to v2: https://lore.kernel.org/r/20260711112128.971-1-hujy652@gmail.com
Changes in v2:
- Address warm reset concern raised by AI review.
- Return value concern is skipped until further comment from reviewers.
- Added a comment to explain this special case.
- Link to v1: https://lore.kernel.org/r/20260630144831.1109-1-hujy652@gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3f0be70c3f14..3800e602d3c4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2339,6 +2339,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
+
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
 			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
-- 
2.47.3


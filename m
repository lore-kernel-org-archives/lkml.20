Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008678;
	b=aykfEA3s8NgcCL6eAKp/rV+yY607qMf7B/I6CXkU7Zv535bXzIEUTUan8maNda11MGfV
	 GnJGh1fFnpzzy3xlsFHY7IgGZmpxAm72HjIXvbVw0N2A3mtqdT3+pVq7EVImW9oV/5OFF
	 vkCGMWn9Cx++lloa5aqlgYMHOMKR5GQK/iAy3WlIA81JiUWSgzXRj3xrg3UrU2ptwVtxO
	 HybeNNYzAuhu//HPSpcyY2rxgXBPW5iZECAJtZ5YHBnkNxh4B8Q+k+YeoQt3Htj/yHQTe
	 5NeJNfiRQ8tHSrIMHWeRzm8i8DqebX82zHxWv+cR3897QWWyt4L+yyQy+IYwOaZWoDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
	b=Lo/LVfltHdhdYKTDM9kXZoP1c95Yo5uZt9W2rIwONyeoNPyk+jnB3bdzBauBMAAeTSS6
	 JZrsno4WhZrt7lqg1rHCqwTHCTEdPtXILOz84MPetxx1fq27+o9suZVser4Cp/wc499YH
	 LgTp/JowMPTSkIdkKacssMbYDbgq1y0fz0OLQQ8t21q/b3x3S58Ma7iX70iMmgqx4gAUh
	 1sOs6RXtbrSOrSU64hmLqNaxKB6TiNooq3UpSkp+D3KW5z4vPSoH4twETloh7mkTsohKl
	 l1Duoxq66PJ4B1oeaHngvT9uxMtrcoFu9VPYzt1qEE5yPE/kx4D4FTgMkoqx17bnGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pakz9oUB;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AF4606C204
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53AF4606C204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pakz9oUB
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so852504a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008678; x=1793613478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=Pakz9oUBgjqnaFkIykgG43IKOzWvt7NcUyAe/SfusIsphTwLS7PGkpWiGL+khoCFcB
         asQnS2PP1VrclFzFld8xZ8iuCXBT9upKcvbEBr/J+oxJ4OIjyIhBS4myjz+xKedE/2MA
         RXUFuk15v61MCOnFyLaNNbfQLieWSGuIa/bu4PRKlmy6M37mFx4pOm8AlV+VXUnxbc+4
         dXd6GidZQs8OwA62au21dg/LeY4KN5bTMMgpZ9HvjeiyD6BMChjpMlrKBBxXvhI8RxWP
         4ONeItzqvVHYgIJkH64MN+5NXjIo4Ycob5ruX4pPTDWG2xwUBSNx+ZYS2hZ9EXHUJLif
         mB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008678; x=1793613478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjTeBwZfLj61tdlg9QM+luzkf0OxdymEDqLC72F5nSQ=;
        b=c6V/+EG3cVBtJjE6112UwEtS2w1JuGvhMHwWRk+YDe6dEoF7UbBPUlJEGaIyIm6P1l
         lSVUkqLAN8C7TDmr6KF96iB1z+/bNpNB6CKO8nX58PmKmBDAjIYC9nd1UDvACHV4l0fD
         5VVy4ezw+ukYpGQ+9nOb9sCMb2SuWHuZctLJuCTfJmbPLyfkF5RKdXiTNnkj054nhEou
         s8+iNHHQ+7vBAZorEfO4xPQmhDkrefEBWgYCX5gUabFDPXY8IP/2c9Wri6e6E0rwi1VM
         Mh6OPg8YjrdxxGqJ/0Es8vPWvRCmMWue69a8B4BwwpzUL9MT582gcPRz2ZiALTXSOHUb
         6q4w==
X-Forwarded-Encrypted: i=1; AKwUvBwENGUPnFLNSZrAfZj2ceLO4dKyYn+Qjt3qOHKQBgRwhkYgO51J8KBRnFfjxZduwR6MhcWTH1m8nCMYUyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZcz3/vl/KDQiOcpO4O2ATAaeo2nFAXmAtj3FMPMOakPawiagU
	zUZ+s8Dv1liwfTkq898b2G2uxEI0xdYt2TIfV2k43MOgMIu+fP+dYFYl
X-Gm-Gg: AYBFou1QGyzwkOX9FY10gopUd5Gcg4OkyCJFaCu4hl+h0J1+SwsCCSmSRffser+1Zjv
	MMOZClt2XFejCGGm+KDUILfdkPzHocPsoRqdeM2gGnZ5DZtFC0EfeMW36PZ8aWzSFreFIJmUgxn
	E4OchPsd/kZxFAKnu/xSy1k6poLcTeNrxWPMrX5YGDfDWBbqICdXYsp51xmVu2gb86cUae7T78G
	I2FvDN3GwfA8MeRLYCsXxQAINYObrAX1T3p0R/fssz18h2FGy9tOmMqGMHF3H7AZb8nOfC9CpaL
	wI3d9cedd87cxU9LXrg27OTyrZysJrvDxv34iGo251RZNCGQo+9VIhKX3q3HatiE/jV1sCiOy1o
	Nrapd0NEMCrPl8iXa/yM9xF4WCf/9QJwI4CXfSo5mhZLwRc5Z3E+9fPL5fRGyZX5pJTCy65wy+1
	X2o1oFtsWxH3cUol3ATj0Sjukb/tit9KNTzjsEfTJNpTdSV7VPUNHnQTzqB2ms6E17XDSpWD4yK
	qIXj/65M1geSgBk1PC5sEwV2GUkUUMoz9FXQLanoPQXbKx5KBCt1x0KQjNx0hmFbrGc9WmAy8/6
	1aePMvKXdw==
X-Received: by 2002:a05:6a20:9c16:b0:3e2:8fdc:a6cf with SMTP id adf61e73a8af0-3e7bfab8c31mr5045545637.30.1793008677695;
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:57 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:28 +0800
Subject: [PATCH net v6 1/4] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
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
Message-Id: <20261026-wedfix-v6-1-a52f6b15d2fc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1333;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=8HcC/sQ6Padav5RauewUundESxCJLuNyI/jOB6FPbeM=;
 b=R5SprU2ynkzohGH0ikExaLYx4+eF5xyVGdW5pS1EiVbSfrSOVQZkSRDrh4OMF2weeFfeqLWGL
 ZcrEU0rxM1SCaaLklufzqHafB/m9GBLE0QH7+amfullCkw11RjQdxO6
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

Currently WED v3 tx wdma ring, ring reset happens in a separate code
block unconditionally.

Moreover, v3 has double the size of wdma_desc and has different init
values. mtk_wed_ring_reset doens't deal with that and would corrupt the
wdma_desc.

Fix this by skipping mtk_wed_ring_reset in mtk_wdma_tx_ring_setup for
WED v3.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260711112128.971-1-hujy652@gmail.com?part=1
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
2.55.0


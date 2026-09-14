Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307044A0F0E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420211; cv=none; b=eb6gxL44UaRWsSgatU4TEZJosM4tyoZR+lKWY7GUX4iXKynz63rm1CTzF0HEoS0QdFytXx/Ncqy2X4g/eHWoLw/z8/2Fs+y+PhV2RRaKRi0RLFpsecECgNViZ27idh3J93MqXTEtfVLdse6PU+Gk4HWeynAh2SZ7JePOQmr+wdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420211; c=relaxed/simple;
	bh=ovOsliEdUhvhRoeaXGSGPM3LycBRMZNPRXeHkTBG1HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMUyo9MQvpOM5RIggUdhK1pQ5pVWIXCbJeO61AOhPtS+/WsaBg+QBLkat0ByKyYjhcKAx9kAcN2f4o63uMnEXh7jrPymP3mcKfQRCdxLPQ+ObIOloDdXSeEwLAhhJizHcgHbRn22XxE3pTqa0z/llzs+BMFYrp/oZwNnZWClnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OML/24vV; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OML/24vV"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae7166ebso1500287eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420205; x=1790025005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=OML/24vVZv7p98bMsaWSMckNEo8krsuDwaP3JaMi7Rk/boUDNRGM1eBeZS5QG/85ne
         zMslfwYd4FmRsarS6mSaT9zhS5Wi1b3q2ixkTzxyNGuJmDFSisM1ja/jEj2e5x71P/P9
         SI3tK2vC1mW87wHJtGRiOXc3YuFluFz28ZbV2NvbP1kmNqONUs286hk+V4OUQVBIApFk
         BUyBjPY8KndVfPCvysDfGTsogC9gNflskOTQp/k3W+Ei+P+Wb4AD0wLQMgWnKEtOrLML
         bPtRa7eYPpXrMyQj1EM5HbhBkwCPq7qS7l0O39A3vkRyyfQm5stZkaoRjo5PMKl63fuV
         c1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420205; x=1790025005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=CZc0Yf088v93+tMydoCCo1Q8EBjejYiclJKMltVsQBiGDAXyjgkRucFZEKAtZNj68B
         JjBmsGlqm36ADZYNqsuRGvmBkYrxHGFvHCDFjSar9vipcqDk4UpPXjX1RiUe264G+t/1
         5GE1PU5G3JsZvYX69+Az0v1QRJIb4kfPAggtJ4g0ZZdkdOBBxPt2U5mH/HRLx1e/zHd5
         oBGX0Z/cRIpfgRkZIwobGJ1G8Q92Oyp3/JKtUExspVclb8j3UMNy75ifmnbF0VUIwzGY
         AN5LPUlggIAlzHufXVyJNmUSkuocpkpu2V5HQXg6SKUnwPOQCsmdYhGa6rId/7OA/MO5
         smUA==
X-Forwarded-Encrypted: i=1; AKwUvBzPJXvOX0WcnbMiT4j0+XecIU9cWAtOeTh/aqWc1BXM8B30n+wgwS8ZbUm2iG2Ws+GjCBjVDTlAS1ObQvs=@vger.kernel.org
X-Gm-Message-State: AFuF++k7GmhCj08MTzgo1J531oIaRNtcUWs0W5gAoNnNqWTCaUFaXKSs
	zHLX/Hy/1Dwg+y5Y3berJiQX1kEteoR2LXnmN0bR+vzy1P9QBfo7tISO
X-Gm-Gg: AYBFou173fiGXOdTnltJW8BCkDjAWHtQ22fYWgNVyBh78YQl/sjHscThwzikqScO8u3
	eKaoNldqx9C9hOf9WcWHB+VZA2c0t6B5MIV+MZ41UBoJI+DZLLtSP/JkC/LbOwh2aS2ImdGx/oC
	c0K6PyblZvAYku6IaE1Bz8FrNfMnMn8rcodJ1y0Vd1lroe9gG63irhbyufVY7FBx9ubVDProjyE
	jxB0cSer6BIcimFysqEwu1k8EZeLaupp50p/gFuR4DUqZ8iOUr6CR/qjkEfQuYrNaKmBx4p9RZz
	rt6l4QUXyFVkxT7aQvgr+ols4x1+oK/ffezw+dpZLcyQvRTmv6oVCm/RZsbkp/uuJQyTZpa0nVx
	3sj45m+qrF9w1tC3D9gE9hp0V+H+BGyLZtxQ6HWeHGqId9zpzZeN8my/7W6Ws3k8tZY70iQm69P
	6QhvEHjNyGVdISGzkgBF0J/w5kh7Zd1ZTumMXh17rAzu31F/DiqTZM61+EivaoLu5SVgEGtEmoM
	fBYFMmw0LZnCPLYOkAaoSVyKikMRkiSsgJJmKUpnBuGRuaP37hMJPXcYFA9a8mZna0ei1vLp6ZB
	XXI/Q12KM2rbiUE1BAiYRV6Qmtmcs8yfCPAFuWo691SwE+/7QjqGOkvkvVl7ayNia/RIAj2BUtT
	DL+5kaUycSbJVLpupXduIQfnO0IaK
X-Received: by 2002:a05:6820:1626:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-6c540b66d8bmr2665520eaf.26.1789420204843;
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:53 -0600
Subject: [PATCH v6 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-7-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


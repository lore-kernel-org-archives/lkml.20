Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC414D6C5D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580598; cv=none; b=mUeA00yp9n77X2F+vj7WtSuq2tZJQEF2S2Ama4Arcifh09jNvq1AbUzfGeCstIOmJiPwEFc3qZhfW1ZnfRVTEQx5imTNkeR6ptiUgmMEle2WQZ3Hzhc/x9NwOBgE+Fw7UJh6MDrW0NfNVl42CVgXwqntkOpicNMyEmWmL8ouX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580598; c=relaxed/simple;
	bh=FkDlnl50rtINtpy1FY8hg//aOd+DbTo18IUP8j2qOfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gZyiBJ5GyTrCjd377y9d7PvymmpG+S8NwBJoRcg2HcgTxv1Q+Av+Lh2EB91AhBuKTxcB2gGluBCtO/P0OfNMXWUNcv5DQmNcYZ2Rmaq13FPIaXq4wijLIUqSHODnIHDfRLRz8eVgCGjWgMcN28MLn6spXN/ZNBkPkNtQXPx5Y3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAA3oDog1apqdNFuCA--.23031S2;
	Thu, 17 Sep 2026 01:42:57 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: airlied@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	louisalexis.eyraud@collabora.com,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	simona@ffwll.ch,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] drm/mediatek: Fix runtime PM leak in mtk_hdmi_ddc_v2_probe()
Date: Wed, 16 Sep 2026 17:42:29 +0000
Message-Id: <20260916174229.2088824-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3oDog1apqdNFuCA--.23031S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4xWryfWw4kWFWrAr17GFg_yoWkGFc_uw
	4q9rnrXFnxGF1DGr17tF4rZr97tFW3uw4kWFsYya4avry5AFyqvryqqF98ZrsrXrs3AFyD
	tws2qFyfAFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JF
	I_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr1j6r
	xdYxBIdaVFxhVjvjDU0xZFpf9x0JUtgA7UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAMA2qqok9yLgABs5

pm_runtime_get_sync() unconditionally bumps the usage counter, but
nothing puts it back when devm_i2c_add_adapter() fails, leaving the DDC
runtime-resumed after a failed probe. Drop the reference on that error
path.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index 31e81a6de6d8..1ec973d3f52c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -376,8 +376,10 @@ static int mtk_hdmi_ddc_v2_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(dev);
 
 	ret = devm_i2c_add_adapter(dev, &ddc->adap);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		return dev_err_probe(dev, ret, "Cannot add DDC I2C adapter\n");
+	}
 
 	platform_set_drvdata(pdev, ddc);
 	return 0;
-- 
2.34.1


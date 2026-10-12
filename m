Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CE4BEE25
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826446; cv=none; b=natgimlFiRmzm7NAMAch5Rznlim7l2+uE13MqEOwsU4t0tGh1VGCZMurfyG8A0KPqPNe6A1B+61t5ULjfKAvxPvoC5HBcsZi0sSbJfhYLk2TXR34XXkP0ekMFeFllaRZsVya8Cs0m9Ljmud0VA9x6CC2CbysZWO+mLUUKi8FKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826446; c=relaxed/simple;
	bh=pLbu4qli1Nc8jvZxrZZlpE3h4h3YuQ8qZp9lwCjFWZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8G6GQmVD/r5AQMcz84RQbJd1yz3TTfHGSwpefs3eqpkVbuRGjKbx+PSKkQ4hTcQvY9EYV+hFqLWfzAraNQFJc4zMZ4x8LRqqXj/An/YeaoEAd+GcJIS2Xay3rrJ7sFm5X+4vUsHthdDEmd0S9MI75oirjKC33tZD2Cp352Ccjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERKLZo8X; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERKLZo8X"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88aea027391so948610b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791826445; x=1792431245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=;
        b=ERKLZo8XkXpazlptCJsYX1iL38/czuNhhN6STTBKNkrLnsAzL289B0gexVyjRqALrE
         DBIAzUXZ9NYJE1QYpGfrOixTP9fOE5iQvifrO73OIUuWimBXfHcOqOIgHgPUchh3wPTK
         bq9CFVnrKF6KNeoV0kFfBBM0J0dSqmOeivgPuTbgIKRkoM42MZFnJ3J+HkWm6W4ofY3K
         QuwauQc3a7yt8ZyxJuo9tSSFldsAablG7mOXWbuhf39Q1M0YmF1oiYnTov+NYFDFeHo5
         ScEO+PSXi/7gm22RRqdplW9ytD5eQGCtkk5JvpxoVnJIA8NluaLZfevrcLuqrlYqncWc
         M5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791826445; x=1792431245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF/Iy3Hd3jJ7PHeSixb0MK6yhBJ3J2UORZlYHvOyz9w=;
        b=AFErMnctym8ojGxrqQbGuPk/OFiWE/h37kUpmoWXHfnH9Qc0cQaHF7eTjwSgo2Wh1o
         6YzjKkO9E/0qImxwMlkGvWlpso3dOokfJzGu68luPYxZtLZ8qD6gnwQpc64kcNvqNAqn
         0Hlmgqpq695zWQmdiOGjmaB/ctf+y+Xyv8LTDWtvv5D/I65pcYLeq/tLz6vfBPjGLtcJ
         Qt/rQ8yT+tNrdDvlfePOteYF42iYvv09NQBYAYh+4NTUg43NKYGDgYI1ZIPZcyxrWpuq
         2W7TMr0pAVuor6KttIw+gfaasnOhydKI5mF0Oe5Z8Ql3bDorL4iYw3yp+TzJBOVOEVQE
         cniQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMEV2j0Mn1Q2OYJlWogDyk6ubaIQzwWc66TbGmpGLcanXrNsO60sKzj4AkjGg5Qwv3l3u8Fx8Lq2p/mZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ43/x7bNPsV0KN42FSxWp3ODGWS3Hp3hrYHhPySLtWPwz2ZsPV
	CPgp/ubTjCaB+mMVTsJ8UtdooV5OqqroHPi1PRPWln6cU7g6vST+YuoL
X-Gm-Gg: AYBFou1UIpd++/Mmj2OYeFHE9rJHDby9l9dNb07zA7Vwfznl0TGYWhjsVz7JQhVa+Eb
	I+NTIUgoXSIaucmHQSiXIr3yhDOxx/wGIgv52TKAFdb9ZfdQbDk+p/qAE9jw0qRFvjPGkJKFmbi
	LLjSS3NzoUZkQd8HHjeNQQPtRXnuGDOrFHpHERUWPeqWue7bSx2GdDx9JE382KFsNtZmJxYPDRs
	SAoDxJcwE4Z3CYTEmKbb7VxRejhfY46FcXOCNSdVcIvgEHwlnH1X7W8uwt9GmpOJoyQGzMIonP4
	VpPtk1GHZ/ZKFkmKW/5hMfUPfo237UaPB3GAF5LKkn2sie6Z0RqU7kArCanWfAmu63fKnm19Tqg
	Ad4fBUd9OJEaZ1GrWUUNZVUR88e9F/aG/kAWjXSjHH8J/XnwLrFzArJfD4Bav32vfXp4bozHZiI
	RQJIDbq2xixt4bWq/HpEpUOVvXPktnDlCKCgq/7v0rT6oNw1MPPCdG0EANeS5+Avp7OlPr1RMF3
	9nJWiSabD8zve3l9sMyRWv7jTkqaSpKwH7/YlvabQtP8JqbWqUIGeM7FxFY3nSRKLqz0Izpnvui
	RYyF56XalXbBxKwZFjZBEZgHYfvGCko3jtFR37CloLaVAzSc6A==
X-Received: by 2002:a05:6a00:e0a:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-897c3efd912mr8494544b3a.6.1791826444565;
        Mon, 12 Oct 2026 10:34:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c49901fesm4166886b3a.57.2026.10.12.10.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:34:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek USB3 PHY DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH v3] phy: mediatek: tphy: simplify main allocation
Date: Mon, 12 Oct 2026 10:34:02 -0700
Message-ID: <20261012173402.24568-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to replace kzalloc + kcalloc with a single
kzalloc.

Shuffled some code around as __counted_by requires the counting variable
to be assigned before any array access.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: remove of_device_get_match_data message as it's now stale
 v2: add back NULL check
 drivers/phy/mediatek/phy-mtk-tphy.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index acf506529507..e9b9e667b319 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -340,10 +340,10 @@ struct mtk_tphy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
 	const struct mtk_phy_pdata *pdata;
-	struct mtk_phy_instance **phys;
-	int nphys;
 	int src_ref_clk; /* MHZ, reference clock for slew rate calibrate */
 	int src_coef; /* coefficient for slew rate calibrate */
+	int nphys;
+	struct mtk_phy_instance *phys[] __counted_by(nphys);
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -1572,22 +1572,19 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	struct mtk_tphy *tphy;
 	struct resource res;
 	int port, ret;
+	size_t nphys;
 
-	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	tphy = devm_kzalloc(dev, struct_size(tphy, phys, nphys), GFP_KERNEL);
 	if (!tphy)
 		return -ENOMEM;
 
+	tphy->nphys = nphys;
+	tphy->dev = dev;
 	tphy->pdata = of_device_get_match_data(dev);
 	if (!tphy->pdata)
 		return -EINVAL;
 
-	tphy->nphys = of_get_child_count(np);
-	tphy->phys = devm_kcalloc(dev, tphy->nphys,
-				       sizeof(*tphy->phys), GFP_KERNEL);
-	if (!tphy->phys)
-		return -ENOMEM;
-
-	tphy->dev = dev;
 	platform_set_drvdata(pdev, tphy);
 
 	sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464279;
	b=KM9Gtw7ZguzLbc6buD/GSzSosKc9eFA9mBQC5awaUGVsmdiYxmgo1t9m/S3zgguGdwO/
	 Ow4HljfxRETWikD2P3db69Kkq356IyCcJ9875fOHJwqulD7IU+pTriLs/TjegRxCLK4SA
	 a0hkltI7wyNJMv4Lv3LoPm/5JDKgZ1kis18tMpC14acHnizUTAxEkKoWey5ksvaZjON7u
	 t8GmhrVW87Q9rYPzryxVt8n4qJuHGUAc3KMu7uWmRp34Z333VMYZGo34o+nuFItycgUxg
	 JvKE04lvjyZxK0D0l8v1TEeFoLqKrsLxPOT+tdYRsxncJUx58JyLSpdnKYjVwTpthcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
	b=nl1S8v9A6sYqOuSv3/WEdLwDuWjpd+coEJUvhaihoLiaqT7o3sMhbnyh6cqZlH3Ip0bu
	 S9sS1Is2FMuJmFSKprnj6kiCoadfcgePAanjSNt3GS0oOw8dIz40d8PEnci/REzeFYs5t
	 uLSjiPU3MtAffAfeSRgIltqtlP3pdIrpXvteCah7SLO/T0UJpxiztrsXX4IKOdD0PKGpR
	 nl689C3F9w5dJ15aPo61slz9Su6BXE8+JqGMrWldh2HYchdHj5YFL4OER3pYD5PDAyW5I
	 d2P6GfVAlDjFbjAdkxnU1q2/3pu6eOZqXcMTldsbsmOegwq5V+edlRDYjcMe2guHFKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OS3ZzrSl;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE31606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE31606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OS3ZzrSl
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93ece7a73b9so433278985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464278; x=1795069078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=OS3ZzrSlNdHPiJ7/bU6054Gee9PT/1UmyQE3IeOAtUgfoph7AcB8wnb7I0VaBl1V8W
         KRBL07C+RZtVEfC94KIgaP5C1s7VUAx5jTjL5l8fNDyt3fHcY6G4d90z+LTiceMZ8XVr
         6J2ptA1HF4UMk0tVagvtihh+VjdPKa/9vLlR5fySHP4TTUZyqBVNKH2iXMbIhXlbrYG/
         7VRc+mdXmx0HxU8nXxsrnD4w1olbnvEgg3rhlQX7bmc+My2oLeYxg/ZHKrs169xud4ZL
         XYfRPOjdvlOT711uqXSYmfynT9N0TJhvxFG7OWm4UBALjpYRKfJnbWtAfO+KBI9+bV5l
         YN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464278; x=1795069078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVGCs42DBJnTcmsArwHBOkX8pUvoGsdAo8q93uzu708=;
        b=X0KT3ayFwwAXeebTg8e73k8EUGBUa0CU9cBWDj18Htlf4UrA75E5QMfz6/c7e2GH69
         LdYqeZIVy0OZRoZxwoBqjyVFoeCHXe3zmyRG7qEOPkR1JVZQNKpn6n4mkENr543cKwgz
         eFsfRjMCrAmv4bnmh6tQkNuGSp++d1rUwInht2Gk/5nfKJmXcS8hj0rpprog2fDOHr25
         XvvxpmPqCqh6xoLjG1wohDnoAAI2Fjo8nn7apARwv5UmFyOOHf1A+YxcMYx4LYBTX4mf
         15JjXjOLYf06/cjdEKsl9xx3ufKcmA5ewV/SOVjvhIKqDlmjz8WartCRBzkc4RhKUaxk
         7P6A==
X-Forwarded-Encrypted: i=1; AL+hErGSZjJG6AQ0as+y3PmJam/Fb8SGqtT+wYSN55ucYDyEf1kjzprz5M4JPAPlcrkh4e/9PvqsYPVWMBNCvqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bfs93q8oIvm0Gn2dqMQdEZq2DGWW3QgYKBsc5h7gqvipWKtqI
	Fn+eefBzkjj2+akEqv5LiYV3Yc0Gtatd3H2Qn7/a8Li/GMo6OSXf10w=
X-Gm-Gg: AYBFou1jwqrO0VkKrQj5JuKJV+Galw5FhX8MBuvo0rX/CyCuduVvMBKmhvEM3+KJ+0e
	3MJVNrFa30eL22KZjgQkelxDS57R6repjKPGS0+wc6mz/n1tBJU4HL3KC78uuyX7/lAJm6OZpK0
	o4SZjygmJDdMspx6Z3laz2b5gSVZg61ysKat8iYIK3aLAnBJ98rbdpin9pYq/oDYGXGK4W4aVhY
	kPO/U4veGpGKGEst6VqYLq30VNpzIYtgZFVdywGlZCxcrWEAs1vsX9YKQFpfR8DfHY/dQftCUtg
	VCcG6Qyw3zpZOwl0pWBsty7j5DJw5cfppoKhqu+87pg8YZLybtcdegoygp46AyrYjbtQQBFDtYX
	uUkatd+TDHAbro5oJDY0z15aJlwnLey95f8TsSP9qTky80cM+9bJaPEeQEYxP40glf7QIhafKqo
	viBxJoFM66oIZWqXqnFg6LwdastyDLi1uAVzQFkbz+1GfrDbfCmGWwkWrdylPF2UWU9RN7kgIS7
	oWpNCOu+QTnWIK32XocPFW5/pRT4Do7l2ir/lEQLmNjKdvNIUBQke04L5EdMTznwf6taJCPtXK6
	/xXGZgtHSnH3WiBJbusVBWzoQ3dAeM4emB2lyN3qNrNVY2WKvSEVI0JoAKrdNdEACDQd+C7oqVC
	m/x04RUKI3G+cf+FNyHxX5uThhlXbTOLL22vZO+ToFJo7fnsgbEi8ceoH9t54LOe5HdZUxPqVxW
	1JdMhIv/3gIPL+12kO6QjEjUmtDFG6Lq3U
X-Received: by 2002:a05:620a:2995:b0:93b:db80:e0cf with SMTP id af79cd13be357-947b008425emr752527485a.60.1794464278344;
        Wed, 11 Nov 2026 22:17:58 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:56 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>
Subject: [PATCH v2 2/5] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:46 -0500
Message-ID: <20261112011708-afe-v2-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before freeing the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

Found by a static analysis tool under development.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 16 ++++++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-common.h b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
index 910d90d3d146..de715c92add5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-common.h
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
@@ -202,6 +202,7 @@ enum {
 struct clk;
 
 struct mt8189_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct regmap *pmic_regmap;
 
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index eefa96b701a5..e9fddf2063f5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2516,12 +2516,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return ret;
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2576,6 +2571,12 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_put;
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2603,8 +2604,11 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 
-- 
2.43.0


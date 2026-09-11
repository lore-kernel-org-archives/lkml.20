Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1BA3EFD26
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152531; cv=none; b=PDUGRiFMYDJxMjFhGE/V1+DDWnjvKnG/fJkCNyV/rmZOkrrACrFo4Gg77KS7egSc4wTrf/Fk+69WmPNBGJNChdLFq5sdsCLMnZnXeC04WXsk9IfnoCVKWexIQSGc+i9U1tvSifrNDyRmxmPxnCNb7aWLg7SX+YQn6fcJb6rJ1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152531; c=relaxed/simple;
	bh=gZ5i0XgbuKsA6Uj95jN4pnPRMbKgY9tYTi/l34huXSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZHP24aHIt3oPrvsVgEsMcOQlpLjIrrjVXthqfNK3CUS3KdN8fVGQ3McqC4QMCpfWesCujeF86IL2HXRfh+RFnDuTVwWPTWRrilaINMfwoyQqvEWbKYUpNprFEmbYe0w2ATx5MLfdmkKuLP6yxrKNhdFnIbC1kuyrMTc0zHvR2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCdVkWK4; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCdVkWK4"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-530dcadb4f5so7001721cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152528; x=1789757328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=UCdVkWK4Hxy2ssWWsTfBdYeL+WVSZE5IVrV4ghqiepijBWx2m35e2/sG7eGNGZSruV
         FSnNbzCXgi8n0AWYPoYffqhxgdXU9szHC85yRaHaMKI04439xAfEgT4/IkPeaMUIYE6o
         autT5i8jiTl1nMSqZaXsJTssn7cmoTd/oIVVjLfCSb2ECOdD2CWIyavyMol1K4EdeCKe
         RkwhpyFB42oOpOTOVVD3zaq2dNoQVFbZm4ALM0UjcLEa+ZxH9J+npdGJD4V9LvEqBDG6
         AA6p3VQXi7rgHdkui3ga+8V8V+i522jztAlor08DRmV1i6rgJifP3Kug1+fJwnQDUs3a
         tQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152528; x=1789757328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZuyrKf50eYXDMR9/RtxPhzJQSYHI855hdGibW04Pg=;
        b=eYz83X1sIeftQMuRjTUcXG7jwtmP/mygqFiVbAR7KZE3ep2/wmsAFFnfh/hJMWGjbr
         F1q4cPGodmiA1+J1LzxbPHONC2vPPKBMV4HburrVpArKDvu+qxkR1Ek/BllVeq4jpgYA
         rIHHwVI6ny7v4/36P3fr8s+ynm77499MbTWYF1OOWqvjsGnwrgcbg8X5fVMD36J0SgIk
         1iGbaH1Z59ZjzH+DdPhlhSVOh0Xz7s7S3ppORhARvI6Sxj2A39AKTNILJWTGf/vbgu5K
         8+0Osa+t9dDEq5fq2Z1GmFXYYpjAOexgx97pAS4NZ2F4269GjrNR0jS4jfIOMFBHrSZQ
         jK7w==
X-Forwarded-Encrypted: i=1; AKwUvBwRoxU652DoiuIsNAR+ksyA5EKeE6CbtWLJCLpsx/WgOgOsxL4NwlU9sZosKLet/kEZMN4ozPRbpfeIqMo=@vger.kernel.org
X-Gm-Message-State: AFuF++m5I+lw/Qdk0y1Bu6+GvjiOBNK11BRlOiimSGR3sYccimI438og
	JnMBJPoqoxSiIXGVoij1kb5wvXrwlrpp97VAq8Dbo+z0b2LnwwnxrX8=
X-Gm-Gg: AYBFou2Ckw9nqh2D9RG2g4Ta8JRx88cj/pCU6RSSTn52ZQjNLR9yoEX/JcrDME675xp
	BOTTraGDHlKZaaanRUul6d0GnTc4shEK/juLVp4kJ4NWbQTxuB8osxfnHhGwYLkoEiszWNMAlJv
	Cuf3+mNYt8E4j41YMIVQD+OE8X28RU8zX9BtJncxS2/E/aLK4s+z9Kn1pxmajeHLOPR5OfvqxmI
	MNEYfQEWqcyh82HTHOrH2UzQEwbaTRd1ojfFHETXvNiqpiIEHFVSsUfabFUHgT0N/Usxfq7GIum
	sxRI4qIG9hsQ1n1oSY4s+ExqVEWYGvzmP2MuFv04vQkNTgJC5pfruO0embjb2Ekq5h9sZJoECb6
	WxLznN6c7mvA7su4glDfaI4GWijhWKvUuqQl7K6xQha3kGaHFh8d9jX6nZ/TbmgM8X1Hgx1PIoX
	/bvV3hJY0oC/p24lTga695X7uj7yVWqbEmpG71hqe8ZeocRRAIm/PzBtFJrP4n7rCwuq5p943zU
	yUFI5yAhp+LzylRRbD7ybCNtFob4MUPkogdxbFxVRMbS3rmvRG+UTv9VPoSttV+OGmOAQsmUpBK
	k4xaiuqXJVzIzEJti68N2BwdUOOopvYoqxM=
X-Received: by 2002:a05:622a:4006:b0:530:b2e4:d598 with SMTP id d75a77b69052e-530c8754c05mr79942701cf.51.1789152528459;
        Fri, 11 Sep 2026 11:48:48 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm26707086d6.42.2026.09.11.11.48.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 11:48:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: stm32-dma3: disable the active clock on removal
Date: Fri, 11 Sep 2026 14:48:41 -0400
Message-ID: <20260911184841.34222-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables the controller clock and runtime suspend disables it.
The remove callback only disables runtime PM, which does not itself
invoke runtime suspend. If the controller is still active, its clock
prepare and enable references therefore remain held after removal.

Remove the OF DMA provider and disable runtime PM, then release the
channel IRQs before disabling the clock. The IRQ handler reads controller
registers, so wait for it to finish rather than leaving IRQ release to
the managed cleanup that runs after remove returns.

Disable the clock only if the device is not already suspended, then mark
it suspended. This avoids a second clock disable for a runtime-suspended
device and also covers CONFIG_PM=n.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/dma/stm32/stm32-dma3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4724e7fa0008e177160d085172cb89d6bc483c4f..b4d68be5a46b8aa1751dd32234d42f6e6b470335 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1926,7 +1926,21 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 
 static void stm32_dma3_remove(struct platform_device *pdev)
 {
+	struct stm32_dma3_ddata *ddata = platform_get_drvdata(pdev);
+	struct dma_chan *c;
+
+	of_dma_controller_free(pdev->dev.of_node);
 	pm_runtime_disable(&pdev->dev);
+
+	list_for_each_entry(c, &ddata->dma_dev.channels, device_node) {
+		struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
+
+		devm_free_irq(&pdev->dev, chan->irq, chan);
+	}
+
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int stm32_dma3_runtime_suspend(struct device *dev)
-- 
2.53.0

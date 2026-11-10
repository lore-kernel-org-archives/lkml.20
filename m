Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316658;
	b=TGn+Hby9xyofSdAP4STAEjFzm2mm9GzG23chp0A3dRCMVV+Dp2WEqvmgrWfqd2WUltKV
	 zvQ1FDLniAqeGVijKnHL3bdt3kwoFDxqDveTkgfu+8ziR7vgvBLoq1DTZjeROrrciZqnv
	 Go73b2nosUPIuIUX3YZVZP9/Zapy3TQOpjsFmM2a9I1ELZou2K5MIk+bIFc++Luq7P+rs
	 jJcb0RQ9EKguf92vwYpl7ERAzok9vNc+y+Lc7ou51gCj2cq5lIXJk6lWZ6uhtRM9Xy6m5
	 N0laKUos8eytuo6efIKisMA1OkIUlzDPuXTxLejyqgVsPCoFj4YuYjVScVGCaOl4W0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
	b=4Ywd1aSOgssZY4FDAkJwo8YliN85hW1V5dwbxy4/sEx2yegXJ5pFcGhUTV7XR+Td2bGe
	 OzTbnBPISWXcu8LKWpBAWhgUbTWDJZzQQV1Xz572YCLFyeFK+4bqH7a/HZO1vW/dCY/1q
	 D57c5bKVvAXcZH4hfrIwjRyVvbrA6is0Xzyxea+jRd/ti3Uq5vDM9PZly80F1eLbObQWp
	 agzIyMAEk4izt5WZkinoOBbeliVtBZ+EQQTDAZyAoIpP8TC1gskR9cShtUMdQjahNJ/aY
	 voxtGxPSfsT7Icx9c7KlcVoxYsjvBe7A7UMRfhYhUopp1dfHvQcStahQsgMYonk0FQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X8RMi/CA";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC992606B2E6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC992606B2E6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8RMi/CA
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1251640a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316657; x=1794921457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=X8RMi/CA6HMKcE6Lk2v8Y8XdKMsZf2NhdEGCKNU31vVNOwqNB94z5UNdZMgKbu8J3b
         W4DKF863+WXJJvgMBYSnsleUlRP6TdA790cSuHpjFch+FWbFpuWJOK9bKla0xDQRJyIc
         cH7KHVdKlzcAXpjg1x7PqmYbeLKMBtxKXY/ds8llnlxwpzPczGm22KrZni+VXrIlrddH
         n83+NuIY2JdUiZL1I+wsVz7FM370xEmTz40jex1iI/bR60CmKQb6ramgKCegOjVoGisG
         OrbtsiN7vwvsorkt8xBbth7xuwZvdkV/7euiBH3H2osbKYCnHD+n3lYikTHL54YtrM3j
         hprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316657; x=1794921457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmC6z0SGnHZMqw33i8OvX2WsVfy3whtNtxw8axc49Lo=;
        b=L6YODuR5SNu4XuXLhSaNLUEoQzBUjo40SkFQKBMnQOpXccn+bp+7kvHEkuNNB/B/RJ
         38T3n26qBKDNMRJGFNLkPnlXtcxdX/oNMeekpXUyyNXRjPhVpRuBQP7cWaB8Afs2ztC2
         wBzHm+8Ykvrlx2nSd+QOh3SAjActeNM1NFKL3SX39+0RktOhMs0TdMBYrVq4FWCimoXv
         r4DjybX2/6kk8PgtxBDG0J1rGBIGkZgqiYUqDXzPCWtpsk5vhqADLV/PvJHNnQW9j4VR
         JKoozjprrShjej4Qj4bomdmlNcNMegang+9cajAFb7OoNthqZ6QOlRlZyHlqMMR92uoX
         CfpA==
X-Forwarded-Encrypted: i=1; AL+hErG15gHxuFNzJC+8pT0MUsGRV9lCIvUdABoFTjn4ICJc/2OjR3PADhOeOuYc/jbIZYuIjcmseDn7P3REnAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WPbIpJW5HoMM8GZ+inZc9Gz5bbWu8kBz63TqwMrB3LAMP8ku9
	Dgw18jWVW+fayqO3QwTO2hw/muJU/72QiNpslqWF7NVi3PfSB6OV1zaa
X-Gm-Gg: AYBFou2nbBteN5ef2mToxE9IXIU/dhjfrSPrP89g3pbMR4ffsSPMHDu5GNHt8Z8+bGO
	6K4J9L5NpNXt0fvtnY2QQvD+jKv4GvdP1DhH/+qjxZLCcVsZFLgUt3IH9MhT51qWaPdNrO21N/f
	DQTLZ2niALhQCH6HmXM4rAC5kaqukzufGU9x3WzXBV5heIUtHRYcwgXopvSXPbj/e/B8yP1xCrT
	01yTxUs4WnG4kxjczJU2vh2I1diduMLrj1daVk7q+gC/XUTdvYoRScr9Xy6bfxI5WBb5//T4pTg
	oq1vMGisbStoxgc9kT5qWeccOcqPY5OZ4cqj+Exzww2dW6VJXaMSR36N/CHvln808C4VtHg6GTS
	8ay8cOGkCmpl5Qsytn0bddKpZYPgUSo6BAzFuyALydin/FJoDgi/TQhJbNbAtMfbOzaGgzKvNcq
	UV36OwvHBJb6/uznDIkTnbtAqujvvWrmg5VYdgKWWPS8y/WX0UjG0AHwlsvOvSYcPObcaVSDRiH
	xDdZdy+K1ipX6MLVGXHycxh++Uj4Zm2M0U+NGyAW6XXSy3Fkt2TqVcpZI9a9wI30ZasJAHMX6VT
	nuQ9DovxsUvYdmM/aMd/o0CbkqK/vmU=
X-Received: by 2002:a17:90b:534c:b0:3b0:a757:e370 with SMTP id 98e67ed59e1d1-3b167a3863bmr1474256a91.42.1794316657157;
        Tue, 10 Nov 2026 05:17:37 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Bjorn Andersson <andersson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 32/33] dmaengine: qcom-gpi: defer callbacks via vchan
Date: Tue, 10 Nov 2026 05:13:32 -0800
Message-ID: <f7d8c6b405705d941201a1b11872442dbf5682c0.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete descriptors through virt-dma instead of invoking callbacks
directly from event processing. This preserves the transfer result for
the shared vchan BH, which invokes the callback and frees the
descriptor.

Because callbacks are now deferred, synchronize the vchan before the
channel ring is freed in gpi_free_chan_resources(), so a late callback
cannot observe a torn-down ring, and provide a device_synchronize()
callback so dmaengine_terminate_sync() waits for pending callbacks.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/qcom/gpi.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index d3c3d0f35afb..e125b3a83b1a 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -981,8 +981,12 @@ static void gpi_process_imed_data_event(struct gchan *gchan,
 		result.result = DMA_TRANS_NOERROR;
 	result.residue = gpi_desc->len - imed_event->length;
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1060,8 +1064,12 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	result.residue = gpi_desc->len - compl_event->length;
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
-	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	spin_lock_irqsave(&gchan->vc.lock, flags);
+	list_del(&vd->node);
+	vd->tx_result = result;
+	vchan_cookie_complete(vd);
+	spin_unlock_irqrestore(&gchan->vc.lock, flags);
+	return;
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
@@ -1983,6 +1991,13 @@ static int gpi_ch_init(struct gchan *gchan)
 }
 
 /* release all channel resources */
+static void gpi_synchronize(struct dma_chan *chan)
+{
+	struct gchan *gchan = to_gchan(chan);
+
+	vchan_synchronize(&gchan->vc);
+}
+
 static void gpi_free_chan_resources(struct dma_chan *chan)
 {
 	struct gchan *gchan = to_gchan(chan);
@@ -2010,6 +2025,9 @@ static void gpi_free_chan_resources(struct dma_chan *chan)
 		gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);
 	}
 
+	/* drain deferred completions before the ring goes away */
+	vchan_synchronize(&gchan->vc);
+
 	/* free all allocated memory */
 	gpi_free_ring(&gchan->ch_ring, gpii);
 	vchan_free_chan_resources(&gchan->vc);
@@ -2279,6 +2297,7 @@ static int gpi_probe(struct platform_device *pdev)
 	gpi_dev->dma_device.device_prep_slave_sg = gpi_prep_slave_sg;
 	gpi_dev->dma_device.device_config = gpi_peripheral_config;
 	gpi_dev->dma_device.device_terminate_all = gpi_terminate_all;
+	gpi_dev->dma_device.device_synchronize = gpi_synchronize;
 	gpi_dev->dma_device.dev = gpi_dev->dev;
 	gpi_dev->dma_device.device_pause = gpi_pause;
 	gpi_dev->dma_device.device_resume = gpi_resume;
-- 
2.43.0


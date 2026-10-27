Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126620;
	b=xlV5GJ+oIf1OUBjnLrmND//uPmNZrGHj7l+xcEMoXHupEFwBEhX/JiTmxzlmPFtONY9a
	 3X8pazfyc0l77ueHbD/06uSMDULJartCHLdFwUFGf71EOjHodc1EYrUFY6yCUduyezNjT
	 kowfhx/RdrsOHUfLJ1H2/uWxM/ygXULxOhB/HjaGWY/JNuom4pcMQT0971jGxoy3zbAX6
	 3P5f1SSS2IjoQ8pfYPPLiYVLn4jel4HYFA51lvZTeCO3sW9+HqZi8wGDaJ4RZ8WDaDXIO
	 EuUXJpM3bO9uvpSGkRV2cS5B8fGoVPOK5cdhllcLE+8YK/PY25fpbyZqsch9bNTFE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
	b=GyiyKFrpq8Smm1s+HCkmm2zeUP5iAJ5SS6jRRGHafnluqHcGXHX61BuDmYoEfKo8aZdX
	 S3gnYKe/xSKFdDFornJ81vtXo7agAoVSOyNxD3hYr7y2SCNF/9mdjP5Tln+SIbeAj7GM3
	 YpbJdgpMl1SLqhVCKq01dE5JMTWWsU2rNLosBsMbwGMJOvH6boRlfJ8snwuP9XiYVI8C0
	 EIKv7yp2d7wZjYtem5NICBbep17FYuXHMbVP48VDufbpAXFhSHj+yyXkR0iaqY1V7A2P3
	 7xAKSMr4CJCZ6u29mXrSERTU/eJsUC/KzTyM14sPeuNLjrzQuNoOdSXuKgONRL1wtPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0430606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0430606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oD4jcY1c
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84e513874f8so114017a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126619; x=1793731419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=oD4jcY1ckBrn+CHRQVBS4t7Gqd7I3QR1HDTTSxzsfsCSxcWeyJQThuiiRWuYZ4Fge4
         6hldgR44OA9FSOV+KLpiLU3F2F3r7GcerlTxGQaozu+0P3YB2/AmtvR8xJEd+SRU0er1
         NJ/F0wbZrHse2TmHLy3S6Su/JuOGAC6+zvDSOw2aemAmXLMvc3Qe3MjzfgTS3e292ybr
         nG8k9a2OtoVVGLohrW1vZWMs8k5ud+6L9TuhyQtsfPZtcEBPgAlPONovF3UV2vk9dkLY
         Eph1ZHn3cV2DKozFt5a76nNT6OiqerhHlwyPTU35ZgNydHsTDEnNHtAiHwDG/5d1acGP
         cD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126619; x=1793731419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETa6PEiQPvx4Sm9llFa3xDCORaPT2KrvUrXEonwMbCs=;
        b=OOlfxDnuQVMKaDyQqLW0NEXcIcI/U24Rbxa3m+q9qQdNsMXs3qNRE2Ro+CujxrGOuR
         aT+KKwuOMrO2F4la9TeT3PLJ2YuQDP+GxfoiKJ3PMmtfA10NwI5EayP/S4jQL8YWpFVV
         aDqe6eowgKl3cFW2XPSaaq3DM7drZge24u4twvf2JCItTuK8GwnAc0b+pxYXsb6qGuh2
         FnFSUWqxEag3GwMElQhokN9loFAs9z78R7NMFCJlrCczk0SdtMDAkajexsLziYXpX8Js
         cxYF0eb/yya6bCIYPBP3syaVqmgvpK8txv5wjIkRinudyj+pZ3JoKCvGMdJQaWHEQqGy
         wAww==
X-Forwarded-Encrypted: i=1; AKwUvBx28/NkA79LwmmR+FDEwo5Sle6oQu6Uo5ku55A/2mBnzcMe7sLLdog3u/AvX7AMqQc3ET7pqBEU6y6oJCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEXGoeZC09NTaVOMqZXnvO25LWneMlaL5jG8GgA2Xn4Rrtkqp7
	CJ9YKrffjnFVbfZ3mKmkW7dLyR+hhEk/mlVCnwP3slLgQ+zskXbXC3NS
X-Gm-Gg: AYBFou0PgPoji7bXxYTPtU9umqEB0Gl0twwlBxoZlkI31XzPUuuEGYFNmLUXQSMghTU
	QLKbKvZa3QCYEkn8mX+MFMxRiqSSe7+ObRelKabADmrREN1nUDxRfE3+WKkqMigSGqyLnBOiPoE
	Z46R/knvM2qm5+ZoMshERPRjEoTwJW4kyCAEUSpy7skRAtt+k6wIk5GB0ITFfXA4U9qkzfmUMSz
	7D1/tV9yImDxi0ZkHeSOWReBMHxLoAW4IQOITIfB1bjxw7Ay7z9RAqdSa+iIFdTkL+zRQQuJaHT
	cACW347K4TT55H57MSn2LyHUsvDQlxDJbc7cbCNrblM3FiJvL2mJkZHxD2V0ZlT6VBx2pHu3Ooi
	X2VoP1tk186jGMH8LH4vA+tq9S+vDZafO5lmY3yy+uho3d3Ku5A+786SMTsEmpVnBy3dfFl5JX/
	oPuAbO9Mzsal6MJCz+2Cz7Yf0bFDfhDjcQXryK/0YUz2IWbvBuY3brtu7um8Z7/eLInDjyBlqTe
	GvdhGT0TBq35uvlbGrQFWnFglZGojA44EVqkiYaigVqaAwBUVROTdusdYaOyeqeWc7kz6ForyzQ
	YDs1lraWU/U82qHVvaWKCbhIe/wTEjDKx4pOeloajKJs3LefGzO+KpZlukXuN0hKa/n9CeNj3b3
	hFeSZj5lC+hgm0qCUwLGN+dW4dHvzwRVg2qOv05Xe1sewyB7m3wHmlG5rWXvcqqOCXc82rk//ju
	gcKtI=
X-Received: by 2002:a05:6830:230f:b0:814:57a9:4243 with SMTP id 46e09a7af769-85abdb098e0mr329067a34.17.1793126618937;
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:27 -0600
Subject: [PATCH v3 2/2] dmaengine: mediatek: uart: synchronize completion
 callbacks
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
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-2-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Use vchan_dma_synchronize() as the UART APDMA device_synchronize callback
so clients can wait for completion callbacks before reusing callback
state or freeing DMA buffers. Keep the callback wait separate from
device_terminate_all so it can run without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

-- 
2.53.0


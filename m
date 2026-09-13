Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E63E7BD5;
	Sun, 13 Sep 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303919; cv=none; b=WCldf6If1E7yd+M5zgt3k5G18GpRVlOIyCk2x1/euGqP33QMuApK73ac4BJqXFUKoMSfI4f6sn/IrXwziQR6DqE9UvqdAbAllmF5e6RObWhCSdLKo0FBO5iWPQs9GOsntV/AzQondSmWrk72wzqOW4M9LComuRdDkOGaNpAGC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303919; c=relaxed/simple;
	bh=riYrgpzHhFEYawaU+5OhhYaybakuN9aQOyyqCURQOeU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H9fc5lo4Z0Xhbs4b/IA/+s624QdeHoWk6UFSZk3iv6a4UUwU92cf4BVDV1L+ujaD9nvToH8KPdUj61gdaK/T9in62dXzmWO9HZclCGsd0MuA3lmYi7TM3clJ/sH/oEEHWiukJHxsrWfgCRm2rtFwCFUWSIUxQOl1f2IccjkKPKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=IJGU6Iv2; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="IJGU6Iv2"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3e3;
	Sun, 13 Sep 2026 20:51:49 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] ASoC: fsl_asrc: check the second front-end DMA channel
Date: Sun, 13 Sep 2026 20:51:47 +0800
Message-Id: <20260913125147.109920-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad2eb5603a1kunmc05ba738251195
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ05IVh1JHh9LQkpNT0pMSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=IJGU6Iv2fDiCoypE3ydVz26ysPVKCITlLQ2LgIxat9Vi3XD5bRfrMbQBxGBxMgLU0pxntXotkixwohL6gm1iz32g0XnjGsOFcPvSCtU5pgMcmF2oTNF2GKkz7fG32YrmqtHaf3m4evE1fRHifuK22+DtnRrXulHAiGdTVIrgt+o=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=ZaG9JvtDZPtzu7/Su7H2CZKbMYzj3xJ6fua1r0x0Bsk=;
	h=date:mime-version:subject:message-id:from;

The temporary Front-End DMA request can fail independently of the
persistent channel acquired earlier in fsl_asrc_dma_hw_params(). The
returned NULL pointer is immediately used to read its private data.

Check the temporary channel and release the previously acquired
persistent Front-End channel on failure. Clear its slot so a later
hw_free cannot release it twice. ASoC marks a component's hw_params
only after success and skips unmarked components during rollback, so
returning an error alone would leak the earlier channel.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 sound/soc/fsl/fsl_asrc_dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 2f662bdf14d0..64f2b0612274 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -248,6 +248,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		/* Get DMA request of Front-End */
 		tmp_chan = asrc->get_dma_channel(pair, dir);
+		if (!tmp_chan) {
+			dma_release_channel(pair->dma_chan[!dir]);
+			pair->dma_chan[!dir] = NULL;
+			return -EINVAL;
+		}
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request2 = tmp_data->dma_request;
 		pair->dma_data.peripheral_type = tmp_data->peripheral_type;

Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C48883F;
	Sun, 27 Sep 2026 00:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467670; cv=none; b=UcUdyTl98PT7TCv9+lE1qbZ0f6ckQoKjYERqNEmJYJgH/sZHnMOZtlkTwAi+SiUyHn1LVvrP8R0cpTjhstM3la/ojEl/TTQZpje3SW22nlZFRPsZoe476vse+B9tmsi51BTb/YxsqOxPReCce9CqhFKJDmoubR8tVbq8wP/iAs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467670; c=relaxed/simple;
	bh=cRzoew1i8JXu5Rqk5R//ZWMXFXoEzW69MlwYNFFPI4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qqNlaR2ubTIpRFxr7YNcm9F2o/sK9AwTdkaoVXNxjUn1/Ih7SYrYC9TC3WZVGeeSELlR2Tli3ihmYJz+d6WG949MOaIDQj6/om7DG2cUfoZPEbZUUrmIf8wBmsDMIgElAVxA5pL/FGiY07aOIi0ulYXxhqV4lo4dH5ViSEjPwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=QbF4QyhC; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="QbF4QyhC"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f363ff90;
	Sun, 27 Sep 2026 08:07:39 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: festevam@gmail.com,
	nicoleotsuka@gmail.com,
	error27@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] ASoC: fsl_asrc: fix second front-end channel check
Date: Sun, 27 Sep 2026 08:07:38 +0800
Message-Id: <20260927000738.10105-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e03057b003a1kunm99d393ae198c63
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEgdVk1NSE0dS05PGU5IHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=QbF4QyhCjw6hG36cGPxr6IHjhboHEUGFsa4OqBkqdFogpp1Ww3yyYkkd6hqPmAYnwxyUxJ8c5foEYk/eqh9HuQBdP6m6pYxEPHOjeGtWlHSLuL4UI1ZFmALhwh0Z8iM/mdguRw5Dt8MxGcAbRF2XGSUF8fXbiYLReV8ehEUEVfc=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Ml7jgvZEPQBNcx9fLsK9k4wmKlEvGi66dtLDkClqgKE=;
	h=date:mime-version:subject:message-id:from;

Commit b045248399d0 ("ASoC: fsl_asrc: Replace dma_request_slave_channel()
by dma_request_chan()") made ->get_dma_channel() propagate error
pointers, so the !NULL check added by commit b4136c0d69ea ("ASoC:
fsl_asrc: check the second front-end DMA channel") no longer catches
failures and the error pointer would be dereferenced at
tmp_chan->private.

Use IS_ERR() and propagate the error, keeping the release of the
previously acquired persistent Front-End channel.

Fixes: b045248399d0 ("ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request_chan()")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 sound/soc/fsl/fsl_asrc_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 0aa5db8973d6..097a0d5e8b31 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -251,10 +251,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		/* Get DMA request of Front-End */
 		tmp_chan = asrc->get_dma_channel(pair, dir);
-		if (!tmp_chan) {
+		if (IS_ERR(tmp_chan)) {
 			dma_release_channel(pair->dma_chan[!dir]);
 			pair->dma_chan[!dir] = NULL;
-			return -EINVAL;
+			return PTR_ERR(tmp_chan);
 		}
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request2 = tmp_data->dma_request;
-- 
2.34.1


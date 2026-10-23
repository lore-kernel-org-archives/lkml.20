Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798718;
	b=kUVTsuCiLzPISKYt6SlgCJZrPklTwZUWy7mgCuqvHLFQs19FnoFZTAHC917YgqM5lrkE
	 4QzBdzm8E900Gp6H/+BZbWCdUNePJwCHavYTbpJc3SrYwR9gkcIjGB/EJI/Db7jSqvefQ
	 W1TzfKjzTYYDXRTSwNUGR7pFkFd/S5s77HZ8qNg23FpQ4cq+p0v5ZyEAr438hY43cyIKT
	 s1tkBUJMr0dlaPVs/VKzu9tRssGMDJ6sR7pnjIljmoSRmB3X3r2hhY8n4icfVBMXbjlDd
	 wzXflfrHfhNPRcW0IlENGk+dDWvj5M87veVa5C5xDiIhGGB9Uu1tnKfyh/+HsqHT8ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
	b=DtqnHNYQMCbdg9gKbY1DWO+tpUE0pV6TFciQtLijjqh3XJZWLDBeeAx5XufAA53e8G1S
	 0bWffp7BI0Xxg7q2y3vOnRgmAJaLVr+Bc/0hMT5pEbvBlHTKerzqjVbL1ZCuwKTw1HZOJ
	 bb8eOXbuwf828Wsv9s90wVJcFvYtsvN47fQofNLQm4GyYIDx7KQNGBphvmidA8WrSfEiB
	 TkU2MJEZl03EwNnTR2MIbU/qtsXLO73DYAt9cGz4DX7ZELhaPP+1SGE5sNgybVJ2Mdruf
	 pWQmGleqRgFP5e/wQcQ14w2CQMp1/hGEQl2bKhWzHHphj6uJOuenU0kKAsJsrWAvRzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kChqaT5N;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CDE606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CDE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kChqaT5N
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a76b314cfeso1749067fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798714; x=1793403514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=kChqaT5NmBZqpA3iflROJTJQAX6sH8dLUdwc51nspheaRIkaMBH71acpp6mw09x5h5
         Li0RgZkGbC9v0NBFtqZdD6GtSVJquxQ+DE5t1IkniXQUmfVJ1P1i7+M8XVayfhOUQx21
         w1qS+jsKAvoorh1y1leFo/GqE6P+GTWYDBlW2G8uaSoYLZuMIRHFWHUXL2cI7DhypToe
         B3jLeHS+XBFLzeBeWBsIz4HT/xqRJxe/TGtPa393U/iPKc60NeeZkxpQirF1CMfKclVC
         u26Padv+x+JbLNdrlzEWq+5DsNIzGHAZIn2VpYKY8LSDd4+nmDrqhUkQkICUQGRwiwjL
         BkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798714; x=1793403514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1ArQRepK8gqW1fEvOkHLMAfG1V96lqFmDa0NrMk7WU=;
        b=DnB2c9gpsOZngt5uZ2stXTbqXRJBYIzyJDqb4ZHM/KYz0zPC3a1slQ/kx3fdux36FW
         vi0b+YbDbKmpGb7YOU9lcsySkcPNwk8BxibZM4RhoSGij2CkNQRr/fn8Z2ibSYW30zOO
         UaEMXd7Qts1o1GhdhgPGxG3xYxwd3Bs9ocP08X29U0FPrI38L0wb83ipfBfVgd7m2kdj
         nbkA8IinhZfocD5vIrwZIAq1QGHAhRe7Khr3pLqCDjdmwiLmknQSSzuDlidX1IGipZyY
         lAtXKQBtTRv0tB4NM+VOfDsABenB0so90SSumKny88QFQBtu+XlD0hEbmLDYgul1r29U
         yjlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHdsApBS6pgYQj25pgXHs1v3gOFwRm/wR8LVf4rfxcutsTueCEhiWnqH8OY+rjH+rPbJTeeRLzdbJRYZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7v4uwo3EQhFLNhWEzH5ibFUcedQaVqNRKfCgKyGOcsuiSHCU2
	w69RZvRT2DlFBlvKzqqa9OC3CePITaMpq2tJEGqD9fhtcBo+I67za+k9
X-Gm-Gg: AYBFou1O+QZbUqZUVG/qIAdZfuRswlsPJPyOrTTX73Y5ZtA9L29UV4MQMFz2PvSnDT8
	Ncc+jEEP0GAyDUsk6BcBsb0ZghGFd5vI+4lzPnXYp/y8+lwI1H5SFe39oprJPceZ9LJshs/l3QO
	WNlR2ILsnZuKCTp7UM4IGVRnw3HwGOLNd0cIpgPU2+BKOOZw3uodcdeNbS/ykCNt+Kt+QTzCG4p
	k9iC0Q7qSQ7h9BF8EZumFKKwEupSv7aGn28M1uTkWedDbdG3kg8nmwnKcozFI1/Yz6qrCMSXjpt
	atHc3MsMjMRLAnDubcx2FquUt0UJmGmLYZ4yItdAB/y5xrnX40bmy0+X4b02dSnqgZr/gjwn/zs
	SDYjRjgHcrBfbJuAkEsgmbBRV1TnO4sHTerrIvRlOWQnVyn5sHnuCT0VMSWc/eICMQ63yqUs6TG
	/nqL3Ve2039OQUvEWjEKOU8ahizqXiJRDV/fOGmSLgLRGzJ7HUfT624mhqckmdgiIiwAOIisRs4
	ctetqNQHtMRzCzxnDbv2EFqaZ2zJxJPqVQfq0U0drr4z7g8e7EiVzVr8wOtYS4nzt9is7MNaKvY
	fB3mmY9LxnGHgNdzMMJ6W9uAH388kTddBJjdT8PDLeA4biG4yq2TA/LVCzMeVQgQ1STsvKZCZOx
	UOLQ85ogNPG0oU6eZpIvTkgekvPm3W1QDxzU3+kA4a3+jGnlEOKbJsilBlqBplpNp9/imFkfSJT
	XaPA0=
X-Received: by 2002:a05:6870:af4b:b0:467:e082:b93c with SMTP id 586e51a60fabf-4a83f053a93mr469646fac.2.1792798714477;
        Fri, 23 Oct 2026 16:38:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:21 -0600
Subject: [PATCH v3 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-2-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..3a6525dd3d32 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


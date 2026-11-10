Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316589;
	b=cWPFLYOsOPkSaszq/CNfBtN4D19T5oZfbSBwGUMHzc3XLTIR5LOMUhjFimX9yYXdBFk3
	 Yi2xV9x4Suggl7hzt4MPAZiKScOn0ujKegHFumB4osOJFIjSV/l0jauGiIDQVEmmvXftK
	 vfLgmoLMq4P5PoqwMuwcaTyhryU/nexPe6a/HrHBgnj2YMLHpQebaZ5Qq3+ddvwESnS1e
	 noIQrysrCQBrDhwmaJOk8VAFb2oj6BR3nnaguVLKU7FzZvKCruGZnS3zPo/JfUyPRZfG1
	 5pRRERXHnWf3XEytjjnUQlhFKkZC9rquzaCLWn1a7oBwzpzhG2zgc1nm/IuTPalOqQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
	b=P8a3B2QrXvsJZpCS1o3IQiqq4qpqg/4N2kjjK6vV6UGwpz4bPUw/W2n/AltvMMTPUiZV
	 B12nfX2M0fkbWdPgfgmsk9HzdaGfZaY+EOa7+vVfu1DAZx9h6Xepu1YNLK4M64+t14lSC
	 HJhm22m4wuvaLHTI6z0lM3QPbimn/rapg8cxe2RpZ8mueiOvDgEh+tSVLNFCUthOkOS+O
	 to/anzAE2BbuxwWop0lTbwUUWQMVdS8AWv6BmGTFBg61X19MrCnmWb4PQ3A0QlHmpjFQ/
	 wm+65vxlcL1sr0zn1fSo/SV0gGghoWspUg/RDTTSzdGnjvh5azykwBjjWCuXV6XJ2EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLSN8PsO;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1D460A382B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C1D460A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLSN8PsO
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b17b277a68so32324a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316588; x=1794921388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=vLSN8PsOwYs2ON8XuKR3EWKb2IKgNZ4WHvcex5LKAO/bDso+oTHr7yEOQNWjEzsjT/
         IJ6Kql+zRHVXwB7xFxkVqNxaUhpliOerxd0I1sxJH2RzWG+V2giIDuhbJueEzpuOKdb7
         okrBhq7I8LAPxkB6BxMibiRu5zP3bLzBb6jibe/xD338uno88z8aKVk6WBJOPzVBz6Qj
         HSjDRrM0CBjRq0HH8i++t7cxZEplLieb8eiXNv92y/OD5QoRHRjd48yYQOzo/LcREaEO
         zTFYbOmuRA9sMoOCkJubRgqQjrYGfJzwe1lJM6I8l2O/3XT8rm4vuPhnPy/MvBfm6+1Y
         /T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316588; x=1794921388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=aMdLwu08X+wWieU2gMWXKAbqQ3iKDHCkuSVhXYp60HKAKLHcehNZYTqddo6dTqRfHr
         F46u5oi8rvNXC6YY5HmllRmWT942EFZXL588zod3S4/JFofAYAxRw2HOWeoiGzngunDM
         04fZzNLAWYr2JLk/sytOOnrurt5GsMpIvQ4jwtpoKMO0p4pifworqexvNU0dywAOOiC4
         nPwtc7chz0mg8Pa5B+ldEL5FeQMYI07O6NcAaRoxBD4iugneb01JCRFAdIGbDrzRXy6U
         mYUcBSTMgqxuRPM993w1CympcECWtMMy0rrFZWSk0l8o0JdRwF8L25S3dTaOnunVhX9K
         wHKw==
X-Forwarded-Encrypted: i=1; AL+hErGrMjo862Pn6h9aFzZ9b3G+qzEZXUoBerAJoDpvYbV6c5uLzAUu4gEhRNqaX9QJ3SaxINGEhsNsMEWp+K4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cAIxNr2SVdKNqZQGqyMy4SUEHf6Pi2KiWgT7HJXKSBVQ10PiN
	PK37Qlc4GxbHX3wARx7HOgDwHaYhC22F0Ty5TGf/sTWiIsev/sTZs6xU
X-Gm-Gg: AYBFou03thDRlOqsPAsCkvzmydTBdIgQZGKe/2vmtSHMnsXdFT5eJzFqHlq7gH1syba
	+NusTXhGA3nFdKUkfZz8vqRhaMelp9unySM/wt9NghMGdO6bdcJ1QcmcceQYlJPtPt0esGpRW7d
	ClDABNlZ/FpVjUCuQBaoQWTSLhClcP3xSB4+Mu8l7KSGh3ym1orzwBZtELbNg/Cb1GPWq+8LVqP
	ghiqvpep4BNJf/aSy0Ee7hEU0BKod4xPAG4XOl4/Oxu8GC7tGH43tP5WceRsWzR8YGfoyBawTTL
	nvDqbvg+CDVNLLAPvVXq++EurGDj2rML7VbGrQV2titIZWjmayUq+rhWSlKLwpCAu9xapngrImB
	oQQtmd2DdNqxjN2J8XOm8f6dd6M9BG+AWPn97mq5SOxLtkriKvOct+t1/wMS1luS33HFfQ9naS8
	n2a5Z3qTln3mXPoxKrEEI74qk9K3IOA2nlFUzQ/vsmgy9HgZqLZFBCxlkDUdVniWAxggfbD0/Dm
	FVbNAzjf1+XmeUozJI598WsX1GPrWUvBG6T409yEgZ5z8M1/UVt/sKjL/vzH0v4rzwSgHHp9jUP
	xuvXYrfdHLFsj2b55meDl0iJSaJHNQY=
X-Received: by 2002:a17:90b:4c51:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b166aef970mr2935950a91.4.1794316587571;
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 13/33] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Tue, 10 Nov 2026 05:13:13 -0800
Message-ID: <dc2a8bc5d071b865be14d8ede93a3b6bc68839a5.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfe4d759d65f..3dfd56a53414 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0


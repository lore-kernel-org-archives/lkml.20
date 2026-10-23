Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725305;
	b=p4s3w+s+3yPCNJEF59/K0q1DmEh2a8Bk3581b7yLMK0BKA3vxB4BciZ3RqMc9RTPYZeY
	 h9gd4YQcamZGDeSnTv8Vk3jwqhSQQ9xgUEyiFRYhJxfNQuzVjA7r5jLZl6W03jHvwlk54
	 otptu9iUm8r0zVv66mOsLFQLP2p9y83N3LU+PfEsgKF7D0t/mdNK6wQmKlS1ACTrySWYf
	 yy70i+5KwPjtSYcL/L5ctd2HDZusujWocQVkG6kgjtSpUfexIuFeQ5aYKnOCwyPh/yp2P
	 Wd7IWlypL/qamHosm44KnKYFM6+U+dJwQAo8Prvt/jyPfGc/DYsj1cMvnxWrsM8/uHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
	b=3lBCeVeO3hYCvqJ3PXv/tyYNvFmTM7NyohUi9Kks5zZ/qJlMzpVgELciF72CYuG+yF8s
	 FHt6RltdZgXzYqXkF7fCoxZoW5Q/uFXT1FVNyoYu6w+F4wBvecpgtn0L1MZ3F6SNFSO9V
	 A1oZADvOc1eMwClysNp+zmKXQL05RVG1Th42kSsTaL1fllS+B89DVZAqsTMALbyJEGkCu
	 y27CD+ERmN5yyXaOFmQy02YIKwwETVzUIAnyKrn3DnABsuRpFjbn0OoBWZW6KQSIkLJ0H
	 tb//wQNrlljGbUw0o6W44M6DcnF4h+gEc5oJtduy86+xLjmM53M6iKr7i+unPai+KPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP3x5Cwu;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B573606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B573606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP3x5Cwu
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-705cb6ceebaso296476eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725303; x=1793330103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=NP3x5CwuYQMuuJmyJ/AfKIGWKLh3n3vHEB4cpcw0QGrZdmeIjCYEVLqkbwXWSRyPUN
         GknRXcuQHCLGQFWxq3r5prvt6HEBkIzSzoczdqs1Ai8Cy3YOL+ijN2k9grvZ12RpjzWJ
         zL18yWQIerESTtLUGMiIbDgMI8ALjaUe0vOgYEoTwELAluQr+1dTg3qCnVtiOcvAvVFE
         Z2wp+cxfVqNblQwLLr+bIRjvJYa3ACHr+Ga+7DAUhU0Y0/Oc3TzCRL5tt+f/6faTcD1G
         S6wJO0EyZU/GrtRbxi9m9KPJx4Dwm7Q3BBGvNF+KlhYxWfBoXEn1YL5mvAUKTheiS5QZ
         K8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725303; x=1793330103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=oShDU9JgPJQ8h71gmOXvAjQ0P9iTfwgbOtbBzhmc1KKTPyS7GJT2YLtWCBaeDflLxI
         b+5Sa21EhbX+9GY/n9W5pfY5l35nhYPzvMEw0/jvggHWIOlYZD3s71z91jBfYtsW/MLH
         zuwmEUzltvXy7HRA5WThtidZ3qUURvvOucFxvSdGapNFMnC+bxceHx1P2pUK2D13nuhA
         K+XNWytgw4ut4MDiOTanYhNHI560GNY8mqqLPBQmMz9ZsfD66EY/iMUnN6DdO2Cdd9U1
         ExmMjFtpCgqhZVoS4c02R+yf6vKwlJjNhHJ0NXEY2nv7k5Wzw8NQrlxAVtHobWsLvOFT
         KD8g==
X-Forwarded-Encrypted: i=1; AKwUvBxQO6zBZS+lguyBugC87pbgMFCfwqPlS8c3cHzpleRb8ywkt4MGIQMh4j3Ot93zuZtyy9D2Ed5EBEemA/o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbbQRp+LV3yWwE2G9s3u9Nvo032IWd2HCt2+zaRBuJ+NN32ZxN
	G5CwOAPaf81vAxMRhsh+hAh0kxf/wRGDwEXlAHLCsR4qU17AJmcQxUUJ
X-Gm-Gg: AYBFou16l57hBl0tZwj3ukooTcr4kwufiWLozzQNKi855ohhQch0Ew5yoflLweefST9
	PqtAsII24JixtcnylA6Kh4wbd9mOWYQX0k6YeLTsIimjQyZ3KIw3ZXjweeIcjj9Jzp4Z3cHyB9I
	hoGthnJFrqs4fxVn3i8Yr04OMXP+m+UAs8cFCQf/wESsErzfDqcISr4MboYMyH3RFo7d5NVd+QD
	UeKjXvCQzNQcKXVFHjMoy8YmxDkcdt+M/JT09v3FIe+sRHA9yQSRMKjAHSRQbiru6aG636rYfsX
	NRuh9oF466Y4mSQ/9WeSXRmOsxPAxnI9wLo3syKS4B+vg0vBajOl4IVL9aOYcqkPcZB++D02BHh
	sk1mKWW0mzzj7/2+JX2JgsQbpA+fABdQyyuqg2QgdLy3fAOlIXY/qaj3UH/e+zZdRGCSMJK+pEK
	ALlEZkbMA0Uwqo5ozZ0/0pfx+XDlTukoAYoT0dwsACaZR5WvYpKgrw3bv+to5FaKwSO8NoUTv1F
	z8BsHanvObz34kwaHsdcD+5smnW4IZV4INTXeS1pMC1JH2WA56IBaC5L7k/CfEXUDUJysyNoIH1
	+j7KotU8KV0vaeRVUF9IKfYCtP8nCs5G81HobOfOpr/hV4gghe1/TzfkwLEgjRUmhT0NrSAMFrn
	a6wlId+gqvHG1J6J9BONFSr/nf3mlIkgwsy9SMsLdI4MPTeAvGd0n+7qjgq7o32nqbnOxrJ5KB4
	1+dlMK
X-Received: by 2002:a05:6820:330a:b0:6f7:2050:a2af with SMTP id 006d021491bc7-70b88a8a106mr865282eaf.53.1792725303524;
        Thu, 22 Oct 2026 20:15:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:55 -0600
Subject: [PATCH 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Resume
requeues an unassigned channel only once and schedules the allocator, so
an idle controller does not require an unrelated completion to resume it.
Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index cd0562de7def..7ac6693a041e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -209,6 +209,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -538,7 +539,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && pchan->done && !vchan->paused) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -934,10 +935,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -959,12 +962,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -993,6 +998,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1046,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1082,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0


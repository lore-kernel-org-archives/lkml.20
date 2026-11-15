Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735197;
	b=JZRTi2+czRZnLUl6J6UI/DNTzn1ZDNGNgOqErdqoVOk1uhAHUOsrW0PdzpDbifSO7rFv
	 MW0GYaDTVfXJylylJ/u7Q/EuIkGzG2Z8K23Lrsb338MPyJHHactrQ7PMPM3iUWo22K/Nu
	 SEaW9F8npGWFCvrVrwmBYmXKaHGQ/YK2eWpILo2RsNY7ruU9j9JhVdZ/l10jbY7OCL1+/
	 6016Dg6WF8aATovlc2Kh2140XU25NKia5PG5aVmKbP2Utzf4aZAZfYRr+jROkdmBlxoG2
	 AIUWVYrE1SsdqDTab18ayKWGAtgCJ2Uf4RIGhyZa5ri8xMYE0a2iihn7h1hkwA1nQsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
	b=c1dG+yeYj6ta2Xz0ii3GCaI6M/hQMOqZgpRx0FTL4lqWyyApROYkG12zClsKRTHs9hkN
	 FNDd2vbKVkerBT1c1vP/HNMQyMKhr/OvpPaztpUyQHEDBW2hzpkhK2Xk/Q0k5va+omRLa
	 H4PqLTSh99RhGBrmQ4YzVcLtlmqltdKtwS3sUbXcic+6uqH422evqR2zO9j0WYfKSFefS
	 9CGsTwmIMINI3Nm6E0QTsg0C5+ONcmbJQkTHrr5Hxaljx/nsWtp/Jg9GlEaCJZmWNbOsI
	 zx4IWqwU/jS6cTvqRV0pRny4QHNy34qPusrRsE9YDU8rKFhdQ4RvV89Lq1x5mPQMgmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqJJk866;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82661606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82661606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqJJk866
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-716d052dc23so891864eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735196; x=1795339996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=qqJJk8662Fzd874Ad0qZxtNVkMdspNn74DC+U8MD2yXKBI930cQ/vNUl2LZC/MsMIh
         tuCmlOm+AVXfFxs462pE+8i4JCsNlejeC/wTVqarM7xKMrr9kiXAKvdfQLyiTOza/d19
         bmmcOGEgv1SPFLGbjpZBer4djzPH9HofROdPuCPuedzkmtn1SJQEEeOMHzmShtf2VkbL
         vqrEOnqbwnlHuNl89StZ5/2rdzvr+Cv4d8RHnr+cWtiLfOgsoRt6S0ghwH/Ho/a0uEBs
         +fBSzLfklwJHMDPo+yca2K19KOH4J2nJi/CBsZ0HNXt/OnAe4ZskoecEmSysW5/Qr1aj
         /8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735196; x=1795339996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=PiNNXHabPajJQ0RdAYa+1rTvdc/4gjwGJwthE5vRJtS0FLG5vWhP2dqQW+uyG7an2a
         RZ5XsU1fdjS+3VRox4/obq9PZ7gg63QqfTgeThMlHRMvputSlhwFIFkbJdGRjM6CkeKT
         WSaj/OI3uNStKwhzIqzRUccU30TxyV5Rl7j6yMUrg+b/GPx4RHRBp9HKqwElWBW3NVKV
         /4oN3dqXk9N527USnlOCspQ/bXFGnsIjnLzcsAZ8CoNY6Oi79fv7qXiTJv18KlCJN91W
         r6KEDGmqYW4+P/86GHR+nx4u9NmRFEoZkId4l6WI6QXwIRk69Ll0F7OTRzHBQ+G/yi5R
         /DIA==
X-Forwarded-Encrypted: i=1; AL+hErEXIGLwO5nrqhXy24s49tSN6/QvNxJskJsuMDVGLtSyD+PERwPulhKld9mPdPFSQFm8atKWFyI8TBX2I9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eMeLAVEZ8Y6HLWgDVCI0817/FsuXDgfhvvOAh9d4NlHdjHaVg
	pEbuO5AI5fMnIB5aBXIsFXT8RAe01I6bpY8JqyfJjQWlki8tCVeMarXH
X-Gm-Gg: AYBFou1Ahln4bPvB2NK3gghE1NKBXFt5wKtd21OmqCMocZVS1T2X4DGBtQ45oS6SeeN
	g0XlSRUCALA7Hkk4xmgUJZAyrfcdVrO0HAOcpd2uhC792/zhW+WsfYTmpg+1G2EnULoGr3EdwGn
	/EcxkSAOlXHK+l6PQRjwSduBVWTwKtDFy+pKSuWI3EMWnEZqEmdePlgt80XrEvIQC2ZyYoXr+Pb
	KJIiBQhbynMiorwn9ywz0KTE9jHxdHKz0RIoICTpILlWX8eMh6Kc68NZLH3qwAs03vgIt8/nIO0
	jLESoEXtIR9Wi4Hch54Nx4bpx1nef39KzFfBZ6aE8dZE9HU3sOgZgacWkVCEVHtEd/8nPnMXRg1
	vLwwKBaLRFK/VBKxfRYrZjdF0LuzMtrirTZEgLexFrYlxs+nB6JxS7xz8dAizWzKWFfqpuMXqFd
	CoX09escu2eTTNEoxqH+jDBF+jB8vqYsplad1+4LkGoEGqr4ukg93bQe0ZM8ngN6OfrJorOe4XI
	13i48soQGv/lxLzW/79+OtI8m8b/U30szZtJGCSPdSJNZe+YP9Wm2O8i4e8mqEdoK6rQWlasDje
	GbsJPOACX/c9yhoQP8oTlUBM+tXJmYuSA2TrMAjTadIzaQ6YeXFlWc/AqCF9VZyKCBCV+OINdyP
	mXCaFMsEndna94Kz2YIVzZMMRTuh5TtjLfPxmWVmhnLS64DiJXLbMIGtUcldzeBLLMS8vRADQUt
	9tDlnX4BEj5cvRJluQEFcp11EReWU5rQ6FpbHAILTT5VUOZTbaQV8=
X-Received: by 2002:a05:6820:5201:b0:71a:ed36:e3e2 with SMTP id 006d021491bc7-71aed36e554mr241349eaf.27.1794735196516;
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:51 -0700
Subject: [PATCH v4 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-3-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9533f3bdb949..0b8e5deb2252 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -954,23 +954,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1058,25 +1059,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0


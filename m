Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7233B6E8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750251; cv=none; b=mvKOWPg/b6xncbvwEn70NUzJezp0SMzvvwg0SGeBrWhS4pJkE86V2zgFDMI/HWXmwrNhjhaKw54awIBfkSqy8jnJoWn95x2Qhm8Cny+GP469rl8335ofbHXTiNbAxqweYQbiedHHfNHtzbOKYmYNjs7RxS8Fi8W8oLn6pG4i7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750251; c=relaxed/simple;
	bh=JhCQBqYnJdpdOwhBA8D+Toq/EXOxfct68OJa+cDfYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JHpFxukT6CrRmC33+DPqPMiYqsyg5LJqapxJlbKOVwe4oXGJtXnEK95xuPggsd2IWWtqgFrK5qqrbBHQaUEXy08pU1CMeZ9d2HjdxExn+MiNQ1phB5Ev8d1JGJceIc8xT/Qor8wpFdFwIa9CLkY8QwBHMcDIM/VxNmhTL3tQaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bElK1Wea; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bElK1Wea"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53440816851so14967731cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791750249; x=1792355049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWMpy5IfG30fH79TNnvrohqFgTd2rKQhe4mM8EE1gH4=;
        b=bElK1WeaOgXdYGopdQ1zlkiXGhfwhEhzs/L9qFIxSMGHAmxoypzSbxzgZPZ54pXOpe
         sdnaq+ia+zToE/aqB1ST//E4pxXdOM6UEEqhSEJK9C87A/M8Px4/w/Y2Zy0sf2i9DQ4s
         xcE5+rMl5MrmjSTDGnO5ihG8qYbxHv2L4JQJGtOu63CUXIKJFqte4SBss5C/AMM7/JiX
         FhguIwKxUNJhMys1kRvJLttqjBVAo5/bGrEP+X4V/idujg20QHuaTyNek5MQB+sXkyxn
         z8ywd4EqWZhygmeekVWOV1wDh3SFjDpJNo4gY0DTsJj1IDDdxqdL+4JCk6chJOA7x8pY
         HsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791750249; x=1792355049;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pWMpy5IfG30fH79TNnvrohqFgTd2rKQhe4mM8EE1gH4=;
        b=CTqHMajBV4iI9ucSMRqWrg4Wnn+/l2/F4CpeErLM0g62YNpEmNzNzn9AXPUrE446rO
         9R5Hm1pTj+f+5EkmpNbCOGlitI+0EKXfHxaPMGz8ERp3wFu/o/KDxppZm7HJV3Fjax/P
         LUzNAMxSemHuJTuRJ7FD8ptDF+CkzV67v2WkOyyEAg0GBL1IFa5zfujkCJxUHfcoi6rH
         bjldcvzMO6p8HzLMLLXjcgR6g2r+apVL3p4D9eEPDrPr3m0+m5eLmX2VD60eDq3t0m6Z
         +hZZI4+dlNIR+wbaFixnBeSoGtTYnLMiHc/VJ8VLWQh3MbDOdFJwuIfcLdmjyjaFVO9b
         AkMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX6klHQBwoEEYTMFpyGhI9fip6Py7LVVvacwgOaiFp62TQ7IBy0x1DVpDG/drCa8NqUJYmc3j8eqdvdHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU5su3iOotRNB4qkE2hebuHNKuL0od3JOwsT7n4p8m14GMw251
	NxyFhma+L+J3f58qbUazuZO09OFujc7aEgX/v8Cg2rx9tIkR2jDp6ko=
X-Gm-Gg: AYBFou3dU14C8+5hfocgphGC14OaopKnzsomcu8YY/AC8g/b/B+vWJxhY8i5PdECV2i
	QFtQ2Catc5SXPydtpN3+zgcqh9QKgN7920usu+/B+oT+MFq3XWPEZLc/n+Oe7dswZdWyBNfof6A
	CW/hT1cF7tSUk1huoOwJIonPP5xE9xp0lzJgXx+HqE68LBu8Ofs/nRm+1Kh+hSGYf5r7kGfy5Ok
	bImaKHdISBotExj7x+0PjVw4cvCxA/rLHKyFqmw1I1E3VuUnrfsdkvXdw0FIw5eMVEl+YwCmGOE
	/a1APjGYAnn5m0DJ15cweKrdBEiNE6fZtbpOqzSaweFWnxhqxCNBzVfmNxAL8QjOV5MoDx0kcNo
	XwmNuOje+uBY+jDOen1SOnBOExGhYkJ9CwC10wgURQMGNL18E/cztC2sxJ6N/5rLcdcC/dmFg0I
	/agkgLibR2J+GDr+GpJsCQsu7/Qmo7ysZQ5PYrsWX51M9jbiZ3FsFuXBl2dJhMI5XhLlCFaDsT4
	gazLleboSb6uWxNNdkQNch3sl7lNmO6+tOhkNFJL3CLKmAc5YRwmHpoPpKTplRngFIZ0cfD0cAh
	w9KtUs2EiiQJlF9uEwP4H2Ql7tkA
X-Received: by 2002:ac8:6f11:0:b0:535:f20:c828 with SMTP id d75a77b69052e-5359faee760mr145505481cf.24.1791750249415;
        Sun, 11 Oct 2026 13:24:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b46b471sm65185221cf.1.2026.10.11.13.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:24:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] dmaengine: mmp_tdma: Release IRQs before channel tasklets and storage
Date: Sun, 11 Oct 2026 16:24:06 -0400
Message-ID: <20261011202406.1869441-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shared IRQ is requested before the channels are initialized and
released after their storage is freed. Its handler can therefore
dereference NULL pointers or freed channel state. Pending tasklets can
also outlive the channels.

Initialize both channels before requesting the shared IRQ and add managed
tasklet cleanup for each channel. This releases IRQs before draining each
tasklet and freeing its channel storage.

This issue was found by static analysis.

Fixes: c6da0ba8dfc8 ("dmaengine: mmp_tdma: add mmp tdma support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

This fix overlaps with Allen Pais's DMAengine BH v3 conversion. If that
series lands first, the cleanup should use dmaengine_kill_bh().
Link: https://lore.kernel.org/r/3cd07c8bcab908e352bf1570fb7a3c24cc0fe516.1786384168.git.allen.lkml@gmail.com/

 drivers/dma/mmp_tdma.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index ba03321..965cdd6 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -353,6 +353,13 @@ static void dma_do_tasklet(struct tasklet_struct *t)
 	dmaengine_desc_get_callback_invoke(&tdmac->desc, NULL);
 }
 
+static void mmp_tdma_kill_tasklet(void *data)
+{
+	struct mmp_tdma_chan *tdmac = data;
+
+	tasklet_kill(&tdmac->tasklet);
+}
+
 static void mmp_tdma_free_descriptor(struct mmp_tdma_chan *tdmac)
 {
 	struct gen_pool *gpool;
@@ -562,6 +569,7 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 					int type, struct gen_pool *pool)
 {
 	struct mmp_tdma_chan *tdmac;
+	int ret;
 
 	if (idx >= TDMA_CHANNEL_NUM) {
 		dev_err(tdev->dev, "too many channels for device!\n");
@@ -584,6 +592,9 @@ static int mmp_tdma_chan_init(struct mmp_tdma_device *tdev,
 	tdmac->status = DMA_COMPLETE;
 	tdev->tdmac[tdmac->idx] = tdmac;
 	tasklet_setup(&tdmac->tasklet, dma_do_tasklet);
+	ret = devm_add_action_or_reset(tdev->dev, mmp_tdma_kill_tasklet, tdmac);
+	if (ret)
+		return ret;
 
 	/* add the channel to tdma_chan list */
 	list_add_tail(&tdmac->chan.device_node,
@@ -666,14 +677,6 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	if (irq_num != chan_num) {
-		irq = platform_get_irq(pdev, 0);
-		ret = devm_request_irq(&pdev->dev, irq,
-			mmp_tdma_int_handler, IRQF_SHARED, "tdma", tdev);
-		if (ret)
-			return ret;
-	}
-
 	/* initialize channel parameters */
 	for (i = 0; i < chan_num; i++) {
 		irq = (irq_num != chan_num) ? 0 : platform_get_irq(pdev, i);
@@ -682,6 +685,15 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/* Release the shared IRQ before draining and freeing the channels. */
+	if (irq_num != chan_num) {
+		irq = platform_get_irq(pdev, 0);
+		ret = devm_request_irq(&pdev->dev, irq, mmp_tdma_int_handler,
+				       IRQF_SHARED, "tdma", tdev);
+		if (ret)
+			return ret;
+	}
+
 	dma_cap_set(DMA_SLAVE, tdev->device.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdev->device.cap_mask);
 	tdev->device.dev = &pdev->dev;

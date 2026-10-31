Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406240;
	b=eFvmil2Skwk2iTdbQ3SkfT7s2CJ//VqykAfGwpabKDBcj8fQQ1Q0p808IrKOmJyPxCpJ
	 zJV4F73nay2NqXhQbJAIRu1zEbvlbQfLJyO0MKBjYa6rGqgbyczjNM6/enVyr2A7/+V1k
	 dVnkUl24U/waV8Jag0yE/QmqaSx8euBZ07txxL6wvG9o1lqWpDUC+7eSiZAZU/5vFvFiM
	 IDmsDpRzXnVwbMeIyP0SCmXdHWLTdD2hMT7fTGFMbAAEnToFivw8rIlz2OpUUPCY4aXoq
	 E2eobigTm6bas0XjVsLdSuOclUiG1KQI1ynN3nPh8lt3+0kCsmehrzNKeGUrxfrxW/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406240;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ:X-Apple-Category-Label;
	bh=tCjwIW2B14r9+tpychQl3vwfLcel46yRFVsrv96k1e4=;
	b=ujmxRh3yzrxEof6sEjakpK8HYGXJAuB1ifi6Sr0Mb05lZm2yHgVeXoc8HNWD4CvWYYFy
	 2ON8M94bAcOl5E1GtafpYFEy8sn+q5C4xC8MKacjDlvmWdkK88oT9yjQMVPa0GwKzr5nV
	 0gzV3p1fKsAkYEWNqSfbp1Uu74jRFrNiU8ZKElIHdcC3lkoEVvS3H+5Eh1ZHEpe723y5N
	 KNjQrsqjJ7PnEw3DdJ8ha97laWlhHfmm1BMRaB43Y2Gx4TUHwx2dQ4IXTCGswP4ZdZcfB
	 f3b5ire4EgZ/2v2zcp/+hWStHelLMEj3qiLpaNeqgPlWEU/McDK9VDYvW59jgMXjBsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=xfLEzIza;
	arc=none smtp.remote-ip=57.103.74.153
Received: from outbound.ms.icloud.com (ms-2004c-snip4-2.eps.apple.com [57.103.74.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7CB606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=xfLEzIza
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id 0588318002DF;
	Sat, 31 Oct 2026 00:23:56 +0000 (UTC)
X-ICL-RepId: 01a18f57-78cf-75ba-be4c-3f1dc6aaab38
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ9PHV8ZWQBDF0kLWBcOVk1TF1ZDUxFTFFY4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgVQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOQglKBVwHWANACUoAXgVFAUMPSApABEZYH1xWVxdWD10wUBtfAkIPHBNWFQ1NQxJCFQQRUAFYHlY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793406239; x=1824942239; bh=tCjwIW2B14r9+tpychQl3vwfLcel46yRFVsrv96k1e4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=xfLEzIzabA9OJflzAu1HhsLK0yab+wfLM6VpJnT4QRmdyp4zdceh93MGTTEjOQxGCk5H8Ro1FkKBwuEzubDiQ9yL8BZWBEIlkK4C2RdGj+Kgw2abpAN0g7DLKAGmzauaWCG2dJv85vY9rB46+ZfuEeg/HfpZgtqaN+0LxOSQPMD6koPcq6tKg+mLxCQbwNf32VVoOawqP48I2MrmiFOtAE9JvuU7pNaXqPkORkSCSlUY4gTTFltkzeN47xRpXgJM/jGvWb5WUtZBdrBFoVvI9YwSxJjIqtPDYQHJJXsWzTUupVqL4fy4EBud2lXBvHAp2hlFeq0ArVJfTK4lRzloww==
Received: from localhost.localdomain (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id ED91C180013E;
	Sat, 31 Oct 2026 00:23:55 +0000 (UTC)
From: Joe Dzado <joe.dzado@icloud.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Yong Zhi <yong.zhi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Dzado <joe.dzado@icloud.com>
Subject: [PATCH 2/3] media: ipu3-cio2: serialise concurrent stream start and stop
Date: Fri, 30 Oct 2026 18:23:31 -0600
Message-ID: <20261031002332.33609-3-joe.dzado@icloud.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031002332.33609-1-joe.dzado@icloud.com>
References: <20261031002332.33609-1-joe.dzado@icloud.com>
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
X-Authority-Info-Out: v=2.4 cv=feagCkQF c=1 sm=1 tr=0 ts=6ae5351d
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=VxgYvlp6VsgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=TudP4A0ZiVbjNvBWJ0cA:9 a=uWAW4Bjdv7MYVeHw:21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMSBTYWx0ZWRfX4F8QBxLGbIE9
 skFJ8edtrEpWA0cz31fUzX4TtaA3dakn120DPArrjLETudQQu4gSPU/YdAHsJ/aLCUOgOkty4Xw
 zvh4jmULUIrU5ZgkQnJQShcvNthI71plVy/kFETAIwsbStlCa8G3zUFEpEkDE/qLJ1GIND8Z3EM
 aYvWHz6rbMKa2k7g7CDLAuMSwWcB48MCjKw9N2x+f9x8OKu9JQHWtSK8IArZ6VLkJswYvuvc85r
 0EQmWeqRd+ADrd7YzflzP0kERM1m9RHPKap8q53oGmyChGsiACLSvTi5yBoVVKHDh/SrrKRPsGM
 L65OtxDhvjGlFM4IOutq1P58IWBnL/jkIQKBkkYHrwTabaqOwjIm17mf0wQuMk=
X-Proofpoint-GUID: 9rEBo1Kt8as3U-SKtz2ucBulVqo-qmFB
X-Proofpoint-ORIG-GUID: 9rEBo1Kt8as3U-SKtz2ucBulVqo-qmFB
X-JNJ: AAAAAAAB4FjaD2AG3bHcfD1n72qalztdLPP3ZiXJ+N+o5N/mQ3e7sRNkmYmBzi2hRiSyLE
 +3qx9OssnCJcTpjGdrElKJ9Wepwnntn2w+eofxF9r1RiRn7Nul0UELlNXkHhZdWUwARfry
 3EsvZCObydRFo06oJgBGfxXcv+RIN43AUNYheTS20S60poWcuKIxYZb32jvbL4hegFcMWr
 SPHLvSIk+vqWW0EiiG6KaRkzS9eXUzKZslTbTd6kc4FqvD5/AG7bImq8BzvVwL808KR9ey
 GZ0Y3lPBqpWHabDwoOFtv1wO4c4wQk4Upt2Eg8qEnsSdTUaGkvmlfH8gaayhJJxOSv1WWN
 VWIUSm6U1FFl86bgDW+5rCFY8DMLkuL1JgZzfJ6yVG+b/nlO2qb2V+84lZ+djXpvlotaxs
 ViCS2PLfoYpEHpwev9e6X7YgcCl+Tgtr1rFNAK3G2mjwX0mIWl66d/HZXvFu/WFIOdJWV6
 K+gKECJ+hR4JATfmbITmfa6GJ17citiYTX46eY4ikl4mSbHIqWCXXlKUOdtXnLR6rDi7Gm
 aC1lZlpoZXmGBxsgr5G/G23T+nkqFk1OCD/NiRU/d3XbhKtd2U7a57ppYe9fs5MkNBiePp
 yanihumv5p75n+KKmQcIOTAwuBrJWv61xDDukj+qA1Zl01fcEhyI0yOHjolyvzfVlbVTYZ
 pEU91a/sGOhkey1RdoLoEsf+usMBCamjP5rK3hEN1C8UXN0zq4zomkPq6+8GzOKzYKMqyJ
 f5cCBDhtDkim2EDsdZ3yiFzCbXbfTI2vMcl084p0a76ikCAwH+lcEOeM1Z7VGPFy+dgiDr
 ANszi4aFwCPQnVkWIg==
X-Apple-Category-Label: MTM3MDgxMjY5NTokY2F0ZWdvcnkkX1BlcnNvbmFsLA==

Make cio2_hw_init()/cio2_hw_exit() safe to call while another queue is
already streaming. A new hw_lock serialises channel setup/teardown and
the streaming bookkeeping. cio2_hw_init() writes the block-shared setup
(PBM watermarks/arbiter, HPLL/ISCLK, CGC, LTR, full DMA-channel reset,
global interrupt-status clear) only for the first queue brought up, and
preserves the other channels' INT_EN/INT_STS bits otherwise.
cio2_hw_exit() aborts only its own port and clears only its own channel
interrupts rather than tearing down every port.

Still single-channel in practice (every queue maps to channel 0), so no
functional change; this only adds the locking and shared-state guards.
Signed-off-by: Joe Dzado <joe.dzado@icloud.com>

---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 154 ++++++++++++++---------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |   2 +
 2 files changed, 94 insertions(+), 62 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 06ce58e23..071c5ea4a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -371,6 +371,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	u8 lanes, csi2bus = q->csi2.port;
 	u8 sensor_vc = SENSOR_VIR_CH_DFLT;
 	const unsigned int chan = q->dma_chan;
+	/* another queue already streaming: leave shared blocks alone */
+	const bool first = !cio2->streaming;
 	struct cio2_csi2_timing timing = { 0 };
 	int i, r;
 
@@ -402,30 +404,34 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 			CIO2_REG_CSIRX_DLY_CNT_SETTLE(i));
 	}
 
-	writel(CIO2_PBM_WMCTRL1_MIN_2CK |
-	       CIO2_PBM_WMCTRL1_MID1_2CK |
-	       CIO2_PBM_WMCTRL1_MID2_2CK, base + CIO2_REG_PBM_WMCTRL1);
-	writel(CIO2_PBM_WMCTRL2_HWM_2CK << CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT |
-	       CIO2_PBM_WMCTRL2_LWM_2CK << CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT |
-	       CIO2_PBM_WMCTRL2_OBFFWM_2CK <<
-	       CIO2_PBM_WMCTRL2_OBFFWM_2CK_SHIFT |
-	       CIO2_PBM_WMCTRL2_TRANSDYN << CIO2_PBM_WMCTRL2_TRANSDYN_SHIFT |
-	       CIO2_PBM_WMCTRL2_OBFF_MEM_EN, base + CIO2_REG_PBM_WMCTRL2);
-	writel(CIO2_PBM_ARB_CTRL_LANES_DIV <<
-	       CIO2_PBM_ARB_CTRL_LANES_DIV_SHIFT |
-	       CIO2_PBM_ARB_CTRL_LE_EN |
-	       CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN <<
-	       CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN_SHIFT |
-	       CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP <<
-	       CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP_SHIFT,
-	       base + CIO2_REG_PBM_ARB_CTRL);
+	if (first) {
+		writel(CIO2_PBM_WMCTRL1_MIN_2CK |
+		       CIO2_PBM_WMCTRL1_MID1_2CK |
+		       CIO2_PBM_WMCTRL1_MID2_2CK, base + CIO2_REG_PBM_WMCTRL1);
+		writel(CIO2_PBM_WMCTRL2_HWM_2CK << CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT |
+		       CIO2_PBM_WMCTRL2_LWM_2CK << CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT |
+		       CIO2_PBM_WMCTRL2_OBFFWM_2CK <<
+		       CIO2_PBM_WMCTRL2_OBFFWM_2CK_SHIFT |
+		       CIO2_PBM_WMCTRL2_TRANSDYN << CIO2_PBM_WMCTRL2_TRANSDYN_SHIFT |
+		       CIO2_PBM_WMCTRL2_OBFF_MEM_EN, base + CIO2_REG_PBM_WMCTRL2);
+		writel(CIO2_PBM_ARB_CTRL_LANES_DIV <<
+		       CIO2_PBM_ARB_CTRL_LANES_DIV_SHIFT |
+		       CIO2_PBM_ARB_CTRL_LE_EN |
+		       CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN <<
+		       CIO2_PBM_ARB_CTRL_PLL_POST_SHTDN_SHIFT |
+		       CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP <<
+		       CIO2_PBM_ARB_CTRL_PLL_AHD_WK_UP_SHIFT,
+		       base + CIO2_REG_PBM_ARB_CTRL);
+	}
 	writel(CIO2_CSIRX_STATUS_DLANE_HS_MASK,
 	       q->csi_rx_base + CIO2_REG_CSIRX_STATUS_DLANE_HS);
 	writel(CIO2_CSIRX_STATUS_DLANE_LP_MASK,
 	       q->csi_rx_base + CIO2_REG_CSIRX_STATUS_DLANE_LP);
 
-	writel(CIO2_FB_HPLL_FREQ, base + CIO2_REG_FB_HPLL_FREQ);
-	writel(CIO2_ISCLK_RATIO, base + CIO2_REG_ISCLK_RATIO);
+	if (first) {
+		writel(CIO2_FB_HPLL_FREQ, base + CIO2_REG_FB_HPLL_FREQ);
+		writel(CIO2_ISCLK_RATIO, base + CIO2_REG_ISCLK_RATIO);
+	}
 
 	/* Configure MIPI backend */
 	for (i = 0; i < NUM_VCS; i++)
@@ -445,8 +451,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_LEVEL_NOT_PULSE);
 	writel(CIO2_INT_EN_EXT_OE_MASK, base + CIO2_REG_INT_EN_EXT_OE);
 
-	writel(CIO2_REG_INT_EN_IRQ | CIO2_INT_IOC(chan) |
-	       CIO2_REG_INT_EN_IOS(chan),
+	writel((first ? 0 : readl(base + CIO2_REG_INT_EN)) |
+	       CIO2_REG_INT_EN_IRQ | CIO2_INT_IOC(chan) | CIO2_REG_INT_EN_IOS(chan),
 	       base + CIO2_REG_INT_EN);
 
 	writel((CIO2_PXM_PXF_FMT_CFG_BPP_10 | CIO2_PXM_PXF_FMT_CFG_PCK_64B)
@@ -461,35 +467,41 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(chan, base + CIO2_REG_PXM_SID2BID0(csi2bus));
 
 	writel(lanes, q->csi_rx_base + CIO2_REG_CSIRX_NOF_ENABLED_LANES);
-	writel(CIO2_CGC_PRIM_TGE |
-	       CIO2_CGC_SIDE_TGE |
-	       CIO2_CGC_XOSC_TGE |
-	       CIO2_CGC_D3I3_TGE |
-	       CIO2_CGC_CSI2_INTERFRAME_TGE |
-	       CIO2_CGC_CSI2_PORT_DCGE |
-	       CIO2_CGC_SIDE_DCGE |
-	       CIO2_CGC_PRIM_DCGE |
-	       CIO2_CGC_ROSC_DCGE |
-	       CIO2_CGC_XOSC_DCGE |
-	       CIO2_CGC_CLKGATE_HOLDOFF << CIO2_CGC_CLKGATE_HOLDOFF_SHIFT |
-	       CIO2_CGC_CSI_CLKGATE_HOLDOFF
-	       << CIO2_CGC_CSI_CLKGATE_HOLDOFF_SHIFT, base + CIO2_REG_CGC);
-	writel(CIO2_LTRCTRL_LTRDYNEN, base + CIO2_REG_LTRCTRL);
-	writel(CIO2_LTRVAL0_VAL << CIO2_LTRVAL02_VAL_SHIFT |
-	       CIO2_LTRVAL0_SCALE << CIO2_LTRVAL02_SCALE_SHIFT |
-	       CIO2_LTRVAL1_VAL << CIO2_LTRVAL13_VAL_SHIFT |
-	       CIO2_LTRVAL1_SCALE << CIO2_LTRVAL13_SCALE_SHIFT,
-	       base + CIO2_REG_LTRVAL01);
-	writel(CIO2_LTRVAL2_VAL << CIO2_LTRVAL02_VAL_SHIFT |
-	       CIO2_LTRVAL2_SCALE << CIO2_LTRVAL02_SCALE_SHIFT |
-	       CIO2_LTRVAL3_VAL << CIO2_LTRVAL13_VAL_SHIFT |
-	       CIO2_LTRVAL3_SCALE << CIO2_LTRVAL13_SCALE_SHIFT,
-	       base + CIO2_REG_LTRVAL23);
-
-	for (i = 0; i < CIO2_NUM_DMA_CHAN; i++) {
-		writel(0, base + CIO2_REG_CDMABA(i));
-		writel(0, base + CIO2_REG_CDMAC0(i));
-		writel(0, base + CIO2_REG_CDMAC1(i));
+	if (first) {
+		writel(CIO2_CGC_PRIM_TGE |
+		       CIO2_CGC_SIDE_TGE |
+		       CIO2_CGC_XOSC_TGE |
+		       CIO2_CGC_D3I3_TGE |
+		       CIO2_CGC_CSI2_INTERFRAME_TGE |
+		       CIO2_CGC_CSI2_PORT_DCGE |
+		       CIO2_CGC_SIDE_DCGE |
+		       CIO2_CGC_PRIM_DCGE |
+		       CIO2_CGC_ROSC_DCGE |
+		       CIO2_CGC_XOSC_DCGE |
+		       CIO2_CGC_CLKGATE_HOLDOFF << CIO2_CGC_CLKGATE_HOLDOFF_SHIFT |
+		       CIO2_CGC_CSI_CLKGATE_HOLDOFF
+		       << CIO2_CGC_CSI_CLKGATE_HOLDOFF_SHIFT, base + CIO2_REG_CGC);
+		writel(CIO2_LTRCTRL_LTRDYNEN, base + CIO2_REG_LTRCTRL);
+		writel(CIO2_LTRVAL0_VAL << CIO2_LTRVAL02_VAL_SHIFT |
+		       CIO2_LTRVAL0_SCALE << CIO2_LTRVAL02_SCALE_SHIFT |
+		       CIO2_LTRVAL1_VAL << CIO2_LTRVAL13_VAL_SHIFT |
+		       CIO2_LTRVAL1_SCALE << CIO2_LTRVAL13_SCALE_SHIFT,
+		       base + CIO2_REG_LTRVAL01);
+		writel(CIO2_LTRVAL2_VAL << CIO2_LTRVAL02_VAL_SHIFT |
+		       CIO2_LTRVAL2_SCALE << CIO2_LTRVAL02_SCALE_SHIFT |
+		       CIO2_LTRVAL3_VAL << CIO2_LTRVAL13_VAL_SHIFT |
+		       CIO2_LTRVAL3_SCALE << CIO2_LTRVAL13_SCALE_SHIFT,
+		       base + CIO2_REG_LTRVAL23);
+
+		for (i = 0; i < CIO2_NUM_DMA_CHAN; i++) {
+			writel(0, base + CIO2_REG_CDMABA(i));
+			writel(0, base + CIO2_REG_CDMAC0(i));
+			writel(0, base + CIO2_REG_CDMAC1(i));
+		}
+	} else {
+		writel(0, base + CIO2_REG_CDMABA(chan));
+		writel(0, base + CIO2_REG_CDMAC0(chan));
+		writel(0, base + CIO2_REG_CDMAC1(chan));
 	}
 
 	/* Enable DMA */
@@ -506,7 +518,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(1 << CIO2_CDMAC1_LINENUMUPDATE_SHIFT,
 	       base + CIO2_REG_CDMAC1(chan));
 
-	writel(0, base + CIO2_REG_PBM_FOPN_ABORT);
+	writel(first ? 0 : readl(base + CIO2_REG_PBM_FOPN_ABORT) &
+	       ~CIO2_PBM_FOPN_ABORT(csi2bus), base + CIO2_REG_PBM_FOPN_ABORT);
 
 	writel(CIO2_PXM_FRF_CFG_CRC_TH << CIO2_PXM_FRF_CFG_CRC_TH_SHIFT |
 	       CIO2_PXM_FRF_CFG_MSK_ECC_DPHY_NR |
@@ -516,9 +529,15 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 	/* Clear interrupts */
 	writel(CIO2_IRQCTRL_MASK, q->csi_rx_base + CIO2_REG_IRQCTRL_CLEAR);
-	writel(~0, base + CIO2_REG_INT_STS_EXT_OE);
-	writel(~0, base + CIO2_REG_INT_STS_EXT_IE);
-	writel(~0, base + CIO2_REG_INT_STS);
+	if (first) {
+		writel(~0, base + CIO2_REG_INT_STS_EXT_OE);
+		writel(~0, base + CIO2_REG_INT_STS_EXT_IE);
+		writel(~0, base + CIO2_REG_INT_STS);
+	} else {	/* don't eat the other streams' pending interrupts */
+		writel(0xffU << (8U * csi2bus), base + CIO2_REG_INT_STS_EXT_IE);
+		writel(CIO2_INT_IOC(chan) | CIO2_INT_IOS_IOLN(chan),
+		       base + CIO2_REG_INT_STS);
+	}
 
 	/* Enable devices, starting from the last device in the pipe */
 	writel(1, q->csi_rx_base + CIO2_REG_MIPIBE_ENABLE);
@@ -531,8 +550,7 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 {
 	struct device *dev = &cio2->pci_dev->dev;
 	void __iomem *const base = cio2->base;
-	unsigned int i;
-	const unsigned int chan = q->dma_chan;
+	const unsigned int chan = q->dma_chan, port = q->csi2.port;
 	u32 value;
 	int ret;
 
@@ -550,12 +568,14 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	if (ret)
 		dev_err(dev, "DMA %u can not be halted\n", chan);
 
-	for (i = 0; i < CIO2_NUM_PORTS; i++) {
-		writel(readl(base + CIO2_REG_PXM_FRF_CFG(i)) |
-		       CIO2_PXM_FRF_CFG_ABORT, base + CIO2_REG_PXM_FRF_CFG(i));
-		writel(readl(base + CIO2_REG_PBM_FOPN_ABORT) |
-		       CIO2_PBM_FOPN_ABORT(i), base + CIO2_REG_PBM_FOPN_ABORT);
-	}
+	/* only this queue's port: others may still be streaming */
+	writel(readl(base + CIO2_REG_PXM_FRF_CFG(port)) |
+	       CIO2_PXM_FRF_CFG_ABORT, base + CIO2_REG_PXM_FRF_CFG(port));
+	writel(readl(base + CIO2_REG_PBM_FOPN_ABORT) |
+	       CIO2_PBM_FOPN_ABORT(port), base + CIO2_REG_PBM_FOPN_ABORT);
+	writel(readl(base + CIO2_REG_INT_EN) &
+	       ~(CIO2_INT_IOC(chan) | CIO2_REG_INT_EN_IOS(chan)),
+	       base + CIO2_REG_INT_EN);
 }
 
 static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
@@ -1017,14 +1037,17 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (r)
 		goto fail_pipeline;
 
+	mutex_lock(&cio2->hw_lock);
 	cio2->chan_queue[q->dma_chan] = q;
 	r = cio2_hw_init(cio2, q);
 	if (r) {
 		cio2->chan_queue[q->dma_chan] = NULL;
+		mutex_unlock(&cio2->hw_lock);
 		goto fail_hw;
 	}
 	cio2->streaming++;
 	q->streaming = true;
+	mutex_unlock(&cio2->hw_lock);
 
 	/* Start streaming on sensor */
 	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
@@ -1034,11 +1057,13 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	return 0;
 
 fail_csi2_subdev:
+	mutex_lock(&cio2->hw_lock);
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
 	cio2->chan_queue[q->dma_chan] = NULL;
 	cio2->streaming--;
 	q->streaming = false;
+	mutex_unlock(&cio2->hw_lock);
 fail_hw:
 	video_device_pipeline_stop(&q->vdev);
 fail_pipeline:
@@ -1058,11 +1083,13 @@ static void cio2_vb2_stop_streaming(struct vb2_queue *vq)
 	if (v4l2_subdev_call(q->sensor, video, s_stream, 0))
 		dev_err(dev, "failed to stop sensor streaming\n");
 
+	mutex_lock(&cio2->hw_lock);
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
 	cio2->chan_queue[q->dma_chan] = NULL;
 	cio2->streaming--;
 	q->streaming = false;
+	mutex_unlock(&cio2->hw_lock);
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_ERROR);
 	video_device_pipeline_stop(&q->vdev);
 	pm_runtime_put(dev);
@@ -1731,6 +1758,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 		return r;
 
 	mutex_init(&cio2->lock);
+	mutex_init(&cio2->hw_lock);
 
 	cio2->media_dev.dev = dev;
 	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
@@ -1783,6 +1811,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	media_device_cleanup(&cio2->media_dev);
 fail_mutex_destroy:
 	mutex_destroy(&cio2->lock);
+	mutex_destroy(&cio2->hw_lock);
 	cio2_fbpt_exit_dummy(cio2);
 
 	return r;
@@ -1800,6 +1829,7 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
 	v4l2_device_unregister(&cio2->v4l2_dev);
 	media_device_cleanup(&cio2->media_dev);
 	mutex_destroy(&cio2->lock);
+	mutex_destroy(&cio2->hw_lock);
 
 	pm_runtime_forbid(&pci_dev->dev);
 	pm_runtime_get_noresume(&pci_dev->dev);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index a6e363a4b..1d169fa1e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -381,6 +381,8 @@ struct cio2_device {
 	struct cio2_queue *chan_queue[CIO2_NUM_DMA_CHAN];
 	/* mutex to be used by video_device */
 	struct mutex lock;
+	/* serialises hw_init/hw_exit of concurrent queues */
+	struct mutex hw_lock;
 
 	unsigned int streaming;	/* number of streaming queues */
 	struct v4l2_async_notifier notifier;
-- 
2.56.0


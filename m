Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406239;
	b=AO5vgGje/cW8T24muxPpnZBnh6WQqRNwdw+aMc0ClCzq3O/g0/O1KSlj8jH09MEO3Bv1
	 PmUfLNWl/MFh5k9esKKuSoei80cZ4h+gzdCvUawQrgbOKk4G6UGQB662mncLHVg5q2HyD
	 jHO5lzYJQ5+zYeEYP6L1MnvxZyZrFNxYo1lOBGpzPHhV+038fmYqY1+V8OjRkeEe3DtQs
	 11FYk5uo37xWRocof/DGxiYBvA731mFmtZl2jhiutIUHLfN64T8ddU4xIpS+3EAVQfwJ+
	 kPkxeacffBj5ilvTdE0cIveJN6+zOQ7YB7It21oRY70ztJb+zhPXhg0MHtpTteGefuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406239;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-JNJ:X-Apple-Category-Label;
	bh=8pF6aXMmv6e7ktIt7HmcV/JZVdbB9BQMB9Ddrv2T8tQ=;
	b=NL/335hA2217TpTMcL6ChZOQlSd+sxxsqc8lpb63R08PQLDhFr5K6voaluLw+3mD0M18
	 OfBaakICzhk0luvzhVdzL179rRVhbujMyw+MbNynJTpqCXzu6oDE2sQLwtaD8etWx99Uf
	 jhNZE7IRw3y/jYL8Mec1ZR485USJ3/zOFnV+9GcV6vkVYGhTEGHfw/Ub3k6deKdSueQK0
	 Bz/ac74xs0UTnEZDLiftawueg/GkPYZ8iAC4bnaGZOIB4m50dk0UNQRQETRiY6AaKSWsK
	 d2TTehuvCJ/X2x3OKDQ8FmUcWWvPFnns7IpAACRpQJHw5JKFBIdi8sX8WFzTIH0tcHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b="I6zyoUk/";
	arc=none smtp.remote-ip=57.103.74.141
Received: from outbound.ms.icloud.com (ms-2004g-snip4-11.eps.apple.com [57.103.74.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5F606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD5F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=I6zyoUk/
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id 216D018000A7;
	Sat, 31 Oct 2026 00:23:54 +0000 (UTC)
X-ICL-RepId: 01a18f57-716e-712a-92a1-f5cd62bd7398
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ9PHV8ZWQBDF0kLWBcOVk1TF1ZDUxFTFFY4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgVQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOQglKBVwHWANACUoAXgVFAUMPSApABUZYH1xWVxdWD10wUBtfAkIPHBNWFQ1NQxJCFQQRUAFYHlY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793406237; x=1824942237; bh=8pF6aXMmv6e7ktIt7HmcV/JZVdbB9BQMB9Ddrv2T8tQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=I6zyoUk/21Bx2ijqxOD9fOtctoJrUeCCA+Xq/gKjO/WTS8mLQcrUWrOtkUBWAppq3HKAoBwZTrwX+TPBkaBavQfzyaB5zpd4r7TI5swYb5Bhw8I0WYIDk+WsTBTRJjuIbR2Y6rWtxZzl4wEOSS15gMMd0CDbWs31djWZ/3m7pBuUHNKlim2JkRhG6j/DnYg+xPDtSMupLJd9WKi1tHmkzM2KZ/LAk6nJR3G9FfemOu8jOsnkUiTWNYcoPKk9OED4eknlcUzSQ4be2CCOBDZ2MR2ZPXstSZqdgTRCfdjzlyQM3FPsRHFwv1r4H0WYBxz/BCvSboCJ9Es1uDXwSBh+TQ==
Received: from localhost.localdomain (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id 1BF0118002C9;
	Sat, 31 Oct 2026 00:23:54 +0000 (UTC)
From: Joe Dzado <joe.dzado@icloud.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Yong Zhi <yong.zhi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Dzado <joe.dzado@icloud.com>
Subject: [PATCH 1/3] media: ipu3-cio2: track the streaming queue by DMA channel
Date: Fri, 30 Oct 2026 18:23:30 -0600
Message-ID: <20261031002332.33609-2-joe.dzado@icloud.com>
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
X-Authority-Info-Out: v=2.4 cv=feagCkQF c=1 sm=1 tr=0 ts=6ae5351b
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=VxgYvlp6VsgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=MSeu1ThIxXXoLpbdsGwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMSBTYWx0ZWRfX42Q/nWU/qXXX
 M1/1U976dBq3cMetahBmoNvhWi35ZP/+AG79iuJFva3rnHK9cW1wQu6iBlTxHhzSKL9VsBW7m+7
 Lf/QRQk9V2kx7BRIbB2vmeHPCE6h7shA79Z9ePmqmr4CP8FvnFAmkLXeBoFCEz1AqDvmafByFyI
 qgbmqfdqlgA2jjCjCfJEgOwV94R5FGh1TCG3KAdWJx2+X7FI+HIe0nC/qx1t3717M9dXDRFoorv
 ox8GSF4gveltABIAcnDfikk0c2DItEHNNmHaxMTdRU/4M+c1BNGa+zKjomD02RB3HrOOvXYHk1M
 4RlBS0esPRSOQvf7sb2+qhAGdprJf9nfH06XJ3Cjcb7hjJyhA5x0se6cg8G4ww=
X-Proofpoint-GUID: A_Ew6aGMWcmxlhrSKvQu4qIgXjjASZn2
X-Proofpoint-ORIG-GUID: A_Ew6aGMWcmxlhrSKvQu4qIgXjjASZn2
X-JNJ: AAAAAAABaiAGSVXq9FyUl4OggGsnc83l1ttmJcJMqVXTapHMCC1lsxX0HNLOPeOfJRQ2YT
 1j7FH7PN8Z6DAFoxQR3ua8Dfh2MNnwRYte6xpXlm7gJBuQ+dpQlOR0vfUN8yU21YUreWiG
 QI0EaoNZbM/5HAARkhnXiqS4sZwrYplX+gAzuM47EA676fZqRiryjaslIGsi+s5Gm79mvL
 kBF3LYPitoA75UxtUBHk4amUD0TN1xAusSKwVqrACeBQUxr1iAR/EPGn8CsQxFHCKGkeCl
 HMRo0DWA91iY/5uWbE//VU5NxpbCNDxr/IQw8gAl9qFP78excdizR7JBP61fLD/ySh1/kL
 EsQH4pAm4gy5V4Cz/GL38DVJhIlt7NMkQ3S8lzUVvdULaSlnmy9Bdu+KjTW811HPimjPDi
 Bz5bX0dPsaNNlz4JkV0klD7F2Pj79fJI/CFsac3iEkYVugkr8dsaIGjGwqMtEMQMODGISW
 DC4upsomJfrDFLocD+G5T5z2eOT9KHme9+7muQkuJlbNNUiA0xJjLe0rzVULih8lI2N/5B
 TJiNDJAyWyiJdrBxC/Uwy+FIwhnrYp6ok3lQZg6pj/DusXlI1o5ly/+fQNNF0+yuW4D1TH
 BCKiHQ0iomTWNptYO65Azq04XJLCr1of8zovMCT+UwIEML+9DOg9TJtNl7sBLge7PdH4sm
 Yb9gSaMQKGlsQtID4Plmt90EY0OK3L57MD7vzqgUhUHxjnb8I9LsFij1ct6/7aarG8re8o
 X5vhVJXqW2hT8VheErRHGI+LdURlN4G/SIcvTEnMjcgVbdQOR6h7Azqe4rUbVpG3ml5j+7
 Of0k6L+TQNg=
X-Apple-Category-Label: MTM3MDgxMjY5NTokY2F0ZWdvcnkkX1BlcnNvbmFsLA==

Prepare for more than one CSI-2 port streaming at once. Replace the
single cur_queue pointer with a chan_queue[] map indexed by DMA channel,
and give each queue a dma_chan it owns (cio2_queue_dma_chan() still
returns CIO2_DMA_CHAN for every port, so only one channel is used for
now). The IRQ handler, buffer-done and SOF paths dispatch via
chan_queue[] instead of assuming cur_queue, and all register accesses
use the queue's channel.

cio2->streaming becomes a count of streaming queues plus a per-queue
flag, and suspend/resume iterate the queues instead of the lone
cur_queue. No functional change: a single stream still uses channel 0.
Signed-off-by: Joe Dzado <joe.dzado@icloud.com>

---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 125 +++++++++++++++--------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |   8 +-
 2 files changed, 88 insertions(+), 45 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 4d2b23129..06ce58e23 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -350,6 +350,12 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 	return 0;
 };
 
+/* Each queue (CSI-2 port) owns one DMA channel. */
+static unsigned int cio2_queue_dma_chan(unsigned int port)
+{
+	return CIO2_DMA_CHAN;
+}
+
 static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 {
 	static const int NUM_VCS = 4;
@@ -364,6 +370,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	void __iomem *const base = cio2->base;
 	u8 lanes, csi2bus = q->csi2.port;
 	u8 sensor_vc = SENSOR_VIR_CH_DFLT;
+	const unsigned int chan = q->dma_chan;
 	struct cio2_csi2_timing timing = { 0 };
 	int i, r;
 
@@ -438,8 +445,8 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(0, q->csi_rx_base + CIO2_REG_IRQCTRL_LEVEL_NOT_PULSE);
 	writel(CIO2_INT_EN_EXT_OE_MASK, base + CIO2_REG_INT_EN_EXT_OE);
 
-	writel(CIO2_REG_INT_EN_IRQ | CIO2_INT_IOC(CIO2_DMA_CHAN) |
-	       CIO2_REG_INT_EN_IOS(CIO2_DMA_CHAN),
+	writel(CIO2_REG_INT_EN_IRQ | CIO2_INT_IOC(chan) |
+	       CIO2_REG_INT_EN_IOS(chan),
 	       base + CIO2_REG_INT_EN);
 
 	writel((CIO2_PXM_PXF_FMT_CFG_BPP_10 | CIO2_PXM_PXF_FMT_CFG_PCK_64B)
@@ -451,7 +458,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	       q->csi_rx_base + CIO2_REG_MIPIBE_LP_LUT_ENTRY(ENTRY));
 	writel(0, q->csi_rx_base + CIO2_REG_MIPIBE_COMP_FORMAT(sensor_vc));
 	writel(0, q->csi_rx_base + CIO2_REG_MIPIBE_FORCE_RAW8);
-	writel(0, base + CIO2_REG_PXM_SID2BID0(csi2bus));
+	writel(chan, base + CIO2_REG_PXM_SID2BID0(csi2bus));
 
 	writel(lanes, q->csi_rx_base + CIO2_REG_CSIRX_NOF_ENABLED_LANES);
 	writel(CIO2_CGC_PRIM_TGE |
@@ -486,7 +493,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	}
 
 	/* Enable DMA */
-	writel(PFN_DOWN(q->fbpt_bus_addr), base + CIO2_REG_CDMABA(CIO2_DMA_CHAN));
+	writel(PFN_DOWN(q->fbpt_bus_addr), base + CIO2_REG_CDMABA(chan));
 
 	writel(num_buffers1 << CIO2_CDMAC0_FBPT_LEN_SHIFT |
 	       FBPT_WIDTH << CIO2_CDMAC0_FBPT_WIDTH_SHIFT |
@@ -494,10 +501,10 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
 	       CIO2_CDMAC0_FBPT_UPDATE_FIFO_FULL |
 	       CIO2_CDMAC0_DMA_EN |
 	       CIO2_CDMAC0_DMA_INTR_ON_FS |
-	       CIO2_CDMAC0_DMA_HALTED, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
+	       CIO2_CDMAC0_DMA_HALTED, base + CIO2_REG_CDMAC0(chan));
 
 	writel(1 << CIO2_CDMAC1_LINENUMUPDATE_SHIFT,
-	       base + CIO2_REG_CDMAC1(CIO2_DMA_CHAN));
+	       base + CIO2_REG_CDMAC1(chan));
 
 	writel(0, base + CIO2_REG_PBM_FOPN_ABORT);
 
@@ -525,6 +532,7 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	struct device *dev = &cio2->pci_dev->dev;
 	void __iomem *const base = cio2->base;
 	unsigned int i;
+	const unsigned int chan = q->dma_chan;
 	u32 value;
 	int ret;
 
@@ -535,12 +543,12 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 	writel(0, q->csi_rx_base + CIO2_REG_MIPIBE_ENABLE);
 
 	/* Halt DMA */
-	writel(0, base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN));
-	ret = readl_poll_timeout(base + CIO2_REG_CDMAC0(CIO2_DMA_CHAN),
+	writel(0, base + CIO2_REG_CDMAC0(chan));
+	ret = readl_poll_timeout(base + CIO2_REG_CDMAC0(chan),
 				 value, value & CIO2_CDMAC0_DMA_HALTED,
 				 4000, 2000000);
 	if (ret)
-		dev_err(dev, "DMA %i can not be halted\n", CIO2_DMA_CHAN);
+		dev_err(dev, "DMA %u can not be halted\n", chan);
 
 	for (i = 0; i < CIO2_NUM_PORTS; i++) {
 		writel(readl(base + CIO2_REG_PXM_FRF_CFG(i)) |
@@ -553,11 +561,11 @@ static void cio2_hw_exit(struct cio2_device *cio2, struct cio2_queue *q)
 static void cio2_buffer_done(struct cio2_device *cio2, unsigned int dma_chan)
 {
 	struct device *dev = &cio2->pci_dev->dev;
-	struct cio2_queue *q = cio2->cur_queue;
+	struct cio2_queue *q = cio2->chan_queue[dma_chan];
 	struct cio2_fbpt_entry *entry;
 	u64 ns = ktime_get_ns();
 
-	if (dma_chan >= CIO2_QUEUES) {
+	if (!q) {
 		dev_err(dev, "bad DMA channel %i\n", dma_chan);
 		return;
 	}
@@ -711,7 +719,8 @@ static void cio2_irq_handle_once(struct cio2_device *cio2, u32 int_status)
 		for (d = 0; d < CIO2_NUM_DMA_CHAN; d++)
 			if (int_status & CIO2_INT_IOC(d)) {
 				clr |= CIO2_INT_IOC(d);
-				cio2_buffer_done(cio2, d);
+				if (cio2->chan_queue[d])
+					cio2_buffer_done(cio2, d);
 			}
 		int_status &= ~clr;
 	}
@@ -724,9 +733,9 @@ static void cio2_irq_handle_once(struct cio2_device *cio2, u32 int_status)
 		for (d = 0; d < CIO2_NUM_DMA_CHAN; d++)
 			if (int_status & CIO2_INT_IOS_IOLN(d)) {
 				clr |= CIO2_INT_IOS_IOLN(d);
-				if (d == CIO2_DMA_CHAN)
+				if (cio2->chan_queue[d])
 					cio2_queue_event_sof(cio2,
-							     cio2->cur_queue);
+							     cio2->chan_queue[d]);
 			}
 		int_status &= ~clr;
 	}
@@ -929,7 +938,7 @@ static void cio2_vb2_buf_queue(struct vb2_buffer *vb)
 	 */
 	local_irq_save(flags);
 
-	fbpt_rp = (readl(cio2->base + CIO2_REG_CDMARI(CIO2_DMA_CHAN))
+	fbpt_rp = (readl(cio2->base + CIO2_REG_CDMARI(q->dma_chan))
 		   >> CIO2_CDMARI_FBPT_RP_SHIFT)
 		   & CIO2_CDMARI_FBPT_RP_MASK;
 
@@ -996,7 +1005,6 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct device *dev = &cio2->pci_dev->dev;
 	int r;
 
-	cio2->cur_queue = q;
 	atomic_set(&q->frame_sequence, 0);
 
 	r = pm_runtime_resume_and_get(dev);
@@ -1009,21 +1017,28 @@ static int cio2_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (r)
 		goto fail_pipeline;
 
+	cio2->chan_queue[q->dma_chan] = q;
 	r = cio2_hw_init(cio2, q);
-	if (r)
+	if (r) {
+		cio2->chan_queue[q->dma_chan] = NULL;
 		goto fail_hw;
+	}
+	cio2->streaming++;
+	q->streaming = true;
 
 	/* Start streaming on sensor */
 	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
 	if (r)
 		goto fail_csi2_subdev;
 
-	cio2->streaming = true;
-
 	return 0;
 
 fail_csi2_subdev:
 	cio2_hw_exit(cio2, q);
+	synchronize_irq(cio2->pci_dev->irq);
+	cio2->chan_queue[q->dma_chan] = NULL;
+	cio2->streaming--;
+	q->streaming = false;
 fail_hw:
 	video_device_pipeline_stop(&q->vdev);
 fail_pipeline:
@@ -1045,10 +1060,12 @@ static void cio2_vb2_stop_streaming(struct vb2_queue *vq)
 
 	cio2_hw_exit(cio2, q);
 	synchronize_irq(cio2->pci_dev->irq);
+	cio2->chan_queue[q->dma_chan] = NULL;
+	cio2->streaming--;
+	q->streaming = false;
 	cio2_vb2_return_all_buffers(q, VB2_BUF_STATE_ERROR);
 	video_device_pipeline_stop(&q->vdev);
 	pm_runtime_put(dev);
-	cio2->streaming = false;
 }
 
 static const struct vb2_ops cio2_vb2_ops = {
@@ -1498,6 +1515,7 @@ static int cio2_queue_init(struct cio2_device *cio2, struct cio2_queue *q)
 
 	/* Initialize miscellaneous variables */
 	mutex_init(&q->lock);
+	q->dma_chan = cio2_queue_dma_chan(q - cio2->queue);	/* queue[] is indexed by port */
 
 	q->format.width = default_width;
 	q->format.height = default_height;
@@ -1895,21 +1913,26 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
-	struct cio2_queue *q = cio2->cur_queue;
+	struct cio2_queue *q;
+	unsigned int i;
 	int r;
 
 	dev_dbg(dev, "cio2 suspend\n");
 	if (!cio2->streaming)
 		return 0;
 
-	/* Stop stream */
-	r = v4l2_subdev_call(q->sensor, video, s_stream, 0);
-	if (r) {
-		dev_err(dev, "failed to stop sensor streaming\n");
-		return r;
+	/* Stop streams */
+	for (i = 0; i < CIO2_QUEUES; i++) {
+		q = &cio2->queue[i];
+		if (!q->streaming)
+			continue;
+		r = v4l2_subdev_call(q->sensor, video, s_stream, 0);
+		if (r) {
+			dev_err(dev, "failed to stop sensor streaming\n");
+			return r;
+		}
+		cio2_hw_exit(cio2, q);
 	}
-
-	cio2_hw_exit(cio2, q);
 	synchronize_irq(pci_dev->irq);
 
 	pm_runtime_force_suspend(dev);
@@ -1918,9 +1941,14 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 	 * Upon resume, hw starts to process the fbpt entries from beginning,
 	 * so relocate the queued buffs to the fbpt head before suspend.
 	 */
-	cio2_fbpt_rearrange(cio2, q);
-	q->bufs_first = 0;
-	q->bufs_next = 0;
+	for (i = 0; i < CIO2_QUEUES; i++) {
+		q = &cio2->queue[i];
+		if (!q->streaming)
+			continue;
+		cio2_fbpt_rearrange(cio2, q);
+		q->bufs_first = 0;
+		q->bufs_next = 0;
+	}
 
 	return 0;
 }
@@ -1928,30 +1956,41 @@ static int __maybe_unused cio2_suspend(struct device *dev)
 static int __maybe_unused cio2_resume(struct device *dev)
 {
 	struct cio2_device *cio2 = dev_get_drvdata(dev);
-	struct cio2_queue *q = cio2->cur_queue;
+	unsigned int i, streaming = cio2->streaming;
+	struct cio2_queue *q;
 	int r;
 
 	dev_dbg(dev, "cio2 resume\n");
-	if (!cio2->streaming)
+	if (!streaming)
 		return 0;
-	/* Start stream */
+	/* Start streams */
 	r = pm_runtime_force_resume(dev);
 	if (r < 0) {
 		dev_err(dev, "failed to set power %d\n", r);
 		return r;
 	}
 
-	r = cio2_hw_init(cio2, q);
-	if (r) {
-		dev_err(dev, "fail to init cio2 hw\n");
-		return r;
-	}
+	/* hw_init does the shared setup only for the first queue it brings up */
+	cio2->streaming = 0;
+	for (i = 0; i < CIO2_QUEUES; i++) {
+		q = &cio2->queue[i];
+		if (!q->streaming)
+			continue;
+		r = cio2_hw_init(cio2, q);
+		cio2->streaming++;
+		if (r) {
+			dev_err(dev, "fail to init cio2 hw\n");
+			break;
+		}
 
-	r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
-	if (r) {
-		dev_err(dev, "fail to start sensor streaming\n");
-		cio2_hw_exit(cio2, q);
+		r = v4l2_subdev_call(q->sensor, video, s_stream, 1);
+		if (r) {
+			dev_err(dev, "fail to start sensor streaming\n");
+			cio2_hw_exit(cio2, q);
+			break;
+		}
 	}
+	cio2->streaming = streaming;
 
 	return r;
 }
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 192581909..a6e363a4b 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -367,6 +367,9 @@ struct cio2_queue {
 	unsigned int bufs_first;	/* Index of the first used entry */
 	unsigned int bufs_next;	/* Index of the first unused entry */
 	atomic_t bufs_queued;
+
+	unsigned int dma_chan;	/* DMA channel owned by this queue */
+	bool streaming;
 };
 
 struct cio2_device {
@@ -374,11 +377,12 @@ struct cio2_device {
 	void __iomem *base;
 	struct v4l2_device v4l2_dev;
 	struct cio2_queue queue[CIO2_QUEUES];
-	struct cio2_queue *cur_queue;
+	/* DMA channel -> streaming queue, for the IRQ handler */
+	struct cio2_queue *chan_queue[CIO2_NUM_DMA_CHAN];
 	/* mutex to be used by video_device */
 	struct mutex lock;
 
-	bool streaming;
+	unsigned int streaming;	/* number of streaming queues */
 	struct v4l2_async_notifier notifier;
 	struct media_device media_dev;
 
-- 
2.56.0


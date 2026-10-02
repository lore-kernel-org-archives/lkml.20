Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93630463B7E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930115; cv=none; b=OpceCHG6B3MT1VBb4IPJpSRMgFEcFtSTrOwaQK/2Aa8Tr8cCTYpbQD34ur/ArCiuQbNeVscK44qE9XBowwBnITsOriS8KZioTveV0r574huPachugRQwNcChDDIj9Jee25EJJeBQhNM7xyIAM5Yddw62T6OBhrsiNwfktp9865g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930115; c=relaxed/simple;
	bh=zuQi2DhFqTjkDjtLA7Fj28Yj3lmlfhmPfPBvr7XHAXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Epi+Zt/WmNVdjykgHZdssXDYQscRll2HuFY8tEoXTM7qyLBVFaIiqxncuJU82/lFfP8xbwAyRTMMVSZs+HyURo9AjKRNpq3BF3YDUzsvNzR/NjXq2XFhv5WtdXtJyi9stgzZpsSJAXBAJmFSiMNeUCH6UIkTzifaxE/iJTSiARU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6R18gNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GH6vXV8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6R18gNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GH6vXV8t"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jLnK438477
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 08:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l551TVRVOYdXh1MEqg0Ufe
	seOvjCvb16/DHhuJ6yN70=; b=G6R18gNOdyc3LFkhlDRtw2k2Es4d/kfWR2So5n
	k4PtgSoEjRs9ztllwGSVvQHZpV5fYunGfg+eamdVhflVNBmHBOsiGLHqd37nYkHC
	LNPv66jGSWUBN9TlyV0p+XpvFf4wL3CESP90Xc7SxSyqXxrctYCUKTshQn5iKzCE
	5TiWLPy7ngOfGJLyJwBkN/zh94t/J2pirtaSU38VxpD43NxzUejabnA5I7PKgVbG
	mmT4yZLPKyBlWg0EpwJg4KNXepNV3fnv7hWOIL8xzjuojax0PClK4Yor2Cu5dg7N
	QVazM2Tkw4T5B4x0xsF4ASmItwTPtnJEbow9W+SqNjuHLuQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckphw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:35:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e49a1d3b1so7662185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790930112; x=1791534912; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l551TVRVOYdXh1MEqg0UfeseOvjCvb16/DHhuJ6yN70=;
        b=GH6vXV8tVU8PptY4wxfCrs1gObrQeWNKuABEhUDpm47icjMGuJjoCRsYNPyrQroM/q
         4+cmdddrVwSPFmIBgQUwtZVdXFhFVWCqSp40qb7H/j9lZ0Os24eBKr15uyjdDf984qxy
         5huZAjz20ftXc/LXaIyukwkkUDUXdeXaGujisq0mJ2HEUzyhMESQBpNrVjzOIN7T6LyJ
         OKQz8UBLsA5P+u/Sj4PMxn8o+9S5Aj+eWhoaKtathPPDuSmoc02mC6s/mMSsw8OaleDw
         n5Mg9tWe4bLfwAsPy/0WT50EicDCx1FWNIi4kru9c6vwvP9OJuLI406/hYRxgQwOuuWM
         EKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930112; x=1791534912;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l551TVRVOYdXh1MEqg0UfeseOvjCvb16/DHhuJ6yN70=;
        b=VtrRmA2y+++VoRVWKwNKhmHpY/B/oLHmaf1itbROxnVurX1G6/NQWk47+/funsZctT
         fSlS9ZZpjAW3vUcoAiFzzRLM0+aNNrjqxAruildByGnJEKVp0IcfUohBqFTvZQSR4YAT
         YGGjYu63SVkzrHP9t+2O4j/6740+EAETwexotjp2Ywn/nPxxUDnZ9b0GxgGugeiSCrNJ
         siw4kOUaHcwT27qbXYOhDbT5LB/lzvW0NgW0jvu13lX60aa+da2H2JtmZKvNV60mQUPK
         Qh6UpGXrTgE1TcTZUeW0wIJqi3kTREQnWlILH9GlVeIIYPhWm9vdX0OyyzHzjzseG0ie
         mEvg==
X-Forwarded-Encrypted: i=1; AKwUvBy2lzJTIx3zXlNNJd5FEQR+FuAnXYnR5TU7EyIBQXDW7bFf4MILmmE8jJxQ5F2W8wbgGqWEAItDiK+Gxl0=@vger.kernel.org
X-Gm-Message-State: AFuF++nt/lH6vPGdWAt4bBoA8Ecd//yS2yggaozXxpIj7JjIdDkMbUuO
	UiO2qpn80Wi8cOBuCvAGedM0xXJ82Uv9jmxdq/bbFV9yH+1YBsuhKw4B0vR1/cCb3VlOBm8MUoO
	tP8cfa8HXhrBLhsj5j5PDrWCnSSSbBobemF3Y4N3tupz5WJpaOSKO45XolBwkBM/YqE4=
X-Gm-Gg: AYBFou3LihFC1bGtaZzqwguSp/yEWYmmoHwlF6I52LNbi7WgltZmD7uufpIwu8gpYtR
	TQ99A9qXJ6kcEDgQt+8BjrH5g9Qi13CeykhG8wUhONm7WG/GyXhZiRdR9pO/gfiafpcWb6iMB2f
	EBq56RcVu78aQHdH4SxkWgAXOAH254khykFAgFa8aEDUxLsOe9wjGBRTh3oQuuj9tvQNJf9D2xP
	+1dGyHMyenHDlUSt/aJc/96gFmD6I4CrqRNMZQVTP963c7SGJseaWL5mRjRE/253nu9yvzUTxyf
	Kr5xyTjBneXNoFFpswyWsMoNwzVTgJjsiMD1Yp9zmNC8NWLqOrY7tRLjvBuJLz3GlcOuJ4U/JTl
	Slhf+RqI7cnmEmH7eLAo+vvoUUSf7
X-Received: by 2002:a05:620a:298d:b0:93c:bd89:39c9 with SMTP id af79cd13be357-93cf1a0d70emr325094585a.50.1790930111654;
        Fri, 02 Oct 2026 01:35:11 -0700 (PDT)
X-Received: by 2002:a05:620a:298d:b0:93c:bd89:39c9 with SMTP id af79cd13be357-93cf1a0d70emr325091785a.50.1790930111217;
        Fri, 02 Oct 2026 01:35:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280d924asm67796825e9.14.2026.10.02.01.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:35:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 10:35:01 +0200
Subject: [PATCH RESEND v24] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bam-dma-bh-wq-v24-1-2ec3f26bc469@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALRsv2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjEx0FJSSM
 xLz0lN1M1OAAkpGBkZmhgYGRrpJibm6KbmJukkZuuWFuuYmicmGqcmppuZmBkpAPQVFqWmZFWA
 Do5WCXINd/VyUYmtrAZAWm4hoAAAA
X-Change-ID: 20261002-bam-dma-bh-wq-74ac1ece5760
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zuQi2DhFqTjkDjtLA7Fj28Yj3lmlfhmPfPBvr7XHAXY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqv2y5+mMXOCZoOy+C+rvfdSiNVZ0IWrNAjYwmE
 2RHZugFJ5eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCar9suQAKCRAFnS7L/zaE
 w3iVD/9qkedJesKJkQTEMgsSUfJnXpbSb3mH1wKYcWUVzsYniZRyv5TnFV+Gvn5yx8acAxhGKpn
 QULuDNpXETQtqc1Lfhe4cf8Cul7uK+xrXEz//lEJi6V8A31ImVBKrDDt2xim/bFST0hHfFhROmd
 7/oLlv+3Ioj/EcporG8TylYe7pSgXxR7fBcd5OZO5hq6yB8BJwn4stoBEZRsTA86KOoVVgPcLm6
 07mW6adQHa8uRbH2LDCsXV4WEQjecSHa70ZsisoqXGJRvYca0giyZjOQfH9fsbhDuJBograrMGp
 YjUmGgExyY/SgcAnDKTXPkZG599WU17jqQabrGe0wWQFdtf1B/g6yBCpS+jdU7AJ1VXP9EM0t8O
 VtqVewonZA3tJv0SZcozmFqTe2Pu2Uv88hqX1KeAMzKxi27+k77YhhNv4lSIkENeQVyVDjOVC7E
 QrpcgeNteUgK5abl0yAsBndE3HWr1Favo798DDoWTZM4aMjcafbA0e8Bi8T2OAK6IU5i6l/CAHo
 mnjnjOpctMhJb9HlLeJB+tLn4vkTcFt1LIH/c0/oKk0pjv3VzXxQ/8KxuAOz/EyveVU0JmVPxfQ
 fKe5PvozeKFaE0RudVbkeBWBRq1IEqvgEKMx4mHn5w4zYYtZLOhHlQtT2KpAdgLTx4dGpflzyMw
 GgD6hwj4sq4RrCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: P2YlJOojc9TqUKKPaXTls2t5sC7KxELs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX4F0lCOJxKn76
 puCRiIX6QA8HTlDDJ/f2D+k7K98Es8iaRBGTrsiSfwj0D6AYZ4/+dDr9ABATFvosnx8MGao13Hj
 G9KWk8pgWuf23EUGzxPAin0vhuzE2Fo=
X-Proofpoint-GUID: P2YlJOojc9TqUKKPaXTls2t5sC7KxELs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX3CVf2UX5lKkU
 8kwQzqSU+XNC7i/qtQINBWrkIaja+PLShgksVos637DMx9df1hs7vbx2qAO97u1G3H1YZsvTB9m
 Zu3uh6SNjHle0DIkUCSACSneNsBS1Hp01S9OU7UqN0mLlbd0WRJW3MczQkhdJPWHQQc2vSM96gS
 W2ditNGmQ30dgi5/Zh4NQh8SNE7k+OH6ECgnkBKE4pvVhE4e4yi7hCpCNu5z9pkSbv/Z8psUZFD
 VBNmH3NH7S4DqQAgKMTNIiv2JfygV3APFYT+3csboBK5GRi/MrLS8DQwsD2+kvW/PEojxDbzrE2
 tFxK1GsoiCwkuEB+VlYWx0OB/CiORhYi5/oIB+qtgAIg/+lUzai9+afqDugl+416WSXPdqUPxGw
 6/TN3SXg46hTmc8p/P9qJZA/59PlYqVzJ5jCHgiJLSb3Tsu3GyVWZsapyB5v2is+uwyyP1KTdq2
 NCekZuAojvf/RO/1HeA==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf6cc0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=fY4Sl1iEZjxDg5PD_C8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020034

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
This patch was part of the larger BAM DMA work introducing pipe locking
but it's not really part of that effort and can go upstream on its own.

All Sashiko reviews concerned pre-existing issues not introduced by
this. Please consider taking it for v7.4.
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 05a3b1f9e0c23dc5f861488fae03494867970523..ae49c706a4167af16f58c0746e9737215c4748c6 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1388,8 +1388,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-bam-dma-bh-wq-74ac1ece5760

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


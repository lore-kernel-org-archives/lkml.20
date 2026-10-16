Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F3457E47
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137628; cv=none; b=IbVgZomc5C5nuQMiVrIlKFsW/4gVDRk1SCRREweB6OLw2spSH6dSmtlcLWktj8w7Omv0Qfrzq94RsZXcCJyxqYO2sy4WvP+ZOgDetazEbRGBwu+eeS2H/RIDINjp6R1qpNG6bYK7wXY1S3LyF8PKXDLZYP1vKhzfuCgFiiF+m+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137628; c=relaxed/simple;
	bh=Y/i5TG2BWv1bj5vFWDfme6D9khtqs4zFRS0e+mXFWMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5Fx83z98k/96k8vRsJQrwbuMKna6auHkAbt/lgouxR+iOnMOG8rngs8sYt0fraZUPDbkBEMPVyyIKk9WVz2WpSPx0/AXUwi577rLZllVk3grlLZXrWuR7ZneFzRh7pSkAE4wfeHWG8mlR84mrkbimMo5MN+uCT6aym+kEOwaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7dZ5HFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORzlWOwm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7dZ5HFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORzlWOwm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6jSdd2678023
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9iyrvCSZjiLcegVSMJNGlx3q4evyuIE0YOIWSOSEUc=; b=U7dZ5HFjfyER77GT
	OtiGDXtPB9dOZRX2kX28DW92GD8a0HIsRasGIv0rt35CUWRPxKesdLQvLF6su0me
	qM4ljbAy6Y6kxm3i1+c4P2Oppx9O6D5IIJqzG7li650sxmXUxhruRXUeAA4XGuuk
	ptmNDt6ydYs5pYxqEJ20Zfodx9cLt1ejUPYNa+0BaKnUuMkuq0qQ8+fXyzRC/HXT
	J1U5C5OvMH9K2iN7kr5oorIYVDzlE5z8oAXJAljOIBM9rQr26Ui7T0IYXIyk4ebd
	e9VZ0LV+SzqLj32e4Qoc92Ykadv2JCngUqI3JhsY3SO+UMKwBw6atpxEXXd37Cr/
	LmvJLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19tberu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:00:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9197553d398so50600976d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137625; x=1792742425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9iyrvCSZjiLcegVSMJNGlx3q4evyuIE0YOIWSOSEUc=;
        b=ORzlWOwmAKdUrdzBXLd+7OdSZ7GnQEWiabRWkxHCXIOWr5Zim62Y3dUtzvt4rM4DCL
         e4/wK4buKqFgAeyn++LRnihkHAtWnvk2+RBD3iq9P2k5hJ/0jxPFura2B+u2WPLwXxED
         kND079PczIYPyCfhAmVWi/udUnJ7Uk6wXr/k9C54OyagQnsxPI6VC01loyxjlfPES7Y5
         TO+8eOFZoxBx7MM90Y9FVBHstbARQYdaZ/RygjIMTNvqb5Me6WWSm7kXdWy/VKxTYKZs
         xaEeGUOT+Bw9XmK1uig0JVdTHE/psllSGirb0+jeXC8UPfgmXlVC3mKyeBE7gPWAwiZf
         c6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137625; x=1792742425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9iyrvCSZjiLcegVSMJNGlx3q4evyuIE0YOIWSOSEUc=;
        b=t4fJ70ARdv3htoYr5kX2tD/fOvrvqnrLwOzY2PMCj095U8fU297HIGdiTt7uLvC58o
         8Z/HZsX8ViCT+ZLGQCdgEp8RV8sbGrSMoq7Bypp7Ka4PIRzmYvvvNRQ9uCsPs8xT/rUy
         A+JWpT98urYbvnr9DDerG70jGNS4pOmwEKGIq5vsu0Mtj8Fb6stE/3QpOoKOlnhaoIEJ
         Su3gdLoqZd0Cb61iDtROsy3R5G3o2siJY00QJ7BxFrR+zsaVjvwt1SiNWov59qkgVENQ
         +1vOSfus5vSiDTJrbnJCbWGGtf2/zcdFxbkU+hHUvk8FEq+UAsMg1W4UlLFmudPazeYv
         A70w==
X-Forwarded-Encrypted: i=1; AKwUvBzoUeHdbs+Slek/X6ILsfPBA252TZufygiDFDWlH+foeafedIVqD38qUJ8JZzw2onu9Q848C4KtKPzY2HU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpEewWLy4iZLwh70gOLp2UZQ/sf/FTWEDiy3iXMVxXQztZgWx+
	4TOuyHErScP0h7qHps0Sc1dpYpwydKvDjtz+WXMXv1OYWOlY1PNmmBqemWwf/xXxk9mHGAo18OS
	9FgYgMa4PoGOC/40rWRmvdnn/qRyluq70CzAvJ3kFS9CCHevU1+ihLWxNS946pmyXy/c=
X-Gm-Gg: AYBFou1lC2tMW//ES3u5+09cpneEOHN1b4WRzGNc0Yl4s6ekkB+pIBkut2CjGUtMvTT
	/2niX6C44G4Le38ZEYgxLI6D4N43jLoHqeYnjHPNZ5bGDlAjpJAOdRsUfpq+8zlVgtEp+b0FI1S
	xUd9bx/FZ9fb0+Jr8iqxAxt32j8dUvxGKwpELuH1U/nLJM0NJij5d5FVcpye96jmy7toi5j4p/S
	b5+n54cIcDnecrb8M2CB437Ojwz54m4xflpUVmrnruMyr0Twukr6bbMQe8UKM3r1HckrHPKSGGx
	kw5/tcEpBFRNyfDAe59mgN/OQmx+4jSoXKl0o4Ger57G+2jvYwtwS/lb7PHVAq8WiDFa1SeplZV
	4tPaLUvT9YuCsNriVQUio03Wmb5DGz8+gaMjT9uhBQmrebbnz0mAdc+w1yPL9E8FoCn127xtfJe
	Xsvz4B1gXqyA4PyCUV7BVyksnttRbXRBXzSD7D3e5TsVOZK8Tqftk=
X-Received: by 2002:a05:620a:19a3:b0:93f:22e9:7aed with SMTP id af79cd13be357-93f22e9884fmr24435085a.56.1792137623524;
        Fri, 16 Oct 2026 01:00:23 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93f:22e9:7aed with SMTP id af79cd13be357-93f22e9884fmr24428885a.56.1792137622862;
        Fri, 16 Oct 2026 01:00:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:14 +0200
Subject: [PATCH v3 6/7] i2c: qcom-cci: Add burst read support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-6-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: IxXbDIU_qCcTL_wHto905qnwkcKUg1x9
X-Proofpoint-ORIG-GUID: IxXbDIU_qCcTL_wHto905qnwkcKUg1x9
X-Authority-Analysis: v=2.4 cv=NqZE4MdJ c=1 sm=1 tr=0 ts=6ad1d999 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lNqXhXyNEWYzk-AvLucA:9 a=0YZ0O0O0cT6BRUpX:21 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX2xkOhTa2V5N3
 08q0AKn6L+xcTkSs7a9qTH4PHdvI8SWdDftAGG7r0SHedllPZJwYddDvR8PdrXUBW5JbQGOwh4H
 B3DmmJ7WQ9wSYOrS5f3fi4+uDuCtaHzh27pGYz3UUkrhTXd5kjjAYuYOE/FWm7uv9JEI1f2zuex
 t6tgiNuhruNy4Spy27pGR3allWs4dpX41gD72cnaWCdZ3VUG52sSEdp4GfWDu4h0l/ZqCi2Wqlo
 KMgY+0tr+0f52C50e0lQy1h/kmYybArfuEZJ6pcnNxrLKQtzLjWPlghTeIzujpfh3YOcA08/scZ
 3gR77In+6bdKD8wmeB+0BEgpjusydDyp88/Fq2aid2pJI10FvASohkn4IT5MC91hVH/d5d9a5FB
 j+xgLGarVmd9zA7R85gH8vqck1XHn2K6eWNp1raQJ+0hLYfQC77ZsaW51tQMyRjQDdH6tPC6UW8
 5+vQfhqVkJDyzIz3y5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXydJuUHKFUcem
 COTpvuIVAd68uQOhL0szeIQC+D++t9kaKIQ/HqVghpAOYAAZY0A6QRHba0Hso6M3eZD22zaKujl
 IEhZzzccKJ99EDUEICLp9XtCOouexis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

CCI_I2C_READ transfers are currently limited by max_read_len to the
amount of data that fits in the read FIFO, as the driver only drains
the FIFO once after receiving RD_DONE. On current hardware this limits
reads to at most 254 bytes.

CCI v1.7 and later support reads larger than the FIFO depth by
generating RD_THRESHOLD interrupts as the FIFO fills, allowing software
to drain data while the transfer is still in progress. When the FIFO
becomes full, the hardware can also apply backpressure by stretching
SCL and reports this condition through RD_PAUSE_IRQ.

Program CCI_I2C_Mm_RD_THRESHOLD to half the FIFO depth on hardware that
supports RD_THRESHOLD and update the read path to drain the FIFO on
each threshold interrupt until the final RD_DONE event is received.

Older hardware revisions do not support RD_THRESHOLD, keep their read
size limited to the FIFO depth and continue relying solely on RD_DONE
for completion.

Also emit a warning when RD_PAUSE_IRQ is observed, as FIFO backpressure
is unexpected under normal conditions and may indicate that software is
not draining the FIFO quickly enough.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 173 +++++++++++++++++++++++++++++++++-----
 1 file changed, 151 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 18cfe03439e204691a9ea873f67faeaa119b45ff..280d34b54dde6c505ff627ed35fbbd392b6f7c25 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_opp.h>
+#include <linux/spinlock.h>
 
 #define CCI_HW_VERSION				0x0
 #define CCI_HW_VERSION_MAJOR_MASK		GENMASK(31, 28)
@@ -36,6 +37,7 @@
 
 #define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
 #define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
+#define CCI_I2C_Mm_RD_THRESHOLD(m)		(0x120 + 0x100 * (m))
 #define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)	(0x300 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)	(0x304 + 0x200 * (m) + 0x100 * (n))
 #define CCI_I2C_Mm_Qn_CUR_CMD(m, n)		(0x308 + 0x200 * (m) + 0x100 * (n))
@@ -58,6 +60,7 @@
 #define CCI_IRQ_CLEAR_0				0xc08
 #define CCI_IRQ_STATUS_0			0xc0c
 #define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
+#define CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW	BIT(1)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_UNDERFLOW	BIT(5)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q0_OVERFLOW	BIT(6)
@@ -65,6 +68,7 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW	BIT(9)
 #define CCI_IRQ_STATUS_0_I2C_M0_Q1_OVERFLOW	BIT(10)
 #define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
+#define CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW	BIT(13)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_UNDERFLOW	BIT(17)
 #define CCI_IRQ_STATUS_0_I2C_M1_Q0_OVERFLOW	BIT(18)
@@ -81,6 +85,18 @@
 #define CCI_IRQ_STATUS_0_I2C_M0_ERROR		0x18000ee6
 #define CCI_IRQ_STATUS_0_I2C_M1_ERROR		0x60ee6000
 
+#define CCI_IRQ_MASK_1				0xc10
+#define CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE		BIT(17)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE		BIT(21)
+#define CCI_IRQ_CLEAR_1				0xc14
+#define CCI_IRQ_STATUS_1			0xc18
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD	BIT(16)
+#define CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE	BIT(17)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD	BIT(20)
+#define CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE	BIT(21)
+
 #define CCI_TIMEOUT	(msecs_to_jiffies(100))
 #define NUM_MASTERS	2
 #define NUM_QUEUES	2
@@ -108,6 +124,9 @@
 /* The first and last bytes are reserved - not payload */
 #define CCI_I2C_READ_MAX_LEN(fsize) ((fsize) - 2)
 
+/* Unlimited read via threshold-irq support */
+#define CCI_I2C_READ_BURST_NOLIMIT 0
+
 enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
@@ -169,16 +188,52 @@ struct cci {
 	int nclocks;
 	struct clk *cci_clk;
 	struct cci_master master[NUM_MASTERS];
+	/* Protects read-modify-write access to CCI_IRQ_MASK_1 */
+	spinlock_t threshold_lock;
 };
 
+static bool cci_has_threshold_irq(const struct cci *cci)
+{
+	return cci->data->quirks.max_read_len == CCI_I2C_READ_BURST_NOLIMIT;
+}
+
+static void cci_set_rd_threshold_irq(struct cci *cci, u16 master, bool enable)
+{
+	u32 bits, val;
+
+	if (!cci_has_threshold_irq(cci))
+		return;
+
+	guard(spinlock_irqsave)(&cci->threshold_lock);
+
+	bits = master ? CCI_IRQ_MASK_1_I2C_M1_RD_THRESHOLD :
+			CCI_IRQ_MASK_1_I2C_M0_RD_THRESHOLD;
+
+	writel(bits, cci->base + CCI_IRQ_CLEAR_1);
+
+	val = readl(cci->base + CCI_IRQ_MASK_1);
+	if (enable)
+		val |= bits;
+	else
+		val &= ~bits;
+
+	writel(val, cci->base + CCI_IRQ_MASK_1);
+}
+
 static irqreturn_t cci_isr(int irq, void *dev)
 {
 	struct cci *cci = dev;
-	u32 val, reset = 0;
+	u32 val, val1 = 0, reset = 0;
 	int ret = IRQ_NONE;
 
 	val = readl(cci->base + CCI_IRQ_STATUS_0);
 	writel(val, cci->base + CCI_IRQ_CLEAR_0);
+
+	if (cci_has_threshold_irq(cci)) {
+		val1 = readl(cci->base + CCI_IRQ_STATUS_1);
+		writel(val1, cci->base + CCI_IRQ_CLEAR_1);
+	}
+
 	writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
 
 	if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
@@ -204,6 +259,28 @@ static irqreturn_t cci_isr(int irq, void *dev)
 		ret = IRQ_HANDLED;
 	}
 
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 0, false);
+		complete(&cci->master[0].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_THRESHOLD) {
+		cci_set_rd_threshold_irq(cci, 1, false);
+		complete(&cci->master[1].irq_complete);
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M0_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 0 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
+	if (val1 & CCI_IRQ_STATUS_1_I2C_M1_RD_PAUSE) {
+		dev_warn_ratelimited(cci->dev, "master 1 read paused (fifo full)\n");
+		ret = IRQ_HANDLED;
+	}
+
 	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
 		reset |= CCI_RESET_CMD_M0_MASK;
 		ret = IRQ_HANDLED;
@@ -232,6 +309,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M0_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 0 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 0 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -252,6 +331,8 @@ static irqreturn_t cci_isr(int irq, void *dev)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 overflow\n");
 		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q1_UNDERFLOW)
 			dev_warn_ratelimited(cci->dev, "master 1 queue 1 underflow\n");
+		if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_UNDERFLOW)
+			dev_warn_ratelimited(cci->dev, "master 1 FIFO read underflow\n");
 
 		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
 		ret = IRQ_HANDLED;
@@ -391,6 +472,14 @@ static int cci_init(struct cci *cci)
 
 	writel(val, cci->base + CCI_IRQ_MASK_0);
 
+	val = 0;
+
+	if (cci_has_threshold_irq(cci))
+		val |= CCI_IRQ_MASK_1_I2C_M0_RD_PAUSE | CCI_IRQ_MASK_1_I2C_M1_RD_PAUSE;
+
+	if (val)
+		writel(val, cci->base + CCI_IRQ_MASK_1);
+
 	for (i = 0; i < cci->num_masters; i++) {
 		int mode = cci->master[i].mode;
 		const struct hw_params *hw;
@@ -419,6 +508,18 @@ static int cci_init(struct cci *cci)
 
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
+
+		if (cci_has_threshold_irq(cci)) {
+			/* Hardware supporting the RD_THRESHOLD interrupt provides a minimum FIFO
+			 * depth of 64 words, with the threshold reset to the full FIFO size by
+			 * default. Configure the threshold to half the FIFO depth to allow burst
+			 * reads while maintaining sufficient headroom to drain the FIFO before it
+			 * fills up.
+			 */
+			val = readl(cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+			val = max_t(u32, val, 64);
+			writel(val / 2, cci->base + CCI_I2C_Mm_RD_THRESHOLD(i));
+		}
 	}
 
 	return 0;
@@ -481,13 +582,20 @@ static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
 	return cci_run_queue(cci, master, queue);
 }
 
+static void cci_clear_status(struct cci *cci, u16 master)
+{
+	cci->master[master].status = 0;
+}
+
 static int cci_i2c_read(struct cci *cci, u16 master,
 			u16 addr, u8 *buf, u16 len)
 {
-	u32 val, words_read, words_exp;
+	u32 val, words_read;
 	u8 queue = QUEUE_1;
 	int i, index = 0, ret;
 
+	cci_clear_status(cci, master);
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
@@ -502,27 +610,46 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	val = CCI_I2C_READ | len << 4;
 	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
 
-	ret = cci_run_queue(cci, master, queue);
-	if (ret < 0)
-		return ret;
+	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
+	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
 
-	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
-	words_exp = len / 4 + 1;
-	if (words_read != words_exp) {
-		dev_err(cci->dev, "words read = %d, words expected = %d\n",
-			words_read, words_exp);
-		return -EIO;
-	}
+	reinit_completion(&cci->master[master].irq_complete);
+
+	cci_set_rd_threshold_irq(cci, master, true);
+
+	val = BIT(master * 2 + queue);
+	writel(val, cci->base + CCI_QUEUE_START);
+
+	/*
+	 * Hardware supporting RD_THRESHOLD can handle reads larger than the FIFO size.
+	 * The FIFO is drained each time an RD_THRESHOLD interrupt is received, until
+	 * the final RD_DONE interrupt completes the transfer.
+	 * On hardware lacking RD_THRESHOLD support, reads are limited to the FIFO
+	 * size and only one completion (RD_DONE interrupt) is expected.
+	 */
+	while (index < len) {
+		if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
+						 CCI_TIMEOUT)) {
+			dev_err(cci->dev, "master %d queue %d read timeout\n",
+				master, queue);
+			cci_reset(cci);
+			return -ETIMEDOUT;
+		}
+
+		if (cci->master[master].status)
+			return cci->master[master].status;
 
-	/* The first byte of the read is the slave ID echo, not payload */
-	val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-	for (i = 1; i < 4 && index < len; i++)
-		buf[index++] = (val >> (i * 8)) & 0xff;
+		words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
 
-	while (--words_read) {
-		val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
-		for (i = 0; i < 4 && index < len; i++)
-			buf[index++] = (val >> (i * 8)) & 0xff;
+		while (words_read--) {
+			val = readl_relaxed(cci->base + CCI_I2C_Mm_READ_DATA(master));
+			/* The first byte of the read is the slave ID echo, not payload */
+			for (i = (index == 0) ? 1 : 0; i < 4 && index < len; i++)
+				buf[index++] = (val >> (i * 8)) & 0xff;
+		}
+
+		if (index < len)
+			cci_set_rd_threshold_irq(cci, master, true);
 	}
 
 	return 0;
@@ -755,7 +882,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 128, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 	{
@@ -764,7 +891,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.queue_size = { 1024, 32 },
 		.quirks = {
 			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
-			.max_read_len = CCI_I2C_READ_MAX_LEN(256),
+			.max_read_len = CCI_I2C_READ_BURST_NOLIMIT,
 		},
 	},
 };
@@ -811,6 +938,8 @@ static int cci_probe(struct platform_device *pdev)
 	cci->dev = dev;
 	platform_set_drvdata(pdev, cci);
 
+	spin_lock_init(&cci->threshold_lock);
+
 	for_each_available_child_of_node(dev->of_node, child) {
 		struct cci_master *master;
 		u32 idx;

-- 
2.34.1


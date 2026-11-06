Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007360;
	b=b0/tudF1x9MARrbU5mHLZmj+/oVN6XJvTdCDJaMPIGV1veVCHj2CqBUPXDIyhnmdvsJV
	 KIbZ1QBpAqFQCBiCnbT/+a/I670bO5NSSsOEu/uKOdkXuhWOnrzTR8pi8HPwT84404tYj
	 5ZIeMOHV/dz40uMZdhfFtVYLj/gzRurnHByMpbTuQw43HBjubXD4VIVC+a/OJSeGNj9IK
	 HalMVQApq95D8rhBLxOBmg240KOtDkGYpDtambPlKfcorAuZOPcHW+0IgNfYX1Zhf8IbL
	 4UqR1LBMx/Uk7xx3eTUNBn/qOlHcmXMrgqwX3g06RqB8u0MSUukFkNhsNCLWkNaoPNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
	b=CcN5AV7S5lzeVtLkgwyUAEVtaZFKWDimtaPoeIj1CRZdKCXbcp+QYIKsu5CYXQTW7tx1
	 gzT9SYAtwbJnSgU3sgLhzBoVafpCpGWa+V9vtye1GQxGMPWtJ8ohxBpLuDGtrL2b4WX12
	 39Z18GrvcbUIcKDqTIQR+ffY/Ze3JcUxmdqy/hqEcDN7s+tYsrWyAkRzbUe+jdjk+RdY2
	 5tu85ljrJN3jApt/9ED3JGeUZ3xD+RK78Rx2fVEv8vFfRIWaTQnSNPsHIPmy0IKIA+H2F
	 s/MYBq7jxTOVVMy/TIMVNNWPNlz6lajNkqrlCckuVhQparVo77jySWu9uutcSST31Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRN9qAze;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PE0Wpaze;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD487606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD487606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRN9qAze;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PE0Wpaze
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MohGa1105262
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sld4C/ABjXA
	zSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=; b=BRN9qAze0r4duAQjDGn2h23h+rK
	pQy+00hu2ilS6UWf2zTYs+mJfQ0iiNjN/JiyRNL8aCT3A7lKCvr2bPrFGNvqburd
	T3LAFWR419foGazKksOf8z3VRWdrg1HL/t8VyOnmWhNICap2xB3AGitgLRYxKvvT
	hD+KG4kMvI5bjS047OspvZhwFfasnNrsxb9E+kRMI2O8LwooQFDLrd3bZUVZd+d5
	n6aPQP59qrrKi8iwmW6n1hBKn9YuBA1+bIH2Yr/+jXVc3GppC1za/FUmjG+PZuPp
	cpd+rX7ORE5hyyKQLX3HkgaUFqBN+nDW+4LwWmRCiNyYsZFifqKcMPcmjLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh7fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so1127071a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007358; x=1794612158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
        b=PE0WpazeMd/towM2XBnMczHSd185mznJgdmXFv8MrWYSXdp7D1GH4Ql+1GVmTJMUWb
         SnTUXUgaQaCIRyz/+SApdYVk+/TaRSZAmJyPFAfMpBhAyy1bfK3Qi0hAluHtTOpZvBCf
         9HvlEPIKSIbSjKZp5KzMSmCDifa+Si4/PTfaBGLL4Z0Ij58EELW0jotb036LDebOvTiM
         55Mfc2Ju07fx5f2+tbDOOfufUMqqykqGulf7Wg6qBlpAFaL/6JiR/lF8F2u7zAUXn7M4
         AUl9CyyIIxvWSHHni8Q7tKLahHeIVsiDGMjmGo41YLLm97xPgYWX+C6q9gVPCtvdL+rz
         dm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007358; x=1794612158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
        b=oVZ0QmO4fUh+S3fADeyRaWMn1HcoB/BC2Jj0mEgdfmTSoRGPu/5CwZ3JnXBE2DgQZz
         mw8dQULYv5xAf236aMVex9BvuxnLwpU6d1HYoBQ4lg0ScGk72kogvbn9o12aXF5f7a2o
         eUbHxTWm6+h3ANL9A5fK0ZWxIlr7Kb4oCdNn1B29dRMKA/KAf2R76frKFUwETHZqEWY5
         M4LG0o8o0I3hP4JIkDJTbRO2TqiKUYqCs4P9IETJPd2G5Y3Scj7Bfos4R2FrJwuZ8DF3
         7rAhzlqVChtun3GwxkSp6TNuNVfJ2r9ELlcCcxt5tuSslkdPZa83I3KJ3Wf9FJ4E4+MD
         PhAA==
X-Forwarded-Encrypted: i=1; AL+hErFFyinqcJv70kKiHM1oqlW02RyVFU+3SNDYoGk238Jh4lC/Lx39nrp0NITjYbG5ThQ6K/pSlHx8qpydZFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iLVEzqgLHZvHFSx8heKXZSeH5DPYwwy+wmjeDAiRrsr6sgWVJ
	Im+GFcuBAg5ZyWzXHlbwzrxyQPKM6YrgeeEtjg0a7HdZ+YRZUO43eTpdnPPfk/wYrCAUwwvjro3
	j3+V0LIn997Nk5qCkWBDpey7NlLGGSLdjtvmcPa8rd3l3ZaKrt2hF6A+v44woJWaTTOA=
X-Gm-Gg: AYBFou37RTwdj/ZweyLJkfA/u2QyCZ6bzI56rtUnfGqg/uM0rybqwA6A+HT9bM8Zmya
	xWakdVGL75BPDfZI5cV2IY2kIydCWXvcMdMCsM2PfsLoLj2g/5ol1LxpGbr08E9mM9RQPiojmM5
	jjBg/O/WYkAoVTZgnMxMNkDcPyFFrJTsmtVoJiq6hdvGHZgCjgYiElGsOtlxMSxL3FGqR0bi/1e
	sZN8evDXnudclg94B/ghUrXofEX4QdCQkT7AjC+95Ui8wfRhmXK49OtsIQhFFEdaOxAWhxl5gJN
	6m9j6XbfK4IDn2l6bWmEoFpKjB5VaVJBAy2+N3KOpygiBnTg5vF8Bt6lTvd1xqr5+/v7/GhtWwZ
	cCIoEo9p0kW6CGETs+QRerIjX4GVpZfk5fNpbHhQmOZh/H/ODizh59JsQBfijACLAKEmwFIwp5y
	riGmMdm+dgcKe6oKB7wzaMI9IAXDE6NL4KtObY1GS0EFzQiEwg4wiXwKox9DUPAA==
X-Received: by 2002:a17:90b:1b07:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b0db6eea1amr3347805a91.23.1794007357552;
        Fri, 06 Nov 2026 15:22:37 -0800 (PST)
X-Received: by 2002:a17:90b:1b07:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b0db6eea1amr3347775a91.23.1794007356938;
        Fri, 06 Nov 2026 15:22:36 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057f0220sm658745a91.5.2026.11.06.15.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/15] drm/msm: Import adreno_snapshot.h
Date: Fri,  6 Nov 2026 15:20:53 -0800
Message-ID: <20261106232220.47602-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: V-Jgz3WzisfgYq4DHL2aqelAOGGNb0cj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX12IFF2qtcERZ
 yip1T3nTqHQaxYr7LXQBZXMXi933xLLuArgICz5vyeYA1SwGNJ0puxnsEZBYBS3QUlqOA+IokqD
 Pps5GLuWWQ4hKCXcjmwoBGnq+gw7Zejv8dH3Db83P8UBpHxDOuU44VbHdSYv4/F4YkzOAPEKasC
 5JSoKOwk6h0Xn00PAClhHCBq6cbk9Nf/3Rw0l/WYdee5lGnIli9LiRdahEhyD1MN9+cyXyBFAZ7
 2hYUGBoBYtLytGoGL1Aj3qdHIR1wMN/k8eyyYLyAF6jd1JWoFh496gqRHSARG+qtGyrn/CTRWDY
 9jnf1L1dA1durKZCA9oE5gbDMrwQRUoks9pJNoTareshjuyakv3PCGBwFIcW0psv5b+CPcskTMG
 ne2dLLM/e25oZSJUpb2lefuLtlnPo7dCAbMWbNphD4SEzeGCxi/1MXlWON5oxWVrDTwkSTVx+eN
 sOOoumi35aj/SQvLPCA==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee613e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=brQcgiZQOO_HO4CFPnwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX4a1QkZsDLAZg
 0LJVHTpM0jQyuXxfbu2DrpwIMGaaTX2aHgz7Gp3Z2OetkiMCerLXtKJWquYdiHAOMcOfCCl7XPF
 INNJu+f71MPEZ+OM2QSpQ6HWAyJppws=
X-Proofpoint-GUID: V-Jgz3WzisfgYq4DHL2aqelAOGGNb0cj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

Based on kgsl_snapshot.h from downstream KMD.  We'll be re-using some of
this for gen8 devcoredump.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_snapshot.h | 321 +++++++++++++++++++
 1 file changed, 321 insertions(+)
 create mode 100644 drivers/gpu/drm/msm/adreno/adreno_snapshot.h

diff --git a/drivers/gpu/drm/msm/adreno/adreno_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_snapshot.h
new file mode 100644
index 000000000000..f9956e0bc1d5
--- /dev/null
+++ b/drivers/gpu/drm/msm/adreno/adreno_snapshot.h
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#pragma once
+
+#include <linux/types.h>
+
+/* Snapshot header */
+
+/* High word is static, low word is snapshot version ID */
+#define SNAPSHOT_MAGIC 0x504D0002
+
+#define DEBUG_SECTION_SZ(_dwords) (((_dwords) * sizeof(unsigned int)) \
+				   + sizeof(struct adreno_snapshot_debug))
+
+/* GPU ID scheme:
+ * [16:31] - core identifer (0x0002 for 2D or 0x0003 for 3D)
+ * [00:16] - GPU specific identifier
+ */
+
+struct adreno_snapshot_header {
+	__u32 magic; /* Magic identifier */
+	__u32 gpuid; /* GPU ID - see above */
+	/* Added in snapshot version 2 */
+	__u32 chipid; /* Chip ID from the GPU */
+} __packed;
+
+/* Section header */
+#define SNAPSHOT_SECTION_MAGIC 0xABCD
+
+struct adreno_snapshot_section_header {
+	__u16 magic; /* Magic identifier */
+	__u16 id;    /* Type of section */
+	__u32 size;  /* Size of the section including this header */
+} __packed;
+
+/* Section identifiers */
+#define ADRENO_SNAPSHOT_SECTION_OS           0x0101
+#define ADRENO_SNAPSHOT_SECTION_REGS         0x0201
+#define ADRENO_SNAPSHOT_SECTION_REGS_V2      0x0202
+#define ADRENO_SNAPSHOT_SECTION_RB_V2        0x0302
+#define ADRENO_SNAPSHOT_SECTION_IB_V2        0x0402
+#define ADRENO_SNAPSHOT_SECTION_INDEXED_REGS 0x0501
+#define ADRENO_SNAPSHOT_SECTION_INDEXED_REGS_V2 0x0502
+#define ADRENO_SNAPSHOT_SECTION_DEBUG        0x0901
+#define ADRENO_SNAPSHOT_SECTION_DEBUGBUS     0x0A01
+#define ADRENO_SNAPSHOT_SECTION_GPU_OBJECT_V2 0x0B02
+#define ADRENO_SNAPSHOT_SECTION_MEMLIST_V2   0x0E02
+#define ADRENO_SNAPSHOT_SECTION_SHADER       0x1201
+#define ADRENO_SNAPSHOT_SECTION_SHADER_V2    0x1202
+#define ADRENO_SNAPSHOT_SECTION_SHADER_V3    0x1203
+#define ADRENO_SNAPSHOT_SECTION_MVC          0x1501
+#define ADRENO_SNAPSHOT_SECTION_MVC_V2       0x1502
+#define ADRENO_SNAPSHOT_SECTION_MVC_V3       0x1503
+#define ADRENO_SNAPSHOT_SECTION_GMU_MEMORY   0x1701
+#define ADRENO_SNAPSHOT_SECTION_SIDE_DEBUGBUS 0x1801
+#define ADRENO_SNAPSHOT_SECTION_TRACE_BUFFER 0x1901
+#define ADRENO_SNAPSHOT_SECTION_EVENTLOG     0x1A01
+
+#define ADRENO_SNAPSHOT_SECTION_END          0xFFFF
+
+/* OS sub-section header */
+#define ADRENO_SNAPSHOT_OS_LINUX_V4          0x00000203
+
+/* Linux OS specific information */
+struct adreno_snapshot_linux_v4 {
+	int osid;		/* subsection OS identifier */
+	__u32 seconds;		/* Unix timestamp for the snapshot */
+	__u32 power_flags;	/* Current power flags */
+	__u32 power_level;	/* Current power level */
+	__u32 power_interval_timeout;	/* Power interval timeout */
+	__u32 grpclk;		/* Current GP clock value */
+	__u32 busclk;		/* Current busclk value */
+	__u64 ptbase;		/* Current ptbase */
+	__u64 ptbase_lpac;	/* Current LPAC ptbase */
+	__u32 pid;		/* PID of the process that owns the PT */
+	__u32 pid_lpac;		/* PID of the LPAC process that owns the PT */
+	__u32 current_context;	/* ID of the current context */
+	__u32 current_context_lpac;	/* ID of the current LPAC context */
+	__u32 ctxtcount;	/* Number of contexts appended to section */
+	unsigned char release[32];	/* kernel release */
+	unsigned char version[32];	/* kernel version */
+	unsigned char comm[16];		/* Name of the process that owns the PT */
+	unsigned char comm_lpac[16];	/* Name of the LPAC process that owns the PT */
+} __packed;
+
+/*
+ * This structure contains a record of an active context.
+ * These are appended one after another in the OS section below
+ * the header above
+ */
+struct adreno_snapshot_linux_context_v2 {
+	__u32 id;			/* The context ID */
+	__u32 timestamp_queued;		/* The last queued timestamp */
+	__u32 timestamp_consumed;	/* The last timestamp consumed by HW */
+	__u32 timestamp_retired;	/* The last timestamp retired by HW */
+};
+
+/* Ringbuffer sub-section header */
+struct adreno_snapshot_rb_v2 {
+	int start;  /* dword at the start of the dump */
+	int end;    /* dword at the end of the dump */
+	int rbsize; /* Size (in dwords) of the ringbuffer */
+	int wptr;   /* Current index of the CPU write pointer */
+	int rptr;   /* Current index of the GPU read pointer */
+	int count;  /* Number of dwords in the dump */
+	__u32 timestamp_queued; /* The last queued timestamp */
+	__u32 timestamp_retired; /* The last timestamp retired by HW */
+	__u64 gpuaddr; /* The GPU address of the ringbuffer */
+	__u32 id; /* Ringbuffer identifier */
+} __packed;
+
+/* Replay or Memory list section, both sections have same header */
+struct adreno_snapshot_mem_list_v2 {
+	/*
+	 * Number of IBs to replay for replay section or
+	 * number of memory list entries for mem list section
+	 */
+	int num_entries;
+	/* Pagetable base to which the replay IBs or memory entries belong */
+	__u64 ptbase;
+} __packed;
+
+/* Indirect buffer sub-section header (v2) */
+struct adreno_snapshot_ib_v2 {
+	__u64 gpuaddr; /* GPU address of the IB */
+	__u64 ptbase;  /* Base for the pagetable the GPU address is valid in */
+	__u64 size;    /* Size of the IB */
+} __packed;
+
+/* GMU memory ID's */
+#define SNAPSHOT_GMU_MEM_UNKNOWN	0x00
+#define SNAPSHOT_GMU_MEM_HFI		0x01
+#define SNAPSHOT_GMU_MEM_LOG		0x02
+#define SNAPSHOT_GMU_MEM_BWTABLE	0x03
+#define SNAPSHOT_GMU_MEM_DEBUG		0x04
+#define SNAPSHOT_GMU_MEM_BIN_BLOCK	0x05
+#define SNAPSHOT_GMU_MEM_CONTEXT_QUEUE	0x06
+#define SNAPSHOT_GMU_MEM_HW_FENCE	0x07
+#define SNAPSHOT_GMU_MEM_WARMBOOT	0x08
+#define SNAPSHOT_GMU_MEM_VRB		0x09
+#define SNAPSHOT_GMU_MEM_TRACE		0x0a
+
+/* GMU memory section data */
+struct adreno_snapshot_gmu_mem {
+	int type;
+	uint64_t hostaddr;
+	uint64_t gmuaddr;
+	uint64_t gpuaddr;
+} __packed;
+
+/* Register sub-section header */
+struct adreno_snapshot_regs {
+	__u32 count; /* Number of register pairs in the section */
+} __packed;
+
+/* Indexed register sub-section header */
+struct adreno_snapshot_indexed_regs {
+	__u32 index_reg; /* Offset of the index register for this section */
+	__u32 data_reg;  /* Offset of the data register for this section */
+	int start;     /* Starting index */
+	int count;     /* Number of dwords in the data */
+} __packed;
+
+struct adreno_snapshot_indexed_regs_v2 {
+	u32 index_reg;	/* Offset of the index register for this section */
+	u32 data_reg;	/* Offset of the data register for this section */
+	u32 start;	/* Starting index */
+	u32 count;	/* Number of dwords in the data */
+	u32 pipe_id;	/* Id of pipe, BV, Br etc */
+	u32 slice_id;	/* Slice ID to be dumped */
+} __packed;
+
+/* MVC register sub-section header */
+struct adreno_snapshot_mvc_regs {
+	int ctxt_id;
+	int cluster_id;
+} __packed;
+
+struct adreno_snapshot_mvc_regs_v2 {
+	int ctxt_id;
+	int cluster_id;
+	int pipe_id;
+	int location_id;
+} __packed;
+
+struct adreno_snapshot_mvc_regs_v3 {
+	u32 ctxt_id;
+	u32 cluster_id;
+	u32 pipe_id;
+	u32 location_id;
+	u32 slice_id;
+	u32 sp_id;
+	u32 usptp_id;
+} __packed;
+
+/* Debug data sub-section header */
+
+/* A5XX debug sections */
+#define SNAPSHOT_DEBUG_CP_MEQ     7
+#define SNAPSHOT_DEBUG_CP_PM4_RAM 8
+#define SNAPSHOT_DEBUG_CP_PFP_RAM 9
+#define SNAPSHOT_DEBUG_CP_ROQ     10
+#define SNAPSHOT_DEBUG_SHADER_MEMORY 11
+#define SNAPSHOT_DEBUG_CP_MERCIU 12
+#define SNAPSHOT_DEBUG_SQE_VERSION 14
+
+/* GMU Version information */
+#define SNAPSHOT_DEBUG_GMU_CORE_VERSION 15
+#define SNAPSHOT_DEBUG_GMU_CORE_DEV_VERSION 16
+#define SNAPSHOT_DEBUG_GMU_PWR_VERSION 17
+#define SNAPSHOT_DEBUG_GMU_PWR_DEV_VERSION 18
+#define SNAPSHOT_DEBUG_GMU_HFI_VERSION 19
+#define SNAPSHOT_DEBUG_AQE_VERSION 20
+
+/* Slice mask info */
+#define SNAPSHOT_DEBUG_SLICE_MASK 32
+
+struct adreno_snapshot_debug {
+	int type;    /* Type identifier for the attached tata */
+	int size;   /* Size of the section in dwords */
+} __packed;
+
+struct adreno_snapshot_debugbus {
+	int id;	   /* Debug bus ID */
+	int count; /* Number of dwords in the dump */
+} __packed;
+
+struct adreno_snapshot_side_debugbus {
+	int id;   /* Debug bus ID */
+	int size; /* Number of dwords in the dump */
+	int valid_data;  /* Mask of valid bits of the side debugbus */
+} __packed;
+
+struct adreno_snapshot_shader {
+	int type;  /* SP/TP statetype */
+	int index; /* SP/TP index */
+	int size;  /* Number of dwords in the dump */
+} __packed;
+
+struct adreno_snapshot_shader_v2 {
+	int type;  /* SP/TP statetype */
+	int index; /* SP/TP index */
+	int usptp; /* USPTP index */
+	int pipe_id; /* Pipe id */
+	int location; /* Location value */
+	u32 size;  /* Number of dwords in the dump */
+} __packed;
+
+struct adreno_snapshot_shader_v3 {
+	u32 type;  /* SP/TP statetype */
+	u32 slice_id; /* Slice ID */
+	u32 sp_index; /* SP/TP index */
+	u32 usptp; /* USPTP index */
+	u32 pipe_id; /* Pipe id */
+	u32 location; /* Location value */
+	u32 ctxt_id; /* Context ID */
+	u32 size;  /* Number of dwords in the dump */
+} __packed;
+
+#define TRACE_BUF_NUM_SIG 4
+
+/**
+ * enum trace_buffer_source - Bits to identify the source block of trace buffer information
+ * GX_DBGC : Signals captured from GX block
+ * CX_DBGC : Signals captured from CX block
+ */
+enum trace_buffer_source {
+	GX_DBGC = 1,
+	CX_DBGC = 2,
+};
+
+/**
+ * adreno_snapshot_trace_buffer: Header Information for the tracebuffer in snapshot.
+ */
+struct adreno_snapshot_trace_buffer {
+	/** @dbgc_ctrl: Identify source for trace */
+	__u16 dbgc_ctrl;
+	/** @dbgc_ctrl: Identify source for trace */
+	__u16 segment;
+	/** @granularity: The total number of segments in each packet */
+	__u16 granularity;
+	/** @ping_blk: Signal block */
+	__u16 ping_blk[TRACE_BUF_NUM_SIG];
+	/** @ping_idx: Signal Index */
+	__u16 ping_idx[TRACE_BUF_NUM_SIG];
+	/** @size: Number of bytes in the dump */
+	__u32 size;
+} __packed;
+
+#define SNAPSHOT_GPU_OBJECT_SHADER  1
+#define SNAPSHOT_GPU_OBJECT_IB      2
+#define SNAPSHOT_GPU_OBJECT_GENERIC 3
+#define SNAPSHOT_GPU_OBJECT_DRAW    4
+#define SNAPSHOT_GPU_OBJECT_GLOBAL  5
+
+struct adreno_snapshot_gpu_object_v2 {
+	int type;      /* Type of GPU object */
+	__u64 gpuaddr; /* GPU address of the object */
+	__u64 ptbase;  /* Base for the pagetable the GPU address is valid in */
+	__u64 size;    /* Size of the object (in dwords) */
+} __packed;
+
+struct adreno_snapshot_eventlog {
+	/** @type: Type of the event log buffer */
+	__u16 type;
+	/** @version: Version of the event log buffer */
+	__u16 version;
+	/** @size: Size of the eventlog buffer in bytes */
+	u32 size;
+} __packed;
+
+struct adreno_snapshot_gmu_version {
+	/** @type: Type of the GMU version buffer */
+	u32 type;
+	/** @value: GMU FW version value */
+	u32 value;
+} __packed;
+
-- 
2.56.0


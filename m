Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234082;
	b=PaOejEX+brKxtdYeZ94cmMuFHX5vCmIIGFzoYTmLQFWhqhw1wkfF6vG12VGRRF7Kctzj
	 nttnWzC0Y3ijA1enUPEyG6tICrJwa2EjQd4zxbHqu/TkXRZZ08wGVs4wcbk57dyEIM8Us
	 biDsj+NkHcUX/bKjhE7ddBaVKOh8BpIBm2+vsM3L5jLwbXlSUwD3oWE0J2Tx0wp6856Lu
	 P8yMitNQLtNFIXwrw2oy5bPT20M72zeLzz8zmwdjJr+mlo6bhvUnkqi0keh31E54HVMoE
	 mfF3glRzVqM5YCyz26DsRa8tMD9ggpbz7MlOKrXQzONNSXp0Z2ywEmFyz1KAJiI4CCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
	b=HNyLx05u565+6c8oOdeYvsYbGq4QKOHKiRNiWxhLynMjZJFVJQbD2yng9zua4XrelvLU
	 8UtzVPjy8lkbBlJe5AKjcTZR8HUrgc7BDvedNRcXcZdBtWuN7WgelkKcsjbaU+k/odmCl
	 yPq4tn6v2qAvemAFZpIGQBlZZrI8r5WdzkGxaYAvzXMSYazVgJRGoCT24uzwcH2QAmLp0
	 ZSNt/cWw8InsH0Voyohau4dP5itk/1jkiz99JJYna4PyNql1vPTbNhAsVn1+bBYwUxQK6
	 dSyKtkOFvaviKAX45wThxO6UaX5O8oJM98WTj/0jnwHP3nDnMjldDUv9fLRnRsl/Q3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoPunYbQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io4niaFx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D25D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D25D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoPunYbQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io4niaFx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF3bX2928721
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sld4C/ABjXA
	zSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=; b=AoPunYbQn9rGtMwPaipLX948Xw/
	ezYhBOA+VKEsMgp/l1onWFiCBMCGxe3ckJstdVFDyGJ9euSyglmaZDDL5xPNB/g5
	9qgqjZmsAihUI4HRCBKGjogBectAVWTx0jNM8XHuwc80GoDe1/azoP+NHUii4AwZ
	AFk2jwbjhcjl6ktcMmuyg9Cw7Aa5VCFn+cfkvs6Y6pTwKzl4jA4AZFoE8L6nsgZB
	bNsAI9Usv8pwpKhrKt/ZtIpLYF7glZmLK0fhi6WOC03XTm49cD9NZlRMk8e03a6R
	bKpOLS4r8Ir9N7jd/ilTqsgbFZmTRfxl013jnKr9jqajYewJgWJhHACbAdg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8rx83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1303131a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234081; x=1794838881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
        b=Io4niaFxmUmspYkBnl+sDKfCmEC51KfKN/V0ZnGkm31STXIYS2zYgPowN319mi0H7h
         3SzOl9tM8BApsUCx8bUgxsW/FqSgtlBXDTXIzRecFCJTHiVl1QNwIYhvVXHniXery4+F
         AE3Rraj4p/kpfHAMif7JyJ1OoF++AOgYGKLY9lJ+U9UZamXq2+GYaC7mBbN/fEHAqQZC
         2rZg5yBcbozHO3DyvN7/DuGCUlS1/Ge1EDRtBDXKRZt1WvF4OnQLYEAAc3jJrVeoes5W
         k2KMkA0Bsa8ZseSBwCZjQPNqZhI60ACNBl5XipZdVyhRgEjOt4SmQ2IJMl7LjsIL/jl9
         tatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234081; x=1794838881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sld4C/ABjXAzSUY9aFL2khUNYLOIcXkuhPaxg2YHG30=;
        b=ACgVKE31FJ+UG+W9bNUJel2QrN0fPTnkN//hJOJEz7boCt+dSGgX/ATbfhl5FtGku8
         ktZ4Z24aUBmjjNQT0v4+bjFFrhaYPqiMOZVfI4SBXnzNeoTXA0DQvlvfmD3EZU+R83zV
         IRG8/zQESG/eXBeMw72ta9jjBrUIs4pUFLPXqjtXUmmqzfTNqD535pI5EAIDbK7oWTco
         s1x815G/YRaCwyF4PMK2jvbZHcErbOHmg19dAE1vgRZDKSBIaLrkyNTrxChp5pwWBdXC
         o5RRpXhl81l5HdxEvqm7PIXM6wBObagtqAh9WEg7S2AO+P98Qa/oDZkhudj7IKV/y1Gu
         JlCg==
X-Forwarded-Encrypted: i=1; AL+hErEtdXU/A9/Rd8lQDjpmRA7FJZnETtMyJlI+Gj0p+w20lzK/I/h8HG34sxAG0h+qyp63F9s2jb9+N3iSl18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g2cRR0+fNPBewZyJ8dxxg4SSejl9E7BBBvOKNsEYM4VUFThrJ
	zcs1slHDnvkACswAju/F4QRmN2lwvH1WE07LgYlOOhTAqUrnkwfSb+PHgVYd0a8U81Yf2+xjvQl
	7L0kTNPqxMOGBzqCgQZCJ33LDudwHsnm4cPoyjFrPrW0oP54YOAiRBCGAX4h3a0ocIXM=
X-Gm-Gg: AYBFou1ZV6ZyjUIERakxpdwY8HAvItUsXQO6+hTRNallrhMQo+ernS5TJnTilwI3b6u
	FvtodVczkX749FySB8yrrdwaSs6CyEydo4YhG6Et7/w2h6ZosDfhpHzjRTL7uV1IzPJbFwqUgrH
	keAVH7CG6ZwsCIIh6gs62WHRBQrCGZChf5cHQZEslQS9OR1DpnuxhA5RMcCVq1xL4gUGtBI3ogW
	hg2qQkhn4DdXgDOvNEGcCoSLDYAoejkQ4+QwJqzULL7tfCiBvjSuKh0WW/KNwpnjm2ovnsXaMI6
	YDkf3nd6Qk9KWejuGa4KBGd8mkEnhqM9Qocqh3lDUDj8h3D02Wc6J2WMnKKlviX+vNePMcW9EbN
	xDwaEg9F3rCmL7F8TjQYu7GPXnxfqxbphGf4wTLmQ6CiNsfdfJUFaqfGz4AJcZr6tEZqlW09XPp
	oG8iQQhJxU2iOJu5wznQFj5mQ9sqhOetL10M/xC4PpxA5O26yw8oMoB5WwKQwI6w==
X-Received: by 2002:a17:90b:3b42:b0:3b0:c22e:9460 with SMTP id 98e67ed59e1d1-3b12d1008dcmr3454037a91.2.1794234080674;
        Mon, 09 Nov 2026 06:21:20 -0800 (PST)
X-Received: by 2002:a17:90b:3b42:b0:3b0:c22e:9460 with SMTP id 98e67ed59e1d1-3b12d1008dcmr3453998a91.2.1794234080014;
        Mon, 09 Nov 2026 06:21:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1305bf886sm5948161a91.7.2026.11.09.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:19 -0800 (PST)
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
Subject: [PATCH v8 01/15] drm/msm: Import adreno_snapshot.h
Date: Mon,  9 Nov 2026 06:19:47 -0800
Message-ID: <20261109142111.256630-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXw+QkY84sOt/H
 TGuvph6cWpSlU+jke8FT/b9M4vSEKba6EuSAAfq5PONGTitxz5ZeXXTZ3OGpHbr9geyhBZVZoHN
 r5CHeJURgBUTzVRTBEXw5I5iTsUyXCyI6tdqmqshCiY5uTa71Va2Q4vd0fv8W1ULKaBxSkM5zf2
 gQPHX7zbmv6hpeofoxvwnC+AQvNxqUnsSx9JnmjvPLnb1oVZw7dlXmuJ005nClvSxsTuQtL4lg5
 5fJHb8U+M96CVGWnw2uSHvfPGFqC4ZCggxEhCqI5TrysdNhup40E851B9BIYRRTD4jxcDPgcyqn
 on1HhLHhCWsU0D2xzLzlMpyMldH9W2eXw6HzwZr+k20mh3+UoF+Slbim0Jpt4oMmSIR1l57qylA
 tOmK5I77y/1WBfnCQCexYj1WyC4OmuldV1dE/xDCHMyFKZ3IJDGJOzFa/HYLkC/ohU+FDu8EmXr
 K+69bMx9wog5RVJHVCw==
X-Proofpoint-GUID: U4mNkxKqV7HCFFH4QbhZ94j2VDFmGv0S
X-Proofpoint-ORIG-GUID: U4mNkxKqV7HCFFH4QbhZ94j2VDFmGv0S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX96mPD1d9zU33
 OA6pE/k+fYEzH239LENf6MJEHB4Sy1pKwZ2yAAeGdfMQY+6LOKufGfub1lXzTD+f7k+sEjhMI5M
 /yzVpAUmc8suKLSrqDJRdTw8jyVpJkA=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af1d6e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=brQcgiZQOO_HO4CFPnwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

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


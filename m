Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529269;
	b=ELCPtCkfptQwOdvK23tPkfOSlBdGlMEErSSo4BcupFbMXD18P8OI3/2ngx/AFCUjAgP8
	 b+frzu8YnRuwtpxxKsHknpxyO2lm9d/rXffzpjTPCJXXFrqd0nOmdEQ65VtAK3oSdIM6a
	 +bzxdY2aKf56rSHJyLk7zORWvhv5QCeqhVjyhgdDMzgY/FQqdavl8hq9XUQFpBSn+L2wU
	 qU5nzsObqyEoEg878V4SjRT4a+wiD8bob7Kqh7mF8AIxUn7In0YjQ4hmFWJMvgeBt3BWW
	 8uvPG/nPpLW1u96PfVyRxZE+patdTU2UHneR3CPyqt1QY+++w8euTs9Y4DPbHR19sbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
	b=TBMyDyGINMx8hHvp48sfnHEXn5GVdFdF+D/DdyGZqF9UT+VALs+mcFYmZy3YyOEp8q2l
	 XXFVo0hHSEHR/Vwt+KhGHzqZRm4VdzdWfDvgOdC9yGIXGJDWwXuvrn1ZTxtInGchXcGWq
	 /4r3CdOm45yCGKL1bIMBM9a2VX6I6fON8d34Ke+vPZBnvq5miXEzPJiisQtXmnernPDql
	 9BWXylvNd671bjijj5pkL/AunH9lla29Wj2x4do+OZhO3VMRhQJiOcLpThZoFWkRwwyYN
	 qU25zvk/6FTtDl3DmVNKE/cSya+XUjVjKalsSa6kBI9PKuxueTjvvgcrhb5WizTbstg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DNy+cn2l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fIfs/8HJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D33606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D33606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DNy+cn2l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIfs/8HJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KHSIY1836385
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auHda5CSTpF
	NG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=; b=DNy+cn2lxuGGyTuFlrlhLspvCbU
	hTE0iW5+KgkzHbTGK5t/ZrFdbbe9MkgmL3m1o5TSUwLHV1ktrAGBd71jBux8Rr5j
	grBSwyMspaibTnEQKLi5TLJnCcr3x4yEnvJXq1TQbS6ZT9Yj+6VJUqSm87fU/CrL
	+OgB4DYl5qwcYP+MMt9b0gvzdSbsUBW07VAM9Qr1mIvgIOKJkxL5TdTKJAkA0KGM
	GP//Uv1VYB7gvNvag/ffHFcOXR7vlsCprfFZuJI/Y1fG+lX9cbJxFtUi4wvtkxqw
	jRcloqHj/Bujba/lLrwrK5hCxRSzxwsLs1s7/Uf2ji1D2oG16w/fOV+O5AA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hva1c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so39957b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529268; x=1793134068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
        b=fIfs/8HJIp6tD9du8f7UOFotl7uDCyUBKKV3y4lQBNxdf2mtVhOoCkOkFn44Ih1tYD
         ilpjxWcKLOZMC/HNFObVgb8b6a13IZ7eJ2Jl1T1X95KjeTLrSXi7BqI3mhqL1koPNfnp
         NV/9zh/iLB6VUsSKlp3FrvVo2QJltup34qbtHr1mox+xKRkS4zLgMmwOltsJQRKB1oqd
         z+xI7biBndIE/FAMQCzskO5E0PubGmBS5KHU8KG0QL6IE0SRtT07zJ2rUS0eEkfAYtCt
         ftGk5rUBXePogNPmBljaTd62y2q5k9AM0OLPpKD86E3XGCbNrCrzl/fqI9wAAiKI5cAr
         hCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529268; x=1793134068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
        b=F7gCpTZtnI5HxQvEn98B0MpUY0VomzoeHM91wx0RHVFXZ9qpwbzjOVtKw2qSCHLDC3
         kXIN88rup5mvcl6aQguq2Rs3lup35cRfM/BlYfYvUwosX+iJHt5AACzHsKFIITzDh9Yz
         JBpQbmv5LlTD6N/8iH0M8NvML0CUTGJ0frrNsEXMuXty885rK7GAeNeszf6Q0mCuUvl9
         Qd9QGCkScDTqxriKWTzMvXBSB+S9rxkaFi4gGzjq5sQoe+KINjSBEFUiBVDZOk3jxx+N
         Ar0U1nOCl32zSLrPWqKmPUJIAqXroMAuJwqAqaRjM3xXx5OYv/MWT9euMExUDwezEova
         ff+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdw8XtFV9P913C2wRAtI+lXqHUeQKNtwdARsAVK6JQZixpQypk3kxmPIpDkmv8xk1GDgJ+uo4VWJ/cDjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpfofa2rshciYSqHLX65bWU9rNQi5s2nxKsAuc4LtCDhvF8rY8
	GUAdcaE0gZOC4INQRu8/DEBtZ+AiXgSitiPZ4zr9RLfTfKd9M50DryplE2o2vVJoMAeomOGFxx0
	sSnf+OTKOTGpSNsN36HBEmo4Mvo7r7chS9pz99A9Hz+fNOmjiDGs/9lOvchmPhL0Iz3g=
X-Gm-Gg: AYBFou3tMnHL+8lgOGeH6waKZyYwL2PgCZNmefzzRER5+jl5L63a6BeDJo+qzg8cC/X
	n5M4Btx6gyst3QzFCT6qhF37kbm8oVqgCWKsIO/dhMC6exdF9KDpdwjLgVjj6sozrUtit+TFXnI
	JTdxCXHa9ZCjs/GoYlvXcIFcLzOLmkMDWadcpmENGVTXHDjKTX9mNR4ukC8Qf3wCOKDBVt8nGSa
	H+H0SHMaUYEZ3bIa516vujxGwBc8vE3s281kXJyDJNbQ+D4mGZea/AC8dfFpHm1CfzXrZb8qc8E
	PqLPRu0q+q/tAzEF2ghU0xV3uRvOENXSsbSiXR1lTxO9cmsLdBWEWHUN7o7Mbyp1Y87oq+aSTcg
	/zLAOaT2xPc/Z/rQ3ICtzXq5GdUiZU6XbLgX/cz1p04nAsbvCIA==
X-Received: by 2002:a05:6a00:3020:b0:898:22b4:c8b8 with SMTP id d2e1a72fcca58-8a089d98ad6mr100749b3a.3.1792529267787;
        Tue, 20 Oct 2026 13:47:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3020:b0:898:22b4:c8b8 with SMTP id d2e1a72fcca58-8a089d98ad6mr100733b3a.3.1792529267299;
        Tue, 20 Oct 2026 13:47:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895c0affsm72200b3a.29.2026.10.20.13.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/12] drm/msm: Import adreno_snapshot.h
Date: Tue, 20 Oct 2026 13:46:15 -0700
Message-ID: <20261020204728.28844-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXztcg7VgS1mcD
 bj5Hr3QF97y6n3Z0f5mlR1ZG0nvbvrlNHO9h42vCR9K3L2tyFw+9jvavCCCE3mMx9Kr58Cr6qqj
 HqbrKOHPbVpTKU541NLvZEitlBy0llRzUfrPcRPcMDNK4FfEFCV2QL+X7mG340E+hCEu68F22tV
 e6EuzsGQ2w0HswiGD5y7ya+aVDFrviYo4XQZGQhldju0fjThtiYTv9MeUQT0A9tVqi1UYlbtzYC
 /l3V9kYHuFvD9X/BIjkJHjUfn4qZTCtYvBGbIz977jPvCfoSJwiwv/i8YHRm2vVzhJzh3/3EHr1
 E63Qvm4VZa5j1sbduQ9LQ0ooZ3RnWkIRaQTs9Ec/7KmGcDae5ymBosghr+Kf//AEfnJWEFRw6DE
 r8SfjIBl5Ayan/Xiv2AVwv9/wPc89ig9QgY3Y6hlVqKw1lN5Zavh5jEExMNnb7zMUR5BP9CTSUa
 jKn4brTZ3i/N/qfxMJg==
X-Proofpoint-ORIG-GUID: lI5vzip7kZfFdaLYkRsyphFwUPfdO9CD
X-Proofpoint-GUID: lI5vzip7kZfFdaLYkRsyphFwUPfdO9CD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX9vjZ+pT2hOZl
 DXgAgJocvjo53RH2IyHkDUbnEmFz5fkhi8fBQST+IG5R4Pwlz04BIuSfRlAYauzlcIWlXB22i1w
 bOGCVJbb+KrJIC/DokHAMROJfAaOLDo=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad7d374 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=brQcgiZQOO_HO4CFPnwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

Based on kgsl_snapshot.h from downstream KMD.  We'll be re-using some of
this for gen8 devcoredump.

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


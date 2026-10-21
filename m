Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615959;
	b=5cejNctc1vx3i+LHygzKwLIzpQv0Y0P/sPJcXtu68JdpIMW5M9Y6rccTA0OXhlbgMPT2
	 p+eEZ0Xh6O1WdTHWOtlJK4otXGliOKlFu8+kG5Z5GNacSEHHJS0jwEID1hs4KHC0Ro8Lw
	 LXlzePdCJEuKBys9DVEBC4Yekn3kbh2NRrs9qXDxBFwoKDBUE7otx9J+bxkClOk49c+0n
	 yuPSXxUMZrOscy3QOvCMTUKXKlQCX75zFSMgdpMqbeqLkMtf51hrKziMlnqOtTv93TOWc
	 E2Ytqr/dbwcc523qfQrTwKnZ8Zrzvza9Za34gXvVmqG1VaoryLVNH6HBNsMn352ognA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
	b=cinJnhDBb0S+VNp1tZf45PgJQGu+FvG11l+2XXDJXgYLC4GBgiObyb3nKFu6waSH94Mu
	 i3MANl3I6sbqEacs6USEfGp6Cc9iRQ5c0FaIFYAGa++rSmgcddZGNgL96o6N4uSKZmlql
	 vduu4o8FjLQv0gEFJ02tTTKFdw5MwssP4589vkF3nVsw5pPo8tgWdKJCsr8CM0+CCPR/w
	 chAC2iGmibxFIbM6RRV/SnIxLkxgFdLOxlmgFJMrdax1fqcYwtmZbMzFtJGjMy3Csx96E
	 1GGz/JZFYpY1eYRnpYPhLUIQ+/T2vPdknk5TVMtBIofQ42KwjGJw9QOFUl9xWJ7yC9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ptnfahLc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OlM/Evas";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ptnfahLc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlM/Evas
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeI6r2237353
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=auHda5CSTpF
	NG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=; b=ptnfahLca0cZq0mT73qzdz+8kt7
	2Ohh663xAw2jNArWSghcXP6bpdmgP0sX3bxaXoryYcmgFDvL+JtEiqel18VQshwH
	suOrzTEytnKJ+0uFNhvLW9DI31/YIJIvxEwuCwmZI7UsQgf82tOzzUrnJqyIXqX9
	rBNSEpv2yaQCLl5v0gDw02lmYkBmopyHvEq39XdQ8sJO8gvGkOudbLNXKG05XdzT
	IL2GnWa8UOEGRUrFgLWML0g7Ho4VUTvGNuj5n9PckSvI4lHV+ecmecsCWGKuXfa0
	rdebcNZfoNy4jpwRUpbREV300gyEZfYZcMcdd3zrWLEf0WAdb2DihzBoz5w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0v8906u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a030e0f9c1so1093611b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615957; x=1793220757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
        b=OlM/Evasejqo9akjipCd1qpx4FnuKO9KjC4JSP8xc6M6BRfa3joQT8FqrOex66JZ0D
         904ueBafE8eHPLji4PNDEn0FnfFHT+hjVdODHQVa1t9c8IYaEkYjdAE3/K9n+ycqCCCN
         LAwXMjHM30F6tjmnwc9qXE6XqRAQ5tQEbvhebQkR3vrq29aUooIGSLVsivcizCT0PKWo
         rj4jJDlh4wUVrTsfMas4sqGSW/TF5rS6y8FsckNFgajWAjWqi+4+z9gpmD0nwu0DyJr/
         V9n9SpyG66lwN68rKTv/lKt3KEbBHSQ6OifbtjiluLsCEF4Hq7KgMGUWzD4bxkdDkefh
         v3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615957; x=1793220757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auHda5CSTpFNG1o4wVJLyt7WC09ph7Sw8ajCkX07shE=;
        b=qKx+qYqud1GBph0+ks2wmREdv41Je8e4zRzeUXbsBchIb7niOr32cmlP9z6FCO9Ynx
         3vLKwxtCkOAiU89/OyZ2XGHpmNkivl6fYkxMvnurKgundJRHzMj/UKiU/u2CuN+Wtli1
         Cupd+yQGbfLadQvhmiMiWd8k4dvvzBXCdDfcOM/FDV6vYysaWJ9unByTkFWXiBvhdHZ2
         pGzbWIBstK4W7imWQrCmT2P/g1gJCRWLIE4F1U/GbOdnyOFt/fzGJDLKKMTZeQ4ptXaS
         a2nfAUlgno4ffh+j9TKoF/8AcUCs35qib5n9gzEowsyRtRPctjmCU98cFKMsN6czxMuR
         80pA==
X-Forwarded-Encrypted: i=1; AKwUvBzLqLBzkxcSQc+Ycym1oUr1AK6hOtgTUDg0rHADS4YML1QL3gEA9IX3ySWMFc6+XMXHytn96Sspy6+ouIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5f89tRgVK43VulkqGCTnyX1ooRMlFRcASh9Q2MEgGju+X0Msu
	UGv43T5gkkrGTG9iP8arYvJKVCOR/KNQ5zrp7+FqSFzcLceRqbgh+THwQH6Ld9HFm9X/4rA1PjN
	XRrL1/LsDJRmbOc0eHgMqgJqgNbyYbpcC5CyHo4UxfKjrl8wg0+D05KPnCOkmbEARCaM=
X-Gm-Gg: AYBFou2U9ScFxq+jTft5z/obiySN1Q67zc3tHPWFDhj93dhMT5MkojAnx4aFxvZ3hJz
	aLajkhrFO5k4y2XLkIF/Nbz6gzYYw0W4M0jx0IZXQq9AApxCrYmcof/WKV7uAKIgUZ4u8d3HNOh
	GdtfGzfUne5+7ASfxfb1VClSbSUZBF0z90wAz/aKDSbyWg4F1AshloGjlHpuGf5lVmE9rine8aX
	esGbxCeDeI9lgVXqwrNDZfyleolgGNQES8Yed0orFZLJ90mg91Bmm5vqEG1UTx4C0GosFvyM+20
	iupewwV5UVt3BYzD9LL1YpYWC/4c3pqocDqGVb3Ya3yLt7wN8p+Lm0AYwIOIw9Jru9WoKlBI5ck
	4alDiNjathlnavMop3Myt8i4M3uxkFqnu/Xrg933qaDg+eqaG
X-Received: by 2002:a05:6a00:e10:b0:880:fe7b:bc56 with SMTP id d2e1a72fcca58-8a089e15b88mr2375416b3a.50.1792615956553;
        Wed, 21 Oct 2026 13:52:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:e10:b0:880:fe7b:bc56 with SMTP id d2e1a72fcca58-8a089e15b88mr2375398b3a.50.1792615956021;
        Wed, 21 Oct 2026 13:52:36 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895cce93sm1314823b3a.30.2026.10.21.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:34 -0700 (PDT)
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
Subject: [PATCH v2 01/14] drm/msm: Import adreno_snapshot.h
Date: Wed, 21 Oct 2026 13:41:26 -0700
Message-ID: <20261021204244.67160-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C9Z8WgP+ c=1 sm=1 tr=0 ts=6ad92615 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=brQcgiZQOO_HO4CFPnwA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX1f7kqCWsJqIs
 37iA52A2OkvcghoU2AFB7H69AGaxOjUmBfB5S/hzzdqX/tNKVsqVVqEmrEo5JDwSfyYxsHNgHZ5
 dMPQFFTf6/vJC982iw6ybL3BuNoOepU=
X-Proofpoint-GUID: bol_Kc24h7_Ekfe-iwXnhvvRAG-bLPF7
X-Proofpoint-ORIG-GUID: bol_Kc24h7_Ekfe-iwXnhvvRAG-bLPF7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX9oMLlfAxcRA8
 i7vcLhUbOcSyX8oUk5HjzeX7rFGXtSQd1g5HwfXpgWJ+BqbMZ8u5LPwZj0cNPgBQJIwIoiESO6C
 Mu8hzXSx8mR3sQqiRHCS3JQx4OVL6zP9kKLAVGVoSwzUSN9B7YWJ8OPiheWC+nPJC+Bh2tS4Bmr
 s+AqtNXOHBZ4wb5WEQ69kVTBW0uIX91/d63LDybSvp2E/ThrbyFTrzosCvx3UvQtbV21+8DSN0f
 BtCwLOZMYsi5bbaMeuoEb4FQgxkIIF4gN42SrzL8/Ux41UaMPySLI1ctD4wdH8ENdIoZ90S83/0
 JQ+UdC02Arr0rDyx6UuPB1H0qz/Y5O4hFpYLLnl7whb80DY4ygbD+aQbCjRM0XGifuzw2/VEkNA
 9oxxnLJPHJ4Htsd1sGjgRvqBcSqc+/z6+UeZL07NX9RvgY/m7tRXQKuYRLzQ+TKz7SOebtlYrZR
 K7CYW8QEnWOhz6GwT5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

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


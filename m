Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995787;
	b=3jcacfusxATwLkfXDbLefYBNDz868lkgJOiJHSQk1vXXxbL00BBr4ZPV+IdKX2LANNJp
	 RSkZlNr6yHCh39MoPqq58y6ZI7yphUU4Z1BCEcC/tkRK+l+57Z8LXv46tH516WIQ1eEJT
	 7pzbFQY9UEvUH3UHFPT4k+oJ09RcUmPqX/X35OwyO1rD8bweeST/x6V9u2qg29mXQPmAO
	 PJlwgVIXxl50pHL1vvHHL17hhj9yrgNuEE/KZxeVUQaNtgW+OUjBOwxmUePJ0nZGlVIAk
	 HKRZuLlBQl1nHIr/QrWeTGLxSASbnGmY28qNGb4qmSk05H3xXRpeoC917gqiKU8IH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FOTpEFlT+y/a1rTH+O9UH/+T4QWFtNapc0ipHXawgfI=;
	b=xbWCFgoquYtn0oqEwxdt+EB3au9B4pAerT3ssqmB7KSxREfr3cEbtZ8O0OeB2T5tihbr
	 wWvd4sMF7dbdocDSZFT9rPIeSfxDG1DgFwQzfI83zH2gI6JX5mRnm4ve7ExsszqEQtUzo
	 SrXnZKnWLnfWn56yOOx2QRcDL+R30VDyvf4Ox831jLGND6biUW+dIJZtvAXOZUUPKVs1d
	 tAvjAZJyYGUQWBVoO3V+sW3Rr8AbooZE2CDuQXKTa5hKymLPtAWzVOjtWx55rcy+48kMe
	 Dz1csATxepZy3vaRua7hFDWFg9ZnrCrJ4ZUc0AEsjtDC+fj+v0j9XXyDx04v9+LWVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eqq6Xly6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jx1l3e09;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C601606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C601606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eqq6Xly6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jx1l3e09
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avUv2727100
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOTpEFlT+y/a1rTH+O9UH/+T4QWFtNapc0ipHXawgfI=; b=eqq6Xly6j99rVXxm
	mTMq6xSCi4SVvYsj6gI/WPSO/xQ3S3GU6gaMtmo6Vk6MCg+dNeUJoFzftv+auoIt
	Dy08ozdSZLaxETXhRU5WikzK5iroDhSedoGKCVyFGEaDLMcPZfUOfXFm3CuaguJa
	T0B5KvsRAyxdMnFR4gcC5+VDi1jlyQOaHiTce5Dwcect4a+2VAzt1NxHcQOlvrNl
	pSINbm5NOU8CAVE0VtjzUmo9SbLqMZNTNULAaPeQ3JESGMi2D9DYFG2JZ2O9T8+B
	YNy0LsCNrJhJSNVBB1huy5+oOSL3GO/3OBnzwxqe2RHYdN/k4murgsQ36qeGYanK
	5wkOLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6n5yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:23:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso28734225ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995785; x=1793600585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOTpEFlT+y/a1rTH+O9UH/+T4QWFtNapc0ipHXawgfI=;
        b=Jx1l3e09FiXVC1g+XtxLvWyTQF/uFw5Iz98owwCe0UEiRV6L1wlgBkdL7pgIA+25XW
         RLwkasYyxG+WfDg+CWwo0yR/4u0Mx8MrWEkQMaT7TvYyRoP3Do0wZ9k43DIHY7m67VIU
         mY3zCa8K1dIKBJL1g01RNp9ovHQIzoRaS8Vvwf1UcbkfCKHHX9O5ArUIyrHsMekW8bes
         nCCXDnI2SXICHAsbyQSAT+Z0ijmOiLIPRlx+OS8+I3eTjz1BudNldWB2/UHpMJn0Fxhd
         aeGYleKLMLA5HnG3r4zVzeGU8xzvkOe/di2+VwY7Tzqd6CMUI5jgO+1LJn25crZCSA0t
         VWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995785; x=1793600585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOTpEFlT+y/a1rTH+O9UH/+T4QWFtNapc0ipHXawgfI=;
        b=cfk7tNLXimLITfa766t6+jd5Msx2yQ2PC97vQxoL3Q95oBZkn7JGw92E0G5h1P5tx+
         v5HcC4tq8GG8yeviZPbYqqJZ0ULGwX9hyty5DKG6+0yizwrT6qrbI46Rmdp/7XPkDxqR
         6k3La0MQ0D3RmhYIqF/kwvD6t9mPcseX1A+RImRpgBQSE3W8Ov9DdcttZF7j6i7yb2V0
         cGvr1py3I7fAkwtuiEVE+dv7Xz6Bw0WZ1J1yeIGCNdTm6dzgKTywNGHBps+37nrsOEqq
         +hrSScmOolOvROLMOvS+r5oquf21WxSNNRwUjWXjUcX8xtrCR9uH0AwJgA7HYXCTCzf0
         iPog==
X-Forwarded-Encrypted: i=1; AKwUvBwmI8zOw2R95LM1pVIEKY0BhuYxOQOXJwdJjcmBaFMu6z6luabTscINYQHM6bKHnXaIFjCdfce8e0lKQEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL14T6/i12YXqIZwDeC51xF/L7mM3WR1OTQ6R5VP2HjUI0YoRrS
	L/Kex+J45hV127LUpGlIfPoz3rCpLXEBZEvRzb3Fdg4lJTmQ3ss6xoTe/BjkYk4jL5FXlwANtOr
	TsoLH944NyQxfUWnGt2nj8yOHbW+T59vgzfDz3RakjEdrcnrAJcNtbz+SIXCWo+Qjcl4=
X-Gm-Gg: AYBFou2ryEgYUux3yrtM3rMsD4IkGF8EUbokcGx6xlUYgu6ouDa4fe6xDCL6ZKF3A/G
	rMFTvfduL3jgKNX4jNawgGdpJ7o3t3HUP1HbgtSb+HuH5lmxWW2bTv726jrS+MhLiNg3Rm9YhxX
	aa460ZD0UKKiwp/zpr6tZ1RkzaR5b5/vR2CebhhhiyXXgZ1FpJ2jspNSvFLWudikOQuRhA/2Qg1
	weygqRdbx242wqW1pj8xLdsoH/GYMYlQac6WxrgnxRf8WRjzABe+5Za9A3ntViIZKpByS9hz3St
	uWSZbcU/pvuS637b2NSZ5IFN08X0b5xKuO2v61FvrdyCvx3B4NmX6Hxns0lx6mj/uu69Q5GsMJI
	Smhn92r/2UET6YUHfcLEcT1Vu0p6IoCcCcA==
X-Received: by 2002:a17:903:3850:b0:2ea:7180:3ab9 with SMTP id d9443c01a7336-2ea9c8afeb4mr48269965ad.43.1792995784628;
        Sun, 25 Oct 2026 23:23:04 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ea:7180:3ab9 with SMTP id d9443c01a7336-2ea9c8afeb4mr48269755ad.43.1792995784146;
        Sun, 25 Oct 2026 23:23:04 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:23:03 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:18 +0530
Subject: [PATCH v2 08/23] drm/msm/dcp: Add IPCC power notifications
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-8-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=7880;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=ZliBQcpFZc/16J0ivg4K92KJ50R0FEFC7a9oWSS2AUk=;
 b=oeF2+yhu6C0tTEPvS4ijcCGa3EHT1863DUfZIbjiUMBcQ15kbRI0oR2KII+grdry/V7RCxSJT
 3oyw8G3PXx7B2Xb39BRODfFABQmVENPqGVOsWGj/n1PxFxmt+AyeeZ+
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: qv8K1JV9W_4bT1NF4DzlF0wgBSGF9y-_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXxGzijib9BWwb
 ATSUI3OtpbPDBQ3C9CLgwQDBtCyNU413n8mCvxvErghyKOF+7WSQDuO0vgDQeun0V+B3akoibnI
 aXgpNhtOmGVkvA1ktbh7CXO6HxNbgX4=
X-Proofpoint-GUID: qv8K1JV9W_4bT1NF4DzlF0wgBSGF9y-_
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adef1c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Rkk83rcldGj31tuyXloA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXwA2eGW571Hem
 FGIHWLiokZy8Lrn9udT/t4qG8wuawSM3qvsCgrrz3IxUK6ThUBSkQR5xfrJW6PfP8u7kV2herHv
 qzxBMfuCPxi5ipAdhCUjwmQD3MEmbmKin4jY1diRq0LxznbnmtOrbRsxX23RC1Ib84D3NwYKZUk
 LmBFCuy4xEie2HzGzP7BhtygsZNRJPnEnjwbOenrmfWCfXrOYYwmvlG4d4xyyJI2UyX13gAfBDR
 hDyHuY4Yb0KjC0fe0lKqZqF/lf1NsA0MoKwUN5ROwasX0fjCLRb5CjXsoknZZt4JIPZqlpP7+0m
 pmP6+AvidZWlYmNNsZA/Awn9d8tqdp6Zz8QlbompQLdxiURl9nSyI4UAh9t7XNSOndkZith9Ihw
 nkX84ZxaIbHsaSMB7nf4ip2UhmuIc6syFnVsFTyZ9nGKqQo4evWdrkiIzHqcS1sfCOm4vaLVFiv
 aksMosNa2R8EGQPwNdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Wake and acknowledge DCP firmware through the platform IPCC
channel. DCP may power-collapse while VirtIO-MMIO remains accessible,
so a VirtIO queue kick alone cannot reliably wake firmware during
system power transitions.

Implement serialized IPCC notifications, bounded acknowledgment waits,
IRQ wake handling, and teardown-safe callback lifetime management
while leaving HFI data transport on VirtIO.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile       |   1 +
 drivers/gpu/drm/msm/dcp/dcp_drv.h  |   1 +
 drivers/gpu/drm/msm/dcp/dcp_ipcc.c | 173 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_ipcc.h |  42 +++++++++
 4 files changed, 217 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 56c48fe2e2c5..9c698c4f4949 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -73,6 +73,7 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 
 msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_core.o \
+	dcp/dcp_ipcc.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
index 44d9b2cd5171..16f87035cb9a 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 
 #include "dcp_hfi.h"
+#include "dcp_ipcc.h"
 
 struct dcp_dpu_kms;
 
diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.c b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
new file mode 100644
index 000000000000..e161939dddc1
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP IPCC power-notify mailbox client.
+ *
+ * The APSS-to-DCP channel must be signaled before a VirtIO queue kick.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/jiffies.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/of_irq.h>
+#include <linux/string.h>
+#include <linux/virtio.h>
+
+#include "dcp_ipcc.h"
+
+#define DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS	10000
+
+static void dcp_ipcc_handle_rx(struct dcp_ipcc *ipcc)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	if (ipcc->shutting_down) {
+		spin_unlock_irqrestore(&ipcc->state_lock, flags);
+		return;
+	}
+
+	complete(&ipcc->power_notify_done);
+	if (ipcc->resp_vq && virtqueue_kick_prepare(ipcc->resp_vq))
+		virtqueue_notify(ipcc->resp_vq);
+
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+}
+
+static irqreturn_t dcp_ipcc_power_notify_irq(int irq, void *data)
+{
+	struct dcp_ipcc *ipcc = data;
+
+	dcp_ipcc_handle_rx(ipcc);
+
+	return IRQ_HANDLED;
+}
+
+static void dcp_ipcc_rx_callback(struct mbox_client *cl, void *data)
+{
+	struct dcp_ipcc *ipcc = container_of(cl, struct dcp_ipcc, client);
+
+	dcp_ipcc_handle_rx(ipcc);
+}
+
+static void dcp_ipcc_free_channel(void *data)
+{
+	mbox_free_channel(data);
+}
+
+int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev, unsigned int irq_index)
+{
+	int irq, ret;
+
+	memset(ipcc, 0, sizeof(*ipcc));
+	init_completion(&ipcc->power_notify_done);
+	mutex_init(&ipcc->power_notify_lock);
+	spin_lock_init(&ipcc->state_lock);
+
+	ipcc->client.dev          = dev;
+	ipcc->client.tx_block     = false;
+	ipcc->client.tx_tout      = 0;
+	ipcc->client.knows_txdone = true;
+	ipcc->client.rx_callback  = dcp_ipcc_rx_callback;
+
+	ipcc->power_chan = mbox_request_channel(&ipcc->client, 0);
+	if (IS_ERR(ipcc->power_chan)) {
+		ret = PTR_ERR(ipcc->power_chan);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "IPCC: failed to get DCP power channel: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, dcp_ipcc_free_channel,
+				       ipcc->power_chan);
+	if (ret)
+		return ret;
+
+	irq = of_irq_get(dev->of_node, irq_index);
+	if (irq <= 0)
+		return dev_err_probe(dev, irq ? irq : -EINVAL,
+				    "failed to get required power notify IRQ\n");
+
+	ret = devm_request_irq(dev, irq, dcp_ipcc_power_notify_irq, 0,
+			       "dcp-power-notify", ipcc);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				    "failed to request power notify IRQ %d\n", irq);
+
+	ipcc->power_notify_irq = irq;
+
+	return 0;
+}
+
+void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	if (!ipcc->shutting_down)
+		ipcc->resp_vq = resp_vq;
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+}
+
+void dcp_ipcc_deinit(struct dcp_ipcc *ipcc)
+{
+	struct device *dev = ipcc->client.dev;
+	unsigned long flags;
+
+	mutex_lock(&ipcc->power_notify_lock);
+
+	spin_lock_irqsave(&ipcc->state_lock, flags);
+	ipcc->shutting_down = true;
+	ipcc->resp_vq = NULL;
+	spin_unlock_irqrestore(&ipcc->state_lock, flags);
+
+	devm_free_irq(dev, ipcc->power_notify_irq, ipcc);
+	devm_release_action(dev, dcp_ipcc_free_channel, ipcc->power_chan);
+	mutex_unlock(&ipcc->power_notify_lock);
+}
+
+int dcp_ipcc_enable_irq_wake(struct dcp_ipcc *ipcc)
+{
+	return enable_irq_wake(ipcc->power_notify_irq);
+}
+
+void dcp_ipcc_disable_irq_wake(struct dcp_ipcc *ipcc)
+{
+	disable_irq_wake(ipcc->power_notify_irq);
+}
+
+int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc)
+{
+	unsigned long timeout;
+	int ret;
+
+	mutex_lock(&ipcc->power_notify_lock);
+
+	reinit_completion(&ipcc->power_notify_done);
+
+	ret = mbox_send_message(ipcc->power_chan, NULL);
+	mbox_client_txdone(ipcc->power_chan, ret);
+	if (ret < 0) {
+		dev_err(ipcc->client.dev,
+			"IPCC TX: power notify failed: %d\n", ret);
+		goto out_unlock;
+	}
+
+	timeout = wait_for_completion_timeout(&ipcc->power_notify_done,
+					      msecs_to_jiffies(DCP_IPCC_POWER_NOTIFY_TIMEOUT_MS));
+	if (!timeout) {
+		dev_err(ipcc->client.dev,
+			"IPCC power notify acknowledgment timed out\n");
+		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
+	}
+
+out_unlock:
+	mutex_unlock(&ipcc->power_notify_lock);
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_ipcc.h b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
new file mode 100644
index 000000000000..2d1ddd5adebb
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_ipcc.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * IPCC power-notify mailbox interface for DCP firmware.
+ *
+ * Channel 5 carries APSS-to-DCP wake notifications; responses arrive through
+ * the mailbox client's RX callback.
+ */
+
+#ifndef __DCP_IPCC_H__
+#define __DCP_IPCC_H__
+
+#include <linux/completion.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+struct device;
+struct virtqueue;
+
+struct dcp_ipcc {
+	struct mbox_client client;
+	struct mbox_chan *power_chan;
+	struct virtqueue *resp_vq;
+	struct completion power_notify_done;
+	/* Serializes concurrent power-notify transactions. */
+	struct mutex power_notify_lock;
+	/* Protects callback state and response queue access. */
+	spinlock_t state_lock;
+	bool shutting_down;
+	int power_notify_irq;
+};
+
+int dcp_ipcc_init(struct dcp_ipcc *ipcc, struct device *dev, unsigned int irq_index);
+void dcp_ipcc_set_resp_vq(struct dcp_ipcc *ipcc, struct virtqueue *resp_vq);
+void dcp_ipcc_deinit(struct dcp_ipcc *ipcc);
+int dcp_ipcc_send_power_notify(struct dcp_ipcc *ipcc);
+int dcp_ipcc_enable_irq_wake(struct dcp_ipcc *ipcc);
+void dcp_ipcc_disable_irq_wake(struct dcp_ipcc *ipcc);
+
+#endif /* __DCP_IPCC_H__ */

-- 
2.43.0


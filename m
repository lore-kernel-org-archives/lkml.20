Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995851;
	b=xjdOTLJIJa/zT5ha168s0w8d47DkBBy1ZyihxTfyEb5r/HjIl9vNnUSXUk/du5UWN/B+
	 MOKalAQND5BOo8cqT5cocBi0VCPvYm4uuPPX0Mg74CoiEi/gfIytYxomwUwJhtEhxfx/2
	 S9PTShrav7o3kCsBW1tzwb6hXFCMj7WP43b8r3mgBBpLZoun2wIaOStUg/qTYpiio396x
	 UcogwcuVRaKpq4w6Ir4Sx/Uzh2pZDvYkezbocCVsGpfM575bDnnRl3P7pxkOiF8xL95dv
	 y+3UpcDAzLcUk8M/tIBQVTa6hOlTt6o/7AfoF7gK9Olwh5Ij6h9GkfP5EKWV3cEFfvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
	b=XP/8tC3BDilhO8+T65zIYuNMckUG5j0JgJFrf89HM6ZzGtuQ+CGwgks84li3JlavL98y
	 ZL6Kfq20duPZDZS8yE791++MTlSMdS2ofihWJia83yA3eKQojfbmTRSUx0CS1sxs4vO9o
	 snc/GUx+4XJoe2afGKnu4U9DKfqvxJslZXP2mtWn0M5akhhK0nkTkre3FdGbbmsEo1AJG
	 Dbcqbe6k20uITgCnpJ+BPN2Zk6IAMBCa+FSPy6NcL6EPtH0kZJFUa6n+Tw/ZoWMqaLstZ
	 bImNzkvc+E+1YTspYcaBB9IrT5OsrYBK7epFFJnyc9XrEWK1ihPN9hXiVH+oOAo+9YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ft8d/0/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E287606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E287606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ft8d/0/n
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b1dT2806313
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=; b=A2CpUTms71nD3qMT
	L4/4i1Uxo6TbXp+ULA2JOUWJq2RPs5f7/Is5LQtEIqUBqSyJwG5yTytIEXmlYRnO
	LlnaVPZUXEekEjDBabYAdzux3qlYkdyLq0g8l1+AvZZWmFLVO21gMmpWwEoVt1qj
	YsSmT283eahVnjKt0dFeClSdA8tZQU6rF5Gn+syDn5y98A4CjtkOzmeVfWv1onop
	UWGrWmNmrL5TfcN9N6C0sVttd2bdPucg+iCOMhT3yuWDzTo6Zlq0H9peHrL+DlC8
	iPvSEXoDaHTUTjKzgijekV06B18x+lZcNECmkQ5j6TXlKExQXExoHjPWjGHppbzU
	uXYOEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xn4c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e942b1cc86so29817345ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995849; x=1793600649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=Ft8d/0/newVC9d89LHXpmUPlohQNak9h4/+zpkjzEOmPHPMc7ZCaPMBylqHblASNi5
         EHfoTRdFvm9RvSFQGyNEkuFq+UOn6OszCSWMTXpEIEPapVBhEhU5KKaYGCMmPMMhO6pN
         fL9kdxfvqDDz4qdmmSvE0iEjM3D0rhpxBOog5OMDdENKeAXSw+PhvSwZ/QkyqtSYmxqg
         84UccQcHaTPQ5eR88+maDpjvUCSz31QF67uHXUzKH5ZrHMonsh15QNnuzP6EksSvl3wA
         QswzmzV+6QTEDyK7N7kC91ICJUADYvMyQxeAdHUucc6TQlSUlfJy7PkVNASF5waQktl+
         E7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995849; x=1793600649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=biDljH1r0/vnKQWxAl2NjLZfRFHSNKoAhUgxXZB8vtMuWMqjpgAUwK3F30/7G6oauJ
         0Pgun8ZsOpl5mwa6IDbO3n11oPIT7BYM4+Mw/Y9u5SCu9lFKd8jv/dhR0TZIF2kjxviq
         1Ddj5+o3MooyaJ6JkPHzT4e7pEhoB042moO+8y6HRoxCzsfcgoDlrMjnSolGnk25c1JT
         aNetGkQjJzV0grVIp4jEpat/smxOLXW4i1nAhZtXIxBrpJIdcCaCfnMg5AHcsmp5zSmI
         E8gIaJwgnHf6++9D6fiaJcmg5+ZhQzTMPG7W2e+VX/QQzAmkvQv1LDeJ2zyy/qSLfuSg
         bauQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGYfCa5/iCeYBTa3nIW0SL/+65uNFtgAeFs5CdFwj4XKAYC1cH/en81M8jkcSf5RYkHBi44fNLlo6xK8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIerA4drbTOWUWPW4/rFAeze6CBOTrAsMOzXIpzi5FOmNPvfKwE
	2gbr+jMQgboJZAkL3F0ylfEK374l6kgIFYHRqCYz/QT+Hsikn7qnpZlxI45BWLm3OeQTDx2dEsD
	RL7myvByAyDT9Ca5e/3TS6PrSptAIdfbrwLFQ4jXBA4K7q6ELaJzEtxXIwM4CLt8nIdg=
X-Gm-Gg: AYBFou0d3zgY4/6Q4qajw6gVoTt01Sl8QvTWb1k03nmAYJqbWh3w5UE00V7ZLraWZrb
	7VFGHjxSb1LtOLWRZwYzJplhKFbX0gmthztZFXffQWKOJ3j3F2Bg7aeTJey515uacj5T4QDtKA9
	Giu9EM0NSFkV1FjiLCJ0grmtY+9MH/J2KmuoRxPA7V5dpHPnQJvaadBnQYMAuyxav+LJlPHfq+S
	byuSUugVmGYfQr9xFkm8Be2SgkCzwRREvUgoNpNNMJoybMe6eSFIZhJHysw603nEDh0wuxiCP98
	k/DOn2+EDcmoMPLVmp2VC//2ZSxZ+Wl2Wz4Zy8TVhZTtG+ofE6zlrs/LpVGOn0lHrXJirBhSq1Z
	eRuMFQZnX7kjef9ZlvI3kcFdQcQfuVgi/4A==
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43098915ad.36.1792995849353;
        Sun, 25 Oct 2026 23:24:09 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43098645ad.36.1792995848887;
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:24 +0530
Subject: [PATCH v2 14/23] drm/msm/dcp: Add DCP encoder
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-14-7cf014efdee1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=2736;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=13ayK5iaWertmFXymKPgINfX7fwgPHD+tgYvEDAKLs8=;
 b=zmwgbeRZoqTMrzpI8+a/t3MlIu3IDSlRDVgwwS54kYHPLh7/+sgEF+x7gACCHhdFfzZZj8Vly
 V7W/Eljs9FoDWuakAW53sDKzOr21oUkTPeVA72jFeTstFMQfl57YL2J
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: n1wpbMs8FWhaI0FYrFREe6z98Mqv2wsi
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adef20a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXwZkWx6H5Xgc1
 7++yG0DgPiFVOkN19RK8mPx5LuD+UDRU7x1uyGDyBsVrk1g+I/2LKkjapgl+Xr6NXSOgqymvRGV
 3DYbtkiJ/Sl66Z8AU6SK3EJw/ftUKVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7H3uH0mDGJLh
 VUGM6fI898TsGZ62DeaPDGv94i41Q1ye7IV9mq7X8WQBX1HzruKyoChAFqH/G84JPN4bbT9Rbg4
 ESkrTRFoREVrhJDqzOkT44V3o6/r84WKx9lxwj2+SivKLu0/wmMaoEEab4KWeWLuGMoXTl362vp
 rjKTDDOaVS7xWpyXniIe3mQ2PMdVZivi6mDmZzpLiJ9BhFWbooBTZDl+Q2CeAYokiEWQmN9nCbA
 29WSICbd4XOlfm6RWmEVEMuIlAJxcR99K+gr7lUGU+pitIXe2+vCagTltyQHN50D23a25vvLVwV
 vpFzFJDlUJQqXaL9x52W0f+9d6t3IwS1gVZudNLDzWD8v0g1Ux7nmyB5+o2QgWYkBg3LV7aCaaI
 GOAuuBsPsEa8bXdxzGGBednrHTdvrYzrpsyIx3eRLWxLIDBvM/oygyS+Zu9oH//AS7o3O8BSCyx
 kuN1cd1SQWZdgYtOnsw==
X-Proofpoint-ORIG-GUID: n1wpbMs8FWhaI0FYrFREe6z98Mqv2wsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

Create the DRM encoder required to connect a DCP CRTC to its
firmware-backed output bridge. The encoder must fit the existing MSM
DRM object model while remaining independent of bridge discovery and
KMS registration.

Implement the DCP encoder wrapper, allocation, and DRM object
initialization.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |  1 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b425fefda890..4024f6b1e3cf 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -83,6 +83,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
+	dcp/dcp_encoder.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
new file mode 100644
index 000000000000..e7a64c960bdc
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder wrapper for the CRTC-to-bridge connection.
+ * Hardware programming and mode sequencing are handled by the bridge and HFI.
+ */
+
+#include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
+
+#include "dcp_encoder.h"
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
+				dev->mode_config.num_encoder);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return encoder;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
new file mode 100644
index 000000000000..de40c9bca4bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder interface between the CRTC and bridge chain.
+ * Hardware programming is delegated to DCP firmware.
+ */
+
+#ifndef __DCP_ENCODER_H__
+#define __DCP_ENCODER_H__
+
+#include <drm/drm_encoder.h>
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
+
+#endif /* __DCP_ENCODER_H__ */

-- 
2.43.0


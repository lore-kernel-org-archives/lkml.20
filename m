Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995905;
	b=iVn9x0LmjSzQtDRHM8P5H/uQItR9Y6wcbtNU3zMU+64KWUTLQMcf84Kw/NZkKNb8x6YD
	 K1EhKMEl5snQ5fHc+VUkS05Pidcmue7TqAtCkbXLWlWB73bFmZJfV4aTv490gkYqLs8rW
	 jb56cDp0rF+AVUp9cXTbZ44DBO9We8YKPzyaeorIJuz5MC1LLB/ATSIR7L7r2oJttqGHE
	 q5j+Jw8G0ucCPV9tPIzFPKG3fOR3dheMhZeTPlVDebu1eqJJYAW20//smBEQLGR2KcD+Y
	 ZBBYSidiIKnZKAdCyRILQjeYS0UowQFUjuP0WarwrxNOEkK3a+tyXXaJT5MGaApzvsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UfK8ro6YBKULWFf0yOEpg1Jg+cMBgbRrL/O4VJcloy0=;
	b=rEXg/LkwNnqjlNqDE23rreRkLUNOEj+mB+8eV9eJhhD4GSg5yc4zqDx9DxPq6yiF2DpA
	 9Rs1pyEVp10bwepspxlcwTs1lzl+YT1QYcXt14yMsTYuP4x1pW197366sHf/K6n8rFOTI
	 EdTb55q+V8MOnFpM2BikCFS/a8apfaorgn3vZcx2xAejnGOs4jLWz7mfc5d+XkDCwV2Zu
	 F9NX9+WBOA/uF+b5wEBFw9HSM5KKC1D3jBT66TdHIm8h/AQQjY4PfOwl1r2b1FJuZP7Bh
	 urH0z1yqvwxgcy/Airgs2z1N5JtMcW/XUUDe4JY0vzrHz9kRhIfz17cBMWj2cs/gL0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hhziCHIA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWBBbOL8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BE606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89BE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hhziCHIA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWBBbOL8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bY4e718651
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfK8ro6YBKULWFf0yOEpg1Jg+cMBgbRrL/O4VJcloy0=; b=hhziCHIAV+s49YNM
	gwyazIhmxhKNALZlNcNN97B7hO8813LIwbh60RgKEHmhlkF2PO4keQb0suSPCFkB
	VK1hGgSMva8B2B2ZLoZ2mWgHB1sTneXkP/q6No+IHp5Uu/RE5fclNyatoLJNylI5
	1ZXMeefwvUKxOIa8l1GdgnO/SWk897jub6uz6lgR/BxgRhKzeixmR4rLfr74YFoS
	gll2a9FJP5pTOmWglyeCbwSM7GYzH5M6y2d1nnfd2RdcAGfJZb4sdMcxhZjVQUKC
	TmUO1Xm2OmMXFJkPE1SS8oOEW71vPAW1FSg1VD3S5m+v5beUaeJxJLMS5Dl8Hebg
	ws0DIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgss4sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93e2f72bfso43366855ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995903; x=1793600703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfK8ro6YBKULWFf0yOEpg1Jg+cMBgbRrL/O4VJcloy0=;
        b=gWBBbOL8iItQUm0z3Uyx8dlQirzeUFuUx/WVbsa6UzZFc+Kp5CSDV4OeAXh4Ms29gG
         Dkxfh1NIFxVWlhqbYSeksW683qyXEibeQaQtC2U22A1j6rBaLHEBcv0WOGFv4dc8XaSt
         zn2nLJNQSu2IPPZWqy2GdTvXD8qt8cv6DkIDteFkpbANFASwsxogXjpnd/q4USSS7Ay0
         U/pONiwaYcXi1woLyAHaFIdQPR3wgZUNftxLTvogrutMaVPy9rsNU+c+vdTKZHwzWQuw
         9Q6MMWdldoHfAxNQcmlNC0qnvtkmuaRQWwMZvwxMwS7ZIIMueu2XCdqcZ1f6X0pAmSLU
         dkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995903; x=1793600703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfK8ro6YBKULWFf0yOEpg1Jg+cMBgbRrL/O4VJcloy0=;
        b=t4ogKDNgk35fc0eysf1YfFI7M/bxwVwkKwCRDlSNVNf4tWzouYBG9IXbfr++TmitXi
         sY7Yi57DmD668ZPq7MpZfKB0gFWnoHqdhwk/frGLqC8n5MxG36aDMyP0Sm6UlbqPKBr1
         Uvpb9htEFwTvn+hHC3bPaU6sayDy0BAD15sC+Tg1bty5dGcyz/TJVzy3H/OA7JFZwn/Z
         EcFcfUHFiu2SRdj9JHzBtDkU9bNs93jayIC9rP2ZpMTK0Wj1B+9s51fR8TI495AEKsyr
         JmlacmkQFgCAJJ0e+jjCzTD8xg96pCAALjEya2bvCM4d1C5qV2oD5Hie71dGc2nubrPi
         dNmw==
X-Forwarded-Encrypted: i=1; AKwUvBx36vhd1gfP8RWQIdZygoGCIdEzbX2C6QVa3LlulDDhpXpxZlR1LB+XlaICLAwTQl9AaS68PVaKZdm1f+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9fACqT32Q50hFEs7y8bpnphH9cKzWabH1lRI8xK/y+uDBTxjw
	vCXDXlKes9Vovn7nhXHfu2x3VAwQf2pDmvCD6EXhnl8S5u0wf/wkkfY65My2WyngVNgONuctwny
	6NdB582ULOlwgGveSFh3yq3Np5VngnpU9apAF+ApeRhLwp08XCtjhyb5QpBrI2ScVMhc=
X-Gm-Gg: AYBFou0hVx0uKyFJJPY6pyb+GEklw6VP3b2FmgB3nsSy7skkJFdVj9VOJniaScwJvon
	gIcDspcYXroIxigUYcs0lYgcZK0SktN6IVG8QaEzc0/dSs6PwWIeoln/R4uKQwPXcvS7VkJ4u9e
	2SpTYvzO7ApW5zP8Krx+iYBAUWS8hvjwxsPriBsRgOc9YqPgU+WY+Xjm94ddw7vAjX192vPS8aS
	2q/MMKBstkR4xoqmT7pz432AjOnrTpaWjaHAdJvOlrPqWMZSC5NcU6+vCRPuP+Je/R0m6b+tZzJ
	PkzdGKzXlQmDnrJXqxUZFjncYrjR98zeuy0iTzX3qzsfESg+CsTdgDgYi6XG9ONmnsH4z32FxI4
	ehO5KC0MM2fp7D/mP2Zg+XmQtzppEPAbGqQ==
X-Received: by 2002:a17:903:1b67:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2ea9c68a808mr49452935ad.25.1792995903016;
        Sun, 25 Oct 2026 23:25:03 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2ea9c68a808mr49452695ad.25.1792995902511;
        Sun, 25 Oct 2026 23:25:02 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:02 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:29 +0530
Subject: [PATCH v2 19/23] drm/msm/dcp: Add Qualcomm VirtIO transport
 wrapper
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-19-7cf014efdee1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=20054;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=7zSF4sY6zncnrr4GnRjJqXimwHryjWSKQ2iZiydv/Pg=;
 b=1EJ3cyxgvv8w0Kf8k6Bv7TTHnPs/O3v5tC4Sk20A7aHdqdIBR6tfE+VAaFQG1r3K381qHB9jJ
 RLiassaWksDCbb0Z2oSglrUBYXq0F5bhDuF5Pk/LPfs7K4o5BW2Uc11
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX85sejSvA4HX7
 KRCFXgpRw1iiL09ROYmF3oTdusA2cj2Ue/FheFkLNG7Yfb11KMOTHne241XQyKeOu9dKBwUoaT9
 GEMOvuVRo6uldV0dcG9VaxqLShpSomU=
X-Proofpoint-GUID: VYqdh5q2COya3P12JZ06WWJWo0U3sAOU
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adef240 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6ocVsbahyeKvX6zM63wA:9 a=aGOEizDaUHAs3sGO:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: VYqdh5q2COya3P12JZ06WWJWo0U3sAOU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+olF7Buzp5G0
 Lkn49Fa7sSC5fFeF0Vi0tsNHHWcHN5w0huk+NCFLzDnvsQmcRSqPL1MVtTo/J6ay/lmNkdo+SkP
 pa78uuSkk5k3wA3MsyNOE6/OSSnfQr+mH+nP+3XWAE/SFaiw/DHf0yCoR1yuAN3dY/aAaT5VxIY
 UZEOcWFalMgZ6t9ki5bYEdu0Rff03BGNuvYpODD3b1o9mjU/79TeMA2yNcODj9tMukszixApa7v
 975Tewu3HDT7uQ4POzgED06LydPJm4TtY4Vfgv5wrGta+3ULOqNZiyfiu5FmTodFmCtBbHAjO/Z
 GSNE1oU2zMjCb1XktItQRTxhQpfYBrX9b7lEJcTA4bslcqTFv84zsj/wvlQcG1I74K8+2KuoAit
 grfFbhUnHIe6k1JPPXROJ5+6gKJCbxLF6JL3iMHTrH+J3I/zzPrQXE5xBgTmWntyddmeJ+kscYo
 A6q2ruAqKa73aP3A/+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Add the Qualcomm-specific VirtIO transport required by DCP firmware.

The transport sends an IPCC power notification before accessing the
VirtIO MMIO registers, then registers a VirtIO device directly.

Implement MMIO configuration access, feature negotiation, virtqueue
setup, interrupt handling, reset, DMA setup, and suspend/resume
sequencing in the transport. Keep power-management ordering in the
transport so VirtIO queues are quiesced before DCP power changes.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/dcp/dcp_virtio.h           |  23 +
 drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c | 643 +++++++++++++++++++++++++
 3 files changed, 667 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 9f0a9bfeb2a7..e1a995a8c980 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -85,6 +85,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
 	dcp/dcp_encoder.o \
+	dcp/dcp_virtio_transport.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
new file mode 100644
index 000000000000..a9c3b9aff61d
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DCP_VIRTIO_H__
+#define __DCP_VIRTIO_H__
+
+#include <linux/device.h>
+#include <linux/virtio.h>
+
+struct dcp_drv;
+struct dcp_ipcc;
+
+struct dcp_ipcc *dcp_virtio_get_ipcc(struct virtio_device *vdev);
+
+int dcp_virtio_transport_register(void);
+void dcp_virtio_transport_unregister(void);
+
+int dcp_virtio_register(void);
+void dcp_virtio_unregister(void);
+
+#endif /* __DCP_VIRTIO_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
new file mode 100644
index 000000000000..02c0e2a9fafe
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_virtio_transport.c
@@ -0,0 +1,643 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Qualcomm DCP VirtIO transport.
+ */
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <uapi/linux/virtio_mmio.h>
+#include <linux/virtio_ring.h>
+
+#include "dcp_ipcc.h"
+#include "dcp_virtio.h"
+
+#define VIRTIO_MMIO_VRING_ALIGN		PAGE_SIZE
+
+#define to_dcp_virtio_transport(_plat_dev) \
+	container_of(_plat_dev, struct dcp_virtio_transport, vdev)
+
+struct dcp_virtio_transport {
+	struct virtio_device vdev;
+	struct platform_device *pdev;
+
+	void __iomem *base;
+	unsigned long version;
+
+	bool wake_irq_enabled;
+	struct dcp_ipcc ipcc;
+};
+
+static u64 dcp_virtio_get_features(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	u64 features;
+
+	writel(1, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
+	features = readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);
+	features <<= 32;
+
+	writel(0, transport->base + VIRTIO_MMIO_DEVICE_FEATURES_SEL);
+	features |= readl(transport->base + VIRTIO_MMIO_DEVICE_FEATURES);
+
+	return features;
+}
+
+static int dcp_virtio_finalize_features(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	vring_transport_features(vdev);
+
+	if (transport->version >= 2 &&
+	    !__virtio_test_bit(vdev, VIRTIO_F_VERSION_1)) {
+		dev_err(&vdev->dev, "New virtio-mmio devices (version >= 2) must provide VIRTIO_F_VERSION_1 feature!\n");
+		return -EINVAL;
+	}
+
+	writel(1, transport->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
+	writel((u32)(vdev->features >> 32),
+	       transport->base + VIRTIO_MMIO_DRIVER_FEATURES);
+
+	writel(0, transport->base + VIRTIO_MMIO_DRIVER_FEATURES_SEL);
+	writel((u32)vdev->features,
+	       transport->base + VIRTIO_MMIO_DRIVER_FEATURES);
+
+	return 0;
+}
+
+static void dcp_virtio_get(struct virtio_device *vdev, unsigned int offset,
+			   void *buf, unsigned int len)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	void __iomem *base = transport->base + VIRTIO_MMIO_CONFIG;
+	u8 b;
+	__le16 w;
+	__le32 l;
+
+	if (transport->version == 1) {
+		u8 *ptr = buf;
+		int i;
+
+		for (i = 0; i < len; i++)
+			ptr[i] = readb(base + offset + i);
+		return;
+	}
+
+	switch (len) {
+	case 1:
+		b = readb(base + offset);
+		memcpy(buf, &b, sizeof(b));
+		break;
+	case 2:
+		w = cpu_to_le16(readw(base + offset));
+		memcpy(buf, &w, sizeof(w));
+		break;
+	case 4:
+		l = cpu_to_le32(readl(base + offset));
+		memcpy(buf, &l, sizeof(l));
+		break;
+	case 8:
+		l = cpu_to_le32(readl(base + offset));
+		memcpy(buf, &l, sizeof(l));
+		l = cpu_to_le32(ioread32(base + offset + sizeof(l)));
+		memcpy(buf + sizeof(l), &l, sizeof(l));
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
+	}
+}
+
+static void dcp_virtio_set(struct virtio_device *vdev, unsigned int offset,
+			   const void *buf, unsigned int len)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	void __iomem *base = transport->base + VIRTIO_MMIO_CONFIG;
+	u8 b;
+	__le16 w;
+	__le32 l;
+
+	if (transport->version == 1) {
+		const u8 *ptr = buf;
+		int i;
+
+		for (i = 0; i < len; i++)
+			writeb(ptr[i], base + offset + i);
+
+		return;
+	}
+
+	switch (len) {
+	case 1:
+		memcpy(&b, buf, sizeof(b));
+		writeb(b, base + offset);
+		break;
+	case 2:
+		memcpy(&w, buf, sizeof(w));
+		writew(le16_to_cpu(w), base + offset);
+		break;
+	case 4:
+		memcpy(&l, buf, sizeof(l));
+		writel(le32_to_cpu(l), base + offset);
+		break;
+	case 8:
+		memcpy(&l, buf, sizeof(l));
+		writel(le32_to_cpu(l), base + offset);
+		memcpy(&l, buf + sizeof(l), sizeof(l));
+		writel(le32_to_cpu(l), base + offset + sizeof(l));
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
+	}
+}
+
+static u32 dcp_virtio_generation(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	if (transport->version == 1)
+		return 0;
+	else
+		return readl(transport->base + VIRTIO_MMIO_CONFIG_GENERATION);
+}
+
+static u8 dcp_virtio_get_status(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	return readl(transport->base + VIRTIO_MMIO_STATUS) & 0xff;
+}
+
+static void dcp_virtio_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	if (WARN_ON_ONCE(!status))
+		return;
+
+	writel(status, transport->base + VIRTIO_MMIO_STATUS);
+}
+
+static void dcp_virtio_reset(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	writel(0, transport->base + VIRTIO_MMIO_STATUS);
+
+	if (transport->version >= 3) {
+		while (dcp_virtio_get_status(vdev))
+			fsleep(1000);
+	}
+}
+
+static bool dcp_virtio_notify(struct virtqueue *vq)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vq->vdev);
+
+	writel(vq->index, transport->base + VIRTIO_MMIO_QUEUE_NOTIFY);
+	return true;
+}
+
+static bool dcp_virtio_notify_with_data(struct virtqueue *vq)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vq->vdev);
+	u32 data = vring_notification_data(vq);
+
+	writel(data, transport->base + VIRTIO_MMIO_QUEUE_NOTIFY);
+
+	return true;
+}
+
+static irqreturn_t dcp_virtio_interrupt(int irq, void *opaque)
+{
+	struct dcp_virtio_transport *transport = opaque;
+	struct virtqueue *vq;
+	unsigned long status;
+	irqreturn_t ret = IRQ_NONE;
+
+	status = readl(transport->base + VIRTIO_MMIO_INTERRUPT_STATUS);
+	writel(status, transport->base + VIRTIO_MMIO_INTERRUPT_ACK);
+
+	if (unlikely(status & VIRTIO_MMIO_INT_CONFIG)) {
+		virtio_config_changed(&transport->vdev);
+		ret = IRQ_HANDLED;
+	}
+
+	if (likely(status & VIRTIO_MMIO_INT_VRING)) {
+		virtio_device_for_each_vq(&transport->vdev, vq)
+			ret |= vring_interrupt(irq, vq);
+	}
+
+	return ret;
+}
+
+static void dcp_virtio_del_vq(struct virtqueue *vq)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vq->vdev);
+	unsigned int index = vq->index;
+
+	writel(index, transport->base + VIRTIO_MMIO_QUEUE_SEL);
+	if (transport->version == 1) {
+		writel(0, transport->base + VIRTIO_MMIO_QUEUE_PFN);
+	} else {
+		writel(0, transport->base + VIRTIO_MMIO_QUEUE_READY);
+		WARN_ON(readl(transport->base + VIRTIO_MMIO_QUEUE_READY));
+	}
+
+	vring_del_virtqueue(vq);
+}
+
+static void dcp_virtio_del_vqs(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	struct virtqueue *vq, *n;
+	int irq = platform_get_irq(transport->pdev, 0);
+
+	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
+		dcp_virtio_del_vq(vq);
+
+	if (transport->wake_irq_enabled) {
+		disable_irq_wake(irq);
+		transport->wake_irq_enabled = false;
+	}
+
+	free_irq(irq, transport);
+}
+
+static void dcp_virtio_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	synchronize_irq(platform_get_irq(transport->pdev, 0));
+}
+
+static struct virtqueue *dcp_virtio_setup_vq(struct virtio_device *vdev, unsigned int index,
+					     void (*callback)(struct virtqueue *vq),
+				  const char *name, bool ctx)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	bool (*notify)(struct virtqueue *vq);
+	struct virtqueue *vq;
+	unsigned int num;
+	int err;
+
+	if (__virtio_test_bit(vdev, VIRTIO_F_NOTIFICATION_DATA))
+		notify = dcp_virtio_notify_with_data;
+	else
+		notify = dcp_virtio_notify;
+
+	writel(index, transport->base + VIRTIO_MMIO_QUEUE_SEL);
+
+	if (readl(transport->base + (transport->version == 1 ?
+			VIRTIO_MMIO_QUEUE_PFN : VIRTIO_MMIO_QUEUE_READY))) {
+		err = -ENOENT;
+		goto error_available;
+	}
+
+	num = readl(transport->base + VIRTIO_MMIO_QUEUE_NUM_MAX);
+	if (num == 0) {
+		err = -ENOENT;
+		goto error_new_virtqueue;
+	}
+
+	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
+				    true, true, ctx, notify, callback, name);
+	if (!vq) {
+		err = -ENOMEM;
+		goto error_new_virtqueue;
+	}
+
+	vq->num_max = num;
+
+	writel(virtqueue_get_vring_size(vq), transport->base + VIRTIO_MMIO_QUEUE_NUM);
+	if (transport->version == 1) {
+		u64 q_pfn = virtqueue_get_desc_addr(vq) >> PAGE_SHIFT;
+
+		if (q_pfn >> 32) {
+			dev_err(&vdev->dev,
+				"platform bug: legacy virtio-mmio must not be used with RAM above 0x%llxGB\n",
+				0x1ULL << (32 + PAGE_SHIFT - 30));
+			err = -E2BIG;
+			goto error_bad_pfn;
+		}
+
+		writel(PAGE_SIZE, transport->base + VIRTIO_MMIO_QUEUE_ALIGN);
+		writel(q_pfn, transport->base + VIRTIO_MMIO_QUEUE_PFN);
+	} else {
+		u64 addr;
+
+		addr = virtqueue_get_desc_addr(vq);
+		writel((u32)addr, transport->base + VIRTIO_MMIO_QUEUE_DESC_LOW);
+		writel((u32)(addr >> 32),
+		       transport->base + VIRTIO_MMIO_QUEUE_DESC_HIGH);
+
+		addr = virtqueue_get_avail_addr(vq);
+		writel((u32)addr, transport->base + VIRTIO_MMIO_QUEUE_AVAIL_LOW);
+		writel((u32)(addr >> 32),
+		       transport->base + VIRTIO_MMIO_QUEUE_AVAIL_HIGH);
+
+		addr = virtqueue_get_used_addr(vq);
+		writel((u32)addr, transport->base + VIRTIO_MMIO_QUEUE_USED_LOW);
+		writel((u32)(addr >> 32),
+		       transport->base + VIRTIO_MMIO_QUEUE_USED_HIGH);
+
+		writel(1, transport->base + VIRTIO_MMIO_QUEUE_READY);
+	}
+
+	return vq;
+
+error_bad_pfn:
+	vring_del_virtqueue(vq);
+error_new_virtqueue:
+	if (transport->version == 1) {
+		writel(0, transport->base + VIRTIO_MMIO_QUEUE_PFN);
+	} else {
+		writel(0, transport->base + VIRTIO_MMIO_QUEUE_READY);
+		WARN_ON(readl(transport->base + VIRTIO_MMIO_QUEUE_READY));
+	}
+error_available:
+	return ERR_PTR(err);
+}
+
+static int dcp_virtio_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
+			       struct virtqueue *vqs[],
+		       struct virtqueue_info vqs_info[],
+		       struct irq_affinity *desc)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	int irq = platform_get_irq(transport->pdev, 0);
+	int i, err, queue_idx = 0;
+
+	if (irq < 0)
+		return irq;
+
+	err = request_irq(irq, dcp_virtio_interrupt, IRQF_SHARED,
+			  dev_name(&vdev->dev), transport);
+	if (err)
+		return err;
+
+	if (of_property_read_bool(transport->pdev->dev.of_node, "wakeup-source") &&
+	    !enable_irq_wake(irq))
+		transport->wake_irq_enabled = true;
+
+	for (i = 0; i < nvqs; ++i) {
+		struct virtqueue_info *vqi = &vqs_info[i];
+
+		if (!vqi->name) {
+			vqs[i] = NULL;
+			continue;
+		}
+
+		vqs[i] = dcp_virtio_setup_vq(vdev, queue_idx++, vqi->callback,
+					     vqi->name, vqi->ctx);
+		if (IS_ERR(vqs[i])) {
+			dcp_virtio_del_vqs(vdev);
+			return PTR_ERR(vqs[i]);
+		}
+	}
+
+	return 0;
+}
+
+static const char *dcp_virtio_bus_name(struct virtio_device *vdev)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+
+	return transport->pdev->name;
+}
+
+static bool dcp_virtio_get_shm_region(struct virtio_device *vdev,
+				      struct virtio_shm_region *region, u8 id)
+{
+	struct dcp_virtio_transport *transport = to_dcp_virtio_transport(vdev);
+	u64 len, addr;
+
+	writel(id, transport->base + VIRTIO_MMIO_SHM_SEL);
+
+	len = (u64)readl(transport->base + VIRTIO_MMIO_SHM_LEN_LOW);
+	len |= (u64)readl(transport->base + VIRTIO_MMIO_SHM_LEN_HIGH) << 32;
+
+	region->len = len;
+
+	if (len == ~(u64)0)
+		return false;
+
+	addr = (u64)readl(transport->base + VIRTIO_MMIO_SHM_BASE_LOW);
+	addr |= (u64)readl(transport->base + VIRTIO_MMIO_SHM_BASE_HIGH) << 32;
+
+	region->addr = addr;
+
+	return true;
+}
+
+static const struct virtio_config_ops dcp_virtio_config_ops = {
+	.get		= dcp_virtio_get,
+	.set		= dcp_virtio_set,
+	.generation	= dcp_virtio_generation,
+	.get_status	= dcp_virtio_get_status,
+	.set_status	= dcp_virtio_set_status,
+	.reset		= dcp_virtio_reset,
+	.find_vqs	= dcp_virtio_find_vqs,
+	.del_vqs	= dcp_virtio_del_vqs,
+	.get_features	= dcp_virtio_get_features,
+	.finalize_features = dcp_virtio_finalize_features,
+	.bus_name	= dcp_virtio_bus_name,
+	.get_shm_region = dcp_virtio_get_shm_region,
+	.synchronize_cbs = dcp_virtio_synchronize_cbs,
+};
+
+static void dcp_virtio_release_dev(struct device *dev)
+{
+}
+
+struct dcp_ipcc *dcp_virtio_get_ipcc(struct virtio_device *vdev)
+{
+	return &to_dcp_virtio_transport(vdev)->ipcc;
+}
+
+static int dcp_virtio_transport_probe(struct platform_device *pdev)
+{
+	struct dcp_virtio_transport *transport;
+	unsigned long magic;
+	int ret;
+
+	transport = devm_kzalloc(&pdev->dev, sizeof(*transport), GFP_KERNEL);
+	if (!transport)
+		return -ENOMEM;
+
+	transport->pdev = pdev;
+	transport->vdev.dev.parent = &pdev->dev;
+	transport->vdev.dev.release = dcp_virtio_release_dev;
+	transport->vdev.config = &dcp_virtio_config_ops;
+	platform_set_drvdata(pdev, transport);
+
+	ret = dcp_ipcc_init(&transport->ipcc, &pdev->dev, 1);
+	if (ret)
+		goto err_free;
+
+	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
+	if (ret)
+		goto err_ipcc;
+
+	transport->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(transport->base)) {
+		ret = PTR_ERR(transport->base);
+		goto err_node;
+	}
+
+	magic = readl(transport->base + VIRTIO_MMIO_MAGIC_VALUE);
+	if (magic != ('v' | 'i' << 8 | 'r' << 16 | 't' << 24)) {
+		dev_warn(&pdev->dev, "Wrong magic value 0x%08lx!\n", magic);
+		ret = -ENODEV;
+		goto err_node;
+	}
+
+	transport->version = readl(transport->base + VIRTIO_MMIO_VERSION);
+	if (transport->version < 1 || transport->version > 3) {
+		dev_err(&pdev->dev, "Version %ld not supported!\n",
+			transport->version);
+		ret = -ENXIO;
+		goto err_node;
+	}
+
+	transport->vdev.id.device =
+		readl(transport->base + VIRTIO_MMIO_DEVICE_ID);
+	if (!transport->vdev.id.device) {
+		ret = -ENODEV;
+		goto err_node;
+	}
+	transport->vdev.id.vendor =
+		readl(transport->base + VIRTIO_MMIO_VENDOR_ID);
+
+	if (transport->version == 1) {
+		writel(PAGE_SIZE,
+		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
+		ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
+		if (!ret)
+			ret = dma_set_coherent_mask(&pdev->dev,
+						    DMA_BIT_MASK(32 + PAGE_SHIFT));
+	} else {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	}
+	if (ret)
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		dev_warn(&pdev->dev,
+			 "Failed to enable 64-bit or 32-bit DMA. Trying to continue, but this might not work.\n");
+
+	ret = register_virtio_device(&transport->vdev);
+	if (ret) {
+		put_device(&transport->vdev.dev);
+		dcp_ipcc_deinit(&transport->ipcc);
+		platform_set_drvdata(pdev, NULL);
+		return ret;
+	}
+
+	return 0;
+
+err_node:
+err_ipcc:
+	dcp_ipcc_deinit(&transport->ipcc);
+err_free:
+	platform_set_drvdata(pdev, NULL);
+	return ret;
+}
+
+static void dcp_virtio_transport_remove(struct platform_device *pdev)
+{
+	struct dcp_virtio_transport *transport = platform_get_drvdata(pdev);
+
+	unregister_virtio_device(&transport->vdev);
+	platform_set_drvdata(pdev, NULL);
+	dcp_ipcc_deinit(&transport->ipcc);
+}
+
+static int dcp_virtio_transport_suspend(struct device *dev)
+{
+	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
+	int ret;
+
+	ret = virtio_device_freeze(&transport->vdev);
+	if (ret)
+		return ret;
+
+	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
+	if (ret)
+		goto err_restore;
+
+	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
+	if (ret) {
+		dcp_ipcc_disable_irq_wake(&transport->ipcc);
+		goto err_restore;
+	}
+
+	return 0;
+
+err_restore:
+	virtio_device_restore(&transport->vdev);
+	return ret;
+}
+
+static int dcp_virtio_transport_resume(struct device *dev)
+{
+	struct dcp_virtio_transport *transport = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dcp_ipcc_send_power_notify(&transport->ipcc);
+	if (ret)
+		return ret;
+
+	dcp_ipcc_disable_irq_wake(&transport->ipcc);
+	if (transport->version == 1)
+		writel(PAGE_SIZE,
+		       transport->base + VIRTIO_MMIO_GUEST_PAGE_SIZE);
+
+	return virtio_device_restore(&transport->vdev);
+}
+
+static const struct dev_pm_ops dcp_virtio_transport_pm_ops = {
+	.suspend = dcp_virtio_transport_suspend,
+	.resume = dcp_virtio_transport_resume,
+};
+
+static const struct of_device_id dcp_virtio_transport_of_match[] = {
+	{ .compatible = "qcom,dcp-virtio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dcp_virtio_transport_of_match);
+
+static struct platform_driver dcp_virtio_transport_driver = {
+	.probe = dcp_virtio_transport_probe,
+	.remove = dcp_virtio_transport_remove,
+	.driver = {
+		.name = "qcom-dcp-virtio",
+		.of_match_table = dcp_virtio_transport_of_match,
+		.pm = &dcp_virtio_transport_pm_ops,
+	},
+};
+
+int dcp_virtio_transport_register(void)
+{
+	return platform_driver_register(&dcp_virtio_transport_driver);
+}
+
+void dcp_virtio_transport_unregister(void)
+{
+	platform_driver_unregister(&dcp_virtio_transport_driver);
+}

-- 
2.43.0


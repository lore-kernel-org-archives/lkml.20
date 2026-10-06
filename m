Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3539B970
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326440; cv=none; b=ctJeGp68riKbjwgW5PAwRN1lcFaAg7hGW92QKlHQDHGx5HYo/NVH1tLmRJYTiW738X4VvoavGuyI2iSdyCDrPNBw6Cv56ZJP766ksCaKkqTyCB2JbkMq+cC3Qb7RoU6wZwmFstwXOa9eUzcfpB5tNspCpwn6UDYxHUe9ldE3APs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326440; c=relaxed/simple;
	bh=wwNdqBKydV3sKNndIKMDb0duUxJePVVmM/leJ1sDREA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chnH3v6eJSWMnqXp8ivbs/OXh+g4aT47t9nWMRbu/eErFGbKGQN+EEalkvNfOPhctztwA+cm3atDQThBjCfH/SBcRG+rBz3tKi0157gMlWOv2D2hRcUL/tzuGDOQGbL6dLvCuYHV3YiGVm06PJK9ac63YxFDJi3U4owvFMJAB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbdWe0Ws reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbdWe0Ws"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lg0gA1678478
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cU6cB7tSn1l
	wlOWS7+RD0zc037o+olQbgRawKxC//3Y=; b=CbdWe0WsEEbmqEIEdjV1hpnWYpe
	UggdmLeDJUn7qog58GJ56JHnVDbTc9li3R9fRlFcjJpsAVRuz3mGqwPQZqAkm1Om
	Dr9gMu4DdTNuE72GBODSLhgpkIXRDmcDo7wLHrRMBp8fktUb7Y9Z16uiwqTCBMn5
	cGoiOO9C97mzdcR4yH+TWUCkEyfQcZK6oEf0hHcm8g417Es87tnKnzq2RQvBkTbm
	hAITmA8akYO+ErehnElJkCqw7Fwaabmrn9MLR6RzdfrV4c2koavROOfBc9dyc/kO
	hkD5mF8xUKQUC8DVmsDzZlwOCpVAsD77Y5qqQ5tjkmxxFDjuGrkaMC/oa9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub0xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so541734985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326428; x=1791931228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cU6cB7tSn1lwlOWS7+RD0zc037o+olQbgRawKxC//3Y=;
        b=ptyQdhsH3uvl5tM0Y44Rct2vNsUl7GDl8xJFqcxLoYTvaUp3H8IOiB4lwChwy6/xhU
         NDBNEakeEnF+VeftGakLhoXFWtFs1XXoSBdED7Zyu5ka3sPFBLIby6U9dMB0KGNfpx+X
         PPv+iCH81jc2J5z5CA0X0No8vK/S7N14TJwKXOy8SbExDmdCVx9ycFBH/ZI42EgEW+SP
         9yBSgclvbutJoJZ9eDJd7HxhGCOa1LZOGvzjJZRxcm0oQ3/Et0gvQCQk2Do5kmPFHVOX
         xCY+wozunbaOzkQ0BNHYjIgOXOCr+dpmzNCaMIwD0KGbCOf+b6mmVBvulXdLlWK20cgb
         PbwA==
X-Forwarded-Encrypted: i=1; AKwUvBzyeMOKoTs8UZlT0bxJg6j7ZBb8Fc0RY8ZsNtuMJwUYZb3gDMWeCfHhipSnsw9IxaVo0R0KBmunujeGO3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n66mNklsP9e92vMOQrxitNC3FeM0SJC7vg5kU9f6E+weD5pzD0
	3u1P+XD4fkoNx1qmnXZ4OTBW1W+jL7DDoLacRyG2SkncRtXAn07QMOx5CY9PzYbThJmXB3xCJT5
	cVsJK9lRkj+ktRZWMg25q8ufRx9y0boYB4ETVtankvjL2/nuF+aVs6v4nD44lx6ApiAU=
X-Gm-Gg: AYBFou3RgpZhtLrx9HqTItGxcf9ObpM2NfG8Wp4PM0e3s9HRLn5MZy1kR+GiaNPZ1ja
	ZWEJd8OPsnI3ghsdfpNft1Cv8eL6klryJP/VlV2+cwuo7IIqU5Q0jVfonIM3dDJgABbAZRBw/Uk
	7aXJYUdvCBlXDuEtzoWx3F7JESYPId0z5KWVPCjvfmdUCo7INqPi/ilUNugKXmbovXrLyRWZIL1
	boNM4kO6ZxlLgBwdKxuksXkISZdTagBj/7u+OWSpXGe9ylvbWeEWEsTxqNLDc57RDMNcVvcZdL6
	TDbtgkTumhLy6V4cbwXV3ARpUo5fCi6rxTEixCdU0R+WucdBqxGIdykUDLU=
X-Received: by 2002:a05:620a:3704:b0:939:72cb:bae5 with SMTP id af79cd13be357-93e860c1fb1mr881417385a.28.1791326427327;
        Tue, 06 Oct 2026 15:40:27 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:72cb:bae5 with SMTP id af79cd13be357-93e860c1fb1mr881411685a.28.1791326426588;
        Tue, 06 Oct 2026 15:40:26 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:25 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 06/45] media: qcom: camss: add IFE subdevice interface
Date: Wed,  7 Oct 2026 01:39:14 +0300
Message-Id: <20261006223953.3382273-7-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXySjTzL+rfkcG
 BpnOr3PmPhAHez367W+sCMlHFAYcSY/q/BIbZMVavRSo6l8Uo6uQCmpVBRtfKtpo0R8U9KJlmiX
 w9YY5gAmxzg4yz+oPaeVFbZsknbcuX0=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac578dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=95Q6_5sKJtTNXQvUJdsA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0G4MRd824r_TncPH8yg1LTte5as4Flhx
X-Proofpoint-ORIG-GUID: 0G4MRd824r_TncPH8yg1LTte5as4Flhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXx82+XpoMafyR
 gLJNDPKyFm4j7KvoUD2Pcxk2gjIm/8jopb16jz25vORGFCpzeSt7I7IK1MZQ+WZeMSvegzAQuXV
 +29xUsl24uUKoH/btoYA4aAyP8S0pI6Tq7zFz1w6smmnH+NfYZJRfyBcCL1Yl7T1Zxs366dzb+L
 CT274r+v7LeAMahNI6mCaTiP6YPZQTtL0k2MT9nx//YL53WVdlZR94Nipqft1ApEtoLUpJle9vX
 0S/Ll1f0ieEkDWL1fFK7N3UMSlJEP9mhuUScfpvt015wN2HuUkOXRrQlULDNpEU55Qjw/pzJV06
 SPoGNvBQeky1udbF9sevCG/a/ahnHkItX4kqgrf5Hy2Dv6CUDPS6Eb+SbVFedMDLKZ+9qAW0izu
 cuuS6GOGDAaakAP2VtuHWL4WL37dcjLbLZ3CP7qEYErhDFZQKvuzQAQDVoD7Z5dOZcWXuQpWW4T
 OLNI7syrg0UHWUMmk+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the common IFE types and hardware operation interfaces. Later
patches use them to add the IFE engines and subdevice.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.h | 392 ++++++++++++++++++
 1 file changed, 392 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife.h

diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
new file mode 100644
index 000000000000..39e8cfa74909
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -0,0 +1,392 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#ifndef CAMSS_IFE_SUB_DEV_H
+#define CAMSS_IFE_SUB_DEV_H
+
+#include <media/v4l2-isp.h>
+#include <media/v4l2-subdev.h>
+
+#include "camss-format.h"
+#include "camss-video.h"
+
+#define IFE_CAMIF_HW_PIPES_MAX	6
+
+/* IFE irq 0 status flags */
+#define IFE_HW_TOP_IRQ0_RST_DONE	BIT(0)
+#define IFE_HW_TOP_IRQ0_BUSWR		BIT(1)
+
+/* IFE top */
+#define IFE_HW_TOP_IRQ1_RDI0_SOF	BIT(0)
+#define IFE_HW_TOP_IRQ1_RDI0_EPOCH0	BIT(1)
+#define IFE_HW_TOP_IRQ1_RDI0_EPOCH1	BIT(2)
+#define IFE_HW_TOP_IRQ1_RDI1_SOF	BIT(3)
+#define IFE_HW_TOP_IRQ1_RDI1_EPOCH0	BIT(4)
+#define IFE_HW_TOP_IRQ1_RDI1_EPOCH1	BIT(5)
+#define IFE_HW_TOP_IRQ1_RDI2_SOF	BIT(6)
+#define IFE_HW_TOP_IRQ1_RDI2_EPOCH0	BIT(7)
+#define IFE_HW_TOP_IRQ1_RDI2_EPOCH1	BIT(8)
+#define IFE_HW_TOP_IRQ1_RDI3_SOF	BIT(9)
+#define IFE_HW_TOP_IRQ1_PP_SOF		BIT(12)
+#define IFE_HW_TOP_IRQ1_PP_EPOCH0	BIT(13)
+#define IFE_HW_TOP_IRQ1_PP_EPOCH1	BIT(14)
+
+#define BUSWR_CLIENT_CFG_MODE_LINE_BASED	0
+#define BUSWR_CLIENT_CFG_MODE_FRAME_BASED	1
+
+enum camss_ife_output {
+	CAMSS_IFE_OUTPUT_INVALID,
+	CAMSS_IFE_OUTPUT_RDI0,
+	CAMSS_IFE_OUTPUT_RDI1,
+	CAMSS_IFE_OUTPUT_RDI2,
+	CAMSS_IFE_OUTPUT_RDI3,
+	CAMSS_IFE_OUTPUT_VID_FULL,
+	CAMSS_IFE_OUTPUT_DISP_FULL,
+	CAMSS_IFE_OUTPUT_FD,
+};
+
+enum camss_ife_hw_pipe {
+	CAMSS_IFE_HW_PIPE_RDI0,
+	CAMSS_IFE_HW_PIPE_RDI1,
+	CAMSS_IFE_HW_PIPE_RDI2,
+	CAMSS_IFE_HW_PIPE_RDI3,
+	CAMSS_IFE_HW_PIPE_PP,
+	CAMSS_IFE_HW_PIPE_INVALID,
+};
+
+enum ife_hw_planes {
+	Y_PLANE = 0,
+	C_PLANE,
+	IFE_HW_PLANES
+};
+
+enum ife_top_status {
+	IFE_TOP_STATUS_ID0,
+	IFE_TOP_STATUS_ID1,
+	IFE_TOP_STATUS_ID2,
+	IFE_TOP_STATUS_MAX,
+};
+
+struct camss_hw_version {
+	union {
+		u32 hw_version;
+		struct {
+			u32 major:  4;
+			u32 minor: 12;
+			u32 steps: 16;
+		} ids;
+	};
+};
+
+struct camss_ife_wm_config {
+	u32 wm_id;
+	u32 width;
+	u32 height;
+	u32 bytes;
+	u32 stride;
+	u32 lines;
+	u32 mode_config;
+	u32 packing_fmt;
+};
+
+struct camss_ife_pipeline_cfg {
+	u32 in_code;
+	u32 in_width;
+	u32 in_height;
+	struct v4l2_rect *ds_mn_crop;
+};
+
+struct camss;
+struct camss_subdev_resources;
+struct ife_device;
+struct ife_pad_desc;
+struct ife_top_ctx;
+struct ife_pp_ctx;
+struct vb2_buffer;
+struct ife_buswr_ctx;
+
+/**
+ * struct ife_hw_camif_ops - CAMIF hardware ops interface.
+ *
+ * Abstracts the CAMIF config/enable/disable operations so that
+ * top-level controllers are not coupled to a specific CAMIF IP version.
+ *
+ * @config:  Program CAMIF registers for the given pipe and pipeline config.
+ * @enable:  Enable the CAMIF output for the given pipe.
+ * @disable: Disable the CAMIF output for the given pipe.
+ */
+struct ife_hw_camif_ops {
+	int  (*config)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe,
+		       const struct camss_ife_pipeline_cfg *cfg);
+	void (*enable)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe);
+	void (*disable)(void __iomem *base, enum camss_ife_hw_pipe hw_pipe);
+};
+
+struct ife_hw_top_ops {
+	int	(*acquire)(struct ife_device *ife, void __iomem *base,
+			   void __iomem *csid_base);
+	void	(*release)(struct ife_top_ctx *ctx);
+
+	u32	(*version)(struct ife_top_ctx *ctx);
+	void	(*prepare)(struct ife_top_ctx *ctx);
+	void	(*enable)(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe);
+	void	(*disable)(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe);
+
+	int	(*pipe_config)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc,
+			       const struct camss_ife_pipeline_cfg *pipeline_cfg,
+			       const struct camss_ife_wm_config *wm_cfg);
+	int	(*pipe_enable)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc);
+	int	(*pipe_disable)(struct ife_top_ctx *ctx, const struct ife_pad_desc *desc);
+
+	void	(*reg_update)(struct ife_top_ctx *ctx, const struct ife_pad_desc *dsc);
+	void	(*reset)(struct ife_top_ctx *ctx);
+	void	(*irq_status)(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX]);
+};
+
+struct ife_hw_buswr_ops {
+	void	(*acquire)(struct ife_device *ife, void __iomem *base);
+	void	(*release)(struct ife_buswr_ctx *ctx);
+	void	(*irq_enable)(struct ife_buswr_ctx *ctx);
+	void	(*irq_disable)(struct ife_buswr_ctx *ctx);
+	void	(*wm_config)(struct ife_buswr_ctx *ctx, const u8 wm,
+			     const struct camss_ife_wm_config *cfg);
+	void	(*wm_enable)(struct ife_buswr_ctx *ctx, u8 wm);
+	void	(*wm_disable)(struct ife_buswr_ctx *ctx, u8 wm);
+	void	(*queue_buf)(struct ife_buswr_ctx *ctx, const u8 num_wms,
+			     const u8 *wm, dma_addr_t *addr);
+	u32	(*consumed_addr)(struct ife_buswr_ctx *ctx, u8 wm);
+	u32	(*irq_status)(struct ife_buswr_ctx *ctx);
+	bool	(*is_fifo_full)(struct ife_buswr_ctx *ctx, u8 wm);
+};
+
+/**
+ * struct camss_pp_cfg - PP module pipeline configuration.
+ *
+ * @width:   Input frame width in pixels.
+ * @height:  Input frame height in pixels.
+ * @in_code: Input media bus format code (MEDIA_BUS_FMT_*).
+ */
+struct camss_pp_cfg {
+	u32 width;
+	u32 height;
+	u32 in_code;
+};
+
+/**
+ * struct camss_mod_ops - PP module ops interface.
+ *
+ * Engine-agnostic ops for configuring, enabling and disabling a set of
+ * post-processing hardware modules.  The concrete implementation is
+ * provided by the IP-specific backend (e.g. pp_v10x_modules_ops).
+ *
+ * @acquire:      Initialise the context; store @base in @ctx.
+ * @release:      Release the context.
+ * @config:       Program module registers with default values derived from @cfg.
+ *                Called once per stream start before @enable.
+ * @enable:       Enable all modules managed by this backend.
+ * @disable:      Disable all modules managed by this backend.
+ * @apply_params: Apply per-frame IFE module parameters (optional).
+ */
+struct camss_mod_ops {
+	void (*acquire)(struct ife_device *ife, struct ife_pp_ctx *ctx, void __iomem *base);
+	void (*release)(struct ife_pp_ctx *ctx);
+	void (*config)(struct ife_pp_ctx *ctx, const struct camss_pp_cfg *cfg);
+	void (*enable)(struct ife_pp_ctx *ctx);
+	void (*disable)(struct ife_pp_ctx *ctx);
+	int  (*apply_params)(struct ife_pp_ctx *ctx, struct vb2_buffer *vb);
+};
+
+/**
+ * struct ife_top_ctx - runtime context for the IFE top controller.
+ *
+ * Holds the hardware base address and the CAMIF ops pointer so that
+ * top-level pipe functions do not need to receive them as arguments.
+ * Initialised once at device probe via ife_hw_top_ops::acquire().
+ *
+ * @base:      MMIO base of the IFE top register block.
+ * @camif_ops: CAMIF hardware ops bound to this IFE hardware block.
+ * @dev:       Device used for diagnostic messages.
+ */
+struct ife_top_ctx {
+	void __iomem                  *base;
+	void __iomem                  *csid_base;
+	void __iomem                  *rdi_base;
+	void __iomem                  *pp_base;
+	const struct ife_hw_camif_ops *camif_ops;
+	struct device                 *dev;
+};
+
+/**
+ * struct ife_buswr_ctx - runtime context for the IFE BUS write engine.
+ *
+ * Holds the hardware base address so that BUS write ops do not need to
+ * receive it as an argument on every call.
+ * Initialised once at device probe via ife_hw_buswr_ops::acquire().
+ *
+ * @base: MMIO base of the IFE BUS write register block.
+ * @dev:  Device used for diagnostics.
+ */
+struct ife_buswr_ctx {
+	void __iomem  *base;
+	struct device *dev;
+};
+
+/**
+ * struct ife_pp_ctx - runtime context for the IFE post-processing engine.
+ *
+ * Holds the hardware base address so that PP ops do not need to receive
+ * it as an argument on every call.
+ * Initialised once at device probe via camss_mod_ops::acquire().
+ * @in_width/@in_height are latched from struct camss_pp_cfg on
+ * camss_mod_ops::config() and reused by apply_params() for modules (e.g.
+ * LSC) whose per-frame register values depend on the input frame size.
+ *
+ * @base:          MMIO base of the IFE PP register block.
+ * @in_width:      Input frame width in pixels, latched from the last @config call.
+ * @in_height:     Input frame height in pixels, latched from the last @config call.
+ * @dev:           Device used for allocating @params_scratch and diagnostics.
+ * @params_scratch: Scratch buffer used to validate/stage an apply_params() buffer.
+ */
+struct ife_pp_ctx {
+	void __iomem *base;
+	u32 in_width;
+	u32 in_height;
+	struct device *dev;
+	struct v4l2_isp_params_buffer *params_scratch;
+};
+
+struct ife_pad_limits {
+	u32 min_width;
+	u32 min_height;
+	u32 max_width;
+	u32 max_height;
+	u32 max_h_ratio;
+	u32 max_v_ratio;
+};
+
+struct ife_pad_desc {
+	u16 pad_flags;
+	struct camss_formats sup_fmts;
+	const struct ife_pad_limits *limits;
+
+	const char *video_name;
+	u32 link_flags;
+
+	enum v4l2_buf_type buf_type;
+	enum camss_ife_output output;
+	u32 hw_pipe;
+
+	u8 packing_fmt;
+	u8 mode_config;
+
+	u32 rup_group_mask;
+	u32 comp_group_mask;
+
+	u8 num_wms;
+	u8 wm[IFE_HW_PLANES];
+};
+
+struct ife_pads_descriptors {
+	unsigned int num_desc;
+	const struct ife_pad_desc *desc;
+};
+
+enum ife_subdev_type {
+	CAMSS_IFE_SUBDEV_TYPE_IFE = 0,
+	CAMSS_IFE_SUBDEV_TYPE_IFE_LITE,
+};
+
+struct camss_ife_stream {
+	u32 id;
+	enum camss_ife_hw_pipe pipe;
+};
+
+struct ife_subdev_resources {
+	enum ife_subdev_type type;
+	const struct ife_hw_top_ops	*top_ops;
+	const struct ife_hw_camif_ops	*camif_ops;
+	const struct camss_mod_ops	*mod_ops;
+	const struct ife_hw_buswr_ops	*buswr_ops;
+	const struct ife_pads_descriptors *pads;
+
+	unsigned int num_sink_streams;
+	const struct camss_ife_stream *sink_streams;
+};
+
+struct ife_video_pad {
+	struct ife_device *ife;
+	u32 pad_index;
+
+	struct camss_video video;
+	bool streaming;
+
+	struct list_head pending_bufs;
+	struct list_head processing_bufs;
+};
+
+struct ife_subdev_pads {
+	const struct ife_pad_desc *desc;
+	struct v4l2_mbus_framefmt fmt;
+	struct ife_video_pad *vid_pad;
+};
+
+struct ife_device {
+	u8 id;
+	struct camss *camss;
+	struct ife_top_ctx   top_ctx;
+	struct ife_buswr_ctx buswr_ctx;
+	struct ife_pp_ctx    pp_ctx;
+
+	const struct ife_subdev_resources *res;
+	u32 irq;
+	char irq_name[sizeof(((struct v4l2_subdev *)0)->name)];
+
+	int nclocks;
+	struct camss_clock *clock;
+
+	struct completion reset_complete;
+
+	struct mutex state_mutex; /* Protects all pad states */
+	spinlock_t bufs_lock; /* Protects buffer lists */
+	unsigned int stream_count;
+
+	struct ife_subdev_pads *pads;
+	struct media_pad *mpads;
+	int npads;
+	u32 sink_pad;
+
+	struct {
+		unsigned int stream_count;
+		u32 next_seq;
+	} camif_data[IFE_CAMIF_HW_PIPES_MAX];
+
+	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
+
+	struct v4l2_subdev sd;
+	struct device *genpd;
+	struct device_link *genpd_link;
+};
+
+int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
+			  const struct camss_subdev_resources *res, u8 id,
+			  void __iomem *csid_base);
+
+int ife_register_entities(struct ife_device *ife, struct v4l2_device *v4l2_dev);
+void ife_unregister_entities(struct ife_device *ife);
+
+int ife_get(struct ife_device *ife);
+void ife_put(struct ife_device *ife);
+
+int camss_ife_link_entities(struct camss *camss);
+
+u32 camss_ife_stream_id_for_pipe(int nstreams,
+				 const struct camss_ife_stream *streams,
+				 enum camss_ife_hw_pipe pipe);
+enum camss_ife_hw_pipe
+camss_ife_pipe_for_stream_id(int nstreams,
+			     const struct camss_ife_stream *streams,
+			     u32 id);
+
+#endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1


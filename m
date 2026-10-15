Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098249EC79
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050038; cv=none; b=hwl0mxcw1plyazPvcJeTYLs/2GBWE9m50+uTmD9nDrHmdGBQYo/sEffdK8gljMCZNyT90ffG4J4az8fIIhs2Fe4++4LxbFLk+XjWr0PR/vuPK0Fl7/Fzl4nbL0qiAbckDbdhwEt9KAW98U7DxzJvt6C7+BwpNCIZvNt17REw0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050038; c=relaxed/simple;
	bh=olCg34fqhovAj73wvqSraSExeAWpLMsw6Eg7pXCDvtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGZ3cCiEbFE1P56LiLssLO+/e0115ISwVqdmHtks2ECCcRa3/BmtWKoctQvU+PfJGw102aJn4lDWpnnX7IIwJXMSvE1TlmQsj/+0mZSlytqA8AZNV1V5Ob8Y1ckka+zFJICvUCgDDJAhU3zu+HDdHigGS1ggL/h8njvHagW2+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjwJ0Blt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N17tN/xE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjwJ0Blt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N17tN/xE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1E5Bk3468837
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDtSiXv/6NhxJ0mk5La7mKGNMUyCneYuHFHQAltSX6w=; b=FjwJ0BltpkNVwdar
	Vh7/9R3cZ1bP7HMwpEZqr0zyRTxnvaQP+n9Q5c5U5SEvxFE+vkcFRZYeutRgybcf
	5WgcJEnsgBg/YjP5P8xz9XVQDTd22dwH9m8rErJMygRvctFGMOPewUaM1AB8AkHB
	MXHZyRyDiX8rPsMUX8Hvg0DA7dnUVWP0DMFnyZb3RsUpwjw5OypPVVRKQ1LqYsHY
	lt1WwbxTDj39lnVZBeeKb0G9NwnGwXPaUiEshlzR61zAZAAMkFr15I70AaOvzHjc
	tacS/oxAHa6lMqCwWW1StMiyp8ubdJl14Ql7lnnCo8pT6O7c3LqaI8rt5yB4tCPS
	xrEh8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7b1da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:40:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dfb24dfedfso43072255ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050032; x=1792654832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cDtSiXv/6NhxJ0mk5La7mKGNMUyCneYuHFHQAltSX6w=;
        b=N17tN/xEZeK6zyMirlDrr4NDN6np6hDwFH0pfnIV+HGErEnvdd/nCgYD821TsnEHoL
         aYiWjV6lMDkMt27s4dDNR4XipEvSM0DnbVhUro4supJchFD8lVR3O9GojmOzOxzTK41S
         S5yCw173DPhkvtC65Cu/HK0es4oAPpxAbBm8sCZau5lwwr7lj7QNIexLLnflD/ABQHu+
         eUAeA/ucvH6RFOCs4ZNyNzekwx7KPRUCWh68gZi9ZyWhBbIalIyDBsXd9BK8PHLymrPQ
         aCqGiWttL/Shhy7vHkUoXP4KcqdvOXMhp2EwrlnXzUbE9sHLv8aHI7Vkvm79N94C+Rs+
         nXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050032; x=1792654832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDtSiXv/6NhxJ0mk5La7mKGNMUyCneYuHFHQAltSX6w=;
        b=wWzr3hHwkWNUhLzZlZ2nPOHrxmjhCZfbf6H+5vEg5z8MMDxzn6yq5Bzucfj4xwXF8X
         fyTRluUWky1c6A/V39496sIniArLVS+1OjdX5IskI2COMTuoKTSnv+a8IDCmzMaE4QX8
         rQpfOEEZ3xx9SLiCC97mVi64Me2vqaukEAVjnIi2SNw878KSE6vfYDSPNFdXSoKljFwj
         i1YgArhCwsAGAF/ViPsm35lJhT1eCgOHH7Je9Zor7qwDKizj4b24akKyC6lD1DIY/n3b
         4fmlf+dj/8PmS2q9yF156yLmKyfNOshWM1/NS2AiDp6/4PsTq/7zSFBfj797hvunTbZH
         Ad+w==
X-Forwarded-Encrypted: i=1; AKwUvBywgA3njsYYmiiUbjPt8TOChftFgFmZZo7XZdPHpDV9Zr+lNA+qH2CVI4x1Wbr1wfhaW0fPHq2JuBQ6osM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlRCmABhbNIkepoAXivaxO8yaAqqYiEX9m3T+eF76GMzDG7MTB
	SPEFvGmhqK8bvgyWz6DAMNSc3f7+QnlTebDgojzh9zcl51vdZglA1HcCQSiXpVqkyNKPDNEM7x7
	UYTokRrZjMIt2EMNL+qfcU2b+P5PlxE3bfF9Qv6skdKpQsUa8HL95NobyEXIKSeHlsNQ=
X-Gm-Gg: AYBFou1RwmgGjY4D2i4VUj83BjaxOIbnyh0QHPwRR3EhELR9oRk/s0p5L+pRaoPMQHE
	pVJpJ2JZcX6d5FZqH/BJ5UILJvdCJ2XS5dOa1nv2GkLX1+SmNy+yyGy3lL5KHUttdWXbCOQT6tP
	S4Zcy1SqBhyGT21t8dNUye3TjmzoLZi7HEPOfgIsM97SfgvtbURKVqLtJE90yvMzOCZdiKjQXeD
	MWf1mfkoWMu4tgQZhdimlubyon9fkFhHgLll4w+Qwxlbi7TIckzxVRF4oPpKdyEHebw64+NoLsl
	7JlcMQG/tVrdnMH7XIXRzXXHFjM/Pz6X/GiPgULZ9JqGoHhqaVPOch0Or0DApX806LX+jHBTvr8
	mv5TjO7tANQTw4CsIIjrq3MnSzWqotZsffi8=
X-Received: by 2002:a17:903:1b68:b0:2dd:c100:4b77 with SMTP id d9443c01a7336-2e842ce7f76mr155161505ad.46.1792050032107;
        Thu, 15 Oct 2026 00:40:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2dd:c100:4b77 with SMTP id d9443c01a7336-2e842ce7f76mr155161135ad.46.1792050031492;
        Thu, 15 Oct 2026 00:40:31 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:31 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:30 +0530
Subject: [PATCH 10/13] drm/msm/dcp: Add VirtIO transport and platform
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=18508;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=olCg34fqhovAj73wvqSraSExeAWpLMsw6Eg7pXCDvtk=;
 b=PLFRExgqEdFQv9D1IUOmmuD6p0AekawUc65ey7Q7os+OVaEAdv2wyTLcJO0z5Iuw5kgPq5XFd
 w6+z5M1xUnUCyDWZPr+zTdaBHbfVokMHUsJza6oJKJB/4E8U6VQC+fs
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad08371 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LbqFEj-6taUOIdhxem0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SzPOKfemWdvyacrkx14E9_IwYYI6-92w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX3S6ru2gAxfiU
 R71KTJnXi8+BWG9jMSj+eiVm3SnpG3/mHkvqNCFpDyFQG4yGnDrjnIOXF6T8W2InD4pv4EKDrVI
 brH5+IIIZhw8zPNmGyzfa64AXko95OolWzfh9L4QF8iNWrCPUlNc5US5FWqhf2gVXCAcLpQv8VL
 JqVcQOkMuAoF5cOQgUjzS+FT2jY2R2subof9i74Mua2ED+fqfWi2jbR6LugT5LMgYcxYBW+tG15
 BKB2PDUG2fhXqT6+iZgbyWcu+fnSwM4wcCHvU95C0QhEhzY4kUEnI0HqbOGVDWk7Fq9KevuV6N1
 B+fPC+qw3cgTYOCIzTJwfT+DhBeWD2famtObo/nRsB/R1E4eaiyy1t7wrvdq22xvcyaw/IXiNR5
 HaRMwbmgK/ngA6MDxPkatbL3VCqF8nruYCO4ipaDspjwvfaSRU6HihxqceonvX+VjGFKKKQwvdK
 4KyhpNyylz3J9g+QUCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX+c9TjfhbtLOK
 EVf8vBzPUJp1NU2d9upS+ee1ro5zVvmaGKPdOFsPcQy2sKOzWF8ShX5bhN9ng5BpDwCSYJH/8qZ
 9InuJor1NJQiBSilmQKSK9CLbFM7Ro0=
X-Proofpoint-ORIG-GUID: SzPOKfemWdvyacrkx14E9_IwYYI6-92w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150030

DCP display hardware is controlled by firmware and exposed to Linux as a
VirtIO function. The MSM DRM driver needs a platform driver to establish
the transport, DMA/IOMMU address spaces, power-notify path, and display
component.

Add the VirtIO-MMIO transport and DCP platform-function driver. Set up the
DMA/IOMMU identity, IPCC client, VirtIO queues, HFI transport, firmware
capability handling, and MSM DRM registration. Synchronize suspend, resume,
remove, and shutdown with in-flight HFI activity.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/gpu/drm/msm/Makefile         |   2 +
 drivers/gpu/drm/msm/dcp/dcp_drv.c    | 245 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_drv.h    |  19 +++
 drivers/gpu/drm/msm/dcp/dcp_virtio.c | 302 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_virtio.h |  22 +++
 5 files changed, 590 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 9910bd4f306d..e57aee483137 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -83,6 +83,8 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_ipcc.o \
 	dcp/dcp_plane.o \
 	dcp/dcp_encoder.o \
+	dcp/dcp_drv.o \
+	dcp/dcp_virtio.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.c b/drivers/gpu/drm/msm/dcp/dcp_drv.c
new file mode 100644
index 000000000000..e7016937a028
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_drv.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * DCP VirtIO driver.
+ */
+
+#include <linux/component.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/panic_notifier.h>
+#include <linux/pm_runtime.h>
+
+#define DCP_DPU_AUTOSUSPEND_DELAY_MS	5000
+
+#include "dcp_drv.h"
+#include "dcp_hfi.h"
+#include "dcp_ipcc.h"
+#include "dcp_virtio.h"
+#include "msm_drv.h"
+#include "msm_kms.h"
+
+int dcp_subsystem_dev_init(struct dcp_drv *drv)
+{
+	struct virtio_device *vdev = drv->vdev;
+	struct device_node *dcp_subsystem_node;
+	struct platform_device *pdev;
+	struct device *dev;
+	char busid[32];
+	int ret;
+
+	dcp_subsystem_node = of_get_child_by_name(vdev->dev.parent->of_node,
+						  "dcp-subsystem");
+	if (!dcp_subsystem_node) {
+		dev_err(&vdev->dev, "no dcp-subsystem DT node\n");
+		return -ENODEV;
+	}
+
+	snprintf(busid, sizeof(busid), "dcp-subsystem.%s", dev_name(vdev->dev.parent));
+
+	/*
+	 * DCP is discovered through VirtIO, but display/HFI buffers must be
+	 * mapped through the dcp-subsystem node's DMA/IOMMU identity. Create a
+	 * platform device for that DT node so DMA API and msm_kms_init_vm() use
+	 * the display function's IOMMU domain.
+	 */
+	pdev = of_platform_device_create(dcp_subsystem_node, busid, vdev->dev.parent);
+	if (!pdev) {
+		dev_err(&vdev->dev, "dcp_subsystem_dev creation failed\n");
+		of_node_put(dcp_subsystem_node);
+		return -ENODEV;
+	}
+	dev = &pdev->dev;
+
+	dev->dma_parms = &drv->dcp_subsystem_dma_parms;
+	dma_set_max_seg_size(dev, UINT_MAX);
+
+	ret = of_dma_configure_id(dev, dcp_subsystem_node, true, NULL);
+	if (ret) {
+		dev_err(dev, "of_dma_configure_id failed: %d\n", ret);
+		goto err_destroy;
+	}
+
+	if (!device_iommu_mapped(dev)) {
+		dev_err(dev, "no IOMMU group attached\n");
+		ret = -ENODEV;
+		goto err_destroy;
+	}
+
+	dev_dbg(dev, "dcp-subsystem: iommu_mapped=%d iommu_group=%d\n",
+		device_iommu_mapped(dev),
+		 dev->iommu_group ? iommu_group_id(dev->iommu_group) : -1);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, DCP_DPU_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
+	drv->dcp_subsystem_dev = pdev;
+	drv->dcp_subsystem_node = dcp_subsystem_node;
+
+	return 0;
+
+err_destroy:
+	of_platform_device_destroy(dev, NULL);
+	of_node_put(dcp_subsystem_node);
+	return ret;
+}
+
+void dcp_subsystem_dev_deinit(struct dcp_drv *drv)
+{
+	if (!drv->dcp_subsystem_dev)
+		return;
+
+	pm_runtime_disable(&drv->dcp_subsystem_dev->dev);
+	of_platform_device_destroy(&drv->dcp_subsystem_dev->dev, NULL);
+	of_node_put(drv->dcp_subsystem_node);
+	drv->dcp_subsystem_dev = NULL;
+}
+
+int dcp_pm_prepare(struct device *vdev_dev)
+{
+	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
+					  dev_to_virtio(vdev_dev))->priv : NULL;
+
+	if (!drv || !drv->dcp_subsystem_dev)
+		return 0;
+
+	return msm_kms_pm_prepare(&drv->dcp_subsystem_dev->dev);
+}
+
+void dcp_pm_complete(struct device *vdev_dev)
+{
+	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
+					  dev_to_virtio(vdev_dev))->priv : NULL;
+
+	if (!drv || !drv->dcp_subsystem_dev)
+		return;
+
+	msm_kms_pm_complete(&drv->dcp_subsystem_dev->dev);
+}
+
+static int dcp_pm_ipcc_notify(struct dcp_drv *drv)
+{
+	int ret;
+
+	if (!drv->ipcc_valid)
+		return 0;
+
+	ret = dcp_ipcc_send_power_notify(&drv->ipcc);
+	if (ret)
+		dev_warn(&drv->vdev->dev,
+			 "IPCC power notification failed during PM: %d\n", ret);
+
+	return ret;
+}
+
+int dcp_pm_suspend(struct device *vdev_dev)
+{
+	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
+					  dev_to_virtio(vdev_dev))->priv : NULL;
+
+	if (!drv || !drv->dcp_subsystem_dev)
+		return 0;
+
+	return dcp_pm_ipcc_notify(drv);
+}
+
+int dcp_pm_resume(struct device *vdev_dev)
+{
+	struct dcp_drv *drv = vdev_dev ? ((struct virtio_device *)
+					  dev_to_virtio(vdev_dev))->priv : NULL;
+
+	if (!drv || !drv->dcp_subsystem_dev)
+		return 0;
+
+	return dcp_pm_ipcc_notify(drv);
+}
+
+static int dcp_self_bind(struct device *master, struct device *dev, void *data)
+{
+	return 0;
+}
+
+static void dcp_self_unbind(struct device *master, struct device *dev,
+			    void *data)
+{
+}
+
+static const struct component_ops dcp_self_ops = {
+	.bind   = dcp_self_bind,
+	.unbind = dcp_self_unbind,
+};
+
+int dcp_component_register(struct dcp_drv *drv)
+{
+	struct device *dev = &drv->dcp_subsystem_dev->dev;
+	struct component_match *match = NULL;
+	int ret;
+
+	/*
+	 * DCP has no host-visible display subcomponents: firmware owns the
+	 * underlying display blocks. The self component is only the minimal shim
+	 * needed to enter the existing MSM DRM component-master init path without
+	 * adding a DCP-specific entry point to common MSM DRM code.
+	 */
+	ret = component_add(dev, &dcp_self_ops);
+	if (ret) {
+		dev_err(dev, "component_add failed: %d\n", ret);
+		return ret;
+	}
+
+	component_match_add(dev, &match, component_compare_dev, dev);
+
+	ret = component_master_add_with_match(dev, &msm_drm_ops, match);
+	if (ret) {
+		dev_err(dev, "component_master_add_with_match failed: %d\n",
+			ret);
+		component_del(dev, &dcp_self_ops);
+		return ret;
+	}
+
+	return 0;
+}
+
+void dcp_component_unregister(struct dcp_drv *drv)
+{
+	struct device *dev = &drv->dcp_subsystem_dev->dev;
+
+	component_master_del(dev, &msm_drm_ops);
+	component_del(dev, &dcp_self_ops);
+}
+
+static int dcp_panic_notifier_cb(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct dcp_drv *drv = container_of(nb, struct dcp_drv, panic_notifier);
+
+	if (drv->hfi)
+		atomic_set(&drv->hfi->shutdown_in_progress, 1);
+
+	return NOTIFY_OK;
+}
+
+void dcp_panic_notifier_register(struct dcp_drv *drv)
+{
+	drv->panic_notifier.notifier_call = dcp_panic_notifier_cb;
+	atomic_notifier_chain_register(&panic_notifier_list, &drv->panic_notifier);
+}
+
+void dcp_panic_notifier_unregister(struct dcp_drv *drv)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list, &drv->panic_notifier);
+}
+
+void __init msm_dcp_register(void)
+{
+	dcp_virtio_register();
+}
+
+void __exit msm_dcp_unregister(void)
+{
+	dcp_virtio_unregister();
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_drv.h b/drivers/gpu/drm/msm/dcp/dcp_drv.h
index af2db3cf9066..ca8e5bd284e0 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_drv.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_drv.h
@@ -26,6 +26,25 @@ struct dcp_drv {
 	struct dcp_dpu_kms	*kms;
 	struct dcp_caps		 caps;
 	struct notifier_block	 panic_notifier;
+	struct dcp_ipcc		 ipcc;
+	bool			 ipcc_valid;
 };
 
+int dcp_subsystem_dev_init(struct dcp_drv *drv);
+void dcp_subsystem_dev_deinit(struct dcp_drv *drv);
+
+int dcp_component_register(struct dcp_drv *drv);
+void dcp_component_unregister(struct dcp_drv *drv);
+
+int dcp_pm_prepare(struct device *vdev_dev);
+void dcp_pm_complete(struct device *vdev_dev);
+int dcp_pm_suspend(struct device *vdev_dev);
+int dcp_pm_resume(struct device *vdev_dev);
+
+void dcp_panic_notifier_register(struct dcp_drv *drv);
+void dcp_panic_notifier_unregister(struct dcp_drv *drv);
+
+void __init msm_dcp_register(void);
+void __exit msm_dcp_unregister(void);
+
 #endif /* __DCP_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.c b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
new file mode 100644
index 000000000000..b2aeb03688c9
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * DCP VirtIO device driver.
+ */
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/pm_runtime.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+
+#include "dcp_drv.h"
+#include "dcp_dpu_kms.h"
+#include "dcp_hfi.h"
+#include "dcp_ipcc.h"
+#include "dcp_virtio.h"
+#include "msm_drv.h"
+#include "msm_kms.h"
+
+static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv);
+
+static const unsigned int dcp_virtio_features[] = {
+	VIRTIO_F_VERSION_1,
+	VIRTIO_F_NOTIFICATION_DATA,
+	VIRTIO_F_RING_RESET,
+	VIRTIO_F_ACCESS_PLATFORM,
+};
+
+/*
+ * The VirtIO core owns transport discovery. This driver owns HFI setup and
+ * creates the DRM component only after firmware capabilities are available.
+ */
+static int dcp_virtio_probe(struct virtio_device *vdev)
+{
+	struct dcp_drv *drv;
+	struct virtqueue *vqs[DCP_NUM_VQS];
+	struct virtqueue_info vqs_info[DCP_NUM_VQS] = {
+		[DCP_VQ_CMD]  = { .name = "cmd",  .callback = dcp_hfi_cmd_callback },
+		[DCP_VQ_RESP] = { .name = "resp", .callback = dcp_hfi_resp_callback },
+	};
+	struct dcp_dpu_kms *dpu_kms;
+	struct msm_drm_private *priv;
+	int ret;
+
+	dev_dbg(&vdev->dev, "DCP VirtIO probe started\n");
+
+	drv = devm_kzalloc(&vdev->dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	drv->vdev = vdev;
+	vdev->priv = drv;
+
+	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
+		dev_err(&vdev->dev, "VIRTIO_F_VERSION_1 not negotiated\n");
+		return -ENODEV;
+	}
+	/* Access-platform is required for the firmware-visible IOVA mappings. */
+	if (!virtio_has_feature(vdev, VIRTIO_F_ACCESS_PLATFORM)) {
+		dev_err(&vdev->dev, "VIRTIO_F_ACCESS_PLATFORM not negotiated\n");
+		return -ENODEV;
+	}
+
+	ret = dcp_subsystem_dev_init(drv);
+	if (ret)
+		return ret;
+
+	ret = dcp_ipcc_init(&drv->ipcc, vdev->dev.parent);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			dev_err_probe(&vdev->dev, ret,
+				      "IPCC not ready, deferring probe\n");
+		else
+			dev_err(&vdev->dev, "IPCC init failed: %d\n", ret);
+		goto err_fn_dev;
+	}
+	drv->ipcc_valid = !!drv->ipcc.power_chan;
+
+	ret = virtio_find_vqs(vdev, DCP_NUM_VQS, vqs, vqs_info, NULL);
+	if (ret) {
+		dev_err(&vdev->dev, "virtqueue allocation failed: %d\n", ret);
+		goto err_ipcc;
+	}
+
+	ret = dcp_hfi_init(drv, vdev, vqs[DCP_VQ_CMD], vqs[DCP_VQ_RESP],
+			   vdev->dev.parent);
+	if (ret) {
+		dev_err(&vdev->dev, "HFI init failed: %d\n", ret);
+		goto err_del_vqs;
+	}
+
+	if (drv->ipcc_valid)
+		dcp_ipcc_set_resp_vq(&drv->ipcc, vqs[DCP_VQ_RESP]);
+
+	/*
+	 * Keep the device unready until HFI state and virtqueues are initialized.
+	 * KMS registration below depends on synchronous firmware initialization.
+	 */
+	virtio_device_ready(vdev);
+	virtqueue_kick(drv->hfi->resp_vq);
+
+	ret = dcp_hfi_send_device_init(drv->hfi);
+	if (ret) {
+		dev_err(&vdev->dev, "HFI DEVICE_INIT failed: %d\n", ret);
+		goto err_hfi_deinit;
+	}
+
+	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
+	if (ret) {
+		dev_err(&vdev->dev, "HFI GET_CAPS failed: %d\n", ret);
+		goto err_hfi_deinit;
+	}
+
+	/* Register the display resources before exposing the DRM component. */
+	ret = dcp_hfi_send_resource_register(drv->hfi);
+	if (ret) {
+		dev_err(&vdev->dev, "HFI RESOURCE_REGISTER failed: %d\n", ret);
+		goto err_hfi_deinit;
+	}
+
+	dev_dbg(&vdev->dev,
+		"DCP caps: %u displays, max %ux%u, %u planes, features=0x%x\n",
+		 drv->caps.num_crtcs, drv->caps.max_width, drv->caps.max_height,
+		 drv->caps.max_planes, drv->caps.features);
+
+	dpu_kms = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*dpu_kms), GFP_KERNEL);
+	if (!dpu_kms) {
+		ret = -ENOMEM;
+		goto err_hfi_deinit;
+	}
+
+	dpu_kms->drv       = drv;
+	dpu_kms->pm_dev    = &drv->dcp_subsystem_dev->dev;
+	dpu_kms->hfi       = drv->hfi;
+	dpu_kms->caps      = &drv->caps;
+	dpu_kms->dpus_np   = drv->dcp_subsystem_node;
+	dpu_kms->iommu_dev = &drv->dcp_subsystem_dev->dev;
+
+	ret = msm_kms_init(&dpu_kms->base, &dcp_dpu_kms_funcs);
+	if (ret) {
+		dev_err(&vdev->dev, "msm_kms_init failed: %d\n", ret);
+		goto err_hfi_deinit;
+	}
+
+	priv = devm_kzalloc(&drv->dcp_subsystem_dev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err_hfi_deinit;
+	}
+
+	priv->kms      = &dpu_kms->base;
+	priv->kms_init = dcp_kms_init;
+	dev_set_drvdata(&drv->dcp_subsystem_dev->dev, priv);
+	dpu_kms->rpm_enabled = true;
+
+	/* Component binding now sees initialized HFI, capabilities, and IOMMU state. */
+	ret = dcp_component_register(drv);
+	if (ret) {
+		dev_err(&vdev->dev, "component register failed: %d\n", ret);
+		goto err_hfi_deinit;
+	}
+
+	dcp_panic_notifier_register(drv);
+
+	dev_dbg(&vdev->dev, "DCP VirtIO probe complete\n");
+	return 0;
+
+err_hfi_deinit:
+	dcp_virtio_hfi_cleanup(drv);
+	goto err_ipcc;
+err_del_vqs:
+	virtio_reset_device(vdev);
+	vdev->config->del_vqs(vdev);
+err_ipcc:
+	if (drv->ipcc_valid) {
+		dcp_ipcc_deinit(&drv->ipcc);
+		drv->ipcc_valid = false;
+	}
+err_fn_dev:
+	dcp_subsystem_dev_deinit(drv);
+	return ret;
+}
+
+static void dcp_virtio_hfi_cleanup(struct dcp_drv *drv)
+{
+	struct virtio_device *vdev = drv->vdev;
+
+	if (!drv->hfi)
+		return;
+
+	dcp_hfi_stop(drv->hfi);
+	virtio_reset_device(vdev);
+	virtio_synchronize_cbs(vdev);
+	vdev->priv = NULL;
+	dcp_hfi_quiesce_queues(drv->hfi);
+	vdev->config->del_vqs(vdev);
+	dcp_hfi_deinit(drv->hfi);
+	drv->hfi = NULL;
+}
+
+/*
+ * Remove DRM users before tearing down HFI, IPCC, or the VirtIO queues.
+ */
+static void dcp_virtio_remove(struct virtio_device *vdev)
+{
+	struct dcp_drv *drv = vdev->priv;
+
+	dev_dbg(&vdev->dev, "DCP VirtIO remove\n");
+
+	if (!drv)
+		return;
+
+	dcp_component_unregister(drv);
+	dcp_panic_notifier_unregister(drv);
+
+	dcp_virtio_hfi_cleanup(drv);
+
+	if (drv->ipcc_valid) {
+		dcp_ipcc_deinit(&drv->ipcc);
+		drv->ipcc_valid = false;
+	}
+
+	dcp_subsystem_dev_deinit(drv);
+}
+
+/* KMS shutdown must complete while the firmware transport is available. */
+static void dcp_virtio_shutdown(struct virtio_device *vdev)
+{
+	struct dcp_drv *drv = vdev->priv;
+
+	if (!drv || !drv->dcp_subsystem_dev)
+		return;
+
+	pm_runtime_get_sync(&drv->dcp_subsystem_dev->dev);
+	msm_kms_shutdown(drv->dcp_subsystem_dev);
+	pm_runtime_put_noidle(&drv->dcp_subsystem_dev->dev);
+}
+
+/*
+ * Firmware capabilities may change independently of the VirtIO transport;
+ * refresh them without rebuilding the DRM device.
+ */
+static void dcp_virtio_config_changed(struct virtio_device *vdev)
+{
+	struct dcp_drv *drv = vdev->priv;
+	int ret;
+
+	dev_dbg(&vdev->dev, "VirtIO config changed — re-querying DCP capabilities\n");
+
+	if (!drv || !drv->hfi)
+		return;
+
+	ret = dcp_hfi_get_capabilities(drv->hfi, &drv->caps);
+	if (ret)
+		dev_err(&vdev->dev,
+			"config_changed: capability re-query failed: %d\n", ret);
+	else
+		dev_dbg(&vdev->dev,
+			"config_changed: DCP caps updated: %u displays, features=0x%x\n",
+			 drv->caps.num_crtcs, drv->caps.features);
+}
+
+static const struct virtio_device_id dcp_virtio_id_table[] = {
+	{ VIRTIO_ID_QPSFI, VIRTIO_VENDOR_ID_DCP_HFI },
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(virtio, dcp_virtio_id_table);
+
+static const struct dev_pm_ops dcp_virtio_pm_ops = {
+	.prepare = dcp_pm_prepare,
+	.complete = dcp_pm_complete,
+	.suspend = dcp_pm_suspend,
+	.resume = dcp_pm_resume,
+};
+
+static struct virtio_driver dcp_virtio_driver = {
+	.driver = {
+		.name  = "qcom-dcp-hfi",
+		.owner = THIS_MODULE,
+		.pm    = &dcp_virtio_pm_ops,
+	},
+	.id_table           = dcp_virtio_id_table,
+	.feature_table      = dcp_virtio_features,
+	.feature_table_size = ARRAY_SIZE(dcp_virtio_features),
+	.probe              = dcp_virtio_probe,
+	.remove             = dcp_virtio_remove,
+	.shutdown           = dcp_virtio_shutdown,
+	.config_changed     = dcp_virtio_config_changed,
+};
+
+int dcp_virtio_register(void)
+{
+	return register_virtio_driver(&dcp_virtio_driver);
+}
+
+void dcp_virtio_unregister(void)
+{
+	unregister_virtio_driver(&dcp_virtio_driver);
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_virtio.h b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
new file mode 100644
index 000000000000..fe244bc5b51a
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_virtio.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * DCP VirtIO driver interface.
+ */
+
+#ifndef __DCP_VIRTIO_H__
+#define __DCP_VIRTIO_H__
+
+#include <linux/device.h>
+#include <linux/virtio.h>
+#include <linux/virtio_ids.h>
+
+struct dcp_drv;
+
+#define VIRTIO_ID_QPSFI		                52
+#define VIRTIO_VENDOR_ID_DCP_HFI		    1
+
+int dcp_virtio_register(void);
+void dcp_virtio_unregister(void);
+
+#endif /* __DCP_VIRTIO_H__ */

-- 
2.43.0


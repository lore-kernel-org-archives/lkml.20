Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478563;
	b=fFrfzXhsAecMDY+0izBHrVvUYEpVgORloA71cNXCG+MaAXKx1nvn5JYDjAM74oisAT5X
	 5DE8OqOlayQWYGPD2N2WvFVIiwmZOy1wc/VmriMCmUtYUNTvRxxZ0nyxKrMS3HKLwwaws
	 67BuimyKTf9crFbZwS9eGTjyDnr51AaQFvTW9l8MdMF858sgv4kD5pQe2I7o591qcnqpK
	 HTm8jW/PCh+ZqPkiNfwP6q2cJ7fB42mvpwHnCAwYtvAOMvgelCWbSvHRWaALD1VSyr6VB
	 xarTqiFQZ+OfwSzyEDB00hMCPrL22W9qKayjp1SH+abOTDr3/L47iHjMxGZH2PZyVFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
	b=iBmZoMnmy879QQUVkvKA2Dpao4h+WE4pRF/a1ApoTqOpYUzzJ0EUL4b2GJqPXjgAXmlA
	 fKfAUquv9suGekerMBydUJjm6jbGa4FUYOMv7NdRE0IKl8V5D/zPs5SmHkCY/9O1iQDuh
	 cQhnkA3qx59pnhl4+i/uLoqqF4A88+zjb5F/EI9OSAJhe57Q3fyDURCu2r1UXnzn6JdH7
	 qMY4w7e1HiuwEc5VJtvgoiNoFHfm5T4lGQDyxyV8GTkiWctIaIgpSSbGDzuqVXGYrqnzk
	 Z9ZlXcHGtso9bdHbkys5VEAhKsNuX0aK7DyoIY6BJmZYQlyU9MRb8VX7GbdqTHHvQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZ2jUCMi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0ZBCHmk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0164606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0164606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZ2jUCMi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H0ZBCHmk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4mKIG3893714
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=; b=NZ2jUCMiHpSqqMx6
	zlYsMBe4yryxiEmUOxgaAidd6FJWGTieuc+L6GVydo8BBcAeKKXxYhxiphp2qxCC
	ZT5aSfLUQyEgqOa+FxU+37WESK87eivItemtJu4bGeHh2XXVAYkq+84HFcHW0lJV
	CTRnxlhQN5puNUYN5R4rSoWhqTAy5VN+l/Fl20PdyPltEv73uGxLZO9WZhksqh/w
	DXBcToxupO4ZqTooLp4cjUHzw/HLipafsP2QW+fycch2FFdH0CMtDRqEOontvkKz
	0YT+rOW+BpcHl3F579u4UOTtjDZKM6oJCjRm1Wjbp0oM+K0VBKlbjQvHA4HteyMJ
	XWJW7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re143c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:16:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso748369b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478561; x=1795083361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
        b=H0ZBCHmk0/QxuIvjkpXsOa804Mt4sCI1hqAJP18TbTFIyNg3PJzG6KzJmK4tANRggo
         VXH0f1UBaGEmvDxTGsASzIVMCeH8Etc0y1iNSpDlG5IxTNtLUuldVtXGhYDQ0ul0L1o8
         PVomst+bumxNtbAsOlstB8WB6X6Ha8Zgz0OVUthhmIQKKlsfgyRdLtBJ6o3TPz/+187m
         tmJHzGigDwdwNM/IUAcV4VY2E6Fit3cwletbjCM6Ct6tc1bvSiuCAhlrnMNG5vBf6az5
         R2H7NvN82lKsf2vaXeXp+Y9Uj9m8hKir/Zfx6pi0nxuEOeZRxVHp/UE6q4C0tuqc1Iqw
         sKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478561; x=1795083361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnpC1o4w+tOv95d2csXSbIs144vrlpYd+10v5+15MJM=;
        b=QkylOWXDxoNmu2A78akyAxgNBvOojPlZdntrka/rDijXxPY1Sqea1294d/2+7me9Zu
         Orvi0iDFqs05dI9OZi7JOHB8jecFqVkeyyqWpMsGhvPJic2aJMLSbgFZmb7IHeJxJFm3
         4AciU+Fnk6vIG4HKbrrmUBbex/OTONbWKypFBhGII56wv2ePdOAUleifl1HJVMOYAJ/6
         /A88iDLGPUFGF/9wd4N0NyqoTMiy5txiIwHz0ANyI9qPSNs8Awnej+K6uoAWqoOf85h2
         3snUlrJMKrONZZ+NUdw2kL3DbwqxwsQCYCN7tQjcZw4MX3fnPUodOFivnKcORuXxYnT8
         ZMAg==
X-Forwarded-Encrypted: i=1; AL+hErHUu1cYkJwlg8mj4G+joxKV1cEZ2LdC4c7rDkGqVSC9BzgHShzczEfYDZf5WcR0VMeq+DzwcpUJ0rYqcVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BAnXCDgq1i/8LgTjREGurqv/LKy8PvgXBOOWLmJql5MTZz+yn
	S1RBrVswPY+U8Sfx/CwuwO8XHT33UIkc2gTKGCfTgieWEL1asjXVbSCexEVVXO3Sz8XtOvvUjmt
	M2rc0kFETl3dxIHP4HC8spaDt5EFRjQKzp5ZFNjNr/qeH85bnaAAF/Z9lr9BiI8KUmi4=
X-Gm-Gg: AYBFou2Wxqq6KeTJhhfudS3SPcVDX3I79YYbyK7vg3Wv29DVAlcIB53YxPmQiVS+fxk
	0eMfkuLYA4l/PJ56OJ2OkQjaHBqOLk94TRzhAbj9i4ZlOIJ/uTbrwrx2Vry5+/6blauEFI3mIj2
	fhEnJI4MfkoAY57pOKg4Azmm0nQQyRO81SF9bbxLBZuUa3y5YCMy7h1yWyPi0m+ZNGcPtbbI7UW
	qDj1LC0UENlfStqatS/1YzcW637l50qMCcqnjxPm3Px1gEzIHj/99AgHO/BcVbC9xU/JYdSGkxH
	bQb6121uXGNRmshBXn8yOYHT5PBeAPszfYBMcjB9be3ffHpt+hoCnZHmJXhn36xVApXJeiNctiw
	dJVDE1axhF9DFDIxjSXV5efC/ueaZFhq0FKSwxgLqjk1vkXBfwx0FyM82SsYyJZmrRBWKQBw9Eo
	tv
X-Received: by 2002:a05:6a00:10c9:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-8bd5d258143mr1421608b3a.23.1794478561011;
        Thu, 12 Nov 2026 02:16:01 -0800 (PST)
X-Received: by 2002:a05:6a00:10c9:b0:886:490b:f1d2 with SMTP id d2e1a72fcca58-8bd5d258143mr1421596b3a.23.1794478560481;
        Thu, 12 Nov 2026 02:16:00 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:16:00 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:35 +0530
Subject: [PATCH 2/4] drm/bridge: Add a driver for the Parade PS195
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
Message-Id: <20261112-mahua-hdmi-v1-2-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=8398;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Ev1YoXF6RmFg1bXBqI4pX+IenS+MD6ysl7ouGSoK85M=;
 b=bKmVS912mH3Zn5le0h7vNkNM7Ei1aVg0ZHVin3dKBPU6VFYoYmw4pUVNvFhRRTsjZhnZ79H8o
 LtwTg4KW2UZA9PJ+ZxjrUNYa2tFjqVWPo7YMWv/KS8qu3VDxDjYc/Qq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 5dmot7a500RVhaFhETUgUp9Om3gI5m3p
X-Proofpoint-GUID: 5dmot7a500RVhaFhETUgUp9Om3gI5m3p
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af591e1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=_PMkZo2J1_9kd9osg98A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX+/CRIqzyi60X
 fRGXnQmUClYU1FNSNN5kUx5Jk0M9b96iyW1qpfu13tk02f4r9WzSmA8IUpttiwD14fn41kwlgde
 M4GS1ZkKVz242YM0hCCGZgdr32WyTF8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX5YJAZQYsqXf2
 JGwFY5jPHjEPYdY46rPQEhFUjG7IdtJT+J9EcdYNhTC8otbpP82Br3c5DUBRd2bELiJURrOrewu
 ssA13dcuryYOnpWso/rYwfPFRPgFbVjLSy3eQeDSQ7/HMokBALAIcXkuq6tgeEgrJxSCxtrzuGp
 +rocCyo37utBC1nHWeRc7nzONV4MA55dIfLtfoYnJlIQ8qboTHqq37hKXkmcgK/wRe6K49/qWTX
 tGR8UPQZOq4fTFq8TLBssAkL8TrgHtVglwrF1zuiWbraLhkkTu6BB6iH2N917XkSmgbC4GBLM1X
 qxX1k8O4jbY2QOa9VQSiWQCr0mxFIy7LhzuH5o87mdhNlSTkc7FC+F8USSjLGsj0NyImifnI3fI
 bUNCSYuGIsCLahKjSj6ZuCrjq5KG1mOs6Kx+tf09mIJux7Q9zxNQ2IOyut28AjhplgPDAacVsvf
 MJwArvkMqVCoy455xkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

The Parade PS195 is a DisplayPort to HDMI converter that runs firmware
from external SPI flash. Add a platform bridge driver to sequence its
power supplies and optional reset GPIO.

Keep the bridge powered for AUX and HPD handling between modesets. Use
late suspend and early resume to order power transitions around the
display controller.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 MAINTAINERS                           |   1 +
 drivers/gpu/drm/bridge/Kconfig        |  10 ++
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/parade-ps195.c | 197 ++++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1db88ec1c9..cd83b47d9f85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8586,6 +8586,7 @@ M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+F:	drivers/gpu/drm/bridge/parade-ps195.c
 
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6..abb1aa36ce3d 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -273,6 +273,16 @@ config DRM_OF_DISPLAY_MODE_BRIDGE
 	  It exists for compatibility with legacy display mode parsing, in order
 	  to conform to the panel-bridge framework.
 
+config DRM_PARADE_PS195
+	tristate "Parade PS195 DisplayPort to HDMI converter"
+	depends on OF && REGULATOR
+	select DRM_KMS_HELPER
+	help
+	  Enable support for the Parade PS195 DisplayPort to HDMI converter.
+	  Its firmware handles the display protocol; this driver controls
+	  the power supplies and reset input.
+	  When built as a module, the module is called parade-ps195.
+
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7..425722c7becb 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE) += of-display-mode-bridge.o
+obj-$(CONFIG_DRM_PARADE_PS195) += parade-ps195.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
 obj-$(CONFIG_DRM_SAMSUNG_DSIM) += samsung-dsim.o
diff --git a/drivers/gpu/drm/bridge/parade-ps195.c b/drivers/gpu/drm/bridge/parade-ps195.c
new file mode 100644
index 000000000000..beddb23c38ae
--- /dev/null
+++ b/drivers/gpu/drm/bridge/parade-ps195.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Parade PS195 DisplayPort to HDMI protocol converter
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+
+/* Enable the supplies in this order and disable them in reverse. */
+static const char * const ps195_supply_names[] = {
+	"vdd09",
+	"vdd12",
+	"vdd33",
+};
+
+struct ps195 {
+	struct drm_bridge bridge;
+	struct device *dev;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ps195_supply_names)];
+	struct gpio_desc *reset_gpio;
+	bool powered;
+};
+
+static void ps195_disable_supplies(struct ps195 *ps195, unsigned int count)
+{
+	int ret;
+
+	while (count) {
+		count--;
+		ret = regulator_disable(ps195->supplies[count].consumer);
+		if (ret)
+			dev_err(ps195->dev, "Failed to disable %s: %d\n",
+				ps195->supplies[count].supply, ret);
+
+		/* Allow discharge before disabling the next rail. */
+		if (count)
+			usleep_range(1000, 2000);
+	}
+}
+
+static void ps195_power_off(struct ps195 *ps195)
+{
+	if (!ps195->powered)
+		return;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	ps195_disable_supplies(ps195, ARRAY_SIZE(ps195->supplies));
+	ps195->powered = false;
+}
+
+static int ps195_power_on(struct ps195 *ps195)
+{
+	unsigned int i;
+	int ret;
+
+	if (ps195->powered)
+		return 0;
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 1);
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++) {
+		ret = regulator_enable(ps195->supplies[i].consumer);
+		if (ret) {
+			dev_err(ps195->dev, "Failed to enable %s: %d\n",
+				ps195->supplies[i].supply, ret);
+			goto err_disable;
+		}
+
+		/* Allow the rail to settle before continuing. */
+		usleep_range(2000, 3000);
+	}
+
+	gpiod_set_value_cansleep(ps195->reset_gpio, 0);
+	ps195->powered = true;
+
+	return 0;
+
+err_disable:
+	ps195_disable_supplies(ps195, i);
+	return ret;
+}
+
+static void ps195_power_off_action(void *data)
+{
+	ps195_power_off(data);
+}
+
+static int ps195_suspend(struct device *dev)
+{
+	ps195_power_off(dev_get_drvdata(dev));
+	return 0;
+}
+
+static int ps195_resume(struct device *dev)
+{
+	return ps195_power_on(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops ps195_pm_ops = {
+	/* Keep AUX and HPD available until the display controller suspends. */
+	LATE_SYSTEM_SLEEP_PM_OPS(ps195_suspend, ps195_resume)
+};
+
+static int ps195_bridge_attach(struct drm_bridge *bridge,
+			       struct drm_encoder *encoder,
+			       enum drm_bridge_attach_flags flags)
+{
+	return drm_bridge_attach(encoder, bridge->next_bridge, bridge, flags);
+}
+
+static const struct drm_bridge_funcs ps195_bridge_funcs = {
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.attach = ps195_bridge_attach,
+};
+
+static int ps195_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ps195 *ps195;
+	unsigned int i;
+	int ret;
+
+	ps195 = devm_drm_bridge_alloc(dev, struct ps195, bridge,
+				      &ps195_bridge_funcs);
+	if (IS_ERR(ps195))
+		return PTR_ERR(ps195);
+
+	ps195->dev = dev;
+	platform_set_drvdata(pdev, ps195);
+
+	ps195->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(ps195->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(ps195->bridge.next_bridge),
+				     "Failed to get output bridge\n");
+
+	for (i = 0; i < ARRAY_SIZE(ps195->supplies); i++)
+		ps195->supplies[i].supply = ps195_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps195->supplies),
+				      ps195->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
+
+	ps195->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ps195->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ps195->reset_gpio),
+				     "Failed to get reset GPIO\n");
+
+	ret = devm_add_action_or_reset(dev, ps195_power_off_action, ps195);
+	if (ret)
+		return ret;
+
+	/*
+	 * Firmware drives DP HPD and services AUX, including EDID reads,
+	 * before a modeset. Keep the bridge powered while the system is
+	 * awake, including when no monitor is connected.
+	 */
+	ret = ps195_power_on(ps195);
+	if (ret)
+		return ret;
+
+	ps195->bridge.of_node = dev->of_node;
+	ps195->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+
+	return devm_drm_bridge_add(dev, &ps195->bridge);
+}
+
+static const struct of_device_id ps195_of_match[] = {
+	{ .compatible = "parade,ps195" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ps195_of_match);
+
+static struct platform_driver ps195_driver = {
+	.probe = ps195_probe,
+	.driver = {
+		.name = "parade-ps195",
+		.of_match_table = ps195_of_match,
+		.pm = pm_sleep_ptr(&ps195_pm_ops),
+	},
+};
+module_platform_driver(ps195_driver);
+
+MODULE_AUTHOR("Mahadevan P <mahadevan.p@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Parade PS195 DisplayPort to HDMI bridge driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


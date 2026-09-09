Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FA4F55A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961727; cv=none; b=W3v3CFUfWXb9kDIHFr8ourOAgQZ+awYETM57UHvG3Z0uh0v2rA5Pe+w+22EdUDZsF+og91AWmuo0k79FzyjjMPfMG68CqUMq5y+1WRbdeEy9JIZ28s0YcOqXYe0t8bTnNRwO/mrO4ehpSNEDdUipcpXZx5Fl++oa0px//ZsjHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961727; c=relaxed/simple;
	bh=fNTiS/H2gUkjedeL15QTSU/7mML3BWEe0xtBdBQqtlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=diGFP3YxHfvyFo78ed+GRTwYMuGrY9JrGycJjR09Q+boK+At4+Os7bWwm4K18NwvQlCm6p98MOmEotrjlxBmy00qjrF3niphJChGsKHMvdLQ5wG/K6v0l0nfljO9PIl0rn6h/4iTDaP41/qc+M9oejBXf2dm67+z16a1Eq96q+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhYl010z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A992SEuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhYl010z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A992SEuS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU6SZ599799
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gXUaaYBTPyVGwfzrBTCeQK
	7umpGaf7wY4Ve1YT9tETI=; b=WhYl010zLDUy0GwA9JEVUM6G1AN4Ko7qd1yFZZ
	NO5xCT0fLJ6dhuId5yyCH1sFtL9wFN3Kds0p42L8RvVMXh2evhmen4y9Nhf4ABr0
	SLNM9aAn30BpzrilluBalLhV+oYgn0yiAWb6DvocJMeHhZKvX8Eaawwd2o0pZoeS
	LEcU4Wm/O6w3sbtblIPegqLs703FqlvSM6HouyFYgQ99hwW4R5/zSAXoQukK4NGG
	TLWxcU/f+gBdrNTwARQsE/U2Sudadzzk/F8qhnUKCgE9l495rxH0atAqZ8onhQuN
	XzBGZkX7ViepvLgHoGzwlDypEG8SSG7QVWBJXS7XxZnDxXFw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr291t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:48:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2101314a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961724; x=1789566524; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gXUaaYBTPyVGwfzrBTCeQK7umpGaf7wY4Ve1YT9tETI=;
        b=A992SEuSZwDfd4tP93ua3KhzIHFPaquVzKjjrnWAiop7wdnuQ6vJtxY+0rl3DYyuNx
         tF/pinF4WIGIRV99RSwx82gnhqfW3E/J6djmdaLzctWzuyunGDFjP3XLc5eO9yHQNE8F
         +GSZmsuOIoqOehZF8SSp++5o6LSldOql/to9Uz/ZZGR5pix3r7qLh3LDiCrke0mMwRNQ
         /DriFEqnNGuZZ9JLrtEwRhflDJ4m8MaaGDpjZhZc/e6gIhyfyTSrZTZGzI3Ba+aCFUt+
         wcfTjDqdfTbDgKptumNIpS7CA3lDTImbWMj1Xke/J3xVnkHS5BkKikKdfZG42VikOccG
         HqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961724; x=1789566524;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gXUaaYBTPyVGwfzrBTCeQK7umpGaf7wY4Ve1YT9tETI=;
        b=BJcsWAPLCeL8NMI4Zu5lRxHCK78yODeel0iv4vihTezF8YeIA9gFfdFrxR/Fg3/yB4
         AMtF+f1sash2QWcV1eGhmpkRzyx87K1oZylCzJH1YyxHw/PgS8FEt/XydAmFy/IDyEYr
         ivGwWXaG+yRJVagbw0FRX+u02WQTpYF8HcKYTd1vCdh4FtsdoqwQn1zadAhrMgroFg33
         L/JV3ye/nsOcjUP5fUV6XDd/53pqZcooBEXOkPlyaOzyESSi2rhAKi5piasKftTczPkH
         haFH1Ff4ndReknVfsdZgtY1wP9/8Kw6NZyE58wtsZql0b122E3qcqNiaCDmdJ3jPGAu4
         fHJg==
X-Forwarded-Encrypted: i=1; AKwUvBwELRev0dpcoxWJgWeLWSSVfsOg8W4iyRfFDZSVUe7vLhUWGpL9w3Zme7A5AZU+2lviuVzA89kYngrBtpU=@vger.kernel.org
X-Gm-Message-State: AFuF++mvE5mez1i5zidYurpn+967xSGuQ0CZx3lksTWcZwyQ+cBBgP07
	rE2X4cbnVN2y6alhC/+X4bZRHuslHK232wlOzTGeDUdUKJ51juEizNzXCZ7ysxof4tD2drgjbnk
	7WspT1O8zWsxlCbv7huIHl2Od0UtMbZU9SHE8ayXho6dNTuVoYMzrSn0VbNShZoH5BzQ=
X-Gm-Gg: AYBFou0hgXujXTZN7R04GGvxH7u5ArnqjV6DXp1hcONatXu1e05DA7KpJlU94Vuh5wo
	UVhTw0JQwSr3b5ObKAYzBPfcNqJFTaOZF7LvqtKm/SgEWS9hz8z1jCufnXibvfhIjpNaFbqSirD
	6e8xRzGNXgcb7z27SoVsH+mZKXOvONABdLspmfR83PNZqIUBBfukImAKt2N3u3RqPPdsqcXMYwY
	iw/d24GjFCBoU4YHzZ+SZ5v6+XFFvQ/XiUM7OCwnWR4wOqDt4ca17a9eWvCZ/tyBnXg/ArciecC
	Ka2IUkW1f71GSDQr/UVWhrV60qNUzotdDiogcRMYEJbMt1Ee0t7PWm+jhJI5NfxnPIrt/wAHcqm
	NeYdopubkOeTOPTOahtdQ+rU9l6M=
X-Received: by 2002:a17:90b:57e6:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39d70a34abcmr1422034a91.7.1788961723683;
        Wed, 09 Sep 2026 06:48:43 -0700 (PDT)
X-Received: by 2002:a17:90b:57e6:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39d70a34abcmr1421985a91.7.1788961723186;
        Wed, 09 Sep 2026 06:48:43 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd658a683sm1523906a91.2.2026.09.09.06.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:48:42 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 19:18:34 +0530
Subject: [PATCH RESEND v3] drm/msm: default separate_gpu_kms to auto
 selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-separate_gpu_kms-v3-1-eae64dfbb635@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788961718; l=10232;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=fNTiS/H2gUkjedeL15QTSU/7mML3BWEe0xtBdBQqtlg=;
 b=GL9+6L2h75hSqHqAsE723CzMb49IgZgUm+107fsBtTE+mordWxd8tOpt6HFUaPD/PHBU0iUSr
 GVqtVaLqr74A9HXtM9axJWYCfrUKn9MJADMrIUvE7thY84+ibtDdXFL
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa163bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7nrE9rN0imP4snLddHEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfX63YsRwlfOJju
 TecafeGf8pdKZOQhCX3J1qq72JiO1fiHYTxdDXc4daCannVIkaNnTVzejqW+Wd5mabSmowj0FpU
 sfph+Q3fWCrTTCM2TM1Q30vb5zdQcBKos23E8dumWjjaOBu6H3q/snWaLN4edkW0iBwEMSHCJ+p
 0znNY6WfJez7CTO9aym6Hxp8sOQcKdLCd3tmCBh/XLIBk38AUz6Z3AMyGFA3oKYngz1gCBqwHN9
 BYvWi7qCBwELGurWJ1SN+B7mlvHIBNEcZ/Vf73MJ4Un2cMq+1wn7xjbFS/wGCSaTyx2kGYH2nKo
 jSz5kTxpPoWdI4zyxBifEHsIAkhchbZUmoJRrg9JDkTmigHljKy8uwGlsNsjkAVA1Noe6yveYZO
 XVgAHEQITgvhWFhrJvb+5zD9TlXqgMioG2YOi8bChXCKZKtLkPGLQSTxsYMzbTEphbjwRbmXMq4
 XyVLBXGNHj8oKoTr4qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfXx0XHbh+N5Bk3
 pwWNJv8NX2keix9r9ENwDBYaXBOMoUMvDIVomk8CGsjjJ0O7t5hzEVi100+62vEUH6XYwjcrqqj
 VPEOia8IAe8Y0ZIJVUMdF80oxG4aa7A=
X-Proofpoint-ORIG-GUID: RpM07qmnzagU2uR17bC7vQEKaIbxaMAj
X-Proofpoint-GUID: RpM07qmnzagU2uR17bC7vQEKaIbxaMAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090154

On platforms with multiple display subsystems, such as SA8775P, the GPU
binds to the first display subsystem that probes. This implicit binding
prevents subsequent display subsystems from probing successfully,
breaking multi-display support.

Use the tristate separate_gpu_kms module parameter with the default
value set to auto (-1). In auto mode, the driver selects the binding
behavior based on the number of GPUs and display subsystems. This allows
display subsystems to probe independently when required, while
preserving the existing single-card behavior on simpler systems.

The separate_gpu_kms module parameter has the following semantics:

  -1 (auto, default):
     Select the binding mode based on hardware topology. If exactly one
     GPU and one display subsystem are present, bind them together to
     form a single DRM device. Otherwise, expose the GPU and display
     subsystems as separate DRM devices.

   0:
     Always bind the GPU and display together to form a single DRM
     device.

   1:
     Always expose the GPU and display subsystems as separate DRM
     devices.

Additionally, ensure that display subsystems are always exposed as
separate DRM devices when no recognized Adreno GPU is present,
regardless of the separate_gpu_kms setting.

This ensures correct probing on multi-display platforms without
affecting single-display, single-GPU systems.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Depends on:
  https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/

  When separate_gpu_kms is enabled, the GPU and display drivers are
  probed independently. In this configuration, the Adreno GPU driver
  may no longer be loaded implicitly via the display subsystem.

  The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
  Adreno GPU device, ensuring proper module autoloading based on
  device tree matching. This is required to guarantee that the GPU
  driver is loaded correctly when GPU and display probing are
  decoupled.

Changes in v3:
- Ensure display subsystems are always exposed as separate DRM devices when
  no recognized Adreno GPU is present (!adreno_has_gpu()), regardless of
  separate_gpu_kms setting. (Dmitry)
- Extend auto-selection logic to account for legacy display controllers (MDP4 and MDP5). (Dmitry)
- Rename msm_mdss_count_masters() to msm_mdss_count() to better reflect functionality. (Dmitry)
- Common helper to determine presence of a valid Adreno GPU node, avoiding repeated
  adreno_has_gpu() and availability checks.
- Update commit message to reflect the above behavior.
- Link to v2: https://lore.kernel.org/r/20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com

Changes in v2:
- Drop dependency on Lemans dual-DPU device tree changes as this patch
  works independently (Dmitry)
- Switch separate_gpu_kms to tristate and default to auto mode (Rob)
- Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
- Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 14 +++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 14 +++++++
 drivers/gpu/drm/msm/msm_drv.c              | 64 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h              |  8 +++-
 drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++
 6 files changed, 107 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4edfe80c5be7..e40648c05797 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
 static int adreno_probe(struct platform_device *pdev)
 {
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
-	    msm_gpu_no_components())
+	    msm_separate_gpu_kms_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 809ca191e9de..409000b739b6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -15,6 +15,20 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
+static const struct of_device_id mdp4_dt_match[];
+int msm_count_mdp4(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdp4_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 1e3dc9bf9494..086895c9f103 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,6 +19,20 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
+static const struct of_device_id mdp5_dt_match[];
+int msm_count_mdp5(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdp5_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static int mdp5_hw_init(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e5ab1e28851d..e2101c6632ac 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,16 +54,64 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
-module_param(separate_gpu_kms, bool, 0400);
+/*
+ * separate_gpu_kms (tristate):
+ *   -1 (default): decide automatically based on hardware topology. Split devices
+ *                 if there is more than one GPU or more than one display master.
+ *    0: force single DRM device (bind display + GPU)
+ *    1: force separate DRM devices
+ */
+static int separate_gpu_kms = -1;
+MODULE_PARM_DESC(separate_gpu_kms,
+		 "Use separate DRM device for the GPU (-1=auto (default), 0=single DRM device, 1=separate DRM devices)");
+module_param(separate_gpu_kms, int, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-bool msm_gpu_no_components(void)
+static const struct of_device_id msm_gpu_match[];
+static inline bool msm_gpu_node_present(struct device_node *np)
+{
+	return np && of_device_is_available(np) && adreno_has_gpu(np);
+}
+
+static int msm_count_gpus(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, msm_gpu_match) {
+		if (msm_gpu_node_present(np))
+			count++;
+	}
+
+	return count;
+}
+
+static bool msm_separate_gpu_kms_auto(void)
+{
+	int gpus = msm_count_gpus();
+	int display_subsystems = msm_count_mdss() + msm_count_mdp4() + msm_count_mdp5();
+
+	if (gpus <= 0 || display_subsystems <= 0)
+		return false;
+
+	/* If exactly one GPU and one display subsystem single card */
+	return (gpus > 1) || (display_subsystems > 1);
+}
+
+bool msm_separate_gpu_kms_components(void)
 {
-	return separate_gpu_kms;
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, msm_gpu_match);
+	if (!msm_gpu_node_present(np))
+		return true;
+	if (separate_gpu_kms == 1)
+		return true;
+	if (separate_gpu_kms == 0)
+		return false;
+	return msm_separate_gpu_kms_auto();
 }
 
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
@@ -1019,7 +1067,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np) && adreno_has_gpu(np))
+	if (msm_gpu_node_present(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
@@ -1030,7 +1078,7 @@ static int add_gpu_components(struct device *dev,
 static int msm_drm_bind(struct device *dev)
 {
 	return msm_drm_init(dev,
-			    msm_gpu_no_components() ?
+			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
 				    &msm_driver,
 			    NULL);
@@ -1069,7 +1117,7 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_gpu_no_components()) {
+	if (!msm_separate_gpu_kms_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..a977fe7b36b8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -555,6 +555,12 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
-bool msm_gpu_no_components(void);
+bool msm_separate_gpu_kms_components(void);
+
+int msm_count_mdss(void);
+
+int msm_count_mdp4(void);
+
+int msm_count_mdp5(void);
 
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..4c788f2647b0 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
+static const struct of_device_id mdss_dt_match[];
+
+int msm_count_mdss(void)
+{
+	struct device_node *np;
+	int count = 0;
+
+	for_each_matching_node(np, mdss_dt_match) {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-separate_gpu_kms-04d2cf4d91e2

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


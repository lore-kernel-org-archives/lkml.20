Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3B44E64C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578761; cv=none; b=qZ0ASVJErEWmQp4GUjTMXRKzHcPq6zmtxRIU/d5sSwltQ9oDhq59LU1K1k0MM4LA6fcXYP0r/hKo7wd6wFpYx9GdHm/oFryw3CRn4ZFXpymM8ptUDka06MjmBKEv84fLs3tTb5a6Br9c9oOQjI/x+CDEM5vQB86TyDFRDpN8ZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578761; c=relaxed/simple;
	bh=Qbu1ajf2zMMBmGHIiRKeFRx8ze0javq01HlVA1lp2Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UAPa94HOm7nF2+xu6i/cCyjmbLMHXVeF9vul/EFGmSRp/7+GB3BxzU4xXtUh4Y1lusRd3B53qzBFXV8DXRgpK6dpYuj4U2wiG8xQM0Ze0SjX/cpFishD95UAAAgWV0CxBf5vI9LWLLp/Y/xQVKO7FqCbBvW+ARIo+WsBVeo7s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4M8ulpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juKn9Rar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4M8ulpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juKn9Rar"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P3xl674763
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6riuziqggSIQ5VIX9CrxjJ
	eBcpTwr5JJlcJHLZ23opo=; b=X4M8ulpk943Ba2JoFbRRWMnNYbasonQENBHUd0
	bU9rQs/jHENvvD4HVpLKoVanGGjyyCzOTGXhqOvZZPfjvlGm+S4tMZtloCM0ttzy
	w8GWnFgb0qSGepjnT0ItKuMj1pd2qWa1EnOu9hK1G5K86rlt6oleKtJrQhQecrbR
	FMh6VH+HM5iuxN46gaupSXrUyrNuNJOOTqo9a/+uet7FX4IatQTwBjzLOozpYTOG
	rp/FFVOEU8DyRutdBFZTpa/sR+9ioLC9S/BxAyDAYsmXRsTB4uoRZCegttpnC9Ry
	3CXIlx8NHVAf1c0JnZhk9PaReva/Sa+ffSYKc4PzFfubz3XQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s09qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:59:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88078ca8725so774209b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790578755; x=1791183555; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6riuziqggSIQ5VIX9CrxjJeBcpTwr5JJlcJHLZ23opo=;
        b=juKn9RarOi68WpZlvyqZ9QJ+UOa6A5VhZYyokSkZb6+/PXx+BlG5sei17dbn4xb8BY
         VIvjpqulM6RfBOJ7wtu0II0J6YIcDDIYj8cBQXMYrfXQvidbYlK5ft3tKDMMNvpUEk/g
         RrqJIpXVohnWIYTJVeX2nbSoV4TLPCgFCLHRA3wO93Wp5j86tiGKhi351JpkQhDcCS7M
         fnf4vfPJOEBuFdXEWhsdrZK3Sa8KMR39NyQ2WAuOY0Lp777ZO1SIxU0UsPEtKAMNkyz9
         Ss62OXuadQDi35nfuLxsN4Mcecriza9DaZkHLwaU9nRnGGnJYB+1oRirZONNmWm5zPlw
         MFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578755; x=1791183555;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6riuziqggSIQ5VIX9CrxjJeBcpTwr5JJlcJHLZ23opo=;
        b=n1cw+UK/eSdiBJizGcj4HkKFWh3NzdEvKEBhD1uhxKHKK7bc+IUDLOwAtvyP5uB1D/
         aMxghuHP05AouxmgPBkSvuY4s3ayrTb12qh9UWAEy7wrrhhOVLaMl74qd5OYx0gaFDOS
         KNpXzmdyqNSlUz1WJ8smilkCHdVJD50nd20KLvh9veOIzs29zrGfaTOakQo+9+VdC1Yi
         KlvJU0gDlKs0LV/VFGV9QjxN9nkJBiLjMrbaeR8AkKCeJ6f5hYDV4CftTBLHF6oHxSAc
         FgE02NodooyAu77yK7JQkFEABwul8U8aHkIYK1VL8mAdUZFFb29MHcjHjjA3H/Una+FX
         QNNA==
X-Forwarded-Encrypted: i=1; AKwUvBzLcsyDonrlCMlAFZr0QMEMeUOeMR5G4zZSXFNlx0Lu0KZWDnbmDm/tZsbX2jIovbGA2q/1/ZDJj6yqmO4=@vger.kernel.org
X-Gm-Message-State: AFuF++lE7ycm7/5EzPmorUDnQ7u9L+3w2xfIGuesYQDxUq59R1MeqRBi
	19Qsz5if2VMR53cOKNDots5sYW4y8bn22jFGOr9Y+Af0FveX9Aw0GG4hPoDShl906VAg8IWYTtT
	sUJ1+va7jKwPGr7Ugrii7nAV6YHPWMPycqeUan3oLc6L1EmcVQXjcvmqGSc4WTw0V1dc=
X-Gm-Gg: AYBFou2Z8u3+uXY4uUWPLnf9332BWZvNBpnw4QrCvtMkgxwEbxJ1Ke2v243AIU0LbxO
	h47HrS2avr9kzeLw5ZPPjbDtKs2qWt8G371QeP20py9EYwyerSbcqsBnIof+nuNs4y9WE56tFSY
	XA3d8R+zTaD90Bey5VMr8oCBX1c3YnbY3cOkqHy3p3OgaG6slGid+8cQRenyPM5WPzwFfOOtuPe
	eaUf5FbBlFOJ2vOzkdupi69i/UXzOgCamr8sIGGkFAljVV7Cq0gX64aMIJopoEMdgeJHKnjERIo
	T90v6PJQYb1iNpdxu1EuUNzvVNgBH4sy69BwHHzJmh1QWlnyuvkWAHr8Zfnqh0m9RqgY7ntb+I4
	YGh3O4pM3X3B6tzyO2u65DDgLXQ==
X-Received: by 2002:a05:6a00:4fd2:b0:882:157d:95c7 with SMTP id d2e1a72fcca58-882157da533mr3260917b3a.14.1790578754570;
        Sun, 27 Sep 2026 23:59:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd2:b0:882:157d:95c7 with SMTP id d2e1a72fcca58-882157da533mr3260890b3a.14.1790578754068;
        Sun, 27 Sep 2026 23:59:14 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-883218be96bsm1106706b3a.52.2026.09.27.23.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:59:13 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:28:45 +0530
Subject: [PATCH v4] drm/msm: default separate_gpu_kms to auto selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-separate_gpu_kms-v4-1-3f33175de133@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACQQumoC/3XOwQrCMAwG4FeRnq00aV2tJ99DRLou06Jzs9Wiy
 N7dTg8q6iXwB/4vubFIwVNk89GNBUo++vaQgxqPmNvaw4a4r3JmKLAQEgoeqbPBnmi96c7rXRO
 5UBW6WlUGCFmudYFqf3mQy1XOWx9Pbbg+LiQYtk8MUQ4YfWAJOHCaoQTSNRSz6aKNcXI8271rm
 2aSBxvMhC9Hgv5+KmF2SoHaWaNLU9MfR745UvxwZHaspKkqjTMK9A+n7/s7j+4jLUcBAAA=
X-Change-ID: 20260316-separate_gpu_kms-04d2cf4d91e2
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790578749; l=10135;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Qbu1ajf2zMMBmGHIiRKeFRx8ze0javq01HlVA1lp2Mc=;
 b=9eYVLlvU5vvz5oTTfbLCudBaNI1mc7M3jI39PZOEPJ0cVYtedY3jGoCe54N/1lmDeITPuVBHN
 TEboS2ZjU7hCnVUtm/DF4nK0ONHSutDwcH5P+pMknpWyUJVtLOtIp0y
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX8+YkiWbJk3L7
 TXnf0JFKGPBLE39CVaboOkQ5cjN6wR1UqHTkmEdiz9cqUL6mUyVww0Srv+TM4lJh3lCyksHu0RB
 zAZaVkwdxCK2Wmtlf65RgMjG4z/1+40x3uDktidzrfiYP0m8UzFOmz8Lo+pPO1l5GZ6Ay/lZTvN
 yuXQxI6rDrE88xPVEm7IFtrdusqvg7QKkFzqFtvNuXO2Uw2LK5N0ors+iUqLpfOJMD5gd9Xokpq
 zi+MFUA2mzl5y/Cp+gPj0K/jyrlnpWabwiqugT5tnSJSc8D543XoF+o+pW94mh/+oj9M33W1NrP
 s7mDZgO7gp/OwNdfOIZXJHHRHHUz/QyDC0u5mLejzknXvGKdsZAWOWdYsUefQ14PDjtbKT5BZ9T
 rp1l+sRxttpwm1p0cVQO0PWoWRD+s6qs18YEpPiddQaFQgfwntfk8Qc7I/e4KLZi+eR4u++E84+
 NeQfkEW72aFA/KIU0dw==
X-Proofpoint-ORIG-GUID: 2v3t-xrIah2Qcq6Lg1weYM845Cp_msV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfXymDQMErFSWSg
 leM5pYtEVYlqeLmbMtLbTryfn6qWjef8l6jrxWiKnS4rFD9OmkKQGZcso40WtqQCsCmqgBMuzYe
 ksTeFNq4HSn7FnkTY6gjZ9Ipzmk0t9A=
X-Proofpoint-GUID: 2v3t-xrIah2Qcq6Lg1weYM845Cp_msV5
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba1043 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_92pshTILgvs2gbH5AkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280027

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
Changes in v4:
- Fix OF node refcount leak in msm_separate_gpu_kms_components(). (sashiko-bot)
- Fix build errors when MDSS/MDP4 are disabled by adding stubs. (kernel test robot)
- Drop msm_count_mdp5(); MDP5 always sits under a qcom,mdss node, so it was
  counted twice.
- adreno_probe(): don't create a standalone GPU device for an unrecognized
  GPU.
- Link to v3: https://lore.kernel.org/r/20260330-separate_gpu_kms-v3-1-a3e54b9c9417@oss.qualcomm.com

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
 drivers/gpu/drm/msm/adreno/adreno_device.c |  6 ++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   | 14 +++++++
 drivers/gpu/drm/msm/msm_drv.c              | 65 ++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h              |  6 ++-
 drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++
 5 files changed, 95 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 05c77fe27e62..7108d4aa59b5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -271,8 +271,10 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
-	    msm_gpu_no_components())
+	struct device_node *node = pdev->dev.of_node;
+
+	if (of_device_is_compatible(node, "amd,imageon") ||
+	    (msm_separate_gpu_kms_components() && adreno_has_gpu(node)))
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9b1d1982e683..c299fef1a400 100644
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
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f3d2eaa04f14..2ac7fcd468d3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,16 +54,65 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
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
 {
-	return separate_gpu_kms;
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
+	int display_subsystems = msm_count_mdss() + msm_count_mdp4();
+
+	if (gpus <= 0 || display_subsystems <= 0)
+		return false;
+
+	/* Single card if there is exactly one GPU and one display subsystem */
+	return gpus > 1 || display_subsystems > 1;
+}
+
+bool msm_separate_gpu_kms_components(void)
+{
+	if (msm_count_gpus() == 0)
+		return true;
+
+	switch (separate_gpu_kms) {
+	case 0:
+		return false;
+	case 1:
+		return true;
+	default:
+		return msm_separate_gpu_kms_auto();
+	}
 }
 
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
@@ -1029,7 +1078,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np) && adreno_has_gpu(np))
+	if (msm_gpu_node_present(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
@@ -1040,7 +1089,7 @@ static int add_gpu_components(struct device *dev,
 static int msm_drm_bind(struct device *dev)
 {
 	return msm_drm_init(dev,
-			    msm_gpu_no_components() ?
+			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
 				    &msm_driver,
 			    NULL);
@@ -1079,7 +1128,7 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_gpu_no_components()) {
+	if (!msm_separate_gpu_kms_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index eb4bbae8557b..2840e8a5052d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -394,9 +394,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 #ifdef CONFIG_DRM_MSM_MDP4
 void msm_mdp4_register(void);
 void msm_mdp4_unregister(void);
+int msm_count_mdp4(void);
 #else
 static inline void msm_mdp4_register(void) {}
 static inline void msm_mdp4_unregister(void) {}
+static inline int msm_count_mdp4(void) { return 0; }
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP5
@@ -418,9 +420,11 @@ static inline void msm_dpu_unregister(void) {}
 #ifdef CONFIG_DRM_MSM_MDSS
 void msm_mdss_register(void);
 void msm_mdss_unregister(void);
+int msm_count_mdss(void);
 #else
 static inline void msm_mdss_register(void) {}
 static inline void msm_mdss_unregister(void) {}
+static inline int msm_count_mdss(void) { return 0; }
 #endif
 
 #ifdef CONFIG_DEBUG_FS
@@ -534,6 +538,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
-bool msm_gpu_no_components(void);
+bool msm_separate_gpu_kms_components(void);
 
 #endif /* __MSM_DRV_H__ */
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..e69b122f2687 100644
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
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260316-separate_gpu_kms-04d2cf4d91e2

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


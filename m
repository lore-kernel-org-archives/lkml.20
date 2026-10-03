Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03662E736F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987248; cv=none; b=NBZaqqoZJRuqTkTmoz3oFnnIXGiqqlrCnQLIX5eo5+nEi7SRZ48XI7dznRkEzUDeN+RsbBb0Etv0RTYV/ioFuyzSrJ8JLX9L+xQhdJVACHlfoX2O639VUhDQ7kxIEI+NVKaLDuQY/TCxSfkJNWLOJNT8G0VNitaFWxauS3oiGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987248; c=relaxed/simple;
	bh=2c1I87gys9JdEQITwLEUGMJIO/TOjP0g3COX8QyNL4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgvVIJ8KzPbLxJsRdbE0eL6/DkjYBzJX6/7We3qqwNjJmZSHa/6XytmfxGKbtVQq4uA7ZfHZPj/ZB8/dK/+cH+tdsxA5tSKK7JSBvuV1kvbl88jzmIHXpQqj5q8v8x0hiHmW148FRaRK2WwmbeFQu+UgSbPPiE7gJ08fqMYC/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxBi3rem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Flw9/hRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxBi3rem";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Flw9/hRr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2q52104689
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkXrHRCfuN0GmbBK9rLrKsbGsgnfDbEVKr112JlZi40=; b=HxBi3remvD6d+azP
	9KExQ8eUm3liwiKjVc0zLaYddcm0VngMWzFZiHAS7E0wgeKrdXUo1B+2I9uvKt7O
	tfJnzQg0PK2Q8UvRnVI0iqlq6bDbvmj3bvNykIflkzmMsNxxstCIc2C9yACfykf+
	3ixmzlA8DIstr6oITLmnHzmH7j9qnODHL5TY5KfopYIqBSWaUzAJlh3qcp8JD8dQ
	J81xfyDdNp0g5jKunnYGoE56v5Ijf+ymDpf2hjEgbnNRkVinXFQcHyeN7gXdVYQL
	FS3PxVthheXq2JRQwZz2Z1Fo+jitikLopZobZtZA9qYFgyLewAFE5pFnV1437El7
	MYrICw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdjbt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so19997285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987245; x=1791592045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkXrHRCfuN0GmbBK9rLrKsbGsgnfDbEVKr112JlZi40=;
        b=Flw9/hRrrdsXmy/ZBJQyoeKrq098RR2svVsYWRyO+eMhTI3FIo1NDx4giRTe3JI1Yv
         OEs+kDedu/sCbGVa1elMkiEkwLOxBBBB3+4WtHB0omhWzjCNhZ9dyHEDcf/XP0DzpyIp
         WF4mLEtt0danD9lHCAoVu9dHutLHRwu7hPS0mFnitdjiJeJdWotL//AbCeFhvb1LvdLC
         ffH3U5BLYPZuRr0JuYhvAaXxQZYbMYLKTvw0OumDfUl8pC/KkfnS2O7hnD0osX0kEzIw
         5CD7WfdYraNV5Dng6bFaP/CAsamthN9JKHW8gM1/9LwJ3pkHL9eda4SDSOTxCPzvnwrQ
         MnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987245; x=1791592045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkXrHRCfuN0GmbBK9rLrKsbGsgnfDbEVKr112JlZi40=;
        b=tF1l49i0kOAwKuGV0sHuoKaJZE390nA5iFTXWQ2UUhB2BmRsj266rEcUH2mVBeZHGH
         v1hP5TazvSEWnd5PJLKS815E5aVFo0qIFhGK6LCrhMf87tND8WTZkpXxh0QmatOHEe4E
         nGFO/fgFN0VlHDRcUOeRmcIVaXIx92M5sNDbs6ILDLo8e9UYftA7H7dMcqugIPl0fbi+
         +o92QjxbUsAgpysv53PfvTjYzni9eGFQiezvMeaIrF6oSANcIoXdiFbYIULhHJYVkQM4
         BGJoLvPJx7X4i3EkONJhrKxKU0XD57Klp8IESYOfWKgfc/p9sIyrl6zmFeTnA2Q6NWF3
         56Fw==
X-Forwarded-Encrypted: i=1; AKwUvBy8+EQHb3KwHfpuZinP5sNQK0HVsHoN/0x+iKPqK1cDLX7tGJj31NKt1HV8EvHAmPlCxXcb/9n3JpTM/6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mOWIOnRRQXyQXPY2AKC6/6cIRoQuYZw0AQ19l3n26NveKcppPA
	/5NUFCE8FUZ04/RfCnX0fIFvTNUvUHFbXo8eOxdAdhl2SoHSYcZebBXeqcOutwckWSRbAMYYd4a
	MkO9fWu8YzJpyBkP5BcuDnkD6IYCY4922R2njTQzpnUYzDdjgqHUheWFHpMvo2hF1EVY=
X-Gm-Gg: AYBFou168PB8WJjGbpOfbk0pnYLvkCTK1tx7jfN8JuvMceoTlfgRS23/c9e61JFQLEG
	zVC6oIj9kdKQb5LeHTDnbiJCl4YRQ4u+6kUkxm9UkjRhQ//MkzJi4NqOLeqLZgJlo8hxUIkPqCS
	Bu808RjfNZcHVXN0Yp8zkz3zOVf48R8MPyQpgo6z+Ay8hBJtigrld15uHy2Mon5O2wgl/OowWI5
	PCGb6OWzUuvUY7FuiZ/sjJ8cL5iHYJEmyXbWk0YGYzxN8ApRWYSR91mMFCWhL5p+nA4l9l1hRa9
	b4fEeSgJqPCOzRAWA6oJRHQl6ey9p/8r4Nxj5WiN5U7g5aRMWAgdZKDiRT7tnWFV8edDdNAwUfS
	blYXJ3pY2AmIxD9qiOn9GHOu2C8fNckIc+3symphTPdS1GaWdyQVPfRNNCN78hrKczL59GHZGHb
	8+5i2J3BuWpRis
X-Received: by 2002:a05:620a:4413:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93e510fc7admr192193985a.66.1790987244798;
        Fri, 02 Oct 2026 17:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-93e510fc7admr192190585a.66.1790987244284;
        Fri, 02 Oct 2026 17:27:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:14 +0300
Subject: [PATCH 06/11] drm/msm/mdp4: unwind a failed mdp4_kms_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-6-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5689;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2c1I87gys9JdEQITwLEUGMJIO/TOjP0g3COX8QyNL4s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9YB7wfTDj7kTz9zrjOwfmPI/7pmYZtE+XmeQnXLg29s2
 CnFsGhvJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm0hnG/k+31kffg9v1VHfi
 McuFsv/XhJw1eP+CRf3LkX5z44dMRde1iz3r9+58oRh3zaQlL9fpsDhH3YPoWaWf6r56fzBNu1/
 guXS5yb+96Vd/m3xO83FtM5SwOFPVeifXeGvrTvntixiNgmRYE3pnuDOIdfEmBknonHiwOrMpxk
 NYPc9Io05/UbCgnPe5/BOHjV0eBl95cOjjB8mg1Yb9y8Klr1Zo75Vbv5b7MuOd5ZyeH7WyNKoi7
 FbEP3M+zpp01k5r63SRzxo7ZfMLs6wn8d0VZVkTWbbubsBT71frJwrJ8+36dLGkYV7AT2+GyJ2K
 ujdyNup9ZZgv83Zmq52BkPlt2+tRTPKmz08J9FQFqc8BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX21orsgN+2gQz
 50GIOa3D7JDDHNrB73t2kw5wQLt2FV1MsN5IMDjPjqJp0Rbiev0sBCAauQI8ZUA3s7BT1xam3Cw
 l+SqAsf10ILkFx3fp/QP6svm32FoOQ0=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6ac04bed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BMCvYaVn67BVldJv-G1VWTgDlMtnW49S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX9z1+MgWo6lXd
 CJwdm38W5I1R8m0lMIRSw8VzuVE3p3x7DEdpTZ/cEJGLEJgoyzoM1wNK/uMXjhtrsJGvVFMppvW
 dyqV29soWAu05BM4EyM3vUb1GzMlaeGcl6+ggVEaStUe57XDfWTgb7LASkR7iRAWgZVqhmh8fwY
 /WO4hLC+5/yO9Dc4xS8yEPVGjRk6xbXRijaPrAhXoGv2GcTWcKhUNegnhhSTzMiWGuPJg57+wwE
 I/ulvlPRMwdcu9tYy+Owf+Yz/3p7wDBL9BSTlA2BR2Z6vx+SBv8QkYfGbvPogRxjxoAmy6ika/9
 hITbrkhyclJqtjZCwevE/99wTdXP4tCWDQkm0AgMCv1qvT850+k5W2Vr238olPMjYLiQ76rc6pu
 6XRqmtz8b113yhzYCmh/ZCB3YZ5BJnSbLsZD1APKaOTe+NpVDomNUECioMBrgy6NvhqdhoEhK5v
 V3N0oaBZ/NPrGIyHskA==
X-Proofpoint-GUID: BMCvYaVn67BVldJv-G1VWTgDlMtnW49S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

mdp4_kms_init() returns straight away when one of its steps fails and
lets the ->destroy() callback, which the caller runs afterwards, clean
up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
after mdp_kms_init() has succeeded, so a failure there turns into a NULL
pointer dereference. It also leaves the vdd regulator enabled.

Set mdp4_kms->dev before anything can fail, undo the steps which have
completed, in the reverse order, and tell the caller not to run
->destroy() after a failed init. Fold the hardware setup, which can't
fail, into mdp4_kms_init().

Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 56 ++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9b1d1982e683..8e51305f8dde 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -15,9 +15,8 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -70,8 +69,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -118,6 +115,14 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+static void mdp4_destroy_vm(struct msm_kms *kms)
+{
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -127,12 +132,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
-
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+	mdp4_destroy_vm(kms);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
@@ -142,7 +142,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -395,6 +394,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
+	priv->kms->init_unwinds = true;
+	mdp4_kms->dev = dev;
+
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
@@ -403,13 +405,11 @@ static int mdp4_kms_init(struct drm_device *dev)
 
 	kms = priv->kms;
 
-	mdp4_kms->dev = dev;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
+			goto err_kms_destroy;
 		}
 	}
 
@@ -421,7 +421,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -430,7 +430,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -452,7 +452,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -460,7 +460,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -468,14 +468,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		return ret;
+		goto err_put_cursor;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -483,7 +483,23 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
+	mdp4_hw_init(mdp4_kms);
+
 	return 0;
+
+err_put_cursor:
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
+err_destroy_vm:
+	mdp4_destroy_vm(kms);
+err_disable_rpm:
+	pm_runtime_disable(dev->dev);
+err_disable_vdd:
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp4_kms->base);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.47.3


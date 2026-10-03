Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E42DAFDE
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987246; cv=none; b=nJxERT4YOR2znKLK7UCoFPivyRHDNyfi8iOxf5QCS6SbriQwra1WxE8axyu4r2Gp0FOBdpjrd+uf8SfXyrbiTG1jytXOdPqGYT5hT3BjS0OmF55XUJFf0JDi/BL4hv3UbbbUKUQ+Ron5Aj0vt3KAw4APuMMuwAhjCN93AyYTDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987246; c=relaxed/simple;
	bh=IFWL5o3N81bntEjvnmwlorbJQICmB+ZJO+BqKeM8HXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VW4bnnJ5NwJjgmJPC3sZK8J/ol+QiMkDGNI6li0T5po0kKI4/CogHTi5GEqOMySyduBdcnUmiRm70xjyabBeIM9T6uqHgVThsuOWGkoy5/Rt/W6cRDJcU0XkSzJScBeyZtTfloc2qNe93p+RSl83uh7bLDV+KIg+4/y9XN1/mPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVQUptdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWt6uyHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVQUptdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWt6uyHb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne05K3883843
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=; b=BVQUptdVQjnSpGR3
	+kUWU5nihTeH6yXI322fiqgxqEwMsf3LrkMVBe3X15uZ++/A+/s3ma8TMgjSTtl+
	OnZ+zAuiYtU2JjuQfKCStkYzrREt6UzPblMQwG6IgaCr0d7FoZ66z5bklZdwj5ba
	CfNwl25hDiu3A/V0dxcyrjfHkj/jSvHcpj/Yq32jl0BWFtfhqjZqmzpvo3D6RM3o
	3LBG/s+g44iYH0nH/y8xZZaQ04vXC80jd7egf7iL2FmJyky1UKh7HpAr1ZnTHGEV
	vmJE7jog2njRuWCDmXgOiZausoVEHriAI+gtm2Su9aqKCt51J0NOwjO+sXurUVMn
	Osne0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp40jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so19995685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987243; x=1791592043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=;
        b=DWt6uyHbG25vZ+ne5jZZOxrJxn7zdVb7iRmL6bKQL4X/B65S5+3fHhZ3sSSKWiyQ6O
         canYTQnmh1JwTjABavV3QeXvqG8Iaqoa4aV+wxwLwVYZh8FFCFGzTTHFPNSVstjNe4CZ
         JyGmPw4DoP2eD7Y3mPa8RBcgB7acfKg9yTBzFxmXblfNF8Tqw9H3jGK78mRLWiKJ3loT
         mbE3KeTzOufEIfV7KtJHvUupVC4MJa2Hb3mm5msOHrrcix6DprE/mWY7+q1UubOBtkZ9
         370Q/XC3FFA7J2fEKpghaUJxxCGTAiqdGxsOrY22iKgp9oEYJD8C75wFjE81edgu6yGR
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987243; x=1791592043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=;
        b=hRxwD2l+wJQi6tujwNrPhuoOqsPD+1MBNw0+BS25kAvi7UbSpoIQWbn2Q7yOU9isgO
         PBabEA7gnXuS2R1IcMxKLBZnG4GyArCugormFqdDVNemf+BNXFR9bFSa/molzqNmbwet
         YEW2Pkh7WfH7ECscLJIGg9xaBwmLmyJFcugU10qRrlRzjXbDIqXWmXOW2q7DyJ07pvHh
         GiNQ91aBCbenDDOT0gZP/Oj2njr2cGEGYLccXX131rwNYiHfNDafrmV5oXz1GxqoATzS
         oNd3tzVKCeQmaf2Tsb/5WaVhG/uSdwRgz+kzEoodafViuj0jwPdOXpdL/22FpSZAvUQK
         P+zA==
X-Forwarded-Encrypted: i=1; AKwUvBwMnFyYpEoTprcjM1jSUx92SA/BlHVkfYJQTx0ga40aVN3OP4ju1REpBSkGClAbkiHY+CgdBc93q0o2Lsk=@vger.kernel.org
X-Gm-Message-State: AFuF++li5GolVeZUg+lu7yQjdEJez+D+YRRmxhjrgr0nrf0HHJfiJqK4
	sgihCget8rDp7e1uhxNGTXDDP50ipf+hrX1d+06z2dhOqtfaiy1rpdNgEWz6hvQjx8oUAJaRyM8
	4pPCt1Ve5cEjQ9TswoChfzaOyOZItcmfgdfylLpUkmub7UH6GW7IOoFa7Jt5C9pxDz9s=
X-Gm-Gg: AYBFou0jmf/yN5juwPZU6iBYCUeYpvuZoBb794XIlEKJ7FdorsfR5IEq/D9q3AkwK3L
	UcDYUgAech+CP7fYg0DthKBqYBLkaqSjj3k2DP1WTsgnwf/xK3T1BUXt+qWPfNS6BVNN0p2/lUO
	QZMZqttrk/4YsmmEuwRzjFK5UK/GMY9dlBtgexhHtxGzat6cHNkbiQMECPXngP16LY0dvISSSuL
	a3X3olojlltlVH0+rWDNs0mWw9ZYtvswUFGWnx+UJQTzXHteXJ59BFGI/wAlG5IWMkyJuQJX+gB
	4kYejGa7iipchOzriP7uWgY3oxnu96lTMxUZoHTXra1b8PvB5Vn5KHkb5/5ztbtO1OiRfLKT+ll
	2yQGcP0Yie4Nsr9CqiuWVN3MJqci6LKQEBQZCKZR1C4nCTM/1hZS5Rl6jm90n91t8DRQ645IzN1
	dLmLP0RWi5vaTI
X-Received: by 2002:a05:620a:8905:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93e50ff4d21mr192193985a.25.1790987243368;
        Fri, 02 Oct 2026 17:27:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8905:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93e50ff4d21mr192191085a.25.1790987242879;
        Fri, 02 Oct 2026 17:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:13 +0300
Subject: [PATCH 05/11] drm/msm/mdp5: unwind a failed mdp5_kms_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-5-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4294;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IFWL5o3N81bntEjvnmwlorbJQICmB+ZJO+BqKeM8HXE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvgaymGG3Y9A8ghiW2JNHulGYyoIHagrR+OF
 sq+UkPHsN2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1U6wB/49mib2gRdKTNw8FYBBcTErHEA21B68qChnh22n3nTSotEFsaD00sQDaEQ4lj7Ua8lNB61
 QKsaX1eZxLjHolz+2xylPjO90iq9/j1RqypyxOxGtya2duz3CYZ8sF6XfucOwKKnXcJ8azX0Uib
 3sBv+RvTnUkayX3Y+0OXt+r1BuiK9hPEDIP3RN+PAILIUfO227bQDLnx9AN0j5zhZO8dGXyjDF0
 r2lau3v7+l9ItKAf+Y8PjKOjt9yvy7kpFLG7sFANGhxyZtZaN+rM8ikUYUg/pqxy+fQbcr3OE1X
 naUZUd/5+G5/XhDcmS6wrgOja/79nR7AbSGhrJWzomMj5SR2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04bec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: DfQPPpSRG-b35Ufg3TrAo5RdIyWTZJed
X-Proofpoint-ORIG-GUID: DfQPPpSRG-b35Ufg3TrAo5RdIyWTZJed
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXxAvNr7fl+r8f
 w0/32SCwOCVqLlpR3DGHSYifnAZpj7zf/s6ftuEUM/n9yIwOOFW1Vuinr/l27O4oZklW26NB31C
 dSjSS05XhsMrZyjw9RMNIy4JbdWT80o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXzP3G4cFFWp1d
 InGjN5dhFjAGFWuwF7EnEcbFWpZkjNp8UAjIYqOdkumoyu7qQ6lhiZn7Hjc+r1k+0UQA0FsLMti
 3vhheX+69VgSr+ozGVjM8UNcS589aofAyLkMUE8xSqqovS3sct+JZITABBd2C7yQyQpLTGGztNu
 WxyZLfcFDJ1RcjoSZ5pZY+CgWuQMIINLLliHKaauWLVF8A9WtYoHb3TeYfrF/XpkOlifjKcmj0B
 oSjz6CEY48NiM5nalLoKfPXck07yrUIvIorSqG4HMqXWQfAXHqrxKrMjxz1h57fwykd51tsLowl
 zZsx8OwA93lj43fhUD1/SIMSgKPQA8uI6ivE5wWeWx0IIh6UIy3KdheiNAy06UDVOrKb4rpR96X
 CYoJhSfCA8r7M/xF3TOPq/Hm/KqmLpTVXJlWbb/EDboAMRkRnIT1PlqUh6TGbdWUXM804Qg+d8z
 htZ2iTTAZGhSMV4i+WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 44 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..8fc8cdcf7d8c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,25 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +504,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +517,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +538,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +560,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3


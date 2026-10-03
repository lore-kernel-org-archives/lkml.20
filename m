Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1EC2EEE89
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987249; cv=none; b=VwO9AuyBN/N8a9vLCoaL5KrVLNODulvwNFIBcaa/5UJccps/ySdn37c+BRbUNuKad9JiEP51zKT4b9Pf7aJRDhkErf/FgIzPPWTxayy82COUBM8m52jFyvM4RzPtJ3pm2aH5WaGF9fq0OcPK1wUF3RIEHxVus4mfKz1PPjdzS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987249; c=relaxed/simple;
	bh=2tPDXcEAQdfx+uOZ+i3gT4JR+STW+/Lz2xQF5BcD1Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ox+/cFE/6geSPkUPDULstlMn0ZnKycHcmMzCMof9OaHBfvwGB4esArz2RmROeHUgt0gHxziBYuL5BGqeLt0DDld9kBJ/yOdIsc5H57r3qaHLrU4c5+FRmeA/i9aR4C54sRlS+NNc2sts++O+WGf/vfGHDk2NMGnkIrTlkviwu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kyus3qMF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2TrBqCK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kyus3qMF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2TrBqCK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne3213884021
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=; b=Kyus3qMFcahMVSeX
	KqW6ZsFtVlBqDpuOoTY/IgeqI8L9K+TCqFMM3ecWRbWa7IJK8rYIH0TGBcUumyDT
	hc6n9lSbJ3Hq0lWu6oMLHCHOW+BuuJKtwBh3Q5NAn9MkPjTcwWQNTsB17KLY+cev
	uPNgZB8T8Yp5+ckfnOKXcWY5frChp58NRwOgbf8VltrCrvchKunPlasgDNoX6L+8
	/X6kuIF9DSlchH7Sluz4rQnne5BTOHzxtC4ydftbnrX9BbBPyyImBPWlg3815KmR
	LT48NTRPwofrF9gHnIV6g18lf1wzoYxYKOc5rraxqMbstTgM9f2CDHrV5VDBPOgw
	fsJ/fQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp40k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso411065585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987246; x=1791592046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=V2TrBqCKHiXlQ+bq5ZaAjWxZaOhUnyk4hPD1oRf56Zi8CJRz2ru24Hy1BrtXZAlLNZ
         Nv2Mim+tahDAFPDeg7fkj4pZLxRgxY+1b6cj2yzvq59CGLvNd+dqAJMI9CyGjH3Z6n8+
         ZvhWdmI1kiR8vhc2pkvJ5DOa8JFHpax0artFddt5CDEivUJffbr50R0G0v0/KYStFk+w
         zdCK7umBriKoImtT2NHSZ66DMMcAsqwzkQh+5XoI7ZRHmHMSRux0uTIRwIqNE69MYYAw
         TLPCySt7tAQqW2j+6UrjpzfnmTvxSA6oqKRlMWbnwd8cyLv2stxaPrkRtkoCJoN0dBEa
         iL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987246; x=1791592046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=CM7SoPTDz8wihZCZiLdwSWD4sBWPTHyyd1B/07BSmw+PflLGOOfiEosFvuJh0Od+CR
         umSG8D/G49DqZNMfAzo0dYlztenYbrpZHtthiVDUBemePZAThON7yL2TB8C/ezCzTcRh
         tCpdtW4PS3mzS/K1zmQwvuejo1Wd7cRfi6KBJSAbp109pI0vcaqilGiqllsiCPSfkMcW
         f5ZfYsBPHfik3P5F0RU3bT1zlX9EJVsRIO48JhbCzJGxJ3KUyCtsfg4+9JfUmtbWlGWS
         t/RzQDgc1G60scpWpydphOo4xHZmlBMDQWYRvloXKQB0N9s94hPok3U7RB4yvAHe347D
         l7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBycjYBvr/cy9FXg0kZqhBb/W5Ux55PO5e5P07XSMldxZxX2Tzyd82X2xY0jXlj/Wl4H4JwxWkB6CguikRg=@vger.kernel.org
X-Gm-Message-State: AFuF++mMWx2579cUkcLnxZTFdKh/fKOWuoSfQ9E8AZTXVCyWuDrVmbin
	uizAjm1RzY0vVv6coFZuEoEAWw2QB5jYac0eoI/B199lcfMghxWUZ+jOYtF869AbKmv5L8Qu2hy
	im3uUrSP27iMoxR9oeE6hz/+b4oYe8ODM7hp0JPVATpjOnYqS6Dv4NIQ2seWaqQezIHo=
X-Gm-Gg: AYBFou35fMJuZ9qto5JXLggLizmu+NEI9JoCkxTII0jfgsbixrch+XjceBj9kh92JB6
	KYe4n9zWY5Yc6b0df7rEqPpsTE63yKT6icDYSurTZNWF4rrfz0tRGi7ll+8AH9Vki/f/TyieODi
	S+bEwx5/E0CZgdmQ6UfOZgVOpDCSrfhs/d5OPhDX47sNr4hp6wWQtujSwmipc8ORX2BmLUd4CZg
	2TVI/67DxHstMUKhpzrcpLV+MPVO2TpTAaYd+gJuYk9nHJlmWgv5/9BBa++BeZYDE0kMBnRuXqP
	YKRk9Y5824n7/Td00EFlspQIoMo2gu/JuuI9o6HWdESJjt17KUw62Uw4pGRDoWnNG2dsZ88ZyhR
	3hwrYE1256nvtVxy22KrerHJs62k+2f+nQ7R0nI+Y70enJ91GrEOz6nsopyoW7LP0fL1d4N0ulp
	1I58kAe09+ACGg
X-Received: by 2002:a05:620a:608a:b0:93e:5677:317b with SMTP id af79cd13be357-93e567733bcmr15682385a.25.1790987246118;
        Fri, 02 Oct 2026 17:27:26 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93e:5677:317b with SMTP id af79cd13be357-93e567733bcmr15679485a.25.1790987245608;
        Fri, 02 Oct 2026 17:27:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:15 +0300
Subject: [PATCH 07/11] drm/msm/dpu: don't tear down a failed hw_init twice
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-7-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2tPDXcEAQdfx+uOZ+i3gT4JR+STW+/Lz2xQF5BcD1Wc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvgSdkNKxXHXbSoa/NL1JPr49rBP8XNZ9FD4
 25UqCiD/UaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1camB/4zQUisPg+F5H1bh8WYaQluZmeN4KhaKE8VbAkauyTNg73e5C1D6l4JHp8eGElqBuOX/uz
 mdCHSy0Y1EcmXD+rB5DQGKez4noUSsHuVzQXCeRhSLWvcP/c3WrFHDxsLBubOYnRu3dwEm53hj0
 bxp1KT7QPs0K8K9lJQXY5cyX9vFA3brKCqxM40QGbX0kNyYjnHqfW66lyss4l3R7WSj6oqPJYZa
 30Ky9LVvfNbIwqXH/OXdGt7AGktN+5kmuQ/0an0PjLEPvhhP5RFdRArx7x3WLo1ZFYcSA61hYyS
 FPqLzAHdLFi8VLc4S+10NV+3mZfa0gnxvR6rcKroOKdTJahf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04bef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VuwbfrIzBJgoMi6EY_8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AX9UlMEjrsOn2Cg3-6S5wKW60y314WbR
X-Proofpoint-ORIG-GUID: AX9UlMEjrsOn2Cg3-6S5wKW60y314WbR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX33p+oVXnhPq4
 H/WDsKDqBeRGlrQYs1cBaTkQAXWs8pWKKzY1AIA7mO7A1Yq1uSCRiOs8pQiPiyitKWepq6OQa+3
 QP1qUY9vTJycEeFKCphm7gcitMJfBIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwKi/MTox+sVu
 ca1sPdu3TjnPwTracGtVgwryeCE9jqz0r5Jt/Rb87asKtIZSmFR4JB2dFDWt9Yz/AZBnOhsmciv
 r2FgO2nKlFv2xK7nRz/PCsn4z4MCfcr4ZgLCGBWnnWgioEqmHoxy/PV4M/5LoQeWLFotjGBb8o0
 4C3VuKnD6BPZ3twljhvuFWLFJQUcLYvlP8h5asgK7QsWKS5GeEzns8o6wYB8DcpAfVRguFAYIo/
 F1qRmSBoD2H39+WLceC7bCj2zvlWiI1ioo2t4MpYzGafhRNmpTwPrXvIBzxkTJzSCtNC7O9RV6g
 YE1nuXYKvA5aLabzPspafJXwfV3/3pzUR6NYp7HiAfXobau0+klOfXRuQE6EJRBde4u//hOhoLs
 /RbkjatlscA3nVRI7KaBCEKc824D4JPeJwVjKptCszS2iBDE3WAk43qnMvgwihw1VNiMHGveB0W
 LR7RgCqWO3Xra86KzFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
the caller then runs the ->destroy() callback, which calls
_dpu_kms_hw_destroy() a second time. Since the global state object is
finalised there, the second call deletes its list entry again and frees
its state twice.

Fold the hardware setup into dpu_kms_init(), undo the steps of
dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
after a failed init.

Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..255beb83fc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -55,7 +55,6 @@
 bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
-static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
 #ifdef CONFIG_DEBUG_FS
@@ -1067,7 +1066,6 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 }
 
 static const struct msm_kms_funcs kms_funcs = {
-	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_core_irq_preinstall,
 	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_core_irq_uninstall,
@@ -1135,21 +1133,12 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int rc = -EINVAL;
+	struct drm_device *dev = dpu_kms->dev;
 	unsigned long max_core_clk_rate;
 	u32 core_rev;
-
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
-		return rc;
-	}
-
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	int rc;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
@@ -1301,6 +1290,8 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
+	dpu_kms->base.init_unwinds = true;
+
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1317,7 +1308,17 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
+	ret = dpu_kms_hw_init(dpu_kms);
+	if (ret)
+		goto err_disable_rpm;
+
 	return 0;
+
+err_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
+	msm_kms_destroy(&dpu_kms->base);
+
+	return ret;
 }
 
 static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)

-- 
2.47.3


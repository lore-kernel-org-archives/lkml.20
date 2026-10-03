Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014E3019C8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987252; cv=none; b=u3LV1gvc8EmhxTIgwFxko+WIIUI/y3cJOq621fSpMIqTSiyKlfaaKCjt/cq1wwR+iEvcRwMQ+T3haL62n4s4YcjgEmfBoHmR+6PjnQQQPBBVL8YEw5R/3Bi71vROD+crWcxOCNhW8lhbz5ERJ0e63clj6Qt/WY/yacwnc05rukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987252; c=relaxed/simple;
	bh=bbO86FGXsDHqLs/ciqm/qxFg1OxXE+ZgD1o0bUcmsp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hojYUPAw4aJqXgbTuXekxHWDRGFPAbd/+Bzn3bt8crU443UcEG5QtWGpfzH2EN3AnMBJJxjAWg/zsA3Fehik2/9DS5H6uyR8n1dT5tQN5DrrUBbJKNTxA7YCi698cFjVb+J7g8iWZbZQncQmMQTd7guHvbzAnokTeR0hrk4X+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx7y3EAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANzNV3bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx7y3EAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANzNV3bi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeJul2309717
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=; b=Tx7y3EASDrt3gPCc
	GHH9TuXktZyBjtPgE6mMKExFR+ZJRIlXuYwUe/3E5NbBZjV+eBJrfiLgkcLomloE
	JiN83vQkGuUXmqn1QaJSF2d29ilkZOzJfPIR+OTsMqVghmFaUfc6E7jPD8mBz/BU
	R/k4sW3vb0wCdpwWAWnNx66gYKAKPE98VDqUJBIzbtzT67kkR0CMMi7zIBtB5o9P
	ywaYekL4I32IEMFUI4KGOM8tyxFf+Ej9sdeuJVPxEgdQT8Vddk4nk1z7JL+X/VZC
	3pSdm4M12iCctvdq2mrWOwWA5S3WOKGoRKwMsdPY3E9zqUKtomMv43R4yLqm8naL
	apuYyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da2c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso30576385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987249; x=1791592049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=;
        b=ANzNV3bi1YVA46m8LHbPFzmCG4jHNY0WYXs4ukZs+ITndCh4wqezPZY2hxR8jAnUmQ
         giVZxgKO+mQCTtfatYcJHFqbc4mLY3Nb5R5SxXw8k36cDWZ6FW9HE0fOp1Go+XI9rXbS
         FxD3oLxkNwJnN49cgEnKM4PssKJEFPqWiXdXvEeZrGdpdo6bpQ54P54PizSkSB9mUBgJ
         96ymkLw1C5sTIy8MT8VrLva2oLJDxM8RlIqP9Uvz3rnR3eXUSF+SvfHfkHouNrTDtsIn
         5+cfxNBNi0dvJQipWs4v+bWJbqqX68G8X4Yfrkd3AYRVA0FOnGcECZxl1JIPzBnlWAhZ
         ia4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987249; x=1791592049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCKckv3D3qYeE7jBJ3PaA+r53Z6LWd0Zt+icCTw5pD8=;
        b=fMfhUwSODCaw/cXc+PPypOxUSJCWe9FNCS2r5TthxBxVAkM6A1ElM4nD1x1mbPG3Ee
         LpUaS66GElBCZS5qvG9/cGJlF7gUhEZry6vMbgAXUKVVHTvbS8IJ+bKqosnR2QBJ5E6y
         Yw3d84SVzCZh8ak82gPekujWDO6x/hjFeqnya1w0lOz8ly+x6DXUf1lpP5Jfs11tvwHN
         14wi2RgKw4QlqiKkfARjoloWTO9wxBeeZPpe7HVBKxuxHR8N89GqDFXkhANb4JLmHtso
         aZQjPl/3GBDMSw54B1wpoGFUkT9+apXDG92MmLIooLt9xEmwwP5X1YDXziEXeAzqt2Qg
         Xnhw==
X-Forwarded-Encrypted: i=1; AKwUvBz/x4G4uWsbty32J7WA8dVlwCk5D+nJ3CFWOP2BZrzP8u+xGPn1b2s5InTwTUftAZCcQmbd7qy0BkRDyUw=@vger.kernel.org
X-Gm-Message-State: AFuF++k6dws93UvSzX+Zhw3G9kvpEjN3gj9tGJkCXEMO3Nv4iVtf3HSC
	mf9kdzfl0zexddKWn2w8m1B4IZT4JcMghHq9GjSJDzpizXLcF11cdhUxLAa2jMoPd3fCGQwvLSE
	hmt61Wt4Rh0edzcBN14prGRk5COLnGiqjTjKwAoHTUf93IZ+cDNy0mMSO4xoMhd+lAZg=
X-Gm-Gg: AYBFou1PooY5UXmcFizTg/FoZUa1vxk1e7pXtfxfH1xgsYBzplj0Ler/q1hAt7zwSHP
	4ojWKJEwPq6cAoboLGq/eCfIXWvdDOwrDskf7DHt9X9RuY0fyuJGX0PXgJkjLartIl8QCZx5HbY
	wswETqcLNlrAhATLl0nfpE1TqilNhcvhYYjYJezVMgrUaSbN4Jb9qa9bQqrmZrHdYOrUD4zR5Kh
	VP7z1RyQi+wLTotfWSf3YKIerjPpm2fHyWk2kZbn/aa6QdCSMPA4nSt6vHJplbnJfdRQNEkx7uD
	A38nNhADU7sf0bGeNV95rYVyFq7tyu7uNzMKJEVDZsOlbCZ40KMXlNVWGBKblO6A4bFFM7g0RZC
	9uJP4Hu7LxE8GDA6wI6JvOtOftnDjwfB91yGY2HVteglEERHHHSAd9RH5jFkP1EjdibnoJTs27h
	k9kJ6Sp1HjXUaZ
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr1457656685a.17.1790987248876;
        Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr1457654585a.17.1790987248462;
        Fri, 02 Oct 2026 17:27:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:17 +0300
Subject: [PATCH 09/11] drm/msm/dpu: unwind a failed dpu_kms_hw_init() step
 by step
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-9-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bbO86FGXsDHqLs/ciqm/qxFg1OxXE+ZgD1o0bUcmsp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvgKrR9+ITvbSenZojV9Y0W/JUgHEO8dm35v
 tsisGwUT2aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1dYiCACQzypfKlxO7NdRdL0NU6LsQHTUPR6nVg8j1QYpG2UVdXxIxKS1flR7TbVBPzpwtCcVjGb
 hmdeTxNZm9vMWZLYwRTjxR8wjEl3Ugh4d73pT2tH2pfMOdW2rb4b5Lltvms1eEIO2kTY/MDymxW
 pMB86GNshS3qYTd9PSJaVPrODsx+OwVXomk6qjCKDFZGmhCrAMdu40qUefY5DGab36xPa7HAPuf
 QmH6xG+FzruAn0eNqPz02rRrxcRHuJuFqI6pXg0qE1lF8MB+lGQm8c1Cd/+vAo7lV1C3bVSSQ7f
 Q+NGZR4Wzz+Uq9CNJ1O4r3Ln879P0Qpm2BiP5YPo/eWbHSHy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: x49R7lKXYMhV_W_t1Ii42K09NTd8aXRp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX8wjYLPjVLlHv
 OtiPb4eqlsH3p4BaeEKdxqxXC+9hBThXdNSRzJJbrQY+TsvBNMBbIol/ZDk1wjeFKg2SKwhCIyK
 AmZP90uhJ/r6O1/rsiawGhbZ7SWZknY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXw5APWHiZqRU5
 hOxdJBnNq3Y1eHne1I5XLo5LPRTLvOUyHcSn2EZLoDj9XPBSlHq/yziaBkGRX4JtIEe+Md1oQhL
 kk/FmK9dUfQlh4ILDCqKuaSYfuVUx2eql0qUHRGiGvi69sM0uR1dsmDiZa3/PlwDhNKRfqR93ea
 kYYCANOsQrFBBdNmgt15UKjlWJM0y32BvVYhecsXFRzCgQ3n5RB/BbxPuz+PoNMWkia42NZGUR0
 pMtd2eFT2Y385J4IFcinI28FrGfqChAXaVCHRThafsjWuBR8QIhN873cD0J1UC1DfT/Q+psEGsX
 tc8FUwrcPaQhr9NM90VqL9PKjbGPc6dUL76PfTxbxKo49jLIuxidoS4wpmXzZi7XGWKZDKqWTkj
 AO9dbi/jr2Sjo+WE0eSQcuMa/sSz8rSXJXchtexH27UtT3D0/lmFw3QMR5Ym9bAGRWAdlOrSFnT
 4IYPc51qf+T3U+vvueQ==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac04bf1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1OQLaJ8wmIwZLDPTffUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: x49R7lKXYMhV_W_t1Ii42K09NTd8aXRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
of a fully initialised KMS, whatever step it failed at.

Undo only the steps which have completed, in the reverse order, as the
kernel convention wants.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..2de4d881d13d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1150,7 +1150,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
-		goto error;
+		goto err_global_obj_fini;
 
 	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
@@ -1177,19 +1177,19 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	rc = dpu_rm_init(dev, &dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
@@ -1200,7 +1200,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	struct dpu_hw_vbif *hw;
@@ -1210,7 +1210,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_vbif = hw;
@@ -1225,7 +1225,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	/*
@@ -1243,7 +1243,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1263,7 +1263,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1272,10 +1272,12 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	return 0;
 
+err_mmu_destroy:
+	_dpu_kms_mmu_destroy(dpu_kms);
 err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
-error:
-	_dpu_kms_hw_destroy(dpu_kms);
+err_global_obj_fini:
+	dpu_kms_global_obj_fini(dpu_kms);
 
 	return rc;
 }

-- 
2.47.3


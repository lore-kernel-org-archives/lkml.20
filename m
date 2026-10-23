Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797638;
	b=bPcrHj49HS8wYLD7KVs9RsjhYVl+BS9If3ebRnWjYdseUL/FVap84nRgjlpig2zfaAl8
	 tBvFfrlGzzbnR2d+nRKofLOQMbNl3HiRSRuBDXH6zrVE+WnAQ3ok91QOl9+xap6lfYOUz
	 8VIFAHSsXL2WeiznNXlnuuymxmPoZcQNab4kkUOEeGWBs2448bbjYKHmXRKNQ291K47Re
	 S7yvMeO+Y/S7HlWe1wVTWJS3Mbv8tLyXyUUSmnRRWZyEi0cjA9nsuvasTbLxGSJEfY9i3
	 qsrp9FZZZ9vMurnOY8KZj6SVeflJC30VXjqFpJH2q3+4cPsPGo0y9+XVseEeHH8sKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
	b=xU9n0UnPbDSD0ai91EM+4iLvsIldBNrMuPQeP3bAyFvUfg2ScN8NU/HW9H2uwed7INmZ
	 xmSJBiyEWVgTA4bJhKRm8x7wzhDUJAh7vsRpIiXBm8mw0YQQ4X4Z1eO3SID92tSoKeIch
	 2LfqXyhyamsfGCOLb8tnwRagLa5jioimfrtvGSEa4rz+gFFzlGIAIcvBWrj1oR5qSa1KN
	 m7Iwa8cGNLJ8Nk/dlpZ8hZuIiAPCuI46Yxzw8yDBLik5B01r9AyCjW8nIPl4g9DyrBcui
	 Rpg+9z8Fjqv27IR4eBvU5qLXKg3OshutzAtrUEN4KFB7R0yNbB49zMIgkwbCYv0bxZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k/zcNqib";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fTUwPsWB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFA606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCFA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k/zcNqib;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fTUwPsWB
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuvtP877178
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=; b=k/zcNqib6o3a3F1E
	UiOycBmImHXspTfur9uZU5ciDwoAKETzh+DVgpD0LF4xgWZmN44tN1jU8fMx2X2g
	VsJoFarfRpjhzdV+Fan832+Bb2of1+vE2jEjL0s/4ZrJ56ytKmPVl+YPtdsPDZBy
	NqHMFLYoScMVLXc+8IpCgMGu9fpts7Uk1II2KK0G/kY/B5DTeB6ncjhxeMDhq12R
	1UFRZ7S9W7W7Zrzv0GD/+wtzStBn101uKXwa66fooToVPIuaJ/AdnL/8CznT3DET
	1l4tQrG4HO0lchcI5mFlaX0cxk61DnEYX+qB+hB2Qj7t85y7fhC4SJb9SFz1Kr2o
	mvCrVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcr68v1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso497208385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797636; x=1793402436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=fTUwPsWBJHM1rJXxWn6U/8xHUaJ+WGyAeiQk4a/QLKeuDcfrn8amJBjfQm9VfOwMmx
         QpKjpuasi1iuohByaLK87H2a1Pj60/8BpJrr4x0EJucL6YSGl7G2Mdac8cbBPrXBMSTf
         cvLEsQF9A8qySfRww1PRvLVwWiF9uzbPQxZ3ZsK78lKd/lyEPehkmS0ox7r7TwY10ICj
         SLHGw4HELRgKmuEU1CdXKJi6t3F2v+uejr/eC6TKhZI4PvrP+3ygq8/tsbBhbtYx8Gds
         QAVcPid7dOtKT3Oufg+GC4fY13jf+kSwwG+Ir6/14ZEZ61A0dL+pvPMLUpUPNpDPePo7
         7v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797636; x=1793402436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=lbaem7X0dXFKxGX3s+56NDTIm+/95G4WPciUyLJ8w9TiYzf4mqPOJYnSsLVHLz56pI
         7z0IhmC6JEDuAbUYrNqXr3wJdv9i2SWUXa1ygYQgbJiYWZfxXVDk+lWx4Be4B5bp/Qqd
         rNqSW2maMhBZxqpS9AkS35pQbdtqMCMHv4FFhoHh513NzaEsU5gtlOKd4+CECGNmD/yR
         l7v7lhN71r6AdLkbzftng9EdQySKUhaq5fzG1U1gmi7FslYxKsCPjSZmodjqvBndaxaY
         SF9IJCPMbvXs+Lb3dSC3eD/5fIMmDm/de7Wsi2kWysR4jj/RX53Pcba+h5L2CzhUqGv1
         5Cgw==
X-Forwarded-Encrypted: i=1; AKwUvBxgFypydLjlVm8ib0YWubDZPHmmUEzNP0RhyGXatI2xBUrL3RTvv3pElP2QKlTH9SPxhu8hatSp/v11koo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhbh/YFyLBfCwUtYtrExoWcgM9Hl3EPGNc37kAX73gfI3Dr/rY
	hWYCRO/sODC1+7szNQUywKGCLDDcsscQ0WOmk8GujpslS8GBIwaJufAasaGZWkR1LGo79k/4XqZ
	KL3v9OU4wPOBKa0YySBGsL5oDOpnq5uX8+XC4xlumG3jnBWcWcYhpJc2jd7E9TbCf0Y0=
X-Gm-Gg: AYBFou3VOBFoF5lWgLvY1w/++wuxJ2LrJx9B5+ILdkBTpVKwbi+4YWi4ZMOoUw5+PPP
	SDmXi/A10tk9Ka276J4rxnUpyDIARilT9uoM6HCs02sWjmmW3Y882pjKzIym+inVZBJpU9LA5s2
	OO7CKw3cb6LOfLtohmGfte+DCJDKM//DdtwJENnT9zPL9Am+1r+wVbvR4lVd1afXnLSJjJesbHR
	7zzXd3VWLbd2DMtnfTJqh8KZN0sgq6OCth18ezwVAIejTrVxnCCXj1YF2NBbz6Tw8WYMxXytlwh
	s5tg4KzqKSq2k3HZmP/PQT7RK4rBWSiR8axBIh6BCXjkl3zHnsfX1zz8rfZxItpHziz+knOWptY
	hfQqQHPdm5d+va2xtv6yaiUy1mgn4XQD32DOAZGJXcqY33hJ79Qup1vPrOSqSmrdtnaOLryt4bt
	6Ah8y9HF6qqoVW
X-Received: by 2002:a05:620a:d94:b0:93f:59b8:e29d with SMTP id af79cd13be357-940efaf66e6mr77845985a.26.1792797636400;
        Fri, 23 Oct 2026 16:20:36 -0700 (PDT)
X-Received: by 2002:a05:620a:d94:b0:93f:59b8:e29d with SMTP id af79cd13be357-940efaf66e6mr77843185a.26.1792797635887;
        Fri, 23 Oct 2026 16:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:45 +0300
Subject: [PATCH v3 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
 step by step
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-12-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3855;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CqSiLL5IBlX4YCUe6BZMO8fXF9pjuxvbGKp7tY7bOYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uXRezNuWAVHO0XDxUZpHkJhvnEIk7EChiQR
 Fo6aKhsGceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlwAKCRCLPIo+Aiko
 1RDvB/91eD0ioDaHLz9YmtbaBo8ltKUN5v7BxsU0fkhKOc7eHUIqYaIW33fqE0DfjvE5YKBQJc2
 MiklEVsMzb2bJTLdiFRx5ROkGAqXCtIC76zBleGHtvnurKg48Q8Ky86u0c7O8xQ/q+ENUXLj6V4
 a1xYtF62VOohFcLi1JRtXVEFgijHlfwtoiNTv+0cFVB3js3NUmUeXmnQlqER5+qb1BwUdtkvlPN
 UYYaOm3H2rnQMcN/z7+F1nL8q5hduxTHJ5rmU349JCIGwyGfsPwcBdIeH8mNDVCjeR4wenlrOd7
 3Qq4YMXFVzSbAeCmBh/vEWiRdQg89+MvcwN24mWQabquSe8L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6adbebc5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mqmjYGUTO374PHIbFJAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4RdA3LluQlJ0
 yK4dUcr5lVWtbWflI41ZUWs2xKmoHz7seUwCdszf7RyksdjNQrbwz8tRgVgf2CDh4qtP/r2zDyw
 taLdd3+HHJ4kc6FFgT9RBope7s8N2o9Lx29R1nUdb1R/4bBX/+SHc55LaHilbzaWqat8v33CkBB
 V+LIBcucaBSt0vc1NdrmRDb6/PaM4Rw/l7Mw529LKHWnx1pcxFxiiQpJk1DFOEwqUlK0Yvop/k0
 hTYnyx8MP8DHDBt8gVHNoiUmAzXTi8cwG9dM9B5avHr53i6/KMCDhvDjkMqK9tgDIXx0+hBYzEy
 PCaMQaJmFhCX+U1aXsdOnBlsmJLOCTF/0xD3ruIk/avJffKrIWDM6Cy/1ZnsPCe2c+8pfPe0MKi
 lCRS24vIXrGpSYG7sifhbW2oweI5Z1IwPvOGrQBEb1D417J1udoEG3fM7yNRPEBRmT6mG4MKTL8
 d+lhxHSa4bddvPLy3RA==
X-Proofpoint-ORIG-GUID: lgjqTbYHQowOxyWfa2Eet-LJUengtr79
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX3JRhkKnSQsmH
 /uJUalazY8PK02HZsmf/GxZi8RRAh1nrYUDJ9hpW+CncDAJg5SQyLCZT1zqLdCM89nCDm/Xt+9W
 Z4j0hnEwxpO3r7q3ST7Fls+DUsxnE1w=
X-Proofpoint-GUID: lgjqTbYHQowOxyWfa2Eet-LJUengtr79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy(), the teardown
of a fully initialised KMS, whatever step it failed at.

Undo only the steps which have completed, in the reverse order, as the
kernel convention wants.

The hw_mdp, hw_vbif and hw_intr blocks are allocated with drmm and go
away with the DRM device, while dpu_kms stays around for the next bind
attempt, so clear the pointers to them as _dpu_kms_hw_destroy() did.
Otherwise dpu_runtime_resume() of the next bind attempt passes the stale
hw_vbif to dpu_vbif_init_memtypes() before dpu_kms_hw_init() sets it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 934ba47b2dae..3546efacba3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1161,7 +1161,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)
-		goto error;
+		goto err_global_obj_fini;
 
 	core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
 
@@ -1188,19 +1188,19 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
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
@@ -1210,8 +1210,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_mdp)) {
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
-		dpu_kms->hw_mdp = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	struct dpu_hw_vbif *hw;
@@ -1221,7 +1220,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(hw)) {
 		rc = PTR_ERR(hw);
 		DPU_ERROR("failed to init vbif: %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dpu_kms->hw_vbif = hw;
@@ -1236,7 +1235,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	/*
@@ -1253,8 +1252,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	if (IS_ERR(dpu_kms->hw_intr)) {
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
-		dpu_kms->hw_intr = NULL;
-		goto err_pm_put;
+		goto err_mmu_destroy;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1274,7 +1272,7 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto err_pm_put;
+		goto err_self_refresh_cleanup;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1283,10 +1281,17 @@ static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 
 	return 0;
 
+err_self_refresh_cleanup:
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+err_mmu_destroy:
+	dpu_kms->hw_intr = NULL;
+	dpu_kms->hw_vbif = NULL;
+	dpu_kms->hw_mdp = NULL;
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


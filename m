Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769528;
	b=3m62x/L+p5ZyECW4Og8hbK76s2KekdSMLaoHITRtKwGhUnYbnLzxbDnftUewIUmbq1Mq
	 FiLuGalmm8/ezUfYSr0U3pVR0zjfiMoubNDRbvzQ3xWriM5IecCvNBv+EPUvSPU60+lGj
	 Pf78rqH5Wq5c7B0x7Ni7GrAz/upEyC0Y4yMnloeqUV7htoHyqWkH2ykkr6zpkM9Z92aBJ
	 yuy4jboVcNaITWK0QOBvEOzm+ZZjVUCDpRWn/acmxQgJ/nIf0you0KNRYtFGAOfKeVijw
	 CImxQJHTj7vkoYFBO5L8iUgRtbuw7R1kR4imJH7tBvS3r9i/ZTTajDzhL5CDf/xvWhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
	b=Fjk7Ygtxv1VzRuiRoVqs/n5Fx7ZEEwA/4eMSfSd/XrvukKhXzMgoo38zEw7Rn4fYC1Y9
	 r1FEWPbEhfDlS3XB0WP1TDajBKxEyG1UW5Fluaehd1gRoxMqPran/GTzuuKFuMxSVHn3d
	 vYwWMbZjY+O8oTJvCysxZDNwxFBEzpiAfomlV8C7mnc3MIgnbpMj5up9YgYzLfPD7teQw
	 1o/f36nyx8W8aQCcT0zE7KWkfrygeXLbMf7vaungIDd6V+AdbwKcTiWGcshkb674nM/k0
	 8lGBbC9G192RtoWmJMhqvRecPteNYa28fGukJSFf/Axw9O6qsNJQrb0VCxu2ocG/fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIkFXWlR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjGmbFy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB760A3834
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6EB760A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIkFXWlR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRjGmbFy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5s2U4072757
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=; b=jIkFXWlRZHuM9Koy
	qXdUn9o7+FERV1TG/ppXQBtdAi43WTmZRXbUalInNbfjCcbOxNJxDtXhuATcjLTn
	QPOA+KLKNnrplIOkrdto4xBPE2rZnbPnioa1bMv/9V5MdcwrbRXmtYJ4U/msGzzM
	0DyUfI+4hGMz4EUEx5dV/MX/b25OpHexTQ8OPltsJIsfxyU0eiaFgLcY7gz99r56
	mZlhIfqusEPgPcKPLLqK5OCsVGZvCM+ofWMmB0WlEQ8D+uMbirsP2PhWAehOfIG0
	J7GJ13TFB3DBg0SN3dNJbso4DR8M7sjr8TSmpsmISrNlmas+XUs34NZX22ssbcp0
	RAy//w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw0r4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:07 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso173349137.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769526; x=1793374326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=jRjGmbFyTNw+LI4+IfPNzbFhZhtWSq1PD3Eom0NQSQB+2BIkaynnuLhf4tKrdRpBwM
         OF9ofbdaOYzPRKLbKEcSU0fCKgip3JoKQer0sFAVRNjyAWWcZfjY0v0RnLSYBP1dWs4w
         iifT+i28cokFB0GtHv67vd9/rI9IQ/kky/8T89RGgC52SrgdZkjUzHP9Hq/IxM+KGRsy
         8Rky3AXngPQmcP9ufyJAhLeTZgkP3s8luv7yEmBYxfcKCMVbhMLv0hhf47zDdWhx9itY
         XipDNTc1Idq5aNxuNEqKwNFZpnXGNGCLnEJbPrXDPaG2ot089DSNCUwvUUE6RyWq0TgU
         txpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769526; x=1793374326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4lgPqXZovRq5NOnbz19RGauzLDixNMu9fw1Cvv0pkM=;
        b=KDGS66NQSC+EJ+P0X7V+WxqtQ8kprR9nIG/+IihQdWisoWK03xYZ627z+QzKY+QEH/
         eeAiGdEOKQh1YcB/yy7YjiErl8s2S21iNGyIxbLPRekrTCL5A0vaOYvjJdKTwp8tqbNm
         1SCmgCp6vkF3h8ZlKn6oSVyem4wVPGEGy+KXkX9qYJMjVvs6sD0SedYDCR/j9m5tjCcT
         snEro7Hw0kDujcmj4Crp4p0eHqvI6BTAm6VmNGSAnHUZguz1kRNMN2EzgMKtAksql/7p
         eXipbzu/3d4pNa1waKf+uqV0XyFYCjoWfU8B3TYsaKdmOH3UBasL44ZjLyWTqSPyPWzz
         MGtg==
X-Forwarded-Encrypted: i=1; AKwUvByCQpR7svRhhCijbJn2WFNTWQFN6g0WO6Dwh4nQy0NGrqiSP/Gf4vs8FwHn/5E3hiF9lrg5oJhaiTe9Qt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI9Gx3VrvlyTi9kcr0xDkxaGdb/p11ofQZP4TfvmyjKYE5Fk0H
	iYcSYkwWZUEnIyPegg+qJDZ/ZlRAQXe6rzQ7JpfKIdkPqRdaEfaf/vfAT9+26P401ZVk4l/TUZo
	BlvB9TCEy6plgiHQCYh82SLpb4HdUzvpvG1m8c2cVZGH6iyCM2W1RI1oXcf9HHw0t/p4=
X-Gm-Gg: AYBFou3aBXFDyqW+N6g58Lf3SOOfsA5yWUZ32aMWS8cbLA4Ovz7uF33t83dSnOSj+FQ
	Y6/YgTwwIv1RUzf/BNXfQTRuwpE6GxFMzNv9lcyzg3MF/sVXeX55N4tqQP5D1T/BkxOrKzHMhRK
	QjMZg1vTO7nrquPRm4sNxHWOBMS1CCOdVSuP4p9ho9wceuhRunza2UoI9JxLy2RNM/wkPTIXakd
	SasxjHROU7NZgWl3NVjp3N2PaZ7s72DaReydob+lxYTmTvhGrOU5L6jIkzERJTS3qTnl+mHKAFw
	3P9a4VRUqcFMPnVR7s9zsz6TdsT9cSkKj33cyHMHkid0OTlpvbtdQSoJOr74uTup6tNhhd7USTa
	tG/xNDuAd3b/H8giXlWbmnjh7wRt31ieUejjKC9qrS7iDColCQb12BPUPy8RN4CRp2UJOwFm7vA
	owBed/K7rPNYRQ
X-Received: by 2002:a05:6102:548a:b0:7ba:d953:edd8 with SMTP id ada2fe7eead31-7ccc32dfa8fmr954669137.27.1792769525888;
        Fri, 23 Oct 2026 08:32:05 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:7ba:d953:edd8 with SMTP id ada2fe7eead31-7ccc32dfa8fmr954638137.27.1792769525376;
        Fri, 23 Oct 2026 08:32:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:27 +0300
Subject: [PATCH v2 12/14] drm/msm/dpu: unwind a failed dpu_kms_hw_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-12-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233aal7O3xWU0ZXZMrkVM2UbGMd8hAN4MojRK
 6+OVOvqFsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92gAKCRCLPIo+Aiko
 1ckpB/4oMAikM1pxonhjPzMPtryQIf0cZjPxj25DxTmoM6dyM5A/o3e90RY1mT1vajlnoM+yDO6
 /mB6dStivvJCE9pY1KM5zY/SlgMEIFuy8+Xq/NLfAReiIutBY8d6xzn4ekaEO7XqF9545KRWOM9
 L6HbS0OxIkS4CsayF3tdoL2UVAh/iwc9TkpbOTh+sJdHFvEU8+IF1fxMe8Rg8a26afRolt3nJjA
 IoTETtrmSFFhSWxyfXvy5o1aYZwEP/0oXADJhjEo1/aodQ07Q4amZhhAZCLQN1paZMDCjmcQNez
 T/8uqTNwELo+YCAkcI6EwQXvupwRmTq4TozmgQww86UxaYJt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 0tzfSXMdxoNBoPduoX78CxliKqBYaaa_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX45ZvaDGn7w9R
 j/twOLGM0cwY5TIi7PQ1xUcZujs7Gyfa60gbnYnPDnhgB8BilzvgN0Va3orDOkN5XvEiCLzAAJw
 oEK+Six9Abo0BYWTm7+KZywgHYnykA0=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb7df7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mqmjYGUTO374PHIbFJAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 0tzfSXMdxoNBoPduoX78CxliKqBYaaa_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX49CUON1lmnbs
 30t8whobPcbTs1dcAj0ZKVKFNxSzaiLSUp73T9Dj7COs9l3CQpsXV0+jQmvywaYyFybWnxO9Wnu
 FZGxhEOacxl9P6SN21IHZkeRPC1lq7Ydfys4a9SCiJU3L8H+ompZxBlGmui4mPHhpGuaO83lHSx
 XOZePXn7y/ACA/RBzjku6vgk9V7wsU9DWTBKILPRtkkhXQoEYieFsfvwmT6uJg3HBW2Fq1feqyB
 6u0WcfzhcbpdEoSGp2hbSEYaoHVgEv/HY91eV4Lsxzd/dfbHvKxuEmZQoIGzGIqJ14WbcyLGbOE
 mu+yisosb9qR6U7Cpv1JOGG/F7Qyj8+Gux1SrMtn1+r90/F81FxGPpogMkfb4Phdqg9RZCtZMXq
 dQEfbkJ08twKKlihQJ8NqIPkzRqDJFtD61H5oyqBy6RjISkLeyVOtypmnJTIZQZM3XxucNse7YX
 ztRyavwamYUdHVs614Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

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


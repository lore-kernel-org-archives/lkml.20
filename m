Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB42D7DF1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987257; cv=none; b=A2MiY7jAl5NWQJyxlcq0xJE2gquSQNlbgcUKZ7sBsOpuFkTzjwewawbt9b+sAWtknZo1lI5RiYF8NrSfB6OMy3ZLI7hNYEZ/bL6TdOOKEXE1Bt7Drey6ToZSZOKxCkTwZM8HOA/82qVFV68FRg2IRfq+32TnSBuAzuUWut8eJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987257; c=relaxed/simple;
	bh=mXKVBYToJoPrLb4p3hSAaFS5AuCcufjkDa6V35Zg0sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCgsizuEim8i/RQ+DqvJbzMY8GrzyHKUd7crujFIdD+jDuUwluoez2/N1RdFqRG6UI9KFBbmC+bqN1rJ52K5BOiAKcEWGjK2x8nu+mxAw1W0+rSmV7A6Buc5aAe9JTNua0LPvY4fxSF75uZuisxg4sjPWW+7fCy0MI4kLDRZWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TePXfy04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYgwFfs6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TePXfy04";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYgwFfs6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nf4FW3814303
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyqt5AdRUlY/YQ93y0b7WfmjMyO1z9nII1C2dDiQyp8=; b=TePXfy04IN2rXJ78
	jwPq8z8aU3zLkuLCYwDx/0bf/QVwkE6MZBweJFrAOvZF6Ry7G/zTF0qJ+RIFR1Ff
	zLancNdSjspo76HNJb3jqd+keaAi93mLfRETDUMlghFI2nUbsoIpE7vgvNi/7+D7
	CJhy1LB8EfQWL4ZXsaKYDG6unCt8kViXvrKWXeSkgsi97kxAETmq/6RINEbVXiek
	yYT1AY1L+59256g/kzRummgsSyStAAjXSIaJgSugimF6ptzaF6AYeF6SL2KaPdR/
	VNQdV765aRb/e8rEGbWJEjHaH2RqAVi+PX75nOofAe1gQ5cfjbOzvenW0wmJSeUp
	/04C9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mv4bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso16145485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987253; x=1791592053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyqt5AdRUlY/YQ93y0b7WfmjMyO1z9nII1C2dDiQyp8=;
        b=iYgwFfs6tQP5vBVKnJ4QK6Q9UtdWIijhzl+rECQskHlQCBez14c3c5yg5+4mttuqva
         B/val+Wmf0BMN87FI/i2VFBgyNmw5sUFamZfPMAl8Cuzz0tdpWkt1mT5AkGwzDzg5uNo
         qM/zu2qQGzrL0bsQz2m5p6v1ml4vDmZymIp/zrh7i+/I0WPkoWObc4Dlybx7JLyDoaJ2
         Piur3I4Hdhtcex/Y59DopXQoaoWVLbaJk/+BHuM307udCpEjklaWswu4DvP3yUOQ80Nr
         DFEXD/SGSgc9yYTXdGVDio3Qx7K8W4/5DEdIYnbqI1lW/R1+SX49Jn4Ly0O5eaBYib2r
         eT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987253; x=1791592053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyqt5AdRUlY/YQ93y0b7WfmjMyO1z9nII1C2dDiQyp8=;
        b=qNgDGBewyO25UZ942qJd5sFTUaqEFPC8xUOkfhrgInEZUDm05jXep7LHoN537vW7H9
         wWVBoASTtoS2bdT258m1tuyEgiky2C3SymfFKtOHrJxQKdvBtXZn2Z8ooSLN7i8Fty8y
         RhNkPwdz9jjoEgbF4Mkmpl7U/ejZBZ3Ueb2Ql8nXjoDwh6OMMzWFcU4Tyrlw93UuOaLl
         2LSSN/N/gt9OGX1ef8JsQEYmqQrJzd5nH0MFgpC1fbGs7HErsbC7DyT6bpJUWgINF+/K
         +xhD9MXR5/xpp+8naqNS9gjFiInVcJCJBwNBc31FoWGasq8vB2273YRWAA/jCoklm0YV
         D3HA==
X-Forwarded-Encrypted: i=1; AKwUvByH0jKYpYDd2ZDuRIj7nvdkETAlwc5+5Hb0gGokP8Ls+Ie7gv6sL8IQnecdfql+EapPsc+al7ByCTdNex4=@vger.kernel.org
X-Gm-Message-State: AFuF++nYid4M/00R1WTy9FDA96Ase0Tm5ODKXSoVZ5eyVipnMgWdstU1
	OAGxOZln05ChIFafPBrIuUKAgO0+7h3EoY+ssT6WnBAeDwd7ely9IaMAiM8ODNHRGuqp5DRbbao
	f66s5FW4fUnvzVQUhi3BlMVdv96f+o2hVRSZRbF/p+BC/VdSGgnTNjGMc46KM4S+Rwrs=
X-Gm-Gg: AYBFou2IkHm+2VvkyrQjrinP6QG/Wjrvx5fZSBgMVhOcEMioejheNmvbGBMg/S8dDjj
	dKSY268Q99/8r2oLfTLEmBlr8/scoKN3mD52Rq3GRTWWlHhaAEZc9KD12MXUUBYVVwit0axvBmA
	sGfirhGVgWh/m0ZcidRcZaF7QVpEhu358es0oSryv3cMu47CMGImWTRAcVkDKSkPkZyzRb2M2ka
	DETgOX1mlt/3gfjZFO0eGAwTQPxo2QnZicMyRw0qgLVkzug72LFHGB4f4R9IOXQZxheLVGkdJu1
	VWiW0sFwLokpntaDaIXmLxRkR3apjmflWGqwAY6s8L7h78tH/734+I9iWrMmhqwwsk4kPQIsl7x
	R0p/ZMYeSzKwpBsHo9C4D5N0n43JsETzQh/IhPW2rHDULc+8yM6g0nIEesF9npS4khGpXQ+FgUP
	tXNk4NIUO+15iZ
X-Received: by 2002:a05:620a:460b:b0:93c:69ac:bbec with SMTP id af79cd13be357-93e510389b6mr220242185a.38.1790987253057;
        Fri, 02 Oct 2026 17:27:33 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:93c:69ac:bbec with SMTP id af79cd13be357-93e510389b6mr220238585a.38.1790987252574;
        Fri, 02 Oct 2026 17:27:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:19 +0300
Subject: [PATCH 11/11] drm/msm: drop the runtime PM flags from the KMS
 teardown
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-11-e062b7dae77f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mXKVBYToJoPrLb4p3hSAaFS5AuCcufjkDa6V35Zg0sM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvh672QUDihEaHzfnfmjxcZOhm+wbZYSBezg
 1Y8NXqsifSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4QAKCRCLPIo+Aiko
 1U4KB/9PP/hgZRnuOBFK1jSfU+2usiu9jSM4/egWc3tPXf1VS+9SCUM/LWdxTf+lw+mlFrZcbTR
 YWAwwdXWcJGcXex4284vU9V7li/rAd7zp3D7SP+4ENvjPSaf0dT74oxqGjuTr0gg2vBVRt3wo5S
 7jCyRUk0GbzRm68W+ZSt26UZIv3IelXIEvEsBTa/KNU8r/E4oBhGosdINTLfjpW0rEoiNGnfIyS
 QgdEgDKdin3kw9K7PEnQ6Xk9dphM2p7FExQIcFA9eP0WpDV1jnChHXykgVi79t0usVfzXuW+g7D
 8LEEs8z40ItTnWaeaRoK7yDbC49H4hKcMpR1Qhf0M+pJY9pm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX3lmjMmtyQWM/
 WhozuSQOjkgRPnQsfAXDFRe3I4Ut1a4WGwomRQjNonn5MV5A1H+fSWDOQbw8VRdbp78rb+QzTe6
 CDBepvfCRHhti67Guk71BpoTvQk6XNE=
X-Proofpoint-ORIG-GUID: yCJi9pDbzqJxA1xRDXsG_TCKOBkzF-WI
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6ac04bf6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Yohvr2p7PhcuVfY586MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yCJi9pDbzqJxA1xRDXsG_TCKOBkzF-WI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX87hVx0IONzo5
 PklyjOIWFGEcUPezqRg8GJwgTCNYcxvzZemYXjV32nz/j4D9e0MNGzQ/ARANaeI+iQJ9Iuayarh
 GF6QF9AdrsDrmJ0mbRGS97+DWfZZ4W5z6uHEaXI7Giw2M7D5iUOTiG6KlOyWvwEhYc6s5WsO3J6
 OkOCljOnYZOpUXNkqXcHtV77bdGtDSlLzw28zi5VikhGdNh0R0YOm4MBrndsrAUIpqmQ8rZY+04
 lE07/5Q11eVyTkWMhATgx4sSagRL/kpCZKiMHnKUeaNhoLPWNuP4qPJf39izsY5QSeTxIXkR10E
 p60D82qXuQiGpcXc1Byv6DO8STiblC59gy8vtbipLb61GaIyKcapO3SNXPGIGzFih6RBJFBvBU0
 sxKTqISoZoCKAQhnQN9YxSxTFXFVYtyW5Mw4XwvD3xaBKMiXSVx7JIPAkn769Y/4Lx4xDzyLWTO
 t01+om8uN+bwxS1RiDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

The DPU, MDP4 and MDP5 drivers track whether they have enabled runtime PM,
and MDP4 whether it has pinned its blank cursor, so that ->destroy() can
tear down a KMS whose init failed half way. ->destroy() now only runs for
a KMS which was initialised successfully, where both are always true.

Drop the flags and the checks.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  | 1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 7 ++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 5 +----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 2 --
 6 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2de4d881d13d..9756ebcce1b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -916,8 +916,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 
 	msm_kms_destroy(&dpu_kms->base);
 
-	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&dpu_kms->pdev->dev);
+	pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
 static int dpu_irq_postinstall(struct msm_kms *kms)
@@ -1306,7 +1305,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	dpu_kms->dev = ddev;
 
 	pm_runtime_enable(&pdev->dev);
-	dpu_kms->rpm_enabled = true;
 
 	ret = dpu_kms_hw_init(dpu_kms);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index e39831a397b1..769b8ce6332f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -87,7 +87,6 @@ struct dpu_kms {
 	bool has_danger_ctrl;
 
 	struct platform_device *pdev;
-	bool rpm_enabled;
 
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 8529e7b2008d..daca49641811 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -128,14 +128,12 @@ static void mdp4_destroy(struct msm_kms *kms)
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct device *dev = mdp4_kms->dev->dev;
 
-	if (mdp4_kms->blank_cursor_iova)
-		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
+	msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
 	mdp4_destroy_vm(kms);
 
-	if (mdp4_kms->rpm_enabled)
-		pm_runtime_disable(dev);
+	pm_runtime_disable(dev);
 
 	if (mdp4_kms->vdd)
 		regulator_disable(mdp4_kms->vdd);
@@ -438,7 +436,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	}
 
 	pm_runtime_enable(dev->dev);
-	mdp4_kms->rpm_enabled = true;
 
 	/* make sure things are off before attaching iommu (bootloader could
 	 * have left things on, in which case we'll start getting faults if
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 06458d4ee48c..9dd829ec9401 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -34,8 +34,6 @@ struct mdp4_kms {
 
 	struct mdp_irq error_handler;
 
-	bool rpm_enabled;
-
 	/* empty/blank cursor bo to use when cursor is "disabled" */
 	struct drm_gem_object *blank_cursor_bo;
 	uint64_t blank_cursor_iova;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 80bb6ac56618..af9ac108c06c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -574,9 +574,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	if (mdp5_kms->rpm_enabled)
-		pm_runtime_disable(&mdp5_kms->pdev->dev);
-
+	pm_runtime_disable(&mdp5_kms->pdev->dev);
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
 }
 
@@ -729,7 +727,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	clk_set_rate(mdp5_kms->core_clk, 200000000);
 
 	pm_runtime_enable(&pdev->dev);
-	mdp5_kms->rpm_enabled = true;
 
 	read_mdp_hw_revision(mdp5_kms, &major, &minor);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 7bf2172fce0b..c0b163c4baa3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -62,8 +62,6 @@ struct mdp5_kms {
 	 */
 	spinlock_t resource_lock;
 
-	bool rpm_enabled;
-
 	struct mdp_irq error_handler;
 
 	int enable_count;

-- 
2.47.3


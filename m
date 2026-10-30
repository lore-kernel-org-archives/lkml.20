Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380225;
	b=YAgnfwjse24XsluzPyYPWpeVFpahWuqe3GdSnXRSA8ydQYRDSp8+GjQ0fjo+WV5GJu9c
	 6wBy62I25UQvDKttNCJ+VzPN8BNJX/1/6YaxUnAGeiUh3m+94c6aDOX3sw1nlkv9917b/
	 sdrJU+7JQMomlqYSIHO7EF8MfSoyd0zRAI4BXXwvn2HOgXO7MVcdq2ZbWiWvCTWrXnbfN
	 RYwojD3TYGQh1GRoCwzNVWKz0gtY37DPBwRzqaS6SOE6GamBqOnyGSl2H4q0nkzoVPvh2
	 tHe+fP5jS688JIYGy3fzEdmGOyP7d9mmLJTEPP5cnF0DUvLT+ZwsRD2PC/rtVu9lWVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380225;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
	b=ZdguL2grAa80BFe5lMFAbFwPGY8o9j/UQTzyyCjPPMbHM8fTsEpjJp1v6+QeBeQuguEa
	 zV3RNP3ZHa+rXzvF+r9lPeBt9HM91mtGaBjYqv9XLAD4V/qLC080neSwIKbzOCnPVnUxE
	 qFieZKH6qQJ8FoJ+lhFn8NDCOam/c+6ES8LX1Xcs3nTu/og6NfWXcvEeZpgUXsrrYAPxW
	 fK2lQ5u/F28X6ZGncdH0QiqRLnMBDkahYrBeGsMKeXzTv5hOSe9woE4czeG5y77LpcIxB
	 P5iNfWjV5ogq2XzvMZSe8pjV/pdnpY71E6hU81Bo5ZJ0zqzleLGVhs/u/9NS6OyDt4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mxDlVb/4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWJzW4mP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16806606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16806606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxDlVb/4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWJzW4mP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDdX4102993
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=; b=mxDlVb/4oNjbGPp+
	D1IDaKBIrATqv/za5Qjgo0vHnkuLx4V+89qIAw4VTbiLvZ2xVJipLOb5BOy33fPd
	nbpDuXxy6kCffhskOIsWee5g81kN4l6B4bkVFgFC6iYb/B7G15jMwTPUHDDum4Wm
	S4hFYcyxjIWxyqDqLp+/njMQAUcAbO8kk7IXjgkYuxVIgF6X6OUz0bB6M5fZdkZG
	xRRsAvsv2tTTGnQb4bBQTGjAyRQUMUZzPj8/0FdV5aWq/l7g4kCYQzRy1iJbQear
	UtfAGEhX3zPZN7ZXkCUaH9ZCQ+KqOyNcpSKiT1DSopDqZfK3TuzS2PxxOV+m12av
	GUll9w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:23 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so972454c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380223; x=1793985023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
        b=aWJzW4mP5Rggi+7etKup4gegLHLU985FG4b4iVamc2CT3I0oarUePIQTUFycBvd/nf
         p/q7IPIaoagnmp2wpYuoTkoCh3pYrU6hpjIfYZmscViaZsI1c/XoiiufujDaTImCq9rd
         Q6JC1JTUAC1zhqgBdCnCdkTyX2s7iVutrv56gBgmHUM8esnqecqK9wA7MD0G5/5lRU+D
         BGnkRN6+niDDD2NIro3A4g5yuBB12++jaOQsiURJvHx974Gzb29Q5n/03R5HWT6PCdQR
         4JJ+U6e2TId+NGLYqJvJHUZoFpNISyQOy/seFuC1xRVjgRLhySNs1P+btGqLbixz2zNZ
         UklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380223; x=1793985023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGiP+wlabFkesvK1GxyrQtqtDvcfG0vhc5WfZFEonYw=;
        b=e2X7DOLkkv3rAHKhxeGDQbpEnkBTwkf2AjOb1Qo5/4krsB7ZsZCLVEV7+sepqmzQw4
         deYy8vRpFiv3WNud1flSqFqKQk5kj9rkNZYZjDsgCckpMEABQUVsEwvl5ZmEko8zsqlT
         HLcVW4U+Z/yTv/DR9zabKAZnzxh8p9dPXurZKkUhboSGrAgNZ6cQN97oQAk6PdzeWtZW
         Jv7Sc9UK0Gdvr8XVfB4GTkYMpBmyxz4xMchQUFYqL0LvpQH2uw3AsRvP74Ag/HLquq1t
         IT4JmzRR7O7YBrxop5hKAnDIN3b2VT+UYFyB7B79yzU9RxwdeeMKOXzoUDhx6aAbdFGq
         5g1w==
X-Forwarded-Encrypted: i=1; AKwUvBycEtyu1AeLgjwh8++Q6HEz7lX103xVrpTuir8uCMF1NVHXrQYQbCC6KCXGh6PzxtW3g6NzBx5bvSDyKO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoZ80gq2PjmGJ/NY9Fbv5VlOyz0Yudyq/zRE0tk4dATGGFzvy1
	brmosTyl/KvcolzVCrp1xP2gzjyJNkz6irl/kEj9mkRYP84RKEMCRfq7niEexVAqj2RGNUHyuTB
	SbUczP+8CVnpeuMURNQ9zBddO8yC23gvNvpd/KHFndCOyIM95ORjHAThUOsmf9ussiWo=
X-Gm-Gg: AYBFou2lsa9OdPwrfXF0boNAIawExUBGhnu2COfBLiG9SJ2+AQw5rK22h1MHh6zL/oV
	fSc2Ptc/9fOMgyad7Rg5eBkb8JemJ8dLR2+8QvQI/SIkf0XyO22Htv76oBmNm8Odulcde1ZcDZh
	v3h8oiGU2ujq5nyMdKGlYXXFkKhVv1qcUFZwAgVWd3RMQ80WdAspgCD5fq9YVbRnCQrSY9weyGr
	+/xQ+gZCMzGppzZYCMQTFvz0ZS625t0/mSEi6pPFKKB2IxIdZ5rSiwA8lqOOhtz8Odyif9G6or7
	alERwYkl3Rr0BwNQGS80hIUneZm7pUt1lizoLz1ILdgx7NcVJlh8l2YmXOedpun0axSseF/qxoE
	DJu/CjtqQxMj17zSAvZFMfPbRLsU7ZhsJS5SFNer+8dR8hdU5ZFDe9r1eD8k2f7MnaLrbWWNfhw
	==
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id a92af1059eb24-1ac5a2a1483mr4187505c88.15.1793380222790;
        Fri, 30 Oct 2026 10:10:22 -0700 (PDT)
X-Received: by 2002:a05:7022:b048:10b0:19e:f233:4f87 with SMTP id a92af1059eb24-1ac5a2a1483mr4187449c88.15.1793380222148;
        Fri, 30 Oct 2026 10:10:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:28 +0530
Subject: [PATCH v2 7/8] drm/msm: Remove dead gpu_ops parameter from
 msm_drm_init/uninit
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
Message-Id: <20261030-gmu-sync-state-fix-v2-7-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Haitao Xu <haitao.xu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380169; l=3626;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XYzrF1O+N18oo1WMb7vD+Ua6dmg/Pfyq8adeQ+1TTRI=;
 b=AeDXa+GtzzyMm0oaBDru2QN6HdwHKwdCslwODLXpk9nsqIHELXhhUDyoLMUMBZThf++prZhT6
 Ks4x71aTbYFByk/GK5D+xvdwZRy7gy40154QOFWf9X/igvU5LHbWB+q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX5oL2VtowKc93
 0wbChKHaUvL0YJxqAy73ZN3H0jY/tkCKmI4/HvwV/xA1ZNDo4Hv1+FbdzOUgoqlFpzf1pTGV8V9
 kdD5JCngbAp8SQf103N/7k7rjfowgg6OlR6e1B3oxaq/FVRmBXfcpRpVcG9MfYgz+h834ceSYjq
 gCSrXIsvrRpAx4G23OfsHXxnukD73RoIyWNqLgSHj9q2bBlKhLRNmuWTK4VRZHFhrinVvi4lkmu
 4FzP++Q37Xz9ciDJz4GUqRpGFXaB0Ius7shSudOffPx/PkSBmziWI1NoYJFgBtAo3DOR2n1UCVN
 K4nQRFw/AotphSszqmRNvKpPXYMvoZ7os5qJii+zl2b7SFx5U5Shav7+lOxV3/Kt8Rd/ClpOjwv
 saA4tVzRspSGCL4kMYvJ5uns6mit6xbaNjCZcN2VwSTbX99vZ9THkGNpPK7n7XtPs3emNWzUF/u
 xOLuP8A6RD023TiaqCQ==
X-Proofpoint-ORIG-GUID: FsjKAYGYvVumjGODzrzRcLv8Jfe7xvtF
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4cf7f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n7tE8WeWehBHorqAUqwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX6YnxNstTTDC8
 +3ySobFbHI2VfzASxTGgviURApZCruxSLC8OB8jI2sY+9BQp7xKMkiRRiZtKPfqLqdxlQA9h139
 7smUeNrWPZdEcVJD3IAA+w8bomPWDF4=
X-Proofpoint-GUID: FsjKAYGYvVumjGODzrzRcLv8Jfe7xvtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

From: Haitao Xu <haitao.xu@oss.qualcomm.com>

The gpu_ops parameter on msm_drm_init() and msm_drm_uninit() was
introduced as an escape hatch for the standalone GPU path, where
adreno_probe() bypassed the component framework and called the bind/unbind
ops directly instead of going through component_bind_all() /
component_unbind_all().

Now that the standalone GPU path always uses the component model (the GPU
pdev is both master and sole member of its own component aggregate), all
callers pass NULL for gpu_ops, making the conditional dead code.

Drop the parameter and collapse the conditional branches into the
component_bind_all() / component_unbind_all() calls that are now always
taken.

Signed-off-by: Haitao Xu <haitao.xu@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9ad2260f4971..c3b6a5f8f54e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -148,7 +148,7 @@ struct msm_drm_private *msm_drm_get_priv(struct device *dev)
 	return devres_find(dev, msm_drm_priv_release, NULL, NULL);
 }
 
-static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
+static int msm_drm_uninit(struct device *dev)
 {
 	struct msm_drm_private *priv = msm_drm_get_priv(dev);
 	struct drm_device *ddev = priv->dev;
@@ -181,10 +181,7 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 		msm_devfreq_cleanup(dev_to_gpu(gpu_dev));
 	}
 
-	if (gpu_ops)
-		gpu_ops->unbind(dev, dev, NULL);
-	else
-		component_unbind_all(dev, ddev);
+	component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -192,8 +189,7 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 	return 0;
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
-			const struct component_ops *gpu_ops)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct msm_drm_private *priv = msm_drm_get_priv(dev);
 	struct drm_device *ddev;
@@ -239,10 +235,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	if (gpu_ops)
-		ret = gpu_ops->bind(dev, dev, NULL);
-	else
-		ret = component_bind_all(dev, ddev);
+	ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_put_dev;
 
@@ -276,7 +269,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
+	msm_drm_uninit(dev);
 
 	return ret;
 
@@ -1139,13 +1132,12 @@ static int msm_drm_bind(struct device *dev)
 	return msm_drm_init(dev,
 			    msm_separate_gpu_kms_components() ?
 				    &msm_kms_driver :
-				    &msm_driver,
-			    NULL);
+				    &msm_driver);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev, NULL);
+	msm_drm_uninit(dev);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1199,12 +1191,12 @@ int msm_drv_probe(struct device *master_dev,
 
 static int msm_gpu_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_gpu_driver, NULL);
+	return msm_drm_init(dev, &msm_gpu_driver);
 }
 
 static void msm_gpu_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev, NULL);
+	msm_drm_uninit(dev);
 }
 
 static const struct component_master_ops msm_gpu_drm_ops = {

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380211;
	b=Y/CxqOqrVNcnAlyx11cLlCrtmgudN4/1f3ici2xSSlJNUk3k79eNUjjBLr72kKbgl0Ix
	 ijfw487ECraSr3WFvapMkyQNsRtuKOWtYLl/ukcuLKUhODqYlYHjW9EzTtkYI5p17vwWG
	 mwkQG457FyfV++m5149xQ4Yh2waHDQiwKuv8PaB9CSVpFnV83cFaO1k75GFCA/CP3M29O
	 U0a28q/bMSucIcFXiwmEVJ71jiKFQwDxiu0eyk7rIzIJXfFM2yBmNWyEdNbW5vgAnR3+9
	 c7MeDFpvEsK/nCrxFHB/vIgSPdtIJRolZPfD8783jZGHaeVv4OdhezXBJ6KYBpFB/4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WtDfSiAyMCJxbIHdUxSc4iYPCHHVnbHwzdCobB9y9Ng=;
	b=4TbebfMm3KaX/Rn2hqe/u/GxXjTzga8DAVt4cq0NbcZsZGft/hNF4qdYFNUAGOHl4Dhr
	 FPx9ACfHEesGxhDMuiV/sjMa4v/kzXsefG1VxTP8RinueFuwkI2di/KQE4bYkSTUULALt
	 yUJKVUVCJZpT6b0FXJ4sgkqQIkzVLYgn7iViZJyWudBsPlmXlBfc2FvoFOSburJjLfZxG
	 3OJxXsIkLI3NKQhGpPDn1KOo49dFllYUmpEX2RwaYFssvWAHh1Wt0Na2bkq6NBzNCxpyY
	 0FIoKmDGikwqn1Y0Y4yw/QD3Uo7pnzg5hO3itMNh7zBezS7EhzNetIgl4hk/0RRFJ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T0NSkmwz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXQa1DL5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC1606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T0NSkmwz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXQa1DL5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERDAX346987
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WtDfSiAyMCJxbIHdUxSc4iYPCHHVnbHwzdCobB9y9Ng=; b=T0NSkmwzPaLPGzOU
	7ikUSz6iH7my4VOU2Ye2Eq5K19kb7zb+5fCnDFJ8ejMS29VGCIwgr8dr4s8KDEGU
	NdE/OoUQnkSwwL+n89KhrodQ7zgIfvrQXLsNNruaXFd+s/ZZ8sez1iBN00zwXN1m
	ZykcU15gAwZFnosmVp8JFoA+700WHn73xDZHzh/SaXZ8VsrWq7BXIQuUb5SaTZX1
	dOX4hQgHeu3RzX0X1tp3vVxLOTJvY5tj/Il+UHcEx/YvWLJjumIkSxxIE6co3MV7
	MD2vDdcLU2AUBCL45HFLkjMBwN25XVf6O2kpglGxVYxHZ047EPTAOzirrYLqZ+L1
	mT/6ow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rm8xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so3860156eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380210; x=1793985010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WtDfSiAyMCJxbIHdUxSc4iYPCHHVnbHwzdCobB9y9Ng=;
        b=VXQa1DL5+It93VqpGjjZcw9hz3pkEclrC6L4qdO5I7GUSEHvx6luc9LXjDFDEdjICs
         l54wnkw33YxARKMTBZj4FrSgHJcF+e3Z94r5X8koJx91IQrV32UG6bEMJ24WfsylfBeB
         epzH20As0xn4QgQSkDVXjdJ9jKaRHrL/Era4f54J2vsWeGVix1wQyAG0Uy3ScfpQGRr7
         zpVpHgZDVdjpkIAZtgxDjkbSb6O0zt6ndJ21M14L2RhyFKXTQMGD7Yjg0jfHfIa6kWS9
         iXE8PBw/gFAb9XDghUjyRf6rF6wPu2JXpIU4NNcDtJbZyHfufujHlGYA81lb6HW3ccJ3
         M3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380210; x=1793985010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtDfSiAyMCJxbIHdUxSc4iYPCHHVnbHwzdCobB9y9Ng=;
        b=nVT/GuIajrHuXePKy71uH1NU9FsMSkn7MgxpK8DN84M9uMzm8a6Nc6L9XlJ7PDNmUt
         gN+NozgVnovmG0tSQVHjDhUoU9ucoHA69zekbwlYe3IsxSAYwCt1Hv6uN5NkbHUc+Kdj
         7Ns7/+cyDEUYpygCJjHCW0gMIEznYBE0GHd5HMEaTclTZASKvfPn5nBM3lDYyo65SdTO
         o63kBKupKHKYImYHHuuyJhQJ9q5nGDo3BoUWXPp5422SU00JgbBTWvuPXvWE4DROxqew
         +aXGMcQTvIdeIMf+aaqcI4QVu+mUtJrEssQ04aPl3bAHwsjPM4GfSR7woTxUhOeeBIFi
         lPhw==
X-Forwarded-Encrypted: i=1; AKwUvBwntfZCkfi6eF2Fcf1ytVo8kadSSRUHvyfLdVSYTvDwWuQTVGYFWKkboCJVMTHUBYTDH/OazdbZOPZsHMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYITgbw8ABbuEUkklpxMzDtwpYm0Gpw+BnfzsiqyQk0NqvS/0suW
	zS164IXpoOZocd5Qq2TaUzUeqwfsmRuWWiV7G95wi6Cq+FsOU8WxZtxoAGU5hvZDlXdslAsEZA0
	ytCZm3YD2/AwkeEyDM6NQpIV9lqgw/yuoQDAwH/ALRkUtXzTAFbj3RmPlfH5QT+k0gks=
X-Gm-Gg: AYBFou0qKUIjkS0zZMMWj3RCPg+DJ3xzTKyGzlza9qLM8omjWl1udwFmAu7ubpxiFWf
	IQ4HE4Hbjh0CyaRHXa0VlpZ4gP2GFW/ZymT+vriQ1zC8JCP94NO/9hmoNnTz67LXVxf1XPhHvYJ
	FZsZt6Uon0YjEfJtY3KpghiNJgfUoHQBXlNjZbuU1gyvrKO9qvAkw+g1/aM8bw9ATJoNaqLMQbt
	a0nFHaej4hW8fcxpvlWQFtNNbF4kJ00UEcjpvElNkoBVxfYPb8+ZYo/0AH7VQB8rj8kCAdzvpnK
	SPooACn+WpskG1I4EUSiXoXLdRnRs4Z9IAcX6yKQ0EBboWNjZzTp/JALhk7YcPFfhRgBHV8Oi2H
	RFUFicpswBO+jIzppryOxGf+XIS3yoOmPucrzf0hbOmW6StkONdM6EwBwDyexVofIUM1XDaGNGw
	==
X-Received: by 2002:a05:7022:ed09:b0:17d:7b45:f927 with SMTP id a92af1059eb24-1ac5c2727e4mr3669373c88.33.1793380209362;
        Fri, 30 Oct 2026 10:10:09 -0700 (PDT)
X-Received: by 2002:a05:7022:ed09:b0:17d:7b45:f927 with SMTP id a92af1059eb24-1ac5c2727e4mr3669330c88.33.1793380208649;
        Fri, 30 Oct 2026 10:10:08 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:26 +0530
Subject: [PATCH v2 5/8] drm/msm: Always use component model for standalone
 GPU
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
Message-Id: <20261030-gmu-sync-state-fix-v2-5-89d3082d97af@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380169; l=4464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=U9ojTQB94Ke42+FWj/Kd9ZSdUBJo1oU4ms+Faog05Fg=;
 b=9UAOSfgUgO894d0PjxIZr6P3k7jDFVUKk71nUfqlQFhBvHbXi6XnOHXN4CutsWWwp6OFy5vOf
 gOLje3CxNO2BWjO1eQ/ZR1Xb56z/649FH0nDgwNoklvXCxsM7fNLnrI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: NpQRaT15JnJfgfqzck1lxwBQfwFIzJIQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX6adr3UBAmxry
 NX+CAhJxSl+xGCagMio+YywnsnxRtI/FETjqzHKMS9u18z5TNbuEhSmYqBOTwWvejbszW4Stf7y
 6zRn3VaaLX3UilleZU9iumHWyYAZOUo=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4cf72 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_hlE4qLb6NvLkdTQTB4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX+rPdiSXKhusj
 JZgx9SrGPjzO7XCn3x6nm7YRwP/Vn8YwLEr9foJK4bB6gJ52sS7oiMY2CJ5VEPoQRzYUbye1byw
 T8LPvZoAA/x89zEtf9PdO+Pf5UBqTXs1AVwitHuqGSfJ+HnrnxfRiFOxHmqYTg3nKicCYxNljKh
 Fp+SZK3PcQdrO2mwNIJzbumDxXBjvc1KUpI3jDHZ/FiG5Kw3ZSvcAlKo/+PuotKr1CkyRnAx7Cx
 twtlRMMd8+0RgzpKyV/ZIVG3bJFvj2jgdbJHOkH8nWxxS+vSDVBWBwV1fH7768yH1/QIbUl+bF0
 1LY9QctXDxGxEM8+5O8i4cd6rpAHyUzSJleGALzxJJuNC8sMNmI4dzOHggUaZpJz/vTDPun9Qym
 8rA194dvhQFh7y7GsDBjs2jmbCRlSUW4R1LYXTL3SR0XEwE2RO0fYyEvOJcM8gubhsk9CWnUs19
 Hmh+aM2yzTodg0f9l/A==
X-Proofpoint-GUID: NpQRaT15JnJfgfqzck1lxwBQfwFIzJIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

To prepare for adding the GMU as a peer component, turn the GPU pdev into
both a component master and the sole component of itself in this path.
A follow up patch will introduce GMU as a component device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 26 +++++++++++++---------
 drivers/gpu/drm/msm/msm_drv.c              | 35 +++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h              |  6 ++---
 3 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 34718adefbfd..6b694b8bf8e3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -271,24 +271,30 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (msm_separate_gpu_kms_components())
-		return msm_gpu_probe(pdev, &a3xx_ops);
+	int ret;
+
+	if (!msm_separate_gpu_kms_components())
+		return component_add(&pdev->dev, &a3xx_ops);
 
 	if (!adreno_has_gpu(pdev->dev.of_node))
 		return -ENODEV;
 
-	return component_add(&pdev->dev, &a3xx_ops);
+	ret = msm_gpu_probe(pdev);
+	if (ret)
+		return ret;
+
+	ret = component_add(&pdev->dev, &a3xx_ops);
+	if (ret)
+		msm_gpu_remove(pdev);
+
+	return ret;
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
-
-	if (of_device_is_compatible(node, "amd,imageon") ||
-	    (msm_separate_gpu_kms_components() && adreno_has_gpu(node)))
-		msm_gpu_remove(pdev, &a3xx_ops);
-	else
-		component_del(&pdev->dev, &a3xx_ops);
+	component_del(&pdev->dev, &a3xx_ops);
+	if (msm_separate_gpu_kms_components())
+		msm_gpu_remove(pdev);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e0c0f1248d1b..dbb6c70473bf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1182,10 +1182,25 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-int msm_gpu_probe(struct platform_device *pdev,
-		  const struct component_ops *ops)
+static int msm_gpu_drm_bind(struct device *dev)
+{
+	return msm_drm_init(dev, &msm_gpu_driver, NULL);
+}
+
+static void msm_gpu_drm_unbind(struct device *dev)
+{
+	msm_drm_uninit(dev, NULL);
+}
+
+static const struct component_master_ops msm_gpu_drm_ops = {
+	.bind = msm_gpu_drm_bind,
+	.unbind = msm_gpu_drm_unbind,
+};
+
+int msm_gpu_probe(struct platform_device *pdev)
 {
 	struct msm_drm_private *priv;
+	struct component_match *match = NULL;
 	int ret;
 
 	priv = devres_alloc(msm_drm_priv_release, sizeof(*priv), GFP_KERNEL);
@@ -1201,13 +1216,21 @@ int msm_gpu_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
+	/*
+	 * The GPU pdev acts as both the component master and the sole
+	 * component (added by adreno_probe()). Future patches add the
+	 * GMU node as a second component on this same master.
+	 */
+	drm_of_component_match_add(&pdev->dev, &match,
+				   component_compare_of, pdev->dev.of_node);
+
+	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
+					       match);
 }
 
-void msm_gpu_remove(struct platform_device *pdev,
-		    const struct component_ops *ops)
+void msm_gpu_remove(struct platform_device *pdev)
 {
-	msm_drm_uninit(&pdev->dev, ops);
+	component_master_del(&pdev->dev, &msm_gpu_drm_ops);
 }
 
 static int __init msm_drm_register(void)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 107d0efb62ce..e70fd617f1e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -529,10 +529,8 @@ struct msm_drm_private *msm_drm_get_priv(struct device *dev);
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
-int msm_gpu_probe(struct platform_device *pdev,
-		  const struct component_ops *ops);
-void msm_gpu_remove(struct platform_device *pdev,
-		    const struct component_ops *ops);
+int msm_gpu_probe(struct platform_device *pdev);
+void msm_gpu_remove(struct platform_device *pdev);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.55.0


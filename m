Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380231;
	b=LP0ftKm8HnGJyTQGoZBm026yYZDKeK4t1tsVUajshXCQrj30oVBSkPncaDCp7RDmcd4t
	 7os1IRCPfNfu1y6wzDfveKm6LpGFeafU/OIOF6MAAv1JDjReXzFkRNyFdVG2Qfu2VxCz2
	 MA45c1ZVDHGyybHs6Vhs35nbUyZLxhesAcq+rVAEBBsXiHudttLwxjIaO1a/wafJL2PcO
	 6pyXMM19q1cs33Hfx08x2opbS3sGuLJkTvC1hWZVjv8zbDjzuqalW5IFwPo5xBcKYCY/Q
	 ttwNnHjujkiDthz5Oco1ijc8jz3Fxlj8Sr4uLC2U4SCKhsM8Dtn+EMNuWQSdh67FdjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NqysJ98XcrozyZLY/2WYGT3NbR4IsTCmWWqG8pG6dWU=;
	b=I1PYrpCab1DjVuq485o4v6fMZu5PMdkOCVidm83uWa+Pui7rSBYfjFSeLQKpps/auZBT
	 tvDDFlLt9CAx+2Ld3NvKDiujr2UQl9JSTsIik1xEcL1WHs9Hs+BWKn0ThcJUuLyim1rvb
	 7foJJ01j7nZgW4DCGfxKYEGdPPsomfkpuBIVkAj+V1flpywKyXN0rXIVr3LEiHzMbMf/n
	 EfPBJeuF7UkfvdduUiwq+7PdyBOIaLwoURzPSZimCbXY0I/6TJmMmbK/UD7zawNir6h6e
	 hmB4EZSbLag0FvYJM8cDthUulIh0idGNB3DDRmSH9aYsLAAr/iHtlxHzTOjRSR7cuDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKc15qTT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZMQGyAP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8178C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKc15qTT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZMQGyAP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UES6k41954133
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqysJ98XcrozyZLY/2WYGT3NbR4IsTCmWWqG8pG6dWU=; b=KKc15qTTp7wvMKJS
	/KFhsGFj29Adakf/hPTUfl+XR6VmdIi8WGyziJE63xP+8BCLQWFWclcmWMXv2aju
	Zo9gXE5HKw0+9cvS+XLfLicLcDLxgYUuSyKts1PppkP3Wwfhlb/0bZP7fEYn5liG
	0EhWv4rzHB1UCegYw/uzvmD3i8IeXG3F6kWFGaGNtmDRgZmFiSy8J+Ko1e5wkxys
	5aP8IJ4dkp0/H+PI7xltNDxCb6C/BNW6WXrImN/PvuGKHsWFley0q/NMCiq+kFt+
	YwvIZ9ZV1F4yjHx5hgKjK2S02sVMtobqa8xIINeJMVQhzPVY1wRO4POjcBklvokr
	33Zh9A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pm5f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2193786eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380230; x=1793985030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqysJ98XcrozyZLY/2WYGT3NbR4IsTCmWWqG8pG6dWU=;
        b=HZMQGyAPrnjmlT2QVmzj5nL6s6r5sdBppS8DFUerk/FQiHYU8O40vGxK6jga20SthI
         T01z9TIJnronunqC/HpuWBEeZtx8kFv4BzbueAgfY8lPR1Qvdum0c81yfSvuFCNrlR25
         +GBOR3XtVqeGCtALyXKysHjJXm3MScyujP+tZmo9XMtwt+Cz/Z7bnBL0bQOvnILlRTkU
         h/2wGzEGEBKJMCyY2C6gmL3sM6nwgS98UHwQm26djhzkZZxKlSClxgs76BmsSoZSjap9
         grzSPR55Sg4n0yjBmSfAe4tw/yvgU3Or5fhJv40NAljVFsqqIu3rTK8htcX3d+4W8ooR
         0hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380230; x=1793985030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqysJ98XcrozyZLY/2WYGT3NbR4IsTCmWWqG8pG6dWU=;
        b=vh3UPp3WlJhuQuRFgRLQlsh+FYYCewkD/g8rUC5Rxd/9lmETp5KsPwldZM1MIkuBsc
         YpNtQWucFqh//Fomky2fX4/tGuDIPWce5aXIy8VrvyrfH8nLVMTcKf3stC72i8TNdgP3
         D6oWZw7NkgxMcfd4pI3tpOhtnvZjUtda3YLS1i2BxeMOgDFI8IRiaFvwnN0J65qvzRc8
         +dQnXP8ECATNgPJAkmaUNHXx7hpKNGTyps/aEFwXVbRNnJxSvU1X0dNyVU9ZSiABtHam
         9usD3i8+3sDn/8r4dVghemNUGOTye6cNewG2/JaLAljTlWLcd96T7luxqGAt0t6S4gqs
         bmSg==
X-Forwarded-Encrypted: i=1; AKwUvBzm3428siJD+YAhltFftZN9c26wOniKoRRy7hub3PouSxm+rEP+K1cZHlMCzrZAxP6Xdjyq3Xt1WmvTGvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4TI6wNFCDHeOIwfPOJSHeXF5bUm25faw+G7l2xSOqsFfWOfWe
	Oe5tRoWS+w6A/W+v/8Cw6IWENkzipdmjraCaRw7umxNgElyLlrpvgw+38m1OODLQN48rfSZfJXy
	YLhySSG4PPD2CstCBelrrK3OLwvN1U5azML7a5+aDKHpleMrXgZLqjrTjPLogPK3cS+0=
X-Gm-Gg: AYBFou3v9V1mdcFCEkFm10ZE/WGUUgQ9b9DF6O7r95LnmDQNPJCWJjT+o+OQgqSDzKd
	WnY8+dWN5EBjoK0WmZXDcxld21L/rCDuNPIeKTEg0v0QqEE8Yav+YtFFhCYNDK5bNBpmNcIpVT9
	LCOCKKP9NNuZcT2KcHs0Dbd+MrUrmsf1ClzwbzTWxWDD7uLkDOtZiclKtfIupQ49wcvlymIIzGM
	WqFFHSd87j81vRA4ayUn9PvotMkWDt4fiU4Y4OHcWvXIRx3Lc+9YIF2eWSxSGAA+kBok5qU0sWj
	J/JcubXc4mHIot4fRploVW69sCgnRatSkHJC0JzF2+5IiEJz3Y3FaxAZ9AA5jx0KdJnmJYLkbCu
	G6fIvjKPFIE3YOtzrusbNTr6v4xs2Dord6NskKLzDsUN8vnV+Hv/H87HnyAcZiEEWzEn2bZ2KTg
	==
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr3643708c88.41.1793380229607;
        Fri, 30 Oct 2026 10:10:29 -0700 (PDT)
X-Received: by 2002:a05:701b:4509:20b0:1a3:9936:d11e with SMTP id a92af1059eb24-1ac5e6007a2mr3643671c88.41.1793380229048;
        Fri, 30 Oct 2026 10:10:29 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:28 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:29 +0530
Subject: [PATCH v2 8/8] drm/msm: Consolidate msm_gpu_probe into
 msm_drv_probe
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
Message-Id: <20261030-gmu-sync-state-fix-v2-8-89d3082d97af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380169; l=6057;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sONlzsPT29UAeBqmPTtdX60UvCZl7+AmXROlA7B8TK0=;
 b=Wan5DlUHIgj5ZMjZoOWy7AETlH0P+Dg0NF03vz5Gx7628wEF7YAS58IASRYgG9b0Oj0QC9OW1
 3rbCl83bwGPBFRMRamrvC8W+EJN9jzuEwC+myfjEnILg2WQFy5igWNF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX2mX2694VaAL+
 iuwxPEyadE6oFnvFk+Fiw0YwBeBqvmoWU8AeATYrkyNlwoc953d+K3V5Kevek/wN7ohkmLghqlL
 iCNaQqIB90ap/CFguBq6pjpulx2Hk3h1FKBZJ1aDIyPHa/ZWwHeNAm+/B1isKM+6T7nU40cNvuT
 78aukK5roUiUf9m4Q+0gMRBwV+D8olsvgCPAeRlRQkmq3tGSk2Bix1hQfkY89LZHvIwyi1so/3a
 mZhS9/1oKfTDSY4bsPONerh7ErrhMwEj0le8ofCJ0XmlVqEp2Xp7e3WX6VYUg1NhCHLHRRk4ib2
 6pT23MI+KLy2bCcTKSXwSrGI8hC6Pwif2J+boFiB+Ry1L7/FGpzp4iz/Y4EP9Zz1hE6sNDd8AG5
 VHfI8xK0+C09mReXwQaMf6rOogtPEnReyZnDsBuDnueVCM0/6dAoe6eH7M3dxVq7S3ZIGSEbEs+
 lvzxi69l+l8Y8me/axQ==
X-Proofpoint-ORIG-GUID: JE0dRfMidh90yRjt2N2y_cAJlLRol0jk
X-Proofpoint-GUID: JE0dRfMidh90yRjt2N2y_cAJlLRol0jk
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4cf86 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2p9jR3MHfXHM8ZZsoHgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXzAPquc07LBpl
 jy2ZD933IsZpd+eUnwYQX6FPinmaQTPMdYhJbcyb0ufO2wJCtOTOBNN76J7B7ek4zdT/wwozLDW
 VIRUm4+ZE96xqlMUy/kMfLdYUdz+lhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

From: Haitao Xu <haitao.xu@oss.qualcomm.com>

msm_gpu_probe() duplicates the setup already done by msm_drv_probe():
allocating msm_drm_private, setting the DMA mask, scanning for GPU
components, and registering a component master.

Reduce msm_gpu_probe() to delegate to msm_drv_probe(dev, NULL, NULL) and
drop the now-unused msm_gpu_drm_{bind,unbind,ops} helpers. Extend
msm_drm_bind() to select msm_gpu_driver when kms_init is NULL, and relax
the add_gpu_components() guard in msm_drv_probe() to always run for
GPU-only callers.

Signed-off-by: Haitao Xu <haitao.xu@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c            | 61 +++++++++-----------------------
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 5 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c044d3c9737a..4e5ba85317f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1423,7 +1423,7 @@ static int dpu_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return msm_drv_probe(&pdev->dev, dpu_kms_init, &dpu_kms->base);
+	return msm_drv_probe(&pdev->dev, NULL, dpu_kms_init, &dpu_kms->base);
 }
 
 static void dpu_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c299fef1a400..ad08a040982f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -553,7 +553,8 @@ static int mdp4_probe(struct platform_device *pdev)
 	if (IS_ERR(mdp4_kms->lut_clk))
 		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");
 
-	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
+	return msm_drv_probe(&pdev->dev, NULL, mdp4_kms_init,
+			     &mdp4_kms->base.base);
 }
 
 static void mdp4_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 40b4415c0fba..067e23fb9649 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -858,7 +858,8 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	mdp5_kms->base.base.irq = irq;
 
-	return msm_drv_probe(&pdev->dev, mdp5_kms_init, &mdp5_kms->base.base);
+	return msm_drv_probe(&pdev->dev, NULL, mdp5_kms_init,
+			     &mdp5_kms->base.base);
 }
 
 static void mdp5_dev_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3b6a5f8f54e..9eb5d182eaed 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1129,10 +1129,17 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev,
-			    msm_separate_gpu_kms_components() ?
-				    &msm_kms_driver :
-				    &msm_driver);
+	struct msm_drm_private *priv = msm_drm_get_priv(dev);
+	const struct drm_driver *drv;
+
+	if (!priv->kms_init)
+		drv = &msm_gpu_driver;
+	else if (msm_separate_gpu_kms_components())
+		drv = &msm_kms_driver;
+	else
+		drv = &msm_driver;
+
+	return msm_drm_init(dev, drv);
 }
 
 static void msm_drm_unbind(struct device *dev)
@@ -1146,6 +1153,7 @@ const struct component_master_ops msm_drm_ops = {
 };
 
 int msm_drv_probe(struct device *master_dev,
+	struct device_node *gpu_np,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms)
 {
@@ -1169,8 +1177,8 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, NULL, &match);
+	if (!kms_init || !msm_separate_gpu_kms_components()) {
+		ret = add_gpu_components(master_dev, gpu_np, &match);
 		if (ret)
 			return ret;
 	}
@@ -1189,51 +1197,14 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-static int msm_gpu_drm_bind(struct device *dev)
-{
-	return msm_drm_init(dev, &msm_gpu_driver);
-}
-
-static void msm_gpu_drm_unbind(struct device *dev)
-{
-	msm_drm_uninit(dev);
-}
-
-static const struct component_master_ops msm_gpu_drm_ops = {
-	.bind = msm_gpu_drm_bind,
-	.unbind = msm_gpu_drm_unbind,
-};
-
 int msm_gpu_probe(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv;
-	struct component_match *match = NULL;
-	int ret;
-
-	priv = devres_alloc(msm_drm_priv_release, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	devres_add(&pdev->dev, priv);
-
-	/* on all devices that I am aware of, iommu's which can map
-	 * any address the cpu can see are used:
-	 */
-	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
-	if (ret)
-		return ret;
-
-	ret = add_gpu_components(&pdev->dev, pdev->dev.of_node, &match);
-	if (ret)
-		return ret;
-
-	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
-					       match);
+	return msm_drv_probe(&pdev->dev, pdev->dev.of_node, NULL, NULL);
 }
 
 void msm_gpu_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &msm_gpu_drm_ops);
+	component_master_del(&pdev->dev, &msm_drm_ops);
 }
 
 static int __init msm_drm_register(void)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e70fd617f1e0..b65702ac0140 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -532,6 +532,7 @@ void msm_kms_pm_complete(struct device *dev);
 int msm_gpu_probe(struct platform_device *pdev);
 void msm_gpu_remove(struct platform_device *pdev);
 int msm_drv_probe(struct device *dev,
+	struct device_node *gpu_np,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);
 void msm_kms_shutdown(struct platform_device *pdev);

-- 
2.55.0


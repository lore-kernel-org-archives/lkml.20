Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380186;
	b=tRqBPq1jLfxujn4Oy0ZASZVrkOz4aJzz26eNvzrAGmtmXoUpj4vP22rJ/A+bZEERAS1f
	 Ns4mzaYEO/+ebUXSq5+Us5akCCdEDaqzC1oTxVTjmy3k7X+oyQAfN1orjozeZ+ZaB9CSe
	 qJmw/XLQPSv5dOJ1CYulEU7rt6b/v4z6Dyj/5IoGrFh9HrNERQE94CX3mi+0XuC3ypN8V
	 +jqdmkta1jUogcePecIZ3jTNPS2hjEsB64fhqeSXFgD3Nzyiv3H85dPxsnvEtSFFkXCod
	 TdB3kCCsGAKbUSxc5f95o750vuH8Ep3lrua4no9rDwdl0rTB02BbHACLt4anSuVwOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
	b=NQcwTgbL/usOD9QKfOlxThLCA6zpiqst0jzHqlV8GaJkHBOpxzaQ4i27WEWn/dZhvRlz
	 qRAxl0GuVUTQAAd4siQCW2nFPHBXyyx54hje74ISYv2amso6mnYhIYShrTIKdkOiOAg+9
	 hEiSkD3KbOt/qEZkOhwMUuGWiS8QJ9dzfOcnyCuH92Sr14NOq2x6x6Qzl5rE4nwDpnbqQ
	 z7Oh++kSRetR4BHZ3GalScKIpOlxZC6TlTo5CJQdlnHo6JMPlrn/prLK0wnfHjPEhnWw9
	 MrovRIlqeE/Y+zQd0fH8ZYOryd9bg7XYHitBUs5fjMRJK2R6JAbclJJOWkpKbflpkEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m6ZHmLGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5UbC7Ou;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BEB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43BEB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m6ZHmLGN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5UbC7Ou
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER8gc3552208
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=; b=m6ZHmLGNyJ2nn+bg
	VkIEbxDtWdCFX6ztB5uVioliUHo8SAtnClaeB2ibGq7wRxB2d3jXgL+rSP5L55rx
	elj12CqNDZc7gyXU+XVw8tM5ABEYXNBgHcp7cgC9WIVZTZjMpSI7K9bD3M6hcBjJ
	xtpgcX7DOq4siAz8cF2KIU1b928saqkRAH3fS21c6Zf01gr4Y9GAVH6Ztig7Vly/
	0ZD2cz5n5+T8k+d2kUZedYtUKRYh6vQ9HnFj2nXS9f4kh6FuCm6ErGfi/xWzuxe/
	v9brjGt7KSACuO6pZleB40og2HSIMpyixdMsvwLPu1k/80FC8ANWZd/SgxGVgqrn
	bdRLCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm2x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2284628eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380183; x=1793984983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
        b=T5UbC7OuhQXZUhHXXTyy4XlXAVhHF4r2++Lynjqdh+VR9HCCn5UfYL6Zz4No8JNyb8
         JW0upRXKJyvqkQvN/mw3wgBixJsbFrvT/dk92UdVNX5jNt+03ovb32zZ7mvv42TfDtFt
         MP91oHDfOpNr3EMMRJxbk9hkPwiGYTB8aj1kkUnxwWzkjLD08pcaLI/g44VM2nRHr4Ug
         pcyDjc59Lns/isRtLQL6k7EZlGM/gGV7amZLy/qExIARs9/vDRH3N3vdgG8lt7jHEgt6
         whKifhN8/c8JyhhK4wx1ExKsNDWa1KZiXQV4HlJU92ENdoP7guEk/xiKXtuYkqhV9Fow
         CbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380183; x=1793984983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pKgN+iyHM+dHZqnvSBYkvdG14OZA8VI6MFzP84UyBw=;
        b=MfKer7DIu2rhJNcyayBo5xn9uNewm9RjbT8QlYzBmR1FAbnk0vtlIbBwP/P1a8X1ys
         gwZcg+KBMX5fhe4x3ThtBNYph7HBsQkaqGvgcy+UET05fV964r74i9O92pU3FvYoVMm6
         ldfzLlnpk2YkySeo4K04fRs72U/byolCw5OnZBWhQX99FWv04B7khx2ziAEAnfOgxpKo
         JJkbCIzA1F2Qr6QxTtwFUNZyo95CZgjHVtrTc2IVnujLWR2qjmKozoOJdlGgjl4ks0w8
         n5Di28x2cO6QV42jFz/6y5Tog8DKf6XfE+4KS0O93Mdf5vUXOHg5HL5CY2RGxA9AhaLI
         0xnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDyujmvrDgl278HiVxVfwQAeTLxH3eSAIBnW/5o1GnkSsgITE2gB3ZfI2B9ZmuZmsu1NSPxSzv7pQKKn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8xZCG0k0eBz8ODkGGyboQ25HuFG8YNPhnOmo4i828wlQn64Qx
	UadIovM6g27GuX4ny4Aq6E8NXrM3QeYkzzn0OZ5gQntTaYFkXmwUKkyvfmcHWui2boPCbAyJJdq
	x4enPvGRGZxRM5rVoCrojk0bQqE/oxGpTSjuQ8w3/7k7hb71bWmhdFruwBMy6B7g8+wU=
X-Gm-Gg: AYBFou3QsjFuK3IR0+Vmdp4R5ItyioJIRWbHIt1YeBurix/Ohfz6o6mfG+sUOx1QQAo
	GrLnySRojwXj3GpN2bw7hVwp2oWeXiw17OI85xqa2d8Zumg6FX7zfScwgMrCQHumDeFgJf0M0xU
	xNhbgNIGAYxMom6OeE72d8e/njraPxst2UwElS8XkqMUUJ4gSWivYDmqKvRej2PSyPB1ovr9X7N
	DVErI/3Y3FW3oj0fR8zLgfKxCGIZ7/SicEx9Sd5DwJV8PN2M3IpFMK8RGa2oAGn4oKfBfS5iRcP
	9fChsMl5vOoU/ZN5GPEie2PXgcJtyeujics5TpcLHSrkd3Sudj5/Gc5fWHq7oZzcmd+wFZ8ba0w
	Y4Je68oXkwKhTx/EJwO0TXnNew3PCWidrHlF02f1Tj7IRyYl5K4Req7krdu/KCjJOOvotB9bfiQ
	==
X-Received: by 2002:a05:701b:4586:10b0:147:a685:912d with SMTP id a92af1059eb24-1ac5bda418dmr3749228c88.29.1793380182921;
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
X-Received: by 2002:a05:701b:4586:10b0:147:a685:912d with SMTP id a92af1059eb24-1ac5bda418dmr3749206c88.29.1793380182465;
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:09:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:22 +0530
Subject: [PATCH v2 1/8] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
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
Message-Id: <20261030-gmu-sync-state-fix-v2-1-89d3082d97af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380168; l=1507;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cUPrmtdLtvyA8qWNZ70NP04TMjj4fezEiP2SX4BUv2M=;
 b=SbxIO+Tep6mZX6zixBFP60UBj2aAFuVRJTvvFmYsQYCr1b6bBt1cRMncdsoIVf2mN4XV3DRSU
 2Opr0S+GriNC3mU0WnPNGK7zjNo5vrlVCOLvV3dyux89GC9O1NQJQB6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: avgZ4XYp2nN6LcUrWFHGZ6PuqA5KOhoT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX4CikBf0+XCCO
 rL9iCnEON0wQWVH9mNfXYJzMiCrEJxWXSkYIhTxH9aRZCMWV+uHOLq2CNbur/0mjoja4CwW1MgK
 Js2uMN0pK+2GkIPqdpxGXCt2WxlpqCw=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4cf57 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K84Zv5WaSeujtAAFOroA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: avgZ4XYp2nN6LcUrWFHGZ6PuqA5KOhoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXyAI3oImr7ExP
 LhprOGkIYHkwazEA2Z4UezdAddaFm2RwVAnbgh5m5mL54HnMjDJlbyO+aYXdfWt7LjguP+/n+D3
 tmsMQ/e1awvQ0jTJGSCRx/BnSqtIZWUJh682uYckORBS34wWGMwWjfBu28XfHnvNjO8rs+XiD3S
 z3g7dc0Urfud+NCVHpBzjUp9nOnhA5DOGh0aSQUPkLQMF+dYL2F/1LuNncAGkkMPFmRygJFvQbd
 5b0rGAHt7yaNbsmCwA6+cjsNcPhYOZZAmeTC+Fv+u2zJxmsaXUl9vxvjV/flLd+PaAa3FrmPYaO
 eQZCyj8wPrT71ZYLGkoRxgjJVn/MBbqMHStGbAiUIFodGv6E8/7OcP+ix+QIuokQb8dUXOiLuA0
 1pqmnJrGLrgYaAh2Njetn0kja3xBt3p4jyriIzD91gsQsCT8UJsohBeXdrRAtKe4JHm9bRROLpn
 PBTZan0lxgNsBpP53gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

adreno_remove() decides between component_del() and msm_gpu_remove()
based on platform_get_drvdata(pdev), interpreted as a struct
msm_drm_private *. That dereference is wrong because msm_gpu_init()
overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.
Use an alternate check similar to adreno_probe() that avoids this.

Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7108d4aa59b5..1798bb12805a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -282,12 +282,13 @@ static int adreno_probe(struct platform_device *pdev)
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
 
-	if (priv->kms_init)
-		component_del(&pdev->dev, &a3xx_ops);
-	else
+	if (of_device_is_compatible(node, "amd,imageon") ||
+	    (msm_separate_gpu_kms_components() && adreno_has_gpu(node)))
 		msm_gpu_remove(pdev, &a3xx_ops);
+	else
+		component_del(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)

-- 
2.55.0


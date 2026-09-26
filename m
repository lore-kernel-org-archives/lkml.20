Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9354F3911A8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404527; cv=none; b=KnjH2wPmPI4qCVITLW+8sNQyYGsVvqPiZrX8NaarxYCTYhs7Kvy2Lqnp804LOkUAHB9zHcmQ7qkCPTMEHwdd3m6zgbG/oPhZho3ggs+75FRmhOHlSOm53iR/+UyQSrUj7cQI3Tu8YWM68g46ssCNi/6tx2ih1VphXV30exHEfY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404527; c=relaxed/simple;
	bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+nSClh+46DsvlZVW6T2/w7zwGTnh5StPTKs214znFTxaYKnGZ+bV8OqUI7YqMgaAldsw+rQdNUj4zM7LolfZAGGbK42HSdKwgoelIU1CgFNnZgy1D/UXssOT5QCJtIF9VmPms5y8PjhQhIoHll975MZdeO/C6f4ZJGYRbhl2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvR/bx7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyQrjvfS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvR/bx7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyQrjvfS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OwMb3267892
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=; b=WvR/bx7xA6cg/5QG
	CGjdZX3ivwO7uwmiG97FC9fd49lpN7cjcvyXxGgGrdoYXGtW2n1caCg68wPEXrQT
	JSoAOlp7TbaAU1S0VEFU04qMjbQE1sJ90/gxC6l+3nKCYfBnPiyvZQzC5eP7ePDi
	Josc4qaef6dbY5tagV480CNnuG9P4PW3DJR8nvZ4GxZYHHtL01xEmvhI1///23xP
	whGLk4HpR3R2Zs9kQcxEDTuaEYLuFetywpEKpApDjmd6O/dgcXvY4SpzEN9HtSx0
	F1C75XOV4D3axqVw8z1hgyV92NhT5Qz7heldK3gOROo0b6YryTIeFSsR7Sz0jajL
	kVPdPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0nd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342b66c0b06so695434eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404523; x=1791009323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=MyQrjvfSE83b0J3rXkd0oKoE3wYpx4lk0DIpIg/n6cn8csROB83CU0q0WLvl6KKTQ8
         hdOeKJ5mEztU/ZrhwdFTw6zoTj4EgleIuDsMArF7hncxXXGFsNsb3d7WC5AYcxu2/DRi
         y3s78X1M+k7V0DX6hu+x0IjrNVU8HgRw1oc45JA2fgaTT0apV3ruwErim/FcBailUjzg
         Ou35jDshEufc99a70vUdQXbeRkrl9OBx/Cr0DMiWRbnjy74lmqNfPR/7mJ7LC2ZUcdg2
         pxKxzwwoe8qW3FVEkMMIJ/wdlY4CCYfVxYjkU9Wc/blWnJT0nAuHqBnPfdCHU0bTHIF/
         GnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404523; x=1791009323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=c2H/FhhCRc0cSZ6KBx0cVITO4YVBLkSZTPlkdk34/Q0HDYcSPeQQl9ZJumDrCLjVBT
         iNZBe7MeYee2XTUqnr1o2DV/hA9IB8hY0eDyaRy74PDqvM6/wpOf2EeTMYZt167iWCho
         i49SHTyquG1LWQwRjizWrSTjUxdUzmlN83rYYpTW+XLYBlx8DjGfMSbRWAHiGPl4UaAW
         Ki0yyruciWd7Du3/kgW8nmfRq+G7dgj1JyrVIuGoCnlBVeN1mNzqXlZ/6UH6cBlNzOn4
         ob1iluFVmyVrROKSii6H8yskyulj/DfLI7L1gdVOjvUZwaEcvivrk4MQHXe051Qcx+kc
         vPqg==
X-Forwarded-Encrypted: i=1; AKwUvBxuKaUHW6RJ3AqM5aCOqy7gYUMa6DwQJ9Y0oCazrCGemuQL6o/4aOx7Cijo2wIP/PnVfTdPykb1sJ0OcIo=@vger.kernel.org
X-Gm-Message-State: AFuF++nXGv2pRH9s6Gbm5+2AlZoi4i1hWoGY7AvRUGR3D167tRt2tm4R
	8DeJtcFPmbdHjgWk9QwXXGR8eMqK0zimMtrE+JQS7CJvU8G0FxXPJ7h93WhCFZVGFgFCUHlXdMC
	3F8KtfOfYhRinovRlgG4xWItoqcE61yEwmwh7fsVMgPolLRyhhEBJpN+086QR2lHduBg=
X-Gm-Gg: AYBFou3RZHsGTiWg+3UZiXpToXPtFfaB6te3w11ZRPZNqWKwzidx/c8ZYWnOqjoF1PL
	NE4Y9XUstVIVmeklVBhq8rPYZYdzPdPgaZQMGjxyJuc7bcRTlqJGS0169r+Wr8qkW5PIp1qHLur
	fC/mdIRQ3UyuV4TD2RVqA15OZ4L8+/xTVQGdtBgdLMWdOTc4BGbMfaFuay2lWA1JPn7tUu5QX5n
	qDkMniL6uUItl1IfQYe9eGfvAdm8B3vdxyfBSjUqY3CU9K7ljKs8xN9FgtWPBK+kIvU8HppuY5M
	ImqkXqTkrh3fcQncQ20RmEuVbLA5T1P/1tOa7fBdwSGVq/hGVfprlMJT46YALDfhQ8ccOS6D2bO
	D+X9cAezp5or3UHwRgNnAJyhlwATh7Q1/pA==
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873684c88.6.1790404523059;
        Fri, 25 Sep 2026 23:35:23 -0700 (PDT)
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873655c88.6.1790404522317;
        Fri, 25 Sep 2026 23:35:22 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:21 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:06 +0530
Subject: [PATCH v5 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-7-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=1806;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
 b=aTqmwyfdbwKoeMl31qn9fn8d/WIqjVmq4VkgJAeoaw/HXo1bp90GA/WRWEOOP9Ty2MVmVeS7G
 45JC5KMPsiYDk2FGCR2jaytaTpGPRzXzBq/kGzSG0HCQj46VCQazbHD
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7hQd+vY/AdRA
 +Poy54Gm7wYyhhphFtWIG0lsVoYM7s2N0C0q1E5IxXdSVjD8hCnTJ8IWLwjR6dE4mXzFYbwrRe7
 To9X/AgTZ8O0ePGLrmwRwORJAfHbdr5Yzjaq3Fr3NWzVXKA/adIYF5I/peEkqOPUO3PAU0YhFvg
 mjkjaR8HeoMpKG+rcOiDO8T5gbRMfGPKyrbXYEAY/1pZxh3yhdGWPHTMvk/ZMsyCgPZs+YG4ite
 pQuDmMo4FJF54bPFyn3vaTiv1Ni3TZ40NEEncoxtMnM4j1QOvFWqsUFuWHkRsT2dpyd+3s2qQgQ
 U5cmIIbinmHmnzFVfK7NSyrswE/Pnphx4MJGFw/M+D1TB5KGRBPXkaTaHQNXXN3z282EtGo7rDg
 rNdmjulLi+rXnnqbJyXn2VbBTW3A+2GGLP6xM9yZ5znnag81hJTcouW7TyhMXCj3ZwnWUIkIMV8
 dOt12yfhoBFkKJ83few==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab767ac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ynuOL_q4U7mVYlTzBDdcRQJ3EGjGeP2Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX5R4d7YiUwk4V
 mchxtLT4AtdUuiLVShDTpHS1i+OVKbwMqdE1I+C3TFLsqbFYq91TLUbkiKKJKMmEJnHdaV/PstE
 zwFMIuZBeOMvXQy6IT+o6FOzqVQtEDs=
X-Proofpoint-ORIG-GUID: ynuOL_q4U7mVYlTzBDdcRQJ3EGjGeP2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. Platforms that have not been converted still carry "iommus"
on the parent node and keep the existing setup. For converted platforms
the mask is applied to each context bank device instead, in
iris_create_cb_dev().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index debd1f0e57038d7abf463e82fd80f887b67750e8..4bdb078d83b5c331869dab2409bc4d10ab302737 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,9 +352,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1


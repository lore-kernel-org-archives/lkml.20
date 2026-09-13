Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879B3F86F3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325444; cv=none; b=ogqxOY06dLIuzuQIOiQf8FD+cQSkmfa0F19fK3/fMMn9vbTnBNEMtvhktZ8BNDineQ80seLesBNSeHDbx7ONn9p8JVs6UOAOGtkyJL9gwtij/wAMiff4TaGFOIsBEKIHE0xhLOOkKxO7XC7OuSd8D8KQh5KVP2kt1GBHfbjtDmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325444; c=relaxed/simple;
	bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YB6SVmxC5rK9In14UxlrgmQ1fwv2pGtD47omNF9cJrGmfy5g0BZwLBW5yQNqOHNC6LI377ki5AjgHxr+sJHPYkmRr+b1hwnIsP1KkYvI9r+JNjoF0elzYlPt6QJkfBD19aMBO8YRgLW3no7apgsiYwUl5HX2sMv77HlvQJvaGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3RVJXJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJ/R/0cX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3RVJXJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJ/R/0cX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI4AB41932622
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=; b=D3RVJXJbDMef+7qr
	wM18t2813Qyobh3pgTt3yRs0+10ZMEookR+KMS5Vf0U7Cc2BS5oEg820O77ULNKS
	5YWWOz2cfDPrLsF0qAQ9NMx7PoG9KSyMUUErzl/Y16+GFTizs3JF98Pz1mU9364z
	Fi8IiAwQYdsWRQtBN7hbm1IYOTXsm1XTovJyuHNH2N91pbzY0ZIb6gklqkacEM4Q
	dlbkSR4yUm0RNvTfJ/pydKTivGC8xdZ+SMFHAkTLEfrN56pMirvUrrfked6ft2jX
	x8D7bGmu5MNbO0v23puZ11h5rtyUsQTf7pscuwt4mU+WDtT0QpakMtTz6++y4UMh
	CJDjQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3y6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc92350888so43156445ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325441; x=1789930241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=iJ/R/0cXCf9eujV0VQWX+ZcAl6rn82lu3iYlzxgwOmQsi5/iXDPrB47lbFmzzYjb1Z
         EY9iM3VCbz1+OFmrVnzfcKhPjcRLXqHBe9wQWwEO9djicrq1fxgrMrN8u6/MFsnlc4p1
         9JsRB7gqZTpm+MsyINkfsUKlCRRlKu9ekp0AIu9GVu7TBgNkNDHQsSw7X5cI9XZl6ckK
         mHeka3W2QiGyy8hoXz7tyYg9I0BmS6sAaL5L4lS43sfX53qmXwg49vy4cU6gxTloxVZT
         fPHfUSfWqHHH+D1G483IRObpCQPYM9Z5glJruANGZZkT0tFlCgsXiFh/ys+1OwEEvCOc
         Q2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325441; x=1789930241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=JwDiq37e7cbh9mG4tOlHBuLBhvMJsijazuzyf+PHD5pWgsQ8SyqeTKUHsIbcnjdTW9
         UNS0wvP/yRYPQ1ikSHnoGYCB9T4xM7Q2KPcDF9dmQQmcC6eo2PzYQodyNnghPD4+FWIM
         yuZHijJHkVI91STrWBohM1ZN5fDeeu4nh05PNDJNawD7M3cMFg7aEHIyJAH/9p1JDYkR
         qOxxbxKJJkRubAceL0lbc01Nxv6SrVagEgToVOJv9j6gNiihL9ZXGoVNR10Hwq9UU2iZ
         vbb6MX1Glx23xXahaSyuAbx4oEmBbCiNlgmcgmPjuvv5HnruNYr8D1p5ay6bXobPJR+i
         JHBg==
X-Forwarded-Encrypted: i=1; AKwUvBwnTIGy8bNu/8mZAX0bK1SEgsMyoWakY0Pt6zyUEh76bCzfYj5rnX9y+mKXTQ1rUddgddz78dX+AhmTO6I=@vger.kernel.org
X-Gm-Message-State: AFuF++nr8zebV4i5wpmBqvOQQSYpCkuGMMR5wLZfYjHgOBwKuxlvdFLh
	Ai308LQVkj18bA4EsP41gRua8khQxcHmBBs11KlT1On/b5s97ht+fUJXWcf3ycrW3RkVAWkF0rg
	1S5vsnn/5CmzqXwsSuKKE1ViXfnlyEN8dV94WvyB8hMtI6/pxyFX63k2kGI2SdkUNuJw=
X-Gm-Gg: AYBFou19xiSW7cCj6J7Qq+ASvR2B9DGpD0oadyuHPVARpXAUnWLt5iQKeeXJ2xwhK+z
	Xb1yrPXcZsMUBou/ArQbOB1/If3y9MajZbaohFG9XItv0QqTj5b+Sr2Sg9kqfzp8WlzaGThtCdZ
	/q4HO3PJ0p2sUtS/vcUvzvcAOrzuOGvewSkUr5VpQkE0yjcK1ijolvSHMmS3TS7Ygtd2BAkXX62
	BHKiziuln3tG08lig6JhgoowsLs2kPCK7YYmhVlt/nUEen/WjChR/NRa3XkhBm38OeeTjZ4Mjoq
	fJmyzlacqaybovHQRV/yLh93ghNmfYgkDEty8ie9pkRgyPTmybyeaIqe7Qxwj+hOKUDfISFJ0dp
	1yEGHaRGyBBNVRcIIHnphlRIdPwJf+K7sbpI=
X-Received: by 2002:a17:902:d984:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd2a33648emr270824405ad.13.1789325441468;
        Sun, 13 Sep 2026 11:50:41 -0700 (PDT)
X-Received: by 2002:a17:902:d984:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd2a33648emr270823745ad.13.1789325441023;
        Sun, 13 Sep 2026 11:50:41 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:40 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:24 +0530
Subject: [PATCH v4 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-7-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=1806;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
 b=b/OU4xVwL6Uy7p7LysRQLTjOXu92eavws+64eXUu0+bfYdoL+0OiwJJs9umzBS2comu/vew0g
 KOaqouqlj83Cjk5pDwRP/ocj3Qz9nsLuMW5i/1KTFwdM2q1Dnx7kpOk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6f082 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX6dBdBj2tmNxd
 WotVueM5Jb1NgPh3I07bOG61Q2ZZiZI6Wm1p+WUNw+bpnIG0CdVnnOjtuxMU1mugXkOPG7n87OF
 hKn5PSkik0c74gcF4YaSDZx59suTLnx04ebBjLae20SztAvEWZ0cyWVSGEFNw72QutMRjJEjw5h
 kSsJ9tHKQav9f8HKs3ARClMnzpajT6PfdMBsO5oXqx/kMpMRxuGbl1JCob1pQ7aAQM9vS7srwWE
 hoA9rlQGBgb1v9QwJkC+jX8z03GF5IOSSZ3ONl+sbzVr0I3xWCGP8wmuby3hMnx+t82nqqkzl+r
 WDTgOaOw7sqr4LQw1Gpf5YvrNRoIKzP5ySpPd5CkcwGMeeq26yve3ZBzPWo92CeLg0/ENrOtFAo
 CoMJKeZsDtTTCPR9jCKi7G8Kx2plUq14iV73t23jKdQo/XA8FVUKc3n+OsjA3RfhaePvWbBIdLz
 egQsnXqsHxPvWQwmlsw==
X-Proofpoint-ORIG-GUID: DjfAMkUf7LgH_bbVaGz_gX-NDrDrg_Jy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX9itoHeal4J4l
 nzyKoah6KDgk5HP6ybC4C9hBYRm3InQ4SKe7kYTcsJtxueaiXqfbYidZ5mKFLzCnzxpJOrAzA4B
 j3+xj1wG+yvy7EaTU0WC0Vz5nDqPnbY=
X-Proofpoint-GUID: DjfAMkUf7LgH_bbVaGz_gX-NDrDrg_Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

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


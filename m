Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7074448D16
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938310; cv=none; b=fC0jWwESvWqUJuwnWY+Alc1mjANxF19thzWlVH/p0b2tdW0+4cwrHrA778I0gNb+cu5bfwQCSIi0rGurquLUMUS7mowWp2uZvaZDn1HKbuHZnEBxPuQIdwzXqA4zHLKUIsBA5N3rASzMuXrcnTU0j70HKhkyAFKfCFYkkJk/oZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938310; c=relaxed/simple;
	bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cim/tg59vwJny962mz5Ck7TbkJHwCnUiRwxXxR6+JOwPj01xJT22K9sikwYHmyhpwDE/oxuRErIgquEJP/WX3J3IVnhEwYA3QCVGigYtZ/mv9SOzH3hpRedXPBzsc77OgVZsTIPFq0iO5YNL2c1gC6RRqjqbFKurt+w/pDMbueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnpacUt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFtXdwDb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnpacUt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFtXdwDb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PpeL130682
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 07:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=; b=KnpacUt5mqKfOJu3
	bP8t13P2i4Xmj6GSMbWq3DSs7N/YCV/eJXJ7qZvEHLyy2BibcePHv+U6Qkql03Mr
	53yRpjX/BnT2M6pMx4NIOywjGkUT62bquRhmDomo7l2kOcF6BQkchJnag88xNk1Y
	T2uLoPzzYVwcSGCOZphxOiZoOSwkSpDe0moWbxXNu8+39zK/L3wHSY52/pQSzbN5
	kcsIhCUGd+RzHZtma+Mkplq3PnRngPbEPzz4m2b7q87qKKLA/ly41OppCUPsL5qY
	VPj/aCMkr0ZKy1UUAtgt2LQFRWtXM0zxegqR3guIM+MjaJ4BGcoR+eDixeqltaVc
	8DtwGQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntpk9aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so7430011b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938307; x=1789543107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=bFtXdwDbh9BtjWQfpqouEdZkNkOJ2QYEb+VFuI9ClORVTTnk4LjIfBb127my0fiwcW
         N3u/c/DSBvfjZlQKrBBPLaSBSPFnjfAi0C2L9npFNYNDjPywC/Kl/2GfmsCAzCkE9kwn
         SPCaiYgssK9h5sF8Emxee+VwukySW6PsEztI1peCnG4vGlE3d779sB/1voa6G7eBgS1V
         4nknSVC36Qoltb0njQN4QoGzEu1Tsr2GofB5UdtpQbDnJi1BmVmMfttfjJhHa7pADrah
         zZOhOR4L5a6jsKY5iTzqnvXNngxHSwUj27OWe60Jzru6XW/+rfn6QrYm+PP7xdR5lrTP
         a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938307; x=1789543107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=Mo0GQ//lr2nOTnVe5oHRZdnUtQVtkHxowesAz5wtxTi5tqVuahn4sSWHD/Toa4Fp93
         LnskGswQWT1LKw/bxzoQFYaqrgG2O/AxMsQ4T8Y07n5Nbvfxu2ypoF+DuB6RRA3DiAFy
         m7p9IZa3s0HemR9qEeEShTFeQDJlu8StGOKYrxpUKKU4tWV2VKBmiO4lNlPiUieVvj4M
         SG/5K32HU3wyi26NILmlcn4NzfukSMxrYas2bvZYv6GFVjgFIosQxmTqHfwlyKaN1CLA
         yfZTQFhh2Jucqe2IC+8gCi1xqo+0Eh8CTq2SLruvmNbOqwYgmtN+4Cx0W16Jeb8UHr4F
         B6sw==
X-Forwarded-Encrypted: i=1; AKwUvBxv+NBoYiQJX6tej8zUa0hRqm2mbgzefz9Pefp5eRYSGjYjdq9uXXnhgh6javsdwP7f9rGhM1vRvovf8Ak=@vger.kernel.org
X-Gm-Message-State: AFuF++nft3hyxcg+ztE46qip6xsrGg5cNUXR2RD/ja8UribqlTAKYX5a
	5lWHjURbuDH47doJh6J854y6ii9SveVf9kax1RVy28p35PeMQ+R8Tx8glds8JaAa2N12D5LvlVT
	yT1a0qAvg1IOwWThXb1mtoBh7JFTLPxrrIUlunrYgjPxcsaghnVOc7DPVkMvqS8x8jOM=
X-Gm-Gg: AYBFou0RstfR8iokRAUs8j6x2AxCNRDUAGFjwWZKqb2c2FMDzOPn2/5ljgsOlX+dycD
	LsxLt+9u7D+/MPU+CengkZ+p0zoXuKdRpnTWD4YnDTy4PSyR0iZ0b5HKkhWL9vw2vbL8etmEs6h
	8kod9kOwWVdhaconszkyllzGS5hE7kjDLqcNq7bEWj2dx5PwsofQ/cQhmHZlnBd3sTptMwoSD0m
	NrYOLwfYF9eWTPKM2ygYbQNhoBUT1S4M4/+taC+19ez+OlVx2a+llVOTqUvEyy7onGRfZ0q/S78
	xHZ4uXbVpTUZpKyBLobs3JOzkiXZA/ErQO3yB5MAS1JUWwLyVXqhu5va7PmPnAdTYmx8Grpyt21
	0eUmXlyPB+NsJ0vVg3e+IV/BVeJpaIjgp29el+8++ghq7nIOnGVz9v/2AN9AOWijV
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778767637.8.1788938306545;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778708637.8.1788938306123;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:18 -0700
Subject: [PATCH v7 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-5-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
 b=CTu1SSploTT+XX55GZxz+qJyblrDe4SzV0qDNtolPeb3zYrAQG6gDezHjnMCEJya9FVDnlBj1
 dQMPH5aXSXcCMppAnvOXSxjQVgocuqwVYSy7FVIxDH3ordFoYBsJhMB
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX5cgoYuOb95DU
 bzHnMxmRSPIBHoWj4aUC69tiiopDLcJohLWXO/KMuC1V04d1X/PRUalVBhWZC8GBMrT9UWxwEj5
 zvHe2Z3vmbgM0WAA++zKzkiN3Pynwn8VL1OGPyR2WZgl9Wv5N62Zf6LgkStDaEDPtjYu49rEk5r
 mJXHxDHruVUr5bHLK/67aFXrk5UnDvfehgT7LoBPbCTECBHaSBvqmV8q27OIgcPPhz6E6qiy/Gb
 j2rhcepJ3BQeEaFZEOARJpTr7HVkBwsPgW8kPvAuM5lWfVdWkTM3rlTM3Hmv6BlsHvl0r2chbUV
 JA2OsuJdHvnz4BAr86Y+mbbUWX8Q2vMcxdPv8Kt4LOX3zXxizvebH89rWuhTjPKokJzVWSYO1m4
 Ys9zLJBiN0/OdIdDKl8j15hTf8ZHJhUrs+o/ruL3uYA0jlTNZyRBiK6P80/YhcnG6PbAk7K0K0y
 Eulyw+HAa+P25MH2u9g==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa10843 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: veFZn4Uy1o29fBfbCDkhpVGlguCf6xNl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX3bdOhWz3BBmK
 drbaFtq0+cKKFeY2xxhFd7XVyurvH9hxCgrcwLGWrvu65jEkcY+DyD8q3jFjDG9jSEUahnyowdf
 WMFBymgsFN/bmumrR04j7S5fFY4l29g=
X-Proofpoint-GUID: veFZn4Uy1o29fBfbCDkhpVGlguCf6xNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090081

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index e593386920ed..f67ef41dae09 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -121,6 +121,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,hawi", .data = &ubwc_7_0_hbb16 },
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1104A490C1C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246515; cv=none; b=caSvyJvCGOR2r4RgkFG319ng25dd+elS4k/ODs5hFqUdZ9pnNtJGPLEiFu7UBp52BElR+HUxQWiHPxzVC0iV3cQJ4K9KkH6ZvFeAIoP9Jf/TRNKKvlIJftVwcPEQbOGV04nqMDzMknOkLRl608/4y/itrFGrRHYUaGcMj1XTaNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246515; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N01JkEmBBjQz2Ort172ccQojF2WtiJgeArpIkr24HHihiDJWHfkT3lQzCU45/JOb8P3pT23YRDR0s9Ahj9mTj3R+Wq7x2mwhTZYyWMzUiQajgHiu1WfErSQwyKyGtBbwGIoaCQs/yFvxgVasLuEG6WuUzWBHjxDFY7umyotIuYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKdpoW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvZ3gRu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKdpoW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvZ3gRu+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Q9Uc1773996
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=lEKdpoW9vCClAz2b
	B3Yz6DO0a/O/JO7iW1yhBnIQ/DDxcF4fiyEsfJz5z+mRSFOg5YAb+4I2eIizJf2k
	HfZIeKCuGrGbaQENAlO0bjWhIJK2Fas53eOIhSxQ7XmCTXJpYwVxXHwRC8OTMHNq
	lshxMQ7PlHjMrF9Rn5RIG/tM29wH9+sr2DIPWvtBhaGDCwQ4NbnelNXArrva1iZN
	fzV1Kr3zkH40Z1X02mYV2ilKj0EZJbcNzYTCylxdV5aV6aTLJv0UOWTA2Vl/QSo0
	DWHsZ96DgE4DxchhBcjWt/1CNhExajm+EVvbyneMIx3kpBoOnCnywhyqnYhRDHZO
	kR9bJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb41e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso133397185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246509; x=1790851309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=XvZ3gRu+BRy9a84HFgqAqoCjIDPuqZCOst1QSCxuB6pMDojBrRwaQ4j3Jlt23b+YE4
         1SqcVsXD7tt3v7ZzjvzYNRVGJVunmdrtuMOH9iZIYds25WO2l+O8kRUELmIomFgh9h0o
         9QAmijm/fL4yWLuVXa11b8aH/4/DMMg+10YaSYXTfJ7qQVVM2RM3+QfVVyultxswM9D1
         FOAtitzznu4Vx9mesIVMxpiveE8xcsvod2ZbYxmZ/qGXj65RAQtQI6wT9KPG29EeiOfy
         VGX/CQ9XGqy3b8fKl1YG6diHNQEEe4AvGqCVQY+qXInkSz+XBPI4vLzSaBBBnS85gvka
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246509; x=1790851309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=dloto7jGym0UFuwdlxDqMF5LDKvzipLi2FBwZVxxn6IfDZBTGPCGioe+9r+soFrW2w
         B6OapZXiqiWsCGL4WgdbvigYuQm3nhUOPp20bdZaOcFw2nsYowMnUrjjNyF8S1jOor5u
         MLnJdIWRimaRHg2ndw7z6rGVygKNaUSlKKUvlIZ8sJzhdEURfjrR8FKXmBYDroO5FwS3
         YiXrVkCFKJXK8sRTCPWYvJ4XkXTa7NdIEX51f5KjQ0LFEg79IJ4ap27e3uIG2GCYg+PP
         QkWWXRj+8QBJyWBiqpHkykxCoTBJ+QZjUbciywl303N16LqYAnq1MGeggKP4rEGWUIfW
         X4ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwm3vD18suyh0G+RsjOYbn20b5BFf0d877VbGBOHsXDOavLAjJHCYOhSMrVo/A1we1AueiKtBhbSTNqyzE=@vger.kernel.org
X-Gm-Message-State: AFuF++mTd7WjGJyCPqX10DgmZT3cCS02p/6BReP5qY1cw48KUn3cR+mv
	rhNlNBtxo4DXy87STSNMwLg5M6fMptOOxLaIM2/futKIZuIogOSy1hd58cFhxhu/h/xqjrMaHBe
	HEK3UeWTWjzgOK5+CF6Xde8469yUitEk/KFnRxV2GiCmTss38CgNBipyXzA04HTkFtPs=
X-Gm-Gg: AYBFou147ggl1pcYPNcbj5+jHn7u8eSGehGPGo3POa8y++ioZDKDa4a6FMFvuLAl4OH
	WKx/qnWfYZowmST8aAny6jgnjNtnn9a0GfYCIQ/jaoJOgn05A8+lPw4L9jUMBFsKgZyIgmT3yjg
	BlnO0l6QhRc4kyA2Jih8Af144n1fyXZb3cYSyXJAxarLyCyBdSHLiPWXmPa21cMr241HbHspaSE
	6JncQdGknJ8zs7PPZyU9zQ+wERKq7pqHjairCIxp2+zcL/ySLGWygEurjVPhmP4Ee//XSuz5ObB
	al5TvDTRug6Oiehq3F9pJ4bkFuKNlNTPda8mcG/N4gayUv3KJX728/LwggCfg1qTpYEQHOcHjCM
	4RJSCRepA
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211749185a.10.1790246508897;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211744485a.10.1790246508331;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:52 +0300
Subject: [PATCH v5 36/42] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-36-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39F7GB+7c8svmghc71rS5Uda+C8iSb7wcby
 e/IIeQU4z+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VrcjD/0Y3Rk5vSg3xycnz8a6iJJCEZWCGxMEGk/RwIXgAtYDv9cS59ip/5zUBB/7Z6Rk4ep1cK8
 662UaUCwF48lNf9kNNra1Iwe/COHkekEGX336WRCY4HHC9Z7EekiS64v+TOc2NJFAQvdfN8ux2t
 97jzej2jsq4vURhfG/5h7nTtmzV7ialMG3Rgxc7G4xb+xGSeNTsyXZuRpaKdb7J7tFqJW1aVRUz
 pZHdCwviRIJe957hSAZGNpvs65LLLFiCxVytzSP0r23e45I7us9rEjW2DiLO7hAw4bA9Xk7II07
 fMD7HyJjOjuEWPPXyUzP11PxKssfOO+k7rMsKIiyV5VovzAH69TNw0r3DvsNc417WDVaU62TqMI
 mQAGYE++WJP2geA3DN/B0GIdCwnO3KbhLiB4isx4/HUiLIrREDAPTy4CiN8qudZF1vuraTOPo2/
 V9o5B60rXtO+9/fUANw7KLVi0t+a01bA5Rhf2sogiUMfZXt7A9jau8pKutlMrR9qYUwAtkux0dz
 bY4QzEpgPXbT/lswyRijn4yOs9BKw1GlK74mpPjV5I56OV4H+OQ8K3NZLKJwosCnlDqpeHAP7DC
 3vLwaNwrBzLO416OXpjk5KbYFk8OVbBrYWmsUDvGlLU08pXwN3CIBAUhA4Ce0jq+15JjcMgTs7P
 jU/YTGzHlNL4XdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ewr5hr6fmWX-EUOk86GaAV9CNPTFu5Kk
X-Proofpoint-ORIG-GUID: ewr5hr6fmWX-EUOk86GaAV9CNPTFu5Kk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX0K1i8nFPZBsj
 Oxv00Ad/ln9wMxDqkzMR1byEY7ZCIH+mQe5ZCvgDBfOLryIVcDaiN+g7E5KTSnJEiJn+JDXLbyf
 +sLpc292fytasWioMeh5Ak22n8mBbq/bsCj1aPQI6drAfzl00EMhD9jhIGAul64qW9/ih3y0gfT
 KzDIimGshQHBqMvyEgRfOQMm/Dc62uqj7nl5kII0+XeXVIFMTe+DbdYkqO+fv1cNhlpj/F6wXCb
 45K5HK0Rfzawnlw923qA19vDnyDJeEVPqeAN+09HxcQLbu7vMwG9xNzVYipsvtRM02FE35IKSVV
 cIGtN1WMLjVK4Ks674VZ1ahykp4yavKl0mo+kVKy1qbtYT7heF02Gjyz+tIKsCeB2Zym/zhW5wG
 fXohscA6KO/XJG1sEA1F7UJwDbrjVgsXfaQhmMAgDplDSo230vOWJr5gwnXS/AdCniZlytS9wVm
 pDKrI+Zbt5l1URYLM8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7mP2S2klQCJ7
 ZQrXebsFiAWWkJxwjyNUw3/zDPHTabF1xAFhq8rczUfOBlC6iSVC1LmNTWTU9I8cQhYsVEY7ba8
 VOFeQuUEYBmEcV42rSpJv0U2kuso5qI=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4fe6d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0


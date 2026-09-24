Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F147F77C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251645; cv=none; b=a3HboT6S5gMskRk0Jhlu8cBctORJ1GrQjZkKkg0m71x6vIpdEprEWNxlv0niwba4MYMZCwoeS4gJQqOzALZeJV62cQWA7rbFTkGwFvWbDh6t8YHS5SR4FSsPS1aiVZctEdw37/hrFfiIoboyEtUPwV++g/XdsTGIxBw1Jqh9/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251645; c=relaxed/simple;
	bh=NpFkNyaRbbIy280UOhuPcTN0madFk6MFT8lDT1uMuJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEeLm0DneFmOJhTMvf+x8ByVNRcXPyi7gUSz4lzrXvYgrFrr4erVlnsoySdx5kHQrgXtufbCh+yeBxp1tt1Q2nsvwzShRF4qyIOussw46/wkBWRsSgPzV2PEG+ZcgijHsB+3ombPMMmlNnXCHJs2W+MZFNZYLG16/JRmY1MrRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsGKGps0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkL4hDqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsGKGps0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkL4hDqV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4nor2002260
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=; b=OsGKGps0ryiTRV/y
	+x3hPmAABB/TDjHkYngV+f+EjSfTYybHvqNsvRGmVU2hxFaO4QbM+cOGMBRY/0fn
	koKYISoQt7Xqq4YU/qN22eU9C1j/5zA2zuIeeImNbFs44ShSmN+7KEH4HKEdLS67
	cFzFCnfL5Wk0dVz4k5RgDrbg0w7re/mT+VsP2Ld5R4/6IZjF+VwCOkHYCh4oVEkY
	ZnNB6sqxX0DqTVNmcM/aeszxzt8li/qimcyfBJeTt2y7GQFTtFvjGZvr0fwXg/+Y
	+XqINF3nEIUTyWHfgHeLPhiHivMgIuHncLzxlZ0bC6ckBAVaJdEgVct/0ulyPud8
	TKMiJQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbebu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:21 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c683ca769dso782795e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251640; x=1790856440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=;
        b=KkL4hDqVFBoD4giB81HoXsRnpNxfoDp5JF6El/h1nziandtOH78AGrOTxjcfAGWOym
         CnF+f9reHdVlxK7HFqUtg1xHVymQIx8WXO4FiM8wCNdeCCQlzGGBSL2+9Oika+AsUjIx
         s9+xyeaOuS5b5TETFPJsre/Q1hJqQ1K6XVmMeoJjkoXLouZR3alIthnWA9nJRrkFWHUV
         /0Jz2ycnwQc3nq0Vqf3dz6xmBm83TlbUN4A+9dyo5qfkzJYFpcsQCLEsg+tELT/qu6/7
         U4L5ZDcq+Fqjx4Hvct+5J5oWMhKx/Dbqr1TknSRt1bZn5JWK/Z9ifyu9Sd2KLkUjOsi2
         h2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251640; x=1790856440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xokX7bYOscGmP2T43FyhKVF0zRdoQlxD+Kd+fGdic=;
        b=D+3DcxIKqpngxmrJmvN5bXZgY7lHsvBWgczHqO1UZC959432aclv2dukYms0M+Ysmd
         fP83E4Dir5gr7bRIr2MhjIYNR59Qps9BAHrqB9lhV9wZ+mtKsE93Y7RvLcN5DSGi3+v1
         ++lf8MrQNf3PfjGeRrdY17K1ReeaDQbhBj05klNtdwCh3MNjitpvWEnrc+oyZoN4fYnp
         IlaCN9jSYe/q2kM+K21ub2OVb+3inbfF+ZtKRfNuIvKIqgZmzRwNbYZyydzCFUV4REkK
         iVf0QCSK3ta1cPvowo87EGvznMux4rS+2wAVyU05rM8J/wB+KK2uZaD4ABPm2VhCTurE
         ZT4A==
X-Forwarded-Encrypted: i=1; AKwUvBwE1wmtro2zfVoDHOug/ISlA/HwEEHN790tydPAbAIeL58MBa5Z8wzp7Jr3cBfWddMNvZziluUQsWnVUX8=@vger.kernel.org
X-Gm-Message-State: AFuF++k0Vn5+Uj918sS2k++zEFbiHvf72ShtpJi6rCwvbbYIRQ7m2w/s
	G5i+Cia7m+oFU5FqH3ODN0M/U/e9xtC4GvfQtOcF9oLoZusIpqmxOG+E06G3/pa+rhYspH+2V0D
	AKxhyCZGDx0O/lr8J7hq78oMJEkUx5XuPxPRcX6ylrRrEl1UCltrI/1gWTKbRWX3nVZ8=
X-Gm-Gg: AYBFou1TchWLQJVJ6WA1/7bTQQkGhQvYVIc+IygqwMx1d+RzwkgSxoCHCz/JxVGB4NZ
	/vvLgqTmNLSgD4Km1xcJ8LFdm8CEITi5M3BeAMUnL/5C0wiO9el+eLQqKD3CPih5QxhBFjRB4j3
	/n4VMnKCaNIoVrj+8aUaLYKYgRfsq9QgLcVSM1oD3/OegFl4fpOiv0GE+uIlh4FEBBlytpU9EXg
	YqWvkiQj9rueZWH3tIHhnnPAbPLG6MBmZoR57V4K8DfAvvYRaLDPEweLPuOuvW/hNX+iWrnjn4O
	POVMQ/STnQ7nKSVXWSDRb+W6mQpVVJySm+K5jUVVjakt4Y2/LM7lFmW29O9Z1dY6Vfoem+aHQhl
	mgbfMcbhD
X-Received: by 2002:a05:6102:809c:b0:785:d308:cc0a with SMTP id ada2fe7eead31-7af1cb95fe7mr988525137.9.1790251640015;
        Thu, 24 Sep 2026 05:07:20 -0700 (PDT)
X-Received: by 2002:a05:6102:809c:b0:785:d308:cc0a with SMTP id ada2fe7eead31-7af1cb95fe7mr988503137.9.1790251639207;
        Thu, 24 Sep 2026 05:07:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:14 +0300
Subject: [PATCH v2 02/48] clk: qcom: camcc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-2-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=NpFkNyaRbbIy280UOhuPcTN0madFk6MFT8lDT1uMuJU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJDviHCd8d2Wl0zsmJ43z1grFM1K0ReEkSLE
 R4Oa2tfICWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSQwAKCRAbX0TJAJUV
 VqYND/91zMoxaVm+CApRhC6UXiZR2fhnE4v1zlw5NDL/AjCH5pMLBgd2PPvqA7C+ozlwOefiCxm
 JQpYGRhz33qBUUQgyNwDNfJJUxKl2Vsps69fjUDvkmLt7kKT6/91kCNDE0+yCwMl7tS5aLPQUu7
 npOsNdxwddyEzRHKlw9akX3MPXHa8OOcoRawSF5s9SwiRiS23RDAlhY1J277KYhlCI1VaLrI7Hm
 ftzymt6jbJ45Haa6O8gY0AQVXLKIp/PdEN675zNVyfLhI8ejEXMm+u4E8ZD2b7dvEQrQIDHl/Jv
 m2Pfwd4QNnvnZAG/dCoDECHrF9RTlyCPoaEu5ZwICYE+nDBy/KPTxTFNDqlKXbyJ9P45hSUoRMU
 LzdvIvYHFsyIZjm3KcN/fZtDK7d1yZcDCUPfZ0ib2JDQtn/gk5OouYmprBbl1rhUr90Bp8RHHtN
 Im3AW59LcbIu3A7UIEIb675dhdxqxHZpFrgZZiXs1+y7xq5EKKBRlbGww0+LilO0rwh7azF9nnD
 n2T65iub2EMwmj+R7q+Bvpom8L5WBQpfCJO/13yUqJWxV1xnxFFPCSlx9opNi8xVHjFCtX+6++z
 wOr2QtQvhe/QU54DJjDen2pOK0ov/8sOHgVk7UhFE886RM+PLuor8yO1EXdwFQUlIUY4D+nFmVU
 hr7UVhaCZmgMJ+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzx7ris0QLx0C
 0O63GgadVPhnkdSm1dDJbp7ePODlsXqzcynVRdkqGQS4vWOhG5L+qVCR5GGR130Eo6txETKCdtn
 8jAfeeYS8wcC2Nc412FMPZbxjtK3QpUVJt7qH6XSUH4dvWQUJo8V2FbU/+yvnvoTbKVjxA6vWgV
 Sd74batMMpBYb3YtHG1BgwaIOmv2tM6tF+PXlNBGGI5I0VI8OlZwlGGCUlit8qZsHQgbab+09St
 3dvRgY1rrjRxrW40LzqYFWaquNZMlXaclJ2QqiMGbdYhIxASZyvfQevTLuFVixO8UJR00wfrFYp
 bf39VlbzhTrGeFi7gR3/WSS2aRc887aq7ogRUC6EwU5nNWUGxXlxjlWJ1VdGyjSGHG9O8VUEXMa
 CRT4wlsTEQLzUWOqJVI6maawJgk3ydhSXykB8gYI2rk073YBkp7+fNuDzuPDeOZvZaGP2sSG4a4
 WuGJK06agtbeyO93zPQ==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab51279 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rrqsg2U6P9VQxLjfjP8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1Y9WwoVTeyuh
 WkYQhU3gYGa8mJzA6+F5GVrS62PClsHu/tiXbdxcVmp+o3v0ZGEv7iofQxcHPVFjDo3JGrEbkD4
 +qvlamfqk3stECfmGQfOLNNM4OFgBfE=
X-Proofpoint-GUID: sNngBZvQVvNf4O9NC_y4Xu3Fjmi3GISB
X-Proofpoint-ORIG-GUID: sNngBZvQVvNf4O9NC_y4Xu3Fjmi3GISB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 660d8655d391..b0f1d40d1df5 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2967,7 +2967,17 @@ static const struct regmap_config camcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 camcc_sc8280xp_critical_cbcrs[] = {
+	0xc1e4, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sc8280xp_driver_data = {
+	.clk_cbcrs = camcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sc8280xp_desc = {
+	.driver_data = &camcc_sc8280xp_driver_data,
 	.config = &camcc_sc8280xp_regmap_config,
 	.clks = camcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(camcc_sc8280xp_clocks),
@@ -3011,9 +3021,6 @@ static int camcc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
 	clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &camcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_disable;

-- 
2.54.0


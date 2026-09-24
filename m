Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B3493656
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246517; cv=none; b=DCJ7Uv4RfhX0JdQ3TiK+YFjKuyXj6VlPejWSEgG+tz9IW4gq4oXcm6llWS/dQmBo3zZt82ynARLwLYzPdX6bXDuqQ5K9Wur9sSwHZC2QkF+3fM+181zkY2efG+ehwMub74qecxwaelMtywCsCdiG3gZNlzkvhzz/C7dj2+3G57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246517; c=relaxed/simple;
	bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AowUPEB81ZG6SBB7DvvFSjCRdlAqT5C8QzIy+P0r0ERGVIXdrfLl3Ao+gI/CYBiv8l6viO3iFN7rcgkql4Ay/l4ogEpurlwXPBch7WRbw7io1X0+O/2zlHs0mtWaZpMNhAejZ1dN7FRgccfmmOt+NM6etnKFlZCJwpVufn3XCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6g8nbee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEbXiqTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6g8nbee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEbXiqTx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDNp2025629
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=; b=P6g8nbeemYsAYWPI
	AYcccYYLFidF+J5VBlPvjrz3igIIYrQRY0Co+eFEPeu3xKE9Ai2E2aL6nUVEqW8C
	ZdMbfYMwDa4xlUt9ZM6lGVGl9FQkz3+gdQ030VfwxCJcgPeYUGRNhldiJG8A6+Go
	NCIHZ9hEIaWd0jjdyzFKFlqXhM7GRRrJSZvGkhVNT/mKZ8QyjAgnE5GK3o4AeNgz
	F2+yNTKtPEcJ6R5hvCqIUbTZWiB1jjo09C87DYe7gljsB8gPeKzoAqkqz6J6iCWE
	a6OapqfhgdtNtEJQm/DmyO2YMUXMP2xVojdhuOzR7TjBXm3H3OySSp6CeAY3QU57
	bSN/xg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt2bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bfb2da664so458173385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246514; x=1790851314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=BEbXiqTx09g2x3OcsvrMLpxMROtoQg+Es3CLKi7LdUU01wpVPdcVp9I+1ySBUDM94r
         ctWv61RazY4vqG6u+9g+xusoGcMlTaTEAMa1Mq4060QNNecbnvVQcrRbyELmBPH5dbIy
         6tNHN95cmM1I7e6/jgnQEpeFYon11PaizSANA2a0cOOzDmmon7N1HeR4unLko2o/A1pg
         GACUeV0xp0lo0h59vdQoyenk7XfyrqM5N66mv3wDwBR5uzIs/xSxbviKoV4jh948TKbI
         i9yVVrXIQJDJAG32PKEUHjVIUsQv4ie9ryr/1Ge7w9CovJZfHhMG//U1pI8P0IvSqbw2
         EaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246514; x=1790851314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Msl+PMWNKMeXVrW2pFB7q+pvHrllvBjiq4Fpzko+780=;
        b=E4sjbcOQlXIaceA4OEF2LYfj/d/lYdP4v/MXpF4ZcY6Q0yaifWxcTKX91Bo8xKZ+FF
         UvMV5u5lCceWby4r8o617TXO4d6iPy1qaoJLOBB1udX4/vtv5ivy5RJ4+CLhhxjjxbWN
         YDlBF4x8xOImWH5CvydMdrV5LaIG/Wj8jLV2KTmFoaF/GWrOHIWV8QdkvUFitRsVVJBz
         wtuVKjt5PMVusYHuomNEaFbnv8MHZV4B6FAMXcabX/L4/2TvnemINgt5oZYd7GyanyKF
         pcq+v0ZOmxGudBDV4GRuWRbITxvoi9NjOHSgq/ZILXmJ0Obis4bjrQlJaa4mhCQ7I0L7
         kjmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5qX5BcMJr/wunOMBFVQv4nU0sM03y4oFBksHtFm0ssLyanSgeoa4AxgfCqpmX+WrvepMjWbuK7cznEqY=@vger.kernel.org
X-Gm-Message-State: AFuF++nAk99gh8eB0MFs2K3f0RlqKn6qqzkiiYYXIegZY4DJ+SuMnMV2
	6Jq+qTGblZi8u+qjJQnQ0FvVC/QB9EiS8mdDD3nVGbzIF5/eDQSx8lvqq2JptTBLdg5DzX5q/jO
	TqM+rKt6p1QWoLqXENRHWA1grDSsVoAUM+IS1AKQismfbWNL2Rb4TzN2EHzKDKj2O0WA=
X-Gm-Gg: AYBFou0c1O+wrcu2qtenSXwOfIVb9vDvE1xNfn/VBMXKvS3UEDZnMWb/XMBPquy+unZ
	0/70zPrcRkIIedy+5J/VkxtIxB+MJjielfJulD5Ok29giVJvoTyBIxvhsgX1D8ssVGSoI+kGbyj
	2YLgvcDZIzUS0Oniy4hr8Areoa14Nd3xqAgB8eOODSY444q+yS0eq9k48iJfSRkcdEAAgq3YcqC
	HI6yGf57L5hz9h6WAqkfsCPb4CD/yBkGBIjILkU/6fkJ23jk7nnAbXLwy+5AmC50vLj0A+aZORB
	ruaAaYyo+fvWQmorPzmVjGeNG3A0ExTgsYTXrqNEJNAHsw7rWmXemXmySBFBw/JRaFirGzwwTVl
	nGjH8YI+D
X-Received: by 2002:a05:620a:8081:b0:939:de48:e41f with SMTP id af79cd13be357-93c36396c40mr211628385a.31.1790246513700;
        Thu, 24 Sep 2026 03:41:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8081:b0:939:de48:e41f with SMTP id af79cd13be357-93c36396c40mr211622785a.31.1790246513147;
        Thu, 24 Sep 2026 03:41:53 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:54 +0300
Subject: [PATCH v5 38/42] arm64: dts: qcom: sm8450: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-38-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=f7zFNC7Ga0KARgEeV11nyncXAlnMUFUz8jSYYAfcsMo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3+lsw4w1Mtx8pFr5mcgCtDFLVQBbgx8NXPA
 IrpI2NooeWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/gAKCRAbX0TJAJUV
 VqYoD/9DXDz0ZdheOl1aW/pvmj0bXRZ3lw5glcJXNUM1Fk+Aaybgs7KUkLwbChCD3Wf07iDNrtA
 qOXu4eO9sEMA0hMksTpkjS3JHTA9TuZqp+sK8ldyuQB42QbDAELKMli+v75t7xS5w7nr8mrxa2Q
 s7GELaAsU7/oOScENAjTn/81+QStnv+ShBe4BueSPteUVX1ynlc2d8WDctKm7/CiVNnYibJ9c69
 xfUKnhTnHrBxAhF8C4CojiICDqKFFylu3ViF2UbPdGHOH81Vflr0gAMshXn8INGW/CCcp04R9h6
 p28k1Dr2qf8tcDDdkyKlOGN14GPS06o8G4toPI1baJeFiyQjAShEtWeLzmMYtWyBqLik9cXquFb
 MOpnx6VDx9TKWnTpr3o1ALhU4K9wVux1QupPyeUh6BD1k8uB1KQjD+vjxU3WQT5ubpYHi7GcIAW
 iby3HGCJ82VEeQ7q1wERwH5UYDZ/ZtBeDSlxdn5kzXUnRok/vskvQ7jOpOKNhs8VIlgXETKYKAj
 iA43FzPpv0eNJa2waFaWllXB1/t2m8Ecns/xtGyPFu7wvoAOlv5rY4jwv9TSpuPsUe4TYu9hI4l
 jJYJgWd2b7l9CT0HVINWCwQO2Hzx9/PR5IXun1cnqwTqCWX8MFinLkY724Vf+ykElzOoXvw+TBY
 uyljE9CWCIMUb6g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe72 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cMt5CT0DYXTQOAQHtqMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: p7o9Thoq5H6SQUr8YAFxHRP6fEh3TnuT
X-Proofpoint-GUID: p7o9Thoq5H6SQUr8YAFxHRP6fEh3TnuT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXy0py1NbrRk3Z
 iFC48GqD29W3IbKgsEsmm513nFJ13HAjDVjD+nUKNhf6Az2pg45zz4AkHkwpDeJ9vTwQ/34c1Vk
 jO1+zpbfohV27NSlvFcEvLL0wFGXKqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX3cwCpCmaJk52
 gXcnS0CKFNhWQIerGLZ2VmQqvAnxHq/G3+bYyYeWi3lODF1JHkusemN/J0bSjA5r91PK8BRXWdG
 coovyEEbmcLEEkBhuEAZvrUI+C7f4tYQc67/OqqdtLDsmZBFmsrWCuUoTgwY6f76ZnODF2Dq0UW
 JHJnBKMb3JSNcbs6SRG1HYDmcsev03ADulSZ+R4iAAn8a3MqIe9xsx09ABKBzCOvsSgOuk84vY6
 a52NC7uFW8Yr34szDzHhMn+XC7W4CqvKBS304HM1WBJxrrSIslLp5h3m6W2dVLIjNPeLs0hGXfM
 lhKW7JGOudxuF8PjOod8hNr+VXz4rT/z5Dc30QTKYm791iIh07Wiyr9wBtHdTC3jCQpL3WCb+Ya
 I5WQx1VEUWpqLEldgCFagYM6rPR43E+QPR3/0gSIoDrXGLKTjfZ66Ur+wRcleXEPMLZrpOO060d
 nQxclxHqIyf2aqguZHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 484ec8ec8c10..1af29c5476e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -941,6 +941,7 @@ gcc: clock-controller@100000 {
 				      "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		gpi_dma2: dma-controller@800000 {

-- 
2.54.0


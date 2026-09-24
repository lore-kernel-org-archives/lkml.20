Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFF474267
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246483; cv=none; b=MIG2PKHT2abMmzN6SHmlQ7v8LiT3IGLfS+R3OvGBjf9JHiH1jAJN0ZT4N6a9uKV+ghBS8nBrhOPgAB9NTurxLIvSRyKmPXsgfAXjYNJJ5kfWJFRHjq+aEjOOtg/HTg70kSMhLSGeDmw6TRU427Hpy5kdmJsKrWjUnCwZsrwHI0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246483; c=relaxed/simple;
	bh=hjJWwNDBYyCBNPIzpskXrx7VkW5bzMC53IkjF2dXTRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KO5kWcaraZsrJoUcLuvA0oU6zEkWx/w7demkoliEL821wHtBpBTgiqkXgnMTkmKxJSd5Cgil0LjoLFd7ypv7WB8sJd751V2Zbf8ybx/4ZlZDIkpySzYzSLK8RmJS5/Vo/siozjNU5movBv5Iqf+tQCxRd9kwoOWMvUdefeaUyI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNsF3m7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCvS7csT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNsF3m7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCvS7csT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3Qp82483782
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IM0bLtOStAe/9tzrOwnAudI2o7vcLm+lK9FdZ0A6zmg=; b=JNsF3m7DuNo1LSpL
	VSvgYjuZaYMyTvGCQ0c9u0MWkFzsn9UsqwLnN6sgqNLiXa/OvOR4xPg6/NDS9hFy
	DqoHiue++U0U+dgonN50pREIoUHqSxN8CzSqx6drNGSVaD/OkXsZVV4HfNoAYeR6
	iFe3jpjewGgSxertGOdXdBUZlpSn9FWwiGdk45MpaBDp/SqzB6VxSyO8U+tM9VaC
	prfn/lph0YgVymYJa94xuwKnGdRPJAOEF5gYyrpBSmyILjpJnauLjMzhPJUlTQ7r
	szOg/VLU+LxHJ99QWu3lumAvaOU5xR87inFrT2u272rqFKA21hiNSyRC1uMfuZjV
	Y8AQqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s904g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:41:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso162526685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246478; x=1790851278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM0bLtOStAe/9tzrOwnAudI2o7vcLm+lK9FdZ0A6zmg=;
        b=hCvS7csTVluW1wyQ3rK4Y2SViBIewuQHlujYIFnyykyoS0Kq3Y80pYb4ESChwjmIzj
         vZ/ddsHAFSYt9VqxALXLGtTECaS1dTiBwQCF9J5BteXD5pRZxmskJ/IaQnOCWwcwgzmG
         fXCKB5R/dlZFZaOJXoXQbdQH6KDg5sGVMLTUlPNWT6U0p/W4Cc7uGyZy8mJJe4oAWJio
         v5it/yL0RkRVrGrEA9oTQW8TEoPtHsffUwf3S4OY10Wsc3ItN0lmfoTiBC/Sj7TVCQW2
         Q9WCcPwhy3lQTuHfAw0BNGKGkGkSTL/uH9C+ZVNLlZlMp0aMJgrHTZHRvHrcKAVyEbMJ
         EOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246478; x=1790851278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IM0bLtOStAe/9tzrOwnAudI2o7vcLm+lK9FdZ0A6zmg=;
        b=1U8lkluTyruU7gm1YluB1Nr9aWMDA0pi+jn+U2AE2JSo+8Y+Tpx5F5H+aU2Mr8zFFG
         a6Vs68NIyj6xobFMjuEdb0GeghfG/c0NwkkG6xpMm1Jr5udD3W+PTkxYS0LFj8U9TuiZ
         Si9Ak+3AL/bSjsRqU/NJmA8fc0N1LarnVAsojgF6uKVrBVrtrydtf8Hh7bQQ6rWTOj5f
         zcLK7X7DNgyQwUnlvtE+lSZuAPdp0y50lAYRjCgXZ/9vAGdAtLPPH1tyY3a49BjpMkAl
         cRDAp1eezYeYYP+H3yjxo3o4SAtCC1UIwC277X28BTQWZ451rWeBERZJ/s731Y54Iqt/
         5cqg==
X-Forwarded-Encrypted: i=1; AKwUvBy5fyp2PiR86OiNzwdZMj2pSBQF1oqOCoCAgvnyM2Qke2jnQSefp9pbuIAmsKXjMqFRxYt3/vXvWlCzQXU=@vger.kernel.org
X-Gm-Message-State: AFuF++lrMNqC7ffskEV6vVYcU1MmRww2rZOfrvOiwVE5ikw5+o2NAkzp
	mzOxGqCo0HoWrWmgfB9YYPhp1n/bxuF/1Ke7cM2fI4JfgFfZlv9smIa8X0TaRKURPGSS1V8fuNQ
	83s8c3y+eQ65HZIGMneKECkvXAoGHAEYUMqssXJ6AgCnxXOD12zBuKXo7ogmp1rt3KfE=
X-Gm-Gg: AYBFou3W9mXmk0AtAdIMU16S4oDTrLS4hXVbWf9i+eEFx0md2lU9xnjcOVpZenYhjDz
	jza/22b6P9LMzB0EHuj6AHXsq9QibCXlDFCfbpQ7iOqY0z0lAz81Vfm5GChcB10mHKEcTjcKQW0
	B5E1YJaYR76DgEOYkof5SC3yDT3kgbiWqrCjrvgRXHGHEv7FsIr2FPAfrbtX48RkEfQ+kgBIPsY
	V/57MLVBVtmiefxquilLALz/u7TKDTSletchP5HVnN9whMBF3jTKQtNW1ss1Whe0Nafk2fNGfYH
	Jj/HTz+alwhgapxWygLXfZBn63n4mHjfsEs+XyADtDJblawiTcdS1mD0L3PHh8MFPeaiZxdU0V+
	iCEC+TFFK
X-Received: by 2002:a05:620a:4105:b0:93c:204:859 with SMTP id af79cd13be357-93c366fed7bmr198443285a.21.1790246478198;
        Thu, 24 Sep 2026 03:41:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:93c:204:859 with SMTP id af79cd13be357-93c366fed7bmr198440885a.21.1790246477663;
        Thu, 24 Sep 2026 03:41:17 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:41 +0300
Subject: [PATCH v5 25/42] clk: qcom: gcc-sm8650: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-25-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjJWwNDBYyCBNPIzpskXrx7VkW5bzMC53IkjF2dXTRs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP3ycvELy8cgwgUBzr8ceYHBA6y1JFLzoqnTs
 dIfiuGcyl2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT98gAKCRAbX0TJAJUV
 VoEoD/9qzFvH3BEtjX5LK8s1PMKiW/rwXYYMohdmvvLTDBgIwp8JQ5D6rCiBn7fpzZ2792RMaV1
 aI236Dcfzsy9zN4m16Xq25doOPrXDPIyVstjFk5dz3Kg34nMV34VynOoGYmVlhxYOPC80TtRfFK
 GY3cCAQUGu2uzZgdyGnL0gFsd/0424mJOV0s+yBr3bkhkw2XPMk2i1XARgLN50K1syHFLt+Vz4G
 lfYiiiUlM5H+M2KJxoAcVvqOBsEadAE7VNN0fpJMsio0u9MmBUO0RQ4158dzZdGAmOGD+b/wLzK
 3qfp6q5etTBd0Ev5P5UPnAfFvrJ5uNbClSigiGRCSuyaAqhaY4QvdSOo4djNGc4ZjvDOtGtXwlt
 fayxWiwIRmqKxgxjUxMxPvHvdrGPDCVMyT6LIbBN8ygQhFCFjs91C/Jeqq0t5lGdi6z1e68L9zI
 +WhJXKxI57tLdoXF35NFzKItzHPeoiFfnDM0ib5xV+RwdSiHv8IIbI8NzwU3aEyCgRr1HT2CYer
 G0BSJz+FByfkPc78XNJ0yluLsv7y7hEv0JA5D3w0rsZSzigLo+fJAuKEgNf0azTYq7Eshmhi9op
 IiK8qeEuBCNi7Yph5l8LV0IL0SF9Zp4sZKf7yQ+TvKCMU17p6R3+YEAr6Aqcl949F1U8mkpnOlK
 IOmrT30hMtMfFfA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX53tdH0vfNT1B
 YjZkKHdCQ6U7/QA7HsFjrQLX3Kq9Smdyz1xoLZ43HMA0jB0nd77SwrswgGDYhrEoa8vtDclydQy
 tg0e+HrrIdzuz6sffm2lNsGcTtET48YtvKnXSogRLcXhk6fQ/bPA9oNI9x6pTB/Idp3fcrGbO7h
 Xoc80VVEq7JkyERtbRtxCgc5omKlT6svn8w0+46MQnot5ENhDhpwimeReX9M4phY5NH/wZsFjDn
 FOKPKoGfZRcLp55hYnvEp6zlI4wz65upuZBaVcQrmOOmNAAUYIcYXOYNxW8uJXgv86CIfNTEwB8
 NKhKROdTZIIJj5aReVu+cwVhhEzYgAh60/94PJFLWAszWmvPDZXjTDnZKPoUR0U0gch+1+QCYdE
 oz65qgMcynzEl8V20FboxcX3hDi/uEq63jisVlT3BssBKIFqQv+OiND6GT7RAyYNDfjuvCAkOCG
 SyIcU1EwXcmn56g++7w==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab4fe4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5ken4Z8irxXq
 pMMKQJlq4hSlf00D96hT4HUHLegQn3q8iqSy3HaLDvnL+b48OXalVY4QswnSmL/l7LnoQqU0Nq+
 lsIA5ocMGUZdtyCZlhQZ3AfprPsugDo=
X-Proofpoint-ORIG-GUID: gFR86ANwZ_HC432XmJwp1AOhqgu8tVaN
X-Proofpoint-GUID: gFR86ANwZ_HC432XmJwp1AOhqgu8tVaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9fa362f0c447..88d0a9e51045 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3785,6 +3785,7 @@ static const struct qcom_cc_desc gcc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8650_resets),
 	.gdscs = gcc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8650_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8650_match_table[] = {

-- 
2.54.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754D47F2E0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251646; cv=none; b=VpUyWQX+ecoCo2Z5z2HZ2z0TE4DallBrWxTtxaXoq0CVdMV1KIr7Or7mDhdvt684nREt9M/nAYZPR+SYB+oyNJLX7BpA9LQEIWJgyol0Rka0ZAvh+sEzXo2OHObXUwnu1U6e1VUPKlkrT4Oo5Whr0TPkvcliyxp/bzTM+whbRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251646; c=relaxed/simple;
	bh=v1pGxf9FSj6EcY/jRQeCq2h/np56qNWjuwxxawoik1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ry/UHvSphdAeoQTJyhMSiTdcByHG0/V6jephQJLvV8D7uGyvV+PI3+tFH2iGyfALpHKl22Qs9ty0B858qfq11odWasorqIah9Z64hbGHov8aNV0xqE9ub9maamLXeZVrNRZpT+AQGpt69Fuy8kQeDiXs/htu5K1+QJB6k7A9Ej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFmjiHMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7yyC1oN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFmjiHMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7yyC1oN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4fjh1437115
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzvOQFBfkoc1WRuxGRe2PsRk56gNER9w//BYPCZKxjM=; b=MFmjiHMOQbiA+HmK
	11l+93LsV+6DokzVIrrMGp6/40Qn3Ub67Zp5hDGNsy88GRBwf4ABq9SjRfYYh9NN
	UCeTFuIQ4mZ8g9m1bfCRHns2R3B0YPACAqYIO2K7MqKZg7OY9tw6SBu6bMOuMtgl
	UxG+4Zt17E508AvKGu4q6fiymW9TEH9lIpfIJvbtPQgBP1NR64GzF+c/ev5hPmXj
	1nh5FEkT2Cz1eHqxlvhSX3Ndt+GXXHJd9dOD1v/bePtnmiUmHgifRcWd9s9M1aAP
	nfFAKha5vUkdo7uWN6nWZ7jbTYLS1azF6HsPVzWkTCQAABJazp+xD7YiWDEhBk2m
	f+9uyg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7remx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a58df134aso566072137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251642; x=1790856442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzvOQFBfkoc1WRuxGRe2PsRk56gNER9w//BYPCZKxjM=;
        b=d7yyC1oNQw9yu7Aai1iZ3vUuabJBF+DyWDoBSjr3ecss8phKZ3OGfhgW1+BeIMFfcT
         Bz5rsCAoibWuJ+QdYsgqep8apPqY4LBljVBxH/iqwHNc7WJCWk6t1/MwYSwMiOMDraw4
         kVaoaixV3ieD6F8KcyAH6UIoMcEssEDPN6EH79Ss0HaEHqsQlTHutDpOEcvgD1dCUT6j
         7VFfDfHsaTl0cDbQKqFovKk2YxhhMtf3KyhWLYgiRqjS9M4VHyVBUmmkf+Tvv8hPF13C
         Nu1LqYUlLrMquEkr7/lsF6KKvyHFSBaC+MQdXTNegfyVAmMmgwWfANHE/YJb3Ao01AE1
         w0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251642; x=1790856442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzvOQFBfkoc1WRuxGRe2PsRk56gNER9w//BYPCZKxjM=;
        b=lgotK/hx16eUtb8nrzA/X60umsqZzq5/4CaPm4BQOCNuWr+/GKzWhZSlNF5+3gTlWA
         muozM2fmWl/BJGLx8LSlUqppKDs3xJNcgN/9yvWjXXTeBx04O6VCxxJvMxxT7WgBllY7
         Pev5+DJvvexzWyQiu2nbBOFGgIwGNu75sFyQ98WllSl39R2aNopUhK3Chv3VnM+siBkR
         JEtmD1NSYPmm2MhlC4i+OsxmnqsZZE1uLgwPvtpISPSnsNVdSz9KAt72GIqMzxvOfTHg
         /y7jRdmv1/jiFw23fcPwU9zp6M67eaBJPk7olAQI9Abz84S2il28rqVRMDg6ACDkF4Nz
         W5TQ==
X-Forwarded-Encrypted: i=1; AKwUvBxloIT2oKJCopsNfEz1V4zKraHTPuEyeGs6nPbnnNy7vMyehOS1tVuAXc8dI9wj6ur3UFQ7eDY5u0C4rFA=@vger.kernel.org
X-Gm-Message-State: AFuF++koJ9TGeNtv4MPJ0SYg0dUt7bcDl+SrRYoK/NRSlINwbu7UoqB3
	oklfB09+FoBL3yqFfqS4XZxDgsYAyBMyi8cn2vIE21DxJ6L+SWFm3JdFKZKpd1qsk6q/T456i8v
	BoJqX7dCGN+FSKtvRvcFdk+bEREE7jd8GFTixwQp94yvykxAfR4zhL2u1/HpW5Z/dT10=
X-Gm-Gg: AYBFou0VMYZk/efqrSK8zJWpPdGfetlIBtRcFAiJvHz3FkpROivnzsR6PKHFYX7QOnD
	UmF2RnBYHSvkgSX6/kNyTeVrbvD5Sqv0g2OkZt6mxJ8DQRn5ZIa3TXgF914m8lmtRa3EBbkuPz9
	jqNVS0iL8rdydda63MHkX+PjQXGHlJhBGLjDVywynPLJs+nqoNYxoE2z++Dr4Y+aMrJDeOM7K/+
	yZwi9+koTRadgWbG+sl3Iz9BBuTQrrLNHjPks7ON9v3hNWHPTr8CLGS0DMZdNsf/0GcKS0F4sb6
	E4YZoP6/U7sTz4tJnIMASfwZHYzdUie7uclJwDe534PDfn5eDSUEuxtthDpYndZ15WkZ9+PDmaw
	FZW53lbf3
X-Received: by 2002:a05:6102:f12:b0:7a5:d652:2e3c with SMTP id ada2fe7eead31-7af1cfa48e8mr1047091137.9.1790251641568;
        Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
X-Received: by 2002:a05:6102:f12:b0:7a5:d652:2e3c with SMTP id ada2fe7eead31-7af1cfa48e8mr1047069137.9.1790251640865;
        Thu, 24 Sep 2026 05:07:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:15 +0300
Subject: [PATCH v2 03/48] clk: qcom: camcc-sm7150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-3-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=v1pGxf9FSj6EcY/jRQeCq2h/np56qNWjuwxxawoik1g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJEaVe6/7hOSCN1YJ4e1OfX2rd56m1w9OCcS
 b8lV3ZLgoCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRAAKCRAbX0TJAJUV
 VhVMEACDqSy2pN3912CK9dxGARu2jVvFxiS5zUiHHm3+bNiE7O9O+qs1XtGdZEKSnGRjaZvO3sk
 uKEhJj8ifq0mw5SknT+TV8mgZRIO+dYXIPFIa9NJpa3oW7iCobMram64QowCfiwN9DN6HxzEPgV
 4lY1wxYOp0IkPlVV05n3LnQHLEutSQ6JBlb0/UcLXFQlwhWI5FSOVjw+1Vpwri3C6bzK2RCKff8
 IBvR9bchD5bX/+BepMEopeZFfXIhs7R4yBc1ZDE8Oh8/Q3jRYVPOgPewhoSlL2cnxVd5KFgyrdq
 XkT7nxbtTbTT1C2i8S2apJCKQANlE02w0uaK7NM+edD1GEkh/8xnXO11ZliK4W3rAJRTMVwk2kQ
 /F+RIKU2jw/pDhAUUQxlhTIY+SiOFnjZVYn6S8211yBWaVXcputtofI+VEKmmtbai+fjFty277E
 57K9lfcnLrhIrNLeKYXYHZSwhVsMThGBa2Fhaep2QVnr/tZoeHZlpmWQbw7Ql+Pu5bvJi/6MJQj
 j3f9kFtK4+3WXwlv2Z8HUkR0nOqJo7rDAwf+zDOrnQO3ibtbJzdznz43Pp2lPLG0+kIS/AAp/Q5
 1YPgNvZojack6ZxvCKYnzYwHOMBu+ugozkkt7hwfEN4QNu6/RE/xydXGwq4nsxzvCz+DHMiLMKK
 9foGfDrabuw0c6A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: Qs9oWOj-9cE5b74eemYuhocGzyUz93kS
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5127a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bQTroZZgG8CJslzDRBIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6uH6FZODM+Jr
 yNl0BVNe0tD6+rwgp1TzNlcBqsYaoxZ0yCJ7z7unOcUT3J0FaVR0l+fm2X2PuIZ1mT74KY01R9j
 N8G1PVnq/LpO7sroMZd34cNiAqUspEUMEC8WALcKpvNnjiGurvjINcddfld/FQJK+Ipf2dSYW4d
 6vnMJFZU8RYQIaOPTER6aGAr1/63dkgVeYFkUqgG4aaY3WMZyjo+QZAC5qLellyk/6jmdnwPjQB
 hYGA4/YKMYg2ib4FQs6dbZL+RXHL9KhrKyeFarKKVcw5bBCKXKLxSobQ6K8YKHHxMv9sMbBzdNy
 HKRODqRpO8RPkZMkJaQnTfzjCe5BD8SySCPHFFNY/9zeYnH+fyjlhmfWGNOqJ7+JN0VvyS6OHOz
 3G1ekxyY+CR6ipByiIecKKNDQfWKMREUMpm5DmxDOwZImJ3441RvbwVjngIHOY7KeixujfSJgaH
 vjtYocMP1lvn91VvLkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX7t8wLar86hw4
 g+QvTo1fyvAfKpLp5byZcpb+7a4+RkBz7pI2GZK1gXQU3oG8z+JqCWv0UjhGlBP4VkPJlvhmMjZ
 t/a+tZ2P/+dVliuNEiOGJjYehq3m9yE=
X-Proofpoint-ORIG-GUID: Qs9oWOj-9cE5b74eemYuhocGzyUz93kS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm7150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 6f75689e9847..d06258327ba7 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -2008,7 +2008,17 @@ static const struct regmap_config camcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 camcc_sm7150_critical_cbcrs[] = {
+	0xc1a0, /* CAMCC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data camcc_sm7150_driver_data = {
+	.clk_cbcrs = camcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(camcc_sm7150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc camcc_sm7150_desc = {
+	.driver_data = &camcc_sm7150_driver_data,
 	.config = &camcc_sm7150_regmap_config,
 	.clk_hws = camcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(camcc_sm7150_hws),
@@ -2038,9 +2048,6 @@ static int camcc_sm7150_probe(struct platform_device *pdev)
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 	clk_fabia_pll_configure(&camcc_pll4, regmap, &camcc_pll3_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1a0); /* CAMCC_GDSC_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &camcc_sm7150_desc, regmap);
 }
 

-- 
2.54.0


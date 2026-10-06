Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E0D3A6B67
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326578; cv=none; b=VWUkua53lFbDaYsAhjJ7ldfjDm22W6LtP8Rv/Whj6xnJmZEVvQFw7HouWNHlSPFgso5Uj+Zgb2bAKLIFCwvtSPgDHTZJvTzwd2AokiFU3p5oTxwphnIEOuFSCv+TgjussUXz/dOtF9DdegE07TmjrYt26rgB90nV9frGf03nWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326578; c=relaxed/simple;
	bh=KLQl3/gkN7fpypq9JiohBczcREnomw91nTQIXeaxcVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ezEL0i3U5T5yowZN/VpBln4rQPYEnWnobZmyIYAxAjTilpbvskYiRtblvMp1NHGYVIzcNQi+yzqHJbBuhsNJebMeIA6UjpUTzViEK95iAVEmyVaZ7zlERZnCbxXwP6BvfcISch9F+A7MszaTJm2xYpsz1KDurn4Q3UVweOMOWe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3H7N/R7 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3H7N/R7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lg0gN1678478
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yzn1zhhPwSq
	lWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=; b=M3H7N/R7NhxmAyMZSOMOcdtpSPo
	J94inAyr9bgykebFuvKERQ+DgsM78KrmvXnMp4FCE0Hqey/7InilfZWTKwetMmCX
	97vciO1rEv+u3PJtTnStjt5RR9qNFwbV6g2VKdFHtI/kZofVcOL5ftkwAejSLjWJ
	kLIN2Rnh7ynBMTxVzuSEHPmyqlfk44YbPiYdc0T+vr/lU826J5G4UluGgk/Mo+QM
	FpVqL68z7A9Q41JvqvZ452F11aAGQ7eXcZQXPEwwnVLN4gozcRdQm+TgWzjujnGi
	Cr6TgjyyzFtkTcyywHVjAdv6geQDeZo7hQ4DvNJgbqjHIqEQA2v8c/KOS4w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xdub13t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106fce784dso73846906d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326518; x=1791931318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzn1zhhPwSqlWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=;
        b=GgoXF/vHnwEeyLTvxQzSYbDHgW22c720IK81q9wwqIoEkgm75U5dPcypWZHX+khYGT
         0u6tTkZeUmluI9E/qxYYQkM8DENSArvHRcEpknFeIOa8aL3bApybCOCO9kGq+tvU9tHq
         YylXUgJfo9sp8mNzq52jl6zA8cdlIdEcELAf5sIAx19TFabyd0tDsVp0hWYbtjsCacHp
         lk8HSuIWOVTl4wjWi35RZhVBCJD4gBwa+xA/2sc6Duu9sQdHPI7MfpwM+XmkyQCpP452
         JY4rBqV10Ny41beQKaIlX6Imc+OUAoK3gKG46i1DpJSJEsJMp/KGUiLhmBTmzDJLh9gd
         y8qg==
X-Forwarded-Encrypted: i=1; AKwUvBw/0Tc7ABjte5KAS+3n1L16gSE131BC+TDKDUEziTuhOW81EWc2cM91K6J2fcNXku/Jb9ZjVqssenU01Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++kKJvRa/G9dM2N0e6/FiuN0uIULegHNG4lvIzA8THBnQ4AFlAiA
	DpNOj6obmGfJ2sULB7686+2MFvPBe6oZk/yLMdmk/tG5X0AnpiZpg2fZluxS/IJlGmI3gnLbKJd
	uKaMNoZhKGXoxCSf5AGK8pfQmtgGSX9wGFO23HdqVmYmtlIQ1Yp9XO1eIIZYygJKmnM0=
X-Gm-Gg: AYBFou1CORQ+DikqSPnr6QY99vf2F+GwkgwdoSxMkYnve895a/oYj8Krefjv7WnjmvA
	H9XfnjrVFJwBEn5Sd5bVCJfuD2BzAugkUggeD+Vl1cVcD3cxvOwTpydbOELDWumctL5dLMM30HD
	+ZgohXz2vc8JTFaslxZ08pn36d9VPsqy+NCB4Zqpac6bz9dzcteylHW8c6ZzG8NvFX7/2o/vE8q
	tCzbbRn9Zl/ZM8GGi9qXmFGSWB1rKn1/2dGeZe3f+LW15IBLNyZrWXblgFHYHOLZRBdzUWstg5J
	5ftzMGvE+fK59hb7N9oL3xK0e6/hhJGDacdPqxkxKqUIG+KLfEtudz17i/k=
X-Received: by 2002:a05:620a:4397:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93e9b6fc0b5mr82794785a.19.1791326517713;
        Tue, 06 Oct 2026 15:41:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4397:b0:93e:4dd3:bbb1 with SMTP id af79cd13be357-93e9b6fc0b5mr82791285a.19.1791326517124;
        Tue, 06 Oct 2026 15:41:57 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:56 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 45/45] media: qcom: camss: sa8775p: add pixel path resources for QCS8300
Date: Wed,  7 Oct 2026 01:39:53 +0300
Message-Id: <20261006223953.3382273-46-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1lbhU+tw2kDN
 jcfwfamVibSfheHAxHTWsJf2ByFVcQ2aBn1lAsalTzVGjXmXo3amilhZSev/Wxjx+QmDQfuxcFw
 56FKDeoIyryS7STk5weX1uvFBMr8VjQ=
X-Authority-Analysis: v=2.4 cv=NshE4MdJ c=1 sm=1 tr=0 ts=6ac57936 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=9gHn7dWuMxK2nO1hvMwA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: stKhK8BOlz2ohHNpZmk80Ayf1RfUxCxy
X-Proofpoint-ORIG-GUID: stKhK8BOlz2ohHNpZmk80Ayf1RfUxCxy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+cAXOrflXZwh
 uLsg758pUkD0gnlsGYSVAOYKZq0jJn2a2MHD3Zkqxcq2geq7GB8eEyyBoeMABC4rOLXNU7luZ03
 BYjK7jI39focbhXQpgRhm3OI48xDuSx/k7e8+eZ4rfodLEV/wig9J3Cs2OMBKRaFnhsQ3ZpSn1B
 toq7LMR03om9xOIStISpGzSN05l8VOuJsWKkgmLklph09Uu6pIaj2H4rcx1zqdgPAVr8Hk1xpIu
 SEnB0ynCRB40afSWyXvg4WGMXNH0u7XywqxncxA/xdwv6sfCLDEPLXuCP4hSyZQ+K7yLduUD18M
 HhnMUGNmlHmuzmP0kKmvKUn1IIXVU+r2DAFbKLcXRkGtmIbjsy2J7NA+r6Rm2zjMxO2uO+B+1Q2
 sw0VFdAy8av6CjDxp0R5x5L1H4wsITECPovkmi8NRN6VlxmAzUHnCffLMku3/vxSGAo3/0Z7ZAP
 DJGtcej4uG74hLdUQyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

QCS8300 shares the same IFE/CSID pixel path hardware as SA8775P, with
one difference: QCS8300 has 3 CSIPHYs (0-2) while SA8775P has 4
(0-3).

Add csiphy_res_qcs8300_pix with streams_enable set on each entry, as
required by the CSID pixel path driver, and a qcs8300_pix_resources
table that reuses the SA8775P CSID/IFE/TPG resources together with
the QCS8300 ICC bandwidth paths.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 84 +++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a0b51c12c0bf..4233357321c0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4469,6 +4469,72 @@ static const struct camss_subdev_resources csiphy_res_sa8775p_pix[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_qcs8300_pix[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct camss_ife_stream csid_ife_streams_sa8775p_pix[] = {
 	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
 	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
@@ -6698,6 +6764,23 @@ static const struct camss_resources sa8775p_pix_resources = {
 	.link_entities = camss_ife_link_entities
 };
 
+static const struct camss_resources qcs8300_pix_resources = {
+	.version = CAMSS_8300,
+	.csiphy_res = csiphy_res_qcs8300_pix,
+	.tpg_res = tpg_res_8775p,
+	.csid_res = csid_res_sa8775p_pix,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.ife_res = ife_res_sa8775p_pix,
+	.icc_res = icc_res_qcs8300,
+	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_qcs8300_pix),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_sa8775p_pix),
+	.ife_num = 2,
+	.ife_lite_num = 5,
+	.link_entities = camss_ife_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -6873,6 +6956,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sa8775p-camss-pix", .data = &sa8775p_pix_resources },
+	{ .compatible = "qcom,qcs8300-camss-pix", .data = &qcs8300_pix_resources },
 	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
-- 
2.34.1


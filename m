Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C147D938
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363834; cv=none; b=Kn/K74K6r1Wp/8DU8+fhJdca0PEVo/K71CS2Qrj06zq3e4lGGBe8muh+mkmtMg2DFWwQQDyEby6N6YNWEMdOamwcJP0ubE3uQLLUOpH84ZWK4bdajq/Bu3PGM9vyZQeS6c0bGZP2qH2/T7gNBKIOP0P7avreKQPBB2L+LLQ4xLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363834; c=relaxed/simple;
	bh=KLQl3/gkN7fpypq9JiohBczcREnomw91nTQIXeaxcVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jVkODi4j+QW7asmw66ONYPCcvNbd1GFCJgaXwuqZH/msLzO5151JDTmcmixa9+HGB4E/5a/V9MZS9AJgis7Cv5ZVx8Zr+k03MyroL1FWI2h0dHkXrHaCCDx0xCccAY5opgPUJ56XuEQBrob/uHp8l2pcdUjuSiaas+23hgJV904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I08wARvT reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I08wARvT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k9VI2711786
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yzn1zhhPwSq
	lWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=; b=I08wARvTzzs83+xEOai4teFSnHR
	Npnjhq2sH5+AzH7sg5cqzB+n8Euyee1mBJsoGvz3/h42aRWQRlVto1RoKI/c0gXY
	JB3JOikOG5VyURtW+nEzmgcY7/gyIgunqOo/cTOhSQzIuhgjRA1PWHg9w46Vcd/U
	f7F+LOHjKvgXVONoRuKttgltsmjwvCJD/A39YS6p4mLA/QmWhI/HTdYipd/TlPni
	Hjniam31Z0YBACEinaKmuRPHuP4ljzb2pb1PvsPDcVTRI1olVFVsuiGm4N4Z5Vid
	vSfBAcqhqgwOE4Jz724FoXvM9fT20rZg7jQeFHC4VIxicl2CudtnjOKh99g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1dc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:03:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caa0ce0cdso464864885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363801; x=1791968601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzn1zhhPwSqlWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=;
        b=auauYqEY3sF7lRbslKd5P5at5JrKp3IpJOGErThvQydZ0HgC5c35bvBYh2bkP6CEdS
         rW7TgqfTI/iPMz+1QK1icqhToHOfJjMVK79sc7laH6tNODT/9uaVQPkO1TV7ep8tTR6m
         B7f+RxgljlnkSKjdxgZSr4/W0NAtHdowfya6PyzA/riqz5W7dzwJ9Oiz8htxJREElvE9
         qrZ1GlbVonn8wP2q5hr+IVhLZHiSxlwSWzggp/D5dJjITrahJYNQtG5Alp8J7jtmJnYK
         2KamUudvQF/Gugtq4dBcIaBjB/VU3tprmHPB1XJ/cNJm8hfKgrRGkUmGeTsaHjEtvIzR
         eJaw==
X-Forwarded-Encrypted: i=1; AKwUvBzq1JJGsj6R+SfH5dkqe1grrBFTEbN3wzTWiZDnU7KXZKT2iDIsPVc3ZzKgKqcWrfcvIT4nAdTTJuwrUuI=@vger.kernel.org
X-Gm-Message-State: AFuF++k5yF+rmSw55krTMIZflJdA5RnAH94i/V3Ho8Hd3Y7iIZc3wFGt
	VSDK99rtryASdjr5s5/mOG6XeUrbmE2kTNi1TGiO0X1stE5SnX33ktDqcMXYpHf/R3zRFCfiZd+
	rHRbcaIA4VXDGfTWHxLO+H+cH3FVX+L95pcRnTftrzTP5utbuiRVmtR2eVItAxr3WXVU=
X-Gm-Gg: AYBFou0pweEGU5aDvO2l2H20sePCI+OyzVsyGgwz9Q5FoWfefK4HQnja3ZfvNzONTwD
	tjuZoM7uwrYG1kPOBqycjABB9MYNNBnHVHjZIymZAcrmr7h09ma1mcj4LsaI2SNDT9B677OmuoL
	QX6Y/2ft8uGGvhJnfh6IoMGReX3dJkLuuqS1SZNI09og65/K40npu8fiZh/mdmOzrr+X9hGol1O
	Dk7DpEvZ2apRTJYh23h2QaLyBMKBUkbJgrz7FOtYpmBTdeEkgKS2k+Gac5B8gtswepK5Zq+U26M
	fVzL7ENQ2KcDws1hJLGlcb82pb9SmeMryXu2gQwXzFEi/W7RWd0ixPnQR0Y=
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-93e9b757fe3mr304086985a.31.1791363801030;
        Wed, 07 Oct 2026 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-93e9b757fe3mr304080485a.31.1791363800507;
        Wed, 07 Oct 2026 02:03:20 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:19 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 45/45] media: qcom: camss: sa8775p: add pixel path resources for QCS8300
Date: Wed,  7 Oct 2026 12:00:41 +0300
Message-Id: <20261007090041.3732717-46-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aaqBAwqevtHghjVOIh5bkkctIWC7KKLx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXynmtoPhQGP2d
 uIjM8kEB0VcFCViMv+gPknyZA0Bk0PNvcFcGu1Fo4QBCGr5hHTgjgYGx+1ceDvZFeAq8k+yD+GT
 P9XeOGLlx3sG2MKSqs37Dq22OchuCebntUlrl7KcT3yimCbMGGYstBOjXcuF/CPVwH5nCMyc9+J
 RfDRavK4iM6vKYLqT8KAAGSEZUJXQVdtZ8bgAgdV8icLUfAYDnuXhO/y7oR0iKWyBpRfU7hB9ZR
 ezgUSZ9VCK1XEQhlujH4YIrf4AvbYPDo5YPAFQtGikdqoZu//Lg4H/2GgetOlra+VMlNe3y1PdO
 0EXNicfWimD5GxYKebJ89T5C7+H5BnvvV4sluX2ub1aE/ZFUcDMFIP1kwLZIi3PTgLhUGyHGtCd
 g6vkxmwsdanW5H6qnS1citj6J/k7MoXHQTZKl8DtTpJ+f//oL8dXA72sTrpWtH9zikYxgFqQ4SC
 5Zh0VfCjswGj5giHmuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+CiYzajtDljn
 krKsgeQritdRyG5xRUui+hs5qSzox1BaRWzcDVji4DKBkOI2gzkV9T7/I4xxSGJmZMtAG59u0KP
 AqUDF6qwHjMgiElcd++0P90xcLdc424=
X-Proofpoint-GUID: aaqBAwqevtHghjVOIh5bkkctIWC7KKLx
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60ada cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=9gHn7dWuMxK2nO1hvMwA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

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


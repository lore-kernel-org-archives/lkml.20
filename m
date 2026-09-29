Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C23FFF8E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661657; cv=none; b=P0tILX5fkbihcvaITqehmqlRPjCu+duJrrpkVzlC/wev5LVBoSqG0nF3gEoK+lEj1yzNfWeLge5D4sTeV/TLz63dbPtON2G29kKYysqw8fxyB0RLSKElMAsd9A0fx9fY8GgWScdFlhEqNkyJ+H0vX27ncXDvwfKkKHkiTTpiWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661657; c=relaxed/simple;
	bh=m8gv4+3/+/hcZ87ZSHNw+eRuWVh9hnpJPxyC+2Fvwc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUZ8+FOAF9DXiTXGrNjsUZO19rdKvrumV5v2cviidt3bhqzwj2smITauIaIDJtmLCjl/ehEtTIQUr2tTRzv4udKQZApyvjmeUIBHNO92eEkwwiItmf6SfsZ2dtvNEGvnAODzQjUMVfJozIg/5tXI1gKshINcOhhfAD4yX/NQ/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK1dJ0jw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISuS4WB/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dK1dJ0jw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISuS4WB/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47h3G3654914
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgHuca7E3dyRGxmIFRYzs6C2ZPOXLeErCr2coZ41iRc=; b=dK1dJ0jwhsy+1muN
	y0Xt4wtRzHA/zHBtb/8MuXBsPi0F4on6BHtS6hQzt5tG2cGOdPc6dcLiNKGIiqlO
	x4AAu9GgiEeX8hW6UMOeMZ5KXZK4W8t5JnrJn/hl27Hd1abvRwSvRQHAiy4hmNSk
	lhD015DOKPBY5fBohpYXo/BSwdP5wCSZByNm/gPTM6J+dZf3VlCID6Tru6hS8fF0
	ShZyZeXdWaBzaiu85duSAt+UEm+QzMlhN8Yy3kYjnjOnfy1T+3vrp2oXsNzzHcfG
	EzJE25qa9zsNxqF91FoRT0dhcR1hrrTYd/bm8A5LFq8psR5SpPOwoLdUyNKcxw3i
	Jxa7bw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0w2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so4408327a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661651; x=1791266451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgHuca7E3dyRGxmIFRYzs6C2ZPOXLeErCr2coZ41iRc=;
        b=ISuS4WB/lcyz2fYIfQ140nToE5Vm91HemYHxECQ8xjO6IZ5O/gDYJ+jAttsCUHJn6u
         bdOZumEWSqH1Gk5pVD/9BwtRzmrpV0GCp710qZE8ny/HMyjn1ilrK/pxdTnjruHLiig5
         FR8dUOmpo2kVs7kYOmDjBc5bnKtinPe9NkA7I+83qsFQFSZvJtEPpUPhPT7EO5LJKBaT
         lfugBQZdHAl0N9LgChEo2+eVi1V7OFd/sXXbDCzAp7h22eIBx1stRzaQEgYfjs7436xS
         YVjq0yRan8ftbxFl8/f3CXMmbg6KhFg0qN8SSkJZy8/x23yvXY3qbT1dgagH+izj9JW+
         u7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661651; x=1791266451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgHuca7E3dyRGxmIFRYzs6C2ZPOXLeErCr2coZ41iRc=;
        b=bk02Czg18Ub3FMWu5N1SncVFZmg9/dYe3K2BLOwEWjTPyMpVKtQMvLju18ivtNE/Py
         FqoixJv6GtYKb2HBlZverJa5c7bMI/4gcxXK8I10mMXrePV/w7vDAzASs4WFb8MiVWrc
         CAeKvy56++GpeX8dTbQlx+yEwgi0U1PbTpTS16UyWfT7YHcdJLy1LxGK0GfeBX+ODPEn
         hUVRTteh2L/Y+Ax4vDDUbHdUDN1A9BxObYanQXeWqKVUtEEMDmpfaTXH3f3F/UJRrZO3
         ghXWYoI2A7IjRL7ImEI+w2naWLPs3am6kp3b59YGApQQ8R+cI3BbDZ4rPTLlUe7vnMgp
         YL/g==
X-Forwarded-Encrypted: i=1; AKwUvBzkHQ0lCs3yHNECiJrM4w4WKvQUslYWZXcyumfEVPpJ9gTYf1gwJOE8wLsTJPuRzZvCOfucnx4D0/Q3adQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEfXI8PT8+lURejvvqKufedBb6CPysNyu4MoZ0npJRlicfv5Fp
	zGxwn47aj+0uZI6ao90u6Pd3pVgbSzUAzpMPg9Hn9FdiVOWjzGkS/1RNxONCmdrTINCwkNppb0j
	RWFP91FF2aaVEjqS9OdfDxnudYp3xJc7/PKORJFMnAf9CNGHcoU0I8RYvUtJnpFUl9kk=
X-Gm-Gg: AYBFou3Gv+vTPwRw9UJUX92lsM94Q5PGWf2hkvDkc58NELkz/81gSVu/bL0QCOgdaza
	z8r21hhOzeB/LESv7zoF2I9BLpJYvqm0RBm7qdi4Ns8AmDlvHIbRPy6GcjXYF1Q9flIpqUYUkRw
	BzRn95pmQOz75GH1Htq6uuFD4O0fGXFHE1TL6c8Q1kVcmZOIpkZSmwv8b1Abx09e2g8u8wXUanM
	dRCJ9GOJgpSoVYr50RWnIip05bCUnIqi9mPBCaxlJTgKFOTwcVKPTY0AVMtqub2FN+lUU6kAkw/
	A1m+8W96D/9qVZLxF/9hZxfkKcZ3bMsqWtJ8hWTbhvf5SvCfZcgtFULHryIqXduUs04ivmexE6P
	BLn2+07amYIvkWmCuSxj+5gASRgDOaXt2KulEyiTWzR3wwi7o9jjInzYQWBf8g+7BXIGVECOy3W
	62YdXDa3zuHuJXO6Rff5VA
X-Received: by 2002:a17:90b:2f8f:b0:3a4:6ff5:777 with SMTP id 98e67ed59e1d1-3a46ff510d8mr2069785a91.43.1790661650533;
        Mon, 28 Sep 2026 23:00:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2f8f:b0:3a4:6ff5:777 with SMTP id 98e67ed59e1d1-3a46ff510d8mr2069754a91.43.1790661649997;
        Mon, 28 Sep 2026 23:00:49 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:49 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:31 -0700
Subject: [PATCH v17 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-5-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX6KsFormTq6ME
 SyCXqLqH9GFzgaBqg5/uoYwKYOXJ+OcBKgMclg0VzikzAzB9sKoSySCUYtAvqHeaXeW3eCWsGiN
 NaxIVXZi8LBdwbUwANSluDiVukdV/A0=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb5413 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX0CqZfQ79DaQA
 23d0cdfckKFtQQj34KLYvDOsbuMcvoqQja9aZ3GWgUJpnrZIB/5bW6J2aHY4gKf5I/zoJQnn1ce
 vHytZFw6qQ+ZAIKz5b+uca81lg/34W4CHZp7q3YZGAZHnUVSpAq1fp0OhVm8nfnvbN/lIOGaWSk
 uTi2FrB6J3dwDSUlTe9+qwCh416qisvw4B1reREgke1PunzXjNBo1pc54pE5v1AzrX6Zkx+HGwm
 9k8WGQCu3BWzbP7sFj3ot/+kZ2vsXDqbV3Paflp10QJSZBWP7Fn62Zc1xxIZjGSR1DNndN+fkKy
 Cb7VcGjWxkfxbYkjqC+Vdxp30kFnhTYa+8fdugKP2VuCHVZQbG+2OJgfzKqLHqoVvRODNpkWPDc
 uUnJzZCTdbZPkNS1usscVaqWaUjNNEZXBGaKlJfdhYPi+tzTRxcC7GfdotOaBwPFkI+wnNo8GsB
 vmFCgg7/QBTEs/lwZuA==
X-Proofpoint-GUID: sFOE_WbxGG2Lr4xNmi6WjhRLb0_XkYlg
X-Proofpoint-ORIG-GUID: sFOE_WbxGG2Lr4xNmi6WjhRLb0_XkYlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adding Kaanapali power domain and
register the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a528760487bd..a0cd839c9948 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5517,8 +5568,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1


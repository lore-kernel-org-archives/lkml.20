Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3B4CCDF8;
	Wed, 16 Sep 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554070; cv=none; b=ripuLHS7b0gscc3K+GqOTek/cDJWfAwD744RcMdtyDKkrV9O7vAW0WQByWVdN4fvo+2xI4hr7aEJwqpNTaGXNfbL2GNhu+o8UtQ9sH1g5Da1r+nFNIiVYD0VMQaqrdVtxhcaSzSjzU5nFb9M4q+XGc4aqyx9sOczUJABMiNpKe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554070; c=relaxed/simple;
	bh=FmAX+jKO35Zjtl+UNVrS/byYPOUez2epKPExG80AaYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXuDZvHyKri/IEQGb+C9CP5hu4kRYvitgbtAhaLEPNFiGO2t8wy2MKAyPzqEr54x7NB/HXhzEtLSkwjvE9oFCb8to/txeMRzpA+6pDrZpBScqOmSZkEah4KRipNjDBbDCu1kl7YUcpEavrqzUEZ6MyYxnEtBOePJ5QyeLQjw9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ0QFHCY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJ0QFHCY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AZc2658312;
	Wed, 16 Sep 2026 10:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dXHHbZTLJBE
	zUmKgE3QSAEo9S7wSLJ92RUbppCDM/vw=; b=HJ0QFHCYq7bIpMaZw+S++tLzCfK
	mzL79TstAz2aYoYHDO3To9CBomj5ma2t3mT7hO3zB2EN23GlcMvjPMIRCbA5ddWV
	NtT5cHMbXWXDTtmiA3UPwlWbRjBe0/XPQwUjnYYP07c4kZwO04WfZfQiRJ+3cxzG
	8jjv8gO8RIyvWoxw2ycy9KwqU/pthe3Z6YT27je+LXVlWGqF+ma3bSRzJBWxN+KZ
	xXQQQKbrrqU9Yz+KLmEMYQV6LOwhJp+21yVLfxp+ow4TY5i9TzukWIFQn7uBp2xn
	Ghva1H/JszOs93yka5j9ao7HSqWorOBMdEeO8xmiVaMR2SesBg+AZ75Z5ew==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuj9cc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:31 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68GAKTm01172516;
	Wed, 16 Sep 2026 10:20:29 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 68GAKSke1172495
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 10:20:28 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 5C791490A5; Wed, 16 Sep 2026 18:20:27 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300 and SA8775p PHY
Date: Wed, 16 Sep 2026 18:20:21 +0800
Message-ID: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfX7/CFcsWyoFH9
 oAXDv8pZWXKSODWHGrCWtP4eLMtj+ToNlT/ChFLz4pFZ6KkFPlU/8KmsFvNwWdE67wATnc7gCdi
 snPejXtstXlwykCEWTpBwUKBKQEC7BaDBZc0m64aDMbYRpDhYNRAGVj7t/5wrcMrLYrt0cLBbl9
 g4Tjj3eBCSyouFwe82CU2NSE7L2T52aMdXDnzoBKGY1dQcYW4YDKzxQp01BGpFH4nIZJajCGKq0
 JRHLbtEffNz1I1X1EA2CrLhDrylb4GyIhHhJeGaO0URtk9cT10/wzUjFdCboaKNP8s2XzaSD/vo
 mGfDREl+Tab7w0o5elSoaWUSVQUdRHR/yq2T8G9xYg4KtnUIo8gWmfWOBW3gMdz7emQYRCPmfbU
 EnWaZ9O/QGkp6o85V9P2MfAqQL54v4zandk7w4A4V2Q8EkFfM+SIYBo6IP0Pb2g3tW926ir7EPC
 nAkMw54FL96ZnEX9BrA==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6d6f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=OsgD8QZnXcwMXfPDsqQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNSBTYWx0ZWRfX0brNNLmMIipF
 Ov7eaWkf5UVOHsEINN+DT7syhLFoAxFrL6+3UknzApAC+4uMOwbtT3k6cLqnsNuFv4KwyomzZWT
 DNexv3elJsA2QRtvkH4fecflHqgMeQU=
X-Proofpoint-GUID: OSaUY4oLtttsREI1NddhqNVaZEwPtQGO
X-Proofpoint-ORIG-GUID: OSaUY4oLtttsREI1NddhqNVaZEwPtQGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160135

Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
and SA8775p PCIe PHY configurations. This avoids modifying
sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.

These supplies were missing from the original driver, which was found
to be the root cause of occasional system crashes observed on QCS8300
and SA8775p platforms. Without voting for these supplies, the PCIe PHY
lacks stable reference clock and voltage, so the PHY never becomes
ready and initialization times out:

  [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
  [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110

Note that due to a hardware issue, QREF actually depends on refgen3
rather than refgen2 as documented; refgen3 is therefore voted manually
via the refgen supply as a workaround.

Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index da83358c97ea..ab81c6e584a8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-qref",
 };
 
+static const char * const sa8775p_qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
+};
+
 /* list of resets */
 static const char * const ipq8074_pciephy_reset_l[] = {
 	"phy", "common",
@@ -4585,8 +4589,8 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -5324,8 +5328,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -5365,8 +5369,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sa8775p_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
 	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-- 
2.43.0


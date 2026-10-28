Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164853;
	b=I2IOPXgUEOP+4JA/W7tCkYXJG4z6L65i4wYvhBiUdo6xXTRvW3hsY7I3SSUBxToo42W0
	 cJBVlei47dP0qcyczyFelVSqUwjHub5myEz1TH0u9xhahkG3C/i3le9e1L/yGPH/csYif
	 7q1gANHl2BKn7byN/iZVVYWZVi3b7r8gbtgi92nwTWtRavGzs+NhsB9bXigKWwuIQR4Gf
	 tzyUItu9nZhmCoOfhjlY2dx0tPJ6sKEEfDtKnsdR80dOee6dtckzln6CFLLB/Gh71oxI8
	 WtYLwSn7s0L1RPObMccT+ki2huo6ElYMDnDWcKS4/sJUoAaYRM0N8fRW8E5qiTDV4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
	b=ps2hBCjqOsCuWw5ie9lo5WDilP/ikCNMPPrHijmibcbFY+/Z9q3oP1+v23l+R1FLRrRh
	 +o2LiF+iFowQBLRFnlsf/3Q2wRWKDAxdTv21ellVZtGGNGVtWaA/DkS14ysuwZiv4nthu
	 OnHYXk8w5yxpp7xjN2uThnB0tB7ANa1CfbPBy9zyDVrABvM37001rlSlDhOW24lm5R8Ud
	 QNeciRBtt/hV31Q64djn621OCrVHYSIUDiDQVUX+1U0xOSlct7nus2/PJnK1Awe8geF7L
	 n2NI75Jg4B++WUtEPzGWBfWPvVSZyubdYnKKZUy0gSZ04EK+i0XosbbEuvY+5VJzA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHvogaIH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX2e78Ro;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D1C606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D1C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHvogaIH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX2e78Ro
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUXO588047
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2
	WejFiR7c=; b=OHvogaIH/L1RHMTOXYkphNDO0/nomLFtdBvhAuuSP16rRlLciQn
	1HHWZ3D8nXTlnw29YwkO9P66HCRJ1AH/DaE2KSs4Bw2RKLhL1EEZkmh64nOaIkuD
	IcM27NFGQQuT0VtNEzjQR5m2rRVOme4d45zIVerHeMu6RhlTpjCbg7qsR+jbl3lK
	oWJg9QrsUjMrPTRTC8IVTXjZmIpi/KIcKFJT8Lwy6c9vUGOIRRnCaOR6p4TbsBbT
	ZTObuv4ZMukoGI73GbQTgcILXV+AzGlPHHlfnlIBht8iM4nPvle+tV1/vA0M92Wo
	klqoCTc2xEueCkMkLv83fxbc4bvoe8OF4iw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk2qe1mca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:20:50 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-706eded47cfso894087eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793164850; x=1793769650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
        b=RX2e78RoFowbfF1A3+QEei7Q1TjT1psU2IoCAkT/juyVkbtn2SKuZe2cKu9/xuE09R
         JkzWmG41NAfzHf1z40H6oJ+JU6g7RDRkjE70jWLFeWWd6lirH+HSIHVBCPgY08oN2PP3
         hbOeVnNIJ1XodhQLa7rXI/ymCt+KJ0dXZMOBxqed7jMSo2vN74JYj3YhGSCtDak6Jiwi
         F+Z/+V6OsX4NxgSHjw1BNbp4XS7qhyetkfkbWGbFWnBHr+R4wt+ThKaS1qQ1JVBCSENi
         Thly+m4eXmLPCFYsk7C3cE9ENVReC0o90xJL+oSDinkWf6RSNUj6jn35tjujrsIOlaqB
         CYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164850; x=1793769650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
        b=2S5Q/U1XswSiJ5OQCtvU9rnRRxP3izZ89mUk48tLscBfAXjEeueP+cxAKlHUrehRea
         i1pKwsgtZn8bgjw1YY77q8oPPl1UGrK8SBMW7drZmJtPdfY60181fEemqbS0fZCJsJxT
         MNTy6qmIPlkQWUe3YByXgzs6lvBiIslTH9cdL1A0V4gDfpfwSkfNg3k8iw2eeFqmbTEC
         exKsHPw/0Lu97fjT2yQ8273DXMQwntw/71N0CS33ivZm7lwK3E4dRnvV3ITJHuKIO9Gp
         58j7n/5XQxvqFOT31DZOvlofi00rYQEhWtlAkpK6kpvmlUTMaLcyx4yaQAKdj27hbAOS
         1/uw==
X-Forwarded-Encrypted: i=1; AKwUvBzM2brS5fIyXZlL9icUQh+xUyDzwCBD0LSpNKgcVeT1rkTig4q4hdI+4v82sXPxF2h03TU5M7vm0FciKqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp7dr+Nh6MEG5YG/nqawaQU0lXHclXEvD4fukRBdEyP+w3t9VS
	C/XbsRgp0+MSUbFgpQboELtZcSTcQQEofUiZM6+6bD2Z4hK1/7bz3rCy8W79uT/9gKy4fAclzvr
	ZkGcuUVFCDxqEcRqS/e/NYQGsI4iOJJwgkhsWhqB3ijPx4Bn0LZxTp+w7DiM7AjYVClY=
X-Gm-Gg: AYBFou3iK9uXDIVKN6ASJRkn7B5aae3+qIEo/VpJksj3XtOdf/xrFARHwFZLQAAX72M
	I2FEkYIPovm5ECldWiegTLDq2nNF2W5LsnjnixP7fisgd5aurWZbkAxDk6vmnF7hw3TPZsRu9UL
	uVsRWjq0nKgli2/GSVgyNhCWpNv7uliG5p5qUFHTY633QAsg0ZV8mdHy6xw2topb1OgTo3YncJU
	+uhLmjw2PrJret/aKtpJgvpu7n45MjJD6L5XjyuBKjB2Kby89sjj5eBKlln9zmXaszPWft7LVYA
	5bi/KGAfL77/NQehZzXKZqBCtCQTdSN0Gi84o6HPdJXhMDHZKZNlCkdOhJq/+gRWGKuZPSB/UoE
	Ist71hp7RgzXr3Y7TPkkYpJ9zezEkUt2mBhIVVA43BAjZ7MirXTBt4qSPCSyvvKJohBalsNqv2W
	6M0YH+gxxKHcauAkZTH7M8gybIuG8=
X-Received: by 2002:a05:6820:1508:b0:6c9:80d9:5f5 with SMTP id 006d021491bc7-713f1c562c1mr725671eaf.54.1793164850151;
        Tue, 27 Oct 2026 22:20:50 -0700 (PDT)
X-Received: by 2002:a05:6820:1508:b0:6c9:80d9:5f5 with SMTP id 006d021491bc7-713f1c562c1mr725665eaf.54.1793164849713;
        Tue, 27 Oct 2026 22:20:49 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142bb765a3sm653720eaf.4.2026.10.27.22.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:20:49 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom-mipi-csi2: Add support for single power-domain SoCs
Date: Tue, 27 Oct 2026 22:20:47 -0700
Message-Id: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c9rm6XQvoz4_5Oq0raq_zUOF4mcyV39Z
X-Authority-Analysis: v=2.4 cv=YuGa1IYX c=1 sm=1 tr=0 ts=6ae18632 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfXxSO1RdAvkzyK
 BBYCL7R+m6OIDBfWNh4PFN6fi6zLLkubX8X0lmzYkGeOu1rxQSiFRd3ak4rdXu6LUdaivULx+Eu
 kVCaIePqdWi2GzmFvQe2vG1xAXeZdJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX9Ipm59YGMF5B
 vSZhRkwxLwj02Ob6FZpVQkWy4N7RzknlTTdOjMApDtArIx8r5PhhJhxx7Wl+Max5G2NDu+u5Dfb
 i2/sxlmovJxHtrELsyaXcdrH+C1nyqGXKqc9Bpg2BfHvRndQAzrmZeZF/8vjXP3xDyT3XBjVbix
 wJNBI7ZpW0Pln3qN8ZO9hyWJq1uNyHacVflUzqIhg44VDnJcmwa5mthhfTjKJuDS73sd9km7P+8
 tcvIfD+jKEsGxNttmmLzegMvVvGXM5J95nSoHvnv2WsQbBjub3p59LIKQoexMsF2YjC0qp9UXBI
 2DQ8fzPU16scHfKyY46FGz4U7J9w6i9/l4ASZ95rMlGl9DI0HdxDP+1eB9s7cPcplyOr1ZB91u3
 rql5Hbfx1Ol7dPOvXRxs0SxDLuf5hQrteoSDwgF5uJpVFNBxBhDjL1BaL9HoQ9vR4Z7tQkLxRHA
 fUMV49nPOK+JxoO7S0A==
X-Proofpoint-ORIG-GUID: c9rm6XQvoz4_5Oq0raq_zUOF4mcyV39Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280021

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
  failed with error -17

x1e80100 is unaffected: it lists three power-domains, so the generic
code does not auto-attach any of them (auto-attach only applies to
single-power-domain devices); the driver's explicit attach is the
only one that runs.

For the single power-domain case, call dev_pm_domain_attach() instead
of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
is already set, so csi2phy->pd_list is left NULL rather than built up
by hand. The three call sites that walk pd_list for genpd
performance-state scaling now guard against a NULL pd_list, which is
harmless since scaling is unused (scaled = false) on every SoC that has
a single "top" domain.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..ac25e1e5f1c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	}
 
 	pstate = 0;
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		unsigned int perf;
 
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
@@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
 unset_rate:
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
 
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	const char **pd_names;
 	int i;
 
+	/* Single power-domain devices are already attached by the bus core. */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
+
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
 				GFP_KERNEL);
@@ -369,11 +373,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
-	if (ret < 0 || csi2phy->pd_list == NULL) {
-		if (ret == 0)
-			ret = -ENODEV;
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
-	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
-- 
2.34.1


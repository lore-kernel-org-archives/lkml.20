Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905237;
	b=ahZc7bARv9CI289ZnDTn/MCQ+bkArwLemLYcTdEpq0YR9RPgnA6EciUS2fwP2VDl5G5F
	 ChZme36R0ufTNled87E2coUBcZ+lcAjCdnq3F8O2usED7tori0A+590VoexkQhk+tH7vl
	 3PLBPeaBbZSRNVRvbZYtUDeEVQCFTP5arVOIrHp1f+X1wdEKmShH/Cy8fpus4nsubRx04
	 G/5d+RRu8HevL0i9AxRPrx3r0sZCRkz34ntCF9sCqn6Vq0mcJLfl53ArmxXhlG5NLMtel
	 J5uycOBQP5SAChE9fOh4YortU0PZ3SLAOp0SBxzxkudjEM56nlbpgp9yOJQhDN8hf4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
	b=fyQqMOHWFc3Bp+lzYKCVEJ+MpoLXBdhLrz3cTTEJFdgktWqhLD/Dm/bsT8N5dUh+OfnV
	 o+UhEhUy9cq0CCNZHeiY2dvH5RPMXBnNzmoZ1ywJ/3HWE8zKPqDgIWgIKpTDL1+wcyQni
	 t1T1CoSsazFGmQrnXQpdMWJHJTwPmDY3iEVqOmwBOSrlUADcN8eN2JKRRE/vnJk+W8TIc
	 ovDo3HOVhGuz9Qw5MdPmjrB4dtsr2thwlPKvGPc5nqWhdrC8ZDJ1oSn5qpckC0eLbF8MG
	 nsZkM1ZUmRhmT/PJ2tgZUNo6umpQvX6QxFvav8w9pAs7my4cmkk9EFrylJaBAaXPqZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLkXgHm3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2tutv1X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15037606A8B2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15037606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLkXgHm3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2tutv1X
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH534BP3457915
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=; b=lLkXgHm3k4woliRv
	2hW7+wmcv439q5CFaB6tpO1Tk8vus/KHagA9u0U02zYAcz1CiHIzXrB+6SLU6xfL
	YAyThxtwwimX8+8zW9BphQR68TtLRfgGWwJ7U+jl4Yd9EkJHC+A/rFqSAJWoycdV
	rdF1WqwwIdUE0pz1K85wNy9RWi4oHjpCGrggufAosog5yCjF4ex3oNRbkhV6Vi5I
	PrnztpeXXXGoXjSy9njLM8Z6JEFQcqLIOdb4lHOsKNz+ChJbNhfdhU2xwnls7pOV
	7G8bFcufb7Kado+m+4vIGFoYtVT8P9qBB4rVo6hSiVxwFZpVH/G0F1V3Wu7wg1ib
	j3q0rA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8smy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:47:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2918252b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905231; x=1795510031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=B2tutv1XNX6giCOpEKdXCPL49jgdll73hz8FBM7IiAcrlFzJhuWxptoYvrcOWE7s5V
         fGQAiAqHf1Oi3b3POpFkApG1NnnkfBXPJuNUgd6iS7jZWlRzVTuV2UePTjAgpNk2wKKJ
         fCnTiNN689atszAegI+v5Iu984OyJf3qzcH1CbVZ04ADg55l+ME8neMuD6tlOeTwaGMo
         YvErEHJxds1k+eJtI/3WCiMF69ucvuPuV20aSlPJJnMuQOQbGLn7FKXbXghivzoluEIR
         bVBVXfWZDOh+vYlSF2RjnBZYWjsEgb/Rb8Wy6eoR+vlNYrXAcGnSiorcV/XKX1XLhzbB
         be2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905231; x=1795510031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4WcPxpOFf+3oRRhFi8kiuZFlM63cls3DRsyxGrkS4Y=;
        b=tTMA9k6xph/UWODFdSBI0siuDsP37UvNjgd117BwuxlJKwpT1YtOnajHGhx8dzYOjA
         3KNABI4pWZAulwdoENnvzbTuJYV/6DIJFhuGTv7bxVF+mbhP6dsAn0DoVhr29CHQH2gy
         +wXIZ7HiezBRt6zorZR7pNLh5kti31+hnDxunbqZ728/qredi4R8J5B4gbUPsVmOYd5B
         c5BMgx5xlsusnjmHmsbM+EyvZYWD7HKGLNQcUF1NtbXwnPOHS3+bkDg02UwHktHXJJ8y
         zMLsWofYMgskFpETAfCRD0dcvWQzMBzGqpwqsn9i1/yRTw4IcJWnUK/PXj/nhhWHA7g1
         id9g==
X-Forwarded-Encrypted: i=1; AL+hErFMwP+8ZenMTHex1tatkMKRk8Xudirr4AhBtRmSwZHbiAXf5Cd7xmbNgJBB6ewoFzzCM+YCoVQ0tcYGsq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dkdM7UFzltBh+U1/L8kVYRAUN8NjA34/oWARgAZvsYLzvChSF
	DB/bvpJ9LCpm1UnEDNlnOQ1mcAM/C/N7PeSXuRvggnOilcpY7MyNppVsO3DRvC10khBUmFyYHME
	hX2Q/uMHtnUV7vPi43keirxOxEHrZSM1gWtcMWTuh8Xit1m4P3Ssd7rlecz9JtMpi52I=
X-Gm-Gg: AYBFou1OSNOoyuPyOLs5NZnmQfSJTZH1otXtfJBMhO4fZbrh4ZcdmWh/Hza36zB0Mmx
	nRROsTQkDTj4N8Vv9AbJb2veAxzawIuLPsKjIKE0yMifMhuM5KKvlwP2K1QVbUnJU1NPaIS7I5D
	FTXZpL+Jidy9X118Qlc0C21Y89+06PXxhVX6wtbyQpTM1ndgmEeWVwf6GwFZ1DAcTfuDS27t+Hz
	iNdcw+D51kcX9zEhJNUlb5CDI2Ee94UgxlBnwDZ5Vlb961/a7Rni/obIyQEKpASCFDbNWld2GKf
	4m6Xq8z2i/pqf4UyBpTJk293C1Jjbqr/d4sXeU1ol01XIqazy/zap8fa3nX+rge4ub41fc4QVvk
	cxCm2AL6AvogxJQd8MvZBP9ttDLEcR+NOWBeBvx9gc6uHedvn7ILQ1GLUbUB7D9qXOINmRIm5hB
	rByA==
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052486637.65.1794905230878;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
X-Received: by 2002:a05:6a21:e109:b0:3e2:97ac:274e with SMTP id adf61e73a8af0-3f7a9cff089mr13052430637.65.1794905230269;
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:10 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:29 +0530
Subject: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2688;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=LmuklvsOLR/r7//hiFZqjpLls6fBHeuS30WVohG1EGA=;
 b=NfMTTvibJR3V/sBQTsSWiWlUhRk02rFjcgYQ4c8QIJvCBToeew1dVgAOB3072Sjor39HLf/r7
 uC1cHtl7qB9BOleyFTAe9ZEVacRFORSL9I/LuHK7Sq47guXnOaGZhUC
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: YankMqVi0Fpq7jsxXxACsEqYXf1m8Fgy
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc1490 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tY1s7WPN8UR3DqbNSpoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: YankMqVi0Fpq7jsxXxACsEqYXf1m8Fgy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX1ALq3F7Z6zPN
 3Jobo/Cvw+ysankUD6CP3Tn2u0Gh5RIXPQPf8aYcb9k34ib+rlzTVrhsXccNsPxOba+oqFuRTMV
 xn+mJ8asOTgpiUFch+vwv2e/8eDZIkA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXwsT+n8SkGM6e
 LMRuFgPLULuKyu+mbR+X1p6O1ly2HH4kd0ZeYAhLsOaasC8anwKUjeK3ZjijhqqtBiKf15uBF/S
 Q8+I5IKgFK4wwgDdCEcxhVxZ1FmkZITc5fWPeGeAr3WYgme1CkgsBLHueuWsJxlqbjGFkFrPP4P
 rQVyzg0Js+DHse7bJCs8uAmYrQd65LKFk+VjaZCCqXNPh+347M/Y4jz5TSwNkh45W+cCf0AVHRu
 upbkSIqilg8I4O8R1htPJqO9a2ckESdJageIAxxsOzAQPUOxxlQJRB354UJX6udSgkwv2mY9px1
 JMAx84YJNkOou9V033NhsVeiNlqEJ4PPl0E7Jl2tyzavxzs3NlsFEuorcN3hNe9LWUmF/sMV0A8
 4lIokaYtT4IvppXK5d/o8fE2vGR0rpzRr0DG/3hXa5Au1r3vyRUVMVhRAiBUhCfPAwa8CF6Impu
 VqxRVQmYESM9jiOEfLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
and the 36-bit DMA address width.

Set the NOC clock rates through an OPP table to ensure proper voting of
the VDD_CX power domain. The stmmac core enables stmmaceth before the
glue driver applies the OPP vote, both at probe and on resume. This is
safe because VDD_CX only needs to be voted while DMA traffic is
ongoing, which cannot start until the glue driver applies the vote.

Shikra's intended rgmii-id configuration supplies both TX and RX delays
in the PHY. Therefore, enable phy_managed_delays to select the
DLL-bypass sequence. No POR table is needed for this intended bypass
operation.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: set phy_managed_delays to true for Shikra and reworded the commit
message to clarify concerns raised by Sashiko.
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 15385750b3e6..a7fdba73da2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
 	.setup = ethqos_scmi_setup,
 };
 
+static const char * const shikra_noc_clk_names[] = {
+	"stmmaceth",
+	"axi-noc",
+	"pcie-tile-axi-noc",
+	NULL,
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_names = shikra_noc_clk_names,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clk_names) - 1,
+	.rgmii_config_loopback_en = false,
+	.phy_managed_delays = true,
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
+	.setup = ethqos_hlos_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


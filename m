Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B530356748
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969076; cv=none; b=ps+0ci/ULesg1WGjVyU1nUVd1CXbEQ0iu3dEOXGN6zwTOKtp+2Rg9ir4uu8fKztxeflcxpcIjre/2qgCVObAEyOXBSNLqXuScYheMKuYot7hZXMBMosllfXpvu0BXFlqZZNTzUBKeqyzNlDPwMRNqlxJa5dgR56zf4VKVITowE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969076; c=relaxed/simple;
	bh=B9hSgf5LIgHsicFYYXgD8Nn7K6/yMMHhWd+3lvIHSVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rddy25cYUYL1z38yUm0yPgQmat/sGNhvCbk1AU2So+6wsxi1mfylEdo8vDT4RXF8HASZPw1QhSTn72E6koKSZqyttR1BqXGc/abAp128kjIAyKYJlrBXXszcM8T6oZlRkt9e1n9T7mm8zdbuxMcFTTeX9sD12r524sLRla0C0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekF0aMg+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H1Xms0FI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekF0aMg+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1Xms0FI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3Z6MS3680200
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Av0TFBF20NWmzoMNcaMLBPBsgOdZZrINkSuTUnz9OI=; b=ekF0aMg+zkvnvdMG
	OwXqHasoRqPjxKm61luu/3R+F2dYUCazTLkfq8N11gS3FciWOxTGTMgKMGO/4s5J
	baOKB7olL4B5ZpkH2zPqllLecLq82srrCY7d/0z6xydrpT1nBB08CgU99VIjcD8L
	0mvB3SrYBlIZ5WFp92FzHfXRzRMoKhTB4lBj+WzM7tmBUdxNABOrKFpm47c2LoVH
	asPlxQ3qBf2DC/EDdlR9Ae5LcKwD3+G34dgYjubrw97dcGBI+dAy1fmpgSiVH6X3
	lu+2nAeAOOsd6poDdNyQ0JDmq+jlZc02UtXTg0TvO4XLDx3yXqtj7bvEyoVEYiUK
	32PhlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5emrxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3934062a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969072; x=1790573872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Av0TFBF20NWmzoMNcaMLBPBsgOdZZrINkSuTUnz9OI=;
        b=H1Xms0FIiZo8rEZSvkUXZ660X//0e2liOLgeUDpZuuyqxfs9wRkOaKrvh4jFYGKfQm
         nuz/zr0mhiB5UV6haovWyXhqF+CPMWjCT6uJDHZTCm+zhUmRqCKXaC717Ox5lKcW501K
         gsXH09p0WPzTD2c+NosatQazlQu0tubFpeRR62oIvRa5W5l6Kx4DXRt8pf9vTepdRiFm
         I4PZ9aDQXfjJAJEGDMo58wb126bNwSaapDGcpaGu3lezQuAkxnXELVJtPH7fZJixgbWK
         SFQmT8XcLSeCERPRfGhDIwHY1g8YcgkpIDarVZ1pFzOTWfx1bVh2LKGE2HnMQH80aPUy
         Ouhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969072; x=1790573872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Av0TFBF20NWmzoMNcaMLBPBsgOdZZrINkSuTUnz9OI=;
        b=fqPukmzMe/xgtyg2VXEvExA9oXq/mHUONXSKelgklm0k9z1JqGxKkyGlScOWUeON0j
         o3sOAC6VkA262nW7R7wbrabVgvoyBrcAp324rMPHfo4YbPZATHFxHjoL9o1PEXXCXSMi
         Oq8WLTyo1731tEyW6yVzyjVoSfgYPNHuIuJsWMNPupLCyD6ry65i5CtUAc4B8QaitxhN
         DKMPxnRggNOAYBW9h7JjJULbDANi/JggzEdMZAN62ydLxfAny2K69MNpIvjfoFsCT4Ln
         czk0f/zk4oKg4hwlICYOg5uqvNSX+SthQU5/BIvzooIhwY7ZVw9KD/rvdHWZAsxgRIUo
         hu2g==
X-Forwarded-Encrypted: i=1; AKwUvBzEkpbJbfrZMhmb1Uw1UPHyILu/TQX84nHnYvek26cdFWSy6PKw264/UvYXfTr/I/Fr6UULERM9lljeQZM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZyU7V4YFXRjaRKOSNR5K39+NYMkcyHXiSAGMopo2XIFBzOP1D
	V0zkMJH8/T2jBrY0Uhg1T6TkMonANe48wA0WemLKCEsxawBXQYnhZmYQeNIrHhkxguIi40ZAJNU
	BMcqSWFy2T5dnbe+bzCwBiK+8MdjGPHLYoPXnqUUoiua0gleHhn4utnpvZOzhDv6tik0=
X-Gm-Gg: AYBFou0vi7+gHYLlBb+zIuav6Ss6pDQIK1DXvS4kelTLYWVDAmDhmaAsp8dUe4ucrQ2
	ZlHEsx6eLG0Da+iDbgVXGtpxSR0FXHVHiYj0U6w6evJkgabX1O7WbTtLltzNV+Emn13bAKurqS5
	FgpeVWF2iey80GGJPqvRuCqw4zZePwXj0ci4qgbgi+dgoVsKqKmrjnJBBCUEwSnMrWM6LDuwQRG
	07tW6/OFQicCcXRBUKmZHGYqUke9Fr6/w3IdCruKgZkcaJsKDoG56/kRlCOnleI/m5KOi5/62Ta
	zPu61l7emR1xbj0MMzTclInsDWBApWi2oOx5f0hYja5qKbJnSdYnxNk7aK4qJOe55vEK2KWU5cO
	smbc/8cbJh3aQR5BWuzIKyeYjLmX27VF2QA==
X-Received: by 2002:a17:90b:58e4:b0:39e:4c97:ce05 with SMTP id 98e67ed59e1d1-39e4c97ced5mr13018218a91.38.1789969072419;
        Sun, 20 Sep 2026 22:37:52 -0700 (PDT)
X-Received: by 2002:a17:90b:58e4:b0:39e:4c97:ce05 with SMTP id 98e67ed59e1d1-39e4c97ced5mr13018190a91.38.1789969071980;
        Sun, 20 Sep 2026 22:37:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:07:13 +0530
Subject: [PATCH v4 5/6] phy: qcom: qmp-pcie: Refactor common multiphy
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-v4-5-ed05c6e09240@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=8020;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=B9hSgf5LIgHsicFYYXgD8Nn7K6/yMMHhWd+3lvIHSVI=;
 b=C4kgjcWkc3+ruopFUBvV9013Coya1P2YdFDKm2MJSBLEJ1iD/O+izbSqmrevGKOKGFW5n684M
 ASB8keqZ0SmBk7k4yzbdxUVjjhyWDpnl+SsbboEShPX4whlV3j4d5Rl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: sN_Jd0o_-NW8BPuU0eZKhkfQsfpvER13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfXwl+DXROnqLDb
 bKRQEOvP2rMXQxOT3XJcDU0wCqH/y2ASR3F7TDhSjfR07Nrdw/iGCInOQyrg8bFHeMzbHaAxtx4
 SK6aG4njiejudx0B0bH1zIxFbw7vtuAUVy3WfxPIYcrhcA5AJ3kuEEAHzJ2WQniGgxQzlf83U3I
 pa6dqyfpPLuFeWX96VjOpjdpn3l37yXxPQ8Mh1DiVhlcbfcTjxAEeq3cdrArmmOk6ZLgn668uay
 Hy3bMgg9U/lgDDxPOVzgZunv8bg/T+p228yuFptDp7kZey1mhPirb1mdYqKNztY6Luuusg0K6xG
 phz0i78wEGXiUHT+KXcgH09jHH7wVfUQfCAuW14VnVcOjW3CWNZW3mtLPcVHXHqIQYnydj0Usmd
 vYt8Ii0CLemajNoNFi2M+xnpCbRJkvxDrf47xxx0k8bbfLCZHwbUkW+3GTuii9+Mp/V25WT1wgO
 bFrsBMRVoHxGYoHZiLQ==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6ab0c2b1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xSDsCvtJ24Ukv9SpSl0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX7h2/LOHFX722
 +mdZjRTEqe7Fx6qA4af9R+QZ5JolVusRMIb05Bf/bnha1Cv6mCROstagBaRDSBsZmkYCQRL0Y12
 Y5ejQA7fQRxYTx/E+mKWczDZ9TTdI5Y=
X-Proofpoint-ORIG-GUID: sN_Jd0o_-NW8BPuU0eZKhkfQsfpvER13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210078

Reuse the existing port resource arrays for Glymur register regions,
power domains, and NOCSR resets instead of maintaining duplicate
Glymur-specific lists.

Attach each PHY instance's power domains to the device created for that
PHY. This ensures that the associated GDSCs are managed with the
lifetime of the individual PHY device rather than the parent multiphy
platform device.

Validate the clock-output-names property before using its count for
allocation, and use a generic module description.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 102 ++++++++++------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
index e93cba4369fb..befca9b78ce9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
@@ -113,31 +113,19 @@ static const char * const glymur_vreg_l[] = {
 	"vdda-phy", "vdda-pll", "vdda-refgen0p9", "vdda-refgen1p2",
 };
 
-static const char * const glymur_pciephy_a_reg_l[] = {
+static const char * const pciephy_port_a_reg_l[] = {
 	"port_a",
 };
 
-static const char * const glymur_pciephy_b_reg_l[] = {
+static const char * const pciephy_port_b_reg_l[] = {
 	"port_b",
 };
 
-static const char * const glymur_pciephy_reg_l[] = {
+static const char * const pciephy_port_ab_reg_l[] = {
 	"port_a", "port_b",
 };
 
-static const char * const glymur_pciephy_a_pd_l[] = {
-	"port_a",
-};
-
-static const char * const glymur_pciephy_b_pd_l[] = {
-	"port_b",
-};
-
-static const char * const glymur_pciephy_pd_l[] = {
-	"port_a", "port_b",
-};
-
-static const char * const glymur_pciephy_a_nocsr_reset_l[] = {
+static const char * const pciephy_port_a_nocsr_reset_l[] = {
 	"port_a_nocsr",
 };
 
@@ -145,7 +133,7 @@ static const char * const glymur_pciephy_nocsr_reset_l[] = {
 	"port_a_nocsr", "port_b_nocsr",
 };
 
-static const char * const glymur_pciephy_b_nocsr_reset_l[] = {
+static const char * const pciephy_port_b_nocsr_reset_l[] = {
 	"port_b_nocsr",
 };
 
@@ -155,12 +143,12 @@ static const struct qmp_pcie_offsets glymur_pcie_offsets_v8_50 = {
 
 static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_a_cfg = {
 	.offsets		= &glymur_pcie_offsets_v8_50,
-	.reg_names		= glymur_pciephy_a_reg_l,
-	.num_regs		= ARRAY_SIZE(glymur_pciephy_a_reg_l),
-	.pd_names		= glymur_pciephy_a_pd_l,
-	.num_pds		= ARRAY_SIZE(glymur_pciephy_a_pd_l),
-	.nocsr_reset_list	= glymur_pciephy_a_nocsr_reset_l,
-	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_a_nocsr_reset_l),
+	.reg_names		= pciephy_port_a_reg_l,
+	.num_regs		= ARRAY_SIZE(pciephy_port_a_reg_l),
+	.pd_names		= pciephy_port_a_reg_l,
+	.num_pds		= ARRAY_SIZE(pciephy_port_a_reg_l),
+	.nocsr_reset_list	= pciephy_port_a_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(pciephy_port_a_nocsr_reset_l),
 	.vreg_list		= glymur_vreg_l,
 	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
 	.regs			= pciephy_v8_50_regs_layout,
@@ -173,12 +161,12 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_a_cfg = {
 
 static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_b_cfg = {
 	.offsets		= &glymur_pcie_offsets_v8_50,
-	.reg_names		= glymur_pciephy_b_reg_l,
-	.num_regs		= ARRAY_SIZE(glymur_pciephy_b_reg_l),
-	.pd_names		= glymur_pciephy_b_pd_l,
-	.num_pds		= ARRAY_SIZE(glymur_pciephy_b_pd_l),
-	.nocsr_reset_list	= glymur_pciephy_b_nocsr_reset_l,
-	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_b_nocsr_reset_l),
+	.reg_names		= pciephy_port_b_reg_l,
+	.num_regs		= ARRAY_SIZE(pciephy_port_b_reg_l),
+	.pd_names		= pciephy_port_b_reg_l,
+	.num_pds		= ARRAY_SIZE(pciephy_port_b_reg_l),
+	.nocsr_reset_list	= pciephy_port_b_nocsr_reset_l,
+	.num_nocsr_resets	= ARRAY_SIZE(pciephy_port_b_nocsr_reset_l),
 	.vreg_list		= glymur_vreg_l,
 	.num_vregs		= ARRAY_SIZE(glymur_vreg_l),
 	.regs			= pciephy_v8_50_regs_layout,
@@ -191,10 +179,10 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_b_cfg = {
 
 static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
 	.offsets		= &glymur_pcie_offsets_v8_50,
-	.reg_names		= glymur_pciephy_reg_l,
-	.num_regs		= ARRAY_SIZE(glymur_pciephy_reg_l),
-	.pd_names		= glymur_pciephy_pd_l,
-	.num_pds		= ARRAY_SIZE(glymur_pciephy_pd_l),
+	.reg_names		= pciephy_port_ab_reg_l,
+	.num_regs		= ARRAY_SIZE(pciephy_port_ab_reg_l),
+	.pd_names		= pciephy_port_ab_reg_l,
+	.num_pds		= ARRAY_SIZE(pciephy_port_ab_reg_l),
 	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
 	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
 	.vreg_list		= glymur_vreg_l,
@@ -398,45 +386,39 @@ static const struct phy_ops qmp_pcie_phy_ops = {
 static void qmp_pcie_pd_detach(void *data)
 {
 	struct qmp_pcie *qmp = data;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	int i;
 
-	for (i = 0; i < cfg->num_pds; i++) {
+	for (i = 0; i < qmp->cfg->num_pds; i++) {
 		if (!IS_ERR_OR_NULL(qmp->pd_devs[i]))
 			dev_pm_domain_detach(qmp->pd_devs[i], true);
 	}
 }
 
-static int qmp_pcie_pd_init(struct qmp_pcie *qmp)
+static int qmp_pcie_pd_init(struct qmp_pcie *qmp, struct phy *phy)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
+	struct device *pd_dev = &phy->dev;
 	int i, ret;
 
 	if (!cfg->num_pds)
 		return 0;
 
-	qmp->pd_devs = devm_kcalloc(dev, cfg->num_pds, sizeof(*qmp->pd_devs),
+	qmp->pd_devs = devm_kcalloc(pd_dev, cfg->num_pds, sizeof(*qmp->pd_devs),
 				    GFP_KERNEL);
 	if (!qmp->pd_devs)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(pd_dev, qmp_pcie_pd_detach, qmp);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < cfg->num_pds; i++) {
-		qmp->pd_devs[i] = dev_pm_domain_attach_by_name(dev,
-							       cfg->pd_names[i]);
-		if (IS_ERR_OR_NULL(qmp->pd_devs[i])) {
-			ret = PTR_ERR(qmp->pd_devs[i]) ? : -ENODATA;
-			goto err_detach;
-		}
+		qmp->pd_devs[i] = dev_pm_domain_attach_by_name(pd_dev, cfg->pd_names[i]);
+		if (IS_ERR_OR_NULL(qmp->pd_devs[i]))
+			return PTR_ERR_OR_ZERO(qmp->pd_devs[i]) ? : -ENODATA;
 	}
 
-	return devm_add_action_or_reset(dev, qmp_pcie_pd_detach, qmp);
-
-err_detach:
-	while (--i >= 0)
-		dev_pm_domain_detach(qmp->pd_devs[i], false);
-
-	return ret;
+	return 0;
 }
 
 static int qmp_pcie_vreg_init(struct qmp_pcie *qmp)
@@ -555,6 +537,8 @@ static int qmp_pcie_multiphy_register_clocks(struct device *dev,
 	int i, ret;
 
 	num_pipe_outputs = of_property_count_strings(np, "clock-output-names");
+	if (num_pipe_outputs < 0)
+		return num_pipe_outputs;
 
 	qmp_data->num_pipe_outputs = num_pipe_outputs;
 	qmp_data->pipe_out_clks = devm_kcalloc(dev, num_pipe_outputs,
@@ -630,6 +614,7 @@ static struct phy *qmp_pcie_multiphy_xlate(struct device *dev,
 static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
 			      struct phy **out_phy)
 {
+	struct phy *phy;
 	int ret;
 
 	ret = qmp_pcie_get_mmio(qmp);
@@ -648,15 +633,16 @@ static int qmp_pcie_probe_phy(struct qmp_pcie *qmp, struct device_node *np,
 	if (ret)
 		return ret;
 
-	ret = qmp_pcie_pd_init(qmp);
+	phy = devm_phy_create(qmp->dev, np, &qmp_pcie_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	ret = qmp_pcie_pd_init(qmp, phy);
 	if (ret)
 		return ret;
 
-	*out_phy = devm_phy_create(qmp->dev, np, &qmp_pcie_phy_ops);
-	if (IS_ERR(*out_phy))
-		return PTR_ERR(*out_phy);
-
-	phy_set_drvdata(*out_phy, qmp);
+	phy_set_drvdata(phy, qmp);
+	*out_phy = phy;
 
 	return 0;
 }
@@ -739,5 +725,5 @@ static struct platform_driver qmp_pcie_multiphy_driver = {
 module_platform_driver(qmp_pcie_multiphy_driver);
 
 MODULE_AUTHOR("Qiang Yu <qiang.yu@oss.qualcomm.com>");
-MODULE_DESCRIPTION("Qualcomm QMP PCIe Multi-PHY driver for Glymur");
+MODULE_DESCRIPTION("Qualcomm QMP PCIe Multi-PHY driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1


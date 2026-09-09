Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347ED545D8E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954536; cv=none; b=jDc87QhMYpl1cq/ipAjNAOma1TKOI5WAa7ARkrTWXCZVMfPMQpELiRbclsLkIpenaWPUKQejVIJ6UGtlRj3A/S8YkWLwu0Ch7U48Lwc3cHAPM43BhqB45Pejxg4LLUjQmiBPZUWKgHjKfCJHl+1BAQN1GphKI5BgiOKvxTEkRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954536; c=relaxed/simple;
	bh=rYPf+uUwt3u7xdZ5YdOl1l1hU7kXwIXXpn48y5XM/U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sn0S5Dd6cvgcCkik+MSqhaYWi9RypaVWqOAItdEt+54bzL24ijg3eJZ6mB3J8udJVBBk1mUScvZln6jWZIizaSlcECH6OIu99DcPabDdv5tSEaul1fB4KSirMbn5Jl5XqkfLB9k1MiwLmqQnZwXyySLzSH2gny41qyHUVjGd7lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6wXl+ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYC5J9fR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6wXl+ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYC5J9fR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Or2019009
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=; b=J6wXl+raPUV4eDRb
	rf8ALx+JSPH4XzgixCp+VzdxXoQs6crpzX7G+y8ttp+ZyKlTyNukOK0zzAHQzoeb
	gDvYADCXE1OC/oV3dAUk1E4G4doE0TKRqQPa9lRyqOMKxOaqJn1oXWx5Kro4UEPO
	cYq6b7NUWFZghBlW3n94cMCUHU5s6+lm9mA+gqQ4sl7UqU0zZfAUIVzq81+SN/3B
	yDhkoPD20lC2mx4Oxl1E1WuGrT3FNCPZlE7mPjTFxkMJzQ58rT+zHsE40SzL+xiX
	RhlNLFMsV/0opfIlmo+BDGzUM0Ttmzzgf3PbQvBDuwscipy5RHjSI5+DXxqGZyvF
	Y5vcQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x86ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:48:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so6146234a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954533; x=1789559333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=;
        b=jYC5J9fRuvY+kauSX8NrPw/ABIrBn+mmGwGwsp/A5eiIj1trR6tWvtNrFOBG2RdzMv
         RiyDlVIQSVcd94XiG+aYURMppAxeLshMf0Ac1xJGGz6hcmRLb75tEDuNhBxOCD3sehJ7
         HkkhTsyId/0snWSy314TW/bDY3hKDQaodKxBciwiasJ0B3baaFmkuT25cxFG5J4qlRra
         O+nVJDTYDihbxcvl1/up5q89gQGr1wEX7ek6SD0P6AHhCSKzZz6sR9Gk/5nnKVu0cEwG
         9sG3x4tX6ZPWEOfmF4VeJdPxQFreThc0dD1OQfQnf47zpIPDzFXYeW6ZST+HmP9qjWc/
         qSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954533; x=1789559333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DAXnd9GeiIwiEmnBfwIbAz3fsXOFuF+4UTK6tCPQKc=;
        b=SxVwTqwnfTsKyluleXrKoUNrtwiEe38k+oIt4irXd+Aa+w524faGs7PmjMHtQZFGIa
         7RWJEQxtIuG0lcJm3+YSW61PweIAVBWFRRz/tjFPna5YiXCUUijdSdYuCQjmLGr3jwt1
         bnIXchSAZcmZkPgWA2gBeuFWMPGPZtwbxaya/o9J+LwF16ZOt/VCqdo7dzBAjj9BFzGj
         X0eGhqoheP+OYx1mBtkYEHyLAHbtvp5PypEZu6tLRBzfjppvcepsLRCoCAYwgLVKCS0G
         ec769SjHjsepvgpQfak+gGPoMX+hUvo39fSNhUXuZJqfx3j5buWkJsSj+Ug3odK38f0c
         a76Q==
X-Forwarded-Encrypted: i=1; AKwUvByQhcg7i2cNgC1vyYK0us/wv33OUL6D6D3HyhaeUPJYUP1kopzPeaoA4SfjjRBmJnGQMO7MWApVcEGKt1A=@vger.kernel.org
X-Gm-Message-State: AFuF++kCzic/pxF9x2BXYpo4ZLRApHKqtZOlV61aTjAMboEkmcDqjLRf
	kuX9Z98ISiKXsjQOnJzN4TYAoPt4W2yid6e0uCcXvOaH3vzgeEam5LetIeMO4UejWiRPF3jN8hR
	evpPWu62d4B02OGpDTytOCsPsgGG6bE0sIdz7d4vrqaY8lbHhDWeErwM+SEKH21nA53IUc5hjS5
	M=
X-Gm-Gg: AYBFou0ilaBSgolEXYgNidSqfrP8VyXsAnuav5cM3vn8JPt8J+H2JqVobmFVBrrBGaK
	qYAIkhUgMQPJnirdnC3SKwYz7TeOOnMp3Hb5jx0VHUNTQ7X0lZFtHHAaXXSBjmakqol4aaLDp5K
	tmMo+u9fKc2yx2+HMP69PJ04IzPdRO/usdJrYz7DVDS/gDEHvwLxYdKxOcQ13AxZNP8ML1aUwCM
	0CDZdtAraizyA8azR1RrqiQ/ZiQCFAXs4y9y9YxQlaezvNtIFh8705j96CKmpSIjC9Pga58uVeB
	uBp2SygnvBPmxRl3Hz2SIoGBo2wjUauxG9CK5djK4OoQ8PT4qAvquxZjSgUNCbBUFmb3gRQELYV
	oOq/r6RTNjXYgfYn1E47rX4xUMFiP92gJ/PQ=
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr57825827637.14.1788954532569;
        Wed, 09 Sep 2026 04:48:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3da3a11ed0cmr57825764637.14.1788954532148;
        Wed, 09 Sep 2026 04:48:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:18 +0530
Subject: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord PCIe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=2416;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rYPf+uUwt3u7xdZ5YdOl1l1hU7kXwIXXpn48y5XM/U4=;
 b=OW2v2+NG6R3Rs49rBH9Sb6H/Aj7MnXJ1eyRAzgGGDSvRTMXMGhQW3QapQxZW2ZW1JVT2nzY1q
 2urgu8Xx2zNCCFaOSl4S+j7hKio1UBh2hbgJaHLQZECdoPmb0uUVGmr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX3ozruIuZ7AGA
 YjYPB3xHoXPDsiN3/Df1tb7IiVzxoGD/9zCOTWgxH5l2yzvgQzQuOerhlFj25TUZ2+JqnEEnyGk
 lWx7EjGfQxVOGW9kTstqPZrAqbabhRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXwL/hkg281PoS
 8Jo7CgPo0FF8wqaigeGQPsvZitcl2MsDnrsCBp+h20J2UElF/aDTqruxvni+Dl7TmnQg3Jsx6tY
 QdGVfO6a/ExIqW9Z10alPjNUmeQOAtDnBMM22lAI+cbv1lnW71SUz9mD22tUSDVqTc6lRVUxH6j
 Wi5cA4St7de7GSspB+EeED4lDni6wddeWq9ZeX4JF2N4qpv6yAukymMKi46H+Vxx7dX2DB+6clJ
 /r5xv+6JtP+P1FJSdGgnt+jkMKe4NYhvARUauofdWFpG6wNiitoHhSDk6Er+eH7TMzAJ9ipj3fq
 HAIEMXczYDUUj4+SnjMXYc3aZEEDWKJGGniGgbylqlZYsujY6ebrEe5PHwOoAxKZsMJ0+ti0Nsq
 ECF3/t8z+xfM5CB5+uLEEDioO4P60dNTYbtZsV+8P8cvNsJ6+5QRCuFAZAYgukIlVJ2b6ximpPZ
 R9iNqZ9TYz8i658Xdqg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa147a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: VXIzKxgUFQ3KlrVqRMu012D9HBT3EEfS
X-Proofpoint-GUID: VXIzKxgUFQ3KlrVqRMu012D9HBT3EEfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Nord requires a workaround to address a timing convergence issue in the
PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
change adds the remaining required settings as documented in
QCTDD11972446.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..b97e40fb7ec8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -281,6 +281,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool cgc_dis_workaround;
 };
 
 struct qcom_pcie_perst {
@@ -1097,11 +1098,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
+	u32 val;
 
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
+	if (pcie_cfg->cgc_dis_workaround) {
+		val = readl(pcie->parf + PARF_SYS_CTRL);
+		val |= CORE_CLK_CGC_DIS | AUX_PWR_DET;
+		writel(val, pcie->parf + PARF_SYS_CTRL);
+	}
+
 	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
@@ -1630,6 +1638,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 	.ops = &ops_2_9_0,
 };
 
+static const struct qcom_pcie_cfg cfg_nord = {
+	.ops = &ops_1_9_0,
+	.override_no_snoop = true,
+	.no_l0s = true,
+	.cgc_dis_workaround = true,
+};
+
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
@@ -2464,6 +2479,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


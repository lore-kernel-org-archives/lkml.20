Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60843E9C3A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906654; cv=none; b=sJLDFKUzQQsikags3CT/MVGXaVRUmxSvcKwE1gJHrXQVzJT/HcfDlI2PRVK+c6Q1bll97MUk9B+pS6Aux/NZLpP3ETqL+VYgPStbuqx5Vo0o8fc/NzPSu+VFIbCCJGJgKMIChQwCAQGIBMUIFmRsXXclsayGAoCJWLWho4zwgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906654; c=relaxed/simple;
	bh=5x5TirLtHA0c0Rb9PKOOjbyhhs2shQyZ5pqbvgZXqk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgmM8+FHSftI6qMM40CytuBInRdhP2SdB9phA+NcfpsMZ4m5kfXMmadCPtmPzj1tzZVBaTe8r2quII9SgAneEiiFxIVcGy7jdCDWAhjhDodmnnTR4uNF91weZyB+YIIX14rdWYJRVY7WVzYmUxTFdHMGG1a/ftiN2NmdzrRm4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep6PIZSQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+YiNbiG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep6PIZSQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+YiNbiG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66vT12197015
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=; b=ep6PIZSQAJWh9+CJ
	DHUfyd9B+GP3xPPswsw1/HCdB4ePEc22XCkhVeh3bYEyEMU9sLWx2opdPWMShUHo
	Ppzvw1R5P5M5ruThZg5Viv/fNBrJYjPELTIWlmf22y8wsVSKLrjdQn4ysODiYR4B
	ncGb1D8gKwL65HXKtkDbwQffMNc6b7hDs2hCEFh+Q7lzb5w73D6AV8ALUOXbnTbS
	0eLjgorj5up28hi3EkBZY+yZ97EgjSXsgMw+bccSIgLoxmdqEV3ohocqxtqlIPkZ
	n6UP603TmG4WrhgcyuL8eWoUTUi2qV/dvoDlv5O2lCfMaaJTc5x4rQuaGoXzhxJT
	07yAgg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxrvy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:44:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7151120d6so15323065ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906651; x=1788511451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=;
        b=I+YiNbiGB7aF6ctGIz1sBNwyjTGyeeZbqVkjujq6iS2DQGkiRXfaOOndyj5caOjQJP
         RevEYKX8o2RYc9VFvc1UYUNtTf28ktNN14dA/L0/u/z8bx5bZ1Cry7PE7zJLWu/sAGFh
         RBzyjHpHEOj6ZNMhnjLysJahqLK2lNqTYU3LWeXaEbDXdrqAQyRcpqq7IRkzeXHehfU8
         GQ7OPRCMYUOWwBAMFjE7VYho6t33Gu/kwcO0AOJ5EDvaiPZYUetH0YzpcICuT5n6TE8i
         Cpo4RABAkSZ4LU1w46ASaqhmqUvf2xMFfAe3qf/JEzcBR6rggu2VaUQC3GTUf2BPXqHu
         DlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906651; x=1788511451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oqpp/YqJcmbInDW8NldSo8VxqiOBNOhc5Rb5jj2yQKE=;
        b=qlpZ92nHg9ujv9o5/R7owHzQZB/UKmHa+KA38veBpzf/PbKxS1c4ne6wz1isu4yGXU
         QL3dB0HACklZdg/STK9YueL6q92AeFD51NDOnOH8l9KkHIgEzXBP8c9g5DpFpyaPp/2r
         L9r0XvJ2jPP6kpDTZs2Cd2+XSIWIml5DU5k/IXJk+ri3Afb3lBT4w772eTgDzLvAldfk
         iWmsM9gthwcerweJxGt+qH8fhb9pUi+iO2pPNKVxJwPSQwICTSm1VO11UYSrGf15noxt
         mjWEkBdYzHqa5dhgWC6p1S/CLDhvyoaXyU0RdiJGAmRRSjTXCkoXs4jc/dF+ftLB1rZ2
         nmdg==
X-Forwarded-Encrypted: i=1; AHgh+RqIIHsd/TGiFp4K3bidJEKWfPNSP7b0q4n1ewGME2cCgJJevll6H2qu8aGOUUsndW/2PWGQPlHDpgAZJy8=@vger.kernel.org
X-Gm-Message-State: AFuF++lQssrQ9GdZFIJq6IQWb6iT4rPk2HGST9m79QeswXjUswOsVGpP
	ogh05AEK7zhYIiKhjDxXYrqjwx7CxJdggivoOqT0YXyfDDyCRhce5PaPKUdSQggSQQSJkqNe8He
	fbwLUPhMDCmRmicwFbYIzUi/eecCJhtur8thyB8PYlM9xdDPLrS6x+EkZdOQLP82gQ9E=
X-Gm-Gg: AR+sD12EX0dQWj6uR44Fm5BvP4ajXYfwHAvZQI3dRkmJ45L5uK9FnnVm7p5HQqD/B23
	K5qdLTUFg16xdTQ/8TO6PJSokils6dHeZAsAsAw9jrd8MccqipSV2SYOfWKQAAwusGpwNLfszM8
	pypuNrKm7ZpVrHiqhsp+UXEjgMjOFjjLE34zHDZwkYGrAPEA8TugUq8TbEFQkndr8FeN6cDR22t
	psQ/T9QiHKzvNLoaF8wuFcX9Jj+6wOh+H737zAfYqvTze9gSpzOg+2yJfEUXnANTtPoGNF8UrCB
	sQ33f8+UZA6WXLfM7DBEfLD3ipZ+rrCDFnVw4kWTc0Q7Q6AivELVrJ7V4k69MvILi6dmiY2wBpZ
	QC5VFZFLjSHdV3kpHq8baVsRLl7vB/YQyxcE=
X-Received: by 2002:a17:903:24f:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d74df5fa9dmr90023565ad.10.1787906650742;
        Fri, 28 Aug 2026 01:44:10 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d74df5fa9dmr90022845ad.10.1787906650197;
        Fri, 28 Aug 2026 01:44:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm3673459eec.3.2026.08.28.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:44:09 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:37 +0530
Subject: [PATCH v2 3/4] PCI: qcom: Add CGC disable workaround for Nord PCIe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-nord-v2-3-18bf59d19d6f@oss.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
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
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787906625; l=2355;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=5x5TirLtHA0c0Rb9PKOOjbyhhs2shQyZ5pqbvgZXqk0=;
 b=IBotV43TcYpZpOfwsLPTB8XIkHg7+NNwBpXZCCtNFvB6kmG8fHVAB6hp3VkFYdr1DodhCbrZZ
 tHIu15FOJ/MBazQOqF4rdUggYLGaaymlDjGBZ/GECtR7jmRc5KklXoA
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfXyFLPadhkjN5L
 funSOnf7HawlYYr5MuVTfMbnv3t+PZde7NE6+RZcEd/KQ50hWCl+SP/KUWAmhXdpmFd3hDL4Vtc
 Pw+MQeX3pEpVcF0hN8QUdggCcsIOSHWsAZV+gbZBwyEr1+Q+JuYltcfVwcJbp3KVem5GjK7IzrA
 qhD+/9ch+tuoAQbsSjUdzKgUcVkQsen575qnwPiHWIzJmiattDNAg4i1mXtEbY5rvYIghRGm01r
 NBFDoDJeZp5a0frD8AGC0Bhw3qJlAPD64PUH7V26miSh1wdbEc9lt7KEAxG115EQrsTSrr1DQCk
 CKw8IDbgJouVGLxUfM2720aWncY+4Ui9x7sroXVUDXadjDnh6sR6c5WjWpNR9F6h45Ltgq46oO1
 cBzb+jahP0GNwyPSU1/4nSibV1fivilTpBDTWqE3slQSn+V0puG4AvcJDbHEaYmQ9E1O77Vsv2M
 dRya8CgZaAgeTieRdlA==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a914a5b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX6RonXWPokKU3
 HUwbjzfdFPBEZ1FyJgEOiD4tkKB0EICXQEfLFIqC3dibC35UAtKP+oBiGwg62B8yvsXHD+xhULY
 OS8vEJBXPad7q+yX1nDU+6iDywebP/E=
X-Proofpoint-ORIG-GUID: DH76hIOe7vaQ8hl7rFM86cxYWyHeUYGD
X-Proofpoint-GUID: DH76hIOe7vaQ8hl7rFM86cxYWyHeUYGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280074

Nord requires a workaround to address a timing convergence issue in the
PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
change adds the remaining required settings as documented in
QCTDD11972446.

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


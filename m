Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F7353EE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969045; cv=none; b=JwpI/alptoU0SKhk5XREDp+WYGDB6XOGrsUtQEaXOHLLuYiANBb11hwDL39V0AY1bOR+ZU6tfI06SCw7Y+Fesldm1jg873NebWiPk3ILa1GkGNtVANeOSOw6sdGGgzKg6+XWMTRgNYdloCCxkSijQ3UxRxSVMgJTOiv5BRf53vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969045; c=relaxed/simple;
	bh=9U2el7qhXi1CczJc0aDnMlryL3xXkou20Zt0ZP5PomI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S5FAq5g5bUnL57UlfQjieKlXOH8XGjWOWHqCtQgOHzZrrT3sKs5VBrnlAn4rc7AyGlMUHfvANYmKFKCjWxTpcfGhbtSt4w8hsNbA6/KfrktvS3x5JD2ehEsK3kQMfBmmw19kSncKZkQbcNDY/EKWeLHxBaPy3YX8L7rrTUP3W4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwTba8zl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQgGIuLu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwTba8zl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQgGIuLu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4Jag8002283
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jFaEBWUFf1wNsYWOuTWbsW
	2vcMd0ik36yK685CRq5/E=; b=dwTba8zlpfJGt8JpiyeXQ3QROu1dKkrtM4Tspc
	PRCOh4Jv5eZwpRYgVkyRw+xP+DcXSW3HWNe5rzKuy6oxmSBs3qARBbgTGvb20Acw
	Bm6ZGXloB/qyjxfeDd+w9HigNYUAg7T3YlEA2YJ6I2VDT7nAto9kQIOzaQhlsNDa
	92tYDbHnrFeIcH8HIObfGpvu7v4sUVr0zyEdA9yElCPWLaFrq0OtME6q94xYtuZ9
	H5hcfnZf/PHJQBL1azm7aBS2PPycJyo588+JVstcK6xDEWGNsx0MVeBIIIWAa/fr
	uK3RcXltT4hSDcOgQpxaWhbMUXooXvZVQnWxXh1pmlTHT1LQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5g76t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af92138f9so3932695a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969041; x=1790573841; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jFaEBWUFf1wNsYWOuTWbsW2vcMd0ik36yK685CRq5/E=;
        b=CQgGIuLuw07psvnWqTwz0wWm8Ax2h9P2xrr6TYcCiQ/vnGUxGN6aUHN79sK2jz4Yml
         zqVp8iTX5fOYA9NPacrz+dTN+Havhatcolask3CauIz/D443gKeEta3NTwD63dBv67s5
         A/2ZcA7F7IgXvp/ALUTWRRjZnVQVKeB28EUUWZjZbrJ1DiqOtn9Yc9KlxtAQaT3nXLCL
         0+9maFKxiL8h+rmwPHjAsuiVskinxDSUSgH+YtySXO1Ft44QGy7eQH3xlTijhLfq/ivZ
         V5zGXrhSTT+myr0Pu7MTlzI7TSewYWJZzamiLSJlnvXjVjGsaJxl/DXUf+1SNJZI7WOg
         9FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969041; x=1790573841;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jFaEBWUFf1wNsYWOuTWbsW2vcMd0ik36yK685CRq5/E=;
        b=T8qhiophuFg+jjfm2nPUeCwaRk/l8dNhiF5ZHxgilBmXA80ujCyCZwB9P5Lt4QYoVa
         ZG+7RUDbFbS/w1PHLXSOw6L015TGFHbbvezwH93WkSSJMTxhgIz3yu7lWamd4803+2+r
         V2DZW4soltofq26Kz7UKGDgD1mRgl81HyzdShcqW3glWIH4OVpIq8/VqkVBrRPCpnQBq
         bL0WkVyls1zO7oKHsfYoNWqGMPFA32Ttp7Rc5GbCx3tqSwzv69bmMNOMJf6N5OvNgyR1
         re0DpEoGY3UEyXrC4I6WjH34iicIu387e+npUkZbapd8P47Fl87y6XWuVw4H9wiMZsAT
         8YBw==
X-Forwarded-Encrypted: i=1; AKwUvBxdM6r8UxWnSNQCmAEOfjn6FB/RJhAv8bLTm5ILE7tq8O26w9CEQi8bSJKq/YDcfcoTiELmCuZnS6HKzKo=@vger.kernel.org
X-Gm-Message-State: AFuF++lid0AzquIpq7kZY30prI4UoH4wk8+gm1wM5sq41xWLpzb3a8pH
	9tS1/2qPQV+SRrN+M6XxqlpNH/h0jgV/El6j+NwLVD8wBiNeK0oXstkJ8//+GsXjahN+uc63kDn
	AjJCoiHnWO8h5Y3vGUiFON897+iqiXpNC8ciw+OvwGqUe5rIg9h6po9BGdQRdqsMRzCE=
X-Gm-Gg: AYBFou2/1fphbKpYD+m842XBrnF2gvnU67DwK558may5RG78tb2Fyi3TTVzbLZ8yjNw
	ajQisGDyum3SATjoeTz1qG1DJnyRznHxKat3pHQ/ujciroKsao1IXEglfGxn1WM0b11w8zrHzXG
	2m+4Pe7M/HZBnYANLG9FUouRSSkXoQ6wSYKCc/TWIst9YTF9X7ur1W1tfjadDaB6XnT2eH8Olpo
	TsQXpoYJpPLASVQqA+Cl4iHWjlGU2l/fk3QfruMVl7IUW8osd5GzRBQgRqZ4giYsEUc4hN2rwO+
	Emal94Wkmgvc3mjh3UH6buE5t0+DIoM/Wf9wVvXNnZkUIRVpFT+Xf5LrCNtpH9rgb0CN31ousUx
	HZOlG/jDoDvcLZ5bKpOpa62F2lYVVjQNvXw==
X-Received: by 2002:a17:90b:4b87:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-39e6c68ff16mr6329927a91.36.1789969041229;
        Sun, 20 Sep 2026 22:37:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4b87:b0:39e:6c68:fd8f with SMTP id 98e67ed59e1d1-39e6c68ff16mr6329899a91.36.1789969040772;
        Sun, 20 Sep 2026 22:37:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add PCIe support for Qualcomm Nord platform
Date: Mon, 21 Sep 2026 11:07:08 +0530
Message-Id: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIXCsGoC/3XOy2oCMRgF4FeRrI38SSY3V32P4iLXmqKTNtHBI
 vPuTXRAwXYTOHC+8+eKaigpVLRdXVEJU6opjy0M6xVyezN+BJx8y4gCFaAI4DEXjwdBFOhIPDc
 BtepXCTFdbjPvu3uuZ/sZ3Knb3tinesrl53ZnIr23TNLhPjkRDFgLbZmUFiRjb7nWzffZHFw+H
 jft6TOL4U9GOqCRWiUFN6+m/2aiz/fUYmmzRNnItSfai/iPZQ+rQS+WNWvBKCopcXyQf9h5nn8
 BWJNHaF0BAAA=
X-Change-ID: 20260810-nord-461809f1d5ae
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
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=4478;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9U2el7qhXi1CczJc0aDnMlryL3xXkou20Zt0ZP5PomI=;
 b=78vCJBSTEURDNOvkYHZEXlJYGdromKpI6vIQXnjl6Xu8QFsO0A/bb6W6x7MCwiL1vrGqD3pqE
 0JWiKma9RVZCx6bEne6OR7fH7t9/KZzpdZwONI+F9uIuJqBqrsmOduh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0c292 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=1XWaLZrsAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8 a=uxWjj-y4xJQSND-wKXoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 1IB34u7iF_UV9jCRRrMugx3dMdENT3tZ
X-Proofpoint-ORIG-GUID: 1IB34u7iF_UV9jCRRrMugx3dMdENT3tZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX0pO19zVw3Hqb
 lSPxjBckwDhPeFDvgcpsuOYHn+ariP/Zs99BD4xOba/zm2Qf2C21NPwGQwdVeIX92wqwouGK9I8
 BwP/id360bxguK37KWWHv1tatBmGV1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX+wNkl9u7GFSO
 jVGGFqqmODZXPjefX8xVavtJB1TTNvdMfmcM8w/C5nTijj3BB2+s0j+ovObSe3o/upxCD04bavs
 EkcFFdbUDs1aJHwUXv2K52cP5i3NJvmM/P1dliMbeXfIutYEkkTZNSwtMq9vVCCm37s73VZIQdb
 fV7VFGIYs/J73wu7kBorM9keUOIrQ55c2hz96VQOR4wheqMaZbuYFuUu/xwBuw28mD5Xa4HBXsN
 z5pvzZMfQDbTlFPrBwXmTto15IhxFCcxs5SaO6SfwQ8NxYYoP2h4LkUkKGNx8KlCWApsiyofehu
 NO7t2lldjtMUZX0e2y3+6qpdPFVCc9mTNY8h3iCzqnK6Z8bjqcK41J0QBVBzKdOOQH6SEIyOqEp
 rhVJe7uCBNFkLr3wlwK5FgTdl8kED9aj7TQ2pzosO2zV9IIfxiYALgKi00NdCbz7Z6gL9ZNr0Xy
 q02RCFsvVvHdeHPQDEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210078

This series adds PCIe support for the Qualcomm Nord (SA8797P) platform.

Nord has a single Gen5-capable QMP PCIe PHY block split into four
independently-clocked and independently-resettable ports (A/B/C/D).
Firmware selects the active lane topology at boot via a TCSR
configuration register, and the same PHY block can appear as a single
x16 port, x8+x8, x8+x4+x4, or x8+x4+x2+x2 depending on that mode. This
is similar in spirit to the Glymur multi-PHY support already posted,
except Nord's PHY registers are programmed by Linux rather than by
firmware, so this series adds the PLL, TXRXZ, PCS and PCS-lane init
tables along with the power-up/power-down/soft-reset sequencing needed
to bring each port up.

The series also documents and wires up the qcom,nord-pcie compatible
(reusing the existing SA8775P PCIe controller binding), and adds a
CORE_CLK_CGC_DIS/AUX_PWR_DET workaround required to avoid a timing
convergence issue in the PCIe power domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengchao.guo@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: shengchao.guo@oss.qualcomm.com

---
Changes in v4:
- Couple of nits in dt binding & phy driver (shawn, Mani)
- Add proper description for link-mode & phy-cells
- Remove soc node and address cells from example (Mani)
- change cgc_dis_workaround to disable_cgc (Mani)
- Split common changes and nord changes (Mani) 
- Link to v3: https://patch.msgid.link/20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com

Changes in v3:
- change the name to quadfurcated phy (Konrad).
- remove min items and change clocks order (Krzysztof).
- Factor out the common config and create overlays & try to use common
  symbols for glymur and nord (Konrad).
- create  qphy_setbit and qphy_clrbit (Qiang Yu).
- and in qmp_pcie_exit() apply settings only when nocsr is present (Qiang Yu).
- Link to v2: https://patch.msgid.link/20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com

Changes in v2:
- Fix dtbinding errors (Krzysztof)
- Link to v1: https://patch.msgid.link/20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
      dt-bindings: pci: qcom: add Nord PCIe controller compatible
      PCI: qcom: Add Nord PCIe controller support
      phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits to common header
      phy: qcom: qmp-pcie: Refactor common multiphy handling
      phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

 .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml |   1 +
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 267 ++++++
 drivers/pci/controller/dwc/pcie-qcom.c             |  16 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-common.h         |  32 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c   |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 970 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  32 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h |  55 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h      |  14 +
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |  94 ++
 .../phy-qcom-qmp-qserdes-txrxz-pcie-v6_40.h        | 194 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |  24 -
 15 files changed, 1566 insertions(+), 229 deletions(-)
---
base-commit: 5ad078139f684fa1f018fe0134812d4aa17fa53f
change-id: 20260810-nord-461809f1d5ae

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


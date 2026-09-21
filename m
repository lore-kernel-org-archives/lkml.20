Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89949A3AB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988352; cv=none; b=PD6gChTid/83XiOJMlZY4mPEWXhJDXmLXlRIeBNXAQXBUytHo93ITbUsPYR3HrW9PnVIx7xP/WRm7ncsCDHbi6pcjr9HWby0DlURuwkXLwRRhkmpUvWlvFlCGLGrE/Pfhs3EhoGdIk2qtD7KNKrZpyYdH02v1oguq+k64Csefpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988352; c=relaxed/simple;
	bh=Y9MzhqW8PXyHjlYsNPbgyxZMbRfb9+ARhlcykvF5nuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQWGLmCJdCLWmJ+GZBDQ549G72PJH70MS3KcDx2Y5zOAdSVOI3Y8YJdyS8LnlotImNlEqUPxSbHO2kg9sW9OGOsB6cXZpgGoe6wpZVj2d4xUveDh58ChF+B53YVhNdvMOlNhrTn+PtbQy5sRRXw7rbUDjVq+xhKHqVg9V8pmC2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L51C3IC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAy4dY3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L51C3IC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAy4dY3q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdoXG1217422
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=; b=L51C3IC6zElpYgt1
	kHHISR98gHQ/qveUspUUMni1bx7Dfeb/KQkkxlGeQBGXF2aIqxEkx/1ACLubCDfT
	uOp76IskUmbWe6iuirOgcnZsJL2gS/qHaxJBErbho+tAUuH82AfZMxyHa09hOB2w
	37SmBIuD3L/K1H+iIWR6GNuar8DM1aZ1HRQhUy+IDZxRwAq7QiuVFEd4WYkCnCA5
	cS2gCe3LVaqLlpblG4hCuax4LN1keuVC4fVbvGX1VmOjkLLd40ftxQyYDcGbNkeS
	iUY/LNd41mF0dhsqW2vMwg+d4ulvbSDDQDc4H1FqHKlTlBmO+AIAcA+PmoaEWFal
	14sNvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118vyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:59:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2118958a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988347; x=1790593147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=;
        b=VAy4dY3qq/5b91no0npmwH7haZJRnZJfqZ0bGnaoRDE7FNIuCcGMn79S7Lq/5VgbBU
         BHGchfXRVnlTq2w0DXGXaZIdDuPVFDfb7+bo5sz+0JLQanKqTeRqEOgo+3icMjgBl3OE
         CjECF/YG0NDm3BB8rdGY7s4Jsbmve8CtpvwWMLokdSxjvxNstsc21TaMwKrFhXGC7vNO
         2ZCJ+Uw1iFuHAniSu7UqOve1UjBZ0EqlR3CEdHidQqqHWqPbwtLW3DIfHAB50MUv4B2X
         MOtAwjrk4i1MRs7wN4gZbKiTjpiv8EeJb3pZLmW2luiYyj0hXsl31KHc8D5Zcs9lrKge
         +1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988347; x=1790593147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxDVMzkLfjTB9Td7IISpP/51j56rq67Hcj0lw1/B75s=;
        b=udQ2z5JfE3xkzxnGWf7ynJg1dlLi3j9hEjX9Kqr6CEiKDuIt/m++MurZ/SB3Y4wlWR
         FDBYkX2pGXWmCqQf74rJsXix7hlHEyNX8bLM1pfGwIoiGjFESGec54POC1sPToRRSG8Y
         ey7qH4xKy12lj2tlUtzkgR5/Tfm6SQYmdyqVdEwfH62enBnC79QKo16bGQGyzoctdDyC
         +PLe7cbSTPafgdS5Ex1UD7+dSedOvmKr+sPfimWTlv50uPuPuVe03dqeo0NiJxYjA9U+
         GHc4dzJ17tnjFGQ8CcgJ4BfmJlAgNtV9ms0JsNFz9EHknetV4gP/dQM7daepDzvUjwJJ
         5qRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmcTJRdIrGa5tjqz3M9JXjcZXI4xVK4KZ3R4yH4YryPvIeludBDapucygdMSEhRGpt1ZNRZwdING2zuyc=@vger.kernel.org
X-Gm-Message-State: AFuF++miOKMSH0PEYmw588ZFYFTiuljP2fEydcseguITBGitKC0QIf2t
	jQJbyiS7l3sMBzYPXViKLlig6BzOxsCXr7JHjmxdiVUK5vB9aX4svHdl2NxuzkrEUUV8rQ92uvh
	xmPpofTiKbDvKL6QFeXi1iochlm2dA8jVRgq3lYRddEd+kqxCQ4lz+IayKnIHuO6wNXw=
X-Gm-Gg: AYBFou0hFHgp7iLPfn8c/djh/zEmxjS5hxJQtm9p0JY162Ne81RlLZJ8NylQs7FJQwv
	7QgcIk+UjmjjQIj5IwcKZ90KLHOxvyDpD92daownkudX+KRQOT04H3tEnH7VldzoG6w1lBE+MT+
	uodnVowdpC0cnFuCFQzW9ZrvgQh7g7pZ17oN8Onff6kS7HWrhQS4grywrz+GwJvG7LTlLwMo0sW
	HIMBaDC/mNW2ly/0tYq51oeCd8pCfbFwRO5IfmTXC5J5GeaF8pPVFazH1cbcLS/KrveawEsSudy
	4qoIYNxq/JQYJqNvcBePvt7lPgR9EDAfCcJXka6Cpiyt0lgWumkTGOrVo4EncWu6q6JmoICRbL8
	R1h/4yvEjsBShribyzI8A2c+ciFR9PLupYw==
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr9696190637.84.1789988347125;
        Mon, 21 Sep 2026 03:59:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:30a4 with SMTP id adf61e73a8af0-3dda19633d1mr9696165637.84.1789988346686;
        Mon, 21 Sep 2026 03:59:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:59:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:17 +0530
Subject: [PATCH 6/6] arm64: qcom: monaco: Add PCIe Endpoint nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-6-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=5508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Y9MzhqW8PXyHjlYsNPbgyxZMbRfb9+ARhlcykvF5nuI=;
 b=NLJTJpRfvCihkHu/Mu2lK7vwZT6HDjHInRC/KmKYJT7DBvDeKQna5xui858Sf/joQD6oK0A0/
 Gs8qAt0eWdqDtVsR3T5xJvyJM5H4HdYOregyB5ahJN8J/JiYzXxkBP4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: wGz9WZpiICn_yjGIIXQUgbIrybXJOSki
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab10dfc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hNZP5i6h11z2s_4BSHIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfXzmnoSbuFsNWJ
 Oet/kzLDgpE5pdSx0v3BTH0+M8oTDoSWZtdre8oUr21loXJOEOCIKePhyXgBKCWSxBQC5wX+QOD
 Mavy5GjNIZo9QefP/YEpENQsIdu/WVlZIIO4XcEkYdpX1iXOLuK63ScWDV2ZPHrDnMQokG2TTJ5
 4Gne1Q6gpsqGd90P6o2m4FFSjTjM3SzNvRwcDz2Iq69TxGHC3xoR61hCbEQtcxaPS6nRVq1+GAM
 UbyAmfhPkx3bBS8Bx25KvHlTdq6sEu9WMElLius4PSa1sZm5D/uxKb6hVCbnGbyqfmGlraM7g2Z
 yFH+C25eXV9r9WwoMUnwTuxSBlCEsXNxXUl/MSnCjbecpv2K1syeU/iJP4rKkbcofzu+45ANW+Q
 XE+FFNpayYqiBoq1s1m5ebnbgQtBC44M2CLt8YDrAoBXLGfCT+5lVR4EpVQ9h/kLoEQTi1eZk5B
 PCouEn+Ipc0tbhf8qqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1OSBTYWx0ZWRfX9Zfnb8NYZavA
 skDxS+CpIJMftmNabJ1jC8C2cTOZIde0mUqX79ZHUbKRZlePGlWMkX+U1Qwril5BUbzf+CjZe0s
 3hAJ3vNVohbfC7f0x0VwMbRNcFSkDfo=
X-Proofpoint-ORIG-GUID: wGz9WZpiICn_yjGIIXQUgbIrybXJOSki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210159

Monaco has two PCIe controllers that can operate in Endpoint mode.
Describe the Endpoint nodes for both controllers, including their
register regions, clocks, interrupts, interconnects, IOMMU mappings,
resets, power domains, and PHY connections etc.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 144 +++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index d7d135e87a8c..8f2f0941383a 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2405,6 +2405,55 @@ pcieport0: pcie@0 {
 			};
 		};
 
+		pcie0_ep: pcie-ep@1c00000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c00000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf20>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x4000>,
+			      <0x0 0x40200000 0x0 0x1fe00000>,
+			      <0x0 0x01c03000 0x0 0x1000>,
+			      <0x0 0x40005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0000 0x7f>;
+			resets = <&gcc GCC_PCIE_0_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_0_GDSC>;
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			pinctrl-0 = <&pcie0_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <2>;
+			linux,pci-domain = <0>;
+
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@1c04000 {
 			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
 			reg = <0x0 0x01c04000 0x0 0x2000>;
@@ -2596,6 +2645,55 @@ pcieport1: pcie@0 {
 			};
 		};
 
+		pcie1_ep: pcie-ep@1c10000 {
+			compatible = "qcom,qcs8300-pcie-ep", "qcom,sa8775p-pcie-ep";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf20>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x4000>,
+			      <0x0 0x60200000 0x0 0x1fe00000>,
+			      <0x0 0x01c13000 0x0 0x1000>,
+			      <0x0 0x60005000 0x0 0x2000>;
+			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
+				    "mmio", "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a";
+
+			interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global", "doorbell", "dma";
+
+			interconnects = <&pcie_anoc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			dma-coherent;
+			iommus = <&pcie_smmu 0x0080 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc GCC_PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			pinctrl-0 = <&pcie1_ep_default_state>;
+			pinctrl-names = "default";
+			num-lanes = <4>;
+			linux,pci-domain = <1>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c14000 {
 			compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
 				     "qcom,sa8775p-qmp-gen4x4-pcie-phy";
@@ -6225,6 +6323,52 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			pcie0_ep_default_state: pcie0-ep-default-state {
+				wake-pins {
+					pins = "gpio0";
+					function = "gpio";
+					drive-strength = <2>;
+					output-low;
+				};
+
+				clkreq-pins {
+					pins = "gpio1";
+					function = "pcie0_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio2";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
+			pcie1_ep_default_state: pcie1-ep-default-state {
+				wake-pins {
+					pins = "gpio21";
+					function = "gpio";
+					drive-strength = <2>;
+					output-low;
+				};
+
+				clkreq-pins {
+					pins = "gpio22";
+					function = "pcie1_clkreq";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				perst-pins {
+					pins = "gpio23";
+					function = "gpio";
+					input-enable;
+					bias-pull-up;
+				};
+			};
+
 			cam0_default: cam0-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";

-- 
2.34.1


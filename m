Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3B368964
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255860; cv=none; b=g9s388Z4wfb0obXYAHK8cL2Vx5ebzyBT1Itb9BWW1ke64MsqumWhUcVO5bBqKfRsTh1mV3ZCwCHBLC/bhaFMtOS1DWss/S5PD6MKyQxHSjGHitI7UgInwBACFYEH8cHYm9wEMmFeK9L50eEgGs0k4mMFAzuWGBBDT48L2qsSi5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255860; c=relaxed/simple;
	bh=xgVMG0SVcPGU0ZyZOfm9OGPf1h8shzUtnSv3tuK8vrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pshiTY7VRnpAKCT6ebKsqtf6eSAEBTYQsPDJrju319/N95+N+qIHsaZVS0kijp+h/IGMwhJX/xGZl5h0SB484uiBdM2fJ0bSHk884U0JAYSZ3/pJp9nrAIwZN1bBAk1FcqQipmYpy9N2oj03AUUkx7/JStEyCGxiNxijuonKc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tVNB+OCm; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tVNB+OCm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so7103755a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788255856; x=1788860656; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3NIEcCH2+3ln1/z5awDZRx9pH91BoZ8DFY10uLNtuo=;
        b=tVNB+OCmOzIF4a5Tx6UNkAyvym/N2zsOVUIn8AodHn70exPjwUUFREEyK24S4edq+m
         up86OqXAo20JTlWkwFJnM4BJNmmidr18RZtcu/nFprGlKcXzKgJQSNfAXLhg8kxcSx5o
         bW4ImM5sYA1yDO12rR9PvvOJLCZGiZ2XNdzrFLhCByAM7mf1TMG0Q522ERLTa1W2oTU2
         cFaztWQI5K1/XrvbzaHUmdWmYm2YJ175waoUKHMjzIcz4nO/UYKDupUSLRFixeX/WRhE
         u7fhrWxtcRU2R5orqRVQEMK5mIzNEKJAsrmpLLCsXzWEmMTIFg754YPpDdljUOkXu3Np
         G3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255856; x=1788860656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m3NIEcCH2+3ln1/z5awDZRx9pH91BoZ8DFY10uLNtuo=;
        b=P6iYFRyCswKa6t2GxPQQR/h5sO8fVQH8qaiaazMfeQ3vYNN4kelWR7j7Z7XVr9OTpE
         rn2w6JAA85bJEJmAkfNawdqbwMKzO0AQ9Z5uC6XiwgSvDjK5maCQIDJINjzlnNylMpd9
         pR0iaFAXGP2bUl/Nmtn/CYopKbjsjLt+9zSspKH8BQJ90u4uUBpNHyI4jyjM6fDsfPrU
         9Db7aedtc1jJKP0+hjr4wDktrmh2uBJQ9EnoKusxbeY0mVb6xy2KtIDUHlm/BR0HT0sF
         vbZ5GmNPJVqM6SdgoWS/lveLnT2CC2ZGzOnrc9ZWZ2SVcncGPmAJDOvax4aaS8z34rsB
         R57Q==
X-Forwarded-Encrypted: i=1; AHgh+RplOmr3GJ702wyQndbTxn9hF5EKFFeQJM8yDLCcC2TI8A2YOIqYuoLo5w+4R86HTiMOG4qoyOUiMrUDxcI=@vger.kernel.org
X-Gm-Message-State: AFuF++mirKo7zH/rg6fxoDRxCHq0PSxyGNJQQj/wprRMurpYkVuXeoAF
	Hl1KdEqkUYc7P/f2rjm2jPJ0ezKsSg5oPXTZ7nzzo97mfBIpN+2uE0Y30VYIYHmQxOU=
X-Gm-Gg: AR+sD12EEsGeOJpbHp06Q5UQdNgTiu3yXrnrY2RhufjCWzG/Ol7IUcq75PTLYl+eWS7
	VJTZE6gfoVno7U8R7pYg/GC3GiyaE8dXp57w0IZvKn/mMirvIy/5JTgITKt3WvKSXoymvSl+Yvb
	PUQghjqkSWqEQ11xtwYCHTjDNDf7O0EXl+fFg35sN1uTQ7uEHJ/OF6iPk+69i2hhHzayGKLKaLk
	mtZm0wfH+AlvFxpP0Q9M1OqM+WJIjIdte9xq1HA1eC/2xyIIYtp83eYLVrFSWwxjH/mU8KJauMc
	cL/RqqQPyQzvuyQ41aVkxQ1qU28QjrGiVXiKPjg0bzUVdfzKYQIO3xFGSTL1CIRc2T4MW53PvUY
	MWpF6NAZtf+9Pz6xzVYHz6Eh6zmJtE8c6dyhltFmc1vczvcJgrE7FgW714gN8zPyTlwWW8NizWy
	gkDx7Zdu9OaXWXhEmhA4j2ApcjszZoAfTxCf2Mh1Xl/CkXZdrnzLwJlARzZoP80uejCIukaQqPI
	IDFLlCpiulRcRaH5tnrgRqP+W7YbwunF/K5KbSjoLM=
X-Received: by 2002:a17:907:3e28:b0:c25:192:99ee with SMTP id a640c23a62f3a-c2557203984mr1970760566b.19.1788255855908;
        Tue, 01 Sep 2026 02:44:15 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2917sm547215666b.30.2026.09.01.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:44:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:44:09 +0200
Subject: [PATCH v5] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-sm6350-camss-v5-1-49020da3bf35@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OwU7EIBAG4FdpOIsBBmi7J9/DeABmsBzarlCbN
 Zu+u9iN0TQ9/pP83z93VignKuzS3FmmNZU0TzWYp4aFwU3vxBPWzJRQRgqleRktGMGDG0vhfdB
 C+9iHiMhq5ZopptvOvb49cqaPz6oujyPzrhAP8zim5dJMdFt4la3oQLKfwpDKMuev/Z1V7o3z5
 VVywS2gVdZC5xBfokv5OswTPVd+x1b1B0h5BFQFUMZoW3QA3p4B8AtYoSQcAKgACNdp44VvQzg
 D9H/AHgBdAd9jBBO7ltAfgW3bvgG4t6YfoAEAAA==
X-Change-ID: 20251024-sm6350-camss-9c404bf9cfdd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788255855; l=8930;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xgVMG0SVcPGU0ZyZOfm9OGPf1h8shzUtnSv3tuK8vrE=;
 b=ZtUa0doXiUKDEFcBgaJMBiKILKhaAqbMdSjpKBDwfnm0WAObmcmY/MlhvOBM2RCN54CM950sb
 4Pnx5rtizMRC14Nz/KBjkdX6+Yz5M/EFVYFxjH7rAe1SHpFv55ODVX3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the CAMSS on the SM6350 SoC.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v5:
- Drop applied patches
- Pick up tags
- Link to v4: https://lore.kernel.org/r/20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com

Changes in v4:
- Update power-domain-names order (Krzysztof)
- Make hex numbers lower case in init seq (David)
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com

Changes in v3:
- Update dt-bindings to include everything related to camss
- Update regulator names
- Remove slow_ahb_src
- Link to v2: https://lore.kernel.org/r/20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com

Changes in v2:
- Remove prefix from interconnect-names
- Move 'top' power-domain to the top of list
- Update regulator supply names
- Link to v1: https://lore.kernel.org/r/20251024-sm6350-camss-v1-0-63d626638add@fairphone.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 15d38b7e803c..57773c181f16 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2242,6 +2242,239 @@ cci1_i2c0: i2c-bus@0 {
 			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6350-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc1000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0ac68000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acbd000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac6f000 0x0 0x8000>,
+			      <0x0 0x0ac42000 0x0 0x4600>,
+			      <0x0 0x01fc0000 0x0 0x40000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac87000 0x0 0xa000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0xa00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite",
+				    "a5_csr",
+				    "a5_qgic",
+				    "a5_sierra",
+				    "bps",
+				    "camnoc",
+				    "core_top_csr_tcsr",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "ipe",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAMCC_SOC_AHB_CLK>,
+				 <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_CORE_AHB_CLK>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CSIPHY0_CLK>,
+				 <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY1_CLK>,
+				 <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY2_CLK>,
+				 <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY3_CLK>,
+				 <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAMCC_IFE_0_AXI_CLK>,
+				 <&camcc CAMCC_IFE_0_CLK>,
+				 <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_0_CSID_CLK>,
+				 <&camcc CAMCC_IFE_1_AXI_CLK>,
+				 <&camcc CAMCC_IFE_1_CLK>,
+				 <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_1_CSID_CLK>,
+				 <&camcc CAMCC_IFE_2_AXI_CLK>,
+				 <&camcc CAMCC_IFE_2_CLK>,
+				 <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_2_CSID_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAMCC_BPS_CLK>,
+				 <&camcc CAMCC_BPS_AHB_CLK>,
+				 <&camcc CAMCC_BPS_AREG_CLK>,
+				 <&camcc CAMCC_BPS_AXI_CLK>,
+				 <&camcc CAMCC_ICP_CLK>,
+				 <&camcc CAMCC_IPE_0_CLK>,
+				 <&camcc CAMCC_IPE_0_AHB_CLK>,
+				 <&camcc CAMCC_IPE_0_AREG_CLK>,
+				 <&camcc CAMCC_IPE_0_AXI_CLK>,
+				 <&camcc CAMCC_JPEG_CLK>,
+				 <&camcc CAMCC_LRME_CLK>;
+			clock-names = "cam_axi",
+				      "soc_ahb",
+				      "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe2_axi",
+				      "vfe2",
+				      "vfe2_cphy_rx",
+				      "vfe2_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_areg",
+				      "bps_axi",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite",
+					  "a5",
+					  "cpas",
+					  "cpas_cdm",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x820 0xc0>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0xc0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0xc40 0x20>,
+				 <&apps_smmu 0xc60 0x20>,
+				 <&apps_smmu 0xc80 0x0>,
+				 <&apps_smmu 0xca2 0x0>,
+				 <&apps_smmu 0xcc0 0x20>,
+				 <&apps_smmu 0xce0 0x20>,
+				 <&apps_smmu 0xd00 0x20>,
+				 <&apps_smmu 0xd20 0x20>,
+				 <&apps_smmu 0xd40 0x20>,
+				 <&apps_smmu 0xd60 0x20>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0x0 0x0ad00000 0x0 0x16000>;

---
base-commit: c7507e07687010738e5f16926078f78ac0d6509d
change-id: 20251024-sm6350-camss-9c404bf9cfdd

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743833;
	b=wctlpn3V/jI1RB3PXX7Lx9BXvU+bZ4sv0tx/9Z8FpkOJGcN1PlC7oWpMnbT2xyrve1cP
	 qAh/Oi/Ja7JaKj3ldk0z6ZTsH7HOv10ID+l+Pqi5r/3VmM9IY6PbBro04Vw/ouSF0AEdX
	 kQr5KBZnkXgWPsdUJyXCq6HXyl7DdGHx5nvdtMqHSLvaAOQpgGUKuo69jFyolkLzW3FKK
	 JvoTDTNBrsP/3I6w5nlsCWaDidNq2TIr1i5GOpTmQl2jVWEWUyb5Tk6EGRswf19TocDBf
	 4kjyichPlygP1C/cXtqhBPtv3HjfSiNhdh0EgqEJQaIMvtRMsiZqvUrSv/HvAmaBn/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
	b=JGoLILGKnKAa6acoLTKMhcaeHG0S/HZjuJwCkT+EvoPbli5YXDEaHM+H3nZvjUPPwnWE
	 sIt4Sb1QM5Tkv9dcitxQo4C0hbjBziecv6sXK/273o7ka9CLpFyJAZg2dw2mKSbvre0RP
	 MnhXVopT8FJfuOITSN/reB2NdSXLgGLw5qz5UF0f63VCWbpxgnHAfoyr/fslMepvrXGTm
	 /ZO2VNBd9A4mfXP+jXtZUke6MhiUsFQ3L/URvdFbATpT3OwixisSjcOXa29dD4rpiYCS0
	 VVgQufqOOCNsmU1qeC5JE8LRK2h26jdRcM/NpUJqSCbFNMMUOZY53Ls/X+D3mkicl7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cS1Avnsl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMmSckmd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A8606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374A8606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cS1Avnsl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMmSckmd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKnGS3065534
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 22:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+9tAxkmKybA
	LjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=; b=cS1Avnsla3yN3HhkWdS+CODOWbk
	IlQu0eRx+V4fe0l1AgiHbbqSQ/xxilssFMxGWnWgL2A23yWGteylTPmtDfH5cyhT
	FCQZcW1q0mYODPOjzIjH0HH4Wq65DJQRMMhX37qTH67ifReNzD7eD/8m641H4iNq
	GAhrV/FqvBYU5lDk1nPJxZ/cu6gOP6hA+ry5Dv4JOvpvXlfPz+llX/OWfcW4ILO4
	tP33WdWfIjNLSy6Z/HUmQch+unSjJkidySq6y7+rGQyYz1t7NXAZ6m2m4d3FYNWZ
	nbwCdhmUJCARtxFQLPHOP/HosCmklBB8YlGskG3CzzubmjNHaz8l4z2NXiw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt0jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:10:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so408422c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743832; x=1794348632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
        b=TMmSckmd9QQzL5o8Ny4UcJqYsEtlTekETrdMSXVY4kPnnbL79RT4sfAGZKt9cbFrp8
         So1o/iaZwk63Ea63FmKhNXZHF3F4zZkHH/S1Z04f+VAxaixfaI3aE+wialuLaxnygAB5
         /Ry/QU9h/yIO5j6m0VbiwTQViFjztcYWnv6WlZVFwT0f7regaRJe+iNBJHpF+NvXweO8
         6bUo/VHl5bRdYIItxp9oCAHcQZVgh7qUhgwaoU6khxyCDUyRhqdQh6FzNRfBH1/4sqBc
         JKrwLd3u9zGmN7/YMOi7zuejDU2FDaS6L40yE7HRS1vM2Y0ccaxlL9Dasg0Tjd0i9NfB
         BBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743832; x=1794348632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+9tAxkmKybALjlGE9yfaUABOJm4ISE4wUDWniSYnmUA=;
        b=SxfyETl8aAuheJQBlSkvIj8aIYoPQlZ19ZDhPSRh4ab6Jd6DLD3i9I3FAFGA38+DJc
         5UvA5En5zCb+xIhIgQRHGmwE7P0gooLtFUeKBhBOai1hlZH9eTiGIKGg1+bt5xZHCVrM
         VTjLfrzdAr9BMjlJc7o9Cq4G4tGBNgIxGfzLmi6sQ8Vtiqpxrhm84pf5nKIhQan/1J0x
         mh040TspFSTk026xGajUWL8IH1tdxbXDIQ0TrdKMqK89DvfiaSCMjbajfqBn7PYb+L4f
         Z1Z8y6rDcJkvki+KteNXoBKC/Ii6bJ8VZh9d24itPUztkhqZHIM+GTPqmNqn/MmR2R+K
         DU0A==
X-Forwarded-Encrypted: i=1; AKwUvBx0ffTo9NuMZNBG7pPlSsKmnF0LEEGLQNoyzB5fK1wfUTmX7CaXGWva/5/owMR9XdiRcMI0oBnnAeznFmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZTWUR23HY9SIUCO9Hhp7dvdYUcI85acjAzdNQuTDEb2uPZ9po
	BScLNjqL/c+McIofQUTiu6fDEtC7w8aEiuzep4GQ/QAMLXyito9zPmKEqw+irRBkkYX7CiKaVa/
	wZEtX17PpY1enTWUOGJeK/qsW60okLhmdPRhfEIrQRUu0gUXyTQn+8DoVC6dtDuQsxxo=
X-Gm-Gg: AYBFou13LObnUDHIKGifRnpABnIlFZH4mUIWwcicZq3VCyAoLc72ZiOYptyzUSUZBWx
	/ac7sn49UaxoYg5Jl81CqZ4FC+gSOaU9AZuvvYWln9kyH7H5oNmjj0pT3PE+GFM43td5GJFuBf5
	ur0GC5cVJptD+TO3qB5HGV2kkuu/RIRRa+OQ50YXzQCsGA6mL3wII+Gn4iCjBRez/9dzCzrCwwM
	nLEchO+dQVBY3++CBeLqOIx5rVdkcw4naRpLM+2iQZERxGg2psBmmA1iGx1Q4gBtX2joyPaF0gQ
	khYX148FtdaZM6kRcdF0+13oDb3DssIsi3C/uZlATIQUtbgb9QL9s2Tm3u2Anglp3aPAiNQLA80
	la45sc5mivzx4P6cl0BXYcKo0yqzfKsWTAwPcQ6JuuuT2Cj1sHxU2Tk0NaH/KupyILm822TYjlE
	Jc84gfNmiojHahoo3WkSnlz79n+HKN
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1ac5bbb4b85mr28440959c88.9.1793743831637;
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1ac5bbb4b85mr28440910c88.9.1793743831041;
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:30 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:25 -0800
Message-Id: <20261103221026.3662383-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX73oqfYYblCFv
 kRm/9FXxsDgjV9c+dnOqUDjJ4F4ckRBJS5tiLRkzYmD960dOEEDw45vJc/TWDjnzngerWck8E5s
 uqgpc1MUvF+fkeIxTHJZMwnfDtHzfB8=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea5bd8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=n2D47ajo8674fvOcmZAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: U-tLnA-SFRpOYX6LHoqT6lKBIysRbCwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfXwOYKglIuNaq3
 J9XmLLLGFJwk57TVCp5RTpC2AazhjjfGtAC2P2IOphNPZtwDNXP7CBmJceWAJtzcU/JKCGELaZh
 qKVnFUOrRiFUbjPglWfjPGUiLrZCO/q5V3AMLIdKTuANuNCtqeTXy4gUj/w6LHaaDUIocZw8woJ
 uGWqNG9cndvb8tLKCBgGvXIRZBS0Dx/pLwuGCjJJSeMLHO4cfhWJfiz1wWTPjZK1dz8y/RrREsZ
 ZsP5kHmbSLgea8B+2cOHO6Mru69A0qRCyS/7VNaFaTvanr4gCLAZzDLCJlTNBw8vv4lcEIDYGdv
 9mZ3EapHPJiWhlo/WE/RUaLwsD61qlj5yzCe7UDQLwGAdcn4YYTsiou6K0jmlKQURnsYLc/cW+i
 yU5V+3HYmOCdIqSstvD+neTtARNaS5cLoEgFmnhFFWHMSiMh0DGrXops5FDOhxMB8fd3ZwB/KcS
 NwxUTgnTpNFB6kbPnOw==
X-Proofpoint-GUID: U-tLnA-SFRpOYX6LHoqT6lKBIysRbCwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose the three QCS8300 CSIPHYs as standalone
qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 114 +++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..9585bc723fc4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5577,6 +5577,120 @@ cci2_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+			};
+		};
+
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+			};
+		};
+
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,qcs8300-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
+			clock-names = "core",
+				      "timer",
+				      "csiphy_rx";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
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
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@ac78000 {
 			compatible = "qcom,qcs8300-camss";
 
-- 
2.34.1


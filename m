Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692D245005
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792195890; cv=none; b=VY6kJCQRj3NacRlx9EQMS9IGmrWyH4ZJOTESXQd9wkVO/Aku49aUx/DS4BlmJTAZF4KOGapgtI9tssVdgeoOOIcqvR1ODgxRm4Kt/b7QSY75GeqppTUtAt5EtYFmNUnlyJ2Ia+oJVF3fUrXK3JimGR8/1EFJKfDxwQVxC/J6q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792195890; c=relaxed/simple;
	bh=GncZ4YssOZVlGgLiEAYbI+2z4+k/22FvhlxQlnwN20c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UzVo4XR6GhFBZLbOXO8no8qYPYWQPbfO806d3i5+VE191efs9QkitexuCQHuagZh/Pp7D2Dxzl6Uvy0CieMmVCsYs1oOMgQ+8NquJyTM75J1d/M5CrWC96gVHKDWSfrfcUDS3R3MyUDlHHdMUFOAQC7d9TMGcb4RhAelSdZ2+SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dR1UZJHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESUfl5TU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dR1UZJHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESUfl5TU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNGD5i3324342
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SiE+QSa0Nvv
	sbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=; b=dR1UZJHMeBDfjW8lc+FeUhx9Fot
	pJvilkRvUBtIMxqi8uuTfFfSWY4V7dgVR/hi0AzYqZwtcnqL/yKR+hact8yMTo7D
	i9FvvbyrartvdgueTJ3JialEaiDLII0O71w4NVqHnnV2+viqkzOpi4DeZiRDTAJ5
	D0bl/ngGMKT2D2/x6Nd+D8tC9pFF0K2g1qz/hce4N7j4lkea516tvdj8lEIVU6l4
	G1s9BYwoLjo3BcY2AXrH/4Nk5WMIPT1rh2OcDJNAyCvdf/Kyg/kN5w7EeiM0fU+P
	719V3HWYRM8FsNGh/rTcktKUvDxF35RbSnhZc8ajFOZc58LKTUuCcL81YEw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumttnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:11:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso899808c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792195887; x=1792800687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiE+QSa0NvvsbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=;
        b=ESUfl5TUeeWXRCwi9G0ZRVLoqmGGSyWY01qKocxQiS/cTUn7S+l7ahaNhR3XVlpLDN
         md/ANRURiyyOezkCLhxX+SXWC3khOULFnA0OeK78bIbZjkHV8FzytgnOa6c5XaBXMJoL
         0oSp7XAReIWLgvZ6aiU32NP3Wd1T0K9fJJX3+17V4TjiC58MRmQl+HJhKpKeDAia2222
         JpJN6kGzb1EMlNeHx/tKWKfTRz+AncWG8DyKNm3tb1IcwA1Janr7KLhURfMcFtGpHBbU
         6PVUIp1XntBnS2Q7s+5q43vKzQt2DdxoO7NxiuS/2n1XEuRspMdeytKoNhXSJfzLK7yd
         8rCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792195887; x=1792800687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiE+QSa0NvvsbAwwK476XtO4f+nn9xs+m6bRdi4G9q8=;
        b=fsUjXMmxeHRkIy4r4tiuGprUd7vJ1gPQa9DpZKwok5rMVi+27QzkscfTooxBI+xD5m
         ASB6pzKob49+DAB5do98zySJuDgVo2FDbgFUDdZQNbYqRW+eBAiRj9Zi10S5AvyVDBqw
         6sojUTXa3h6l0ZkRGdhSS34/h4DajHUareNvl165u0+DMSIuzZKWXF88scs/Bni4lIqa
         Zlcd9zbBV/D+MiwRJFbgwAkrWthQ8BIzjRwB0OTZMs6wJhbpAgRSaz5la2/vjlF8sPFt
         jUEDBp0Mqo1kVFL144xBO8WUJpUV6kBVriu9PkAHrRSTzxNZj/JpsKupztp7ZCDTDefR
         dQgg==
X-Forwarded-Encrypted: i=1; AKwUvBym8lHgWHlR30TUdGX0uz8wCAuNqDm9IB/b6OXP9iPr7j99k++awX7Gv1YHYc51G0IaBCB3HRpj8bZxvrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR3jHRB9PwKUdi2sGJidVIeNBwrVQ0cDbroVwPPYSZOuWEHrOp
	cG6lLOmGbFb6Cb/sKnoamITK0gmZ7zVCydFl89didJcXByZfgzSx0no5YfH51vboClLNT1fgmsX
	gTyhuKFQ1JErws6wbsbRPnAav7XA5XoTCozKhEBmEUUa74cpvhncsZQslE55LgVj5RpA=
X-Gm-Gg: AYBFou0H5kDXY38SZ0n+U60ZEwJq9JL/FJcHtww645ZNNOItVrBApx/B5STf5vZEjFt
	mAvEgSH24xs9v/wqnd2zUtR7LwyTvFD7b38VaCyLAjYu9UbeJTVGUB4muXDBgwVlNewshI02tDM
	sqU2NTOos/dzvyi4WHLYjsYdd31BfrxGzE5vEbKP2DzTa8LAR+DIi6Q3a7H1zocSsqHw9yMZMYM
	/vj337m+GOlKzHvLUrpPvqF/33OJKJXEaxIixIdVA41XqEU+hOyIlVlVUQSFiTUIhOVLoYtn4qM
	+UC/rFSLJPsiZ7MxB6QCM9RTUJWHr4wExfpP/PdTr2ekXzs6QRTmqVFAshs38t4+5MpJrLgFXWO
	Tskwqu2kDGoHZN0qA/oDz1VnaQnuWcEW66ZTu2tPpG0511dUgYacTuw==
X-Received: by 2002:a05:7022:b050:b0:184:329d:eced with SMTP id a92af1059eb24-1851267070bmr1803689c88.25.1792195886546;
        Fri, 16 Oct 2026 17:11:26 -0700 (PDT)
X-Received: by 2002:a05:7022:b050:b0:184:329d:eced with SMTP id a92af1059eb24-1851267070bmr1803668c88.25.1792195886012;
        Fri, 16 Oct 2026 17:11:26 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm13441361c88.11.2026.10.16.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:11:25 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Subject: [PATCH 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Fri, 16 Oct 2026 17:11:16 -0700
Message-Id: <20261017001116.2318647-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX93zJvpZc+ssc
 RAkqwiIqDpScvuxVwJlai3n0usP6QIrSkV5+ijxEYZFwK2SKK8ivZsR2RqlbHRD2m9yodF/bQt3
 gNeXq3pJsJOuRXusJ0j7U0OAIUp39VM=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad2bd2f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: T6q9-I6WwOK51qvJwahqzv74uu4EKR7o
X-Proofpoint-ORIG-GUID: T6q9-I6WwOK51qvJwahqzv74uu4EKR7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAwMCBTYWx0ZWRfX1lmlAW4ZTv+l
 p43K0cv5o8mJ+DqdAwhrj9TBDrKkXqwR+GPWFdHIaIQODXAfxxt4Iqk69xQzXvMDX/kEcg/QDT7
 GWmMb4LW7sH0rImSLPVTBWF5ezFii1+FM5QPFMP8Y52MLWV/XDzf+JTTJKALOaeqz68AO75bmxv
 Ma2g/u1arQhxtEPQxzGMbCqWnPOSuamZGQsL4vIPoS5efiQNGa7jvxCpJeIkBHooLCQJcSjbwyd
 2+g7KAha8Y4tMvcHjK1VmK3cCMQNPfgUNRPhPh54DNyWHVVft7LrM2nlGzpXTiuREHkT4GRfpzv
 GtGEa4PipMVAyrt5bvXeWQi81lBUoGAMSqDOtC7pM7dme+9X8Uw8vJvhme+PyhcVV8wAW0iEl0h
 2INb83ijvyOFuTM+Hc3X88OEqIUFtVS5kkCLo4xeqW2YbOlE6E0Q12Mnb5snKLJt9mR2iEoDO6/
 ME9zBzp85r8obZR8cgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170000

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..20b43b7625b6 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5151,6 +5151,178 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
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
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
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
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
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
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1


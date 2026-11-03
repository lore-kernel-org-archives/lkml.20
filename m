Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743833;
	b=C1FxYcM5iRT8Xt66VN8GG24Zww1yab3RJI0fHC2Cnnedy+1MJJ62K8iRSG5WtpbWxaFW
	 /W/5aDnzhR059SmejfT2Rg7QOty08v4JgkQEQXpieInh9TeIlDIgWrkHasyHOViHk/dna
	 Sw++bGkGRIUbtQqQhROw5titaUGL3uFhvjGO+KOD5eHk6O/yGm836zYjjQ7bewBT0I8Vs
	 s3yyhLjh0MCAIZM0ouOuWBvuRDNG05g9PxZHzR/bM/J4O5u72KPr9ALLMx+nFM/Gx1YoT
	 6bLpzVj6ZN04bAfKxVHJcKdHR67MdkJfVoaSVxPBV+8SdRgbi2vROeJP7t4UDSB/lSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
	b=0cmqHm22fZUTOcegVxG90j4ySeks5UCXQYwWMBfJnmAsDjBAFczTLbGjyiu7Fjc4XJSH
	 dnNUN4eh36/O1/31Hw7mr339B4Y+GEp5zlCKvbCwGpY7njWsWBDf/2aSK71Y9XAbK5MVb
	 7TYAcnbWNK+EzkVG1tVOH+TY2itAIN+DcPLN2VlHB/zZqEI011JmziOz2PATySqLe7x8a
	 W1gOObsBvvg+0RPLtDHw7+dcYx1yZOiz61l7+4jnd9LyFQNCyz9rgYYW4QX2XYdrlTGY8
	 +FLVKRmYcV+/2c8g5SIUjiqv2NAvULOnVGGHlUQaexSFbdZRk92H7tu0NuF3G5l9fxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hxu3c/hb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3K+n0PO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E2606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F2E2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hxu3c/hb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H3K+n0PO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL0hR4024618
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 22:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SsugyDwccLy
	3pMH9vThYKW+QiCws2a471g5HurPgIdw=; b=hxu3c/hb20igTZkufbJ0LqVRs4r
	wLrWqhXIjS4Cu1pd9IoaytvkL7f+quiw9G91IzHx9lZEPMfguRO2UIUUqo+9AH/N
	WPbLih1IaiCUEK6dtqPItq/y+fvhdoXWi4N5Eh3Q0Ztk4AVNBEXQl2W7YuzlNa9Y
	eou09PyEECW3zuuPpZ31HL3iugxHP8XzlfJ4M7dGxxK9Eb86+lc+pOQKM3AgaXtE
	Tn/veUKmlFnAC4dgdw5B3XLQiNHgAkQClh8NtTEXyVlgDfyHtCpnH5Fe4BFUFe5M
	viiWEmid2oSv1p+VfTFC+m2GluTpdlB8cyNMFCHmVTtQNPRP1ftfFez/8Ig==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubhf1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:10:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so33148eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743830; x=1794348630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
        b=H3K+n0PODxxhOqXwpnMope3uh+DO/DBvTO2BdOzS2O6jNi27rwnIa/xnvNGf9kMeAC
         NdFfnsbhDR1zhEW9MIixcwbGzTZSxvc/Js+3DmlaYHX4TJfV9aeoupVAfbvesluBaPIy
         udilmxJCfcozimSmtOPlNfvVAF7xUP0NYSW7MA85rfgJCmr3craCpOxMG5UNbtRs4/8f
         K6HVAqiiLsY2o3jWo5FLN0Nhz4J6qdX3Td+l+iPpmUEhNcRH/pH6JuzbephazKtGz+66
         u+cOOEQ2OSdE3w06pB3rqwe8Nn7C3sjWmivT5g6zavE+w+wjl3Z7y0nZ0kbdb3ffuAcE
         HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743830; x=1794348630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsugyDwccLy3pMH9vThYKW+QiCws2a471g5HurPgIdw=;
        b=hLQJ/B+4BX0GrlSZoT23v6f9fHGrwwKOewpRKZhlMkLMzPB7XArMKaix2Z9dPOJfFe
         md+SYgFbWHkELnfAhqhAyTJPtjeLOzNs5ftfQuA6aTaaNXSJuGspbnwp9mpml+T6G3hT
         y6MwF9Nvkk+xGp18ubq/GvoWNVVREbr+kRuJSQbwk+tCU0xHyPimi6ZzbukhFyF07IhZ
         4KzKPG2kWAQhbWNkiQC4Gb0GMlQ317fqPk67iPpZZb3xqgYA6EcWXXaptmt9akWBpH3f
         Yj+JUDYeWFOSxpeNrATPW1GWOxmwjI2ADlJO4jKrqs44p0cxvaLj79HQkFJkZtQEsrCH
         wsHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRlsI8caPRKSCokjZjTmlotNaKSB6KEgcBDu4zp0csQ/yUnQRU9170Iy4pnCOLT/UHcpMMiWQdJaeUQD0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H9Lw1iWqWqoutlBcogR5rHwrpcYiHy++3K4BZx2bA6jOn2Ge3
	JjMytiGMz8BK6oTdUtEDdu+lwahsv2pWmP136cs4azrjgcddf1j1ki2UYSg8BwbtB15rnDE9DWf
	7SY8S0UPFrDJUtVqmPy3fvlJDvBpp4x8N7UMxIDCG/hVEGI6/x/HHC7bXpJnmUml7sL8=
X-Gm-Gg: AYBFou1M/7gBfX8sNClzS9sqk2s0guSiuGaDWAUoFxWxO49GkjShMZ3yPvxdBtBFn/s
	tBg7sKVLBE0GmUnOUgRFIdF74UmE25xlcDDEkIzlu626bJYOFLQfN0DW1wrhGNt1jvofHO/Gi8p
	pernE47lr/dneIIjbgPfpVFhoUgisDf6BeExMrUpAdS0J/AS3shZuQKt2Aj1ajgzH3JBuwYOVV+
	KcHlEhFyMU4vMyAQR/uTcMqCIP8Z+IgU6mbyVcUx+bXtaaubTeqHsOJ1twcfzq3PBbTK9t8QucW
	ow3TtR6JSW7voxQQfty8soMJ1SpDG5KnE9ndTnCNOfpFNmAB2f2hi0YTdu8tBqFhMLwZ10WY1LT
	U6NdxRqOCG7si3uHglSsm/cppICK9sZ/r4sNZyqQ1vIU5UO3A02aM66rvTjlOp5g7Zm1xdXwcEz
	A7u1ct8ZXoCgrZInjxEdzjdeH1OLuy
X-Received: by 2002:a05:701b:418f:10b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1ac5dd5a055mr21906055c88.26.1793743830116;
        Tue, 03 Nov 2026 14:10:30 -0800 (PST)
X-Received: by 2002:a05:701b:418f:10b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1ac5dd5a055mr21906031c88.26.1793743829568;
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:29 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:24 -0800
Message-Id: <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX7VjLT/nKyrUD
 GP5wKh3QcSUS7yhnG1eQi8q8wxC3JqGHG5Ecf0GZ5pfZaankofSRPyqebLIs9j48DI/bFR5ISqU
 7XxLK/Kae+h+WVkjO8/spKk6tXmfFWw=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea5bd7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=WG68aFPFCIj822xaBb8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 0T12At-cD8i3sS7-uFTRnd_DyElfcTXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX8yVaoNC3sPIe
 iTKtMan/PE9/Vs2/Q8On/EWBxQ6+8nkssP4XJEYa0/sEo19VuhwfE+9mpOny1bGcsd4Wym9Ls05
 VC9TodJ0e1xTmQZc3Xons2yHU8ehCqvXQqabdWWqEgUCD7s/nOQ90NML/rkYWcSkBoLCP9M5Iuq
 YDnGLUX5EK7FoouuJzVf6OQWGap223fILVFutKCOuVS9vpyIXY7vjNX867QFQ448JjubPHYzWqC
 jNUNN8uLK4nn+oiio5mAR5Gjo3zCaSDj0dR4O3ayOiiy213bEhEy+9ha1VZhe/Rr6OV0J6bjLfN
 id1rt83oZyfm8zJYWDePBFbLJGW5tTHoj4WW3HOkk5XTQHP+nSp2x19fbX7pXPY3llH984BVE6g
 Oqr6AN6FDFru4QnqDGgBurHZf8XeKXa/MZ3tsM2IIKoUldu/KRJmtu/ojt4UPrURbTbXZLFG1Di
 Taz7Ol5jOeV9yS/nHcQ==
X-Proofpoint-ORIG-GUID: 0T12At-cD8i3sS7-uFTRnd_DyElfcTXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
generic-PHY provider nodes (csiphy0..3) at their existing register
addresses, each with its own OF graph (port@0 sensor-facing, port@1
CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
once a board wires a sensor through one of them. The camss node's own
reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
that don't use a provider still get the legacy binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..2a30bf1c82af 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ac9c000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9c000 0x0 0x2000>;
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
+		csiphy1: phy@ac9e000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0ac9e000 0x0 0x2000>;
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
+		csiphy2: phy@aca0000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca0000 0x0 0x2000>;
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
+		csiphy3: phy@aca2000 {
+			compatible = "qcom,sa8775p-csi2-phy";
+			reg = <0x0 0x0aca2000 0x0 0x2000>;
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
 			compatible = "qcom,sa8775p-camss";
 
-- 
2.34.1


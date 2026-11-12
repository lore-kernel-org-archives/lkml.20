Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472465;
	b=uwZeMKGX8o72uIt3eS66YNGC2BUk7wvCvvjvQ8GXwrcgup2g+r96HI7erTu62I8HtFbu
	 COSc9Pd47NfrvP70vJ8wOSYJ2lrBfTCiGBSc5oN7di0ZSP88d4Nb+TfC9Z/gCsQROyP9M
	 grMf70d5iCA0kXtUbiRRs9QlylqhkQLJ/E5xMaK/kTJDaQX2tMcP8wKROzu42aW6INKGR
	 eC74lVeXZEkwYA7iOUFN2I9gzSht2xIhA77nClWpf8lcOCTW4N1C2tFX6dbq39/t8qBi1
	 FviIDjC1WXyKSSOrqc6mIkD9nx8gf5Sg4miycnVwtXg0jZZgZ47rTGXntbsaWEg2QLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OAbrta4TB+iPwb0QzYQG8jdtrdeGA25gVf6eNvnXVrE=;
	b=A9Wx7KucHu4zKHdDlmr72LeMQq+25TfCfdO55TO8NTXvzmldMwZcrp3KZrHo4ldJ0DEh
	 P/wG0n6DAf/5Elf38BGHv/P1BFcesUhKVOCkK8sZrspAX2nFf5/8MarPeZDUjhV/pv6d7
	 +a3BFKQrNBYqNIPzCVsi9k7+uKupr2RSHLUeKEjn2pybzAVXjshZELicKhjA4k3GYyJd7
	 qhaJtbCi+wXoFqkz40drQ0z/nnbLfUHd4Z6EHRkQ071ViS9dg+vvEruV6J87mTI4ZblqX
	 haVJTq/sD/dwSNwX4I3FMp2YjXebZc5Zr+x0kJ5zpiUI3zKhc/qsI/q948xmviyk67w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuewEtQB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDDxSFj5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4453606A8BA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4453606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuewEtQB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDDxSFj5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZaaB903603
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OAbrta4TB+i
	Pwb0QzYQG8jdtrdeGA25gVf6eNvnXVrE=; b=QuewEtQBzkyQKHH5xPsm1UzxUYb
	mdF0QxOYSLbIWS5HuSI7elZDwmGNQe6KSk7fEjCFp+jTvPjiV6SQhahWvN5qGlr+
	2SHexR2vwc2fFm+xiWycTnsswkqgS5RdubHnnTLDcP3DjTlMEUfLmaAbr/AtV0Ak
	REpDiWd4jgH+RCX+JM6hjTBwkTjhjr/cLQ6d+VZ+YgNnLIq7TkgNJOB80+MzCQ7K
	ScMm0bB1GfKDQXiHElv1ru8f8ZtFN4+ys6/PRJY5xhth1kK94kZeUJLH1JG6zPO/
	ty1fln8D2eIEZvHM/fB72WnpGbXOQ5Zqs44tDbTm94JCEb0709NCXVuP0IQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubrag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so158505a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472463; x=1795077263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbrta4TB+iPwb0QzYQG8jdtrdeGA25gVf6eNvnXVrE=;
        b=KDDxSFj5zOSFsMpDtqSqD9wqwYtmGWli7tlqeGxHSohW1U+bMcwbwzrvCoszwKyvQF
         Jgg8rtnRMC/ou29ES4OsMdqKCGeIpWW9Xl9htwFzXHqZ7FqWFcbY3+OJagfaY/76A/nB
         kWid6tglQg8hQ0U5wbtOsOoTDarAKrvdP2+UFMbO7PGbclaFFpPaQbGwxEiGPKD24dL9
         7UCcdC2IVsb0W40g9fymFQ0DGx+0pV7p1EX1p7XMNWyHTVtuV1IogSgMq0JtuhacpSpP
         nKXe8ixpilyzXErdBPT79Yy/QivtsZOpnmnf2AZngePLOsl27PTvlUVGvalgv0qB9QGS
         el3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472463; x=1795077263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAbrta4TB+iPwb0QzYQG8jdtrdeGA25gVf6eNvnXVrE=;
        b=cAfGFF2vYCfVKT3AEkY7lQ1Is8kE2KSkWZ+i94vGPOMynYrJYOsDgF3kX7vDr0pE8j
         KZeuDeTtc/e8iC1YCBeu0SDncciw2yee4FpO0P7o2DcKC/yPXjxzIwIwhBkdv+M/7qKc
         zJxzQWC8jzL7RAEGqQ4cnSGq520UpSPosW00aZtyDTn1EILu02k8T90f8BIOpf7M4zBH
         ioxw0kSFGCBJJRoVE8lStcR71jjcy+SF3MlrVXOkxzu5jDnpVPsnWyHQerrc7ATQbvIC
         /U+P2+I7kU3L+W9LlJufAv12XbUQbvE6Rr+O0uxYsOxNFqEaPbD2rbGPZS1c19up5wvV
         24VA==
X-Forwarded-Encrypted: i=1; AL+hErEWU6xpb7M58JXGhHtKeRPXO6oUMqhI0fetoYUcYqbpL5hMeWeKO3rPZ6vSFTqsAFzFT6fLfM0xcOg+sd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QJOHDgl5kwWcUURZe9ayoxr6kMeTE/bqRNFn7XpnDUjEd/LvZ
	6jRyviHOn8DE1dMdZ1AssmWk6bcRnMtaonRb+xJpAQAdOinW4tfbNwsa2LO9YGYsu5ovbqnfmL8
	hFqNl4YrErwoIYFRciaEaSvxZeUDxnXdqMKiVnMiUZznlVJjDnFegUMwLJF5+rxDfTHg=
X-Gm-Gg: AYBFou18zQjVvavi7/vaf9/kwN2ATncn+usm/V718Et6Ta5epfYIEsWAMhqO+TpnD/h
	NcKjLwSY4Yehb1TMSnEgEWwpZ5sjOhgIr3ojXQEweLQQqu8DwXd3DSKFcJTN108knVo6ZKwToLV
	j50O7MgLs03fPuYwDAKPfzQxaFMxOFW3Qo6t/MqXEC+RaBpTeupEVKmKgAay0etNrKpWluCuU3i
	yEw06HztbpGW9QeOupCj2uoVZ3IPq8TaP/6TI2vKcWy/EvWsBrnC/BYKGatlId9QeStYf65UThm
	yb8NiMLMlPPznUpH6yk0mNhyjGpXXn/FQSdQ1R3pjhFnp2oPrZ+dsZ2j6s92cmKs2aLJjj22veu
	rOVW26boFU20CpSUff9oWqq8LjXPPL2P9UBZcoqNxePCMW4cLKkiolZXg/mLlfSG8g1rdKBcOlH
	Ydmw==
X-Received: by 2002:a17:903:1850:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2edd774848emr77646575ad.3.1794472463555;
        Thu, 12 Nov 2026 00:34:23 -0800 (PST)
X-Received: by 2002:a17:903:1850:b0:2ed:4b23:c41b with SMTP id d9443c01a7336-2edd774848emr77646165ad.3.1794472463045;
        Thu, 12 Nov 2026 00:34:23 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:22 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] arm64: dts: qcom: shikra: add PCIe PHY and controller nodes
Date: Thu, 12 Nov 2026 16:33:54 +0800
Message-ID: <20261112083355.3884737-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX2HeEzb4KTelg
 GbOTU57nk0FCzYh144W71PRa+Iz1rFFwgZZxNTxk03YfLi7WLGaliDH82rnydiwuZeN/GsQHPbz
 VBPlZgXYnmiXdRt106Uh4p23PZwAezs=
X-Proofpoint-GUID: ir1sihqI-hHa-JoL_9Lu-pqbKHpfWniW
X-Proofpoint-ORIG-GUID: ir1sihqI-hHa-JoL_9Lu-pqbKHpfWniW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXwpHt4Xc8ZSNk
 ftZOlz64TMmyyQTq3GfduJafis7Y0U2PynMi8DAwzwFLpW0mcz+VRBKZHZ2udA/OxfpojYz20bE
 mHUGHpZv5ft8pAtEVv7eQlOh2BxRZ3WgpLmHaXriI1dR4ClaUcWJI19PKa/l3DG3Y6ORd5bew7O
 +x07G77kEkZOMTHVVWFzQRqAfX413YpCLN/b4nU1g29Fo9XMQHj/M2ADWGsc2xpIhNTMLm3IQl/
 Hqm/U2lgE0swD4byMcuB80u+BH3f3DyTnUhsRwgwOkXE24aP0kWIAxbr0LvT/VADJrkEzPIB3ca
 asimKR3sHQzQ7ZLipQldmJptmOTr1FA6cWUHe3xk5S84zsMMnQDLm/cqJ+EWdpUycfSxby7osj2
 wfGkFbWhhkf8Md7K2kUDiiSfAmqtICeYcpo/f9mrYSkA/tdaxAcrRuHycDbnZJV/Xf/OgR7jaqd
 NbvNBdnZLa/VpRYmU9A==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af57a10 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_EL0bMPTzUm28oAMh2cA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

Shikra supports a single PCIe instance with a 5 GT/s x1 lane. Add the
PCIe controller and PHY nodes for this instance.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 158 +++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..fa9b0d41a576 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1285,6 +1285,164 @@ rng: rng@4454000 {
 			reg = <0x0 0x04454000 0x0 0x1000>;
 		};
 
+		pcie: pcie@45e8000 {
+			device_type = "pci";
+			compatible = "qcom,pcie-shikra";
+			reg = <0x0 0x045e8000 0x0 0x3000>,
+			      <0x0 0x60000000 0x0 0xf1d>,
+			      <0x0 0x60000f20 0x0 0xa8>,
+			      <0x0 0x60001000 0x0 0x1000>,
+			      <0x0 0x60100000 0x0 0x100000>,
+			      <0x0 0x045eb000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
+			bus-range = <0x00 0xff>;
+
+			linux,pci-domain = <0>;
+			num-lanes = <1>;
+
+			interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-parent = <&intc>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_PCIE_SLEEP_CLK>,
+				 <&gcc GCC_PCIE_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_PCIE_THROTTLE_XO_CLK>,
+				 <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
+				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
+
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "sleep",
+				      "throttle_core",
+				      "throttle_xo",
+				      "qmip",
+				      "ddrss",
+				      "tile";
+			assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&system_noc MASTER_PCIE2_0 QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_PCIE2_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			iommu-map = <0x0 &apps_smmu 0x800 0x1>,
+				    <0x100 &apps_smmu 0x801 0x1>;
+
+			resets = <&gcc GCC_PCIE_BCR>;
+			reset-names = "pci";
+
+			power-domains = <&gcc GCC_PCIE_GDSC>;
+
+			max-link-speed = <2>;
+
+			operating-points-v2 = <&pcie_opp_table>;
+
+			status = "disabled";
+
+			pcie_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0x8>;
+
+				phys = <&pcie_phy>;
+			};
+		};
+		pcie_phy: phy@45ee000 {
+			compatible = "qcom,shikra-qmp-gen2x1-pcie-phy";
+			reg = <0x0 0x045ee000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE_AUX_CLK>,
+				 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_CLKREF_EN>,
+				 <&gcc GCC_PCIE_RCHNG_PHY_CLK>,
+				 <&gcc GCC_PCIE_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "refgen",
+				      "pipe";
+
+			resets = <&gcc GCC_PCIE_PHY_BCR>;
+			reset-names = "phy";
+
+			assigned-clocks = <&gcc GCC_PCIE_RCHNG_PHY_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
-- 
2.43.0


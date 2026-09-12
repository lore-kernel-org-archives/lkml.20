Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063A38AC87
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224455; cv=none; b=B5ntCwELAYfnLcLItRIcreS+qnqQks4+wD3zDrM4MYlwA4OVdwlv8JLGzSpILI8PfqMhqDBV6WaZZ7DQaDfffeSXI3JzCaQzl6tI6q2b1ptlGFCE2KBLW/N9yJvgWTu05JGrFv5zkYE08mB4HosRJ+67PK2wPjyy+01fLdiH5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224455; c=relaxed/simple;
	bh=mKl121Yawc/mikpjjFTjhqC+NwYrSlXT7RHzgVfnch4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksfPvgEeLPUeq5JnNW8zDqUIw1MKw4nTG1cdcFlBjSQ21EpySEkIkKF24BSjEy/zJ9yn7ADQAIGZN39MJPtSwyRkkwqUgIT2ckUacLECGBbdmPe4gEs/YRVdR9urDUbYwKROTc/SWSYmQ4QNAJtiG2vpUGs85+2XGL9u7fII2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I72fU8L5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UurrfEAt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I72fU8L5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UurrfEAt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEde733249705
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=; b=I72fU8L54hqZwfTu
	eLCrv9FCBDQN4uHe6GYimgyZnusuTVBgxsNWFm9vSwtnxgGVAD3O4ERnzr0+hdpX
	yUDS6VRD2GywNB5AB7Hv8tHyvU0cUTCPZ/7bngeRUwnB0V9Jxo2efx7byfJgcEFW
	NZSMpd4MqDl84ufmjFo45igziKJENGwRfn/t6PBgLy68viXJZDsRh36cU4YgbaMr
	a4/TXH8Qc0HAzEgcVbA+POt6wD67svvCDfBKj5rh2XR4tg24NeeTu5KBppnfsnKz
	DjPR1EAIWZ1ztI4Axt5BAnaXouq3/JUcrBbD/2CfbDOkzaV0XHsi36vWBMPEhMf4
	zHltrQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c15m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so2507550a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224452; x=1789829252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=;
        b=UurrfEAtv0XLPQHTPDO6nMWRPMrxCWGPmJ410Py4DJLXEWRNr2lR90JgvcBXzue3P3
         btCTg8rgHNgszCDqi2FGICJ6GjXd09w36Oj6qm8JyRcwsDiBoYJeLdOFuFcFHzPhPhAP
         okJgOTt02vkEk4hej0m4oBROWNoHjD6WfGx7/OMBio9bk5M5reXuaDSNfgAcKSXCqBiL
         UfWfYgKFCyTIJqh8T3CoQ2bFzaPPVoeiItDv9kVsFSXy7Su8E9bIGexTVXhhtZvyVlCL
         cZMr/LU0jIWXqEIFKQb1XylfuWMOPb1QHab82qvY7KU7ngtdUyUGn1h+XTh1K3dpLIGe
         2vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224452; x=1789829252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn2eu6VSSJ+sept9MLYmyPmVOtT3T3uFVTDTwkUh2ak=;
        b=E6jE1H1Gg36hSknb3NqwUVKo+7FiVDStaB8g+6Hw3/qNfMTOlEjYE1FUV465oGmJ/3
         e/k+gM7clYu3p4/c9B6xbntSf8PZVeldV7BgSG5g1io9XMEE39JOxb/k5PLfbYFbGWk3
         XCONXKQbWr//asSJibx4jlU1vLDv7JJsE13/UyG/5p5L35zrWViH9ofPVwuwBghv+k4R
         qPCNSswFAneQw5mu3dwsOBLCF+UTPMXh+bdOxa9fpjuRdhy0iTu1hZav5hrT9wC/xYXv
         TOA9P4GqRcMMFsWW1m+rh2rNsjtTHXHDDLSOHp5MB4Zzx71HxAMkuLw+NxVQMhNVkcwF
         qhcw==
X-Forwarded-Encrypted: i=1; AKwUvBxfsaJuU70+OysxShuhz5FtPVe/QYsSwJ52P0gxMMooh0asYjKJE/RXtGn552w4iKYtWlUvlaeJg559nt4=@vger.kernel.org
X-Gm-Message-State: AFuF++ksjfVo70sebzatztFLkvzhPCTzm2yYv+Clf2T+GzQBcK8bgVkM
	ibOFqCZCrQMO7QvJjGHxd6OK3MeB4dwE4cVk6sqPZityCE1WTY4SV+RZ8ZEzajsyi7Cz3MyCwLR
	OW90synK1qIkxB4RU8XGUj6WnriStEb7e4xFdH0ePauOJKdCmFIU9gYWqkqIcBqEl5CQ=
X-Gm-Gg: AYBFou18Dt22UlFQeFtL3rfNM/UzkBGN6sHE9o+FY+lxsq/En5Vy6FyJRUNkkehxnTD
	RxhYsH/O84UTMbPhTxMJMDAIbBWXZnTfBUFPTYfQlmYf/yBH28syKCrW+CMVtI2EmTceT+VVPnI
	1XyHoC6/+1zSI2bCryG5TTzmWVQ03cmLkMgQ3pj+2bGixO7XFw2nRnLc7O5qreZJk129YCq0QSG
	H43agHLJhboLu4EEZlhOaCjeow7JoR6aq0ksy+LvNFx/pjgTk7qEPVlRTFHtKDuzdUezPbYw0dE
	eJ7xDnN6vrvREDW0jJQbIv6ca0xPSYq9uZTG1Op8+2SImk9GfQHK/kPlUZaZzqe9DxvH7aCXayF
	HiPMOyxZcOgLdS5E=
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr19440932a91.23.1789224451844;
        Sat, 12 Sep 2026 07:47:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec7:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39d77b770ccmr19440889a91.23.1789224451316;
        Sat, 12 Sep 2026 07:47:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:30 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:17:02 +0530
Subject: [PATCH v9 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-usb-shikra-v7-v9-2-c7b507a0ec27@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=7692;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=gGlOGXiAW+MTmFm/4DBrV7MX3wm4tyHd4TVI8Hor2y8=;
 b=mlw5lkCFZ1EgpiUbhPKtS9oKY8k5SiEbeITreCu6HW5W9HAyLT2EwJfS0HC5fOZe9hwOwDsYz
 4iTovBPZAnJA3ds2UFz5WlCBHXrrK5sYaJNP+mmH3hfu5P2a5kafQP8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: RHEcsXNOkCf48-UYIX_YPJXhgWjZQDvW
X-Proofpoint-GUID: RHEcsXNOkCf48-UYIX_YPJXhgWjZQDvW
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa56604 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX5iG9Od0CE2r6
 c/OPZ3QF6hUWs7hcTHQI6Q43ii184BAVwuO4luL5sW8SwGUfrpV+RmQ27N5DX6wmDbId1qUTqQh
 G87Y+L9Y67lINqdh6fl4qGj5A+d5qFPSgJld2rIlb0+2r9zlffiB1TzpPf2E0JMdYAkb7NIq6f1
 qGVooRFj6TNxDykLd3tgc/WqL6MBlR2wLQMC/lV3Rnt3wrnLgk9pKv7sJnz2hie56pUL39QSuUZ
 84Bu8MV9/mikI7Cg7hhPnfOXH3QpqGj9XfXjRBscuiGBs1HMKJcfj7/o5SlKnf7OhzE9bKmJ9Gm
 1KO0cOEfo9Pa7MOEJtUP5jg8BYCtho1JK4aydWv5Lv2/JG+cvms+YJHkwLaGKkQ67p8jCVG0s8c
 Jw1hJwMjO5PQgiKRtjATHUnQMeXH1OQH345StIJJvr6DDS5YEsaNO/KxhyfI8oK/BW8K4I1gF2m
 GR6LIjmtgUkbrkSzHSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfXzfDjSGVR+9XA
 WpHAytg62tbNhUpnztEfCAfj7RF6RbHv5wKtfZS8PZ8tSB6bq5VGpQZEQAyzFlDnrfjidU6P56F
 TcJ5WapfksXFE4fx4aMALNU/Yh4JLi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120213

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add support for both USB controllers and their respective phys on Shikra.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 921ae2a5a3eb..1395c182a2b1 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1019,6 +1020,85 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-dp-phy";
+			reg = <0x0 0x01615000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy",
+				      "phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244 0xb248>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
+		usb_2_hsphy: phy@1617000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01617000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_2>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -1100,6 +1180,11 @@ qfprom: efuse@1b44000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			qusb2_hstx_trim_1: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
@@ -1977,6 +2062,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		usb_2: usb@4c00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04c00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+						  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			maximum-speed = "high-speed";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			power-domains = <&gcc GCC_USB20_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+			resets = <&gcc GCC_USB20_BCR>;
+
+			interconnects = <&system_noc MASTER_USB2_0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB2 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+
+			usb-role-switch;
+			wakeup-source;
+
+			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,

-- 
2.34.1


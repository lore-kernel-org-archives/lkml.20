Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971614EFFAA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891317; cv=none; b=H08gCXA7j5Xxq06JbTvLw8ok98LnR8xV43oiTFhz0b1KBoHnvu/vP1iqfyhCztJfet1ahlR7BDD+rwqQlfo5CZAhGqHHBIZ40ALXypT76zQT+TT7bv5qqvWq0+01KRbHp6DwizNlufnMGKY2frWUP8JMuM3zxfO3g+Zy0cyFicA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891317; c=relaxed/simple;
	bh=W3DTpxCqgf4xS5KZ48t7rFxsY3KPDa8BD2Ab5YmpZ2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6/+TWPh5SBcqK0+epv62ynlM3JICBnzIbpo8frmt9MEm8JHIo7/2va+LzAYamnIAIo3k9G61x90OzmQuhwRoaSKAoxko1zWPp1XEp+s+OtgEkLEglUIF1Gw0dowr0u/EdYn1l4OzAtSH32ahuqlscKYnzkARLomB+Ye560di5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CijESa72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mf+eVddu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CijESa72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mf+eVddu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D901pj791192
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOWF6+wWXELZQAmsqp39gtDxZVBjhJ4eZEQSwPiqs+s=; b=CijESa72fxMLyrSJ
	8hZ0avTq+pHYSdfUi0GtIwT/t48o/yioMYTNFY4Sw8sx9imOIeWoellakGqk5FnC
	wZd6Xok2hwguswmalKL/e1cBt4Bvp50hKYEON7cViUC433GHUeuUS8IKJiN6odyq
	4RDk7aw2BGJ0TgeXS7Y/NvbLeSXuWUC0NyTXyWlsSSeEO4AM+XaY9uB9El/f4Ktk
	mhfy8EHHO25Vn+sCAsY0X6ry5/73BCBnx+dPPwILLXAmRyk3Don7Md2LQjevpx3H
	PAQGOKOSv8V3h1Uwzmwk38JBynV9IAhng0uEJGRy6Gd+ozxCFnK0e3UJwtkR3JAo
	gk1slA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrn1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:35:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8067974so730598385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791891313; x=1792496113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOWF6+wWXELZQAmsqp39gtDxZVBjhJ4eZEQSwPiqs+s=;
        b=Mf+eVddu6zO9cb5TEpkm7WJMpDXKnLDJcwMdawTxrahssJryoDfywd73kOn/FfO0+V
         CpGFDzGJQjDp36k2AWVlxL822y9f/bdODEslEN/B3JlAkrVcHLKS/Lk9xbACa4/nXeHn
         N1KZ37/9AdBw6RI1k4AD3P40VvTP3dnUaxBwd/UiIi2hhLt8FzSsV9bxOj3xEqtv2HMP
         VvaWhA3fze3FG1OtmSAcUHtk601kCWU7OHmTs9Icm8mAp4jpDVPwJTFdqFWJ88iO+DaE
         l9v+sha+idXZ7ax444Z/hOaCGsFbVQXYhMu/gQM5Ydon3jyWdPtKPAw2T1GUvX4+/e2v
         p9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891313; x=1792496113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOWF6+wWXELZQAmsqp39gtDxZVBjhJ4eZEQSwPiqs+s=;
        b=NWlMl7C0KtcJnX+wDiqn4iz0o2taJDD0LKpBuDfvNsz6PgmwqU5JsplmWS2x8fhoop
         n5HkdjJojL1Uj9OgWzDrK0xGdzcBkEFFGOPuQUT9cLVYQR9WyhAS3v/stNRsM3xf++MM
         HrXhGNM1X6e+fIUgbkCmEMSImvVao6LWMcybcOYUqbd/zLMAvkisNfdEpTfXpn9BQlXJ
         B29sEjMvJfgjuMJi+Fr3J80bFwXPE7BHB76q4N7jkAYZn3SdYHmQK2sG678h1Mj/9y4U
         cn9YcA28AzYlMLoxmJJ8eyJeG7Mpdu+qkJIZyNsltNqrbtz3uogv6YtLH/NnwXP/3X7a
         AO2g==
X-Forwarded-Encrypted: i=1; AKwUvBzUqMLtoN4b57dF+WNWL/ygS3CcWkzsPItls1J8Lmba2JVaB09+d1sYaco2YecbAr+081114TBGNd/oblw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ0F22qGtMC3jrzOJgzhmFqawsOoh/PeAJBC2SrYPPCoqPAyUK
	dkYWfsGwgpOHph1Q2M6rFKhM9u8L48l/lr15kucYJ2WvTm6ANGeFdRs0aUHYzEzrdYbc79mf67q
	++oDHdqpUCXQg0vcn+c6ylGE7x53v48j6qSN1qJBt+YpQTTwdRndIQ99DW4sQnsEC7sY=
X-Gm-Gg: AYBFou19/HvzmP8d2wj+Z3+JvICWlikL1CX96eXafUSFKs8vheiK98xfFvvKWM1BBds
	ZRL47hQqd+zilvCmwxf/TMlyp9NMwKjjcPbFIpw2h6Kp5ZlLO+oVI+3brITazAu+6ecd1e4dfm+
	ljMCuwLQVU4HT7W6uOeyP3n+zCd9F8IOth24UtjEmspFVKn2rb7rnUzLj3hfPNN/NPCVOdAzhC7
	vv9CHQq1jQateB25xp3YQ45D6VCF/fYNn31wb7zYewjfrLNQ1zE7wTgB7idc9rX4FuV0t0XRueI
	6SjniHBad5tL8DEuoqET6EazcdGrSwep1VxopwXr4IFzZ2gmFas/Lr0qIHz0NKEtk6Bzwr00fSv
	wIdH8gJ+QSAc7KR0IlyxtAs0MzGVy
X-Received: by 2002:a05:620a:711a:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93ebd493d90mr2161688485a.62.1791891312449;
        Tue, 13 Oct 2026 04:35:12 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-93ebd493d90mr2161684185a.62.1791891311913;
        Tue, 13 Oct 2026 04:35:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm654407215e9.9.2026.10.13.04.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:35:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:34:49 +0200
Subject: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6301;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d301Fm0XDvrwsa6TXfjOMiTGbtOjnd+ES5joDqto0xE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzhdhizKIuO/07r7FuA30AdwAJPqT6UI8LYUEP
 lfbONBD2KGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4XYQAKCRAFnS7L/zaE
 w5AsD/9o3ammLlN6gLLoltso353HTavJQC+mvetI3lvggMnJmWRWZmCRaQhWPLL+VOY8jQ/C0RC
 IPFv3gNm+MRF3SEu4yrlkKQR+6FoSyZq5gLYEmCpBaYR+kWcFf1umOD70SpsmOEBmBJDiObzkPu
 U+T7pOv9XVCnXplKxO/hChjwDsg8ER81keFCvtBOTO9ogOwyjz5/DAKV79YMA+Y8dh9zjCyiEay
 2atFbRGiEe9YMf9dzVbkBhjI/55zQ0dCW1Hvmfm35camCEpR7AGp35pJbtFQclL8lNo0Y1Sv51k
 WkzlM7DLdZZQv4vrlIwf2qpbdhajhZ789/5f0VrJWWyc6KQvFyCgvusatBb0fefFI0S3kK+nBXi
 bYxiQkSWVbzhr+CnAfT3Ay+toKYjry3kpWyNHtkYal43McHBETNiWXvyLmc4UEseUXgNr9xhPCW
 +Hvm/62p/kEb8u/RWwvMgGXggyYj5+KDDsqOfnm+FVhKPyw0+MceBhgrbGl3jviuUAygo8Vfb6E
 WZHjIMIORJ++hnZfYHIoN5cNYvNjU3c93tGhe0XMc1E5P9rpVptXNo9dzjC6cQ+1aZ30LIWR+Hy
 ZH30E/gTXkPSczkz4ZQISTeN7eDFavgSSa1h/HArrEsDxli6S9qmEI5H2W56JicDeqV3CQIUHnv
 0v65Ar03HiPhyYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfX3EpkJCudNuJ6
 MNNMybCpAtfswCn625vRgDD5E42BLAH8lwmRh2nCDI+G0coT1ThEsKzKeLrSkJXuoY3Sg2QeHGg
 Ai97bsPC/YSfYgVoUZh98PusxNEwfOo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NiBTYWx0ZWRfXzvnR7NoSu/89
 H2piN6y0A/Xg2qx3ATAGXkCsGcwAN0LN34fFxJUSCYmf4zdEB0EZNW2TzVVlmnxhCI1cxpNvFAR
 pdpj2aYZSmh84wZcRhGKNpuWIBt9iLg0cq7e4sC4icRiCH0KrRv6YgPFExdY+hZW1rp8QjRQCLy
 z5Z7rYoIvCPO7gutGBWwBfv5Qip8sTFguNnZnaEvIVfLgtX37KsC6evSa7iFiohFLbKW0z3OKOs
 C7ttfMmYCTkOGSHyZMEJ6ZFODnYDKAyPihEeE4TGjw5GxzKgyz2E9MEEYD2cGE18Etz5ZksTp8b
 KYClyHCm3HzUsdbswTzUToKm44qwTlM0nmSM6F3GOy0LngMXfCjMjLnvpv06BryHI8w3nGYNEW9
 EYtuEGmJlam8hYaktSl58lftasx7Kee7eMMr5rKSR37vFRyYXYRxWGOI23QavYwDW/+eFayPCu+
 FF+OmxzxzZ1WL+FyORQ==
X-Proofpoint-ORIG-GUID: jJo4-dQwOjds6RiGyt9MVwMyvUFRDSlM
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace1771 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Zzu6nnJzC5dSXObhMU0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jJo4-dQwOjds6RiGyt9MVwMyvUFRDSlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130046

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Wire up the board specific pieces for USB ports. Enable i2c9 and add the
three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
supply and reset GPIOs on the PMIC GPIO expanders.

Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
ports are wired on this board, so describe two usb-c-connector
children and cross-link their HS and SS endpoints to the dwc3 HS
endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
controllers therefore run in OTG mode with usb-role-switch.

USB_2 has no Type-C connector, so it is configured as a fixed host
port. Its VBUS is supplied by a fixed regulator gated by
pmau0102_h gpio3, kept always-on since nothing switches it at
runtime.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 222 ++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832eca91040e45bcd75eebd7d566906..cd73ad19b368ee04e512b9ba63bd4336d80ba4d1 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,37 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	usb2-connector {
+		compatible = "usb-a-connector";
+		label = "USB-2-Type-A";
+		power-role = "source";
+
+		vbus-supply = <&usb2_vbus>;
+
+		port {
+			usb2_con_hs: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -366,6 +398,121 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb2_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_l_gpios 3 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C1";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_con_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_con_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -440,3 +587,78 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&usb_1_con_hs>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_1_con_ss>;
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs>;
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb2_repeater>;
+
+	status = "okay";
+};

-- 
2.47.3


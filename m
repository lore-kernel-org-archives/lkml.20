Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851613B774F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144915; cv=none; b=d5xQ1Fwm3WkSksqyuAaB/Y8hxM7/4dfBva0z+YYFXPMQRxgtFe0rmalgdo10PW/jLTAC5QMcQZ/tmCr6zxdN9aD8OZht5aNQ1BcomRR/3Z4vB2GF6tcvDuq3TmZSozqXDuuIUgu0d8c7kD7/BolLo/9/HG2Aj2HOSGZ10SBROII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144915; c=relaxed/simple;
	bh=6baaU7n+sEVJAj9Wn6bzcJe6h3P3q7EI74l/o02CTPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hzq3yRptf3yLkcOmweh3dG9v3bTV7gTWNPb86mR12tOcU8N1pvcOzhxGONY6ULtO2V8eHRk3M/p1zFIIMGF7T7qIRPb540HIWMKnYfYkyiB1a7SK57Vm+uiJykOpbWi1U3jjUAjnCQZQ+z7dF+ScoMlyD0u+XdVhBSYQkggApTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5z5x4HG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4T+f/tD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5z5x4HG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4T+f/tD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmWDI3962453
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=; b=n5z5x4HG2VWdBqfG
	IIEw592z2u1oXeyjttoJZYWdEZwf+EELecz4T2guIG9bWbgKBLSZxVVXv8jOB+uW
	DUQtlXM6H6BnfOi8ed0xwi2gH0caZlWQ8XBIf4sdZZsCZzIBwDuAEMMG9LnJ2rvR
	GDa8IX/WrXIp5c0xdO2AXPq4t4FVQeePT/JC9sfLwDztYzxW/8Mo0bWa0rD3jTrw
	1zGJUtkrJgKfgarHMaqoUsLNFv1z5scvbXbTGudUSd0iJiPkzqjqG5TynkxkiEE0
	SH8P/6jI9gcfh/iykirUcRJVul3UWHv160wrlWH2VYZs3F7FpWjVYR3nvUN9cVwr
	RQygag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbhr7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so2206375a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144898; x=1789749698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=;
        b=j4T+f/tDfwjLATSBmoNmMKNwoj6jD5QnlCchrgnRLfE8StzX5e/kdzVJJrWv9rGFtr
         eFTm6xJ8RW59dXbgOnTJkhpGMlLF5z+9YYe00JhlPeOVYLN4DuNJAZkgEihQBWVHoQaH
         BmGz305GlzZ8FuqmIV6GUQBrMCJJ2V6kHCnddsfgKNMvqdOIryVy1EZlXkt8vWzaLGGK
         +Cl/9c+iKjYYYs+5Rcu79FMw0k41BwEL9osVtiDkjQNRkd4fsVqlEXkJFHN32PVmbt9l
         Bj8iOrWc9GYoafZSQe7t980PJKIpr1vLzWCRHxhFO8qrZMojCzc87kD7SyLee+UaV1NL
         y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144898; x=1789749698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9LscjuXhxeKqecQX5/VqopeParKN+QGMLg6M/FhLBo=;
        b=k4JViI8UbCVwRnXWfNYOXRTpzLZav77CWDcVvP6JhQW4/mYFp+DyqX8ntc4AoiciTC
         ilsdPyyEUKdTn7fgvy0xdRwqVkMQx76QT3gHvDC6Vij0vCUoyTko9QhsHEzeefuB3GQR
         Hv5Bs57GP4EM+pbFMDbav0Wz5cCf/LIN1GVDtgAYmT6RzU5oAC5NU1HDqbbPq5D+uWUC
         kdSIiVdSFG+EcP79NEWFE8QgF2BfYKSnJbMDb6LqgIn4b6bKYNT9a1ps2aQHq8ijrdsY
         aQQ/vSI468GLyCXjX5p9qW4NF3QO7beAz9G5zsixmZAqbhrR50ky9WbF/FzlNnMt7Qyc
         MjOw==
X-Forwarded-Encrypted: i=1; AKwUvBxkhM0EE1WIToqZ45cwoELFG5ZAt/5j5Fqie4hZZG1/6E+4m0leE5mSGwvDJa9j4L8K0jOiSxvZnOOqKEk=@vger.kernel.org
X-Gm-Message-State: AFuF++khqx0ZPAPdhrrHKrXbaA1HemtvdFAfL15K2jrunr/w0BY6+xUH
	b+KHDUnbwWgn6ag8j+6b1PdfE9OJOiTDq4pcMHqm77NeM+pUyL5KpnJrFI8U1y/jNJ+GXC/yNxM
	0s8nL2KIGL6vrov19ui0z8k7QwcpShk/tHYauGK7dtgHXKaAQbT/2bgkx55qL0JitMixLQuynnr
	k=
X-Gm-Gg: AYBFou1rgQP4gqzLmkeOuug4CrEegQS5AyKVM85otz4y5U4b9R4gTnrlAVZsjwAx2O9
	BkZZjpp2YYiM2l6RvAaLlwlC9r+claFczgtjsO3stMi7aB87fyjaQ9t14eu0rNzVNBXWdKx6vnt
	UoMPquvNVZ+NfwakNrydscFTZ6AlpZxOu2vqJ1rKLNipP9Ztshv9MvFKI8vP/QeiyHA5U14iAeS
	2e8T1posCYQuVwITZHPkUazQWp76+prqFSZZ36G6VKeddGfS7mhKaxFEd/iZCHQvHSwHQnYMB/m
	KB9xhPyLRILO8plxSQRA2WLTfo3sVh9Lxcf/Pc/yuMeINg1EQXAlW5LRbcAE8DK3iDJC9cCUIAc
	vexOb08rw8JsU4TqukeA=
X-Received: by 2002:a17:90b:518d:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39d9c3b6bd0mr9545453a91.25.1789144898152;
        Fri, 11 Sep 2026 09:41:38 -0700 (PDT)
X-Received: by 2002:a17:90b:518d:b0:399:221d:63c0 with SMTP id 98e67ed59e1d1-39d9c3b6bd0mr9545394a91.25.1789144897673;
        Fri, 11 Sep 2026 09:41:37 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:41 +0530
Subject: [PATCH v6 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-3-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=3930;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=6baaU7n+sEVJAj9Wn6bzcJe6h3P3q7EI74l/o02CTPM=;
 b=fX5FpuO+/mIPXRZhJcwb0ffe1TXhRyvHrj+kY6Z1ekg88CGYOz9RJ3AS5nsKFKljhhljiM61G
 BcGzDCm27ygBiu3CbGHhfSvcTxwpXSu/ZZ1z76CjKfeKcOodUT2o/RM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: xdRpk2ofYj35i8GfSjFEbIcwA6e9l9XA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX6pG89iupzkx+
 fJh/8qUFf/nsm3rAwFtHQ2P3UtHj4yZrGmhDlg8SVNbfXCUTbOaDP50Ry9OgUVdLo8FBLE/0QEy
 pD1BJ1brpaL3wu/1TDpQkSGoa4XjqU0fLJHzbUgdRQb3RQuUwoNRz2AEo5gVohUffsima5F/S03
 A2T5uDtredkVw1AqxTrIO6M4TB99+3gj0P95+3Nkwyc5Bn+tYMA6IFBEvgrnWcZZqAL4+cPiAAk
 8dyb7fleY2Hs4CTmCJ2JPL2U/o5Nh0QMA+MMrepa65vTUAZk2elErqYiadthwD+F2dJqjiomoiB
 /rlQzZ8XbAybWZyPFvoLqERg8MbB2j8jCMJo+1P6CDx4FoV5DgO2BBjgmqCMn0NHx+Ch8aRBJs7
 NuqVqx6wKnZj87N/ybTyQ/W2nLMewUxnih7fhNljEgF7Y7mW5RLb/NfUoXg9wZ0LkmxXIHTr5W7
 2SgLc0kBCSg0oVpXE4Q==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa42f42 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX0w6zZN2Bimg+
 6yveQkdqV0Bteh5oYTSbq4QWeQFkq/hMHke54BxGfSa1xLbe12rOPz6fhkqq7T8gTtIQHLX/u5B
 zHYv8MVoReNG4n/GDFd5j58G0UY0n9I=
X-Proofpoint-ORIG-GUID: xdRpk2ofYj35i8GfSjFEbIcwA6e9l9XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..c7fb71675b79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -32,6 +33,68 @@ key-volume-up {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -69,7 +132,64 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0


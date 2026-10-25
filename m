Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898260;
	b=4ZH7aedVrky/7nLpjeM/yGluSAjHAAIFGowexicC2MBenq3F9xGxxJWq8TjIwokqXZzV
	 DSpYiB8uy1YZMHGkaFTj3ueSsVgJL/+Wy4elXfhXQe+DHdP59oB3VD9CrW/cJcWC23fSJ
	 DbbkomCUH6IlNS0TaL6JBkkHrz4bMRTmkL06MuCeTVzuS3DLsbexzas6ybdGOY/3WpOv1
	 L1kskr529VzcwFzQPeT0aVVehFJZEmRDCmzal85RvtNS1Y3fRR5M3Gb5BFv2g7jcwK8vV
	 Leq900h9O8FN5Aex4HiHtsjmCIVtL81DHK1tnoDM5nTQuLXDHfSV7nhNY7fnBze420Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
	b=DqIzE+OGz6F0J7NmFR9Jp2bQUE7HqQTbmq/ca44YYUxCy2Q4rsWvBABa3JSGWsC6aY85
	 mMWaTUVfnz/qEHGyPv3aERQ4xpvHCaSrNg1bZVYK6gzMNCWbEcL9r5K6Jlam9sLP8ucvV
	 YORtDlNog4L7FxXFh+qYJRWukuOxWYZOY3Ya2koVbrhckAUhM8i0KH6VIsbxm1hs2KddN
	 vsY4RiV6ecOsi8EtOl2CXom13IVXOQf5iZh4/RlpNCl8+WeoEJlcoRwPRaho5P84Ih3pP
	 yKO8GM3OnJobtqN4GraWB2lc4taNkIolAeCYvFSPhE2IqjD0V2+hVVCekPf9FH18c4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZ46rIin;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZwPPr63;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DB606A337
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4DB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZ46rIin;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZwPPr63
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17iZW4174941
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=; b=MZ46rIinpKsUFGSw
	XR3zRNG/8G9TrlhSNh2AWVM9tsYYciP6xIPYTaxjbDhn1XC8fOCUxfRo0GScT9q0
	2QL01ndVOER9tzIiotyZ7KwZ11G+Utwoe5YSdGPpXt9Hk1lSZVXCpSTG4ZeqIHq2
	NqbIIy3Rb/T9ckHLMk1Y6g4pBM9OixmUFQRCtkIHdkNCp9gn6G9tZQK9LPDkZBAO
	0Pb3g0cdHcoZDu4f/C6GmZbXg6bgYa8eattSffKnYnFP9RBogcJVAFXjTdBLJ/kz
	3zKEWBDMoKgZsuSqYDPUkiLVdM4fGJkeyEszTuEU6r0HKopKntHkEW2OcY7OejJH
	5CBElw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so3503052eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898258; x=1793503058; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
        b=UZwPPr631RQglAE12Ye+sT7jbN9OLVFI7nyhcXel2kNTMAOOzeZ2b0EA+xoVlXfNdW
         IOzK/E93LfiKCncMy26ven7T8oMvS2+Qb/IErJpVXWoBlYovsSLdW5yBhLMbHo3P/w+D
         a+sMT00rv7tlvfE2NKakpb8djIPUBE0G2bs/9PCB8TvtRhu5hXd/4lVWTlsbeulc2HD0
         NrXoKQ9vG3/SywmhMQK1GPL2SQsp5wRd+ggF1gLoBqHLfXHZIik8vItCfmaj9yRhkLEU
         75+qOMicjhJofgiSe9Qgu77hz3XBzTvHTXRIaRTJ4ZCiBYjAQ/A2CAzMw680WDHAr2TU
         aNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898258; x=1793503058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2iZ2VHss0+GjJt1WqicxgOylCTLcpkomSb24+V8EpY=;
        b=HIaqGBwmduLmPFHfzu7RUvU+lT5Ol6nisUafWB+ySx8XNVhZP/UDWB6rPJ0a4SMztO
         Vfr/rDmwHLt+XMmy+KC8oYd3p7P60ObS86Atod+3AjtA2JmDjOqhvnphAak5ZvA0P8Pd
         ZDFb9tYrwc9+aNMRnraUq2ClI2s9n1xxXxY1c5YFYDu32JxJ4HzDSP16hnLgyt3MPSIp
         qng4MojMiWZ3tzNh8B67DoBbBh8QOsJ5BB9vmWdHjklpZWvjgpKN7KdNrfiovfQ4YtCk
         qsT9JdSmVzhgRLWceZmliur4MN5Gaj7rqbTVXnR59iTZksQ/Tqmy54+yUyAAMATE8+9B
         mIfw==
X-Forwarded-Encrypted: i=1; AKwUvBy7rRcwUEOz0teBF6/UYPaZtMAxBEU1i+qjJ+YjzymqLPlpgxxkEiLE2E51BLnx/7tCPLfFSef/aXe8WMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaAqdp7pJmm2X49U145jrieGr+UxcoPyrpKlzYhxOHOkpI9ieT
	3eWpvkNZIyh5DDN0JftqS3Q8ybOJeXZA/dqpe7PY11u0MylhGdiOvCXiV8CJhPwNCaxVGUjGB8t
	yTm7ttZVLye1Ag9wATVFJ+zOTf2/tLxOymdXtyqwrVOoaKFr+VAdZzQBTcahBuC42tQE=
X-Gm-Gg: AYBFou03S4jYwPkidNEIZJUtgV5j6R5lycLdW54X4ituxhafQ6eptelf5eke2P0HZn6
	Ii9nIu4Dg0PbgNEQ3z7alnb8UPvNdpTWEc4/kmkIQOFY0se14ID1fDPiWb3/CmzmzL5uzBZpDd2
	X7y7xmQH9RhJ3I1xtxq9kR6YbNKFgv1kUxlkuSh6JofKLjZyCDxoJptYw9l4sc87oZdGqkRPSkn
	hL49+U8vy10OzQIITsbIyeFCKCBhCkZ36teKxQ/F32vfNxtBDjnA+xxnDdaK24dC514coNLjWej
	iH6Iv1Wee9XwI81upG5rcYCa6JtAqajKO4vAZiooHCmTs+Nwbe6zghNEFrXg8oUsaTc+SCXXfRq
	kkbYDlt11Q/E34qV4a/C3+d4QIXvTTF/oz1+Al2Bo/qf4leEKVxWK5NMClKwJDwD2IW2ltoy1wO
	44aEhAJfE1yw==
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr1517234eec.2.1792898258043;
        Sat, 24 Oct 2026 20:17:38 -0700 (PDT)
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr1517202eec.2.1792898257486;
        Sat, 24 Oct 2026 20:17:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:31 -0700
Subject: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX/z362oEjkvu3
 Iu/lmczcs1CrdB/RH0FhJlArh/SJLKqVdDPOcpSUuoDbPBoLbgokJhNT7C70gd2NX+/r9+CRfd0
 +tG3zOhIVeDHhyCCwoHmpTAor+7aN94=
X-Proofpoint-GUID: ooQIqyJsqMgrYQu-cpoOq2PXcAFD01Rm
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX1Lh8GSEk566N
 iY/FNz3mzIi756mEuGwF/Wd/XSvAZFeQ1CjL4Tqb0WqSsjFhGcSjOMXyCEt+oYlvnuWFtM8kAgN
 cCzQu8NT2czkQLjbbM/l2qj5EK421oEX9PWOXnIpI/YkurlCG+eQkhRJL7av223amz5ANptKHcm
 +JFZrHZE+p+bB9Bmpx8ayVnEIjAWSQq0jbIyl0MQkFnBcSNQhPaKdHAQg5WmOZw34PFQp++7O6a
 RAMp9rBGeCLllYg9r2mLxHhEha6+9dSV0p/mjnQ0TU0NdsSs7Iv4BEKcOz1ynFPmNi79Qb+c7ZM
 hl0UbJdWcQvf7wCHALI3oN7cI8d+NyRa+IkI+k0PeCBifHwAN93Kd8v2wWyTAEmUAfcZ1qQPezi
 4u9/yoMQUZB8b2ogPoqGa7TdYUoWai1xFdCKoVDOlAzH9zqebB8bAl03Dx2yCL04tSQNGGHAqEu
 niirwxLlDilWkQJKIaQ==
X-Proofpoint-ORIG-GUID: ooQIqyJsqMgrYQu-cpoOq2PXcAFD01Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 11df1c7c6e31..86dc1400a25e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1


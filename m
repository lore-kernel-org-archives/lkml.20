Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19CD4AE8C3
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648099; cv=none; b=Pw2SJyQhK6FEPZXq5I2VU19WplQ1PTlBKW8n2GpTU8mq6n3HZRqK3K52dxk/oO+NKe+0NA9/XY7cnasAe5KhDovNvUepi9keoGtdzjJnyTo2hENitEfMyHX1QbNAtKe+92WXkANLIG6Z3uF1ZhL4qzO97d8uSHNEwwBNDJs3DyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648099; c=relaxed/simple;
	bh=O/mwPTGxb7Z5iK0S3e13ry4ne/HCup9vhqrOmsfhbQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7KfSrdtOYnRFtrEuJHkisWLbsqI7V5P83NehxY80pwEO7NFN/V+VUjcQ6MhMvXSI4h27CJSZItyqNh+WDfYx8FFIse7AtMdTsJMg0FtsYnc0e9CVV1hdI7q5aTYaWdyMpoKSHanQIpawCKPDgT+86dM4T/1IkbVFHy4Ltr5sqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6qa9ve5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kkoq2H2m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6qa9ve5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kkoq2H2m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFP1EW4138100
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=; b=b6qa9ve5YdAhkkL9
	NKC3/HoJArYK3eT3JChgz+/Ui4tp0keUU45RqUB2y6euNZIzn8b8+y0kkO6878Ny
	xBwiL19rLKMV5VNoNQdEXPTe8hBi/iGLcXfsM5klxiF4+f81p2+TQwpr0iOec+1B
	ROtgAM2/dhhq7PMTuiPN/AKZA3OQOGVvlplx1Vih0lVbyMuoFXtGHZm6/MMq8SnV
	6eHeVubuS3e6yrlCxF+1h6DdzrJDnyts58ofIZ5AV8mu5C76slzw7MGtZ1b7MC2g
	lLtVJ2zgTqSHFiPsPnTWmrylBI4QL9CvGVGCyjarz+XxLe75j2GBXYD6MKmegUQN
	vCFQEQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7ha77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1018733eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648094; x=1792252894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=Kkoq2H2mDo5PnK6mYkDF6IS//xz1IHTKZKGowcOfx5AFSDyV/AuCgB+vtsSYAPW4yN
         5/0XId/7Z0xPXTnByAaUvyv7Mg4kI/QzHZkWycCchUQfJ+FcQX5wf2p7BzIV84Dxk7p9
         M2wcYT9aM8DFL/eE5g3MUGrjlz/99dcpMjJT1QjArDQgz1Vc/gEBjriJ+MwICjPsF1uP
         M4P4vdvU/U+Ndui490iW9c17gOWYK8mpioQB2In0VlEBi49G5drrccIkWJTbEHy7P6K1
         rPn2Fzksgiw2LLKPDJ3hnfg+MMS3og0434TTopakmoJ/Pq42oUiAcKoFGwIG/Rs2Xrds
         CWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648094; x=1792252894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=MXYZPiKAjSX3qK+GJnT+tq2vpFxROzyWSQRjiZZtVrLTeM4no4U/BE8Le0kzBEzn9z
         r1sfSrNiNPQPv8ipAWnN3z87n7enr5lq+JsP1Q39lDTjfd2e82AR+qb6/0CKoq6808Da
         /kmK40bC+Fu2TUv4MWqLCfiykJZnOhpGrPjMjZPZSd87Pwxng0mx9VWl3n/h1vFNxUf7
         Rt9Z0NummG3hTFq3rG4n+fJKPNQPglnmC82CBpAWoqT0ORZEAs+OcCg1fsrcavBCJKgr
         LNMtRIM3hW0CSSGsOnv2BzT7e6ub+8oeMDQBMHDL6d73CsR8hN16tP0pF0svt6IYfjD3
         m0MA==
X-Forwarded-Encrypted: i=1; AKwUvBwJcB0CWzdyy2fAtjnXOqxVHDamJIfrIb0ktL4u6wPPZ7n1i61BI/A9R30sMpUXp9f5QI3E34fVvcBPEXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdpor+wt14Jy2/vLSN2amam/3s2BxqxQfW4QAEL6u2kzcWCRkT
	ffWA9SyQa2UUV0wWyeyfkYHKppuAU9xC6296rXH1sqGblO9IUVInxjcrlawJ/iFpGNzEcN559wD
	6ArIQ3w5OG+Cd03RdVGfB30adWlNFUuhqXxACmQnOnLRAIhVNdYz6mofvsIPSjk4rxww=
X-Gm-Gg: AYBFou11IuSVMENsvmVqTajhnRzXIoWxVovRkd2uelHY0GUrTC53esASUMUPEBOpjGs
	dTYT6zxzvzNP8e1BJIg4Qc8rgKqcgMW4mDJp09Sts+P6icyd/buT4bqsA5qneysOmkNcvLzSHN1
	vRPefbRMIQxCvEMI1TuSwm773trEmZ5SelY9GiFcnQnUek8TaS52OQR4PNrLjW+yYKoh00did44
	gW1sHrLbZfH0UZWu02qbrNHHI13aBsupiiRBi3aAr5NXDlj1hXgZhzp6wjwgKpCKKrUM/TE3nFP
	JwH1M4l+/aW6aY354J+jZBlgM4ZnCFAstbpgMY3DrwMUkdaa66j7lJQr4t9tkMKJUJ6UCcE9zbS
	GesSMhor1L0ORz/3PCZS1EtE8CCC1mefbQiwNrw5b+tzjizQrICpaeKuLZXXR7cPWLUZXD4HcxS
	UpNeSX2XtE9w==
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr6047881c88.9.1791648094028;
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr6047829c88.9.1791648093304;
        Sat, 10 Oct 2026 09:01:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:32 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:16 -0700
Subject: [PATCH v20 11/13] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-11-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: aJ0gRjj_Q8sLKlsJ4PMBiXgZpf9haYNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX+IrYIFItTWDG
 ki5+pyrOhyDoWS2z+Z06jdl91beXtnMHvjMSafVUXWGIeHv0J8+MVZg14pDRDrpD/qv4TGM6Lmu
 nhOnH43L6mcZVUpsEb5hKWDhCUMvJdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX9+rYAk7AdQSg
 4Sh2IP21DIgEFanOlCiGe/IzIHgJYdl/2PuhWVZp5E+KMQtrANOAhK2W3+jZbYD6wYdrTVRVu0U
 gc1ixfkWDwHjkBwx0y+zYRTru2Okeg6faPOorKbrUHFME/av/1oCFMkyvqWqBzxuDv16oiV5hYl
 N/UK6hC+t5Fn+WvQwVUz7dWlP0NgmPL8NshzNhdvXnuqDrDab+G1yN6aFKvlG/qbp/uoXZtbjSz
 Rc5K8nQeIE/OWZer2vkphUvEdgLBoR8b+Y5MFQMw6ZtbdMoMlW8JP1eavRBy+bdQDD5W5D45kKh
 xjm9DAAMvNc94KMpiUqJNCHc0OXlU/OAkYUIUhE5YPl1TDR2gljxG79kVIxLdsp3rCmJREQOJwW
 qJ+MJCqF0nDly+GAi1eGkloh0oBkW3qvDocxrfu8XyBdPTl5J57+yM0fGllJKxDV3NUZs2dh90Z
 79OYUAjL/DLRfCEiVOQ==
X-Proofpoint-GUID: aJ0gRjj_Q8sLKlsJ4PMBiXgZpf9haYNs
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6aca615f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

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
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fb282be07e07..62f02bff0227 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3749,6 +3749,117 @@ camss_csiphy5_in_port: port@5 {
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
@@ -4537,6 +4648,198 @@ tlmm: pinctrl@f100000 {
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


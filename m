Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200895;
	b=4AKNRnrecg/ZypK36Vj4GJAjRMCwV4/0mrZJ3TxF72viBULIXJ8wuV6UCpzIUKjZMK9Y
	 wTGRZBWLgYTBYUyLsG01/O53S6OsBB0HqJUPYOXn1b/g7l7OE0oJ7DBe/K6JoUCDGNbaC
	 sVBB29KRr5ynuceistfqQumKeSTKDJi32GYLQGoA19c27MsSXI/KKQ9+pX+tt5+0jeZcz
	 hbDw23LD07MfVjTmHU5Zx6SHcPdhg2pzZoglDr7iRPCaG6tV9LQJyW6TBtjL76oAWD6H1
	 aQ5wmPcU33h4mKxN3dDXaKxNLGI1gOqeHzqKBGUDJSGF9rlK0cR+27vwGvo9XOJMNzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
	b=K+4LC1n5BlKT+CiWFtLIIdr0fj0eP9z8yPpM6BsA8TtpC1N5Gpk2P8gLM9vchis9rOk9
	 gRMc/q3poYSGqC9DtGZWxTxSBalOJvAqEfupq29c1AN5bC0f07kKJfsB7XI4/puGj+T4N
	 lOeqYj7zd6BDVwPKSxBBH80duvuNt1wWUEx+A0oKRFfyc67BdwTE87S7aRKYC4O8Oteyu
	 EAud0Wb2j+9ukhTC4ewrO6jv9UOUoPQLorDnLzhabgQm67zqqELslFc0Li1S+vAqOYLmd
	 zEQt40+ROGAh9H3h3WWUBcxbpwIu3EbnSA0X9wlbzdpfVIHcfvL0jKX4wa9Fz0a3AYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4W73ywx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuakXJqs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5384606AB31
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5384606AB31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4W73ywx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FuakXJqs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6Q82070802
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=; b=h4W73ywxA4Q8m0U5
	Usk6b5h8PQNTEKu35aqmA2uN6VgL2B4w9WmiKNwMRqdCErb692kjYqpCclh6PIaw
	xZmryNihJQZCmqhlwVlzjC1wxDw8NezzHWMGYHGVpL4yk9XVoe98e5Ws/aq+OXsS
	1Ydlysa1C+zZmSvIzt6epqcXdkujkjmL/u7kOwcJ+Xvd5JGqaX9LLTwJaOMr5D0u
	DZ/dUfHtftHP3Thqmi62940ZP7CRdUjaxO/BabvnHxVDjFjpTXPaFpQY05+JJKe5
	5MY+cWbUHndhcrSqu6jA/nib2R/BfqlpUIBU6yiL4h8Ucv47iDn5RVxVWUnZH9zU
	WYrg4g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jvb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:33 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-679f81e0f96so1764247d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200893; x=1793805693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
        b=FuakXJqscFrsoY1Ube8ogsGMBtrSk16eGx9vSl0HR5iu3i+nbWSmkABkmSX/RNnrt3
         jHOADid+TWhGxkWgHzyD0GJ+rb1tpIf7LErIkBlk4Rhrq6gMxt9R8ZCAu8OErhllHYt2
         1C3yyk5ua5Y+l8PePDSyHKwxSaesHogfiL/5hSQp/vOSYoixQTfkFayHq/M5sBfITHys
         i4UN5Y6VHzJGqp7NI9VlWGPiDq4sjuhBToLIyF3SCezHlPOf7OMnShc4IGla6n1Pep4Z
         AFcgQBkl2gyopTsdHJ1MTZ5wNHQQdFagxEmxYGh4Ae/4BaEIbHg9N05NdruKc5IyjclL
         tRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200893; x=1793805693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJtv1elE22/fRjimfKOj8JWMX+qMHWo6gdQpzkiKlMs=;
        b=oTw4sQBx+Vp7QbYw4CC7JRWAWF3d0PgRwKvZcqi+XRaAvhJ2Qcivlo8p0hybOrzs0o
         Mn9oQk8Wq3y3n9ylF9YOReGhS0jMaZ6R2GwDXyrbk4Jy6APkcLt8fx0kvfmP2HA2Rt+8
         5KKI5g6W/aSxNNNlVLlo5vEB+F/KJPrnk+lLxxxnSuZyvUb2D7kbRouwX0VN2cOPdH/2
         cdJUeLO0Ain3SssaIm7Y3v0PrG9K2I+xpIlJIAT/VM+vUH8ArLympoBy3PtAwtJ5WZLR
         OSNeM3ytYimvQ2rgAtawfrB9Iq9VLHbkuzRo83f5/Oj4BfEuTtncfvRvCCl9buqJUdFK
         wARw==
X-Forwarded-Encrypted: i=1; AKwUvBxE7qWyjbxfKkWdS/u8h0YCBZ5crZUuQur0Medzhh/6jMwVm0ami8jKB2oGHYAqlV4Wv1PnNq6SemgvcyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7E9SEFc+zILB8B/TjoWBMmplzESn3+Q/NKQ9VaNC9wQma8v1c
	iZddceaAJGs4fTb0FzpwPc2yBzZMfaB0NsN3qvwBXBsZ3m1FHc2hPML76WnF/e8GmfKdhCQIPI0
	UwGYW5RNYzB7N+r3bio8Mer51+CCP2xEE+rdq+KT99veiwZiVMdBOM0zpz9B3a5l0UW4=
X-Gm-Gg: AYBFou0u6ELoN2kuYgh2r4ERYLt+TakcU6cfjvDmw5zJcmDHhAjCgs5xLuwKb+Hz9MQ
	TH1+dMiUchVxpFVlvoZCnMHKHWpjPxsa6ydJcQxOHgfQjiMsGevRhD9JgqCRUMRZTZKPYZwBjRk
	O8KOoG18ni0FreiHitZ51XnvLbKdam2F7Fr1l6MZ+Y5sDQq+IoNT6+pZIGVFT8fJ7cJZ5uXtttI
	7ANWp9uZ6Wz8OY+yTCvQpsAjnO7CqS6E9IMZ36OUYXen/ouI66sTln7IvfRi2wgYLznkULIpe5X
	doSMJow82weBHpkvk13Pt37UAnY1riuGGNmSiCdoPzdZpR94YYXCLzK+DfuiQDN757z6BwhvvoX
	GV1kG3OzwhlZKniG7aJ/XyOLurdaexvXA17/9sW3WKu1PsFPtJP56RCqV22layHkNXYAWBWo3Ba
	n/bKbQ3/VAosl5XcVv70ffTS/0aRL/i7IxH1aEm1aWDUhYZ306AYqwbeqenCop
X-Received: by 2002:a05:690e:43ce:b0:679:cc49:55e6 with SMTP id 956f58d0204a3-67a7bd19598mr1289965d50.80.1793200892558;
        Wed, 28 Oct 2026 08:21:32 -0700 (PDT)
X-Received: by 2002:a05:690e:43ce:b0:679:cc49:55e6 with SMTP id 956f58d0204a3-67a7bd19598mr1289910d50.80.1793200891909;
        Wed, 28 Oct 2026 08:21:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:47 -0700
Subject: [PATCH v23 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
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
Message-Id: <20261028-kaanapali-camss-v23-13-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/aeRZtNdyk4Y
 OIca/lTZXp6WNTJRPTlRnLX1mvwVqB99iggBh49rSF/3uA+ejqhZzGdssfu41bYxZq1po8Tj/06
 3DvuMNgErAKuAzOZon+LaAD+FlIqQ2E=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212fd cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Up-51LUBwyCO65F_IwIEoTheIdZAS3tc
X-Proofpoint-ORIG-GUID: Up-51LUBwyCO65F_IwIEoTheIdZAS3tc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0JDpLVOLSPWI
 rPydmIBNnxtMiikdr4NRx9bbt4xbYHoXcux6RNn92dofHaPP1TNOhK8H7jexlDGKDNrPZMz1CZK
 FK+G8m8ybspgObT+QVsaBB1kdY/YPAh7TXkaVp/g+OmTe5cyavMXFzhwRf1hGtTeyuXxfdqMA1V
 P2kSKiZg8NiUghOOPgJv4tXdzqKptIaK2Enkp6jOGpnrEcT8HP86JpliJkmqXJgjHpJcl/2v2l5
 Yzkn6An2VJhD5ZdEaSVZUIYhiC8bY6z+MXI7JRT2RaCJibLL2j7ekD0cjwOMrVn29rZ1UxidFQa
 aQyncNgAOhxc43rPsUP3nXWgTK8n/22RSpXc7dRdQyVovT8OyuSSc3WXNSrdiiXPk2Gsz99eO9z
 +Vo0ncpDzPyrqfgL/P1X5CGiuoPYnH2VJGBbwvmY267kaD4uOhHR+J7npnWQc4vCNbj9NmROXLi
 yfuFzXLpf7ViiZJtekw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

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
index 0c8fd7da55b7..bf3922f0ffb3 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3748,6 +3748,117 @@ camss_csiphy5_in_port: port@5 {
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
@@ -4536,6 +4647,198 @@ tlmm: pinctrl@f100000 {
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "gpio";
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
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "gpio";
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616164;
	b=GP+GoHooPyioTLrbKBmLEqLJN+Y7gCAECosWZaTa4yiHK+R75rBOdyU2l4v+Co4dHTg6
	 8aHTrUUT3NvNWe0RXY1943ycw84IMHX3S1OuGzFdYWtLTS+e4pYrXY/FNLra2M+VrP2MF
	 5VIHNVB/1ppBgYBu99zzRKmkVHpLqd+++uBKXPIDDPcWgiPUbbIllzjEqxpWFHFlEuyx0
	 GDhrLVi8dkhfV/epAC1l3Mf4UFWuSrX7dzr3WMPS1qUQpaR5yCzPuRtA2/N3TGTLa4uCz
	 UzrXKobIEAQKEJaGlBxAEPCfB5ESqeAA2yglUTdv1bk2jdDtZtjOQQ0rSH8RYFTJ4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
	b=P22B1YslcLZk34oJT2QzkprnV6kGCmnT2gvLs+0oXOd/GDFN2kWazCkRS1UnsBwt+Qnv
	 Hy32zpWqy3rFFRCS5zIWWD60Rol21Auoo62kWJzCzbtXKDRCh7iFPWcC99dv+86mNkZBG
	 Is2oCC5HTpav0Bp02WSua+ZKgGqTz22bg8AoZVYEHF9MEIaSIIPU+SX8fplzcODUYmIW5
	 dpflZD+zcPAR5fCU8N/qijuXmGGDquR3oEqDWPaDQzyCprj9qDqgaChcZ3B6ISdTSn8Si
	 /TQK/aTyTv/ShX09EPwoTsEVAtVaQ24dAdbi3aYBMDfQzlYwLvSWjBqVdhlGM9b6Kww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkcWeQxp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="au+/5G3Y";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B07606F74D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B07606F74D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bkcWeQxp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=au+/5G3Y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMYd1821203
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=; b=bkcWeQxpavIVYt/1
	BmrxQgV9R3XBmoC57Q+MwLsxfbdX+Enc2j5u2pZ27vvgH+OMvDbSUGujK8K/MV/L
	x7Oe/v9qkfzXPl8kCSphjN+mql0p2o5u16FJfRyMhCFt9gNeRc0AxRP6uqdRFniw
	WWB3UKKxt9pYbYHm1WZ7HnyVR7Lavk0FgnasFxvQIiNEsX7zsr9WRsgAWcYb+eFq
	UTNqcaSuC8CYybKoc+IwEP80rH5cqx4ZKcGy1avy/ayCxtti9NnN50DBiKWRcZWh
	7PHvATlwkbv0N1VUM3rXr+LywmHePonOLPtqj3llNjJ3gNYtZ0maYEJdzEfkANwD
	2C5qRg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:42 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-85d630e451aso1045527a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616162; x=1794220962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
        b=au+/5G3Y4lZT4d9R0ilZzretkA9JIPoyl0yLUuf8aHCJf59xlTcn+SLEzEvMmRL0tX
         Ke5HJc5dDT4VOOrS4OcRYuO3ghmeM9lT8hKzKyCVzP6Kl36HhjqB8IMyZmckpl9mx7d+
         x4b+0qkAPshsFmkHlf3kXBsPeVsE1l15QZOSoMWq71TtoDzYDEH9+MPJvL9EaaUshsuq
         sUINK303Pb+jxxso34PRRBR1l4+HWhvofu7UsmuMomayBhjdZadZdBL2JCoRx1EPGACm
         +Q8ztaebFaRyoYwuen6b1UyKLAV1MA2xeMY2Qn7VsbeUxrjjvK5+S6+CHaZtDMKN0Ggr
         We1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616162; x=1794220962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTz1OgoZUkpdSCjZoxvn9PqauEJX7ebBIB6VyhSxGwM=;
        b=rGR2MAP7+e5u28Jtq6s+K7lms2eGk9RHHFnEEhDj9PBHnMRH2TclYcsz+xQS69jwh6
         xhlEK9VHmRRmX8AeuUTyOy4cThIOFgG+MBT+UyC/HoOXmRLs/LEwEtyw0ebx6yE8rSB7
         iKGKdMORnhyMorU1aE0rGJdUMZnOZ9zNKcAeKjKAm93TC6pd5s4E2/L6N90bH0edueq5
         kQ7vlYZVBFcylrYkfLvQKYmwaapQM+w3enJr5TzTk400E6Rt6LhEx30sk3ZVJB+HL8tM
         tNLUb4Qk54ojsDsJ4gc5dhraShybhYDk1RHe2OaFdZb22wYldh6QbfLHzmJeGcc8deuO
         KWBA==
X-Forwarded-Encrypted: i=1; AKwUvBzWTrBzdpkhx6dacPsGTUvEbnK7D9mQH08eQKdi31vztkSlYJSZCsDc4YJsTnxden5BjO/ia+ZO3fk5Vl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Jby8X3Pbz2PACcwz1vkOcj7bpBbgE98nmQA04AHvrlLyw+rW
	wYmiMnt4Ns7AYIoX4sMAGSkLStNavYYzVruPl2j6qxLBmEi+lGE0Vvc39hW5VGpIdYSrF4fWAPv
	DLR/gRHEAGmc5CH17GE03zFf4ZFwug8aZnJjI+RVSaRRYvFOrJ6u61C1rVVIbB2rC0JM=
X-Gm-Gg: AYBFou0zRM1ZbFo4Mb3lw/FAXvQLK8TigkDhKVPsKdhxm97zSw+/ZExRuSjRYYpzqPj
	6U1xacvAJrFJsf6emzbbzTD5bIShVddaMVly03Q1xinGL9ZDEV94zUTR+GdxhAwTQpH4D+Ud0wR
	E36viwRn3/nOP02B+ZOCBjm/Du287kaGGoJNDUCk2sXG61twttDjGL42YERukP14FJXcfN29eVm
	6B0MJwEV0ccoVadhn5CiROcFFjdqGK+Tw68kBA2l93NttY7+Itt6YsBsJuwI1GYoNo9dT1hzr4k
	EIKFeo5YSVe+OpgLB2t0YxrSjibTP9JYTqT3sNWC7NxFPgUTVkj6PfalyA9DPKKWRzmUhsQw2SA
	TKBAHskVYYQs7JMsNa7nnY47059XHobZ457qtBzT+QHt77HA7cURVqAXA4ifNB6GNoCjIQBW+ZR
	5RvhZEPSHTn5+UF/hpEavoa/gylbWD2EJaef+QcmCE/OmVHCJ5M6WzGu5J9Fw=
X-Received: by 2002:a05:6808:1244:b0:4d5:27da:a492 with SMTP id 5614622812f47-5640de8d66emr6700478b6e.44.1793616162034;
        Mon, 02 Nov 2026 02:42:42 -0800 (PST)
X-Received: by 2002:a05:6808:1244:b0:4d5:27da:a492 with SMTP id 5614622812f47-5640de8d66emr6700450b6e.44.1793616161539;
        Mon, 02 Nov 2026 02:42:41 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:40 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:21 -0800
Subject: [PATCH v24 13/15] arm64: dts: qcom: kaanapali: Add CCI controller
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
Message-Id: <20261102-kaanapali-camss-v24-13-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: xW73lnkN-zkQdTpSAFrZ5sXPrfLX0Hty
X-Proofpoint-GUID: xW73lnkN-zkQdTpSAFrZ5sXPrfLX0Hty
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX3QygB+ZvGoik
 7oaargWqZN6222FFBVCj7LRkGl8RfG2zQGlXJutfS7WiYYncI1L2N+Q8BBwd3TOvjnNxGx6Ye+G
 F7w3OC/JpgvPgOSgRL9F67n3WH/K/gY=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86922 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=09nyjJ-fxQ_OzqxZyrIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX1dPZlQ7xa/cV
 2ntMJHg5DnUYttKsya4Eje2xBJJ/UWOuFfe8fl59LNlORgyk9Mak33UN8c/aSGIL3Cet7e+vI3I
 2Q8m+LakcIFf6Oqa0cogYvdthW0xZet8Nfnb2nyb8Bc5U/95w0ZDLNOBM2Y39TJmW2Sybo0Sikj
 01brLXoZwx21IcGuNF4UZb0GC6SmxhFsIL+NQrb0bUYzY64AyWJ99Ydz8TBUMJy6tsURzFgJkCs
 pjVbS9kWs4s0r0P73WcRUdzBJ20Z+Bjv/EGGpTak+03sN0UiTzGgXbQpMDgjTwL+IIKVwNpROd5
 CouRwhYhLZ0HJx5gPlf8PMUpBf/wdx78QCxd1X+ntTFOQ2Qg6E5qNrtQLsAqLmNTNXPCiordy9W
 vAUYMhtk0YSzHyyXmxmLsyqSu0+ZWblmzqvMzasQnAkAUAE2KDa2FCluVxQfhx2uFynrX6e8uz2
 JkPeJZnTTz5bDxVTF/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e107bcdf0f8e..fbd65c2ad95e 100644
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


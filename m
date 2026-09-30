Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC574DEC31
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772386; cv=none; b=FlOIoAeS/23egFMIOPxkDk7ARo6elcYbGSQnQY/Tby97VrZYD+IhVjXVM7ZwM4v0juE+92c+7+qe/djPOne2wASvcVsM4LQlNydRffJTzpUQEsFurRgSVVUytc73GQnDtnX3WiMnN4Yl1D1zxx66fLNCPYu3pFDYF+JP3PRlS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772386; c=relaxed/simple;
	bh=OwMBGkTxxlftGqHQVuri7f3NF/sPSqI09SGbY6RgGfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9nvnmbN9JwuMVtJHWCEzVSrUzu8xkZBf7WxhcNRZ1UeblSjzU7ANGGJLbOVcfUlO1B032gOuhKQFf/lzvdKYLIsvD0bzuyYaFmwsEAt11eqlGI42HSd6DQR3ymUIAREef7fgYlIMxCDeEZL+GsBvXCQ0nzIE4YmVQJ3zPZQrkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joz0ImjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQky3bxZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joz0ImjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQky3bxZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8VlQ2898775
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qBqs1D8z+Wk
	6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=; b=joz0ImjPNgBDHv3i+ikrV9sDiGV
	l8UoCX+y7I/7+sgxut9htzHJBEB5/PZTOYmGnkBKFK5JVkwR/JW9cLznqdNcZ4ha
	t4VBdzrGzuZJJ6P2Qk6ZuSkAwkWT0JFjelE5dlf00QaXYQdNxHW2YPEeqzq0WxG3
	neEbPZs9txWH+f/ATlGiYSdL3PM+cHvnNtq/D+UA49RM4mlxZElJfc1IeOf70rbf
	Ix4H9uwBzwD64gKh8xABuhWvbDiWsSABfx0DZr5VFemgQ5MCHPja4FPRuawzQ6lB
	ynG54yV95w35YcjXiM7hFZjoujd3plqCHZDZfKk3WLm/FvsRSNaTjRSN0Vg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn298t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:46:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988d151cc65so53577241.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772381; x=1791377181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBqs1D8z+Wk6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=;
        b=HQky3bxZPjKba33axauaW1B6EpdAP2x+b6qQAqXR2SprA3Nd6IJxIXoTx16CBQ3Og+
         ELzj3S/za9NFbzWBWGtQ3mNWfyhaEoYtNaM4LM9L2eX1gCjUKCIjsUsnO0rMhdiJ5LFH
         FrAoaLyfgMKrrh1+dRnpGTcOq01jkwNStNkeHmSXPpAYo0QVNhdtx+4QoV+hTczdCX+i
         ATCKuR5oGcQmJlwEokvMDMfGiSJJHgjAXQdIfiFf35mNtvC4IxohkFEq/d3mQLsTXhPQ
         bPlizQMK2qh/5UmN0D+CCzt2xIKbIjAKBF4FadTZ3HIhqrd0wFRx2YwcfE+esrlAshSx
         vIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772381; x=1791377181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBqs1D8z+Wk6OWkMG5Qznts6XkPc/8tHacXB38mTqzY=;
        b=HB1Hogce5ntyuSd1qUTaf8d9YT9gJIS411xlTuLCNCxp9rlf/dTb1X/yEoFtAFhAbd
         ie9Jg8OWPxjUZDBeeBtiiHD/w7xBF5krsf0vEP0IpZwxLsg8qyuETlOm7AXvbAG4QcXf
         rZBcJjmOxAHWIVDWxlXXR9O6rbl8Ufy/vhDkHNvngaf8Hf73ptUWCJTJBnbNZwB1FFLL
         qLFCNeOIJzSs37D5D2IIpcr8DftPrVRD6lonDBc2HkVSAEo99r8TGuRLOJbvLvdx1KYf
         RCtgeqPdtlH2mZQ2+rhZ+nGLnNB6aj/urQxG1yWB5gzm9ojtX63rz7RBYFl7S8LCG7cW
         adEg==
X-Forwarded-Encrypted: i=1; AKwUvBxc32Tx/hm0hNPt1sz7G/xuNTjc5p6EXvysf4VUwz9NO15G3uCiVZNWDQeoVYgc0LdWX63VLWLJM63p3wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl4G3Xku/HnqENYcRWFJEPfvk5Oe/B4vlV22iTmTx0374AIpQz
	SnSQBzQzHHGrTP+5x3pGXRuXfZLsMP9rjT9VyZbJP6dD0HJZ//pmnmeYrLjDEvPSn6+AT9nUUIo
	uPQBEBYhAR8kL6D6CZhq7VXk/6iaccTbTJ/kELDkpIANoh+7Mpl4UfVqHOKpxFogREec=
X-Gm-Gg: AYBFou312jmzOOAzfzYznhWZtF9ni9GxMnni3pL/lWAA+xivTIe7sMV9t5+m/0qzREj
	uUPany8Pt/TEPF87New/LkE7zB2Xxj7h/FAjWeS6rM1U1iExpWuNsuUJKXg8SESTRJbuGVCWOqk
	KbCWFJWBxKFjxrvd3QzByv8CYsGl2PTqz9MehRBprwsjBzswOJ0FXKI5DaRN/z0WrDp56myLwjz
	4ZEzXWbJ6ofKxXJOv4cBBw6P3QqeOWRD+IK7yNOnpakN46+81PsyjgCb4VmvbAf5fGJFmFGxheN
	rwwK0WNw4JxnbFe5Zhisyy4H0tsLnT7N2ZwUieRKbX904kiNUsDJNvMqtUy/rwm1drUwXbnvdHj
	1QoJ42ebY4H7O
X-Received: by 2002:a05:6102:390d:b0:7ba:4342:f314 with SMTP id ada2fe7eead31-7be733a1367mr223774137.25.1790772381161;
        Wed, 30 Sep 2026 05:46:21 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:7ba:4342:f314 with SMTP id ada2fe7eead31-7be733a1367mr223751137.25.1790772380570;
        Wed, 30 Sep 2026 05:46:20 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e7a46sm32549195e9.0.2026.09.30.05.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:46:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] arm64: dts: qcom: agatti: add LPASS devices
Date: Wed, 30 Sep 2026 13:46:04 +0100
Message-ID: <20260930124607.1109167-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd049e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=OKQivFIISjCID7q7bPgA:9 a=o1xkdb1NAhiiM49bd1HK:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MeDZCFUk7JCxHuBY181MAb2HvSVz0yKs
X-Proofpoint-GUID: MeDZCFUk7JCxHuBY181MAb2HvSVz0yKs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX78JbE4QAitZL
 1OAo+gXpWqPo2DXt64vB7+a2EjKoxF29Cf+2yGsKL2SPBv/qH7Syr4QlzF8V3Y5Y+pt3yWeFMGf
 pSYWnGqIJ/ZNX7j5C7QPLsODOEutA7jSaXPf+moqaTZkSvcLS0r7aC8TZ/qvsSB22KvfcRgydcC
 ghkwQ5Sh7h2uxpQv3I1HktzQh8RzCl2mK0uhAxao2ALHz95GdNuUWyJlObolEq9bRP4jWv0JZYj
 d6lMGDor2/dSoX0Y1iJ0F3Ef2yqK09mn0KRtOuRjCJyaiqvnhdmj7NUXsilMMGCuq1l+1xri2CD
 0UMFFEx7gvTQ8RUj3PpIIDFK4MyQtrbPOzTvMb7utNL9nV1fWi5E2buZokkvHb4QJsZW//EZIuv
 U+WKN7q7QZdydIKgw4snghJOJmT+QBkymHpKolnAh+s31pQ0r8ukU6zuZDsT72p4EITx4wgc1ty
 huMd8CjD5EEtFyay6hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX5KD1dee3yiVx
 0t0cd32HXSIyA6CgYyHAtNbOPX/visEgnNOf6YAPbY5XE1MuLxHaSVlsKi7DuH5c9PrQWwFYyCs
 /0gGRpKO+4wf7KvWtnVXmh1Muz+QpeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050

From: Alexey Klimov <alexey.klimov@linaro.org>

The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
controllers are required to support audio playback and
audio capture on sm6115 and its derivatives.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 157 +++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbfd2861..c208649c92ab 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -778,6 +778,42 @@ data-pins {
 					drive-strength = <8>;
 				};
 			};
+
+			lpass_tx_swr_active: lpass-tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
+
+			lpass_rx_swr_active: lpass-rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <10>;
+					slew-rate = <3>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -2246,6 +2282,127 @@ glink-edge {
 			};
 		};
 
+		rxmacro: codec@a600000 {
+			compatible = "qcom,sm6115-lpass-rx-macro";
+			reg = <0x0 0xa600000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@a610000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a610000 0x0 0x10000>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&rxmacro>;
+			clock-names = "iface";
+
+			resets = <&lpass_audiocc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "RX";
+			qcom,din-ports = <0>;
+			qcom,dout-ports = <5>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		txmacro: codec@a620000 {
+			compatible = "qcom,sm6115-lpass-tx-macro";
+			reg = <0x0 0x0a620000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&vamacro>;
+			clock-names = "mclk",
+				      "npl",
+				      "dcodec",
+				      "fsgen";
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_audiocc: clock-controller@a6a9000 {
+			compatible = "qcom,sm6115-lpassaudiocc";
+			reg = <0x0 0x0a6a9000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		vamacro: codec@a730000 {
+			compatible = "qcom,sm6115-lpass-va-macro";
+			reg = <0x0 0x0a730000 0x0 0x1000>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "dcodec",
+				      "npl";
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@a740000 {
+			compatible = "qcom,soundwire-v1.6.0";
+			reg = <0x0 0x0a740000 0x0 0x10000>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&txmacro>;
+			clock-names = "iface";
+
+			resets = <&lpasscc 0>;
+			reset-names = "swr_audio_cgcr";
+
+			label = "VA_TX";
+			qcom,din-ports = <3>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
+
+			#sound-dai-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
+		lpasscc: clock-controller@a7e0000 {
+			compatible = "qcom,sm6115-lpasscc";
+			reg = <0x0 0x0a7e0000 0x0 0x12000>;
+			#reset-cells = <1>;
+		};
+
 		remoteproc_adsp: remoteproc@ab00000 {
 			compatible = "qcom,qcm2290-adsp-pas", "qcom,sm6115-adsp-pas";
 			reg = <0x0 0x0ab00000 0x0 0x100>;
-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619955D86F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115125; cv=none; b=Gik5kaMBKlPGPvv+2TSgmQUsQ9c99LYmViN9deexrnY4Oq4tqk0C94O7IVdW6tF1SJCLPJvKa18UEstj9tHbduCpkAPl6LtNw3viCZG2575ncBJmTKbog98KNw+1CT2r/iVDv9DLjfzERzLYXVW5pYPdJ0LUrS/6E9aAZBv6wX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115125; c=relaxed/simple;
	bh=G20bLRtZKjZD2gjlpedYLN1aTkmMG76Xtt8Gm5aTPNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgfOKp7POBsqmvyzPT40Q7+2oqG0Gy3ivl8eiCUf1qg8INIudF3LhUZcspnBNSUPJ8ZqF5F8GrvfSulk/faNJmIMqeqvSEdRGsZ/rp1XgYH0hF/M8BEjsS94H5qenuWaTFbuTWCeEn4X3wDHhN74/ezNfWzcKUxepKB3bFNrQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr0Fjgb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt2fCxDo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr0Fjgb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt2fCxDo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7QRx900426
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DxeEMBKh6Jf
	FzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=; b=hr0Fjgb+O4Q/UYbgYBAQmfiokt9
	JAKe3ABDbWwobsWxbI3keaqT3w3Nd7oY9WkrEIAwsRH7q9fORGgWZ4rrdIaGDLFb
	44DNfoqCUVy+GsJc+Dv35q0tyP2NPCUcAL7jX+rkmI9h2xe5MDf+CFMER/6d+N5f
	Hx1pGncKFZsf/iL93xO6EkEvQ1rr0r/TuiWsqEPxf8R6zmOzbK3Jp7FghVviV4lV
	kHq2L1dHlZChx8yK1ON9bYjdju/mmOcade2Mzs8gD8+0/e1DL/Oh4e2eq/Co5Zo/
	DqAoyDya/JXMyXxGJbNrCtZ8Dx4jEzUHi5OMozS0QaRNkZ8XmdTB/8SHssw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyv1wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:11:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7ac2663eba2so241791137.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115111; x=1790719911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=Wt2fCxDo+CXoOSgijkd0tw+E/SDwdfz2JGZHRUDbjLzKRyYdl4BTcNF2VdwCMViQCf
         FJSQlQgLPS+BCfqTDx/x9kiYpBLarx4pL71ud/87kC4oIJUaee9lHPNMUq6YCgoPVDjV
         aNpDa8YrtmX3IIwAp6AH0WLD08mvh2kHuQjWKooDY+p0gHjjf6hye9jdfsiSOPyqCge4
         g3SMzA+htYK5AzsWZIAS/3lNFw3YnXVY+yDtuU1TpAZjHeV0I1k8P0RaqdFWAd/HmML/
         jggSXXqpZFqR2k2D7dPWGChcwymp6o9tcP6vTFm3b5XB+4SPbD2YdYhhrx84idhj6qfR
         EJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115111; x=1790719911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=JsYVbuOx2LMxz3slDkWumZVvf3xBGfOk78MQJfI41VspxrlYSwh+0PswhzLbKZYvQJ
         5b57OE2A2d4EASvYRwayShFDJcbnw5poO+TcEQ+Fnwtof/2KxK6ijZrVl8AvmKqvstqS
         Pp/1ry9ttLi0dTJnfJ+M19TL7Bz1QduGJl32OZ0sSBWEsKRiRV6fTWDjrCTdsnvp3RQJ
         3bd0Qh7kolezvN55qzLZ9/lxYFXSsf0eBIsJJbeEyLP6Y/aEF3FLFTG5uOIxsu2d4G9E
         Rkh/r9JCGP34Ya/hMlo+/KRDLr3bDDk08F4lHaNGR9A0bT7elW8ISMYcTNhBpb8Oc8u8
         7rsg==
X-Forwarded-Encrypted: i=1; AKwUvBwnn8scTbfAt4xdPFV+TmMU+snP8EWbB25BJzuYMY8n6pVFM99Cgc+iEh5Gydpvquw2A5iEjo0mFxSnn10=@vger.kernel.org
X-Gm-Message-State: AFuF++l3zcOqJ5wBPMyXKs7lFjDdEtcNeFnXpmXdu9Q7cewX42teV9BA
	h1Th+d+/7hd1iO8vDYiuzJNEoWqWqb5uwAxxsvSOITTnyMA1c4hQxo10tBFiPfgQzZY2znH/ita
	j8L6Jdp2pKTRhjm/g6WF865TbmDRnQpnfRvGqegpBk+EgYRxP2vTSF4sZn8jrr7LYE2k=
X-Gm-Gg: AYBFou1Ja1wmshNDCsRyLRQNyqTg1qTKjTMVqxGYxxoxrwt2IxnPg+Keo9LkW2YdSDg
	5FoKysIKMz30Zg6Y2k4MgBtg/lsiGRX3b0X8/quKFdcryGRJWyRBoOv2zqPvyyg6Ym5wNWJ0ITV
	9KygEiJMJSK98ogmdurul8ZkQD/oUkYg6Bz/LLmLb8yZNWpJ3Ge+3442kqgdssCWxg7ns1LlkkX
	2Z6muh9oRt4s9TJYWBkL94orHJfXQPbAmQh7SN4BgBgBtPt+xHuJGOXc3sYjary36OkH3S0D05M
	TwptX8RN2WdDxW0AQM6v3N6Wqj/wz3Z/iHykhJ2eA7EQJE947E0TYIQkz30nXBEQigTxVbEhLOV
	1y5u8XAZ50oKyL0pUn4wcn3PSUnpTZ6EexW5m2aRI3KlXF47awxwGm5TP3ceKVE4gZeUAIoY5d5
	s=
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967141137.15.1790115111543;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967121137.15.1790115111130;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
Date: Tue, 22 Sep 2026 23:11:26 +0100
Message-ID: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wBSUGOVQA_S9Urx-vUGFoBDdURptTjo1
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2fd28 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mtT030_wRxJr2dZJK4YA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX9Go5ATcg7cfp
 iWcEMq+5YhzFIgRtIaaaUcbgkZAwKh3w4YjpVRrKyrr/4Ncr1/3jRBV9P3mA9ic6A/sbdspgUMc
 YHSKKDRyxbBMXjq2DXKtenjpNrp/l9gM9jcJRcmJPICtd3TjeVEWsUYISPI1N6P+q6EDe/YZwMb
 0GoknSHwd/tAT1KyqoIvEULSo5PCMQe4kPlCielNvZ9rM/Tu7o76YxetnwpTulKLMVZvrP65OIt
 BtNw9Gw6uTGk0ZbahR8nUzHMfyiptXTOIThXWp24feJ0KBdOgeZWmzEMScYh/xM5UHtn5DvjDzD
 RJHnpCMd9lcwg/ArE+suS3T8tAKiGH1CRtkSTLzPRzsqbeBxq/8gHlaHQ7Q5dFDbUKMS8KK3P7F
 +2iy7hcyHXWVTGWPRzt+ncKmjTU/jtvd5mRS2muIsEdgkzd5a8tQdcZhq30YIAg6XtHTQeMeA3K
 VciCbi0nJXw04A1HFCA==
X-Proofpoint-ORIG-GUID: wBSUGOVQA_S9Urx-vUGFoBDdURptTjo1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXzAdlkLasXPWE
 ZfXA+H51CjSLlwtqsljbZ481uPQIBM66UtdZhDvowqY+M5Q5Nkhuu1p6k3M6V0D7MQw7En4+xZP
 oOM3TD6JHM83s9kWoSRiPKFSglHExpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..85da78aec578 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -81,6 +81,13 @@ pm4125_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmic@1 {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..e99d2a56dc28 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -110,6 +110,102 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		ear-playback-dai-link {
+			link-name = "Ear Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "Line Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -421,6 +517,44 @@ mcu@0 {
 	};
 };
 
+&pmic4125_codec {
+	vdd-io-supply = <&pm4125_l15>;
+	vdd-cp-supply = <&pm4125_s4>;
+	vdd-pa-vpos-supply = <&pm4125_s4>;
+	vdd-mic-bias-supply = <&pm4125_l22>;
+
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	qcom,rx-device = <&pm4125_rx>;
+	qcom,tx-device = <&pm4125_tx>;
+
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
-- 
2.53.0


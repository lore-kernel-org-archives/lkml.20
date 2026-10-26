Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015108;
	b=ALsfEQd+d7umYvjeM4wvqhIveOLuqoY3pUOl1DxnRQfLYp6PSWkBRv0dxyCaK82zZ2R8
	 ghHVynUTYzXvamK+NFwRzdTN24qWV8MgL8EqzvDXgBpSk4HN9qmhtGzkrYxL4v3Kyxwsq
	 bs2H8UtldI6hDPjWLca7cWMeWxpzcRgzu1fQdeXfxIJq8aKQ7pMfzaAS9fPWp9yBMtqUx
	 fH6VBFc/2y1YGW7OwoCuCCtoIpuMaSaG3F1it4w+m6Hh8KZt9GNUipe1PHyIr78Os7cKx
	 iO6gwTT8WHsWL8yHRguzfs79kgWAKU/ru46MkHjtN0K5C2dzlPDfrs+RRsMmYCMoL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
	b=L+aLUSrD/iJd7C410EhV8LGj6K1qi8+pV7Zb85vzP4yXUhTglB8A3mz0vj9l9kjJnM1A
	 MOiEnlkr7Qm/NpJDsKiBmn1Kfxhe8oOdGuF1uB3LqC6MW8wPSzdCa/EgoyCS2GWU8SMnw
	 cEvxqdCoj80kFhg7Pr87QtgEr4Hi68yXLXrZ+EnJRicije/K3e7FFf7XJJjy+uX18A3or
	 EdrwGNTSEBQcZckabX6hTs3XhGDT/4Nggk0fVPQSJZIzmdF9V2TL/nBignzdcDiexCW6H
	 dpmBWiyuv9bU8i24k3tHs/j4WVPVfDpiSexhTlpoqZz9BPuH9tq9VICutaHSgph+mOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ffu8xkRC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9tX4orL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C36606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C36606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ffu8xkRC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D9tX4orL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt96D3049902
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=; b=ffu8xkRCR8fZmSmL
	UEMxknPi6s0SfOEuGEahypjDtCJbwRrSMD2dyNT62r9rBgqKDyIgAqRB/2tMwmM9
	Uq0jjudALcvRoKdxGJ3JqqTvFuBvy9gQlRrsONCBZKdLSv4gkTggnhGHcPOC7sEW
	PYGwz7Eq0xEK35m14leydi7GRDPtCKyusdRlJaCjugZBnMAxwptLpDwItmWk2ihO
	zSng8/5/dOFHNjPYke6tnqskc+taasd4vHdxKyDLYuO1I610j0AFQIvgOHq7tHhi
	r8YBzFx9HgYWlHt/zLYGa02lIeBalSfFx1eybOv7Gk+YI3ecOq6AYZ7rEVftZKly
	jhv1zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9xkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so2706011a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015106; x=1793619906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
        b=D9tX4orLQ6dUqxelGR8XajLopXvhwOvmhUyxSsyOIN3hwVGfhfM35/3H5iPW5FvOdx
         S3NoCADILQkP0kGj8wz6glLSB2uqmUC+4vT5JTHT3vaw/3C2GOUq5ZVP/QEa7jLS/H0l
         Ivy4zlf48uR/40LmkMPp1bM129nywkzf6x7k8+mmObt5anE5pkUYnrIOnf276gpt0l+o
         5CSMkTP/BmCgZHtckzy/2jpcNkFiaXkHFJqtwUdOplM4Xhcql9iF/E/YmhcX3UJMGqAm
         l/WmNSHeee75w5NTa+CsLKSapwf8LyL+bjCLifA+1DeZDF2wJOQImeQEPqtS2w2V3jMS
         3R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015106; x=1793619906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfiKO06vrqubT+CyiedbfXyOg0YYreCBylEO4pxLPCU=;
        b=OzVCBcsJxaTAVSqIk6DUqyoTSJTzE4FIKhWCVoaTRlN2QlJikSvJZPk+vvl/tcRGWS
         Q7RitkDf+RvVoQrmuoPkHJPynmb6MkjkqWun0Jzi3s5yncHcJWWjsCH7Xnh/V6mgQugn
         T8SiKEwYczLWzEe11Paw8cPx+M+/xF4dNpuz4Jc4QCobH8yxQNX3rzJ+e0RjDQON1rxd
         s9mQ8eyhn8EAX7+3PkWq1RlHjH8X7o2CjiidJfwaQYDf0AYZhIajl2C4n9gqrGC44UA8
         zMpSuKp1zeO8nei1Ke5O0Xuu3ZHk0tTQia+K8DYzUhY1BAH+pmqcFytDIHqdv99vM+4S
         nVRw==
X-Forwarded-Encrypted: i=1; AKwUvBzzA3KvAMIsWURKwwAJW5me4+KaJxWo2ZK1tawzi+GwizcQ/XKOZezxXo3nxlSgvRYd0juHy5Qoe0fcPhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuRhwbuUJtXiWXmBMMDjqDwi+gir68rtA0Lxq3sHRNGN9FJJA6
	3EZO1of/XJvr2leRZ8Vrndi9GFAQqUuqoJbR3RgXVKHZkHy1Zz/vrUUOuLXEtVKrLJCLkUE5DtX
	MRo4DqXvlmQGRt4oAv7QigoN55250uuafeAc2L5YiqcIKEarc4mu3oFOuLsHMrmAwqYhYlWmjOU
	g=
X-Gm-Gg: AYBFou2520xg2zsX6cNumzQEnio8eXbpYrKkmwtYdks4WjD1bfUuHlWnkq5Bwp4lPRS
	vNoGRT/7jh2vO+PYjhZ0dv5eK6OpJPP5LQOjAwGKPERTn0q3oE3aeiVeSgZlr94EZ6PwrCPPsIH
	kpRAp2fKe2s4Gx6GBo6LHpUVIE0n/OUa4YvkWhFqX9vJtumOboRMe34ZP82wt+8Y/JWs1UsuB/O
	5cHN2/tUI1Xn/tj38LAuCDPFHI3lWC/kA0+36dbd7v3sr8G9Ym00DOCS+MeZ/gYgOJQUrW656KN
	LSehPUrcbM0mVxP5N2ZKD5Wl2Sprm3mZyl7lIL4qY40JlXBU9ywnB8BWTghosE+S6jYA4ZV2E4l
	LzN5X9Hc/S9GYr4H9rj3WYw9OOk/bVaiK8nQ=
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr5235003a91.40.1793015105542;
        Mon, 26 Oct 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr5234983a91.40.1793015104988;
        Mon, 26 Oct 2026 04:45:04 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:04 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:32 +0530
Subject: [PATCH v4 v4 4/7] arm64: dts: qcom: shikra-cqm-evk: Enable sound
 card support
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-4-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=6005;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=pdIT7mbMET0kRvvCrvlYLy7MemTZyL15JS7gsT1Qy9E=;
 b=qJE3txgNTWsNx1kqBImlbuVWeBRt6alHN1GSUKNlAShRXl/nyeh2+Bb77X9x0SKHiRsEPLJks
 54V9/hqOTd+CVQiV7GWXHVZyW4frZwHtHQJV26+Cfrr0IByXdHQzq1g
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: T9_2olUo_uNz7YkCYwMrF1W5Ajqk77cz
X-Proofpoint-GUID: T9_2olUo_uNz7YkCYwMrF1W5Ajqk77cz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX00Luye7wChr9
 Q5oDSleRfIaTFlLOc9DByzAVaq9ZDQfltuSGasUUr4KKCtI5D8hn41yghhw5HSyR6b/ZeIqfSGi
 JCegMxXCHnRqwCHu3IJv9JcMLkxe38qbTHFdmwv9SyOREc/UDVuDpljSmQIXni0VlwS2HiYLNVP
 hkwK2Tk1DTroMIw7gDVOXZH0R7X2zX3eJvqDd++eNvFnTrE+jkcyUdXefZ5jquGa9lhKeAB4pXv
 HE4JEvecE9FSEmvWc99NUdAV/Ji3YxANEmrByg3pTR0r9MrqA8/CtnvrNHhdunwr+ZcfeI5vStY
 OEJfm2AF7JvY6Zd98q49hWDlUS9wbr1XapAgphgXBmO9x7me7SlmMgz4RcYLzW+L75WjE8gIK6E
 WnZ3WfkSDGCXqteSMADWRmHgVRH8aG96tbpuaLp7AKX05Xc3bpll5lL3KdI4iwGQXx91/mwJTji
 0XOdrym6B10cITWLs5w==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3d42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fe-sOyn2LSJR1eIrEhIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX1Pta9+ICEcJM
 fjRl8Bm9fz6qhe38uoD2r1HlU8YxnjBnzDehYnJ6MjRkULutYxriqNPvbBqR+7wrAGEl7p8XYUD
 iDvRjHNfZ73STHlNrm0CrGewmE2nOU0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Enable the sound card on the shikra-cqm-evk platform, including
the PM4125 (Rouleur) headset codec, WSA885x external speaker path,
and QAIF backend links.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 196 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |   5 +
 2 files changed, 201 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index bde3b7d81ace..aaac14f43649 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,12 +23,112 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound: sound {
+		compatible = "qcom,shikra-cqm-sndcard";
+		model = "shikra-cqm-evk";
+
+		audio-routing = "IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"VA SWR_ADC0", "ADC1_OUTPUT",
+				"VA SWR_ADC1", "ADC2_OUTPUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		headset-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					    <&swr1 0>,
+					    <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_1>;
+			};
+		};
+
+		headset-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					    <&swr0 0>,
+					    <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu RX_CODEC_DMA_RX_1>;
+			};
+		};
+
+		wsa-speaker-dai-link {
+			link-name = "WSA Speaker Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu AIF_TDM_RX_2>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+				dai-tdm-slot-tx-mask = <1 1>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&qaif_cpu VA_CODEC_DMA_TX_0>;
+			};
+		};
+	};
 };
 
 &audiocorecc {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	wsa8855: speaker@c {
+		compatible = "qcom,wsa8855";
+		reg = <0x0c>;
+
+		pinctrl-0 = <&wsa8855_spkr_sd_n>;
+		pinctrl-names = "default";
+
+		powerdown-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+		vdd-1p8-supply = <&pm4125_l15>;
+		vdd-io-supply = <&pm4125_l15>;
+		qcom,battery-config = "1s";
+
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pm4125_hs_in {
 	remote-endpoint = <&usb_1_dwc3_hs>;
 };
@@ -37,6 +137,20 @@ &pm4125_ss_in {
 	remote-endpoint = <&usb_qmpphy_out>;
 };
 
+&qaif_cpu {
+	status = "okay";
+
+	aif@b5 {
+		reg = <AIF_TDM_RX_2>;
+		dai-format = "dsp_a";
+		dai-tdm-slot-width = <32>;
+		dai-tdm-slot-num = <2>;
+		dai-tdm-slot-rx-mask = <1 1>;
+		dai-tdm-slot-tx-mask = <1 1>;
+		qcom,qaif-aif-lane-map = <1 0>;
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -56,6 +170,10 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -113,3 +231,81 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s1>;
+			vdd-pa-vpos-supply = <&pm4125_s1>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+
+			status = "okay";
+		};
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <2 3>;
+	};
+};
+
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	i2s2_default: i2s2-default-active-state {
+		pins = "gpio100", "gpio101", "gpio102", "gpio103";
+		function = "i2s2";
+		drive-strength = <8>;
+		output-high;
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..ad894249e2c6 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -254,6 +254,11 @@ &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 
+		pm4125_s1: s1 {
+			regulator-min-microvolt = <1396000>;
+			regulator-max-microvolt = <1396000>;
+		};
+
 		pm4125_s2: s2 {
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1200000>;

-- 
2.34.1


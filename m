Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015115;
	b=UB/OJhXMqZEGZ2koUTrYEvons6yqf9pF2tArX8mH/kfEF0LolZgNSJ/Rf6sZdHBJXTOX
	 giA9fqhlplnJeNFuBzH+pTcv+ma6s0fwWwwR9jHXHAXk68NfLyM9SHIw4mKxFYiXgMP8w
	 +vNANOY27f3PaEdyY2bgNajkWnmbeYUQgKCeiNZHneAwdzN/bdVtEExwWhuiJbRwZF2kS
	 UG9RnRQiT+KndqAv9UhM8AxvbwMiQrmFAspDf9FG1aV1ygGH/33UMTCa9KG7zonn37zL8
	 r4u4rGT8umm7HLMqeuRgmr8+6ZGw+EIIbaq09b/Z1Dax/Tfb6Gh+env6vzeqOTlrX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
	b=UzIAQQEXWMjfAgo9Sae3E0MJExcnWrTOidNEwouG4heARDk5ER/Ierp0GKqCNGnf2kit
	 v3CF7Ih+leYpSC0b2cKWthdNbyB0Qj7Psn2Q6PbF6dBQqhOHLTc+Z+wf2UeIA3ZOkw6fj
	 J9OnPLGJz7uoIWKR77iX6exv+aep8c4/pnrjHUzX7RM6AL4OoI0uFoO2j9mZVqj5apHh+
	 I7b6KOEatw7/4UHB80wZxXUqNSPYIbrTIYbo2Cx5x5XtrSj7i/re4H+IUESO0bCfBRH92
	 qEMXcgaEzR6PZ5id/RDHPLh5qLNUN+sd1WlH3NAh3sKwyK284LNEDii6OmIPQP+cEUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mRku9r6w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT43vPnE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9149606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9149606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mRku9r6w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT43vPnE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7dc4126426
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=; b=mRku9r6wnKvmJyE2
	UHPF/6O53+05xDrMXQWquEQC0tUYwSpeu7+92bMRrd/NXpEEMUPgulHOMFAdHaYl
	ZnVGZzTdVHxdRW+P7Mb/+krNc84iy4dyAEXdtDj1PJsayTJDhxTkbmJ+FTeLa+UF
	OyU4vjSYYXquH/z5ZTvT2h6ZwRJR3hOJNhLHpHPzEDhqPSYxCgu6gPcRUO6kWu3S
	O78aI2E42QXSDGQk3IMz+DDVwg7us3cZcgmjpBAlejglSjbpbCCvpZIsufXV6X/E
	mlkyVm8w9rqtkdk6l8hPLLpWFK4jqsk0JIbrOv6wruOgsItiyxBf6sbXp75wCtNf
	do6RYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so2238113a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015113; x=1793619913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
        b=GT43vPnEFP78/dtkqYS4YoM5giFvh1MK0yxS3heHS1HiCyIpvE4sXIUiG0wVcm2quW
         3nmvKXd3p57l6bjkrF9MkmkH0Hl1YLvvgfEGiATQS+BajNz0suYvfhpbA6qL+uCMsokx
         DbKSifRAP4o7KdUTWugC/GwKPgNi2vTmvidfmfJHzZEhXe3nWSA1ULP5R5TrA3X+7Uqd
         sQx3BWBdXvUYmZw3HYIdh1JJ9n8hd3hz9r0UaHgC2Jkmvna0aixTpI1/lnKpmApnTst9
         nI+Tzju9LH4Ll36f5wcLlwyqcHotqEF9nOo92H99jtlxss6H4KTH+8y0GcFU0zfNoa9L
         U0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015113; x=1793619913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/Y6LzAx+mZUko5vnr1hIQsrUy3j7plCIhRTG7q2yqA=;
        b=mi7/PXVjhByn5Xuns+0EbiM1VJVs8nW814qadiBPecXJv/73hEKW5hXa0KsLq1sOXW
         H927vZqGS2fPoIpGqSBVFQ3lp8UKE8wt59ovcDmeDHYPhlRI86GzmVi2HDcP+Gs7A3DX
         aIo3nsUuni/vbgxECk3LjqbEBwmmq7PG8j80Yxfx7xFBkYwzPmwY5Wc1omr0TGlloPjJ
         nmpWANtaQmvaZ27vA1PMLsr2t46+nZj/iRwpab3uXmYAseaTNJiT+ThPxXV5Mfg7HM46
         Lfzcpuuc5Qg0SYlpIHE3BlmzUYn9cKcWpab/HoExLHMEpukDUH7VLHiMV+oGmaCii9yF
         1lxA==
X-Forwarded-Encrypted: i=1; AKwUvBzVQHdN8isssKRdGkc40Fh3VclkvjBRUwGqshDTtYvKNpv9mEtvzaUo5wOb9pNNNq0mQSg819u5p+/Spho=@vger.kernel.org
X-Gm-Message-State: AFq9FYIweUci9w3bm1lVUCTYAVl/5uwI1wK2eOoSUOkdDXWB92Ar4foQ
	y7reCiJhJky5ZNgiPxBksxPnCfEjT/CzK+/6kn99Ym9Lir5oGPdbzs1m/KP1lfnyVvElfIkQFKO
	i2vx5g3paYnxKXh+9OlKZcvTmdWYu/mcEvkTlAfw4cO4voYqEWNeliwD++Wc6bHq51fXUfc/NYn
	U=
X-Gm-Gg: AYBFou0l6ImOoy8Q4VTJxVygQgZGF5az/l56WuLdvb1fk+qeZz4YHQFfrq6m0sDX/io
	uoJdubMl3CCs3fCtMKGz4+Xn3Q3HEijPe2OB1tlXiuSNDgt+exlH2r6L2RK/PNAfR77r4jLhCXV
	MKvOru3w53v4uJxc5phLCi5KUteuNbviOo5zFfd6YV110j4OmqUNPyebtMgDzil8L4B7HaAC7+3
	ple5SnE/gV6L1wp3nPxAI4ZBYbzAbGEHLWzGMP8di+sa8vLRnnn8kFS4KxsHVyEcfWNssIwmpQQ
	leu0a2eTZBL9oMHkVCMeYqIb6A08whxdIWBaXymoCu2K3TLGSNTI+6hJfT0THkq+JQPvXrviLXA
	nLRFMqmrUAZ3LOK24MATKPxL7kEeX7NeT8aE=
X-Received: by 2002:a17:90b:57cb:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3adeabde80bmr5885516a91.27.1793015113342;
        Mon, 26 Oct 2026 04:45:13 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3adeabde80bmr5885470a91.27.1793015112630;
        Mon, 26 Oct 2026 04:45:12 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:12 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:34 +0530
Subject: [PATCH v4 v4 6/7] arm64: dts: qcom: shikra-iqs-evk: Enable sound
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-6-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=4348;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=wm7yS0gZUJpW3AMWVZW8HSsAHuJEx1vpq+RHBpsBEN0=;
 b=Lx4TqibAcuQAYCNW1ngW9NxdsDjYHb6LfUNmWsJq2zvWe2v8YZt7HDb3lQXw9JCKxj+3FN+Uj
 3NIr0ONm0mTCfRxc2Oj2PsOuKf9DFOOHcn6obqO89TihspcxKXcnOG2
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX1CSWV6jQf0+S
 gC0Sq0UgiToYpmQL4UJlPSMxJjK2QrJT6Kay0l89Ly7NZnQKJslk4/DFIvW2npUYrlbH70YDTHQ
 5n7ilzJh1qwWH0S32uNejsyM6TeQKgo=
X-Proofpoint-GUID: UBy2InYBLKQv_mVz-VtzMpShIBydtX8y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX6qyRLpD/hvnp
 5QrqmnOXCYB9/ASI9gOwOV6+1U8qF/5DDHNmfSMWX53USBZjhe8Bcu2c+1Akm0u/Q7mlZN/7g+2
 T2Zc0332PL/heqRE9sH36MG6utfDQSfQiw/jMO7a6Jn13mo5hTU/AsMoXBfQvm16mx8PTZStENp
 wfSUY437V/PEcz6/1gyzDiUw/mrFXGKmwzckE7zTaVio/utoe0u0MjW6tWoMkfUm07fl3sCQX9e
 V/hkC8rQZ2IjbsKsFZ2Dn112+MftHQMK2sNXkF4mcXCwFRTLFt9WBfo0whRB738Jzhufzqn3+v/
 3NJcp9VgL6/b8Wh3tMkNEPC7JaF15aFlqfzm7VzGEBx+0I5JMgMwJysCfyneVT/3RJYBTxbo7lO
 w22XwCXiCsDHH3j5zoeoa1QWNnqOS1Soq/PpOucXN1yvCKa62PQFemJpNp9fBmD9LfKu9hcXhet
 ygbb8cTud6DOSinBg1A==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf3d4a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gAFAZ2oFMDLOpEcE9BkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: UBy2InYBLKQv_mVz-VtzMpShIBydtX8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 159 ++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..473dc18b7958 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,120 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_MI2S_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
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
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+};
+
+&gpr {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@153 {
+		reg = <AIF_MI2S_RX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@154 {
+		reg = <AIF_MI2S_TX_0>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -89,3 +203,48 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
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
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+

-- 
2.34.1


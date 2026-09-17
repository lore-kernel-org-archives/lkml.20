Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FC3B5E08
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619910; cv=none; b=WtSzTnE6xd/4Lk76pMSHg0x/qnzXqnI5r5gKWV29QxbqxSKP90dSXWvuFhdjC3sQYcLEzcLffjM0O/YAKoxObHKDWyX4IRTsv1ropb2GNfw4YqZXGJAvYzSvZcJbkLov7zQNfeMA8sv/Rk5EOCVn27lPrtO92lODt2ZGt1QAj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619910; c=relaxed/simple;
	bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz7Hi5jWsoJiECAlNNHYPyeZnysvVbu6SjByqOc4ZDBs8LDWZLvfutsNmsiV3AhCUHTFdMsoenfmuNxCwgLd/nsyMuyPGG7HJi1vq/wd/yex+ATK7qloZ4mFe4U224MLPB5N7yYbIfzX4QTfQ6fXGT4r/UkwWb53bluqM44knQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddYxuVpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VtIjLcP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddYxuVpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VtIjLcP/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H0kovp3402965
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=; b=ddYxuVpl5SKum7vb
	TWg96g13MCzVFwiTjVzu0sTdPpG+k/wMpK7EUqy5KKOHgE41nltEYOTndQW2j5HB
	gbUTe6dDgucJJtlVRSbyWDRxyElrC5eM7qn78UN9ZAFFoRkbAjnJCx/dLkxcw6sr
	ZwglLssqnEENFmGUD3GlND0jUqwHZvMIHt8I3bObyUXTYaeZ+2JERfDr+SExQXAG
	jBe9TtDbuncuyW0/MzYIQ/37+ZPYviqW3NypBzwTSJvEBSfOYqaaPOUUcy5Inap0
	NHYeEt7crNB0AaK46clNIIhfkqTrzJZ5dK+dURCFN44H1AaYON65c5UcseV0dhrY
	YyW8hA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d2huh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:38:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso796835a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619907; x=1790224707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=VtIjLcP/m0CtaKSJRYN38cGoEbyeNN785VHknnEi9Q0S6iKjvo8IGuzL62mtY1IXm/
         3CbNdKLZPoCflQh6h3KmbbsXot5qS2P8XOUdei1E0RY4jF8nz0PrQP9TGr1UAOtVnPnh
         IoBOrDR1fNj+3gw8yVWAXAD+0it0AxGTqSZKLIjro48Zup8rgMq+NjhBbe5lczANSrUT
         Let3BghfQ1ZLofYdnuDBdHIx4G8Hg2gmg+mMf6I8KcsNhSZr3osG4jg4wvMXLW4rJiZC
         fk5Y37m2Y5Pp0h8KrpJPR19QANJ8DbPOPvEUDB9aEiallrSd+v+d95cJrt0tSHLLzD6y
         TV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619907; x=1790224707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5+92k94YxTQHHecRbmgdArr12KipPi0NK/Izeo3Geg=;
        b=RdqBPq3f0PtxbUF8OMUn/1vorI+oq17fPYMJnd4hbnsPWC9CrVdecdQIFlulgvg3MZ
         bmH+oXVzxM5cgoq4RNFitZDkp48PCVyzxMHQ8S1OW9MceJbrJDoIwECpUkTFeVnTkl+C
         7HkL1yBLRQPx5abc+XO4kivctqrLrxJS5tpxzXc8vQW9p+nRbrBkgrZQh5cuvEGzYX55
         6+tY236WmvTjWfLGqF4kA3KNJdlVSNX//swqhJ/OSsTl350B+q9UGEkdbm5PT9n4Xgp/
         kdtRaC4hRAeZpwfGVsrORQJ51op651egO2LoytidvO7evKvoA9OE8XB4Toa+TDzv/SS5
         R2rg==
X-Forwarded-Encrypted: i=1; AKwUvBwi0TsgaLapGhZ7PH39napRLwsC7nXcfY9hp0WdZ3pPyHr2fU3DYXxqSB9sXCzpcitC6Giz4iXigqa2sA0=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ1otRWIcmINAJulMd8D5yBhQzyigj5dDWzH/3zz2HolMqrCWV
	VkavaZ5tTkWdJH9FiEcA7cMx7iB21n5MgdXLDmV9WED/FSNh5P4qlLKQhXhiEMa7eM3grf7qVN7
	Y2paNOLFbnJGW7zUCMZiTMVUjknBcksK3xTOShlp11MjAKUj1Pawqy1Wg8aC9wmHcpIk=
X-Gm-Gg: AYBFou2K9RTexH8aTiqRAV0uJeoy/f6Mt8ypQwBJ781bNcuO2C3cnb7bFW+LQ9ep8em
	GnIxWYl47NMYbnb7uL+CTx+XjkPH2VP76BeDTaKckfVTC7mRjkj2jdACLTFtTqsyvPleV8BcZgq
	R+rQ4oawiI5Fc4uEP34o6AgDl+O87Q6OT346ruNfGAS2YL6UPvJBuN9r/H9avh1tMWbc9WeGeiw
	ZYeTc+UrK+hcY7NDY8hQiOAG2rzUA0yq0jk2D2hDHJfAtzBSYtud1dSh4bdVh6hv+eGb1fjVsbx
	azzuM37d0asqeJU8mDVVhC90QZV/TG6PDEyPYsm/dnV6Yyv8rxXUwBmJ/Q+XramhAYvytPuPTDM
	qgD6n2xmIAH7PSIKa414MHuHHoDEaxoLm/Vl9
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15586102a91.6.1789619907182;
        Wed, 16 Sep 2026 21:38:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3b91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e1e2bf7a7mr15585863a91.6.1789619905788;
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:25 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:36 +0530
Subject: [PATCH v3 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-7-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=4088;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SOV9jDO8GOlRCmornBB7OfFab2xr3q5d1uV+VfkbaNI=;
 b=NFGiksqVqZk6Bh651mL1HsehAuBd8zzu2uDQcIwZIWi2f+ezvpywh5kXmmkymzuDEqKqYXibf
 FchPMroDX4XDkvCnuttMdyq6KdYynKIcKK8S6nyE5sdwy4T/JO97iLY
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: tdiu1hZ_lPlgg5YX41JU_JoMENPZ3-T0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX6VsXvqou02KT
 QjK/80aVSn7PjuGWY/p6Kw7isXnGGBOijAl2XDY930xBc5Wnci4yNpiu+M+5VygZ51KGkL+LNwm
 8lYvB5ujMOWwnEqRhEAhrrFPz9WUS40=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab6ec3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wLb_nwxRshEjtDnoXkMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tdiu1hZ_lPlgg5YX41JU_JoMENPZ3-T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfXxU8yNfJLD0FA
 iowj05RRC86d8LY7is7Iv753BLoSId2+IszHQunAdOrhQ3Kdu0+/xuYpSoHLylxPps5BXpiT/5l
 HdVnFfUZBTB8MdGMdgAXSwaLgl1aC2WbLFEFbYc/yPqVQXlGnIwUOSe5QuxazeT+go96tipILsW
 pXP46SCnQczkxRvZJMNik1ncOT0BLkpz8DXdggwJ2aPvfb3JGm6rbD6gYXzSaGG5XmLwstCKaC8
 T4VsGupShRMt2ytppeMHTgkW6QT3MKgRDLCCx5xzdKGrWAm1URf5rtUvbsGEi2hQB0PohYrq5WQ
 1NlPZHEcV68px5lEMGLdJKt2+jn4NEZ+poPykdNf29QY82xLnEQpAAqIXT5KNWHpIuycnxceZ8E
 UzLgJfR2J4MrPPgomQtpYlHHRxy5SVYa38NeO04hu4DaI1QLEAMIWT1f4fqJez8f1LyLtepun+z
 FWN1wK+FYxbi8HxkkBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 144 ++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..54c840a748c8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -21,6 +21,105 @@ aliases {
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
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
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
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
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
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
 };
 
 &remoteproc_cdsp {
@@ -80,3 +179,48 @@ &usb_2_hsphy {
 
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


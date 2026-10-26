Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015111;
	b=lhAf1J9Tmnf8m4s6BL26jy92yHFxSvbxIXRnwyAQPkaiRB1hCUq5RDplen22X5McHvIc
	 kY4mXuu9HDFmsHUuXGBHEE8hav383/bl+rnihGkvOBJPah6Nst0+B6GnM7nedgwVV4lAV
	 cLbbXtKB5x3uQ1RpRKXb+G0MAvzsWTajms191oXdVQ+LdfgaymwS+/fz4RJhzQ5z+jkbN
	 x0GIwFrR2nd3DK48i5k3N2MjtyG7da4//EizN4Q3Caeg2WwlDr3AEHWT8O6JP4kmw8B+s
	 1ivh+PKHPhcEXujZWifb7diwTuO1KfAuKEFo6rDuHPYw2+OKfHgQv0IktbztZ6DLe/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pVMCml9hH6Jd4MOYJlJQ8CCfsqugDZ+22Ylr/EG5+2U=;
	b=S5QbEWk+RWLTdaKiOW4tFE6VyFebAGMQfaYDgWY1lCb77DdvPxAe6NsPS0VJN2oC4drq
	 3DvlOt0VP1DkAyM3yXIJGMbtWQOF8+1wtWhUq834ACkhUTLHkqn1x2bnBTQh0/hlB29iO
	 55ISkJljMi6AhOO808B+vCrVPQ9TpSaCVpfQ18qQfJ0qPvG/kya7niiL0T6Xj2bk+DiTq
	 crUG0i2kNX5Dayv0zs2HjY/YoUydeNhHbrQryC/u8ZC19fg66SNm3vyhE+vvIJr2S2sSj
	 +bNu9Z8HcM1kLp9H/aNZaofA2rbVoA3J45bT6ERLOL+UIr+1EkxlLjL9q8nEmKKXF6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NK+FXXkG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL4MtwBy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77C606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF77C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NK+FXXkG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL4MtwBy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtJu12541787
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVMCml9hH6Jd4MOYJlJQ8CCfsqugDZ+22Ylr/EG5+2U=; b=NK+FXXkGVbNeKS20
	ATBblvqvWRzAyRNraII6yVCM8+XPu5BK5s+rDY4QLiadxaFbkQm+qVJHKEvqr0nZ
	iVKQF+Hx8D29fmlZrGGvglIibTvvmRVx+YNX3Y5wkgQZCM/VoO3N1Uk3dYb5b0UZ
	KAnDIlfomZkgy7P0TvB7LlE168BC4OSqk+EbH1PzuwNpKpaRfy+r9mMLzbDCUi+B
	XcnU6vdHnDZuhEAz2dHANvhvyXg3w/imyBPL8JXEXyXWaBug4tehnLtPog6FFzxM
	WY2Czkuj8xUTPX4wq8aIHnKz34ncWZ/7vVMNaF3X4FAcLydXNvzUIe/IMOyFLVuX
	IaYo8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjda9bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:45:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2656680a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015109; x=1793619909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVMCml9hH6Jd4MOYJlJQ8CCfsqugDZ+22Ylr/EG5+2U=;
        b=iL4MtwByt2zUtACpPG1w3xm3KkbGd7Zif9OinIuYD4aH+7beEirziyD8eTRd9bqf+B
         KTcTECyc9FVfYp6kCF9i94dE2Ci6vPRDLd3khOgp3WcOI1nhZQ1kLFRpSfy7L8sktkS1
         ocXRnl3tHQUWzE0eW8QYh5Cw7fRg7VJo1W1gWPacV7rg9F1uh46UY9wTKzAQqs+aLCZi
         bICeNPINNxVcC1G13dv8hVsBppjY4itJBZyii4y39hGgapi/L5RQRIvyGnekQrLMyirP
         S7jZJD/M1J6zSOQimKoPcmVCe5EMPyhL8lAvyNZ7tVrlDxEKzoHWp17EkQUPFC5KmJSi
         VykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015109; x=1793619909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVMCml9hH6Jd4MOYJlJQ8CCfsqugDZ+22Ylr/EG5+2U=;
        b=Ahga+fVUWZ2WHJ1H4qycVZ63LbX/p19g490/wP8N3GL90YZHVpxJjEPAx2hul5DhVm
         1tQvXgrAMsSgJAKkgvJ9gL25QnfW6pvJPMO7/4NSZFbV7DOkjSUqCFGn5vQuBcd8wLKa
         cc1KYxOQUx2zhCD9k6bCC4589UARxxc8U/G2DmxZnR9VSif/NqFBxETshtY5q+QABwtv
         oFwEqTdgph/80UZjqRYanm4jWdm0vyeZznhPLgWbWPQ5sSp14ibjdU08qFJ/Wmp21I3/
         CUqCMgehLWxx4CUM6S69Pf1mlgL3ZQbw5A4Fz/ByflI7G0MbKeoPwOI248sOm0Y/3F5B
         kY4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMc2a7LFKpSHjCye3mPVnmdppyGw11qA7teryrKI7VVAmIVdOdD12hFD1M15bvx52jUA29H8X5Oiq6L4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpUnLBwYKl7mv0kPY0s3l3FHteAb4unKvJM+IAY9MMv4fzkEK/
	ezqKh94+Whs2sHJp3yTBPhOyAs8eOebV8r7PcX3oE94ksHuR9yO6vwAp+0prP1h2NuwZ8/UQEaw
	l1omNGXr3s07Givd5aty3gOOJiJHLgxm2xSE2dF9NnPfpKrWzG16iKvTRiYm5lssS1qJ0UY3S5a
	Q=
X-Gm-Gg: AYBFou1H3Caaln4dAILgF2sacXQ8+2/SBCdlZmtPO6lwGhDyYP6SggLqJfEsOwdHaGM
	EZCFgaAfLJkOMOfliXld3U/IHh9KqsJBJilNfc0NYGihhjrPR68UN4QUz0U16t6oxk1UJ3GSS0+
	8dYOE50k7UXkm0nX1LzPrtXEl9vGRNMspn2g1u1Limxttrq9zwSXW4GPq9jM4XJD7kmqPGjJaYr
	WJIMa0g+PF4St0YC7z/QmXyHLbHYcAv8luFw89Rrr3QpsIaK/ikjMLjamibd7m/FrZvfFUEIDyf
	RppqbQ26GslvqNVocOeqwCIORjOgUM3K0Gy/2vDnmX7p6Br1q3p/VSfO2I1dTF7+/uyolLC8NJE
	Dg7Vc1k+HABkj8wMBwYR9OU9Tff7bb9xz1Gc=
X-Received: by 2002:a17:90a:e187:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3adea898711mr5463305a91.12.1793015109214;
        Mon, 26 Oct 2026 04:45:09 -0700 (PDT)
X-Received: by 2002:a17:90a:e187:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3adea898711mr5463274a91.12.1793015108691;
        Mon, 26 Oct 2026 04:45:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:45:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:33 +0530
Subject: [PATCH v4 v4 5/7] arm64: dts: qcom: shikra-cqs-evk: Enable sound
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-5-cfebe0809467@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=5960;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=wc7nAk/jR9l3CDHV2Wfg7rqs0Ay7TJfgtJPqVWnMc8o=;
 b=F+ogDeq5ORxk/XFwYyC2Rfy/2RxbekI+224NSwTJ5JucfudurV46o723bGfKawrqojhBN2Q2i
 tfFLhB4mO9YAmRoIINkZbkaM9R37+SfcLtFtQJo8+KBvXzjvPUrZKmQ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: Wkz4lltac2_EtPg6L62EUev7SSLS-EhV
X-Proofpoint-GUID: Wkz4lltac2_EtPg6L62EUev7SSLS-EhV
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf3d45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=b47BQBP9tYAaRHXfgqsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX3rk3ambUJ0X5
 Vxba5OfQZYE2CLKJqUrEJeRHcgcqJwPAobC9D9qt0gnWK10MCydhG0bl1SpHriI6mrje9DUfDjq
 cal9R2mjPeQi8ssNn0qGPKf35DHDLvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXxzPTWaa01DfQ
 zv8Oyr1HaT5neQnusCUpVN1igI96t9NXRAFAjmleEz4AyRI0XV8lfn1wC0qeqOCsr6g5YT1BzYG
 L0ShtEeiDxTJ8v1erWUeDqc5f/N5kIfJDQRb5TwbTqDD4U7p2Z7XmmSWgAxaBStk4tPqhtgu31c
 AMKCEa11utjTK2msmFj5T3nDb/AA96Vy7FOaXX5KfgA6K5TDdkt1n2sYPwbagh/D5QnCqH0EbYg
 iFF86cHGY3NwbXfqUpZupvQDqD4CJtMdAYnFhxpvIRBBOCZ8WaMLtJ6pVj57OUxicRl0ZJYH4p4
 F3nDmpp/J4JjNQ8d8zMz7EgB0Iw0dTppGb5e4NP0HkbeOwQ20P9wHPzo4g2T/D9P2jvfeA6gyLl
 vY6vFcwKVCl+zN9Kq9lS6luMvMrw4kIbWAjamT2fGniDR8jD10qCPhQxXTAwWv5ZgxWBPhZy3iw
 3mejeJgTFhVgFC01M8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Enable the sound card on the shikra-cqs-evk platform,  including
the PM4125 (Rouleur) headset codec, WSA885x speaker amp.

Also enable the required LPASS macro and SoundWire nodes, along with
the necessary pinctrl configurations for DMIC and I2S interfaces.

Also enable the required LPASS macro along with the necessary
pinctrl configurations for DMIC and I2S interfaces.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 224 ++++++++++++++++++++++++++++
 1 file changed, 224 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 2ded25c4304e..ac1f55ecc7af 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,125 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sound {
+		compatible = "qcom,shikra-cqs-sndcard";
+		model = "shikra-cqs-evk";
+
+		pinctrl-0 = <&i2s2_default>, <&dmic_eldo_en_default>;
+		pinctrl-names = "default";
+
+		audio-routing = "VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA SWR_ADC0", "ADC1_OUTPUT",
+				"VA SWR_ADC1", "ADC2_OUTPUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT";
+
+		wcd-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>,
+					<&swr0 0>,
+					<&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "Headphones capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>,
+					<&swr1 0>,
+					<&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_1>;
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
+
+		wsa-playback-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&wsa8855>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai AIF_TDM_RX_2>;
+				dai-tdm-slot-num = <2>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1>;
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
 };
 
 &pm4125_hs_in {
@@ -33,6 +152,16 @@ &pm4125_ss_in {
 	remote-endpoint = <&usb_qmpphy_out>;
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	dai@183 {
+		reg = <AIF_TDM_RX_2>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF2_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -52,6 +181,18 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&rxmacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_RX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&vamacro>;
+
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -109,3 +250,86 @@ &usb_2_hsphy {
 
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
+		qcom,rx-port-mapping = <1 2 3 4 5 >;
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
+		bias-disable;
+	};
+
+	wsa8855_spkr_sd_n: wsa8855-spkr-sd-n-active-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <8>;
+		input-disable;
+		output-enable;
+	};
+};
+
+&vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+

-- 
2.34.1


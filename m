Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E2E511E76
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058150; cv=none; b=Fbd3t6RKVK+hIvbZUFxfFHaZJgxtQ/d/e6jH4iKiq/hN8aFAK9UHsnxYahOrVff0wWh+xWhvf9AkjFFWt9MSfvgC5+TO39pRUsif5ZsKz04vyRcFB4jTCcudMNhOmNyVzNQ9vZjuzZSye3cO9IU3VABdxJt5P8X5MWfiRP+P6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058150; c=relaxed/simple;
	bh=WzodycgshZu1zmZaPE3luzfQaJD3tQB9g+hnXzzcEI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpbmuvH7ZZPxBr9N09daYBjKWwti7ti3/XfJ8Z0rYfAazNowIl43miVEmI7k7xbUJh1Ld6LXgNoQ2ER2K/08W7LPY9qPsRMrwAsLxPL9PI1PRgnfhl+24LFbi0wbxSOip4ZOvsT0Q8BdEkliGsoLO5fT/CfIa/9WknKeKxIgIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKnjTZAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiUhOeLD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKnjTZAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiUhOeLD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgSQ1955865
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=; b=JKnjTZAa72F9yD+Q
	PBNqdAJPY/1uCm9y1ZPblv3ifvnV/GBPrvHdRbeA5Wnz/XT+BoOy9s6CKfZzC3jD
	agAeSgqUmqqkTuRBym6m71iP+rHjbUirc8v2iS9fxmWdyPQT5NX/heyTE9wMscv0
	522XFks68mKCQFBP04VPk3P5Hy+5lOdDyKFMFKEyeVj5XgoAWTSkwV8hK+XNDYW1
	d7MmBEmKQsr+6ae8DzpuEumZoeoe7kWtdYpfdC5CcJ7SUcV41bt0cXW7OjeDk1nU
	GVEHSDHgCrGnxa/1frIAeA0SAiLdL2Yx+uPKkFDkL+JoVMyQ5t2yXPKLcgOHtkGT
	VuIgeA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet82r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1362309a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058142; x=1792662942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=UiUhOeLDLTdxnSv/rsfgXOWmYWTT1BAHYYGdTXIhHoNs9j29F4osfRboykmuaE90+7
         vN4hEwqTkrUMl5aD/jyBVOys974nk7spAur9MFCJEOd3geqbslDu2xqIG1MPcT20M0QS
         rwh4regKEwp6tOWushnlbE5A8zPKnOQuHlFnQNYM4DMm4J1NLeNkRh5APSSvXv3KbuQy
         BGT1hn5errEH9j6HEl/BWNsixxlw/1fFbDxPytWuQhJQYKLBzchdBGfjVtfxY1nQqq+7
         JOSsv5KfhSF5ofswco9Iq2b4xTtv9Va0uOR8MLmaxB/eodWw58NWgvGHl4jAhZVgj51A
         yJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058142; x=1792662942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=FwsybhxjTadl8GMwWxEpsy6zb7dJGJUVT3rUfoN5AOxhZjQeY6hthmihWughC4difl
         tdNNjl9iq3SDAjJCgo1i91HmWdN6hlG4MBVLEFOd8dnnASXhZVRGkvwD6ZU3o2DsBjG/
         gSRpLrf2WK0HsvNg86I7PenunnFgWqnI1rNrDaJnK3KE38skAHV8pqJc4X6JYYWNHrKD
         1NIQFVYda973bmpIwyeTXoRCpQxzO8byoMiAEjsADcilEvWfi7ZowTVhM97Rpp13xxUy
         gsSvDRltxmtDK3+ESAtiPXdTjDi91UDE0MA9fBJ2K2wv/Mcb9oN178BQx8Gy11fedof0
         J2IA==
X-Forwarded-Encrypted: i=1; AKwUvByhjjGbQKdH87+QcOkSZOTIPafGbzneeDs5+hO1Fb8vamtOPPrpVrbQZ16L8tcgpm1z9Wbugz4/a4VFFK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6YYvOU6/KsGK/BLBENTFnajS6UH+7xyPpBy06KPMXoE0aPXj8
	32PMpa+RRtyzYnKJtm7hUxgbuO0CyxzqQmcCV1L6R+IJTtSOwA6xFeQHXHnCgTnhV/imPNZGMuk
	nWT5rXEwB8PKtP9klbaH78RGQ2MO1KObLGC/dKRhTqKLWG1ntk84kTQitd3ITBQiH0SA=
X-Gm-Gg: AYBFou04CFoHc+wB+QrX51NDm9p8UUWuCu0Igqn0YOU56BG8nW4RhP8h8IwrWagqawL
	30grWg6lkFDe94EUgT6IpX9oCBjoJfppA9YZNJA2zg9n2BHjLJhLIZ/FAUTyFwPCRKhxOhkup7R
	ToaFN0U1qiRRlcw/22po/PAJRikoGAB03UeEI36xb1xJTSBMiG08lQBD4XW2bJQg8bKmaLu64CB
	WYDu9EnEKGWnwEfq3rSeWJfOXg6BEVAkm5vf9SaxxbEHa3C04QUUHoPCMjpmkq8kvPRg+XapYNz
	tUOOXEWhIt1sX55GQDCkDu5xNQ9rJUZsoZwcWW6SfwZK936azjX4gd9P+Op3gXrzHZG+vTOD4Ut
	6KE48NpeolHr9lkBTG/v6OG5FZfGn2lVmBJlq
X-Received: by 2002:a17:90b:28c8:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3ab3a99825cmr13431560a91.33.1792058141577;
        Thu, 15 Oct 2026 02:55:41 -0700 (PDT)
X-Received: by 2002:a17:90b:28c8:b0:3a7:a463:54bf with SMTP id 98e67ed59e1d1-3ab3a99825cmr13431524a91.33.1792058141021;
        Thu, 15 Oct 2026 02:55:41 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:40 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:35 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-4-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=2296;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=WzodycgshZu1zmZaPE3luzfQaJD3tQB9g+hnXzzcEI8=;
 b=1aBWgmRf56b24dRFRqn4zodUhP6YjCr24OIDB+tfrz/IP/pbv5gM9xAnc9HodhxjfmBVjfd+k
 eRkjx6CNOojDmMNh1YOCmbddH9FYVHUFj1c3PhUlzb4QI/mblPo8LEQ
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a31e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XqinFhvkQ7oosSToCroA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4WTzFyThQTRIvB1a6UDnZ_XrNwYZuhka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX6dY6A3AB2Qh5
 QttzvrnBvpodWgkoyawv/t3CiwZ73PxnD6AVgFklNgCqps1iKJtuQD2DI9LDLCJ6qz20HzPP1+e
 Id5X20p2kftQGXZR4wfDYCAYKFE51NhXwFlKlK41WISCI+jo7gFqr3AeP3Klnayc1dF7UI+iREh
 LlcRpYPWigqV7LUKYlrt6bLODeizxJNBeqIYQVoj+8L5F2tos3g39KXWzY+4s4N4Cl8S/e2UUgR
 nQX8q4bDhPbFGIc/DUAxInazofZqWNE3w2R8h5+SaRKdNlBCkYGvYa6UJ0akU2cFwetRt2+3OIV
 +pi1SZhmSiUYegKa/u7zwBHdVTcAy/70TwXKZs4fMqVJZnynS33RIJzvW/RbBObcSmPnuXBA0XO
 M/4659WGo/3RbYCzomKgxOH80DBa9C9iTg6QqlHVdvKTEEakp1cg4Z0ho3S6GucJkXpPQeintuz
 sRFb6nCmvH9Rg2aPmdA==
X-Proofpoint-GUID: 4WTzFyThQTRIvB1a6UDnZ_XrNwYZuhka
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXxq6yrhp5PkkY
 Qae24hqA9udMlygVodVrWAofH5jGBXa7K5XV3Jrg9eIELMnhfeNWbwWj0iwqrnVbXgz+21aqjW4
 hNz1AE3FgI0N0AiM0Bewcgjmf/Bg+KI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

MTP does not have audio jack connected and relies on USB mux (WCD9395).
Add necessary nodes for proper audio headset support along with USB
Type-C accessory mode and orientation.

Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..22eeacd7aecd 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -200,6 +200,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -232,6 +233,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l1g_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	wcn7850-pmu {
@@ -916,6 +926,44 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -1113,6 +1161,11 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/kaanapali/adsp.mbn",
 			"qcom/kaanapali/adsp_dtb.mbn";

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662639;
	b=fdtzUDtqxcnsARlgAFAN7PG/B+DpPdWx2JZe36te9TQplv9bg2EMO1HxHF5VV1QJvydS
	 9CG2WPbCZ/IBC4rDkMFppF7A3LaCCY0GKeNTeMbeFFg63K5RsRhisOiaFt3/gPQ/Zbos/
	 dcfG+RiSbmcfaEvqaqm0DKCqWbhdkpo6XwOV/J6bBIE9wI6obXTN0Dg+VNv/Qe0j2WWkw
	 fqtdI9UwKVfMcBCWEizUG7yhsgcMfvj0z0Q1Ef0AW0kkDwWwuATstXDic2dT6zwlSL9lM
	 fOblnXcD+Vvzs9Dmyedoj6kKhNF8VWyoDoKBVZ5TlIYUwDiHxa1fyn+q7cXNuPs405A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
	b=3fR7O8Fbr0xTTMyNK4QktWin9FUQWB58XJVkQTQKpFcTcykvVEOqUFThCHBW3b9US6/7
	 a7oKotRA8eKcLJ9mCSabiS50ALDBo7nv3htsbP0+ODFyFSFdnXO2t4js9dgey1z1lOn9j
	 QPh2v6pnq4zq48ABvXs4fnUMucz6jIUdZhbUvpdU8dui2fA4U8OLC68NyXsJleDwfVLba
	 3PqM5GbSdgTFX0CvTEdpnsfNwi4CO+SFNgvcnG61z+nT0tO14TWXiE2EouyXI7v5JFLaL
	 eTJxZWASDUyYo2+LrHYWnA4eSfrPFy+szLY5jvqSGbd/JROuesJP28ZYcQRKJh/cb5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS2jglrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJ8UtQW7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123F606A331
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3123F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iS2jglrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJ8UtQW7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702jE3076364
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=; b=iS2jglrxAjtO05tv
	LmqC75CUX8Mp+UTUCzscD6XK2go64y+oCCPNxI8aigstHn8Z4t9oODQj2HsmZ16r
	oaNQGg4pjn+dg2lncrYbtJhZekEBpFkrh8wzSLcVIOacqD2Cn2KI0bWP+IXdS5w/
	/MDwlpZzV3q/ikvkYfdquKt7fzRH507TGdLfS2NlDhwRxJUoA4dOlkvdS7/VFQ6s
	qDYRe+Z3NfAYPypNK7GFJ52FalBjyXdSFX9PjNeLyWBxYDBLeW7M3zisNUoGgX0i
	UVg3LN63UzwLSTgrCA2CIpkQHMH4q53oIf6WSytBWWeyPI5mKgpELO1FnrHQDNfY
	4L37GQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1s80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:50:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2806167eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662638; x=1793267438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=PJ8UtQW7qSZPwnsab7+hhlA3NQaUZLkq9ciGFiKWcflgKg1lwejDqyDPv6uzD8YNA8
         TSUWub5FX39hcgFvAVmhw0/ZjOBzlZWA7GoxH+DM/CwjmOGg1N3eRCds20X7PuOcopAP
         CbPH1i37P0DLfpfvD6lcU2rlPHnKtaqFVPf0MRIdS5CdceHo1V3DepdJgaN3tR8cQIBC
         BMmqMYCXqKTJssb3v15xri5aex8cMbwsAi9DX2s5js6ppuyZ2IMLUJVHFc7M0dH4jqiF
         KpzyiClzcwcCgjVP6Poq2VJAk5sPeIWpTHD8L5AJYWAFVQVut9n4h+2ydFOkzW0BHmeL
         tNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662638; x=1793267438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ehR7tMmYRyLJIX3GU7vP2bshuwvUW0eepQwQOphNmY=;
        b=pfkbKk4NzJ62IsVx6ah5UZuH/8JJk1MJ74NKujUY9osOLF1T63ScN708dcHXXF05jP
         egxQJNXAhLI/tHeEYoo2UCIOjlKudZhB4yxMFBdyMBByd5do9fuJtQCyFDzRwmZ/o3hz
         wVg8UUkARj8WZyKHxVGRPXqGsiMtH5i+M3L4RzUZd3W42gxSsPjRRQcsW/Lgb53T/qNU
         XTSJI72czVep3tNxclTHKrMXntGkvdUFMfczHNFPc1/ZenGdDNw3xtTv9NbN2U686b6T
         qQWeQPeI/a20ULrcPSC1J3SJWR5wYNEE6FdyCp9qmeDcROYUNz44XTydpS5O25wxOfxs
         DEdQ==
X-Forwarded-Encrypted: i=1; AKwUvByyMnEKxSUqKA4wIR1ow3/RNxFbPHJqJzOVcuZBkp3ev1mVCgse6XYKE1kKZkQWA4pDa5PV1N/sx6zs49o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOiIGs+4/k9Tnta7si0BZOA30ZOEbILR/5PjDfAQbKwTP5eOSh
	03OJkxls4LW6qky8s6j2EU7jkakb0QgKyByUjzXZUJrZrzsUuGTtkPmyvw7tRSenxCS6J3XCDqb
	JBX+krF58vM+CrvPTi62f0j2dJtJteH72yqgUID2uk2RZmBcY0rKR64ZZ57h5i7p/BbY=
X-Gm-Gg: AYBFou1H9Wpge0bMkK9tGiWyMnlM2ejy2G93kULPBy7Utp0D+xRA3igQM3qBadTgVbA
	RlBKZ+mWDB/TQhzpyY258DoYpvx81VPDpFEv1rOclmm5hK97GGBY8GnwmfHrhpZVZpyFz9Pjv6/
	j/xIRBp5EcczsZBjaJeBw+Eh8y8zbO5q8w60TvLArTAnd+IDd5enRRmM2mHgS+PaIQwpa+RsEF+
	Zw6bL102Zv0u7RuNcOjKzagJ95DXETKkT30UnqrUyL3lB2v4bzXoPohr1aji8L2aZKQpsVi+idm
	R31HJjfYxWlPNAsTCxZzF+xaTWAx06E1LbFQpJuTB+fWpRgXsav6zTf0Ds4cfR6DuC1BlSSgtqp
	2NgNxsX77IBEPL5vj3QR1py090104pTAhWog=
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3365616eec.16.1792662637520;
        Thu, 22 Oct 2026 02:50:37 -0700 (PDT)
X-Received: by 2002:a05:7300:ff48:b0:368:6e2a:af3b with SMTP id 5a478bee46e88-3686e2ac00cmr3365580eec.16.1792662636961;
        Thu, 22 Oct 2026 02:50:36 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:36 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:45 +0530
Subject: [PATCH v3 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
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
Message-Id: <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=2296;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=WzodycgshZu1zmZaPE3luzfQaJD3tQB9g+hnXzzcEI8=;
 b=4Qb6ct+RTMlJN9XUHeGuiQs/wD4nFaiMZ/8tSqJyLThvnYyeMy2+ICYTPsWXXn4so5/rFjRgJ
 8TB7PomdJ5lBZLYojSQiET/wj8IqXjiJpPE6/vuWXyDgdzKggcI7bk7
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX56XP40VaE/yD
 QxS5RSZryMomxx2BzR2mK+8MiNhqf+wFSXtbyQlUH47kTtWyKv2Xqc0Zi+brl+ZXqSfritj8EJE
 xaIdLWgelqrM57SFkV6JAd6psJr7wuQ3whXH9UsvpaBRvRrbdNvHJx+8Hj5fbOY7Moh2GgAFSVF
 nyQBdSWOatFwp0ZQyIeP24mvJWigMBwOs1yufCDVWhx7wTUrkONQDOIVJQX+1x+yWjjIE/H+v+t
 MXAKT0nvL/J/vLmlW8lGwgvLQZ9YJzrGKNYlyhReeuyMnUhCL8r0PS6+0EcLOgfMkJMIHYgCyeW
 ykK6zzBPHme/iZnsPyt4wZCumaBZRhsOajYqijXIEcqagxxW/hodmm3yMAnxi7E/ZTiIvuRLGKg
 GN92CXa1QY1fQ+Q4YlUgmZVCC+2951OozMIES66kD2jKKP+qPmGnDnYe8si8TaKhd9DubckY1pc
 jEo67YrrMpDtsulixCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX/RCoryQOwVLS
 aQG9ZmqcoD3RcsXofi61q2NxXUKXC6AJkE5H6NmK2cUfyAYidZ2IjxpogYJz0A4+R3e684BCxjF
 /xcOoCoPuWS+xe4+QVFNG42+YIgkPZ0=
X-Proofpoint-GUID: AYQE_-JoiUf5MtMmFlXNGFAbac4z4e53
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9dc6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XqinFhvkQ7oosSToCroA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: AYQE_-JoiUf5MtMmFlXNGFAbac4z4e53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

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


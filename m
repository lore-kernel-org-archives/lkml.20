Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B136DA03
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185113; cv=none; b=A0JySBdd6gqYZLt2DdptYsrjtBImpddNACgAWaaQjms9bRqzCUsk+pWHqnTlwR2g6filllKhaxYCKjmuiU4hn/XOZk1aJZYdzsATGnw1COx8ScjXnReAoXyxIatXrrdV4LWdNxzojOTsiZKAzVWykfaUKaZ7kcPi2GvfajZGQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185113; c=relaxed/simple;
	bh=KE5lnf3g0TLSQwmbAHHp1Q6HH2MqV/4eigAvw1yDbiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU96KP0OeRCUmA4kqOePW4UPqxWt2kZUGFBSql0mJf27Hin7fmos8e99hIwuYkU3i5UaGmyw14PkDxIEf7QprvuFTcRIi7mLs3TSPxWCfzF+cum5d73XqV79vzLaHtGXk8DfN5laVCEGKe8BfB/jfKehH/GClnaegDWUbzNJvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee5kYlp+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF0faBeI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee5kYlp+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF0faBeI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510Iu2930987
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=; b=Ee5kYlp+n6owqe9k
	jdlV79cvLqzu9NGkdwR1YutTxNk63cB9nH68ng7wKa77jcUH6bKSaQDECNOY6OMO
	uW+DExtUiE1iXCSC6WiXKnXd5WZbx8j5DvEuFYntLmkqo2s55VHGOYi+QhLayFRR
	PFKGIBXdn4pvTcMFGGY7lMMWr1+seJ+YUk00oi1PdpfrNRRBy5zvK3/vOi/EEuie
	2LERWJKXjD6+INB2HQg+M0t9lzZTCCsFdHw2bf1hC8Q0K20gz31Mwb5GOINl26cw
	x5tMfCMvlFNTYfIUwd0rBwopHurwchw02gZUS+tS+n3ff2dhBnYR2Pq4IwuZLONI
	e5z8Qw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8vvqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:25:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1449576a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185109; x=1791789909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=;
        b=fF0faBeITUE3zMIBUbJSWgRE9cjKw31n/yGRKnw7yb+4cKD1f0rWeIkelq13iJSn3N
         1JYW8SexUrV7l66pzB567AQ/BAzGFUSonD6SdeE3euXhQT3E9yi16qyZOnjfEVHT+t+A
         H8qqQ33plQBoDuGNvWrTMMSJvVlGuv268julaaI7aDJZ8HHJ+TTIPKb97Xey89Bzbl2b
         BY1cks6Fhp1GFjhbsdbl32FBJMzC/qmN5osQ42XQbOhAXDgpN8Cn4CVYa3hNVMDQ5Ss0
         QwAQuQY3H2/LSA8XVreEzw30Msrt+yfduS03Db4tymr7vVT4gZNc/OxFA9WEYCUZMkwD
         92GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185109; x=1791789909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=;
        b=eZ5QKFewPRWCsqqZP0SYP46gvtXQV2QCXucb8vnW5DA6EAT/BEqsmTpj5vcdT/VxzI
         3rnegsAtO0932HcKkmTAG1dOaHeCuKWJXqRA4c3i6TDTGahf2289hnC+dme1o/1l5xtG
         oRSDmlS1N4NgaQ1dVhhs9CFWlHrxEKmfVALQ+8Zk2/csjO0xo+/lBFmUXz53YosPrHql
         sFAbTrsnuC21OIrOFCZa6n9CZ3+vc3RP4F6fEBU4Tsf8tqhYGGMcqf5jiE50u+ixhze2
         ARsirjvb5lL6bwY+DtvtERJNkmpIwCySWHojoPFw+bL5hsHsy9dO92/EQwwi4N3TGrWu
         y+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHlo/FYuKLbh9AOuBRdodLOLViFW+xovfnhqIz0xanjnXvMirs4MU4tQUpn09EqcVBdeseNayz3rqiiBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6MlWPxpCbh3viG1BnYjzCsYLL7owwG6+117ZGbebuFO/jRncq
	IapbIWs5OIU3MzMq9Gc8LwrApf2BthGnyIKVZqTP3wjSX0U+SKkzr5RviiNymrx+aoXpeAqWuDZ
	SDPezxNAiIceJbnmaEQgIXtzBEZk0boWCBmYSPJoMeN9ECYUYmgdAD24o4MGxcXDlDW8=
X-Gm-Gg: AYBFou1UUyVMQKkgQP2pCuAIlxEfZIaodwq9bPr+hg0aQpgbQ58wbcxkOOxky3Y2voI
	wMO9yVbXRlATL8T49uMyIwRbEd/Kn1xrcs6dlftjMopFhPCyYlq0Y1vPpt4jW9KsWVxWH0b+LUK
	a/jqBZ2rnGBPUCn3Xl4G2V/kTGVLd+FKO59YZXN67cjDi+kQF82fCw00xXlGqH7SxUMm0+yUWkc
	Qnvs8ZCWe/UfuK4iDbT8Dft7/WPHtF9kChEMrqw9ai7nMjxXpNt67NsbrYtWvp0tsqWKIut8GWX
	lOMw8cJ9O2kDmmFetaMf9x8YLVd/y6t57dcgJU4hdVAtYASUGiY+nT+V9tuyB3W+gbk95FaBkZN
	vZi0a2Qg14klsKVgf4RX9cwWq43/i8XsypGk=
X-Received: by 2002:a17:90b:1c02:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a6cec820dcmr5703719a91.38.1791185109417;
        Mon, 05 Oct 2026 00:25:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1c02:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a6cec820dcmr5703702a91.38.1791185108930;
        Mon, 05 Oct 2026 00:25:08 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:08 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:29 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
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
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=2189;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=KE5lnf3g0TLSQwmbAHHp1Q6HH2MqV/4eigAvw1yDbiI=;
 b=WDezgMdLntdbfUe61kUs+X9rKFpWGi9ZUEXyrWzpbOs/TElgATyTbxOCeb1XOwJ2aXO+7gJHL
 jqCBuZoHCf9D1TYqRVSNTMbjYgeiWFX0EwK6oNCH6NopAss9yMF5hC+
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: HLL43oAWlU6Q6zwNOmDuk9uyX-Svana-
X-Proofpoint-ORIG-GUID: HLL43oAWlU6Q6zwNOmDuk9uyX-Svana-
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac350d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XqinFhvkQ7oosSToCroA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX+e5r0FMPjN5l
 +fkH9EIkFpFJ06pxZuiPj7HpLmX5S1DL/vsryTmhMR+e5bXFcmjno0HytfX2AKN1bgTZE2hcMa/
 X7Uk+UuxJEQ0KSWOGQccAUh5SQCbWZo/QjkMZ0eTlg9A0tY28hn2gYclGCJg8dkdafkBZg0MYt3
 BvxekD1x5OoeD2c2BJA96b5VxgcMCyL0t92mKcgZM8FD0i7WFt+Mxi0Q2xdJXehM9621eRRdEe9
 bkrU8AUM9+KbuAtCkfwLnWRLjxHiw+uX8Rh4oboovRSAMdQfhqbfxeP8ur21kfQTLi10V1PeXGS
 fPH4o058b9PWK/loMl2SMgAYgc+GXV+swzAn57h4d9Xylc+kwfzwzKqubW10/V4JPYG4nrTWtX8
 nUqndIpJXlLFglHJ3x0B9HoKDS6cS6okOleLOqgXI3Wi9WOP1wYncdYBFzvtSQISCfxZp9tTSqh
 MXeuCMqqyAdFi0vM4CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX8uvttvEb1aXz
 MpCCs6RWyhldM0sez5WhTHaRQG6oKmTbuUkYKfcV/1qIsaIqo8WGsdf/ibPjIR3iEbZDfXxTSh+
 wivoAtPqNOFcwtMw391EtRvU5DjLizg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

MTP does not have audio jack connected and relies on USB mux (WCD9395).
Add necessary nodes for proper audio headset support along with USB
Type-C accessory mode and orientation.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..16f4dd041649 100644
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
@@ -916,6 +926,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&i2c3 {
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
@@ -1113,6 +1159,11 @@ &pon_resin {
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


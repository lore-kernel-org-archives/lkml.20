Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101819;
	b=fFIPkTQ+p9ARdaYTNu+1ckgVcvmW/TxvS3G6xr4x7CWIA9X8dBIL5SXsXOtfPQ2iXwd7
	 mgNb/p4dIG+fMFam+4Gx++xmQkP/v1nAJHq06aZjvps1rHqf/aqFRbUfCcaAa+iXcgxbn
	 dCbUp2l/aceOfOj5F43GIrrAQt172aJ6PfkO1HmBvuH/UPicQ4xGI9tcvXZp3OfuwSEJJ
	 B/NZk/CvizloBC8v7AMWp+2khFq0SSVuAZ6B1+2Pc15huUOPwjz7xKXPahO3AcCuxwXSV
	 kulzb1u77roMO5qvUam9PovGDpHUpaTCr9ZCtLRqQSL4keFLLPMuh9b1G+igl7W64RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
	b=kAZ6X0P5Peu9JZXvIbLkyPrHY/jxROoMucb9ROGBTalUOd1y5jyC4yi5gS0Ce1D9lUCS
	 wh+xmbHsoQLS9U+Okbb2OEkhoETID/XCx/p0u9ZiKmKmymqoQwYxgyItHfI/AzRZiw1NU
	 XCHwc076G5/hs/fQ893V9tsmyvZE8FySJer3wS0MT1KBdDRS6ZsRZ8A14CCa6HGTCeryb
	 whAEak07W4F8dN/TCK/+rHV5IUPcGJ8ER5//fK4H9oq6dzl4dzlquwxPYjKPmiB3VkGae
	 9cYiWNI8C4TGwARMhxCBGCUHUN07Ku4NwXJb2ZCPEphO0soNtgSfMOnz5yAjNqv3xww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgUl4X0W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvSGCEHD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188360A2617
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0188360A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgUl4X0W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CvSGCEHD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeQdH3013052
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NsQBKEzQfnN
	WopziL09iuqk2cDryGGdJPtk/EU3SsSU=; b=IgUl4X0W9svvbgINhlux/cvxvqI
	G8TRyokGLN/Uy2ObsPZtdf+MUp0QwMlqWdzU7GKuPSG9nkQonoWqt+wSqTSS+6yx
	B1Pw9jjXxYzlsCRDnvnGv5JAM+mWOHr8DY6P3tKyUGCa3y/jkf4wQP9wUqiVo0dK
	lLB07vr7FfKOSlh7QZzsMhYqnjjpML+gPf6nJQvBVPlltGmZOax5ojej/ZUisGQt
	ofnGKmRYi3dsCIpWEd09p4Z03rh8TQX5h9r+xWtH4dfOJCShNsYBKTQ+eYaS0EhB
	76/65mDkpZowtsaIL2137Bp0XYowfzv7rnkT6uE5EHAWftRdgUOLfZz7eJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3daue1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5873093eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101817; x=1793706617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
        b=CvSGCEHDS3oteC2QeSIhTuD3mVwRznSKpEIkqPnG3E6E/h2H82EsOSTRKSlIAWqN8a
         9zIeiNTdZTP7jWYWhuKqVqySjGklluQLBUYKt1Ie/yiOFfeWRHfjtqXueKHThQRjy4cA
         KUI8VI2iWrp7nFebKMFHTIckjlMYEbCcluulJuz8xhVTDAH72J10MNZHGhEyb5c5kO/r
         p2mfMKOEIAyac2yfSYniqjH5af6GTOpZq9HY5fff8+BMxarbNIbytNZeBN/y8t4oMWWy
         9TPIup/vt4MuX9NN+1R56TJ+L0mCToAqS0l0G84Qp76B6v845GC0uXY1CebvIKhHTmJ7
         uU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101817; x=1793706617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsQBKEzQfnNWopziL09iuqk2cDryGGdJPtk/EU3SsSU=;
        b=jowjGZVzJF3Erh6xSW+cv+0T69DdcSQ7Wr9ZRxadQZnJXQhocUlTGfAJIeBtMZpBpw
         qr+zQyjIWbyuEq5aefuosnPJZD6/6sSWEIWCQYdEtw2GPcYIZVtOtyiNx6uAki391lI5
         xkvBv3uK+ewtfOL0i20eGlXodXVRcmVqRBhEup7x2qgKnTW6g0ly+GkNUiVm0zHmi1RH
         V4IZBz8h44nRHDadaqZUDDIuSarjDcb3ydFLOnBb9kOwG65p3d+CGTyBNmThmNYZfEPU
         Egp7GR0b5U9ITQtjzKIRSJ4W3dTKRdjs+/JaQTQBwStBeSEzSMDB/nYEWGKNVCQp77fW
         Ko+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHDITzSKMujq/j5eNPvUdIuGo0u2kNWhWmtFAeIuX+Wgejanzhq/7/X43801Ik1tmGn1xJA/IbI6t4AiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI79AN2FSL+8Z9uH/WCkHFAsiS5n6e/dtZPruRhwbytLQEkARY
	OocVcvp3Z3eLtOexLtCxRYBNlvC6nrXu9Ih1o89t9uXUc9thVmFNETTXhgKEBbpVCvQOKw+BITt
	QUH4mvnc9eCAN/ega35XUNonDr7jOEVuwuwDb+AYlfvvUtepbvm/2h90FbDvUMQC3qjM=
X-Gm-Gg: AYBFou2t103C2qM7wUSyBjODUEzi0KPtQuOHFNfy2aBAD/ADYNYbzDLc2HuWoBSR8OG
	a9yCiPEbfHHMdw8PcrYtgeBjbb9HxZ0EqTai0i1ALZgd6W9E5cxVNr14ZzDOsY4kg8wYrOYDA18
	SakceOArLCy5/+XnjMHmse1MLeff6uciI8vT+Bw8vZ1tI/lWIGawmKEpzkCyKqaS96szgeRoVbM
	+mnHJj/21Kja7v5JpOUATfZzeaTTYM0HAZVW9QlM8KPSRIf2V00iA3mAHD4IMudCX+GOid0/SlJ
	zkSD6LTMzcYODo2dSGSYdR8d/4529bm6/F1LPu4bHJF1owLy0kuBluo+sGquhnb/fhIlqvWFvP3
	2EIZq0pFSWSE7b7guP4gIQh/quDudPkcQ0j3TBYOAOuv8o7yE2Ldcg0daDTD4nTAtSDGGYusxHq
	nr6ymuXjEU18fJUlJp7NyjEg==
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr14599503eec.10.1793101817117;
        Tue, 27 Oct 2026 04:50:17 -0700 (PDT)
X-Received: by 2002:a05:7301:2730:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-369e845b09fmr14599465eec.10.1793101816256;
        Tue, 27 Oct 2026 04:50:16 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:15 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to glymur-qcb.dtsi
Date: Tue, 27 Oct 2026 17:19:54 +0530
Message-ID: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+/rYYyb50j5n
 4yjG5WwGhQsjhxU/AoCHS5gdDcDeA0txNY3sOCktiEWcFYFvL7ikss9LziftI9oPj3USIYKmqRJ
 8p+3uKm+spri7uoNmiRZ6v0rAmx2Ais=
X-Proofpoint-GUID: 0HDkWCjL5dJ5GYNCKPMs1fyZwzFIhvgV
X-Proofpoint-ORIG-GUID: 0HDkWCjL5dJ5GYNCKPMs1fyZwzFIhvgV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+H3393R7OpWN
 OcXJv1AqMAyoL1cG6FYgPd3hE3x/zDN7nHXzK0WNHEZHPxKzV3wmEJB0mqPnE8yQ78KmCLSkAl0
 W4XGDS/vLe79GpKAGNLCTp6x940lLF2+sEGmnJWnzna6VK6jEOIKds5AlVtTGn2tcuBQVmxbrKt
 FGRMkaIZAtBidPJfGvdfe/l1GHiWUDs0SXdBxaSXQFyAsPF0h/9vBETyCfkyFNabnLNVG6mmJUz
 uhMUrdiG5m+KyC0VUDXrYAexIdmg+BFyQpFOSrdtjG7qWjhyJuzHOjgUJAaf55/ObD13CMbZITt
 mz2ruzdZeiKm0rIznqgM/6rLNwRqRu6FkFmDvIDpV/tpwUgUtvvV3iKjjGe0EFvVzYBDcn6Zl4x
 4L9gtfgjZ+Z2T5YL3yTwWluHeKj87ctaxNt2zcTVJZMZjSKygumhLHoDwZwGSAo+TDuOaabzfl8
 NigY9bogl2jfBt/nGhQ==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08ffa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nCfjrMGL1hgxCQ821bEA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

Glymur QCB and Mahua QCB both share common nodes as they use the same
underlying board.
Move all common nodes to glymur-qcb.dtsi file to allow for reuse.

Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts       | 667 +-----------------
 .../qcom/{glymur-qcb.dts => glymur-qcb.dtsi}  |  28 -
 2 files changed, 1 insertion(+), 694 deletions(-)
 copy arch/arm64/boot/dts/qcom/{glymur-qcb.dts => glymur-qcb.dtsi} (94%)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f0ed47adfc2f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -6,557 +6,11 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
-
-#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
-#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
-#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
-#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
-#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
-#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+#include "glymur-qcb.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Glymur QCB";
 	compatible = "qcom,glymur-qcb", "qcom,glymur";
-
-	aliases {
-		serial0 = &uart21;
-		serial1 = &uart14;
-		i2c0 = &i2c0;
-		i2c1 = &i2c4;
-		i2c2 = &i2c5;
-		i2c3 = &i2c9;
-		spi0 = &spi18;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	clocks {
-		xo_board: xo-board {
-			compatible = "fixed-clock";
-			clock-frequency = <38400000>;
-			#clock-cells = <0>;
-		};
-
-		sleep_clk: sleep-clk {
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-			#clock-cells = <0>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&key_vol_up_default>;
-		pinctrl-names = "default";
-
-		key-volume-up {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
-			debounce-interval = <15>;
-			linux,can-disable;
-			wakeup-source;
-		};
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_3p3: regulator-wcn-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wcn_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_wwan: regulator-wwan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WWAN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wwan_reg_en>;
-		pinctrl-names = "default";
-	};
-
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_e0_1p8>;
-		vddaon-supply = <&vreg_l15b_e0_1p8>;
-		vdddig-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
-		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
-
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_wlan_bt_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
-};
-
-&apps_rsc {
-	regulators-0 {
-		compatible = "qcom,pmh0101-rpmh-regulators";
-		qcom,pmic-id = "B_E0";
-
-		vreg_bob1_e0: bob1 {
-			regulator-name = "vreg_bob1_e0";
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <4224000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_bob2_e0: bob2 {
-			regulator-name = "vreg_bob2_e0";
-			regulator-min-microvolt = <2540000>;
-			regulator-max-microvolt = <3600000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
-		};
-
-		vreg_l1b_e0_1p8: ldo1 {
-			regulator-name = "vreg_l1b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_e0_2p9: ldo2 {
-			regulator-name = "vreg_l2b_e0_2p9";
-			regulator-min-microvolt = <2904000>;
-			regulator-max-microvolt = <2904000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_e0_2p79: ldo7 {
-			regulator-name = "vreg_l7b_e0_2p79";
-			regulator-min-microvolt = <2790000>;
-			regulator-max-microvolt = <2792000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_e0_1p50: ldo8 {
-			regulator-name = "vreg_l8b_e0_1p50";
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <1504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_e0_2p7: ldo9 {
-			regulator-name = "vreg_l9b_e0_2p7";
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_e0_1p8: ldo10 {
-			regulator-name = "vreg_l10b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l11b_e0_1p2: ldo11 {
-			regulator-name = "vreg_l11b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_e0_1p14: ldo12 {
-			regulator-name = "vreg_l12b_e0_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_e0_1p8: ldo15 {
-			regulator-name = "vreg_l15b_e0_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_e0_2p4: ldo17 {
-			regulator-name = "vreg_l17b_e0_2p4";
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l18b_e0_1p2: ldo18 {
-			regulator-name = "vreg_l18b_e0_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-1 {
-		compatible = "qcom,pmcx0102-rpmh-regulators";
-		qcom,pmic-id = "C_E1";
-
-		vreg_l1c_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1c_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_e1_1p14: ldo2 {
-			regulator-name = "vreg_l2c_e1_1p14";
-			regulator-min-microvolt = <1144000>;
-			regulator-max-microvolt = <1144000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_e1_0p89: ldo3 {
-			regulator-name = "vreg_l3c_e1_0p89";
-			regulator-min-microvolt = <890000>;
-			regulator-max-microvolt = <980000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4c_e1_0p72: ldo4 {
-			regulator-name = "vreg_l4c_e1_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-2 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E0";
-
-		vreg_s7f_e0_1p32: smps7 {
-			regulator-name = "vreg_s7f_e0_1p32";
-			regulator-min-microvolt = <1320000>;
-			regulator-max-microvolt = <1352000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s8f_e0_0p95: smps8 {
-			regulator-name = "vreg_s8f_e0_0p95";
-			regulator-min-microvolt = <952000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s9f_e0_1p9: smps9 {
-			regulator-name = "vreg_s9f_e0_1p9";
-			regulator-min-microvolt = <1900000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e0_0p82: ldo2 {
-			regulator-name = "vreg_l2f_e0_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_e0_0p72: ldo3 {
-			regulator-name = "vreg_l3f_e0_0p72";
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <720000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e0_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e0_1p08";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-3 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "F_E1";
-
-		vreg_s7f_e1_0p3: smps7 {
-			regulator-name = "vreg_s7f_e1_0p3";
-			regulator-min-microvolt = <300000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f_e1_0p82: ldo1 {
-			regulator-name = "vreg_l1f_e1_0p82";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_e1_0p83: ldo2 {
-			regulator-name = "vreg_l2f_e1_0p83";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4f_e1_1p08: ldo4 {
-			regulator-name = "vreg_l4f_e1_1p08";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	regulators-4 {
-		compatible = "qcom,pmh0110-rpmh-regulators";
-		qcom,pmic-id = "H_E0";
-
-		vreg_l1h_e0_0p89: ldo1 {
-			regulator-name = "vreg_l1h_e0_0p89";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2h_e0_0p72: ldo2 {
-			regulator-name = "vreg_l2h_e0_0p72";
-			regulator-min-microvolt = <832000>;
-			regulator-max-microvolt = <832000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3h_e0_0p32: ldo3 {
-			regulator-name = "vreg_l3h_e0_0p32";
-			regulator-min-microvolt = <320000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4h_e0_1p2: ldo4 {
-			regulator-name = "vreg_l4h_e0_1p2";
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&i2c9 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	embedded-controller@76 {
-		compatible = "qcom,glymur-qcb-ec", "qcom,hamoa-crd-ec";
-		reg = <0x76>;
-
-		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
-
-		pinctrl-0 = <&ec_int_n_default>;
-		pinctrl-names = "default";
-	};
-};
-
-&pcie4 {
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie4_port0 {
-	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
-};
-
-&pcie5 {
-	vddpe-3v3-supply = <&vreg_nvme>;
-
-	pinctrl-0 = <&pcie5_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie5_phy {
-	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
-	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
-
-	status = "okay";
-};
-
-&pcie5_port0 {
-	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-};
-
-&pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
-	pinctrl-0 = <&pcie6_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6_phy {
-	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
-	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
-
-	status = "okay";
-};
-
-&pcie6_port0 {
-	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-};
-
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio14";
-		function = "normal";
-		bias-disable;
-	};
-};
-
-&pmk8850_rtc {
-	qcom,no-alarm;
-	qcom,uefi-rtc-info;
-};
-
-&pon_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/glymur/adsp.mbn",
-			"qcom/glymur/adsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/glymur/cdsp.mbn",
-			"qcom/glymur/cdsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_soccp {
-	firmware-name = "qcom/glymur/soccp.mbn",
-			"qcom/glymur/soccp_dtb.mbn";
 };
 
 &tcsr {
@@ -578,122 +32,3 @@ &tcsr {
 	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
 	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
 };
-
-&tlmm {
-	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
-			       <10 2>, /* OOB UART */
-			       <44 4>; /* Security SPI (TPM) */
-
-	ec_int_n_default: ec-int-n-state {
-		pins = "gpio66";
-		function = "gpio";
-		bias-disable;
-	};
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie5_default: pcie5-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie5_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6_default: pcie6-default-state {
-		clkreq-n-pins {
-			pins = "gpio150";
-			function = "pcie6_clk_req_n";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio149";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio151";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
-		pins = "gpio116", "gpio117";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio94";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wwan_reg_en: wwan-reg-en-state {
-		pins = "gpio246";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
similarity index 94%
copy from arch/arm64/boot/dts/qcom/glymur-qcb.dts
copy to arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 17d8ff3aed23..9751fbcc5f82 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -3,10 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-/dts-v1/;
-
-#include "glymur.dtsi"
-
 #include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
 #include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
 #include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
@@ -15,9 +11,6 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 / {
-	model = "Qualcomm Technologies, Inc. Glymur QCB";
-	compatible = "qcom,glymur-qcb", "qcom,glymur";
-
 	aliases {
 		serial0 = &uart21;
 		serial1 = &uart14;
@@ -424,7 +417,6 @@ vreg_l4h_e0_1p2: ldo4 {
 
 &i2c9 {
 	clock-frequency = <400000>;
-
 	status = "okay";
 
 	embedded-controller@76 {
@@ -559,26 +551,6 @@ &remoteproc_soccp {
 			"qcom/glymur/soccp_dtb.mbn";
 };
 
-&tcsr {
-	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
-	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
-	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
-	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
-	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
-	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
-	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
-};
-
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.43.0


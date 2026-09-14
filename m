Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9988F43F4B5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382727; cv=none; b=bKrhEEjm/+mssTXQJO+YCGL9OZDtc5gY7WbWJFq77PzDSUyOYPvN5D1AEU2X9ql8gQmARoDnIT/05xoV5gxnQJz5cs2BxZf/Yr3SyTsij0ub2XUhbSno5HGCf0BJjJKBwj2ayBm3KBGTRrYyS37Ny3bZbtzH5IEOIXNnGN/tEE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382727; c=relaxed/simple;
	bh=XdpO3Z2xUmJdFM+ZdRqhq/fEc5b7IdIWAfq0+PyGKa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxlFC2R/w4Huv1Yk9wZzCa6EZ6DWE52COXjF0s1Nzx3SDSXpmd3TUbax+5Cr2zgd8ySOZtYMDJ/pStNq0UV/28wQ5bN39UVZRvpVxk5GO+trkmDCMIbelMjMkhFw47PCL5ms/JntmbdYuDBes+uVwgd5cWPLFC9FfJwHiUOOpFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iS9LE7Nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9b7P4cp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iS9LE7Nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9b7P4cp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nnFF085548
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=; b=iS9LE7NfHk3YnP3p
	TReSIzayqNlr3CRnohwYIQdiAIM+TDfA3EKVmmbCz2DdgwOS0hNCQE8muOLJQLq8
	Aryjc6RjrEShwJZxCmBUHujRoEVcvzeV8BcXD+PGbIF2CNYRl2qLwgQHrh4z4yqT
	mU3ZZpj9OKeVTXPHuS6cwa5uJCBzkwZDbSWB5kbi7pHbVLyu9AHaqBN2/3DGUIp8
	ydZQ9IPlyduDdTJzXalV4VWX76AeUbpBiDEZya2FGqiwhRy0dxoZBVgeiuIK2PXI
	2GDhf6quBTNHK/3ZLwSZyWQVDTc2zEeXkjnZzmPK1vuOemomHQk4z/bZvWE/Mxuq
	6pspaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de6tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so200653185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382715; x=1789987515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=;
        b=P9b7P4cp7CLv89yuWcelbWibuRuoSz6wiWWB8YN4rLL+noLXGiX1dWmXiiWmOzdpEx
         oLV3Fpxuy2FsLM9SCwQypSx9TjovIAbmKSYNHzFJYLExAl1+RSCqbyRev6JR7UCz4U7B
         9RFm9UnpaDxQcDWAvQzvgzGvQ3hc896ltAkuWmIVdZ0PryAGxRIvtkAhcV/cT8iG1rWF
         3TwNy/Ilj2Y9NIlp3ASR8jddsUMizifUdyb7/lWRxjWyNhp6Tj+PNIjU3NuV0CB46Uzm
         gPZrymSAq58FEJapPWPxaa4YjEx7qupislObYJdnKgDGjzpxLWqZU7ZTOw2IzcPDOtvr
         DQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382715; x=1789987515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=;
        b=jlLlMOjwHkJ1JDWlsNmVu8CHOc8Rx3NpBae72WjwsMkvy3RqBY0cfykFbKiyqbuV9Z
         OS5wVs8Eo7/c59PcIPKRkrDDtv3ThjWPgmJbVhMQpjbYDfpc3W8p9iil7CPjOxiGkYhn
         CHlPOA0jwfny/9TrjeE331zSLTnBaJnAeNV24f+0sZXmjI+eEZEEJhPiJgrYCuWkz/Zv
         RFObNtKGDJvuJRp334gg/3tAR4mG5Cho1wMt/FO5/mPOspPyEl64lb+BjHqKozM6qisk
         KCutfq6D/GljISKsP+Vvat1ngyPr/jU75+kpjKs5BeBB4QmUFX7M1NNwtc3dIlKM2Cp+
         Wc+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxzThy+AT7qNGBgtWZ0cGsaF8gYvwRiGdmlbBPH02Qj8ugezu+0YMWo0/dmYbIcqMy4M77DVQ/zjLu0awM=@vger.kernel.org
X-Gm-Message-State: AFuF++kXXOylYCt9eluHeL7J3kFkSENgsVVHae7C82xNp1JhSLQ+XxZM
	Hy+SbEmDPumwVQrSRHARiIHjrYvHodhPdM2kjeS92AgQHqxKpe3xY3riIkMOfP7dnIhkODj58YL
	Wla27GaoTSg5skOInZoHiFPD1G3cJv3PmjGwwyp6gEXA0vwtpZpqcun14E5kEONlGPZk=
X-Gm-Gg: AYBFou2JZI/jpgp2r6Ay7e2s64FeTwPCdvLKOeGWi1vtA/omkS/7L0vKPgoe/C+Hicw
	7Wa/wYJgPKRckP0TpBSAUHMlD5w9F18/Uo4MfkWRixw3LxXbubW3KzBCzp4d2cmXWBE3i/ErOS8
	XtlNTA3ot43wRo//tEI1RLRarrJWY5DUyZwOXkqFPOr1UkMi+KuwXwvu2KQ2K0HMI+Nm+NmjXcD
	wmwGYCONOxoTFBQlkx5FvuCDyptm/G/6ljoTH0qV/j+vTKHEtlXQlWx6NXYC2fOREqkNaK3jUjN
	Jzu12kbQ2RX0SmUJQTtIBSvyxQRleQu5X+668sQIsgzyGj9BRP0ONLSb+YOsUsKsFXgmqjAs9aM
	dN14GHvOY
X-Received: by 2002:a05:620a:2547:b0:930:9585:e08e with SMTP id af79cd13be357-93a2976663emr238506085a.10.1789382710071;
        Mon, 14 Sep 2026 03:45:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:930:9585:e08e with SMTP id af79cd13be357-93a2976663emr238499385a.10.1789382709451;
        Mon, 14 Sep 2026 03:45:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:49 +0300
Subject: [PATCH 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-2-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=9155;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XdpO3Z2xUmJdFM+ZdRqhq/fEc5b7IdIWAfq0+PyGKa8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9Arn5qnvDskgtnt6xiIQ6hH0I1dPqXcm9aDS
 +Mxylawk3aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKwAKCRAbX0TJAJUV
 Vk8iEACdz5rNSpF8tzeFYMldzQAaHUu/d7IF5TfC+y0Htxshjsi34sZGknthY1fZxjGrXY7gfIK
 WPbxsQgyHv7zu4aehrDi6seDCQbIkThU/CbMiyXRK7G/Xmyy7cjoEp5/4TzK7g1kge1qsuwb03e
 6AJ906ony0Tif3KnVc5WjfDQcpK+bMhzJFUzAxtWddGBT9JGT1N+d0IgR475XqOW1+GhjeYtbNm
 uBqGROZRbsctkhkzZnCqjcnfPG/uJhpSIsdZKEaHBl61TzJgMirs8Uu47oXjsHg3iHoIyPIQdCj
 H+jyx9HWPbK0IDXrCqQq9VwKC9+4WOwjkMtVp5wH2tmB3yXdr8J4LgBfvc5OTtZFRITqgDz7Q3G
 8Btnd+zAIzOA47qMf6LJ4h2V5xQ9PI2ECP5xC9Q1S9MgYzYTyBVn9RWJby2kr5F97eqDAAdfmho
 S6Wc/4FQGD7D+dag3qQRgdFneCMuixqCl1gj4W9mpbl+6yTClT1LSML+VaqGG+x1PHv3diL6CR2
 6DzBLW05xMAuVFhqJlShQgw3sJS4tFLXouXodV3vj+sjbtYmdZe+25ipf8Eo8VYotkAh4hA+lnl
 JDiqUnDTrtGJdjGj8YsadSFkMhWtqjf0VCuB9jbUwvgcM3Sq935ueigOn905JZ2kZycD2j3eRPq
 m/acXwVq/xnSIFQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX2qTqhK8KwxKW
 TFaphA4JsRBCHQqd7hgphfEd9KJX8DQktrcwstuB8QWASs9rlCQGXRRAZWAe+LJ1P1S8X1Zessz
 PwEehYRDG1vQVhaFxB6UmGoNJUR74AWg/fbJYgtQP/WAcC0Mt9LMCrL9YJsxlNuuBN/8UKLhGKy
 gd1jXSbQstISLpw5KGnoFK3QY1oacOQsz4h3LRy4Q/1ZBY0bLxcWrEXbaWvzo/1T7Y1mNMVbIXY
 duyNqfyuHk+t5MN+g/twG7L0cpbLOhbJ9P2/ilTZS8l8Mff/XxBpXZjSMQGijmnf24k4iILzR8F
 VDMBex34q5KB0aK2zyaO3Me4uSH9GslT7+OlqazyGykJMuWGJbqij7+4lpD5qlqcohrh66IoYXL
 btJMUTpqMCHslRSV9cgmBC0YPmahn6RD6aI35mTrTMtjRr2D1Nj0x3sW7oBTmz5EFy8UPubO04Z
 HtnaDrmAwx7ymM+EWxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX82Y/uLhUgB+V
 dQCywABfInqB9SVzVEcPmGHV7H9Sfy2sLNDpFPf0yaHahMgmcOaSo0bTIgEWp2wFwhOK1nDd6gt
 VrdFx97T+Ap8ORdaM8yo2YMSePOENB0=
X-Proofpoint-GUID: kzKmaJsEtnrNiyo4m06-m1kE0RssHEoO
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d03b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kzKmaJsEtnrNiyo4m06-m1kE0RssHEoO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

The sound card support is the same across all variants of the Eliza
EVK. That means we can reuse it even for Eliza CQM EVK later.

So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
implementation.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 -----------------------------
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 139 ++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..43d428a4ed2d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,151 +5,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-
-	sound {
-		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
-		model = "eliza-cqs-evk";
-
-		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA_SPK2 OUT",
-				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb",
-				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb",
-				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb",
-				"VA DMIC6", "vdd-micb",
-				"VA DMIC7", "vdd-micb";
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	dmic_eldo: regulator-dmic-eldo {
-		compatible = "regulator-fixed";
-		regulator-name = "dmic-eldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
-		    <&dmic45_default>, <&dmic67_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&dmic_eldo>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Speaker Left */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Speaker Right */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio59";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio79";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..726fd8dd6c0d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 / {
 	aliases {
 		serial0 = &uart13;
@@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
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
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -94,6 +145,16 @@ vreg_pcie_m_3p3: regulator-3p3 {
 		enable-active-high;
 	};
 
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
 	connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
@@ -148,6 +209,15 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -197,12 +267,81 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie1 {

-- 
2.54.0


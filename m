Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EE74AD4AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473832; cv=none; b=T/fYS8WfBCrA0qzcJB1PyDOhmscB8Hug+HzFLKpBPC/9MVxchY38mDz9wpqq2KLJyPrMHHRDDhXbgRexGwUrp/Q2bgJFyDWH1Xo495HGerGP/ttR5VwueDQ2tBLGVzfuEQMsDAOG6QGKko+e9It/T8amMa7jHc9xgG+FNHqaJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473832; c=relaxed/simple;
	bh=XdpO3Z2xUmJdFM+ZdRqhq/fEc5b7IdIWAfq0+PyGKa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szRRdkAyMYzHZ0DVB+WgROI7Q3evgOhY55AleeaL9wk2pSR5dBCCl2RqJ6IUIcO0gP/1+g6BlyergVwSWmBW5X5KOVNYrEAgEEfxP0krw2EqMmFZc29fIasPPUIW6aZuwsNskO+F/Io2PQvNAbNqlEwhNDJk71hmetSwWudQsis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdkrFv8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1YloXZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdkrFv8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1YloXZU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hK192675051
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=; b=pdkrFv8H71SwJT/0
	G52FU9XILStYUHLXUh815blzKihMS8IlY153O0Fr/U3WQ+ygvCAtF/MI8eWE+RXg
	IVB5YwuyhYWFYNJIUGTKg0piYzdytKT3jyUWSpa5a5X78AYSWpBMloHFJQ9rePDB
	d9L0yKG/D73Mq3AKz13RiYHhTNolDcdt+u/vk6KAJtkebie5a0CG0f5nEABi6/MS
	mGzso4pYCOJ7Stu5liMr8o21qXuKF7lSWEeyNkg/xNAOwRUCGoWnWRjMeEOc3Dw2
	3cB8mwezfHQ+CdQzLZbtbN+SvmBCMNbNcHP+eUFzhVYP1OMraG2543pnMActxrO9
	gpV1lQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71q7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c964739454so4021126e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473829; x=1790078629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=;
        b=J1YloXZUKiOdXrIfxJMMI2emZJowE/jjtsOZ1gmKtq+6b82jHHwE2tsGLhJ+0Cfwrw
         X3wBIeCN7v8YyhppCzhTqXuxlWVyR3tBHVTxxMUvkbL/Kl02vSI6CihwQVHIvLYLhbBL
         plWW+ELWcGL+sD0McuOOWl38GM6I59/6YkDIsNuIMBMO2Z5mSRzRyD/6Od1XUYioybLC
         TDLUvq1X9c4y2TooDM4VQ2IiD4Lo+SNwhPIbVun4RsVNv3+bqvQNOpmUucm+zYyN8O2h
         FBWfWD93xg4+VV0f5fJtBHstjzVnMbfpnmzM0hJe4NApAR2fzLs2u+0ZwkJfJn+iS/B9
         gpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473829; x=1790078629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkOdbvW+Q0lsaHaJYviFKORWfLA9pndfUSMwld9SLqM=;
        b=XqvaaVmMPWNPXVHFrQyTyYdwwhklacnY37VHFX8T19QJ8gq1vdNrcxg854GG+otx6G
         VF/k9mIStDPUZMq+VC2St4ICzO8oaAy7xHUy3AqcyMAigxTHlKj7PS53594HsGRPkLL/
         maF6SBz43sbHztt5Wal9ErGNB4nIhXAi8PO+Kqsp/SlL79O+ZgYZLRNClfUPjPlZU7KK
         hf4+1NXlkeuhBXKpTz6KZwAC2X9Lu5SUtagppL/pXoD9MFl9QP0Jj7WezvQOBAB1pSt7
         NYsIpI9D+BgEx3Nx5zzdQ94vlXTx4RyFWZmS/NESdGtcYSBiHFH8yyKYo64jyvRjPX8Q
         ZCxg==
X-Forwarded-Encrypted: i=1; AKwUvBxpuiauHZMsF39q3brzS9cXAgF8OXXcUbfeuoLs+yZ4BeKRlLif/Xgr2PuI38CgYeLrDgzscmkbv9M9kZs=@vger.kernel.org
X-Gm-Message-State: AFuF++ka95lrHZrLTIznze0ddEfsgLrzGq2LVhJzFDqDnhBF50eIoPVB
	PVP/fO5hHLCaFGBSkV3Y/mWlOlWVp82zkjxyxeE+zaYm0RSYoNToglcfLiIlcAL3bUFzar6bQJM
	1DiN9tsBAuBUmGW0AlTXw2NnTaOvcQ+lszxRtzB/4WDdTPmy3K1u4uqOXiL9F6AiHvC8=
X-Gm-Gg: AYBFou2ZM0dPYNMwfMPl9S9qS2VB3GEy2lf2/felzlyN5AASrIY5nIz6UZLUVGTsqPl
	6dzZlJ8SfWX/DAH/m3VFUgJ5IZw3GmmOEnVTjyw+hpUsjOceGqGJkPQRPxDF0QMoB0c5oEwZjb8
	dNzj2Mm3YkHpDKYQkV80Og+19VFGtSrDtjfAFncZlj0eqHmuFZVhzxhqqmAFbYkAgmNpVS+O6oU
	RiU8IHadKLren+i3TmbxLbwAIj9OE/aycqrm2cApRHDfGhUvHEAyNiJXdSGorIPcVnLXmB9Vjjv
	S40M3gzVBMQdBYspwdd/x2G8SDVftixoFQQ00Q1eVbPfES/FEP71llkMowsMsrEkO9vxLIa+CF1
	uP/470GE=
X-Received: by 2002:a05:6122:130c:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c981883794mr4278117e0c.0.1789473828346;
        Tue, 15 Sep 2026 05:03:48 -0700 (PDT)
X-Received: by 2002:a05:6122:130c:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c981883794mr4278085e0c.0.1789473827710;
        Tue, 15 Sep 2026 05:03:47 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:28 +0300
Subject: [PATCH v2 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-2-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=9155;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XdpO3Z2xUmJdFM+ZdRqhq/fEc5b7IdIWAfq0+PyGKa8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQXqT4g7yggOwjC5xS965QTu/UQDlwsNbdOh
 RAAhEzFxSaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0FwAKCRAbX0TJAJUV
 VmWsEACRnOwYRQuzByAqXB2DpBPXc9bIkcq18nm2IiQaeWqhfDcZQqEj7xqV3v+A3yz9qm+u3IP
 58wdqxWutyKC3KWlSw6p1+1POrrsc6LMGV987CInzppRiqSiJNhGFfVPR1DzKsCQgS5wkqIXQ2o
 9e4znoSs2PYhTrDNQm7bHRsjEi4ob67AhYyqGFbCwG0TYSHH4RD28dINjc6mhU2yoESYdM9DlnQ
 flUIuWOV5r1gr0FYeFDzoEs3M0k/a0EJOI9fzFnbsdKJm7Gh40wpVc7G3wdZKXscJsdEu+36U2F
 AKUKKAyXmGp6iUA3DG6wmn5U2BOAGBK4PGyCtBXPUGxn4gSO9UeKMryPxBL8r+TJ+pgMiXp9aO1
 Wumk45h3y+vSquS4t9/SSzCferdHy+CVoM5DARpj31k2+Hl4s47OqT/p8SVYN2Jg7SsfPYlVfcX
 UbfMsxmXAcTsIIEyyCBkFD4nnbyDPl3Nl0HVjVkfRzBvzMeszealfppLVTbdvGaKZTTf+4X7eJh
 +K8CUAzfNPdWNfWjvpgwxRLjnCWTNUHwxPiLXWghqvgk6OWVyc7BfPUXpqe6SLDwx7BcST42qJV
 d9Sx5ZMYOyviMehc8dGeQiAkMggYsVlz+OXWLACqkjVKsShKeYFdBBwZDWQbi77XYQMYRlzHQpR
 /WaUjyZkq0zo27w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX3ltXOOPEHhLa
 YJArr63KHTcjrV8DKAu8vh/vucYGGUkEO/a+wXRB3hgnv7mbw5tILzjjhUbwCHmvj/Jwc0JcCOd
 AO2F0xWUvopz1vdTDlxoniN4VAJCaRIjDPsi7rt0aOirhr8LEkn9lhmSjf8W4aUZaiH3sTcL9Af
 tyoe3s+fGBQ7OhYSCCe6v9ndRq7XtdTpJCJRZTz08YHNhc9ZF9EAp/iHwLYcftr3jDYuYKDpW2I
 j46+AtGp1WGs4toYI5Hob7Mdfa6J7Pa+YHOE5Nbudhbjni04pnwKOdCCgNJuGD69zJYXO+FNY/A
 lTacou2v7J1a1sqmEXdd+Kpui8DHsJ8cdTXHbyEa3VIaKuU67cB6EHK4FzOSdNNA3+hLwCov7fc
 dWtJSg2zqCPSs1hpElOAC8Gi6MYzuSHzSVCw5XLtMuIEjH3JvgHJRv0A2GTMb/qldm9uMazzdFj
 ES4bVIp7CoOWoMdtZOA==
X-Proofpoint-GUID: x_qnEiXC_I-aCaVGEqK-Nhdd6Y2Wr3H7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX45otO1Dfh1zm
 SvllqVt8IwAUQWwBmU8dQt4lCprgmpe/g3n/VvGG+zoPPJryhzuJOrTkDXQjfofN2DbiDIp2n2g
 unRo2Phms/tJ9SjTlUgs8RT350iipEU=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa93425 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: x_qnEiXC_I-aCaVGEqK-Nhdd6Y2Wr3H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

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


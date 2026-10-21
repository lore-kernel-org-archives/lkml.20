Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549893;
	b=xN0ai3/iOBiROi4Sb5QoC0VB2L4iDWtnDPOgzMP4RzxDNyht9jdeHVATzq3AlbnUKxuf
	 PTFS39VFAHImcpVpC6XBU557p0nVIB7YdjGAsQDP8TIBMKFg12dBTPLANGCKPIdFGeQLf
	 sqCEXLddJ6QHaVX9Vuuq0XwDD/StuxgFzVaWD9YrXiwuUnIVbLmgXbxDS804+DTi9LJpv
	 wpMPMyTgglwjpUEy2wyQSUxUCmy0woxmJKvdhHaV6yxDmugTP21AZYzmzC4yzSDmae7eJ
	 RxnTVjA7qqbECjaR7EHOW0ybojWsdVZzVTC4AilrRYtOxa+Fy9eXlvtj+Af6Fd7qQSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Un1pGjKGNNKj41G5ZOV16dPzScaidHWzzI4IFMjr1Ps=;
	b=BfsP80W8Vpu3nVUJAnKujCzB/bv5NQXWB9d0NesLrd1FGpTtjfqSW34wi1U1XEeeMhba
	 HRKitk2YdGi6dP92ksjTq1IXnL3kFGtHXv4CqtCR8gM6m3XuqpKtMu6hXrATL/XLt5J4M
	 SCS6FMHI8YBE/mYy2ppVXJGfU6KcCJUo8d/mVngnd7SmtehQlbDH8/Mpla+Qh8p5W4p7B
	 pESIcXUTApZvLSSyuVa/Q3ZE1f485bGIP3cGCNAnSCHbhmzZ3RA3X20d0fDXYb5/xAUc8
	 44Qu3VhKtDS/9YWV1bohv6uPlvi9BXmntndaHzv0vlNc6IXkNk4afxE4+3HMwi0vL3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iipCdvxD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhWG944z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63747606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63747606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iipCdvxD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dhWG944z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FB9G3116136
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Un1pGjKGNNK
	j41G5ZOV16dPzScaidHWzzI4IFMjr1Ps=; b=iipCdvxDk4cla4p6ybGxi/d58pw
	SKDM65LDuivSjmm4gkVE1HLXLRNvZqoF90WO5u4sBeIucIEbAEh8Ufua5Rqb/IsU
	seYClnhRHjaqAzPn73/uTcvpmZ7MeDyz0GLZQEZmAT76ou9PXn5inZiV6b2DBzgv
	gFtkyFB/ku9JHAlGjFDjLoONkx8+8wCCq7yMf5WFyvH58UfPm2BvIOH2veAvJkw7
	vDmfFn0/Dwi0FShrLEd72Xgd9SpXx8W0fcFRHVUFBYsWfptLXhC/jfI9pe3F+Yd/
	Iiny4zqbgZrsprDQcczirtoFMrj/Zhz6H3LMUBa/CZdDUDJm+pNO1I8KGTA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hsjm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so266336c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549891; x=1793154691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un1pGjKGNNKj41G5ZOV16dPzScaidHWzzI4IFMjr1Ps=;
        b=dhWG944zY/cf7ZlBttFamcuZlu85joPfUmQXSRrGNGhiVrnI9LCX7Gro+N2Up8nzQO
         c/n0cg+0PeSD935AZWw3EAEY+zbB5vK+lHlhKwA9C2/mW3o1x0+KHKu7uqp7NydYqi31
         ywPIpDEudt8JwlXYy23uNGNWnEiaU9djWoEiIs1wEg8BzGPfwV4RWmtwxVv8QG5faF+V
         NswXelslvruBPMy2vWtFq5v8nRe4bFrWLkoR7X7ugefAR9lMumviENf7oTpKKvZQvRUC
         wVQlTbe2z+BH0QceRBPaP38qmqsDJv9NoYhkH6YHWKafz2vu+SHTZUar6hspvK1olHJa
         flgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549891; x=1793154691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Un1pGjKGNNKj41G5ZOV16dPzScaidHWzzI4IFMjr1Ps=;
        b=bGhLhwDipzUQgD8ROEQ1LFfE5F0Kezg1m2sT/uS1OSfuObU/K8s+riFVbtYGOPF2ao
         5EIQatJq3m//47YS+M/bhhBd6nLLZPGZFZY9Ugzf6S/tMc6QpAgpNJnl1bhlBTwElwg5
         YyyKMg0BE4v4UipgbNKI4tNco6uplqdG7lh4/cidUACUJaQ88H7AtHjkkcQNN2JxUHuE
         CmSS1/WBJYiZQ/mX6AJC2vDJ4KdBuRVN9vRB874h0AXWkfea5IoGmgqnE5f4Tu7nVNAS
         b8RbgGVmFbboqGduaQ3FXPJmEAhuhNc2zmptwNVtXfERWkvtOzg23s8NyTNdQ6iqrwTG
         7e+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSOtXVoEdsmqJ6mP3Ntd4s5Mo33Xv0CjTh/JL22rkpNJW12sefpdq4ZEc7bsppUsHp+N8rht57KFFC1I0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBuibKFUQhYLHwM3s30MNnIn0RQXKqLzmoxtGXxspMY9Fa6d/f
	6Ldn7qaAfqB9tq1nnFRrbYrFN7UXKJ5ylrH3Ok0Z/6I9875T9HFHD8JMb1YoQTg1Gn5mOsBIZE3
	v3wSzqcuDKU7OqMpNTtcQ2ANN3BAqgccSLWJ1p21dCTjcfzc9morg0ujustMRxFimb6E=
X-Gm-Gg: AYBFou2PUFfAB8U7HASBr6U1W5cNuw6ahS+6osnClhtMQu7ZQ9y+WPT5/TnU6P4u/pu
	vu/bw0qPUSegFxrNXhJcOvQnoNVyzgDiZ052KdN7sijhpd3jeCplbCXQbI94wtXxuvrK3FDyFVi
	jZNHuDycQOgj6oRxa0oN9VVx/g9NlV7IiSq0wUTGF8FKLSLzpvXIWXbvp0fLXnUbeHnEai/K8Lh
	xBTtDdgqnWbmeoWJe423BZeFyGdnRLNae2nRp0XO52+7bg0oS2N4CTqCpvy065miyDxxTJlmBGn
	CqKOC3Zf7UGD834eD2vZajPxmPvJgg4uWBFEdgxjHETnKqG2z6qY0M5Wxb2Jhq09v4pCADqA2f4
	sgnAgiAlfvdwDAPiRl6orF0UpoSwPdtD25kWiCFkgt9dbKpQ/SGa1ohlEdu8=
X-Received: by 2002:a05:7022:1703:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-190a109fdb6mr822825c88.1.1792549891020;
        Tue, 20 Oct 2026 19:31:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1703:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-190a109fdb6mr822797c88.1.1792549890496;
        Tue, 20 Oct 2026 19:31:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Wed, 21 Oct 2026 10:29:19 +0800
Message-ID: <20261021022921.2053957-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad82404 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXw/bQp/jty9k9
 yuXuXbCEJItxj4OokSE6JFp/onuP8pV02PjrVemZAAQ0XX3Qa4kDUlIAZ0VoKoApn9wDDyet+r8
 HUR3mqJ18rTIKK7y6xgsHeCw6TLcx+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfXxkqZ+XRGMH8B
 ZUOuVDWdNysFXV9gEGLGQppW0fEKMbWzNHnwm+OPEs5WvdD64omhGNM/m6T502/SuMnCVdvlp15
 Itv8k/6z0rLT4Pd98/IheDjP67bSx3KmGod/L8SV6IDJGv03FIC38INV5+bXFwfjno9xniyPZph
 Ls0IinRjF7naxgzzDIsejziovTu/kL1cDjop714GthGiBXTvLUBKQpBAdKqBth7Y+GBSmNsDqJD
 g/m9SERq7hWxKcAHylVSNByvYzgS7XqCNA01Iv0MvFHwPfdGsrSqz+fv5/vRxnLS6fZ1Xg6AILd
 GFiBPALjMlDCzIFbUBQYhhKBrfNBNtwS4vW1g9+Ncsdpg6tQ5XGv5wCRvU9XWUqufNi75KbdN+X
 /Cx86N4B3QFy3EPddKxcEKlbX8y6r7XrHjWp49B8Ys/xQ24N8z6FXD+S3mb4WJYSlle+98lWxtY
 eJejvFq+IL7toPf6aNg==
X-Proofpoint-GUID: Uhe7CY8nhEAJ862-ICtuxcjwOT0PMaum
X-Proofpoint-ORIG-GUID: Uhe7CY8nhEAJ862-ICtuxcjwOT0PMaum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210009

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index fcc07226db8b..916f583b882a 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,102 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_1p9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+		gpio = <&pmau0102_e_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_1p9>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -404,6 +500,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0


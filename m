Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956905;
	b=t7c9SGErFJp6F/xc2iIywq4VE54ruIB+gHpIgXKXooKw26Z0NEUA/uyscgIILqEk7KCr
	 uiRAZWVuc789CFzcSYGb9ekTZudLegu9qGPFY1p2UasPRgN9+O4TCSi512Zg0zksOIUAq
	 hSJ9lqo6MNDEwNzVQPCOedOO0wxaREEenoG8uTH1RU+S/aKFlnfKM2TNYgcHsfQQDYctz
	 Ryb8mj00KkECWs+8wMhnfdHn9QG0fdqHtyeuPM0dlnBjccbcnQg5WuBNva19wxLwgVzqU
	 QiG1w3R1RxigF2fqbbeKBlVn7WtPUjkoUCxIN1xt2mQbpTViAMfeZc0KCisM3rpNmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
	b=vUnbxtg9lg2eOepcFq8+j8LJo4KW4B3oK4+tY70v/VH8Iyyey8BHM8A8eZMzaE9VWVc7
	 dG4fGlyOSLaeQoHpYS97yUwCvM1U6/vEwG8/5jiZdgHEq4WMGJnLmoMMQpMzmxpGaDWJS
	 yTeEru0A6Lmv2e/PawkgND4g68v5J7AoqckH7WZMcTlhauKqR76+3GuAB5uJQvcSefsEk
	 wBpft7qsJ98o0vVnhxngIWdnXnj3sZbkkoBgGKFfjP7vd7yQ0voHr1TpZA9BCu6RhgN4z
	 2T5gEZdX51Gjx2+zo9QqTxi6jq39sEEwZ7EKG7vOVcVA/kGktbFML1IdV/7cUXjezvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dQrslJm/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72069606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72069606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KBUCcxMr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQrslJm/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R5Zv129121
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=; b=KBUCcxMr5OIIdkyL
	/+gwZfiQPxczSmrKTVYd4jUbWYwCac5YWycGO4cvjD+PuLQ19Atkn1xOi6pOuPG3
	6mgJKf3ZWejknQ6JOgiHqDurVEqE/WxzYORaEBS1B93o+ArbJkn0uxtumzJlXJEl
	8qLdHU6NCBWtdV4zs2B1z2qHbGBk9klVVbCkiP36J4TIT9wGV6uRNySYd0kvQYYb
	SnB7E9pFzSSno6osfRgg0ejhvTOrGKq2k9MFlB4xroB5kKYuEIRSM7EBmHGxEe5C
	WIhzLvOCHQ5jesi7BVEvlfWD3LwM0zfe4Aa2OZGKweSi93bqsxdd6KnFAVoX1IYI
	2kAaGQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t3g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso1022211eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956903; x=1794561703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=dQrslJm/IfQRtFCCrngErIp+B+jB1LwBTFSS12mQMeoPPf1bHXEr3Z/eq1OtuCklAB
         O15Pq+ZjamokzU/H++IhxFZw9EcMZsxGrffBpDO5f3AdoQINSXmssYwxnR2pA7S7XWRT
         P1ZMx987OT3V8wGD0hOOt4rKWQTAiS8yBXzzs/gXNHV7ZQET+B85wiiIK/b0fvC8uBOc
         FhhtYURmnJcj/Y74wamUJ5YLADV+GDVbl26bUk4o7OZO/OvsrmNcFW0aGLiAh1tdi52E
         /6iVaN0Mqb5QirsqWHr89S+yhtW5OqnBxi+zrVS6ovGh6CohOE4Nw1sdeyEMWkSOuxcB
         zCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956903; x=1794561703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rP1/r7b/pvpgdNOEdu0xAKkoUAc990HQcT7IHBRIcTU=;
        b=zRUcSYiOKEabncCwT9fllrr2Ut2gKv+Ayj8peAvxWq+uo7ehhvXaIMvKWw5LXvQhVJ
         A+8ZIyaOHKBctaFUYeR5ZCHN/wjwDiJ5kja9755jF6cX2dU3mC9xhQ4kFdV55NgEkgdI
         OivkfHFJzgDxcKOmOQxaBX3cwd08Nj09Kw+tnTJZhx8qJvxQShA6i++m6kmFwpHRSDUH
         9U6wNLTIanY+bqPBmTUFWpo++lhws7Xd+8casK7NbQ16D3c1DYRrSpxOgW2qUMPccA6H
         ZjXr7QKapKLLX3ecAI6iEU+lO2yIM7Vr0yyAYOF1vBEQvFJtMhxIupOCFXCSivqSMt7a
         G0ow==
X-Forwarded-Encrypted: i=1; AKwUvBz4YkI0xZeSnj/bFelAyqgTJyxyiyQUO73TDJsqZzc5oGiWVwzutiT4/oqcYN2VMOHgMzO8SickslxdO3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T1ccoh+fmpmQ1Ptxf9xTZBulGO0ncRd7L70zhRhKpoUzs7xGV
	MOzjHq8TzjZRDBfEX69b3VipQkaTPLh3QJj2fgQfgh2MQ98EVFj/BoW77jqRxcyRGK0XVmBK8EF
	kmkdmDqqPR7addCEbRlPn1HqBgC2F7FSEEawAn5mY2Ujnl1TMzNvQVxM1ApgYHEe89iU=
X-Gm-Gg: AYBFou2XGOCD3K2f7gwe+KBVO32cW3OM7N6QMQ5DMvvrugFsxNpD+X21gGGrhvFvv1J
	aBIb59NgoOfsX4WTtIuiQIAHvzOY+3OGn9//3/dmtlrywmPdrQSneEk1vqE9+r7pKcU8kvn8Ikk
	bIHuncbIUnUr/uavEtpH0F0XrzNFSGZRA5NPswuRmFvwoZitPsvoZ+EXuOTd3gF67Kf5wNAFzxY
	+sJlGZjcSl2hfvpoghKLq1LwCdR2gWNeHV5kcMuiSg1o7i9oFqUmK+0WcBwwvdJslSv11Dz7YDB
	fzQLFTiRpz9UJ8ej/jtEl2Xv5S8PVB3FQD3EewNvgEuMVIZvaRMsMSJ6XdP6SkTNLiFm5VIyXtm
	GisMeQVjB8OGcDOFDRAZpaCfcCv3wB35o8c1rv1v9Wo6TTPm09JlyrT8oSuC0V89zkjB2j63/Rk
	h+Z0pSLqDTukeeH6lq6We9AQxGEIE6Un0TmYxX6GdG5KbWbYjpf00LhH9FhXCFp1995Jj4hsIaE
	+Jyaw==
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490541eec.20.1793956902784;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr2490514eec.20.1793956902256;
        Fri, 06 Nov 2026 01:21:42 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:41 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:57 +0530
Subject: [PATCH v8 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261106-08-dts-v8-8-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX52nL93jtf27f
 IwEkcb9Xsx+cvRCXSjGwVh32LRLPETCi6ER90qtx8I1yzyDdqjFnpVdONH5vWgEHHoa0jup0L2X
 /iB8IO/qDvlOmyQAczXUVPgbktuoFMc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/2mHltXd/OGX
 sploHri/0UAfJkC9fg4btPsHb5lpi6X7CCLI0I0slIbGuy1CVtP7g7PTnfUdCcb3LkZv+3PJCii
 dZN5c6ySCOdd8HzL0K+ewto8y+csiJ42Bn2jIhBobpoPSu8WrleMikh5EVw6om2hdJy2n/cm1I7
 9eC5b137I1P1x4yB2bSlvZ0bN49n1le/aA8z7W6l1X1NpdrB7a7kv4PkQ1zbxVV5BJl5DU67dHm
 ZppRf7NBjM+gnjSO3aI71XJStn4EToqcJoI94e5J5cOMKz6GRU51+vouEoFkU4i+lvIBWQxenlq
 qaoaIGx3Pb38cZJWcgSEmaAQ5YKiQfe79wYoLPi8nA/2Q5aalmoUefejpfMjR61McHj8z/Xa93J
 osL8Pb1iK0DAfhk4PNNSQFmFT0rUSI4+A29icFxXvwdE3pcYoSRjcE0AwkXMa/Jrw/aRa7AhezD
 i785yYy/MJk06BH9EWg==
X-Proofpoint-ORIG-GUID: oa0W0PFUeJ65Sf9bvJ43jPWJp1bVBE_8
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed9c27 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: oa0W0PFUeJ65Sf9bvJ43jPWJp1bVBE_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 422e2766478a..b32daa7c1559 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,11 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+};
+
 &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
@@ -156,6 +161,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index de3504395c48..e4a696a65e55 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -406,6 +406,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "okay";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1


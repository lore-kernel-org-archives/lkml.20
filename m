Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549898;
	b=QAOuFdvRkoZq996kaw/WP9x4U2iDC1wS2z+7c93SbiR0Dl0lH4ct3vMHM4p3HjsNwG+l
	 D1TJYd2WG2V3aPLD7SmKeHgdzlUlh36BtHavvwoOAjXBvfpk1/aoDX+OhEi1BJVHXVlZq
	 I11G2u/5fwVLA9p/9Xv63tu0eZ/tFUzlzTv0l6OO4FW4KGwulwNzgehqC4x8oQcYs1ANb
	 8tHZUSkMk5L3RchNAR0WCw9uk2aST9u551A4OFPWkkHB5MbJaUioPRChkRzxCd5nauztX
	 OhelrP2bRi22rMoScZPtddsETxP4+8FetaTmr/oRfgCdpg9F3odhDKGVpdd9R/NEe1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
	b=AuTl9pc8LEAoOeJExhP+WdFiyf7FDDZIIqGqDTPNyWy4EgSYX5JSLkq+EOSzA6sg/7bt
	 2bIWP23sEE1c14ec3q9kiXRqLSFI5tW/18p3zSQNG6iu93DBFmYWfPcsc+b1oYl9cA6AL
	 HRWQup72lehw2d9lFMs8VOx38n2YXuCjdEp/SrqcpPNrm45d6upijZhXuSRlaKg/tLZki
	 Ezg+E2h0hrLqFdsAgORWxlgdMaaV/v3ZupUwHftJgDJeHiXp3Kj/dMFxF9OmVqeEtxOFk
	 SEB83yzdzrvzJiXJj+egJGMXXbwgMGmmMJx7swkl5jhpfSL8X6FybgVVjqAcfNeTeLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrgVbMGW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD974606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD974606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MyGxdhF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CrgVbMGW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2F2LB2898057
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IPf7L65c7m+
	+ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=; b=MyGxdhF+osJcze3FTvgc7H3l8SW
	2fjo0VMd6xBtn5a1GtgOf5QFJQbE01LybwCVu2uQYDClZo7uODH/UuSQU4Xr6Pel
	jBIYY9aIVNtHpZq3iwpc4O4k4uV+Rpb/MYKo/c97mMt3v/0O5Sx65ADytrgW5KxZ
	pgCb0J1iQEDqTkRspCLCoCUrGFVmlunvNqLNjgD4Xuz0YTpG0ySB1HbhV7ykcFQh
	0nLIF6kxkWp5KUlt1Rur07CStr9DVsApVbUwAsfDCoAt6nm4ytS9sZ9BuOvzyds+
	jblu0gCpD47J3ibV+fGPwtt5LTWOAzghSXfMouiCsVyk+elsagtOruf0XZw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0hk65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so177716c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792549897; x=1793154697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=CrgVbMGWGXKgjWK65YOeFDS2aSlJ5DQJpgt5T0e5fC3M6rkQWm+Lf29OWPY0EmvG6I
         mf1NTtmXePZTbGSNxwZEBlziLHCB7qfp79nWHlQ27ldQFvNXx8Cx3OLoqVCCAT52jFM7
         05bwt+3Kyl2HO36csIjY8392I9zpb1ZDC5OAosgA/J3z+U3riPHv5m/rZ+KKwOvV3yDy
         mp4M2UOzzaArCyAjWx9dysBfZf3n9rFGDQOghUR8lPWcoqek6ZvlQibw/Fv3cBGYANl3
         AhnBQoto/HdjMxjLqpbg/nuuBCFInwGyfxBxXL0ptvDj/p5XZFNVj99UGUGXbN6Cr+Re
         grvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792549897; x=1793154697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPf7L65c7m++ph0yay7QXokNG5R3RgcbIuZvJZ5kiCg=;
        b=SCE0MAdC7KvJHVBem2W9SyNMIr3KqcbfafWr1S7+Z++QgOhWYQYkTyehu7wCPUJaio
         ppsY1HL1UxtpxJPfil3vTtKdGbG5HzUdGlx6q9TqiGcuezxYZtkUSyXQfNO48V/YGHUG
         1jH42YT4aYrHQmY9Gfz2byh6AsVlZmMx/YaIvm6tUfP34lDmLMYGcCO4l2/DTg+SqS3C
         UnJPYuOssTJUAPWulWwz1sIbMcBFv7kDtFuJdz6N+2OiAzqQ14irADNL40hK/IZC5TaA
         wsqo0hc9sDvAfih/HdGZMAnQ0tIOmt6qn8MRKnmxfac0fjbJRbJab1LHHLmKNjNQLAW7
         k5Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzuzvhQmQ/WPlAtTfh04SO8Acg4GJwWm0ogsdBMGYYmz7fWFZb5Ejeknku0tqOVN5rSRAvoOokbIPrDLsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVzJBAUz1hU2tCk8NBssG9VYb7qrwulVdulYZGppZvQhmQG/PV
	eW7K03QOIMhL0OStsjaOejDnzQVN1E3chlSwIEx2BjUZe3BJ/rzqPgpDaKG4sRESn5vwl+8Ptc1
	GowG8qyxssYy72egfXwZpGxZYdzyqAI9S2D3gm0KZRoI49xS1CrncvE3mOZWlIuItha4yR1yVZX
	Xy9A==
X-Gm-Gg: AYBFou0Xx8LeBWWe9yzCHHUO+Zo0ku185PdniFek0UA4C9Gnq111JbYhxLmRdSEtrOP
	HyCKTMy/A3gb6UlGK8wVag0wviPJA4YjUDF6H67ubTA2FwnIrkXQWXBeG+kG3MSf29OeV1O1M1/
	Nj4yUgbRjReIzpqjRO1F+E97D10CH8Wg01wK12wF7NdMsm4uKByBYACieBKClhiTouxxRygBK5R
	P47/R0G7r1SAf3jaYUP4DYHd2L+Y10Ebr/XhBjwkvwdFB/OMo8osL2J2aD/XiMQDKWNgmUdw4Im
	DFJqId9MfLaXth4itifeZL7UrXDpRhHTK9mhJcsy3tUSB8Kd1tb8ZoxQ+hTKRfQeMkAVP83iwsA
	3G7AgPACMoGh07aJ95IeI1NhG8nf/ul/78WmYx1ieR9QwMhXZFv2N4eS1QYQ=
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934623c88.45.1792549896480;
        Tue, 20 Oct 2026 19:31:36 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:166:847c:f162 with SMTP id a92af1059eb24-190a8a84d84mr934602c88.45.1792549895958;
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm2395108c88.22.2026.10.20.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:31:35 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 5/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Wed, 21 Oct 2026 10:29:20 +0800
Message-ID: <20261021022921.2053957-6-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX3Mv0EaTOO+OF
 K9JxqAjAPzw+cqHPBzyXbJbUsrgaFazZ+01a1UdPDUoPQXZNVh38Ai5lRSev5IrLetUlBbaq4aW
 9YiZinUO/JwzJjOewhzKe4A41KCe596Jm53TKJsxg8qu4pQbWJTgck3TlTMKJLgX0E6nVq/z+g5
 4fOzZjHit6e27RWypNi55JZ0Kjtgo5GyVKV5eD4wfVtn850Zb6sW9rYa9ZeXo3KVUDvIgtrQ5be
 pp5wOfOOWBr98nmGPxlxF7mDCMneUZnu94Snvv8KAvRH7kaTEJ29re8HYAAqOunxIxgsuS3wNOU
 iyPJeNO4v3w7u8BNwfuebjIaiL/bTokQyCXPRd0hLPZg8/0adUfUm/tLaXvKvpioRMXtkCfjhBr
 /Z9MK4otGzs7vlTscHYkzZJay8JaPxh1yW4e0AiIAl6+5F0Mh5kBJwejW2cnU8MW/uQA3VSS8/g
 XsQMYa5KHGtfJkb5v1g==
X-Proofpoint-ORIG-GUID: d3za0kN9w9vKumIsG891pArdjE3kVV-c
X-Proofpoint-GUID: d3za0kN9w9vKumIsG891pArdjE3kVV-c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAwOSBTYWx0ZWRfX1QQDTo72pMls
 2QXKA6VD7rv9Du3p8buyB5gsXXEFLcZRiBVIkJDnkgHkgSPXoTbGj5lse4zha8Y36JhkMN2lycP
 bo38jWnGEmyGvfBU/NBqoeKmALAPjsI=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad82409 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210009

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 916f583b882a..6dc405ed7ef5 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -583,6 +585,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0


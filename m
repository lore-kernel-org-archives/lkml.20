Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383537;
	b=mi/Ddl6UM2Ty/Jy5qyNGbbOrPZsS0zGkODDijrQSxQRh2HCBQrurVBiFaEb1yIBdeGki
	 Y1H+ersg/Ka+MeZLWK4mouTvu/5+xLoTRxizgUUqwEidNotB6iEPHjM8ZNvHQbcj+Iuqv
	 dwW7auHX80VGFkP/p7uTOv5wG+Mvx8BrJUPLsK5Xq+juJ/vErFh4z6rqxQA++Pts61y/h
	 Y37gTJtTMGIiYh6mOm7qZMYaCbT62TLHceX26sPrQXE3tuS00iMZ5vuW9yPd/GOMrkl/i
	 LhiO2JzewsSTTRJcOzXK8GE7MmgsX9P7t4Gua03+YVRWUZcaIG7n0qd5nGE5x1m9i1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
	b=xU37Txub8HOM8FJwuu24b49vfGwr3oF50Iaf3UnDaGjd+n7vuZvyBDk/f53snD5DB5RU
	 nSw9yEF7/ErxYyjqUKy+1ZEKEbMH63WrraIW7mIcE7U/MsSfZgiLc2I30g5zWoSt8GSNA
	 FfiRiuonJLVr4DAWnz1msRnb3VtptZ2wu51H/cjrEYkL1Fke6+8Q7+eFBX61GnZLQ4UBE
	 sXBqOrP7d0GpHnct4QEQItFWG6QzKsVriKN4GwCiNscAOYv7AOgNw4S/M0BWUQScb0KBT
	 ol1K/jxGq4SbCRTzMNIihwvRbDIGvCYNIbHVXlhnd3E17mZjG1zrzgWgK2/WG46V5lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oxPVj4CA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsWj7l1G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5260A2637
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C5260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oxPVj4CA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MsWj7l1G
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOeI1590025
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QzPcCIEIvOS
	8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=; b=oxPVj4CA7NK0DuzgQl6YYAVLxCt
	9PPv6pJW+pv2Fyu4SlGSJEuxDIYM/PbwDMhTJZYpvWo0kHnfqMT+6gZGZndd8Mf7
	4lAG/MzVa9F5F+BVtPXliX2Avw+ulLWyzUJ4KfxwSOIuC7Vp4myU+ZVjDNPkhWZC
	JP2nMEoH/vPYj9SxaGH6lAPPhUZXOWEIQH6S2xc7S+0fzLGwFG37bnzZjwWzuid7
	BQPX8VnxJrc/IrQ3cPWD1Ej/HaJOceUir6x9Bvh/KL4rgJFi0IO7kbhpkYuDzPkN
	d9lUSKox+iMdppFAOoTGs24Ju7t6u3mSJFx6pZYPVPzeeeLe7Lm8sXngs5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm84rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:52:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5820267eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383536; x=1794988336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=MsWj7l1GbDfmmm4uSEmQvadA6enM38yOR9sGTdh95lPObu3GiXiA4jw50oqFPGDniy
         nK8fkP5bktyri0EKJeXbLHGQJiVryIg2JoO2vnjTL0i8vyStNM081r1pQR2jbLx11UV2
         b14AsmSnQO8xyKqW7fE5kcHwazpXWqFPmhPp5B9mUUUM4faIhNVhJC1RDvmo/hAE4HUE
         ZkAGQ5W3JOfliCSI6gIlDik4QmuqX6tdM+GpcEoKmBUzIm2qn9SmDCZ6CJs3Lnw2AnDr
         Mklzsj65ojT2IE/RcvBiEgI4VqTqJ1mMGRtp450K+33GKrM1+1ktAPZB3hVp20DVgq6h
         PCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383536; x=1794988336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzPcCIEIvOS8LjNhd6RsAaUljwaKhmmfkIvxR6vsypY=;
        b=BeC/2/cQAVya9n19BKoEs4HuJ4fVmsGLzLOLcYidES/boZajWJ0ln8JDg0Bld0zWQW
         3r2FByOSGKaKxooXAeqq7WJrvdtr07v3hn9RlnYwv8B+KRGIVZrLVK65VVRNrnEmo1Of
         uLpf4nCfNBA6EMeA8raMEp31I8SlAZfgF/D7o66sxeD++aBNN83RnfSfM1hTnqNot36/
         Su7b4m9520l/GW0bo6r5jSDjSotAdLwKN6HCr7X1OLvIq9C7SH0iDYT97nnCn2YGSCR2
         NJUYQFhJV3BjA2oiJf6nt8ZjqvYb7M9hShDKndwXzD68odcfkVezlP1ksS1D1+MDjUoU
         caGw==
X-Forwarded-Encrypted: i=1; AL+hErF+C0biI/jXLkSdY0bbeVODWKbCQpqwth5YTeYCBtHBsJBPT1mhfaWDilRFGvnxB3SYeky3xsyhh+GwNRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A8kxrujvVhmXnOFjzdtqDp8NRqZZi/FpKUbROAhLsf8KR5y8Z
	iYJpaUkevmEB+DgD+CE/kYW+ykKatMiow3p9OYJNb7fvW/poadIkX7XqJ8r5bUfDxbjjwZp/c1W
	XAON6EDTB7GxWVMNLIOoNmr5nfEIrSHpLhWyAQdSChVZbDkldlmzmmnhrYoZd1VzSWvM=
X-Gm-Gg: AYBFou3ZGlDOia5H4xRQYPaAY+K8ndGD45WQn2U1ICeu4I55M8nanMJ48W4BIzs1XHh
	qktMCqRTsDL1Has4js0diUyJrhvdvAWaJHpcKuzMYWlI1U4jrUtTb6hMGTQfTFdnSdaWc+V7+S4
	wsT3PrkS9FRhonyrZp/7M+JMeHHlBbvJWPBZnp9SX9xqtSWB6O8frso9yGpsr1VHWd0en+J1aSv
	Z9BUaIzRKfjFxAxetfRBPvW+Hs6GnFgmcSKgCZMT/Eg7hF5JRfJ9RIpfSB5ViTawmkdO4IZfTXw
	tR+O4qBxMqKKmrodWfSGJFH37dWB4406YZHldOZ3Ba2q3jLHhXyskWoKLQd8dSoSLyIZ/mHVx0t
	dGjB6l0S18W2bXxM1Pc6OzbBzzmsVruyYPnruPyirPm45mPwuVOvU4LRAkzbYyk29fLtf3fSMbw
	Mt7n7TinfnAH1y4bQsuCD0fWksLQlEjcO2
X-Received: by 2002:a05:693c:41da:10b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37685d700d2mr2304684eec.22.1794383535767;
        Tue, 10 Nov 2026 23:52:15 -0800 (PST)
X-Received: by 2002:a05:693c:41da:10b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37685d700d2mr2304645eec.22.1794383535028;
        Tue, 10 Nov 2026 23:52:15 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:14 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v5 4/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Wed, 11 Nov 2026 15:51:38 +0800
Message-ID: <20261111075141.3710366-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: knbFHKK7k5TVt3RcEcqIsOKmeyDn835q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX9yiS3iYWTPyE
 0SE++DwUTGeM6EMUL/ifNo9ifnkXGjdbt3r53bylqskad9R7onhg0XFnDwwRkqxt2ZHfDWqCSmE
 NxPlib2yVB3yarX44lU8RPwXTL0koYRtrTMJz3nSuJuyn1AzLVU2NWicwGKMm6ugzpsG4/DDsB7
 qrWmkqGe4q9bl6jBesQwblJNOXnp4L+HmqjqgptxBCRqtSSYjSInAsp150kH1FpVUJeMK8Y8jPt
 S+3YktgbzMHByNdz8FmBuBDbn8pVmfYKjaqJGZD7vKuE0QpqVz5sIgCDbEq5L10Z9phK9gzJ5+i
 O3p23K/o5UNKpRxoYg8ffEhf4tNe9e0kkHkbedjbNd+x8yQ+u8huLOu5vLH/90sIuAlQiw7la4E
 tslpTTpfY8hIHg7zbwhLGBLIQbUw/I+0AIDCDb/uG1Oep1ysRl98vcSPlY7cQgqADXlm9vxaj9G
 1YFK7uVTBU4nz+Q4fhA==
X-Proofpoint-ORIG-GUID: knbFHKK7k5TVt3RcEcqIsOKmeyDn835q
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af41eb0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fkhy3qLzDainn0cAaKQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX2is44DOB2ZMP
 3PTMAE3t4iCzxgePcFQ3fkvzPPYx8vyfkVoJyLg0vfURZKlc95oj+A7eX+fSikX90ufGTW1JN5k
 HjK5cPBJS5RhG7wYbXQny4pXlkbEI44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

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
index cf760ec41727..a9adbbd75878 100644
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


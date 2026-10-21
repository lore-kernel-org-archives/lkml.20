Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561108;
	b=owW8vQmWYdSPWZcC1Y9uSVLi2QP3GzdKxHpOSE1tS0cORKHqhFU/rwCZBGoWlmJQnzyP
	 JyI4YStfzCHlOOY64ilul8ghyn7Umso5B8rRmEMe9BaNa/8i652Ra8cw3vr2gvIFdJcoC
	 N5FQYR2NGUaKhuO6bzAtMRSpnvIepa/cCS3Ml8xk6HawmqPNujSDCEw9uxW0ZUd4q+pta
	 HKypPEnWOtfdMPJEzdO4q1/+NdwI+yZtVBa4sAONZwuVdbFi7TwSmbxPT8SlKik0/XH9w
	 ZtQ1xs6HCiCMwFMNaRG3G7+dNDMfiWFoiA/PcYUofE4w2FSTuHoknB0FM4WyhNc8Crg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
	b=2R9mmBZVBU+V3rgC1cuvAsLW/6VA0TWVCUiO3y7HSQ3+wTBdYem1E9sl4VqFYrKDLyEF
	 6vrkp5gRphBLIEvFn5LxeWoVDWpLJmvpC9+1uT4GU53kt9ylUgczHCqZGu4rhNQsSM2o1
	 CzHCEqllh34wUejtvqKIflI04JdQPO0MFtiw/wyhw2IcTVReZ13bVkirTR/tJ7Sh14/vC
	 k+ZFrqBExRsRMk30CfPpmFcnHxwlxaaFls6OF7NkfcVRMnl/atneNFe6fUEfz8Tk0546o
	 cNOD/GeTqxaaxW8HRCDiACS0ZMJ+fPBXI4SaB6pArA0wlO6D+Y5RYPbK8GzGHD0YEfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHzDQCAg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCfTrg8T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6697606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6697606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHzDQCAg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CCfTrg8T
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2FD4b2392487
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnEZFbptyf7UjxQ2XRHIENyN
	Vr3NaUlUd7vT/Jo1tl8=; b=QHzDQCAgXqWT7ejg19CeX0Lc176N0Dz5qMy5ut1s
	Q1Z504jw7O8loCumWMAY9PGsgOdHUcBlvjOo0ALJEaBjb1xcLzGwbD2oAFZ+txTA
	CS42PRvAZDAym0/A/QIY4evjSqT2gS3tdjmBvbM9bHhduwmRtoQMjP2EdsZ3sSBj
	rqeH34XOTDCU9X5kdCB5TT2Q+OcBXJeYV30w1RN3MqQT9lugQKACmxnzWOIpaKox
	tvSOxwq3SJiVrSsHZ7GdVeDI5Ap/799JGWX1Khmf9bDRV0VG0gTR88gvrA5+1nzl
	TlVGSkb8uOmlLEzmJ7c8cc6ySDivdFyx24At65Xh0p0wgg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99xkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:38:26 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so568770c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561105; x=1793165905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
        b=CCfTrg8THRoVUsMvE8MN6fcjYL+DPlFxhzGg5neaciuZgkIAAWO9o7ZISWqJjvb6K9
         Tgi99ZjsXgmvfHu6VDRlHGdq8eHh7roKtKjaQ3zMFSgDZbIw9Tc3PmnfGRGT/hxlIbxE
         W/z2+0h6e9T6Nph65yszlzVZj2YUXm+9+4Q9zgss2CAQJ6Y57Yuqv7rIynM0T153cAsj
         XTvYyRz5MPuFagIaq3BA7ZTMBmwSPtjRYWJxxytrIjCESJ4j/Z3DtcLc0fWgjsAzNd6K
         Q3CjnNJowzt05D/f5UBwy8AXYuU93mxbpW8ZKgoUTwn5ioouC564DMfwmAEhQXUvRQXL
         DCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561105; x=1793165905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnEZFbptyf7UjxQ2XRHIENyNVr3NaUlUd7vT/Jo1tl8=;
        b=o4f4JR+OFVrtQnRyywszaHgWe6xAdTFmH3RQtbpWXp6xVeo6GZ5qaK+OQCH4CgV61m
         fBdfIVnYq0JhCsTgAl4ytBq2SiltmM0+BKKZPqHZSTKa1cYkHmbTc2ctYs/avyz+emGq
         P1+dhphrobCTCCCp9/41Tm+AJfimc1HXu5rPcmbKemizVs1xo78yaZ9jxJ3Eor340cYd
         vxAwySwMQHz+qYfNSqhgLZ8pEFtNIViGYaBgaeFsQyebxM/gfQxbQn8LDXTFUadWdzya
         B+iBO8KyElC/eiqlVPJlUEz+TUfQJS5WUNeStJGaAZDCK3rpZIwOUK4dVyH9LSfz1qpv
         w6aA==
X-Forwarded-Encrypted: i=1; AKwUvBxMnA1/rZwNefBCyPRofhF8evT2aowZEMNWaDN46f8B+u/k7/YRcht108iSYBiQ5bFhGhjJ+Dg2mHM2ZGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPjgGC5ORGLWMxgOW03jb4hlqDwG1coNguH+kTGesdS6qEBgMk
	bX79rPd/qWBsf1oQDHeuZMyLWKIem1W9+783RE25uu535cbTesD++kACk6T+s9NCqZdVaXurCL0
	FExB6tBDV7dQxcdBNS7SLNw/BaBjeU7sxvjFtNhUmaOnVCvknlnHn08/UvKVVOpSjWcAw3eGadC
	Q=
X-Gm-Gg: AYBFou0I/z34UgQIGWJz/LcLe3w8CFjw9WMVdfVXbIRdBLBGtVj3tmqNGU+rKIYxcvA
	dI0zG/rLBFi/PD/EF1mwyKT/V/XrHNlbQb9+HPrfB30e0EMQ1l4rZprPfoTpXRSlUo9xo3PO1NO
	aZ8MAKgOiUOgvRUm5eJegbP7CEGdMaA+SaPcdYICLrTsvjLTAFgg5xzGgYLMYwiJeOMHlp400rz
	cT1/wHDBErdVYTncYVMaQP9IeTC0QwdNCKOoWhsw90uysWWgsv/WuyHtqugD8SIJbqU4OSlAoW9
	owqWajh353m/1sMPymIiSIOaclmVYOycLIIUBeLaJarg8d9p++zUMOHuKPDFxxaD+dSvtAejnx1
	Db8OdTIiJaAQMsqq0nYxXn8DKsFjvBkLDdtZU7xTGQqvlo6tirHaMv7UabdzVYKwNbPCpDsVjgc
	ZBxzUkSKo/AupNxLhI8ccMpABoCmItyw==
X-Received: by 2002:a05:7022:6ba6:b0:16a:1fa:58cb with SMTP id a92af1059eb24-190a051e33emr1828672c88.1.1792561105159;
        Tue, 20 Oct 2026 22:38:25 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba6:b0:16a:1fa:58cb with SMTP id a92af1059eb24-190a051e33emr1828623c88.1.1792561104341;
        Tue, 20 Oct 2026 22:38:24 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm3449053c88.17.2026.10.20.22.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:38:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:08:16 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0e04jeNFWWxIqaY/"
Content-Disposition: inline
In-Reply-To: <20261017-calm-tangerine-marmot-2e8bfc@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXwHKmsbIxwWCT
 FBYqGQdedMcjUQQ9MP4H+IlgWlwCYsT0xnY4FTtrQD4xfQ3IYzv1xnmYMpzy1sPTF5hQUSmGrdz
 2Y1fqCcgKpKttR1J0KG4YtIt49SSrD0=
X-Proofpoint-GUID: 7bADe-rN-1rOHWG6du-iHZxTAvd2KZLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMSBTYWx0ZWRfXyfob80mMStZh
 hpxvCy/YMJ3M6qFtale1XnK/bzgD39hAYXAk6HQ5WYU+atBGvRd8UYgfwougaipKWQXTRjrE/bQ
 Irn6oaBHiYG8H38RP+YuNHuVIWdeNh2uCQNEgAmhPP7E3Um0Z8k1l927s1M5gbimAlybzoWWemY
 eeeka3tZHUIi7Q6Duozgf2QdEgefNrZ6DXWF7x+utlFMnKBI1zvoEVdPef0yqpjqPnI2UaHMCl5
 UDLOEswomanSjxJHMEvURB5BFYJtPmqCCcyBdC6LGak0ZQHEUOaxzaEjFpk5JBQ8AemYU/ow5qJ
 1j7AbS/kNgMIgmWCz46E26cEpvm7KDybsusZD7I7mvwNhxbmNvOsDekKrZdanNvbNmcZoALOYf8
 TLb/VgbZeeuNqZMKZY6i0ymPFZrJCMsVZsM/oeJrrPCHEo+Hzr0BPWW7admjH3GmCCWkS7kbi/W
 vqEibMg4K6BaK/J2jjw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad84fd2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=01MFGdCsChwvBfu0fykA:9 a=CjuIK1q_8ugA:10 a=GVWKzDYot3hTMZ8E5o4A:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 7bADe-rN-1rOHWG6du-iHZxTAvd2KZLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210021


--0e04jeNFWWxIqaY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> > The OPP table node-name pattern also matches peripheral OPP tables on
> > supported SoCs. However, it only handles Qualcomm CPU and level OPP
> > compatibles, causing unevaluatedProperties errors for generic
> > operating-points-v2 tables.
>
> But the select should not select them. How can I reproduce the issue?

Sorry for the delay, it was a long weekend here.

With the attached patch, I get the following error.

$ make LLVM=-18 ARCH=arm64 CHECK_DTBS=1 qcom/ipq5210-rdp504.dtb
[...]
  DTC [C] arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb
arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: / (qcom,ipq5210-rdp504): opp-table-qup32mhz: Unevaluated properties are not allowed ('compatible', 'opp-32000000' were unexpected)
        from schema $id: http://devicetree.org/schemas/cpufreq/qcom-cpufreq-nvmem.yaml

Thanks
Varada

--0e04jeNFWWxIqaY/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-arm64-dts-qcom-ipq5210-Add-I2C-nodes.patch"

From d207f72fc23fb328aa2c3cbe1f98780667f7bf10 Mon Sep 17 00:00:00 2001
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:24:54 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5210: Add I2C nodes

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../boot/dts/qcom/ipq5210-rdp504-common.dtsi  | 16 +++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi         | 47 +++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index b32daa7c1559..8068dd0d2119 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -191,6 +198,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6842ac21e05f..80050845f965 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -160,6 +160,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -435,6 +443,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {
-- 
2.34.1


--0e04jeNFWWxIqaY/--

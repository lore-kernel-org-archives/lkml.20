Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736371;
	b=QgjcmoxTwHJAunUyPhdk7Mj9ElR0ug0IMPmsIOwlR4eS2vTOcpyXwCaQQBpm4fM1IarR
	 /kapNGfJZa4VT2gbXpVIqEnwEJVmqSdF7dx0IxfYL3JfKAVBsTZcqx6Ytb5gE1EAxx4Xh
	 MSwgOt52b5wmsCh6B2ZbvwJ+rposLVsTfnXJLM5F9ZhVwh7X8GLfIHVO26JVXnLrd75TX
	 zhLdsmR3vJuzb550Fsib3pHyXi6UPaRcv/Wn+PgYf93M2JRTKZlIrNMnTddurfAWiQoOv
	 M+3HPlNQiz1AGXDUppGDodF/iezrFNEJX/7EleqQY80v2CzA384bnXtfempLUFpFTeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
	b=hiAqTvbcVhdHs7cpQRtluxgLG2VG7ynYlvl6egfLm3VS41LZQPLvvmKU8BTUF6MpIj12
	 kOjL981ubHAHnY8NeMukxW7YfZZxow4B1bfHCCCzLe+y7KadJobRBT+cuAXhaBb7hfujN
	 ajqS+s1vPfpUdwz20+EcSiV7ZwEGHZ+CRdaaK4mU4fcod/QgevnpVwtueDPwQr8Lo1A78
	 K2zVNeTTzV379AtlIFbJrAVdEGMu642nMZ2npMiHVPSlDzmZDOOE5mCtwSHZsEwaTuWED
	 JOXgYtxcEcEBk3xwlKJ72340eTGQcTOJu4Li/6jPuOQaG8PbsNUqz3sdi0BsnJKmouQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5atOivh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZMkR+lQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C1F606D81C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C1F606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5atOivh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kZMkR+lQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Ippvg3153481
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 20:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=; b=U5atOivhH0SCsF8p
	09cGvJAJjRrz0knPc5pgRbX0oaj/2bBHnowv8XNLNs8FDWWPX0Dff8M7pVzNl6Ks
	E7qKXloiU0AqyE1iVemen0q0/a+T+Z3nuVaBUEPj4zccq9sfq4LLyK7fcEDpiqi7
	nyO7e0FEhlUj9vg6sb8Jxt9EK/8AwLUn/SO9x2BS9s6AAEl7S37jj9nWIsjGrjbV
	juJMHQBm0DHWoQcVAEGCoLNpHx589Zo0CrxfJBbpROCMI/yIXIXV5T4+p/WAsP6O
	B69Mp3vOen+qeV9BG/2LtadSHz7WY5hXUVyF7APL4yhVZOtXuMw3tvsmwEJuoJU4
	HYsn9w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y08ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:06:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf08dc2fc8so984009137.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736369; x=1794341169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=kZMkR+lQgpZmCRRf8GSJ3eoWIgypwrpsxBRrFbn/iuLt9RHUDQjU92YhMnqvVZfIkP
         IJ7rAUBly3G3hh0gEWch6Mv0GZ4yw9Ei4iRRq0oibUDQdq0qEhA6bR/aaYVRxrIUPFzA
         j3FnWT5SzwCWMBrtZaAGMBNU4jOX7lXlgGA1SGJhT+w7OWR1W0O63lE6A2/iW1V7FJrc
         /lKNfcooyjJEXWDiAo/KlDoqc2gBtWpm0WcYUDrpfsXJILaFoZTOpZhbIRQyPxmq97Qa
         BUy6R98cQ6Bx85I5NdDt9oRsdkVtd3LhAPsZiJp+B7M9OkpvVjrk2shsOybAaiR6DztU
         061w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736369; x=1794341169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i3zCYKlwVyXIoRDbAyxopCOyrLllPYMgSlhQAZy5Ic=;
        b=PrrOUOfmpOS5Q0E+HTxsjM89wCHKwIe1mk+CRjzEVZfLbtMj1gTeJGDXZy1+mDsFAW
         2L/b43PGcST4CM8NB/Ed1/gAaYmEsVbv0tJDo6REnVMPxZNVBoMafEIZ5IFzqoF9gB24
         siLsWwF31EsWkNOhmeyA60K91oXb3f4P42HiI83n5RiMi5//BhtC3EV9Vw5f3QzEPyC6
         lgwzvmH9X+hB9/NjvRGBCsFkV1v64wd3GtYe2Wm5y9zCgnMLF80wdSvqsDCvsCycgGfQ
         sRQkQltGVV+FdZqh6CIN17HH/wJq8+g6TSzgPmk+JmtiDy7IympkDLtIvBKx7G/zF6Wb
         h6rw==
X-Forwarded-Encrypted: i=1; AKwUvBwsL8pSyMl2j0xh9vx3ps8UCCFYuawuQeBkQK8GT30LqPaaqh9Rk0QQTnY4LmUgKykbZJeG3Is52HVwYxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZeFas1K1gnfEBLQRFJOltSTDu1dL2pKbPWOoey1aSSYcCz25g
	DSAe+dyBcTPIE+np1kaT1SEGtsIepdnfrYRf6/hOjkcwoZxeh1ofsUXYvoUMX7sMfCRuXrweaXV
	3oHZR+TD71Ki/UJGnXKKrmrcZZO235eKze9TqQOtOsKgYSVPBKKfKj862KOpTxXbvJY/etDySAW
	he3w==
X-Gm-Gg: AYBFou1K+zgr1qPh24xAyWy3xohfUP3btO6XqrwKLwfNbO8lM+hC8nyvE8jEjKDbRu5
	KazCGxbJqpo7k1NXAv7DycGs7Kc7w2YXhRlUVQdf7ER+dHM0q90he3T3rdZDyNVuJ+R5jSobGH9
	vNts1F2THpq//QqGsOscLThkmCer/gLuJoj6UQTYJVvOoKudaEvDP16T1gmQZypSwwiEWB+SyXA
	ZgWAhUA4yNOsQA+Iiu2tmDKk3/vsFB4D3fPpTJ5Q0M2U/jAu4dVeOHH9JYKEdc9HnSqzus02Xgg
	2XBkIARfwKSK+HbpaupbulgdPyFFkea9A3z2w/r9kmTtFo6J8dzDOQ13Xyc6cPuHR+ySA0Pw0Jp
	948sUDXhQ3IGmXcGX2hSG+JM6RliNQ4TzRVFIGgTnup9lGclHpUaIVzQ5emkSQIX5+LlC6Pc5zo
	YnF/Crwou2XcUgvUhZjz4kwMWNqh79Doc/kK+wpAGnlbdw/is3RMiQp5JnfJRLCWm4blsKgmF5Y
	1hwHaslr4IQWtYfft3KoWHH9gNb
X-Received: by 2002:a05:6102:3eca:b0:7d0:5688:f4f3 with SMTP id ada2fe7eead31-7d072775d68mr4767616137.1.1793736369079;
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
X-Received: by 2002:a05:6102:3eca:b0:7d0:5688:f4f3 with SMTP id ada2fe7eead31-7d072775d68mr4767598137.1.1793736368516;
        Tue, 03 Nov 2026 12:06:08 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:07 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:52 +0100
Subject: [PATCH v13 8/9] arm64: dts: qcom: shikra: Add OPE node
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
Message-Id: <20261103-camss-isp-ope-v13-8-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: o6nhNkAnk_SApo439008V0x7alP3Apu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX7M5K+aD8qodw
 IO24og3KUsKFp7WE/41PxmPzgsHztSCcJKT3aAFDBLcSpJfSqBRYXsRUTYMDGPA82HYhWDOh9u+
 vPGWB3451e1qdvJu0KlGCho+ub6l4ouU6f7lpDGPCxrPhnFuUlfgbH3uWYHHYaIb0P4i2gYL8ed
 AYL4i6EZHg5pAHtPKthcJBrBic+uiIdw/TG8wkSUPL34QBtMWk7Qh8JaivItKwJ1IF0JhB5Q9+d
 nHvDmBG/Js6J2vEYsB0Vd94LzVePkrsEjH3eImMzX2BmGcaZm0rzttLSJLuJbRvZwauvNw3HIqb
 F3ql8+urIGy2BxjLlmHpkVbDyfqk09MdtNCZX2QQ7oBIUEAmcvCpHW7yV06uPZRAty2gvCYp6vp
 DL4JS39Vo3fKDOtfblspnVu9d4wagqhDM2VqhQISx6ZtL0CCP9cYLSArUiipnReIq2sSnartgZ4
 SsWbWVzrsuiy3mmPDrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXzYR/6gXrWnBK
 EZjoPLJcpbiNUI8ZOGXXJSBRApB7fD8j/W9SNFwoYfBA9fwFs9a3wwKsh62ph9vZq9kSFfMPftD
 5Xjgb6Nj3JP9kzLdkKbUW/QeT42betg=
X-Proofpoint-ORIG-GUID: o6nhNkAnk_SApo439008V0x7alP3Apu1
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aea3eb2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add the Offline Processing Engine (OPE) device tree node for Shikra.
The node describes the six register regions (cdm, top, qos, pipeline,
bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Shikra boards.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..b95ad1e61b9b4ecd29a1b7b7fb0c2c52ce31a967 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2357,6 +2357,83 @@ cci_i2c1: i2c-bus@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,shikra-camss-ope", "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x600 0x0>,
+				 <&apps_smmu 0x620 0x0>,
+				 <&apps_smmu 0x640 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd RPMPD_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1


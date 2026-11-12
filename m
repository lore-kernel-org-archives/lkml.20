Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458210;
	b=LHSf50pLbMcGvPRE960PY7vb8NDr1VgEMHkOLpNcJaD0ASmy7vGgxMmhu7xXGxJsSiUE
	 ZF4sreIMIn4UBTr+P61UZVHbpEoylsGN58ExtHbTAeWbp6P+VFz2S3F6dVrGyJ92MoUQi
	 fc4af2/oiAVo7AyNPPsymd/54MjLwvDNQ4+d20Wnd33gOqkOjFuERcbYpPsOpDIIh0xKZ
	 dciv3OyUvAo6OXZlEBorqWrBE+UwTlqsQE3NSPo0pxUh0BLUJw4lUrSEcqqp6/UHq5GZg
	 JqzkEt2R1xSsKDbEwjFrpc8vhE9Mc9RMqYqllyoeeuZY5JHDKuDaGrivR+i5hUhiGJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
	b=fodl5UHSwMFS4bERU3XILHFmQdxzt+/fn8sl5Y3BpbK5Udblr19KBh5GIXRlCJQcMuM4
	 5GeJPDMyZkplz/KJwdOCcZcIT1fSFBV/YRWaXOoWyVsfP/0Fa5tBEdTS1TDL98DZSBeQJ
	 3wgy9XUDYuhTq66mcnbAQbpDd/4Si8yBbh8+Lm3c20Hb0+BwC7Yy0h91udL1y4yOIvtvP
	 Eqrqsa8/PvnyRWyFAaeKaATCR2xZCLTJ7jrFXfo0MlHSzUnq/J444NLhafAAlZqyZ3nUl
	 PRrZ3ZDYtc364GW2r8KaM4pVkytpr0YfWuzOxuZ1ZInmWM7VC03iw7SUC3y6p8hSM2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ctm/KkqP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DB606E937
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644DB606E937
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oifmBZ6C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ctm/KkqP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZeXb3061539
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=; b=oifmBZ6C4d99gSrY
	M/wHrGMM/v9ZElNijdWT1oX0pDAV3minEPzSPZmwFWlwpd68ZhzCNBlBtCbf/k4+
	Rme8SB3eaFCzgBYCAiM6HXeFsl9qh2jSpY6U85bMmdyOmtLgY68l1E7Rxmam3NJm
	H4sVDNifKjlHQ6Hd7+e7eU8lg3xtdTpaH5Uwo8hMTloRpNW2yeirl5A63iWQnTy9
	oDIRtPI3y1rVVqsik1xZQ3ywZlMNCIxQ9bfdduNC3DyBdbXrAlixolNNCXqta55l
	mo2NvLpBozOHFpditxnWlREWUSKnd9xuqsAwXd/zLVnsV7bkNWBEWraNwzYQwCUG
	Rt60lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m394p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so391269eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458208; x=1795063008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=ctm/KkqPyntqD9a0A1wD6QOMI5+nWdwl8L7eMG0SSKw9NRyCj7wSryhmaTH0AEpqgA
         C6U5Z6m7CkOLJQUvjwxKBT9M4sOOHAAd2qugCFAxBtQhefjtXSiz7vUX2kjCCx3NKPLZ
         6UNIrP0i7nPa9uXZcZylEgUEuBiAln6xXjGDCNKMze04tbf+GiaXMZyqyQG0w6Afo9OT
         GDB2b1xDWX5rNXXsLtVhGIWg8EBD7zf37o2A/9MfAgNJwg1tbFKxKx8zfZ1qfm46M87k
         bgSB6O+USfCNE1gne1hArFUT6bReZ/bFNXZVo21QFhH7fLHe/Of26qD2yQuYFwCmbroT
         EPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458208; x=1795063008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMdtjkwHEoqDsA7OYyn3caTVREh9LlAS5yuCVMg7B/A=;
        b=2vt2Vi8egmywuql7PwLjr6pkY7cm36XzBhmMxzV1QH1GGOOkc/HYNe7YccETBB1MJe
         UABz1NWsubsm35tAEgRDNnZZ7cI/qhyr6O9UdG2rWFMO2lp6ihHtprl6gqWo1ideQy3Q
         pqsi5oCXkhj9Tfm2T1cPLzxvvfo2+DDD/xsN5tuLVfym3gxDKIyOH0Sm1MH6fBQazL98
         9lmpXH/7P8SFPm4H4PElf9otmnzXA8b0sUQdrEG2H59siUAaP0R7BrYaRwia5c48j39v
         dH+9lxvxx9R5FhV82qTXNzRvS25+slchzV5bwtDgOK6Pt+4+1Tig58/QPeTJ+cwRhysX
         ZhpQ==
X-Forwarded-Encrypted: i=1; AL+hErGKnBVJhLsYHnOflnNcrsouxEigLjouLZua72IvJRuswFD8Z1tE1vvelYPEbvFwmcnnDpIvpaKS+VfuElM=@vger.kernel.org
X-Gm-Message-State: APuU4Z//mX5tLltxv34sEoKuYHDPRwF+mNiuyqniEL21KpaigHmaLbZQ
	5RaY1FDvY+BQhzd14pklIa6zHf18C/ltkjAes+M4XUF90kE+Whtc+r04x2nat/yk7AC68DkJ6uO
	sNBQ12tNwdQJJWJGRRe7CwxHQD2CEVpks9RoQG15arZ7qXnsIa+xXIxGSc3pBnslAUzQ=
X-Gm-Gg: AYBFou2raMICoGJfTXfU5qO+OP7VFm+1zdFG7kZwOSkkhcUGPMbY1P6nMWxaVveHx1g
	nhzKiq9Y0NQUPMhgd3QeZRtCZjI3Kr2dl3FtgCbzSmvjHqvDrpw99PD88ybgiEkBOa8dd5gWrhj
	STe3rDOVfp3WqOFW/tpnWzoLM5ywOBLFYcYa+EqzCnT68PXwCd470xLn9sLZ33gY2e2Q7m+oTpL
	VnFDQdZChFASIFC2H7gOxMAsBx6kzYOO1zeOIw9Pam1kvKZTZxi2HJc4Kkgi85I2OMoexBrFu7/
	tC0KSArIIPOkIZvfOjgAq1WKW/y9EeD7xJ+633qmv5CdT+jVGBbYLAMTtjBulCW6HmZWG5+IMuL
	1ZhQc2dnMiajvr93rF87zwORwtDm3xC5NASnnFhILyHqu5jSW3FAt7FgTGbyhHikAjwzhCblp+D
	70U80EcYn/V15D9/nrT5YgA1TpnS2tqED6wqjdJiC9dGPPtrdjVUxFpARVXZGHMrpcEUxoItyRi
	FPZl5o=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845795eec.25.1794458208152;
        Wed, 11 Nov 2026 20:36:48 -0800 (PST)
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr1845763eec.25.1794458207594;
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:47 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:24 +0530
Subject: [PATCH v9 05/11] arm64: dts: qcom: ipq5210: Add C3 CPU idle state
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
Message-Id: <20261112-08-dts-v9-5-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 2AarJZYYbGY-AlOuDxKQgUJY3lZqujrv
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af54261 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=NgvM7Uoa01S4sPDBfAEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2AarJZYYbGY-AlOuDxKQgUJY3lZqujrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX/01uoHTSeVef
 HNANGmResTCFZIjP0fJ5hw2riBmonifsIhGutuUze9KuAcSf2sRzlKnpnswjBIAJayqYc4qmNVr
 SN0KUDwMY3e7khGEPpGYG3swwcQ97lxrKgJgJBZXU0EbJbLOhjgFtzACq04eOwi+93EeYpAZb6L
 mRNvVmtdquOsJchUsDfYlMqGOTw6kaNHE7918M5FBittnGtKaDtGOFzCubYGxMtF33xLtvdUDgv
 q2O/S/R1qnPb8JjWzY+lUhhBecDV+09Z7r7A/roBf8T5NMdfZ9zMxJUz9rpfrxYmEEb9Qxw9VyE
 LJwzASl2d8c5fqdgVAhO2hjtzz0EXlNDLGxF/SGW/ZaEOQKHBd9YgbctCuIyzXZKvt/jC4I4PNl
 8sn5DcnW9LV2oB4bUBmwdgZGFbUdoiVIi/RX3chV/mg/f1hPs1HCDXlm0TqlSXAWMCqCo5vnhzZ
 dvQ6sDTO6BcPu2tJzmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX3OmVFIWkNrtT
 pI8j/iIQb+gEzGSNBy+OFR4cuz4G8vohIAvPOOW6nEVyB9HmM6Nvi+/6NZXhIk8u2HDttMX7vps
 i78hdgNbEbS79qay8fRFe1Fgzdpby2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the PSCI-backed C3 idle state for the Cortex-A53 CPUs and wire it to
all CPU nodes.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 504364ca031c..f3d688fded80 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -49,6 +49,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep_0>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
@@ -93,6 +97,20 @@ l2_0: l2-cache {
 			cache-level = <2>;
 			cache-unified;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {

-- 
2.34.1


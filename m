Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956896;
	b=3eZ5ObZi8hTiH9N8fqhf6aQxlMftehT9Aw3VzwL3ym1/LdamhyzWhswAUSyxpA9NLSId
	 YRfz8ppTnRk+woSJQ/wvL9Bj9dH+rhqTM6QRaCCvVl3w0NO5doygrPgb0u2Wn66FJFB3y
	 kJxuK/HBrZacW1TqPerAyo4ldnk7i9GLWjwUVULTXMrj+EmP2kASc2Dd0bFWIfjTfNRok
	 zrDbT0HZ7pKiTgki6N1RnS02f/WD94zIVTG1Zm/VsrEY7T1qxWLwPMt8WbNggjoOdo5jf
	 XZULGeYxPTtrkP7jEDoYERluKCXBKCOlYmJ7vxEFbzVhdpCW+PSaBWdn2JHkbYL0ELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
	b=PDHER51wfr+2LWajWFQLo4HGem4Beg7kv0MalVZU/E0rCojeB3CKNxjAwr5fnINnjY3w
	 QMPV6x2tVebLw9Zxv72ujN3uphUjrZgYbMcbLvxUOBYaSIFBB+y6NNtLjcCBplUVEFwKE
	 6HYkasaKue2dqJeaadIIC0+eQpMN3MSakyA9Z8OHpInokZGFJ+C9ZSPBrwAQURYO7aCwj
	 7oq25QS6axfsDPi9TeftcOpPhHpxqFRmoRTgewGPvo0aSig0Xk2Mz+jxMtmk0Z58aGuFk
	 VEtF06FPc7QLLSoIeSwPV15HTKUYENyLWoBczZrBs1Qnis6MvoWsmWU2x+pPxs0NhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YEjpURLF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C80606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C80606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4IlxSFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YEjpURLF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RAbl3243938
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=; b=Z4IlxSFIL+pobaJc
	0qjpSlK+alP4nHRIUxD/FVE00iaZ6Ods0VoXZuA3oh3ntw0HDMMNn+CixA+eilUn
	g46G/0iKOFXVOrDoHozqySbsK6KNx/pYhJ47kizVEdispKhyu8T27sMYUeKiVUNn
	K3HNHPPjHLpSvbzx/8rH4VtFT+XxNcLJcXhPHlK6OkOMTXBnCBj89+2OEZkvLSae
	Kb8BXL884j3HGPAsNfOFiAbllQ9MeG6W+8P8uGtVsJHQJa9p7sipABIvAO59iX2s
	efvLDQO/h4fxHVtYD3BMfBq75mBw35FxK4MTvMtqd1CF0tHUzO2ttNH+sZBkk8cg
	m+vZ0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa220b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso549005eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956894; x=1794561694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=YEjpURLF/LbB/W+7L2pZscYLGyT5aewOvlr46aTLkYR+/9cy/7viU3JMlQfQeBVxin
         KPOkF4x9XNkDm17QNX6vZOlBbSkGZrYaB1JhSpIsKL2lRu/ZC+Jgrn8nl63l2A34v/RZ
         bpwwXMy5cVmeONzKuDuJEHSo+izQmqO2PeG7PCjARCflB//gDrezIeng8giD/niu/d/T
         9i5+8CbUiuoYqNRd5JmZkuQpPdlT8gTpOIZBe0Pkv5x4Sqf8pQNXVi0SuGmLbDkNii8M
         jCEpxhOcPdN4s9/+jQ3T/VPnoum1+Y7chiouRul/Ow3b5h4UVA/8KEM6n+u+CuGWA8+F
         koeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956894; x=1794561694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9CTn9l1Lh166Vccf0n53lzY+EaxaipUw/FBxy8wyU8=;
        b=EvSdLhKtMws6Uj70ZoMhOIqeVyBgSYzMUukwEA4MU6vtFnKAcCPBESYrrsOdZshVoI
         eu6r0OQgeWtrAbJ/igmh3WYXFI+MuVKgNkCqNSPmuxTCv54mdpDb3eIrHQzeub+FjL+j
         lVxFYWMBHXmr8+BzADgbVCKfsLUYaQ+vZ25OErs00axRq1gf9T6MLRlClbCXp2xYU6Ct
         xnJYBP3QsRFJSsriV6KXx4za/itOW1gkCJjZHSsSE5yxXf52sXnYOF8JtG1Ie7BJ2JgW
         GgbGXosR9O13FfuNLiYpVtWowkju9vqspvWc5hSk+XWtxkX+Y2S/lKNYVVune9WkbfPA
         l8Ng==
X-Forwarded-Encrypted: i=1; AL+hErENYXN7WUb8Uzn62xnd7rIxHulj1r+5VVnxpDOF8sH0iO/w1Etz0vUPp7arKjVRjqcXxlH2c2yHUELZ/ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z90sCjbBg5OhIAomM/VTZCACy8BuDSezXk9UuxW0jHWT6G2qsZN
	cxAbPaE4rd7x+1qrQwhrGsXwK3DvW+fuD+ebWNajx1wU8pNldNEnAypXll9ASM6nOOC9hyQ+t8S
	GhOkKxGAnrP9s43YeV14Jw+BqUrH5TpdhLYvcZieHH0vnSqjaGKTEmBuFRQox0iyZA18=
X-Gm-Gg: AYBFou0bpzdpeLpBr/1UF0qOwr9hd09VWU0i3/XlS6/+NJOvArtMr0D9f3UozyW9hj4
	GBPcadAGM/whKrKrX0o2kzrKDJFYFq56L/n2+Pio5jDWpmF1Yts/WNQWAoZcugnCF2O0aTkDooR
	vyk2UeE+589tug1x5tzMEcE1EEWDmaSksh1yLiZ/rIWF6aiich17KEMdeIVo5HZR0PW7kUfRHOp
	YGSoPtXszmgCweTgaUDf+tgbFDogMOiIoleUSUfx9V0IUuJmFw7g2azj6ylEYrQcT9P6qFigvp6
	ohqcG3oVvYUvsUgvuXrvhI6uFbk9T2pBjoHX0sCMvIsSWtpzvLo8hCOpZDm1o45iqTPA3jw5nm5
	tKyzIxCrLMAtZhTr4T1CGW3mcECtvAaPUtdc0Bf6g/fapdJDtfN9aEVmcDKUplWSdm+DScYC+Dj
	RGWZhttVHEjo02r59iLKJDD1OvPh3mo7/Gh2EM/ijFebe2wyyoP/Tkycrk1A+tcguJCWTkOSFvA
	IObZw==
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591667eec.33.1793956894473;
        Fri, 06 Nov 2026 01:21:34 -0800 (PST)
X-Received: by 2002:a05:7301:795:b0:358:eccb:af7c with SMTP id 5a478bee46e88-36f76a18d9bmr2591639eec.33.1793956893978;
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:33 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:55 +0530
Subject: [PATCH v8 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
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
Message-Id: <20261106-08-dts-v8-6-d91401955039@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed9c1f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX9xXcf7YZxWWW
 g677+vEzsTkDzcZzEKphucn2BbEY6MQSYEOcqC9olisISnYDdxduZQ5s7198s7j9s1VlFi0ZFyJ
 hcncz0O+lLeE1FUPUAn7QsrbzHqnex4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX/AgJkNpuBe7s
 CbAo9vcQq7ZPzvrb0a8G3QYXRyNcKDrJ7NDPwEOj2UdjJVLiAq6qD6LUAOuN/8XZDnTO1vRHUNp
 L7Z3Nu8fKcVb30KzSbMqKsEJVUXKy/uw27rXAUY78srhR/Osyi40cNIi8ClKD1b8Bm1yuyZ9wdZ
 VoWBMPZZF+oaa9kgUU1KLgLEdI+74Jl6hW2gUa+eWiUSz4i0WFnOKbwOk3FQVOXdcXonAHNoWxx
 HCgWe+CLQYAGzJYGjDBmkNFaZJK6d84HmSS9fOS96i/s+cdzQOjNsOFJ6OKf6eBC6sjVhiayjF9
 xJEnk2rxuF+g6dD9/QuvTMpJsM4B0FxjiV7FA2x7lTa6Mq7H1vxgkOToZRvZ/e1uX9AMw2RuC0+
 l+CCYP8Vnls/k+TkOD/ZTyiJ+UWFqEJEvVfhNBpCjeeYKiyEb7MpVNetlVi2JNpi4sQczoJWWP3
 O0D6Puv6uWfIAH2/C0Q==
X-Proofpoint-GUID: E2A71J3rBj1E9ATKYMfEvQeJk-9R-Xvu
X-Proofpoint-ORIG-GUID: E2A71J3rBj1E9ATKYMfEvQeJk-9R-Xvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts |  4 ++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index e5f2f9217f3b..5715022db6c6 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -15,3 +15,7 @@ / {
 &sdhc {
 	status = "okay";
 };
+
+&sdhc_ice {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6dfc89903d2f..705d7ed48713 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -151,6 +151,14 @@ opp-1416000000 {
 		};
 	};
 
+	sdhc_opp_table_300mhz: opp-table-300mhz {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -432,6 +440,21 @@ sdhc: mmc@7804000 {
 				      "core",
 				      "xo";
 			non-removable;
+			operating-points-v2 = <&sdhc_opp_table_300mhz>;
+			supports-cqe;
+
+			status = "disabled";
+		};
+
+		sdhc_ice: crypto@7808000 {
+			compatible = "qcom,ipq5210-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x07808000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
 
 			status = "disabled";
 		};

-- 
2.34.1


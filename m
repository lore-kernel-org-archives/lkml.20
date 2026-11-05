Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874026;
	b=tbuA4LBtyI3aZ4gaMkmzxqb/DKGnPzeN6q+581X9cV44d5njNBDzIijbNfaSBCyc/lgF
	 y3jFxHCOhjCs/DC6vwsR2Dm9SLTBycaW0NKTLWeA7RoJjYcaL6RODRt6Y2StAMLAifsXL
	 Xoq7INclEqmnsS/dL5ldsA0TplkB/nu73Ad4lCslI6FO1j0CsPCayIGKj45Ibv64baFBo
	 92yzWyL6l9sw+KWlgftpOLdC4oDz00VB7ggZ71a0vJpQfH0rARVf9wXDN45MGx78sJ5gz
	 Pka6tqy7Floc2hN4PxfcpVq4ESjUeiVorDqEeORlCJZhVgDf24uaa/Vv4PG2KVjOxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
	b=oanFs5RmNCovR25Mibh7fhSOai8aEHA3ccN7cxwmkQ62nIjBrLTtYQXuSzf23mjgkb2v
	 ASwLb2UjT7RsvK3Z1PZoTpOF6EGhVpFiApQUPknROulIxQV4QpFNQJJy7iSg214cd4Mcp
	 NSx0oo29a9JqJUQvIRsvoxDJFHWBAFmhcaKyvGUI7DazPpeATIqSJNazPfFRLWxvley6z
	 P0fnb4QcrNTB7plP5AQmoRsiOyfBN81R5IWvjPWtKVsSzBw2ur1APg2q1868ONJOK8jV3
	 XPSIFu1Gh2z39/Kp1l158Z6CaHxmCvsr4OQMP1ugoFhy9kylVpEWPLk0yZgADvn2LuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7gXxyXd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZ46S+Kf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEFF606EEA6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BEFF606EEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7gXxyXd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZ46S+Kf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tGDi3684548
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GtolghIbMUk
	NU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=; b=L7gXxyXdyWJxUXyLj7hVwZMR1zM
	AaDXd9NFFComATxyiYKfs2ftmkIn+KpW/4I7mK4ooNbSXzTUw5qgNF94M5/UCFbj
	1ud7yRxE++28peBL8PKuEibHQ++tOzH2jrJI5JrKHGAlrt0lwSNv0WKI/f7sPFQx
	oBeMkydEy8zATd+73H2x7jc7p7K6BqIEsYXek+bRR3l1OLfoB5DKiMpVfPNIKEsW
	hNaBrxbhH4FrSPxAm78sVEmJIGZLrG2KYT9fJGyDvj6IYxyK94tYQT9glxboNvht
	BCCUWo4u5Le4dFi14dxtX9uH0AcVU88H3amVxMpV+ZZwrMFjg4u64nEVlmQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43hhh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:20:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso2288197eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793874024; x=1794478824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
        b=eZ46S+Kf0+S6Ss641xcGhQknSGkYoPxrI6G0A6+fXfYn5brDZgUEp1ARZhzCtyhb6P
         rhd5hdm8OI1OZtmarsjlciHAvR75pTjQE3ePk73ARpy5m+7Yo28hg55Aa+YBETdu8cs+
         yOoOpoGCGnWEaYl0uLy36XjqZIEeTCIcxcGpABMqR4YTzI3WuBu4FPWGsrT3A5an9tCA
         RVHNK5sWOG7kwvOb/QT9Mg0DKH96Xt7p1ahBTBeZ/ZEjgSZltM8mWaZSX7Cpzzz5Jq4q
         n9Kisoy7et0ymxUh9WUUKRjwoKTExvqgG57Ji0p94TJ9Nk9d5Lh70eePb0q+cLq2/EaW
         30XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874024; x=1794478824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtolghIbMUkNU3kZ/Ak0HKZisx+UrI/mZBMSkPG0JYg=;
        b=Z5r+WeWfloKGveW2L+b8fRUPWmJoXGUZ0loLLa/PFjrzUteBEIJV9Zv5BLYgC/+tFu
         u83veoHsuFaxswmchwDJbsxOlcIPf+EcUweqnvdx5jnIpfs6H44oB+aLOoLkaS7vlX4+
         Y9LzU+KbFL87ynXVYenJ6XJw2aBZ+3vz9/pevqPKnSRLiNtBdQTwmgMo76WBNzFxTbBF
         bICHWlXVm1IA1CQRCyPziYtS2M3FPPOrMtLcck1ENv8aVhvYsJIKjvyLn5uN6n49DZLP
         ULD/vK1LN521RV/YyxKZMb25R2Y5m+EQBfA+ArmvTkmpvJGuxR2m9hE7szjABMNMlxY/
         fl7g==
X-Forwarded-Encrypted: i=1; AKwUvBx646fZZa8wqALf+GJBVYOYkUT75P+CUdnT5hExyxGi+uam0NtJuKVb/mzzVxYRdAJsmsdgPaxDUwsY7rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z85xeEJ2XNH6RG6uKMDxcMu24e5CV/eSUGGfw3MFkDlvHiyMIk+
	/QfACA6M+nFKOLhTGbr46Bho8CHg8ZhHeuDjPXCpXIOR2rebua9P+PAo0ahy9XCEuBQFndin9wU
	C2ijkV7H2p6Ie/1JfiN7qpbWgZI2BQiBRIB6YuSEnJxnbYhzI4fjch9hmeARm+U9gqNA=
X-Gm-Gg: AYBFou2nehhLyG1di42f9okpVyZJberjaZOTScgghlB+8ruahHpcdVPULQ9q3Q75lUt
	6SlOtBtA1XANeVZzT+MvexIth8MuMGhHyMZplfVJfBRynTBpQCFv1piqVN9VW+ZTGPIb/ADkqQn
	fxG/1W4us7BE7g+bXbJmLsohJnqSzPYtpIfpcgrknYYTWfhhKr444wP7TVU0Qun99Fbw86rqt5J
	1A+kuDJBuQJVI4cFHQ2lru7pSFwGzH37wTr7FPpV8bUhSfnpbdC3nt5ejtITt1bj4gXnN/Fm2Xr
	D/zBSd3kz4E+pV/RNBrcdXVUy1lunFl1HG9qNeghLkGDscsxftA9VEZv/832NfMJSCOkKCENWLc
	Mrnayj4N8rbQq6GOzHDY5hVrJz6fGJZCFnUwZJJBhEuBERHrLoLOyB96hPfZHXr26wrem/Meyhq
	eS4vh5XCPK
X-Received: by 2002:a05:693c:20c2:10b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36a42436a2cmr29661870eec.33.1793874024047;
        Thu, 05 Nov 2026 02:20:24 -0800 (PST)
X-Received: by 2002:a05:693c:20c2:10b0:36a:22c8:ac57 with SMTP id 5a478bee46e88-36a42436a2cmr29661825eec.33.1793874023233;
        Thu, 05 Nov 2026 02:20:23 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm14115330eec.9.2026.11.05.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:20:22 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V6 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Thu,  5 Nov 2026 15:49:54 +0530
Message-Id: <20261105101955.3732723-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
References: <20261105101955.3732723-1-monish.chunara@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: biCc2dqjCwBN1DEs1OT87Ip39VApABV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXzZkUWRHCOxYi
 wFMxZ1GKECiFm3LRMdOvmr+m1HIV752eMglSOxVtMWJUUxCUzbxUmYUEotPRHdKVq2YAipVOQd4
 KlPtJr+DHIDQhieXDj5WnA2bP9yr0mDULFgiOyl/3UJekcO+DrcFFZ1gGzdoEoH4ziJxlSmNviK
 yfssN+07zxhez1CLLTyrt7vlLWCPGBpWDQC/wgmhlz9ETiJNJacjNpbBhNqvkiN5JQ+Jos23YjX
 K/I+wqo0zMK9sGhZWF2fWvmloqt4Y/FSHiSK7T/mgIxUaBsaDYSFZXn6/DKIxDPhWMy5O/moapU
 bXVEfLfeNevh+H7TVrC5xg2zFtr7ZQVZtKwiQoPsgVIxtqFCFmmkIFqbr2MR+tjrMLYNgd5oi0l
 mzv8WJML6hfRRYdwAtK3wHY0Ij8crfpD8rVU4TDrKlWfm4CUkKcwx/yeJvg/ZDZwybfgDrH4nEy
 wdTCsgwBvEaw/YOjlsg==
X-Proofpoint-GUID: biCc2dqjCwBN1DEs1OT87Ip39VApABV6
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec5868 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=533hFNQyOw2-QXVkCMkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MSBTYWx0ZWRfXztLLMyC2g6FG
 V+7aaI/dnH0s9nh9VqSIp3unztcUZhyuq5DNONDBHUNyqw+xBHyEiF+xOMvG8iTgCY8c3N0TLPx
 ArvE/mJBW4VSKaGxxgU+kwz9Z9VOiNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050041

The monaco EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
configuration from it. This allows storage media selection to be handled
through device tree overlays.

Introduce an SD card overlay that enables the SD Host Controller
Interface (SDHCI) for SD-based storage on the monaco EVK board.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 3 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..1c5b2e95cb9d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 539c9c80a808..4c30dd110832 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -744,17 +744,6 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l8a>;
-	vqmmc-supply = <&vreg_s2s>;
-
-	no-sd;
-	no-sdio;
-	non-removable;
-
-	status = "okay";
-};
-
 &serdes0 {
 	vdda-0p9-supply = <&vreg_l4a>;
 	vdda-1p2-supply = <&vreg_l5a>;
-- 
2.34.1


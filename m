Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9B53537CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136478; cv=none; b=g95391W1cRXzV/Q9/giG0lMNbZwqRS710l4bwrV2eZdmpIeqlM1++8L1thPRQSGJtfPRZBt4BzP8iZDQR17/2Lf/eInHG7ZAeqHJZMwRcJCNtWA3A68BHyphw9YZldB4JEuMi8vbDBfncK6PZpq0/efCpvf3DiADcSo6fTisF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136478; c=relaxed/simple;
	bh=wiTMkmPaCULWmwNg/rKN+QwuIz71J90CtZyjasdgS+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLNrt5tNNdGhe/nXpHiDwXbz6KFo52K+W/XO4PxEToJ4rJ9ANwNOj1t6q9bthpaBRLydvKRdO4mu2ygpOnWBzkQXsBGlMoGIJ4qU/EWnLh1dsiyDkebe0d+rcdRR73DmCimcjC1niQ0TJSvZ9dsfBVfh2nTKT3PkFDpqU2K4YZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESS8W6sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GhUgZRVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESS8W6sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GhUgZRVw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiZEx3473511
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C7wGC0NXm6S
	yYMaUcruGTajxYAGjQBVauuMw3W0AOrE=; b=ESS8W6sOTh0mQZXXJQ7xhAOHrde
	zICuQ+zF7xA8m4JSK3JvNFuJo6KcpOYP9w3wC0mtw3UchZ3lgvBCNHOSlbQtUPhx
	JrjgDb7a5im2G/TqXOS1zhPidyh5p3UoUCI1C2YNKY4LaYymAneBgDkejD+JctVj
	/dePCd6ntCnj1NLXq7NRJnMiNqrpKW+mWyHK4rKke5wLeMfpGGxQDwEU6wBagusT
	ExxfYJoue+Wp2M3JdIjL7075ZIyKgQ1N/if0o51QdKX8DH2jKlNRSbmMPU0TbhLZ
	7QX2+wSwznOiDSmRuTQTT5ha+4VuH9IaGXi8S7brsvI8kcSmfSv4n1WEEFA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729k267-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:16 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8546e211940so11434397b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136475; x=1789741275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7wGC0NXm6SyYMaUcruGTajxYAGjQBVauuMw3W0AOrE=;
        b=GhUgZRVwnahFxyEyQCAsqqaDkaydzRIa5thGcQs2Baie3/LZktMMi7b5Sl7FuaQpBc
         wtK0r4MXF530skkHsngW9k7eeTpMt28vFhxHhfqaU01UWMZZKS38YvNnmP8hV6k4gjky
         8ulUvwtbYcd1aDD0CE5XEHIUmLZVH/akCQNSw8xGtXmvlJokTjcSjdIM0KBj18/z26XU
         PrqH+RFxjhyf85ZJ9oezO6ZEzCnIqWn+rHt6VYbFDUGAdnUhkA+23wyB88/A0zkqKJks
         wCHCinnHOgKt1Op+OuPsgBY6Oo98TAuH/ReLVYBiKxyzldRUXh7G4XtuafCjQQhivR2Q
         tStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136475; x=1789741275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7wGC0NXm6SyYMaUcruGTajxYAGjQBVauuMw3W0AOrE=;
        b=WTVa+Hr2KITai2OvmnSiiHixLlppUFBuJZLjfFQo0wczz2OWCGTyWaauZGBQqtxVMd
         k16hcMnTQVP3K7MwHLDGxhlFo0DTGjc4e0Bi5X4EC4/XlyBpxtPvXcqbxyapp+PD+Fiy
         NMR+IkzzpBx9bL+VTkNNCcx5UmOizYM/J6LfzpKrf0rGPHa7YMhX8MaqSS/B4HpCujhG
         jiDePwWyuYicEj9owKf2C//M0/ep0bhQWAkBl5/hIqYjhKBLEDJdpO+nfLuAOdUq3V59
         QlNli4lIjPyYvUiOQllorL4KZbVhZNOiFapCwNJIF/MH72pD/lslRCdOU5JX9eY5qTtz
         Rt2w==
X-Forwarded-Encrypted: i=1; AKwUvBz5yOoUeHOPpV/Xj7ONeBY1iHKP1fvSJ7d0PpzmQ2MeZ8m82kt6UtEwgB/Oi3MBxKBQ3KGtnI1cKbEiSps=@vger.kernel.org
X-Gm-Message-State: AFuF++kZHXaoFTLGP+1BrAsZ6qR6Xup/LxSw/163/XZEnmtmYNqX+Jwb
	OoenJkTErnATHI8xVgThYCCEueu7Yx/vv1M9AIoIOvuumLbXpMziIB4KnrPrEQpKOPbYixDCybH
	R+y+0i58KSwCjzt0ctLR3ePFGJbrcDQCWvbho12EFy1o5HUG9GQHROMGg+Bgbozq78Eg=
X-Gm-Gg: AYBFou00PR+PkH5yUeyR/EMIg5N1tQnwKalX/WbYap4/gn+N5kaQGPv/HkPioSRf+q+
	1PuxTtYawptCFfPlBAYbSRT/udX1TD/hRTkiz5T9kDlqTBWePVv6cNLcfjkyUPTgydKsjtqBkxC
	iJK3BuBdXv5s6RLKUQt9Q1rwngYS7USFJkKzXRX6//FBaSj2txcaXUVNz3LDcll2vxPlzDbBKFW
	d3JoYDPUcahQ3QMRmDVP/YNXItL0+uvDt7uSHN2mCFTgeu0MrmudbAotJHhMPO6xU+j3DV3hZCR
	Ua0FwR7temkGoKQ+IUS/VZovF4cW4komEdIhKb+sQjioP8ekEjMUS3rZ7hsAfZAqbS5qFR3unQV
	tqmjCXqh9GLEgFhX63HHaWnzakJ8sSXP+2OkNqfa9KiKEWYLXhEbwPOcEhgfp
X-Received: by 2002:a05:690c:e3e1:b0:87c:349d:b755 with SMTP id 00721157ae682-884b2bcf7bcmr15906507b3.39.1789136470523;
        Fri, 11 Sep 2026 07:21:10 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e1:b0:87c:349d:b755 with SMTP id 00721157ae682-884b2bcf7bcmr15906197b3.39.1789136469956;
        Fri, 11 Sep 2026 07:21:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Date: Fri, 11 Sep 2026 22:20:37 +0800
Message-ID: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX2O6YJo7fzmOo
 Lswx7UzDLIma31pbWxyi0V8K94Nggv63xnNP8WeFJD82spwMQztVTWRitzl6Md27xvFZtF9FwBT
 n8lgMkuCqoIK9Mq/0vhOuUG7jiV/8Ok=
X-Proofpoint-GUID: mT7ir60nCP5pW2QCJLSh9B8yu5obB5E8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX1M1KxYnhNe0v
 jekfEVCox2ffaPexcnBGcpXGu4zTMOL6cM1LaVj85qUi+HdZ1X+bO3QTu6E9jVpo/bX0LasG2fb
 2k4ANaKQ3ZB/h7cc3okA7KS/ENaRWxQncYKribDzcIlotqh7gH37un8dt93ZH0+c1lGDIxmFnf8
 33l48k7D10wov+0sI+iShfQuZUG7a8wt9p9JKFD+hM8Pi+jV8rr6ZE0zoGjsDoeH05H0biS0WPC
 Wn3JPEJl02yMlQz4NHORZC7SkL6frVNcmdjTnFUYho1QhRs9FiLsV6h8ed0j1338zG0wB2quSba
 xeAAPBKGyxYUENyigYtpkZ2xcd/VxV0Mq7pXKwFU/tuZJ8dK8yPGb9TCPDGJQUqTJJQGUfXKan/
 jrLAgvjF7Hxa7zfGz4MOWLa8DqoZFwkQ5y1z8gFSu9vsZR5P/BVWUG++hU8W138zWDLlA4mkFYl
 pk1zYVa7mzYrPVWHlPA==
X-Proofpoint-ORIG-GUID: mT7ir60nCP5pW2QCJLSh9B8yu5obB5E8
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa40e5c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=OACZVaEhdQEOGtIDsFAA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the base nodes for the three DWC3 USB controllers. These carry only
the SoC-invariant properties and are disabled by default. The extension
for the embedded Nord variant and relevant board files will add the
platform resources and enable them.

USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
capped to high-speed and told to use UTMI as its pipe clock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 83760341456b..98967478fc3a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1736,6 +1736,89 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		usb_2: usb@a200000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a200000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu_0 0x14e0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			maximum-speed = "high-speed";
+
+			qcom,select-utmi-as-pipe-clk;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a400000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x15c0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			status = "disabled";
+		};
+
+		usb_0: usb@a600000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x1500 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0


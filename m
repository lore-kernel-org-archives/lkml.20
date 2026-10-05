Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1465447F3A2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203150; cv=none; b=IobRinrJlvore80LeFaa1sr2C2SpsEKGMzUsVfj7lfv+iStj3Fj+el0Lc8ds+XV0E6XGK5Yt+fccrfLOOwtBV3PdXLgPhpM0WQVzaTdSEashMRidoHZUFHcDitBd4rFOpePhJMltUwOusNEvn/Uf1YQkdkpFNIiRL0VxQv5a4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203150; c=relaxed/simple;
	bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5C7uMm0youwIsJXWgiEWPVSCay250B7Ef7wyuBkERwOQeH60WE3LcYz7k4+iRogJkC+2Q+H/QuiOfR2MzCPzqeRYEXE9nr8+fakQg8IBsmWXy89bJiLhuT54U69DcKzzsxDJ7v56xjQ+mqO9fM48oA5h2oJgaQ7yiOfPYYlBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhbvQA7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2sUSCBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhbvQA7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2sUSCBh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFQYE2225845
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 12:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=; b=WhbvQA7k6MPbvR1H
	iTw0Z+Li9Y6zIe6AXh7cwGjYCQ2qej7Bg/ebIVGH8un+bcKP/qzq3sdF/hKWiEYa
	XTGunCpVZy651e/3Nmb2ML7FAGWtcIB+7IVPw4Sv3t9y1sRw4fYV9rXNDA2VNm6g
	YK+g1IZYP+XGvkhNCH2R8j+LOl7jC7+fWkGfjUs7vV32ZsM/vBt3AZLZLnmsJRNP
	j63DCr7zK12PmSYbn0IypozRW9pPOKFqTdngQQwOSWJs2GACr0yKhOWqlo75P1it
	itpWQO6HltJT+wkYENCIxnF0xeRYuNYmmBTAn6hWpM1PfV9yyEaUEx3jcza/8zvP
	IdPYYw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg02e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:25:47 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-82322894f5aso4338035a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203147; x=1791807947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=a2sUSCBhHfGxZFnJekoCxhT3DFtIN2tUB320/sFTAzUPxw1tM43JmjYrusONnQ5+d9
         YAaI8rCK4U+arqMwa7bb6rQgoMFOYTnQp++ByLr6+mDJQDNg6JnaRoKEr0rzbfB/mkoR
         m5nW/TeGb+badmXxX+pML5xrX21USHhSz6JltCb3r3ZxEBIHjSeGFTb/p/YEQyI+Xuzy
         0AKu+IPSlzN+vuD1dzLPFx9TfSVNKqdG94ScPbVlEcrfdVyIrGFDjZ/bx8ukr16Z8NTm
         Sh0M8vvLQyAKNAkWIcUIaF9Nuy78cE9fvnh2Njzbod9phd1GvQKAQsUVqBFlpTA8HRlJ
         HYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203147; x=1791807947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOGvMYcFDmz20ylYWcTaFiviZr7BBEHNjsYC1vds2kc=;
        b=mYi8QNbM9azEiqy2r78Ex/PsaSBbi3anZsdIoRmWKK9CZuwF5QAKMr9Bn3EQoBqaW5
         H1AOelajZOqD3QgY+zrGdKavwdyuT128/3zx1p8NjfUY2dsuTr/wFoXsT8D3VGY1+RgS
         O0e1RGMAuhw3sgVJU/N3yBKHMocRvBZePgZ9BQXKYsygsljG9FYPHzKP8oVYMoAJx/li
         iOOSlB6CEK1gHP9Zc2RUCLC3rw/vZZMuJqtj4ZOgl4/+q2/gvsJ0DAcoBeeCr4tWH8BZ
         hqnxWnXTn57vC4twnarrkLTmO4wOsybrtzn6W7GHPxkVCT0ZxdtRDYflDkWdZfWzkgk+
         z5pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWE6Lv1xhWauLgbDkwVnUxqMg7arcp2qGv6B74m2kynMn+3PVim75IZ03qxLr4tX3Y7Ak/ZdOQmZYI4fY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdEkIp+rN1BIsbLGPMzvPJnR7XMnSYCGq6qA0w5ea93r/TyXp9
	apgRqPsnTmjC5jJaC8sn4zAE/l1vp6kLQyi0lgIlPKaDbvhfOCZgPlEtmD283HzYsqSeSZjI+Oj
	60wzV30RtG6rI3VwQfTL2T1elsts4cxO4OxEwefdOY0rrDrTwyTMQ9DF+0CoAL4uPcns=
X-Gm-Gg: AYBFou1Q3Vo63O2HdIbHBpyu79zD+RC50RhVI/jZ9qgzY02oeXSsog/DI2kau7J6zPV
	noAELlFz9taLTnLxro3JnP0br+nsj//Rj85XJ+KVPBd+6Vi9gVXfRL5KFoJeEvomZVh6DtLjvkY
	4aaCYf05msCWsF274F1y5PZT4m/vjlM6PqrssXswVqgqcp0gUB9Ok7mBrmRRG1saIAPtrtrk94R
	hXiLhT1KCHCW4oWDSGWs/D+pbo4/F6X8FDEJ0N2W1OrpPgosjOEXPJvIY+8oo7waSmfqEgp85u4
	Jvi2o9bC1Va/nvoUbTmAWwqGT37pmd+dHovAX60PxFlU+H13e5horvw7ed3c2+2UhmpZ9Px4sMH
	WuTE3c009t0DuJ7Rvcmo//J0RNNLJpX4W6A==
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685965a34.0.1791203146837;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a9d:6e0d:0:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-821171abb97mr7685950a34.0.1791203146398;
        Mon, 05 Oct 2026 05:25:46 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:44 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:10 +0530
Subject: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1199;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=kmbCNHlSHkRmbcwH+fso4E+YrXZBoY+nLg9DHtkfQ04=;
 b=2YmvEU04ZjJsOIe7WGR/kTsTv42jYKJlGrvC3JtJUxoGdnXBz8gCE1n1MBhRmG+M+ECTXHo/Z
 pMXGg9n45SEAI3uBuJ265mAcdNWfIkl0nL2D0C1+cy2LRvedZ734RQ/
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: 4whk0aZ9jHDcfIFqb0weYwTlzclwur7i
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac3974b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/kl1ngJkyJtl
 NoYNbvFrosSJWJ8S5mwQnBHwkl4Lma2uI3AdmGHkeKb8V5w2uNFfXzAYCWVCKA8R3pNFuMqU9vb
 eMhRLr8taFLXaRg33NmDcx9Oa2PIC8w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2bS/jTmIWAdh
 bwKCcepXNEVNo1xeiq+/ZZ0InubJHsQtPlXyr8TsoVG7VdU0goaWlRTnDM/wLVRad/1B4jSu8Ec
 hhH+7i8KhaF2uX7zl7MHlyPDTUFwcl4FpvPlZ9WbWkR+YN8lJ71qtMdASzBsT55jCIKtWumRSfM
 CypeVLgQVigWtgmJ5O749sZHPc7zNrYcXsreNJJIYQcsUjsBPeIDMm5ObQ1UIkIrDTmEV9/wFGV
 6yw9fNYHG34cEDzt7ZVz8PnVfTH6Wq16xnM/3VDXVreY0hbJT27lxtjpPYkXx1XAV7NmLTyCt50
 pYn8XH4wydTM4nrmSs1YtPRBczPMz+Sir+9G4WD1W2STu5sx7EVDhh1OsGXZ8qam6mmSze/HVhd
 rPURa0XO30w+Srft/lvhVgJ0+cKCvKgNbhs+lUadfGThG3SWWk9aNueQTfT16SKZnu1O3YIxFiW
 p8PYLS31Qwe0uOXZZYA==
X-Proofpoint-GUID: 4whk0aZ9jHDcfIFqb0weYwTlzclwur7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0


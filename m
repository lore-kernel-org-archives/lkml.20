Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629E3B42D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521415; cv=none; b=URSza1wRVt5NcBbClUVBeUOQGuXDUK0UGHyuBlF54WmGnHKCN0w+I/v7qZYDmRh+BJRpLpQGGe72AxXQZS56DpDSDh2S9TDRdKJp9I/JrzBfhy2gQmFT0rvl0LzrGLCyPtn0kVXhloTxVMclMc04psmGiSStTDaWDOtD+5nslZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521415; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQV80sXdb8BxtDWcW2bgsKHC0qN3Op+CjkrXRfcyKzAtZ5x+om0CFU6h4h/NlngcrT+S6ywQeKF8h5ogun+lOFee/1lA7Yt1uYqvYXEgIv42oUStkfdnkko5RZhpwnsYtRGhYemiQoPazvFtg17GFIRW0XNrIxFfcHqtI2swU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8ad7aCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZroHtXo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8ad7aCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZroHtXo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HLCL1089382
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 04:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=E8ad7aCx5vOk7MhF
	nyTqzgsuPnqHMdqH5wx33lE6PwTokIIJ9r2gUItSvcVKgtDgCpu7PMODIyjDo1Lp
	uA5huVbGXtP7f1RT2wtlBKsPx2+o8WxMJA2VxH0k4fnCW4Da4T7UPqMQJP080zhi
	h+OPXgH2y7AwknkkDjMsn6+O5nAU2qh0mLZPC5F7pUp2yN9QCbjsM7J+vSZH9FI5
	Necl2LErujJzuN/KFsS8faxl7RQXnuU0Mz760XtdYtcVFd50sfUp5kqlATINauUI
	vzzigUYmYhu6z08O/IlKA5BPHquq3YtmrlUs4Nx2HOEvbbaGt+NEyaC9f6mq2MiJ
	hWH6vw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekva888-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:50:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3517ee4b01cso1386017eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521412; x=1792126212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=CZroHtXoXKqmCNB2HSjXVfjf5XZNkwbKQJ8b0h9I6ujwTz+oiAgh/ioGaJcO9VAhgU
         t3r92XX9T8LMHpi9Q/7pNNdn30Smd+A9VfHeywfgKeKm95X8XrA2ZWlbJ6kq6oeNvNND
         0e/9+uJ+tgtne3PovWFxqpfGl9HJGdd0rdgOPKK5dMAUBq2lVlo/+I8fwVyh/keMCrnw
         71d87ESgNtiPJZDOQTCWvSXdvSCUMI3G5ZxQFMTiBimPPvUHDHSKoXNfKM4JDhgRl6yS
         SQdj057lGqFdsdNCr2HRk+3NTzOF/wf3OIFiyJ5vHY+oz4vhYea7PAinmipEfn1kvaAY
         4JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521412; x=1792126212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=UHFnS1vmNeLqgVyblM64p+Pshmjyab9jeWGiKT/L6YAWQbx3kqbniIYMQDwXZzi7Z9
         znu3yDNAAXlxBSoQrwEz9OJy7P/CNzPYqR5/5s5D5+XtJrN4fXL1xkCRBP2tPhFmALCY
         vwY1GHk1t3AyMQvxjUGK2WAQ1IBUllU1ymvZTsFnHL1jduh4OZm8JSdWB5Dd1xnxchPW
         0RdJbPzHC3mjE/H4RTS76IxUA5GJIILAa3fZNS++IA0ZDGy4PPU6WHnTEl3bYxWqPfY0
         82NcxoR35c04horBUMK9I+rSuCjFxCKuQKPNVfRAqdACHHbOlPG0ISPQ6mYQ0FxnZo8E
         LVjw==
X-Forwarded-Encrypted: i=1; AKwUvBxYt0rdkFMlrXWa5osQcep00EHsJPe775mCn4zeV/+jpaAUOHlpbO8qu037JsQ7xsabgMvWe/0i3b9qTIg=@vger.kernel.org
X-Gm-Message-State: AFuF++lCv76G7Goq4sSlu5GI3FM5e9IzY3sQZoSEXiKdd63nzhLWO9w2
	geZk7Uouvt3idCy8RQyfBiV8sgFbc04d+6nwquluFuybi4O8h7NBlfrreyv9NLCil+P1ZZvlrB+
	WShVmMH95kcLyObm28U97XvYnUYTlKdLH0LUDuMBJi0aKXaPNFvo0M/sf/MNxOB5KuEk=
X-Gm-Gg: AYBFou3mPVKYl3qYGcQ2d5IDwUU4WCAUdXImZZZ2J7RZl/BZxlhgAXgRG/fOMZnJ5cE
	PLFSJ5vRUtylyRth90/605kVgSa5KSa2GKLMRRffifSYdFQgmDcMGCBL8stMLKQks+kxe2yNzQD
	LpmXICUuSCsYCUpepDmLU51Nw8OBE72vLmEhs7j9/zg7vy8UbjrnvRe/at2xoQriqY4LBbEFZ1g
	3U67PTPRnjGNNgtaeGYnDWIEKNPjaIC4xb0yMZ3O+DnUBQ7/Iqp8jrGD4nnhruj3p6uKnYP413b
	LJ/GWRgahEajpy6CsDDQP1w9vauyzmL+sxLPieTSO86YGDKEcjwC9JFI9NTJL0aOXCoG5FL7275
	Dovx0zwdmTjPMMki698RRfB0fATOtr7eRpYhEGdKbWlJpgHMEJzRbONvZjUmb3HhHyvSkF5f+yj
	EHttESlKpBmUqxkggjWzlXU3SFMoRGPA==
X-Received: by 2002:a05:701b:2401:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16a5d63d0a2mr1102998c88.16.1791521411964;
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2401:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16a5d63d0a2mr1102969c88.16.1791521411368;
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:55 +0530
Subject: [PATCH v6 1/6] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-1-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: o6GQze1uuj4cZC2wcr-roT9EdWrviOBp
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac87285 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX70YPF3hYCi9S
 oZ+oPCJ6zOOFpXy3XhtYhdrCOG0hDFWMd2i5Tw3HRpEQ+RbHAKhYV0uXcLG93f7GmWjSIhu2GZZ
 5SR3VcvrgQFrRS985kBp1Fzpb8Djtoh1lgoAgQVMIfJWoN54pAKc9SwSDsesCqrmvHIp6YO0d9O
 5sAGpzieWKRhVn6pgDpshhdCb1QrfUy/YyUoyGjjpw9Ir5J4XJ7gSZMnWZZ7nry97tWR+stZtuD
 zXezuWZGvf/74AEtLFkQI79W+P9vm4O1+fKPsh0nObP/1K4pg5HCZI1JrIobZ4l3u7smTXW3Mpf
 FACNAeaDed8Ztb2rND8P5N3/Tjo8HXvakkasku1P+xwDtKIdVqwW60tuhXPN8Ob6k2jdCngelx/
 mr+DkU7XR/+M+ioHw2deX6qx9Sk62iPZkzkEDH6Ga61cW/GBnpjFrSJtpXyBPE0QYjpFJbPnBhP
 OryVrcGlfyBiX30+Rjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX1YIhwqypqVy0
 eWDJ2vi1PiK/c73I6054xCmVsSft+Y9erc1dBCcUNbJ1sbAYOVuozP2s7YQDD4yjtkLVMMggRfy
 9F0N29Xa++oQ0L3/qbU3OPUY/d19EmU=
X-Proofpoint-GUID: o6GQze1uuj4cZC2wcr-roT9EdWrviOBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1


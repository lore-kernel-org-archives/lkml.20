Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922702;
	b=mpSO1qck1e1a8XMIdzYM/ygo3zsAGWv1osMm+GRCpOzxtZm4PdtiavAqS/ZKnbdWLMGj
	 uiGE0OzhqQhOMxDRET8H86FzdoAuclyyonh4vugb+tCSQTvk+Lmn1CxviKTq0w4H350Dl
	 nhluge3aQVTNzgdWrJ/avrgzgsuoKLP3ng9vz6IE6NGzTDvohUw6+E/NlWdTnI3NQIOUk
	 40PNDhh7rmZpCPZIZZc4Gybs6goMVhoto8fotBpDXGFodKjs+PHbh4PYDt2foU9VTbPvy
	 Kn1H+DI6gRabMP0GOBkAUcZA36mAuoFXU9EhFedjPSE456I6Z7MnJton1rRCuox7GJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
	b=lxT5OXysdz2Y+IcVxVpz1MpxbVEzk6fUizZTzrYyzj9eqzkAVZ4QvxSLxphu9sIyCq84
	 Lr4UIoK5zt9RDFCVbCZyWDDAfDxpY9lWF7hgx9sXAbfvSZkxo+ZfLr29hJgYWpABvLK0Q
	 klmo3VMbouX3ENvLVUC1mzQIEJ8G5p/064p5rLLXMa4sDUe9xVNI1PbjyxDwo0U7MeZBV
	 kykg4BzxhpTwi6PHhVMqNW0/SIpcIypO/qC6sY9IqYvn02MyS1IEIydgAoVQiF3vKYfVz
	 ZD/QoulvQR+c3n0ANtITHvuw79HrmffkNRBMmVlywoCPNDHh9dvTt7uqioNdmaYatsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E844606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E844606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeSvh3216022
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 23:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/f
	G/eqd55s=; b=F+UjozBmVBcvwneBwTSXima+BbRVI6h+ffQRqAhkLPx0ZQl09T/
	+ZLiI8aZAdRm5chsoekTmRXL0p4A71vUvXP9jbcEeiLICqNEBwlTv2KnjFl0AIuL
	f2Oxm3hA2LBTgu3IsodErcUB/5STKF0cvsEkcWkh0hGU6s8AsYb+nSdJmCyrOiJ6
	0LitlJ2NPdsEpx5TaeXZvI83XjRjya0Ixh1c0XkcNxgLMRyYdSIPcsY80AxQACtZ
	tJCbgXITWx7evwfhOrTDD8omGbTKEGw68YxiJMY+maGKNRTPovFasS5z00qNV5uZ
	GVWAN3iEFrBVsrRfe0bc2ymz9U10qA0ASFw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9r13f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:51:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so113186eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922700; x=1794527500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=eyuUzIZGudnj0MA776vVvBEe8rjoPYHQlsLwqnlZXfx8WKhla2g/T3YGDg5IyXOI7Y
         tsXNXCZLUEBbk6N/SrnrI5Hm8UsSzDvSy65X+HNefesQmYiH8pDCeaP7drmJqInN7WHn
         mnQyACIGBdP7rG/jdGUMlo6Kekn67oCJ6Gb6I+HxRX9Ti2k4qrA+EWX+KIMa1t4EvfFd
         B2F8cpB8xCE9XU6DEJfl7dM+/1omhR2PySZ6+7mg7dql7dNGY4bIjn/dPbvnIMk1M4M6
         5Iodbmfri42Oh2V9KV2DbYADUILhMCFeSuUPy11v1gkFYJJJx1EuNO0DH+3iMrK+W0bC
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922700; x=1794527500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=gLfgNy7biaqxz4uezMuJpkWeHP5NUZfcKFjhXbX8yeIRdRoP05BYTh6SO4294sK3Aa
         eES2iJ4l7hZRVA4pUes6TR6dTPTK4eaXhd+OOLlXgZ+q3Po5np8rKP7trHi6xYfC9SyF
         9KLIC7FsGwlj7rF1rD3aCFKFQhaM0qcW4dGznLtE2AprCfELQxCF8M+L1MlHjAaXEmww
         Tkuai0lNaVb4EW4ilrUWZifaxjm2yazKxXsPfhf2YsGfY+e8GbbLjHc7E2SJqW2j4ZYG
         jVjWjbKIu6PqX+mx7qftpUceb19sg/HMhf8Z+kXrze5BPHj3vZmEFveOn6vj0DwHmY+4
         C28A==
X-Forwarded-Encrypted: i=1; AKwUvBz1EEa7RwiPyjyu1nxzJC4v8W63P4RqBT2JSTaQGfD5jxnJPUnE9kOwAn6xLhcE1bB1nffdE9SIAUK+dXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TkwADvhJvLxPDoRLem4FWa00jkkUMdnNggsvaX+lEvvQCD1Ua
	msA+wC4KrTw3buV0E4KRUcCAHIkpgN29n9t3d5I5Xt2+kBL3UONurajCScLB8mF4Kr7zUKMXkxH
	Kr/rdx1iYiHbHu/ULptq0bed28ZEPj2tx/0r0toa0whjLcfpK/iR+6FZ2MqJ78ozBOaE=
X-Gm-Gg: AYBFou3XDXa8a3f0czqUl3adNQdEbcIzbXr3n55c2wB1WafKIzWKI3vOsTAIvGDrqV8
	fpqMaNzt7ZSaLrptAbDtRTsASOR6oIIaJftAanQH0lj61YTEOmb7jpK6RnGSRO34rALXgjs6jlX
	aulj2iDu9cX/HIRRgs0tA4mxoKEPifpTCo0WYP5UGZVZQWSvyTBLfiFdAuuN0q0IydMoVbCjKEc
	0dncj50Bydpumsw/58ogZslSpT50DA0zwtaeLzj2/986eM4uKxJeqNSGPJWMvFnuTIlBKK+z6QV
	B4xy65ehZ+CqMmV2f/S+v/rSd4D9MeT7+MNOdLoj6Gn+/qMsAfEcfxxWkEbxuw09cqAsq1MRZ3v
	lqHTRy8ALWsDcf8yOunOETydWKhYWP8duZjG/r80HaE+hyvjmNXOLmXoSepHZB8fzGphAjcW85j
	6Tzpl1TDRXHf7i9GlnYtV9zgOouzE=
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690550c88.16.1793922699484;
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690523c88.16.1793922698781;
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Thu,  5 Nov 2026 15:51:33 -0800
Message-Id: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX4c35qTlvo80O
 fII9xPPMdrn9JvQ/zhf8Yyt4Fmqd3aurQXvXE6w19XZf1IxNpW9IaSaybl3DhQn0HncyY5KDDD9
 R4UVNW/QzC81J0RwkgodroOWSkINSEg=
X-Proofpoint-GUID: hX1w9Uqon0gjkPHPJlj_EPPmG2E7Qicd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX5EjopobZecnB
 VkS5jj7XruyQXzLHDwVecnlIsZJo115CUim1BRWt1dfW5PgbMU33nLPTchAsrPojnHHvpmrJBmG
 cB0/jZuWbc11AVMsRTr0U0Niy2C6Ro86s+iuiwBdrh0rYfohGTyCjnKaGtIKXUOmfxaWm/1hA8h
 oDJXNmt/1yyZZMf8ZIMjhCeB/VEu9B9Y0IUQHiyaDZi4abJx/jr7370MWd4V1cfuIoh3SsjStTy
 BNUIlEx4lNAT1nGu2LlXpu4zolfqr+YT3vCQLS3heSZRdXhxMBImx+R3K9QUxUP+ej0YLVw2lgf
 5yZ/ruKx7mDA+R4viZUo+NMM4IYTHcZDp3DOqXyRfnuuhWmflKyj6p4NAudqkzgiLMQrcBzSA5w
 GJAiE7TQgc3hjaAAXs5qxN0Yl6ztx7fXXCJD3siAHeAZ5PBODwAGzBz7o/HQCkVNadERb9Q6lL2
 TZoJZiOHVJf8jWUSMXQ==
X-Proofpoint-ORIG-GUID: hX1w9Uqon0gjkPHPJlj_EPPmG2E7Qicd
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed168c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iQrEevU3y8pT7K306hwA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 3's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Changes in v3:
- Patch 1 (binding): renamed vdda-phy-supply/vdda-pll-supply to
  vdda-hs-supply/vdda-lp-supply, and restored the DPHY split-mode
  port@0 definition (two endpoints, lane-count constraint) that was
  dropped from the combined schema, cloning it from
  qcom,x1e80100-csi2-phy.yaml instead.
- Dropped "phy: qcom-mipi-csi2: Make timer and OPP clock names
  configurable": no SoC this driver supports actually needs different
  clock names, so the patch had no real effect.
- Patch 2 ("Make OPP table optional") no longer depends on the
  dropped patch's configurable opp_clk_name field; it now adds a
  plain no_opp bool instead, with "timer"/"core" kept as hardcoded
  literals.
- Patches 3 and 4 (sa8775p, sc7280) dropped their now-unnecessary
  timer_clk_name/opp_clk_name overrides, and renamed their
  vdda-phy/vdda-pll supplies to vdda-hs/vdda-lp to match patch 1.

Link to v2: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Dropped "phy: qcom-mipi-csi2: fix -EEXIST probe failure on single
  power-domain SoCs" from this series; posted standalone instead,
  renamed to "Add support for single power-domain SoCs" since it adds
  a case rather than fixing a bug.
- Squashed the standalone qcom,sa8775p-csi2-phy.yaml/qcom,qcs8300 enum
  addition/qcom,sc7280-csi2-phy.yaml schemas into one shared
  qcom,csi2-phy.yaml, modelled as a oneOf compatible list instead of
  one file per SoC.
- Dropped the standalone "qcom,qcs8300-csi2-phy" of_device_id entry;
  QCS8300 now binds through the sa8775p match entry via the binding's
  fallback compatible instead, since the two SoCs are fully hardware
  compatible.
- Squashed the separate "Add qcs8300 CSI2 PHY support" patch into
  "Add sa8775p D-PHY support" to match.

Link to v1: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (4):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 201 +++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 228 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  74 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 474 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
 
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
-- 
2.34.1


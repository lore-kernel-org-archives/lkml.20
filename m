Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE29331EC5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971590; cv=none; b=twSuHJw6k29TH/2AnpV9paEmBN9CQekCi5RUKAb+VomyaKTMBuPI4LJwdZZv/mwrrpwncoBytB3S6enlNEq4JVD8LhG4POHuN3u77091mLa65gUSGhj8PODeB6gxvL+8x4heGNFnmXiSIZVpHh8Jky7O0tT5RwsMbDg+gS9Ivnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971590; c=relaxed/simple;
	bh=h+3CTS49i76JumwlBIZVMtL9PMPg7KtHdhYrFkHh5AY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cvLffLqIs1kIv18Ph9ZSePoSB1kVeOy9PukvNxV5JDFepjJ81dnHia8Ng/NNJkCFvQug+NDDkq52GlatbEP7swPwtQifXdLhhGWdAOyEIgQWHJDcxIXkzdizbDCLXmlBRyPh2729HFCV2C2wlzev0lxU/NQNUkHC++v51gAUbfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9EMbh5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAxm/d21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9EMbh5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAxm/d21"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4Jdmw002299
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NN1XadWkF+YNKHvEuDcku8
	r3g5rqc1+Br6lTnG7Wf54=; b=D9EMbh5ra53il8jziSPp6KEkMrWAFW1YO0JB1y
	VSmhQO/7NJ776kwcTsvGzlsPjV/zeBJh8cNO+Tj1vAu02GDy5QSjwjkIHDsRQ0lP
	Otg0pTilqrTbsWwBtrGXUwjJjxQBf0ahdmc+QAStVtot+SyDWcd1F1fFEMsZNo9F
	yjfybkdbzn3m6ANIy5nXVGAe4aUZtT+Yha9IIpp7NOezH1PVpSPlIFIi4mvCAPEM
	lGi9+4a56wo9yeVqQKNoAfZBg5fJqP4z50NTEE1g+dzDAw5yULDUHGSg0exmTMhc
	XEBPctynFZMyP4kqQ/7EazmgkXIC7RFVdls7kgicqjyclszg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5gbqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:19:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so2141926a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971587; x=1790576387; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NN1XadWkF+YNKHvEuDcku8r3g5rqc1+Br6lTnG7Wf54=;
        b=GAxm/d21QaIws0X3DeWrCjPTnr7jzQtbJLmtUEMyJXnvFDPsBmAI9UCzhOzTN39tSh
         s/Su3h7rufSBTIHmi3s0gx+kc5bSwbIaR/9xjh84d6mL54wBpIoxlYGDPXP27yFXx1mN
         LFc51I+zr27BUHvro0COS9LNtLgoxsuKRAyy4ssaK1C9L3zx/kfqft8Zyl8SzJUM/hRx
         oPxHP4VBtFqFcqiPFHI0MeDWFg1Lds4XDFNB22I93tBAW53R78iOLZ/ewiu3rQEr9vh3
         CfcBhVoaPWqk49FjmeIqTrO7mdb2E9PzlA8e+DNzV7BsFZ3q/0FuHtGXMb13Zrkt9Bn/
         Qcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971587; x=1790576387;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NN1XadWkF+YNKHvEuDcku8r3g5rqc1+Br6lTnG7Wf54=;
        b=JJQS+80df8jYUrMiLNT8iemaWna5862NjsLJXRNaYmF6zukuam3rFEY/npTdd9FwaK
         ejwWfNMHs6hgj+Uf3BdruNBJ3EUNhPyvH/U7B6tEsq1id1FqvHefaFbhJWd/EnQKmj0f
         md4bFwrylSYu9Fqshxa99nhKyp5yTNDtzXnjqMLM9GKhhCExJzv8R0rmP0HNavFMQeyS
         HI8rbbvcmFG9yLpdt8Id7HuTdfKJi3hwnkeFRiZ3SOoo5KIyILoROSMWKXM+pDEYflQ0
         LY/raG53//iheTmLbS2PyOsJ4FLljw+4S9sSMsXVtQJhLs8nMh1S+VlxeIMVt2lpJNjX
         EjmQ==
X-Forwarded-Encrypted: i=1; AKwUvByoUsW/zkS2UsoZ+HowljjXMyDpqTjL7sSkMy2grYKp6WfF3RQaF8dKlVlkhPTylDoq7PNGvydjx8e/zIY=@vger.kernel.org
X-Gm-Message-State: AFuF++kSW/R9a1SWBpeCzeWPe5Qt9UxpKZv19ONgjW3+DycUxQBYolYh
	j10Q2bkJS1u+U+A9dSI80/+JcQg/4tOsQBS8QNwsahxPjh/3iyDdcvl2pEekpZrfZ2AVnbUjHKT
	m8twZltHyRhK4fATjrmbxTIEPfCqQjOSsiIyy0pPvEXItnSGRQi828IdvatIFSH8maJc=
X-Gm-Gg: AYBFou1DWZsGRZAZ+Lx88quZ+aesN35627xjXdEo/DrPawvXXYvI942XETPQcWv9Pnx
	CllNI+ZquWWpDj+KUOHfJRQHrOYUuo93ysSV3cb2tRjEaZXF4EFOsijK3RlnK8nRP8P+UX/DTRR
	Zs0a9kf0+FvYfjta2V8y9pVtNbrwm/GuaT3Eqc9GSMB2KJ7/xYXBO6tid3wUUBg6zwv2aFqRjsc
	yN7C7I+BQfFUlhhk3Y1W9HPwE+JR3+IAmQskzdlkc3/N2wH0eGbdOJPK0Lbng9D92wKnY2jSfBR
	uuddA5iEBcYi/3AdmhAz+jefm7K5h0OR8FHeaiMOEpeFM1qG15LpkoUvVFC4Ly5vIMBusY2ySBT
	eZVBAB87nyIUkBpN7yXTQR69Fyh+/0I0Z1gq1NbAL7OHNXQGkm3J5azNsjVd5pfLgfrqpBDgY+c
	BnTqmjCktI8ScR7WmXCC8uS8MhXDHJoRZPqA==
X-Received: by 2002:a17:90b:5287:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e54ce361emr15662576a91.10.1789971586748;
        Sun, 20 Sep 2026 23:19:46 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e54ce361emr15662554a91.10.1789971586205;
        Sun, 20 Sep 2026 23:19:46 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:19:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 00/11] Add a few minor enhancements to the Qualcomm IPQ GCC
 drivers.
Date: Mon, 21 Sep 2026 11:49:33 +0530
Message-Id: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXMsGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3cyCwvjknOx4iGyxbpqhUZqBmZGhpaGlsRJQV0FRalpmBdjE6Fg
 Iv7g0KSs1uQRkjFJtLQDbSSRmcwAAAA==
X-Change-ID: 20260825-ipq_clk_changes-f12f06219193
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0cc83 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bMZdg2PHOV3iVps5Te4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -PhhjDOPYJHnvMGQSnlTANW555bQK73P
X-Proofpoint-ORIG-GUID: -PhhjDOPYJHnvMGQSnlTANW555bQK73P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX152MCyAXZdk2
 8Hs7wJ+R2tmTEUTztnh+4upOwST/Wt4XxDkA1TtNhTWVNY8F/J7qB5KZQNYK7SFdZe+jEEyleD5
 kEL0JgRD9j1UqMQIcCkkfipxEMJImck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX468OtwzVHrxl
 vi0t+PwCT4QvxdFFVLKlVLP7zHWLMJYyXZf23Ffq0CN7nbyIooAPqbHK8aITVFOqRX81fQ6vhEs
 UnM/6Bb5PdjjtSL4kbXSwcTvkuP80mFk1cbNb5p3+tWZfzJeASIkbNzOS5ry9X642z6lTOi21Be
 CgVr49p+1HnudTN0v40S1UhPjJPfwfBYRk5IGm+vsjQR1WAhIfv9KU6U9c1tqe5xpes20VZ7nLB
 WjZ4c+Na8g1zPn4YVqYJkERXFP7jZzqko8QB3PPLLxm+Jm3HUYfOiztDaOvoReNUdggjmd0SGZ1
 sQeVIRbDGCW7RWUkLGjtB80qkjhmTxDkWoXPQA59GLae0jr9b0mb/80Bb7dTPA+EWzqo9nO7fKc
 y3OtKjvB1O8NUgL1Yf04mATDHYOWykQhePQjEQ3GS61jXJ/qvZu5BvTEhKu6XhbrdbOz8SVZyfa
 1x/pJwC9JwAgforfbFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210089

This series adds USB, NSS, and clock-related updates for several
Qualcomm IPQ SoCs, including:

  - Configure the USB UTMI reference clock to 24 MHz on IPQ5018,
    IPQ5210, and IPQ5332 to fix USB enumeration issues.
  - Wire the USB3 PHY PIPE clocks to GCC on IPQ5424 and IPQ9574.
  - Add NSS MEMNOC clocks and corresponding clock and ICC IDs for
    IPQ5424.
  - Connect the IPQ5424 PPE clock to GCC and document the required
    clock input ordering.
  - Add UNIPHY XPCS reset definitions required for NSS support on
    IPQ5210.
  - Fix IPA-related typos in the IPQ5424 APSS clock driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (11):
      clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
      arm64: dts: qcom: ipq9574: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: clock: qcom: ipq5332-gcc: Describe clock inputs per compatible
      arm64: dts: qcom: ipq5424: Wire up USB3 PHY PIPE clock to GCC
      dt-bindings: qcom,ipq5424: add NSS MEMNOC clock and ICC IDs
      clk: qcom: gcc-ipq5424: add the MEMNOC clocks needed for the NSS block
      arm64: dts: qcom: ipq5424: Wire up PPE clock to GCC
      clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset entries
      clk: qcom: apss-ipq5424: fix 'ipa' typos

 .../bindings/clock/qcom,ipq5332-gcc.yaml           | 26 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  2 +-
 drivers/clk/qcom/apss-ipq5424.c                    | 10 +--
 drivers/clk/qcom/gcc-ipq5018.c                     |  1 +
 drivers/clk/qcom/gcc-ipq5210.c                     |  4 +
 drivers/clk/qcom/gcc-ipq5332.c                     |  1 +
 drivers/clk/qcom/gcc-ipq5424.c                     | 93 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |  4 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |  4 +
 10 files changed, 131 insertions(+), 17 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260825-ipq_clk_changes-f12f06219193

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


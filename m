Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768915;
	b=FinJnPPxTZKkfDuTwNu8Lhyr9KGBlzesSRQfFermWXibtF+S8tCIGr4K9Tl4dmlwT+xa
	 fJSGRglJTv/6dZ64soHKm/vu069DIc+ytv0RYumOYsql/4vMWaCIKm9Qf1t86mDwF48L8
	 BmDTNKz4koTrf/QelRmpTpt4RNYyM8DTVBmcQyX3RHDSCP76ObX+G+aq+9reBguCwd/SF
	 fksbmOwK6X2rX4Dt4BZdm6QTUavwTosfUPOMNZ2+t+YAFKvc8ERdB5bJdxP8cCcW0FoGE
	 IxArB8gTadmFAly2NbfSWm+Xe6xdAt3rRWlOhotmj93C871fu8czunJURoGfYeBrf9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
	b=eWA2GUC57OBXEBgyXyoXSzAdXCIyZv2XLELvtSlVxq2G8jlUnAAsQl2j98mbQky5OLge
	 Io20bvgn3zubX+YY7XtWizAT+w+eQPfXMh1IGsHoNp3WKgadrAYbyKzeIzftI3G1K0ZZM
	 0732Da3I1nL9pkmX8gbQULJMZNEMUNGYltB6dm9AzRUJNvVlcSXWiWn4DvcTj1yyBrNO0
	 Y29uB2hTXevnEZD7PwXHPW+NjWSF7XtK2Q5WwgUO8jDDtqMYVOzcKRtkrN5odSVTqlVNb
	 tFYhum6BHUhwaA50JFSAMKoqvmwCNr6frFXnJFdwmqpngkFjcmfRSz39xtAA5y4DTag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59309606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59309606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l49cRqF+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aqI6ATul
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQXJ809416
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 05:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nwK1MVA9UCwz5756RDh+kT
	/5Gn+aYpD6Nw0j4KwOfYE=; b=l49cRqF+4xbbkWwZgLE2bW3VTcobyp7uvlEDi1
	yDEMEwT9d00k1aGQR2ak38exx1wGV7uqTIZKOIZdSR61sooEQ7uSlJkt5EWJWzsq
	SuQ/v9lP30wDavM4Qdl9VsHWmmKdtnL9iaL/aBqvAjAPETgRXgXKVtFVoKTMuvXO
	CBCozjlpoin9xUtHNd4/uXI/3pAmiQDOvMNYLeGVK10UKyKiKNnAxTkwY0aNlqrJ
	BVyhZarudSm71vtGMJzQNVvlDtJofU1VYujqUZRsmim1HgGqNH4DXkNjPKmmFO0s
	qtzlWC+A2OfU1cYsaWY1SqBUSrnm+dyQlcMnG5oGMZjng60A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpanrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:08:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso426342a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 21:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768912; x=1794373712; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=aqI6ATul4fNkxNNTs75ytyRgjjHOEK30aOk243zPIdKIwnMpHSuGTD93l60w9Qi+X2
         VufXsZZy7ZyKvYEJ2KikaNW3WutGi8BMe1OBhInpYN9AjgOLPXzUDcwQN/Zr9pOWSmYJ
         6C4+NAmsWr7539UkDLnRh0SydcWQFVtylyM23q+aufOF250wAuBdpySEIZXbTXKC5msM
         YNU3i6R7SxXkZIUPPmP+WU+WrinkfzsBjZ6tk95zkqadj/78mqVE3czXAlatwvI9jNYf
         D+icL1M3l01nkIyzcwauF7QAlXKzUiWbwXADt4GlznkZiOxvoTxTB9YV9ejtwlobKgzQ
         RQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768912; x=1794373712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nwK1MVA9UCwz5756RDh+kT/5Gn+aYpD6Nw0j4KwOfYE=;
        b=dW2t4dd0K3VMM81QP/PPddlKJE5v7SRNnAFBoV+mcg/iBBL/NW73s9hdFems3KBxja
         dJT9FrGIEp2rD2U5VphsvTeYG6tnBKD85jaCMpwSQ+b0KSdrwqXcc/fLPRphEwD/OdKC
         73JrKYDx5vcI85OmalW+s7BgeDHVk6sjXQGzOIEPDh0wO9DSNMN72bva84hbL/s8WS5l
         jVSXcbPpIclQYE2z6OesXeMglk3/JTbAmxBUuUkLttqropop0T5wMb9wbDbFRaLCDnLi
         c2X7TQY2SSvhg+lnmeGAUkfaZzru8o5mqyiu40RUSqDbLRHRbKayjvNcO2xXFYDY7YfJ
         x1gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI77tfskERf5ZmvvSqAeQtdB6KAcoJl2J0lpTycUZSbPzRDmNGftPOpK7gYo34LD4QZqbLXgtN1XDjmsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SEFtZHj8l8TlWXSm4lUzh4GdcczJhZqRL0mYG9mj5DY2idQbI
	j4A5uQv16nZUVKDXwiY/RN/iL1gf99IQK9rSpJTtXwgmsGbYNB7VQYAJ4TPkVZ9I9JnRqUYKHn0
	MF1ysMC1TQ+YG5IpYLU845Tv9Gcs+FbnSvsRfflMpvjYn+4HCyC6qHMaLy2NUtX2wox8=
X-Gm-Gg: AYBFou1BxJc2PIWTZZzPWIYEGAQl1/9iiOyOnni4y7DvbSCG8P+ifFPzfZ+k4WuTDHX
	NUY9E1q3S2ZqcH0ywmkNwtG7vaYDarEDmBIIHEb9WuzQE996XJgxiaqKbjGVXBgX3e6x455t+6m
	Pu0LSM2WqwxlP23cVy9Jw2PF4VSS4VsX4owl99ZpwaGAydIO+jHafijQumHkF9VBEI27nXmQiXw
	5CLtPkL/JtizmtZAhpm7lnKFX2KdJza4fNqKiqN3XxPxeLY05zPu6m/XU1Fq3r+1Ujvpsy3PopJ
	kBU3NyEdor+SKHeWKBMOPt+FZI6bRLkzeg5AB6SpHox8ZL0UzgC4Xkt/vD557NCEYZRh1vPfWtW
	zjQNGrMYQLc07xHzdYeecrapdeBe96OB4EKCeG9inePP9HOPA8Y1tD/blJS3wIgNUX3NKKhtOxN
	iIdQY=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971737a91.51.1793768912017;
        Tue, 03 Nov 2026 21:08:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12971712a91.51.1793768911555;
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:31 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v2 0/4] clk: qcom: Add support for Glymur AV1E clock
 controller
Date: Wed, 04 Nov 2026 10:37:32 +0530
Message-Id: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJS96moC/13MTQrDIBCG4auEWdeg1p/SVe9RshCdJEISW22kI
 Xj32kA33Qy8A9+zQ8LoMcG12SFi9smHpQY/NWBHswxIvKsNnHLFKDuTYdrmNRKTGVpLtOTcoUa
 BSkLdPCL2/n1496726NMrxO3gM/t+f5L8kzIjlAhxMUIrJ4XpbyGl9rmayYZ5buuBrpTyAUyOg
 g+xAAAA
X-Change-ID: 20261013-glymur-av1ecc-7522de7e4e65
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX6gqSEtCtNmHd
 +urbwiJcQC5hyflXfBrbbWcVDsqg9f1EMPjug+qLGLYdd+Dw0nJ6f5qpxA3oEb5NAtrrD5nh/Qc
 s9u9unlNjlB/jZyau2bCRyTihmNLp/vsA7CLLNUxXvbE8FJd0kWmyNjnUY1p2WFVXtuAsNuZ/Mc
 zU8c6F4KJrDr+gSCI/lcW99HuZCGlaqVM99BxNVQvO7Ib0pC8CwGCi5oG1121wl64x/8BN/Nh2y
 f1EM8Wwdb6cGQ1vcMpMdH/JUXvUgdY2ZpTXSmhjOSa6GZ/lTTHSJ5dmFjksvnmVRQwv9Nx9Kcb2
 luDU0B+XYcawOZSyMCjoynXBfg52khi8lyZZjvu70DxdN/HRF64y8zeNgUkLZXTdHgi0NP+TXvk
 MuMy/LlCPBKeHhdHsbavrKZJkPJ6vuVAdjReyTU/tKmdaBHj0dDB10UpxyT1z9Kj5Ejr6XV7Jk7
 uFBi2TJGFqkRuq8blOw==
X-Proofpoint-GUID: RzDqf9zc44E_Zmd2v6i-TCAewAFvVPVx
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeabdd1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JZxBUJHeOsY6iHg-7A4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXxRJCd9chGy1M
 vgUwwiyyzRJlNyMBZFDfDr4jgqyfjhrgwcr4Yyf7iY1Xb3tt5n86daxEK/0yBEPPfvBCQm3edNZ
 ADmNPl3abxFhSi9B/g15cbYoAgiiMuM=
X-Proofpoint-ORIG-GUID: RzDqf9zc44E_Zmd2v6i-TCAewAFvVPVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020

Add support for Video AV1 encoder clock controller (AV1ECC)
on Qualcomm Glymur platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v2:
- Rebased on latest linux-next & used clk_rcg2_ops for
  av1e_cc_av1e_xo_clk_src rcg. 
- Link to v1: https://lore.kernel.org/r/20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com

---
Jagadeesh Kona (4):
      clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO clocks as critical
      dt-bindings: clock: qcom: Add AV1E clock controller on Glymur SoC
      clk: qcom: av1ecc-glymur: Add AV1E clock controller driver
      arm64: dts: qcom: glymur: Add support for AV1E clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  16 +
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/av1ecc-glymur.c                   | 393 +++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |  32 +-
 include/dt-bindings/clock/qcom,glymur-av1ecc.h     |  35 ++
 7 files changed, 460 insertions(+), 30 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261013-glymur-av1ecc-7522de7e4e65

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


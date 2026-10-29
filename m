Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245666;
	b=H80r1WPk+JpD5bdISK4VPmMeRnpK8qYSLYeYDxD/U30rqMZXCj8aOChIToM0dk5bPSSF
	 RFCgh83+i6k4JjZm+T3IrufsNL2V6vmlt31LryXtaHrdJ1pBSmjTJh54aKClV3quLDFpA
	 BQAfbJiYzSPpjAUrtukmme8QZodY+u4vg8rq5myl8i+kMiKSwj23gVR4S5h0UixOLlxzr
	 GBE3/9gKcertdcCz8Gk74CiufD1C2u9q/sH/HA9Qrt5g4AsL6Ah6ZEODQBDnJlC1HSjN4
	 8rlaYR6xnOQpC9OYc8hqifGzuwIN8Dz41iM9XkxeX2czTrzDiZAx1I2rjcLTuXRpDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
	b=lvXtUpSmhLlbQbjMaP3iCPMtkozGyHHguFFTOSirUWqG6pJc7Ocr1mQ/tEzWo1ZN6zIX
	 caxrVvFxZSF8iFtcPmXbkSojzaXCyKTkFeGpJdDyROeou9hxpMhCsa2DiaIsIfZcv1hff
	 2CyBGifhBvi2Q+2L7QrpcVmLUBHDE2Frh4CvJxid9O6EbLHBe1loqMyHSe5XL8CuFmRhW
	 lPD6wmxSop/N8w2oeHTdAALEEwjs0Lony0tS1GFc1VwA3LZOFN/HnPT/ettuMHCfvx5Yd
	 DXVp5xckartAQ2BDJ/b9FeOH9dn2/ss7VlfQyblcEoiJ1g1HvhcZ6SG62/MWwBcACFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6948606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6948606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jdNx4JNn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB42Zu8p
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jmGp3439375
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq
	4MjFPHkk=; b=jdNx4JNnSjRbwRBK2PtSdYaVz98ph1OqXq4WdMO6JP61fifhpTN
	poMHN3/5kTbXjjn7aGQ8CG6h8Kn0HAHRb7xahZqVXJU9zCT0aLpYt1lr9hkeym3D
	8Ib4sy3Z3ImyEvXOoAvePOucAwvVrqpEJtgEVl95p56Ph1EoPgcmyPnXd2W/LJWF
	57AGKw1uhpCXh1e7VK4rV2aJwp6rZF/JG1tr2ZjfiiIklHpXaY9hq/rmnI7vkO98
	qH/82WzD4rWzxdyVwqutgBMujiJLA626/f6xdIfVqthC/D1kwk3iQRbMprcSlFHS
	yLy6QCmFPFe92XCH8yaEjupMzfJ8oyiot9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc1puv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:47:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a1e2485fdso3635015eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793245663; x=1793850463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=OB42Zu8pr8Ror2PR8Z0q4CD3hi6STZ3euJIb1wdNqKBEXmv7SDgub5O+eRMGJpR46D
         yPGGjMJGccV1xgwws5jyumVPnzpfH+I07pIlXQveX8VF72pCe90OF7FPu/2/hAvAGGvM
         7vj+Hv1cBsNWIcs2/uClJsQaiQX5L/SDss1kwx8lgyPctbLEbpPdd7rwwrAygha0zIjT
         2svYB2WmKd14juzYoqCbND7u1RklNVQqsjuy4EdpjOsyU9J+gzeonuBJK6V0SuA1055R
         KJ/NLDOu/HExHBtjDtmHktOacxcE/WVVcZRdGvnmKI4/0WNG+Q7+fx4YdKr4r0uI7v45
         N4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245663; x=1793850463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1siYBjdptV/BY+UrZxNYg1eEJ5/LLx6KQTq4MjFPHkk=;
        b=PC7Lc9+HnkrLTNdUF0X+bWqz3FtsCEsh9IMwjrMkNJVII7nGS5FBpBw4VTufc+iDUP
         VAFIM2e4L89i2efTYRkSLZmJ6MH70YZdLUOJ6Kb9xE2g4yEu1HF30kOSMj+UNjgiljGD
         pFup+LCBF6fTAYxHJJtrxstb+NrHtfFo/hFEJv/3AGO/2yqO8sJXLUNMEls05Mz89B86
         RbXf7zOKls71r8U3cAn4D+Q6tUsE8RYyBJq7whzaMgEKr0uZZPGBewOvqrWmDfiRaU7u
         Q76yRivqeDF5Wo/6253piMY98GzMo0I8R9HB3QN2rN2LE4ApTTQFMVSdIpdsDORzJPsN
         T7AQ==
X-Forwarded-Encrypted: i=1; AKwUvBx82Ql7Vxr+KrtCe4W/WZCLUKUf6AbjkeUi+CS6bepXr5zlyn7QSHje4fcMh/M4yi/X+rmu9KcK9XDnXGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU8BuO147XSijbt0KTh5tbABG0dZ3sz8zDHGyl/YtT4I8IeuXO
	lG419G2WfoupDwYRyoHd4IAkVnfD86Ymf3Tvqcr2ibKJcpPXLtqWfIaxfuHCvQOG2yulqmhP5i3
	phph2vb5pa0h6ZPPygFwnW+P175TZRBfa1XNVfAv4qfUI+jogppjxvaCEF9mGyMTgvxw=
X-Gm-Gg: AYBFou1ckj0YjNiqqzic41lNedCTKG4WAVWK1TKNouJ9IhMf/7gMgFYPUKVzSRZYPFK
	SbEdekDUBc7h/V8L6DynkcFfotGdPXl8CIPccChn5RvDs/BUUk59j6jeOGgo0DxwPalXR50kHtw
	Kw9dFHGkV5fR3eKFNYJVSHPUudUeiYbQaFCDSJlHjFaRbJtJ4MW08hy6LtOexhbD2dkfi5vX82X
	gIeKAe8X2e64uKHZZt2ndy5sKyXAIPpgs5fERjvmn4fQG8hrDuV7a8M7WwEhjsezDXBUP3ifYDI
	eRLp7zDX9QNVEAWEa4BAsccZMgAdqL7uhiRolhBR7yLmx8XIp0QkqmeQHd6mwcChdyGfJhBzoov
	+UirFuBYXYQN7RyIzDIsY4spIXAzA1NGqbsnFqjYOH+KneXHnx9XecgODSmzAxI/mebw77hMOUB
	FVrRxK4MO2akNJAHvhErF/lt4tTe9W4Km2
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877569eec.19.1793245663379;
        Wed, 28 Oct 2026 20:47:43 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-36a203bd31bmr5877540eec.19.1793245662793;
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm11064286eec.19.2026.10.28.20.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:47:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/3] arm64: dts: qcom: nord: Add display support
Date: Thu, 29 Oct 2026 11:47:25 +0800
Message-ID: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2c1e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nVVmeSlITW91QR49vnMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: sb4dds8vel_NEXMtlTSrxw0QinqeVS7o
X-Proofpoint-ORIG-GUID: sb4dds8vel_NEXMtlTSrxw0QinqeVS7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX5oRFrtPn24PB
 0YMMoVemm71eQq9FIXis6B6ckqSZCuLQ9PQ9jWXj8bwwdvoiS6QctyHV8DvJeZd3MQp5p2wUqE1
 JzNYfUL42cCazWmk9jgujN+Z4B5HGr1VnwHt2Qaa3oBKyd5rhtcyyCBDFTYRi2yu9fFqoYeHhM1
 RvCAezjduWRjcDOWZIcU7F29OTb5YQqU5Ve+VbPRlP0hHzfPUYweRknwg14SE/6uKr0n55z+mdU
 ogwKtYPmwSEtGLs/6qGNTFyJFm3XJSbdIUG1Ef7QkfnlOUQ/AfOpQaxABs0+gOd1Ix5LoDlJ/2S
 xfiLNVU5NdYLcschAYP4QJhFZIk5M7cPqNfr1KKrblef+O73cs1DZgI/rYk9vTmgPseKsh4DxHn
 FLqMv1XMADVU8qf4Xhr/x9qugA1Tlrvh9gaMRIlyFpJzih3RcFhnb3G6jUNxFv1GJTpJqaZnHYL
 9Gk+MMm5TLS25+IDd5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMyBTYWx0ZWRfX8NSJDzKI9UTh
 P/iaxg0qmTiMHkF5Qtl22cU9cDSfboSfJ+Pm0i+Wm3EArcHhiWa1DlUTBSi0ioSQZ44z0fXJgep
 g1iZ4yIFVErKTGNQE9f+ulEVLeEnze0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290013

This series adds the display and remaining clock controller nodes for
the Nord SoC, and enables the eDP outputs on the Ride Embedded (eDP0-3)
and RRD (eDP0/1) boards.

Dependencies:
- [PATCH v2 00/13] Add Qualcomm Nord display and eDP PHY support
  https://lore.kernel.org/all/20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Tag the series with RFC due to dependencies
- Prefix DP PHY labels with mdssN_ (Konrad)
- Share a single MDP and a single DP OPP table across instances (Konrad)
- Drop odd blank lines in OPP table and redundant comments (Konrad)
- Link to v2: https://lore.kernel.org/all/20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rename label mdss to mdss0
- Drop clock controller DTS change from the series
- Link to v1: https://lore.kernel.org/all/20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com/

Ritesh Kumar (3):
  arm64: dts: qcom: nord: Add display subsystem nodes
  arm64: dts: qcom: nord-ride-embedded: Enable eDP0-3 display output
  arm64: dts: qcom: nord-rrd: Enable eDP0/1 display output

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 407 +++++++++++++++++-
 .../boot/dts/qcom/nord-ride-embedded.dts      | 124 ++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  62 +++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 264 ++++++++++++
 4 files changed, 849 insertions(+), 8 deletions(-)

-- 
2.43.0


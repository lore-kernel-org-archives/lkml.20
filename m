Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520296;
	b=O05yroGugagLNbL4AWfpKzsTu4GtTbM2dyS6t2QBOG3r3lSR8pASURecWNFITV8toQQE
	 BUX1TKsGPMiMb5BG+MZMfVsb0yX8Y5OnD0OfczhPiQ//wfkvsn7pkSXWjuYRnY2/kHSYV
	 K6U0B1d1MpIjNXVnUTHAOi0uTDXv2Y8vYxInvepTKzuvnCiF+mCpGiJ9Q7e49sN92nJHj
	 GrLkIRhkS17Eh3PevwQHjN5+d73Fq4N/XxL1KRcG8otBsjp20hnxCxIfNEQcfSV+KPoFT
	 3iSUNoiw0fqme+DZiY9P5cvjBwCENjEgEMu7rWPiL0uaht78n9G1Alv4aAUz7YYrdQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
	b=bd0T0k/Nolq4hP+g3u7wrP4INh6g2vMO//iPGqSRpg6sq5SoscSFVi59+Ux3E0NTvblg
	 LcI01sPT9B6jUsW2a9fyiIoyGbAX2OgS/Jdam4V7xvaVgAsBEG2K1j+5mIZQRV9jeVibE
	 F7NcjbKPo2s8ZNeIr2VnVaHRJiJrqCttc/Y61Rtmq36BVh109g/e00wyJ+772Rhs0eaTI
	 27f6d4q9HRP7kp5P4cfEGnpNhlyVQR6muX/qbUrWolyHfI8qzDAamKnF4ELnqzrQDCkYu
	 l4tjpj8TKR+R2KtdZvdenczLZthuHaOpi8tZXB8iFlYkrG9jfg1k0vDxCiAozxcl19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF7D606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF7D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Trx2vTWZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bWV9Syrz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A15KauV3105688
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 08:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3K
	D9ASVyHw=; b=Trx2vTWZH3Uy/rjXBmkJTNLDiInUfe937W9mC+WXttI6kbl6GIN
	4lOA7gc2Itnc6f5Ao9r8tAxn9npwJU7/4VwKTjkQeuQlY7rip4Fc2uXdJ/mVMnJV
	MLlpSEKRJaA02ejyso3o7lZhlbb5+yDMUrszvPuJbvHILRCxAA6hJvoimQ4tdP1D
	TYzYBudjsnMZg4bXpitmc19nFzl0PAHHWfYfOt3vtdqKDVMZRNOwWOPGTKyuogr4
	DAx+Vq73O6yk2UJT6dj9t3d7I0hBhpVIHhGWXyGB9YaOQ1F5E2EJJ0AX/79D7jhX
	MyEtQYlH5Ua2EhEpgBsA39ei0AuMdZdLPQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7twsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:04:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so9388448eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793520293; x=1794125093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=bWV9Syrzk7pt+JISPh7dl3luMSa6U//B7c2NvcBApFiknhiocfHdpFV7sLjQY+7Owy
         19AR+vRFDTJlEg84oFJ3JUKTlj2gSzw0iw1ltGqJDlRp3t8kFgN8YYJyhk8HFKF0WinU
         azuAETnkHnCesOCqbujp/wUuuNxlmZoYRGP9ylSO9jv7z4ocK93bNYVLfXg+YcDn+6w4
         ouJRfrBAUqm8h06XNvaljVc6DUsPPZloBXcWOz75ln4PCdDeNz7U5sreILj8OZR6HHyc
         jZsV6EpiGonaXxXox+H6UCOtsJfh1DHErWVNsUCOTNQHwkW/kCEkp/jDE7GyLWu9xzpf
         gPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520293; x=1794125093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFmAX1luoARi+lbgNfe1tJjLtvwPrpjBC3KD9ASVyHw=;
        b=iVeXSeR7ml+c+eCOte4X6NkA8kz4kqQpYk2ji5caoOZV9Mg//T57QqeQcO2r5Rot1x
         8djFro2rmrfHraEx5FsEmJYBNhiMBnG4fC8kXxYuvaU5cOKCslDXGhDwNfb7IzPzbMAl
         LS+Sd8LepRHH0LDetH5y/s+yZsl4LaI6XCI9mPUiR62on+85dG3wyhs9j5AV787Wd3H2
         mAYAyr4sm7RonSx4yETo8ApMKmdkqoAbYnaKLYT+/F92US/kgbOToGoVr3rm/QqakzbQ
         GeiXB47C8ytvxyiF9LDgPNANUp3mczdJJ1GPeMo47VcEb3JWBDVqF2lYrVzD/ylqHuNm
         GFmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+gzG5LlRG7Cx4Xtby0ZqHdi0KpWbuko+sE1BDEOh4fm1rpnsQoxTsPYH+XS/METssnUjc1j6ox+lBYyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9ygtNVcAKqgx51Wt+cFFpOSocQrnDQkd5G3UvCAQiRfkdhz0
	R2ol+9CvvDMqH+J2CgGOYNop0Ye/dwa3+rWvUTnm3DjI16xFLmwf62XfZ5stXLCuYZx1FoYzQLK
	VDObtP97xJQDKAx0AAXTScyczG6i7QZwC6x+eemy0LXTmgmZ3ep4JQAskBai0Av/nig0=
X-Gm-Gg: AYBFou2YblBU5MkLweA6lgPs6vHdI36iwycBkbc/8ySwLpXWDLxTNPfDyh4qCjXPJox
	dOiwTnrV6rjXMNTEny8meKXRg3uSQKUZ0cU2+dw8tYdHWxqDc0ZIOYwyDXGhItXtX054o5rtMe0
	lTnGpS/erehko0vzM5x9u2IFTGvOy/VGp7q8fY5igieG9tYD4xrGeOpxPEBtW2IbIdnOymOqfB7
	jiW7LEriJwT8tBQjuUF2a0AmiGuhBXe0aoeP9F0rniBUvTt0Csy38/GI/woJgAOKqfa6/KQgqod
	5mj+s1djY/bft6DaYXo2919blkWgmgw3h7tBf8pUI8habs5qkrkDeTQqNzmzHqolf1UrNwZuBt7
	oVZRQu3KcgaM0ha5w76cTkKau74JY4kzIGIfi2TssDkTYtV6ISo5EKLmZdxWhCiCTXmzpzxrRlk
	UmOZNxTvHLe0gnT3gATiVxYwNUnQ+o49dj
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966780eec.22.1793520293021;
        Sun, 01 Nov 2026 01:04:53 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15966725eec.22.1793520292406;
        Sun, 01 Nov 2026 01:04:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm27341792eec.23.2026.11.01.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:04:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: Add Ethernet support for Nord
Date: Sun,  1 Nov 2026 16:04:10 +0800
Message-ID: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XQ-LdNo6MMZWqXllXtNKU0Jj4f-S1h0f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX0AIN3AOdN1CN
 bvYH4LWVma0nokOtjpiOGNXZ6do0Wzbthesr/VUpAwavbP1nfZe4X4lADAXcu+H7dpSrcUfguaD
 dAgxV4Ej9yiaO2IwjEDxfz2Ri9YafJw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzMiBTYWx0ZWRfX1+IZ3a6U8R8Y
 G1xGRKhmqxSa4T/0g5kOoWxsXEk2kGjd0FGWfNml1iHCAB4JdMuSGkSYND1wVJC16Sok74tv44g
 6CTTz9cZd3VlfEzpeePd+2GU4cAKQcHLpi477up1HvAebYmT3QsvfEtsRLQFHZBl/Q3BQ0hGGck
 lYVTQ2/C0U1j7hMr5a9ri/WHuOgtF2Xtg2AKs0sOIf2GkZfKi9fgF8PGCKTv04aGC1a3TjXfKsY
 8upAhn7yoBNg7Is5S+PIcHyJel/ljI+LfClwOoCOVZk58pnz8mK1lZqJpMqcDnsGWgJhdmLufVm
 o5lEAj2TJsTyiT0PUjh80G9QYrpWySgIUNoVFIJxH22ZQDjLs7qq3E5X43UPR2QP3qfnO/RcBJR
 rGTZ3CxiNckVNADdQQpanup2tPV4vVPYzEVQX/8reR0aE9j92Wi4RAW9LE4CsaoWRW2Nisz1neO
 FhFTb+hx0K0S8RVUu5g==
X-Proofpoint-GUID: XQ-LdNo6MMZWqXllXtNKU0Jj4f-S1h0f
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae6f2a6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c5OIkBcGCNzrVHuk8D0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010032

Describe both 10-Gbps Ethernet controllers on Nord and enable them on the
RRD and Ride embedded boards.

The SoC description adds the two EMAC instances (qcom,nord-ethqos) and
their XPCS blocks, plus the SGMII/USXGMII SerDes PHYs they use. Each
controller gets its clocks, reset, power domain, interconnect paths,
SMMU stream IDs and DMA queue configuration.

Patch 2 enables both ports on Nord Ride in fixed-link USXGMII 10 Gbps mode,
for the onboard firmware-driven Ethernet switch. Patch 3 enables both ports
on Nord RRD, each connected over USXGMII to an Aquantia AQR113C PHY on the
controller's MDIO bus, with PHY interrupt and reset GPIOs.

Dependencies:
- [PATCH 0/3] phy: qcom: sgmii-eth: add Nord USXGMII support
  https://lore.kernel.org/all/20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com/
- [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing
  https://lore.kernel.org/all/20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com/
- [PATCH 0/3] Nord ethernet followup
  https://lore.kernel.org/all/20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Mohd Ayaan Anwar (2):
  arm64: dts: qcom: nord: Add Ethernet support
  arm64: dts: qcom: nord-ride-embedded: Enable Ethernet

Zhangfei Gao (1):
  arm64: dts: qcom: nord-rrd: Enable Ethernet

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 124 ++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |  44 +++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  88 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 282 ++++++++++++++++++
 4 files changed, 538 insertions(+)

-- 
2.43.0


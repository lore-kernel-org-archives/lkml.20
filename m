Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FE834B1A6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894182; cv=none; b=EJqOdqDv1kmsPOd3X9MRRLKqb6AEzJmCCGbj678eOZbM5BKokvnk9CWeE9qQnw2tA51kbmcBIB3IzpQHsxsfY/jbh5zsmjF/fJC4U76239KDE6j1t7Fs8kA5s9/YYFUWWCx3Q2r4pYkg3XAcSJOc/aG4MMveKVJqBLmWQRgb1RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894182; c=relaxed/simple;
	bh=JxpFjcchiG6Xh13i4eU5vNvZPmGsunNpe9P10/u/k4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OB5pQy2TOaZi41MxypsLVSPcMBWW3AptvCLao3uJZLCzwfqrzq2fzsLLC6Mvzr+qv5uogLNUGHJIxE+SFrMd7hiQfebNo21MEylLGbdj71dTA8fHsPHqjUCgleoiLZnGEQgA1YFYa5m/6Kn2wbyyLf2LBUV5gwJEnIeHA2sIxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E20f+JOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBPvPVUO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E20f+JOk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBPvPVUO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8Vtru1792184
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFs
	t8WgyJbU=; b=E20f+JOkALUk0A438H0GWXhaCbfQRcxi8Nb9oX/B/Ypyp0A6j7s
	0/idLuY4qDoYiPEgu7LSytf4GImOHfvMfHtHac/qaHwuco16cYp+plD7q+GrAhcj
	qfSoLGRh7PZtFtQSmoGIQ6xSiIHUmIy4XFn7b9ocq5yM6Piqr0wJurUpVjgd9Z9v
	afxgbVGPyFlj+k56tQTQP238mMPnsNXbXV7W9/u0XJ+0P6X0fPP0hGLhfw8rB6Pv
	EUeiNiS9PjvUIL0G6r3d5H51q3aaxgX3HXTpouGQhlKcnSx4sNw3ZpmoDTbvP/81
	a0aiIyRrBiWP6WEfbn68lOJqeCEwmsSAV5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftqc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db3b126c9fso28818445ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894179; x=1790498979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFst8WgyJbU=;
        b=BBPvPVUOhjNBafoR2MOhAlZAv3njBME0GtUlcArmJ8dZFQnsdLZaGXgIgs9+MjqXNw
         s/IdYDSeWJxi/jGRCyrJ0MlTDal+/bT1Gffw+evozBz5hUpc2OPrqDMI2APFHVDJO1ci
         3OucM7B2N0gitKGDdnfGyL4dg0uIlUMZrXMVp25YnxSnePRZB05qzsKqFCg2j7qDgNxV
         HLmiHqVNe2TzRGrXhug/B6nYD21hfoC+E7eizPyegR8q02EpJ5odWAGCyebsATx5/HVv
         O58Mz/1i7izMf2TGK7bcDN1SJLGVyTPMDV9qg82KlvFOjA98sy3SiLIgEGwO7mKalUzP
         +qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894179; x=1790498979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpT1tEVtAo/+O7tOUvHpW5WT6sKZ4zfBFFst8WgyJbU=;
        b=DnWR9sJ4X6l3/kGFXNBXjPaElgGfvnzF9NS4qmsNtL1ZUHoZsgrtZ32HoeHKrwZqVV
         t7U9Ls/EQ+mC3dVpiezm7RtjJFYKzwgwZsz2RsLzunjTMj9ER4QPJ5kBy2yZKzVeJCMY
         3XcVG2uJXd2nkJVM4oQQnHJ3dZglziov8j61VI0IuqrHq1MP2ioR5LwRfsfplx8mt99k
         /+Drg3t7ldnpvlCnV2UbLq0QboskzdGo/TEq6JqsRcm45hSWl1RsVPOmV0r63hhXl8Or
         6XkbNSJJfrXdd6Rch8Ae/jzjtkOpjJz7fAJcck6l5tJOyhMOiJ1Hq/TKGhxa1e2lAPeB
         uKAg==
X-Forwarded-Encrypted: i=1; AKwUvByg4k9z+/uMfruTZfn8muBBRDpfy558FjMU4KgAsfd7KIvq3f0rOPE7xXzftk0qOfcRZvqpEhWEg1+vwQY=@vger.kernel.org
X-Gm-Message-State: AFuF++kUKo+U1ncD2VfxhgZkxhh53MJczQhHps5s6k1MZCtfrEsUxoJ+
	UCZ7Vdv9idWqxnmN2YC4t5bXW+DZKMUmMiyLMAGfUj43XXITB0nq2WGSlOYYpwZcdaM0T9yv8mv
	F1h1j0tUPbPqBLTnZhHKpra5Bdwhuq3ds1DsTvJAHnQREpl1X0N68dFtzXTmU+chVcnE=
X-Gm-Gg: AYBFou0VcBfG0SCglbAAFrOE8ntCCFiWELkOQyeUbmfq1uc0X2jXrrErXGnk9iirrOc
	vrGTLGAH5laGA+/X1Ly4lhwufIl1xberUPCeMZSl0lyHnuV4r4uBaHYSsJ+9IeMh4YdWFE2XRZd
	vYHskNAevMg7i/fyuCiX45xXmVv3Te822l7FXFqcb0hpEHfHtvLEkoJMr/VPeGEfIu+/h8AH92E
	kmpBUpyRIRFgOGbOFf/U92zIZDw8QLoQz+gw+mj1xHaPsN4npYJfAj1TdqrqKIZ9/RGBUt+R4pc
	0vjaMY39Bp801Sr3TY/iNdrclFMkYtKFvKvSSMCgQMduy7yJExBVOgsYT99KnvfcnAh6eoWFT11
	vNBYdKHmG5zDCOuYcXLcWL6SRQo+Voe7V9q38peVkCC1MNYYzRGO6KuvTHZVU
X-Received: by 2002:a17:903:8c8:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2ddc054099amr67982505ad.36.1789894178883;
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2ddc054099amr67982355ad.36.1789894178477;
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Sun, 20 Sep 2026 16:49:14 +0800
Message-ID: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX36PswKxgroh8
 TfahfvgPboumtYsKidtYUe0Hx9bh9HRWXA09S1ZhS18OUty+5C5g2cdNH4zkcH5YiODVLkX5EOd
 K44YB61FTKc/OmaLhddbH3ZFV0uN1imXY1+A4L+YntrnUk+BuLrfCEgITqMamuUQhhQtL9mMLF0
 1fKhEHsFJgdrrihXT6gMW5uVu3eh1DMgwgR6U6ttDSW0NJZLb1L+bfkoVZc+YIouWAgYkSWJugh
 4tDwd5y4frm495Mu5c0wHCnBORR053Cv0X3nqnI2bhtHfhk/v1uISlWGIEChi2HmahCCdA1fP8Z
 FAAD6Fk9+XVn44jQ3PAiKRdKuTxglHKUZJczdcUgu7gCZ25ftT9MpEbll3eYitnorivwANuax4q
 iGWHFm+XSCkfozl/TJDQ38poVj/+Sf0AXMeuW9SaBk9hpK/JWXDUPiaL6Gjml3tSAXpNM4TLlHL
 tq/ebIz8ur8XdDVPE+w==
X-Proofpoint-GUID: PvoQ47Pij-AaZFl8EfWI8yS_k0eCDjh4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXx2dtpqClXNcS
 KJNOleo1PSxmGGNkOh5CXDp0waqoP1jwJGxPbOEf5Wbu5NYiTnhCNZBv71lFDMZG6qK7+p1IfbQ
 GIMF1Jw85FobLfz82Vtd5Ia7VlFaOYU=
X-Proofpoint-ORIG-GUID: PvoQ47Pij-AaZFl8EfWI8yS_k0eCDjh4
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaf9e24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w1NXodApJG8VjLo62iMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Tested on next-20260916

Dependencies:
- NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
  from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
- Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
- PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword commit log of 5/6 as suggested by Krzysztof
- Add memory-region for ADSP fastrpc node
- Link to v2: https://lore.kernel.org/all/20260904081619.593602-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
- Drop unneeded regulator-always-on and regulator-boot-on from RPMh
  regulators
- Drop SMPS regulators as the resources are already managed by rpmhpd
- Use pmm8654au compatible with fallback on pmk8350 for pon, pwrkey,
  resin and rtc
- Link to v1: https://lore.kernel.org/all/20260831032103.341633-1-shengchao.guo@oss.qualcomm.com/

Bartosz Golaszewski (3):
  arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
  dt-bindings: arm: qcom: Document Nord Ride Embedded board
  arm64: dts: qcom: Add initial support for Nord Ride Embedded board

Dhruvin Rajpura (1):
  arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU PMIC support

Shawn Guo (2):
  arm64: dts: qcom: nord: Add support for ADSP and CDSPs
  arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h          | 144 +++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 +++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |  37 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 907 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 9 files changed, 2192 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C28347BA7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895471; cv=none; b=aMqKffQpHhZagPPFYfcF1KY/7ke7YEE3uwpj7/fHBlyEKaO6MXwY8CSJ+Sz8hzbwiIbYhhimFpmd/5EVeRzFkYyuYowsdI3Kc7LNperS9CwUBJgt4vlJTrNhjYlEO/PZA1Rard7hWdWiL7bwYRxxP5V/fnhmzvjspK4/LElnLzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895471; c=relaxed/simple;
	bh=jUKKHsJ+wNOoevjg3zWqhCwj9JSq6CVvfcbmi0VNi8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qf3pbu34DKjDTM8nKgTSy1FCdq1xmQ+S3oL7F6OKoj7oXUbrC7S5wwECGO8+AB/gMpPYmRAed5otrCX5SohoHWacrscM+oz0ikNR2yR2q8oKut/y+h4lEL9Xf+c8/UhIAWtzeKB6GPz+5k7ilNPN+aXIY4XgnNkhQFUr0cJI+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik0XnO4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e56fBy48; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik0XnO4w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e56fBy48"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8W9PZ1793582
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJ
	gFYfKln0=; b=ik0XnO4wi06iMVcqe9ScEp79zOAgZDavDyIHPsfYUbGpSMXLwdm
	b6c7eIz3hEK8/4PmWnTtuQBXo0c+q/Vswbwe/9C87s4u4nbDWCPQLvtDFicusPJB
	8gBgWrhY2giWSOJWxqI3g8TJJZ9OP6eWVfZJCfeSkIaRR67m1gVT74dt2+dzk2Vu
	MqgasRb0zOUvMvjiMcsuIjnNHO9gjwpGvhvkTphoP7vfiiVoIKhkebjTrj5PtU59
	JPZVbLv6nuxmZXuevTzgjVLfR+PYjBAgRXV/88ek+njXZFy9OePEDgDvW5Q0Ua94
	O45JrRbHOESVMzQBjZYfqe9n6HRXoLc1ksA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqftred-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so37702015ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895468; x=1790500268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=e56fBy48VqRHwC5EG+ftZrpNkyZt9Twg2SqBYFHEsaa9+/t21JbVR3gPJq0Kd3lpFt
         N2usdZ3+6CPJ3eefVOFhaq/EdtuHUJkmj4ohpwwsEE486ACCBCl8hvhUoCrLJKkXNPKC
         s7vCs4oqqNQy7cyerxJPVP6AuTmjJFP/iCnOs9RUtgBzK8fbS6v1vnUSv+oNCr1yLUce
         PPBU04mKtj1w4drKc8i4CepQz0CQ11By62+gWz150W3u29XF3paiyzlK8a9gMCCOGFC1
         UgbQ5uyyjeiCcZaZwONSP/4T8EvGP8utgga7mRTdcA8sXDmq+wInX6KFKl1imP9rxNVV
         dKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895468; x=1790500268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC3U63Vdt2nrgMKKnu1GOaFTrNnUgJkj6dJgFYfKln0=;
        b=VS3z+OUttIFQu8GxXw14cww5vbxxS/aAAAfuPcd+EsbeNcVyK9DVKWc/P07/hqdJQO
         4SwbFadQq5Acw6nFpaNJFkXdXoEii5hIkq46ZoNuzL/4U2yPZadXA64TIQA0WGuTYn2L
         I7ungHozbYp1nwEXz8F2JsLWDW5Ha6hnx/qCTFN/uoNX/rul+3Ec6waOEEuxIhRc8joo
         Mlg2RFNggqPJYrOzBfu6HpuculU0hgTAXBKC3gfLQGLFPX2T+yWmxE1dOWypaywpgC1B
         1ksRi2TF7nULQ4Mw58t7JxVJKwLevlmMN0KSdZ/1XbcriTjC8DkKewjtEAyHeaQ9Unme
         7N5g==
X-Forwarded-Encrypted: i=1; AKwUvBzRcGe6+5/1ewK0QAXbEH0c3rrrh4X1eQpfKc53PLqCJkOSjbjzBDZBNR7ecs5ylUlIZ5TEMPLgitj2dqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nBD7sUI4wmsPuYzicVDCgvnfh/bfyYVXizeQ/CRbbhwhFbdSQt
	GOcgLDy0JceB8LXEY+0nt1yQOYn3pd5g4Ww9rrseLKT1p8kSr7Au43VK9gjKaYgt3IMXANe2Dpl
	dPUUnl1KNvzAgmoumgluJimPobl0WIqm84RxAtc01AXsKM+khApCoqyNqf1nkUTzR3Ho=
X-Gm-Gg: AYBFou3jYMVA4hykjK22z0baZMAb3CdO3huZWmHTxQ07tRdzo/CY8HcCVOaLxAqc2na
	o/lT7HJt1qBgEzRgBXC7OUJCoIyHsgT0FPdAdrVHW65k/yTER8A+TGFLnfj4/BEc1s/0WLLhXI/
	+CuAFnNQSpGPdGB/jUrRYyxxWXl5hl/eYEBw2PcjvSiqV2XOQ1mtCTabSWGm2zJYnTbvHyWORir
	CoTzRLYFcdHoktxWCgki/9t+1mmk12CdBG9O+7Xh7zdilaKfphok3jn/bn1jXgyDrD5k+WokQL8
	qgJICvxBgh9GCDPPdJmqw48qBfjeqMjjn4FEPLUGWUY6P8DOGh1LJc+8wPv8l/Y36Jxr8bxf8VR
	0eDp1g0iwTnJbStTA+IJM1qk9zSJJrrN82Vd1t+MIOC/tf3sxg83/VyGxTRs=
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497365ad.18.1789895468339;
        Sun, 20 Sep 2026 02:11:08 -0700 (PDT)
X-Received: by 2002:a17:903:3885:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2ddb1b8987cmr124497185ad.18.1789895467901;
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:07 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: nord: Add camss support
Date: Sun, 20 Sep 2026 17:10:50 +0800
Message-ID: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfXyzZ2NLP5almT
 IftW1aRIt8DHuQfQMV7NhO7nSYvtmYWEyMlignIEXx9c4YmNb2KP77zBfOobDZmC3jG49/2dzy4
 95mCReBzLnE9nPsuL97d0iQQyIsqESwgLpcJ6gnRACng477mpuhQqUQNf1LixrMwvtsSpeVm9y5
 8aVIf0C0ccmWODc2kmfWmM6wdAzNvP9BQMdTpzqINE4tLSNmm3w4uIyRFs7Rb9kbXczOhll7yAR
 kTDlt10JjHOrjUfCAP/k3zHvlZ3+qihc4n4XufHLL1rDT2XPVZI17gGQH5cJlJMh8HULX02PlcT
 wAkUoSm6C9uAXQk7WZzSWa8k3H/wSXnVsVGV5FT5kGIG3sLTHOixuJRnpk1lSe8kQtnwXnzWuAy
 FrqT9LYifTNXMR3Jl/a8pWjzjJ67x2Oxd4pM20THjv7+Zanb+EzkdAdoHIa/+/pONgphHW0Z8um
 g95ujaxMrrYrwAGGAGA==
X-Proofpoint-GUID: bX6dTDizdtwh6AiiyncGLLpoVKqle493
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX8SG1S+cMJf/f
 iHdM/6x2nvS7cFEvtoLsNdftAuyc01pdsL19HFw1ogTMjubJQtrwpTEoh4jrMHCY8ZNl8M8jfni
 /dtwpo5juSxVmy8x8Q3/c+UFZbfxOko=
X-Proofpoint-ORIG-GUID: bX6dTDizdtwh6AiiyncGLLpoVKqle493
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aafa32d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z18lgUtyltjxkIEc-I8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

Add the camera subsystem (CAMSS) node for the Nord SoC and enable it on
the Nord RRD and Nord Ride Embedded boards.

Dependencies:
- Nord CAMSS: https://lore.kernel.org/all/20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com/
- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (1):
  arm64: dts: qcom: nord-ride-embedded: Enable camss support

Wenmeng Liu (2):
  arm64: dts: qcom: nord: Add camss node
  arm64: dts: qcom: nord-rrd: Enable camss support

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  64 +++++++++
 .../boot/dts/qcom/nord-ride-embedded.dts      |   4 +
 arch/arm64/boot/dts/qcom/nord-rrd.dts         |   4 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 121 ++++++++++++++++++
 4 files changed, 193 insertions(+)

-- 
2.43.0


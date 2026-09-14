Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996363B2D39
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369331; cv=none; b=PlQh9Jpb2x82Vv+cZBLobVXcKJa9Xzzg2F/ELppoU0GIeefDD5HvP8SwHp7xAfXHjyWB0F3ICzyibds82CazM1P13SEI6kfJxHosTODQZ4BqJEmVM4oHUE3Ne0XBsVOsABweLnrU0x08X3v1eaklrSJ+0kIj10QpV4l//uZpfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369331; c=relaxed/simple;
	bh=i3X7bXY12LGDSAHzrx5fd49Mj5p5W5ARx4JofDHNaKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sG/iYbl/OQzZkTiEimhF/byENjkBaHLiyjRPocL1JUmw4m64GIfhraS4wvW6BT6LZiM7fl9etwScjAb+ZY3ydLCfxusxKfcBTb2utbcr9yVYIlvOFL42+IKjAbU7SvgrmzVq/YEEX50jN0tFs2Urc1okN+WYkYs9D1e+ZiiW1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7LcKAu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+q4FBl8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7LcKAu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+q4FBl8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iv5j3739599
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=; b=V7LcKAu8tO6JKPCt
	q8qRbgrW05oaChIxtHO2R02ycSN77/yhdRjQ4dz04LpIz222szuEZHyUHkNroRht
	LDC1Cq3WuK5bWPUC5oLtPE3l81WEOBodHYWjdok0BkYVXbWKCjaeknjogxgDTCGK
	LckABQwyJq29t+ezPL7qAKQdSmpNcaV1wj8GtTSroQ73iM8E4o6CjBeUY9ee30F7
	zmjV1gPUlLHAgJcOGC7O6yAD2iK6ti26YKaSxXBTPXXBTOixxIP3ReH3XqumIfkM
	hgcd4IILP176f1bV8IvlXhkO9x/UbfcAXMNDqUb/P2/buJdLdVG7jx5RU2P2PeLX
	UuvmAg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dddt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:02:09 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c16df7bd53so2597308eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369329; x=1789974129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=;
        b=I+q4FBl88iihf68VgHOFPnleBEltUvUwlQ0IKI7Mq4xcIMgFAS+tWxEmEFDkYMuBv7
         RZx7e4zjqXhhyj3JBmqLDiPwcaA4Rxy8vcY3RORJrDBg4Ih8EB/b1KrI2QHw7y7bRMlK
         95jbu7sK0M65pMDmF6S4CDpvSXz7M7n6E0ZW8ThHDYXAB48o/GvfM4QkqjYA6yIT/h8y
         cTtx2prZb9qpQr2d9yUX9Tj3SM+46PbKex3HdvlA7fbFEEzqLqhGgoTvs+5w1CjxvIbr
         bZARLgG+4pP3y+ZjXV0M7CuGvyEPxPagHtosEcR61Mnqd6bSwMQavuzSKVCeZUCpZX5z
         VApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369329; x=1789974129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PE7sMS2mftUf1+wn2Bn4ZVpHKV3DcsVLenNeeQbFSkc=;
        b=DCWz3AbrmMLBMhDJzjjIJiqtkFkBa4rIWEAvid+9Yn6QvKFP3jaOCIlRlhNxemwnkF
         iSC7hifXE3jCaLcQry0XPge2rIshwKjyf67AP8NdfdEjxco6fj2mfEMoruxOjyVSfqHJ
         z3rSxbf7/o92IGMRCZCBsko7jJ7GHLncKbltw21APDMO1SGuulEVcP7RELQaOoPXEL8V
         cf1l6D1eL0okjOzkEgwjzOUFljd4BcZzyzncxBNhSxS+K/Et9pyQAgROcrsnBww48Zgc
         ZCqUPTpA1f4ISm3940TmZ/rXAGVT/5i9lXQmnn+09Di414J4R5hxByM8i2GqLhhRClzA
         A++w==
X-Forwarded-Encrypted: i=1; AKwUvByEmx96rF2IoqKk2LHamzALN4IpjOJz36mtGNndpJeanfkDPQNaJoIgYMSvOLY8pOBS+/+3jPdQzvu233s=@vger.kernel.org
X-Gm-Message-State: AFuF++ncglb2lzgRBwDhAkf+rj4bl5kmnYEXkwEuRuLbJlK4agHKDgf0
	A14kTs//27lxizJtoo/PSG2VTjpt/Ls51WYSoykUF2f9g91dpzpsymmJaz/cj4ICBRMDJVZ0Wko
	s2RpsMN6nZQndzdp8xb3X7Vn5FDnlY1YQxcmw/4ib98XFH3KjjhnVSRXHUDKqomQPB6Y=
X-Gm-Gg: AYBFou2IK3VhKFxgnEgW1T8hYuriR9WUQlvKJ+UCdq8pYdgH9BBPlOjiE2v4CnBZVn9
	McW5/caUmd5oYIL1aoC9xbnXdZSjQ8OPph+caX+9mvsqdvpwQMijt+2JxOKXHYQTNFAjKjpuwRe
	0+KyLuh8CtqcGN/sBJ3/KhO38DMsTRaWSweAQh+oi/RsIAdYw4gHXTWZJi3mKKbTs1MlvEDU0b/
	mJDngXifFFgE8IM4yrjIT/GXTW3Uw+JpRJQHTKHhEh+KmyETWtkuOicKArziDJRktQWq0IrtIi1
	++n+TsLxiKaVpRTTQiT74c5Ih4OgsxsF84vIXXzCAA37ZJWmlv/TcNZeWsdWJ7KZU6/L06J90jb
	wzzR661xsl4xXnehrlDv98mrBsu03
X-Received: by 2002:a05:6820:f00b:b0:6c3:616d:efb with SMTP id 006d021491bc7-6c54057da45mr565814eaf.17.1789369328884;
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6c3:616d:efb with SMTP id 006d021491bc7-6c54057da45mr565782eaf.17.1789369328467;
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:02:08 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:30:00 +0530
Subject: [PATCH 28/31] arm64: dts: qcom: sdx75: Add domain idle state names
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-28-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1892;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=i3X7bXY12LGDSAHzrx5fd49Mj5p5W5ARx4JofDHNaKk=;
 b=mu5mh1mf2kXeIDMZX4td8W1iUWiYh3dUe4HGv4LwMx0eezC25tfsZJwkLIPksqVgdhHrPduyC
 qth5mr+t+wYBXz04gtBnq7wd0QrqCxSiG/jtUCnBq9Uwm9efaP5LEdC
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyuT2LkfrNzg6
 519COc8KQCGrlfdbkYF7UQdYIR0xVnbbiqUwD3x3AMIBPA4sDBSKAgSAVJfJ67rSCZ5aAgyj+Zl
 c7ZUG7tkNtnZlyFBkmYm/MzLlVjCDOOLvKa0KCDMXYPwghQI+XSZo11x8q7oPpNYOjvQy+5IEgP
 20Hvfmockkl2aaORvd6C/5g+fTkAEaHBVO+y8DVPHVzI+kzubghopVj1LwTJdaKV6aJLB/DqIOe
 75dfOXKJYyTjkrU2yPt5MPIaKBdI734zi0Sh6fAIOJ1HhQ8RNKC/7Y7y9e0vOjkwIoQnWrtZx1T
 SMpxGIdcdJ8/KfonE7zvemZqERJEkWx66K0jlU/pyX/qaj4fIOIvUdb0gbTJ9eD64B7nlTA6kFY
 ve6DlJwL4zWwTpluK/qOfrgco1gy1X2f6reAlQjqBnJecOc/I4YbtgQwSQWEd2TfyKDxWyEW5vi
 NPlZMI27zxNnPIyT+nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyHm7l3p9VC7Z
 G1Rvfp/mQZTS8wUYXbEeg7wrfuO2uast6gaUs5MV3IFCrOXm0/LPy/XUhIx8yRiGfG5nqND+L1U
 JrxRM3c8+bEFrQvA6s6RNd0B5Y24KG4=
X-Proofpoint-GUID: 5UYMHajM4lsppBJIEB1sAdP1Me993Azt
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa79bf1 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8fg_tvuPYJi1a8Ph9hQA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 5UYMHajM4lsppBJIEB1sAdP1Me993Azt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 81292850e531..42a44176a32d 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -156,6 +156,7 @@ idle-states {
 
 			cpu_off: cpu-sleep-0 {
 				compatible = "arm,idle-state";
+				idle-state-name = "cpu-pc";
 				entry-latency-us = <235>;
 				exit-latency-us = <428>;
 				min-residency-us = <1774>;
@@ -165,6 +166,7 @@ cpu_off: cpu-sleep-0 {
 
 			cpu_rail_off: cpu-rail-sleep-1 {
 				compatible = "arm,idle-state";
+				idle-state-name = "cpu-pll-pc";
 				entry-latency-us = <800>;
 				exit-latency-us = <750>;
 				min-residency-us = <4090>;
@@ -177,6 +179,7 @@ cpu_rail_off: cpu-rail-sleep-1 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <1050>;
 				exit-latency-us = <2500>;
@@ -185,6 +188,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "cx-ret";
 				arm,psci-suspend-param = <0x41001344>;
 				entry-latency-us = <2761>;
 				exit-latency-us = <3964>;
@@ -193,6 +197,7 @@ cluster_sleep_1: cluster-sleep-1 {
 
 			cluster_sleep_2: cluster-sleep-2 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <2793>;
 				exit-latency-us = <4023>;

-- 
2.43.0


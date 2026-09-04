Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A003DD537
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509800; cv=none; b=pzXWzF7V+bSYGyvP7xAqsQnQKVKhCZSb3MZfIAwAXuFS4ILWnwzFfMjZdDOFE9scSkJlaqJSUNEk6XbETfaLuP3/NqtxQIsswwXcG0Z3W6am8Z9XqYObDHBRkVPpGyd9EtUP1rDPvU+3/ZFxpEc0ggx9lcU4mRShD1JHgfy/z7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509800; c=relaxed/simple;
	bh=Vj8cNY9hLGLIYW344ii8bg9ebs+OjeRiEG4ftZ+zaho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2iQSfAZkro/WDGqSultzvbUjKOmhywvyV72QxaxJEtsYvWaLVtZmgjz8Slg0IDby7jMLIj1w9/iDrRsfquZne3uAVi1o2SBi4PePujepeXf6GyPvHIcM3HH0xywPC7fdLosH/RPs9RGB87D+oEmlSww35zo5kCzDEfE20uTQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9FVNFE/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXCgvs9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9FVNFE/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXCgvs9b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnnt4111308
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KECliQdzWf8wnsMTgExACtctd8PBA/vkv6f
	+iGR52+g=; b=d9FVNFE/jkjc1BXQdQvXeV0PoHSR9KzcOEUA6P19Rrxblx/1wKL
	Zx4aVo7Ebiwgn0oqOrdW+XGpID6gseWkXfz8U1fefdOXo0vZoMlT1jxSu2+UZT0l
	OcRZYvW405WoyyZ9tmvUaEzI5MgdPxMCNc+zFCtOrc35T2Oen0qIqhW1oF4k/TqW
	D9YN0gpK34weh9gm5l2ofIFJudUFAXjMYFSouDkJEcX2v8fxpdSiXNQhsDhlvD4C
	QwUa7IWB740WX0+xoTkfXUU3qVdYMxkNzGTOedzz+2kfpO3BC0SS8ig7MksvNG8G
	eSn8SBDYjmpt6GquUJq89dNWDYRcoSPnbiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1c97g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:16:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso2207016a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788509797; x=1789114597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KECliQdzWf8wnsMTgExACtctd8PBA/vkv6f+iGR52+g=;
        b=SXCgvs9bBeUqjPVoMEqA/pPPl4IdFkXhoW/+BLJVjInWGH176DeteOpa/x4qafOa9m
         37PmGJ98vQ8wWMHtSxQzYWNqXi9uqMVICStuoByqmfsZW34eUKTtwHL+vKKyRIHokn+u
         wikMNoxz3AbGVEUZ1Sc07F2tcTZXaGgD9XAvAp/CtETI7ZC9+zh4vRHATKCl71xOjgNs
         D7HKHxsVV6ULlDgUuJKUBh1+0tTUg+l82ghj3JP7e8A9mVBuWh9brA13ddikLH1achc0
         UMGjVwHkJMh9HLr0tAaL0sH/KYYW5PeNzH/hvSUiIzUK80upo8/rUtf2K5F9zOsiVdRH
         i3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509797; x=1789114597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KECliQdzWf8wnsMTgExACtctd8PBA/vkv6f+iGR52+g=;
        b=ioTyGx+0OfetgolSOFT/TbrmwEPLtxfVvIRw4gu+eR8IZ94Bao2VqaDyzmGbk4F6Ag
         Zcb/VP0Srb0DFOiIc5/eANM2c/diReicXlRTyMk0C97HBm3XTQ6NYVnS8Lqds3kq7zq2
         YlN2Uz8JTo0beLNEzRH6GuKsA/80KY2+LWblKuyxgLyP+SqZtgvtuqT6mFrMTMyZTEV4
         zCKbmg+PL44MCIJZtBS2dBOfrxO4DIEjs11OyS56tHPuQTgRSxlcH8+MfGQ0jKOBQpox
         hmoE4Da/cu1zAeRp7MSy5XQCt3Bx3KFCln79yAsamYJBnqlgI5sRr8lyY3t+Lpvsivl3
         QM3w==
X-Forwarded-Encrypted: i=1; AKwUvBzbd1d96THfRbVmi6wKr3UO6UlbHYKv4anM9UbRsNniNOJExfij/q3WPfS4rBEplNQC1VOmCQOVCp3z03A=@vger.kernel.org
X-Gm-Message-State: AFuF++nqD//Lg9aYVOz1DTGJbGCbAuPFr2QvQaPmNTiDrNeckQ3LbFeJ
	UHETMvH6GMmuzYf9vKcFdY1d5CUrvS3RGGQkrn2l4EAt5880i17WvrDaCwAJk1Xz5iZiysurpXi
	VeBRLwb2vyG/F/rz2UjnJWwTuprt7AHuzhsZuSgc41W/OwXUmivEPCb3torEyhtlOqSs=
X-Gm-Gg: AYBFou0GFxktC+tQiAHYAeEE4p47a5e4yzL9R0EzPmXwT3oMO98bfpaeLBudfxcv6xw
	PnKAQGMfDxyajS4Q/ju0mLfgWUmS5QoUoGuat4jE31I8O9B3ZBz6+KnNQvdtWyDPCPYpifD9Gww
	QpUvgjxo8Ubx7kGR8IPd9WMlWSMIbGQ/CTxJR/+sPKozgQm4g+Jte4q+GQGLfVR3JHaVKaFEVRj
	TkkTosJ2ppAiibXDOASLuV7kqUdu3t8HpVe91KC5xwtGq5LliTGHgDqlsxowOXOVDktMGu+Klv+
	BwlEbqLTMgGLoiAkjp8mbxM9ETI+qbckBfFeR4g/3GDxxtm5kYdRn+MmBOwh4QqQLMAI4srJ6AH
	rF1Wbwthzsu3HRALfZUwRPOKeEDkoA288wnIBRZfT36l52G1IHI50Xj7ZAFHr
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr12099906a91.13.1788509797492;
        Fri, 04 Sep 2026 01:16:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-39b0803b0efmr12099862a91.13.1788509796963;
        Fri, 04 Sep 2026 01:16:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm5466648eec.7.2026.09.04.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:16:36 -0700 (PDT)
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
Subject: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC support
Date: Fri,  4 Sep 2026 16:16:13 +0800
Message-ID: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4tRG4N7Jy0eDCwEgrlc2sgICPd_Var44
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfXxn3jTZ8gUGZ0
 Gnkdh1OhXXFE+qLczK3B6dmVxPlhwoTUJajb1/Ibn9E0H9uerO7zxorYyVkagN6nGTx0SPrVatm
 KJPDJxk/9IJ6lfvaHAvcvAdPq3XW82A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA3NSBTYWx0ZWRfX+9qGBFzpE5IO
 ZhdglnpLloOJpyQTiQCiZ61HaTSEi7W5bqKLy8uVSe1YG1Kxu4aSFz+VHVgfmWk2amjdAdCkQXX
 LI6s/4Vx5kNTu8l4pyyZHV8kLm0IjLZ/c4IcRthjVYRVS76DdE1qUeWcZ7ZD0wBlvo0IK7zGqlF
 2mjlT+xKLAZ/IsoEuCB1USpfYEfnKtuF3rLc48bI+YhjFh406YezPCNgOYrJPU/J+xDcLLdQjy0
 1w32axjzdn8FKnPkVk3RD+q0bAbacoxWdeX7u+AmCvoQjuipg2e8HlWHRAIJcT2Zl8NNSMiOYyv
 w8HGxjqCDPm8iGikhKN5Dl5VyxwR4orLAYL4eBxYGylBUmAuti59dZwefV6dtOtMOc/wHUE7XEv
 ioN96vhXd++eIz2OnkB47Wo6o1S1X85PX36XfWxYBfQyvjaCPLQMMObOYXDfSgLcPSxpO+/nGQs
 7qvH2SQeBNXXfpRcb/g==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a7e66 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1H_KamcDzeWEUM87CZ8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4tRG4N7Jy0eDCwEgrlc2sgICPd_Var44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040075

This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
and the PMIC descriptions for the Qualcomm Nord platform, and adds the
initial device tree for the Nord Ride Embedded board.

Tested on next-20260903

Dependencies:
- NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
  from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
- Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
- PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
- PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/nord.dtsi            | 906 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi   | 543 +++++++++++
 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi  |  54 ++
 9 files changed, 2191 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pmau0102-nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8650au-nord.dtsi

-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0E3ECBE3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886633; cv=none; b=RVgkriYnP/RJ6+YEN7cAbx/ckzGU7dZ1cmSQoXwpNto3Di/W7Bt7FlPBW/ZGZMZCDF0FFQ7Jl36PqHXJsQdKoDbkHr+Ld5c2vm2EcRh2tpMsvevUK9oCQRX0n5U+v2Hjr45R48wuXGU9vtVZPS2uquGdd06IRLfibEdD59Lz6a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886633; c=relaxed/simple;
	bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ch5dI6z3b3fvKwhGwPXBrIKAoOojtiHpc3irBVUmqMysyVkTQF5Aa+64ZNR1DYEgkImgwxr9k/7OP4oEJ06VoxwsqNn7Fe5Mwx08X+0hIFsnGjmFcDzQPCwobXNi057uKGQ6SUh9qVNuISzLAlckBaTBWWYHXA13y/8yhXOOGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QikgHeQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp6eRoNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QikgHeQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp6eRoNV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YrHR3208369
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Iyghy8MFwYNuGQDyF9Cj/p
	HPGN/MU2WtXwUAR2dYSmc=; b=QikgHeQHbc3tpD0I1eJEHI6jgE680Fty8o73dP
	pSqipWE74RRKYLhGr99uOKiS2zpUS+Ydr7t9oClXyHGQ/wgNkUXkHan2eK39ZEEb
	4MvW1mKBUW2q3ki9GsVEMu3uLA8a9ffVBSqcVvkjICBTPWTyHWzpK/3XpgEdda2F
	xq+EcpiXBv+8Q6/UO1vy9IvEFBMJfIc5wzzXUY8Rn/UT2jCdnCTsKj3lfJU7w5Sv
	FWnWPAkBDmPawYww+3wmEg/xIQQ5YMyJiQk5aNWQMGdtx/Df+K3M0f30fYpzbGnK
	sCrGz/yePcqVMZG/OmpDhw0BXzMW92NjSvYchicDKjBvX1cA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgwn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:17:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so25247985ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886631; x=1792491431; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=Bp6eRoNV3UejleBdBd57nH5paTlWeW8KnGSb4eSYSvMMqpxK8H5XI7YhsFRVFZ+K+w
         6Yb7Nr1nezeujS4bNcR7S9RGqsYvgsnOyEViGJQnQXo55VWyjsTPJotUFq1DaZbcs70Z
         a0ilBZUa5zNEMMdvPYTwxIOTz3Kfbgis36GHeetBob71bmv/Rq5z12UWNhs3X/LQ2TRn
         DPA9yJz3eYD8U6KwO8C5XvA44F3LY09dGrmLrmqHDXRqz17bVzCI750oERRw7X0fUYIo
         ouxxeGtb2o7g/ou9NnJuV8CEp0SMlJFbTqjFa+fe1rPdEChQ2lY+V9Dzz4ZLTcE8PXaF
         2Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886631; x=1792491431;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iyghy8MFwYNuGQDyF9Cj/pHPGN/MU2WtXwUAR2dYSmc=;
        b=zfG9ySSt7HJVauf+bhDzMYDvXUJkSFphxT38Hd77LHVoHalxgvVB4Nj5RiJVfZfIZh
         gVPvxwC0i/8x329eTOHO5oTbjXDlzLDzx7obGLScCn+J9kppOgUGs4Dbj7thvOM+57Kg
         s06Cnn5hipWhu6ayhWwwsvddu/7n8nhpEQMmbEzcc4edLsSSct+i/JXpKkQHn+5hnWqH
         4D9hHFCHJhJiDaEdT6zOt70lIjbUv7VH5NiCx9zLd1NwFkOw9UtPdZbpih2P0IascgOB
         121DBgd4uxczLe4t+qh4weY6t4Cscevx4gH9YhqSdvKZXhxpZhtl8p31JbsFsDp9Sg80
         e0MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFcqeCQGv5/bXZvi3DzMYX5yQmDnBWtb6enpZEkD/bbblXdA0KocTrMr1sq/tAAmYZCSnAAyD4RbH1hA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYBAGHAg9TtkqsXtxmPLsqgRWg2A1d/FPoCtfvEtTjd8YIXd2z
	9m2MDXHW0yDCfMo4eoRVxIgyF9aqyHhgWp/moQsPasBGCMh3/z0t1cjep3vhA27iG0vu9KCUzGs
	io0bLJI5ycMtOYqD+n4u4+rd1cloRebQurp1Ef9Lf6gPgzVi6t/9vry77SXlEmpvwZlQ=
X-Gm-Gg: AYBFou1X9eyFRfF37Fj+2SBZviNBtnR3uAGXa7o02iavC8YgDUVrOnaDnu+qmiQ1w+6
	vZ84rpzs8m0Hi7Z7H4X0yXDAATg1GxPA22cHb/sdDNogntn+F2EYT9SJ1UmGwEBzDi1ODB2iyu7
	X1g+FaVbcnIbvyTJd1ElZo+FomnoNflJbYKOQtBcNweBqkEWALELsUmD6j/K/42uFeAgUP2lnpe
	JOB/pxF/rjA3kJJac3gRSPrICg5NhirAJJBgaRcrcIiutjhAS4YFGnjc4e8Gh1nYTq5QvY7TEf4
	2tsvY/4MaciwLl2kFUdx7q1QqNd3J0naDJ+ywcWGsWF/BYZHIvQVRs098ue3ljKPfDEA2Y+sBbY
	h4CEthraCv7q17aEnzckolo4KorzAaHfERK4thz3BNTX1fBY=
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018304a91.10.1791886631073;
        Tue, 13 Oct 2026 03:17:11 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:3ac:450a:fa46 with SMTP id 98e67ed59e1d1-3ac450b7738mr1018281a91.10.1791886630551;
        Tue, 13 Oct 2026 03:17:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:09 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply support
 for Glymur
Date: Tue, 13 Oct 2026 03:16:44 -0700
Message-Id: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAwFzmoC/yXMyw5AMBCF4VeRWWvS1i3xKiKiTBmLkhYh4t0Nl
 l9Ozn9BQE8YoIwu8LhToNkxkjiCbmzdgIJ6NmipcyWVEst4Nh7tgK5ha6GkLXJrZJb2CPxaeKT
 jK1b177CZCbv1zcB9Px6p+5JzAAAA
X-Change-ID: 20261011-phy_refgen_1012-10f76fb054de
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=1971;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=YP+18ZtwjtU3nUHwx+tBGgStmo1pSIBVMNOd8oxFD+s=;
 b=6frf+yFXAaqyaPmdIMAnDHUDfI1y1k+enC6eYkVgkgwXK+bAtirq4hJ2csHaAqmIn+syIomZF
 29mOtBxSC7pAmRLvlxvB1iL5wicGJueQVPw9Dj+sFldDwnqxrF2p8l5
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 9II2lCfHteXiNuhSshtyiV37KfyBxMVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX5Z8w6mrsUAoS
 TQVxT4yAfkxr5nNbQAjxF/B0uns9wQl171Sl3RMQNJUtyaZ3uaJXp9jlI9KMKn06EXmVxR4bCWc
 yywYSS6BhHZbRPQrlOyQXUimyCg1cRGzSnXrqDddXescinevRCsMnxYW7XlFhDZziMkjK/jPaa5
 vEj9EQLV2OjAcTElR4vf9A591Wh0HMuoXPtQK+QU2d7w/2ST86d+pQkyxdY7V6Muhq5cpkZYyHn
 GxuPSX+Jh9OIoJ7AZ/uh5aetuvarRUAI+YJJVbJ8wYRC+2msfc/ce5TUNACfOPhz8RVRpO/h45P
 f2I/8rd0dROwRA1q0/KWIuyvGSSL16LWSIuO3Qhqza5WHa2Cd+3xvkZPSl+XhDcQ6DqQmXe7aq4
 8CSrbcVCBCJju1e3X+Fi1gYR72uWXNfZLbV8sn3s2NXPTRg5DujIOJq0DlPWxCrGPCFm7M7wVI7
 kX73Sj8t0g0dOeUQUYQ==
X-Proofpoint-ORIG-GUID: 9II2lCfHteXiNuhSshtyiV37KfyBxMVC
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace0527 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IXTrTkLk_8iMRye1LOkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX86Ytj1hgZXB2
 Jg+/6R7afSCl9aKcxnq1MBftWq7+y0EySQzY6QrBTUEVUJGYMryB2dKgxNB1F927qejy/TUkelv
 8PXndYJY6f0dxjzl+k91KFiaVe1vm4s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

he PCIe QMP PHYs on Glymur require both refgen for stable reference
voltage and qref for stable reference clock. The refgen requires two power
supplies: vdda-refgen0p9 and vdda-refgen1p2.

This series creates a Glymur-specific supply list including the refgen
supplies and updates both Gen5x4 and Gen4x2 configurations to use it.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Changes in v3:
- Add vdda-refgen-* porperty in all glymur and mahua board.dts.
- Reword commit msg.
- Link to v2: https://lore.kernel.org/all/20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com/

Changes in v2:
- Add dts patch in this series.
- Reword commit msg of dtbinding patch.
- Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/

---
Qiang Yu (3):
      dt-bindings: phy: sc8280xp-qmp-pcie: Add vdda-refgen supply for Glymur
      phy: qcom: qmp-pcie: Add vdda-refgen supplies for Glymur
      arm64: dts: qcom: Add refgen supplies for PCIe PHY on Glymur and Mahua boards

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 16 ++++++++++++++++
 .../boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts   |  2 ++
 .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                 |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                  |  6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                   |  2 ++
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     |  6 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c                 | 12 ++++++++----
 10 files changed, 60 insertions(+), 4 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-phy_refgen_1012-10f76fb054de

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


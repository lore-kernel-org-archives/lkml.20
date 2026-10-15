Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7554D6C55
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061564; cv=none; b=ZJoz9QofGUiQKkPRsuO5GTaXUGU55GuHskj97SK87u8PqSd7RLrZZxxyBpZpRWh2MM3eHRjFOzAAPB71jlxnqbHZoh5EE1S2YV4ho1lypO5UNTRQlnufCuu37OmeNsWMFV93tKfsf4TFtsGLkJmh2hGBrBzSHdep5epaV4XN5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061564; c=relaxed/simple;
	bh=sVgpnLeu8qKcaimXEVH3dwit4Sjz3mpkqpxC79rDFXQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VyoVVKgt511LiIZl0o+hUMfwH/01BhsQvCr0YrFyWMHaf6N+u1KgFL7qDJgLvktzEdVxg4I/g7Hfx+ZPS+B5McQNDZyFPdrszfXnFrvWBiPakYTB53+HI8IluVECiQEaiRxLEnKDrYDXfbr79pYvkFArhFfvRqi38SLahqd/Q8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmBgMZWr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/1EsjkL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmBgMZWr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/1EsjkL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPu4P1596377
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FbOJrqM1Ojo/79aAYHIn6B
	axFRBvvbOhA2QLp7tLQrA=; b=MmBgMZWrt2WwhQwGEIZRGhb3wykXXh3UPmuHuS
	mrdUJoYTwNZ9s92huU9Pv/KZfZL8PZm2DMTMsJgozTlaHmBerVFkqYtb/Ovzc16n
	BSmR38dTDta8uUNrtZQc1SszfPkfGnjkwVnNclGyEPUd92NW/5Wf97wB529liS1I
	NDVxiS9f6/RnT8juudzP4ngYjpmWD95D/woMxZKeZZobCkXXOGrcBjBye+/fb+X4
	qXjBUMmaTBg4BWiSaoUCi7OzFEsXT5/qygAtKPNhowHAruI1wFrcy1edVqXaPRfg
	OJ3FsWjgZDpqJzJVT6CMH4Rqnn+EJXJrmAE7PrWA9PCk7G7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v832f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8484f12cso59935745ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061557; x=1792666357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FbOJrqM1Ojo/79aAYHIn6BaxFRBvvbOhA2QLp7tLQrA=;
        b=I/1EsjkLfysyS1sD5oSIlJS0pLfJQVp8vICE3KMFMiL/WZxUpMvm6AB+d1h6M3Ppoj
         TWlM1g/nwoNvM3nqXksLWNZk6J3ljpnMb4VoJb0fBkokxAdd5BNP1D9TX1uZLlS35P48
         r9dhiD3Fbdp7lCT8My/d4SwsgO1ziPgV3KeJQR9vP9HfaG/ZANO/3Gt2Bz3+PIqQHnlE
         cKJU9zT06Q6WqOLUmnPrKipNZGTgp8W8idR5YU/FdAjVfcTF6xR7d251wczeWAjcOGOe
         +O5KbMTTeDYLNBP9zvdReDWD+Qj1Nx92IpFy0CdxU3VcUrwtn2zOVT1DGsJErIzafIvG
         x8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061557; x=1792666357;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FbOJrqM1Ojo/79aAYHIn6BaxFRBvvbOhA2QLp7tLQrA=;
        b=b0rMft2UJr61NZ1AgNn3HBQYv6uqCLASYar/GfS3HNjTwL6EEVB37rjoBQtp21Rtcq
         0X/Li8rjkFv4cEfIC7QybPhFmQC2XPZPZPRPpHZb6VgcyOJcwzU7D0ki3f/ft3DRdhn5
         3cnnVeDgqxtSc0Xr2gRKmiGYgxrB0OSbsYGJz/D5MNm+NghUSzPSquOhM+ARfRgc48fX
         SRU0Mr5+LrFCUPV17DQZ/RVGW2ekLJMIqSSQXrdxxFk8YSuetJqZ/FxFPUZJu5D4ZMRv
         NriHENdsqziYtOzZOF4xonDE9kjV78OYXSE/ZtP9n5NlaJLA1KQEjpCh0lgJ038vE84X
         HlkQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+jRC8wVdHllRai6D89K6DmR8tjVM0pvgrD8Cr8UWoOQwUsDfK3uFullt1yiG1E1V6oDcePAiBNzLt2eU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZOg1ZkQrQetfJGRzglMuJISGKOHlCAroKYLlsyTs+fKZmEUHQ
	pjZ8yEbce+fbCS6Pqa34FBtrRaXfC7NHm1M7tHT1BLdXtNaBSiFAl0Qr9CS6wgWvzP3OS5NJROt
	1MONyVBRaowK/zX4uVPzkLECTruZXAr02eUY61O0hq2atV1lH0hgKHB8N58GDzkZYqDs=
X-Gm-Gg: AYBFou3StYVyz51BRqoHbvRsEd0A7vGpD2AA4OlHoVCvNnPRCT5TJ1Db5aT0jLvveds
	JLP4GwImcCAWnZHd0Fz7UQI6yPSaFblYcT2X92Y2Z8qeRYBL4uKcABs5A70sauMz7yu4O3bISnx
	ySAdc3XY6bll0LWo20VyB+JlNEzJ0r3vG1YZo9CX7WWr6UzDleCFXZsNPyh41n8qHMoDdeY/m0c
	p15MZ8D/U9jTJMjKVIfBklXOid9rbovDvMMha75xnBP0YqjLbcOrLGz/6PkxfD7zMnAPJI5IulC
	Atc1IW/h1gP5/u2p4BD9u0p7jlboofjy+OZApW/854FI/dVoXgqoz5rBMSKARGedSbbsXQ/X5JA
	IGCN2yDEaQlSOHlByh8hhwxDLZRKtrg==
X-Received: by 2002:a17:902:ecd1:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e842ab6a1cmr133166615ad.22.1792061556817;
        Thu, 15 Oct 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a17:902:ecd1:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e842ab6a1cmr133166425ad.22.1792061556273;
        Thu, 15 Oct 2026 03:52:36 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:35 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
Date: Thu, 15 Oct 2026 16:22:25 +0530
Message-Id: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmw0GoC/32NywqDMBREf0XuupEYGh9d9T+KSEiuGjCm5qpUx
 H9vahfddTNwBmbODoTBIsEt2SHgasn6MYK4JKB7NXbIrIkMgoucV7xg3bC5JTRaOaLGzMQKkXE
 pNC+vZQ5x9gzY2td5+ai/HHBa4vP8K3tLsw/bqV2zT/vHsGaMs1wLjUaikm1190TptKhBe+fSG
 FAfx/EGTd6RV8wAAAA=
X-Change-ID: 20260907-glymur_camss_dts-721052c08486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=2800;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sVgpnLeu8qKcaimXEVH3dwit4Sjz3mpkqpxC79rDFXQ=;
 b=impTvaDflBT+ZbHySaYioQoKy7Yv5CtMh7ax7WCjUcQq/rNkdTR2Ye1CpQruauUgzLw4EQzcq
 BkDPTJ+dr5GA+TVV8q8oeFjKEGWbsF+SJz/LYFVsJwC6EVDAACG3fsL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX/5te5f+fJyQd
 C52kG/0T3k2Fg5p0no9EBBKB0vdttBdh7+BgPZXeMJAtWosqI8H59tblilEh+LCK7pMx0Mnl+XK
 q/6slTTnA5TmH1qtwaCTkxsPaXuKZWw8OtFvukNMOGbKAclX7MoezqmtmcRK6yYqeg4xHGQAQFV
 SDKmuydifd/PrAea9PhO6h/CnqCLN+rL71jwSAYMhZ72O3Gk7W52GHopeTjiDGXmyNNr1EiHc7i
 /FnOgxyErFz+ihSmXjRbEEpD67RmgrEcBVOAvzJAix64z6quwxoGOPuFMo4zvUgWpyK7Tt5I9gs
 dbWjBoFMjvvU0KvJe/Q4tSeKdtcDEV2b+solMmBLZcewC4PYWWCi3bwxRqUsEc54cflfR33J/GZ
 YJROV3WewCQFA+EbrE7Fts4HHe3QUHLOGyTNSHLunWqI8pdZnorgIyl4B2tcq4faIqzncD3jVT0
 VVQqeM6uS71PZ3afNyg==
X-Proofpoint-ORIG-GUID: fmvHXruRL7dcEaoOetmsGZXkLPX6QcCg
X-Proofpoint-GUID: fmvHXruRL7dcEaoOetmsGZXkLPX6QcCg
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0b075 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6dqO1sxPLyHYMyURGwUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXxWVRwZP05AKd
 LXWwY5NjXMtgrzVLwmWzMPwk0kIrzo5SzdLFhiEt/AOYsC1G3KVsgOuUfl4O2PJ71L6CYyfejl+
 YSda6AVqLvdPPYWISa8nMBWSDnMA4rg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

This series adds the camera device tree support for the Qualcomm
Glymur SoC and enables it on the Glymur CRD board, which adds CCI
support and enables the OV08X40 sensor via CSIPHY4.

This series has been tested using the following commands with OV08X40 sensor.
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"ov08x40 6-0036":0[fmt:SGRBG10_1X10/3856x2416 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy4":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3856x2416]'
- media-ctl -d /dev/media0 -l '"msm_csiphy4":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SGRBG10P -s 3856x2416 -F /dev/video0

Depends-on: https://lore.kernel.org/all/20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com/
---
Changes in v2:
- Glymur CAMSS dt-bindings and driver merged into linux-next.
- Rebased on next-20261014
- Nodes without a unit address should be sorted alphabetically - Konrad
- CAMSS node need to be sorted based on address - Konrad
- Moved operating-points-v2 to before status - Konrad
- Collect RB's and Tested-By tags from Konrad, Abel
- Link to v1: https://lore.kernel.org/r/20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com

Chnages in v1:
Internally reviewed by Konrad Dybcio:
1. [patch 1] Remove stray blank line above CAMSS node; keep blank line
   between last property and first subnode
2. [patch 2] Use preferred phandle list format for CCI: foo = <&bar>, <&xyz>
3. [patch 4] Replace qcom,pm8008 with correct qcom,pm8010-i2c compatible;
4. [patch 5] Move csiphy4 port@0 endpoint to SoC DTSI; reference by
   label in board DTSI
5. [patch 5] Reference camss_csiphy4_ep by label instead of redefining inline.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

---
Jishnu Prakash (1):
      arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

Nihal Kumar Gupta (5):
      arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes for Glymur
      arm64: dts: qcom: glymur: Add CCI definitions for Glymur
      arm64: dts: qcom: glymur: Add camera MCLK pinctrl
      arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor on CSIPHY4
      arm64: defconfig: Enable OV08X40 camera sensor driver

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 139 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 557 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig             |   1 +
 3 files changed, 697 insertions(+)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260907-glymur_camss_dts-721052c08486

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>


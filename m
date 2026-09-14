Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B859480DCD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390850; cv=none; b=khQDUlPLOXiW3aRQgM+JLZh9sYK4ee6d4/sAAA14NO1+AbH+nUMz/MJUTEVUJDm95yemR598SkcUKy/VB3vAU/NgJvfAjszfR3OAzNjuOAlGLHVtbE1QCkk1rudLU7d8uV5ube4r2XUDLBTZ17pStE9Kuu80bmcY27X+XAr/yBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390850; c=relaxed/simple;
	bh=DaDbHNeN4t5mWpqn5BX3VVxBvhsm7lc6Nt27ZTL5VaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M/WNBBm5G2RM4a1P1icrIMzAvlYhoF1JjK6953E8Sq21QWtOIj34F1hpiOfddVE/EruRFDKxNLILiYvd1lHhgHexGYZXm/4oTfpLg9J1z6KkK4RAHfQlEJ35zoFm9vf536PwzzErVjLSz4iS/tCsXR2DasYETWGSuiY2PIYMYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3yUxiee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kaa0UGUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3yUxiee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kaa0UGUm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0PBm1514371
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rUKMc6/2Tr33/R/vteANGl
	I/EES5zZPlIHe9498n0fg=; b=F3yUxieeZHjIoUz8+FxUO6hLbyn9Nw6FDZ0LOJ
	OHj1nPYYHY+BCYrjw9Ps6p52X/O1DEmwV8YMkSaFoSuOWvlq+fXgIadc41gQ/tGD
	ajBDRp5LiOh0HYZkpCpaZKauh65h0TDfidDZO9A2DAXJmnM1IdhO7nYUxQw4qDhC
	Kc1IWTU3439kt1thJPhcj6QJBe6HLABpsi8lRVYwf9sEc3+kdKI5Vs0olV8xrFaG
	G7sHvre/yg6jLl6rYSYuxY1mRHzRLLPkJLCgOIjhkmTLd87MMzDfdft4bB6ulYYQ
	Af4JzFSGbBNlvw2clZ3cf2dqi6xF5ZTCDz2uUPRUHmgPTJcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0ajyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:00:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d55d8cd938so58294075ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390843; x=1789995643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rUKMc6/2Tr33/R/vteANGlI/EES5zZPlIHe9498n0fg=;
        b=Kaa0UGUmDdnvdKl7r0pFQM10TwMQTruBRZfMB8//TG/zq9fz0cHunHiqD2SqqLKP1B
         tosi3n/vIX45RCHudTiYi3+FKMgqqcoFrsYz1BOJjtU3nl5PnbMvK8ztJD1qsxZzVEvh
         vwgfJaE5z7xhZTZ7a1O8lOC22QVcANieLCN0B/nr0GanfJgRNT7/dpchd7aImbEDxjIF
         pDJyFsIOSwtGNkLq9EIZMOHM+KRvUt1v59OVBySyc/mhgcrAUEDIPRB85NAqjlAf/eG5
         oA6MdgMHlGCHU1pbhEyI/OvdHXQUkiYJ2pbYe+iH3nWHLoBcjXBnen5iZQ06OvU5i79P
         LQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390843; x=1789995643;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rUKMc6/2Tr33/R/vteANGlI/EES5zZPlIHe9498n0fg=;
        b=ED4OByfwL8L/mRlnmXnasxtk8OAPsEOcn7GW+Kcg3GSzRixZmkpv1uHLYhBFqDjh5g
         uh5/eJVYpJcd252iNiLIuDeU5tYQSoO5wrcQcL6FR1nAfjscYY3SViUF1/57wa2V3bgl
         WghJQ6nwcn/SSGYKTCRokRKZ/nN43QCKviPTXORsIWAjETenFg/z5idRWyOjQTG4kH3T
         Fha36E0VMoXROnD+u1s8XrPiPF2Si0UxkZ7mO9nxt+ksrs4styBkhHNct7teSSCl1ynY
         l2hOjvR2cRJ29rataA3rw6Dg5YQt/b+FcLfV6nO0wyGIhxTGKrIiVr1AEhoYLUytc2pf
         xoIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdPrqJzkNDojEX9anLUC3HHcyTTez8vbW/RhWuk/YnwST0uvUz9VVByOsp7HYublhIi0aCS+fIARkRAr0=@vger.kernel.org
X-Gm-Message-State: AFuF++l65zlHVE5B4CSSfOv7mX6ZGAVfeQrjKfufFvqdy9DOjDrfn+DZ
	maiMpzJbrAyXqEGieM+IUftj88Q4K1GbFQPhvBWfikEgCd34Axf1sJQwhgIK3g1VMEwJI6Y1X/g
	GsG0XaqOGVT4z1xWePsTyZYmmkTNpNPxFAP4kFnYIF1tW4nBTPOslY/KOc+40poZAGKE=
X-Gm-Gg: AYBFou2VS+FIA7MXe91SaZEDVoUy+gBR8c5cGXvHu4eULA0tYcCqBHsJrTKDCFo+uRD
	wK4evnPYe8L/gSkJFHcOR8t2ZgSruB7OOVFp0XjsxGbKMA1YcHLRYMXW+ui3BHBy8HNILDluszg
	oJpso8oxKLkM7iZscP09Ei9walf5gGdt71hWZNkhV825JD6LU10nLaDq25UM3m9pPNCsjYSdEzr
	/KBddjcLuUeqVph0m5/oWTvFUVnAvdBlsK/xu3ocDzulV7g58j/gai2CTCnCmkpApnTxjKbhLWF
	nr+GbmH8GeqjviIfMctjsgTlcrnbFQDrlCJLl7YLQK25S0c5/+plZDQgpA2HGsm0rULpNtlE+El
	nKhQJW9d/u8G0cyTe95/xL/qdGH2Vm6bQtb+6Fr/Q1OY7vLb6Tx92EZpInEhjyIeCdWTqJ5Iw3G
	M=
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr55507135ad.9.1789390841511;
        Mon, 14 Sep 2026 06:00:41 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2db:8ae7:a5d2 with SMTP id d9443c01a7336-2dd6c5f39camr55503085ad.9.1789390839726;
        Mon, 14 Sep 2026 06:00:39 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:00:39 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH 0/5] media: iris: add support for maili platform
Date: Mon, 14 Sep 2026 21:00:23 +0800
Message-Id: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOfvp2oC/z2O3YrCMBCFX6XkeiOTNCSmV77HImHSZtyB/mhiy
 4L47qYK3hz4Bs435yFKypyK6JqHyGnjwstcQf00ov/D+ZIkD5WFBm3BKyNxGAJnLoGWHCbkkSX
 Z5LRrKUZoRS1ecyL+f0t/zx/O6bZW9/1zFBFLkv0yTXzvGntURpM/WiIwUUcHsVVDBCCnfCTrg
 axBj7t6SqXge1TXfCdt1zVwle25Yaizh5Hni9yMBOmjB2fQtb1Rp6WUw23FcX99qCHOz+cLb69
 PUwMBAAA=
X-Change-ID: 20260914-add_iris_for_maili-f6e7273fbb03
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=2734;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=DaDbHNeN4t5mWpqn5BX3VVxBvhsm7lc6Nt27ZTL5VaE=;
 b=u9fIpoIP3v1abLl9QILMeZ7mILZ1WJZ7S9e0g3wKvuR7Hc8QWC/F5cjOeKyOw5M9ADvDSBrF6
 wwNC0Tzb+F3AqcFKRppcor5+efbDpSKMA7uGYcOChUfeBcNhvfrn1Y3
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX6MJpe5DSXZLJ
 I1V9+JQbHZIMIUXPU3Shv5uoO3UXiojZgAK2NuiY5gQlv88CGq1AzjtOKrNx1Y3CSKiwtjadKkC
 +Mnj9Uvp6CFRS8oLbR8sIPdEo8DxZwc=
X-Proofpoint-GUID: tOjyzUcuifcQDdR8pN9qAzmhr89Tvc4I
X-Proofpoint-ORIG-GUID: tOjyzUcuifcQDdR8pN9qAzmhr89Tvc4I
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7effb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N-TFuj4FxbnEaaYKstYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX6ngOcdlSy4cQ
 eCm6CHcny0wDXs395T2+l9DiqnL6h1p0MXsmG7CxiW64DZaOiaqt3pVUv4fr0ekeYSKXJJ6V7qa
 shBOi1akcBi/w4RmxylbwDmKl8gGOYKFAOHQIvXgnqNrK6FM/XS+0WMNKECHIVcz5gn0+pgyUmH
 xuGKHrBnmsEe9j+10egeatfjP09b75cOlGOf5/XNOocHYOjinGsJvyiAU6eE5SJEpeLIzl06G3Z
 4NDUGqheaZ/80hYazNISlGmvRCzGPfvbqiWnT87D4hZHHnrzENcTbCA/QTR1D7uayLEBD9gO//8
 6tm817a4qBtdHgkWmvw2ngD7X3nF2SNhnaEA0FqpZ7zdAWR8ss/2SHXq2WnbHmLf3x7uxpeVglI
 tts9+ZGjFHpaBd9EI1MjGpjpsmd+tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609140186

This series enables the Iris video codec on Maili, allowing Maili to
use hardware‑accelerated video encoding and decoding.

Compared to the Iris3 generation, this block has
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- different clocks and reset lines.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 235/305 tests successfully

Dependency:
https://lore.kernel.org/linux-media/20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Wangao Wang (5):
      dt-bindings: media: venus,common: Extend clocks and power domains
      dt-bindings: media: qcom,maili-iris: Add maili video codec binding
      media: iris: add AV1 decode buffer size support for vpu4x
      media: iris: fix VPU4x encoder line buffer size calculations
      media: iris: add maili platform data

 .../devicetree/bindings/media/qcom,maili-iris.yaml | 235 +++++++++++++++++++++
 .../bindings/media/qcom,venus-common.yaml          |  13 +-
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   4 +
 .../media/platform/qcom/iris/iris_platform_maili.h |  40 ++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c |  86 ++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  44 +++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
 9 files changed, 414 insertions(+), 14 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-add_iris_for_maili-f6e7273fbb03
prerequisite-message-id: 20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com
prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69589496D5B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054733; cv=none; b=MykxPnWFRkx+U0Dw6D+FEuLWWK++x2PLsDGK0SB0Md8qk4x+0yGjlpsE23G3ZNq6zewLFPP7xyUNILnqotncZ+RctPh6BWBGtQdAYQRKGN2WEobPUAkNA+aUr9D1VuXiL0qBbaJ3Cr/j5I35SOohToZbrE13JUAOxmC+AXD4LT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054733; c=relaxed/simple;
	bh=DzOAZZPP7V5LiM8vT34fJpQqdL8F6A0V377brE+YB8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pql2UPQhD9MNrvT6Z6jnxi53fSuC/RSrmiE4J7JkIDDfF1qFF5efxtDRjvAADYkGR1DI1dbcEhBx4PaAGtKOuaRpvg1+R7+niXfkThCaM1WyRIjdLd+0Er9cxqFDU6ALUVfsVCQqdlY3NI0x0/N1KABkWI4vVD9Qt5Qp4lcjgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQc/6Fzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsPltDOd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQc/6Fzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsPltDOd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7O40a2121448
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g2LOIKPWSqLofxnH5RVIx2
	cwVtotRbWzdXgPnB3dv64=; b=lQc/6FzvBvy3z6GyVKobtHgHtUX2qoUGKyJida
	UPmuNmF6YHeTDRnr1W6HnKy4xtHQAWWyk50Xebzjhy9Rcu4nbBfa9150zGRsgoYw
	2fhvpXBnW4i2aZ3u+evUjEnnpGau+5sin3KOmywd0sMUoYiaG1sfMzQ2NMc13ruC
	rDbfHgrWib8qxDK3qt6GsMnTJuhQ9g9dtbGnouG5kOq6UOtnj5YvEbUyJ0+PJ9Nt
	bIAz//wkboz9Wk8hRQ8swcXrQj44Rcie3T7CGDcNZXwah80q3LHPUQ7XVWpvm296
	feepIPkDVbfKvvsSYlH4+G8O+qfzZbyJyfu58OGq5CLSqZTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1upm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so1083446585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054731; x=1792659531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2LOIKPWSqLofxnH5RVIx2cwVtotRbWzdXgPnB3dv64=;
        b=NsPltDOdjZ7FMn/9JtLwIOmUHCecEPbQ6eDDY4rAmD0H2q9B4lv407cLForFciw9TL
         UqbjvBr2qCLoundRpC/AWG5pAOnyVgwU41QrLIGQ043XMmnKeUJHoLqmsBYpHFXsFrQP
         SHrYHmx5OtzSGUe10IX1UumiehrjlFDReBsTLPEl+fFxclug9qfy7+GMey1ACXoKS7bO
         KHgxZSAwoT2I8qS7JzVrdzNzwrIJkg8BZZugGJWBMRaytvzx3xVoaEu6ezRjoXx1j651
         06Z+mjugvvEFii3pKiRzjWKX2dwBPCOJBdPTLam1J+kVJdnoEMn9X6KPlu50PNNseqvX
         ontw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054731; x=1792659531;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2LOIKPWSqLofxnH5RVIx2cwVtotRbWzdXgPnB3dv64=;
        b=gqzRySv1dIIMFiHUzgAmu7BOPTZlFF+6OnQFEXELth2E1YU/uf6WvWZ3L3s5f/r5qw
         dNIK18A9keQJAAXkRkzenxR1gVs7ce7YM0OrB2SrJ+Fhcg4KjsNndI5I2tu/9seNk2ut
         2XN4dAzsG46v1mkWvsofMfNQ44X5QM8eEY0btKm0kIBZyyt42oULEsnmtKoExpTnjb15
         sQIitTJWOcwOzZSgNsB07mirSkLOk77yw5TQDPzz9DYx71pZVb7T1YHjwlO9p7VMQqYX
         UYtq55Z8+YnVCS0eLDj9TGtofZeSWp3wQvDbCPgJOXsTSL4DAdjBPGLYkjq+yWeqdWio
         HOqw==
X-Forwarded-Encrypted: i=1; AKwUvBwcLXHoTVAET5yz2SrWpKyjw4NCJFgID1roq1sfEDKSZhD5vsALuVOHx4C3DjDP9XieOKGyHT7qHpfAe98=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYPv41wqfqSe/HVvPTJnHP7aXhX8hKPdFu8AcmKQd4NwSXAz8Y
	OLNY2IL12d/VllAAJJFkVX3wlrycQww+kgqYPxCRauuq0PaWBDS1cmZihUPwBC4kmfawzRfiWQ8
	jjfZSvs4ZBoJqr63HRRw/aG3yBvJPMy7NTPYtAb7htU7kARgh/mSt1/YmnQxH0NM3tN4=
X-Gm-Gg: AYBFou3K7ncc311aQpp9eD+ijq17IgBOhP1yEjzck+DKf5ewe37oLDTCKWs38+6FLxs
	zb8ir3RgSoWh4blJDKdw4CvBFx8ep8sqGKF4KhuXsiM7nDxB4LijJKtaqBRG6RfQMVxxoNGjYN9
	hjHP4s4IIrdN+UaEVLpZrZnUxsgpxjSh5dwjwdF8G+ie9+rvDrAXZbiP2DqBRSejK8nkCwdbA+c
	oAG1iPA1E/6gEmWRlnRsjQtbcw7Qhd/LQfHXRn6NvqiO415Z+D3Dx+gHeLA5E3jsYYRu+3pSY8w
	N8VWn/+j4xHnPE5msK5HMcPfqDZFBTYQXlK+us//BumFNPtePZ1t+IaSMETTVOZ1YHBWBF23Q3d
	Pqvn01Wjli5YhyrOUxv2XkKzz3GrdaW1oDsWlddV+taM5qOR5tiKmNETxUYfbOi/9KMbgTG9WaS
	OHQGBBoya6BU0X
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr2809642485a.57.1792054730624;
        Thu, 15 Oct 2026 01:58:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4586:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93ebd2751d8mr2809639485a.57.1792054730174;
        Thu, 15 Oct 2026 01:58:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] arm64: qcom: enable display card support on SM8150 HDK
Date: Thu, 15 Oct 2026 11:58:37 +0300
Message-Id: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2V0GoC/0WNwQ7CIBAFf6Xh7EaggLW/YjxQWBWVVlna1Bj/X
 aomHid5b+bJCFNAYm31ZAmnQGHoC4hVxdzJ9keE4AszyaURXCig2AjNwQe6Xe0DnE0eUNWIuuO
 NM4KV5y3hIcwf627/ZRq7M7q8qH6LhPex5PJ39q+11dLiQkogHxul4eQvsFXG6Jo7Jc2mndTi6
 CwhuCHGkNuqxzmvo6WMie1frzez9dtC2AAAAA==
X-Change-ID: 20261014-sm8150-display-card-e43ee5b08c61
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2414;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DzOAZZPP7V5LiM8vT34fJpQqdL8F6A0V377brE+YB8Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXARHgIXLonLZHieroeOkW3Oz63AObd9Cnuj
 PzR2u7N6/KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVwAAKCRCLPIo+Aiko
 1QeuB/4yll4W1X8cb3TD+jh5awefNEjJGU1yDK+LpcAJK8YnshbKfyUpsC8K0gnrNsH6EBCOJuj
 18SCiCtLR6FdwlG9sgp9LBqTzpBfFvq//iKPUbmUo9NwI+mKYIUlqAVT8L1HpyI9Z3XNw08R3bR
 UmNeYn3nHddT474pMst7IPa7lM4gkUZSQqwuF3X92CXyQEvi2dXiIpZMro1Hzywu/4dfPM/eep7
 n4UTMbp6MIXGCCGrleo7gNytWnLJjaSs9KCjhGEr21u3UjRuLVaEWkm/b9Cp9chCFgNidIrNEoY
 7Y1N4XU/+28lq+Cn/x5ndNTAVKaQz9mX/M9Ujf4aXHyoxsvH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX/PgItUVvv20D
 /Vu6Zbr67If5x8e407l05B1qvuy5KxlosUPlaJZBbgDMzpclKUYJWgVgTbRKvp9v/bvrUa6NNgK
 2fpP5JNh9YT8Uv4DiLtl+3AUMSgJwM9U0mG1r81eKNv7ZHQrmm5v2mvo10wYO3u688/LJEatBLm
 lNenZo7MLpcEjjBlxe8VgkkB7EUvCThDjMrhW6lwHjEoXmMoJox7or78q/6gZWtkhdQ+KWHksQO
 YvFop0tZ2kg2eWOsfLIADH583Jm/QXRV+V0xK/PRogfKyHifVjqJrXFI7BS9dDumJ9UX+IOyJyj
 D69BE2Evlz2NLPhFBNC2Ye71A3zIikXHqAj9G07otngEXynYNCfWcC7BqDxD7f2o3UK0Qp7tRCL
 H94bZ4cpMwzLNMvWWC2kXztMpoiN0xAsVDYG2GdxpEKaGxrrFsS6P8MqNZFTE3llmwndWiRwCfq
 yUF39nJhea6MwYpcz2A==
X-Proofpoint-GUID: EC2p4lAX9UveAO2ohmbzBpt54MhyyxiY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX2JiUsx2spgrj
 3iTeuSM/2rNDeQfQxtioOgJq/oYZxrNZ6QsDkF0QX73lN+2UxvS6wuG3x34bq1hcw7DC97xE5vL
 t8JNYvm7YzLH1f/TLkE7CosxezC6m4M=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad095cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4w3W_SM6jFQUSMShjksA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EC2p4lAX9UveAO2ohmbzBpt54MhyyxiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

The Qualcomm SM8150 HDK can be equipped with an optional display card
having the same panel as the display card for SDM845 HDK. Reuse the
driver submitted at [1] and enable display card support on this HDK.

Unlike SDM845, this also requires a new LCDB driver, providing voltage
for the panel and several fixes in the WLED driver. The FSA4480 address
fix is independent and can be applied earlier.

[1] https://lore.kernel.org/dri-devel/20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      backlight: qcom-wled: fix unbalanced OVP interrupt enable
      backlight: qcom-wled: fix string detection brightness on WLED5
      dt-bindings: regulator: add Qualcomm LCDB regulator
      dt-bindings: mfd: qcom,spmi-pmic: add LCDB
      regulator: add Qualcomm LCDB driver
      arm64: dts: qcom: pm8150l: add LCDB regulators
      arm64: dts: qcom: sm8150: add MDSS reset
      arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
      arm64: dts: qcom: sm8150-hdk: add display card overlay

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +
 .../bindings/regulator/qcom,pm8150l-lcdb.yaml      |  81 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  18 +
 .../boot/dts/qcom/sm8150-hdk-display-card.dtso     | 103 +++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   4 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   1 +
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-lcdb-regulator.c            | 475 +++++++++++++++++++++
 drivers/video/backlight/qcom-wled.c                |  31 +-
 11 files changed, 723 insertions(+), 7 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-sm8150-display-card-e43ee5b08c61
prerequisite-change-id: 20260122-sdm845-hdk-9466530c4267:v4
prerequisite-patch-id: cb272273cdb260eb5049ba5cfffe13e7904e7a70
prerequisite-patch-id: 118ae0e92f82e1d5be7b75cd310509388e6f5606
prerequisite-patch-id: efe1cd41bd8c1ddf7c9491a6fca5aec877afce3d
prerequisite-patch-id: 8759433719a8151e1a8399fe88036844f60f2ec8
prerequisite-patch-id: e46e47c4d158362a382efc455438ef1fd5c95f42

Best regards,
--  
With best wishes
Dmitry


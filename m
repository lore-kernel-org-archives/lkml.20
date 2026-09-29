Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0063EAC76
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661645; cv=none; b=Rke7JguG5KqkMR6azz2HB+wwhfuPdnLRvYxz4OX6JWnqC9TyBO57DnYEsSEYr3zD3Uvrp8wHZqyOJz8CGa9Lfj4NPakPEbpDnKGm0vJ7e30K8BFOca4IX4TEu16Dbq/dF0MzHmc0RRO1uECcIY79LjEHKBus2UE/H95mjd0eqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661645; c=relaxed/simple;
	bh=5b0nizKTKV2gHcbpmE700zzwdG567zL8s70a1Uag3Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FNKAvr+4cDDPjVhwtUpixFtmQ9ycXFU5NV47aHBCWlFmegrOAxDA2j1A1GlmgGGj8tXdgS3oK8DRqH656r5bG4TmpDcxhTUvQYrmAc/CWFofbyCeYZg7bD3/KqkrdE7aikJ0dwdHjJx8IGEFno4YGNuGe+uUp7l/b0POceDmlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSIep3L+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlrLawcI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSIep3L+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlrLawcI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T471Z02686018
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2B/omLepkEPC5Z4nbtthkU
	jpba0MqHvxuXIRBucTGhM=; b=gSIep3L+48XY7azyabhPOkNW7fB/pknVHY0Oeb
	/Z9l8/eG6cMcnhJegoqfcOFPSXAv24rOje6tVg+nlYsuPlm3z1Mnaijc4I2BFUz6
	TjYJNdeu0mtAocaVjj0D7oVc4k9JDwHNdq5tsoMOD/ZXExH0D/phHvmXDYw7K/Bt
	QWByBQLnUkD3WRbHU2/wkLxU+iTZQRPitXLYP4ed0xX/5Dx6FQnsmCrC0O8sxLWx
	+sDIBZH5F7gzhFQ3ls8PVGkpOD50bt8iWR1afz36+KJjsbh+ZkNig1360xngqJtN
	Bk/0lCYZdqUtdqfe9Dhdps13zK1yeG6/hrywDb/ztrhk7d6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjh256-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so4408168a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661641; x=1791266441; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2B/omLepkEPC5Z4nbtthkUjpba0MqHvxuXIRBucTGhM=;
        b=hlrLawcI9/G07y/j9KsEGRKTWsHf1sAJDH7+7rbbbJ2ONXvPfye5PC8fGfLTaJkm/D
         ZvPPuI49GnedMiRLqeUXl9ZKg9SwJGYn0cjuR957rTBBkAtmAV9LwYOmuJ08hdiA4RSJ
         H+0aMwBDdP+vrN/dCb7pO4rR3KSr93fP5asMXdnnPa6dJKqUPoswbUDfFTY59hv3J8Sg
         niQVpcxtZIWKMNLexGxjapUySaohdb77BEkwBTucfA9jPXsQDdE01YeP3WFgt1ziy5WQ
         lvWxwG40kublIaF0sr7f0iqympUexe7la8fG8YxuMyoIYyio8eKs7SAWWpNJhKMbYJlb
         kFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661641; x=1791266441;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2B/omLepkEPC5Z4nbtthkUjpba0MqHvxuXIRBucTGhM=;
        b=HbxGWo+kpKodfOIJmCVr+6tmyJYcgIMiZMxaY62DhTI5nUV5QMVVcH1Uy8+yfTUeDq
         NjAHie4mMg/60lEtfFcdfKJeZkHn65L8imQu5SV1CzwCa14yCDD6gJvu1UHowQ9aYLd1
         di4iQOR3n2N8JJFqzSTnrg99Z+o19XcMBqWbXegZizjawb1wV3SrKJ8ggp4gLapYIxiq
         sdPavAi5qwY/GL+95vMdip/qaAodoRh8b5dsei6YYmtX/GA2mqG1RGLpENKE3JDXXjSS
         HON35zOMcU73fKF742r7QmE9UpBGYfUp4wklWCHhjrtiOORbHGwRX17xunVxggWfCaGF
         XU6w==
X-Forwarded-Encrypted: i=1; AKwUvBxKGbNJxnpY77vmmOsQKY4nmmsG4DVZkNYffAyEnaonb0Ukd4Ahqw9WMi7ooD7uoQaSk0tU328pNJBcNGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlx1ETSpJTROm4AMHHlPpQjAVm04Y+THgGt0XlMx4ThyHfKIDD
	1o/H1fE4YTwrwdVJ6gdwl46wiY6x/BKWykSUeY7loFadfZNeO1U8pz1LoCejn7cuw2ZM8/GwHaE
	T7/U+VPIMEq+mescEsus8n6QxmlFboo0PuQVtquuySaA+IoTSM7PdVxXAeXOlt4lQVZo=
X-Gm-Gg: AYBFou2QGH+IMHal5GsNKEkUfyihQ+vZdzqqWeCETL2ru5Apc96MRzRcWwBs1nOkseb
	/UlR1BXr3md9ElSaYKEjIIsUOIdNDrdh+aMrf3ejoFqhFjRSSA25K26sXfoYoZNUAYsd/5WzXdb
	0wEN6bU8snV+UZvjSEDhHQFHKmT/CJi4S4n7XX5sA6zBBpGdDtw8cOzU8GSuBTM9zLInwvOyjzu
	8rJCywIxPyIKn3XZQn8Z949zQ9paCocqb2576NmmI6xQ6LIR8YxTyW6uiEtxPSyxhKdxHTJfSlc
	n6SD7B4TSRYyY7hXaNli1zr0E72gkcavjhnQgjyGjlstdRpVwwWPmH7msMJZxBbopJGYDQafEIF
	fQwxVV8j4xvhYroFOflw8yBYjV1HmcBR65PQvQcpQo4ym2zwy3124TZG2FH0FBUhfwmgG40kMjK
	4ohgZP+meQkg==
X-Received: by 2002:a17:90a:ec8e:b0:39e:6c68:1559 with SMTP id 98e67ed59e1d1-3a098ac23c9mr9262205a91.33.1790661641173;
        Mon, 28 Sep 2026 23:00:41 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8e:b0:39e:6c68:1559 with SMTP id 98e67ed59e1d1-3a098ac23c9mr9262163a91.33.1790661640546;
        Mon, 28 Sep 2026 23:00:40 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:40 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v17 00/11] media: qcom: camss: Add Kaanapali support
Date: Mon, 28 Sep 2026 23:00:26 -0700
Message-Id: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPpTu2oC/3XOzW6DMAwH8FdBOS9VHPJFT32PaYc0OGu0Ai2hq
 FPFu8/QA4fBxZIt/3/2i2XsE2Z2LF6sxzHl1LXUgP0oWLj49ht5qmnApJBGAEj+433rb/6aePB
 NztyW1spaKYzRMkrdeozpuZCfX+++x/uD5OE9ZGefkYeuadJwLFp8DnzBK+nYHLikPHT97/LSC
 LBEdq/TAhfcAaqoK69r4U5dzof7w1/nCwcqCzpCuUJauA2oJEhqBbVDrY2GPUitEP20ASmC0Jo
 ojffGVLuQXiErxQakCQriDAHA2KDrPcisUEWh/5CZoSqW0UQFToQNaJqmPz65sfENAgAA
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfXz0hYIWAoAT09
 u36YLF1sr8jhfn3mZLemwboKr3oj4SSH9MV6J6FGt2fpAOAH6jDt0dOQGL3kqCEJp0W0q2RCuq9
 EOoJUN1jWqmJzv0WIM/ah/zF5h/ySRGYzyPb5vuqm6B1m8oQdxH45otrnN7H7Y6uKUYDLwGPVMO
 +dRepy5iBj4Sw9Wm2yCG0y+sDL1S+1t5w3Z6gbcfYHQGJhjaIGyyd6nWOV/e3rG35jv6lEFSyvz
 RnoYFtfEGdw+U2/xBOIYOiBO6m2qbM+aW1uSJ6AMddfk90u9kOW7+1KRFtFNhjNIiwMuk+AV2Bk
 kQRBX4BSkqQfqF+aebbu1WVUyGWzvz47OG0yesQpT9KOuCyzxYQjMIgjf9RJQ258XzI38lVbwvv
 tqfdYPgL6sVGpA1X0jfiPA53Jy0bVyFxtSLwXrs4Ox3W8WbIcSBhWoqdHhBN1G/msS5NsotWf4B
 K8E2oUwV0tODtwLtCTg==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb540a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5H4PDbKVDpZU0N7xkpwA:9
 a=1QN8r_gLn0Np7Fek:21 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX1gdPQtFj2+/Z
 YnDY0klAzs1u4cc8RTPLkr33i4zOonIbxzeXjMArpeonN8+wyk2vnsJLALZz/lJU+yNdpqvSobD
 apGpCt/sVv5ieG7dqxNhPxbhdzVmED0=
X-Proofpoint-ORIG-GUID: uzCQZqVlsOPqayV4ogwlmIluN5YuQSHB
X-Proofpoint-GUID: uzCQZqVlsOPqayV4ogwlmIluN5YuQSHB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290023

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v17:
- Rebase due to CSIPHY re-arch dependencies merged - bod
- Remove redundant CSIPHY resources in CAMSS block
- Enhance the commit title description for CAMSS and CSIPHY blocks
- Collet RBs from Loic
- Link to v16: https://lore.kernel.org/r/20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com

Changes in v16:
- Remove RBs for binding, CSIPHY and CAMSS DT as tags stale due to
  split-CSIPHY re-arch - Krzysztof
- Update CAMSS bindings and driver support for the standalone CSI2 PHY
  provider and graph-based PHY lookup model - bod
- Add the CDM IOMMU stream and simplify CAMSS binding example part by
  removing redundant subnodes - bod
- Improve commit descriptions for CAMSS compatible, CSID, VFE, TPG
- Clarify the common-status-offset change with x1e80100 compatibility
  details and future SoC offset considerations
- Add Kaanapali camera DT descriptions, including CAMSS, six CSIPHYs,
  three CCI controllers, camera-control I2C, and MCLK pinctrl states
- Rename I2C and MCLK pinctrl nodes to include interface identifiers
- Link to v15: https://lore.kernel.org/r/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com

Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (11):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID Gen4
      media: qcom: camss: vfe: Add support for VFE Gen4
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 683 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 391 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  27 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 305 +++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 15 files changed, 1953 insertions(+), 15 deletions(-)
---
base-commit: 97952267cf371f4f1be0457b59a3fc5fdf7d3142
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


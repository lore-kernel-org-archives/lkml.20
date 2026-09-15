Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925D41D23A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467018; cv=none; b=hL3E4XUt+1diVHmxbJkRshU08AYkcwbj8mT13x2BYrNHCvaA4J/HgOR+3R4Ptw/WqP4I2U/3SxVA7OaMXjyhubBVS+JGxGTiSBDr88PDvqeYT+snMhQraTeJxYNl9yn6z7D5ZMDwi/RJ9I3K3Dd6ljCwjCl5eE2OX/NQ6y5yb9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467018; c=relaxed/simple;
	bh=m4ZfoAJptkoPa5qCBxHmKKd5+7UnHF4MZ8wJmu4+jEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r+rIPsX70OaeyFcnOTatG7Ht8Slp3wp/3Ja1yMIvw3AyKk4zI4/UcJMGAtYPRl1Mvq5AF/cn+hvnh9aDth35oDQClq3538bthOmub13YFweb8ln+aWd0VRuwUn/54vHpKZDrgWCtUaLMwtVQcUPnoW4shsFMHUok2X6DZUG/gcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq5RDjRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQ4IRjyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq5RDjRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQ4IRjyy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h18w3415605
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2eRbsRnTf+q9hGStN6U5gH
	L2h3pJ3DdvPA9Ak23a+98=; b=Zq5RDjRb6isHbdu3GNqIrLrL88uIf6rnD7Qj1+
	zV36zfTbu4oouj7Hegxl2vD0NwHEbBWkKYkrnB6FiAsoqxKxCp4E1hNKubbEmjGv
	3W/05YsdXkfFw3P2GRMNXObYmkgsBMHnQ2shvqKp9qfnI/9lCyl/rjO5UJydZJdM
	XZzMrNDECjAAhw/+v9C+E5Cco/rRsBWBSkafzdLf3QwDPjtNeoqIUHbFyBrI/24u
	l/DBf6HBj06mL3XThQQCmkrLv/p12v2DkjWOzlCxizslh9vcUNG6mvFFvM6/kzF2
	h0zAr9Na8lcKU19qlVS08ZudqpSwobySmeVa8QHpzZhxSZXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so10684202a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467013; x=1790071813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2eRbsRnTf+q9hGStN6U5gHL2h3pJ3DdvPA9Ak23a+98=;
        b=DQ4IRjyy/oiSQp+5DUD24pTdQi9UmUSEDThxNzUoK7sIBRS0bQjRHtgxNGiTSHr3o4
         roNYcen2zOQY3ww3yPa7jdzgcgFfao36AC8Vnj9uT+GncZ/0KAGVmQb+l6HK2c6fJQQa
         8+fvyXAYtfywTvtaHu2xaCAGPq+LtAM/Pi7aSzc+P1bx/kfml/ku8OOSb1Pze2lY/2UT
         it97FWyIyXggmWTIZ3SeGdLG8ldbwSGdY7K9HnQgb3b9gvBQaX8WoKfDEWcndA2WU9Tn
         zyqY+GtaZCycT6yTHfcvL3W97Ai8itrYE54Vw40+z00ahlJMO4GlR1HxJ4h4VO6fiHLc
         Wiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467013; x=1790071813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2eRbsRnTf+q9hGStN6U5gHL2h3pJ3DdvPA9Ak23a+98=;
        b=sgX9dsDCq6L6KsO3lKeUoyFRHJT58XV/G/VH5BSKHjg6mzBejaRXTuRFHn/HiitxsQ
         jrtoIJwtx/27qA174P28f9qWoI5V2wXR97wAcq8gpSYfzFU4t9jL6MKw2tf+vIse/siA
         5VRNKqXnSyDTwCXXBA49uhwCk2/DunX04Y73O8ZEUK8jb9aSvDyNRa30xiXkJvpTXDvn
         LmtdgcaN4OH2d/Ozoga7yvEKpbrDll6uT+y0jTsQmGYlCZRcAmsZm7FlUGUa1EWnlbey
         dWdC+YBinL710Nqw6kcdYdeVUwCv1mi0lFBBbbNfDLQskZfAYsnqqqMMDCyd2ODI3z1g
         jqkw==
X-Forwarded-Encrypted: i=1; AKwUvByfGZhuqu1CIuSfl1+8cZXd9reX/mYNpC7twTEeCeP8fwJTu2jbdIC9AlQUztZ7NDVew5mkmKeGOzdsOmg=@vger.kernel.org
X-Gm-Message-State: AFuF++mb9KIBDFlg23hbgg3t1TtmMbxDuH/hIjF++w53rs+BKtTZQASt
	+NwXohW3ylSvdFQ9sOmzdMZ9tmyRvAZ1gnHkeLkbz+aqsA6NsT3cdYiNExILMaeLNRTUvzpTURP
	71tJAxq0sOs9+TuDtDvbIwnmbYtpSUvn2CqzLUrvfc/OSf5sPmmX61bnMsOe9O6MLssE=
X-Gm-Gg: AYBFou0Zjv+4WS3fYi8EzKcRyD4gf9X6He/JUFg2FQUj6YK3AN5K4oNZVqGR9qNVLH9
	0e+uGfkvQ3YNvUwX3Zh9TP+EcT5jSed023G95sGAQLkmZ7YWJd3SowA6pIXikRzh6Qz67+MNP0c
	NM730DTgTeRQArSrwENwaWkJaRLCBCLMw+jvrkAeoExE4p6lczncFI4HkBGLqA3SainiANykafq
	ZMpxgCjm2K4Vrqqv31g6ijTK1eLJ27n1APobyghpvlhymVN4EclvJcxm0KvUa0eRRkV5f03Kuaz
	0VklHMUKlC565GBZnnpB3e1ANrb3sdgIJDXnDgTDQbEv9MRgjHWmUY0atNjmg4oaaBPdqpSLDvc
	edKItDGTTvF5fnnFkmNFpM/thUZlDr5kz3jPRFLiEtxMDAjS4ieVCny2qiheGmo1c2pRJoBVB9H
	Dfw7i589tvsi4=
X-Received: by 2002:a17:90b:2810:b0:39b:ac66:bbc with SMTP id 98e67ed59e1d1-39e10e2da5cmr411558a91.7.1789467013236;
        Tue, 15 Sep 2026 03:10:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2810:b0:39b:ac66:bbc with SMTP id 98e67ed59e1d1-39e10e2da5cmr411457a91.7.1789467012686;
        Tue, 15 Sep 2026 03:10:12 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v16 00/11] media: qcom: camss: Add Kaanapali support
Date: Tue, 15 Sep 2026 03:09:55 -0700
Message-Id: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsZqWoC/3XQzW7CMAwA4Fepcp6Rnd/S095j2iFt0hENWmhKV
 YR495myiR3KJZKt+PPPVeQ4pJhFVVzFEKeUU99xQPatEM3Od18RUuCEkCgtEkn49r7zR79P0Ph
 DzuCUczJoHdvWCa46DrFN80J+fD7iIZ7OLI+PpKh9jtD0h0Maq6KL8wgLviUt/netCk4bdIQwE
 xfkJOG4u0BrtdK1NRSUryZya0WKFNQa9qk7z/BoYQAVcDqMOd3BEgnxdwcyaFun6/qPvA++S3n
 sh8tymoloGf3lFfgDIJQUdWu23gQs3/ucN6ez39833fCzoBOpJ2SwXIEUQ9JoCmU0htd8Beknx
 DOtQJqh6GwrrffWbl9C5gk5iSsQnw4arKkhsq4xYQW63W4/wZ70QEwCAAA=
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
X-Proofpoint-ORIG-GUID: KoVkUT6ukZCT0MANKz0rKXcP5P0y2P4Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX5kfhnvIGeqnj
 MzP09Nl5l+dC7cH17HWuZZEwMtZO0FdCBdg7cieefF2+utxzXXy/wzKLW5Igiztv3S/gCsL0lLw
 SVar1+GKgx2fxoDyixmeQqGNqHui7OQ=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91986 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5H4PDbKVDpZU0N7xkpwA:9
 a=asyBVcYyNHhJ3QFk:21 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX5EYetx1SHbCN
 6s9NO5SxwZ7BpcwpOz5P/WS4Q7SnphdnYycfA7NqwZb1edQzesUXAcP4p4tGs8OhY1IO7Oq2xB5
 8xQCM/FqZNOPIzcrSzIv1JvD97k3VyJSyD0kRcDn/0Ije5uIZjCfjvzACoOP+zdm8wjMqZFJ1LG
 QnEb+WxLNOYQ/GEmlO3OSH8sprcGBC5Zdan5kFDgmGhXvb3h603RjB882uLwQZO26L+5EKQNiDk
 UftIDeWY0QimBgG/RHzNPHmB3X1kQrD+MIfCwm1sPLGF8iW4f132ut6GKMvCkm1GxPkal/SzVyh
 IQIR+xjnzxjQAU1/W2uZMo/Y4eGXIr0qTVUGvGfyTrK3gaQcuOp4lVXLwUzLU8hKyIVXpN3v6hD
 fSJfpcv73qoDJkUONoHXafsFsEsuEcw17k6+65XsqcTub+vxzvUVNG5YDnJGd0kDQTaO0V+Tlrx
 bLYUEvl+lg2zO7RIG1Q==
X-Proofpoint-GUID: KoVkUT6ukZCT0MANKz0rKXcP5P0y2P4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

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

Dependencies:
- https://lore.kernel.org/all/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org/
- https://lore.kernel.org/all/20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
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
      arm64: dts: qcom: kaanapali: Add CAMSS block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

 .../bindings/media/qcom,kaanapali-camss.yaml       | 375 +++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 731 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 391 +++++++++++
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
 15 files changed, 2073 insertions(+), 15 deletions(-)
---
base-commit: 18b0812ddc2be257f730533c2aaa7d21e70a1b10
change-id: 20260112-kaanapali-camss-73772d44eff7
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v17
prerequisite-patch-id: 4a27a90c3a55c1f9ef46e9b941576309242f75f8
prerequisite-patch-id: ec5e059c23defd7db6c47bb17d70d01c9c6cc31b
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v17
prerequisite-patch-id: d45e15d2e1db340599d7fa89a4f6f3c31a2c8f82
prerequisite-patch-id: 750508f9273306112a4b62a0d718336e6a6a2134
prerequisite-patch-id: 8c9aa7d4d73ca2ad2b5119254308bde07f6586ea
prerequisite-patch-id: 1f26f64b323c53271adebffd056c248494c266ec
prerequisite-patch-id: c7fdd1167f4b5e3e32df6adf28203f39bce17051

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


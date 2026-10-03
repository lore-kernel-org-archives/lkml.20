Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9437F33F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018156; cv=none; b=DXDD02Bs7kPsHuWgrbh76e5pt9gPAWS53QfIjJ7G/2biBDZiLdgWwbnCsYYiDLXOtGVtRKvOJYFTFWJrGulitLgHaCgGQgAf/zqFwmjjO9lLO42Xp4geP2UbsNkFC9fzElVhXtk54m/1VujMrtM6qOGsZCYfbDATbc2InjNBS2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018156; c=relaxed/simple;
	bh=5hxTWCjMq1ONBThiL2GXCc3AxClcLL+6ArZparnCqK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rUlGLDpKBRyRzmsibLcdJDeB+NabatWhuF1dFPRRmPbyxN7qYr61kbbaYd51kDfbhfVJyr7JhaHu+f13VwJckUDDDwmeQ2+hpDuURqCYueqI6Mi1FystqWz8YLNjWgZi6AxfTlCSVrOmecj75LeD8HGwMvwv4gE9dZW4LvOUUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZyb0+nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWdwQRKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZyb0+nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWdwQRKg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6934CSJ12858278
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GLPDA+AdfpkNgG+ByJrPOJ
	CcsKoGxb0NWSm8fT8QgwI=; b=EZyb0+nb+ZwdGScyQqnNU3KeWuonoppOxOzzm2
	YrW5JAkgfz4ToJJCTt5n/GXjFtIOX64WeC/mvHPYQoF11YpJJRAUwcLNlMCuubdg
	7eHzIfvRCg62lLne67WaskQ4Y0SWf8HR308VGEUL8weLF9QbI0Z2KCtIYWQARdG6
	KmWvhBLvsCLWjAMZOtT3LtifXRjQkARbepI4bevZDRS3/tpAGcGvr/1BZZmp6wqE
	/pGQfX+/hkt6zmsRLFdqN69i8lwYLvQD8ZUtGuyRX+CAWrOoiKS34dYXKYRNpLH7
	m6shp+SR6TzAFcx8VsHcKQ1MBm7Pq4OPxyMc/UPzBxgXIxzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tfd8emv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so302367eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018150; x=1791622950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GLPDA+AdfpkNgG+ByJrPOJCcsKoGxb0NWSm8fT8QgwI=;
        b=aWdwQRKgrzBZZsfci1lze4jziz6qaz7iww8C+w5dYM1eTij/xGaQTfpMtgYpy8CtFt
         egrjrg/yBi5Zrn3F6MdoLG7U8uXzkELBe7oAPEH+2wkXew8EGZGGzZXZ/buEo0ouAZDh
         uoPmSJA3xivHIzZurln5h7oq/LG/0E1FZl4CdZl1FnFVW2CQVBN+jWVf6IHCvoM6aAZw
         70IJzj2RNHdMhs+2ntdMShjhD3ogkG/3U/of2uxbCnbkpWXg8J3WnFprTowFe49JVQTa
         dmmiLzeGydOZHJaDK817bNC5kYZb+TZzMaGtjeUQs/2EzwGuuVeaKToqhdl6x4+sK5EP
         8Ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018150; x=1791622950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GLPDA+AdfpkNgG+ByJrPOJCcsKoGxb0NWSm8fT8QgwI=;
        b=rIeKc8HVNERoQFRmJvIpr+wz0I80OmkVjpL9MymtJAkVzK0NYRf5JdXAV+J4xdnOqj
         g4daYDB7iXcfcI/LHfVAkuHLMmHerRf6o/vhaU7960P2WydflUQgRurgSsL6k3wYg1Ym
         ozfq8/6sGCt7LiMko+sw2mu22Vygm4OxJxI/WMotswjTV/HKosm2rdQIaBjLkLqicXzS
         njsp+eujAFGyfAg5wwN+KshScok9OkLcH5G9WgaW+J4mo8ocdGgx8mkIUKtIhu8WMzvr
         8j+TJzYc5efgoT632rKCLLr2jPSo+Eh/q/pJAHFzliYuog1qMrk9QsOpfZjs9XeJne/5
         PDRA==
X-Forwarded-Encrypted: i=1; AKwUvBxAAPPP8cLFuTSwij2kwo2jZ51GZJC5glc03WSFhPM9c6zimgruRSd/AJ8xe5TvPXvke8MKDzRJiqRJRCw=@vger.kernel.org
X-Gm-Message-State: AFuF++lLzhyaZpxAU8vUpuelJG1Iw61RpWUvfRbyK4GUCFJisQV/rJyS
	5Ozk7PPnI2pdq368N8ly4kK5MJe82WCVuODjirSGZcITlUINKBOupgHSHz5Nbsd09NOHG45qA7B
	R5qbjd5xgpqbbRStPUyluLMPBitzfU9tF0h0QAmCYcmvwpOkVwnO2mpAUsZeDXJzL+kU=
X-Gm-Gg: AYBFou0CJuAEQb7zap39kGbhVoB6nt99R00ywCcuiBXjthU26QoYe+5Gv6y3zbKewRH
	qhms6G6sD8tRwABFQmr4CJKZqJiuSc53mMlXTtwrRnwphnYciFEemS6zqSFg0yBK91jIUFq1o7b
	vFn0vVb4cG90eEuEtDrzSDqgn133JyU5oFqW/klGfnp1be5HsaHYnKKVTPF/vk9kjrp7LSOiuHh
	QT0g8vQMLelmxj+0g5JlG87zTy+2aw94Hho4LpfgRi8tCchzoIdEFSoR+rx+GWjrCqjelT/v0ZN
	65UFob+AkLGtwklKNg/ZAPkneayc8h+UP5OszUzoR/HMtg0fFZBV6FLx3OjB7vbYy3U29Zj2CJi
	AMztiW5jbHzqS0ltx8634UIfZkGMKdJEzfH6w0Il/NqcjRew6Q7ulqoIr4qUGLju0/fXp2SEY8g
	4IFz3PQYGH4Q==
X-Received: by 2002:a05:693c:87d3:10b0:34e:b5bc:7add with SMTP id 5a478bee46e88-34f1508f977mr5548182eec.6.1791018149292;
        Sat, 03 Oct 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:693c:87d3:10b0:34e:b5bc:7add with SMTP id 5a478bee46e88-34f1508f977mr5548150eec.6.1791018148659;
        Sat, 03 Oct 2026 02:02:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v18 00/11] media: qcom: camss: Add Kaanapali support
Date: Sat, 03 Oct 2026 02:02:11 -0700
Message-Id: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQzW6DMAwH8FdBOS9VHPIBPe09ph3SxFmjFWgJR
 Z0q3n2GHpg0uESylf/Plp8sY58ws2PxZD2OKaeupQKqt4L5s2u/kKdADSaFNAJA8m/nWnd1l8S
 9a3LmtrRWBqUwRssode0xpsdCfny+6h5vd5KHV5OdXEbuu6ZJw7Fo8THwGQchJJsD55SHrv9ZV
 hoBlsjudPrABa8AVdS100FU713Oh9vdXeYJB3oWdIRyhbSoNqCSIKkVhAq1Nhr2ILVCtNMGpAh
 Ca6I0zhlT70J6hawUG5AmyIsTeABjvQ57kFmhmkL/ITNDdSyjiQoq4fcg+weSWzeyBAVPUChtt
 GYLmqbpF7WXWShWAgAA
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=LroHWXdc c=1 sm=1 tr=0 ts=6ac0c4a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lV27ui8atmU4ombd15AA:9
 a=c1DBCY_Z9ikzHzL9:21 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: paKmu6BHILDsxaDwB-g1Zq-pck7hFSld
X-Proofpoint-ORIG-GUID: paKmu6BHILDsxaDwB-g1Zq-pck7hFSld
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX4oDg2wPhsvsT
 8B4npcP+cWnCVQVF3en9ZZ80xBJMXZAW66Oam6NXj9mTDgjACJ6aGnowqVXV3gSeNG8nMA2NPo9
 F3/dNu1MF4Bajtcbq/urG36gJbWqxL8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX/A/HbFQEwu7Q
 t7vg6z5P/m6mkEuAN451uxDjPSYvK9zMAxwcOBwv8slulCkJZgsWeg9bcmS49o6TY5Qa0yNlvdl
 AgIvoTIA/gaA0ocnMef3ZbR3u348DrkJ5xxKpVTbpwd/rWIzPrgQVvCw+w6xzhg+6UzJf3kZ78X
 jKZkNNQV2MGu6TXU1ZfJD1SlfwOTCsNElXH6lU6po6zGYXnRSyemDXh6VBpAqJ0jBJulAOuT147
 GaraOPlP6L/RsAH79Oik1xAaRUHT7OXDl6NagcXmOvz5yK62x1ItHJhc/x0I6O9BG44QH1eDwWC
 HrygLwKRL7yTYDcrEOla90R+2BepjRisDERfJb36YUqb7drwMePoXJ/u/nLjw2vJt5/Huormqt9
 xzURwb0kYJKX6xq0ag94UnG0TnkFkzLzYc97h/rsBdmccCo1mEE6s4lJQeJes6eThcuLanTTzRU
 UinSHJ2VhaMp0dgATng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

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
Changes in v18:
- Rename CSID and VFE hardware version from Gen4 to 1080 - bod
- Correct the description for CAMSS ports in binding - Krzysztof
- Add lane count fallback path for CSID RX configuration - Sashiko
- Align the TFE lite line count with the commit description - Sashiko
- Use hyphenated pattern for MCLK node names - Sashiko
- Resolve conflicts introduced by Glymur in CSI2 PHY binding
- Correct the spelling mistakes in cover letter and enhance commit
  description for compatible and CSIPHY 
- Link to v17: https://lore.kernel.org/r/20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com

Changes in v17:
- Rebase due to CSIPHY re-arch dependencies merged - bod
- Remove redundant CSIPHY resources in CAMSS block
- Enhance the commit title description for CAMSS and CSIPHY blocks
- Collect RBs from Loic
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
  driver, which lets CAMSS csiphy_res only carry id, ops and formats
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
  with previous generations and improve the commit message. The name
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
- Split 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the process node in csiphy register list comment - bod
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
      media: qcom: camss: csid: Add support for CSID 1080
      media: qcom: camss: vfe: Add support for VFE 1080
      media: qcom: camss: tpg: Add support for v2.4.0 TPG
      arm64: dts: qcom: kaanapali: Add CAMSS and CSIPHY block definitions
      arm64: dts: qcom: kaanapali: Add CCI controller nodes
      arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl

 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 683 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-1080.c    | 395 ++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  27 +-
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 ++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 305 +++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 15 files changed, 1957 insertions(+), 15 deletions(-)
---
base-commit: d64fba75362e3459e48b74f0484f82fc1b805d8c
change-id: 20260112-kaanapali-camss-73772d44eff7

Best regards,
--  
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


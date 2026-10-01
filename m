Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE0364EAB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847297; cv=none; b=Es03N07IyiEqOLHYfrlQDeY6AtV6pyuTnA04nvr9KUwch24Qk14IeZ/uFNaErEathSvNJoQEpAQL1BIfN0Zd614PI4msqo6gsrFJvWkDvceeZBpzaCQ6YRiKSf2quw+bo3r/jYwk34Xr6tfqGmW9lzRGdQPbuUqE6Lqu4HR5Iaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847297; c=relaxed/simple;
	bh=qkuhUfxgkzuI3vosSdLIbvizi+Q5Uq+aaYUlA/NmNYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZeaMLiWa8uryNPo4I7L/uJKVsCq46I/luJD5JxnvLRjufiYrJn59KHyoih7sR+Y0k7Xav9JhKnx19JF/PFe9Vntro4bPaLYa7ApZ8PJkwgkpOmvUi/c8hngKZamWI3mE+6jtKMAvPTtoEuvPKg9QYXclCqpWJZphW95/F2x23FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrB6wkCr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VclggVTb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrB6wkCr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VclggVTb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xaPe962455
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/eq3Qw1CAASRMA4N2bfr+
	Q+aQByYgs0SIcj/S3VKfc=; b=YrB6wkCrq1XsAGLDXb12WcNJCeKn5sXFOxzy8l
	/+Ffq0PgQRv8e/vS/7mcncVMSkAefVNFu9HP8obOoFyn8IzpdXKd55MxMa8SupJX
	09Y5TDv6APRuy4YQKpjHNv189EXNO4V6nZWBI199OmHlLXTQLq2hFIktvaRe21dL
	d+0Fo3OWT2qsMRTFth2aIHiwH3W2uqjtEpO9bQZQJCGJBtWmoNYr1x5k2zZZAI8C
	GJdUfdnso85DpCSBPybzlw19UBISzJuVy9g3kE/y9NwYGp4+KS6KBczXgCu05YEF
	vMReg+HX6NUFB0Vz2Hk61qq0o7MOFaKFz3++KEOzpFET1Xug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcuc8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:34:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso4322313a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847293; x=1791452093; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/eq3Qw1CAASRMA4N2bfr+Q+aQByYgs0SIcj/S3VKfc=;
        b=VclggVTb5VS44k2DpSS5nKS9c+iYudUiXYZADNsFPvvbbwIXtnAnoGYA1pyHr33cr8
         3Cw5gYc5puy3VrJqPOq3JOJpKmD6O9P0JV1IgxV9RfvhTW8U79cs59P+fhcIi7uE1lz0
         jvipyk4RahL0VPL16ENLxFU1DR/duPjr4JpnPJzpshC3SFSMiVr7uoE1GF0wZ+up8PZn
         LZJim/I2DkNR89K3VeEz2cDLpN2bpzuZTTQnkFAG0/hzTsIILCAPi3+UPlAQAhI6eCdZ
         rxxXj3UoZWgK5d9eE/dX2v4R6yHd3Lp6EoyOOHb2QK9KiUwQ2pYYqA2QV/ki6MJUSyA5
         Q0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847293; x=1791452093;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/eq3Qw1CAASRMA4N2bfr+Q+aQByYgs0SIcj/S3VKfc=;
        b=qhxtwwuObQtGM2/CoWvTO1QBM9iUkSQ+FLLlJwkDOfG/1FwSlGViWUIBOKKagVUgEV
         wHnniwbRGfc9DMlWphk1QHVuiI83k4tROTz12yrqG1orLDUenC8O8gVQyvWfIEC5YHBU
         pxTrlmmPCzp4+5P2yfXVwBn3YPs4JyQFa1jIgbErIIWyUkS8t9J4zfxvT9I0MY3LGDPN
         ohOB2jFI0q8oJm0pJR+qZ1flzuR/WbtVHks/mUjWUrAZIpJdoW9EL0lDkN9NuRi0OxL6
         vYjt4/I484jMfUBS2GYNG2+qqicbDvBBXQSxd4jDuixq2j2D6K9Oj2hCPjJMln0MAcu6
         5QIA==
X-Forwarded-Encrypted: i=1; AKwUvBwyuPyxyo9U1q1OG0geAV1RzFLKG8bwOAst3fQudkpgLCdSeRqf2QoEBNA/MdesS5b6oEPdyhBb8mqCSPg=@vger.kernel.org
X-Gm-Message-State: AFuF++lObIjzPqnshBZYXrBnRJssmRtvE1XkptgRTKg0wjIwOKF/Swbm
	95nuXvh4TMgX8HdFe7gad4GKblOOSQSACH7ePEkyNVed1QXDcrq1i1gQm6UTcThJEX0zUXADCYD
	yJkWM3476uNrf0+ydZ2y8DNcJ9TINMgCnZ+pbXubPcY+r5V8QzfkJuzBbB55Xt1QsyAs=
X-Gm-Gg: AYBFou1ZtaUSdh2uocX4126c+9GXktxtqfiSYGH+dNM80A8yneAArho67h+YgHjPLP8
	4CnHjheqjbZb5fe1cZ4cW09MMa1QEzMENvuAJhpeP9mLjCt6pKIXSFPjJw3wQY8F91IpWN1Cbbs
	hevFSwUzB2VpPav3fv3lByUc8/yQAp81bkNG0Ytl5tyl1Ae6Z2CW2ljc9lVKAk/bbZ57O/gJpeu
	WsCf22rz9cPNMY0HudyW4HmU51VHb4V+t2KHAbHNy0xxNa0N0A/1ERZHdbr1+kKaqK7XZtPCPCy
	wnNRg0fqZiVMc7aT/5b64zcHmDaQHvzkTcZq0VPp+eil66FisCcLpIADRqQUbXABZGKjZqhEmrm
	TmUjhPF7btLwpWA3Q3/C/dpyVYGw=
X-Received: by 2002:a05:6a20:c70e:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3de9e9074ebmr4761286637.55.1790847292771;
        Thu, 01 Oct 2026 02:34:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:c70e:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3de9e9074ebmr4761256637.55.1790847292287;
        Thu, 01 Oct 2026 02:34:52 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:34:51 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v5 00/11] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Thu, 01 Oct 2026 15:04:17 +0530
Message-Id: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABspvmoC/23O0WrDIBQG4FcpXu8Uc4zR7GrvMXqR2GPjaGKni
 TSUvPu0Y3Ssg4Pww/E7/41FCo4ie93dWKDkovNTDvJlx8zQTScCd8yZIceGa6zhdF7HJcBlWCE
 J6BtlasXxaHtk+c8lkHXXu/d++M5x6T/IzAUpGzb4EeYhUPdwFVa/XeMnC6mCCpTRLW+lRCPpz
 ce4/1y6s/HjuM9P0QYXZx/We/0kytWfpvpP0zwcNClhKFduRPPslcKpfiAtf0LqjFiLSLKSXAr
 9D7Jt2xfLXsgqVgEAAA==
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=5226;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=qkuhUfxgkzuI3vosSdLIbvizi+Q5Uq+aaYUlA/NmNYw=;
 b=y2PMOiJXCncjY4JjSigYdjsR5hQ3x9j1DXlZq7CSx9EOk30ik7+TMVmz78WWx3uz9JK/DUEAH
 qHBMl+F7AT6A4zatmocTlUVi+tdrRgHYdExHPd+T4rvv8lw7OAj95Ep
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX0cLewWWQN3oW
 7a7cUwe3L3fdhyDp+9PVPcIoCAwCMcX13WoylJKf5gsuKBqJXHcHoUmnBwn/jp2zfqWuNK5WChK
 bX0FHU1UDTwMRS2LMmgUysF8c771ldUhyVfQHzG1ZqkOnbyrNaNZnlt/uWlg0S233KqkRHpO+5s
 Xqy2MpSyjOJE+r+6896iwFoljWPvNojjPaLG9soycqWBn1QposuOorkMdyi17rU/WRr+Dmqs1YD
 GdIPg2p7nkeqPLRu7bc+cw0xFDCk8DYPE3qdXRTnRpgOx3M4vZskSl7MEIz5WSP7QgTbt0n/jIQ
 Gxv6zZjXeuFxMfKySqpK03OLq0ll1tVurUatL1ht6KTh5gxF4r56F1ZpTgfjX9xaorm4mSFgxb+
 W8ZVDi1QoHKosgMXcCVvtnxhDRoJQ0Oiozs/IPTe0nWagFX/VIU4hTHtp0cIAluE/utc8i1I/L2
 7be0jXRIe9E8Ic2JSzQ==
X-Proofpoint-GUID: vcezd_uR0ZCmD5HrBalRCvhWwD6XCDwI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7iE3dlTBRxmM
 q7ZB9DUAlHSzVE08e4gjuvGiArheh+Ps6vMex6sqYTE6CRFivd8YDBdcEI6ormJtpwKVlWP9wH4
 kHyaiXmcWN3wo5rOj6ta3LiF8AZSit0=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe293d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=xD6p01Tg4BUkAB7hO_sA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: vcezd_uR0ZCmD5HrBalRCvhWwD6XCDwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

[   38.158644] [drm:msm_dp_ctrl_link_train_1_2 [msm]] *ERROR* link
training #2 on phy 1 failed. ret=-110
[   38.160656] [drm:msm_dp_ctrl_setup_main_link [msm]] *ERROR* link
training of LTTPR(s) failed. ret=-110
[   38.167330] [drm:msm_dp_aux_isr [msm]] *ERROR* Unexpected DP AUX IRQ
0x01000000 when not busy

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and
settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Changes in v5:
- split two patches into more logical chunks.(Mani)
- Add proper Fixes and improve the commit message with rational for
  the change.(Mani)
- Fix the 2-lane DP that was broken in v4.(Oleg)
- Link to v4:
  https://lore.kernel.org/all/20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com/

Changes in v2:
- Use the DP-specific v8 COM status register definitions
  (DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
  instead of adding new N3 USB/DP variants.(Konrad)
- Drop the qmp_v8_combo_configure_dp_mode() implementation and
  reuse the common qmp_combo_configure_dp_mode() helper, restoring
  orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
  review comments regarding DP_PHY_MODE handling.
- Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
  definitions.
- Update patch author to Ritesh Kumar.(Konrad)
- Link to v1:
  https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/

Changes in v3:
- Split the monolithic patch into a logical 4-patch series (Dmitry):
  - Patch 1: Add DP COM v8 header and fix register layout
  - Patch 2: Update DP PHY common init tables
  - Patch 3: Update link rate specific DP PHY tables
  - Patch 4: Rework DP PHY runtime configuration
- Improved commit messages with detailed explanations for each change
- Better separation of concerns: header additions, table updates, and
  runtime logic changes are now in separate patches for easier review
- Link to v2:
  https://lore.kernel.org/all/20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com/

Changes in v4:
- Split patch 4 ("Rework DP PHY runtime configuration") into 4 separate
  patches to address review feedback (Mani)
- Add named constants QSERDES_DP_PHY_CFG1_V456 (0x0f) and
  QSERDES_DP_PHY_CFG1_V8 (0x2f) for the DP_PHY_CFG_1 magic values;
  use them via a new dp_phy_cfg1 field in qmp_phy_cfg (Mani)
- Set QSERDES_DP_PHY_CFG_1 to 0x2f on Glymur instead of 0x0f (Konrad)
- Update qmp_combo_configure_dp_mode() to ignore TypeC reverse state
  on Glymur via a new dp_mode_ignore_reverse flag in qmp_phy_cfg (Konrad)
- Fix ignored return value of cfg->configure_dp_phy() in
  qmp_combo_dp_power_on() (Konrad)
- Make AUXLESS_SETUP_CYC, AUXLESS_SILENCE_CYC and LFPS_PERIOD writes
  in qmp_v8_configure_dp_clocks() rate-dependent (Konrad)
- Remove duplicated LFPS_PERIOD write in qmp_v8_configure_dp_clocks()
  (Konrad)
- Make LN0/LN1_DRV_LVL writes swing/pre-emphasis level dependent via
  new qmp_dp_v8_ln_drv_lvl_hbr_rbr and qmp_dp_v8_ln_drv_lvl_hbr3_hbr2
  tables
- Make 2-lane drvr0_en/drvr1_en values in qmp_v8_configure_dp_phy()
  depend on the reverse state (Konrad)
- Patches 1-3 are unchanged from v3
- Link to v3:
  https://patch.msgid.link/20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com

---
Nabige Aala (1):
      phy: qualcomm: qmp-combo: Fix error propagation in qmp_combo_dp_power_on()

Ritesh Kumar (10):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Ignore Type-C orientation for Glymur DP mode
      phy: qualcomm: qmp-combo: Add hardware-specific dp_aux_cfg2 and dp_phy_cfg1 fields
      phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
      phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
      phy: qualcomm: qmp-combo: Remove VCO_DIV programming from qmp_v8_configure_dp_clocks()
      phy: qualcomm: qmp-combo: Add per-link-rate auxless/LFPS and drive level for Glymur
      phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 364 +++++++++++++++++++++---------
 1 file changed, 254 insertions(+), 110 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2554B1CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876094; cv=none; b=GcCXaX+1Oq5xNFKLNWTWXzn3dxVKmbw3q9LRwtii384m+c2NlLCIFmPZLtKbxH6VWrwg3xcC1QyyHx7F0nE6Ey+RsrtgS2AbaE1vvdCwoX9BgXTX/Jh68FN12Mce9xvTfJTkHmldQnENDR/5trl7HpWC/NtTfmDN9WdH8TD+BLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876094; c=relaxed/simple;
	bh=t3l/DgW4/G5AtaUOpSAHHl86YPniiPlOjnFnvI5yvcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R2hkR3/q/hWUTu2cjAXg3MmlFgpR9OBb5UmiswHZItom7J6aamQyT31k+ITCtjuZSFvx2CcSrtDnwfD+lzCmjYpq91MZKPOrkxdY8o8mHmVhB/zHDHWXULTwDGrHkBH5BSZP7xqxUmcIS328jn/Phr1JmRdQHSfvGpSs8HDB19E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jakpfQm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQgXjOXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jakpfQm8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQgXjOXQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CktH73013146
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x8vtwhrNnZjX/q5gHND4bV
	myOFe89HrZHW07ov1HHOM=; b=jakpfQm8gvUBMTyWnHUo6FqWAIjOjgZzTWsQac
	VRHy76fZgzJX+6D/Nvu0dMdch6gXNu4fR66WKTjeCdEPf9eddBN0wTmFj3Fn/i0T
	EYANAeC2mgWEr7LCV+qjTF+Sw1E6dpi68k5iakDElCwxMSFgHh/1ulwSZa5OM5Ln
	mrVgb7R0I7H3VvswBBlXc4rdjyFkrffC+vnuH9sU9hlcjyVcn/DIDAnmSjpbirYS
	7Dh1LEmQMSBbAsuZ2zkZI64bNXHOFQN3J9waBifXeJn9EoO64/jy2W1dPiQmQdaI
	r0ZxttschbwIupY4CNA2fu3UaCucF3dULGWMcOaJdrpgopaQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwktaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:20 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4fa572ba2so3239886a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876079; x=1789480879; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x8vtwhrNnZjX/q5gHND4bVmyOFe89HrZHW07ov1HHOM=;
        b=kQgXjOXQfY3BYCfdS4mpRnmgbMlS4tuYTt4oaJdw2iKbNaut2kHO+ZOS8LtAD0BUNP
         rTiMPQjs0d3ifT8mF+WN8ChbCOy8n1C1uCdbki0EfAWiinIv2ywxB6UYJdGhyC/xN1RK
         FrLpPAc/4oUy4FEnm1tNMHvZ6Bn25pqURcQS1Alk3QWzzK2CcMy5wd7CrMWtESiV+FEV
         E0PWNxALbKTyVM/52b/s4jj8+SrBNaEzg+79TscizLSGX8wr+/LN+dN3mevNRvJBMZL9
         4KSr9BXkqd8E/7yg8INfNN3RmD42d4M7PxyJySvYYeWuziqQAWRXMyX3JpmpgzjUIGph
         0jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876079; x=1789480879;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x8vtwhrNnZjX/q5gHND4bVmyOFe89HrZHW07ov1HHOM=;
        b=sxxnFprt07DNyg+cBnnxmgA+KjYF7akWZQH8NgMsbJ6GAGV2mWjiQj4ngbP79fvUps
         QWRH3R01aJKO7EeLindBE/TNx/Fx4ts672w5gy2MXmEJefV7VotMexKXKhUcG8cuYPZ8
         bfDCqiG9JcyMC40nyQ980zl46iR0EF8sMeM5axZw6i0avGrkGlYHiPnXWP1pv1RXdC1J
         8ScHvo80Bgi2KnD0WyqxM3soRcV/Embu0kNtseTO7rsjj8rjUnaIpTjmicyyGhI+QJFC
         UIdqDdugwkZ5M9P4U5DvvhYbk6QB4UNvZ4GOwJtnBdAEz27yjl2+XEAMnIGiw03GFLt6
         X4dw==
X-Forwarded-Encrypted: i=1; AKwUvBzMLDqMiYqjJYEdOwLyMV2B00lM12xFoeWLoZGNoaLb2obiifKbPPUPGduqx0n9ROh5KjOiOf9ApMZYCJY=@vger.kernel.org
X-Gm-Message-State: AFuF++lTZjMRtQzWGaxVqEiRbqu7DZg2tda6l9HWkA6nelg0bc1/PCUL
	gAqU2ySonirJcXYiMIIbwkqSdAtoYjAkeLYHzrNGAr2EWo/h+yYr66Wwv9SNJJQslLARLTscC2V
	bKbOBjV0yYh8/gOiHKhuZVOkPDbA8SKazMgWNSWbeZIF9NVwdyT74cC61+VAGO2Gaah8=
X-Gm-Gg: AYBFou3Dil4wGWwQP8xoJtw2DFYvzcHL0/SgCTOvoiPcCU1UHSPOO11Pc5fwHgMZnU/
	a4o8kaJ15iQmZYfQiKwDDfRWK20RM/AJ7cB22tQsEbtOZXnVPdp0I9Ri7oiEDDN5mECecpTFOoI
	6HIGkPMTNFbX7l+qpBOvPIdC15K4zzU74z36ihjdTWdPrejq0ArbJO+0bbQA4HQScNf/Jgu1feS
	dKsJ4MkzO9R7KKexLkI+p2eTRU/FGNHT6YKAvREnlUjahV29OdGHV3moQRNN8ybXn/H+JwxRRKl
	RhBPue0KaCB7w3ClstfHIeElc4+rqhz5A6EAXJj6GQDIyxpy87ZfFyRQMbSnyacgglt30gJ7PFd
	XKjkK0I9F6NvN91sbvftk9pkl8KA=
X-Received: by 2002:a05:6820:1c82:b0:6b1:6c44:d3b1 with SMTP id 006d021491bc7-6b6fa8dca94mr15309535eaf.2.1788876077747;
        Tue, 08 Sep 2026 07:01:17 -0700 (PDT)
X-Received: by 2002:a05:6820:1c82:b0:6b1:6c44:d3b1 with SMTP id 006d021491bc7-6b6fa8dca94mr15309272eaf.2.1788876075616;
        Tue, 08 Sep 2026 07:01:15 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:15 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v4 0/9] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Tue, 08 Sep 2026 19:30:53 +0530
Message-Id: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUVoGoC/2WOQQqDMBBFryJZdyRGTbSr3qO40DhqihqbqFTEu
 zdaSksLw8CHP2/eSiwahZacvZUYnJVVunchOnlENnlfI6jSZcIo4zRhEdTt0k0GhmaBOYSCCxk
 JysqqYMTdDAYr9Th41+yV7VTcUI47ZG9URncwNgbzD1ew4JsrdV/BHEAAQiYpTeOYyRgv2lr/P
 uWt1F3nu7XTGmVHbZZDfw73r2/T5MfUDYUERSjRKfOQ//Oybdue6sTIsREBAAA=
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=4385;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=t3l/DgW4/G5AtaUOpSAHHl86YPniiPlOjnFnvI5yvcc=;
 b=AKG+qcl/AgM2knFNW7t7LKcyJ+jb18/yaCmY3lSWeIW8Juw/aBKGrjqLpGq/7a5mBlUr/QcaQ
 nIueWXkCp6yCMiL89LI8OOFqUq+VLPotN9/athzaNfJmFlWV0KgtQpN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa01530 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=t9hbx3YKugSYWUFxl6sA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfXzSrsBPEsbrIl
 t9I0dZxaAfjo+XuI7r+cvMuUlDs3obi69T3kU3oO68EjX3A1+6ybrigVkrF32GBrfe6zTfagXFG
 CK8aPfKnF0vcihGLU8cQdzfqA3mX4Rg6o93tmONvnVjiLdBSgp6IbHgxJ5/F7kvJbfBxnnueLIu
 r4OJRLP/AWVxYxzgZl+EGNbmkp6KepSDdbT362PwRzNht3JvSTI3VoR2NprD+iL31BuSLzv8zpK
 /3nvhzclBnF+aKD24lFgHtMRZkRLueZZO5qOoKrOhS94h3RYOkEaReMaxl9MrYPgZP2uHmttz9q
 G4SYUTcOEqhxyTizwcD1Nw12E9fjtotKimyB/zkt45P3AmtRQgDRXcOsKaRYc58doSRfs1jU+wN
 FPVEVuXybcShtyYV7UBYly2Rw5fV3gxldHSJKdyHlCG415WLeyw2q3gOneZYCjjn0O38wVhbqmm
 yJ/Y/UZjPw9VbRA2Ilg==
X-Proofpoint-ORIG-GUID: Wza3BC-rrNALpmvEKbHwYFH6_kYPIASL
X-Proofpoint-GUID: Wza3BC-rrNALpmvEKbHwYFH6_kYPIASL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX1cUQEZrRwE5X
 D+TZerB82R8oW0Q92Vww5PhSYtt49RMuWrzHbspN20m7cuPaVnUFKZCpe8YLIa+hqIBkvvMKUiL
 Lv6abT3RQTdI4QJw+YcUo1duAVtDdQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080151

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

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
  on Glymur via a new dp_mode_ignore_reverse flag in qmp_phy_cfg
(Konrad)
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

Ritesh Kumar (8):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Add hardware-specific DP PHY config fields
      phy: qualcomm: qmp-combo: Add v8 PCS-level drive level tables for Glymur
      phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
      phy: qualcomm: qmp-combo: Update qmp_v8_configure_dp_clocks() for Glymur
      phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init and configure sequences

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 356 +++++++++++++++++++++---------
 1 file changed, 250 insertions(+), 106 deletions(-)
---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


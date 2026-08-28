Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA137187C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910205; cv=none; b=rO0B6fzUF45q9LPzMw/3ifDjQKeYbTZ/8zi8qY+ccUOLDcdUqn603qOhkWl6Q1K+/F+wz5MpE2h6nKwjuk+j8fpt9sSfgSS8lHaHDTimN9ekyt28W+ou6zGB2jHDaRkTxOlUXPSHd5ValkvLtb98I7JqV9OV0THC5YGr8Sat7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910205; c=relaxed/simple;
	bh=pC9GmVu8vixHFFaIL7xI69c0nSD8i3sS2fz+bphruVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fFa0KmLkCgPch3MUCMp90pByM/B/0Ew2k3QX4DPq5GU/XykwDcaJWX9Elv596lCK+mY6lyO2bIKRg1/cURW+etUDuT2Dggf/I6q14T+YzIyvBNcs9/DITWeHyzCwZa7VmjcNvDzJzb2EGBGH9B03w7pewz0Z7q+zUYmlzBcbDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUrcCq5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAOB4Kjz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUrcCq5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAOB4Kjz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66cSk1605862
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IL6ISL0hv0f3Z4TUu5iP6+
	5b/NRFnwrL3QiItq2cUnc=; b=cUrcCq5jBLXSAv7EIUshZ+JIzIL0uX5bicKJv2
	oPq1W7XJswXzNFigNOmFvRlkJ6R2zsXfSQcR7VMhoJcgXFnmz5JHhyrphw2OOJ/m
	HQ4s5ZjvWwaG2eBFYTuX0UK49zSGWW1QRBNSEoA9hqAYU32mNqy+suyRfFA9lV2C
	MrSpk9StD/a4BqUCbs0OSD9A+cO1ii7A3TaPB+AU4YIr9v0R24fgfobp1FT49oN7
	hBZ3V3eyxNRNMmlcSp7Babo21Y8+Imd6cUVYH+BLJHeGW0nQ1FKp0aThYnw6cEx1
	DGvj/d8SWVIoR2fJHUk5o4w0OmfVm6tYRORJpmM+HZIOGbLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r91kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:43:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so1460679a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910201; x=1788515001; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IL6ISL0hv0f3Z4TUu5iP6+5b/NRFnwrL3QiItq2cUnc=;
        b=hAOB4Kjz0w83nvMVe6HWZFmDO7EytlCvz5U/IawfQaFrp0FgSn4uX2+lsJkBWmYrs9
         AT+7lWkKKZkW0VqmlM3Hfs+DxD8d+cpqVmC+w3Sa8FGxj82/u9KUxb+N0gqVmdQNaeLC
         bxr/eSR2btIaSuWdbX/9lOeE2iWpoLWjdh5ytOoI3vTjy/VYBHp7wLBnRsPw10ULNAyM
         Ie0sI0SYQ7nVC+eAmVnT/MRtme8/breWiiMchHaDDEZFQAp6fr79bSMWendqsIN4sVnn
         M6Hz74qOXJOkPjw3RFiL5JNWfga6TAlYli4zMG3l+UVJle562EG06ssAdXo7dAweZ6lb
         iy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910201; x=1788515001;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IL6ISL0hv0f3Z4TUu5iP6+5b/NRFnwrL3QiItq2cUnc=;
        b=OWjOBtKJBwBmBQYDyOT2PauQMI8m97IYZO7Jpb1+EYe2k4BF0DQdAjUGDxx+MsM79Z
         Pir552SCh+APoEoT9ojjNU6NMBvBKJ5tAHHdghYAC0FP4/24qK7PbU0Fji8RJK7v4Fkd
         eHgOu97H79oLkVAZy3zppHOYoGB9PFwMLoVrEHGbCIx6WYJtMAWK3IojSKzyK6n4NI2r
         adIf1kA7tqajpy49unSlEt1+EYmBRIqOEtl5dL2LzqW4EKVFNIA4Hj5II0QBEP4TU9MG
         d2ptlA2VVGPzOn1oIRiRCHGtbGkcZaNuv6nMJZtDlYzC13wGMRl6bvqBlGxzPSE/XGlR
         vVzA==
X-Forwarded-Encrypted: i=1; AHgh+RorOC9/+tVWI68+TgLnidLjX/LjNDwks7cq8lBs/DcZx1p1mHzFsnyiHG+g59dwjniufDASNTsBr6MXiok=@vger.kernel.org
X-Gm-Message-State: AFuF++m9j5nJAPr1iLgcYTTF+JzxvwkXSZ0+sVAeI4D0eWy04sreGJ0W
	fLvOPCqZYtjstWUUwLl589cwsnEe/T6qr00iOUTklJBsYutBTWt/9DH14LKcle3jidbuU/vC5T/
	DL21NRPc5T6ZX1lDxaatOtH+FjFHScEIDJZ74IDCmATSAqSkoTI4St1DFe6Xd2AgG6aY=
X-Gm-Gg: AR+sD12j3PMWyPPvTm/tgWojXPgDxTGIvgSkCvsuSojm/75qNFUsiXlSTHL9QaIbQ31
	8QRHQ1eFMHiBRFvYP24eIa4FPl9NGPStF9foQ6qmqfnTPmDklDT+HG5KNhttDfWME1LD/ssL31e
	eBZROQ6oNo1A+idG0Il+vO3myfN5GnqqUApac3LQN6gXUqAJlXSnAly787oOVwpc47bxQ0WddAY
	SPCtPNkrP5DAtOuw4IyT3GsydzJpFBp4g6TMPCmNn+SxEugpo0YYOY10M6+nb+lqPkRBrkDQ0h5
	4lcZwTH+dC+ttRYROCZcHpZfMr63lJjckI1Ru665zBqoQZ5nu+jAa4K7PW5x+xSDexwxCTghB6x
	5hhh/zUTRLMl+3npydd+XaWcphN4=
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-396d0d7b94bmr12044390a91.4.1787910201126;
        Fri, 28 Aug 2026 02:43:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-396d0d7b94bmr12044310a91.4.1787910200671;
        Fri, 28 Aug 2026 02:43:20 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:20 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH v3 0/4] phy: qualcomm: qmp-combo: update DP PHY PLL
 programming on Glymur
Date: Fri, 28 Aug 2026 15:13:12 +0530
Message-Id: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADBYkWoC/03MTQ6CMBCG4auYrh1Syk/BlfcwLmCYQg2l2AKRE
 O5u0YVuJnmT+Z6NeXKaPLucNuZo0V7bIURyPjHsqqEl0E1oJrjIeSFSaPvVzA7GboUlgTqXmEo
 uGlULFjajI6VfH+92/7af6wfhdCDHh3LWwNQ5qn6uFPG/i3ZQsMQQg8Si5GWWCczoar2PnnPVo
 zUmCoft+xsSx6AJvwAAAA==
X-Change-ID: 20260824-glymur-phy-v3-b67c4702dfb2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=2616;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pC9GmVu8vixHFFaIL7xI69c0nSD8i3sS2fz+bphruVE=;
 b=KZVFZMHF9vWVCtJj0lcUzHQBLkiyFjSaOAlxQdnRO4Jcuzt44NdDH2YNNC45hYvPgYOtrkXYe
 18rQymH2mbRDugeEUUWsRrbhWQtsQT22uPRk0G5M88/1MoQr7MSlu43
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: NImBpPsW6o3idCWlG2n2jeEQqzuILFdS
X-Proofpoint-ORIG-GUID: NImBpPsW6o3idCWlG2n2jeEQqzuILFdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX0fTkPhVfVKze
 TkQ6NRIoMjsW8dIyoTiOgGvkHUirBh9DiquTtXKhYhZYLmeI0jVFOS4grYOP2DZGPfQ/phxHMth
 B64sYOlLsAkpkyjf1gkDOZMZVgh0iFgJkNJcC/e7PMnztBPWjeMM8gROQpqlUJZ0Muo+7bkxpgQ
 /1mh3HRhZizdBtdb0fsULMjgzhs66l1wxDTCiSYUTMxdr1l73iL8oh/mBP70ydM3nKxgGwX0Lv2
 m/PBGGP9eidPCHVW7EWb8y5ieDFtn+fP5G1Gixah8IVLyxJukDbeUUu/WW8gZAiRklPa0Hj1Qz0
 HoDkl5IXRDsXiN3jfpttuHe1D/XH6jNqy0YV1Ln3G9ttUwG1toZgQjtqdwCbv29oHdm9SyvUNaS
 XX9RdjDasp1ev0cQN7wK2YONJGrdEnB/GffwN6yep4vUm7zD2yDn3ODNmzMJ9xA1wnM8X4x19R5
 5lpnDLVkVTgGLmK9a/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX0Ztfpcghf5YL
 YNUt5GHF70XaA9mXsy1V53VRmx4yJMcC8a3IWY32ALvmiWmjdK/0o3BUt8+nnHtTExcnoFVOwDw
 B6+WYaPVRyYEKk/ESBnkX0oUIcWWT+c=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a91583a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y8YhYyvsSxd9IuhXD04A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

The existing DP PHY PLL and AUX configuration for the Glymur platform
does not fully follow the Hardware Programming Guide requirements for
DP over Type-C, which results in DP link bring-up failures.

Update the DP PHY programming sequence and PLL-related register
settings to align with the latest HPG recommendations. With this
change, DP link training completes successfully on Glymur-based
platforms.

Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
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

---
Ritesh Kumar (4):
      phy: qualcomm: qmp-combo: Add DP COM v8 header and fix register layout
      phy: qualcomm: qmp-combo: Update DP PHY common init tables
      phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
      phy: qualcomm: qmp-combo: Rework DP PHY runtime configuration

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 256 ++++++++++++++++++------------
 1 file changed, 156 insertions(+), 100 deletions(-)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260824-glymur-phy-v3-b67c4702dfb2

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


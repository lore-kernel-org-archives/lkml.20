Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86A4ACC9B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401946; cv=none; b=f+b5KCPNJz5i1Gw0JjtXdGMOzrvtw3zjqE0ZhVxpPkMeLToyXm9monEG/C51FsNKiLG4BKNV95/FCYlrFI/NZYeq4Mal0TjwMJA2Sxsd5RqkHYre+4HRXgaW7bZZL8pB0lQ7R7ybAYrl83yv1Z6VFvHWaw4JbTGnDIUytuGtdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401946; c=relaxed/simple;
	bh=o9Rm5yUJHQJsSotZU9luNQ5EkPK3woZNCY7+NVvCHYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i4CiLBezZlWZ/kHqWJceZwHhCWliY+TULUM0SDuEncaA63EdOzHyJjBE47GMUTofftH51C7zQ+SZmJB+jfQLjLmYhfwYUdp+T416YJxYXW88CiYcRFf8Ee0JfB3PDU0U737UZ81gVYF7coQYsO7a3JSM6KnresRlO2JtlV7V55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ydy7NCeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7cBF9bc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ydy7NCeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7cBF9bc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtkX1348215
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILObdEuQZPc2pArHic+2Tx54ruG1wM/IcD+rqRM+SwQ=; b=Ydy7NCeZDquNGr5J
	kEjnkKd/Jwg/kmf4X0UqjoIxfd8gelxLhgOtrUidgLx9F90fMMYP9T5co3fJW1EG
	fTjAJ9NyA47xb3sDvmNEbUPqocRCBI4cuhVw0Ua+S52xOK1L8iFBcjn4jCSdBXPX
	9TGcpT22lXds6c6c2TAdDiMwSi882AUwhta+KkvjgizoDZiuyTN7sfudkTFgRC7D
	XyTJyS/wsWIj4ScIGPKpgXyXNQ2MaWAOa1TNweQJE5hRUMofYqZHgzOBSI8zmF65
	1KVSwh9/c3SM2eCdi/BxeuC8nBgkVTv3BhpZXmDee5FlGt1F/YYl0zo9c+0kf1ld
	d01NBw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgc81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:25:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6014198eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401944; x=1793006744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILObdEuQZPc2pArHic+2Tx54ruG1wM/IcD+rqRM+SwQ=;
        b=Y7cBF9bcwC1zampU5xP5YzPBXTkCV+XgF1TFOMNDum19lGo9J2SGjbUNKF62zLoA1H
         5xe5H0LqLGqwP9TGaI7prRdQd8vW0W7inBAyBH/ezE81EHEhxU9nfCG9Noa989IiT2fy
         R5cXbpzfP+ikI0NPBgApVGM2sVYwQt3H3gm928PglhTVpBngu5yPC7cCWmqxjMqsAlV3
         Q2a6EQf9x3rmvv7geyyg/AtHwZAavdaHaUcsQCT1ERj++NLGcAUNdbbnschg6E7TPzDD
         NCQlQBDErJV45IpUn6i5LunbZqZu+TFeUzKa97b9KvQEDlLkwYOAzUXJds/GvB3TLZ/W
         12Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401944; x=1793006744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILObdEuQZPc2pArHic+2Tx54ruG1wM/IcD+rqRM+SwQ=;
        b=p5MW0f0MppHeSGPhgCNqUHL17+/pd7Yq2yrbfKqvyr4eIa6Jg/iQiRNo7K6DAIKqHi
         LYrAReJOU09A5INkY2wvw5XrdfDq2uHEGTMOpMmP1bSJeh3EQm3DeVI9utH683MA3ZkI
         HdqxuxRQrmXWaHOFPm+5x2UVvyMOm19SFRaPxPxVS7vs0Jr6YaeTKHtBoth2xs0+mxs5
         WWCAvCaW8S8V9eao8dk780xgEYDS7iUKO/yhJfAjHxoDpY8qgyD1dhJDXbdnB0bvSE3+
         2awYNpZPS9PjgZxSQhNfBCgq8YV4otMK6Tm/xW6Q0oAeZa+qOev8YwSKaxhAN2Z4cROl
         e7Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxwAMDSguteuvOj8EKY+oiEKryUpfgRVtXbtFrjITxm8FHsLDtBa3YZNv1AT6dln/pScWfTl94/kKglnJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI74qQLSfFVzDX2Po43jEFI7njqLg/E84F7ONuPcuYpkP6xEim0
	fFV4Q15KMMtv7kFA0a6b3t4AC7o1P2BCja1KDEbYw9SzrxPL8JUTvFPnXjZcU0XQ7ThBVPwUwtk
	GKx//JPB08oxN8+wpIarDTI4t4bDkUcbGPAUmpIa9Z3g2Pi/5HwIqaVBcX3jHQeBYng0=
X-Gm-Gg: AYBFou2Gr65lakI4YKKmlScY0g0BiUQvvtILadmP8u6wOje0xviCT2v2iMgjfQ3yoYy
	rO382OociyJ4ZFLp2MTi2iQgo1wRCS005oYYvcMP/2NQpu6tp38M1NhK4jg/3Zuv45wuHAgmMFw
	sf7z6Ch5JIIU6pNbbGU9B7Q2fDzJMsSbL8KafkwdhgSwGJnfCwh5ADkfs1UAWAArZzncNzWqjOy
	BG/B/HifImAGU5ZgHvPckJDem7P9GcvuGDOjv2vlrVwoV0XN9kJkbS/2PsEZDyR8rTcm2ZRHLJ+
	9iK7agy2Vc1zg+b5DkMUyeVmTXWhP9D65OKZn+u/mByTDc64LLUe+oYUUFbn2i+gejn4O6sXCyw
	c5yNowJXSog7/LmbgCY6dV3G5AC2LQOqrww==
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr10779189c88.16.1792401943555;
        Mon, 19 Oct 2026 02:25:43 -0700 (PDT)
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr10779158c88.16.1792401943000;
        Mon, 19 Oct 2026 02:25:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:11 +0530
Subject: [PATCH v2 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-3-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=7367;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=o9Rm5yUJHQJsSotZU9luNQ5EkPK3woZNCY7+NVvCHYM=;
 b=8ix4nwNOe+ji9wfkBWGw2okBqBXhf4/mcu1LiCU8M5krFZF7l5YYU6v61CwUGtLzHM8cSsa5Z
 Gc1SkPlGPq1B3hfr2CKCVUmmMrsUlEFqDtEEET8uH3wWjyKE3jZGtUL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: EGtYSXjgryk7EsHyQDQ_7T5abHqD9jCS
X-Proofpoint-GUID: EGtYSXjgryk7EsHyQDQ_7T5abHqD9jCS
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5e218 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eLJRkEBLYn0i9-GjmtoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXyYXhi2d27yGk
 Sa3WmNyCmcYDbLo4NOA80LMPxy6p7oEg3h/ZUNYFxrD9bEWOKkdVouLTsuxUpMSkGRBrsa65bLA
 IAn1+PQPOKn2d/1KNZfIVloW5bHbG+W8PsExaMd5aFmGxeQbbeH5sCiXPNB3/smeZsjSPfqTRqi
 ppnZajPRPLJ9erasgw+4myW0ihtejt1bv6MdPCSEa71F6GgkGNe7C76+b0y8MIDT85yAVU3G1TN
 BmkUzzRCtw1erUCoyGXGZkLG793kjzQNY8B3uhJuzqJAOVLTLsQyGDP80Tn3oULrBTZRDjA7jIU
 BXIPp0pbX5FtJaq9nTYEUailbwRMVfR/65+YhPqsBl/4XZvQxad3C7BjEFPf7qrUEkFDLbxnRKB
 6zEJlPNV6lBiNfn2F0seQVst47RerQcL7PHfkfd3ms+qH7kNXVMqS6FLIaw+D26UGggZedA7tka
 fAeSLvBaYD0ny92ED/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX3jNWf5DCGzMl
 Y4ZwsPlXkJH+sD5apnjp7zbNhhEWHcchzoW/UPtKfbMESQ225yr70bZ9mZ8p6z8Wdm3YroduVAL
 Oh5GWHNKqT23bgmHVKgyBcD0lbw8d8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190037

Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
tuning parameters. The new RX tuning sequence is common to both RC and EP
modes.

This allows both Monaco PCIe controllers to operate reliably in
Endpoint mode.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index da83358c97ea..cf169d7cbd92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1231,6 +1231,58 @@ static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x2_pcie_rx_alt_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
 };
 
+static const struct qmp_phy_init_tbl qcs8300_qmp_gen4x4_pcie_rx_alt_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_0_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_AUX_DATA_THRESH_BIN_RATE_2_3, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_3, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_DFE_DAC_ENABLE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_GM_CAL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_PHPRE_CTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x7c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_IDAC_SAOFFSET, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH1_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH2_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE210, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH3_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH4_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH5_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MARG_COARSE_THRESH6_RATE3, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_Q_PI_INTRINSIC_BIAS_RATE32, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B1, 0xb0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B4, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B5, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE_0_1_B6, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B0, 0x9b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B1, 0xb6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B3, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B4, 0x43),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B5, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE2_B6, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B0, 0xf3),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B1, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B2, 0xee),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B3, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B4, 0x83),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B5, 0xf9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_MODE_RATE3_B6, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_TX_ADAPT_POST_THRESH2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_FO_GAIN_RATE3, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_SO_GAIN_RATE3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_UCDR_PI_CONTROLS, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
+};
+
 static const struct qmp_phy_init_tbl sdm845_qmp_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
@@ -4583,6 +4635,56 @@ static const struct qmp_phy_cfg qcs8300_qmp_gen4x2_pciephy_cfg = {
 		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
 	},
 
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+		.pcs		= sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_pcs_alt_tbl),
+	},
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
+static const struct qmp_phy_cfg qcs8300_qmp_gen4x4_pciephy_cfg = {
+	.lanes = 4,
+	.offsets		= &qmp_pcie_offsets_v5_30,
+
+	.tbls = {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl,
+		.serdes_num		= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_serdes_alt_tbl),
+		.tx		= sa8775p_qmp_gen4_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_tx_tbl),
+		.rx		= qcs8300_qmp_gen4x4_pcie_rx_alt_tbl,
+		.rx_num		= ARRAY_SIZE(qcs8300_qmp_gen4x4_pcie_rx_alt_tbl),
+		.pcs		= sa8775p_qmp_gen4_pcie_pcs_alt_tbl,
+		.pcs_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_rc = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x4_pcie_rc_serdes_alt_tbl),
+		.pcs_misc	= sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sa8775p_qmp_gen4_pcie_rc_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl,
+		.serdes_num	= ARRAY_SIZE(sa8775p_qmp_gen4x2_pcie_ep_serdes_alt_tbl),
+		.pcs_misc	= sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8450_qmp_gen4x2_pcie_ep_pcs_misc_tbl),
+	},
+
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
@@ -6411,6 +6513,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy",
 		.data = &qcs8300_qmp_gen4x2_pciephy_cfg,
+	}, {
+		.compatible = "qcom,qcs8300-qmp-gen4x4-pcie-phy",
+		.data = &qcs8300_qmp_gen4x4_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sa8775p-qmp-gen4x2-pcie-phy",
 		.data = &sa8775p_qmp_gen4x2_pciephy_cfg,

-- 
2.34.1


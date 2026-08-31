Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B753C342D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161200; cv=none; b=rIbqbmpC75EwE6gZpDSKAibOMYPhiUayegEGTA/ylHd6H+Ee9S6Qv43MiDRfLeMWoteIUI2ojMn2ELlMowQbKsvXnJT2g9AjUQ81h9ipEd+nINTqPwTV26H+1EVGXIM51C914HZiOxdsT0SMZ2AyC+SpB8Q0vC8XLeloFH17D/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161200; c=relaxed/simple;
	bh=aTj5KtOb2vKiTmwN7SGIUjWosWnCNz+9xpIGl5k0Q6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoXQgu9xAyu/MfvGSjGqAlbXJ+e4Hfx6pZSNmBLXgwAJeQ0Umed1S5tFvdiwPjQMIujQvMQfjOvZjdXkYo3teZj2TmwFMc8YwwGNb/G+tHWjI6ErH1f78JCQZOFr+2Pf1SlUOVtLiFtazioecuiIwBVvdnkp+d8dSwFQKsffV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am1YGbgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHOVyL5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am1YGbgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHOVyL5k"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V75lYR3543084
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=; b=am1YGbgnbiuAwlKv
	MugkxV8S4vci4keiIgzknG/WrJwYqCZkTtoDthBWr11YrBNTdbUaLmD/UTz7pMkv
	qPbxFuiGn4p6V0y/4L+PUUi7nCNRRK/USIwZEZ6KqbqN/CLOCbTiVZzvsezdwdsC
	EThn0iPdyLoqnXd8igTno52uzeAW6UgdR9bPy6R1GkN4T9accGXSPN7i9Ql2pr/w
	enXNNFjjQb3OR77PMMIgrdK/N+nmD4PROmBsqpSqxzh2nNvFYJeG16MDULFBwUKa
	l76X/q09+NeAStFZxHcwvB2M15u13pCnsYiGYPyMFI+HxVg7/DA7akWkxCxY003J
	AfFIzA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x082qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:26:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so26480575ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161197; x=1788765997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=;
        b=kHOVyL5kdXgh9BarKTp3LY2mUZIqVjJ3cox0Cnw73bDp/yM/5UrKBHF080+x9MBvtw
         RVpFXtVgtfqArOeVHv49VPIB8PrZT68hjPbXvMcqSs/Lrw+QeoijNMzKf2h7MO2krS4H
         yw7grjS4cqGTGNAI4MVyPgkYvfJjOP9ayrrYqii78lD+eT8ijukBSD1ZqZ2aMeL56dEw
         MUv0nUXii+soO9MpZntkVhJbP0CTsvEL+WaEheIpO2sJt8A+hfBcJM3TCUVq93uvT7r0
         JQLbPFt2xETUjJSYGG/K7F4sXDiQpTOfCw9bK7zejJqzBbH8GH2ipIeQzQ6pRJtmJ2mW
         +06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161197; x=1788765997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHuJUjEsLPE8+q1YHV5zzKgadJG0CI5d9no3OMB8tgI=;
        b=sHYLOLTikpvQlTL5dH5MjBPL3A5GOw5c+acyPHiA6BdVYtgZqCDKJsJjaLoTvSBzU3
         G2dplvtHPyN/sgcugNG4SmAGq6G3G9rzL899fo/iKcwKwqLhafASr6roEhIVJQspcQEX
         I7LPeqmlICWp/SLB4ksFVl1L0UVvF0p0u8vw5+nOiKbMcI+//V7guDcuDTBHFzMbkw31
         r0tGmhucEgTTkiiHEULE5qmOZcZQv8z1ACcC8W/PKXByHUdLYAbvWg1hKbW/LIZ75Em5
         Voc/7vaZfcO277QJZGfni4CQtqSBPpS+HIUw2suLuf/huoo3u45obVpSSQhFcyCayscu
         JOEg==
X-Forwarded-Encrypted: i=1; AKwUvByULCN7kY/tEUY4Evbp9uV9skvQINebquF3JtbkSIbNE5kU93RU3yRnIy4vnXsYdPz5CJvZdBKSXwrW0Co=@vger.kernel.org
X-Gm-Message-State: AFuF++mq5uH3x6OsA8eEi0WgbXZY6QuwHoM6mfvHGFuTqeibEJ82yhna
	MEwP0KeqCOsOjjCNDFC2mDFudz5yfz8oEWy0L+l1sqbbl3zOgl1x0FDPO5ig3ZaC7aMVUWAJgAL
	0vElxyvttU+wq/ZcY3bfGifAljkYqKp8elUYiP8fwqu6JF1i2WCirgguI25eMlrF9wqg=
X-Gm-Gg: AYBFou3I3RhRLLHyFB3qZV0NUu5UXALZNGrYFXvEt+CTjPHwCZCht9zP94Afu9B4Ieu
	3OP2xR9hm1mvQeOIh3CKgGXNVdPReRwZZrIps4gARGvvdSZslg4oOvomcmx1bBdrYsVpYB6xVIy
	ciMhqT+dka9t0ywui7o4raLbS85M5798UAqdm1pCgURSxjVqiirqKyiD9hISuG9r8YYGsWB928k
	HzGQvXb/MqwyAeFODb7+6OzhWX7r/ShBkdeZNyMzMugM950QHpZEoU5LjELqq6NcqfVkhnpromO
	L/AiOg82n/eNdDjDnsQi2SlCceyerbwk1ijN+9WYwtfUNRL52S6hoJU7RqdX8H25Le0evBMdFna
	44dobsXK7uzi9X9npFRlLKWWngNADVr4s6D1t
X-Received: by 2002:a17:903:3b88:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2d8df44b118mr230672755ad.20.1788161196966;
        Mon, 31 Aug 2026 00:26:36 -0700 (PDT)
X-Received: by 2002:a17:903:3b88:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2d8df44b118mr230671785ad.20.1788161196378;
        Mon, 31 Aug 2026 00:26:36 -0700 (PDT)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm31327059eec.14.2026.08.31.00.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 00:26:35 -0700 (PDT)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:56:04 +0530
Subject: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-shikra-upstream-v2-4-406661d75afa@oss.qualcomm.com>
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
In-Reply-To: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788161164; l=4605;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=aTj5KtOb2vKiTmwN7SGIUjWosWnCNz+9xpIGl5k0Q6c=;
 b=PjB8STXozdOt3bZU83GyYBS/uO+OuIbWwQDKA7PhE07yCX+a6lnCt7IJ6sy5kjsbjFqaMzWYu
 VgwOi6BrBLZCgrxK/Zo4fFAJbRi0ApsytXvmD/vEz+NtgZ0EcgfJdtC
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX9wMddbXrUYbK
 qZ3msItGXHMfqoAyDKq37gdohkBo1jbXdj5e1LEC7XaGEM82jeG7/GaFwYiv4SUcXr3b8+vrITI
 ZQMAA+kb6W51M4cygJPVgAPNpFu9vlY=
X-Proofpoint-ORIG-GUID: VSdviu040P1OaB-jRqB1G0fzjKH1Z-nq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfXyKz9t5bD0qZy
 BpDQreeuKkWwizO82ZW8SSW/aJibVHM7HlK17ypX3jfooJAuXyfljKQ0WBj62I8tafrMSiPI4cL
 kwqkezwEiowIk0sCfhwYO5BHZycICAu4+S8USovPvy9b+KpvoPNZU1n1QrOJnnl8DHoIwCC6y8c
 fmTmAXa2KR9FDI3mK8qR10hEAhqjmCOBxQqLcxpqVWrI6wHiY0neWAfgQVj76U/fxir1Hqv7Dsd
 jj0sg37hmmXcq9OGtj44O4K+uvc9Ph9AkOriVSWdv3D8PnFyf5Lrb5gMU0cRrmwdGeZ8VIWwn3m
 mkWH4j7MFglC8CNGUwbkebqxd3KHMe7L55FqzAxKARnvi/LYgLgGrvhfbtup+j5f2yyZEgCV5eR
 5xr1IQPqLgB12+VCx+/FpuE8CwFSzVQ1clwwvXwM2rfMo3RIY33ByWGA3HyiNUobEKsMi4SHcxZ
 1FYvu2Ezqgis29ed6QQ==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a952cad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iLgwJ6eFgLmkID89yw0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: VSdviu040P1OaB-jRqB1G0fzjKH1Z-nq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

Add QMP PCIe PHY Gen2x1 support.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 73 ++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..e0995e4d5f2d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2172,6 +2172,50 @@ static const struct qmp_phy_init_tbl sdx65_qmp_pcie_pcs_lane1_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_LANE1_INSIG_MX_CTRL2, 0x00),
 };
 
+static const struct qmp_phy_init_tbl shikra_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_ENABLE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TRIM, 0xf),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP_EN, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_MAP, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_VCO_TUNE_TIMER2, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CMN_CONFIG, 0x6),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_IVCO, 0xf),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_HSCLK_SEL, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SVS_MODE_CLK_SEL, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CORE_CLK_EN, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CORECLK_DIV, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TIMER, 0x9),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_EN_SEL, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START3_MODE0, 0x3),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START2_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_DIV_FRAC_START1_MODE0, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP3_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP2_MODE0, 0xd),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_SELECT, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYS_CLK_CTRL, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SYSCLK_BUF_ENABLE, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CP_CTRL_MODE0, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_PLL_CCTRL_MODE0, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_INTEGLOOP_GAIN1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BIAS_EN_CTRL_BY_PSM, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_BG_TIMER, 0xa),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_EN_CENTER, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_PER2, 0x1),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_ADJ_PER1, 0x2),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_ADJ_PER2, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_STEP_SIZE1, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_SSC_STEP_SIZE2, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V2_COM_CLK_EP_DIV, 0x19),
+};
+
 static const struct qmp_phy_init_tbl sm8450_qmp_gen3_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CLK_SELECT, 0x34),
@@ -3911,6 +3955,32 @@ static const struct qmp_phy_cfg sdm845_qhp_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg shikra_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v2,
+
+	.tbls = {
+		.serdes		= shikra_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(shikra_pcie_serdes_tbl),
+		.tx		= qcs615_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(qcs615_pcie_tx_tbl),
+		.rx		= qcs615_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(qcs615_pcie_rx_tbl),
+		.pcs		= qcs615_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(qcs615_pcie_pcs_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v2_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
+
 static const struct qmp_phy_cfg sm8250_qmp_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5603,6 +5673,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdx65-qmp-gen4x2-pcie-phy",
 		.data = &sdx65_qmp_pciephy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-gen2x1-pcie-phy",
+		.data = &shikra_pciephy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-gen3x1-pcie-phy",
 		.data = &sm8250_qmp_gen3x1_pciephy_cfg,

-- 
2.43.0


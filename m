Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ACA53D0A1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876125; cv=none; b=fxK6MQ5nxfdeMHMEJdn93Cog9g6dx6LcYJQVXNjeY8XQFIFYuBb1VAOirPW5QEv+BAeJpaifVhLgZqCquC9427NiGFtih19H8yOSF+bkpdBbJD0UltWwy2k4mvIwsCbZjxBaG8BMZf/sFRLdL8qw6ZIdWUEOlsmM1W31RT+KNTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876125; c=relaxed/simple;
	bh=yslT2JYaJhS93Aqqn6T4vpBVe1fw3AfIiV7EFb+QHps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMMwPI3/Ujj4dF7F1P7fGt1K5wrBs1Xo110SWBXnc+Twxs/ddg1dQdTDqjft9j6YmUVuhzVMKVG5a4vHfiG4eWRqZrnj2GNfBVXRoVmygu5Dir50vrNE70IDDxmA2m5FvcseH/I9dDSkJGaq+NZ7lJtHm1VFfynXGAdudZW3Vhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKyRbfOO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP5LqsWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKyRbfOO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP5LqsWe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckx0K3844427
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hEgodOPsnVk2RyMGUA76F2Quat3GOBq2+U6/p5NKQEk=; b=jKyRbfOO1l0O01Vo
	sAj2Rn7o2cYjF1pQqVGzZZ+QfIO5G2FlrvybvWtf9whRf5xVNThF6IFehjGEu3Oh
	fXReLC7pQWq6SssE3Jqqb21CAPukCi6lsMOHw9REeHI6OG5WPYblDmVPuzkZ6u9a
	arRRR3V2MHmJvsuZgcYem2XvRaRD3Z9bAGpHwH3aCfd5ZJ25PVPRVfYipEcV/nKk
	MCiTj209L2mjkSKk4EL8ml0Nhkj4i8egIKAOHviUa/pO68JIe6s+EdmFqs4fFSdl
	61KJAxWK/3db88XwOZ9+Cp62CLq+XxL785VfHJ+mRRmSHW6OHEIGsfsWlweDvBux
	HcYgvg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrx2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:01:49 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1a220dfc7so1838945eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876108; x=1789480908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hEgodOPsnVk2RyMGUA76F2Quat3GOBq2+U6/p5NKQEk=;
        b=hP5LqsWe/4mD6An8Li+9M3Xqdo4iT4gZSKuZaeIbdUV9JggjrQjTCVbDBdlPAhnaS1
         a3nzqpFqpC1P5lkcR39DY81F1C47YnDTOBsdSmrQ+4iwoq7yqOJbZlm/LBGyPAPzRJbF
         JBAikMajR5Z5ImY5fdSSgLqTG9XxKJIV6TS0I4CyVw57HNiP0gVXRKrWAnjP7BsZ9EWo
         VLyTYIvORNJUFtM17XK14fPBo/cF2OAhCdLhk5m3g+Lfm/XUS0VgAG9Fkxch4kpdGfcQ
         gCs5MBkUI3xyeV8YLJoDZoznEifCBxjgNbH2DAaCiDYcjrv2VafFunOaZ/OY6qAMFgeS
         7wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876108; x=1789480908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEgodOPsnVk2RyMGUA76F2Quat3GOBq2+U6/p5NKQEk=;
        b=L8zFZPAVFqSVsabPi8Oa9y01bbI9kDdcsshuV4XNSnpxoB4yHM5yKKMNrrpKWdNZru
         iXpJWYUkcxX6l2jwZKw7ID+YeN5gAPXjMF0JKFMw0xRbE3vORvkIU2/OQ0s53nIyKSD2
         cPuGxmYSDqsfBdqI8jQDqmtFL4/zf0Gex6poGGSkjDcthULtSgflSGGaI3PHLHyIvqAC
         cvptgSpOcBZ11iFLxi0ZB0Gcp9J7bSCxawVCaG7Yu3NvyjUVOUYXTfBFNEdteU3Ll2HJ
         OSOi7bAortAQYyEeq2A9SSxVeml+cpHGN/I2eaYGMr9iU2HU1JG79rsumXTTLfd5MuQa
         bvgw==
X-Forwarded-Encrypted: i=1; AKwUvBzSXglRx5sks4JOjGsyicmsqsYh08iHyi5ZFyZWMxI52ADsYDFXiLARd8zseZSGf/R2Dp5lWBOzyrh6/vQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nUpPn6mybi8Zb+zjycxrkQGbzgpbcyRZUmaD8qonNORd62xKKP
	Mtx6sEhUzGCWA2p+Ulbk9jAzTXeHjVgGYlrYTC+mterInkFeGbQATdvdu49+8cgvx9GGqsZwGn4
	dcsNAMLq6OP1tHv1FCHIt4McBvaqbQJYpI/936Kldh7EKra2l2mi/qwnmHoXqG6XHaPI=
X-Gm-Gg: AYBFou34Pryll3ZR7rXT/hmCseor9RU4b0lFv9y9Ja6FFwxLq9jLsjR3JEKWSplhnIU
	CGRp97v7Fm42a6ynGNjiR0qGzGR4AMna8BV98482JLd6/8yH9nMC3nUsPW2u6igVWtd1iQKqwui
	bGxpKUbUIdMVC3Y++w1USUJfcJEQEe2kn0lW2Si+O94bXBBNoAnHduaE+nurdPBWfHBjblb5czs
	4RdM6dgUt97Zc7XexvjWoTXiyO5y7fE4papyxC5v1/jFWsWRLQdGffVFJ1dsy6xqo+CMTv99Evg
	LlZhYT9wXd6X9kzw5/jlxvAKEpT48I3gKAkyKvpFg6XzxoIp5vSS33oDJU5JEFMgN/WMpiX7CYG
	eRMKGDdHEQ7TlwyaKyhBkc/l7MQA=
X-Received: by 2002:a05:6820:561c:b0:6b7:46e9:9713 with SMTP id 006d021491bc7-6b746e9a381mr9125494eaf.67.1788876108319;
        Tue, 08 Sep 2026 07:01:48 -0700 (PDT)
X-Received: by 2002:a05:6820:561c:b0:6b7:46e9:9713 with SMTP id 006d021491bc7-6b746e9a381mr9125429eaf.67.1788876107682;
        Tue, 08 Sep 2026 07:01:47 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:47 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:31:01 +0530
Subject: [PATCH v4 8/9] phy: qualcomm: qmp-combo: Fix Glymur v8 DP PHY init
 and configure sequences
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-8-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=5341;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=AbJUtIvQ8HecHwJf3QH/5xJwEXa2vXvAnUzqr9IYKMI=;
 b=6aXBHHbfvnAttBgCYtSa0tkM9AikkPKmVlg6460l5d1j373kfwcYc/ySLbNCu/23ogfCc+CK7
 Lg0xBhcA+wjCHzm6uoLawAV692hdwKjlpKMu7Rh0ApjNcBrrnQ7sz5X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa0154d cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AqvRyXP2OKJBH5cxV00A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: xpndvCAAiuFcrEPobzgChSicJB6CqATc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX+8XIYtOnlqu4
 gxSNC2Wpj+p0A8x/hDqBJ3nzNnIHwspASLbq4J/RnQkXD+BzjvkXl9c1SeX6j4zNbQsKyXe1iGp
 qgQz2j2byu9vyghePFFmqIyBLqZUMpUzWZyxzKJngTvAHtrdYDOvHZXWc1/qIdCv1YTyWLQzKyX
 mGGbsEEmDn+4QOPFPcVXQ9AUipJIE/BOkOFFW/JKsZacph5I8rmvV8N+r8HbGYBQc1Sng/890j+
 feObOZbZDqaPWmVoWFFXJS8V9Pps7hAmN/bWqkEIvliYuu9OsMkCcHaqxqiKiyCzZnhRSwlZR8t
 iS7Q7a5j4wzidTD6TGm8LBrIng9Hqf0dvlUjqWvDFqS+qdwYKbb+smPqAWDprBrFGc7DYOq3OCh
 iVBtDss2JxYsOXOFdZ118L19aC6I/PJMF7lhnpjAj8tDRyZz/LcaS9wLOUsC2035YaVPl4EN7Bx
 cTHfSAMjfyV5zw3Tg+w==
X-Proofpoint-GUID: xpndvCAAiuFcrEPobzgChSicJB6CqATc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX4vsUYi6hc6NI
 rJsps2IvmMj+kgF0gLY73s6wtR373eaBgI782UevhZrnsGcMSNWU9OLOQhftvdiKlvuUEmd8EMr
 am4q1qV2vXw1bbdzWuGy5uNx0Kd0sXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update qmp_v8_dp_aux_init():
- Add CLK_FWD_CONFIG_1 initialization (0x3f) before power-down control
- Replace PSR_PWRDN with LANE_0_1_PWRDN and LANE_2_3_PWRDN in PD_CTL
  to correctly power down the data lanes
- Correct BIAS_EN_CLKBUFLR_EN value from 0x1c to 0x17

Update qmp_v4_configure_dp_tx():
- Correct default TX_EMP_POST1_LVL value from 0x20 to 0x2b

Update qmp_v8_configure_dp_phy():
- Correct 2-lane and 4-lane driver enable values to 0x30 (was 0x10/0x34)
- Add CLKBUF_ENABLE (0x87) programming for both TX lanes before driver
  enable writes
- Add TSYNC_OVRD sequence (0x03 -> 0x23 -> 0x22 -> 0x3e) and
  LALB_RESET_TSYNC_EN_CTRL (0x0a) programming for proper TSYNC handling
- Fix QPHY_DP_PHY_STATUS poll to check BIT(0) instead of BIT(1)
- Replace post-lock TX_DRV_LVL/TX_EMP writes with two COM_CMN_STATUS
  polls (BIT(0) and BIT(1)) to properly verify PLL lock completion

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 53 ++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index a07ad858b0d3..bb1c5df52d09 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3827,12 +3827,15 @@ static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
-	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
-	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+			DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+			DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+			qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
 	/* Turn on BIAS current for PHY/PLL */
-	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
+	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
 
 	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
 	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
@@ -3859,8 +3862,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
 
 	qmp_combo_configure_dp_swing(qmp);
 }
@@ -4049,20 +4052,31 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	} else if (dp_opts->lanes == 2) {
 		bias0_en = reverse ? 0x3f : 0x15;
 		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
+		drvr0_en = reverse ? 0x30 : 0x10;
+		drvr1_en = reverse ? 0x10 : 0x30;
 	} else {
 		bias0_en = 0x3f;
 		bias1_en = 0x3f;
-		drvr0_en = 0x34;
-		drvr1_en = 0x34;
+		drvr0_en = 0x30;
+		drvr1_en = 0x30;
 	}
 
+	writel(0x87, qmp->dp_tx + QSERDES_V8_LALB_CLKBUF_ENABLE);
+	writel(0x87, qmp->dp_tx2 + QSERDES_V8_LALB_CLKBUF_ENABLE);
 	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
 	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
 
+	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
+	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
+
+	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
+
 	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	udelay(100);
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
@@ -4070,16 +4084,25 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 
 	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
 			status,
-			((status & BIT(1)) > 0),
+			((status & BIT(0)) > 0),
 			500,
 			10000))
 		return -ETIMEDOUT;
 
-	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
 
-	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
 
 	return 0;
 }

-- 
2.34.1


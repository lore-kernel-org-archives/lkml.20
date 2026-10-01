Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F64CDDEC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847343; cv=none; b=QI3FvrGYrjkMBJB3B5zlHnbLKgof/yvaoDty51wWcEkbKC2x+3uTXvK4SpRsYEl6wRldlxpHlGgR8YV6dnusIyFfGrjUNXcCn9w9RYmR+IBxn9pgG+IjqC3T+3T5kvdHzOWD6hL9zYnLTi/Pfebp75tAJ0h2LLfGJBqai4VT234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847343; c=relaxed/simple;
	bh=VtJGURlRK9z9gkHpVI4Eua1WcO2BwPzXmAdNyqUinCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfZ+nI6yZaQzYF/obfS6pIZeNG8YAxcJiHUyp4gK+NcfoCvCIUa/w8m6jwTsgOfAbqPZzVPl8C11pjHaJscLkpxavRPlm0vHFp8Fys2Zlh5gYZoA3+ZUA6O/w3Vi07g1ESqI1nn7JLRUrSdclwd2FyM11Y3HUqziJ8UXxkrd7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gl8qhSu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POLa0/Xd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gl8qhSu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POLa0/Xd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xkTA396181
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNW5ncIRCv0ucBtC9pMRgOL2NfkSvdDCeec+0onL5xM=; b=gl8qhSu8MeS/Hk8S
	jsnfJe1qZk49Vf0PY6lIYehhWNU08gwQlD/aUf95+C7W4OOQJRPxCAQs0AvmpsRl
	9vUbimYTvg6Kw0HTzMr0sPAydctyV1GGg3wu8VHiq0NokB0A4l3y9OhPwxHtjWid
	qwt7VC1B0EiCJnuAXf+0RKgFb2/5pUNpt+rDKxJfT8t4TuEBM26lt2OBUQ5DNIET
	vZNGRKDCZMHBgshm8bZUbp+7pwpxv4ApN0c4uoNlRGSjU+0yJ8hNlJ+HPCySv6kh
	sHWGATgqPK+iGKf5rgKvAm6LmMSdadwWK23Cs/Ztsmm17BME/XmQyptZ26XRGgbv
	qMDIQQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a4m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso9873958a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847340; x=1791452140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNW5ncIRCv0ucBtC9pMRgOL2NfkSvdDCeec+0onL5xM=;
        b=POLa0/XdhuvgN8HZBzn+xn/jpo3n7weJ4zSjw+nDCZdvFwWzFDpd5IoEuj8UpHObwp
         9AWhyDPOgTaxp3rsSbSz3hQdQ49xuLBQ4B/MtUHNz+lOaSFmlEza+z0tl8WBu7/w8M1t
         SsOxW7g7dsh0a7FsfMb0V6238Ff+PhU1QgkfTmzTAugghrl/cJ7x98Hpgbuda81JodKf
         xw3VJGbUoUHTNjdB/oIIfrtd8rmFkX3CstvtU2hFVGVuEyAjxWQfJ6Oi6wzN61lugIzB
         EeRPaLcwZovNDy6sODkeT+RKxT8IxXXl/h13fgGfFJRiZcvxIdz5r4yi+sbiIZbfPZev
         jzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847340; x=1791452140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNW5ncIRCv0ucBtC9pMRgOL2NfkSvdDCeec+0onL5xM=;
        b=oW2DCEchnA9fjiAHA9G216FaEAwABr/ojXsbLbIHemi4KRuYUAFoDBASoIXhHkqXAa
         Tc36YzqLc4omI3aOGwGLssZCdVzKEnS/nzBMpNThSySp6qhowwEjmo93hyEdZEnkEgi3
         ofM2Luu7YYC6hU4KPfl6UzAddDU17PNJh8lBlT7QSxz/61hA2OfmTzGa/Nr1wbyIr5nS
         1+iQYKxDD1ML3C7j6yAajYltVHsjPTDv/t3MboUeFOn2N4eHgWBl+6/QrQUup+IgLnzZ
         foaDm/lEQhF/IFD12QIw6KzbkCWfZX9ka44Js0mpRZYrCKepp5hCeMM9TrIH0DiN3tQn
         mXJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBBdXZjqO4DGxyU35yQdzTj1QSCn+DDXEon34wAf4gkaBPTiPmHI0Bnaze7yYqui27vipbXk9skXmWK7c=@vger.kernel.org
X-Gm-Message-State: AFuF++lTkxmiYLFGR3YdJEoCmpOpbCMAeVRbs7zHRVUDQuVtpskNUOct
	Wv/9TUrBD3dM4oHNdRvTdPSnh/67wPpOtg86WZh1AsMqHmyA52l4R/rBJGfT04xDoXhabZ4NgzL
	GfGBCrlskCXX1zqQwvGKnEJMPyE2ZM6vC0pzTDSMXzaVjl+wzrN3EI/0AXpDOwqC8JwQ=
X-Gm-Gg: AYBFou380tXSolFmkEdY5uERilFN0DQ7Fg2NGZbZZGd8fGUmfxY627hlZh1dWsXIOwx
	oI7G+e1BDDcwRrzQYIdOril3mM+EM1384dK3+VMTfG8PC8ac+4q6R/7yX3f5J7WxcD+kELpRDai
	FCcLcMcw43Gp/MtoSg9qQy0eqq2joplYvF/kw5jHnvED3HbKs8DO8WkLIXL+/VMl2RkL11lqP+E
	VOplTl/MZieGigPs8PcPE26iQLjmWbk0FUKO11yVmwCQoDaPIuqaAhrO46dthFGYc4nIovdu4iD
	VwQCs+80NkINU+iJ2T2jgnqw/GMoIvgD7n8/TtOAI6dsyVFZPMSzWPOi/nOnX2OqkEcERu9xvy+
	Wq/qwIOnmlZtJbj1pBFSeDQxxuJk=
X-Received: by 2002:a05:6a21:9191:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3de9e7392a3mr4375983637.19.1790847340085;
        Thu, 01 Oct 2026 02:35:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:9191:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3de9e7392a3mr4375958637.19.1790847339625;
        Thu, 01 Oct 2026 02:35:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:26 +0530
Subject: [PATCH v5 09/11] phy: qualcomm: qmp-combo: Add per-link-rate
 auxless/LFPS and drive level for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-9-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=4241;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=pUj6b4ENPUA4XLnFIcN8qudRlZzVAcU4OP5AWqGsODk=;
 b=3LzkAg4XuvVrQ5zzNbfsTiboanmO4HVstA2MStGD3ahJpx3Q2FhJ9IDOS1CXWh04IWCptv6Wf
 vSOskQupflBDml+MzMeDFYebGG5XnRI4fdDswP6ctNlmcX67ucxUQ6+
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX0dXHHMY4zmfs
 lwQ4rOR4sM4Jqo3mZ3qDnvD1Q96ysxUR6JLE4duuPEWE7/66+k++iUrWPOYcH6OujTojUqc/2mM
 D3NsbFfavmtBa92YRGfQVC1qon6xUl2krePsfkrEinAnGmkAgJmT7EmWB944pCwzLzdjh3WYqSp
 8UM9wYF7dCP9v5BCb+UOHYrl73Zquj02M3cPnpqoaGwaxCm6mScu0QnoKv3ooH2q/C22ZWEBEMS
 2xrL5alxBWong8SUxHDeiuupcO26U7+d2wBArBRl2b4UbqcKUmK+t5YYjs0SR1xT8CiaxIVJxRL
 SKoZdsNd1Oje2dY3ZzjyKmnpGOtcp5ojkN2kvl8aAgnz6xk+A+NBDxN5ihLgE46NofC3IzJ2BFa
 KqNcugG6pk/Nrx9/NC7/FBZjFQm/ofRuInlm1YBCo1lH1AoZlfuMG7eaEeifKVjB3aMYPWEIq1U
 KzsUugr85ZSoehjeOrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX7d2t8/HHALHt
 5WmXbnVOGMYOqI1ZmGWCyAOrrxDCaFyNMl9ZddOSQL7qTMK+VW94dWtzXcFKh++Mvsw7Yv+hQJc
 WQ8eG37JNyWekP80r8Fy49cWPrVbxHU=
X-Proofpoint-ORIG-GUID: RkHRcyPJg1AeZmUsednJ-ffsZEb8QFb5
X-Proofpoint-GUID: RkHRcyPJg1AeZmUsednJ-ffsZEb8QFb5
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe296c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tE633ojKFf1lYKHj1RUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add per-link-rate auxless setup/silence cycle and LFPS period values
instead of using fixed constants:
  RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
  HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
  HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
  HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55

Add per-lane drive level lookup from the ln_drv_lvl tables based on
the maximum voltage swing and pre-emphasis levels across all active
lanes, replacing the hardcoded 0x1f value.

without this change following error can occur:
- Link training failures or instability at higher rates (HBR2/HBR3)
- Incorrect LFPS signaling timing, potentially breaking USB3+DP
combo mode entry/exit

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 39 +++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 6f5d32afae67..fcbd7b974be0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3897,21 +3897,47 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	unsigned long pixel_freq;
+	u32 auxless_setup, auxless_silence, lfps_period;
+	unsigned int v_level = 0, p_level = 0;
+	u8 ln_drv_lvl;
+	int i;
+
+	for (i = 0; i < dp_opts->lanes; i++) {
+		v_level = max(v_level, dp_opts->voltage[i]);
+		p_level = max(p_level, dp_opts->pre[i]);
+	}
+
+	if (dp_opts->link_rate <= 2700)
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr_rbr)[v_level][p_level];
+	else
+		ln_drv_lvl = (*cfg->ln_drv_lvl_hbr3_hbr2)[v_level][p_level];
 
 	switch (dp_opts->link_rate) {
 	case 1620:
 		pixel_freq = 1620000000UL / 2;
+		auxless_setup = 0x03;
+		auxless_silence = 0x06;
+		lfps_period = 0x00;
 		break;
 	case 2700:
 		pixel_freq = 2700000000UL / 2;
+		auxless_setup = 0x04;
+		auxless_silence = 0x08;
+		lfps_period = 0x11;
 		break;
 	case 5400:
 		pixel_freq = 5400000000UL / 4;
+		auxless_setup = 0x09;
+		auxless_silence = 0x11;
+		lfps_period = 0x33;
 		break;
 	case 8100:
 		pixel_freq = 8100000000UL / 6;
+		auxless_setup = 0x0f;
+		auxless_silence = 0x1a;
+		lfps_period = 0x55;
 		break;
 	default:
 		/* Other link rates aren't supported */
@@ -3921,18 +3947,17 @@ static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
-	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
-	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
+	writel(auxless_setup, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
+	writel(auxless_silence, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
 	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
+	writel(lfps_period, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
 
 	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
-	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
-	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
+	writel(ln_drv_lvl, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);

-- 
2.34.1


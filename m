Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D947ACD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876156; cv=none; b=bFMDuDuvw0/MLLXx4sJzXm5i/0Ltn9VeOgvej4108p37jZYVF0w2uvDJjFDL+3zsfsvKBCuRKv+CUQ7VmeOjV+PCWWWmsx9Tr36TW+Yd/l971jzSU6H8Jctb48n9T+K60T7LFnzeW9XF5XvoRwlVzu1T80eZmtK6H6y7rsrmxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876156; c=relaxed/simple;
	bh=mfVAIzI7dp/EsLEDP/z1FixnKf2aqujkq9lpYCiyTIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7WOvPN7MgEPAnfn/oQhkQHgrZmVtqL+W7/zKQhiE9PdlRjAKBxolqOtqIGLUhnVGtuB+wuEeCV6QjwR/PMtfBpU/TCIZ/jSzEjHeZBt3etjGclgzfOch3nVC+o6Yjc2/JV98g5xo4wx69o6LFIcjeZl4MqnLoQhKvUAoNO+Gso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9k6jSpH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBHSSJr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9k6jSpH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBHSSJr5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CkkD44162974
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=; b=H9k6jSpHaPW/1kui
	S0DmfVkFo3ezbjZ4bhH0lLJMx9zf2ATgBVta8JtSt4TA/Z5RMLtalfhVoH+Snoux
	r/L4Z/4Hq+pa14PbiKC5hTy2+Jn0a1VrBL2x8SEZHidsI4buUAIdz3Oa4Ol+CNxv
	zUKv5dvZUR1FJ1eGNYDcgkq+8KnyV8KDF7Taw0Un0huQSCSrajQsRhGClD8ODSyb
	fO0pEtVU4w2IBC8Rx0WyrVN1BXjmuNjW/xKOuiy2Aom1Q/qzt07Pbsjasuvg1V8R
	g84FOYuQ9cyGxeTMKaaoeafLOequzZ5Ud/qxZ+3FWXgD3lPOdB+4nsFfSCVE/gSP
	8GHWqg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa9fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:02:17 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b19eab8bso2582543eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876137; x=1789480937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=;
        b=kBHSSJr56VeSl4A6T0d0p02anQML1l/YM7YzPg0LHqRR6yy1jn4Qu1ncw4YHFr/TrZ
         5PB6ACLSwNa8WgpnnUakDLJF6yzhK268bOqKk1MJzOAtme/aUBUfOIpcTpLdpW7IR0ey
         mF63IrmwEFKJe6p60sKt2blmSbSSlFLCOpFrkoKToUAJT/uCDmEDRX82o4IGnVv/gLiU
         6k3mIBWxk3+5Gh8B6gUZ5TZEpdF+p7kQXvVAdOpT4F5xMqd5OEMpqGm7oCmYM0qmzZN5
         DnsFJAeW4RpnFMdESbU0r6Rehedw4iDFwGE+P0QGIe2I7rMeHGs9BU9pUZTuN6n7GIp5
         h8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876137; x=1789480937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdbggFe7q8Lj6kqK3e4CFZXoyrPkPZ+UAv54p+w4GjQ=;
        b=f+3RNci6oCNMP5sK6UczeLYofrpdb5ZL6odDkiZffvchHtoIYHU8PRyJ9KLMHk2HvX
         H/d8dUlovOUa3iEXAtN85I/LOmm64pUa7BUiMejyGX2NoQrMHcrzirdR7zftjCXxnxGW
         ZCn6O4Uf8cc6XXARvIFoxHzBupxeEHYlXq1v+dXI75wQqvcWKb0oqyh9a8T7T64WYrMe
         Cv0lFOF1+QojVbMEl6Kc6opcNkvzNMS4QjiHZG1dRCPzE99a3rT4oN/V/ANcEWWirQq1
         TgMP2H3GY/+Ls9rMDt4SE4AxGFyak5oM6pol0E8S2y4lmpevcM6WyrD99/mYnnFp9wuo
         iVbg==
X-Forwarded-Encrypted: i=1; AKwUvByXIvZyNEfuTGFZVkLdilA3zbKM3iw9/qHnCCnOLVILrVZDpqRc6gJDy6o61j/AWO+l0dSbypyaTCDfBHs=@vger.kernel.org
X-Gm-Message-State: AFuF++n1CS+CiSsXYjcvWfB+ue3UXT+YPFlVNI1Mw0MZuB2fBySnyuug
	cln9a/B+jrRBKVoOpBJkJJK7bQal1p+tEhvlXoj+ZkJyqq/ucxX21JEzTuWCzcIrElnnshsUcUJ
	ThxZdxajIJi/MGgcDlCa2Mq07l8iB5JBqlJN+WOGgS3067zXvbmqGd9ysUklMLq9B1ZA=
X-Gm-Gg: AYBFou2w3r1stLv64MvhU5oevLYmmi1X3nJFkOLZWaopUDjxEaRIk9txnNO7bLSV+Jo
	XZVkWgrd6fKUe5aw3Epezs/E6FAf1WFeDesqvjjDkyduzaRAudRBCxcSdJ5rrnM5VsHIIUla1xn
	qxv5EBIj8Er6FXy84USZK0ftqZbNEnT87HftuRa5hAX+vFuAGRBamGwxyF47SJTySVeFyYmPN8N
	nuYMF102EwlhpEXzf3LWRu7sTID8Ba1tX5hC+KPIak6bKs4O4iNqPio+GHvGO3zQXKOK73gD2IR
	pxnMKNV1w7ScfpXr8e1VPSaxY2yXrI+l4GoliVPycVVg3yzEd2BWnOXiYXVxc1UXSrqeQ+UQtsN
	VBeVHeUBk9mHDETMUhcgkCxaNYvE=
X-Received: by 2002:a05:6820:1890:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b6fb8d25aemr15843905eaf.11.1788876120297;
        Tue, 08 Sep 2026 07:02:00 -0700 (PDT)
X-Received: by 2002:a05:6820:1890:b0:6b1:464d:4d1d with SMTP id 006d021491bc7-6b6fb8d25aemr15841199eaf.11.1788876104004;
        Tue, 08 Sep 2026 07:01:44 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:43 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:31:00 +0530
Subject: [PATCH v4 7/9] phy: qualcomm: qmp-combo: Update
 qmp_v8_configure_dp_clocks() for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-7-ff22e5150538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=4361;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=6aummGG7uM3gBoUmHGxAZoDx1OzuEAw7M7EaVWO1zCU=;
 b=ftWM0vBvxlKMhxDLJzHKQPIU8XWe9hngAp9Yy50vSeOzT7iIM6l+cM/4KynOpT9tHi9Xeydni
 ltFoLCLrjRuCy+F7LB5nb4ph370lAHcz1ZagnKlNMiy77vds7lTxmuC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: r_KycRJmBbTfZCjz-6hugbL8wj1uBN1P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX366rbBSDnELh
 +d/2OPQcJQ9S7aHPmfTGPNtYRt95lsKzR4yTyZ0jMJEZv7fh55cBenKm9ikJPdmMCWvEPunpLui
 jshDZ0PvgE3gjz4FngJPFnQrVlLas4w=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa01569 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tE633ojKFf1lYKHj1RUA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: r_KycRJmBbTfZCjz-6hugbL8wj1uBN1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX81CFYO0OjIcn
 zpqgufz6IIlRDA0lDGpeDJeMFaOLZkhmY8VseTgEtZhPm2mSoPHhIO/vVWuu0nqkX5ZiBksP6Q9
 Zs2eHJS1KPwFhebvLBq4GadWZ+IVZbyvayuuqiGHbro26VPUVP+MkAWzUo/rzzNGKFEqnpEKMm+
 qXQlZVciYpE7vhBWfLDu6KHLmT/XsLtoKhDbw1GhxZQcp7CKLE9ZOSYuRF8UyRQ7H3NrhKczZtv
 LJNgAg06Mq5ewCfz+8W0wMtw8SYfrrp3p4VAymbuP/MsFOTsnFuh4ShKlPQvLeVuhqpKjgRHU0I
 QB2xINCt9Qm5QNemp0H+RFZD+HSafYM/PujguyRjOSQSDyd4SySi3QFVEBM37qrNHipysdx2MTy
 oxfvjFcouRQZq8pbqg4oXv1Dz/MmgOTFzrfbIqXo6UmJGG7Ej5JgCp5fUMZ1DRZ9Rhed0HfDPbI
 zUrqhK/h/Pc1wzTK7HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Remove VCO_DIV programming from qmp_v8_configure_dp_clocks() as it is
not required for the v8 PHY.

Add per-link-rate auxless setup/silence cycle and LFPS period values
instead of using fixed constants:
  RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
  HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
  HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
  HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55

Add per-lane drive level lookup from the ln_drv_lvl tables based on
the maximum voltage swing and pre-emphasis levels across all active
lanes, replacing the hardcoded 0x1f value.

Remove the duplicate LFPS_PERIOD write that was present after the
AUXLESS_CFG1 programming.

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 45 ++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 79006469f3d4..a07ad858b0d3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3868,48 +3868,67 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 phy_vco_div;
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
-		phy_vco_div = 0x4;
 		pixel_freq = 1620000000UL / 2;
+		auxless_setup = 0x03;
+		auxless_silence = 0x06;
+		lfps_period = 0x00;
 		break;
 	case 2700:
-		phy_vco_div = 0x2;
 		pixel_freq = 2700000000UL / 2;
+		auxless_setup = 0x04;
+		auxless_silence = 0x08;
+		lfps_period = 0x11;
 		break;
 	case 5400:
-		phy_vco_div = 0x4;
 		pixel_freq = 5400000000UL / 4;
+		auxless_setup = 0x09;
+		auxless_silence = 0x11;
+		lfps_period = 0x33;
 		break;
 	case 8100:
-		phy_vco_div = 0x3;
 		pixel_freq = 8100000000UL / 6;
+		auxless_setup = 0x0f;
+		auxless_silence = 0x1a;
+		lfps_period = 0x55;
 		break;
 	default:
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
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


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575173C1D6A
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257227; cv=none; b=tVufV7O8HOpO0nIZsgawN+YJO82n94df4Amd8qbM5+7Pm2G8h1sN2jRv/6iUxs1iE2BeyvzDfEGFQjTtXHwHDtI938KRnJivTIqr5Jv+Qe0HfbDXspe0aNHu3Abb1e44dHxrpCpRKHerc3OcG93e/Oc8oNivSICeoGnD95Iz5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257227; c=relaxed/simple;
	bh=t5DPdnAbypcQAjMqFD6co83PK04l2GGNiqBv+aUgBB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWXwwYVrhPKdaz4sagZBscAzb22+jGLzPOCpFcvoNaIpPNWSbWRulLhiNeCrKprmRmmnPU5/nt233LdadOZjDO/1a5SRvoiDr5xX2yoM1aCnWt9XnxuBpfNcTme+yBM6VnSG+OgpKjFf3pW3jyu8Oy6dyrIs8k3xxmRX1oX95/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFJupiN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWtAtXT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFJupiN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWtAtXT2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA17P2534139
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltqFaMmSgGnES/P6zbjb05rmIORWfXOfi3iRRLOhfQk=; b=IFJupiN5UX5AN5Vz
	ULbbTgAghnGlEGk/S73+4qkZ/RF9XX57HQqAkqgwfe2A8eIpZ8hyt8SWYB1sRZZH
	6+n8Rxm3zlm8bLYyOOlhTXAweVvMDnKgD0wu6ozRpiUpzWJSHs2EmWkr3Zbs92IS
	1idS9oNNY2o181jsh0Ue543Rxi3YHKhvm7+92Rj7T67EB6gs+HqhsEODoFOwqAx5
	zGuPAewtwr/G3Jno0BtyZ0K3/FaACVoDFgF6NBYiRCp6EoNTbNGnlT+PGgrs5Uqv
	J20RG1pcBckV8V/arKeMw9u2woWMXlkor56lqTNi7f7AU1YvE98grFQzkCoxwni+
	LNQ/pA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys1j98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a04491c56so1044885eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257225; x=1792862025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltqFaMmSgGnES/P6zbjb05rmIORWfXOfi3iRRLOhfQk=;
        b=SWtAtXT2K8HAgZox9pmU16zWJQ6oAmqLM8OAZ4HsQySzmqFOFPSNsgziu7nyCqZ1kc
         UjqhilWZfVUg9mWmwn9UJn1OITyUha+zgP2DgLvvb5XktFyXj4opkDbqwzjfhdQBXc3J
         O8MEXudpCKLWoZkfcArLodGWbLfru3756jp1vyh0pSETnmhJkPqxB3gdbQHlJkZY5t6M
         26wE4JccTm2ghgDi+7yMSZ3SZeiUMpLRfT1/AYgvWAcYHHtMcsSzyWfknAiPXgWxjwyb
         +KWeOUkTHnFdBql2rIwPfP1QnrB3sIKze+rHI6Z3a+Dq2xpo985R54iy4mGtiLqDOF+f
         P6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257225; x=1792862025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltqFaMmSgGnES/P6zbjb05rmIORWfXOfi3iRRLOhfQk=;
        b=Tzb+HlnUTJrBceD0F/dxJhICGbnMitHbljPyd79qkfpOHtGIzL8/ldutT+yAvX0WDq
         +YyOgI5A+X1dRdC+M5pGvf0ReqhKMAvfflteGhidVtRtIFHimLQ025U3cD/OBXQRj4GD
         dZ0nCFgsfUSNgBug4W/rdkVQdWRFiqM3/KiNsJ0kq29VuEfa1sxxq0LW5pq+o13uQ4g1
         Ne6SlBwOUa26winKKiTdDGvX2Z999LheVIkGIH4DatKUlGt67pPsuQcE7iaKKGgU64vj
         MUVD0uK/n2mM8xwAp11f/bd6+Nerv37ROWANmOM7LEIdXxCZ/GbjXib6UeEF+gESK694
         H+lg==
X-Forwarded-Encrypted: i=1; AKwUvBx0fv/BiSAmwLD9QzB1iCsa23eFqL4wEdvBHHBJGjMpQAuqqo1Ax3tjwGxkKZPp8LDGesJZUUdNGp/kJeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvL+IF1Vy19hDf5AZxEdSTiwMkSg4FdmxE+3Gu8VGvBCL0ddk5
	hiPhJ60MZy0g3Cj27c0YzitSGRD9jjEygS+VKadN/n/ajVyVslEV9DH1VVVPt7nu/exd42Gz9Xv
	KYBDgGYvHmmz4vu9Y2dw2wVqWE2YAORbpZLwn2Cs+hFw1v4Fq4FyDaFHQzHoXxfxPjK9TUOn2gk
	E=
X-Gm-Gg: AYBFou0+lG89tCFptxWp+v1oVgjPywzGMm+ykqc7kP5jp34D3xM8RPoYr4eNjMij3iQ
	f5EqaDTgusSaA82FqG0a7YEiwdy4lBDvATo4P7qneKp67aZSdwynOAQsIJCoTZrnCuMm69jt1XU
	XQo6ody0eUMfwGQt20FdqvTthb4P4ow4KXDMxuXR+oXsDmBqcnjtsAe9HJWx0FoyNmZapum0lNB
	oFt/Yo0ElhV0EPJQsw5H45dau0+8husTppFIwUGNYFbCzDsYfFxbtFQ5u01gri3BG9ZHEOf0ZFL
	SNGOs5ZwvSxNpUpyiOB4qHQpO1bXe2WqIXu7Sw77uQ+62+DG3XKEG6El0CETSdEpkzD0ABlypBP
	RAuPXlrvpc9YRIevjyi1KM88lRppsFA==
X-Received: by 2002:a05:7301:e118:b0:359:27e6:b684 with SMTP id 5a478bee46e88-3602a77a5a5mr7756374eec.3.1792257224685;
        Sat, 17 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a05:7301:e118:b0:359:27e6:b684 with SMTP id 5a478bee46e88-3602a77a5a5mr7756334eec.3.1792257224088;
        Sat, 17 Oct 2026 10:13:44 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:43 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:11 +0530
Subject: [PATCH RFC 4/6] phy: qcom: mipi-csi2: Accept C-PHY mode and add
 register sequence
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-4-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=8080;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=t5DPdnAbypcQAjMqFD6co83PK04l2GGNiqBv+aUgBB4=;
 b=Cp9KUFG394o50sMYclla6LL9qyLfiMX+FoovLyNX3oqrXSEQfmVTJp4CaSwdsMGLpxqGJoZ54
 shWjhupgJb5Cgcv01WYOJrppqM+7CUp4/Wc9yYcLHNDPMTJWtSJa9/5
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfXzDSI6TQxUJ6/
 kO6xaxNZpTpCL1seJ5Q7N2SKYKxNXMJTiaFKVZcZZRjOK/DXmFaIrCiVpZIPK+LD9jXuQ3s0RF2
 SqWsWKtNucmPVJgDq9uYSgaajDeQq1Sx0xXUVc262wgEBduRLHncFh1jf08eZ/a78Yz18RfRcrL
 7eKrcqnaNUHX+Vd/WapeaZDbG9VJckqluWjW/NB96XuQkAegw5NVjlCwJszTzkqODtjqgpyVEHY
 FuPKUkRjxaQ2UAwUSmoG48IUsCA17MJ/man6riZDKTfXLbhm72mIa6vbCpQPO92YJhGrvBDhFFu
 BOL/De2OreXzQkuw0tI/aVG3TCsM0VXoxSSm9Mqrn+WeLZLhywiDedmlwBFD1ngJz4mJxP2BM5h
 Yvi1MtAFJJhJn+e36CsY0nTGA8KPWPMDqFm4owU/aZVq6HrRMm5FoWf79dCZsx0SUfmdt7jtCL1
 tKTjKP9JdDbASMg/DhQ==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad3acc9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nWSibxTITU1ETIuES98A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 5Mk8aK5631PTJlSXa02WGylnjEq0_QiD
X-Proofpoint-GUID: 5Mk8aK5631PTJlSXa02WGylnjEq0_QiD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX1s1s2sgxNAVh
 /+TG7ucIZrsQyuGg40IHlf85fVTJaSvfuS9ygjOgYPT4MGpKyEphEkoOMLXK/hjoxysg0Vt8GTS
 upWISFDVlSRMmms8erNkSAKFbz9jXYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170068

The CSI-2 PHY core rejects all modes except D-PHY, so CAMSS cannot pass
C-PHY stream configuration to the PHY provider. Accept PHY_MODE_MIPI_CPHY
in set_mode() and configure(). Validate the trio count and store the C-PHY
link frequency and timing in the stream configuration.

C-PHY programming needs a common base sequence and a data-rate specific
sequence, while D-PHY keeps using its existing sequence. Add
mipi_csi2phy_cphy_rate_settings descriptor and select the register
sequence from the configured PHY mode. Leave SoC-specific C-PHY register
data to separate patches.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 51 +++++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 51 ++++++++++++++++------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 17 ++++++++
 3 files changed, 96 insertions(+), 23 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 79c7fa57d059b29f2f72a0c1208e07115b3fb049..30f7f39ba855a0a2921189050f0084dead207fbd 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -266,14 +266,48 @@ static void phy_qcom_mipi_csi2_write_regs(struct mipi_csi2phy_device *csi2phy,
 	}
 }
 
-static void
+static int
 phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 				     u8 settle_cnt)
 {
 	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+	u64 bit_rate;
+	int i;
+
+	switch (csi2phy->phy_mode) {
+	case PHY_MODE_MIPI_CPHY:
+		if (!regs->cphy || !regs->num_cphy)
+			return -EINVAL;
+
+		/*
+		 * link_freq = symbol_rate / 2; convert to effective bit rate
+		 * (bits/s) for comparison against the bandwidth table:
+		 * bit_rate = link_freq * 2 * 16 / 7 = link_freq * 32 / 7
+		 */
+		bit_rate = div_u64((u64)csi2phy->stream_cfg.link_freq * 32, 7);
+
+		for (i = 0; i < regs->num_cphy; i++) {
+			if (regs->cphy[i].bandwidth >= bit_rate)
+				break;
+		}
+
+		if (i == regs->num_cphy)
+			i = regs->num_cphy - 1;
+
+		phy_qcom_mipi_csi2_write_regs(csi2phy, regs->cphy[i].cphy_init_seq,
+						 regs->cphy[i].num_regs,
+						 settle_cnt);
+		break;
+	case PHY_MODE_MIPI_DPHY:
+		phy_qcom_mipi_csi2_write_regs(csi2phy, regs->dphy->dphy_init_seq,
+						 regs->dphy->num_regs,
+						 settle_cnt);
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	phy_qcom_mipi_csi2_write_regs(csi2phy, regs->dphy->dphy_init_seq,
-					 regs->dphy->num_regs, settle_cnt);
+	return 0;
 }
 
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
@@ -283,12 +317,7 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
 	u8 settle_cnt;
 	u8 val;
-	int i;
-
-	if (cfg->link_freq <= 0)
-		return -EINVAL;
-
-	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
+	int i, ret;
 	if (!settle_cnt)
 		return -ENODEV;
 
@@ -329,7 +358,9 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 0));
 
-	phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
+	ret = phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
+	if (ret)
+		return ret;
 
 	/* IRQ_MASK registers - disable all interrupts */
 	for (i = CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0c87f6c18b35e625f5ba1769c94e7..56b8830d69ee34280119d8b813ede643252e3606 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -100,23 +100,46 @@ static int phy_qcom_mipi_csi2_configure(struct phy *phy,
 					union phy_configure_opts *opts)
 {
 	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
-	struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
 	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
-	int ret;
+	int ret = 0;
 
-	ret = phy_mipi_dphy_config_validate(dphy_cfg);
-	if (ret)
-		return ret;
+	if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY) {
+		struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
 
-	if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
-		return -EINVAL;
+		ret = phy_mipi_dphy_config_validate(dphy_cfg);
+		if (ret)
+			return ret;
 
-	if (dphy_cfg->lanes != stream_cfg->num_data_lanes)
-		return -EINVAL;
+		if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
+			return -EINVAL;
 
-	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
+		if (dphy_cfg->lanes != stream_cfg->num_data_lanes)
+			return -EINVAL;
 
-	return 0;
+		stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
+		stream_cfg->num_data_lanes = dphy_cfg->lanes;
+	} else if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY) {
+		struct phy_configure_opts_mipi_cphy *cphy_cfg = &opts->mipi_cphy;
+
+		if (cphy_cfg->trios < 1 || cphy_cfg->trios > CSI2_MAX_DATA_TRIOS)
+			return -EINVAL;
+
+		if (!cphy_cfg->t_prepare_ns || !cphy_cfg->t_preamble_ns) {
+			dev_err(csi2phy->dev,
+				"Invalid C-PHY timing: t_prepare_ns=%u t_preamble_ns=%u\n",
+				cphy_cfg->t_prepare_ns, cphy_cfg->t_preamble_ns);
+			return -EINVAL;
+		}
+
+		stream_cfg->link_freq = cphy_cfg->symbol_rate / 2;
+		stream_cfg->num_data_lanes = cphy_cfg->trios;
+		stream_cfg->t_prepare_ns = cphy_cfg->t_prepare_ns;
+		stream_cfg->t_preamble_ns = cphy_cfg->t_preamble_ns;
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
 }
 
 static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
@@ -124,7 +147,8 @@ static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
 {
 	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
 
-	if (mode != PHY_MODE_MIPI_DPHY)
+	if (mode != PHY_MODE_MIPI_DPHY &&
+	    mode != PHY_MODE_MIPI_CPHY)
 		return -EOPNOTSUPP;
 
 	csi2phy->phy_mode = mode;
@@ -278,7 +302,8 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
 	bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
 	fwnode_property_read_u32(ep, "bus-type", &bus_type);
 
-	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
+	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY &&
+	    bus_type != MEDIA_BUS_TYPE_CSI2_CPHY) {
 		ret = -EOPNOTSUPP;
 		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
 		goto out_put;
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 528e80109c2f96b8c66d989ac834e30e7b38c732..31103546e4874ffd519fe7f386d779f17325cb30 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 
 #define CSI2_MAX_DATA_LANES	4
+#define CSI2_MAX_DATA_TRIOS	3
 #define CSI2_DEFAULT_CLK_LANE	7
 
 struct mipi_csi2phy_lane {
@@ -26,6 +27,8 @@ struct mipi_csi2phy_lanes_cfg {
 struct mipi_csi2phy_stream_cfg {
 	s64 link_freq;
 	u8 num_data_lanes;
+	u32 t_prepare_ns;
+	u32 t_preamble_ns;
 	struct mipi_csi2phy_lanes_cfg lane_cfg;
 };
 
@@ -52,8 +55,22 @@ struct mipi_csi2phy_dphy_rate_settings {
 	unsigned int num_regs;
 };
 
+struct mipi_csi2phy_cphy_rate_settings {
+	/**
+	 * @bandwidth: Maximum effective data rate for this register sequence,
+	 * in bits/s (= symbol_rate * 16 / 7). The first entry whose bandwidth
+	 * is >= the configured link bit rate is selected; the last entry is
+	 * a fallback.
+	 */
+	u64 bandwidth;
+	const struct mipi_csi2phy_lane_regs *cphy_init_seq;
+	unsigned int num_regs;
+};
+
 struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_dphy_rate_settings *dphy;
+	const struct mipi_csi2phy_cphy_rate_settings *cphy;
+	unsigned int num_cphy;
 	const u32 common_regs_offset;
 };
 

-- 
2.34.1


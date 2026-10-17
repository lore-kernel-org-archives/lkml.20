Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1153C0633
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257222; cv=none; b=iZLEXswUOa0Z1cRdbkQM4TKuQpqjAqxd93B4VzjJMYWVtYIYoKdSUE+OANXdfP3jVJw1kfBaCLbSGna3A+M4cygKSEcLfkc3WwVveUZuLbUjJO4wVwYC74r/1OLLQA/y5J60/2QwzJFDRaG7hm0dWQHe248tIKZL9mQRBOGnl/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257222; c=relaxed/simple;
	bh=EI0RYsZ3yOnKefVjSeOVmfm/PmjAgR2/wT5sSGJujcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1SsLpFhTWiOCm1u9O2Trp9/i6Wkyg/1FTeJ4+ebTBJOwpZy1P1F7KISkwX8kjP3TX54uj4e9yY+E7A0GlX8TekqIWARZnlhJid9TEI7+n+MY4rG9rsrB4EzY6Jxp7OTe1SuS7D5/qVk8Fui9KQDvU5VCxZj4Pki7mpEtfAEaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN7Ou5H7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMgdw1aU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN7Ou5H7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMgdw1aU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA0VV940548
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=; b=EN7Ou5H7e9t8ssm6
	o0/BfNMfdK1jZXxwwLsBRLiPkhqegbihae1z31SMXRARi2ginadODJZuM8ZZ07zg
	gHw7Eip5eK72CoFCVJPpYodvCnL9x3v9jfV1hrTl88C4UZvUYcI56l5S4xzKqOme
	zKE48Dbh8FDGdeGOSRbUk/6oK4YGOB92ugbyWTvUAgVLXuxZqTjE9HBjyC4XD1Gp
	itJMgHvC3+2tWMvdo04N/FuR5ohOPFqQUQl4UuxvvQf59C3PL6C0dxrQIYglsNBF
	OkPB8Ej2uEUK+3vPzbaB3aKzSU5EvjSAcmH+bcV4s3uiGIt5JwNJLNmrcRsQTji+
	9KyZxg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se1b1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so145889eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257220; x=1792862020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=;
        b=DMgdw1aUbM9C8kHTej6st2m0kaxesuXJGbH+oRyjEfLSN4pFAszQrp00W095w2HBPb
         wj/zQCL+7x/vgcEq5/p0up3h30q9o4EAS5VTxZA4N/SuoeVSAVyXK5UH6om2zVxT18n9
         xVy3GviK2r4ZmkXveKeUx0NGKwG9lqfwpHW80fYWRT2OVk1W1mkKBs7Kf8OBqtDb7yY5
         PJC0+dngZD+f4WU3YskumOuN+4piwF9E3NxRrb4d8xVQjAWr0yPWFInSUd/U5407Xe63
         25eanvK3GyBG6WG3XGruJlkDiD3L9sciTT/Tj0r5b3BkxwkUrGyjcOGl27scpSLjpnxU
         pcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257220; x=1792862020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBP5FDgUuNI+IeQ3fpaNQaTXKxFW4xAkNLJmRGA+1TA=;
        b=iOwm9xefVlO+Z6wEKxWM2180jYKfh89WQ9Ms+8HDre0NcTCjecbaYpcRQvycMRMajM
         grb3H15sDZf8D80wec+HEW1Mjh6M2ImUMpDu9SUujl4nYmHqChM2F9TWA61jH8DceJUd
         9XSDXHQfoX66ttY94YcZNJwJxNuat0GiED4sVC6antLGC2fPqGguoyeb2AGMCZz9Olvd
         a1g4hZqHx/G6wIa4JpDzFxpssp0E4TaZXGYMLkWGUkUYTBNTZpsdgitDW8gvPHkDMG/k
         hFZDIYP3jQtZabk9uMrs7XPbxVSuXgBfzVSyvUQpf8MoQW1BC5lpWkqXvFlCvTFvLNRZ
         3/Yw==
X-Forwarded-Encrypted: i=1; AKwUvByWAaO6MQReo8H130KUehFBkbA6lNjQUiwTxgKU8jtXnEs6lgmymRsOdgypkdF1cLoBSow3m5HdvXYUVMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT/p/D3LXYLMLHsr8mnjmgFVymqKUbY9Njqii4gFGjr6TDul8O
	oASBacZTwpnskDXxzp3AlcFkUpm2lfhDGX8V+OIXPMPlkaeNcqJiyPVCipVuBn/DezUf+/1won2
	npZ4rNTpphUWhwxgg4L+/AvMQ5JEpDf3anFM0XzaZpVxCB1NL1y3diZSkxo0wLuhRcHVnaMGEqP
	Y=
X-Gm-Gg: AYBFou1xuPPsCNeXFWqmOEeeMJyOueIeU3/ap+PPYMJpE06omnjZis7ln0p5iVi7rDZ
	dudbQOuAXySno40tZSnLkvFj2/Iv6OVBrdPVGML1ZUtZgCskH1ILeBvz0JPq0QKFGJ94ep4nz9v
	3PnKj4O9chL8Lwlnqts/tdqvT6tv0uNi7W3+KZ4tKXhkPWh4nV89uYPa2LuYPBEm4fo1ROwXrrZ
	a1UV+gk+Q56R8GbFED1pXgXLVmpgx6sICPl0htsWvJGDOtc9ClKJRpZdobkOcY0Fer/xUgo3Igu
	7pManbznXmG4Seg9sNOKzd6W3EWsbmSScVXZ6IFUyNJZOOLrwPpIudmQjxX3jGsjiMireI8MUR6
	Yb2saJ65QgGaYX3j7iGpjsPcYLM5kqQ==
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr6210302eec.37.1792257219606;
        Sat, 17 Oct 2026 10:13:39 -0700 (PDT)
X-Received: by 2002:a05:7300:d10:b0:35a:84cc:d941 with SMTP id 5a478bee46e88-361a341c8e6mr6210263eec.37.1792257219047;
        Sat, 17 Oct 2026 10:13:39 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:10 +0530
Subject: [PATCH RFC 3/6] phy: qcom: mipi-csi2: Split D-PHY register
 settings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-3-8b0e1237ce95@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=3558;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=EI0RYsZ3yOnKefVjSeOVmfm/PmjAgR2/wT5sSGJujcs=;
 b=fpg9uAqqItJW+uBq5bvinDXTzTn5xxS1LHLyIQ57YiIFj/XQiVowd/9ok6xaPAzKa3epF5U3w
 Cjs4AePzRX5BaoAk/paWS290Fb9mDhkOoX6rAo5sg8DVHBHVjHcmABr
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: qEzaxFBeVtgT2E6h5W4PwS0BE5IGtvpm
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad3acc4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sk60x3sEPLDaefoj9B8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qEzaxFBeVtgT2E6h5W4PwS0BE5IGtvpm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfXz5zzbcyDetyi
 TEeaBn5fLkd9JgJd/M93u7mlbtGfKwvwJknBcNQY7w1ShIM+H0i4Tns66hGQhMwawYs9LvMS/NI
 jNfaBxB6xKXXMNtDvtqBitBMavsABcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX7dX8BoxYq4yS
 tEidXJcmIwVA5Fws292pQ9htMkQUMwSfRtK+iV7ntYUrHJA2hrcdQNO8GV3P70ljxaf8vj8VxHm
 rSyDzlmDk8MBx5jQF9NQDQTdQwjwO/ZXqE9AZRmNxDw/y3+HnQUfwSph1ICVWXRKf87LKHFfG4y
 PBrzOmrYm3zTMhGmga3AuUabeSu/TFK4Da8ufZH+L1IBF2u1ecmvcwZU1UMdHnar6HSStO80iGb
 2Knyx2EKuIkMG9BA/PGDu7KQhcetJQWVoQCkzduHsuaNewHoz6tdzQx7wTZHI13DpNAplnvbi0c
 ds+wDtlEETHEXiMwDJE7/+C+VVoSeGbZisWmLrubl0/ZGWktb8knIG74uyOFuMxUwZF4G+tzb3C
 PxR26weoqWSdl9mTIxAF9Q4VOAIyEkrmnM9j5Qupz7eSTe5qEYpg/h6NpdzGRJ1AeRgtfIRuyZH
 sv2VEAOysWZATuor92g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170068

The register sequence storage is tied to a single init table. C-PHY
support needs separate D-PHY and C-PHY sequence selection without
changing the existing D-PHY programming.

Wrap the existing D-PHY table in a D-PHY settings structure and route
lane programming through a common register write helper.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 28 +++++++++++++++-------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  8 +++++--
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b21e1a235b8397c4c84b25d869427..79c7fa57d059b29f2f72a0c1208e07115b3fb049 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -241,14 +241,12 @@ static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 	return settle_cnt;
 }
 
-static void
-phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
-				     u8 settle_cnt)
+static void phy_qcom_mipi_csi2_write_regs(struct mipi_csi2phy_device *csi2phy,
+					  const struct mipi_csi2phy_lane_regs *r,
+					  unsigned int array_size, u8 settle_cnt)
 {
-	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
-	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
-	int i, array_size = regs->lane_array_size;
 	u32 val;
+	int i;
 
 	for (i = 0; i < array_size; i++, r++) {
 		switch (r->param_type) {
@@ -268,6 +266,16 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 	}
 }
 
+static void
+phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
+				     u8 settle_cnt)
+{
+	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
+
+	phy_qcom_mipi_csi2_write_regs(csi2phy, regs->dphy->dphy_init_seq,
+					 regs->dphy->num_regs, settle_cnt);
+}
+
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 					   struct mipi_csi2phy_stream_cfg *cfg)
 {
@@ -369,11 +377,15 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
+static const struct mipi_csi2phy_dphy_rate_settings x1e80100_dphy_settings = {
+	.dphy_init_seq = lane_regs_x1e80100,
+	.num_regs = ARRAY_SIZE(lane_regs_x1e80100),
+};
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
-		.init_seq = lane_regs_x1e80100,
-		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.dphy = &x1e80100_dphy_settings,
 		.common_regs_offset = 0x1000,
 	},
 	.supply_names = (const char **)x1e_supplies,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae00737047f2d0384728a9c98780851eec05..528e80109c2f96b8c66d989ac834e30e7b38c732 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -47,9 +47,13 @@ struct mipi_csi2phy_lane_regs {
 	const u32 param_type;
 };
 
+struct mipi_csi2phy_dphy_rate_settings {
+	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
+	unsigned int num_regs;
+};
+
 struct mipi_csi2phy_device_regs {
-	const struct mipi_csi2phy_lane_regs *init_seq;
-	const int lane_array_size;
+	const struct mipi_csi2phy_dphy_rate_settings *dphy;
 	const u32 common_regs_offset;
 };
 

-- 
2.34.1


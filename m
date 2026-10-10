Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D745F4582E8
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648088; cv=none; b=uUwP16s30Wd2Y8u0prvm7hkjTAIEskzveWYJB6OvdbkcpkEU+ec7i0SqPddjvOqe1JalpkE+9/loevrNvgtzpxjDP+La+nrjtojD9QV1YDVglLFUiLmjYUwSzx33l0Q7h/09L7uvCIEuhB3cCqNxVN4XxWxSYNkaKMTzsyCDpyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648088; c=relaxed/simple;
	bh=ZHkg5zM+lJIOFrCLJ/Suoj+HX48bpaqLr1WZJ5FQ+VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RazUxpesoMJBW7sk93esOTDNo34P294OESDbNtc+xMDdLCX9eOnL4MCDko2+3pb7DoQogpE4q4oAwtl8Crqj0CQN39Mwp+59hdkFBUOjmpH5ztDC2WcZph5N+lq/y+J23zWBndT9l+w5+ZQOJgS8vD2ElHAj5KOhW+sZlcX32ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoEPxQSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUAU1kT/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoEPxQSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUAU1kT/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFQYoo1374088
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=XoEPxQSOXzlZt8AX
	bMjFxRlBzJIsWvtrk4FAEGUr0BXAoxNVSLJaLI+V61pulY+s3WkQjU4+0wobLa6Y
	3bd+/6PGJms1vWYM92ck37fCgU4oORi1H3cIrrJO0pieC+SwMY9VeP58YQMkNHVM
	Au5t+9OWyveLcjImUTX2+/Y6rCHTr7bcD1JWIpM75VELbIsxY+xyIDIuiMWN1SMY
	qGHFfMGaMR5/EcPRUBzJpAv7xcjK2BK+oEZAzaRlOMDZhueVSkqmzsfNQcN37sGG
	5F7P/+XTesN1Vt0FVY8GDT7THpPeHnfja3wbZS5ll399n+1tU1qdWBm7Pu1cF5S1
	0XdwYQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc69fy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:01:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-358856e5105so2686973eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648085; x=1792252885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=dUAU1kT/T3gdXaMsQwwQ4M6JPxzQwUrBmPKuOTCS+TRmWIJcGeb9JAiJ4RPRPpmmuH
         Wt/qK0uO+8O+0ecO2csv87BDcaI0tN4Fg2ZJIjZ1DBxbJSEGmlzE7LtWAELckOxa1Cyg
         GhuZYNykV+dB4V8VcDRxB3B0P2zNivKQsb0dZgch/PPrKZTGoBEHlkIZmjd9C3WPreRq
         moZpGM3Zq6mpx2mN0dOi1gioE9Vi23GEosYyru1SZyoU5+Fb/ar8jLZ901lSiqM/EAEQ
         UJNpo7oUVqNrS4D6C/ebhHKD6g5Dxt4KRJdd/ZlQ637+MJUUK0OHT9pQAeJNDQzFj/a8
         efOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648085; x=1792252885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=TS0jr46ry/r+McBt/9VZE+NBLh1dV2ZKyxWh+jhyzC5WRlh4UwcZndK/mDd4PtzuWH
         FVcsjL3xASvRNrkyP7A38gqM18aZuygYpzLpwTCBa8fTihZUPvLqGp3fQDOEuLs6cif1
         w14FuhIyRILEGw+jKwO0wqiCVQEPQmAW0ZGbAgNRiYQoRh0LldoAgsBpNg/yw+OAMfAO
         wQGAEnNhfdxc9SxphEbTk0yfMrh39LVC4ukVFjSedNVCzUwvkQoQY1D8b5cQanSkVQzt
         rXt0r4BydA4D5WemQDWZ0/pbWOMr8dRmnjUHIew/y3z1velRl+Ga/VB0Vrlx9oso6Mca
         BAhg==
X-Forwarded-Encrypted: i=1; AKwUvBxOs+PrHFYYivz4y/kDlnH99Fp/5VoCSOQoWn3EYd3v7CBbS5ssKH0t2XvdcA+DFKd5os0L4b85mR2BxWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYINeKJN5w6mh3E5ybxhkBJO5WGXhin7CtPWUtHy9Tm2/DXt5wyw
	e81jOdrTD8YKA3Etm9wLBMrCQasVf5gpymaLUJsbYtcuVzSV8KMJTxW+vuyLtBzzq6FAR3KF+Hs
	hUNt2CLH3dTmALsaMJz60yw3CGJI14TwNaZBTwzueWiKCPHXlG3mFltbXgG57WhsjhQ8=
X-Gm-Gg: AYBFou05hPK6AISOSuWndgXNAAFETq6HhlM8J9ofkl+TWtwQwq48wpE5ZI/XlZQq0Na
	WwP8dZcYFB7TwjpTlfataHN0r67x1cSQgz7Ls9IUoF4J/bpsOVrTGAWrZYVQqF4fGVZ7bDg8E3l
	UVYJ4XEBCK4AkxoTrZ9opxVFV0P3HySq6XLx1IgdGceeNbXntRGUx/JDiMPvgyC2KGj+7yoq0N8
	+HnenwEKqjOjrpoX5q0e+pqC8W1Prxl9Qu6573LX6qgTSxvnq4/yRK2EPfgZ7FudkpQDDrPdoqk
	j2ziYLSH0OuDvBJ420yMTIQr8Cjf2vebHq7RNoDidCvHmXthBllQJcfMa7UduvELGSkW3fb2xNv
	OQOXZ1rAPWdcfVXhsHRKJK+D4NylgV8GuoTU4oL30TAhaBJNXdiNGdsK74B1hZO7+bfopRMOOrl
	iltnfVGTqqyw==
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475637c88.10.1791648084199;
        Sat, 10 Oct 2026 09:01:24 -0700 (PDT)
X-Received: by 2002:a05:701b:4583:20b0:151:9af3:1beb with SMTP id a92af1059eb24-16a5dee12e2mr6475573c88.10.1791648083488;
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:08 -0700
Subject: [PATCH v20 03/13] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-3-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: GlNJ95tEKTNIyWRhOZyBys4CPxnMp75k
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6aca6155 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX30uncb2Hexe2
 ke5yoZLQvTzqJQHZ469NOhzJsbXEg10pA/EeYGVzfnNDhqds95WQHGTissCJkOpq2AForrsdvfZ
 D22/SephlMsx7FYlZv1NjL8ppOKV4Dvb9qFlUA6d1/cDcV3f63i1eMjX+The9v2kjWcnjbbXo22
 oMLHdFZeqxTbtmiaG5MPILU79Sh8OraXQO8BJ6jLIezgzqTxgHMFrkK9RNOTkTXQ+HE0unn8vk6
 qVVXkdN4U5SvKc7Ayw75iUiE2tZsT0gr85FyUPo/rvagzSGXTwBpGv/bT4hsu+hs/XS40EBg6IC
 vUYH5RnTBItwpc4kJcgDQrqJdF8pSkBX0nPVD3P7RzUvXZbdE7+pgp58j6uURNjmkl8SY6hHn/4
 Ot+08oAUpLPGWGINpAuA7lb7eVtiP5gD7jYp/OP7PYYyYZpP+Mk0DwlGYah3yhKtEN/W6gYPU1M
 wOvUYLqEhvgT66uMIVA==
X-Proofpoint-ORIG-GUID: GlNJ95tEKTNIyWRhOZyBys4CPxnMp75k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX1UbL/JAaLALJ
 5D8/VwdikmScGK87RvrekJiKguguJbs6mcrFdHiYdSo3CAmqTIHUz/1r+m0YtZCmM1w3QHm7Rtg
 rYKelF9I8o10ju4BtLTgSDQeeD87onw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100063

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1


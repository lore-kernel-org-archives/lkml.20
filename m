Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616144;
	b=y2mnrDwvg3xdGhDyl1DnLqetTpeZ32Qe+2DHB4GIXIDqPT8m7hGARCliHy4cOYTjd8/W
	 YZPn8OpPDlXQlN49IgUJpbsop65ZJZWTognMmUCltI/p2wjKUZ9GucrEp4vYBPnmOC4WA
	 TPQTpQ5W0rMFLthU3kq80I8nFqOv5O2mg6YvQR5rjEtgXiwDH58U728A6E/f7LxIDFYKH
	 N5e0ZYK7RrYVfj3WKCJ1iwieZujdRI8Ye/nJw9YNKpZeal52UEcXU61NjY5kESrtBsmAP
	 Gb+TjgftwJXJLiR6xDVDdUzAetJDTTNwlT4UUZQi/Fuog7besjZLnfrwCTlRIOPGOnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
	b=vGlvxz94V0/uy7TyRxTBjv7eaqJ9I6ERz0sZCtTN0NElA7HXG4b5jF9TjNFqvzaT/XCY
	 5rN9K17manVnhfsUAyqh8W062jFc1CIlf4mjzFSG2tQMnU9nn2urRboRRu8BcoKFlV+kA
	 XUtPtmtaTLINpSsPe1i3EFMq9P6suXHoQPrQfSSRWYJbgx8MLr5bpPOeG3yLTdx9hiv6j
	 lWmSdHVEraUNzfQJb+DhOarVwBOXBUWiv7A/na3EZzJPewmkb40fT9yaOXNyfuQ6wKI6h
	 tkKVglS/vpCOJIRC1J/gGcUVwZlablmqh/8TjTdXPZHEEiR1Itk2XM26E9wjKuhyyZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA43E60A261D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA43E60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AO2c3086537
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=; b=pJUbaKvPrrcSeGWp
	Fpdcp3GwLwIwJTuFEuG9cwnvINisD9IPIgcsII4SdQyGFX9xf6HahdObMi4g6XWu
	wcZ5OvC1vRXtFTk4RRwKgz0qz1Ycdgs1RpNX1/UQse7ItspMfZJwog593Wee7XZX
	xn6gICP5YSKNdURe/zwvfw1Jg47C9rR8bBJ2ap2E5ij9s+aAskQu3tJp7yEUKeGu
	ssg0XeQi6Kd7aMddybhXfM0lAq1PO2JMvg6C9W6AJZmu6N3qh52lqccPTQehqD1g
	9X2Xlz3nmcWG9ofUdq/unY5FE+Enb/Kb5WmbCyqAuTnQQERt81mgY4MLQHbKtOeb
	7X7k+g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61d1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so4358854b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616142; x=1794220942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=iqGmYOtZXJo/+xupZeV8JrfLw973pMHZB6ERSEAK0C5ZZif2Zs4tFyoK7DHV4UX8NT
         Qocw7vt0Xpkc+tHNeWK5E/0VWiOsiv9O8cLH4GPxGc47nF6QX8GEOEs0byB5sksmYzoU
         AojvrRfXDqFb94lmYQDjPAwWS5ImsXLzhAB4gj+RUgk46g5NzSGFLJ0m4tajiihR0HNt
         jHm7y+DdlR2Sw78UMjjlxwHucZMoEErpaky8HThBa0F89b1va4A4RteKhpmC0v28+93D
         VkmB69g4DsU5IEenJP1GDtjaCmu9hTl51/KECaMCVeNYUSbBp5lIKn8F6EVF2UktSq8O
         RRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616142; x=1794220942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=kUtmixawBsSVGq2ocwJ+rH3aGaUguTWW6pQOUg6LJftqSNQhrJH7cVNESVmgyFzZbP
         OSMUkojK8geLEsNoTyAftspEh4OFhzc2txd9rjSMDJJ7MlD3ZB1uNkebnCE/llwa1A7l
         3jS0mvPk3ak5rKi+LRbrq5I6DKjbHBM3PdR0T2fFIXZIo5ZARZJdlxlnAAFdth89qLa3
         NGHReqwgeIe6oljX6spIa7tzlUZkfyhSD5hTM3Q4K3FwrELc4KlQTkOaWmITjprIaeyi
         N34rIVLIGwuJO/QzDTcIthRoUydaIDnyfQNkzXVU07XZhy8W5fruXwxgWMXWJRC/thpo
         vmsg==
X-Forwarded-Encrypted: i=1; AKwUvByhWRkyfyla+5Cr2U811kVAqqIYBcwOAekM1PzSH6lS7e8LvpZ3aPcwJIDLHP0OzIy129ezyYPcnsv3gEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDN+b+KxWDPTBYRtCRLz37TpsKo5gAm317Xo4yFXpqoAzYT6va
	lJxQIiRUkZJeETrahaIKhr+tseWdjV376a5fIzWAvxO6bIB59zrnUKfimOgQT/S7+Mwd1b7KagF
	TXXkZXdSvX2rLchZ6PMZCODqBvz2pCFdcfALiXzVuIqDS6T+8QRjvZ/+Bq0bENBKn0iM=
X-Gm-Gg: AYBFou2nRzF0w7SQTFI/WXDh+AwIc9yrh0U776uyjDYx2NFvzFu1hK31WvFy+4MlOJv
	tx7rLgin7oTtVqlCaz94zOVvGSbakFN+fpYEPLKNTnlThfCYZy5OoWDFw/k+zWDtCZHRQf0dBt+
	uUnLELwLqfOwMY9wqVll38meqE5b+RN3ugGDnmWncPEJyf8NHa1dsGfsY/cX0wXIB4uhZv2VuuP
	KgeKjW8ISNJuZGy44Q84/9u3Qx6528X2f/NJCfb4ZubXZPDgb3kN/BRlixdNWgFNci1Ma/cf+7+
	0s8P4tpxDy5uS8XDTgVxqDp4Kes+1bMQz3Wz9P2izvq3AHy8FiEucTVlezIMJfVEVq1rUCfWkZz
	5iIMfCStfVEoecwKw8x71tLUpNg9AjVd2GBQXOwhJlcSHaO8m8AQWCybqCL+nxB3vCbGQIxyGXU
	vfj24HiULlScWfWSdotARVw/WNTg/eY0zO2oHarbMBTXEHRYjhmOl2GURaejA=
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861954b6e.58.1793616142074;
        Mon, 02 Nov 2026 02:42:22 -0800 (PST)
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861941b6e.58.1793616141658;
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:11 -0800
Subject: [PATCH v24 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-3-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: UCc5Ld0v6gXWMtlg0DHe05jlMDypGeWI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwaz1lqWubvf2
 C+fBmzOGZUByCp2tnRbvGlhopNND0ViEaaXLy+GOKHDNZwX+1zqITR2qY71lFYZpo1em5la+2Vp
 2/44L+dI1GUyNY3lnbPXhuAkWG2beKE=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8690e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwhvr4V/c51gX
 kBpPa2MxG/EZb8yWCHk/QmyyjzGiO/KxlRUjpHfz5usXeoWXmtMa+QjHr3cW95biHp0QLjj+TRA
 ++fILK/D/Q6feRfViLxhhGQIccYiQyuvUYfiyJPHYBN3sH6L1PBFF4yR1/zYfTJT+JuXhTqknUu
 lWce2jAcfYp5odhrf4iebgytzYCrRFIhyiaKI+9Y0EpCw6Uc119mRNSJNInHEWXgdYnhMS1UiUp
 /k76vVvzasLXq35a3WHuXVXW55P0dKqhFRvsCOEaCJS1Okdlpm3ASmJsY0LrIzJagrYrBiAGtCw
 Mi+Z/kCbVcYah2mlA7N0ihpAxQbmk6cAhnAcxVsKQe5Gszn5itAPtnleQkeHRDiYDivnBcsG7qf
 ea7yMG4mnO9jeDGAyWSTCcxzLQSOxY3BGyVFQfH2/oFV8Kc8ejNzkdkilvr4s3+a/OdN5nEQqey
 H3cNlgIUVV8tqezFdSg==
X-Proofpoint-GUID: UCc5Ld0v6gXWMtlg0DHe05jlMDypGeWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020042

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..ed40934d67ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -374,6 +374,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
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
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..941f8b920b1d 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..832c8d048b77 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1


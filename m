Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200870;
	b=KAGhfphtlGCmNNngBAuixoZymNdvOKOduzjy6CIW9rr13ZhVcaYKiTojKBeX9UCZyjOw
	 1oD8fVUlDzbj7sowR6cxjSnKWVYqaerqPh9lpBb57iKS/LJ0aZ3XcPBGniLmdBKFDgD23
	 e51dWRUU4bevEmZfgkmEBRKM+LC42aAoAENVpd6kURZlQuIPk3fq+opugLB3UPaCto3nP
	 hGXC6euT1MCo5PFn2CWxiyijAnHYZf6taVB/yUlSiwrVsAT95jW4PxvenfOPd8D9lZkVq
	 pUkp4zwKQGBaFkWQMaRCSnu/StIA0HMRilrBeMEexjDzzsTIdsGKGFddGF8KBdTjExQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
	b=ir0L92/kt/YPLej2VhpdKmmZCjDQmJuUGy1A0pWWX7LSFfWbG0ZCS0eSp0KFnv0r51Pr
	 JaCDuhGKr77ZxmaSt831ifaDaK61+u76lUufJonF7syoTfkO3A4emGGATA6Rz3xDtDrHO
	 gH+W6ZXbMGq/38unrouEvRkvofre+ZvWYIrnwkPBnV4XTp/U/viGuy+T3gCCTlA42Fd1W
	 c4amn7S94lfXTOaFi0gnI03JK7BBeJkZOHtQ4gh4jA/XUNDeQjtl7xBmeEKTpFOklOJdp
	 A9kmLx93gtO0mxTRJf4OmjPesW1GUbl+FmhAO8BZiuZFMjMWzyZvPUcm4U0hde63A4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mZbUf/nG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765D8606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765D8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mZbUf/nG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6Hm2070796
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=mZbUf/nGhN1KTNs0
	KQnai4oOh0VL32rWnYxOUmaLRkXEw+m3FYHCLQDAZSEt+hvET5E2g+3XXnZA2KCz
	gwHuF5DeEMIFuPacHKlzv0nUvABbChp13NgcHZlGEDK+km2uMP2IWeiCWb6b8war
	7K7KZQz8fzNf2JeUm3h4456A5s0rn4LWL91dbGS6t75Aj1qzTAaLc+S1HrPVKSWF
	SSkeaIkXpe+g05gQ7YPs4u8i3lkmYUBHojBhw945msyR47P0H3WrUnleL/isdRcQ
	+2tYJiJ8DFZA6guWvYIZYpaljJeIZO0aE7KWa0zto7O4v+4WJ08YEmZtsdVlYUH4
	IZmKxA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jv8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6790b1d37e7so41168d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200869; x=1793805669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=XHwGfAqhRbL6FWck5/aRfJmkhAQT4/7oeN5BpRhKisp1lNn31xxKiFDV+dgjBWQoEu
         SCzp9rk1D1YnO3HNKbaDFmGSA5oS/IPfITpADH8H9olMMx1eOt3NckQbDUn7EDr4OBiA
         tptB4RrQCu7k1VjNt1qAnHQcCDLagoZGNH/lZfzeB5y6ZZ43qMAXcaAdt3l0vVHEWt+f
         Jp06UiwLGvdS6e9BsuI93dUfGIpcLlNohiA8QS4l8RY6urS+bHwR1h0UYI3RdLoKeWSr
         k7EoSA2q7v8gm0+gf9/Y4eQ0Fm1M8yayEiq2CJu2exVfG16or6X3hJ6ssi2zSoEb78Hh
         KzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200869; x=1793805669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=MIVycTxgTwmOBK6P0jJNGiHKndopoGSD0lYyu3tVQUX6fqdbTUeygqlfcpu+6AD06c
         s7TOCuIi1ZSctdX59M9/8zKsvFdVHerRa0i1L/Pi1aCnPwyhtCXGkC4EockHCGNkibxl
         h9DyJLlQomrTDiIoNpcQBP/TTG+SwXfnkjJT+mDgtXb7n9STO0m6OXQ+p7kamvmLbkKN
         EebJNZhopwgvYXed22oWICeFf5IW9kkDgBSvzD3Vi5Pi4hmafMUXlAEvqa/j6k8KPf4N
         ooYgHGjU1XRgGKyZM/NuCmCDtwNzRWyo11fIhBltB3zTSs/jihNtV+Ml0snUw3cBAIqX
         FCBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX5Rz52SSqYF9Gn2jSRR37+Xl2F/zEBmrp3+kivt1RCY/PhxT3kMDtRmbyLc98qnEE6syxEH8yZ87vYgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLQu/xDxC7H6k8h864LcjAL8nQe2TZ5xGgCZ8hcJeHUbncrAya
	0CeBLYv5MVyeI43P8epGiKPTGHxNJpycvNoJ0gU09w4kdKyGCiorTGX0lENRfSe5Ot8xfEx00b7
	WjjRZe3CyftVCjOm1ACc8A5jCax8M6pguSRV8MzoU6LR95Vr67pdsMx6nfJlI6oVBjyM=
X-Gm-Gg: AYBFou2ZNfUuGA94d0pSEfLCe4Ke67YKLGFRRQT6zao1jWaEW5LF29bpRY8ln7slma4
	98ee/kB9Zm59Mj/6j3hkAKVObc9w7lk/1Ria72k1IGnZyTndQeU39WZro1wh4R9DMWLvRzqA+AE
	jsdvS1iqaTHh54TOuI2JfNuzuAl7axAvu6+HVpHeayoq7WuvXXmZeEfOoFRa55j+R81MWn97AWj
	QJVLMIqUZlUIE1+HQ0Q1Bob98n9n0+3sQUZ+H3QXWQ11OOA7Xy2j9x4uxvNg0/pWh+zhLzUjm8G
	AZM23A+fZXv19x5vQpu8QEa+prrL2Ag+xx9pQFLNQJ5VZu5Mx9EBgfIfzmxI7HnnI+pOpzSnZbw
	ic9hsWbVKvYMntpLY0KZWQ1oUMy0n9X/o/G0pmhfIfioK3sExcPVNeCuULB/EN76BTlKntvfyXH
	At4dFETatj/RBYZsQ8JPE7NFRY9yZJl/c4oBcywX3meJdw06UaA87o1vD5pznD
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290675d50.31.1793200868831;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290626d50.31.1793200868178;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:37 -0700
Subject: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/R0zzs7g/3SR
 5bViZINfPYYFM9o5Qamd7Jz+iqv1ryi6LZgIdj66a52FskfoZQoS9CQ1ZTLVGKMLZGcLjnoQNZF
 g2NrL5CHe/gjHhujCY9PZbyQKULHnrE=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212e5 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: EyVBwcIrR929a37pboT4ujsGi6TGe719
X-Proofpoint-ORIG-GUID: EyVBwcIrR929a37pboT4ujsGi6TGe719
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX5h4Ap1dG4uI3
 ZtBr53ztVNUBg4wDP4KYgdwfPqr9bGKUlz2Wak9t6pFBETGcDWncfO7mCtl+HiAUeYqq+k3tXKH
 WrhQHLeO1cWRcEXEl7X2Rni2LvVlM2tPIxPNJd3yXEiuWP1M1My70ipZbzYwreRvnAUZ3ITge/V
 VUzDl4nMcsvqqw6GAH+gLWe5SnTrqZQeboIDxfPQOSzMICzN9Tc24rnDrqapcqukuWYmu+2Dnff
 r3A6bREOixb52YBRHFh6Ox48q4G96jRTqEMEfAkliiBF58R6IUMYtBpz7Eiehn/d1ujUkzjno1p
 o25znUeX8eL2kIA+3G+yeF3MgHPfVVd9oMAcUxbUaZzIwYiZi3pZojh0U9xc7fqmTnHpTvQRuWp
 KZ4nDVeiLTwPqyExrmfe5qgGydytSmQHr20Y0HJO03HQEbUiGv7U9nAXIxCkyhw68fZLWKDGHxD
 B4DNbkWpV+1qvtIHzxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

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


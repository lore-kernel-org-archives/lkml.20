Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D57C3B3880
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461717; cv=none; b=SnRZR1dTrL5VlIjJpeXJB814oo+IW37giMQC8zpDo7cXU6eYEl92xTNaPRqd5Sa0ERTSQ8aiwRPwjhYwplPN6OdBOYyCKQ0iAmc1MXRl7d3YaNjUbAzFJHaaLGc7CERpflKaVK8CxKqK5TSUr3ogxr2EznVxXrA21TTyMUjA+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461717; c=relaxed/simple;
	bh=6Sz2cqNRtW1LNezPdy1yYmWDiunh7gud6qBkVKoWCGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrGy5NYHvRRJh43Pie73OmCQD/094e/B5DDbmvU9ISqE73db6Jkjpb8jcwznYAHIoWUpYSLJv6/Tz9XXLPv7U6IY79JnQcSPmLdzaxqbT7F6gqciAxwhkGrYPxaFbWvhTAXj5otuj5Wafc8oW4U3x3Ic+N5goxldnRs7m7+NLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADFubAnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgvX972b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADFubAnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgvX972b"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3FPQ417571
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=; b=ADFubAnka63XDCbD
	aqDT+9JpXBDtCltgiFy6CDI2ukQgiTLWpoMa/bial6A+VkAtZI5K4/2ONSDjqfME
	e5dyGBqysDMrx1dA2+d92LztUUNy9I6DtKsRLVVRXYMo1F8ljZCLNAahjZ3Wnwr9
	Cj87k9RIRIVwMjKzNqhbWlvO+AHEnSxRIkDse/Z/+P0bVJ8xQGLT4w677r/DUmls
	xaBJt/9B/0yQBpMl9x22IiMXuRM0RTlPw2Dit8p6trc2/onrUtQ9tBLHqpXyvfkE
	pEmeIxLiRuRVF1sgTV5tXAuVP1pQyDjRj1VXS6b3vjyn12eq7SvdHqA/49Qbh6Tf
	GAzKfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2wpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:55:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so203844a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461707; x=1789066507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=XgvX972bJ1tRXKKEa0ykfdYCD1rCLfefX9mygNjidOwY8wkNHFLuV4YwNt3cvisYBv
         aLDA3W5RZVAeQLA5Y3WpKn/Nzffhzpa8Wm2qrwP7EJbuP6myNXqHpVxyIpWvrH4HZQQa
         1MCan0IbjFJGQvHUC+ymf4zpofPMqhLglUH4M2KLe8K1cI8WdWXqvvYiqc90V/Wl0vcE
         tSuG2UOiY2IniFFzfc5Fht+QCFYa9DeElGkh4XbZtlSGLUwAxGu5S02QaTqWk3/+euiZ
         M6tbw6tJ0FvpDqtXp1SxyCf1zIsQ7pxTdegd0lFcyQwY4sdOUAo9ovkTktY063FO5cYt
         f/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461707; x=1789066507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=n5tDSM+VbWVCo9prDIfZ8Eq4zecoR5B+/FO125x77KI02iLBd0Sonx/vXS74IP6lwj
         KbFnLZ2v6Wyo/0UHdzJANOFVxZjokHJV92obiS+T4TOXGHd/vgFi3C+K2vjLxaxsZd20
         HDgnPADKcB65ta3wnJVzPFvYEvQ6FGqKVqVjbE3ss+A8cCXXubEQxgYQRJp0AmVyx2G6
         fM1dq0rfkUPjY6SustXzcNuuCmWSmYbN6/qhWKNzqbvzO32pYPLrSuIuRf1TBEb5d7XM
         XzSy1eJ2bypuxTY9CFc/Zza7hQ7Opp/SBW2LM04SEQ7ZedBIQAwy1y6+hqyj006HMyaN
         nx5g==
X-Forwarded-Encrypted: i=1; AKwUvBxJVleja1kt/p+rBwNk44NG6XR/owXpuRtHGksyxBlBj50MAmk1oOrR6bEqhdYbKs1npmUcOhJ6ta5kmRs=@vger.kernel.org
X-Gm-Message-State: AFuF++kCyFCW0VaQboRb6Nr5a6HKsUcPqcc8CEPRRaqeoaEab1qCXxdH
	tG3B1opS8gCb+gShv6TBRqtKDcEZqc9xE7I63omDMGVXkdZwz4ws9q5dx+OB1wKPOwipAebyXgF
	S4D4qf+DAVE3jROXQOHx+dQ2mYgwM4F3MIB17QGqiMXIpw4jGUrP8n4y1XFIqqRvUYu8=
X-Gm-Gg: AYBFou2Q3pGTBe/5zCPpR1KHjd9NLLfHJSydZsek9MLPGgU+0wP9Yoq6OBSkj8LnXF5
	IQg8z3o2Q73bg8pPPfUPijCPDSYLyzIVYc5u5qK6fUOZ9QNGNOKyK0mWwwsFvDzNVZs4iPyVFXf
	y+cQdQ2pGNw2vk92oAQT2fQiuRIvYccX99c/Zw1qlCV9nJnn2iXwr6eCMPAG8HAOQs7nYia3KNY
	VsHj2zCtGb5S3SAeF4R+RK/qByUZ3Li2Ny3/gYPBD64un0FT4BuBiwrTfUc0Ogf0iVYDSPsX9c6
	xFJ20X+G3PJMz886pYAHsU0SOikggTBjtVhw/LYBpt4Oh8jEHFzB04n+SVEHbAczxzlZfEn13Ki
	ilKC9Spjr+fYMj00E1fQYPrskc+y7Vw==
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881613a91.6.1788461706825;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881474a91.6.1788461706059;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:55:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:51 +0530
Subject: [PATCH net-next 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-9-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=2446;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6Sz2cqNRtW1LNezPdy1yYmWDiunh7gud6qBkVKoWCGw=;
 b=eafzCTaX5oGSJgmMpw+62BELOmcZDQ+A8rVZfjvC7Ql/q2fwMZyJnskZrX4L7XK4y/BoPFoX5
 J7ufBnL3yKMCY/FMtq9NyBMLv+s59whooCZWyBOXtIPKdRElcMhpUII
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: QQUa7ezCLpyTxs9KoEhHS0DpwB1LFe8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX7aFHkg3g82CD
 Ilns6H0m1LDqTBTkkAfN0LEVtoQcw9aKwODf3Fjmg5I+Ss69UVWbjUTVZvY5Gc7MJDPoZG+Zicc
 rzmiMiQVfeoQkaHvn56stlynUg99rUrIs5BaW3+42aNrZvFRSkqXL9WypHBpPHka+e9NtZIBAY5
 KlYbiYLeuy3utXxYBkhxQGjPat7St+9vKFQQQjUZaUZ9GGu2bPxdjjxuQqiJSDhusqCKV15LIno
 HnWvGtVnqOvKT6+vlnM+DRZ1VYsukSKazuzBVB9+ZXviN3iGnJV/VpRuUCbCxtsLnGf4TigrRzs
 UvAAB6Akxf1vMmEQ2QYcQgC8f6kHyW1UgSGokzco9rCqEXOV8VGt/cdhpBefuGXKXJ2SNjSQANJ
 lZ1CVB6K0FQYOc5LuSibG4CXLdWsoJX2joGpz7oJSWWP4ft79LarEfPpdzQViv+2a2HMtfYsagI
 Cj3D9UmWFNxdSxBq7mw==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c28b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BjTvb0yH8tSpeHeYq6YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXy5gOeB/iaQwj
 X4vMrhYy+4tS+fakks84hJgyYotbNHJwt0fRCDLQl7wEz+zRDsmADgRILosHmo7A1Qa4d88W3qG
 +D+L/0Ml8v5lljuF9Wu1XffNvBFq++Q=
X-Proofpoint-ORIG-GUID: QQUa7ezCLpyTxs9KoEhHS0DpwB1LFe8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
all at 120 MHz, and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a31541506a4c930c76374d7d8b7eceb6f51f37a7..f96680456472d1fa7b72bd404c1ddc20e505f05c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi-noc", 120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+	{ "stmmaceth", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -957,6 +987,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


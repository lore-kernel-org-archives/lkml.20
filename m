Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1F47F2EE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230402; cv=none; b=Ab7xeTAhH2opQuu/LNm1J9jhL1N/9EEagYOtWX24SNJePGLz1GnYc5N0U5CJcqyJZXp8UfIlW403OBCCMcgLktL3SK9Zo6JwSHJgB6JAf1EAQKKIEKB2eeezETiqpaH7jbjwroBYkV1WyHqJxRtvk4C3Ninzx+pvoy3j5WYvoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230402; c=relaxed/simple;
	bh=Ipht7m9Et6WvFOLhnDe2Rp01r1bPZoZU3GVWVCK2PoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FW0aH0xIwo0fdkLEesUTyjWsRis+zOKmTwVrrDHGgsvii34XHQpVEVcdTjui+Z/tzbp/QulipsCZh83jJdsi14JZjCO1vY7P0h9aT/JwO2p8sh83+I6ufK5se7Oj/JkXSznbe6SeTmPi/lsXzDNQNE8Ll0BNnMsX9CTvDlaeuIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHo3FNIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6YkxYJz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHo3FNIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6YkxYJz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6noJh389342
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=; b=eHo3FNITcM89OI38
	nuR3/J5lz/UH6jTyBY1osa0kDOEiXFMvbnRtC68yNWLSZcmrlWKkj2tcJAEYeWpM
	aEcbL6vgK9Y/s+39XV9vwONp54XQncMMO4MO2Ck7GWUcknnwcq239oOu3rVuJd76
	EJcwasKdXULBJQA/QOB1z7pE+DphPMELqZ/6gbc4x0X2RCyq7Q3h7QOJfJKFjDsV
	VoZpCtlngRZ35rZBruYIGUs8GXwtr3ynXN0ZqbfDSsrg8D7nxHgOTkFJtrcaOJpN
	yHX/YLqovGji/9qP6ednoBen9w6YvDBer4xUHxZNQPcuORsIapxeR/GGABt7al/g
	glPKgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838mng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1829960eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230400; x=1792835200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=;
        b=f6YkxYJzvMFABdV2Gn0nK1ygvbO5QmQ0CCmdwTvDOrOLPBRqQgPohp2S3UsPyBdein
         l2TmQuBRxIyR6YzXP47Vy7RNUM24Yml95doV8Oh59zZSgFzlsmi58rbpbVrkHbqqyJBY
         ArDsdwImrUnXOUcBqZF4ZA8CygPht5Sj4DfI614i9E5pPFekeWHHDthmLJUPWq4hVpu3
         ncYhLpy06v+Z5z/oMHphFh4DJVa0z71KvsEA9zpmgnYqCz5rDGLvumYpMzpl5bxoNFgT
         ZBqkAB0Lau3rkeQ9nwH91uCx4ZXxoI+CynzfUII/joM+ka1zBAYVxlBo9bd4OD2IYSwK
         c31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230400; x=1792835200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=;
        b=ZOOP+HfBTAmNEs0ZCxI11d07GXSSB1cKaYVfO0u3UthNWfPvEFH3hitDiM0oC4868e
         5pSOu8H6HeXnjwbZZsCV/+lwktWW+qaTg8e7At00o06HEt1v6Mpjdlf0aHGlyywUHpS/
         qPrPRVrEwpAZF//BageCO4VVB22F+vPYgNDZaaCHCPAxP/0yNwBAGPyAh0LjFZEpMsmy
         CmkO465m5oU0mc6dZZQ+kCHE6mcdipZ178uxx+JWDbTKLagkzQTezo2CEoGuJZEUsxMH
         uy2ePN1ST3BsltZhQLHtOxG0bH2Zt8rUoQEGvPKwGYjGoaQLxB/NDvsqeE3dQeLiu39G
         wX5Q==
X-Forwarded-Encrypted: i=1; AKwUvByii1oLshjcQSgW6Wq6+/yyDWH+5rhDFExePmV4pvVYuT8M/faQJ9O1+wh3+xyiDONu8H2aZI1FnJaG89E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvzae0s+B9d58a9YGT/s5BTTQIbioPkkIp1gZog7lXNOhVb6cj
	AgvojlyKIfmjIvZDtLjyO+s4q7b9oDlsOF2NBi23k70eUjNCyE2HXNTcJvOITbR5JNQ4f3TcbVh
	dT8deeZ5ikoxre0M3G5oVwdh8BmcyBCk9cBJNt/+JPFRqsaMDTZ51SQtVcuQ9q9qva6I=
X-Gm-Gg: AYBFou10b8g+QBChQWdjmoTrgTMYsh2E0YP2sgVWra0bMtN1QqZnpY+qlWi2i/uyBSC
	UCjamedMtL1X4e+T1kh+dHPRJ2wdykt4tVZWVS1A5Rfu7e0hEpTfVfZ//7l10azGmZcxtGO20hc
	EHH2Td6C9KrFSZqmIxi9AaC7uyosCECF098GqZzbBI4xGD0wOrxRh6vP1si5BsMXNxScEbLERHG
	6eYn08ozooZ8CeeXmTswA7mWNet6bwOZoHTbtHPZMLhJZZ6y7pZKKkQtEW+ZJJzwDn7yo4WOWSw
	QqHYAq+mQFpZSFVnn+IeEj5Fb4iJKImj01isrkCFik9a3I6IOsSiByCpmZgPsMzGNhrHxWuNUbH
	EzqTc5vcccz3v41RHrXiZOE9BQ2mszw==
X-Received: by 2002:a05:701b:2059:20b0:144:fa57:c617 with SMTP id a92af1059eb24-18513e7b77fmr3437000c88.34.1792230399725;
        Sat, 17 Oct 2026 02:46:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2059:20b0:144:fa57:c617 with SMTP id a92af1059eb24-18513e7b77fmr3436956c88.34.1792230399102;
        Sat, 17 Oct 2026 02:46:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:38 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:18 +0530
Subject: [PATCH net-next v3 7/9] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-7-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4125;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Ipht7m9Et6WvFOLhnDe2Rp01r1bPZoZU3GVWVCK2PoM=;
 b=0buwP2KxV6FyhlLYOfmxajy/KEdIt1S8Rh/NuxnaHT76EhURWfHYmoQVQKm4g9as3SDyHp1ni
 wedUK5aj9tVCvXMzEfgegErU8ZNfPz1M6Sl6op8Yaep/85PSKFYUJ6I
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX8qGeCSlxmrsq
 h1HbQ2Woy9P/sGMwcVXJtVSclqW9PAkK3c8Vl2QcD3mXdOpxWPIq9ArMwLMg4shSyL9u6x6z3lU
 e16KpZpsHNVz4DYTN+salRDDMGC3UOI=
X-Proofpoint-GUID: lo6QBX80cZ-3bkVE-zLZcX6FbuqCDd3-
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad34400 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX1th63BR+tWNZ
 k6X4WJnru26uMeVTjUjcZQlitTryAZtIv6aUO4EOFRt3CMHZkLOv3/ABj2BIyTmL2pNEtxWkpK6
 uJbqbtCem+8bFQfLyVZgvVuksssn+n6d8i0jLIcyPh40GTQNqXzKw2Q4CGVADZLFhQ1ffMBAozq
 5BTxEET5DNB8ewXguIyqs6d+pAYsPWKk7oNXuUdYznRjExYMBz/eTlWgUanbRPP6hLravnKd2/P
 5R8oFrbaXefHvFQw2zIfxKEI+sY+u3fnxd+DxV7pUuWXT4ssdQqR9zOK6oJBuTvF/YoVsEOrK2y
 vsqar0AJIOmG7qMcpm3YyOwExaydzuLcR4Mvg9tnmewHhUnksc/+S/Ey2QBIw4FqH3Fj0tg3jsY
 PldwBZHkZ0wjSNa6LM4GJLCkb35pjKZZgDaqwlqlNwYc0wSNox9gS7M0sCOLnjm3keySUXynJYQ
 6c8bRcOTzCniCeTaj+Q==
X-Proofpoint-ORIG-GUID: lo6QBX80cZ-3bkVE-zLZcX6FbuqCDd3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 57 +++++++++-------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2471871562ed9915398614d5c88d1c6673829db8..370eb05caabc00a20d887ac88c1ffa4473bc4021 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -96,7 +96,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
@@ -247,6 +247,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -261,22 +278,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -296,22 +298,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -830,8 +817,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1


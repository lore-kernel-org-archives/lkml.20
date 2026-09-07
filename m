Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8E524B02
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812710; cv=none; b=G5AL8MQ2oOoTpFU3C5mjAAOJoV/HZdiFMN5N94611SwQnWEnoKmfKl97hziHR0StmYFmDwfsPeMR5JJFYn+2ObgkP/IlU6USFFcdv7WvVCjBcXi9495/9OKSga/R7RhiPLlkdBjLPA7NpiWIDCVcdPg/VNVx/BC/yrTJhWwb3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812710; c=relaxed/simple;
	bh=KsLk75r2w7Y7Td996D/f1RY9lIMY3ClaAGPh1T4xOuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQcdbE1sBerxal+yAVOVfFv2N+JyUHDh9/Lxl2EBGuWHpDPmYBBE0A0nr6gVltia3xQTBvNfxZxKWePgw8U+sBBqEuM5hMUcvjsBg+l7otqwvoVDXlwD5GYUDm5zynw1XF8d4Iap7phoaVfLG2qYrG+8DhCHTQnVScYpTBl5uIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4PlL33X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHdNhOIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4PlL33X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHdNhOIG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7sbJ1642252
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=; b=T4PlL33Xk5zjDyxh
	BUlto0g8F5GJA1rMWVho56/UPhEgBpa/mWZ44L0nFhxxBesK6Q1CrjnoQPzPXzG4
	UN4i5ePBHUpBptW4fo6NEjAkgiSt4uVx/YIu2NvRuGbLfUkv2V0x/K/Sds2kOS7u
	XzgMUGLwY8gRY5IpTY0kI0T8F3bdc/b+zXXIA2p6sXl6alBn4YeRtHuMeUQnSCMW
	xpzRJeCeuZB8wvrroUJpamTu7CwvU10JlSQyvjTaEK5dqC0M4QZUt32wSAuBnX/6
	HyNGUiWay4EnOU5H4Roy50/BdILONCtYj5A30283rnN/EEO3mK0sNZqvI1xY+2ID
	rdPFCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaawpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:25:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db3b126c9fso27800585ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812701; x=1789417501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=;
        b=RHdNhOIG1Lsa2l4RsJoBmURkL3+B1A/rf7gGu9aaD9un4N73SfPgYpgJHJ1ROdlqRU
         l3DILlfI60grNpvrlEIw0jxcBUVzZ+SxWJWDSodRGYHPnsR7IVCUFjIZUX4L1cO35AMw
         RA7rsJAHikqfYJZM40FBYR5tKSiJy1BAGlKPS7h7IEwgE5E7oFiBsNn2Buf2IkXD/uMA
         4biQFLZ2/0/zYPQIKdKrsKRcEssrxyrCxxidM5v2VTIGMN4J2+B+E4yZwXwifpBrFe8r
         LB2Z0RTayFMKoJ2kLAlrZ8FBL7+dyiH6b2bryT1FQAaMzJSP30OoLo0JybppqKWQbr6y
         HuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812701; x=1789417501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=;
        b=bNnUcOFb9BGU/70Knvmzx0lava3I/ab6W/9N1P5aOC16J/H8GG06sooN6N6ZvXa+n0
         E1Vh4RxfSYVHO43HYao4NKby7ysCiW3sfehqdHKgq7tjj0GxulrHXwbXwN4BYMLtBa/5
         Y43j1AfAbyDle6K9DWp4CNexwn8HPH3n9sQWTPNa+dyEkg9jUYkrpVt1vzDiY2tTxZrP
         s6v0ckrM9g9cf0RAVJwRR+zGXUdaDGDK/ZY4jGIAsCn9/d9ACK/hF6ewHgPYaQ/sJL94
         hYRHIxM3Ii70JRjPJmEm1ePqeVpfecRC3+ADjJsLaC11floCXXI4ibJCnXlyW6yZpllL
         d4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO4g8rdqDNWtg7RTkasgaXEL7fmzZDzQNGwrx90hVem8RzbwBcpFgvA2i4BUP7iqa7ggExxaOWdgCJWbo=@vger.kernel.org
X-Gm-Message-State: AFuF++neDFMR+UGPaUnfdsqxtP0g9LQ6OlS119hhwqIAjfZnv/LVmsQJ
	6S8HHbil7u8Xjh7O4IlOm/E2arMBknjeqtfk6DTMvGzFGoEXw5CezJp8kUQ5G/bBKGTrVtAB/GW
	9ZToQWUNG1Az/c+lUYcXeG6439GwYYtLp2xdErhE47Kk3OP34r1EUL2RZCciu5aMs9Ww=
X-Gm-Gg: AYBFou0rx0UWB9Hl+H2tUqcsunpeSO25YhVu8mOuzTI7NpIRlmo1xW+rR1iZGdqjngu
	q49DOwq+SnpwwNIMMJIhB3SPZtoxZKB0edVW/G5sLnJQRYldfAIQHh17BWOYSalQn4pUbCyPsDB
	f0k1l6bcrmym1qjIl7A8MPxfMkh81ygDWNLmo6tst4CS+jevx5eRiqlfhTzTjvA76PzziuVmjS5
	IvHk1zTeZpZCEko1O51CIhimL5iWnxso+YGXvw95eH9WuT4hZLQ5wzoCnHzWw8SMWm8dln17xG6
	I2XY6d1XXYTPZcRnS1u5RXnRoG2PeAR7T4pWUoLX3blJuftSBsJl63/oIelfdN0Hx+lpAgHkx57
	Vt2gb0935RjVYckmr8cvuAqoUgzdUBQ==
X-Received: by 2002:a17:903:4b04:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2db124b1ae2mr337578425ad.6.1788812700524;
        Mon, 07 Sep 2026 13:25:00 -0700 (PDT)
X-Received: by 2002:a17:903:4b04:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2db124b1ae2mr337577745ad.6.1788812700084;
        Mon, 07 Sep 2026 13:25:00 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:59 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:21 +0530
Subject: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=2805;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=KsLk75r2w7Y7Td996D/f1RY9lIMY3ClaAGPh1T4xOuA=;
 b=dBBGlbQ+PXRK8wV2RTj9A9/IfrTUGHY9GlnPObuNyviClmSFJez2HMSBuIgjBJYSaU6yfzIKP
 OhRIpYexXv8CIc9lrWT634bEjV/CIGTmd+QQsDzMWwxUsfQ4OwMfErw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: w0bpGJHU_YJRiQUi-6wb8ajNdAB9rM_z
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9f1d9d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8IO8aBILldGQKMPJy6sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: w0bpGJHU_YJRiQUi-6wb8ajNdAB9rM_z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX3Q82AdhaWnxG
 bM3MazOhHb9AaZMebARn0fx+I7HaCYW7NBZmEO1l0PIMX1m2HdXqgGralXTyNxXsb4L3f7Mo/hJ
 NLMt6XEKs37tuFjoE27ce8AYfrcAmrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXzKRN6wTq8Nbn
 za48n7okPu0hlrsCfkuqmDZkAfbuRk5UpKzN6uQhPJeuwAgITvHUUWYSwHIhotJL94ANtEEn6k1
 7Ux/mKXjTIxkAlMpuo7JtytPV0vcPZcdbO5mXzLUdPbEijyt3F1H6Ng6o7RPU80Z9nWFr4+yYcI
 qgPVmZueqT3cG+qQTYfkOOSIXkSFCloKl7WEMteiWV7BJfd7n7swWNA936ivQ9Laptqr3BMDU6D
 kHsXtCjYKfe/q/SXI9JFaniXgn4jXVYcNR+sYGPDodeJMAhgZc8MW/vL6UL7jfd+/W119a1gU/Z
 8YnolbKJ9fSU9v6FlWzIXnvGg48tK7PD7GCqgJYHSkYNjfggbun6Q8Z9wgy8dalOIr8q7I/apSz
 nJB+VoTSAWuIyqDkuK5dxa09Xnr6NbPKkqIbRSwvMTE8p76ssF+ssuvj3n7JR6SQeFLaOEILG8P
 ikT8rFiA59k0YeQWl8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
all at 120 MHz, and the 36-bit DMA address width.

As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
a second enable reference on the "stmmaceth" clock, which is already
enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
run at 120 MHz for NOC access, and managing "stmmaceth" through the same
clk_bulk path keeps the rate-setting and enable/disable together.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a488640f6dbdca30 100644
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
@@ -962,6 +992,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


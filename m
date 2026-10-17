Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625AE1F936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230374; cv=none; b=jwweZV+mhLlkvyd1Vgw7j9rh38EHOQwEPQ5jSYDsEAkkhRHOtXrACWTG1NCw5nPVwkoAm90kzgHxoegHAXiJkWyZ+ct+oazeCke26Nee1OOHLoILJFAVhmtNABhoIdHQ09jXQvcShBuOaZ+lsOjx2j3dWRkcNA+a686JXIvkA5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230374; c=relaxed/simple;
	bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIroc/BS86Vn6K5M7gF7Ajwe/YXPMgIYOXTf47p+nlPZ5Tkab3sBQKfMMaY+H4BfavWIphvzUS3BpSBXq1CX1NQJosbCG2mGesT4waDHm7fribyzk1ZykXsE5xWISAdXOro5iNYSV7ktOiK/z8LW553SxoZR0OrHi0VTHD5fGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORg8ckKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=du7Qg+fB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORg8ckKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="du7Qg+fB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o1iD1402763
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=ORg8ckKSDEO4ycs3
	p7UmPrX18CHDtCmKlfBu3GW9j40Nx6fe19ek4mZh7GlHSuZgjus80oMwge7qK7r0
	QAx1NXUC3ZpP9M3T8mWfgScjv0DEZtDhYYQwNT3T5dp0LZxBSCHKw5dQwUZ9EZWv
	kFQnkhRF6N7owZSCzLSC0Lg4NWpSCj2koqsOvne7UoK7OMjzOSFAkcMY+4KoB6cg
	W+zDbUXJNM4iGtwU0embOR52xbMqr9WgmJmW0AIarV583NNSa0MKuqk7dvj77pOX
	6+Tbe9bT1SEngLVaQSzh0QsEfIVWEm0D7yf+ZC3OBtf6Qi5gRNXX3fJYrIyAdy4H
	6lWlFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys0sbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so1797015eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230372; x=1792835172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=du7Qg+fBZ+OQIEceuJe6+BOUbwfVuJzDFfB0vIXOckRzC70S7DRZBrrdtexSChUXwj
         pN9+NhqQokCAJMlYJHhu18SPmRRXrSV+rxhkTvV4Ny7wXPxamN9JpUJgBf17uyjUnWG1
         tK8eQtqfw8qXjSevzxRjOhdLo24p+5CL1bq1VklpdAtZXY1zVwZlEEXV3i/i8+6gf2HO
         MLx+mHLCJK6KjIKYCyQNNJTyWlxA/E6e3FjWp/oQSP9NVnarqdTeFyMhSOjTu5omGt4J
         0uU8paFFMFZq5d4mW9FvLUUMML3fqhdKVtSxy2eZSg5uyirSCpip9A1DyyDbJryyDia8
         9G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230372; x=1792835172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=cdtAigrkSH5ommYVhCrKKPd3MYZEY6QxsksqAelk42XzMRV410z/tf700yXi/XBca7
         dOBI0uN03zxNdz2nFtToGV6OrdmFfGmv1FOjHs2b32VR7zij3aYLJm2Xmbw8efIPjbzF
         2hIipdn0ZuZwri+eFiHhOaubaAFvxr3Q839bsOaOb+R+gmXNZhLo85ZbKE7fZmuZFIIR
         7sdyg7fyMv2/WvjaW6lHFD7ww8YvzNfYnrDy+PAxA5Sm5QBrfwk/YdA3K2qd16k54Qpt
         a3clbuZgkgjbYMbdiwJMpjYLYt9DLFWpO0WEKOH9S76Zd4nGdOJ2WmELJxi2mVZ1nYIG
         ZGVg==
X-Forwarded-Encrypted: i=1; AKwUvBzoRZ6oNsmaPHMU3tQ2zprBNhOC5H7UMvE5Fa5p8dqD4wuF/HQZrYfzSLIVWNW+UZzQ5NKEFGlRIarRiB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu/uSfIfTv7UVN8nxDPcdoU8tHUpKi8DS2/sLGZJ6VdWSw1FvW
	89qybHZcl8D0DDmbdVt7W2p1gqoTlyo2lx7RML0FBPBsxOjnRXzPbGR38b1Z8KvxjvvBfEurTwi
	Q2+Ls4OdaOHrmdHz43qbPVxdbaLolh2GfojseF5eoxPADdcKnWRbbI7So4Qnolp9509I=
X-Gm-Gg: AYBFou1LGk2aGk0hY/nxcIFpAr+jk7I1Kux+Xy+63aUgt7uu40RRcWlXvtP1erGsNvK
	mSZEneT17dC+QgMh/u/tlGlQnE8qbBbKxSg0nvd3DL7kooJFrgIcprVih0RNwcR/45d+Ek0h12+
	e6KRLWs7WRvNMoiVoPQ92sTpQHAtmaDyafhRZavpF0rZTQwejIwi3C8ztEXuzdgejJKwwgwHIGq
	zi5unWM6GXlpjatuq1Yukj0fb4/Vf3GiOJfMWgxAQXLnj+F7vjJXHj0ts+Ic1IjWWzqlGhZKzyF
	bEs0yst7rXPBsc24rI+IM+2EiHNr392anGpSYIWyAtDTTknO09JBy4eulMd08yuWSenNtr7Bn4h
	PvFFMQbbwk+hfb3R5guXBKURGzFKwLQ==
X-Received: by 2002:a05:701b:2807:b0:14e:7162:2ab3 with SMTP id a92af1059eb24-185120a8369mr3006185c88.8.1792230371963;
        Sat, 17 Oct 2026 02:46:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14e:7162:2ab3 with SMTP id a92af1059eb24-185120a8369mr3006158c88.8.1792230371354;
        Sat, 17 Oct 2026 02:46:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:10 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:15 +0530
Subject: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4883;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
 b=DDwfHmr9636anChinr+M3RRKVGtgJw5ssHyHSwl2vI7NWLC7XrTIdFuXo6QVd1P5/VtZkkmFT
 nuNGevKflktD20S3RbxLJCbjuFgU8gobMVyUWl3spQhs+aMTDu3OGyt
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX6UNHUcQ2ktol
 BuvzE99E3cyeBgvPLk6qzPk4DB0zXTSN0x/K298weUZV4abiwLPkVwiqLGSAEU7vr2yPtlzf6Lc
 bFMB9myqRUi8h0Bfyz+HrKD02IVsSH0l4bhfYvj9NAAE5cPn6sRNH1S89X+/HE1Abzke0aUIQLw
 UtgDyHMWmGJiMhJLzAS1ctl2xT4FUwWbOluqpm5G/1E6qW4bdiBb2PFP2Hb4TyWfkkIAvLXqMd2
 EQmLqCu+LJmDXyipJ5PjDT4vYzcWps6kpLsJamS6X1AYhefN3acE53uow0KEKr/Im0YzyV+6TSt
 0R1nmrzhhorYwere60W+ArPgxgfvlrSa9Ds1vR43WZyftkf70nyzu8BoaGjzs2fteWjqb5DW7Z+
 CCm3EAOJ9ml/Xh7NcwOTG0jzZWHP84PhxJ63hNPwRQkamc0eWIR+lvbhkNmoD85g847fZ7LrmPD
 XotMeD6wjGHf3+Kk/Ug==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad343e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Uz0acryuumMW3PduqhaeiN5XKQCOi60y
X-Proofpoint-GUID: Uz0acryuumMW3PduqhaeiN5XKQCOi60y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX3y0RShJzHDT9
 cGPO2rdcFpeWVQVddWdj4sw1vRhxT7xlP3KPGHcUv6P8gagDnNlDy2bGgRNe83JTgr3jUQrDOZx
 NdNJSVmSe5mA00pBrtYQtoPXkcr4ehk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 67 +++++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..53fb9de4d92c7f1b3c51c183064024f06150444d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,42 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (ethqos->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


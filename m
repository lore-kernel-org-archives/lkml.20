Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146E3546FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461692; cv=none; b=c6yPiSqA7ekTe/FBFWSLCRHPCwVo93smO/UiON2LTKEm4dFAZVno8OKmwk9hJaWWbfXKt+wlwclwExaE0DYBFbiNOWCLmV+HjIXp1p0zW/NyZrzczlUs2LuXR1VJwVuXu+C0XG9PjYuYsyupFzOoB1Y3ezH471RlPhxYhU1II3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461692; c=relaxed/simple;
	bh=oPIOV+gVLaskH06k2h0yfpHO+z9xupXJmiUCrslRjTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eAK4XCl32wfwPj6PR+BJVUZ1mXNAms9qvznql3WTNVECvBahOEWtImCHmQcvNMk/FUZMmDZxoiGtsvAcuiWnReX7nAPRBcX/SBJFDCotwy1gt/zUrwyw9R8aqVuywdYgeJglP/az7N+t7vBzDhuq2PCGPcAxpxaTWtbiMalwisk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOVT39CT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VAQ8X3Aw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOVT39CT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VAQ8X3Aw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3fGO1209697
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=; b=SOVT39CTaHfspJNN
	T0Xwf9QKRY7cTVbR/hYBMXr0mA37ZqoNFCi2Yx2roa+ltesTIreKH5oequXd87e/
	8H+0NjFxNRpUqaYAU7WAXe/77IUrWPH6Zqo8xhZVXHgdTpIUa97Zh9QOxVKNeyrL
	5zSp7WvHzt72FKP1ut8nQ+Se3KWQ6oynA7vudhhz3h1E20Ngo2fbcZG0z72DDUKe
	0/zahxl8j7PCxomsLjrthRPXTqsaJf/RG/HyrxEJQBJ01RhOyIixY2bczMMgM2PU
	72rvn3Wyr9QnxJC+xGkh2Fy0xM4/4U67AnZJ+s/lnE/6UMj3+O2ZmWVhndCuHV5j
	di7uag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72e56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so203124a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461676; x=1789066476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=VAQ8X3AwhA63OB0YF5KLx+mcgaxmqBxejuWC0v8HmiBcmlFzgSle2Rr2YPd3gVCxF/
         I6EuHTFJJt0O07BjAUURfmrNcg1yOoF8Yyi/5YZEqf+ZnCj1D4K4oqhuK6Pe+/HLIMBV
         m6zdOi5TfCodtI15oi5Yn4igwn5noB8D3muR591jhdGo8JgzLYe03Vsh5FH3s4CirNse
         YaVQrJwWFWK+KDTUogNO7CPaOF7SqdZip26XrYsGUB4w9FpKWaCOap3bkCieJO6nuUoW
         6wHzQFvEPxafRvTioy4ofJrO27cKqWeYQyQszMWIICxAZ0J2Kf14oIZCwLn7hR+1fxOG
         5izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461676; x=1789066476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=lq/to5E7qKgTJdZcHmqXB0MZBZRoDLgwXYiIurkw3zoWqr/VkAAgKejouq3S00wGhM
         jVQTNu9dw/NeM6zdgquYlpn796RH2BmAymIckbiZWFIiPymmJ5R9YJOmB+wbEl4dZEm3
         xOwTDgQiS3+bFs6xNkx4gAiJVMGDStLhjEnU/2AqMlIR641enecy2WiLrUPLFQMuEYQ9
         bFvLiyA1J5hgAad3X8wIUd1l44qFjHIwXRhVzNClQGzyMXzd8zFQIzToi8hftpOlHr0p
         SKiOasqp6HL+Ug+V0DYmj6CnAA2i/qNNhbSeEuhL60P+Wornlfu2L+S69oHzMAarnHAo
         IdDg==
X-Forwarded-Encrypted: i=1; AKwUvByB0Nc1Wjvq8NQ3DjBq+zsl2ZJMOwV74cB3TG0MdjI0bKC51cDeyTIIe7mPPsJn55RoSZbMXfu4WUZ2YMI=@vger.kernel.org
X-Gm-Message-State: AFuF++lLMnvpE5jNxf/C3yjI2ZrqkOn5HRnFCNDCCP4t15BJAzuXvTAS
	HeY1uCi8maJezK1WtnDS6lSK8cSS2yfwQ/wIssOiQ8kwcgyePjgOET+0m7CcCL3LBb1r+WtWNDI
	3IHmzc3nbIjsrYCzaucUbnoIEhjKcZAZWYe70kcFENbJ1V1dRxglky6mxZxpdT50vEMk=
X-Gm-Gg: AYBFou03v/4zhy5Z61yrWW4rmhTLXCqGvjzyoQTTHGDOaYA54cwtN3uieKqBUDcHrhc
	qYzLYH9+FWQne4m7t2UaAFILHZlalXzDMIJZI4r9+vxB6BtvHaZDyRG72nbX9Y68QQiuKT14TfO
	SraoOSxfWp5vor7cir2WyvsJiBNgEzhLguQ7DGwcALB8aW4e9VZiax0UwRRtfpUbqixrHBJuHZE
	Lnk82mOEUpIuvLmazCcBOThwK8YfAuc3xyiFax0k833k4qUoSxTYiD8cRxDLWJU/cCWTdLbmoU9
	I1vc8pp0u9W0RenOEoHE2mnlSn4C+BQP1VpjvhzueZjvFSvD1zbmE1u95EYgRChTf0twG/X0nk4
	09qkjEDyduIPKKBadpNV+lVjsgEBxqw==
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937531a91.1.1788461675691;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937450a91.1.1788461675090;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:34 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:47 +0530
Subject: [PATCH net-next 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode
 to use DLL bypass
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-5-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=4880;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oPIOV+gVLaskH06k2h0yfpHO+z9xupXJmiUCrslRjTc=;
 b=sRHi8BoPgbISk0KgC4JVIGsrHJ+lg5f/DF9tLeSaANkxWpr2474ufayQ5HWVVmUWbphyvASaL
 lMGakYLTTy4BLwe+7HrABFpLsuTJ22zRFKGrMtVA2WdExt1i5a56LXF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: eFtZAVcgb5nQz8M7Tl5gFg9CnVtsxwCA
X-Proofpoint-ORIG-GUID: eFtZAVcgb5nQz8M7Tl5gFg9CnVtsxwCA
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c26c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXznlo7Eyk1tj8
 1wSR7UUAukws+Q7j1WsKH3M6JyI91x7WPmwIXBsS74B2N3t+ZahTKV1OTT3orkwAoc9ThBAh36l
 BtcYc5EoMWCaoYHSFTBV2LN3Ob+1aE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX3T/8WifxthQL
 JNJBT8UxcWVQ2Mb4RqAfxyYy8B75zJXt685fFn5ljOjNn9hqg/taUBjbilO0qBIodIGtR6kZMTQ
 tE1wr8UfIVDncSCna1XYvGsOOvqgiXzjTJo2smttaFqv8ax4k2Ocxcxnd+qA/czcH3TM0XsEaNl
 pSSZuMMPrylzECjMMcaexThg/jnFmjq183NO6+Z1Yuw7MWT36G7uRxNaSpfUM2tDSjKVz7gG4Kz
 BXcqI3Zwp7SwZXqzSZNLv0BIBiv1ErHE3PHopxEzbphUP70X9+N/KqdmNZ9f4dbBprSIhLDkbw3
 xF/xWNYL2EXsBsRyYiJSMPstAZ59NugDd6bntiM0AUzDZ2gLzCx03o+5egzBnsRDcLWRxiG5M/i
 xN2U2nOz57LHjAJLO1E0dEIagdJSiw/0razJBg42Z72SBKojjEb+qPUUsfsq4r5KoTx8ZuYhWSo
 xT5JQkKr01IqkCVWSKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

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
index 44270c25d874f72e7f971757fec659d36468c315..67738c1598c50ade22f2d548a6d66911c348af51 100644
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
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
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


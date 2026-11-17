Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905207;
	b=2TKJvSni+OXlh+BAr7OF7vt0PWvzMaIX3abrIawL5OV/WS3fZbMshnLKvcpXvN+KMLNM
	 0iHqHNU8RQy4E4pFua4rw0kOoatPe7soAKuXVKf7D2UD1lEC3SDtf9oxx4+J9errADsI8
	 UJh3yQJ9EAzBJk1PBwlwq4zo1XFNWKBorsl1vZMuIJMHlvjaoY6limUJnb95wNOYwWjE5
	 f8oIhKL1MVbHlFGFVuiZRXxhV0GiTajX5bYsoo+RPc4SifFqnCcbO2XjKqROcdxWLq3Ae
	 zqFiG2mMmCsukBvjeQ8k/rpmK1PltlQObL7kOMQbkecouWqBTEoofcTeXCtf6m9pcZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
	b=vryEOcCpPtTAmDM4Gq+AU3xJOvR1W+x/U0qGdoch8nbCk5mDftUnuTPdMb+QQRzSF+nu
	 NI60JO/JU5T4JqxwLR7zkLt9Lmzdq+mNeb5dooSQmH3UIhjO3yqJf3V2kierB0uBDDMov
	 L4kzS3ind4iIJv7qxC7bSw2MRIlZdb9OMj0UhaJSj70zad6D4jikZD9yBsN4UDV+cFFVs
	 BkFFPDl/l39D2JmYCp/PI0QfFhPwVNYhvRD0fiKca4qUPb1HDbJYgbN+jEsx7xYe4ERJF
	 lj9GUY+j4buqIRBC08ZNm+PYWEIKftULgDx7URnRdGp10AZnTGAFsPlO10cm0LKvHTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoqWAn3Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2HBW0Be;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61842606A8A1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61842606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MoqWAn3Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2HBW0Be
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH533CX3457899
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=; b=MoqWAn3QvKWC9nmT
	drdvHl0VZOZmUhXL1/U/pZeT7cpOSAMjzgMb32oZ27H1ofLYt4KKkK27zA8RzrgT
	pvZFRoXbjIiRjhmd7zGvMQxzlDdefNKt8iqOOdbrPzl6Q9ypixpyTH8DsTt9jfnD
	wvF794AmFllujsfiEgrm28fzl0K40iPRXPpmaPpdsX6BNax+LGxAdJWSW086GAjP
	XfTp2pSFtM9CZ4p0LwzJs1sglXMnDZoR0nugsASYz3uVH8cgNZHqgzEW0gjrSXnj
	otHXv108+AyrvlwE3dip2urA+7KRmZ2zrUHVxKBiK4luTF9xsafokUErUpmKcjWl
	cYiBxA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8shb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so2566554a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905197; x=1795509997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=J2HBW0BeMarLHQ1KkncouyyRi+0DWQVSvZQFH4YZAfDm9/CUdTwaFu9iX3vzSZ0Ogl
         SqjONRwB4ooafZPUBCPU2R2i3V5/ti3wRhJ3ik+UNTzzkBl6AwgaRqM6AUBMUXg7TOcl
         FNVc2huPUHQ/NJQ4fiXMFHkzQSLYPypZuJ9Gmo5UWljwRMQPrGjsTDaPqWoGBOwFjtMv
         DvJkcoQJPR65vhCkEdvTyQq3rKBmjKLtBRSIg0w0qc5BzS/7eXCfFWBeDz6yvSu9uKf4
         yFE0UOPO/ECA7HQNmjmRImQX2Qi1VdVOu/+AY0cMHEZLDIY3PYgzRPWjvs3ZWVfHUkJ1
         d9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905197; x=1795509997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UjUhHim18Y1ENfy0cYfvSS7Dk4k83F/6rvpnjUDNu4=;
        b=sX1wY7o3w2ft3GO2wDTOMpgbOVSxVjxGlcKuclG0Amnnz5oZNPKV8z7NERwX98F4Qs
         a9Vha/cedA11MRQnLrxGngVk2KT9MaxKNlKYamGrIAM7NYlYl/J2ZuYhb4HhKeJCE5Lb
         Dc8eMKCAiHtz9T6vouFNxIVmWvdq6y5CwNp/fQxtPCuNgLcPey1P8kohfVfEfCmCGsgZ
         HtN/UDJbXGAaz0p28TdrjZBDpeYBN8XRYQNi2FbTiTqARvHLaWmuRfTC8a0xKkcj7nsq
         edKuaVS/iElgVh90F4XrX7bHxTnqokBBFVGDOCknijupSeBAzyxGDVr9uz2nvNB2UGLt
         wWvg==
X-Forwarded-Encrypted: i=1; AL+hErEtvZWxzIp+Yp+syvDPZqUX/26+5Y5tRAYp7lH8RnVQ5EDjKucfrGhigxblV+t4O7eVOzW6LCk6l/FLTeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qrEGOCIid+RW7xhm2iyU+WSrmMMWxbrr/C6SBDXBjplPhvRxp
	qkMPIangug1ZkE1EHaI+5WVf4ms22hZARaPd/tTi/sOl0llhJfb4buHsGDPp3JTDPv3F6p78nsk
	77di5fxxtTeNTgpDqdcs2Zm5uNqbXmQ0qKwB0tEhiZE/mNM4H13+zL7Q3Q9GjKCRHcjY=
X-Gm-Gg: AYBFou1tWTYhwdh1f0T3ZUHzxZNPW6Q/i2Ba+6sO0/ld0BgZNqV2kIcGqpAiFqL6NHI
	x18cj5uRRfsG4UkXTDf2TChEXmF2A8/QddHBIkJ93sGzaR7lLbEicJdr6eAy+pB4rMbNe5B/oce
	haY92y2GYTeDta2bfVjt3cZi5pSl6ppXLx66ov+vnreQikSCd7Ru/mw7P4zY53g4JlSpcGR16tx
	fj61qUr2IeH2z8ZIb46mPAam7z/NWzm90SVJa1FwJYS/+n6LpYuww+Muvw3RdREymIgxDp7xCJE
	bn53HQ8dGZZFoiA/jrhxd+X/YuYHdxxZcTPlW12q8rPZ9AmffdKdJ8GpsMLyoAV6ta0UBEN4s7c
	o07+9mfcqOlMt7HBxo0y33oAKkQ9Ga3IQGOhpqW/DHDm0KYQ70xxQRyMKzQ2aEZQ+bQHmTTx8i5
	rTnA==
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584036637.74.1794905196684;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
X-Received: by 2002:a05:6a21:3d86:b0:3ee:acc6:1c2c with SMTP id adf61e73a8af0-3f7a8fe248fmr9584001637.74.1794905196124;
        Tue, 17 Nov 2026 00:46:36 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:35 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:25 +0530
Subject: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add DLL-bypass
 for PHY-managed RGMII delays
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
Message-Id: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4950;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=AX8IqlmtWAq6HQ6/PrPn+c05+xpAnEZUkXQ4nF3LiBM=;
 b=AJhNItooMl9eFcgP3TOPclVIuGNnQWG9k99zuECq6pbAQBDkgBbYaNiWH7AjWZxUbFpRFCcjR
 tTtLBl/Fue5CfSXNNvRX+1WWUwBq7wfQ1dNRGEvcPnAOkWvv+cm/pX8
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: mMvEI4uuAmyKg4wTXpUnGz06exTxhwOh
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc146e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: mMvEI4uuAmyKg4wTXpUnGz06exTxhwOh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX7JyryDCche//
 mPVsfChsBMKIY3ifWo/OP386CcFoV9QtjDAhYHGFTZsXk/KngKknA4rdqDBTPrOkvUpmjQoefLm
 jvUmj8nbIvza+5fNUnlyQFs4u8vEXIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXyxL3m91ohHEV
 lQUHtkAWz+PQxm0Wan1j5ZrC3hr0h+qTUHcToW/KA/gMeJJRak/y9Wez/a+CQZKIiw3olifJJM6
 pC+O0mA9HPDtscTX0SPHO1lMsd+V/fmUKxH0ykfxXHucoMoF5QdDCs/AOhh8CniJtFEUfXoMh0k
 Poh125RGwTxmUzL3JYbJG2Kq0Vcvil5WTJ/9tw0gBCIjoAPIdL4pqT+djay9zcy84YAsuL3iRAV
 4f9cSguLRZfaHEQBbvQM7/C75Em/De3OQ1JnkW4XAPdhKfmfhhUZPGDqB5tQ+FGvP/RCVwDY8XN
 B83wPYnOpaAJ/9n40FHmEW1ZSIR/gTJV/5mfDRE7Xk0pu3DXwEblqHYgCaDKTRdbjKp6RZoBrbv
 ifryXmXcAa88mNV5Xg6tO7x/Dp2vBXCj2cUJ5vzArr0bS1WPt//w39893t3ADXjo/mTWdyRYgGu
 fNMNSX+JTsawj2W2lQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M.

This new programming is guarded by a boolean set by the platform
descriptors. No change intended on existing platforms.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: protect this programming sequence by a boolean flag and reword the
commit message.
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 72 +++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f2428f0467bb..99ea7e0cfb00 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -68,6 +68,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -93,6 +96,7 @@ struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
 	bool rgmii_config_loopback_en;
+	bool phy_managed_delays;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
@@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -515,6 +527,58 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
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
+	if (ethqos->data->has_emac_ge_3)
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
+	if (ethqos->data->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
+static void ethqos_configure_rgmii_id(struct qcom_ethqos *ethqos, int speed)
+{
+	ethqos_set_func_clk_en(ethqos);
+
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+	ethqos_rgmii_id_macro_init(ethqos, speed);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -524,6 +588,12 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	unsigned int i;
 	u32 val;
 
+	if (ethqos->data->phy_managed_delays &&
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		ethqos_configure_rgmii_id(ethqos, speed);
+		return;
+	}
+
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */

-- 
2.34.1


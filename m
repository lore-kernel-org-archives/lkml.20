Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D245D92D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141036; cv=none; b=uFbCa/vHqqnvIPgod1AkmXlbk6Vb5f/beBLJHHcfUXzCK6Svf/fTExB6qbE8Z5lvDs+D9Y1edmbb4V89BIDajKWgaiSNn+896hrz9OiCGsq0lAr/auMh66Y4Bd2Fh14yd3W2i0ezMUrCE12Qb5I3XBdpJ0c+Gd8MEdK0c3Zlrtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141036; c=relaxed/simple;
	bh=IPjSkt3PCF0vtQrr5Dtr9Zztzvn/FEISEEiFCwtJgTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxNLB9c/h9IVMd5AK2Nw/e6jm1VHK/fJGXRugiLaGoGNHk7fobKXcfdCETBsijFyupqo9pr4pVI7oAy67+tbiZ5qKNwOHwQkbOP1XnMA5lIq8Zv5sJjgUOM+CpbciPhy5Ygqy6xWe/ykO1lJpJzShdI4ack634jaXBHVA0P7Eb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anZVVHEt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anZVVHEt"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccb5faf0678so418391a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141033; x=1792745833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNyA/z7td/ZZEWzKBQtafTkI4NohfegPcynGQCsoHnk=;
        b=anZVVHEtg9jOVifTpuAavFFiWwTGna8ak5zThdP3gfmVMq3B8DZv4q6oMvwpIpUuzI
         /xkx2N76cI/IL4LbweZgOAeWacdCqApVR/cwd1MWjQyesi1T/oHuts/cessg905Y2vg5
         RBL9O1uzN536F48PIa1XfXrj7+ZLO2TnHNDhjlgvmYQ5bGnBp5VSokfJpUe6YS5FY3+6
         d6DkyrMeVgWRZHJAoUFLR56BInEPS4wogMtl7qmNEvsVGHZQk+PCLDef46gUathnG89T
         NXWDa/fhPHkafN4QGe5FxKlprTeAoDwvf+WRay294uTvGNxPtBfNILx71v4vb+fDyiMt
         uZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141033; x=1792745833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNyA/z7td/ZZEWzKBQtafTkI4NohfegPcynGQCsoHnk=;
        b=1F6JmOe2n/zcWGKerKnFjgYDos6v5+SwU9saphg4ldbIcr5kw5wkysFqjZTrIwRSOl
         lGAN2HqUFrHzpt9pxU7sPPs+mPLsVtKeGk06g1+QJ/MdiqekwLPWb2NNvYo5E/f0v6vS
         EOaNMuoWBjoobnRNPW4Kh0A3ItF6B2PbKM1s2/nieeio0y4ivctHsnkOqC9yUTAKN0Jc
         WPvd+ZG4AG7vG7fJFAZM8tBTr+J2ErYmqxNjDu7F+I6tdozx6W50kUyLDYYIZeQ04xVv
         Omnry/1C+tL2mmBSMWCNj5wUSRPd7CKDoz8Jqkn8n1DIJfKmmJM0N35eBfSeT4rAGaux
         VqlA==
X-Forwarded-Encrypted: i=1; AKwUvBzpVL+GAIbWuXB4KhnnHijwAv4f2/8/wcGuBgIUmd5KtPU9fykMmDANNUY1UG4UkbTs//LrVSQ3GZYaVvo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgsN+WFtu1SVsB6i9TaEC8nsJ6Io/vNjiLsdy0TW4wNUJgJ5Fm
	IQs35guIjgNZg4FYWh8bQrm/YpHpVAzeQ+xmE490BkqPFtI6u4ZuwNW0
X-Gm-Gg: AYBFou12iTQpJYig8zHt+ZM5JJBVAd3ZWQrRyvPbzLZY2IFH1f6gZaZjsNwFsy6n769
	h1APpmg/nMjh9yf6g0FqV2VgVVJbUGubVSnWFXTos8uAaLC9BRQuIfxgK0BB3R6ew4q/6XL0B7F
	vzdb4kwNdm5sSbaxlKQJeHlCVfnHjygiHnod55XFCpHdFv6nbax4HfMdMDPvyCUnIqT6FrPG5Y3
	eg5eOlvANqsAaLF5gJsb3hvWp34d/xGOOhuWR9OXaEwPAwJ/h9+AMjd6ERSb6RFLUrGG2W1eObi
	t6sVTeneqAAd3EmY1sYgcQ+bVH0lpYjP8x8ZAS8y/wF/WcB81zA9E53BkX/dwYvSFTRezUmGUGY
	fpx4sR919vP/Bobb/LRN8mtNiMeoaJQz3UaDjU7XG3hhP0TmOT2BeFjOdEgbeUMVzc9bW9NTF3U
	arJS0TtlLTDaJNuuePzcocJG9e8DeMBiBoBYWeKR7DDOjiLyGyCF9DUl7x82243DH7MSDspsbgx
	KYWFh26tz/J1npRu9X8oWnDaZw+IrMaGnRwUbTI
X-Received: by 2002:a17:903:38c8:b0:2e9:5c29:9955 with SMTP id d9443c01a7336-2e95c299af1mr72899235ad.4.1792141032260;
        Fri, 16 Oct 2026 01:57:12 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e882a20sm6971025ad.62.2026.10.16.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:57:11 -0700 (PDT)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 16 Oct 2026 16:56:40 +0800
Subject: [PATCH v5 6/8] phy: rockchip-samsung-dcphy: Add MIPI D-PHY
 receiver support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-dcphy-rx-v1-v5-6-e63b49eabe2d@gmail.com>
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141002; l=16449;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=IPjSkt3PCF0vtQrr5Dtr9Zztzvn/FEISEEiFCwtJgTg=;
 b=gdw4pLjN5y70FSvMahC5Vce4W18XOCe8Gc0dj+irW8177PIq9Kwi0b7Ly4515GRaLsql/conU
 mADkcnud5L8Aca3hRUK6tLj/6kNDuEWHm6Iix9pvV/lvaIi4mYP0QiI
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

Add the receiver half of the block, so a MIPI CSI-2 camera can use the
same PHY that already drives a MIPI DSI output on RK3588. It follows the
receiver start-up sequence in the RK3588 TRM [1]. The HS-RX settle values
come from the RK3588 vendor kernel.

The initial deskew calibration that the D-PHY specification asks for
above 1.5 Gbps is not implemented; the vendor kernel programs it from
RK3576 onwards only.

Tested on RK3588 with an IMX219 on the receiver and a DSI panel on the
transmitter of the same PHY.

[1] RK3588 TRM: sections 22.6.3 (receiver start-up) and 22.6.4.3
    (worked receiver example)

Assisted-by: LLM
Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 390 +++++++++++++++++++++-
 1 file changed, 387 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 316d4c4d49c1..54a7af610282 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -244,6 +244,63 @@
 #define T_TA_GET(x)		FIELD_PREP(GENMASK(7, 4), x)
 #define T_TA_GO(x)		FIELD_PREP(GENMASK(3, 0), x)
 
+/* D-PHY receiver registers (clock lane + four data lanes) */
+#define DPHY_SC_GNR_CON0	0x0b00
+#define DPHY_SC_GNR_CON1	0x0b04
+#define DPHY_SC_ANA_CON1	0x0b0c
+#define HS_RX_BIAS_CON(x)	FIELD_PREP(GENMASK(15, 11), x)
+#define DPHY_SC_ANA_CON2	0x0b10
+#define HS_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define DPHY_SC_ANA_CON3	0x0b14
+#define ULPS_HYS_SW_DPHY(x)	FIELD_PREP(GENMASK(10, 8), x)
+#define DPHY_SC_TIME_CON0	0x0b30
+#define T_CLK_SETTLE(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define T_CLK_MISS(x)		FIELD_PREP(GENMASK(11, 8), x)
+#define COMBO_SD0_GNR_CON0	0x0c00
+#define COMBO_SD0_GNR_CON1	0x0c04
+#define COMBO_SD0_ANA_CON1	0x0c0c
+#define COMBO_SD0_ANA_CON2	0x0c10
+#define SKEW_DLYSEL(x)		FIELD_PREP(GENMASK(9, 8), x)
+#define RX_TERM_SW(x)		FIELD_PREP(GENMASK(2, 0), x)
+#define COMBO_SD0_ANA_CON3	0x0c14
+#define SEL_ESCPOL		BIT(11)
+#define LP_HYS_SW(x)		FIELD_PREP(GENMASK(5, 4), x)
+#define COMBO_SD0_ANA_CON7	0x0c24
+#define CLK_DBL_CTRL(x)		FIELD_PREP(GENMASK(7, 6), x)
+#define COMBO_SD0_TIME_CON0	0x0c30
+#define T_HS_SETTLE(x)		FIELD_PREP(GENMASK(7, 0), x)
+#define SETTLE_CLK_SEL		BIT(8)
+#define COMBO_SD0_TIME_CON1	0x0c34
+#define T_ERR_SOT_SYNC(x)	FIELD_PREP(GENMASK(7, 0), x)
+#define COMBO_SD0_DESKEW_CON2	0x0c48
+#define SKEW_CAL_CLK_COARSE_SET(x) FIELD_PREP(GENMASK(4, 0), x)
+#define COMBO_SD1_GNR_CON0	0x0d00
+#define COMBO_SD1_GNR_CON1	0x0d04
+#define COMBO_SD1_ANA_CON1	0x0d0c
+#define COMBO_SD1_ANA_CON2	0x0d10
+#define COMBO_SD1_ANA_CON3	0x0d14
+#define COMBO_SD1_ANA_CON7	0x0d24
+#define COMBO_SD1_TIME_CON0	0x0d30
+#define COMBO_SD1_TIME_CON1	0x0d34
+#define COMBO_SD1_DESKEW_CON2	0x0d48
+#define COMBO_SD2_GNR_CON0	0x0e00
+#define COMBO_SD2_GNR_CON1	0x0e04
+#define COMBO_SD2_ANA_CON1	0x0e0c
+#define COMBO_SD2_ANA_CON2	0x0e10
+#define COMBO_SD2_ANA_CON3	0x0e14
+#define COMBO_SD2_ANA_CON7	0x0e24
+#define COMBO_SD2_TIME_CON0	0x0e30
+#define COMBO_SD2_TIME_CON1	0x0e34
+#define COMBO_SD2_DESKEW_CON2	0x0e48
+#define DPHY_SD3_GNR_CON0	0x0f00
+#define DPHY_SD3_GNR_CON1	0x0f04
+#define DPHY_SD3_ANA_CON1	0x0f0c
+#define DPHY_SD3_ANA_CON2	0x0f10
+#define DPHY_SD3_ANA_CON3	0x0f14
+#define DPHY_SD3_TIME_CON0	0x0f30
+#define DPHY_SD3_TIME_CON1	0x0f34
+#define DPHY_SD3_DESKEW_CON2	0x0f48
+
 /* MIPI_CDPHY_GRF registers */
 #define MIPI_DCPHY_GRF_CON0		0x0000
 #define S_CPHY_MODE			FIELD_PREP_WM16(BIT(3), 1)
@@ -283,6 +340,7 @@ struct samsung_mipi_dcphy_plat_data {
 struct samsung_mipi_phy {
 	struct phy *phy;
 	unsigned int lanes;
+	unsigned long long hs_clk_rate;
 };
 
 struct samsung_mipi_dcphy {
@@ -979,6 +1037,260 @@ struct samsung_mipi_dphy_timing samsung_mipi_dphy_timing_table[] = {
 	{  80,  2,   0,  0, 28,  5,  0, 22,  2,  0,  5},
 };
 
+/* D-PHY receiver HS-RX configuration lookup */
+struct samsung_mipi_dphy_rx_hsfreq_range {
+	u32 range_h_mbps;
+	u16 cfg_bit;
+};
+
+/*
+ * HS RX settle values taken verbatim from the rk3588 vendor kernel.
+ * The TRM defines these fields but defers the per-data-rate table to a
+ * timing supplement. Each cfg_bit is a pre-combined SETTLE_CLK_SEL |
+ * T_HS_SETTLE value for the data-lane TIME_CON0: bit 8 selects the
+ * divide-by-2 settle clock below 1500 Mbps per the TRM (the vendor
+ * table switches one bucket early, at 1490 Mbps, and is kept
+ * unchanged). The TRM marks bit 8 read-only, but the vendor kernel has
+ * always programmed it. Sorted by .range_h_mbps ascending.
+ */
+static const struct samsung_mipi_dphy_rx_hsfreq_range samsung_mipi_dphy_rx_hsfreq_ranges[] = {
+	{   80, 0x105 }, {  100, 0x106 }, {  120, 0x107 }, {  140, 0x108 },
+	{  160, 0x109 }, {  180, 0x10a }, {  200, 0x10b }, {  220, 0x10c },
+	{  240, 0x10d }, {  270, 0x10e }, {  290, 0x10f }, {  310, 0x110 },
+	{  330, 0x111 }, {  350, 0x112 }, {  370, 0x113 }, {  390, 0x114 },
+	{  410, 0x115 }, {  430, 0x116 }, {  450, 0x117 }, {  470, 0x118 },
+	{  490, 0x119 }, {  510, 0x11a }, {  540, 0x11b }, {  560, 0x11c },
+	{  580, 0x11d }, {  600, 0x11e }, {  620, 0x11f }, {  640, 0x120 },
+	{  660, 0x121 }, {  680, 0x122 }, {  700, 0x123 }, {  720, 0x124 },
+	{  740, 0x125 }, {  760, 0x126 }, {  790, 0x127 }, {  810, 0x128 },
+	{  830, 0x129 }, {  850, 0x12a }, {  870, 0x12b }, {  890, 0x12c },
+	{  910, 0x12d }, {  930, 0x12e }, {  950, 0x12f }, {  970, 0x130 },
+	{  990, 0x131 }, { 1010, 0x132 }, { 1030, 0x133 }, { 1060, 0x134 },
+	{ 1080, 0x135 }, { 1100, 0x136 }, { 1120, 0x137 }, { 1140, 0x138 },
+	{ 1160, 0x139 }, { 1180, 0x13a }, { 1200, 0x13b }, { 1220, 0x13c },
+	{ 1240, 0x13d }, { 1260, 0x13e }, { 1280, 0x13f }, { 1310, 0x140 },
+	{ 1330, 0x141 }, { 1350, 0x142 }, { 1370, 0x143 }, { 1390, 0x144 },
+	{ 1410, 0x145 }, { 1430, 0x146 }, { 1450, 0x147 }, { 1470, 0x148 },
+	{ 1490, 0x149 }, { 1580, 0x007 }, { 1740, 0x008 }, { 1910, 0x009 },
+	{ 2070, 0x00a }, { 2240, 0x00b }, { 2410, 0x00c }, { 2570, 0x00d },
+	{ 2740, 0x00e }, { 2910, 0x00f }, { 3070, 0x010 }, { 3240, 0x011 },
+	{ 3410, 0x012 }, { 3570, 0x013 }, { 3740, 0x014 }, { 3890, 0x015 },
+	{ 4070, 0x016 }, { 4240, 0x017 }, { 4400, 0x018 }, { 4500, 0x019 },
+};
+
+static int samsung_mipi_dphy_rx_lookup_hsfreq(u32 lane_mbps, u16 *cfg_bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(samsung_mipi_dphy_rx_hsfreq_ranges); i++) {
+		if (lane_mbps <= samsung_mipi_dphy_rx_hsfreq_ranges[i].range_h_mbps) {
+			*cfg_bit = samsung_mipi_dphy_rx_hsfreq_ranges[i].cfg_bit;
+			return 0;
+		}
+	}
+
+	return -ERANGE;
+}
+
+/* SKEW_DLYSEL per data rate, from the RK3588 TRM ANA_CON2 description */
+static u32 samsung_mipi_dphy_rx_data_lane_dlysel(u32 lane_mbps)
+{
+	if (lane_mbps < 1500)
+		return 0;
+	if (lane_mbps < 2000)
+		return SKEW_DLYSEL(3);
+	if (lane_mbps < 3000)
+		return SKEW_DLYSEL(2);
+	if (lane_mbps < 4000)
+		return SKEW_DLYSEL(1);
+	return 0;
+}
+
+/*
+ * Per-data-lane register bases, indexed by lane number. The clock lane
+ * shares the same block spacing but is programmed separately: its
+ * TIME_CON0 holds T_CLK_SETTLE/T_CLK_MISS rather than the per-rate
+ * T_HS_SETTLE/SETTLE_CLK_SEL, and it has no deskew configuration.
+ */
+static const u32 rx_data_lane_gnr_con0[] = {
+	COMBO_SD0_GNR_CON0, COMBO_SD1_GNR_CON0,
+	COMBO_SD2_GNR_CON0, DPHY_SD3_GNR_CON0,
+};
+
+static const u32 rx_data_lane_gnr_con1[] = {
+	COMBO_SD0_GNR_CON1, COMBO_SD1_GNR_CON1,
+	COMBO_SD2_GNR_CON1, DPHY_SD3_GNR_CON1,
+};
+
+static const u32 rx_lane_time_con0[] = {
+	COMBO_SD0_TIME_CON0, COMBO_SD1_TIME_CON0,
+	COMBO_SD2_TIME_CON0, DPHY_SD3_TIME_CON0,
+};
+
+static const u32 rx_lane_time_con1[] = {
+	COMBO_SD0_TIME_CON1, COMBO_SD1_TIME_CON1,
+	COMBO_SD2_TIME_CON1, DPHY_SD3_TIME_CON1,
+};
+
+/*
+ * These RX analog tuning values come from the vendor kernel. The
+ * termination (RX_TERM_SW/HS_TERM_SW = 2) is the 96.6 ohm setting the
+ * TRM ANA_CON2 value list annotates as the default, although the
+ * register itself resets to 102 ohm. Data lane 0 differs on purpose:
+ * the vendor's default receive profile applies the LP hysteresis and
+ * the swapped escape clock polarity to lane 0 only, and no manual
+ * skew-calibration delay there against three 30 ps steps on the other
+ * lanes. Data lane 3 is a plain D-PHY lane with no ANA_CON7, so it
+ * gets no CLK_DBL_CTRL write.
+ */
+static void samsung_mipi_dphy_rx_config_common(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 dlysel = samsung_mipi_dphy_rx_data_lane_dlysel(div_u64(rx->hs_clk_rate,
+								   1000000));
+	u32 ana_con2_common = dlysel | RX_TERM_SW(2);
+
+	/* Clock lane */
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON1, HS_RX_BIAS_CON(0x10));
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON2, HS_TERM_SW(2));
+	regmap_write(samsung->regmap, DPHY_SC_ANA_CON3, ULPS_HYS_SW_DPHY(6));
+
+	/* Data lane 0; a zero lane count is rejected at power-on */
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON1, HS_RX_BIAS_CON(0x10));
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON2, ana_con2_common);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON3,
+		     ULPS_HYS_SW_DPHY(6) | LP_HYS_SW(3) | SEL_ESCPOL);
+	regmap_write(samsung->regmap, COMBO_SD0_ANA_CON7, CLK_DBL_CTRL(1));
+	regmap_write(samsung->regmap, COMBO_SD0_DESKEW_CON2,
+		     SKEW_CAL_CLK_COARSE_SET(0));
+
+	/* Data lane 1 */
+	if (rx->lanes > 1) {
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON1,
+			     HS_RX_BIAS_CON(0x10));
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON3,
+			     ULPS_HYS_SW_DPHY(6));
+		regmap_write(samsung->regmap, COMBO_SD1_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD1_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	/* Data lane 2 */
+	if (rx->lanes > 2) {
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON1,
+			     HS_RX_BIAS_CON(0x10));
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON3,
+			     ULPS_HYS_SW_DPHY(6));
+		regmap_write(samsung->regmap, COMBO_SD2_ANA_CON7,
+			     CLK_DBL_CTRL(1));
+		regmap_write(samsung->regmap, COMBO_SD2_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+
+	/* Data lane 3 */
+	if (rx->lanes > 3) {
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON1,
+			     HS_RX_BIAS_CON(0x10));
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON2,
+			     ana_con2_common);
+		regmap_write(samsung->regmap, DPHY_SD3_ANA_CON3,
+			     ULPS_HYS_SW_DPHY(6));
+		regmap_write(samsung->regmap, DPHY_SD3_DESKEW_CON2,
+			     SKEW_CAL_CLK_COARSE_SET(3));
+	}
+}
+
+static int samsung_mipi_dphy_rx_config_settle(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	u32 lane_mbps = div_u64(rx->hs_clk_rate, 1000000);
+	unsigned int i;
+	u16 cfg_bit;
+	int ret;
+
+	ret = samsung_mipi_dphy_rx_lookup_hsfreq(lane_mbps, &cfg_bit);
+	if (ret) {
+		dev_err(samsung->dev, "no RX hsfreq cfg for %u Mbps\n",
+			lane_mbps);
+		return ret;
+	}
+
+	/*
+	 * Clock-lane settle uses the fixed value from the TRM RX bring-up
+	 * example, unlike the per-rate data-lane settle below.
+	 */
+	regmap_write(samsung->regmap, DPHY_SC_TIME_CON0,
+		     T_CLK_SETTLE(0x01) | T_CLK_MISS(0x03));
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_update_bits(samsung->regmap, rx_lane_time_con0[i],
+				   T_HS_SETTLE(0xff) | SETTLE_CLK_SEL, cfg_bit);
+		regmap_update_bits(samsung->regmap, rx_lane_time_con1[i],
+				   T_ERR_SOT_SYNC(0xff), T_ERR_SOT_SYNC(0x03));
+	}
+
+	return 0;
+}
+
+static void samsung_mipi_dphy_rx_lane_disable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE, 0);
+	for (i = 0; i < rx->lanes; i++)
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, 0);
+}
+
+static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	unsigned int i;
+	u32 sts;
+	int ret;
+
+	regmap_write(samsung->regmap, DPHY_SC_GNR_CON1, T_PHY_READY(0x1450));
+	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0,
+			   PHY_ENABLE, PHY_ENABLE);
+
+	for (i = 0; i < rx->lanes; i++) {
+		regmap_write(samsung->regmap, rx_data_lane_gnr_con1[i],
+			     T_PHY_READY(0x1450));
+		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
+				   PHY_ENABLE, PHY_ENABLE);
+	}
+
+	ret = regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON0,
+				       sts, sts & PHY_READY, 200, 4000);
+	if (ret) {
+		dev_err(samsung->dev, "RX clock lane not ready\n");
+		goto err_lane_disable;
+	}
+
+	for (i = 0; i < rx->lanes; i++) {
+		ret = regmap_read_poll_timeout(samsung->regmap,
+					       rx_data_lane_gnr_con0[i],
+					       sts, sts & PHY_READY,
+					       200, 2000);
+		if (ret) {
+			dev_err(samsung->dev, "RX data lane %u not ready\n", i);
+			goto err_lane_disable;
+		}
+	}
+
+	return 0;
+
+err_lane_disable:
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+	return ret;
+}
+
 static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, BIAS_CON0, I_DEV_DIV_6 | I_RES_100_2UA);
@@ -988,6 +1300,55 @@ static void samsung_mipi_dcphy_bias_block_enable(struct samsung_mipi_dcphy *sams
 						 REG_400M_400MV | REG_645M_645MV);
 }
 
+static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *samsung)
+{
+	struct samsung_mipi_phy *rx = &samsung->rx;
+	int ret;
+
+	if (!rx->hs_clk_rate || !rx->lanes)
+		return -EINVAL;
+
+	reset_control_assert(samsung->s_phy_rst);
+
+	/* default output voltage select:
+	 * dphy: 400mv
+	 * cphy: 530mv
+	 */
+	regmap_update_bits(samsung->regmap, BIAS_CON4,
+			   I_MUX_SEL_MASK, I_MUX_400MV);
+
+	samsung_mipi_dphy_rx_config_common(samsung);
+
+	ret = samsung_mipi_dphy_rx_config_settle(samsung);
+	if (ret)
+		goto out_deassert;
+
+	ret = samsung_mipi_dphy_rx_lane_enable(samsung);
+
+out_deassert:
+	reset_control_deassert(samsung->s_phy_rst);
+
+	return ret;
+}
+
+static int samsung_mipi_dphy_rx_power_off(struct samsung_mipi_dcphy *samsung)
+{
+	reset_control_assert(samsung->s_phy_rst);
+
+	samsung_mipi_dphy_rx_lane_disable(samsung);
+
+	reset_control_deassert(samsung->s_phy_rst);
+
+	/*
+	 * Let the lanes settle out of reset before the receiver may be
+	 * brought up again. The delay follows the vendor driver; the TRM
+	 * does not document a teardown sequence.
+	 */
+	usleep_range(500, 1000);
+
+	return 0;
+}
+
 static void samsung_mipi_dphy_tx_lane_enable(struct samsung_mipi_dcphy *samsung)
 {
 	regmap_write(samsung->regmap, DPHY_MC_GNR_CON1, T_PHY_READY(0x2000));
@@ -1516,17 +1877,40 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
 static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
 					   union phy_configure_opts *opts)
 {
-	return -EOPNOTSUPP;
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	samsung->rx.lanes = opts->mipi_dphy.lanes > 4 ? 4 : opts->mipi_dphy.lanes;
+
+	/* The sensor supplies the link clock, so the PLL stays off. */
+	samsung->rx.hs_clk_rate = opts->mipi_dphy.hs_clk_rate;
+
+	return 0;
 }
 
 static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
 {
-	return -EOPNOTSUPP;
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_on(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
 }
 
 static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
 {
-	return -EOPNOTSUPP;
+	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
+
+	switch (samsung->type) {
+	case PHY_TYPE_DPHY:
+		return samsung_mipi_dphy_rx_power_off(samsung);
+	default:
+		/* CPHY part to be implemented later */
+		return -EOPNOTSUPP;
+	}
 }
 
 static const struct phy_ops samsung_mipi_dcphy_tx_ops = {

-- 
2.43.0


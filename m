Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A48487CCA;
	Fri, 16 Oct 2026 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173848; cv=none; b=b/oXCjM+vq+T8wUNWEJ91gsu45qPOW22A8MhPeXqmN2PkEpiToqZTKWZncErrj60T9Kc9f9BSGpbyDJ5Sh96dfNC6tAUhWsMGh1bpbPOA2xrHoyi5yKwfTvMNX9FpjJU7izpuu6XbMR04E+zggakvDdLzDdMlEfSJEX+TKwRLIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173848; c=relaxed/simple;
	bh=yxRNx5wl1YPr7B1V2d575Su9IThyVQUOF8kXcNAj7CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYiLWnJ0M1psdX3psltmBmIzggWDTL+/yd5BFj4tykmC415p0RN+SzfKyeYlyUv68Yhs0z7eT7+S0bT88Y7S7K9bOkJ/Enf3jyUiVAkSiz6VrtGlW17Iive7GXDmaGhg8qT2fMKdSOCXMqeBv+NywLoiVQ57qOkrAhaHsZspQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BioUEaxQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BioUEaxQ"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 82E7482BF1;
	Fri, 16 Oct 2026 20:04:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzjqcJvGXaMd; Fri, 16 Oct 2026 20:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792173843; bh=yxRNx5wl1YPr7B1V2d575Su9IThyVQUOF8kXcNAj7CE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BioUEaxQMiJyyegGhVeERNOt7I5Ppl8GtF7tu2gxL+8c/BkOMUl8Xd932PsSBAfpr
	 GdJun+bgKkneTOhbDHHIeLoWjDvA1WsXkEfyJ6YwOPXMFVakIWadG06kc+2VEpLElS
	 hsV7ndK4uEeVvlFqQdnRft5ZjL3+Xv8PTMYqOZRcRj5IDqV4Kf7qRZIbJEsNaty+du
	 SAdGhxYjbmyJP/CjO968saxtfZFd/iqug6kHUu0OlyBZo+ZLjjW0MlVuOu8PEQTXOi
	 Gjt6OSpGAzUNmC8A+MiErpUSsso0wA5DALznhkkSgOK3+2JsGoJ8zSf31Cj4W2cKmr
	 zHp952JF15n3A==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v9 5/6] phy: realtek: usb2: add support for RTL9607C USB2 PHY
Date: Fri, 16 Oct 2026 23:03:13 +0500
Message-ID: <20261016180314.31760-6-adilov@disroot.org>
In-Reply-To: <20261016180314.31760-1-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the usb2 phy of RTL9607C series based SoCs.
Add the macros and phy config struct for rtl9607.

RTL9607C requires to clear a "force host disconnect" bit in the
specific register (which is at an offset from reg_wrap_vstatus)
before proceeding with phy parameter writes. Since it belongs into
the vstatus register region, it requires the use of added read and
write helper functions.

Add the bool variable to the driver data struct and hide this whole
procedure under the if statement that checks this new variable.

Add the appropriate big endian read and write functions for rtl9607
and assign them to its rtl9607_phy_reg_desc struct.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 2ddad7be7353..64076938c821 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -26,6 +26,12 @@
 #define PHY_VCTRL_SHIFT 8
 #define PHY_REG_DATA_MASK 0xff
 
+#define PHY_9607_VSTS_BUSY BIT(17)
+#define PHY_9607_NEW_REG_REQ BIT(13)
+
+#define PHY_9607_FORCE_DISCONNECT_REG 0x10
+#define PHY_9607_FORCE_DISCONNECT_BIT BIT(5)
+
 #define GET_LOW_NIBBLE(addr) ((addr) & 0x0f)
 #define GET_HIGH_NIBBLE(addr) (((addr) & 0xf0) >> 4)
 
@@ -107,6 +113,7 @@ struct phy_cfg {
 	bool use_default_parameter;
 	bool is_double_sensitivity_mode;
 	const struct phy_reg_desc *reg_desc;
+	bool force_host_disconnect;
 };
 
 struct phy_parameter {
@@ -144,6 +151,16 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static u32 rtk_usb2phy_read_be(void __iomem *reg)
+{
+	return ioread32be(reg);
+}
+
+static void rtk_usb2phy_write_be(u32 val, void __iomem *reg)
+{
+	iowrite32be(val, reg);
+}
+
 /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
 static inline int page_addr_to_array_index(u8 addr)
 {
@@ -600,6 +617,23 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
 		goto do_toggle;
 	}
 
+	if (phy_cfg->force_host_disconnect) {
+		const struct phy_reg_desc *reg_desc = phy_reg->desc;
+		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
+		u32 temp;
+
+		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		/* disable force-host-disconnect */
+		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
+
+		reg_desc->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		/* allow IP to startup */
+		usleep_range(10000, 11000);
+	}
+
 	/* Set page 0 */
 	phy_data_page = phy_cfg->page0;
 	rtk_phy_set_page(phy_reg, 0);
@@ -1109,6 +1143,14 @@ static const struct phy_reg_desc rtd_phy_reg_desc = {
 	.write = rtk_usb2phy_write,
 };
 
+static const struct phy_reg_desc rtl9607_phy_reg_desc = {
+	.vstatus_offset = 0xc,
+	.vstatus_busy = PHY_9607_VSTS_BUSY,
+	.new_reg_req = PHY_9607_NEW_REG_REQ,
+	.read = rtk_usb2phy_read_be,
+	.write = rtk_usb2phy_write_be,
+};
+
 static const struct phy_cfg rtd1295_phy_cfg = {
 	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
 	.page0 = { [0] = {0xe0, 0x90},
@@ -1342,6 +1384,29 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.reg_desc = &rtd_phy_reg_desc,
 };
 
+static const struct phy_cfg rtl9607_phy_cfg = {
+	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
+	.page0 = { [0] = {0xe0, 0x95},
+		   [4] = {0xe4, 0x6a},
+		  [11] = {0xf3, 0x31}, },
+	.page1_size = MAX_USB_PHY_PAGE1_DATA_SIZE,
+	.page1 = { [0] = {0xe0, 0x26}, },
+	.page2_size = MAX_USB_PHY_PAGE2_DATA_SIZE,
+	.page2 = { [7] = {0xe7, 0x33}, },
+	.num_phy = 1,
+	.check_efuse_version = CHECK_EFUSE_V2,
+	.efuse_dc_driving_rate = EFUS_USB_DC_CAL_RATE,
+	.dc_driving_mask = 0x1f,
+	.efuse_dc_disconnect_rate = EFUS_USB_DC_DIS_RATE,
+	.dc_disconnect_mask = 0xf,
+	.usb_dc_disconnect_at_page0 = true,
+	.do_toggle = true,
+	.driving_updated_for_dev_dis = 0x8,
+	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtl9607_phy_reg_desc,
+	.force_host_disconnect = true,
+};
+
 static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1295-usb2phy", .data = &rtd1295_phy_cfg },
 	{ .compatible = "realtek,rtd1312c-usb2phy", .data = &rtd1312c_phy_cfg },
@@ -1352,6 +1417,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
 	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
 	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
+	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
-- 
2.56.0


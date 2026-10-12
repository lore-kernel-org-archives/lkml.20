Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93874C10DD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826707; cv=none; b=NwYUD0ujz/UxXI4hiDcdP3a2N3t6uwjQpUZTokoxZRQ4pSbvcYNY/RKvKZAMm3Ljsxh4E2zG2AfvV6gLA59msfl2iTJbrCCuiBh8VgxirfqAaqxe7uKb+MpgfP1bp9D/v+sngYxqoIzQ53R/Q6NoVdLIEchJ6I4zk+C/CPs3Zoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826707; c=relaxed/simple;
	bh=fVQMgeTLx8KcVX1xPfKLjt+HrX6nxP5c9F51tQGpjbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILiyHXipHqrfuWoN4M5Vav+LqGD1PRqJ7PsDps6LPbJQAgT7I3sFHMGQr3h8YiIuJZSMmu1N1DwS9w0+9C1tPHzl1TkL3Pn+x9Dh2BaR7Zy5LEWuejEAR1AyGm/BFz2Yc3fteHj9VFLzgTDcvRM0F4YniTkXQd0jj7aqcqFqQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BNVHWLmu; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BNVHWLmu"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1380582C3F;
	Mon, 12 Oct 2026 19:38:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc68SP68jDjs; Mon, 12 Oct 2026 19:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791826701; bh=fVQMgeTLx8KcVX1xPfKLjt+HrX6nxP5c9F51tQGpjbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BNVHWLmuNlcUeFGhD56/0d32iNtoVXuGuPXXwoTZFppRZDqt6Q+uID4fK6e2qZmZQ
	 kbhsNf0+bSTViTsmCY4mADK60LKQqvI6iGVwF/aDxwCyx87tKvUd/mLtnlXQfil+OJ
	 cUhRxOstb8zBMJ8mRLi259EnqaF3VGB2UmmgA4sszcy1nvPtoIxemwrz1zy2TMvQmb
	 +QzD1jH4ndRX7WIjhdYZ0Tqk3yDjscAiDGrYq2yjx8uP8XQIElBLtFvNh5u+dQnHFp
	 wkD3Ev68Uw4yJXvxYXTOxE7ofEE3FJ95surAfVdmsSroGmogPG2JvODEYHj0QFkRt/
	 TQObd7ND4JCCQ==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v8 1/6] phy: realtek: usb2: introduce phy_reg_desc struct to the driver
Date: Mon, 12 Oct 2026 22:37:34 +0500
Message-ID: <20261012173739.36377-2-adilov@disroot.org>
In-Reply-To: <20261012173739.36377-1-adilov@disroot.org>
References: <20261012173739.36377-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In RTL9607C SoC, there are a few differences in usb2 phy compared
to existing RTD SoCs, like vstatus register is at certain offset
from the base, busy bit and new_reg_req bit are at different bits
of the register.

To avoid duplicating these variables across phy cfg and driver data,
create a per-SoC struct that would hold them and with that add the
default rtd_phy_reg_desc to which all RTD SoCs driver data will
point towards.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 59 ++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..e8d0f0119ec0 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -60,10 +60,17 @@
 #define DEFAULT_DC_DISCONNECTION_VALUE (0x6)
 #define HS_CLK_SELECT BIT(6)
 
+struct phy_reg_desc {
+	int vstatus_offset;
+	u32 vstatus_busy;
+	u32 new_reg_req;
+};
+
 struct phy_reg {
 	void __iomem *reg_wrap_vstatus;
 	void __iomem *reg_gusb2phyacc0;
 	int vstatus_index;
+	const struct phy_reg_desc *desc;
 };
 
 struct phy_data {
@@ -96,6 +103,7 @@ struct phy_cfg {
 	bool do_toggle_driving;
 	bool use_default_parameter;
 	bool is_double_sensitivity_mode;
+	const struct phy_reg_desc *reg_desc;
 };
 
 struct phy_parameter {
@@ -156,27 +164,28 @@ static inline int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
 static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
 {
 	void __iomem *reg_gusb2phyacc0 = phy_reg->reg_gusb2phyacc0;
+	const struct phy_reg_desc *reg_desc = phy_reg->desc;
 	unsigned int val;
 	int ret = 0;
 
 	addr -= OFFEST_PHY_READ;
 
 	/* polling until VBusy == 0 */
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
-	/* VCtrl = low nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = low nibble of addr, and set reg_desc->new_reg_req */
+	val = reg_desc->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
-	/* VCtrl = high nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = high nibble of addr, and set reg_desc->new_reg_req */
+	val = reg_desc->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
@@ -190,29 +199,31 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
 	unsigned int val;
 	void __iomem *reg_wrap_vstatus = phy_reg->reg_wrap_vstatus;
 	void __iomem *reg_gusb2phyacc0 = phy_reg->reg_gusb2phyacc0;
+	const struct phy_reg_desc *reg_desc = phy_reg->desc;
 	int shift_bits = phy_reg->vstatus_index * 8;
 	int ret = 0;
 
 	/* write data to VStatusOut2 (data output to phy) */
-	writel((u32)data << shift_bits, reg_wrap_vstatus);
+	writel((u32)data << shift_bits,
+	       reg_wrap_vstatus + reg_desc->vstatus_offset);
 
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
-	/* VCtrl = low nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = low nibble of addr, set reg_desc->new_reg_req */
+	val = reg_desc->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
-	/* VCtrl = high nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = high nibble of addr, set reg_desc->new_reg_req */
+	val = reg_desc->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
@@ -957,6 +968,7 @@ static int get_phy_data_by_efuse(struct rtk_phy *rtk_phy,
 
 static int parse_phy_data(struct rtk_phy *rtk_phy)
 {
+	struct phy_cfg *phy_cfg = rtk_phy->phy_cfg;
 	struct device *dev = rtk_phy->dev;
 	struct device_node *np = dev->of_node;
 	struct phy_parameter *phy_parameter;
@@ -974,6 +986,8 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.reg_wrap_vstatus = of_iomap(np, 0);
 		phy_parameter->phy_reg.reg_gusb2phyacc0 = of_iomap(np, 1) + index;
 		phy_parameter->phy_reg.vstatus_index = index;
+		phy_parameter->phy_reg.desc = phy_cfg->reg_desc;
+
 
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
@@ -1060,6 +1074,12 @@ static void rtk_usb2phy_remove(struct platform_device *pdev)
 	remove_debug_files(rtk_phy);
 }
 
+static const struct phy_reg_desc rtd_phy_reg_desc = {
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
+};
+
 static const struct phy_cfg rtd1295_phy_cfg = {
 	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
 	.page0 = { [0] = {0xe0, 0x90},
@@ -1085,6 +1105,7 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1109,6 +1130,7 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1133,6 +1155,7 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1155,6 +1178,7 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1181,6 +1205,7 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1206,6 +1231,7 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1231,6 +1257,7 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1256,6 +1283,7 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1282,6 +1310,7 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.reg_desc = &rtd_phy_reg_desc,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
-- 
2.56.0


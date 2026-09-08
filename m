Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215C4EE84D;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=dfiyVdcz4TZgYHgZmQ7spBnvJh2sgk/pu2FSTLXSHbx/ovk/b6LVPPMVqlZLUIS3ZAlisYlw7LxZ6cC+JC4iOie//0bnpOJ88d6OwZmkHpmNbVIeb9mDnYihUGMexAtfm/jmT57OVzcCbP6y0j//DK1v85TRnvmKTG4CN6p9iIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=+r5joPgRFCFYWXgPKNZ7DFEUDDAg9qDqy9jlkzCRojk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Am5P1/h12hsBZHxXYUlHbkDO0GgscqUbsM1XPMdodYaJ0yqh0gS2x+IUZANVw0KYIF0kJOxyZ9txFfvCZcWt6d+YlpTaERsUaGmjqBSLUamdWwjK+HYmi+kMjZXSBx0ycU+BKaujrQr4qIr74WhLqFE/mxiBQV6ZU9wbJhNikOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCELvOj8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCELvOj8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 166B4C32781;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=+r5joPgRFCFYWXgPKNZ7DFEUDDAg9qDqy9jlkzCRojk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KCELvOj8GCAMREoziPERLvMYVqKNKgTZFtX6n1tss91uMPDueR+/CMj9PoRWepqdj
	 ND+I13nAXygkV9cEzcl/05Md1wd5Pu2Y7OQvMHZInxu7aSfL372y+ndq7ttuO0tusx
	 YicAGdpFoNCwK17vek2KLjF6gIOq6YJlrf8jKr5TTqarlRNG97IX6YS00oiSJZvLV4
	 3Gyf1Z4jPMCiSTn7NoYg54CgwmvRfBhlFfrZKhTqV003SVR7Kq+fSaxzHrJ/yp1U0g
	 roOYxVmunMw2KjRGeZ/xGGAjHZlEaCvVTpGy6NKp89KbLsyb577sAjsZ9RREOA4ExZ
	 IdLotAimpY61A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01467C79F99;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:40:58 +0400
Subject: [PATCH v4 05/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-5-b789702f0695@outlook.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Stanislaw Pal <kuncy7@gmail.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=2508;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=j5eDBU1/M/VWuaZnnm/rYsHj5E3f2ArUUkz0LzF/aZY=;
 b=EsNjOdFWxRh2tznRzAS6gw4JLaSQrKdA36/aIXLc4K5DTg5/I8/PQbYw+TZY4zp84nmNiE1sl
 xzsDXRNyIw8AZ+dls5TglpJU8c+Ge4pwXmush/Jznv/uNBAMCNWSuDJ
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
helper macro for register/value entries and converting open-coded struct
initializers to the compact form.

No functional change intended.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c  | 60 +++++++---------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 0256183fbcbd..c12de5549652 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -72,51 +72,29 @@ struct qcom_uniphy {
 	int lanes;
 };
 
+#define PHY_INIT_CFG(o, v)		\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+	}
+
 static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
-	{
-		.offset = SSCG_CTRL_REG_4,
-		.val = 0x1cb9,
-	}, {
-		.offset = SSCG_CTRL_REG_5,
-		.val = 0x023a,
-	}, {
-		.offset = SSCG_CTRL_REG_3,
-		.val = 0xd360,
-	}, {
-		.offset = SSCG_CTRL_REG_1,
-		.val = 0x1,
-	}, {
-		.offset = SSCG_CTRL_REG_2,
-		.val = 0xeb,
-	}, {
-		.offset = CDR_CTRL_REG_4,
-		.val = 0x3f9,
-	}, {
-		.offset = CDR_CTRL_REG_5,
-		.val = 0x1c9,
-	}, {
-		.offset = CDR_CTRL_REG_2,
-		.val = 0x419,
-	}, {
-		.offset = CDR_CTRL_REG_1,
-		.val = 0x200,
-	}, {
-		.offset = PCS_INTERNAL_CONTROL_2,
-		.val = 0xf101,
-	},
+	PHY_INIT_CFG(SSCG_CTRL_REG_4, 0x1cb9),
+	PHY_INIT_CFG(SSCG_CTRL_REG_5, 0x023a),
+	PHY_INIT_CFG(SSCG_CTRL_REG_3, 0xd360),
+	PHY_INIT_CFG(SSCG_CTRL_REG_1, 0x1),
+	PHY_INIT_CFG(SSCG_CTRL_REG_2, 0xeb),
+	PHY_INIT_CFG(CDR_CTRL_REG_4, 0x3f9),
+	PHY_INIT_CFG(CDR_CTRL_REG_5, 0x1c9),
+	PHY_INIT_CFG(CDR_CTRL_REG_2, 0x419),
+	PHY_INIT_CFG(CDR_CTRL_REG_1, 0x200),
+	PHY_INIT_CFG(PCS_INTERNAL_CONTROL_2, 0xf101),
 };
 
 static const struct qcom_uniphy_regs ipq5332_pcie_regs[] = {
-	{
-		.offset = PHY_CFG_PLLCFG,
-		.val = 0x30,
-	}, {
-		.offset = PHY_CFG_EIOS_DTCT_REG,
-		.val = 0x53ef,
-	}, {
-		.offset = PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME,
-		.val = 0xcf,
-	},
+	PHY_INIT_CFG(PHY_CFG_PLLCFG, 0x30),
+	PHY_INIT_CFG(PHY_CFG_EIOS_DTCT_REG, 0x53ef),
+	PHY_INIT_CFG(PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME, 0xcf),
 };
 
 static const struct qcom_uniphy_data ipq5018_pcie_data = {

-- 
2.53.0



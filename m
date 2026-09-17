Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7D3AAF44;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630387; cv=none; b=Zw4sTo+9L/JlxQPecXS4JbPUhN1pmOMYxvj12zcXSdgjoB79eMpQXi8x3rqU4zMHma55drnHjqphoCmFu8Snyz0ZmS+vUjBAb2ITnPDqUXHVKEy58ZspPD/45PUyyO7eNwCDtchbnEAEc8m4tyr7JF11/wNPpNBR6QSVOL89wCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630387; c=relaxed/simple;
	bh=OqnPiTNjAqjVxKgEBD7t4LAZoC7s4CYHM+rwUWFCRLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVRiLjViSRzVvTM6c+qcPvc9vO4z/bBVUfSXdmArs8Qih1ZqoePhbkRWrSJ1suM4wrGFnWgI1D6lF/3HV5vyjMcPbWLNwcnoT2PrI0tim3nlXAZ/TQ3ah/gTwRPqomTNxCZaz4RWQvcHzIrVKfV9Ll4zyCsg3TZHTw4qXxi15Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzy5n5s2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzy5n5s2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADB93C2BCFC;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=OqnPiTNjAqjVxKgEBD7t4LAZoC7s4CYHM+rwUWFCRLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rzy5n5s2mqinkiSaA8hBf7bDSYzVNv/k/HDOs2i6LyCMDB8tVyZIvaCNWXn+5keTY
	 2EJv6f6mYFxIqVChzBputriqCXTNL3p2ISdPHC8gh3eqh/bOSPCBxuk1nF0CI3uIGj
	 9XtCK545KBlbERe4J1V7Rx/GdcD5ExRZMjni32yWXD8OoGOyPjw20HibPPIv3Oo9qe
	 af1QjhTiKaNNCDlMNr5n1KdGe1aDCg8E+NNOuXDuHEQLaYwChI/dhMQ3JNBjoHXDAd
	 ZnNUE6/S5G60EZpXH2KVsKSYDWTvUkTX2WM/y5baG8MetpM93CpfbdEoeIu1JnMFN+
	 cOq/dEylSx8EA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F35DC982D0;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 17 Sep 2026 10:32:07 +0300
Subject: [PATCH 2/3] usb: mtu3: introduce platform data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-6595-mtu3-v1-2-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
In-Reply-To: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=3695;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=y54e7myPthNulRzCzcIJqcwIVSWOKyZTdFwExQoLyXc=;
 b=UIxXZokLjiwTb3X/I4dC6/m0foRCb+50aMrzGk4ic71sBFhvXZTvwmMWDWVOp7TwTdKwjiBsq
 R3kw84kLEVLAbkVLA4kLPs1mAoFC5cjwCZQGDHwFGm+bUt1wbq5SnvF
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Some SoCs, such as mt6595, require specific quirks for the MTU3 to
function properly.

The mt6595 IP block doesn't support multiple slots for the FIFO,
resulting FIFO wrap.

Fix this by adding platform data with a field to handle FIFO limitation.

Assisted-by: LLM (debugging)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3.h        | 9 +++++++++
 drivers/usb/mtu3/mtu3_core.c   | 5 +++++
 drivers/usb/mtu3/mtu3_gadget.c | 8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c   | 8 ++++++--
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..1258aa7483aa 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -315,6 +315,14 @@ static inline struct ssusb_mtk *dev_to_ssusb(struct device *dev)
 	return dev_get_drvdata(dev);
 }
 
+/**
+ * struct mtu3_platform_data - platform data for the driver.
+ * @single_slot: the IP can handle only one buffer for bulk transfers
+ */
+struct mtu3_platform_data {
+	bool single_slot;
+};
+
 /**
  * struct mtu3 - device driver instance data.
  * @slot: MTU3_U2_IP_SLOT_DEFAULT for U2 IP only,
@@ -369,6 +377,7 @@ struct mtu3 {
 	unsigned connected:1;
 	unsigned async_callbacks:1;
 	unsigned separate_fifo:1;
+	unsigned single_slot:1;
 
 	u8 address;
 	u8 test_mode_nr;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 66dbfe1705d5..03e28c93bc51 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -923,6 +923,7 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
 	struct device *dev = ssusb->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	const struct mtu3_platform_data *pdata = NULL;
 	struct mtu3 *mtu = NULL;
 	int ret = -ENOMEM;
 
@@ -930,6 +931,10 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	if (mtu == NULL)
 		return -ENOMEM;
 
+	pdata = device_get_match_data(dev);
+	if (pdata)
+		mtu->single_slot = pdata->single_slot;
+
 	mtu->irq = platform_get_irq_byname_optional(pdev, "device");
 	if (mtu->irq < 0) {
 		if (mtu->irq == -EPROBE_DEFER)
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index f224f2ee379a..bfacb1ba152e 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -112,8 +112,12 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 	mep->ep.desc = desc;
 	mep->ep.comp_desc = comp_desc;
 
-	/* slot mainly affects bulk/isoc transfer, so ignore int */
-	mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
+	if (mtu->single_slot)
+		/* older IPs can handle only one slot reliably */
+		mep->slot = 0;
+	else
+		/* slot mainly affects bulk/isoc transfer, so ignore int */
+		mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
 
 	ret = mtu3_config_ep(mtu, mep, interval, burst, mult);
 	if (ret < 0)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..bc65acdfb0de 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,9 +611,13 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt8173_platform_data = {
+	.single_slot = false,
+};
+
 static const struct of_device_id mtu3_of_match[] = {
-	{.compatible = "mediatek,mt8173-mtu3",},
-	{.compatible = "mediatek,mtu3",},
+	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
+	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtu3_of_match);

-- 
2.55.0



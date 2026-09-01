Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21AE478E56;
	Tue,  1 Sep 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257156; cv=none; b=COxJZvjFPlqiHTbJ9T384kAY+dUPWKf/YY+QHHBqAeqT+ntromBlHJALm/pQLMJenGx4LK6nrDmrHGdzZs7lx6PZeKPrXdzyCLt9lZlZw+mTnpjWEUgAAaW/fu2ogBy1RAoRnARKPzS+ba01gKDSYctcUKFBV8wVmwU1/PyrcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257156; c=relaxed/simple;
	bh=PkpB4+pkEgMP4SQTFp14JuZl+BC388LwIYCEsgFxZXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfD/WtNnBByHT4xB92VI7B3s70xjMwJeyZps/JEDI5q0q4O5Tqra6h1w8xSlg3JHxojE+NKhyRx6V2sopQGAsUVAcX3Fz1DIre/EN7IafhVoxl9XLUA31inAC83/MBnHLL/iv0pqlJsMXQT8jN0/I/jB3v4tYa4ZMgOzVrIkXV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJkvQkJK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJkvQkJK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272CB1F00A3D;
	Tue,  1 Sep 2026 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257153;
	bh=be0Lk1c1EPMLsvHe1SiuO/oX6tRh9CySvTwV5BBLgGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JJkvQkJKid72OD2rn1cm0RSnVt5EvepCYHKqLCBiYEYSosfd5Nox9gycmIVApF1Am
	 oBNQ2fJy2xrFtjxqPPeq1WDmzvCy0D9qm6Cv8DuHtk0EMZC/ftZzikeP58fCRIUvWS
	 P/4K6Wl4YLu5JumKQLQpqN+xI7IGHAjhkxlf34O+60dS+YH1EmaHFok5jK9fGd35nQ
	 6/1bRfQQH0CUGzKPFj6a1CVHTdjg2ALdxpmyOrRhDsxBtBZCsxATAkeHxG2rCQQUrP
	 Sev7YEhBQLTV95yyERkmmvxg4sT9mA8W325wSoEv/n0G9HsFW6jFkwBvINszz6RmwG
	 4Jgh3OXWAAppg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 01 Sep 2026 12:05:43 +0200
Subject: [PATCH v3 1/4] usb: xhci: debugfs: Expose the USB3 tunneling
 ext_cap register value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-topic-dwc3_tunneling_state-v3-1-22fdced8de55@oss.qualcomm.com>
References: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
In-Reply-To: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788257146; l=2275;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wuYmnoHK2aZ+IH1Vx6nM1Y18Ks5FNSxDzKLCVZBW5Ns=;
 b=fjB1t+7V6x/mTUnYuHJastnaxa4Fx9NZsXn8ZG/jFgmB674+ij3zf5+pVEvmda/B6EboMt3o9
 xwuNRqKScw1AEmrfPGmTd5LvPmf2vx6UM8KTgKjosjyjAoKXNbeQ4um
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB3 Tunneling Support Capability (idx 18) features a single
register. Expose it over debugfs, if supported by the controller.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-debugfs.c  | 9 +++++++++
 drivers/usb/host/xhci-debugfs.h  | 2 ++
 drivers/usb/host/xhci-ext-caps.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index 2aa01d99f23d..f4bb66a9845a 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -82,6 +82,10 @@ static const struct debugfs_reg32 xhci_extcap_dbc[] = {
 	dump_register(EXTCAP_DBC_DEVINFO2),
 };
 
+static const struct debugfs_reg32 xhci_extcap_usb3_tunneling[] = {
+	dump_register(EXTCAP_USB3_TUNNELING),
+};
+
 static struct dentry *xhci_debugfs_root;
 
 static struct xhci_regset *xhci_debugfs_alloc_regset(struct xhci_hcd *xhci)
@@ -816,6 +820,11 @@ void xhci_debugfs_init(struct xhci_hcd *xhci)
 				   ARRAY_SIZE(xhci_extcap_dbc),
 				   "reg-ext-dbc");
 
+	xhci_debugfs_extcap_regset(xhci, XHCI_EXT_CAPS_USB3_TUNNELING,
+				   xhci_extcap_usb3_tunneling,
+				   ARRAY_SIZE(xhci_extcap_usb3_tunneling),
+				   "reg-usb3-tunneling");
+
 	xhci_debugfs_create_ring_dir(xhci, &xhci->cmd_ring,
 				     "command-ring",
 				     xhci->debugfs_root);
diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index 7c074b4be819..ca6b7f2da8e3 100644
--- a/drivers/usb/host/xhci-debugfs.h
+++ b/drivers/usb/host/xhci-debugfs.h
@@ -70,6 +70,8 @@
 #define REG_EXTCAP_DBC_DEVINFO1				0x38
 #define REG_EXTCAP_DBC_DEVINFO2				0x3c
 
+#define REG_EXTCAP_USB3_TUNNELING			0x00
+
 #define dump_register(nm)				\
 {							\
 	.name	= __stringify(nm),			\
diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 67ecf7320c62..22e53a750e2a 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -40,6 +40,7 @@
 #define XHCI_EXT_CAPS_ROUTE	5
 /* IDs 6-9 reserved */
 #define XHCI_EXT_CAPS_DEBUG	10
+#define XHCI_EXT_CAPS_USB3_TUNNELING	18
 /* Vendor caps */
 #define XHCI_EXT_CAPS_VENDOR_INTEL	192
 #define XHCI_EXT_CAPS_INTEL_SPR_SHADOW	206

-- 
2.55.0


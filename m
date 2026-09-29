Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA046D568;
	Tue, 29 Sep 2026 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697294; cv=none; b=MpEccwExh8GtNnQrUgTNUyti5gS9rViAJ2s3UE6MWXY6nMWW38mHLMCQYZipMC0YMZChAEOhKsucbwwkYEshMW6sLiwDAzZ3+aaIL//4OqFQHNXLb073wbP1lmZp1ZM6svNTlgPPJ2gl4WoM1LktrnJyW5OY+qPfOZMMhu9rxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697294; c=relaxed/simple;
	bh=vDqOreTD0jwGwH+Qpe5f5av8hDi3D49g9Wc5PPTZ2nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKmkFiXOwL/cLvF7qklt03kI3N6vYgoWzgAt46d4Tla8CTnZX/0mzDljBv3DN5iYALNDQxzuyhCNMNLcJtDGoAtCg6Z0yt1zwBloJ9lC6ZU0BD1Gzl9Pddk4iDWEdrsofbJ1SeG5d2i/eTCSGmzlFFawJn8jFCK59NB7lH+53Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxnDuUx2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxnDuUx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BBD1F00893;
	Tue, 29 Sep 2026 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697292;
	bh=C1nNEkZHHSsQQmDEL1Bqgc72a4g+kVWibY+I/UwnVLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UxnDuUx2f/SXFiYfMT21P6oaHV5J479tCUyUUC0q+GvIDvlUlhwAG3Qgf40rEc7r+
	 l7FtNy93ftmgVFqE2ih7TlBcE8ii+5udxJ0HEoBRS9X2MK2607QQkM+Eat4CPNWQzF
	 lFHqAMYs4htne53rP4dDAbUrFwmU1UFZmqpxyrwFWibYrG4IvJbySOlUkJf0vIxNkE
	 R85W8JoIv2Ojj6Izjl130g9vxj5RKHLOxqxD3YkuNA8BehE6u6GtcMkIErANTuSF7a
	 HiBLTepYCbtwuMmZCIxnkhCvXSXu4gGGlQIFCSLJVWXc1Qix22Lt0lhcIVhfm5yMJp
	 5bVl8epD6+ovg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 29 Sep 2026 17:54:41 +0200
Subject: [PATCH v4 1/4] usb: xhci: debugfs: Expose the USB3 tunneling
 ext_cap register value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-topic-dwc3_tunneling_state-v4-1-63e296346d57@oss.qualcomm.com>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
In-Reply-To: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790697285; l=2330;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jtkUFoB8RrIjABUW5cqThxgdRivlft56tJqG0ykNoQ8=;
 b=UUOqlz+5uGTgY6dqSc30fcumyOuI1RsaM85AT0nEttF98k58SoQUWYJtiIB43ccU720r2dNkK
 xPXitcAPtyaDnW1zwP7ubraHv6ScQaTsRJyJwgi5Qih91fqANckBfYk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB3 Tunneling Support Capability (idx 18) features a single
register. Expose it over debugfs, if supported by the controller.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
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


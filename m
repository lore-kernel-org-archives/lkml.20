Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7909341D112;
	Tue, 15 Sep 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483512; cv=none; b=CDk3UJk6Zgc4Mw14JmeBr/BbIWjtVBqnFTXI6AHs3Rugkd+n4zft4VPSCeqtk6OsOo9Rk5pCXMRApkdVrvvz05aZ3bI/DDNJsoJz8jTssooa4l9xNwBfCgU2Ps713v4z6x/ko33b7ve0VrDQWijMQaGOtTXRD2X3C1Bt34MS7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483512; c=relaxed/simple;
	bh=PCVAyz31QEx8MCXn17GNCL0gKjrQAGGPtz+xKL+Q5sY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1EsnrKzg0w0eDYROJkCskH4kSrs/i6OHuLyX7iXGJjj45sdc2ZPLJgPhLHPbppInQ4srWUcwZbZENVYPCkjAjPPyLNbs5o61j0Qgkxsd2X2FAlQ+UKbrdkYkUShjH6PRB1v7t2kqaQaydtq2ROpcMCxGAf2GP2/5G/qQOt20Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LBPEuvn8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LBPEuvn8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=Ndf555LHP5jLVLx6zOR0AGbjhv2N4MkJ3M8G5ZUdW30=; b=
	LBPEuvn8NpAaXWc6KLJTycWt+dZnzTXJY8xeH5qcwww92uMlCrrOKnJt1VnMGlpEWhUNxok5qISf0
	yMsQZDIWl8qZb363FkOC5YgNaTp1HZOJ0r/uXaNG6IjWy4VMtN0ojqnnvVJy7X2wsQEzZE2OKvm0P
	bXqrYHJznTQ43xydHkYnOlgyx552v7IW5c12X/pP83sqq9KBxRjduRnprrIOuQWUZQJcC/9CJ0crx
	q4CirgtxJQrFW0FykIHHls1ji5On0zQBV42fgBDBtNBqqgQ38UXa0yN2PirkXzWBY6OSSP8KgWenP
	e9NieADQ6ZI7NRZNJOE4hoGxoHPh+kLFtQ==;
Received: from [49.36.127.23] (helo=uajain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6UP8-002Ua4-JV; Tue, 15 Sep 2026 16:45:02 +0200
From: Umang Jain <uajain@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas De Marchi <demarchi@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Umang Jain <uajain@igalia.com>
Subject: [PATCH v3] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
Date: Tue, 15 Sep 2026 20:16:38 +0530
Message-ID: <20260915144638.263973-1-uajain@igalia.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the early xhci-dbc assumes that the entire PCIe memory IO
can be entirely mapped  within the fixed boot time mappings
dictated by NR_FIX_BTMAPS. This patch handles the case where the PCIe
memory IO size can be larger than the fixed boot time mappings and
query the xhci debug extended capability in xdbc_map_pci_mmio().

This commit ensures that the xHCI debug capability can still be queried
when the PCIe memory IO space exceeds the fixmap size. In this scenario,
the base address is mapped uptil fixmap size and debug capabilities are
queried thereafter. Iterating over the entire PCIe BAR address size is
left for future improvement as and when, such a case arises.

Additionally, this brings the need to track the early_ioremap() mapped
size separately hence, introduce additional struct member xhci_base_length
in struct xdbc_state.

Signed-off-by: Umang Jain <uajain@igalia.com>
---
Changes in v3:
- Drop unused var mapped_size
- early_iounmap on a failed / error path
- ioremap base address NULL check

Changes in v2:
- Commit message update
- Changed and tested behaviour for mapping only first fixmap_size
  of PCIe Base address size instead of iteration over entire BAR size
- Updated comments
- Updated XDBC MAPPING SIZE to 64
- https://lore.kernel.org/all/195958b071b8cd57062060688b611ac6@igalia.com/

v1:
- https://lore.kernel.org/all/20260720191249.1272328-1-uajain@igalia.com/
---
 drivers/usb/early/xhci-dbc.c | 81 ++++++++++++++++++++++++++++++++----
 drivers/usb/early/xhci-dbc.h |  1 +
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 41118bba9197..f2ed8e52cc56 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -35,10 +35,23 @@ static bool early_console_keep;
 static inline void xdbc_trace(const char *fmt, ...) { }
 #endif /* XDBC_TRACE */
 
+/* Size of xHCI debug capability structure as per section 7.6.8 of xHCI spec. */
+#define XDBC_MAPPING_SIZE	64
+
+enum xdbc_capability_flags {
+	XDBC_CAP_FLAG_NONE		= 0,
+	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
+	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
+	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
+};
+
 static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 {
-	u64 val64, sz64, mask64;
+	u64 val64, sz64, mask64, fixmap_size;
+	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
+	bool found_all_caps = false;
 	void __iomem *base;
+	int offset;
 	u32 val, sz;
 	u8 byte;
 
@@ -85,7 +98,59 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
 
 	xdbc.xhci_start = val64;
 	xdbc.xhci_length = sz64;
-	base = early_ioremap(val64, sz64);
+
+	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
+	if (sz64 < fixmap_size) {
+		xdbc.xhci_base_length = sz64;
+		return early_ioremap(val64, sz64);
+	}
+
+	/*
+	 * Base address size is greater than fixed size boot time mappings
+	 * hence, map maximum allowed fixmap size from base address and
+	 * determine if the required extended capabilities lies within the
+	 * fixmap.
+	 */
+	base = early_ioremap(val64, fixmap_size);
+	if (!base)
+		return NULL;
+
+	offset = xhci_find_next_ext_cap(base, 0, 0);
+
+	while (offset < fixmap_size) {
+		val = readl(base + offset);
+		switch (XHCI_EXT_CAPS_ID(val)) {
+		case XHCI_EXT_CAPS_DEBUG:
+			if (offset + XDBC_MAPPING_SIZE < fixmap_size)
+				cap_flags |= XDBC_CAP_FLAG_DEBUG;
+			break;
+		case XHCI_EXT_CAPS_PROTOCOL:
+			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
+			break;
+		case XHCI_EXT_CAPS_LEGACY:
+			cap_flags |= XDBC_CAP_FLAG_LEGACY;
+			break;
+		}
+
+		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
+		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
+		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
+			found_all_caps = true;
+			break;
+		}
+
+		offset = xhci_find_next_ext_cap(base, offset, 0);
+		if (!offset)
+			break;
+	}
+
+	if (found_all_caps) {
+		xdbc.xhci_base_length = fixmap_size;
+	} else {
+		early_iounmap(base, fixmap_size);
+		xdbc.xhci_base_length = 0;
+		base = NULL;
+	}
 
 	return base;
 }
@@ -643,9 +708,9 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
 	if (!offset) {
 		pr_notice("xhci host doesn't support debug capability\n");
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 		xdbc.xhci_base = NULL;
-		xdbc.xhci_length = 0;
+		xdbc.xhci_base_length = 0;
 
 		return -ENODEV;
 	}
@@ -682,9 +747,9 @@ int __init early_xdbc_setup_hardware(void)
 		xdbc.table_base = NULL;
 		xdbc.out_buf = NULL;
 
-		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 		xdbc.xhci_base = NULL;
-		xdbc.xhci_length = 0;
+		xdbc.xhci_base_length = 0;
 	}
 
 	return ret;
@@ -987,7 +1052,7 @@ static int __init xdbc_init(void)
 	}
 
 	raw_spin_lock_irqsave(&xdbc.lock, flags);
-	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 	xdbc.xhci_base = base;
 	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
 	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
@@ -1004,7 +1069,7 @@ static int __init xdbc_init(void)
 	memblock_phys_free(xdbc.table_dma, PAGE_SIZE);
 	memblock_phys_free(xdbc.out_dma, PAGE_SIZE);
 	writel(0, &xdbc.xdbc_reg->control);
-	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
+	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
 
 	return ret;
 }
diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
index 8b4d71de45fc..e2aefb796084 100644
--- a/drivers/usb/early/xhci-dbc.h
+++ b/drivers/usb/early/xhci-dbc.h
@@ -144,6 +144,7 @@ struct xdbc_state {
 	u32			dev;
 	u32			func;
 	void __iomem		*xhci_base;
+	size_t			xhci_base_length;
 	u64			xhci_start;
 	size_t			xhci_length;
 	int			port_number;
-- 
2.55.0


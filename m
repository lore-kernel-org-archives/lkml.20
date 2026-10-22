Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688341;
	b=qDyQP4hPfnDzK5P7hr1nvlI4Q2W86Rl5BmFqrMs6Isca2MVJ3xhy/rLZ386i1nSTFklR
	 7/um+kayXmNSJy7JXUz3x6LElYEVYc2QMK4WoCUtFAcRjqQ1EUiNwTJsvZKuV+m8Q8djR
	 txDMALyYa1zOUhEh3QOxVmBPrQVJ8OCJz0tWiN2QuX6rWS/MvZf8Pl5ONPRPRp14nfvBd
	 RiUyKhzo7GUyu1ar4F5Ap+pQAwL4O6jqcgimT0ib6hGmOylZt1NnywoyCS/H4R99W0ulc
	 O9b5p90tfPrWDVyzsWngfLFTnoOQFmkikhFUHfvSd3vJvzLr3niFwM3KyXDAznEiOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W7YeOGCoo/KQR6RPp5t3iOKduMWVKWg0EO1FIafOrtU=;
	b=4atwtwkcrQvJ/ByRhdY5AQ2A3eO8KAswjqVfHzqlho4+x6+jbOx1nsgfr616R6zfeuhe
	 n68LLBv3EL1CEELX7D+i14t/SUd5oObrt1OSOZXx4ZFkDCqv+k/lRngztWlay78FVdpTr
	 /kQkIStgcTG4rJDXOlmWlzYG3vgS2/NId4zxVpU38HNjvdOvlFRdZniBo/h65tGxSnKBH
	 T1ZI+nREQtK1zbmUb9QrEyEXXdRtSSoERi4c/Nz0arIfkh4XhWyaBwSvLcA+MbZE581pW
	 0J7ToCuitDXLaidvodpdn58xtCQmKr+0kuqMqiF/Nq9IY9KWeIeo06XMxr87SbiOlOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arista.com;
	spf=pass smtp.mailfrom=arista.com;
	dkim=pass header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=dpn9gq5h;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36812606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36812606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=dpn9gq5h
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-354ba08cfd1so27570eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1792688339; x=1793293139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7YeOGCoo/KQR6RPp5t3iOKduMWVKWg0EO1FIafOrtU=;
        b=dpn9gq5htbaMk/l/KS6BiZ1h0XAxEXikL/PJf8H8bLVRQq20aX1P6P2u0RClTS2QpU
         9J3xWf3nveXQosolCjfJgnuzv22ou0AdIoE7EgcWx6rNYAi+FARCEvXCWJ93z2a8Q/MK
         U3F0AITZ+7lcN0Eit87LhztoLMx/1CkTmkAy+q6uExJWESNnLZ25H/xhKwoE+8eP3U4B
         MtlR/cvyHcDxSmxl1eZ7SNSdkBCnHZKAxV9BIxZ94O9txDA/ahsIesTEAXJ5QL0m/3xZ
         5Ni9PxEmqtjdWCInC4hfz0qi/TPkXzkwjsvOr/yZ7zwSCe/XO35FRp5+lrCwOEJQcpzv
         GAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688339; x=1793293139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7YeOGCoo/KQR6RPp5t3iOKduMWVKWg0EO1FIafOrtU=;
        b=HXqizBxZE7XTJyGWzTMCHC5CKlyTpUT6CczU56orVsWeGHnT1DnxeqGxtv0iFDjIvv
         mF5N3QrCmX6Gdi8Jw6dUSDLGRIHeJ5kXBWYpl5MebSk69SKoLhtvzWLiDFTBKKwDAl8L
         pQsmV6T63dh2IDhhkJd1dXRCVcXVDnGwSQbL5H2fWpZtTnDKYiFSBS+rUVjp+vHigE7U
         zo9JOaiDmUI/FjrvAUqR61yfD+6a0TC106ArZkLdOwwOcBQqc2DbwhT1SMFOtucXpVNb
         rXFNgIQrHJQO6zyzEfHgIb8bGGpm5Bu/MMGxJufYxlUIdTkUT8YfdUzfefnxdz55iS87
         Ffsw==
X-Forwarded-Encrypted: i=1; AKwUvByxIWPsIRw008nz6Z1VSPft9X+eK6FRIlhvL1Bj/O9pwGQIweuu92ug3S6aHuyssOxna3Jlk5yt+/lPHFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHO5Uwk5e7FNLwxnCtA1xd5N7QKhts6Q6+kjWwteVyuGsUvc8X
	xDxuIC2seq2Wn+Q79P/9MjqMI3Vm3kONdPoqDI+oDzf2haMy9D1hi3EHcE9OoxcOxw==
X-Gm-Gg: AYBFou3udtRIew0OTB9qiraUJaC1jClReeJh+FRGSrWUw7VcwbOxadsyjUKv8OlWBUo
	XKQfzu9fwsDnBKuBdBKB84cE5wixrU+fV7SrUJs6jfJf5RNN6/ENFkGDBhC9TmNH63CmiJuch29
	XbKEBV4aGNwBZanShJ2akp9OEPQI1ldjtspmtjb4qJYZ92hSeS/0XmAJlyt5+jsIEixNV91ysUz
	3SQVE6brtdlUOp5tJkWV70RExvaiNU+WShdLGthoPT0jAowEyAFakTA/hfcfpXRwt1Jrp/tL0Mv
	Ev3zay5U4uKD4aVdF+yMHlCIOVpPeF++31Zwz/ptD3F5j19ABMd6nTzb6tfNubuAVYCodXOE64z
	UYED8JL9Th/pZ7GdPt5TjbXfChZldkFheCCTgVe6CjL9BI39SE+C1UFkTzIHY2SoiffqSlMTdLA
	irlSR9yeI+5h5wfKtVNqgZ3WMZhyeeGG60M3BCfVGUU4FjjTw2gi6ulxw+e4QRZYtvgKtFUD53q
	vVTmZFAsXfs3n0+ZZ3iYsOm6KqcTrRnKJJPGBiwqs3PHbE01UJGVsH0Jeu9j0O1fAWuxmdsDlCu
	av4UEGCsWXUL6k6SwlPrPImZPjl+4EPQWbs=
X-Received: by 2002:a05:7022:618:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-190a7e0c437mr10112891c88.47.1792688338953;
        Thu, 22 Oct 2026 09:58:58 -0700 (PDT)
Received: from yurypm-home-4hjc6.sjc.aristanetworks.com ([74.123.28.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm15951151c88.19.2026.10.22.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:58:58 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/2] PCI: Add pci=nodpc kernel boot option
Date: Thu, 22 Oct 2026 16:58:42 +0000
Message-ID: <20261022165842.1463451-3-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261022165842.1463451-1-yurypm@arista.com>
References: <20261022165842.1463451-1-yurypm@arista.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pci=nodpc to let Linux opt out of Downstream Port Containment (DPC)
and Error Disconnect Recover (EDR) support on systems where userspace
manages PCIe errors.

Skip DPC initialization, state operations, hotplug recovery checks, and
port service registration when disabled. Expose pci_dpc_available() so
ACPI negotiation and PCIe port service discovery honor the same policy.
Do not advertise EDR support or request DPC control through _OSC, and
prevent native-port overrides from reintroducing DPC ownership.

Skip EDR notifier installation before the DPC-enabling _DSM call. Merely
skipping the native DPC driver would allow EDR to enable hardware DPC
while the handler lacks the capability information needed to recover.

The option disables Linux participation in DPC and EDR; it does not turn
off firmware-owned DPC hardware. AER reporting and recovery remain
independent and can be controlled with their own boot options.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
Changes in v3:
- Add pci_dpc_available() and use it for ACPI DPC/EDR negotiation.
- Skip EDR notifier registration and its DPC-enabling _DSM call.
- Gate DPC service discovery and prevent forced native DPC ownership.
- Clarify the firmware boundary and rebase onto PCI next.

v2: https://lore.kernel.org/linux-pci/20260709185429.627968-3-yurypm@arista.com/
Review: https://lore.kernel.org/linux-pci/20260709190730.E19A11F000E9@smtp.kernel.org/

 .../admin-guide/kernel-parameters.txt         |  4 ++++
 drivers/acpi/pci_root.c                       |  9 +++++--
 drivers/pci/pci.c                             |  2 ++
 drivers/pci/pci.h                             |  2 ++
 drivers/pci/pcie/dpc.c                        | 24 ++++++++++++++++---
 drivers/pci/pcie/edr.c                        |  5 +++-
 drivers/pci/pcie/portdrv.c                    |  3 ++-
 include/linux/pci.h                           |  6 +++++
 8 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6047efd3c..f98486d4d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5115,6 +5115,10 @@ Kernel parameters
 				through ports 0xC000-0xCFFF).
 				See http://wiki.osdev.org/PCI for more info
 				on the configuration access mechanisms.
+		nodpc		[PCIE] Disable Linux DPC and EDR support. Linux
+				neither requests DPC control from firmware nor
+				enables DPC through EDR. Firmware-owned DPC
+				settings are not changed. Requires CONFIG_PCIE_DPC.
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
diff --git a/drivers/acpi/pci_root.c b/drivers/acpi/pci_root.c
index a1a9c0601..6bca8206c 100644
--- a/drivers/acpi/pci_root.c
+++ b/drivers/acpi/pci_root.c
@@ -438,7 +438,7 @@ static u32 calculate_support(void)
 		support |= OSC_PCI_ASPM_SUPPORT | OSC_PCI_CLOCK_PM_SUPPORT;
 	if (pci_msi_enabled())
 		support |= OSC_PCI_MSI_SUPPORT;
-	if (IS_ENABLED(CONFIG_PCIE_EDR))
+	if (IS_ENABLED(CONFIG_PCIE_EDR) && pci_dpc_available())
 		support |= OSC_PCI_EDR_SUPPORT;
 
 	return support;
@@ -517,7 +517,7 @@ static u32 calculate_control(void)
 	 * OSC_PCI_EXPRESS_DPC_CONTROL indicates the OS supports both DPC
 	 * and EDR.
 	 */
-	if (IS_ENABLED(CONFIG_PCIE_DPC) && IS_ENABLED(CONFIG_PCIE_EDR))
+	if (pci_dpc_available() && IS_ENABLED(CONFIG_PCIE_EDR))
 		control |= OSC_PCI_EXPRESS_DPC_CONTROL;
 
 	return control;
@@ -1064,6 +1064,11 @@ struct pci_bus *acpi_pci_root_create(struct acpi_pci_root *root,
 	else if (pcie_ports_dpc_native)
 		override = OSC_PCI_EXPRESS_DPC_CONTROL & ~ctrl;
 
+	if (!pci_dpc_available()) {
+		ctrl &= ~OSC_PCI_EXPRESS_DPC_CONTROL;
+		override &= ~OSC_PCI_EXPRESS_DPC_CONTROL;
+	}
+
 	if (override) {
 		decode_osc_control(root, pcie_ports_native ?
 				   "OS forcing control (\"pcie_ports=native\") of" :
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 9ca8d3fbb..c2a6aacc5 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6838,6 +6838,8 @@ static int __init pci_setup(char *str)
 			} else if (!strncmp(str, "noats", 5)) {
 				pr_info("PCIe: ATS is disabled\n");
 				pcie_ats_disabled = true;
+			} else if (!strcmp(str, "nodpc")) {
+				pci_no_dpc();
 			} else if (!strcmp(str, "noaer")) {
 				pci_no_aer();
 			} else if (!strcmp(str, "noaer_recovery")) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ccc6a678c..ae8fc06e5 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -934,6 +934,7 @@ struct rcec_ea {
 #endif
 
 #ifdef CONFIG_PCIE_DPC
+void pci_no_dpc(void);
 void pci_save_dpc_state(struct pci_dev *dev);
 void pci_restore_dpc_state(struct pci_dev *dev);
 void pci_dpc_init(struct pci_dev *pdev);
@@ -942,6 +943,7 @@ pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
 unsigned int dpc_tlp_log_len(struct pci_dev *dev);
 #else
+static inline void pci_no_dpc(void) { }
 static inline void pci_save_dpc_state(struct pci_dev *dev) { }
 static inline void pci_restore_dpc_state(struct pci_dev *dev) { }
 static inline void pci_dpc_init(struct pci_dev *pdev) { }
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b779bd1d..fbafc3ca0 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -43,12 +43,24 @@ static const char * const rp_pio_error_string[] = {
 	"Memory Request Completion Timeout",		 /* Bit Position 18 */
 };
 
+static bool pcie_dpc_disable;
+
+void pci_no_dpc(void)
+{
+	pcie_dpc_disable = true;
+}
+
+bool pci_dpc_available(void)
+{
+	return !pcie_dpc_disable;
+}
+
 void pci_save_dpc_state(struct pci_dev *dev)
 {
 	struct pci_cap_saved_state *save_state;
 	u16 *cap;
 
-	if (!pci_is_pcie(dev))
+	if (!pci_dpc_available() || !pci_is_pcie(dev))
 		return;
 
 	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
@@ -64,7 +76,7 @@ void pci_restore_dpc_state(struct pci_dev *dev)
 	struct pci_cap_saved_state *save_state;
 	u16 *cap;
 
-	if (!pci_is_pcie(dev))
+	if (!pci_dpc_available() || !pci_is_pcie(dev))
 		return;
 
 	save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_DPC);
@@ -104,7 +116,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 {
 	struct pci_host_bridge *host;
 
-	if (!pdev->dpc_cap)
+	if (!pci_dpc_available() || !pdev->dpc_cap)
 		return false;
 
 	/*
@@ -404,6 +416,9 @@ void pci_dpc_init(struct pci_dev *pdev)
 {
 	u16 cap;
 
+	if (!pci_dpc_available())
+		return;
+
 	pdev->dpc_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_DPC);
 	if (!pdev->dpc_cap)
 		return;
@@ -532,5 +547,8 @@ static struct pcie_port_service_driver dpcdriver = {
 
 int __init pcie_dpc_init(void)
 {
+	if (!pci_dpc_available())
+		return 0;
+
 	return pcie_port_service_register(&dpcdriver);
 }
diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
index e86298dbb..8567dd1d5 100644
--- a/drivers/pci/pcie/edr.c
+++ b/drivers/pci/pcie/edr.c
@@ -223,6 +223,9 @@ void pci_acpi_add_edr_notifier(struct pci_dev *pdev)
 	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 	acpi_status status;
 
+	if (!pci_dpc_available())
+		return;
+
 	if (!adev) {
 		pci_dbg(pdev, "No valid ACPI node, skipping EDR init\n");
 		return;
@@ -246,7 +249,7 @@ void pci_acpi_remove_edr_notifier(struct pci_dev *pdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 
-	if (!adev)
+	if (!pci_dpc_available() || !adev)
 		return;
 
 	acpi_remove_notify_handler(adev->handle, ACPI_SYSTEM_NOTIFY,
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index 32fc623dd..aa1c57e33 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -262,7 +262,8 @@ static int get_port_device_capability(struct pci_dev *dev)
 	 * With dpc-native, allow Linux to use DPC even if it doesn't have
 	 * permission to use AER.
 	 */
-	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
+	if (pci_dpc_available() &&
+	    pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
 	    pci_aer_available() &&
 	    (pcie_ports_dpc_native || host->native_aer))
 		services |= PCIE_PORT_SERVICE_DPC;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index f3e9c6c9c..dd667223b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1984,6 +1984,12 @@ bool pci_aer_available(void);
 static inline bool pci_aer_available(void) { return false; }
 #endif
 
+#ifdef CONFIG_PCIE_DPC
+bool pci_dpc_available(void);
+#else
+static inline bool pci_dpc_available(void) { return false; }
+#endif
+
 bool pci_ats_disabled(void);
 
 #define PCIE_PTM_CONTEXT_UPDATE_AUTO 0
-- 
2.51.0


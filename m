Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222285;
	b=hTCC2GVhiNIUmiEt5IBMPuZUeLbGmxgKAF6zLdF1zOiJWId151cAV+P4WtLDKC4U9vVX
	 tOF7gj9/MArbw82fkjhzHz8CHkVN8dmAzz8dqUsyHF4AhqWXtlmrUjEJ1RLLoerX3zHgo
	 ibLEr1rkCUzEPWo+2V8fQZdPVEIp5dmJMXPNmY41Ge+W0nzUOl0Zq3EpeAyA9U2GaKPTx
	 QZGQrEY6zh4HkAo15un8T/E8UU+QXo0uKFFu7Kht7mOimsAU+S1l101GNLWK9leGJ+BJQ
	 A2Fvb8kgHnw5mKthiAA6wvgB6N6lW+RKEk015/sETiW7jrck+7owxkc12YQVhBLbWxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222285;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=E3Q0XoZIb01sk4wSPA3kiH5qJ30j+u8OBjPIKDQDvrI=;
	b=EfN6/sMIvv6q5w2vCbHIGDM5GC8vaukhfYYs/SuG+4Lw5xrffDUjIf4P4p6uuFqWTVVr
	 /aXxAyblFlXHRKDNhpH/RaAIw0kV9yGMjkGFtqw6FZ7CltqqNFTiofeGTENLlisleBREO
	 kti2NagOutHYVjxSvUv43z9yRIp16ccVisST9o6bSV8TG8Q27PQ7ptRKPX+YAFM8HGBwv
	 bVDoCwCQF6/pp0XriRxVvBF5YX7NztGLcN5iVHivc3P1F0XqRvyBKtOWfyNk5N3u7lX8y
	 fywZ/Wfp/5bl3FHJdW8bC4/RoycB0kTRKlQVvlrkyk0CRnRVjGM2oOqR9gJR6AwA6Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bnvF1RCJ;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA7606A31C;
	Mon,  9 Nov 2026 11:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bnvF1RCJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=E3
	Q0XoZIb01sk4wSPA3kiH5qJ30j+u8OBjPIKDQDvrI=; b=bnvF1RCJYUqKimRrtn
	qZVra1AgmCd+L1W/Cj1GIY8VCjwZzgOlLDlBXflu6mQebTffnSyzoXUcHJ+JhuOt
	SGNqi7q129Br03QxdL9Xt0eJcZFZQLNWN3O045sulXAcwjOktk5WTkwCCCLaINj/
	IXmpbTrvwHt26BaNcHwGD09Vg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnLyOpqPFq8SLEGg--.44457S2;
	Mon, 09 Nov 2026 19:04:13 +0800 (CST)
From: xing1989093@163.com
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongxing Xu <xing1989093@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
Date: Mon,  9 Nov 2026 19:03:52 +0800
Message-Id: <20261109110352.1621-1-xing1989093@163.com>
X-Mailer: git-send-email 2.40.0.windows.1
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
X-CM-TRANSID:_____wDnLyOpqPFq8SLEGg--.44457S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw1UWw1UXF1DCr48JF4xWFg_yoWxXFyDpF
	s09FsxJrZ5Jry7Cr4DCw10kr15ZrsYv34UtrsrGw1jkwsxKryqqFZrKF15XF4UCrZ3Way5
	ZF4fKryDWa1qyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piRwZ8UUUUU=
X-CM-SenderInfo: 50lqwiqzyzimqt6rljoofrz/xtbC4A1sKWrxqK15mAAA3X

From: Hongxing Xu <xing1989093@163.com>

Writing the MHI SOC_RESET register is a device internal soft reset: it
only asks the modem to restart itself, so it is useless once the device
has stopped servicing MHI. A platform level device reset (PLDR) power
cycles the module at board level through an ACPI method instead and does
not depend on any device state, which is why vendor drivers keep it as
the reset of last resort.

The out-of-tree MediaTek PCI driver does exactly that. Add the same
capability to mhi_pci_generic so that such boards can be supported
without a vendor driver. The method name is board specific, MediaTek
firmware uses the vendor scoped "MRST._RST" while others may expose the
standard "_RST", so it comes from struct mhi_pci_dev_info rather than
being fixed in the reset path. A NULL name keeps the generic SoC reset,
the same way fw and edl express "not supported".

pci_save_state()/pci_restore_state() are not used around the ACPI call
because they clobber dev->saved_config_space, which mhi_pci_reset_done()
needs; pci_reset_function() recurses back through reset_prepare();
pci_dev_acpi_reset() is not exported to modules. The call is skipped
when oops_in_progress is set, since acpi_evaluate_object() allocates
memory and takes ACPICA locks; that leaves the panic path a no-op rather
than a fallback, as a device needing this method cannot use the register
write anyway.

CONFIG_MHI_PCI_GENERIC does not depend on CONFIG_ACPI, so the path is
compiled out on such builds.

Signed-off-by: Hongxing Xu <xing1989093@163.com>
---
 Documentation/ABI/stable/sysfs-bus-mhi |  4 ++
 drivers/bus/mhi/host/pci_generic.c     | 66 ++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
index 8b9698f..064bf6b 100644
--- a/Documentation/ABI/stable/sysfs-bus-mhi
+++ b/Documentation/ABI/stable/sysfs-bus-mhi
@@ -29,6 +29,10 @@ Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
                 This can be useful as a method of recovery if the device is
                 non-responsive, or as a means of loading new firmware as a
                 system administration task.
+                Devices that advertise an ACPI reset method (for example the
+                MediaTek modems using "MRST._RST") are reset at board level
+                through that method instead, which power cycles the module
+                rather than asking it to restart itself.
 
 What:           /sys/bus/mhi/devices/.../trigger_edl
 Date:           April 2024
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 7193a38..4e84e10 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -8,12 +8,14 @@
  * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
  */
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
+#include <linux/printk.h>
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
@@ -39,6 +41,9 @@
  * @fw: firmware path (if any)
  * @edl: emergency download mode firmware path (if any)
  * @edl_trigger: capable of triggering EDL mode in the device (if supported)
+ * @acpi_reset_method: name of the ACPI method that resets the
+ *		      device at board level, such as "MRST._RST".
+ *		      NULL when the device cannot be reset through ACPI.
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
  * @vf_dma_data_width: DMA transfer word size for VF's (optional)
@@ -55,6 +60,7 @@ struct mhi_pci_dev_info {
 	const char *fw;
 	const char *edl;
 	bool edl_trigger;
+	const char *acpi_reset_method;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
 	unsigned int vf_dma_data_width;
@@ -1111,6 +1117,7 @@ enum mhi_pci_device_status {
 struct mhi_pci_device {
 	struct mhi_controller mhi_cntrl;
 	struct pci_saved_state *pci_state;
+	const char *acpi_reset_method;
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
@@ -1180,6 +1187,49 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 	return true;
 }
 
+static inline struct mhi_pci_device *
+to_mhi_pci_device(struct mhi_controller *mhi_cntrl)
+{
+	return container_of(mhi_cntrl, struct mhi_pci_device, mhi_cntrl);
+}
+
+#ifdef CONFIG_ACPI
+static void mhi_pci_acpi_reset(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_pci_device *mhi_pdev = to_mhi_pci_device(mhi_cntrl);
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	const char *method = mhi_pdev->acpi_reset_method;
+	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
+	u32 saved[16];
+	acpi_status status;
+	unsigned int i;
+
+	/*
+	 * acpi_evaluate_object() allocates memory and takes ACPICA locks,
+	 * neither of which is safe once a panic is underway. mhi_soc_reset()
+	 * is reachable from __mhi_download_rddm_in_panic().
+	 */
+	if (oops_in_progress)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(saved); i++)
+		pci_read_config_dword(pdev, i * 4, &saved[i]);
+
+	status = acpi_evaluate_object(handle, (char *)method, NULL, NULL);
+	if (ACPI_FAILURE(status))
+		dev_err(&pdev->dev, "failed to execute %s: %s\n", method,
+			acpi_format_exception(status));
+
+	for (i = 0; i < ARRAY_SIZE(saved); i++)
+		pci_write_config_dword(pdev, i * 4, saved[i]);
+}
+#endif
+
 static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 			 unsigned int bar_num, u64 dma_mask)
 {
@@ -1435,6 +1485,22 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (info->edl_trigger)
 		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
 
+#ifdef CONFIG_ACPI
+	if (info->acpi_reset_method) {
+		acpi_handle handle = ACPI_HANDLE(&pdev->dev);
+
+		if (handle &&
+		    acpi_has_method(handle, (char *)info->acpi_reset_method)) {
+			mhi_pdev->acpi_reset_method = info->acpi_reset_method;
+			mhi_cntrl->reset = mhi_pci_acpi_reset;
+		} else {
+			dev_warn(&pdev->dev,
+				 "ACPI %s not found, keeping SoC reset\n",
+				 info->acpi_reset_method);
+		}
+	}
+#endif
+
 	if (info->sideband_wake) {
 		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
 		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;


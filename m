Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706680;
	b=vft6F1oxewW85daXCTwMJYFpfHJzBQ5vvYT9+/OdhRn6LWSM8x35YsKWJn7UpnUhbqLy
	 Hsn2V2yDoLbuyFpz0By1ZVzBqMnn/gFRtg3Lkz1F3lPUay9yUwv20acTg9XuLfpKTw9OV
	 iwTo8H27FhqE/ypeoLEWTu/fQACXvNQtAloQ3OwUmRbocfZE/KUzkRgrUcfNZGYjk5/mm
	 ipAxXDs2bnTelE8tTDVcqQpzo8QriXz0dZyLJP/GndGIxjDaVq/TQS9X/dSmHz4BwI6St
	 ct65y3WsxV9f9vSk4BIuuEA3xzfOkd3tqh4kDJKdk6vu+wTgM7a4B8UYw4evBhxCafg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SlQGmK3GfT0qDEXFTQmxNcYHd1v3ytlMVvU+psf+o9A=;
	b=BcolUH0hghjUHVQSBB96P9n1m2eG3HnsV2GhJAMNdAPZTajxAPm2o95G2hWvGKco9/jl
	 QDichVnHnDHlVERT7HxSTbeAPYFYgg24MsnmEmg68rY71y+PUczQB5fPM42b/AfHg70Wz
	 c1EgFqzXuZQ2IoyKXi1lrfXdv2ZxwhPydXLv8WzKbY3PwjCgkLm7wrNDNT7TxCFNAup9g
	 NRckgKm/Pbjo8UilwMUvTPoOSPfDJ+egLp3ZU5AZ10gXMTPsfqmG2V02+6Y6107pPS/Jq
	 ZwELqFSe4z81Y7UdQNl3Ro+h3lKQB3AbahGMAhUczfr1fTl+0LhLwrAm5auasvC/mdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F24LwcBB;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8898606A339
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8898606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F24LwcBB
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3cecbda48so842056137.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706679; x=1794311479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlQGmK3GfT0qDEXFTQmxNcYHd1v3ytlMVvU+psf+o9A=;
        b=F24LwcBB4Y0ix0078jknls3tcll95S2BkNbrQEAf75YIHMTcRsU4FdaTtn/spyKb1T
         NW72JHRoyGd6CIH5EREUNUkOqJBksxArb9voX0hqgBKpAgMuPgo3KJ4yvpR5Uxbk8cvx
         PjhZ4J8rckC2gsBs20YYDpM7NmDkMgpfbYTiuexbMNQ0Y+qsoWmXpxACr4o6EX32ZhqX
         at9rLyfpLHX/gx5iChI6trd7O9RriDvuQmcwQN8wJPTFwXzWrnqoXFsjwu2PP2L8qSiW
         0pkS2PUQtkGGyMcf+IBhN4oS1kQNH4aXj7XDBiry62KsmwIF4VYxYi2Qzflr0+p6ytM3
         K4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706679; x=1794311479;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SlQGmK3GfT0qDEXFTQmxNcYHd1v3ytlMVvU+psf+o9A=;
        b=YoRs5d+5QoMSVwkOCSB6O9ElTPgv3oxF916RJ33V9oV+5jH0zoZpz3662eaZdA7QZa
         YiMLnAUkhvl8FrgwleE1IHTM3TWtE1bGgELQwXY7CJ+1LafIR9tZLLwY9xpz1x0g5PTN
         R3oo122lOMdV9uLu7BNQ7ohaDl+jhnGtL+vIK/zunnBNyFe9+fKJvt42jZX7D+ak269D
         r4gKSyv42nV8u3bdpq0QzRTjsraWDH/9VFsTaJcxF8AKPLLuLcLtWaIq/K9lli1rQJGT
         RWsgUQfQZLU8mBRTuenvlyC8fc0dLhPghOkla9NghXvUCuvPJeCXTyYy9QLxiDRFmvAC
         MJbw==
X-Forwarded-Encrypted: i=1; AKwUvByjzF5mkTIzJNiBnTaUBRcjDlxXe7Nz27OQfu7lV0E+VwxrxRko27k04RPENqrEX/UUBEBnrmOTr0xxWc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZCfWyO/ylxxexIgeytMAimF27dHnFa8mK1KgNzZzbpnrN81fM
	s3n0HBSUcQ2AZBf+mbs/wY+tVTy+swO3QCGp4EBKqenaKrALcktAZiM2
X-Gm-Gg: AYBFou0Yd7fRPaTTP2t/hJbm9QAOCPLFv0G7S4l8WqLzA4cxfgr26995PzdQr6ksSSz
	8cw+ZKLu56X7QukH/8OAXkuTFSNShvifvik7SM9zGlAwCKMgoRTyQXG6jhAYzWNWtbBL+B61Son
	byvesh8LqDnYkbY/cjhTeYHh+s/br9WGp6rrsMwv9msI1v5/0aen8c0L9glTL+S0BCtpa2BN8Mr
	SmUrZ1XTuQohER3CQiCHbfMxbPaD4ST2vvo+X3D5DWI7P3zkwZ8FwRBuSn1gaPHszIou5l/KQ5o
	YHS7U3800y/rInes+BRzLX7mz5eKk2xSxDNzZNMkGwWnjVo9z+0pI8BABdLdcesbpGuIcbG8Pk2
	0tHTXIf8D3MXQ73YigJpJEnAlLPL8i6e7At5KVdwAX/xsfrPF8b6SBqFP9r4aWNzmIbkg3L59SS
	8AbL8iDXskkcIdspEzcEcYXD0QHC3s/k6uTc4aBe1OpdN+NYK5kTZMTiOd0zqX7z6UyKM8VH7T4
	F9sXKxOG3+SJrKX/A/Gm6LgH3cGQU+dTyIB5jSYcOi0hwXfFBPmdMNkKSpy4heOruV30ZQQ3Vjv
	P+8g3Tpy4gPbCtn0stNXFyxLntchldJOZE71hEQTHLrLX0T0Pz5nMUNpMpZf
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id ada2fe7eead31-7d072d53fa3mr5609298137.33.1793706678757;
        Tue, 03 Nov 2026 03:51:18 -0800 (PST)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07768d366sm12231797137.10.2026.11.03.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:51:18 -0800 (PST)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	helgaas@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	lukas@wunner.de,
	d@rrell.co
Subject: [PATCH v4] thunderbolt: Call SXFP() on Apple systems with Alpine Ridge when suspending
Date: Tue,  3 Nov 2026 08:51:04 -0300
Message-ID: <20261103115104.13845-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Apple systems with Alpine Ridge, suspending to RAM with a device
connected to a Type-C port leaves the PCIe link to the upstream port of
the controller down on resume, and the ports are lost until reboot.
Calling the SXFP(0) ACPI method under the NHI before entering sleep
avoids that.

The firmware can set bit 26 of plug events CS_20 when it resumes the
NHI. While it is set SXFP(0) turns the router off and it does not come
back on resume, so clear the bit first and skip SXFP(0) if that fails.

Clearing the bit needs the control channel, which is already stopped
when the existing suspend_noirq hook of the NHI runs. Add a new NHI
hook, pre_suspend_noirq, that is called before the domain is suspended,
and use it for Alpine Ridge.

Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
Thanks for the review, Mika, and for the pointer to next.

v4:
- Call pre_suspend_noirq from __nhi_suspend_noirq() in nhi.c instead of
  from tb_domain_suspend_noirq(), so the domain code no longer calls
  into the NHI.  tb_acpi_force_power() now takes tb->lock itself.
- Dropped .reset_interface from ar_nhi_ops, as it is gone from next.
- Rebased on thunderbolt.git next (v7.4-rc1).

With the call moved, tb->lock is not held between SXFP(0) and the
suspend of the domain.  The control channel interrupt stays enabled
and hotplug_active is only cleared in tb_suspend_noirq(), so a hotplug
event in that window would still be handled.  I found this by reading
the code; in the cycles below the window was at most a few milliseconds
and no event came in.  How would you like this handled?

The note on v2 about SXFP(0) and the xHCI on the side with nothing
connected still applies.  In one of the cycles below SXFP(0) ran before
that xHCI was put into D3hot, which then failed with "device
inaccessible", and it resumed fine.

v3: https://lore.kernel.org/all/20261021141444.10632-1-fbeltranmillalen@gmail.com/
v2: https://lore.kernel.org/all/20261019202900.39062-1-fbeltranmillalen@gmail.com/
v1: https://lore.kernel.org/all/20261019134851.7496-1-fbeltranmillalen@gmail.com/

Testing:
I tested it the same way as v3, on a MacBookPro14,3 with 6.18.49 and a
backport of this patch, plus the PCI series and the ACPICA change
described in v3.  All cycles were 30 second suspends to RAM.

- Three cycles with a USB 3 disk on one side or the other, after a
  first one that I don't count.  Both domains came back each time, with
  both upstream port links at 8 GT/s x4, and the disk could be read.
- One cycle with nothing connected.  Both domains came back, and the
  disk came up at USB 3 speed when plugged in on either side afterwards.

With dynamic debug enabled, in every cycle "calling SXFP" on each NHI
was followed directly by "suspending..." from the same domain.  There
was no kernel WARNING during the whole boot.  The version for next was
only built (with W=1), not booted.  The cases listed as not tested in
v3 are still not tested.

 drivers/thunderbolt/acpi.c    | 49 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.c     |  3 +++
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/pci.c     | 44 +++++++++++++++++++++++++------
 drivers/thunderbolt/switch.c  | 32 +++++++++++++++++++++++
 drivers/thunderbolt/tb.h      |  4 +++
 drivers/thunderbolt/tb_regs.h |  3 +++
 7 files changed, 129 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index be91bc604900..7efe02385e01 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 
 #include "tb.h"
 
@@ -280,6 +281,54 @@ int tb_acpi_power_off_retimers(struct tb_port *port)
 	return tb_acpi_retimer_set_power(port, false);
 }
 
+/**
+ * tb_acpi_force_power() - Call SXFP(0) when entering system sleep
+ * @tb: Domain that is being suspended
+ *
+ * On Apple systems with Alpine Ridge the PCIe link to the upstream port
+ * of the controller does not come up on resume from system sleep if a
+ * device is connected, unless SXFP(0) ("Sx Force Power") under the NHI
+ * is called before entering it. Bit 26 of plug events CS_20 must be
+ * clear when SXFP(0) is called, otherwise the router is turned off and
+ * does not come back on resume.
+ *
+ * Must be called before the domain is suspended: clearing the bit needs
+ * the control channel, which is stopped by then.
+ */
+void tb_acpi_force_power(struct tb *tb)
+{
+	struct tb_switch *sw = tb->root_switch;
+	struct acpi_device *adev;
+	acpi_status status;
+
+	if (tb_switch_is_icm(sw))
+		return;
+
+	/*
+	 * Only when firmware handles system suspend, as in
+	 * quirk_apple_poweroff_thunderbolt(): the OS does not know how to
+	 * power the controller back on. pm_suspend_in_progress() excludes
+	 * hibernation.
+	 */
+	if (!pm_suspend_in_progress() || !pm_suspend_via_firmware())
+		return;
+
+	adev = ACPI_COMPANION(tb->nhi->dev);
+	if (!adev || !acpi_has_method(adev->handle, "SXFP"))
+		return;
+
+	guard(mutex)(&tb->lock);
+
+	if (tb_switch_set_bit26(sw, false))
+		return;
+
+	tb_sw_dbg(sw, "ACPI: calling SXFP\n");
+	status = acpi_execute_simple_method(adev->handle, "SXFP", 0);
+	if (ACPI_FAILURE(status))
+		tb_sw_warn(sw, "ACPI: SXFP failed: %s\n",
+			   acpi_format_exception(status));
+}
+
 static bool tb_acpi_bus_match(struct device *dev)
 {
 	return tb_is_switch(dev) || tb_is_usb4_port_device(dev);
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e99a3fcc4a29..61ebb64cd16f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1085,6 +1085,9 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 	struct tb_nhi *nhi = tb->nhi;
 	int ret;
 
+	if (nhi->ops->pre_suspend_noirq)
+		nhi->ops->pre_suspend_noirq(nhi);
+
 	ret = tb_domain_suspend_noirq(tb);
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 88af9ab9fde7..1f4b774c7ec5 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -42,6 +42,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * struct tb_nhi_ops - NHI specific optional operations
  * @init: NHI specific initialization
  * @add_links: Setup device links for tunneling native protocols
+ * @pre_suspend_noirq: NHI specific hook called before the domain is suspended
  * @suspend_noirq: NHI specific suspend_noirq hook
  * @resume_noirq: NHI specific resume_noirq hook
  * @runtime_suspend: NHI specific runtime_suspend hook
@@ -57,6 +58,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
 	bool (*add_links)(struct tb_nhi *nhi);
+	void (*pre_suspend_noirq)(struct tb_nhi *nhi);
 	int (*suspend_noirq)(struct tb_nhi *nhi, bool wakeup);
 	int (*resume_noirq)(struct tb_nhi *nhi);
 	int (*runtime_suspend)(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 4408229d8ac7..9715ce1ec731 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -338,6 +338,26 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.init_interrupts = nhi_pci_init_msi,
 };
 
+/* Alpine Ridge specific NHI operations */
+
+static void ar_nhi_pre_suspend_noirq(struct tb_nhi *nhi)
+{
+	if (x86_apple_machine)
+		tb_acpi_force_power(dev_get_drvdata(nhi->dev));
+}
+
+static const struct tb_nhi_ops ar_nhi_ops = {
+	.add_links = nhi_pci_add_links,
+	.pre_suspend_noirq = ar_nhi_pre_suspend_noirq,
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = nhi_pci_ring_request_msix,
+	.release_ring_irq = nhi_pci_ring_release_msix,
+	.shutdown = nhi_pci_release_irq,
+	.is_present = nhi_pci_is_present,
+	.init_interrupts = nhi_pci_init_msi,
+};
+
 /* Ice Lake specific NHI operations */
 
 #define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
@@ -654,14 +674,22 @@ static struct pci_device_id nhi_ids[] = {
 	},
 
 	/* Thunderbolt 3 */
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_USBONLY_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_USBONLY_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_NHI) },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_USBONLY_NHI) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_USBONLY_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_USBONLY_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_USBONLY_NHI),
+	  .driver_data = (kernel_ulong_t)&ar_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI0),
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..0b29e6ebb597 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -4034,6 +4034,38 @@ int tb_switch_xhci_connect(struct tb_switch *sw)
 	return 0;
 }
 
+/**
+ * tb_switch_set_bit26() - Set or clear bit 26 of plug events CS_20
+ * @sw: Alpine Ridge router
+ * @value: %true to set the bit, %false to clear it
+ *
+ * On Apple systems the firmware can set this bit when it resumes the
+ * NHI. While it is set, SXFP(0) turns the router off and it does not
+ * come back on resume.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_switch_set_bit26(struct tb_switch *sw, bool value)
+{
+	unsigned int offset = sw->cap_plug_events + TB_PLUG_EVENTS_CS_20;
+	u32 val;
+	int ret;
+
+	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, offset, 1);
+	if (ret)
+		return ret;
+
+	if (!!(val & TB_PLUG_EVENTS_CS_20_BIT26) == value)
+		return 0;
+
+	if (value)
+		val |= TB_PLUG_EVENTS_CS_20_BIT26;
+	else
+		val &= ~TB_PLUG_EVENTS_CS_20_BIT26;
+
+	return tb_sw_write(sw, &val, TB_CFG_SWITCH, offset, 1);
+}
+
 /**
  * tb_switch_xhci_disconnect() - Disconnect internal xHCI
  * @sw: Router whose xHCI to disconnect
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..9900d0018174 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1099,6 +1099,8 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw);
 int tb_switch_xhci_connect(struct tb_switch *sw);
 void tb_switch_xhci_disconnect(struct tb_switch *sw);
 
+int tb_switch_set_bit26(struct tb_switch *sw, bool value);
+
 int tb_port_state(struct tb_port *port);
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
@@ -1524,6 +1526,7 @@ int tb_acpi_init(void);
 void tb_acpi_exit(void);
 int tb_acpi_power_on_retimers(struct tb_port *port);
 int tb_acpi_power_off_retimers(struct tb_port *port);
+void tb_acpi_force_power(struct tb *tb);
 #else
 static inline bool tb_acpi_add_links(struct tb_nhi *nhi) { return false; }
 
@@ -1537,6 +1540,7 @@ static inline int tb_acpi_init(void) { return 0; }
 static inline void tb_acpi_exit(void) { }
 static inline int tb_acpi_power_on_retimers(struct tb_port *port) { return 0; }
 static inline int tb_acpi_power_off_retimers(struct tb_port *port) { return 0; }
+static inline void tb_acpi_force_power(struct tb *tb) { }
 #endif
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 92d893634d2b..0940e8b12d89 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -563,6 +563,9 @@ struct tb_regs_hop {
 #define TB_PLUG_EVENTS_CS_1_LOW_DPIN_DISABLE	BIT(5)
 #define TB_PLUG_EVENTS_CS_1_HIGH_DPIN_DISABLE	BIT(6)
 
+#define TB_PLUG_EVENTS_CS_20			0x14
+#define TB_PLUG_EVENTS_CS_20_BIT26		BIT(26)
+
 #define TB_PLUG_EVENTS_PCIE_WR_DATA		0x1b
 #define TB_PLUG_EVENTS_PCIE_CMD			0x1c
 #define TB_PLUG_EVENTS_PCIE_CMD_DW_OFFSET_MASK	GENMASK(9, 0)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

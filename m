Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900901;
	b=dXpF7+n9WTeGEYx1zROEnfhmd3Ja0/gpQLe1cE76D75wl/1BdQWuG4scmfMOyjDrsIa6
	 V1IY/l18bEINlMFIXXuujz4ldwxK7X/vy32ZEkaQvgGsDVPSAy/c6qIrhWjFekZRnhFhO
	 ah3ObfxWfkNUZBD1g0ZUrmVjcZKVVmhW3rk/FteAIXPCrfohC14IYMx0JIiozs4q3sxU/
	 26cet7w9Pksl1hMJz2N/hO4YgDQg08uQxE2NEXYiYu47+IGtqisDLdbJ5afPK5xUTyQna
	 OBsHPVwNfgmM0DYRizgipp45uN9Z9Pezaql6umxJmtNG343W0XC4Rh4aiU9HQG/tuuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CWT24l7xbjXALR1pzUf9E6S/BOyGgYFBc+LwoYkXDPA=;
	b=R328RLmBt+Aj7zNKRbhv87bxgPkqYOYlM+vxIVxW0LhLW9HBcMSO0cFBus5aCCPIi6Kn
	 hF3/nf419NJVW0FANsuyFLzH21jDVBD6VmVF2BlI7yTISjOOROOMIyEMFEwZtRlYJOtQ1
	 cO4HXiZGwjIfTo+lrN2KXegvH7AxvhMyufGt4x56XAu8OBlamj4falGn1WEMbkxbiMUNO
	 d+CHoAPwZFJQmhrKQqvccsvtwJCUdA6AdYlagr0OmQNhHNzsshqT9RhDiYHf4ciXcN/5Y
	 sW3A92E6kXI74oFZ6OjarX8hp87oo4xYgErAq2LmqRFXfLVQxtCJ9NGD5lTumT9NI2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0AQQkZV;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B89606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B89606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0AQQkZV
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3321702eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900900; x=1793505700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CWT24l7xbjXALR1pzUf9E6S/BOyGgYFBc+LwoYkXDPA=;
        b=V0AQQkZVsPj26wQjmooMOtNIZ9VaL+q7p0PpDPzbpMyPgmzv2YpX1VClwb1eMiNhS6
         JMIKxZlz6c6SciqPUu6Qsa+k/IF0RVNHfKD+48XV0jyrNgYzbQFFQ6HANo5HZbj6XD/7
         VH02hkwAcrlxnBo8xr9sCX22zgiz8Ynm0OEm2PwwW7U/YkQqhYFNlAKo1f9OimOFIFOE
         PHV4FjTYlH17WBLSAo15J4HkWaM3f7L2TCYOxPyXQMqjg0t84hSaWwNiawjJ8zHOw8Yz
         zNS1UMJk9s4O6Dl+7TojEsE0pCB4mWspyNhKOImutko9jisWYPk+qnSBKcP0yRbVQk1e
         v1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900900; x=1793505700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWT24l7xbjXALR1pzUf9E6S/BOyGgYFBc+LwoYkXDPA=;
        b=WSN+3RiRxPQkw54AzygMAyr2vFgt6Bt1Q6CfTNgbrCjVAFG/A9BaRy3kDvJ9frXfoi
         WANBaZ5r5Z4GgLvVJYiuPsAuITuz0LUjFDy25DRADTYNVWpXeU9Pu37t0MCuvvDAHMy0
         PZ/nENSyKWHblVe+gW9eBtTiwR2n1+SF7DtEdXJ7tw2YGNzQ0tU4XasRTnn7lu83NWVM
         vUinkJEgCoRFtPPPqXc/slY/JGzIXn8VvQmBz2+r8q5HKBsoLo37x/INP8vmI0R/amnY
         +Kecg7ZRZqfzdcHvnj1/c6wI8VCHoPs8tchx4tPWVHUqtZsAgjx/UHfTg+DPRyXWnqqo
         9oYg==
X-Forwarded-Encrypted: i=1; AKwUvByLNjojWL+j5+RyjvyfZReuz/ByEOhla9C6jblbKee5P/UPJOhSb2pzvv93AlFaIfJ961lkhmUUQ8IJTNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdEeHducHrzcMKu66CPFOSKsCZD6DT8hN81VdLRhBi+xhb9BwC
	WZxak0wrw1quX4oyjaRNuSoW7E5dIiVZ5oyXmdOlY02EtSGGxagHoPc=
X-Gm-Gg: AYBFou3c74nv3NZ72m1+1LZVWZOiWHbyeR9voeTaT6AQUHPR7f/+ro+Y6qZkU5U3zEA
	1u2eGuHOariL98yfzzWvmFGDDP8eTYzVs8e8FfM6IK3S1iCALJ3ik9fVd3inMshEfqcgwm4P6TI
	11ql3io5R8JA7Ucl+9RFt0wO985Gunw3+lE7Ryih09+y6CrEopAWVNj8x1kuHkocoUGBI9IhKKj
	n9WdMIfCjRCpP30EItdnYkc8fMWF3+pJjJj+hB5WUpojIQ8YQrixrcUCnVJkqb8fiXoZ5l69MkC
	cqGQiWOfqXH9bnlGsRr4IkRPeKjT8Hq68u8wBHGymYpZkccJQQ6AXixV2cyAQzE/YZBvtrji0b6
	7KM+0eNdjDt6GsPLm1ARM4QFo/Ce0baLQo5obM4kMZFuIgXQbAHPps3MT3Nmn4P6W+8vSm2pWkv
	PcpwiH08DddBTBwlWbi4QPO5cMAw/KBts5hXl+xCLT2j+PUW1HUwDvEFR/EvZLAulBcNV8K1aDJ
	cLKRrfwMoaDx9zm2uA0yqcvM3Q6WLlJkDtQNm8kVk5ViqBtTnliqWx0zn2nv0W5A9WGlH2i5iEu
	E/KVze8rofHKRo0=
X-Received: by 2002:a05:701b:4212:20b0:19d:6484:869f with SMTP id a92af1059eb24-19d648486dbmr1491542c88.7.1792900900042;
        Sat, 24 Oct 2026 21:01:40 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:01:39 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 01/13] platform/apple-gmux: Fix power for MMIO systems
Date: Sat, 24 Oct 2026 23:59:37 -0400
Message-ID: <20261025040046.1602-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
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

Currently The dGPU on MMIO Systems, dies when we write the gmux values
to turn off the gpu.

On most systems we can just write PWG1 (link-training method) and the
dGPU comes up, then we write a MMIO variable, and run PWG3
(link-retraing method), to stablize the dGPU.

But on 16,1 and 16,4 this dosent work, instead we have to use PWRD
method, which turns off the entire bridge, and completely messes the
pci config, so we can't use pci to traverse through it. we save the
entire bridge using ACPI addresses then we run PWRD(1) to turn off
the bridge, then we write gmux states, and resume we do the vice
versa, but here we dont need to retrain the link and write the
MMIO variable.

Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 177 ++++++++++++++++++++++++++++--
 1 file changed, 170 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9c728ac4e..4e8786a5e 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/dmi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -65,6 +66,11 @@ struct apple_gmux_data {
 
 	struct backlight_device *bdev;
 
+	/* power handling data */
+	struct pci_dev *discrete_pdev;
+	bool uses_pwrd;
+	enum apple_gmux_type type;
+
 	/* switcheroo data */
 	acpi_handle dhandle;
 	int gpe;
@@ -502,23 +508,171 @@ static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
 /**
  * DOC: Power control
  *
- * gmux is able to cut power to the discrete GPU. It automatically takes care
+ * gmux is able to cut power to the discrete GPU. On most
+ * Systems the gmux automatically takes care
  * of the correct sequence to tear down and bring up the power rails for
  * core voltage, VRAM and PCIe.
+ *
+ * But on most MMIO Systems, we have to PCIE link-train the discrete GPU after
+ * power on, we can do that using PWG1 and then to stablize we write to
+ * 0x8C340 and then link-train the PCIE link again (this time using PWG3).
+ *
+ * But on MacBookPro16,1 and MacBookPro16,4, the PWG1 method does not work
+ * instead we have to use PWRD method, which turns off the entire bridge and
+ * messes up the PCI config, so we can't use pci_upstream_bridge to traverse
+ * through the bridge, so we use ACPI addresses to save/restore bridges.
+ *
+ * NOTE: Communication to these bridges (not the dGPU/HDA) in any form
+ * when the bridge is off, will result in CPU CATERR.
  */
 
+static int gmux_save_restore_pci(acpi_handle parent_handle, const char *name,
+				bool save, acpi_handle *out_handle)
+{
+	acpi_status status;
+	acpi_handle handle;
+	struct acpi_device *adev;
+	struct device *dev;
+	struct pci_dev *pdev;
+
+	if (name) {
+		status = acpi_get_handle(parent_handle, name, &handle);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		if (out_handle)
+			*out_handle = handle;
+	} else
+		handle = parent_handle;
+
+	adev = acpi_fetch_acpi_dev(handle);
+	if (!adev)
+		return -EIO;
+
+	dev = acpi_get_first_physical_node(adev);
+	if (!dev || !dev_is_pci(dev))
+		return -EIO;
+
+	pdev = to_pci_dev(dev);
+
+	if (save) {
+		pci_save_state(pdev);
+		pdev->current_state = PCI_D3cold;
+	} else {
+		pdev->current_state = PCI_D0;
+		pci_restore_state(pdev);
+	}
+	return 0;
+}
+
 static int gmux_set_discrete_state(struct apple_gmux_data *gmux_data,
 				   enum vga_switcheroo_state state)
 {
 	reinit_completion(&gmux_data->powerchange_done);
+	acpi_handle discrete_handle = ACPI_HANDLE(&gmux_data->discrete_pdev->dev);
+	acpi_status status;
+	unsigned long long result;
+
+	if (!discrete_handle)
+		return -ENODEV;
 
 	if (state == VGA_SWITCHEROO_ON) {
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+		if (gmux_data->type == APPLE_GMUX_TYPE_MMIO) {
+			u16 vendor;
+			int i;
+
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 2);
+			msleep(100);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+
+			if (gmux_data->uses_pwrd) {
+				acpi_handle handle;
+
+				status = acpi_execute_simple_method(discrete_handle, "PWRD", 0);
+				if (ACPI_FAILURE(status))
+					return -EIO;
+
+				if (gmux_save_restore_pci(NULL, "\\_SB_.PCI0.PEG0", 0, &handle))
+					return -EIO;
+
+				if (gmux_save_restore_pci(handle, "EGP0", 0, &handle))
+					return -EIO;
+
+				if (gmux_save_restore_pci(handle, "EGP1", 0, &handle))
+					return -EIO;
+
+				if (gmux_save_restore_pci(handle, "GFX0", 0, NULL))
+					return -EIO;
+
+				if (gmux_save_restore_pci(handle, "HDAU", 0, NULL))
+					return -EIO;
+			} else {
+				status = acpi_evaluate_integer(discrete_handle,
+							"PWG1", NULL, &result);
+				if (ACPI_FAILURE(status) || result)
+					return -EIO;
+			}
+
+			for (i = 0; i < 1000; i++) {
+				pci_read_config_word(gmux_data->discrete_pdev,
+						     PCI_VENDOR_ID, &vendor);
+				if (vendor != 0xffff)
+					break;
+				msleep(1);
+			}
+			if (vendor == 0xffff)
+				return -ETIMEDOUT;
+
+			if (!gmux_data->uses_pwrd) {
+				void __iomem *bar = pci_iomap(gmux_data->discrete_pdev, 0, 0);
+
+				if (!bar)
+					return -ENOMEM;
+
+				iowrite32(ioread32(bar + 0x8c340) & 0x3fffffff, bar + 0x8c340);
+				pci_iounmap(gmux_data->discrete_pdev, bar);
+
+				status = acpi_evaluate_integer(discrete_handle,
+							"PWG3", NULL, &result);
+				if (ACPI_FAILURE(status) || result)
+					return -EIO;
+			}
+		} else {
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+		}
 		pr_debug("Discrete card powered up\n");
 	} else {
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		if (gmux_data->type == APPLE_GMUX_TYPE_MMIO) {
+			if (gmux_data->uses_pwrd) {
+				acpi_handle parent_handle = discrete_handle;
+				bool saved_hda = false;
+
+				while (ACPI_SUCCESS(acpi_get_parent(parent_handle,
+								&parent_handle))) {
+					if (!saved_hda) {
+						if (!gmux_save_restore_pci(parent_handle,
+									"HDAU", true, NULL)) {
+							saved_hda = true;
+							pci_save_state(gmux_data->discrete_pdev);
+							gmux_data->discrete_pdev->current_state =
+									PCI_D3cold;
+						}
+					}
+					if (gmux_save_restore_pci(parent_handle, NULL, true, NULL))
+						break;
+				}
+				status = acpi_execute_simple_method(discrete_handle, "PWRD", 1);
+				if (ACPI_FAILURE(status))
+					return -EIO;
+			}
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			mdelay(10);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		} else {
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		}
 		pr_debug("Discrete card powered down\n");
 	}
 
@@ -552,10 +706,15 @@ static enum vga_switcheroo_client_id gmux_get_client_id(struct pci_dev *pdev)
 	else if (pdev->vendor == PCI_VENDOR_ID_NVIDIA &&
 		 pdev->device == 0x0863)
 		return VGA_SWITCHEROO_IGD;
-	else
+	else {
+		if (apple_gmux_data->discrete_pdev != pdev) {
+			pci_dev_put(apple_gmux_data->discrete_pdev);
+			apple_gmux_data->discrete_pdev = pci_dev_get(pdev);
+		}
 		return VGA_SWITCHEROO_DIS;
-}
 
+	}
+}
 static const struct vga_switcheroo_handler gmux_handler_no_ddc = {
 	.switchto = gmux_switchto,
 	.power_state = gmux_set_power_state,
@@ -803,6 +962,9 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	if (!gmux_data)
 		return -ENOMEM;
 	pnp_set_drvdata(pnp, gmux_data);
+	gmux_data->type = type;
+	gmux_data->uses_pwrd = (dmi_match(DMI_PRODUCT_NAME, "MacBookPro16,1") ||
+		 dmi_match(DMI_PRODUCT_NAME, "MacBookPro16,4"));
 
 	switch (type) {
 	case APPLE_GMUX_TYPE_MMIO:
@@ -993,6 +1155,7 @@ static void gmux_remove(struct pnp_dev *pnp)
 
 	gmux_fini_debugfs(gmux_data);
 	vga_switcheroo_unregister_handler();
+	pci_dev_put(gmux_data->discrete_pdev);
 	gmux_disable_interrupts(gmux_data);
 	if (gmux_data->gpe >= 0) {
 		acpi_disable_gpe(NULL, gmux_data->gpe);
-- 
2.55.0


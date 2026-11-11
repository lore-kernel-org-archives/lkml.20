Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378749;
	b=Vgbb5SB0HDzGmJ0DS21QBEHiqT58K+ajRUTW8PdGhrCpzIaCS7FPy2qbg3Q51lIRgeA8
	 QA4CMlG+GgPQJg2wfw3JFa8aDGq4j5C43jEq2zuJCyCdEfp/h6z11MKLF/90NmUs0DJge
	 63YzE7jHI2h2BaBru0Oz87Tyfkadp0K3l0u3IbGAm0mpY6xg8/hlF7KJTkpJPJQguwBnC
	 eH1BzzNGXCgpzFBAjD6GtqP3Blgc3GnD7eCeNm1sNzoQ5Kv8rxaSir8wTJBBdU5L4JGY0
	 pjYysCzqgajADFPeSWnbHsGQbvQB5h/VYeQ2VnyS1NSNJkellWJZ/mC1hlSZdtRdy3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjW1KmGU+DS1ERJ9U4i8KV9Kn21Cgrdw5EW3c2f8mCk=;
	b=efGJcmiWGNzvf9cqsesy7RbemCQXJa2ZDgjqyCD71Uy72oLiBAoicJWbNOIUw3p9QeVq
	 YwQ1HZzYyuHerP3BtcWR3uiRphKYmCln3KT4pxFHu5T88mX7GzlK0gqv/1hR72fysOgvp
	 iS/pXImfxiNGRWodhnQKcSHjFP4dzEMUottvYFECpmP0VYgRG19YZ8OIb1gbRWBolg812
	 JCQWwhjcgsJ59O6iIDk1zprmMzpNMWvBoJnPqr0ehCxLBNzeus2Qkjqo/MBaiRp5qWE/K
	 IxQ/P1ECRcFl3XrFU/h22Zw0KB8ZE3hOnwGoxbSfj4qj+THfBSOPRR50rHoXvd9pxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WA/vHAqI";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB926606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB926606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA/vHAqI
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4910b863b84so1804845f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378747; x=1794983547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjW1KmGU+DS1ERJ9U4i8KV9Kn21Cgrdw5EW3c2f8mCk=;
        b=WA/vHAqIEHnJh6ZcLBcb+qvcB0j8M5spp1r2VAFx0pXQ1dc/VjhnstrlbE5O6eY5nN
         5p4b2/79jrj4YjBrYwChPdDBPokn787ElHJlbWCYJ0mqS0/OFjtKybOa1pr8PZzpT7gV
         UgfFWzInBd4BaB0vNGH5kzbevq52AwvbzS6itn1E4FyZodDxMQXyDVhT1xEi4fuI2Cqr
         FazBxdcZxshv8vyuSKtTeOnAFWUPMTf2zbvCFWIb2eAcNzM5cUPCPCK0Cnb+MAhZp8tG
         3CZVSW4XhW1NEOI8mM0Bnr2DPGIqwridDqSr+tUQVUWZwzBGGolKw7M0HXdxHI5QFyH8
         PHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378747; x=1794983547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjW1KmGU+DS1ERJ9U4i8KV9Kn21Cgrdw5EW3c2f8mCk=;
        b=RCqJXNiDVFyzfIfPK+pNTfdA53iFtbQuhYHOFCGR0vV+dPonz3p+WTgsME0GTGtDfx
         bdNWzySvBnD9kV1PLn8Rb0rCJjeuOmlwMHY+XPdZGvoBqOyyl6C99eQB+HxG852Ocspc
         oKycv8julWgesH9+M3rzf8FEIecGGNDLOAl6zVnE2dX2SUBXdyYyJ9FSetrkLHajhhsz
         sPjmUhGo3gF/H9xAe5VzLeJ49Ij3Z3lvPYnA9YEIIiMhMBW7oSQuLeMy03RSNMIWxCuY
         fr4138ISdt8TLo1lxPHA3k/jmpll4nQCEsHgT2D5rSHxyTPquXQ7TT2FcQ8phPhJ3d0D
         aFpw==
X-Forwarded-Encrypted: i=1; AL+hErEBnj7HPhrE26AneoptZFWxJx/WaUx3NYuufiAq5rlJia0WURNP4P640aKqlW8QzS7NklUNfPDdxmYKKUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9esrk1iphTn0suoLK0KB5V/YDJ2viCQHryBxWJzPOnhmDNlhgv
	tK82xWZ6Ng8gwnSd6HRYq8m5Y6YuAApdtBc+pRgCW+hgSmdvcdqp9unf
X-Gm-Gg: AYBFou2eAAY5ysuMG/M9wuVCpmhFRpqsPWGBAo6PYj3Kje0XP+fQPlTfjFWuYaZOXV4
	ZxrmpNric852hYfohmf/xeBgtQKOUFYlHMtLZA2YPdtEurzNno2EVEvYAJCJ9MQ5elG1ZKmRUPg
	E4gB/Oqdw5jt7yVEaNzmhDPKxVS6tLrYBCIeuuxmZ1Yu8uAqIscuJfNab8NXrhk+d/VSgy2OFtY
	ltl9X89WYrZTQzCoe6fKKV+yz+rN9jEh5Q/VGzc2hlZA2AN+Sff2FV2jeZweUV5fjcQyH8h4HGp
	qA+OhkAqjBMPU1OM/XpHX4YunM+Wod083jPH3Zd9OpEA/TF4TQzZ41d7W2np5HAzkNEzz7UMaN/
	npnTqo0Y2/8GAA3jAPlke/styoY9wlWJiiPKFQBvQMedl23C/iCegkErxEons4cjHSNBe7OL42/
	T8S3zmno8jU8LXdAZEZr+13Lfh8/ZnNGublRn3Cr1lDabxmVfwr2CvBSJHD6XvbwtwkKzRpbOsJ
	8D8Jb6XiROT5Yj9mvVoAqg+UjVgh8vqhb74d8HscKK6cRG1jgRh5l/yP+zQD86O/v7Qu8IN21sd
	7eNNyW7CZGqpQ/T/8l59xxF/UK4bTBRbZSpaBW3YcwYVNHDjqnUk
X-Received: by 2002:a05:600c:4883:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4ba08e1775cmr17291825e9.15.1794378746896;
        Tue, 10 Nov 2026 22:32:26 -0800 (PST)
Received: from Sheldon ([185.4.35.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm8823674f8f.9.2026.11.10.22.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:32:26 -0800 (PST)
From: Victor Carreras <vicajilau@gmail.com>
To: rafael@kernel.org,
	hdegoede@redhat.com,
	bhelgaas@google.com,
	lukas@wunner.de
Cc: mika.westerberg@linux.intel.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] ACPI: x86: Disable wakeup on MSI MS-1592 and MS-1594 dGPU root port
Date: Wed, 11 Nov 2026 07:32:21 +0100
Message-ID: <20261111063221.14478-1-vicajilau@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024054711.21587-1-vicajilau@gmail.com>
References: <20261024054711.21587-1-vicajilau@gmail.com>
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

On MSI Summit E16 Flip A12UCT (motherboard MS-1592, BIOS E1592IMS.111)
and MSI Prestige 16 Studio A13VE / Summit E16 Flip A13VET (motherboard
MS-1594, BIOS E1594IMS.115), the I2C touchpad (ELAN0305:00, 04F3:31FD)
permanently stops generating interrupts as soon as the discrete NVIDIA
GPU (0000:01:00.0) and its parent PCIe Root Port (0000:00:06.0,
\_SB.PC00.PEG0) enter D3cold.

In the platform's SSDT (MSI_NB / AdlP_Rvp), \_SB.PC00.PEG0 sets its wake
GPIO (WAKG) from the BIOS NVS variable P1WP, which erroneously points to
GPP_A20 (INTC1055:00 pin 62) -- the GPIO interrupt line wired to the
touchpad.

During boot, \_SB.PC00.PEG0.PON() calls \_SB.SHPO(WAKG, One), setting
PAD_CFG0_GPP_A20.GPIROUTSCI = 0 and HostSwOwn = 1 so the OS GPIO driver
owns the pin. However, when the root port runtime-suspends to D3cold,
Linux enables ACPI wakeup via \_SB.PC00.PEG0._DSW(1, 0, 3), which sets
WKEN = 1. Subsequent evaluation of \_SB.PC00.PEG0.PXP._OFF -> POFF()
executes:

  If (CondRefOf (WAKG))
  {
      If (((WAKG != Zero) && WKEN))
      {
          \_SB.SHPO (WAKG, Zero)
      }
  }

This switches GPP_A20 ownership to ACPI GPE mode (HostSwOwn = 0,
GPIROUTSCI = 1), silencing the touchpad interrupt until the dGPU wakes
back up to D0. Under Windows, _DSW is not armed for S0 D3cold on this
root port, leaving WKEN = 0 so POFF() powers off the dGPU (\PIN.OFF(PWRG))
without touching GPP_A20.

_DSW on the root port is reached through two paths: acpi_pci_wakeup()
on the root port itself, and acpi_pci_propagate_wakeup() when the dGPU
below it runtime-suspends. Both only check acpi_pm_device_can_wakeup(),
i.e. adev->wakeup.flags.valid, so clearing the device's wakeup
capability is not enough (the PCIe PME service sets it again anyway).

Add an early PCI fixup in drivers/acpi/x86/utils.c for boards MS-1592
and MS-1594 on root port 0000:00:06.0 (8086:464d on 12th Gen Alder
Lake-P and 8086:a74d on 13th Gen Raptor Lake-P/H) that clears
adev->wakeup.flags.valid on its ACPI companion. Early fixups run from
pci_setup_device() after pci_set_acpi_fwnode() and before
pci_device_add() calls device_add(), so pci_acpi_setup() never sees the
port as ACPI wakeup capable and stays balanced with pci_acpi_cleanup().
The root port and dGPU still reach D3cold normally, while GPP_A20 stays
owned by the GPIO driver.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220725
Cc: stable@vger.kernel.org
Signed-off-by: Victor Carreras <vicajilau@gmail.com>
---
Changes in v3:
- Clear adev->wakeup.flags.valid from a DECLARE_PCI_FIXUP_EARLY quirk
  instead of clearing the device wakeup flags in a final fixup. In v2,
  pcie_pme_mark_devices() set can_wakeup back to true, and
  acpi_pci_wakeup() / acpi_pci_propagate_wakeup() only check
  adev->wakeup.flags.valid, so _DSW was still evaluated (sashiko-bot).
  Running before pci_acpi_setup() keeps setup and cleanup balanced.
- Tested on MS-1594 without the SSDT override: PEG0 no longer shows up
  in /proc/acpi/wakeup, the root port and dGPU reach D3cold and the
  touchpad keeps generating interrupts across repeated D3cold cycles.
- Link to v2: https://lore.kernel.org/r/20261024054711.21587-1-vicajilau@gmail.com

Changes in v2:
- Move the quirk from drivers/pci/quirks.c to drivers/acpi/x86/utils.c
  as it is x86-specific (Lukas Wunner).
- Link to v1: https://lore.kernel.org/r/179272791966.20251.3697951431087014523@gmail.com

 drivers/acpi/x86/utils.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639..11a5d51be 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -665,3 +665,56 @@ void __init acpi_proc_quirk_mwait_check(void)
 	 */
 	dmi_check_system(acpi_proc_quirk_mwait_dmi_table);
 }
+
+/*
+ * On MSI Summit E16 Flip A12UCT (board MS-1592) and MSI Prestige 16 Studio
+ * A13VE / Summit E16 Flip A13VET (board MS-1594), the BIOS SSDT (MSI_NB /
+ * AdlP_Rvp) assigns the touchpad's GPIO interrupt pin (GPP_A20) as the PCIe
+ * wake GPIO (WAKG / P1WP) for the dGPU root port (\_SB.PC00.PEG0, 0000:00:06.0).
+ *
+ * When ACPI wakeup is armed on this root port via _DSW (setting WKEN = 1),
+ * subsequent D3cold transitions (\_SB.PC00.PEG0.PXP._OFF -> POFF) call
+ * \_SB.SHPO(WAKG, Zero), switching GPP_A20 ownership from GPIO driver mode
+ * to ACPI GPE mode and freezing the I2C touchpad (ELAN0305:00).
+ *
+ * Mark the root port's ACPI wakeup as invalid so that _DSW is never evaluated
+ * for it, neither directly nor when wakeup is propagated from the dGPU below
+ * it. This has to happen before pci_acpi_setup() runs from device_add(), so
+ * that pci_acpi_setup() and pci_acpi_cleanup() see the same state.
+ */
+static const struct dmi_system_id msi_peg0_no_wakeup_dmi_table[] = {
+	{
+		.ident = "MSI MS-1592",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1592"),
+		},
+	},
+	{
+		.ident = "MSI MS-1594",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-1594"),
+		},
+	},
+	{}
+};
+
+static void quirk_msi_peg0_no_wakeup(struct pci_dev *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&dev->dev);
+
+	if (!adev || !adev->wakeup.flags.valid)
+		return;
+
+	if (pci_dev_id(dev) != PCI_DEVID(0, PCI_DEVFN(6, 0)))
+		return;
+
+	if (!dmi_check_system(msi_peg0_no_wakeup_dmi_table))
+		return;
+
+	pci_info(dev, FW_BUG "Disabling ACPI wakeup to avoid touchpad GPIO (GPP_A20) takeover in D3cold\n");
+	adev->wakeup.flags.valid = 0;
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x464d, quirk_msi_peg0_no_wakeup);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0xa74d, quirk_msi_peg0_no_wakeup);
-- 
2.55.0


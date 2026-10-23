Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727925;
	b=LbTQlDrrDKLwPBAKHs+nK79Gh+hTGVWD+Ysk2pxSQh5Cw7NGwyzehLRHzL4OArl6S87Q
	 n67LtdS4vdsQZY1vtuAb8Y4zuuZjAakN+78ado/EVY4BaX7bQlu5mCIYzSu6gQ4WBREs7
	 zL+HSzkGF1zORbDNKDdsr0Rt7BZBPNCkb3A6eo+ZWHFwhQ/gG1mG0F+K8GLqSF2sEgEIj
	 2S0TgzwRq1Puxmw7Nkleyo8HU9wV4oCbMDuiIJYlNjZfeICLlQnqDBLI/a8NpiESLFeXF
	 Cl09DmvNJbd8yk9sX12zHKYxzM8btZSvBI88X/REqwEn6pvIXsxXVeNaLyUSEig/WMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NwQB+K0m+GVHe1I8OheGGsFKNnF6rubBvY7XUeZM4Hk=;
	b=kMrKgT+g/mj9ZiBUT5YGbqkxVWsAI6LlAWfbcn1Izd/n0+IvgvpNfz62b1nnU6AipPWu
	 vMnIVIVVVlb7Q1gqdJpxiWw4fu6bpzSxlKrqd2DT56lQpjKuSNkNdE72zNrb3uGpB8xcZ
	 dlpQk18A+KiyaaxgE6+aGGUjO/0SV/DUvMuq9wRIo6fcN4/g5BnhUMOE5aTWdgY8aDr/w
	 a3NBZJM8+5dPlfqSUftm8JmM96s9xy0b3Xcm/dIxXp0aFImz/05SHxVsKcj1q7GC2o4t+
	 ahpL0/QhuvT5uXLIfoLkTSAoZNvYWvLW02sbByBty9fZnc80Ir/O0rkwlvaOiktEMsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UNDqVvlC;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855E5606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855E5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UNDqVvlC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c263415982eso59214666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792727923; x=1793332723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwQB+K0m+GVHe1I8OheGGsFKNnF6rubBvY7XUeZM4Hk=;
        b=UNDqVvlCh+ujQq78hHk9kK7DGfZhW22U4Vq8+6bM3GH7ESYm1AotpckF8FmOF8vfLb
         vXsQr6/KewQia7yHh4Jz2CTM3rxxYQeYmt2zlm5/+BWjztRyZ/CKgUQOOATFJwwgSFb+
         gZgKX/GrlYKahLRfQM7Gw9LJttmffFkpqBZg/WrEbd0UNq8Q5xAGryDn94WfFm1AxTNI
         qk3DT+VbW3/gNGeOh20YpbNsiDjjCUsKGEgB7mqDR0SMaH8nQFjsuUhIvIiXulY6/7MH
         qy9qaEU7I6dU1212oavFHfBw/C0HbjdKvT8eSXPbHDmug9IY2qaLJs3MG4aswbTZtSry
         LYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792727923; x=1793332723;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NwQB+K0m+GVHe1I8OheGGsFKNnF6rubBvY7XUeZM4Hk=;
        b=b7ZTGQiwOMuG6nGrWf3r+sCE45BvUh+fsI1dW7U47TXOTwl0RZEp0ITvoIBCZaD5EX
         i9EYEbv5rhSCjX7Jy/HACDff/SSBLPdf5owo44DtvROpu+/p22AWTRpQaiZUQKQNtx/l
         mvL1Jkk7LabeUOOXx3qgeZszSBsFHnqmLCOXwsOblX1dEOL+cwK88Rs2faWxUeZSwWhA
         xAvyFpzDqSduTXu34WQNcJJYkoEQdcR2KlV6n6tzybrxD7xBUyVt9Be+vV1qAQ6Dv31M
         4g8UZ99ofK3ep5LGNL3NgqWdvkqgqmjffQC30a10Mg/avdpCbDUIId8o+c2jqiXsx6uQ
         VxmQ==
X-Forwarded-Encrypted: i=1; AKwUvByhOJyYnULLmNA3Rkvp8CeONT45GNwKVUwfR17Mvobw5wtZ64WqwqoBSGY/dRfRGzxVfutXjgOPSV7nyfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLH7R7dJNf8sdknygxCiup+gX1WenmBMUQpSjQogEfsWd3RvQ3a
	4xa0qIUvuvQm0gsi1fJLM6BaNKWNQhkyq93XruEU34l/72YootKqZ6Jbw5/FwEkCjyE=
X-Gm-Gg: AYBFou0ygnkc+j0a0US9ZOAPNTejUcDx9EM4GqK2yMZu45QrarI9RGB5umdOvcoNVox
	0p9nTnO0xaXenzjvopOJhXUCMuw4GOo0F0iwd1s9fmz5SfAFiZeiPGU7uFu9CdHYMPiH0HltiCk
	cYfT1SGK4B8yl0hqr0qEI89I7w31bqqGnyqxlxnZ8jf+R5MnfssgrYdHTCWN3sUKMNiuWeeaxhy
	x/6m1bzu6aUzlq0nceFK6mih6sTY0SexMCx4G/TKEwBVrXAjEeokgNIR3paUhX/bOtMrJpIi9bg
	5Gdr5nzL4vbV6buxvw9QdXG58zFt+oMEa/qLMzVWG+zyLpZkt87vyI2cf3ywumXNZg0Euc4YAfS
	n99vbmJhqpugPkR8Ia18bIfgNH2tRONDyQ4GGr7MnbHj+7KWGM73CxP5+SOUczSaOYqejTmcMiD
	z4r75ecoBDga/6EDHfEhrFHZ4gZLECo4kOCIlIdLw+Nf9ca/1wYW0Jv/8m14XEzuRoM/xinmlqg
	7x1RyDvC+mr7/3KgF9rQEkRY/Y6bTPBwRvxQI2PoktpvJuBj9hlLbP8DhmCGBLn/QoFdfx2op5X
	V9xtUSJk9e0iI1fM1v/856ojgB/DJUu+
X-Received: by 2002:a17:906:c10c:b0:c40:38b5:d784 with SMTP id a640c23a62f3a-c46a91fa71emr168512066b.22.1792727922729;
        Thu, 22 Oct 2026 20:58:42 -0700 (PDT)
Received: from [10.30.2.99] ([194.224.86.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c81c1bsm55431866b.44.2026.10.22.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:58:42 -0700 (PDT)
From: Victor Carreras <vicajilau@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rafael J. Wysocki <rafael@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Victor Carreras <vicajilau@gmail.com>
Subject: [PATCH] PCI: Disable ACPI wakeup on MSI MS-1592 and MS-1594 dGPU root port
Date: Fri, 23 Oct 2026 05:58:39 +0200
Message-ID: <179272791966.20251.3697951431087014523@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

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

Add a PCI quirk for boards MS-1592 and MS-1594 on root port 0000:00:06.0
(8086:464d on 12th Gen Alder Lake-P and 8086:a74d on 13th Gen Raptor
Lake-P/H) to disable ACPI wakeup capability. This keeps WKEN = 0 so the
root port and dGPU still reach D3cold normally while leaving GPP_A20
owned by the GPIO driver.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220725
Cc: stable@vger.kernel.org
Signed-off-by: Victor Carreras <vicajilau@gmail.com>
---
 drivers/pci/quirks.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 1aa87a3..4e26674 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3941,6 +3941,56 @@ static void quirk_apple_poweroff_thunderbolt(struct pci_dev *dev)
 DECLARE_PCI_FIXUP_SUSPEND_LATE(PCI_VENDOR_ID_INTEL,
 			       PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C,
 			       quirk_apple_poweroff_thunderbolt);
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
+ * to ACPI GPE mode and permanently freezing the I2C touchpad (ELAN0305:00).
+ *
+ * Disable ACPI wakeup on this root port so _DSW is not armed and WKEN
+ * remains zero during D3cold transitions.
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
+	{ }
+};
+
+static void quirk_msi_peg0_no_wakeup(struct pci_dev *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(&dev->dev);
+
+	if (!adev || pci_dev_id(dev) != PCI_DEVID(0, PCI_DEVFN(6, 0)))
+		return;
+
+	if (!dmi_check_system(msi_peg0_no_wakeup_dmi_table))
+		return;
+
+	pci_info(dev, FW_BUG "Disabling ACPI wakeup to avoid touchpad GPIO (GPP_A20) takeover in D3cold\n");
+	device_wakeup_disable(&dev->dev);
+	device_set_wakeup_capable(&dev->dev, false);
+	adev->wakeup.flags.valid = 0;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x464d, quirk_msi_peg0_no_wakeup);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0xa74d, quirk_msi_peg0_no_wakeup);
 #endif
 
 /*
-- 
2.55.0


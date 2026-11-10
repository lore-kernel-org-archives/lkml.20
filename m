Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345828;
	b=IVZOlKW1gEHXp5igaUixnomXGO+pPmuoolmwtMm76bxA1YoiTiH+xn+kVKONmrmIY2Wy
	 Y/+TYfdReCIvdq/9t0kTsx2BEyXRwH7Rr6dagPyB9FhzxHcB06OdJWBmXjRmL5jOnlVSx
	 +9oYBEUpIod5C1tXWqCNTJxV04ABeh8hOErbVIvem8SWnMyiWdPxZEadWsDxhVBSR8GmU
	 XSoRb+hZrFkWgSyrJlaNDrtTapyffgPPwkUCuNzNI1RHuwwHJXPYbETMqz+ZhsBpkiV2D
	 YvmoJJ3pEKWIL4howMHbIz/dkkz9gnuRjkr37XmKjOHoMqN09vch8KEP+CBV/+U09iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
	b=ULCHnXK47pBILehknRLmeneeooqwzsnyzVbc8EnMzTf2O1D1sc/ur9FUCe0WJy2he2jL
	 GghupQnByTzPoInwitR/A8V+PMKzEuiTVsovsx7fdJvrOIhcXVYyZIm0G1AO/DVV/v1n5
	 JQ+NlrUYcD5B6FWVG2SKNbjB7BzwElDBrb3Nhl1JWV5MgXRZG49q6BIKlJD7qznRM3+I7
	 r8UI/GxdgLd2Vxu2HIrMzoLfRBGs1OsySXJd8hykwFyvJ0vEWn+bAC3oYuUTKhS+X3Cds
	 W7RT0OXWO/8uDIsxTieUNTKSF4KuVmUblOBvp09KzBQHAIVzUNUwTYYbjHPrudHz09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v55Fqf6n;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA27606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA27606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v55Fqf6n
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5681e6e7818so1005176b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345826; x=1794950626; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=v55Fqf6nesjUwl7S3WGtyZfnSRtBELCeXx7+0keF4UefA4+3rdaZ1t8XR8QWXLajp1
         7WOU8hT7hqldekzu1sz3P+CqJN9xW5a+O8G+qHtFBayaPgSA7GkWerAmEcDHK8toyJKR
         MpfZHKeHyicTjkYxEUhKMpvNLDMdTIqvwSKTfPVXWFTqCdMUmlgRVx/PBzthmaqXIfzJ
         aLl/f+2tLGXMk2DHYFn1an1PUaXW8qKLU2hmPOLi+Ax9BNP4tJoGqpCkJxUQ8gVk+Bip
         Fr+DxJKopPuj+79l/jMmJQoI8qoZARITMKgJx8YBhvZQ+D5XBk/VpOk5far5YKujeGdw
         bdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345826; x=1794950626;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=nM7KNRYr+MpJyH/XLWujXgHXxcAqP61FKn0lDfzcCo5illC//6tRj1GG9wpHWr7GpV
         DAv75VLo55dFHxhWRP5hTvuDxh8Y393aQNOstR69QJdCzCgrzw54JI/e90TGSuX6hjco
         xt17N07c7lMwXhXZAX5RpthyTLTlg0+dvLEj6BhdLPO3R4yINdMYEy4SajI4te9sloU2
         aZSjtyQFAeo0NzGBg/yQRw5lonRjoS2ratnbWBl7RPeiA+jgoSrM6RTV98ZupkEShUkI
         mqXCYQ+0aKQGfNQO5zpqpFZ9FpdiACFbwy0YUPL/f2Af9P9ncejKuXxXW1/bw32Exaul
         yEpg==
X-Forwarded-Encrypted: i=1; AL+hErG0/I/jG9zu0PsjviobwPLPBzzTEuTCYpD863vSFO8jFuonxz2QXkgP+q5GE/B5PpFqcAmxocWmAjIjlxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vamj8Pl6efwuhYJC+8SUDwRFaiKX3f1IX05KFIk1cW8yL19yz
	NEdptAR+rt6eA3I8RQoMVHl1KXrK77w5xlgBTiMPymTvcUQKyALdIfEQ
X-Gm-Gg: AYBFou1vCrqi95GRco4VbBL1OQB8I69Va3Swiwt8PzJB3BQqRvrLXw0lW7lH3uLCQ6n
	5qFlV80+HSi3tk/lbRLIS/KGeUbW/hxcZ3n8T+9GrA6d0VmIOBqkCw1K9T1vD4DCEYQH+mTG2Ut
	Maduyj/5oKtii3hzL8PcODq6hZTc0qPMT0/nlAxiAgSydcpKiqGxBz23Gpiw3stwtxSRqgS0bNN
	wYyakgNtnmPSZIw6Q7gGCx2TD7KSponGbTe1Yc8VakAak2qPOVKbm0KCNFQC/HZNhgucIxydeFK
	P7OlN8H/4eppXAWLjAUGh7xtuAoaOxXNPL6Wy0hLDyEijBzzhe/BQ2GngCbm7fWQ5h349LqNpoK
	+y/nLaopFNRbIJYUnVjyi57gU/4n4kBrr1cVyEBzR1C/h+7hMdQY5Pa/pzAWM+Y8OKhI8ZWpKFZ
	rHnxE4P8+XB+vvFOzlGwgp85Ju0cz99CcBoNQz6mjVehGP53P2LD6TIBtt36gRUaHKWxSf2f/+R
	InMlbTTiF+kEJm7LYDZgl3vrU6axjTQtDO9MVEQ+MzdwrhkemQPKRfjNXV09Ox1W8h5gM6aHEuq
	NRThsIQ9vdg00eSjmQm62KqLxw==
X-Received: by 2002:a05:6808:c3ea:b0:4ab:230c:5faa with SMTP id 5614622812f47-56b963a7115mr210675b6e.18.1794345826045;
        Tue, 10 Nov 2026 13:23:46 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm3229558b6e.4.2026.11.10.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:23:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 15:23:44 -0600
Subject: [PATCH v4] pci: Add broken-GPE quirk for some Lenovo Legions with
 Nvidia GPUs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-broken-gpe-legion-v4-1-3668ce0c2efd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32OQQ6CMBREr9L8td+0pWBh5T2Mi1p+oQrUtEgkh
 LsbMHHpcpKZN2+BRNFTgootEGnyyYcBKqYODGxrhobQ11AxkFwWgvMcbzE8aMDmSdhR48OApS2
 dPplcl9rCgcEzkvPvnXm5fnN63e5kxw20NVwMPY5tJPNjcy2F5Lzgp2MhRaYECuzmV03nSHVrx
 qMN/TZtfRpDnHffKdsu/qlNGQp0qnSqyGulyZ6b3vhuh13Xdf0Ap2dkPP8AAAA=
X-Change-ID: 20261005-broken-gpe-legion-9c9f87a5898c
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Timur Tabi <ttabi@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, linux-pci@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Lyude Paul <lyude@redhat.com>, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345824; l=6414;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=4fzh2Kt6hyJZoUipRYGxY1lLhGP5S0v640iNKn5d27A=;
 b=BreNeT4+5sRjWVoRkW2qHGfabP2EUtz4OE0rjq6itQKYCjr7cFCA+NpiP84bvcym91Vki98hM
 81kllDoWdsfCN/wa1RID/Ws+3CTH0kaYEW50aB9mvRfV9V82p0OPCD2
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

From: Lyude Paul <lyude@redhat.com>

On certain Lenovo Legion devices (including the 16APH8, 16AHP9, and
15AHP9), the firmware appears to enjoy firing a GPE on the parent PCIe
port of the nvidia GPU very shortly after the GPU enters D3Cold. This means
that every time the GPU is runtime suspended, ACPI firmware immediately
wakes up its parent PCIe port, which then wakes up the GPU. Once it falls
asleep again, the cycle repeats.

Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
nova as well, and it even seems possible for this to happen without any
driver loaded.

This seems to simply be a bug. Luckily, there is nothing that we actually
need ACPI wakeup events for on the GPU. Events such as display connector
hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
affected by this quirk.

Reported-by: Ryan Brue <ryanbrue.dev@gmail.com>
Link: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
Bjorn, please pick this up if it looks good. Derek J. Clark graciously sent
a message to the Lenovo team on my behalf, but noted that the Legion side
of the business doesn't have a fully fleshed-out Linux team, and that Mark
has been helping out in their free time.

I imagine this patch has been missed by them. The patch has been tested by
many users in the linked issue, and I have been running it personally since
the patch was made.
---
Changes in v4:
- Rebased onto v7.4-rc2. No functional change.
- Ccing stable, as well as other addresses I missed when taking over the
  patchset from Lyude.
- Link to v3: https://patch.msgid.link/20261005-broken-gpe-legion-v3-1-f49f465d48ec@gmail.com
Changes in v3:
- Add the Lenovo LOQ 15AHP9 to the quirk table (@jindalpratik on GitHub)
- Also match Nvidia RTX 4070 Max-Q (0x2860), which similarly refuses to
  stay in D3Cold (@inigo001 on GitHub)
- Link to v2: https://patch.msgid.link/20260821200607.621341-1-lyude@redhat.com
Changes in v2:
- Don't forget to actually use parent_adev with acpi_remove_pm_notifier()
- Check if parent_adev is NULL (could happen if booted with acpi=off), just
  consider it a no-op if it is.
- Base the patch off Linux master instead, I based it off drm-misc-next by
  mistake because I'm too used to working on DRM drivers :).
- Link to v1: https://patch.msgid.link/20260821181203.82722-1-lyude@redhat.com
---

Tested on all the modified Legion devices. The Nvidia dGPU properly goes
into D3Cold with the patch, whereas without it, the dGPU will wake up
shortly after going to D3Cold. See the linked open-gpu-kernel-modules
issue for more details.
---
 drivers/pci/quirks.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..c2269c367279 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6336,6 +6336,94 @@ DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x13b1,
 			      PCI_CLASS_DISPLAY_VGA, 8,
 			      quirk_reset_lenovo_thinkpad_p50_nvgpu);
 
+#ifdef CONFIG_ACPI
+#ifdef CONFIG_DMI
+static const struct dmi_system_id nvidia_dgpu_broken_gpe_quirk_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "15AHP9"),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16APH8"),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16AHP9"),
+		},
+	},
+	{}
+};
+
+/*
+ * On the Lenovo Legion Slim 5 16APH8 and 16AHP9, the firmware appears to enjoy
+ * firing a GPE on the parent PCIe port of the nvidia GPU very shortly after the
+ * GPU enters D3Cold. This means that every time the GPU is runtime suspended,
+ * ACPI firmware immediately wakes up its parent PCIe port, which then wakes up
+ * the GPU. Once it falls asleep again, the cycle repeats.
+ *
+ * See: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
+ *
+ * Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
+ * nova as well, and it even seems possible for this to happen without any
+ * driver loaded.
+ *
+ * This seems to simply be a bug. Luckily, there is nothing that we actually
+ * need ACPI wakeup events for on the GPU. Events such as display connector
+ * hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
+ * affected by this quirk.
+ *
+ * So, workaround this by disabling wakeup events for the parent PCIe port of
+ * the GPU.
+ */
+static void quirk_nvidia_dgpu_broken_gpe(struct pci_dev *pdev)
+{
+	struct acpi_device *parent_adev;
+	struct device *parent_dev;
+	int ret;
+
+	/* Just to be extra safe and make sure we don't try this on an eGPU */
+	if (pci_is_thunderbolt_attached(pdev))
+		return;
+
+	ret = dmi_check_system(nvidia_dgpu_broken_gpe_quirk_table);
+	if (ret == 0)
+		return;
+
+	pci_info(pdev, FW_BUG "GPU PCIe port has broken wakeup events, disabling\n");
+
+	parent_dev = pci_physfn(pdev)->dev.parent;
+	if (!parent_dev) {
+		pci_err(pdev,
+			"Can't find PCIe parent? Your Nvidia GPU will have broken runtime PM\n");
+		return;
+	}
+
+	parent_adev = ACPI_COMPANION(parent_dev);
+	if (!parent_adev) /* No ACPI? That means no GPE, and nothing to do here. */
+		return;
+
+	/* The spurious GPEs will be sent from the ACPI device for the PCIe port this GPU is
+	 * connected to, so remove our PM notifier to turn them into a no-op.
+	 */
+	ret = acpi_remove_pm_notifier(parent_adev);
+	if (ACPI_FAILURE(ret))
+		pci_err(pdev, "Removing PM notifier failed: %d\n", ret);
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x28e0,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x2860,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+#endif
+#endif
+
 /*
  * Device [1b21:2142]
  * When in D0, PME# doesn't get asserted when plugging USB 3.0 device.

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261005-broken-gpe-legion-9c9f87a5898c

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


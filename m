Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672368;
	b=gh/xqBqeIGXPWlrEWmrXkr73SPGTgw9+nKSMgVD2yBtlYnMBcPJo4UqSlOKlxfaTd3e3
	 AipDygBpPkIQQ80vgGRPr6aKAzkVjZzCbhQfITPskrRNHVFfBSLcd2vxD/rI9RWd6ibG9
	 7n2HidmJ4dnepShXAp5oeNJiygAvPyRu1VXM6hV9kW+mrqW6et5GUHuFxyaDLewsPbFMz
	 6Mn1eO1Rq7NjYO89DD13nCVEI+ogJsF6pbmsr0zVkQ55dhWOh84U+TBdX9Ysrj7nllkKe
	 mtaEPDZuvL/dzjhVm1ntr3Ro2isIHvGZ0VqJPQekCLiX5zODhRCkCb3/cJGlOovRxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
	b=ZWjc7d9jx8cMYgF8FfmdtquulFKXjao+NmZco+MwX0Kk9spMVDuDuYjdIRlOw/qbpq66
	 EwNEDuaWiDCTE03MTMoTOzdlvoL8YqhxKOsLQY189NxpKQ/WqwO2c2s2SifPjbB3bVeh+
	 9miV0GQu7DdkXwO8CrXoPYnFRM5Un+RG2JnUcDuYRhTB+lMbwydBlMpDQLQgekT8HZloq
	 nWHufJW7WZw42l55Q6tca+YJd4Om35apwe1kr9YAqW4hGWJz/Z093PQW8KoIO7KsCjMGo
	 cXqAgLFuY16bXRls6zOQNXi6axeD7CVwDH8cYA8VDW/h+O2Cmm6tBVUnB/xCRDTyljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjwpTa3;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8523606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8523606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNjwpTa3
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1500919c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672367; x=1795277167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=nNjwpTa30v05fAxQUaRJsKWa8uhlwQG0bGerXFm8m/vuHj4gBnuGmMUHemzl+0CmEp
         NM+HogcFvAhJFg6cf9Rl+sR0Ta76baqNR11XjR2ZQChQhZh9YhkjhcgyHwoFzfZ9DDSV
         MbUr7awtmIYD5gTJF90+gabIjfLmgoJ+Da2MwJsnFF+5D1+YzWKvdQ84gRgOn92s+wVJ
         Js77LF029ANdi++ckHVcUYmgwsw1hAotndM8XB79ByYYA5JpZrxpXmPfT7CjJjaguGzo
         tdixila93xVJYlWCKFFxvbgrHVRGgqntNHBIYciX8D0oFO6HLjpO0GtO7tCj8piZn+UM
         Nuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672367; x=1795277167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=WnQC+ksF1PxhFzUgSvfDDLcrxr/1wYK/1zqS5h5wwBInC4x7QwZ38dXOMirYStWK4P
         XDGYTv33+2jYjPlfxni68bEuDGajWju45q3ZQ1j5HU6h/2TFsyB80OFf1rEH6xAZZGnp
         4OoygUj3mzKhE4M6tkf5mmI8fCfqo3It/ApCdO28X5qBiKuF6wF4XwKMRLu6tuTdWsuW
         lWMl9c4tLROcePCm0flDSzqA4S1Xf9F2moJFLbbDD9MZj5pPHGHi61JrinvAMLPTenig
         nGeZmfKzAiyhzDtHfSm3w8a0l0mFkch6E3IYwDDW0w6b78J+oXCiX9+ccnzIMxdbS6Ka
         5QnQ==
X-Forwarded-Encrypted: i=1; AL+hErGewPKbT+W++DOqAeshggDkFd4siMsZwAABrUuYf3s9JZi7CdK50wueT/M2lUSHa2Oq6CIlINpl25msu1Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NK2RYzPnP1vPKIvdai+PE40UvnW6ksvua0oUrRqCseEDFluEQ
	se6eb4En3sIffvtjSh0OaAfmbFnnmvqHLKrOj4f4RtXC6rLs0NWnT7s=
X-Gm-Gg: AYBFou3U8Oq+QzNqS/5gS8VhDhlBh84rJUKRCASk4qp2vwMtaLnPKX03EwudAf1SZJZ
	G4c1fxWsipueUAsIyITTS2rIBvcC8JEvnxOD3AGzrI3AB6UJ0KZ8zSAdTtIeotOeWw0hXoNlpQn
	nzD0MZaBGVTgLptxXb2WTOSt5+qxcOhJiS843x+eE/AFnR37Rgw1QNr71HCdAF/S0X91K/Wassv
	YpFHFkwqlhmF0soCwvkvq3kCO2ZNJUnyKjqie68b479jV+NjtvtWCvXEayE4HsBVFrOrB5GU57q
	KrR+XG+rZYlZQu3SVpADq4ylxVnrDAU6tSUzUlnA/I3iuV5pAK6L8qInZH/JRDi0xzNjl9iFQ0n
	1mmdVq0V1MsXfWr6S1+ibYcGl//wLlleQjr04hik4rXw16oSVDQP/ohlJzaZL9Umqu7cNXdWbqc
	wtdmCyDDdRO7Qy8zzQMI6QICCAt+abp079Gzs0Gw+SjUmswmzepY9kt82tggA8zl1K5OQ1izx4T
	9NyHSx9stBXpisZzifUEzcfcv6t0axIQclZR4k3lgv8I1wTUGh1BW6P6Qq3awIKx9JlsbZM82qW
	bMcQFulkiy5pQVQMeGfnNVcrEwlju3UZ3xpk9Zw6XcMwudMREOZ+sFETcIxbCPOm4A==
X-Received: by 2002:a05:7022:3b84:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b5030243ddmr6212226c88.2.1794672366456;
        Sat, 14 Nov 2026 08:06:06 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.114.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm13378548c88.10.2026.11.14.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:06:05 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
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
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 02/12] PCI: Disable pcie port on specific amd devices
Date: Sat, 14 Nov 2026 11:03:49 -0500
Message-ID: <20261114160457.3034-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160457.3034-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160457.3034-1-atharvatiwarilinuxdev@gmail.com>
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

As mentioned in the previous commit, PWRD turns off the entire
bridge, and if we read/write anything to the config space
or the PCIE space when the bridge is dead, the CPU CATERR's,
so to avoid interaction when the bridge is dead,
we remove pcieport support for the bridges..

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/pci/fixup.c       | 43 ++++++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/portdrv.c |  2 +-
 include/linux/pci.h        |  1 +
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index 795d81c7a..b1697cc4a 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -1094,6 +1094,48 @@ static void asus_disable_nvme_d3cold(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x9a09, asus_disable_nvme_d3cold);
 
+static const struct dmi_system_id quirk_disable_pcie_port_dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,1"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro15,3"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,1"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro16,4"),
+		},
+	},
+	{}
+};
+
+static void quirk_disable_pcie_port(struct pci_dev *pdev)
+{
+	struct pci_dev *upstream = pdev;
+
+	if (dmi_check_system(quirk_disable_pcie_port_dmi_table)) {
+		while ((upstream = pci_upstream_bridge(upstream)))
+			upstream->no_pcie_port = 1;
+	}
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x67ef, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x69af, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x7340, quirk_disable_pcie_port);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x7360, quirk_disable_pcie_port);
+
 #ifdef CONFIG_SUSPEND
 /*
  * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
@@ -1179,4 +1221,5 @@ static void quirk_tuxeo_rp_d3(struct pci_dev *pdev)
 	}
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x1502, quirk_tuxeo_rp_d3);
+
 #endif /* CONFIG_SUSPEND */
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index a9cbfc1d2..d2f19e566 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -688,7 +688,7 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
 	int type = pci_pcie_type(dev);
 	int status;
 
-	if (!pci_is_pcie(dev) ||
+	if (!pci_is_pcie(dev) || dev->no_pcie_port ||
 	    ((type != PCI_EXP_TYPE_ROOT_PORT) &&
 	     (type != PCI_EXP_TYPE_UPSTREAM) &&
 	     (type != PCI_EXP_TYPE_DOWNSTREAM) &&
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107..fcb4f5893 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -420,6 +420,7 @@ struct pci_dev {
 	unsigned int	no_d1d2:1;	/* D1 and D2 are forbidden */
 	unsigned int	no_d3cold:1;	/* D3cold is forbidden */
 	unsigned int	bridge_d3:1;	/* Allow D3 for bridge */
+	unsigned int	no_pcie_port:1; /* PCIE Port driver is forbidden */
 	unsigned int	d3cold_allowed:1;	/* D3cold is allowed by user */
 	unsigned int	mmio_always_on:1;	/* Disallow turning off io/mem
 						   decoding during BAR sizing */
-- 
2.55.0


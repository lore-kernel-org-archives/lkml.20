Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672510;
	b=iyUq7xvhrlPqWCoSIrRKMDWT+3rMD8m3+xVFXlN6sRel2orMgZuNkiY/imN+EPsYc3qJ
	 aZOkWDgHLTPIfHRPzXnyqK0Cu01GOXoEtyg8t95wg6YHXi38ioplcSEzBRDxZsILluszj
	 nHrqFuUUQIdyorUJJ9Za6jYda1iw3xjskcMKHhuc6owmp6iFgE2iBdtBqTRxNX6Okf3Ix
	 PmEjTPhlLzm3E0wd100LbBoV3LcI1cmXmfCsmz2qmDzR5uAPKrPAPWcyIHxk9E9RreldK
	 t9mJsOcDeJ2d6ppS0Lt1nZTTeRLhsSEsLy6sznPNkDNllY79HVmh68pMnNVWZiDREBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
	b=yh7ke+PCVx9NOdEAs9xxMS/8ewBdZW6HsU7i2bxnodR+P976jteyOuHtzbMbFiyUTgOl
	 om2NWTqCB07vYiXIxT/ilrDgzQNsQ1+vlZf7X0lIozrj5ekzeIjZBk0FbzYotp+S3egDB
	 hg3J/FFHXTKHhm+U6p2/6rz/aamwdXSeu1PjuwksXytVeXgJpQ+mqzW8ni1qk/jIfyGlx
	 KXPb2rTboK25xBuLIASKOor7k9qtDUxeYsPx/RmunVK3Eg5v0XXvC6NIc9oJJgvljsGZt
	 CoDYnn6S7JknI8K9hjJJKATVh4o7AyQf6p04AJg4n3k5Ol14XzBe8TF4SUs1LQ4RV9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbQbi1gd;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D3606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2D3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tbQbi1gd
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37071c0f42aso2959125eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672509; x=1795277309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=tbQbi1gdIC6/6HaGRuQ6NdTOfpXgDybDtxfF3N17V0BDjnvKhlWgVO8zpSUMHehkay
         C/ZZMI7Wyt1MHl3lC4/ZFhoyOFviS7f81UlMhCS1uT+w6L4DUAd8SdECRH3ZQk75ObMn
         KHjTAObVD4CLG9k08HoNhZWOrwIL9E6dBuay8QPtR+HcvS1PkoONye3PVKLtIG2zPQtt
         pUMwuj/9uJoYqsltFOzDfY6TpIIli8wtlkDFhafCkBw+wn9jU9mioZpYnPCzFgG2OtUX
         sa2gIHeeIQ4a6Fhqdk4/rJV7g8KsGaSW7ebH/J7t0lnazJOcoJQeXwbhje/URz8VoFi2
         jipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672509; x=1795277309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57QGYlJp5ubvUnaSXRDvNGBB3M2Beb8mEN3QVUFhP3Q=;
        b=ajhbS2FXtfzV0H5OEC5zUekltiN2SzznRAhFnodX4oqU4Uz2oR38DgwJdfRrA4Y8GA
         +dO7odRadFmnc4xIfV7gnPy9wL1Tu1DLwmcVj4FKiOGr7RtTS6kRWHTCbkM4jxU2c584
         hT38ir5BVHbXFSj+941k6JTXk5ZE6f8rI2H808HALnh8CT15WM4E6l7lyVmVbDyBO5dC
         wNJ6qMquexvMnSXo7Pg3tlac1KEnbLgYpQcNRUNGAZVKBFbExfxVUwVRI/rHDTc6jTx1
         Y1tHuHCu2qlfqPetT5fYssMbMW0kAj3FpjRJSv+o/rYuF9m79ju1z5hq+QtTAjUO8TzY
         tDFg==
X-Forwarded-Encrypted: i=1; AL+hErEZuEJejvLZZEkigfDUwZ9u5ol/NjCXnV70BoeRNm1/vwwbkJXf2qxRSNycmAU3c1NIaXOI/r4rf6ISrb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JGtuWdkhkj9gkkQDyu6bobz89oZ61TP+t0QRSou4T3K9hxe8d
	/w04V7O9GtLelswq1DS7Rvw31at27mppRtzIXtsA1Q0AjggrccN92/o=
X-Gm-Gg: AYBFou26eTJA20BGntBMJtWV8fbQTscrhK6F8J4gAqrCc0m5UM4gDHQGcHHCovoQkbY
	rbm6VfzvZ93JmrBchtQUSmrCluJCCq3nGhwp6UncrK2IEcXmFBnZl4I/v9wfKIZkZWm8v7z7S+c
	HEQ4Afa/hW9LJVuVMp09cH8JuQu7bdbT4qMV4OLyteTO/mssLp3pJmj3DUiSlXgMU1HLNxB0kwH
	U7kD6P3yJkM2sGkYU1GSi5fTdqnIek/kw/2F76vswgM5XkzydmV06e0aGBCmA46WL/TSw2t7W8d
	yiIEvT8urBOfjuI5S4keel59KTCXeC1ioUwKSWySAfv1FOhdx6WOQilPh+SRhUzM/xS7sev0ayU
	KtUcHUop40oAAgXDz2UcqnZMedIFSPGMuCnIxRHEEKmcPcApRW+LRaUbA6oPlNOxIKQgeLtBwbI
	qBoSAHKxA1wAECneobf8+dZPpXuO+9wvOo584lNVRWwOVPKzihdXDdIH1TT2kOtG1YTZlBkeP6K
	ssnAaOs4xet5jeET8fvPaJ4I6+VsxfAlAUj1QCrZ4QvZbIllO09IionHs/2fdxJbz4uSDgcuF3x
	zRlRam4abOJ7fcu7H3+5uqf5WvQ3YG5XL2IHYidjLW7jpLV85/a7H7GN1Qcy4uKhEA==
X-Received: by 2002:a05:7300:f18e:b0:375:894f:2524 with SMTP id 5a478bee46e88-37966b52646mr7220639eec.12.1794672509407;
        Sat, 14 Nov 2026 08:08:29 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:08:29 -0800 (PST)
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
Date: Sat, 14 Nov 2026 11:06:26 -0500
Message-ID: <20261114160731.3756-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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


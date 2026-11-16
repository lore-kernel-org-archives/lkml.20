Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794791324;
	b=rm4kXfVUohrbozLTZrPfj3nDyc4j8rBnElTuPyaDlTG8xi1XE+9Lhsih+fjrEDZ/TkMc
	 BqGLSab69K83VNTKmdj/47TKXuDIeoNnPPOko5RVi9KFdQbH8kPWy8xKiV9ypBB2jFEkI
	 HlhYVhA/JHTk67+I5lQpX1N/tW0ZHLWbtWc0xL/bKXRf4W7c+/E+1eGLoD3gfQLvF0+G2
	 lHQJJ4CAD7gpK4eocdECql1QxasWPm5RH2CqhlG0+CGuJpuQ9SBAbSsi2KIxVmEMMYFus
	 L1AG1e+bZzMPIzkgmQqCDKz401wO0mO6VhaKalgma4zawMXboYoCt9tDn2/wuTwk4nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794791324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mFzOX27YVk8gNisk1XMtnU2TrmoCuSj2ju0F2Azj71M=;
	b=NY7MlcHwnNrV/g1GTQoqGRGXmsghnQqTNF6Zz9Pyl3o7RSj+qQGqWuGjSQJiMmlw4qsv
	 GiRXV0Bm9i7u59a2DT8zP3JbJK6vFQY9z1Rv31e8cS/Fc/pr5quvCHoMSXTruE1AnMaWx
	 Y6Gf2wMsDU21uIoZNbcdvC0n6NX6sYWW+xO9dJgY130yHmPpYHNF1TVGRxT5SYuCQXKz9
	 KUNFaN8Se5fVcAhNlPAWW/T8RLJaPftnCmTED+o3Q06uDRpc0XZQi+SHlJlNw7M9aAIWH
	 rRARcz+K/lxutz7GxYYtzTgaDb3psi74k4aBDoh6kPMr47VDCeAh5CI1GS9QCBfxq1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKoyY2zp;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F0D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKoyY2zp
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so2783393eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794791323; x=1795396123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFzOX27YVk8gNisk1XMtnU2TrmoCuSj2ju0F2Azj71M=;
        b=SKoyY2zp8+yXqlocJW7opDJjUYrUD09ncBiC+biblc+vuLAbNfbb80yKkxvkacrPyI
         Tjx9y6EE5mtNBQJVzaNqtcV0J4FWg/Dkd2t8gcKndjAXUQDWPO9ImjG0bAyGhtrjzw2G
         1TfzLkZt/wvlArX3jBTHT1pu9e82lueS07e/Sg1j/jAw4thV5yTaAPFS2doOihUMKSBB
         49t2sC6g846SvXroY88AFioqgV7WfxzSiFdNyhN9xtv580sP/7evt7otvj1GDUJVKhzD
         9LNORNwv/0SFSb93y/hD5E3jwWoNjGucCl9SBIIkK8HS3ynHCeUAir9Lsn2ChNIowtYy
         L5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794791323; x=1795396123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFzOX27YVk8gNisk1XMtnU2TrmoCuSj2ju0F2Azj71M=;
        b=jRTNlWABkHjASKuIMMMpWyUotQcFCwlJn2bE7YQNuB2gX+Nq2pDdR8OZjLT5gRFTOv
         id4YeRys6LDL17uaY1QgqS45zjd5Eq/Ga/oUCJHkHDPVPQZntJkF64IjIQl+VbCzewzH
         7I9yJIbbM3vlQw0YvfHSyi4ZlXD/OQ9MGv6Q/gyK5SxOCZSXeNJ9NHduEfHAGfPdgKvB
         +hh5bUj7C/n2YT0t+XPnO31quZ7Mb+XadrirVE3OKqr1Ci0BW09+3458fmXCE2tHOJvk
         LNFP+1voa6IBlO/YSxlPqLKV2QvsgeKbLcMaTu4xqAJ0gGTwSOfHARzcX/sgjYcSO/t6
         UZpw==
X-Forwarded-Encrypted: i=1; AL+hErEz0ChnfSDzDguIa1UgaG1o6CxaQjO78LwM9Smrz0rYPqQZRPEPk90O4TasECiNx6FUANY47w7lHLpzsnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z87wRSi23q058L/5qyUpsRUUp5It9SiJB9ZJdO09y+yKYwu2OpK
	vSbbCWUXolnsJ4seIuAotQG6UT6KlfGokJ8O/ka2P4ryXNURHoXweuE=
X-Gm-Gg: AYBFou1mGhKG8EBCe2vp6zs1iMwkkQwHMdAYTneKRjEOyesU3M/fc9GMbrUdVhgfV5G
	Qi0F/g0lFAtA79sQOhdGoLfEKq3q1fuvtw+kBM3gbKo/m28/ANamwvkRkugVZttfDH+GyzbKsyI
	kTTsDEqzeDgXYpovkIbhvhMOL/CnCAxzOKlx1KL13RR44GZIiXC8RjeG4c3HRJKKMV/dtbcWMJq
	N8Tc3kp2vz8YZFaHZlDTcFmutwIU6WngBoCSpBz+Bgik6sOvtZ6FXBBLsoykg4k8phm0L+lF40T
	mnz+gy6j+FmWL6x7zetHndeRoSBwxL7n4B/fFbie2bYLoT3TUZoELDzq3JxKEDCatpMALmQngVE
	j+zhgakVipbEzv32pi444HfNjm7U4RoNn6BbrlNzjGZKt2kHNkKs3zQi0LHsFlGdV4pUte031kA
	JvVYhn9M9+P/h0HG81z3ceGB/FLyCFGT7ugdozJV7WrwMHhOa+RpS8SmzxzO1FX5e2Pdp/8sYmD
	ruf8H5JmywRXp95fqJDGf3Ki1RqRoTBNwBFlvKy/EDa9kuPc4L+bz7I3Nmo0YEGHdRm1oQYj5v4
	bsyyQfsQHQcPorPHS6sdlywdpt2Yk2XLUZgkpVtCrmD576tXo0RQI90n1atMubIOz6VjMD8hvuo
	3XQyv2Up9tg==
X-Received: by 2002:a05:7301:182e:b0:367:a092:3c73 with SMTP id 5a478bee46e88-377e1016111mr10414537eec.12.1794791322602;
        Sun, 15 Nov 2026 17:08:42 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.120.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm28611259eec.0.2026.11.15.17.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:08:42 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: Add quirk to mask ACSViol on XHCI on iMac20,1 And iMac20,2
Date: Sun, 15 Nov 2026 20:08:33 -0500
Message-ID: <20261116010835.1191-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
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

On iMac20,1 and iMac20,2 the Thunderbolt xHCI (8086:15ec) triggers an ACS
Violation on its upstream port whenever it is runtime-resumed from D3hot,
e.g. on suspend and shutdown:

  [  141.535310] pcieport 0000:00:1c.4: AER: Uncorrectable (Non-Fatal) Error message received from 0000:08:02.0
  [  141.535325] pcieport 0000:08:02.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal)
  [  141.535325] pcieport 0000:08:02.0:   device [8086:15ea] error status/mask=00200000/00000000
  [  141.535327] pcieport 0000:08:02.0:   [21] ACSViol           | Receiver    | Transaction Layer (First)
  [  141.535328] pcieport 0000:08:02.0: AER:   TLP Header: 0x34000000 0x00000010 0x00000000 0x00000000
  [  141.551637] xhci_hcd 0000:0a:00.0: AER: can't recover (no error_detected callback)
  [  141.551655] pcieport 0000:08:02.0: AER: device recovery failed

The violation is raised inside the 10 ms D3hot->D0 recovery window: the
port's AER status is still clean right after the PM_CTRL write
and set once the delay has elapsed,
before any config space has been restored.
The kernel cannot run anything in that window.
The ACPI _PS0 and _PS3 methods were also checked and have no effect on it.

This is most likely a hardware defect: the port correctly drops the
message, and the same controller on MacBookPro16,1 is not affected. The
error is unrecoverable noise, so mask ACSViol on the upstream port on these
models. ACS stays enabled.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/pci/fixup.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index 795d81c7a..b7c0de6c2 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -1094,6 +1094,26 @@ static void asus_disable_nvme_d3cold(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x9a09, asus_disable_nvme_d3cold);
 
+#ifdef CONFIG_PCIEAER
+/*
+ * On iMac20,1 and iMac20,2 the XHCI controller gives ACSViolations
+ * When switching from D3Hot/D3cold to D0, and it happens because of
+ * the D0 write, so we mask ACSViol at boot on these devices.
+ */
+static void titan_ridge_xhci_mask_acsv(struct pci_dev *pdev)
+{
+	struct pci_dev *up = pci_upstream_bridge(pdev);
+
+	if (!dmi_match(DMI_PRODUCT_NAME, "iMac20,1") &&
+	    !dmi_match(DMI_PRODUCT_NAME, "iMac20,2"))
+		return;
+	if (up && up->aer_cap)
+		pci_clear_and_set_config_dword(up, up->aer_cap + PCI_ERR_UNCOR_MASK,
+					       0, PCI_ERR_UNC_ACSV);
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15ec, titan_ridge_xhci_mask_acsv);
+#endif /* CONFIG_PCIEAER */
+
 #ifdef CONFIG_SUSPEND
 /*
  * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
-- 
2.55.0


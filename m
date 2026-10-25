Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886927;
	b=2+Ss9fjX/7AJIqftyqz34mml86iyvJ+AgyYOyVHxdLpENJxHwWIUi9GWs6h6nBoG10WF
	 4feAOo4S5tBpDGoh/MV5NHaK506CaJpBqXkiMgnAzWJ4CpeSykPJlad0BwsyO9bGPyFk8
	 29Kod4UyT+RF1hNrPJcuq+3GUWSL0JgauEzQGmv4aPADG0BO/WY0URi9wfkaWSszKhjq9
	 NRCboFafzGeSYZ1vQNMCX5WmEdypOYz80rVrfPUwwz9Asq6wj4r9sPwlfb+ngxVvTj2Uu
	 jqiYDFhqNb7He7x50lejyncYm6tOiqwuQku4Gh0+U0i/JHj8J4Fu9mulqoV7VWh/gOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cgyevGVp9g4VgGASqjd6XW/YILwpx+wn5Xx2UTAVZZ8=;
	b=GF5Mht8AnGrVdopyM1++l3iLWsLFRQSfiPDQpMtV6bNWd+4uyR7Fd6NRsTucS1Fh1Tb/
	 WIBxrAlKymPO/crL2Z4UfsIZVhbh8DuYFvU8EgzCdSkw6saxKF68THXw+W5GPxeJA80ak
	 ntorqnEo/mOJxhLvTTYT5kvqOwc2TayhrvqlXrOxQEZW4hyAp9SVf4nfVHBRo0H4hxZwU
	 p0FaNNzvrIA4GffHzj9eW+KRjiemKF94VbLy+7NMayCCLoI8/nE7igDT4fc0PBqF0qygu
	 MQhpFFjKvJajRtHF9eRHWzTnzNpsY6MbfRI6yDUedmkHb83lcXdZwg6mRExzCLsgcmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZYkP3o9S;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35194606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35194606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZYkP3o9S
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6798d4ab549so1883056d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886926; x=1793491726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgyevGVp9g4VgGASqjd6XW/YILwpx+wn5Xx2UTAVZZ8=;
        b=ZYkP3o9SYQFERtwy+4U+G22ixdDASO8v9r/LmuciEhg9oCtsdsmS+J/mkfwt8EW7qO
         ZEGKrKJQIGpT/7QIefLvRIAr/gyThdy+kNIeK+GYc3c0l6vKNjC8UOqTXGLfGyeapNX1
         KUS0v1kEWHxjRBjvWLEcDPK/XF58PvEw2RYxFLbkzj0vIwsbghdkqylM6YNhVHZGGsgP
         YNFMM3Zz+eneFHcsuDZAUxf3X5Mt/xJVcTxQDqUi25g5zXF4c7zVbhRHgzbjxOXkVX6b
         ifG/uKw+X1vVrRhQLMWgSBo548ZfnmOk+GaULUFLocDikU7DOIEjaxnxJMEPqTHyqeIU
         bpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886926; x=1793491726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgyevGVp9g4VgGASqjd6XW/YILwpx+wn5Xx2UTAVZZ8=;
        b=cSaEW6bqRfOANh2eVhi14mcBjZJvkDks1S5+/0zI1wrka84Z9Xl+mYPAE7ku0F0gfB
         AvJFchDPArv0mXHXvsVenfVGUDcRQUtJgOVYymja+I5v1bHpXJrnwg4E+f4avYg+kKyA
         zOeYEft3FmD6OK+og88ruohSVktJzBD25uVcE3dJA5oHJ4hSA1Zo1sgQj7VhtqIwHkwy
         X9I0P5Z/vHCi3jnBR0YQ7vmaVMI8CDJ/Plymx8cvI9zUgsm2h5WR20CDqcYb5CbHXFv/
         v83czdXJQRKvHGXw6JbYA1NEZSx68LuNOjJFRgihWWG4oSP3G9IEog9dKsbufAWv7skz
         WX5A==
X-Forwarded-Encrypted: i=1; AKwUvBwk/XOrHAtciZQNh0yVaiqUrDulcf+lae2kAw2vOXZdLTxA9hZ1XLYEO5h7AJ/+gFbDsYbGKBWA87w6Snw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNvUudY2rKJI5yaP+zKELo6m680oGA8LvSFtgNxeIQrKvnu9m1
	2MgE22I+4UNbyIh0/gngECNyCNMJty/zbInDfXsHNlaXTjbP5jKrJW/Q
X-Gm-Gg: AYBFou334Ine8n2yG24mhBeyC0qQb0g4IJ63hJiNMTXWti8iBXbZ/0WpiD8PhVtpXsO
	WFHQTYwRw7TXCfm0269jwI/PSVnm3aPS4Ls+A+A2EU4hWIueUomPN3miMi16YtxlzJJA2pq9tym
	lz1EwRwp9BZSdI/EfllRR1Gj6Nq6tP8q6jcMSwQMWQEelhSOeYKqKTjZwp9t8nDuTPi2w6Wsr7w
	V/fmibfEcThuUsU3F50jKqaDdc3cj9Gd5I3SXonnvKJByBjHf1E9cwNRoTScb62nkO9nYquVpCU
	f0j8ocOBMds6f1PJfpd5/TNCI+DKeE16VzimznEvWd+MSrwKCMDM3qxf5Q2rP8Ionn2l/BzLkLD
	0E0LxQ6gTACC8oerzFPmU9n5ExyzMvRaAMRQ3MyuwweflM3OWrZYTT9ajXo8PsdMenRoPiHIfDC
	uMQcZti4LKDM+A1MU5RI6TCSMgvPZSrEUtwI6XCyP0yIJSJ4eqLHXHYVOahpwPwjiRDNid+Ku+o
	kuQMic/ePjCIkdgVTtvdcRY/u/cEsk70t2xLHXd1lznQu7USeIZ/BjxQfbtkGZ0NLFQNxs8LPrC
X-Received: by 2002:a05:690e:4283:20b0:679:c17e:4081 with SMTP id 956f58d0204a3-67a4549f4a0mr1631522d50.101.1792886926241;
        Sat, 24 Oct 2026 17:08:46 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:4f::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a4626fb03sm1466332d50.17.2026.10.24.17.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:45 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Nikita Vetoshkin <nekto0n@meta.com>
Subject: [PATCH 4/5] PCI/sysfs: Use user config accessors for link attributes
Date: Sat, 24 Oct 2026 17:08:32 -0700
Message-ID: <20261025000836.58294-5-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025000836.58294-1-thepacketgeek@gmail.com>
References: <20261025000836.58294-1-thepacketgeek@gmail.com>
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

max_link_width, current_link_speed and current_link_width read the PCIe
Link Capabilities and Link Status registers with the kernel config
accessors. Those don't check block_cfg_access so a read that races
with a reset goes to the device mid-reset and can fail or return a bogus
value.

Use pcie_capability_user_read_{word,dword}() instead so the read waits for
any pci_cfg_access_lock() holder (e.g. pci_reset_function()) to finish. For
max_link_width, this means inlining the pcie_get_width_cap() logic
instead of creating an additional helper with this single calling location.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nekto0n@meta.com>
---
 drivers/pci/pci-sysfs.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index b37a285d717d..a272f8583a8f 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -208,14 +208,16 @@ static ssize_t max_link_width_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	ssize_t ret;
+	u32 lnkcap;
 
 	/* We read PCI_EXP_LNKCAP, so we need the device to be accessible. */
 	pci_config_pm_runtime_get(pdev);
-	ret = sysfs_emit(buf, "%u\n", pcie_get_width_cap(pdev));
+	pcie_capability_user_read_dword(pdev, PCI_EXP_LNKCAP, &lnkcap);
 	pci_config_pm_runtime_put(pdev);
 
-	return ret;
+	return sysfs_emit(buf, "%u\n", lnkcap ?
+			  FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap) :
+			  PCIE_LNK_WIDTH_UNKNOWN);
 }
 static DEVICE_ATTR_RO(max_link_width);
 
@@ -228,7 +230,8 @@ static ssize_t current_link_speed_show(struct device *dev,
 	enum pci_bus_speed speed;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &linkstat);
+	err = pcie_capability_user_read_word(pci_dev, PCI_EXP_LNKSTA,
+					     &linkstat);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
@@ -248,7 +251,8 @@ static ssize_t current_link_width_show(struct device *dev,
 	int err;
 
 	pci_config_pm_runtime_get(pci_dev);
-	err = pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &linkstat);
+	err = pcie_capability_user_read_word(pci_dev, PCI_EXP_LNKSTA,
+					     &linkstat);
 	pci_config_pm_runtime_put(pci_dev);
 
 	if (err)
-- 
2.53.0-Meta


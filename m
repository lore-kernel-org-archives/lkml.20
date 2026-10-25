Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886922;
	b=ChIej9vo/12IWHTi2tiB7IbXVxAo04FSg/6qTtB2CaST8kdRDJN4liSNcJGTAfrpGSnc
	 3zYB6T9oL8knKqurAH1enqMWbbvJYwlM2gVIZhPGSwJzlJLjH4DAKGR4X/E/fiJzrUkiA
	 BQ7STIBZjY2iT4ZfUbuH+36GUPEGJMauDNj5BcCgjou/WvKeRMoa6ORedAibPDxPsriBE
	 rUr3P/v3SNmwBK+AD5Hcy3V30SNZeO/aWRIwgEljte/hfNIUXC5b1CQ9zVfiKAGrVxSqd
	 EeQxkjHLZkIhDjgCi37jaRVzoM7Bicy4OMZlr1a0EToIC90vgdUSOVYAJupFTI8ScpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L87JvKpJJyF+bYMYgk77+UwhsWenN6AX6oAJRMiE+s8=;
	b=H2d5BEaRTQPyylUgGblIbGcqR8I+E0ztVLugkE5Ylurt9xAa2FZs55yrh6scExnt+s0j
	 ScWsYPfNV1dpS245NqazgXKIFZDvvdVrSDsAcayspi4BTkFjsdRKTGIYAgqgMY9gQNy8C
	 /7WOlHV5c6YqAR4dv9lgtc7qMa5bowsFFNmW/qw1CF/MAX5E3SWhwIXiCY5yQDqtydBiu
	 kZFTL25+8bpYNzr5ooGpJpoAqgM+P1dHkoGJ+WYx0ed7DcMQPQe4dNXY9IK6HDixM5Ip7
	 cdXaN0zP5AW2UM5TtFRsZiesL2biobc1Q4qRfTmoeojveFxQqvmWt3lFeaxbgKdJwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNTXgKqS;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44367606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44367606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNTXgKqS
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67999045530so1795968d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886921; x=1793491721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L87JvKpJJyF+bYMYgk77+UwhsWenN6AX6oAJRMiE+s8=;
        b=qNTXgKqSgc/u7OSxa1GHIRE0CwLKNk6ryi6Vf35S9cdOLSwdvv4ngBSMFuELd2c/VG
         yufAkOl4isyI5pyNGtbbI7SklxMzEV4cfu/7YXfZsEVvCIPXdf3RXahceBsK3GW/VwcR
         AHTdyWfsqVQCD+waq7ksCuTH9bLPfPjD+UzDwUA9RZglzcZdi1U/fhniIg8m8LbyDhKr
         gla7ZWweCWHbsozSNGeXyPd8+ri1R9gUUTIUBx3aEWVV5KcFbP+Q5/xGRv1WcWchhpll
         VQsS+vteLXr2C47mGIZUm2836vk1+u7FZQvJlp7mwEnQb5mp50f+2Af4BGBLDVAaYNKx
         pLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886921; x=1793491721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L87JvKpJJyF+bYMYgk77+UwhsWenN6AX6oAJRMiE+s8=;
        b=d0WneC+oXJuUepBAeMvh9eeEpXX7TLvwrR079bIzG6ztcv6peQzC/v6epN5hYDCneD
         6Pjftod7KNEheWLlpTt4y1Vcb+3GcCjQ+esWwnpr0bW41pwgcXbO+kOqUk5LT6kDTzIY
         e/pff29r7tNiJf9QwrQcjGpyZ+eqEiKssa5apEvO5ds5NPgLxp95yCX81Vp6+mm+vVuC
         Ma2xgBw+Akkp2G77SGPoVLP8AmvxnQxihnw7hy5vazYMglF3pNEWyGK0uv93Y5/bfyHk
         CbjTLycn5swm2UgffcP9JtDhBeWiy+NdKkBOSNokOLc/7JDsUoJCH1CPjnJckkln31AE
         hcNA==
X-Forwarded-Encrypted: i=1; AKwUvBykzFIQdbz0bj7K0T1ClzU5PSf1LVD3E04EbSBu6L83nIE2nuFEANi/evASiCsyeAu4y8WK0emrzsAt8Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4JP3Pito1pq3PZy3OxGXHIUjGNlDa9eFaj+6pYWw3Hoj3C0ol
	YnAc+0YIc/tj2uMOpGMXSO6uxBYQ3x9VVKcnRVqSeB4c+zKWB+mX4sXW
X-Gm-Gg: AYBFou0mJqwGzGjhWI6b3RBcfSCgt/CnE7MkYha9f7Oxnk5k8xCxxJ+w5qvh49A+OpY
	W9K4F0ZfvEymhLgr6a8+FLHXNFz8uO1Ud6SITwi6POt70ExqdcnuLDIvq2taIPFg+O5rlF0338j
	MWjzLQyZwdMl06zdDRxIlDpA5IzPDgSz+q1i9TSv/vTvys/FE3mYFAx7c8zwvpTCRN6UBN5PrJX
	fktGy9FOKA8TYPEPkFcqW7EzXJqm1HmfKdIsPXFVF/s8mB43JgvaeDzx+rNRqXHCqRXlB1ABk9U
	nKNNhYaHdg1nP7uj1JqWz4PJrcdLSo8bklbSl+JYIB/xmsyfSQ9Inf3Sbu1GWzTzEMidHe+HziE
	L6kOntGdLC9upUOVpgXmu0psBhPr8MzuidBeLch1rogFlJ3x7BSS//m8arMA9w6aCaW6zaD8hcV
	7b75wYWdGEjCfZGhvST2/BDteEozdNEOoAtI/kx7NQbfWbqYHBvYLfcSVq1AiEOlae5zonX2ZOD
	4mZ4h1v+tLlyJ1+81ZuTCS3xvIOqAn0oMYqagFsPlDDqYyZj5E3FQ==
X-Received: by 2002:a05:690e:a4e:b0:674:1248:2b87 with SMTP id 956f58d0204a3-67a45393ac6mr2294812d50.29.1792886921216;
        Sat, 24 Oct 2026 17:08:41 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a462f814esm1520084d50.22.2026.10.24.17.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:40 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Nikita Vetoshkin <nekto0n@meta.com>
Subject: [PATCH 1/5] PCI: Add disconnected device checks to user config reads
Date: Sat, 24 Oct 2026 17:08:29 -0700
Message-ID: <20261025000836.58294-2-thepacketgeek@gmail.com>
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

Since commit 4b1038834739 ("PCI: Don't attempt config access to
disconnected devices") the kernel config read accessors skip devices
marked disconnected, returning PCIBIOS_DEVICE_NOT_FOUND and ~0 data.
The user config read accessors still issue the read, and if the host
bridge completes it with ~0 data and no error, they report success.

Check pci_dev_is_disconnected() in pci_user_read_config_*() as well,
failing with -ENODEV and ~0 data. Do the check after waiting for any
pci_cfg_access_lock() holder so a reader blocked behind a reset also
sees a device that was disconnected while it waited.

This prepares for converting sysfs attributes from the kernel
accessors to the user accessors so they keep skipping disconnected
devices.

On a disconnected device, existing callers of the user read accessors
now behave as follows:

  - The sysfs "config" file and /proc/bus/pci ignore the return value
    and return the same ~0 data as before
  - pciconfig_read() fails with -EIO
  - VPD reads and VFIO config reads fail with -ENODEV instead of
    returning ~0 data
  - VPD writes fail with -ENODEV instead of timing out with a
    "firmware bug" warning
  - VFIO writes to PCI_COMMAND fail with -ENODEV, since VFIO reads the
    current value first

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nekto0n@meta.com>
---
 drivers/pci/access.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index b123da16b63b..18a206bb2a94 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -237,8 +237,11 @@ int pci_user_read_config_##size						\
 	raw_spin_lock_irq(&pci_lock);					\
 	if (unlikely(dev->block_cfg_access))				\
 		pci_wait_cfg(dev);					\
-	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
-				  pos, sizeof(type), &data);		\
+	if (pci_dev_is_disconnected(dev))				\
+		ret = PCIBIOS_DEVICE_NOT_FOUND;				\
+	else								\
+		ret = dev->bus->ops->read(dev->bus, dev->devfn,		\
+					  pos, sizeof(type), &data);	\
 	raw_spin_unlock_irq(&pci_lock);					\
 	if (ret)							\
 		PCI_SET_ERROR_RESPONSE(val);				\
-- 
2.53.0-Meta


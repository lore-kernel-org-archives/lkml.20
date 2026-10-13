Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0B51EE06
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908754; cv=none; b=CfCcL362uRpr6Lc6UbkwAzrKps5Gtju2N7HUSzltWIwzNjDZnrKHgkYj4Dt4VpxgqyLAr25jEph3lHI9l2Y4Bv3YsOTffOu79fGRd59zeAkQpXMddlklOvYoD9riuDwKiWbLFSfu+Oli2zUkAfz9ZB+8bNf/jY83w2HNxJ4K3d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908754; c=relaxed/simple;
	bh=nhzSFAfNWlHwihhSycSS9aSmYrWooZzpcArnEryhqEo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SfFr9zKC4HAlFsXCoglQPk0Hkm2sgOixh7ihH5+PYBSKZLUDwoR1uYgQRL56tBckw61diwLhNHcFpzP6M28A7s6nABlz/4NuwlbF8z6aqbWuxow9SdKYdLUmYuXQ6iDBBBVWVbMKXqYTFam7258NRK58d7n/trZHuUj0HSNhgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CDSoCQKU; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CDSoCQKU"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60bb65626so33698765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791908750; x=1792513550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUqD4Ux5OAYgjaajPXSrWaI1PYIhs/xbAlAZjVaS8QQ=;
        b=CDSoCQKUEiPvioP8H73lc1XhzW03aW3UNR1MOrVdL9/BSz+7YsT4/VFFiHMlrm0fru
         qjdBA9hbBtI/n/6Xm4oiL9RQYQr/2IbQaxd/pRX2rjwUPVBh+4cyBeqn8Dc8MdwGM1AQ
         OiliZxHUBKC1cIo/ZtjX9x49vB9FKBTNlMVhrbwTVDr22nGj2A770GPuG3eolcXqPfO4
         trfjfWuCrjjjFJpnIUv3TKguhxs82pyUP6M/I3emsvwM3ur+UR6DOCPFsrIETXHy7Nb0
         uppi/iVhB+/0qrOb+jfsAajwLTgBp0l9y6eUkUBxxJ9X/fxBLKW+7Z6r2oOV6XcMRMyX
         WQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908750; x=1792513550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUqD4Ux5OAYgjaajPXSrWaI1PYIhs/xbAlAZjVaS8QQ=;
        b=uMyQjg9aOV7U7h7SYafBgqm+TnYaMCqihb4lbuFiRHFNbQGP9hYUa4dqDBJQB9mC/6
         uNoZc8QPzG7DqZSsT+J1to0mheUwx0N86zYXDLf0CZuA0BY+XdyVbiTVQzueN4xQBZYN
         PWzT8aVbXCml3YiLSN2lxi9XZiR/cF8vyzd8wxrx8YH022c0NyvbN8nt9VRWdV9kelkv
         9izIFeJGK3HowyG6GafWIEPyx1yjfDqh4USikH8+UP96RywZWZsX4Vs4uzsAHzrxZQfk
         Ei2kEUti7jXEfkkFAgu7NX84plJ+Jp+h8nyZwkPuUqyxLHAzSR/MNLu9oWhVuuwKFlgs
         XvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzryJ5hIR+gPuABTRmHa7xeK7qNzX7oP2SMFm//Es/RXjiluVHz/Agl69vw4rGmgZM4UygAW6RWPbCgfVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhldXs9HNfYH8KcU6x1ecxHOBmE0sk/622DP4tjypxWcoZOH4r
	BU76DoZd1qlMbgbNL3ujH2pzqOFHVL0GBWzROlhsQwwTuTdQ9KYVn9ZbV9+kmlor627+J063HbP
	/bOT2KLiX9ZF4rg==
X-Received: from plbg2.prod.google.com ([2002:a17:902:d1c2:b0:2e8:31af:11b0])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2305:b0:2dd:ad73:5b56 with SMTP id d9443c01a7336-2e842cd12bamr86769775ad.17.1791908749286;
 Tue, 13 Oct 2026 09:25:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:25:28 +0000
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013162529.1928093-13-dmatlack@google.com>
Subject: [PATCH v10 12/13] PCI: liveupdate: Do not disable bus mastering on
 preserved devices during kexec
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Do not disable bus mastering on outgoing preserved devices during
pci_device_shutdown() for kexec.

Preserved devices must be allowed to perform memory transactions during
a Live Update to ensure continuous operation.  Clearing the bus
mastering bit would prevent these devices from issuing any memory
requests while the new kernel boots.

Because bridges upstream of preserved endpoint devices are also
automatically preserved, this change also avoids clearing bus mastering
on them. This is critical because clearing bus mastering on an upstream
bridge prevents the bridge from forwarding memory requests upstream (i.e.
it would prevent the endpoint device from accessing system RAM and doing
peer-to-peer transactions with devices not downstream of the bridge).

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 11 +++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci-driver.c |  7 +++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 38b7815fe7d4..6f92d4ddca2b 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -193,6 +193,10 @@
  *  * The PCI core adopts ARI Forwarding Enable on all bridges with downstream
  *    preserved devices to ensure that all preserved devices on the bridge's
  *    secondary bus are addressable after the Live Update.
+ *
+ *  * The PCI core does not disable bus mastering on outgoing preserved devices
+ *    during kexec. This allows preserved devices to issue memory transactions
+ *    throughout the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -973,6 +977,13 @@ int pci_liveupdate_adopt_ari(struct pci_dev *dev)
 	return 0;
 }
 
+bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+	pci_WARN_ONCE(dev, !dev->liveupdate.frozen, "Preservation status is unstable!\n");
+	return dev->liveupdate.outgoing;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index 5aac19f7bee6..333ddd8f36c5 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -18,6 +18,7 @@ bool pci_liveupdate_preserve_bus_numbers(void);
 bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus, struct pci_dev *dev);
 int pci_liveupdate_adopt_acs(struct pci_dev *dev);
 int pci_liveupdate_adopt_ari(struct pci_dev *dev);
+bool pci_liveupdate_is_outgoing(struct pci_dev *dev);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -51,6 +52,11 @@ static inline int pci_liveupdate_adopt_ari(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
+
+static inline bool pci_liveupdate_is_outgoing(struct pci_dev *dev)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index dff60a03204f..c1ac2ef025e2 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -569,11 +569,14 @@ static void pci_device_shutdown(struct device *dev)
 	/*
 	 * If this is a kexec reboot, turn off Bus Master bit on the
 	 * device to tell it to not continue to do DMA. Don't touch
-	 * devices in D3cold or unknown states.
+	 * devices being preserved for Live Update or in D3cold or
+	 * unknown states.
+	 *
 	 * If it is not a kexec reboot, firmware will hit the PCI
 	 * devices with big hammer and stop their DMA any way.
 	 */
-	if (kexec_in_progress && (pci_dev->current_state <= PCI_D3hot))
+	if (kexec_in_progress && !pci_liveupdate_is_outgoing(pci_dev) &&
+	    pci_dev->current_state <= PCI_D3hot)
 		pci_clear_master(pci_dev);
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog


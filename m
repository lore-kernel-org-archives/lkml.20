Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFB528425
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762027; cv=none; b=CKMVG5i5nFfwIQKWeIJW6oXgJxGdk5ZVwFVTxqcfLLHwTqwwTzNpvrrOR/gpVHfAFw+Rtt2K65/0twXd9Kgb0f1Xr1T2XzTlz6Hc2l97A7nUi7QKgBi5MiY1kP1CCV16Ke6wVymGVHMp+MLv7imylZy1HS7bpGlBsUEezb/lhbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762027; c=relaxed/simple;
	bh=71uGNjjTFBcC6CcgDOl0OA0ORlR5yq5Q4UzPCRZXBhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ao3phguo2bck5Sbc6q7MAN+HBdHmyA1d5WMtWbsHt8OWOLmEQD6wO6P4RyVHt7sNBJG8Yxgrje9SJp2WV3IGoeSFXLtLXVzRhPjFgz5nrrZs9xbdXzd0bnu/gy4AASn3ap2blPzD6TLl2FHlolCOT9TNvQaMsI774uICe9IRoxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Czy1qOXv; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Czy1qOXv"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd753a52bbso20146065ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789762024; x=1790366824; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siMAWwJv4yjE1eEtNkD6j1Z4yk/PjEJKUuLYDAAYM4E=;
        b=Czy1qOXvAm3CD82QgEwLk+tMR8kjVJkkQaLU0s00FSF1NiNooA/xJ2wtOluZRsfTxh
         IRsoBxGfsEWO4mgOeaFpodEyixmgUQ2eVKpzsuhzHX/FsY5Anr+/o31M1TySataFfbgP
         QW8+NUFhBAwJjsp3cjtLaSYfsV2kk8MZE6zdjCK1LKoFwaZYjMclPUfrmoJavkObzXKG
         FmahUZiFUzBmefjKJ7k7l9/u2/zzkqE5QToozpar5Rq3LnALYE7M5Jraipvh0+e9fuTr
         O/RCsfYKC8b6N/RghD+i/ohdPLQVix1f1yN3OXVCqBpmDYbSKoUAvZ4vTct9btrn3HtS
         J5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762024; x=1790366824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siMAWwJv4yjE1eEtNkD6j1Z4yk/PjEJKUuLYDAAYM4E=;
        b=Zbi+LEynhlPmF5Sikv0P7RYczZUq3upolA6fJYld4Xf+e5GHv++k3geCLVMpMoZObt
         vDktSa8rYJsNRzhwloHosI+05aODG8G42XunXoPLURJBUBVXXRRDopilM8xokJ/qULAJ
         WT25AKvfr8l6xBWhiNhKauMkMBu82QPp41QDYnDcqoi87rxfG5sFS3xKoznCsB/P+U3t
         ltTJ8AuIR+Ue7KBuWNX+ft7kFttWH3JV26imxbj8VsKZ/cB98o0c5bUHGoKxHw9imCKE
         KL/mYVqDCzNnvYewcbytpzjah5Hd+5KYaTaavEuezT75DkKo0EtpLjQs+NHr7zxpIQyE
         UC6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqnExTWFIYzfPx3bVaVT5MACwhhO+uoh0tsfcomd37OJfmb1K1M5Y/9xEmHypDdIw6tOVFF7iitf1Nyu4=@vger.kernel.org
X-Gm-Message-State: AFuF++nMB+Y1qqzhQ53/N17VVaeSJHfOISZ2wAh2N45TzKopnRHntQom
	63+3bVP2IN/PbeLET1fpakvksL5jPgzjv17v52iXpaHGMyE6hZmATcqvRxSnF/Z5l/bF2ysCo0D
	Z2yYDh7qvTf3/yQ==
X-Received: from pgbgf16.prod.google.com ([2002:a05:6a02:2cd0:b0:cc5:1124:470d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:7209:b0:2dd:c100:a5dd with SMTP id d9443c01a7336-2ddc100a681mr6689305ad.49.1789762023439;
 Fri, 18 Sep 2026 13:07:03 -0700 (PDT)
Date: Fri, 18 Sep 2026 20:06:38 +0000
In-Reply-To: <20260918200640.887030-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918200640.887030-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918200640.887030-13-dmatlack@google.com>
Subject: [PATCH v9 12/13] PCI: liveupdate: Do not disable bus mastering on
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
index 496ba74c26ce..51695782ed42 100644
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
@@ -950,6 +954,13 @@ int pci_liveupdate_adopt_ari(struct pci_dev *dev)
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
2.55.0.1082.g2b9226bbc0-goog


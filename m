Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB92F51DE0A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908754; cv=none; b=mLDb8xJgO3W6xfZmNRjAtdphSWBx3oGJ6E8NdcUGoj/S9b9tb620L5ylDAxyMjlGAZBOzEwlMh+uDTgJjA0KblJA8UURpSxdyWb3+4r9qthaepu0n/L5hoB9I7awVx0k6hyqYwkrXQ9MkthzpKRiddoPwwy/5ewQElnGJPTekhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908754; c=relaxed/simple;
	bh=MlotRTexNwSu2BGIKz0FW9IEEKNoIUPTXJa84+kNnV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oSzwQysokjy2HT7G+ZMaTrQ7f97j8RoV3w7xHGRxR79ra2NLoU3ZYnTO9ISFU64ha2A9SMYvGrcal7EggY7KmQBcde2YO3dhyFTeFYncQB9fL2Y/S1T8HaO5pHOh2U+IzB4LoSm4T6MbgAylVFfqAflt/lcJC9p0znFCoJZB2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iKOngI9t; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iKOngI9t"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3789040a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791908748; x=1792513548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbdiAFt+Oje3uTZOnPEvaOqLxPnobGariVTCdptn2ik=;
        b=iKOngI9tap1dFtIBP4WMJ1yFpU2g9vAICM8UrZhCGiP3ZvybgEWG2EKfdk0sMVJwO8
         0m3c/tT5LBnEdw/H341pclundvJ+4WbNZxZRnOwBTBupMqdjZnyljJLD4q8i7ePFEDh1
         9nLJTGI+DApE4/4lfOzmoqQyGIsOsVgszB5zKbtv04FWjDxJWOI+S3VKdt7+7raRlW9p
         +MxYMlimM8fhgOQDYyMuApMQY4KOc+KOpTssxubaiVp0NlAgKxg4lg/tqSgtBcFD6P9G
         jiAtxfEaeTcn89ZXfGGtNV/nYXz/EZBY2o+4fz3xS1VoFldFbnYrjJ/Q2LowX9DFxaGa
         40Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908748; x=1792513548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbdiAFt+Oje3uTZOnPEvaOqLxPnobGariVTCdptn2ik=;
        b=SPwSgHSFa+w49UwxTPZJUt4QhefFVAlzZ9B69X5qxPA5q0Ze382GnAMpy0Vt0bdCmZ
         7dIT7cOr/osUZLcx7C9Dg+4gAAhR+XAN2QBw/PZmB4lGrc8K3yEObpZfuEk6KMWO0zth
         2PXwDYs+2xW1y7euqY9zcHefqrqD1cfUbsRjbsJtSekTcgJVayn43gsvq7s60LikHkca
         MKnihLqaL8BnMCSKxOzycb1ojFDqWEDiQouhNf7/HHjBrrkOQjwDFSOaenKHpSpR9j8P
         dVnZh1wNC18tb1pA3gWVS/fsXuqnL2ZzOuyJfx2vNZJgkKn7L82/j5NAofC8GNS3BnvM
         Z0qQ==
X-Forwarded-Encrypted: i=1; AKwUvByOqeAy6JLOxFKZGq5lw21pN3N2gDHFQgXEGSYUQsQ+gJkxoyeFV83jE96jBTwKwsrglVIK98lP52TN3ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0x2yzL4Pr2vCLci3MGotZkqUjINJ44VrfZiBFz6JYaS19ghM+
	YDNYRDn0libpnRvj2+aWI3tKPzFYw7qmXgTiw7TJAgGJqBUNIE/XVxqMT51/rL8X3b8bVDi6yKO
	QLlGzDJ75wO82fA==
X-Received: from plbl17.prod.google.com ([2002:a17:902:eb11:b0:2e3:1b6e:33bb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d4f:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ab3a79d9f8mr10690339a91.45.1791908745986;
 Tue, 13 Oct 2026 09:25:45 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:25:26 +0000
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013162529.1928093-11-dmatlack@google.com>
Subject: [PATCH v10 10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on
 preserved bridges
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

Adopt the ARI Forwarding Enable bit on preserved bridges and update
pci_dev->ari_enabled accordingly during a Live Update. This ensures that
the preserved devices on the bridge's secondary bus can be identified
with the same expanded 8-bit function number after a Live Update.

pci_liveupdate_adopt_ari() updates the bridge's ari_enabled the same way,
and from the same context, as pci_configure_ari() already does when it
enables or disables ARI Forwarding on the bridge.

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/pci/liveupdate.h |  6 ++++++
 drivers/pci/pci.c        |  8 +++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 1d2324d339da..e640794cc8e6 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -189,6 +189,10 @@
  *    way after Live Update and ensures that IOMMU groups do not change. Note
  *    that a device will use its adopted ACS controls for the lifetime of its
  *    struct pci_dev (i.e. even after pci_liveupdate_finish()).
+ *
+ *  * The PCI core adopts ARI Forwarding Enable on all bridges with downstream
+ *    preserved devices to ensure that all preserved devices on the bridge's
+ *    secondary bus are addressable after the Live Update.
  */
 
 #define pr_fmt(fmt) "PCI: liveupdate: " fmt
@@ -922,6 +926,37 @@ int pci_liveupdate_adopt_acs(struct pci_dev *dev)
 	return 0;
 }
 
+/**
+ * pci_liveupdate_adopt_ari() - Adopt ARI configuration
+ * @dev: The PCI device to adopt ARI configuration for
+ *
+ * For devices preserved across a Live Update, read the ARI state from
+ * hardware and adopt it. This ensures the device continues to use the ARI
+ * configuration established by the previous kernel.
+ *
+ * Return: 0 on success, or -EINVAL if the device was not preserved.
+ */
+int pci_liveupdate_adopt_ari(struct pci_dev *dev)
+{
+	u16 val;
+
+	guard(rwsem_read)(&pci_liveupdate.rwsem);
+
+	/*
+	 * Unlike ACS, only adopt ARI while the bridge is incoming-preserved.
+	 * Once all devices below the bridge have finished, recomputing ARI
+	 * Forwarding Enable yields the same result for the same device, and
+	 * must be allowed to change if a different device is hot-plugged.
+	 */
+	if (!dev->liveupdate.incoming)
+		return -EINVAL;
+
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL2, &val);
+
+	dev->ari_enabled = !!(val & PCI_EXP_DEVCTL2_ARI);
+	return 0;
+}
+
 /**
  * pci_liveupdate_is_incoming() - Check if a device is incoming-preserved
  * @dev: The PCI device to check
diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
index d4721ffcecb2..90b2754ecc0c 100644
--- a/drivers/pci/liveupdate.h
+++ b/drivers/pci/liveupdate.h
@@ -16,6 +16,7 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev);
 bool pci_liveupdate_preserve_bus_numbers(void);
 bool pci_liveupdate_refuse_bus_numbers(struct pci_bus *bus, struct pci_dev *dev);
 int pci_liveupdate_adopt_acs(struct pci_dev *dev);
+int pci_liveupdate_adopt_ari(struct pci_dev *dev);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -40,6 +41,11 @@ static inline int pci_liveupdate_adopt_acs(struct pci_dev *dev)
 {
 	return -EINVAL;
 }
+
+static inline int pci_liveupdate_adopt_ari(struct pci_dev *dev)
+{
+	return -EINVAL;
+}
 #endif
 
 #endif /* DRIVERS_PCI_LIVEUPDATE_H */
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 650d7f92f93a..e5b960ca26e6 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3705,7 +3705,7 @@ void pci_configure_ari(struct pci_dev *dev)
 	u32 cap;
 	struct pci_dev *bridge;
 
-	if (pcie_ari_disabled || !pci_is_pcie(dev) || dev->devfn)
+	if (!pci_is_pcie(dev) || dev->devfn)
 		return;
 
 	bridge = dev->bus->self;
@@ -3716,6 +3716,12 @@ void pci_configure_ari(struct pci_dev *dev)
 	if (!(cap & PCI_EXP_DEVCAP2_ARI))
 		return;
 
+	if (!pci_liveupdate_adopt_ari(bridge))
+		return;
+
+	if (pcie_ari_disabled)
+		return;
+
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ARI)) {
 		pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_ARI);
-- 
2.56.0.385.gd3acb90ef8-goog


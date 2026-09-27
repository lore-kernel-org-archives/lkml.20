Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA241A55D
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533227; cv=none; b=JMBbMvnJP+aabOZqsaI7g6+Jrw5ue7w5ksIni4lVYiC1TXu04alI2watg05QqHFiKlv39evgFyd6MkgvfMJzlqUhznfzZDQcO0IOUljGl1qytI5SCDMET6hweM1ewy5qV41m6/CCtso/kM9vNYCJc2TxqIc5y6ca/25ps/uCapk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533227; c=relaxed/simple;
	bh=mMwi/NfTduz/j9ghsttpZUHmM50236YObntODgocA60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRMjIHFzOVWannwLdJo3yAAylK1qk55TQaFZC5MCw3snYSETOlUGP0El5DGiLe92RXPA5S5skIZe5BKCjfRYu3W5IQerGVwUFpkudbmwy56kMc+1IoDgKe5FPGOb/HTuMq13CDnNrhhnuhOnxaZmdS1Pc07aVv4U+I1n6oEE1wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL6gvdUr; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL6gvdUr"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so1463859f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790533224; x=1791138024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuN5+KumXzfDF7N5B1L0sRY32M0tbe03+VKPfAOnEmE=;
        b=mL6gvdUrp8HEVFPfIDZVa3jbqCtADeM/sJTDL2ktGYSyCubCDoTEjV/QU4Bp8KQF+p
         766eZlxe11NVCKbUhjm03ZHeK7r2+m5Vp4ek1lYarvnW+UT9+JnzyRATlkEetZHVSKM0
         nceLWSFQMH70TsTgUa2DWiMUdLGFLxx+fVrVfAJC6FGkTrxdUZRWrjblUNk1j+XQhk87
         dR5IinmJ7tXb0EpLV7OwkDG3qkC3ozNk2i3sq0Vfh63WN5UUxZSFMpb1bdWWy1g7rYjc
         M5TcEj0KHsafmurPgeQAK0giFuL+QqpiFpz0F3Ghxn8f4aEVVBf0D/Syf6TnpRBTnJpk
         sswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533224; x=1791138024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HuN5+KumXzfDF7N5B1L0sRY32M0tbe03+VKPfAOnEmE=;
        b=HVKkRp7fMDVmo2ciI9pWZMbosQfwK9lBj4/AWghJDIM1Zd7EEshyDr/kBsEyt04knz
         w7hRGEt6mVa8sEWiXZPBGtsnnVQfhtkMIUDRjZrSpISkPnvp1NJKsw/Z9lJeBLvbcRj8
         rdA17AddIgRo8G8CQ9EFRTxXXfeRVz3awsu56kQTGeP/B9jSxDXgpTwqeM6A56RPlbSM
         CUaxRZ2WKut1syDPkQx7X+Ia5R2MWL/v3BqkBac6MkpTB6ttqaiMFo9G2uxU4dbuW+Mu
         BaJHwSZO3YSVfojLE4DYVcYgYrGIdtWbI75RrFF/WNY0nNBlSOQTcYkyOr7QCo3eb/l2
         r5vg==
X-Forwarded-Encrypted: i=1; AKwUvBxFsDiJrOUF+fvkG+YD5DwYs0wQSxXKc1sDMOz23philBlCtNSmJAMWflL46/a94NbjbgB1BwkoRDXpUVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nUBHxJkPBu+e71OHed80sa9w67qptVKo5dUOt6+iRKpB6g9Inw
	SdVFsdcSl7u2uEyE91X0+MlpBj6Ntg+3eITzQxK1xA2cH2hvuq/FcXXI
X-Gm-Gg: AYBFou05y7g0i+J5pS9oQavbmujxIJpyBSjS/GWmsd2NdLuqxgB9qTytXNB9Mw4NI39
	LmfoOMqsmGfDfXydVqwkdxafrcpvUYER1T/LS+E+eg9MxGebQsgjlUDFubClBwAZCW2expzsMh/
	lKqbJhS/7PAskJ2euUqkL9z2d77IPjfTIr1GwsMpdIYNmpGdmyyGC/twnWHD1Ot5VutSFG+VxkN
	oIjZC0Ht4rlARaVajIlNQ9UIbd3esk2qSlmPccyck1RgyVdtNz85fga44BHQf6h+Ue544P2EEAT
	+rBMRAM0+nycvPz9WzPCwoidFG+uLje5h3O0A2K/aDQO1v0amapsteuRYO+qp/9relhxxZRHDBf
	lnPcEM9qdoBWD1j7Ht+kGi+ohbAMRt3TPxRPXq3tF4rGobU8APyGe3ZVpa/QW7gwSmtCHHgRcB6
	qgOhlocjFjb5X013Tqlzb749LPga7ralug4hy3O30XzTvmlNAZMiMxEMbHEqFzi0Syi4K+1A/i3
	soqTUDRmHx4M5XLALHpcVB6nkbvz31yK94pM/Yn5kShxV7QYsKim8mE9SjQmk85zWZIubQX7JoG
	WQ==
X-Received: by 2002:a05:600c:a30b:b0:49f:faa3:3ca2 with SMTP id 5b1f17b1804b1-49ffaa33f7amr58861175e9.13.1790533223658;
        Sun, 27 Sep 2026 11:20:23 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a002d1d8d5sm38371585e9.0.2026.09.27.11.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:20:23 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC v4 1/5] PCI: Report surprise removal event
Date: Sun, 27 Sep 2026 18:20:12 +0000
Message-ID: <20260927182017.938565-2-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927182017.938565-1-abhinjoses@gmail.com>
References: <20260927182017.938565-1-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Michael S. Tsirkin" <mst@redhat.com>

At the moment, in case of a surprise removal, the regular remove
callback is invoked, exclusively.  This works well, because mostly,
the cleanup would be the same.

However, there's a race: imagine device removal was initiated by a user
action, such as driver unbind, and it in turn initiated some cleanup
and is now waiting for an interrupt from the device. If the device is
now surprise-removed, that never arrives and the remove callback hangs
forever.

For example, this was reported for virtio-blk:

	1. the graceful removal is ongoing in the remove() callback,
	    where disk deletion del_gendisk() is ongoing, which waits
	    for the requests to complete,

	2. Now few requests are yet to complete, and surprise removal
	    started.

	    At this point, virtio block driver will not get notified by
	   the driver core layer, because it is likely serializing
	   remove() happening by +user/driver unload and PCI hotplug
	   driver-initiated device removal.  So vblk driver doesn't
	   know that device is removed, block layer is waiting for
	   requests completions to arrive which it never gets.
	   So del_gendisk() gets stuck.

Drivers can artificially add timeouts to handle that, but it can be
flaky.

Instead, let's add a way for the driver to be notified about the
disconnect. It can then do any necessary cleanup, knowing that
the device is inactive.

Since cleanups can take a long time, this takes an approach of a work
struct that the driver initiates and enables on probe, and tears down on
remove.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Link: https://lore.kernel.org/all/fba3d235e38c1c6fcef2a30ed083ad9e25b20fa3.1752094439.git.mst@redhat.com/
[Abhin: adapted subject, serialize with a per-device spinlock]
Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>

---
Changes since RFC v2:
- Protect disconnect_work_enable with a per-device spinlock, held while
  testing it and scheduling the work, instead of lockless accesses and
  barriers.  pci_dev_set_disconnected() could otherwise test the flag,
  get preempted, and queue the work while a newly bound driver
  re-initializes it.  With the lock, cancel_work_sync() is sufficient
  again, so go back to it from disable_work_sync(). (Sashiko)

Changes since RFC v1:
- Use disable_work_sync() instead of cancel_work_sync() in
  pci_clear_disconnect_work() as schedule_work() on a
  disabled work item is a no-op. (Sashiko)

RFC v2: https://lore.kernel.org/all/20260927165459.829900-2-abhinjoses@gmail.com/
Sashiko review of v2: https://lore.kernel.org/all/20260927170707.6F9241F000FF@smtp.kernel.org/
RFC v1: https://lore.kernel.org/all/20260905183905.997833-2-abhinjoses@gmail.com/
Sashiko review of v1: https://lore.kernel.org/all/20260905184649.E8F621F00A3A@smtp.kernel.org/
---
 drivers/pci/pci.h   |  7 ++++++
 drivers/pci/probe.c |  1 +
 include/linux/pci.h | 57 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc23..175273756c183 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -802,9 +802,16 @@ static inline bool pci_dev_set_io_state(struct pci_dev *dev,
 
 static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 {
+	unsigned long flags;
+
 	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
 	pci_doe_disconnected(dev);
 
+	spin_lock_irqsave(&dev->disconnect_lock, flags);
+	if (dev->disconnect_work_enable)
+		schedule_work(&dev->disconnect_work);
+	spin_unlock_irqrestore(&dev->disconnect_lock, flags);
+
 	return 0;
 }
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5afc..3a05ad32bfd54 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2515,6 +2515,7 @@ struct pci_dev *pci_alloc_dev(struct pci_bus *bus)
 	};
 
 	spin_lock_init(&dev->pcie_cap_lock);
+	spin_lock_init(&dev->disconnect_lock);
 #ifdef CONFIG_PCI_MSI
 	raw_spin_lock_init(&dev->msi_lock);
 #endif
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107b1ef..aed62ae709f59 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -592,6 +592,10 @@ struct pci_dev {
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
 	struct gpio_desc *wake;		/* WAKE# GPIO */
+	/* Report disconnect events. 0x0 - disable, 0x1 - enable */
+	u8 disconnect_work_enable;
+	spinlock_t disconnect_lock;	/* Protects disconnect_work_enable */
+	struct work_struct disconnect_work;
 
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
@@ -2123,6 +2127,59 @@ pci_release_mem_regions(struct pci_dev *pdev)
 			    pci_select_bars(pdev, IORESOURCE_MEM));
 }
 
+/*
+ * Run this first thing after getting a disconnect work, to prevent it from
+ * running multiple times.
+ * Returns: true if disconnect was enabled, proceed. false if disabled, abort.
+ */
+static inline bool pci_test_and_clear_disconnect_enable(struct pci_dev *pdev)
+{
+	unsigned long flags;
+	bool enabled;
+
+	spin_lock_irqsave(&pdev->disconnect_lock, flags);
+	enabled = pdev->disconnect_work_enable;
+	pdev->disconnect_work_enable = 0x0;
+	spin_unlock_irqrestore(&pdev->disconnect_lock, flags);
+
+	return enabled;
+}
+
+/*
+ * Caller must initialize @pdev->disconnect_work before invoking this.
+ * The work function must run and check pci_test_and_clear_disconnect_enable.
+ * Note that device can go away right after this call.
+ */
+static inline void pci_set_disconnect_work(struct pci_dev *pdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdev->disconnect_lock, flags);
+	pdev->disconnect_work_enable = 0x1;
+	spin_unlock_irqrestore(&pdev->disconnect_lock, flags);
+
+	/* check the device did not go away meanwhile. */
+	if (pci_device_is_present(pdev))
+		return;
+
+	spin_lock_irqsave(&pdev->disconnect_lock, flags);
+	if (pdev->disconnect_work_enable)
+		schedule_work(&pdev->disconnect_work);
+	spin_unlock_irqrestore(&pdev->disconnect_lock, flags);
+}
+
+static inline void pci_clear_disconnect_work(struct pci_dev *pdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdev->disconnect_lock, flags);
+	pdev->disconnect_work_enable = 0x0;
+	spin_unlock_irqrestore(&pdev->disconnect_lock, flags);
+
+	/* No one can queue the work any more; wait for a queued or running one */
+	cancel_work_sync(&pdev->disconnect_work);
+}
+
 bool pci_suspend_retains_context(struct pci_dev *pdev);
 
 #else /* CONFIG_PCI is not enabled */
-- 
2.51.1


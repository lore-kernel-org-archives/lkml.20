Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C341A4F9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790528118; cv=none; b=VsDI1pg9t8czHLZSyN30TGr1zA2fUj4lTUscqNQoXbAf2gcLPg4ATAV3W5MgMFKlkT8TZR7nWijXxQOpVmC/xrywAKQSEid2UIpPQF7gg21xvnpmSRvKQQTIazXZOc8nX+lvEY/4xH+I3a/eyvDwh8gbKX6UdXMMZi4tWSClpoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790528118; c=relaxed/simple;
	bh=zvgPNtgEV3XUZTjOhykb+vFGe+Y28bThSws7HYKP/V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCYrnWVumf+Dp74g6ktTRiVMjJ1mNSQNzOPIwYNrPa31G2duG+SvS/QI6nm24a1rkUBXCCKQCBk25oGL7ztQZG4EZqTy3DkUDgAItD41CSA1cPzmW/pWlYtziFHbCTkbJ11Rj8L3CZ9//Q+R2JAtimJQ1QHgdGX9ALjLtf754aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZEF0ly0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZEF0ly0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso6177465e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790528115; x=1791132915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NENXEnJkmEcvTpyI0fSgIXQlrSrcmqG3oVoD7VhdCTw=;
        b=eZEF0ly0vIrTqiyFoxVM+6tKZk90/Kcnf6XLyDhxWryMgpYcXiiScMwAEANkfyypNu
         wGH6Z3xTC4KO4vBpw5PQO7392x8v38lbo4TJcSMZzvJfCCiV4QTfQxz8QYW25dtAwYxS
         dUUjhS+9W0b3Sx5X5CPOxt9xfRWUJpWaEzmaMX4LCTk2TivdxDGkeUyIcGR4Sb4bVIq4
         M8LK8tZC8B3A7mK0cmTqsddFZrcBj4Ks301EWhiJJ2aTRBJS1oDmO/7swVoroQssOU/N
         V4YMsG0TpbhaLtSYh1QxFbhKiYoEkDSK2ndQo94QBCHeKXUdKKCcSByIR7KlKwG6s3/K
         2x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790528115; x=1791132915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NENXEnJkmEcvTpyI0fSgIXQlrSrcmqG3oVoD7VhdCTw=;
        b=Xmjvd7zZ3bfKG29VRnv3EZIMGa5PBGhUs3de5a2pJAv6iD9mRlINgr0EtCQjBr8xu3
         +yDRECE4UcOCXoY2yrn0U+kdY0UtmBfOoj/oSf59bj8Wyvb+GRE0+Wec0pgLupwrFol7
         97wV9C7FdeapDy9UXUy3POPtR65TAvXxZfxKRPzvD236lBw242xMc5kCVMrtIYbci9jF
         Z3n/RIRpzVmIWboHddWR1Cs/M78kG7LaYF4jUEzUs4sLoP5d8ySK8ufr3zZY/uBZhllo
         tgUa9ccjmcXr+eEh0+kOfPDl4WKS7tb3Lb83qAuX9RATWE6c+K4SFrvFd48OG+UmS1Tb
         cIBg==
X-Forwarded-Encrypted: i=1; AKwUvBzgD5qJPAwJgr0WVCYcKf88jJt10t8Qs6VVMMnqIrfn6mzPS4x7Zp8+3C5/jXYEWLgKQXqm1RYef6URkks=@vger.kernel.org
X-Gm-Message-State: AFuF++klpxpWuMb7B7ONmyhGyLM+w0Yvg+czQPP5iyTOa6O2ae95GGxr
	DQ3BKO3vKSvU5PUI+oGEBGIwyAIYjaFC20GoJU4rd6CjSbqzgmvi52dR
X-Gm-Gg: AYBFou2q2Kl4WBM7BjZPJAjRC2MiGFVDCA/7270QbldpcM8NegFvuCnmJJfiqb9wk5e
	FdS6slZYq2p3hIYsJIisioZCuNp9yWZ3ofU8jeJDh/ybEiLgt+68ujurg9fjQgs8V1AHfyPgrq3
	G3e0/2+iBQNKI4a6H/Ljy3iWYn/gZAH8F6CIGdOWzaCgc01QNdu3p5gXku5zLWVIUjwe8K9D8on
	Fzk1Db4tpoWwfmb/hNPilxDsz2IxliGeSsGU/UAkCSuKVR3wheQbGi1RJ4hoLZoASrlO1UXJHxG
	70HuUuLlvgMfOeEe5r0RpQs7qmGcnoFM74IowlxEK4CEldec0XcHE5znW7GIQCuE320k8GKY6bW
	t5ncBV65PncBVsQ75YvYIl2gTKFfYhkPgfXYo2lyglqGsV1e3PYskqoAA+f9FDdX6HABvlPVnNN
	sh3LkherIjSoQo8jOCBDvw2tR2v8PDYSR6U0ydqdxJ5310xtPEbyLfEM7wlFWmn1qnBO9Uvv5rz
	2fS6cwGZlAdbuk24iY4PThfKgAdN13d+gfkBdASO6kiOvHBAcDJJBtlDku80UXhCJU=
X-Received: by 2002:a05:600c:8b82:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-49ffefc7e4dmr65435835e9.15.1790528115192;
        Sun, 27 Sep 2026 09:55:15 -0700 (PDT)
Received: from f3a6eae2255e.fritz.box (dynamic-002-214-014-217.2.214.pool.telefonica.de. [2.214.14.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm76167695e9.11.2026.09.27.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:55:14 -0700 (PDT)
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
Subject: [PATCH RFC v2 1/5] PCI: Report surprise removal event
Date: Sun, 27 Sep 2026 16:54:54 +0000
Message-ID: <20260927165459.829900-2-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260927165459.829900-1-abhinjoses@gmail.com>
References: <20260927165459.829900-1-abhinjoses@gmail.com>
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
[Abhin: adapted subject, switched to disable_work_sync()]
Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>

---
Changes since RFC v1:
- Use disable_work_sync() instead of cancel_work_sync() in
  pci_clear_disconnect_work() as schedule_work() on a
  disabled work item is a no-op. (Sashiko)

RFC v1: https://lore.kernel.org/all/20260905183905.997833-2-abhinjoses@gmail.com/
Sashiko review: https://lore.kernel.org/all/20260905184649.E8F621F00A3A@smtp.kernel.org/
---
 drivers/pci/pci.h   |  6 ++++++
 include/linux/pci.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc23..23b1605e783a3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -805,6 +805,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
 	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
 	pci_doe_disconnected(dev);
 
+	if (READ_ONCE(dev->disconnect_work_enable)) {
+		/* Make sure work is up to date. */
+		smp_rmb();
+		schedule_work(&dev->disconnect_work);
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d31a8d107b1ef..f4c0240b62dc8 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -592,6 +592,9 @@ struct pci_dev {
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
 	struct gpio_desc *wake;		/* WAKE# GPIO */
+	/* Report disconnect events. 0x0 - disable, 0x1 - enable */
+	u8 disconnect_work_enable;
+	struct work_struct disconnect_work;
 
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
@@ -2123,6 +2126,49 @@ pci_release_mem_regions(struct pci_dev *pdev)
 			    pci_select_bars(pdev, IORESOURCE_MEM));
 }
 
+/*
+ * Run this first thing after getting a disconnect work, to prevent it from
+ * running multiple times.
+ * Returns: true if disconnect was enabled, proceed. false if disabled, abort.
+ */
+static inline bool pci_test_and_clear_disconnect_enable(struct pci_dev *pdev)
+{
+	u8 enable = 0x1;
+	u8 disable = 0x0;
+
+	return try_cmpxchg(&pdev->disconnect_work_enable, &enable, disable);
+}
+
+/*
+ * Caller must initialize @pdev->disconnect_work before invoking this.
+ * The work function must run and check pci_test_and_clear_disconnect_enable.
+ * Note that device can go away right after this call.
+ */
+static inline void pci_set_disconnect_work(struct pci_dev *pdev)
+{
+	/* Make sure WQ has been initialized already */
+	smp_wmb();
+
+	WRITE_ONCE(pdev->disconnect_work_enable, 0x1);
+
+	/* check the device did not go away meanwhile. */
+	mb();
+
+	if (!pci_device_is_present(pdev))
+		schedule_work(&pdev->disconnect_work);
+}
+
+static inline void pci_clear_disconnect_work(struct pci_dev *pdev)
+{
+	WRITE_ONCE(pdev->disconnect_work_enable, 0x0);
+
+	/* Make sure to stop using work from now on. */
+	smp_wmb();
+
+	/* Leaves the work disabled, so a racing schedule_work() is a no-op. */
+	disable_work_sync(&pdev->disconnect_work);
+}
+
 bool pci_suspend_retains_context(struct pci_dev *pdev);
 
 #else /* CONFIG_PCI is not enabled */
-- 
2.51.1


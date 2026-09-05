Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFB4F0549
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633566; cv=none; b=RSnAgwFrpqNRTG9XIe0EdHb4hG8DwPdjVnPHY5EUBCAPQUXyJCU34uo8SJon5GizTL/xGMkoPr8mHkop51TKyYjvMz09eYILl802SlpuTEM9Bj8EcP64XjGGWcfF+fhsIaJaCU7WK+pZIz9Gi9BvOXK5BFxNLDO+BAY0p31a6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633566; c=relaxed/simple;
	bh=2YluIy60Jfzmukqkh5yOQvfMAun1hVRGK+XOEjZhVsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWpAUB4rzEDB4jWUuYhnhZTwowjZgQVytco36zNfMUHrdwYfZTHdVa32ti+rnVa/hpJ3hwGXmj0ntGM0pHEtamI8kY9tMQwf+iefEvcy3X9IFGla5WD92FdlgtRyYJA3F9pI+tCHdcvNnBmmgYpX1cWoxk5rcgO0kU7mHD4waGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLz6LIxb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLz6LIxb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e9c5960so2157087f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633563; x=1789238363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0q/PhqzpPPYuw5I7NOI37oNV5qDMBKzDX3eeEPIj9k=;
        b=KLz6LIxbRakntqO5V2uMN+MjCp/PT0SkGjrF/WegNNP+dwIlC5SrSc7eWmgc0ZSJ+f
         UaLOSXLpT21iEwTw/HQcnXotfnTfIUmu4q3Bu4LhhfBqzSL3D5nGxceYn6Aw14nWlPab
         3YdtPPdBj0VSEv5gTLuJyB+wq+xQUGWGIQk4IoQBH6HX2Gxe67zytz5WOSRg9qlZMNAE
         q5TLzZDK9v3+XLEtfI29n/+bVHl7D+4aoOy7NYy4FrlE9y3pd+9admpi/H97DpqpyamP
         45dAtFa/Qd6IqCRcIZP7HcB38R5nt3U7tNIMO6qDpcCMtMZfvuirIDNXV6PAP7kG6Dzx
         u1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633563; x=1789238363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0q/PhqzpPPYuw5I7NOI37oNV5qDMBKzDX3eeEPIj9k=;
        b=aI8EMFoSTo+IpfEIcFMbiGse6bnUBBCTNLQ4o1xVER8ZCkWYCuDw0GbT1RT6/MyPR6
         u6kI4niEbYAubJNPPVM9gNhjhJFYGlD3GN07RXc5E25jlJp8xW909RFGg2YWL5cQxVKG
         U7wGavbV42FYtsgGc3rHlHwG0k73o4/NukXV+B423n6SjxwBydEC31sFG2CoB7S1kGUl
         QptADkrertfZBJYleMzMP8JdOaxnjaF1tmsKDvlLpm7CbiMBRsAkHyPDmMQGRbRrf7vk
         bqYigWXRPrLDHF+Lj71Fj3a/+rindutyLYg2jMLxZI0gVAOprGv7qcN1hHdN97GaDWj/
         yIdQ==
X-Forwarded-Encrypted: i=1; AKwUvByPtK49btuf1R4ezUV3NLHX3t0ldzkws0KTCYaeJmYr7Mf9/NflhCNbLzALLNIjSv8K+EFMO/wBlfk79aE=@vger.kernel.org
X-Gm-Message-State: AFuF++lD2/J99eC7uAKg0iZSF4bJUvd2P3LMF8o0dkQ6DQ8CnCyq42IL
	GZAeqbcCK9MC5R8iOY+/y0J5JOpkkBoKbx2SR438u0uHd08wKEf4I7hj
X-Gm-Gg: AYBFou0ZbeoklsR3I8kLT9K/kqHGGu8/PU2VAMlXOv+8IyeFKai9aqeaSRcN1LGk2Yj
	f7I5IAVhZoi0jTLu3kZ00P4LMwca0c/duO2Q2q0lxOZcp4WXopLZJG29RG2SfBmv5KqITQ0jkY0
	6rDF11zCR4mns7Z/pd/Ojoy+PXH8RntuP3BMB6EteMJEjI3IeDdQoZIgJG67C1y0yLNdioiSzKw
	y2SMmrf5GHtuPXkF/bH7HLgzxY4H+cxaxXqrlcLwqRj2moJWUZVOyHINWKsw1EvQyGRhcTgmk8b
	5v5z1KIB/GoC0YgFIu3pBoA6SSlAMIg6ndUaN7oPzcXguwhPCTaxtaCQeDjGbyj0qot1Hek9iRI
	+NLaV6UhyrSd2w+G0Ong9OJl3kMrn14IX4ELLPYGDU4b0hX3kK1dr4Wj9p3xcJX48hEJDn+92JM
	h8Z2sszcG6XJ5Np00Gxc5U5klfesqgxHOKim0oeRTlINBeXUWmVTEG35KA9Y6LKolc82rINHNB0
	w==
X-Received: by 2002:adf:e19e:0:b0:485:8c16:5eef with SMTP id ffacd0b85a97d-4858c166088mr10620207f8f.41.1788633562541;
        Sat, 05 Sep 2026 11:39:22 -0700 (PDT)
Received: from 1c44f78ca37e.fritz.box ([2.210.128.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm16333603f8f.34.2026.09.05.11.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 11:39:21 -0700 (PDT)
From: Abhin Parekadan Jose <abhinjoses@gmail.com>
To: bhelgaas@google.com,
	lukas@wunner.de,
	mst@redhat.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	kees@kernel.org,
	xueshuai@linux.alibaba.com,
	Abhin Parekadan Jose <abhinjoses@gmail.com>
Subject: [PATCH RFC 1/3] PCI: Report surprise removal event
Date: Sat,  5 Sep 2026 18:38:58 +0000
Message-ID: <20260905183905.997833-2-abhinjoses@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260905183905.997833-1-abhinjoses@gmail.com>
References: <20260905183905.997833-1-abhinjoses@gmail.com>
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
[Abhin: adapted commit message subject]
Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
---
 drivers/pci/pci.h   |  6 ++++++
 include/linux/pci.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index ba3c3fddddc2..23b1605e783a 100644
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
index d31a8d107b1e..06d43f57f509 100644
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
@@ -2123,6 +2126,48 @@ pci_release_mem_regions(struct pci_dev *pdev)
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
+	cancel_work_sync(&pdev->disconnect_work);
+}
+
 bool pci_suspend_retains_context(struct pci_dev *pdev);
 
 #else /* CONFIG_PCI is not enabled */
-- 
2.51.1


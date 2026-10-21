Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792620751;
	b=xcJ4B4+gwK9p/7ryy3b3wF/QF2xSGeSZiuTXQvoC+AKIJ0faHC/RTgeIVZNm+SC0DKCH
	 CKfQHQjE25DBMt+KIWKLqF64cCSFXl9OyqcLFjQgktf3hazJMXBjaZOrepxGcMZ8LYQba
	 kZzH4g4+bVMOkbSIjdhC1mqn95yYlNdNZ7In3a3eBbaJSqRWIuhWT4VBCTDF1ngorKztU
	 oTmvs0Lghxt4ziNvKJEHPKXmppVpuUalp4R8nh2eMJCTko8umvABEybriqOJiY4k3SwMr
	 bTYa5tmuHsXU91Utd3YC8695LQ8T95RGzh23SSmAMaYEhe7v6jlGv7TJgO/T11elvUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792620751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0kWLSTkaGmwILUZyU8FNS5QIr+xYWnhodPqsDv2YknE=;
	b=2t7sP1MeiBzSPW7/3ghFAr3/DA9HV+DxXVtWTW44A4deLtzmFmteH7PeVeJsvoX59C0z
	 ymy97ER6PZIoos9lbZuYJMexVwgWzNI6GW12HRCvso0yHBAHs3qXPiOcoA8TZU2uCCSU+
	 oTMIG5OSWEQyc/KpUiUCA4MO1/nVC4QhpvVNUzGHtE37hgdF9tC1KNLkVa5VcEH1QpHKo
	 tuCWolXgBZdpMyFYQ8ifs1FCF79mWlQVqKHwanDxriWWw+2/mMpkALCu/TKIOPGNgNIXy
	 ykKhuo9K53Rz7DmhnJAoVV/Aveb7xfYIyk7HPqxSDItaxcRtqrsg7/9LTFG9Gos9juw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="s9/i5Cxg";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C4D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s9/i5Cxg
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so1612911eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792620750; x=1793225550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kWLSTkaGmwILUZyU8FNS5QIr+xYWnhodPqsDv2YknE=;
        b=s9/i5CxgfCcJEOJxQp2HH3Eo6Yw99tKxurJogPoqYoeoupVDjFTHfE9TWRhjR0KEhQ
         +oKodSeLo30RvYhCPJJWswFvvBeSoqJolN7Q93COkIKGLysC/gHdnswab/8HtJqrvWrM
         eG/ckopEGI9s/Xpxq6NyzTR5J+lrF+GvwTZw8S23U0C0qDOjECAVvjgmeYcwxHRVjVba
         h9uKjhDsah+p5HFxskRmu1gVckbZ9zD+B8gSArUtCV3U6bWDe/c1lbYmi17jy13vu7wD
         +4wRy9hgQ66VtXOFynTzH352ghkJMAPiJ3w1NhOsP4b77Bi6zOlRWSZw7vi5fZZhLbdD
         MDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792620750; x=1793225550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kWLSTkaGmwILUZyU8FNS5QIr+xYWnhodPqsDv2YknE=;
        b=eW7rJSaIfouTwlg0F3Q04hkKENGUPWguv87KgvUoXPRafIV2bcURaJAx3QiG63GLGL
         JyaHaKcBXJSnqRDysRqySNqnCC80OVSqLfiLhK9cLQuw/by7JkUqaXtyjx1V0jNuHAyp
         8i1w2EJ638LGA5eudqQ/apgwR2JEPIuSviWskOcoKh6y3sPeo0oBqRCnG/YqVcVzT9+T
         dyBzBqsFgybBpMQNEFSOp0UemeEpiJ4kBthQ4ywP+upO/TKd5AOeEuLHN33XzuXT0BeN
         o0o+OfDkO8RWGJdWdqGvBIQa1eeogKl7NTjewFwqrQfWYTLd6R0aDpt0/6cfnGaOI2JJ
         eUYw==
X-Forwarded-Encrypted: i=1; AKwUvBwKmfRuUh8dYBfK6llBA3L4F5ehOuT+DU3ILFJHy0yzJToBN4v+nZqZTZEzKCOSn6LMoIL4ejswkoPtNXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLopj30cM2evJl31I5Bc0Ss+BRcnRjHI/uqZvT6fu1hoApMgjks
	juyjjarMkXoSiBnAUdO9HBLPKCRw5BtC3WjdRqqISK21xoEJfgqcYXDD
X-Gm-Gg: AYBFou01f6oHvp9Sub3JXmURkhtlzJolrdqBKWVKjy2SVtt8oREE2rC8XXX7n0gSCBT
	KE3mvjF9mBdWq0Rt2ICeGNVj5zftxypIaS5ZAeocvJyMybaKLGKa6mJxlVuK2m15WSozdakCvsy
	vLbgxp6F27oxwcCwCKITBvU8HgTf1lxL2oaNq0L+zolBiSGt0QNCZNxnP6sxe6KVCVlAvt+idKe
	m9iMeKHU+UxFg9M4Jffm9RLiadYDAzMbGoBNw3gUrxINvHtY/B82L1cekN1tfnYRkjaQnITOTKo
	X+ORohjSHcsXrq3eafoTfDQ+VnxZpLUCgNzKRL0fcyUUuoEEWapJBlMJ09ydZhTzRBrNk6DB9pf
	Sen59cTOYiBLyv0+5cRZk4qXMw2KlaHregTix0hStllw7YcDXccTXqxXY9LDi4tW3XnPoSmD8t0
	sKowkAXaVNqhryGnua1zZ7kcu5iqXNzXcD2e7NtfVwFLddofg1f5jBbFkXw0cqcNyLTsKeVZEql
	g3tM6PpVTdsy6ZYkTh1JPBqIqrn3lYNKiNItV0FAiWw1GMpPkAjJXDHA88iCjvqeCmv0urRySPH
	P3QZN48dCKFPZitJTkRyqBUM+ob51yMfnjLrznamxZUsDCPAq7jJneqj26sNG1nCwTeX+fn9wVq
	mI9blgYkc/T0=
X-Received: by 2002:a05:7301:2224:b0:351:735e:2ef8 with SMTP id 5a478bee46e88-3674d54de51mr4539269eec.7.1792620750150;
        Wed, 21 Oct 2026 15:12:30 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm10580815eec.3.2026.10.21.15.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:12:29 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	syzbot+8eed6f83440ecdaf4be6@syzkaller.appspotmail.com
Subject: [PATCH net] vmxnet3: stop DMA mapping the adapter structure
Date: Thu, 22 Oct 2026 03:42:12 +0530
Message-ID: <20261021221221.502428-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

vmxnet3_probe_device() maps the whole struct vmxnet3_adapter with
dma_map_single() and passes its address to the device as the "driver
data" (misc.ddPA/ddLen) in the shared area.

The adapter is the netdev private area, and alloc_netdev_mqs() allocates
it with kvzalloc(). struct vmxnet3_adapter embeds 32 tx and 32 rx queues
and is well above PAGE_SIZE, so when a high-order allocation fails the
adapter ends up in vmalloc memory. dma_map_single() then warns
("rejecting DMA map of vmalloc memory") and returns DMA_MAPPING_ERROR,
and probe fails with -EFAULT. syzbot hit this with page allocation
fault injection.

The driver data is only informational: the mapping is DMA_TO_DEVICE,
done once at probe and never synced, so the device could only ever see
a stale copy. The per-queue descriptors in this driver already report
no driver data with ddPA = ~0ULL and ddLen = 0, and other vmxnet3
drivers, such as the one in DPDK, never set misc.ddPA at all.

Drop the mapping and report no driver data in the shared area as well.
This also removes a probe failure path and the adapter_pa field.

Fixes: b0eb57cb97e7 ("VMXNET3: Add support for virtual IOMMU")
Reported-by: syzbot+8eed6f83440ecdaf4be6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8eed6f83440ecdaf4be6
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested in QEMU (q35, KVM) on net/main (abeacca61eea), with KASAN,
CONFIG_DMA_API_DEBUG and fail_page_alloc (min-order=4, as in the syzbot
reproducer):

- syzbot C reproducer: before, "rejecting DMA map of vmalloc memory"
  WARNING and probe fails with -EFAULT; after, no warning (probe then
  fails at BAR mapping, as the reproducer binds vmxnet3 to a non-vmxnet3
  device).
- QEMU's emulated vmxnet3 (-device vmxnet3): probes, link up, ping
  works, before and after.
- Same NIC unbound and rebound with order>=4 page allocations failing:
  before, the WARNING and probe fails, so the NIC is gone; after, it
  binds and ping works.

No new W=1 warnings in drivers/net/vmxnet3/. Not tested on ESXi.

 drivers/net/vmxnet3/vmxnet3_drv.c | 19 +++----------------
 drivers/net/vmxnet3/vmxnet3_int.h |  1 -
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index f8df83f9965d..3a9fb5b63e9d 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -2921,8 +2921,8 @@ vmxnet3_setup_driver_shared(struct vmxnet3_adapter *adapter)
 	devRead->misc.driverInfo.vmxnet3RevSpt = cpu_to_le32(1);
 	devRead->misc.driverInfo.uptVerSpt = cpu_to_le32(1);
 
-	devRead->misc.ddPA = cpu_to_le64(adapter->adapter_pa);
-	devRead->misc.ddLen = cpu_to_le32(sizeof(struct vmxnet3_adapter));
+	devRead->misc.ddPA = cpu_to_le64(~0ULL);
+	devRead->misc.ddLen = cpu_to_le32(0);
 
 	/* set up feature flags */
 	if (adapter->netdev->features & NETIF_F_RXCSUM)
@@ -4044,14 +4044,6 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 	}
 
 	spin_lock_init(&adapter->cmd_lock);
-	adapter->adapter_pa = dma_map_single(&adapter->pdev->dev, adapter,
-					     sizeof(struct vmxnet3_adapter),
-					     DMA_TO_DEVICE);
-	if (dma_mapping_error(&adapter->pdev->dev, adapter->adapter_pa)) {
-		dev_err(&pdev->dev, "Failed to map dma\n");
-		err = -EFAULT;
-		goto err_set_mask;
-	}
 	adapter->shared = dma_alloc_coherent(
 				&adapter->pdev->dev,
 				sizeof(struct Vmxnet3_DriverShared),
@@ -4059,7 +4051,7 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 	if (!adapter->shared) {
 		dev_err(&pdev->dev, "Failed to allocate memory\n");
 		err = -ENOMEM;
-		goto err_alloc_shared;
+		goto err_set_mask;
 	}
 
 	err = vmxnet3_alloc_pci_resources(adapter);
@@ -4312,9 +4304,6 @@ vmxnet3_probe_device(struct pci_dev *pdev,
 	dma_free_coherent(&adapter->pdev->dev,
 			  sizeof(struct Vmxnet3_DriverShared),
 			  adapter->shared, adapter->shared_pa);
-err_alloc_shared:
-	dma_unmap_single(&adapter->pdev->dev, adapter->adapter_pa,
-			 sizeof(struct vmxnet3_adapter), DMA_TO_DEVICE);
 err_set_mask:
 	free_netdev(netdev);
 	return err;
@@ -4381,8 +4370,6 @@ vmxnet3_remove_device(struct pci_dev *pdev)
 	dma_free_coherent(&adapter->pdev->dev,
 			  sizeof(struct Vmxnet3_DriverShared),
 			  adapter->shared, adapter->shared_pa);
-	dma_unmap_single(&adapter->pdev->dev, adapter->adapter_pa,
-			 sizeof(struct vmxnet3_adapter), DMA_TO_DEVICE);
 	free_netdev(netdev);
 }
 
diff --git a/drivers/net/vmxnet3/vmxnet3_int.h b/drivers/net/vmxnet3/vmxnet3_int.h
index 9f24d66dbb27..2c2a446a8e4a 100644
--- a/drivers/net/vmxnet3/vmxnet3_int.h
+++ b/drivers/net/vmxnet3/vmxnet3_int.h
@@ -438,7 +438,6 @@ struct vmxnet3_adapter {
 	struct Vmxnet3_CoalesceScheme *coal_conf;
 	bool   default_coal_mode;
 
-	dma_addr_t adapter_pa;
 	dma_addr_t pm_conf_pa;
 	dma_addr_t rss_conf_pa;
 	bool   queuesExtEnabled;

base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
-- 
2.53.0


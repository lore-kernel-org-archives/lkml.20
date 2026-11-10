Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325258;
	b=WgBwjQ0L7TxkvPokOO+F68a4O5Mv+u1XxZaicHramXuba1TvPJQD3yid7pCipk7HZ9tg
	 UhEcqJxJalivRoOWF0TM0cwsgVT2MHHWRdB+9mUJk0xsjPYV4bflH2A4NPUvjroQCvLXl
	 EgAzJBEF7IopZh+mSpD8NSWj/8kZhLGjRftYau9T8LJN+gMtVvS3WWjceGD1fab/ZOAPz
	 G3alOPNVmq4v+eWYOaJWXHE9jwRJdiMhOhugLo1zLEVGrDmUcBNd1kjR1W289YjaJrLci
	 kbIOBUoajzI3h5f1zEvWxMr/ibgV4fZ/D+/e5zfYqlyhDalaWp5xdG45RJdhh6pMstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pEh2q+SQxGTFTicWzoJ7e3G2PCnq6llm/Gr90hwdzVM=;
	b=W0cy0AkjbX9JFSakHINYKZif5dTj3XYu9x5euE+dSXpMESSYKbgI6aApPHOOYGUzQlzh
	 OtFH1OmXxxOxErK2ZI5IBz7hoTf+xyigw49CDZ8/HUBAwZYY25zz81Cc05RL4e5AR+Ilo
	 rsmHJZavazn6ipLjSbcNGT/i29uTjLyr2JO0mQFCpKuJ6Gj8fPCljGlZ23xteGJmqkIYx
	 /XcaZ1PXz9hiHVRyzez3PPUgdDh61fYrlLY6koNjf8Tm4mVydeR2s2dKjJtLeFen3DJCu
	 j9B+yGnDW/+2XkqhdF0QOmH1YsE/dKcjMmQfbsrc+LOZ8pfyqtjhFeeydXKUQKjgtbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="te2rN/EU";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5D60A2618
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C5D60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=te2rN/EU
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3acec6677so3281954c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794325257; x=1794930057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEh2q+SQxGTFTicWzoJ7e3G2PCnq6llm/Gr90hwdzVM=;
        b=te2rN/EU2GdvcDM/OlJqGNZZdgxT8FjRp7O9Y9FDlBc3zGieP19AFAFhffFfG+WQiK
         94ptcHN25f3CHEpmj+6oECHy2TsAWF09+eCVGw8KIno53XOqN5gZzJK8NebdkbAERiis
         zpo014YhQtUE/DcTL6YBjJKoxfD9bZDBhJ3LT/OpCBR8kWkGa03WO2h8tZizkTm1ExNh
         7HaSlBoCe0iA0pCUdkVKmEY7rmLXWItDAASHQad4SSyOGKbHN7Q0gyp3i93r2npjpi2y
         P1PwLhNLGa1K9cFukbX/nchwWaoytY2NcaV4XwCvDWdhk5H057O2Q7bdj4dNCJDMmg3V
         fvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325257; x=1794930057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEh2q+SQxGTFTicWzoJ7e3G2PCnq6llm/Gr90hwdzVM=;
        b=SNxtb0fqjYLRR7ByygBy1fnbwslZ5Mo4lvJFhsrz1FGGLXzG5eRj065/6q+8M/G73g
         jZzsIt80av2fA99VhBVd24pR0NBtViuNfTqkYHOY72szpF63pLh1lXpDYCswwA7hvofp
         kxBrj++4s8BwRQwHYPOhjCOq+4oPQxNRV2FyqgQhjeGIDzcT2g3QYultPuI9GONESgOB
         w8xSFaH/rFugCtcrADoGwWSAzoakEdymekvplvXPLT/po2kUjcGowOF7EnYGv7y1n8W/
         BHeRqPL6zgJaiMg0WKYZidorVuM2goNiCzVZ2b1qv8zxJ+7XDqc1HVrFZGgFf4LYVtVE
         LQ+g==
X-Forwarded-Encrypted: i=1; AL+hErG6q9ztxyKk7UsrNGNBpmwqGpnkR8jUHXj8sFEFQ7q4ulpdEoZCcSJO0xOQsckk3slaFAEVoXTd/pK3PFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hP93yB/rtXcqHN98eiDuFLgTsjtTPJL1a5DqA70218eGZZDGr
	CmR2OUp2iiBHhIPscQXWXwyI7NMOBi8yxe9T0BMYyaLvp50Vt0beSxhj
X-Gm-Gg: AYBFou2Vs2cY0zSP+GUs29NAaVyK+t7ehYw2BjanAlpKUcXXMaRH9yEki7nR1H0qpPU
	U57h+EBoY4/wQtx4wIXUkl+NfKJl62ljZ0amqOn3hSmQU0/lL9Ku6+BJMba8lxoSvHfWpi6iZBF
	5Q+s1oqLlHfXv0WZI0HcZAO9HU4LMGoZohfZ4e93o6abbnAYfTMKP1WzE7wAJBy9nPlgAgpKkQK
	cK0dyjCtZDcb8H0A/0cZXrzJL7yQhsb1QiqAe/XT0zII2xZhkMZoHNQoprS43Wo/2yCXqSLm/P2
	6GNoV84KnRCg2rAILu8IiPcbnc2nSYAy+3EovxhyEvsZxbCTMOZzTdx9WE2K9tTDtrBWZKDoYg2
	be/ICNMjfkm1wXJd5Wdp8ZY6HHax1cxyTDYtY8Yz6hUVFeTULbJ0fwWFCVUPOKy3mklaFYZ1SQm
	t07JPilpoPTQHGpscTvyMlDWZ+BZDQ4f+m98AF57KqLZLcQ+eOmwerIymJ09kApxoMTyuZvkzq2
	W6TOsM1EFns0DdO9BJUr6gOX2N0ZSoom4w+/MIcw12D3Ozo1KrhH2KTu59kOTfpteU+XE5a8vX+
	bMoMqwRuwy/5DhtNxS7+zHcbwYHSuuS28ZQEdTtjS002+CkS4sEjgPZtmjXjW4ykWCSMDUdTYov
	KwwpPO9zZljKxzSShBzoguaOU3opPmvlGd57+QE8kLJdZ8HaQ8hTUXJj3o1jEZpzVr4hy2rd/sL
	vWlovOkKvJnTwbjmiIf8MSRXrzPFnWWB3I66BYq0uBBQ==
X-Received: by 2002:a05:7023:a4c:b0:1b2:60ab:1e9a with SMTP id a92af1059eb24-1b3b605b765mr3487347c88.10.1794325257070;
        Tue, 10 Nov 2026 07:40:57 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b72ce0sm8746958c88.18.2026.11.10.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:40:56 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Ronak Doshi <ronak.doshi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	syzbot+8eed6f83440ecdaf4be6@syzkaller.appspotmail.com
Subject: [PATCH net-next v2] vmxnet3: stop DMA mapping the adapter structure
Date: Tue, 10 Nov 2026 21:10:29 +0530
Message-ID: <20261110154048.143227-1-kapoorarnav43@gmail.com>
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

The driver data is only informational. The per-queue descriptors in
this driver already report no driver data with ddPA = ~0ULL and
ddLen = 0, and other vmxnet3 drivers, such as the one in DPDK, never set
misc.ddPA at all.

Drop the mapping and report no driver data in the shared area as well.
This also removes a probe failure path and the adapter_pa field.

Reported-by: syzbot+8eed6f83440ecdaf4be6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8eed6f83440ecdaf4be6
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Changes in v2:
- Retarget to net-next and drop the Fixes tag (Jakub)
- Drop the "never synced" part of the commit message (Jakub)
- Add Simon's Reviewed-by

v1: https://lore.kernel.org/all/20261021221221.502428-1-kapoorarnav43@gmail.com/

v1 was tested in QEMU (q35, KVM) with KASAN, CONFIG_DMA_API_DEBUG and
fail_page_alloc: the syzbot reproducer no longer warns, and the emulated
vmxnet3 probes, gets link and pings, also with order>=4 allocations
failing. The code is unchanged since v1. Not tested on ESXi.

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

base-commit: 6db9448a443afde26231aaed7b112ed17b33f468
-- 
2.53.0


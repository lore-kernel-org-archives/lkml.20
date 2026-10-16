Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7D2857F0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792116042; cv=none; b=km86X0/2BEHuHOnrmnGAXWemURnLtbMxu0rH6j8NaybqEouAAOtXJKU//cZRz6aGCW9fnkytwSM/4THfRFfoPcLhyw+uH0L2kRYSvvmvOBDK1ibyiQZFnMWcxvBhDaWXiOnhYOsAuCO0xXltdSXmTXI5wSyvdlZfAcORoIWjwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792116042; c=relaxed/simple;
	bh=VulW9CILuegVmww3RssOPbu+bMH+gjnGMIzwfevS5NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLpMDHXFvW485laNpCt9Y5o8DlBF030iTlV9Nva6cnVQiv9RB+s5CxZU9cypzIPX1lKqZqDY9baWZKfvr6qbRIrMcTkpyTt8kVwQ4B4GeEGkLPEdOEHoihAUKoyHyUtcwVNJvSb9WHeUKSo9wqLsCWXx5Jik8jJgP8FCFSt68QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6VEngAW; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6VEngAW"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-917a4b69a79so69643076d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792116040; x=1792720840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLgG8C3R1LRH8a/xCn/z2rdj50h5ikXCY/F9rYop04I=;
        b=j6VEngAWcpts9VLs3Lg8fqCQtrasWKEYkznKGYbA74IU9tsz4rcfzOxS7SR7J6bBso
         ozlazMO+DAi3qeZrZQCK17c11LCRVZaMParh7TC2g7I4B0IyljlbIosi7+ClS8qIDOCy
         U9jv0O85Vstz+/Kt8p/KEHwfU87qggjguMcgdzvv6I3ORbm1xacRotp9R1YZiqfft/2o
         mENcQYWlb+5vLyNKq1batAg+OHAmuVCcZuX2060meu6FsnAoLZ8MG1cHWLq9ljlGv/le
         ikQnaXz2MgiRF/pZruLV0Bgaa7E3OCSuGpdRmusguCGLFIyaSCLiH1Nth6XcC7nZ1RJ8
         nkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792116040; x=1792720840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLgG8C3R1LRH8a/xCn/z2rdj50h5ikXCY/F9rYop04I=;
        b=NLEZAlsr1nCBnqXf8O/6NlYtZmscRR/Cv1htkiuqOXoaxsyejFFaxYS7vJhm3Onurw
         1PC3p1tBSdINiMEQQ2qj2RIQ991oMeP6OG9E6R3NqAw4O6WNqN32ci7EPkkcGiqPTfNI
         614B5N0b8kjUPN68G8KeMRu7ku5ZslrGjnKJ9P4pnREwqTr4wzDLC8JxQclJQbzyYlXM
         GOfk1i10iC8gSGYeTJHbs3cuzrqz/lwYSbYJnQnEcObrv8dPSgzx1yBG2Pu/60JYdEFA
         EIg7ES4ohvSsEqfJEEceWnQwH60rNQY0RDKqbdJNgeLGa4YgQ5RfxKAFkAy1hwHS/IaZ
         hngQ==
X-Forwarded-Encrypted: i=1; AKwUvBwawb3Xnjh+pWrARREjK4/ECh+rN4yMO1BT4VFFL6tbam9L5F2tk10R/ks1y6dVZuJ/UtWEAQeqwWuUXb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+MuOdJ3Xg2GmH1vzuE3m0BfJZrVZnplyt8fN6Pob7VPWD0MIe
	9j2zhz2rzbLb166Dl6jkAg54Xb3ng08W4qg6M+qwdTHZqAdgxPIN8Mo=
X-Gm-Gg: AYBFou2tA4zPrzkGQa3mFeI41aGwAmlrfL1EKPVqhnydnK03hfEvsn9gykOBCvVgpC/
	T74BvqfPlM476Zx/OIwE2vddk7PyV4xbGX+ENHtRJQBjZQN12+KiGNeB9i/kdAS6/i47VQr0idn
	9hYUTb7rWreSC/4k2sZlCtJS1CVt46bazWZhsp735noYG2ZiqIUBdsOHLqPlLV0youohNJ8f2hc
	PbFR7IVZ+EW23zblTxAbdG4iXjccja2Jr/jXLzGh2UcS1sBy6zV8tp2dH5dl7HFdhGe5mYUigLA
	niGzKbAHigxL4auJ48V4LC8KAEwfOCgJYjX8MDluBCk9MYLQBtie/9ouipWB1ckyftlkVoeL73T
	OOLze0HJ3jM4pmgP9CRrsvulWKA7ZLIOvUbgL+DuYZjpaCPS9YCy/dx66szn4YrYPKYCwC1u3l3
	jj0+gOOM9uLUGvkLEmZ3k2AwG8td42RpyowvBCTxGvbsw9G4kuNguBjZqPobTRLFM0jVjCT/iJ5
	xrs5lLGv56F4B0ohNj2zQ9RY4+yuH+LejlZdg6v5ADZu4Vor+/eD73TVamE92+LiJ4vtR4i+lFO
	cEWQgBTj47O4Kl84l/5UPO88yiWH
X-Received: by 2002:a05:620a:a199:20b0:93f:1e3c:4a31 with SMTP id af79cd13be357-93f1e3c4bacmr18408685a.61.1792116039610;
        Thu, 15 Oct 2026 19:00:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a185ea6sm84899885a.21.2026.10.15.19.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:00:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: hns: retire service work before releasing device resources
Date: Thu, 15 Oct 2026 22:00:35 -0400
Message-ID: <20261016020035.3621768-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove path releases ring, PHY and accelerator resources before
canceling service work, allowing use-after-free. A pending worker can
also reinitialize the device or publish linkwatch events after
unregister.

Set REMOVING, synchronize an in-flight TX timeout, then shut down the
service timer and drain work before unregister invokes ndo_stop.
Serialize reset and link-update state checks and operations with
unregister under RTNL.

Compile-tested with Clang 22.1.2 (W=1); not tested on hardware.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: b5996f11ea54 ("net: add Hisilicon Network Subsystem basic ethernet support")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/hisilicon/hns/hns_enet.c | 37 ++++++++++++++-----
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
index e905f10b894e..977f054b00c3 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
@@ -2024,21 +2024,22 @@ static void hns_nic_reset_subtask(struct hns_nic_priv *priv)
 		return;
 	clear_bit(NIC_STATE2_RESET_REQUESTED, &priv->state);
 
-	/* If we're already down, removing or resetting, just bail */
+	rtnl_lock();
+	/* Serialize the reset decision with ndo_stop and unregister. */
 	if (test_bit(NIC_STATE_DOWN, &priv->state) ||
 	    test_bit(NIC_STATE_REMOVING, &priv->state) ||
 	    test_bit(NIC_STATE_RESETTING, &priv->state))
-		return;
+		goto out;
 
 	hns_nic_dump(priv);
 	netdev_info(priv->netdev, "try to reset %s port!\n",
 		    (type == HNAE_PORT_DEBUG ? "debug" : "service"));
 
-	rtnl_lock();
 	/* put off any impending NetWatchDogTimeout */
 	netif_trans_update(priv->netdev);
 	hns_nic_net_reinit(priv->netdev);
 
+out:
 	rtnl_unlock();
 }
 
@@ -2058,7 +2059,14 @@ static void hns_nic_service_task(struct work_struct *work)
 	struct hnae_handle *h = priv->ae_handle;
 
 	hns_nic_reset_subtask(priv);
-	hns_nic_update_link_status(priv->netdev);
+
+	rtnl_lock();
+	/* Keep linkwatch events within the netdev's registered lifetime. */
+	if (!test_bit(NIC_STATE_DOWN, &priv->state) &&
+	    !test_bit(NIC_STATE_REMOVING, &priv->state))
+		hns_nic_update_link_status(priv->netdev);
+	rtnl_unlock();
+
 	h->dev->ops->update_led_status(h);
 	hns_nic_update_stats(priv->netdev);
 
@@ -2398,6 +2406,21 @@ static void hns_nic_dev_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct hns_nic_priv *priv = netdev_priv(ndev);
 
+	set_bit(NIC_STATE_REMOVING, &priv->state);
+	if (priv->notifier_block.notifier_call)
+		hnae_unregister_notifier(&priv->notifier_block);
+	priv->notifier_block.notifier_call = NULL;
+
+	/* Join a TX timeout that passed the REMOVING check before work drain. */
+	if (ndev->reg_state != NETREG_UNINITIALIZED) {
+		netif_tx_lock_bh(ndev);
+		netif_tx_unlock_bh(ndev);
+	}
+
+	/* Stop the timer and drain work before ndo_stop touches the hardware. */
+	timer_shutdown_sync(&priv->service_timer);
+	cancel_work_sync(&priv->service_task);
+
 	if (ndev->reg_state != NETREG_UNINITIALIZED)
 		unregister_netdev(ndev);
 
@@ -2411,12 +2434,6 @@ static void hns_nic_dev_remove(struct platform_device *pdev)
 	if (!IS_ERR_OR_NULL(priv->ae_handle))
 		hnae_put_handle(priv->ae_handle);
 	priv->ae_handle = NULL;
-	if (priv->notifier_block.notifier_call)
-		hnae_unregister_notifier(&priv->notifier_block);
-	priv->notifier_block.notifier_call = NULL;
-
-	set_bit(NIC_STATE_REMOVING, &priv->state);
-	(void)cancel_work_sync(&priv->service_task);
 
 	/* safe for ACPI FW */
 	of_node_put(to_of_node(priv->fwnode));

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957789;
	b=1XvFYinZ9/ABNfrUgzAxDa0+PhURpLZdj56hkOIdw9PreYUvMujKNoaquPhzlj86Mopx
	 oZp/0UaGE6e+QT04qEBvzlSmckWtRRIeHEGGBKnrWfhT+HNVwoCUEyItIWdhi4EqhoLIP
	 VinsNsVjeTsIwzXOi1CzkH6Ivz99r6kAbYqaPftNdmFlbU2TcxiwScounxyIZyz6jXKRT
	 qGJRYQBkirhQTZjp+AjF/arDfxSiOyAM0bQdEjJjgz70BaZ9OvEYe55gLyxGbqjGdk169
	 l65+bYqXMgP2bf35FVLOxR1Wj0qi2uwrO3uDt6dk2l0zewl7Gs6hcBx9xtyuzBOyEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957789;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rU1Vsjnmn6YT0GziVVTUh7MAFkuhk67Pbss/AL23Tfg=;
	b=QtFKBbbz0ZiUlCEEJZNOd1OewnpQ90m1z9MOmqWYGOq6JzrjC3Us66lldxfJDaMLn1VP
	 zCZdwjbVSO/1R/Z0LtQv458dIhvBWAjAtCY1Z4bIKNvFvVNpQqwxfHovX0jjoDUZ1j1+V
	 zZ/bGSKgz2WCCwM6Js4HwcOhBcN0f2p1WZlhboDO8G3w1IVLzVULZjSwnap6zoK6fV0QA
	 mGW7//J5ZYFmhKVakY1PxdjtqBsDcyGE637zDnpd9w2HO85WSP9VedS+5A+DrbgmKaYpZ
	 TTbYu0/nsM2fGbeL9z2FFEJyHLxE2Pd2a8q/hyehHlavWbkMhcCjocSyIO3B5ulY/IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=blT3koIx;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E33760A6F53
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E33760A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=blT3koIx
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so170410a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957789; x=1794562589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU1Vsjnmn6YT0GziVVTUh7MAFkuhk67Pbss/AL23Tfg=;
        b=EGABgZhBSRG8GkZHuckyPbX4dI+RYLvkZsn3Dtao7PCPCJX7/pa3UzRmjz3tIqzGTP
         X/zgmVqmZthGcYjRSlGw9bKvM697LFS5AHs3w7c6sykPJ5A486Qgw1e3nOHUwZFZk8tT
         KGxgptqA6R763XYaQ/ponPHfgXHHdRH6xKkY9MHEuuJwwT06T87DsZYlKrc3cf5tPfp0
         gDdep1Cb7MEiY1tsj7N/dqkb843NR0ze1QndEafXqNw476xrfcVEZWNb4K0MaQ5bajmM
         7UZF/bEeZNHr0ghVe28aTM3CzzLfanZ5sRNFpyyK3S8sA9iDNKcQmeSEa37lXaZhtlQp
         N9cQ==
X-Forwarded-Encrypted: i=1; AL+hErEVkCsCGwZ+Z7G36zkegVLbKTFmaaE5s2E64DnMrD7n4ocMPtDMXYqlX5kA9+A81OV+eeK6BoTQ07mkzl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ONI36J5VIB/i69i9crT/LaY70AdvlPz5O1v1zr/a3j1K0KGB+
	yWxUdfg/lhy797WLHl1dOG05YZXAzc7x6HHb1TNDXGA+ECc0DWCdnZOUXRHb0pxWQa+GHapyQ8t
	fv2NMFIqGV1wZbTcer7aeHBzbIVzTBv56jUo9y/kB3oUjaOQ+M6q3iSRQvL1kTcQYQSqhTFKv0h
	N3bntKl7i1puSNbVKiHiO+I4K+OA6MNwhnmneVFh1OI/WvSRDQjkBuJfGnT9QvIqz9pE4Jnv86i
	nTUiunZ9JMtMSFfBQ==
X-Gm-Gg: AYBFou27iu5GMwCpZbavsGO9e53INwSxNs7BGcqUz1XCaU5U2n+Enpd3roXxlgHOL5Y
	wyqKQY/3u/Cpune5J8SFJ3R4Za8HMu4HJxITIUznFPnapCgTVUG8bw1ufuwuqOEcWk6ps2SPTDT
	cC2ptsmgHYd5Eha93iHaNwcvYdawgL0DhFDckyjJkZFY5HRf3gvurIPK7i0WoaEMN7cRqSUny3E
	/4RhkEA6R9LZHUG+HtfMduGkO6t49wFaaT6A2OafZro+5mWAjj4ispbQPOGTprDxDWPi/1kCMTg
	JPxg86lDnD/1BUu48ihzJZDKiN1oSPPi8afvgJmhVMsoa1KmA3n039/hrhyM59ptgHC7W4n8NOz
	Uk6FnOrcbUJdV4oeLJ8rYXnUC2g74cB9aSrW0997giZvE+02unG0fyPFwwjLA1QHA7IISv/On0f
	RnL0hb8ihb6EuCm/xgRfpi4X0JkfCIznv4bA==
X-Received: by 2002:a17:90a:d88e:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3b0db5ed761mr1830616a91.8.1793957788559;
        Fri, 06 Nov 2026 01:36:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0d7c9e095sm1513304a91.2.2026.11.06.01.36.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:36:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so1350625eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793957787; x=1794562587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU1Vsjnmn6YT0GziVVTUh7MAFkuhk67Pbss/AL23Tfg=;
        b=blT3koIxVcNOvFilbK2yOFZ3AgQZq5JRfa6VStH/75wuKhASKJYxDfY6PPc4V40p88
         Bx/fg3ntR8W/fTnka3WLrx8OBa+ZBONJNC6RFG3SCF142psRp2A1CiENRFql+VSRO3Mx
         HmbCMKRBeUrVusShbFHOSGYeE8LjRY/4SIrEA=
X-Forwarded-Encrypted: i=1; AL+hErFVc67rdHRkfrRL9Ppiv0D/3r+OCA3eWtsgZy3WJ8REErq/3DcW4jO5/Iv8m9fWjuUCTQuEHEctgO+jkUw=@vger.kernel.org
X-Received: by 2002:a05:693c:40db:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36f72cc18b4mr3301507eec.2.1793957786921;
        Fri, 06 Nov 2026 01:36:26 -0800 (PST)
X-Received: by 2002:a05:693c:40db:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-36f72cc18b4mr3301472eec.2.1793957786277;
        Fri, 06 Nov 2026 01:36:26 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm6447726eec.19.2026.11.06.01.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:36:25 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v6 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Fri,  6 Nov 2026 15:05:24 +0530
Message-ID: <20261106093524.838341-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106093524.838341-1-vikas.gupta@broadcom.com>
References: <20261106093524.838341-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When CONFIG_RFS_ACCEL is enabled, allocate and populate a cpu_rmap
for the RX IRQ vectors so that the kernel's aRFS infrastructure can
correctly map flows to the RX queues serviced by the nearest CPU.

This ensures that NTUPLE rules created by the kernel steer packets
to the optimal queue based on CPU/IRQ affinity.

Also, This is the patch that turns aRFS on. Before it dev->rx_cpu_rmap
was never set, so set_rps_cpu() took its early exit and
bnge_rx_flow_steer() from the previous patch was never called.
A failed rmap allocation does not fail the open; aRFS stays off.
If adding an IRQ to the rmap fails for one ring, aRFS is turned off
for all rings, because a later ring would otherwise take the free slot
and map to the wrong RX queue.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 57 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index dcc3f85b2405..4ca9fa4231cc 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2481,10 +2482,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
 {
 	struct net_device *dev = bn->netdev;
 	struct bnge_dev *bd = bn->bd;
+	int rc;
 
 	bnge_setup_msix(bn);
 
-	return netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	rc = netif_set_real_num_queues(dev, bd->tx_nr_rings, bd->rx_nr_rings);
+	if (rc)
+		return rc;
+
+#ifdef CONFIG_RFS_ACCEL
+	if (bn->priv_flags & BNGE_NET_EN_NTUPLE) {
+		dev->rx_cpu_rmap = alloc_irq_cpu_rmap(bd->rx_nr_rings);
+		if (!dev->rx_cpu_rmap)
+			netdev_warn(dev, "Unable to allocate the CPU rmap, aRFS disabled\n");
+	}
+#endif
+
+	return rc;
 }
 
 static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
@@ -2494,12 +2508,35 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
 	bnge_hwrm_stat_ctx_free(bn);
 }
 
+#ifdef CONFIG_RFS_ACCEL
+/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the pointer and
+ * wait for readers that already loaded it before the rmap is freed.
+ */
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
+
+	if (!rmap)
+		return;
+
+	WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
+	synchronize_net();
+	free_irq_cpu_rmap(rmap);
+}
+#else
+static void bnge_free_cpu_rmap(struct bnge_net *bn)
+{
+}
+#endif
+
 static void bnge_free_irq(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_irq *irq;
 	int i;
 
+	bnge_free_cpu_rmap(bn);
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 
@@ -2519,6 +2556,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2527,10 +2565,27 @@ static int bnge_request_irq(struct bnge_net *bn)
 		netdev_err(bn->netdev, "bnge_setup_interrupts err: %d\n", rc);
 		return rc;
 	}
+
+#ifdef CONFIG_RFS_ACCEL
+	rmap = bn->netdev->rx_cpu_rmap;
+#endif
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 		struct bnge_irq *irq = &bd->irq_tbl[map_idx];
 
+		if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
+		    rmap && bn->bnapi[i]->rx_ring) {
+			rc = irq_cpu_rmap_add(rmap, irq->vector);
+			if (rc) {
+				netdev_warn(bn->netdev,
+					    "failed adding irq rmap for ring %d, disabling aRFS\n",
+					    i);
+				bnge_free_cpu_rmap(bn);
+				rmap = NULL;
+			}
+		}
+
 		rc = request_irq(irq->vector, irq->handler, 0, irq->name,
 				 bn->bnapi[i]);
 		if (rc)
-- 
2.52.0


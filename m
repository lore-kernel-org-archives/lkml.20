Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709500;
	b=gsGi9a6PNgEGgVCnQ09pMY/oRa+kj0jsye5ZwHOPFOdlrtyDS9p7epV3fAjKNCzmMXfc
	 TA86tGk5/2tCy/603r5oy+aDIeVKBEAIEIFe4yV7vmIJ7fw/HZxhjPUUSMqMAEJWFFazh
	 eBcXEd0EQb892k0l/NzlSWRSI/k9PQ46uOuhCepgu0jRVqd7WoHlv8AUNBq53ckSJIIOE
	 Z/VZV99gJyaS/dRcK1lcadOYQ3aEi7mK6FvX+jC0LbxMNgetDu7E0/j8TdPl8b5K+/BZ6
	 j5t/xgXnCjc7/6vuFFdm5pEGt/2CApUDuBvszHQoJ93vYLmizaliMZMnVlHtcCEWN7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=8IDwP9IYS4XmHypL7MGOoMhHcjv7hew6VCrCCf2b2BA=;
	b=xbRmphyuoWv67O2ZeRnUG44O7nP/xnaAlVCijDM1g/RpmuVMbElvatLMTmQgTXiRucVr
	 uudm1ommxNpJ6x4GOWwJ49TjgWZGzKqBkuCa8UQUhm+szuNs8Fk4/q1GXWQbvzR019x5c
	 /vohyTuh5n4lAwgBVcevnCAzZkmwslgagDIT+rTQRBbjU0n9o2VlAFQOG96iPjxTbrzi7
	 0quZxfTXfOjTmM98tlECHFdf9MpMOFt+mQLoqCYId6hVAwN574PwKRyPMs3G+tVg4Uq15
	 9C+t3gNfA29dkqNfeJI3R5aLol1RRAfg7eOSE3w/fYSNMy06gKHcTLOBK4JTP/GE4ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KkY9dvpP;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C1606D821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975C1606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KkY9dvpP
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd67cc518a6so2843343a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709499; x=1794314299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IDwP9IYS4XmHypL7MGOoMhHcjv7hew6VCrCCf2b2BA=;
        b=uCqBP4h7MPgwTr+6kj3PatFF1b/4GIOC9nB9yzyF+If/s7TZxlM9nf8saXEWMiJY4N
         uUXZMIWCLENGhIrlINR6HCNPjHxvaVCGGNR2MMSZdXI8TD1LVg2TUx8zBUlS6RdxkVbi
         m2pu8FFS+DAV+XTrZyeOvqVYYHdBho7Mgz3or0+xLPB3kg44RRC2u+Go89TepgMJt3S3
         tDPsrHYArMZzsaQxdYMpZBmBRT2llMsU9P5Ar7mMARZ9Gv9GU0UPFp1gFYqRjHzK5GlB
         e+5ZLAK9tX60mBWbxu3bP7kU4TYtjF2xkH8XRuF6Mo8RMA47VWTpsPafv1dIZpUn+jae
         AanQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5sIfop1/VvocZRNCBWSTTq8ZFypXpdOT00OB/f/JAKOt5fygVx8LgEJXuUqQZmelmlpGQZFoNckWSxIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yZ17MQR+Kbk8dPYAUi3bu5hq7txVukQUOCYHder1gSUScrjDz
	0I1wuOvLEZfwUS8t3lpxM2oyRgjEFTsF4A6cvCHSzA9d9Fo12FixZ4+VmGSDK4/24+hm2EnpSHB
	mZX3TL1L91sfwWt2EfKHvRitNuveAFpkMB7vwZfU1zSCiCVmH8gXuhvxetxjeOTAPfUVyF0bXo/
	cmgzX4l3uuLf8S2xWYZkNJieg9PspFUtNINn8fss+anPeupae/lw7NVKQegMIhgdSLbXsO15n0i
	sSeEKKJpGEjljhC+g==
X-Gm-Gg: AYBFou1vauNjlZ8otqDru6q42WnDrZZzMsYcZz7osuEQymyqUDoRtBlTkQgAZ2IWLpY
	KJZ8WSjA37GGx1IM4HYpLgeNAihU24FMSCBvB7PgWJEUNvgeKrrbbPTxbCOdgaqATTk5CapJNMu
	1mMkA/4ErLlUNa+Cq21cRVwe7YRCaWCDCPAlDHFHw2T5L+HIeaOVB9zYDZbIbeCIZ13Aq+bb7KD
	WQiSetRnOs705hbBScAPfZjdRPNTutLvlb2tfuDCHX0zHFx4T/KI6GLVq2Rngc3sJc9TlhUyVDH
	7g1JH+EA/mRJARzsXNsXdRFOWIO7LRphqvMYUCO5UeAr1DNfFz3Jn77Gobv12oOK1tvsRh9c/YH
	8uHQ70NJHTpR3yq0ApEDEGBbWPyHsjO9ODuWbocMg5lS4YXcXvtc4Utc/6ZwFYLgyym3oOm1gT3
	BeLw+JJ8wX/UJ7EUMyHxBYL3pdljkpdWdznw==
X-Received: by 2002:a17:90b:5868:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ae8980a25bmr11173911a91.66.1793709498982;
        Tue, 03 Nov 2026 04:38:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c4d7c5fsm1799297a91.0.2026.11.03.04.38.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:38:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso5658656a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793709497; x=1794314297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IDwP9IYS4XmHypL7MGOoMhHcjv7hew6VCrCCf2b2BA=;
        b=KkY9dvpPcK9+wgSxfYeaYFVao4E4EU+N4vmZukMJ57qbXgd3749jbW6LcHTlqoFG1r
         dAl7kYVAqLJ81IAHEN4bV4vWBbPOxgujRBgVckqI75QN0wXjQqj+M+b3Yha43PDpKS8C
         3XA5lH2hLPjjXwL4kF1YLpoG27YHgjioD72to=
X-Forwarded-Encrypted: i=1; AKwUvBwBzWIonKKFnDLuGIOh8UbzMrh+W78+96eGyzSmB1+u8QdzXc7CX8UBrFzufVZxbYgOpruCQeC8JD6WiEc=@vger.kernel.org
X-Received: by 2002:a17:90b:2d0c:b0:3a8:5cab:1009 with SMTP id 98e67ed59e1d1-3ae897ba3b2mr11093950a91.46.1793709497361;
        Tue, 03 Nov 2026 04:38:17 -0800 (PST)
X-Received: by 2002:a17:90b:2d0c:b0:3a8:5cab:1009 with SMTP id 98e67ed59e1d1-3ae897ba3b2mr11093923a91.46.1793709496882;
        Tue, 03 Nov 2026 04:38:16 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2131567a91.13.2026.11.03.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:38:16 -0800 (PST)
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
Subject: [PATCH net-next v5 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Tue,  3 Nov 2026 18:06:50 +0530
Message-ID: <20261103123651.442893-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261103123651.442893-1-vikas.gupta@broadcom.com>
References: <20261103123651.442893-1-vikas.gupta@broadcom.com>
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
index 835619604dc2..afdd00ff4944 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2460,10 +2461,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
@@ -2473,12 +2487,35 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
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
+static inline void bnge_free_cpu_rmap(struct bnge_net *bn)
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
 
@@ -2498,6 +2535,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2506,10 +2544,27 @@ static int bnge_request_irq(struct bnge_net *bn)
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


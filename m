Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307D517BD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859937; cv=none; b=qe6I5v6TwWVQd/3Iu6xYWZj1BwZ7rLt1/YpRqkRQUnZ0ASb6Wk2ZFA9kqwyxI5S7j/EAFFvuVKPWk/r0rm7iNc5ZB4wjzlDP/ky5YhjEEyJv0r8t42Ni4vqc77bQZrL9wFj+b1wBVGKqXRj7jE1m0Wnd3AioLNamYxa0UAvMwgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859937; c=relaxed/simple;
	bh=nQgDbNSdzJH22q/WdFenL2FDe0FvWhCCSlCQujJNnXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jusKcehMzIQvtpEm8H4KMoR3Y8bysSL9oeNzTn7y9JAkSaAG6BcLUDpdl+dqu9YDy0YJxcuAf0EOl/gihWYYRYr7v0F8j2rDs5nkxHbxQJRiWyCx9wUabp4dbesA/sjipfq8DDZpNeGCuOuWjtlkNvn9BXGIrk7IWs5wXveNss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EmlTXcO4; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EmlTXcO4"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-39675172593so3471954a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859934; x=1789464734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5GxQgx0x9/x4+P5Kqldr17QscDXY7tg/o4os18rkDo=;
        b=GdjAFgAbvacEZMh+DOInGH/BdkdoC3culBBgcQ3Mh+fd3xOrbQ9sn7/ld6jFz6gfcL
         qo/RPOioudGFVQQoHH36s0Qp5ikrajFyqgXlcN0j1CsMUNnxsYdozMZ6gVdLLzSP9xA/
         HwbpoQGFd96ZO6CkCHbfcwUT4gCmaGvnel5VyoFDs78lsfQPjm84x3Z7dizu2cCEMc7p
         YDXBNgG/2lbR0oroNOmMrvONKGH88VBJm3V95tnLWSYgfxOFrBRUdmWzsiuD9aDVM6cl
         rjX9/1bTH5mCYs9F/wIQa69ACjgqd7uXQHeOtCqFT/BAhWhITRt0fm+ApFez2cE2prbx
         p6BA==
X-Forwarded-Encrypted: i=1; AKwUvBxiRTxxuY01uC7cWGdEfyPxheMAIUPUNzLjKarF83H7+BE+1onaznXLR/KcEWPVVU3/zIOSW2mGPw4SKlk=@vger.kernel.org
X-Gm-Message-State: AFuF++lanurdqg5XslKOnsIA9pjuxALgZ5/Hr8N1RQiBnpferOiZDHwr
	6QdcznzJG4h1b7CWx5puTV86MWT6pPBuMl4BJg13aKoWSEstY6WSWF1dbdkHLQ/oO1QT7rDGBTg
	8ru9tJvvXsXO+Mm3K0wEezrvN/qMhf6EsPgzKoBTYFtzdBIZY7ErD/MBPAuAdjF4Hx4T1SSlDl/
	Y0Grv/Ou6ftGTCnDTNXFfK7jsVQrceyKkvi+4WAp7oYtBLp/wukB1sm3eJhOOR+VXr/rLu7p/ms
	/nuGpobGGyyTgGkfQ==
X-Gm-Gg: AYBFou0yIlYVgvpN0jnc4jSIe313QpMvL4BgoyqTbGdh7H0HT1fpkxNAFU1mOEhCg6i
	DV5GamUyx5jpd12JE0Bw8KwIt3oj4fgS5ETHcSeU4gZ7lN2BDXyC6IK/Jhm5g1R6Y6XKx4fzrKH
	gN6z9jS4r9L78w53aweoHka85RmM+FSw/p4ejooTnSwC9RTuYcNmhH+kqr5UbPRGUeAmpvO49tM
	9OMBK2Rw3Tep/E5t/i3LCxWF0yKmEPartwgex1tfCb/dP8jwryblgsPuhs4X2IXlXhQFkq5FTRC
	r3061GYms4FNsghNpoO5KN9AwS5tSEuj1hOV3UzQMTzZK4MeHzlurpD0FNFq3HmiU6vmEhz5M17
	eXKdqhoWhBLjl+UuAz2jZbdxD1BtooLTZsjBPX6TRrskFwrnXNq1OTJTpmVm9+ZbR3wN6kjE/nA
	wRf+Rp0SuhMd7q1UX+xFIykJB0fKatgUc=
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr44000164a91.20.1788859934135;
        Tue, 08 Sep 2026 02:32:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b25fadaa6sm8263389a91.1.2026.09.08.02.32.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:32:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7250669a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788859932; x=1789464732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GxQgx0x9/x4+P5Kqldr17QscDXY7tg/o4os18rkDo=;
        b=EmlTXcO4T8o7Shh0vwtSOjDVVsoQDyLcA+KrBYX0ngjqDPW0NfQyEpaMVna/Q09YDg
         VrHxMdFuUU55hLNKIrboPopzImwot3Adw3nzbx/7FBIDh7X59S5l1j+QS+nM9yeP55SS
         /8UvcIZ+MeXZsH6Od1yZcAUUK0dUjuHzcoxuU=
X-Forwarded-Encrypted: i=1; AKwUvBynUeZeSettqJIU+bo/rocM/o/P9x2cpF5NfLwCiezaCEeROexTeIdv4/dsFi4tcp8piygMYUrWN4J3R7Y=@vger.kernel.org
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr41937156a91.10.1788859932460;
        Tue, 08 Sep 2026 02:32:12 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr41937133a91.10.1788859932003;
        Tue, 08 Sep 2026 02:32:12 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm31493316a91.11.2026.09.08.02.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:32:11 -0700 (PDT)
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
Subject: [net-next, v2 11/11] bnge: add cpu_rmap support for IRQ affinity
Date: Tue,  8 Sep 2026 15:00:53 +0530
Message-ID: <20260908093053.2596020-12-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
References: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When CONFIG_RFS_ACCEL is enabled, allocate and populate a cpu_rmap
for the RX IRQ vectors so that the kernel's aRFS infrastructure can
correctly map flows to the RX queues serviced by the nearest CPU.
This ensures that NTUPLE rules created by the kernel steer packets
to the optimal queue based on CPU/IRQ affinity.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 4354fbf438f7..0753d90c0b6f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2435,10 +2436,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
+			return -ENOMEM;
+	}
+#endif
+
+	return rc;
 }
 
 static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
@@ -2454,6 +2468,11 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_irq *irq;
 	int i;
 
+#ifdef CONFIG_RFS_ACCEL
+	free_irq_cpu_rmap(bn->netdev->rx_cpu_rmap);
+	bn->netdev->rx_cpu_rmap = NULL;
+#endif
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 
@@ -2473,6 +2492,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2481,10 +2501,23 @@ static int bnge_request_irq(struct bnge_net *bn)
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
+			if (rc)
+				netdev_warn(bn->netdev,
+					    "failed adding irq rmap for ring %d\n", i);
+		}
+
 		rc = request_irq(irq->vector, irq->handler, 0, irq->name,
 				 bn->bnapi[i]);
 		if (rc)
-- 
2.47.1


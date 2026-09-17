Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0C744E05B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627629; cv=none; b=Qg4hnA9dbbw/AGeM27a6WjVhrcrDNWj0uagOz79zPs4rOkheRJjK1WwfZaI/kvtZ1Vgx9y2EeEMxLla4PI8bEcxt8a0/CIjZzw5DRCv6fA6blyIGBDLDskdJqBKjWkOVxhk4z4Gb+Th9GqgEAhKh8M5m+4lGCh3gzy5OXo+TMT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627629; c=relaxed/simple;
	bh=6s8I+G2QOuBgIACke0ae7iObsMaEdu7VrkAqPRa3J4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wx4o3p8kvBAT4RrjHh9jpwpLvwKaS/q3Kthu2QLrBRbkfvZqN96yE2BFtIwGDvLGaxnMm1Q3NM6w0TFGJfgiS+ouiUnboCqJHkcUjMqpgiTRkF8Y8Rik0UnnhupTHiUEfV+wBc5FRfbhR0CkVotGxJ/mGABI+Q47KtSPep5GTmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fpFi9SrD; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fpFi9SrD"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38759bcd877so177523a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627626; x=1790232426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dl0Y03iDyMlH0hydD0ToKowhkdZ6P1fZNzzLnbF2C34=;
        b=au6VEgGW6TMT5jzR2yRmOjY6w8eOiaPxrEbrXsn0+hvVStlOk8KjyFFGWXs+Vy0vQ1
         bsBM21qR8T41dyghcolGjpTtwYhkY9vW6X/mYqwNUyXr2qfoSHzOiV6VPDgfBXjuqAFb
         hl0dmV6UDgX/ExMd1QdrClIJzgVlmMN5JrcjmUaoHRddK2dWIoSMfm+O70IeIxQ5oRGD
         BE9VQzbbj45KOJp7HGcko/PkXVuz81H+NRF7Wyc9JCkGpZoFejExMnsP3zCykKbDB6v6
         GPhJztCKXzjXZRzMBDtiywzFKCjJdjuCxw9c7AYP/DxnYcVFz8/YbEDBXwUu6i4eNuCj
         H3pA==
X-Forwarded-Encrypted: i=1; AKwUvBz2haIPZkS/tyVNTpYOHSCeDvdqCPzcK73lwzUEZxeYYkoWvrMg58OhpvLQWR+Ci4mACERiVE9VHsxsFI0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldRmIYIJDOZHhTJ/vvOt3pjU/h8OxAJf6zRC6w5zv5xOHCQuB7
	/exvu2rMOlUszOizDQm8XilTQAGwQTixvEuI7415s4+5H/BDCTh/amqHtsxyjCeeQ/qIzpjtLJL
	GDIDZweka3fuskET3+8FdoVagMY0Ie6hOlVyiKuwNfDG8nKsr6uvbjw28aonvy8GGG9lFBlQiJ6
	kmoVCq3PSJfMHWtFkILRqEKTJCpFjpaEfJLNoHEEDMuMBzU+KCTWllRW47i9tcerXnXF9GeC+9U
	18IQffmhR4UrrwOVg==
X-Gm-Gg: AYBFou2CioFQWAPGEt4fugVlptsGSGWuDdklitqWnZ804CfoYe36/GIDf6UHH1cd18E
	ysPlBXVuyxpTBpthl7OWNuMC49beJSPJh6/yZFxfbHFDkOOWOsR8+lM8gl8b+cqM71DPKrCina9
	FEHITH5pNnBA1B3/PiOB90AJ/0x58jhvQqcsC54PNFkmJMPhw79wXsdq623uSyy4pIfJWHUEq+9
	uqa+yBcyXdclRFffY5TJsI7dIICqyJMTZzBFywzxpT2prH7KamS7F3PfnhEoHLkemQj70cAEWJz
	soRVA5dtqvaGQl3OnflRs3V4E8BRO2JyLPBmep0YE5mxeS12QcCkTyimuL4vTbXJfJclCwcXpLr
	aKdtwSPbYhHofDtEx6LihaC0o+ihsH/DisGIzjDQioO52fCm1TrEFTmlt7SRYFw7YCVvsL3yhyj
	9SQH6ugeSbfZytamYsIas4wuvBsSjq+BJD1Q==
X-Received: by 2002:a17:90b:2f06:b0:39e:252:ae4d with SMTP id 98e67ed59e1d1-39e1e4d3fe8mr12734784a91.17.1789627626235;
        Wed, 16 Sep 2026 23:47:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e3716843csm966329a91.5.2026.09.16.23.47.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:47:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-870ec29b035so341602b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627624; x=1790232424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dl0Y03iDyMlH0hydD0ToKowhkdZ6P1fZNzzLnbF2C34=;
        b=fpFi9SrD9v2U5Y9Ys60MRnUp24XGij9P85IwpwXXOe3zW0WaQYb8IQkWTAcLl1fWnE
         Pn6K7pc+04eR+a5MuUPdHrlOVEhsuOFYjZV6vMj+f9aMjzfxkS7Ty58slhzfFC4ZPpXu
         RKd5KDJjsjCTBHHOX+dd5Yk+fs0r/qO2xfD5o=
X-Forwarded-Encrypted: i=1; AKwUvBwbjFRymNPoi8X1uEF6Mxa51f34uEuxyaprQryvq1bfVPSgFgIVuQBG/CZaIdVyhttOnyJUh7dZCRCzSSI=@vger.kernel.org
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr14104562637.28.1789627624186;
        Wed, 16 Sep 2026 23:47:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr14104523637.28.1789627623735;
        Wed, 16 Sep 2026 23:47:03 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:47:03 -0700 (PDT)
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
Subject: [net-next, v3 11/11] bnge: add cpu_rmap support for IRQ affinity
Date: Thu, 17 Sep 2026 12:15:48 +0530
Message-ID: <20260917064548.773334-12-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260917064548.773334-1-vikas.gupta@broadcom.com>
References: <20260917064548.773334-1-vikas.gupta@broadcom.com>
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
index 9021a73ae613..cc7c854864e2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2441,10 +2442,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
@@ -2460,6 +2474,11 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_irq *irq;
 	int i;
 
+#ifdef CONFIG_RFS_ACCEL
+	free_irq_cpu_rmap(bn->netdev->rx_cpu_rmap);
+	bn->netdev->rx_cpu_rmap = NULL;
+#endif
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 
@@ -2479,6 +2498,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2487,10 +2507,23 @@ static int bnge_request_irq(struct bnge_net *bn)
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
2.52.0


Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8E44C51D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576071; cv=none; b=RgIwHvOs68rt0DYeTCXUNeGyqcCb2B3aZfwekAGuqKL+UctREU2tqspqldwmHG62HNIROEZnNcxWPTFY06D4AD3bKgwO0PWPoWRa8/sxnCCg6lrOeQ7xM5HQSbADJ9+SS9/zOEemPjpAuzpNzPEs9QQy1g0I58PGJyWBThPdleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576071; c=relaxed/simple;
	bh=AfKbEq4vpCeOBJVQFeSu9eRnmEwoRe/jktzsvMFglZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWa+99SHk/xf3Tasf4dFOfrX+i9EJKIXa9pKfkdbsfdzCJB6/+u972K/RVNksFCB72TlZqX4rYwfKsVIBpnPmuAVEUOu/Jr/9TrgMsJd1lUl08eW6MINi2HciDBDWbkPzCH4eG64+fPBpGWAzcODN3+TbMjnzQOwVIqnSaUfSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fBvoklcS; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fBvoklcS"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1236906e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576053; x=1791180853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRLChZZmnfzku4p+thWspm6MZWbJ15XjLV3VTmK3xhw=;
        b=HXcGdmN+FN9aprcSEdby7ml8jjP/DRxpI4+1GOueYesKRaEKXgpz4gcxhXeIaqkG8z
         n882WT1OWClZdqNB45z7TK8YnjGBSdsrBE0k0c2lwzQj/8+psjnxUJeTOcPowdCM4194
         C5KGzXsFL/eWN7TtHFKQUlRTI12nqoKQzqp0HTdWmH0S8fKlL1CDGTxrZhrlk9HzyDug
         Bbp5HolPmocVmwUqTWcaBJthmM3SZx+BEZRxWcHMm61t0k0h0ZKm8NNF6GtMqc1aXkXp
         wA+7YRArDenJHlk7sfkYXG4n27pPN3/7BUYh+3r7wmbwzXKHIJZ0c1VGVYryvCIWrXr5
         SJlw==
X-Forwarded-Encrypted: i=1; AKwUvBxnUno3WwcCEOaRtmgIr0PsSkWVFMDXgtQT4UFv0pAOSSLMZ6PMMhG1+V1OETCDDzorWj8OMo7ddUbDtnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhp2OwY34+FqkrDnXZ+7EigBZeiUKQTxXlOCR6fRMVWOlQ4IWy
	WueM1SFqCusjh0Ss0tAD38IaCGSMcY53ssyY/a3oxDJZOaqGhEAsD+e1Jtab1kh0KnCjGPfxCCw
	Meq//Tta0YxKvLHIFOefwDzK+EiXkbR5CXv6TZegEqHZVmzSXoQ0nq63NQ+vffWYwljPQJcS9WD
	NMHFynqbcdxjaJuPsn8HZgBnFyOg/tNS4zW1y9+Etzir3UEX1tui9PRa/N7351ia/7AnpV9m27Y
	Mw2J/kjwdhCKowR2w==
X-Gm-Gg: AYBFou2HR06WKsUMd1wBKDZ+Qi5UHGaofqQdI8SJO3/mWTUoSJ81meCbrrdhpCzhUtc
	GdZBgmRg9xnJdo8x+MyZLkC4EKV6wc/5teYhYT/v7xcz7KRqN4jkgaaQvS0gpLmt0zUQDdouDPn
	i/C0mIfmhTXE53rPNFpexMuk1390QkaxnDK+SxoSkGEEV3J1a5bCJzgdLyWjCnG2VnU12KQsC7q
	1S7k3YwSV7NmkhOVp6+MXY1ld403JYkYFir/jfbpah8sjwYO/Rt0uQJeafwlHUazq85hRl2IyIT
	cGBSzTeZOXOmVzKQsjSyZPe6FfLZC85V+0/flf0DXLMVjpCtxuD5bSuHLZY4/3+7BoDZvx6s9Zr
	6y4ycWwtcVs9378e6JrgX7FPBBnDN32qNAYXdexvycKqHKy1fuNb+z2BeqEqYNAEGxNzsbSEGYj
	aFMRuaccmlmBZVQYg9OvVPjNwVSOhsJWB3U9sE
X-Received: by 2002:a05:6122:1d41:b0:5c9:c60e:3a3c with SMTP id 71dfb90a1353d-5cb0bd5fa20mr5720007e0c.20.1790576053129;
        Sun, 27 Sep 2026 23:14:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5cde2c05cd4sm1448299e0c.2.2026.09.27.23.14.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:14:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso2985601c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790576052; x=1791180852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRLChZZmnfzku4p+thWspm6MZWbJ15XjLV3VTmK3xhw=;
        b=fBvoklcSF5gxN3tlxqG1fvW6Rmi6N5mV0x4TA+Zk4noCqIako9aJsL/tM4hahVDcHa
         LuHpE0Y4Is2OThag3DPFGJ2ZoMGmD3jZydErEKbx+DNGpcZ63Shi1j2IQRY0KFl0VBHJ
         In6ueoh3WWaFqjZghU1ZhUeyvY4FqSBiWbbBk=
X-Forwarded-Encrypted: i=1; AKwUvBxGE6J4bENWPlBXMMSOrcox3eDeo/SzFzBlkLi8GDkYIkqjyTHX4cFwkL5VA7kErvqwhCN8eRqeqe0EMWI=@vger.kernel.org
X-Received: by 2002:a05:7022:5f1c:b0:149:7f69:a3ad with SMTP id a92af1059eb24-1497f78ea23mr2517360c88.13.1790576051893;
        Sun, 27 Sep 2026 23:14:11 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:149:7f69:a3ad with SMTP id a92af1059eb24-1497f78ea23mr2517330c88.13.1790576051189;
        Sun, 27 Sep 2026 23:14:11 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm17355561c88.17.2026.09.27.23.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:14:10 -0700 (PDT)
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
Subject: [net-next, v4 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Mon, 28 Sep 2026 11:43:07 +0530
Message-ID: <20260928061307.1172344-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260928061307.1172344-1-vikas.gupta@broadcom.com>
References: <20260928061307.1172344-1-vikas.gupta@broadcom.com>
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
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index de7818d2c2af..a4156a12c871 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2437,10 +2438,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
@@ -2456,6 +2470,11 @@ static void bnge_free_irq(struct bnge_net *bn)
 	struct bnge_irq *irq;
 	int i;
 
+#ifdef CONFIG_RFS_ACCEL
+	free_irq_cpu_rmap(bn->netdev->rx_cpu_rmap);
+	bn->netdev->rx_cpu_rmap = NULL;
+#endif
+
 	for (i = 0; i < bd->nq_nr_rings; i++) {
 		int map_idx = bnge_cp_num_to_irq_num(bn, i);
 
@@ -2475,6 +2494,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2483,10 +2503,30 @@ static int bnge_request_irq(struct bnge_net *bn)
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
+#ifdef CONFIG_RFS_ACCEL
+				free_irq_cpu_rmap(bn->netdev->rx_cpu_rmap);
+				bn->netdev->rx_cpu_rmap = NULL;
+#endif
+				rmap = NULL;
+			}
+		}
+
 		rc = request_irq(irq->vector, irq->handler, 0, irq->name,
 				 bn->bnapi[i]);
 		if (rc)
-- 
2.52.0


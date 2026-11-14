Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642525;
	b=n5X+CclwS8BMWexp3g1qABoAk2ASk9ME3v02VvmNp5ephn7Dbq8tOCcj+0dqe6juNF21
	 cWC9QRqcEjzklfloSCBdnAyo+SIPQPytNcRllZHiYG9zlZpR9RUPrnOGkipG5M5KlbJF3
	 wRFGanuuSueOri3cyh+GsYm5kUQsxTv5Is4OkOnKunvsZsyhLsp9HoGJe5rF4EyKkB/Lq
	 Y7RFLYmxo44hBbBzkm9omxBh8BSvlx9uo5ESZvWXAS97qMrgbhoaq20pzvgg/Ao2NfCUq
	 ZATRi2A42ujD8mFWF0Kgg/znfBFAOCSurBct1dZYwaJEYsuSBwYE479i2QDU9D+yFyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642525;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
	b=M4X+HQ507wnsNPDV2dkRWjltwAN3O/TPoHzSK4aage4MzBY7kaGexBkEiSg12IL5pWVP
	 jU8DmuaXdWW5Rew0jW1gqSrafgWIUjnovpjvS6OEcZHtCQ85uxLKWbPd5aiga3as1sDel
	 2HBVoZphL4FzgTxhR9mjFtATJfr5B0yUkIo6FfVtX+RDmfNAROuj4c9xh2TnRnTgI+S/l
	 JPbCPBLj/p9zrKVlQTxGsUr7qZelPbdeAV11LpsInn9+/2fTMNMuZSos8qkOmSdmoX1N9
	 MwOvbhxTwgeR/GaTjKq5OCOaq8oNSUbIkfnqPRANnQBgE9eBTsodvzV0Qv2aR7tTM0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UTvbitmP;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D405D606A8B0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D405D606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UTvbitmP
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cd69954c755so1899893a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642524; x=1795247324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
        b=vavrD8NcSOGGc5jplQD90ck0qhWs8/Fxvr0XzFU/p/HZvrcYP+eplQuoT/E5HLL3xU
         O1HuiFxxr4lQZ8RYx2wHTqKQA/dkl3Kuia527VnwztWuCmZJNuHj1vaQAwIjS7XXZSbo
         w4C18O/XLgqS91XhTtej6FAqm/2/basNAP1S8OHB/bbg7ZTqBxEqHMnuPWPpezehkg7Q
         mQ79K7JIUPui5rQR9t7FPOOzGuE/0afc/d0U6qpgww4XWRdIxQdOWuafzbnZpKMIiIbl
         O5YzXp94PS+LbmLsRtgQiqoPB+sPfMxvojE+PqhBGFdpiRmSpngHzZnzx26EeirxtJw2
         k6NQ==
X-Forwarded-Encrypted: i=1; AL+hErFk4Gm/DvxxNzoccEo61+XuC5MtgAj3WOQoSoGEwK0X2jxr7ExCEEA1CusQZFaBttXo/L8CCOxqiflwCEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wI2Zs/lec9t6e6QOHeFK6ojZ+oFPh7Nzw8gfK+e4G7U8NkyZm
	DZYUVH9NKDQvUmvkIy+PFiypEFDn1XWMl8P2Puenm/W32Ir3du9g0+vw9oNWTUxZQEKqgjrshTQ
	j9beMGQ+dYGI+3loSLhQvhmYAwW9Dq9nRkeTxbII1OSYuUonlGO0Cz3Wx3pUFoFZLB5WxscZwXt
	hnvX8RZFVf97cc9/H5Vf6/b4p9B5YnvdstwRwebzZdWcNfZaJKoK+hJUPn2NoMzvA+yZQhAN8+a
	KxSM6tn/uhzjS+wtA==
X-Gm-Gg: AYBFou0mdSZbAO4VwTh++GIIodFOovRZ2dqIzG3T7CR73UohpBMcpm2EA9XkAA2ub8e
	UjJkZWgkJ8FFNn4s3c2WxDUMmNdKISRFhAXhRAZmURoxgnaIeWJbRn5oU60BKRxTpN0SUuWIMj/
	7YotZhhggaVINAvnTKtf05LW7AxHLtsMenpyus0/nTdSnzrDDK9XeMYwcwu/xReDQI+K8W9VOVg
	YVN+Sx1iq7plRJxKc3MPm2BYO+y7LuH/hDzDX9lBDOOPVa8hgDMMaP1v+thLRz7uSZ0gDJNX8aC
	gx9wQlDjhpJzbmR+aODTk9qwmhqgwxZy85bchFp/UWlLJUSgyIXTGrjpgvxLutRDyTIMz75Y1hf
	A7sBI7o0p6RweouAGf5ND/ZbFPoqSLykDBh/5xKeQ3JkEZsXTC70UQOIYD42Hw5cdHN7El3+BBC
	O/Dj93OjQTTI2lidIXjrObwoQPUPOSrRIkGQ==
X-Received: by 2002:a17:90b:53d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b1b0a10840mr5087197a91.35.1794642524152;
        Fri, 13 Nov 2026 23:48:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae9bbffcsm6821762a91.8.2026.11.13.23.48.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2666936eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642522; x=1795247322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFLD8qeOfF4/XZhDAXnxGtQHll5PoYM/2uBoFdcbwtg=;
        b=UTvbitmPWMp+HKq3rbKQP0XIUJTlrRFYebofIJCgEmgljKAkk4KuJhyTmpRVDf49Fb
         jc2pwXOEQ+LaRRyCr8Pf4oCgYYu5AWaPRYqQXto96/9mvIqWE2ialoWiORONU5zVqtHx
         ai/s3yfq5YfHwBEd9kiIfOS65GVuVQxsPvYdk=
X-Forwarded-Encrypted: i=1; AL+hErE7hNZMMU0qPuSR5MixHUgpIu0Kh4S6ovWLehhQk6PdAzYZT9jyJyg13PSEjh6FKCjJMkYr6pT/Z5P7tCQ=@vger.kernel.org
X-Received: by 2002:a05:7300:d115:b0:36f:29bf:4326 with SMTP id 5a478bee46e88-37960384a9amr4085881eec.0.1794642521754;
        Fri, 13 Nov 2026 23:48:41 -0800 (PST)
X-Received: by 2002:a05:7300:d115:b0:36f:29bf:4326 with SMTP id 5a478bee46e88-37960384a9amr4085844eec.0.1794642521030;
        Fri, 13 Nov 2026 23:48:41 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:40 -0800 (PST)
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
Subject: [PATCH net-next v7 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Sat, 14 Nov 2026 13:17:42 +0530
Message-ID: <20261114074742.1484603-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
References: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
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
index 4a6df8cd9067..f55a2f18cbb7 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -18,6 +18,7 @@
 #include <net/ip.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
+#include <linux/cpu_rmap.h>
 
 #include "bnge.h"
 #include "bnge_hwrm.h"
@@ -2483,10 +2484,23 @@ static int bnge_setup_interrupts(struct bnge_net *bn)
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
@@ -2496,12 +2510,35 @@ static void bnge_hwrm_resource_free(struct bnge_net *bn, bool close_path)
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
 
@@ -2521,6 +2558,7 @@ static void bnge_free_irq(struct bnge_net *bn)
 
 static int bnge_request_irq(struct bnge_net *bn)
 {
+	struct cpu_rmap *rmap = NULL;
 	struct bnge_dev *bd = bn->bd;
 	int i, rc;
 
@@ -2529,10 +2567,27 @@ static int bnge_request_irq(struct bnge_net *bn)
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


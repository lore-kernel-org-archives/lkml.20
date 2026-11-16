Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838130;
	b=WL8bqFFD1CBpIx54k8My+De4Gap38yryh2yKCVsyFzM/iBgp4dBg+dUl0vuIx24FMNRN
	 LRIBGP9x2Qzzw511arkPdd6dS7tqs6JQmb0r/qIsY1SuJCGxCouZblYyCUVopXd4vF7/0
	 gczrDQ5qgdry/2pk8NDMCBqNgcC32yh2T7ClemhkPYJbLZEJsb1w3jCxO5VV2sn0id5y4
	 tPgQzeG86ymVExhOBRSxJfwb1+QbkYwVU07zRaShEZVRKyp9dhE09n/79Bx7wwpgIqCQR
	 J/THemD93Bq3i5teX6uS+sgr1nlQWSI9VjfWK7abcQC5jZ+XllxT/fqlFj3hEZw1jxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838130;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=IBvofe4gZazrFcgEOxLB6Zwja0qMQ7bpaIF+aewBTY0=;
	b=QP+5QVknwnAWY+qTMtyu+F29E0X9fnsKCBjD0EQCl15t/WRv1BoChiJ/bkqRTEZ8PGhW
	 J2J+icMo5ojcW+kqkZWWaDQ8ieuMbVQJ6WoVCu1OFtHu2qKoMcqn7XC9DlmIn9JcFPpMy
	 Hr8yWN13B+MlTmNhol3sfYtfrsPPOQQg5qxQ7D0pPmFEa6QKD2wXSrBbdHIuVPslaQyUF
	 yKmqGZzJpY7YRqb0FWTMJG8N0WRT9xGh94B2Vb1dhB8iCg2q9THEjUv+vKyyqRYsJ/eny
	 Un9kmYwoIc7rcBsnZuoF3MDOuFTs9DRavRnpqKgVp9e5KjcO5iKoy0vJEJOkcQ8eQ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OvqdaZz+;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42593606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42593606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OvqdaZz+
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-930c0f9c1b1so432480185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838129; x=1795442929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBvofe4gZazrFcgEOxLB6Zwja0qMQ7bpaIF+aewBTY0=;
        b=DRD/3unGpYvNjix7MPFhOFqT5+S/lF7KFf7JigGffGFA4jqNzcdhiTvs7dr58Xz+J0
         JVQR9EdjXDbdi6bKwJzNcZMlhXpD88Z/KBUsSdDHiC9TLEeZab1HlLLwjk0r50Gox0n8
         9CcCRRA/g3+uyofFFYjhFfcoTWt9FdUB7J1RBZTTsNyRp5DGrvhGwZGoJlhzBSflXkHp
         rMrihRrYKlheNfomyuRCzwAgwt6x2nUV78YpZA9dKx7ktA5EMC5yoFCXVlqlxZWp/Sys
         aPoYvc4wc8FUNG10pVC7RSqERKX6IdF8qpVg0g5rrFs0AaTeQooJe3B1W2hBTZ/RkWJf
         ntLA==
X-Forwarded-Encrypted: i=1; AL+hErFdDPxc78m2ORczYkBmkIoxBU2ENrb/8ws3aDYTvdON7JnGmUScsy3ZXdHDFKDJ+zP7tTK6D1w+Be6cQ/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SEMdtb/ao+c2I3RjDyWo53kM1WHDeKBD0o0oCDXRLmaE/D5vz
	Cqn3as48yMTUfb/gBJYnOWvH19afrLUJRLJiuaXe3W6GQRSB/bXDu9/Q/0D//uOzAYIauXDcMjl
	Bb+CYF2qzJvtRuODfhrImzD+ZgciFuNXuMg5nFNkzx+L40WpVHm+pvksvDs9TaqVAyvStchedMU
	YxOOKwfU9WBOYBs+gLdIoFm120D+C38bCy/NekNSDMEuZjUx6vlFKo5POqPA8iZ7qv59QZdcktP
	SLoOktbXTFLlwh5Aw==
X-Gm-Gg: AYBFou15GaX+nWO75gq38DuzrGI4Xf7l0QVSxYe7WeXUDnvlZ+dGJR5AtExP18ynLm2
	mkKvF2aKMLQnL1zT0QSp/Sm7njuxq71+800CcBpGrr9UNqP6BQziJAUS1QMhvzXT8NsXjuQcH2n
	L+7kbemxXO4ki2w9JGlyGZH+Vq9uHXQ7ytpPk386NMX2Oy0PpEhlSpTv6bgbeDijeOMiOFRLv6O
	tIuQm6UImOdmIJsF8hOX3MtCvZ0qblsE9Qgw/K+d0fiIBn46HHppiQZGSn//o8cy+THw55G9KqX
	UaweGalA78YF7Q5aJp1izv3Pb1a6h2cZnIEUe8nLBgIBQ1jQFmcMHK0dC6j4oDyUPSaUk8Lmxdi
	iG1AcwQLSaOsAEYBCM5N4Nx7oF0o775o8pT7gBzVJYSwt3ZT/Gjjp+fC3zwbpaIQZVFJivz7vkU
	rqm+MLIcwTMAWqQIEgg6c81CtBbfrlPxxxvECm
X-Received: by 2002:a05:620a:2b4a:b0:93f:633b:ee1f with SMTP id af79cd13be357-9494bb84783mr1781836285a.28.1794838129102;
        Mon, 16 Nov 2026 06:08:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94974a7ba4esm23759685a.18.2026.11.16.06.08.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so4789371c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838127; x=1795442927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBvofe4gZazrFcgEOxLB6Zwja0qMQ7bpaIF+aewBTY0=;
        b=OvqdaZz+BHNWLfsJmnKUSsnXihWBnT2OlrcCFx/nF4WFsGxCo09w+9cj1poZ1FHGfd
         vwzN8xa2HXHpFe5kDkmLixl/kzWWD11f+rJaGA0i8Kwek2cjvJR9HLzWpoKwFK3EToKh
         2L5dOMzk4VvxoiNp7rnPXuVyfueCrnb2ttSEU=
X-Forwarded-Encrypted: i=1; AL+hErF0MVwEkP/5cj3TAfDlynKvbiZz1N5FtBGPiNDD+aU6v7MbLr7vpUBn1Fg57jRyQ5aZ3uMpeXOhA8MUQVk=@vger.kernel.org
X-Received: by 2002:a05:701b:4512:20b0:1b4:fecf:4ec5 with SMTP id a92af1059eb24-1b5031737a5mr10336661c88.18.1794838126240;
        Mon, 16 Nov 2026 06:08:46 -0800 (PST)
X-Received: by 2002:a05:701b:4512:20b0:1b4:fecf:4ec5 with SMTP id a92af1059eb24-1b5031737a5mr10336624c88.18.1794838125495;
        Mon, 16 Nov 2026 06:08:45 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:44 -0800 (PST)
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
Subject: [PATCH net-next v8 10/10] bnge: add cpu_rmap support for IRQ affinity
Date: Mon, 16 Nov 2026 19:36:53 +0530
Message-ID: <20261116140653.1685797-11-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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
index 0e7c506af402..507f920ea1d3 100644
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863487;
	b=3RE4BQT2FgvOuEJaLyAjBd0qLCBSuNnBxOBJfG/TRRKHTEtXyp0TCkRTVy8mOtMIzZSc
	 7EmUkcoTzB5l3YiG/jy8kKiuZ9mFF4DrW0lXD3umcMcWERqb0T0GMlbMo327lhQZS5gcK
	 Uz71NepJynDidZm93UC574Bbjk8cz8JNB1ykBJaY22r+fgJYq3ZjT2QXmKWZ8RJGv+SnD
	 mrouQlKIi2M32aH7wIkLczfmTQ7DAPSAG+2b+hd+N/Call+aswMzmFF57fVz/aiJPTiO9
	 CKC0gQOu0S/YB+SLXzPjxfC78BO9L3EfMMFMZWYCSOODb9aYyf7BFOPsFht6OkaBaUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=pVuVpG+Dl4kPpF8HQks+Vos7yIOnx50giRWdIX9ZbbE=;
	b=1osRxs+q5cRxJh8vCWJLw9GXRoW5SPptipJEcvrvxXOcKGiMf4thQYXS7pmJTMWy3tOz
	 llZg26G1HmGU8APX1nxuBVC8dlS5fgXWJo7O7QC73xlKTYnKmPvdtHuUPLfZ0tyaTFGKi
	 H2esx0EF2Ae6FG4W3VddB3Xo4AYJFFzBQ0RDdcM9OFbKj4Q4A33C5Vru0b6rC58zMN1o7
	 IidmiGRuJsadMTqKQ4dNfADAEfSqcunAQuiT4Xe0rNPMXVJce7OfnjjcoDSdZ7xi5V+eE
	 nvlNDg1Jgi0NLrmKy882gwGLeUMH71gNvAhV0AUkXsX89FqDtjmMjpmEnNw5MMVNu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T818YoBN;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB4606A8B2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CB4606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T818YoBN
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c58f18765so3125445d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863486; x=1795468286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVuVpG+Dl4kPpF8HQks+Vos7yIOnx50giRWdIX9ZbbE=;
        b=T818YoBNCrwtB+nH6ej4pBEO2lQg1kmpSMjmw1a0W3fYTjTmkfvs3tM9+l2v4YmZbz
         lZx+bh1L0A7wLsotYS+76sk5K3bHt5gL4cz3dobuoLGHUrjU/hsWuq2tB7GiMHClbGcl
         sy8SG8owZtVPFBltC2ajubISJyfeNrYKeC+Cr1hImCwhlDlD7+pOLGuOrCgjahVpxvef
         e1BvgkU81CCDbji5CmyifiDPuyOKZ3KqrBT4OINn57eTjKth8I2+Fyol1jY/IMoiPVma
         hJP26ECQ9z0S+EJLy87c6ksRZNmNbZF8pWyyJ8A2erQGrQsWzEysTQhFFDEvTHNp0P4R
         vpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863486; x=1795468286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVuVpG+Dl4kPpF8HQks+Vos7yIOnx50giRWdIX9ZbbE=;
        b=qLaYU1N19++VYapZ77ZskkrMMZplKA6hxTNjH58ksoiGce8myGXYf2QXONL3wEKKov
         zq9V1TFI+e2nPWS2JPtxEVvxVuVUEyF8ZDKGVsJtN6kUvbAj4E1ZCRriSRxW8zBrbSL+
         UINyLzbtgGhUkkey/Mfwk4PUmvnWmvgLymH24FZJphqPcTS5r2NSrjkNFmiBfAXjMXLd
         nB0ELaeTtGNjqfCb6smTC5IxZh1wCfIRxb2K2DRZ3iK0m8BZjUrwE24F12/Rv1PX15ai
         bF7wRPemaqhwrOt4czky/cYIRqFmim0PNuLaZpd9MxgIkjo1eDZRKZn2SdZzi4AK3ftm
         KcVw==
X-Gm-Message-State: APuU4Z9r+nkN8gTk50S7eI1ZzUfPw98uLFt7nNEIpgzoW+gY3EyMKAio
	+/yXDsFSABy8/21stX9ln7dBWe30MTjtjVP6Tv7SDxj27k6OOqL/C6fl
X-Gm-Gg: AZFdTZeezFnUyKlxGRRBRk+83rLaeD9r62/Se5qmt3vivcbt7INfPBJGCa+qsFaRWpY
	PgLx+dbmSKz1NG4fg/DYgGu38Bmu9o8i+ez7OWqlFxZvSycSKjo9pvXEjpuIbmPXNI56GJk3q6x
	o6Fh2RNjIxD6ilrgyMexDGKg1pcuIfycHfCf25CfPlWEIlpK0NghlJ0w7GviRsigMd18WhD7iq6
	kAJMwq16NgQPCg8BQ6tCDHJ4TWCwrgAYEXrnKmt0d3p+XR5qGIv7EmxmOez8yx/70oTguFHXNcz
	bbrrDipPV6l8IkdnFOqE9DmQHVZ8n00x8Vc3ZZwO+V3BYdNrqpVmZj9tiMu3DmQgwHDuqO/Ltu1
	8JTqlJ+H6jeuRYIX0dCSbE3OvkylswilBM1ioBP4SUiilOGBqZXwOkA6AdgnI/hEx8WroStzYNb
	yoNe7WjxfiBoF+vxah3LUX7eHEJmZrSVFKUhSNgEL8bDHXu+1eCswxNZ12NpQ9MEpIdCGsxLD8M
	dtHHlYs0GukFvCH3oQF08Q1cI+flQF8SciVJe8ZsVvlsIeDXOin5iHyZKYpZ+gROCvKhEIxax4Y
	zEQyD4ULceTWwy7ckWEZ9qO1pQuCkb1Q+QbC5lEsiaQRaEwr
X-Received: by 2002:a05:690e:1c0a:b0:67d:b299:df4c with SMTP id 956f58d0204a3-67db299ee86mr2458263d50.79.1794863485777;
        Mon, 16 Nov 2026 13:11:25 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm10774825d50.23.2026.11.16.13.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:25 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 13:11:19 -0800
Subject: [PATCH net-next 1/4] eth: mpnic: add filters for dev_addr and
 broadcast address
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mpnic-l2-oot-v1-1-8dc6eb3582b0@gmail.com>
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

The device checks the destination MAC of every frame against a
1024 entry TCAM in order to select a pass or drop action. Up to this
point, no addresses have been programmed into the TCAM, and the default
action is set to pass.

Program the dev_addr and ethernet broadcast address into the TCAM. At
init, all TCAM entries are set to invalid, and all match actions are set
to pass. This means adding an address and making the entry valid will
result in pass action being taken for that address. When we no longer
want to filter for that address, the entry is simply invalidated. We
never change the per-entry match actions after initialization.

Because the default action on TCAM miss is still set to pass, the device
is still effectively in promiscuous mode even after this commit.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/Makefile       |  1 +
 drivers/net/ethernet/meta/mpnic/mpnic.h        |  3 ++
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    | 10 ++++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   | 10 ++++++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 49 ++++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 42 ++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    | 43 ++++++++++++++++++++++
 7 files changed, 158 insertions(+)

diff --git a/drivers/net/ethernet/meta/mpnic/Makefile b/drivers/net/ethernet/meta/mpnic/Makefile
index d5bdbd5bd1c7..1910df806d77 100644
--- a/drivers/net/ethernet/meta/mpnic/Makefile
+++ b/drivers/net/ethernet/meta/mpnic/Makefile
@@ -12,5 +12,6 @@ mpnic-y := \
 	mpnic_irq.o \
 	mpnic_netdev.o \
 	mpnic_pci.o \
+	mpnic_rpc.o \
 	mpnic_txrx.o \
 # End of mpnic-y
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic.h b/drivers/net/ethernet/meta/mpnic/mpnic.h
index 8b08af0fadcc..9e31bb71aa94 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic.h
@@ -10,6 +10,7 @@
 #include <linux/workqueue.h>
 
 #include "mpnic_csr.h"
+#include "mpnic_rpc.h"
 
 #define MPNIC_DRV_NAME		"mpnic"
 
@@ -36,6 +37,8 @@ struct mpnic_dev {
 	u32 mps;
 	u32 readrq;
 	u8 relaxed_ord;
+
+	struct mpnic_mac_addr mac_addr[MPNIC_RXB_DMAC_TCAM_CNT];
 };
 
 u64 mpnic_rd64(struct mpnic_dev *mpd, u32 reg);
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 03304e22d6ce..94733b40a96f 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -311,6 +311,8 @@ enum {
 	MPNIC_L2_ACTION_PASS	= 1,
 };
 
+#define MPNIC_RXB_DMAC_ACTION(i)	(0x62002a + 2 * (i))	/* 0x18800a8 */
+#define MPNIC_RXB_DMAC_ACTION_CNT	16
 #define MPNIC_RXB_TC_CRDTS(i)		(0x620418 + 2 * (i))	/* 0x1881060 */
 #define MPNIC_RXB_POOL_COMMON_CRDTS(i)	(0x620458 + 2 * (i))	/* 0x1881160 */
 #define MPNIC_RXB_COMMON_CRDT_CTRL_TC(i) \
@@ -320,6 +322,14 @@ enum {
 #define MPNIC_RXB_COMMON_CRDT_CTRL_TC_MAX_CRDTS	CSR_GENMASK(47, 32)
 #define MPNIC_RXB_HOST_DROP_THRESH(i)	(0x6205b0 + 2 * (i))	/* 0x18816c0 */
 #define MPNIC_RXB_BMC_CRDTS(i)		(0x6205d0 + 2 * (i))	/* 0x1881740 */
+#define MPNIC_RXB_DMAC_TCAM(i)		(0x620e5e + 4 * (i))	/* 0x1883978 */
+#define MPNIC_RXB_DMAC_TCAM_MASK(i)	(0x620e60 + 4 * (i))	/* 0x1883980 */
+#define MPNIC_RXB_DMAC_TCAM_CNT		1024
+#define MPNIC_RXB_DMAC_TCAM_DMAC	CSR_GENMASK(47, 0)
+#define MPNIC_RXB_DMAC_TCAM_OP		0x622f60		/* 0x188bd80 */
+#define MPNIC_RXB_DMAC_TCAM_OP_RELOAD_TRIG	CSR_BIT(0)
+#define MPNIC_RXB_DMAC_TCAM_OP_UNLOAD_TRIG	CSR_BIT(1)
+#define MPNIC_RXB_DMAC_TCAM_OP_TCAM_ENTRY	CSR_GENMASK(11, 2)
 
 /* NIC_CORE_RPC */
 #define MPNIC_RPC_MEM_INIT_REQ		0x780440		/* 0x1e01100 */
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
index ab832ec5de0e..889555eb4790 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_init.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
@@ -227,6 +227,16 @@ static void mpnic_rxb_init(struct mpnic_dev *mpd)
 
 	mpnic_wr64(mpd, MPNIC_RXB_BMC_CRDTS(0), MPNIC_RXB_INIT_BMC_CRDTS);
 
+	/* One bit per DMAC TCAM entry, set means pass on hit */
+	for (int i = 0; i < MPNIC_RXB_DMAC_ACTION_CNT; i++)
+		mpnic_wr64(mpd, MPNIC_RXB_DMAC_ACTION(i), ~0ULL);
+
+	/* Start with all DMAC TCAM entries disabled */
+	for (int i = 0; i < MPNIC_RXB_DMAC_TCAM_CNT; i++)
+		mpnic_wr64(mpd, MPNIC_RXB_DMAC_TCAM_OP,
+			   FIELD_PREP(MPNIC_RXB_DMAC_TCAM_OP_TCAM_ENTRY, i) |
+			   MPNIC_RXB_DMAC_TCAM_OP_UNLOAD_TRIG);
+
 	mpnic_wr64(mpd, MPNIC_RXB_MEM_INIT_REQ, MPNIC_MEM_INIT_RXB_VAL);
 }
 
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 198aad631c65..16611813db55 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -12,6 +12,52 @@
 #include "mpnic_netdev.h"
 #include "mpnic_txrx.h"
 
+static void __mpnic_set_rx_mode(struct mpnic_dev *mpd)
+{
+	struct net_device *netdev = mpd->netdev;
+	struct mpnic_mac_addr *mac_addr;
+
+	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX];
+	if (!ether_addr_equal(mac_addr->value, netdev->dev_addr) ||
+	    mac_addr->state != MPNIC_TCAM_S_VALID) {
+		ether_addr_copy(mac_addr->value, netdev->dev_addr);
+		eth_broadcast_addr(mac_addr->mask);
+		mac_addr->state = MPNIC_TCAM_S_ADD;
+	}
+
+	mac_addr = &mpd->mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX];
+	if (!is_broadcast_ether_addr(mac_addr->value) ||
+	    mac_addr->state != MPNIC_TCAM_S_VALID) {
+		eth_broadcast_addr(mac_addr->value);
+		eth_broadcast_addr(mac_addr->mask);
+		mac_addr->state = MPNIC_TCAM_S_ADD;
+	}
+
+	mpnic_write_macda(mpd);
+}
+
+static int mpnic_set_rx_mode(struct net_device *netdev,
+			     struct netdev_hw_addr_list *uc,
+			     struct netdev_hw_addr_list *mc)
+{
+	struct mpnic_net *mpn = netdev_priv(netdev);
+
+	if (netif_running(netdev))
+		__mpnic_set_rx_mode(mpn->mpd);
+
+	return 0;
+}
+
+static void mpnic_clear_rx_mode(struct mpnic_dev *mpd)
+{
+	struct mpnic_mac_addr *mac_addr = mpd->mac_addr;
+
+	mac_addr[MPNIC_TCAM_MACDA_BROADCAST_IDX].state = MPNIC_TCAM_S_DELETE;
+	mac_addr[MPNIC_TCAM_MACDA_HOST_ADDR_IDX].state = MPNIC_TCAM_S_DELETE;
+
+	mpnic_write_macda(mpd);
+}
+
 static int mpnic_open(struct net_device *netdev)
 {
 	struct mpnic_net *mpn = netdev_priv(netdev);
@@ -33,6 +79,7 @@ static int mpnic_open(struct net_device *netdev)
 
 	mpnic_enable(mpn);
 	mpnic_fill(mpn);
+	__mpnic_set_rx_mode(mpn->mpd);
 	mpnic_napi_enable(mpn);
 
 	netif_tx_wake_all_queues(netdev);
@@ -59,6 +106,7 @@ static int mpnic_stop(struct net_device *netdev)
 	mpnic_napi_disable(mpn);
 	netif_tx_disable(netdev);
 
+	mpnic_clear_rx_mode(mpn->mpd);
 	mpnic_disable(mpn);
 	mpnic_wait_all_queues_idle(mpn->mpd);
 	mpnic_flush(mpn);
@@ -145,6 +193,7 @@ static const struct net_device_ops mpnic_netdev_ops = {
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_start_xmit		= mpnic_xmit_frame,
 	.ndo_features_check	= mpnic_features_check,
+	.ndo_set_rx_mode_async	= mpnic_set_rx_mode,
 	.ndo_get_stats64	= mpnic_get_stats64,
 };
 
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
new file mode 100644
index 000000000000..c96aec4de3e4
--- /dev/null
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#include <linux/bitfield.h>
+#include <linux/etherdevice.h>
+
+#include "mpnic.h"
+#include "mpnic_rpc.h"
+
+static void mpnic_write_macda_entry(struct mpnic_dev *mpd, unsigned int idx,
+				    struct mpnic_mac_addr *mac_addr)
+{
+	mpnic_wr64(mpd, MPNIC_RXB_DMAC_TCAM(idx),
+		   FIELD_PREP(MPNIC_RXB_DMAC_TCAM_DMAC,
+			      ether_addr_to_u64(mac_addr->value)));
+	mpnic_wr64(mpd, MPNIC_RXB_DMAC_TCAM_MASK(idx),
+		   FIELD_PREP(MPNIC_RXB_DMAC_TCAM_DMAC,
+			      ether_addr_to_u64(mac_addr->mask)));
+}
+
+void mpnic_write_macda(struct mpnic_dev *mpd)
+{
+	for (int i = 0; i < ARRAY_SIZE(mpd->mac_addr); i++) {
+		u64 tcam_op = FIELD_PREP(MPNIC_RXB_DMAC_TCAM_OP_TCAM_ENTRY, i);
+		struct mpnic_mac_addr *mac_addr = &mpd->mac_addr[i];
+
+		if (mac_addr->state != MPNIC_TCAM_S_ADD &&
+		    mac_addr->state != MPNIC_TCAM_S_DELETE)
+			continue;
+
+		if (mac_addr->state == MPNIC_TCAM_S_DELETE) {
+			memset(mac_addr, 0, sizeof(*mac_addr));
+			tcam_op |= MPNIC_RXB_DMAC_TCAM_OP_UNLOAD_TRIG;
+		} else {
+			mpnic_write_macda_entry(mpd, i, mac_addr);
+			mac_addr->state = MPNIC_TCAM_S_VALID;
+			tcam_op |= MPNIC_RXB_DMAC_TCAM_OP_RELOAD_TRIG;
+		}
+
+		mpnic_wr64(mpd, MPNIC_RXB_DMAC_TCAM_OP, tcam_op);
+	}
+}
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
new file mode 100644
index 000000000000..f6e4f60180d6
--- /dev/null
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_rpc.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#ifndef _MPNIC_RPC_H_
+#define _MPNIC_RPC_H_
+
+#include <linux/if_ether.h>
+#include <linux/types.h>
+
+#include "mpnic_csr.h"
+
+struct mpnic_dev;
+
+/*  The TCAM state definitions follow an expected ordering.
+ *  They start out disabled, then move through the following states:
+ *  Disabled  0	-> Add	      2
+ *  Add	      2	-> Valid      1
+ *
+ *  Valid     1	-> Add	      2
+ *  Add	      2	-> Valid      1
+ *
+ *  Valid     1	-> Delete     3
+ *  Delete    3	-> Disabled   0
+ */
+enum {
+	MPNIC_TCAM_S_DISABLED	= 0,
+	MPNIC_TCAM_S_VALID	= 1,
+	MPNIC_TCAM_S_ADD	= 2,
+	MPNIC_TCAM_S_DELETE	= 3,
+};
+
+#define MPNIC_TCAM_MACDA_BROADCAST_IDX	0
+#define MPNIC_TCAM_MACDA_HOST_ADDR_IDX	(MPNIC_RXB_DMAC_TCAM_CNT - 2)
+
+struct mpnic_mac_addr {
+	u8 mask[ETH_ALEN];
+	u8 value[ETH_ALEN];
+	u8 state;
+} __aligned(2);
+
+void mpnic_write_macda(struct mpnic_dev *mpd);
+
+#endif /* _MPNIC_RPC_H_ */

-- 
2.52.1


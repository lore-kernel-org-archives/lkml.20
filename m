Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460321;
	b=XQj12EoK6TWfEWNCoGQ9joGWw4ucPGVhiVEgJlMZvTP+Fon2CR6I08dza0Gg58vWWYXz
	 eFpj7jT1qTU3GRuUArc19pIfae7UzjbEacUWX428totJU3zYhtF2B3BuL6oYZ4aT0lOq6
	 pJ2857N2lbitdLXYIAUYnRn1yq0PAxfRlP8dY5njZoVXwW8kqvFe9YRfhxYpX5j68P1ke
	 G4T1x3H9ec2z3SBy/TzukXc3xdXv++xU0UFHOTRBlPJVMoBoxh6+Lqz+kiJZu9tI4Du5e
	 WA0BUMaG1Jho4hueO4jAWsUI1kJ8vUyYnSJ4tWf3wZOc7OxWOZKMQGCNtCG9uK0ufHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dDh8yKX+7rfX2dtQgzkKkYKJk63NQ3CPpnXsSD2zHz4=;
	b=5Vd1FIFb5vwSNQsxILmzlH6kxRHfR6YR1A8rIEInJCrZyGK9X1wcMH7uJ6pkXwgnSRzu
	 CIYZfsNcxbFzFapE3E8wh8bDVmv+BEzojoZ4SkoeSj4t+3lONatcEMZXKOoeS++NWvYZe
	 1IJEqXMpDU9EDRdF0HySLxWZxg5jrfVeSkOnM/vDx1dOvBuMtfme5X70I77r6SebNOYJv
	 zTD9D6v8RZZY5A2LQKR4jf7dSvDCWxqLDNPIfLQavE+NMdAgJgEwm9QiIC75ja0IdqxDX
	 iI6Zd9q1LN5RkDlfd4rr4PQy9SqF8PNjw0y1edPZLBFwGQTF1tTsKtWwQl1xV3V1MDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qACmN6IL;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF4606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48EF4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qACmN6IL
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7660305eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460320; x=1795065120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDh8yKX+7rfX2dtQgzkKkYKJk63NQ3CPpnXsSD2zHz4=;
        b=qACmN6ILw09v5mnwZwrM8NnQsdypPx3wC17jLbqp8osE+yYeizjTrePkbj4yep/0GZ
         sj61FBKipcxeF5j5h/mqPQCRSpc7WjzP0G6M73yVFvVNjfGXIrkaQaW6cP9ql6gf4mcY
         bjd1UkBeaQ8LroKft1ZYvp98nPUSuYgsZXffaI4ndNWP4Woc9IiTz4IcuAvV2VFYO7jA
         PWJP2A1wzdZEpehTqzj66mSOqZyyn9PNOnSxfeGKdwxvCCY2aVqIMiK8TbYysvg5MFCZ
         FhAQbpblrgh3n/vLZh9A9ODHcbOC6431KCwf/NrVHIKSsSpV8phvsyyUYpxMvkqKZfNk
         PRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460320; x=1795065120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDh8yKX+7rfX2dtQgzkKkYKJk63NQ3CPpnXsSD2zHz4=;
        b=EEESXwcK/vtCrcIkQn/l/U12Z9s6rfJ3y64hlh9KPteW2i0Vg88jNnmc+NdkHxYwxm
         QmhsnWIoy6XFjCEam0ZcUikDoQ10DNflvfQkaj+Pz3kgjQIasNNbaENxaT97JV0Drf7P
         ozcxq6s0yqovZgRYeA4jZFRCfNdF9GO1VKVqKaRvDY+KBLeJATnlPYbrHhFvgM7/02Ue
         mQWObFHY99WgAC7rFHjxSCR6tBZDuDaawxKTCfXpOiSE/8rUHbBzREaCwPtMAWfM35bk
         P1CNctwYoRzZcJdsMGysyilXC7FQvuviaf7r9L4ySjziaDjJ45dsYfgc925gjXJABx/G
         bRZA==
X-Forwarded-Encrypted: i=1; AL+hErFuABikzM+TkpWKROncUhSrb0CsBhoY/5Vf+iDnNRf3fuQ7EgkNQeLgpx6rGj8pwIHKT64UhaJhjF0ET/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jJAE/COO5GiUZZ6bj6X/yStRULueS39bQlPqQ6G+DzkylpnDU
	kmthyyQiUityURCXOQLP9LLJRYOwX4vvxK7R0OR6FPXsx0qn5/RTDZuG
X-Gm-Gg: AYBFou38lqSTOvMUR05htGWpHOxyR2I6F8QmPSSA8wqkHdM3Zrfvoehx0ob5JK5Y0Z+
	Aupm6Dfnb0UrshNs8LfNVTXsFs5NhtihTma9ojtW1yejArcSI/O5UXOXISxJY8dv/ah0iieMsMX
	h/P2/2HizEkVRoOTgsTKg2k2pUmaMIunAxt3qNNlw6PotwzwWXA5pzpnkkAk/Dz81I5tmrjLVnA
	+nnjq3IDKAT1hUzvcpWHWkAmm61kUA1ZGNv9IGxlyM0zKz8+eI9OHWGCfscSbuKB7a+EV49st97
	cp60bqk21OoUNObIPLOuX7kyMP9DJ5mDetYuNd8Ancw0EcOJ3hRIeXEgL5uVqHuAJWNagEl+DXQ
	zPbjXuM0HRTRvTM8BierxsR+CT1lSaHDSZNGiuIG6j/r/BZmKN/HT9GCDqKYv4YUIBICM7JEY9D
	S6gPtgu0vkrDm7Hx0+q2bPpp3cNk5ybpiwZF3V71QHmvsNOSPZg/ch2gmm3cP4pVnxzCByde4tf
	qCHYSvoQCjvujvD1oIJM+zAVJOY9rxFsAEl0Z9eS8I9Wp3BWZTquuvG26a9t17nJAmInLumiNPD
	V62it9rLE6Q9lIjpsPs/SvJp4Q2lP9U2X4KPfx9qqgzsX/Uwe6wraNo=
X-Received: by 2002:a05:7301:4543:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-37686d32a29mr4366851eec.32.1794460320211;
        Wed, 11 Nov 2026 21:12:00 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:11:59 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] wifi: brcmsmac: make d11.h self-contained
Date: Thu, 12 Nov 2026 13:11:28 +0800
Message-ID: <20261112051142.2797529-2-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

d11.h includes pub.h and dma.h, but it needs only the two DMA register
layouts from dma.h for struct d11regs and nothing from pub.h. Move
struct dma32diag and struct dma64regs into d11.h next to the register
map that embeds them, and drop both includes.

The TXFID_* masks describe the TxFrameID field of struct d11txh.
Define them in d11.h next to the header that carries the field,
so that it can be shared with other code.

pub.h and d11.h both define the PHY types of the PhyVersion register,
with the same values. Add the ones that only pub.h has, PHY_TYPE_A,
PHY_TYPE_G, PHY_TYPE_LP and PHY_TYPE_HT, to d11.h, and drop the list
in pub.h.

This prepares d11.h for use outside brcmsmac. No functional change.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  1 +
 .../broadcom/brcm80211/brcmsmac/d11.h         | 43 ++++++++++++++++++-
 .../broadcom/brcm80211/brcmsmac/dma.h         | 27 ------------
 .../broadcom/brcm80211/brcmsmac/main.h        | 11 +----
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |  1 +
 .../broadcom/brcm80211/brcmsmac/pub.h         | 10 -----
 .../broadcom/brcm80211/brcmsmac/rate.h        |  1 +
 7 files changed, 45 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5..b42e43c883 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -19,6 +19,7 @@
 #include "scb.h"
 #include "phy/phy_hal.h"
 #include "antsel.h"
+#include "dma.h"
 #include "main.h"
 #include "ampdu.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
index 0c685eeaed..78cbfceab9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/d11.h
@@ -20,8 +20,33 @@
 #include <linux/ieee80211.h>
 
 #include <defs.h>
-#include "pub.h"
-#include "dma.h"
+
+/* DMA structure:
+ *  support two DMA engines: 32 bits address or 64 bit addressing
+ *  basic DMA register set is per channel(transmit or receive)
+ *  a pair of channels is defined for convenience
+ */
+
+/* 32 bits addressing */
+
+struct dma32diag {	/* diag access */
+	u32 fifoaddr;	/* diag address */
+	u32 fifodatalow;	/* low 32bits of data */
+	u32 fifodatahigh;	/* high 32bits of data */
+	u32 pad;		/* reserved */
+};
+
+/* 64 bits addressing */
+
+/* dma registers per channel(xmt or rcv) */
+struct dma64regs {
+	u32 control;	/* enable, et al */
+	u32 ptr;	/* last descriptor posted to chip */
+	u32 addrlow;	/* desc ring base address low 32-bits (8K aligned) */
+	u32 addrhigh;	/* desc ring base address bits 63:32 (8K aligned) */
+	u32 status0;	/* current descriptor, xmt state */
+	u32 status1;	/* active descriptor, xmt error */
+};
 
 /* RX FIFO numbers */
 #define	RX_FIFO			0	/* data and ctl frames */
@@ -658,8 +683,12 @@ struct d11regs {
 #define	PHY_TYPE(v)		((v & PV_PT_MASK) >> PV_PT_SHIFT)
 
 /*== phy types (PhyVersion:PhyType field) ==*/
+#define	PHY_TYPE_A		0	/* A-Phy value */
+#define	PHY_TYPE_G		2	/* G-Phy value */
 #define	PHY_TYPE_N		4	/* N-Phy value */
+#define	PHY_TYPE_LP		5	/* LP-Phy value */
 #define	PHY_TYPE_SSN		6	/* SSLPN-Phy value */
+#define	PHY_TYPE_HT		7	/* HT-Phy value */
 #define	PHY_TYPE_LCN		8	/* LCN-Phy value */
 #define	PHY_TYPE_LCNXN		9	/* LCNXN-Phy value */
 #define	PHY_TYPE_NULL		0xf	/* Invalid Phy value */
@@ -787,6 +816,16 @@ struct d11txh {
 
 #define	D11_TXH_LEN		112	/* bytes */
 
+/* TxFrameID */
+/* seq and frag bits: SEQNUM_SHIFT, FRAGNUM_MASK (802.11.h) */
+/* rate epoch bits: TXFID_RATE_SHIFT, TXFID_RATE_MASK ((wlc_rate.c) */
+#define TXFID_QUEUE_MASK	0x0007	/* Bits 0-2 */
+#define TXFID_SEQ_MASK		0x7FE0	/* Bits 5-15 */
+#define TXFID_SEQ_SHIFT		5	/* Number of bit shifts */
+#define	TXFID_RATE_PROBE_MASK	0x8000	/* Bit 15 for rate probe */
+#define TXFID_RATE_MASK		0x0018	/* Mask for bits 3 and 4 */
+#define TXFID_RATE_SHIFT	3	/* Shift 3 bits for rate mask */
+
 /* Frame Types */
 #define FT_CCK	0
 #define FT_OFDM	1
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.h
index 7905fd0817..d2f00d699f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.h
@@ -25,33 +25,6 @@
 #define	DMA_TX	1		/* TX direction for DMA */
 #define	DMA_RX	2		/* RX direction for DMA */
 
-/* DMA structure:
- *  support two DMA engines: 32 bits address or 64 bit addressing
- *  basic DMA register set is per channel(transmit or receive)
- *  a pair of channels is defined for convenience
- */
-
-/* 32 bits addressing */
-
-struct dma32diag {	/* diag access */
-	u32 fifoaddr;	/* diag address */
-	u32 fifodatalow;	/* low 32bits of data */
-	u32 fifodatahigh;	/* high 32bits of data */
-	u32 pad;		/* reserved */
-};
-
-/* 64 bits addressing */
-
-/* dma registers per channel(xmt or rcv) */
-struct dma64regs {
-	u32 control;	/* enable, et al */
-	u32 ptr;	/* last descriptor posted to chip */
-	u32 addrlow;	/* desc ring base address low 32-bits (8K aligned) */
-	u32 addrhigh;	/* desc ring base address bits 63:32 (8K aligned) */
-	u32 status0;	/* current descriptor, xmt state */
-	u32 status1;	/* active descriptor, xmt error */
-};
-
 /* range param for dma_getnexttxp() and dma_txreclaim */
 enum txd_range {
 	DMA_RANGE_ALL = 1,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 2d133264f4..9cb09c8a13 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -22,6 +22,7 @@
 #include <brcmu_utils.h>
 #include "types.h"
 #include "d11.h"
+#include "pub.h"
 #include "scb.h"
 
 #define	INVCHANNEL		255	/* invalid channel */
@@ -85,16 +86,6 @@
 #define BRCMS_IS_MIMO_PREAMBLE(_pre) (((_pre) == BRCMS_GF_PREAMBLE) || \
 				      ((_pre) == BRCMS_MM_PREAMBLE))
 
-/* TxFrameID */
-/* seq and frag bits: SEQNUM_SHIFT, FRAGNUM_MASK (802.11.h) */
-/* rate epoch bits: TXFID_RATE_SHIFT, TXFID_RATE_MASK ((wlc_rate.c) */
-#define TXFID_QUEUE_MASK	0x0007	/* Bits 0-2 */
-#define TXFID_SEQ_MASK		0x7FE0	/* Bits 5-15 */
-#define TXFID_SEQ_SHIFT		5	/* Number of bit shifts */
-#define	TXFID_RATE_PROBE_MASK	0x8000	/* Bit 15 for rate probe */
-#define TXFID_RATE_MASK		0x0018	/* Mask for bits 3 and 4 */
-#define TXFID_RATE_SHIFT	3	/* Shift 3 bits for rate mask */
-
 /* promote boardrev */
 #define BOARDREV_PROMOTABLE	0xFF	/* from */
 #define BOARDREV_PROMOTED	1	/* to */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
index cab08f0669..7ffff7f519 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_hal.h
@@ -10,6 +10,7 @@
 #ifndef _BRCM_PHY_HAL_H_
 #define _BRCM_PHY_HAL_H_
 
+#include <linux/bcma/bcma.h>
 #include <brcmu_utils.h>
 #include <brcmu_wifi.h>
 #include <phy_shim.h>
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
index bfc63b2f05..c366a75710 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/pub.h
@@ -24,16 +24,6 @@
 
 #define	BRCMS_NUMRATES	16	/* max # of rates in a rateset */
 
-/* phy types */
-#define	PHY_TYPE_A	0	/* Phy type A */
-#define	PHY_TYPE_G	2	/* Phy type G */
-#define	PHY_TYPE_N	4	/* Phy type N */
-#define	PHY_TYPE_LP	5	/* Phy type Low Power A/B/G */
-#define	PHY_TYPE_SSN	6	/* Phy type Single Stream N */
-#define	PHY_TYPE_LCN	8	/* Phy type Single Stream N */
-#define	PHY_TYPE_LCNXN	9	/* Phy type 2-stream N */
-#define	PHY_TYPE_HT	7	/* Phy type 3-Stream N */
-
 /* bw */
 #define BRCMS_10_MHZ	10	/* 10Mhz nphy channel bandwidth */
 #define BRCMS_20_MHZ	20	/* 20Mhz nphy channel bandwidth */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 5bb88b78ed..2b10fd5427 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -19,6 +19,7 @@
 
 #include "types.h"
 #include "d11.h"
+#include "pub.h"
 #include "phy_hal.h"
 
 extern const u8 rate_info[];
-- 
2.53.0


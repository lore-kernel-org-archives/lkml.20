Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993011;
	b=LnfgvjaHw9mw7+dgFa8jbaAB2ovXBqZC/UxcfPHHFcE+p3W/PBZLFMTVDnXqgwJCGxqy
	 euBP8aDNl9yuXTenrf2/7ehEBC0McG+DJciD6rftjd5KjN1ovHJUT4GMBQcU+oYetW1kx
	 IugN63IeqbTPAVnxKg+cNvM3qqHpOf/WgQeD4/UJoY+Vh0qLGrapaNHk7eNrpu4tj5KJx
	 eUzVRRvCVPVwNW1fTYSjArOroWgmsaMouROjQ2LPRtuCm5JMbWxLCIVDdQ8OmuQ9N766V
	 8/f5a8YbmuHWh7/7PMnuKmGpK6Yvq3v2b4+Xccwq8XL3tWMcIn7je1iBmAKA71AhnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A5K+0D7LhUP2KNGb4z9d+RqX3N8gBOqbYKhDJMfHDmI=;
	b=wDXd25oCvK2FsRGbohDn+gNLja8VkfzykrKIJMRQno1dLZPV3IfYnUJN+F5bEnx0CC9g
	 dmiodgpJ6J2n09rd2e+/rKevNKqxTtkZeh/PJhSRZA4lpVo/pzzFgDRx7Wyyec7o5tbYB
	 DFiCqXEJ2tE91wzuw1KJveBXKjEw6yvXvosUD5tm64A82B5hGP62xqVoFdaoeXdgWWgYv
	 NTY8TN8oFaTablph9d1PFDenuvAT7N2vbN5SxXLuRapvqUsSHBhmC4kl6Vwpof9mw3ai/
	 Dsq9EY4HsvQ+aZaESp4bOrKLD+LWYp9U8B2Ck2OmXE15YSvnPtmBHKd1Uxm6qX+ytSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6f0xhEu;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C528606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C528606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6f0xhEu
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so907068b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993011; x=1793597811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5K+0D7LhUP2KNGb4z9d+RqX3N8gBOqbYKhDJMfHDmI=;
        b=K6f0xhEuVXOmQZCeWlSbgs9J2OeL1f3QOOtWFMJrCGx2eD/na43bEUBPq2kwpPwEik
         l6VSQuiTw4g1LQ41YEXtMq776FIIU8BmI0wm6eHbZKzneEHKFDWXQbnVSW29x1k59rBP
         BOfIVFfm3HP6IGCRMtYOJZtN2J3HqAXw0Rtbt5U7pqtYG6e3YQgAePamvQVCE3DSv9lw
         lsyGxbf4GFrcGBR4WErNYCtid87zcgJYUmGU6f+8OwVnzx9oFcfBIyE0EdA/JwPYm/fq
         n9LTMkuyDVtGKcb2pCgdX7EpEx+6QFSFbY728b7InYWvmlBbLL72owYCJWy8W319Qx1r
         tygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993011; x=1793597811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5K+0D7LhUP2KNGb4z9d+RqX3N8gBOqbYKhDJMfHDmI=;
        b=cE7c4AkQ3gIKdnZeoCzDUkYEH0OriuJAL5HLedjPvs2WCmWv1U12dvCmuBiZG+P2ZP
         cteIJ2HRfKt2DxafF7XILatkA3tmt8oIKjd+rixmhDTunEehzghio2hErplo8cNXJ0YN
         iAMSiaE/uXQODkrT2nY5FPTdbz3FQrXOI/OAGsvuMAeRoHJ4GYD3WrxTeNA4A5KeqQ9E
         JpbTpDR06c62H9ih8QwG3WVDOxZFgz4VsWHi5nMCU5velXk6Md1mYVDG406AnHvzfpiN
         ku5vI/Ivpt1RHYJsfxzLYmSbamVi1rVqCOVutxQmcwBwIthzGZdsyY6KEEjjPLNw0gug
         N+aQ==
X-Forwarded-Encrypted: i=1; AKwUvByi52opxLJiUcoB3/G9XNeukaqmNXa/cZxfWkr8dAXU1VlYkvsQ2rqh0LUeafGGn6aMkFnvfJifjG0vJrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYImlUGQD1xk/AwDjZFIxjsb/Rtofv5rjV9IqQgR3XUhPKOZAH9S
	0AEQxmCZlPFEa4nAOxqZ4c5WoSwZfpiozDOAS4FnBDAhqFNnE1nGXILV
X-Gm-Gg: AYBFou07NB9Ueo8Qkf2QizkwXzLnM2w4C4GyTNZVqYyhrfN+Nr9tDKTbaCfoLO9cNYE
	Njg9gHS0nG6dhl7GHjjzx7smP/5Tp2Z6yNQaMrhQUXfUuJ8By9xbe/gSc/Bj0lXsqMPuu5wc7ZF
	W6Bgw9fKJuEynUyyZ5aAc0iZhmcNqwWooLijydmUn41VEatJTmEO4I6OdvBvHr8+NtNm66E864z
	4aVyWtk3gqE5KV5GbNWB1bx9wItBlVvjt9SAs9dXcWV5yGnKQq4SLObXTHphDUB0jCc33KygMNi
	ggMQht27phewWdZFg2I45BVQhkmCbqoxUzW61xXKQ5Ag9i1QpWW5GfosYbyQp1/39lTW2aEwf1u
	zKNYrnXtByetrZvBuTLCwY6MO4Zuh3/1VTYeFW7TpxUjlbJFVqxgxJlDRVqjoQ8tnf0E9msUMkS
	HRFPeDjewMeIUxoKoU7GTOXTq2e6ISOJDzyZZN6tMZP72aeXCKM7v/GqJkMqGrYXY9R79jzISwd
	uKwNhRj6llWzskO1uVWuShybnqX6YIKEvZXe67Y8VS2yKclN8u6XG0FOK9UWOaI5F0IbWKwvVUk
	TPxmWw==
X-Received: by 2002:a05:6a00:4c8c:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8a364e63335mr4594492b3a.4.1792993010766;
        Sun, 25 Oct 2026 22:36:50 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:36:50 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 01/17] wifi: brcmsmac: make d11.h self-contained
Date: Mon, 26 Oct 2026 13:36:07 +0800
Message-ID: <20261026053633.361454-2-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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
index fc7a5dd2e..b42e43c88 100644
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
index 0c685eeae..78cbfceab 100644
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
index 7905fd081..d2f00d699 100644
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
index 2d133264f..9cb09c8a1 100644
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
index cab08f066..7ffff7f51 100644
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
index bfc63b2f0..c366a7571 100644
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
index 5bb88b78e..2b10fd542 100644
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


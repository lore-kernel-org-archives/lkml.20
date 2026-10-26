Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023101;
	b=ADwxsh/up43nscZ4ejXYVq0hjewZfpiEISCj2QXkhbqz6DzZtw9tn1ghFzrN7Uhnh+Fj
	 qZqxqA/LkxkxRIN0hhMI5NESpm/iLWGtZhIFRvm5Cfbc0BYk0BFk7r1Q8ksIOZaAejycz
	 MEoIonhNacfrTysYLrDGVJN3L7D4zJ74+FEBuDHELYGE28Sz2SRPeciJF1wfa63qOLCgl
	 Z4b3FuEOoIcTTbZ9CBtoUmP6KH6JJOpVuabjGywRfw3lkcjl4tAvuxS/CNCPaY0z5d34F
	 5rB4oMcE90nHaEqG0RmhpuTQtc9a+HQH1+R+FMpj6ItE/enzXwnxjt5NDDoxlLpBA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023101;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hCPQ2C/jeVRFFIM7Oshbvz7OZwUREI/I2inMe09Wsao=;
	b=BumulWne0FhCq7LylDKVBrhRvqedyMuw6DuQ+VkS73WYmgxqvhqnLgAfLJrpFkHhPvaV
	 sJRc9HXlNviy3N/LFU+tT32fImb6cOlgNWZHYuRFtQnyAGMEAPbi+SHaeSwsJsc+JjuY2
	 cSVMz6ZNspkXqFYfHXrJK47FICwwbPlNGFBBPUq1h82l1p+mkD/Ju+Hwwe5BwX2tS8U3y
	 WGhXjpNcehp3rvsZCaXsEZJDkEhqnZb9V/6AVWEiQhSMz2fXBh9NhuFxRuyIXb3NlZake
	 qtYrYBU38bZSgYQaruYBNyWe7Q3Q/7oaMY5i1OmX/9CFgf9Vj4kFsvz7YYZklqxsfqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KA8gH0Dr;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD1606A31B;
	Mon, 26 Oct 2026 13:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BBD1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KA8gH0Dr
Received: from pb-laptop.local (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A18B1D0;
	Mon, 26 Oct 2026 14:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793022966;
	bh=6puGPTdIWp+0M7mx2OBYO+jk1Uh58PKmNGrKeIAuo3k=;
	h=From:To:Cc:Subject:Date:From;
	b=KA8gH0DrE5fTWn5hmi8DUaABVh74+AErZLIA+q3neLPWQsuk0wySfYCaRCadx1DZz
	 Z1Vl0ByyPT9Nm9gRyxSP1it6wsXV5DabWTf3Kkc1k6BbJoOLHIPkORNe/e9AJhCRT+
	 B6rv+0qEQ7Xs2YwiaGEIGTTDwccKdCqgWgQNaCwM=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Subject: [RFC PATCH v1] media: rppx1: Update shadowed registers
Date: Mon, 26 Oct 2026 14:58:14 +0100
Message-ID: <20261026135814.564457-1-barnabas.pocze+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Certain registers are shadowed and changes to those must be explicly
applied. Updating the shadowed registers after a frame is complete can
be done by writing `RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD` to the
`RPPX1_RPP_HDR_UPD_REG` register.

This is already done in `rppx1_start()`, but this auto-update feature
is documented as "self reset at picture end". Therefore setting it
at start will only auto-update the registers once, after the first
frame.

For example, this causes that the LSC module cannot be toggled after
the first frame. This behaviour can be tested by reading the first
bit of `LSC_STATUS_REG`, which will show the same value after the
first frame regardless of what was last written to `LSC_CTRL_REG`.

Fix this by unconditionall triggering an auto-update when a parameter
buffer is processed in `rppx1_params()`.

Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
---

I made the minimal amount of changes to get the desired behaviour because
I don't know how the maintainers would prefer the registers in headers.
So I simply copied only a subset, but it feels a bit suboptimal like this,
hence this is an RFC.

---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +++
 .../media/platform/dreamchip/rppx1/rppx1.c    | 23 -------------------
 .../media/platform/dreamchip/rppx1/rppx1.h    | 21 +++++++++++++++++
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a75a27a8afd09..cbc9847ba5be6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -110,6 +110,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		}
 	}
 
+	/* Trigger update of shadowed registers after frame is done. */
+	write(priv, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rppx1_params);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.c b/drivers/media/platform/dreamchip/rppx1/rppx1.c
index c502be7979146..4794672e088cf 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.c
@@ -15,7 +15,6 @@
 #include "rppx1.h"
 
 /* RPP_HDR Base Addresses */
-#define RPPX1_HDRREGS_BASE			0x0000
 #define RPPX1_HDR_IRQ_BASE			0x0200
 #define RPPX1_RPP_OUT_BASE			0x0800
 #define RPPX1_RPP_RMAP_BASE			0x0c00
@@ -26,25 +25,6 @@
 #define RPPX1_RPP_MVOUT_BASE			0xc000
 #define RPPX1_RPP_FUSA_BASE			0xf000
 
-#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
-
-#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
-#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
-#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
-
-#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
-
-#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
-#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
-#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
-
-#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
-#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
-
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
-#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
-
 #define RPPX1_RPP_ISM				(RPPX1_HDR_IRQ_BASE + 0x00)
 #define RPPX1_RPP_RIS				(RPPX1_HDR_IRQ_BASE + 0x04)
 #define RPPX1_RPP_MIS				(RPPX1_HDR_IRQ_BASE + 0x08)
@@ -349,9 +329,6 @@ int rppx1_start(struct rppx1 *rpp,
 	/* Immediate commit update for shadows. */
 	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_CFG_UPD);
 
-	/* Then for operation update shadows with picture synchronization. */
-	rppx1_write(rpp, RPPX1_RPP_HDR_UPD_REG, RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD);
-
 	/* Clear any pending interrupts. */
 	rppx1_interrupt(rpp, NULL);
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1.h b/drivers/media/platform/dreamchip/rppx1/rppx1.h
index 3bf3955afbaed..c6bd82f504560 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1.h
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1.h
@@ -13,6 +13,27 @@
 
 #include "rpp_module.h"
 
+#define RPPX1_HDRREGS_BASE			0x0000
+
+#define RPPX1_RPP_HDRREGS_VERSION_REG		(RPPX1_HDRREGS_BASE + 0x0000)
+
+#define RPPX1_RPP_HDR_UPD_REG			(RPPX1_HDRREGS_BASE + 0x0004)
+#define RPPX1_RPP_HDR_UPD_REGS_GEN_CFG_UPD	BIT(1)
+#define RPPX1_RPP_HDR_UPD_REGS_CFG_UPD		BIT(0)
+
+#define RPPX1_RESERVED_3_REG			(RPPX1_HDRREGS_BASE + 0x0008)
+
+#define RPPX1_RPP_HDR_INFORM_ENABLE_REG		(RPPX1_HDRREGS_BASE + 0x000c)
+#define RPPX1_RPP_HDR_INFORM_ENABLE_ENABLE	1
+#define RPPX1_RPP_HDR_INFORM_ENABLE_DISABLE	0
+
+#define RPPX1_RPP_HDR_OUT_IF_ON_REG		(RPPX1_HDRREGS_BASE + 0x0010)
+#define RPPX1_RPP_HDR_OUT_IF_OFF_REG		(RPPX1_HDRREGS_BASE + 0x0014)
+
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_REG	(RPPX1_HDRREGS_BASE + 0x0018)
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_ENABLE	1
+#define RPPX1_RPP_HDR_SAFETY_ACCESS_PROTECTION_DISABLE	0
+
 #define RPPX1_IRQ_ID_256HIST			BIT(27)
 #define RPPX1_IRQ_ID_PRE2_DPCC			BIT(25)
 #define RPPX1_IRQ_ID_PRE1_DPCC			BIT(24)
-- 
2.56.0


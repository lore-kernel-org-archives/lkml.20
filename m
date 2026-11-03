Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702739;
	b=dh+CAgysxTLilMeihwiATsP7QYPfvqj8ItABCumAnvWLpTzE2l/sQK/MVEI5Sam+zVSb
	 nawW7CXMoStIOKqavTZlfvMKjJnPOZRo4KAXuTV3skxmWVAiOdr0RoZKoz3tEr2GlmHjc
	 iyWwqPVR78uRcJ8G/kPDDQ0GlXnXe9Rg+1wcyd2UJiiR/FQA5FWBPux76gvc6UYFgTXXY
	 /Hcfl/F6IWvTuTnWJYNDPX26EpvSwVzhLbZ/dfsVr2Utt2ca0S+GVSjVh+wr0ZfCUuTsd
	 9F7scj+PKFJ1ut6DUxZ0Qci1l8igakuQEsrenuDs8fmIwGEVeun7DZaeoBAdyLVdmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702739;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nN4tCDxNLeRU5R4W+fMv3UuvdUzisOZ7ub+YA8VErpM=;
	b=HnLviIJRerhzhv008Jo9yheJYYVJMDLl1yNmgglMDVEaj9YT5sMk4NH6EC0zfRu0DFem
	 YNTZHbVGwynUJy094fMTgtfv1VbW4aoiYVR89dtuKe63pNKo4vBd6PnKyTf73HW2gXVaA
	 abOTuub97tFgf6YJfkXRvXtzTbmHd7b3P4x0uSQharDsFGesmyYCAQg03xvAQ/PR10/r1
	 mDOn7RhHB0EShHlVYJnKBt7NNvrH5zNAEJ76B0JP23gORN18oHBjPXsiDV0xfKlTgElBz
	 Qk0i+OX5LzXduBVQK5YCeS+3OWI+AwziLbd4GNx43luG2sxLIRNt9AsK4in6rF66+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4F606C5AE;
	Tue,  3 Nov 2026 10:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E4F606C5AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC18-0000000031h-0D0e;
	Tue, 03 Nov 2026 10:45:26 +0000
Date: Tue, 3 Nov 2026 10:45:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] media: rockchip: rkcif: mask MIPI interrupts when powered
Message-ID: <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>

The MIPI interrupt enable register comes out of every reset with all
27 sources enabled. Of those only the frame end bits are handled, so
the line stays asserted at about a thousand interrupts per second
while the block is powered. The kernel then reports the interrupt as
unhandled and disables it, after which frame completion only happens
from the spurious interrupt poll. The poll can also call the handler
while the block is clock gated.

Clear the enable register and the status bits after the block has been
reset and clocked, and after the reset in runtime suspend. Treat any
status bit that the handler has read and cleared as handled.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 19 +++++++++++++++++++
 .../rockchip/rkcif/rkcif-capture-mipi.h       |  2 ++
 .../media/platform/rockchip/rkcif/rkcif-dev.c |  3 +++
 3 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db507..686b995525b9b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -810,6 +810,23 @@ static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
 }
 
+void rkcif_mipi_irq_mask(struct rkcif_device *rkcif)
+{
+	if (!rkcif->match_data->mipi)
+		return;
+
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		struct rkcif_interface *interface =
+			&rkcif->interfaces[RKCIF_MIPI_BASE + i];
+
+		if (!interface->rkcif)
+			continue;
+
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, 0);
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, ~0);
+	}
+}
+
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 {
 	struct device *dev = ctx;
@@ -823,6 +840,8 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 
 		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
+		if (intstat)
+			ret = IRQ_HANDLED;
 
 		for (unsigned int j = 0; j < interface->streams_num; j++) {
 			struct rkcif_stream *stream = &interface->streams[j];
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index 7edaca44f653c..167b43756929b 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -21,4 +21,6 @@ void rkcif_mipi_unregister(struct rkcif_device *rkcif);
 
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
 
+void rkcif_mipi_irq_mask(struct rkcif_device *rkcif);
+
 #endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index be3a174b9aab0..fbc8ed78d99ea 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -281,6 +281,7 @@ static int rkcif_runtime_suspend(struct device *dev)
 	reset_control_assert(rkcif->reset);
 	udelay(5);
 	reset_control_deassert(rkcif->reset);
+	rkcif_mipi_irq_mask(rkcif);
 
 	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
 
@@ -298,6 +299,8 @@ static int rkcif_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	rkcif_mipi_irq_mask(rkcif);
+
 	return 0;
 }
 
-- 
2.56.0

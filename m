Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.185.108.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649774;
	b=QHpMIYy9nc80i4U2VSJS5qgzi5eWhqUXawbap0EPWEtZHC8fcDCTbHXpc+33cxiL5A5p
	 hWsoC8aasEIGN38eDTQ5W4GRkzLyu8S8mOzgkFYhfZPVTfxllbV52/TcbprC8xsusgV4y
	 XWbKN5MrtdNj8J3FPG8fowyczSg9ewqflK/2aneaVBv8tmhgiLUH/KtPzRHdELaj2mFqk
	 KUAveqUT1K8WOdKqwKoSXTQoQCTHA6OU5xtYErp1DjDzWZ0bk7LDkcuDdftFnnMKGiDcj
	 oEYSsTfjd9S5S1zd0ChtdgOvjEWvE8xoGptDzlTKMuFIkOWLu5/Z0mauIj3WpEd1ibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649774;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=6cMIZCL6HzXSweix3po3JyC6KVNiZfxbg4RWm8m485o=;
	b=D2OeeBALOz+Ni2LkqqNvV811NpwFcHg3CThxeC6I+Ua26Ls74H7iqWY07Maf7iBZIdMI
	 I7fyxu3z0c9LjNf19QYaBY27h9FZtNvM+vAZVH4u1R2OJ7Db6cZjrAZZnW9xAP3U1Nvs6
	 XLV/DdrM7qu2DFRssu7FqP8WrLnWAyMgAGIUaD7aPuyS0ImCNu9ZOrPnpMD+0GmA+v6Cn
	 5C51ox+GRRtANsl+gTjhJRDtrVPdgq/pEigumTZfbSJksMtbS+b9otbPLlfa+UgC20Qsc
	 Q0nBcJMemSjFfxigI/28GpS7CT5OusHPLin5DWcLNFy1edBl9Fcdj5md5Z1mwPfqREg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puresig.cz;
	spf=pass smtp.mailfrom=puresig.cz;
	arc=none smtp.remote-ip=93.185.108.244
Received: from mail.serverx.eu (mail.serverx.eu [93.185.108.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7E606A323;
	Sat, 14 Nov 2026 09:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD7E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puresig.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puresig.cz
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6EF214924;
	Sat, 14 Nov 2026 10:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puresig.cz; s=dkim;
	t=1794649768; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6cMIZCL6HzXSweix3po3JyC6KVNiZfxbg4RWm8m485o=;
	b=GSbEaquVC3aJqsg4LFeeZ5sDxn04I2yM8yh9QmdUg5l4EMXDJnOUD+dfrtvKNuhHvNCLCH
	C43KwX2wrjnrErJRoYW0TzYl2c1nVD2zJU7rzmWWnck/3umFBVeSiDq/rrWrivgxi/w9Wo
	fk48DsK7w/NmQ2GIthF9y1tOaaTDQAX0qOC5+HQq+DjTk0d+6ah2+imtZ2hTEC7LKB9ggt
	oLyczpui5mOzU0O+/P1R4UpK9smnaswwwhgGZqlyWta2Laj5EXCasiy1oxIRxIstKr4hhu
	qXI08RZh/OmVupIHVBxfXmDT7QqKmoCBFBUBBdrwg73jgLLsOok5r/7/pY7hDw==
From: Lukas Splavec <lukas.splavec@puresig.cz>
To: detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukas Splavec <lukas.splavec@puresig.cz>
Subject: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM buffers
Date: Sat, 14 Nov 2026 09:49:16 +0000
Message-ID: <20261114094916.28744-1-lukas.splavec@puresig.cz>
X-Mailer: git-send-email 2.51.2
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
X-Last-TLS-Session-Version: TLSv1.3

rkvdec_allocate_rcb() uses the CPU virtual address of the SRAM buffer
as the decoder's IOVA and writes it into the IOMMU page table directly
with iommu_map(), bypassing the DMA API. Only the low 32 bits of that
address are used, which falls inside the IOVA range managed by the
allocator. The IOVA allocator does not know about this range and
considers it free. Under load it hands out the same IOVA to another
buffer, e.g. a capture buffer, whose mapping then fails:

  [   66.930512] iova: 0x0000000082100000 already mapped to 0x00000000ff001000 cannot remap to phys: 0x0000000168231000 prot: 0x3
  [   66.930674] rkvdec fdc38100.video-codec: dma alloc of size 16588800 failed

and decoding cannot start.

Map the SRAM buffer with dma_map_resource() instead, so the IOVA is
allocated by the IOVA allocator and the mapping is created by the DMA
API, and release it with dma_unmap_resource(). Without an IOMMU,
dma_map_resource() returns the physical address, so the separate
no-IOMMU path is no longer needed.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Signed-off-by: Lukas Splavec <lukas.splavec@puresig.cz>
---
Tested on a Giada D77 (RK3588) with GStreamer 1.28 (v4l2slh264dec/
v4l2slh265dec, H.264 and HEVC up to 4K) using a rolling load of 4
pipelines where each new set starts before the previous one is stopped:

  kernel                 rounds   already mapped   dma alloc failed   faults
  v7.1                   150/150  163              93                 0
  v7.1 + this patch      150/150  0                0                  0
  v7.1-rc1 + rkvdec
   multicore v2 + fix    150/150  7                7                  0
  ... + this patch       150/150  0                0                  0

dma:dma_map_phys tracing confirms the RCB buffers stay in SRAM
(phys 0xff00xxxx) with IOVAs handed out by dma-iommu; on the
single-core path every map is matched by an unmap (767/767 over 60
rounds). With the IOMMU disabled in DT, dma_map_resource() returns the
SRAM physical address and decoding works. Also tested: SIGKILL
teardown, 6/8/12 concurrent streams, forced dma_map_resource()
failures (RAM fallback), WebKit page reloads with a corrupted stream
(IOMMU restore path), and a 600-round soak on the multicore series.

Tested on v7.1; applies cleanly to media-committers next.

 .../platform/rockchip/rkvdec/rkvdec-rcb.c     | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
index fdcf1f1773..3492b78cc6 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
@@ -9,7 +9,7 @@
 #include "rkvdec.h"
 #include "rkvdec-rcb.h"
 
-#include <linux/iommu.h>
+#include <linux/dma-mapping.h>
 #include <linux/genalloc.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
@@ -44,7 +44,6 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *dev = ctx->dev;
 	struct rkvdec_rcb_config *cfg = ctx->rcb_config;
-	unsigned long virt_addr;
 	int i;
 
 	if (!cfg)
@@ -58,11 +57,10 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
 
 		switch (cfg->rcb_bufs[i].type) {
 		case RKVDEC_ALLOC_SRAM:
-			virt_addr = (unsigned long)cfg->rcb_bufs[i].cpu;
-
-			if (dev->iommu_domain)
-				iommu_unmap(dev->iommu_domain, virt_addr, rcb_size);
-			gen_pool_free(dev->sram_pool, virt_addr, rcb_size);
+			dma_unmap_resource(dev->dev, cfg->rcb_bufs[i].dma, rcb_size,
+					   DMA_BIDIRECTIONAL, 0);
+			gen_pool_free(dev->sram_pool,
+				      (unsigned long)cfg->rcb_bufs[i].cpu, rcb_size);
 			break;
 		case RKVDEC_ALLOC_DMA:
 			dma_free_coherent(dev->dev,
@@ -125,14 +123,14 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 							SZ_4K);
 		}
 
-		/* If an IOMMU is used, map the SRAM address through it */
-		if (cpu && rkvdec->iommu_domain) {
-			unsigned long virt_addr = (unsigned long)cpu;
+		/* Map the SRAM through the DMA API so the IOVA is properly allocated */
+		if (cpu) {
 			phys_addr_t phys_addr = dma;
+			dma_addr_t iova;
 
-			ret = iommu_map(rkvdec->iommu_domain, virt_addr, phys_addr,
-					rcb_size, IOMMU_READ | IOMMU_WRITE, 0);
-			if (ret) {
+			iova = dma_map_resource(ctx->dev->dev, phys_addr, rcb_size,
+						DMA_BIDIRECTIONAL, 0);
+			if (dma_mapping_error(ctx->dev->dev, iova)) {
 				gen_pool_free(ctx->dev->sram_pool,
 					      (unsigned long)cpu,
 					      rcb_size);
@@ -140,11 +138,7 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
 				goto ram_fallback;
 			}
 
-			/*
-			 * The registers will be configured with the virtual
-			 * address so that it goes through the IOMMU
-			 */
-			dma = virt_addr;
+			dma = iova;
 		}
 
 ram_fallback:
-- 
2.51.2


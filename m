Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170A51477A;
	Wed, 16 Sep 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568737; cv=none; b=paiWxzQmHV7HxhSpr7RiX7m0DTSc/BV1qmX6MS2aSqA4aBDNGdx3snZVED3mQwwilRTS/5iBBZmJ5zlcV6tkrkh18mlsfpUR29iYqPtwtQxvPoVpzjdjIVdLRjGTQN6PXKNP6CFAHIdpSAxQEB5N4jHODyPMcur68ocLeDEHb+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568737; c=relaxed/simple;
	bh=Fxe8yW3F1jNzKsru3sFOSL1At3sZumtvqZQlyoS5WYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5hNJkPUZHC0fpz3Tgj44/5kfmtzC4BwSKthqpQTx/5xv8SN5asWJCWMkYYja6dIz1nmTnDSP8lpiZbH7qIxaCWNHQ3nSiW+f/Y2qsfNPixeLBNdnseGigM+9rNbQHrrWD7SebTkhSkl/135o3Gf0LKenJm+7dy8K9Z6I9ErEhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kaeMnSd1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kaeMnSd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568734;
	bh=Fxe8yW3F1jNzKsru3sFOSL1At3sZumtvqZQlyoS5WYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kaeMnSd1+Nle9exhcSlW7s2cTufLBn7oxmmsA9ZcJkgt4L2v9ZZ3gYuOAyACaaV5q
	 72EIlf0O9gclljHKtvi5l+2/o/ElRAM2n03IWfrqInJknfMX/RZsunNa2sTt34PDep
	 A8Uzz0b7UGOtdxkySvSe8YqEAd/5+EAzpYlK22wmq10z9cFOzgfN6Y9P0ujhE50uxx
	 Kg/P8Te0Qyy5vn+dM3VPar6G3TC5jBRmgTJVuRsHuNaCheye/4cjMfadCRslAhO731
	 3UMaO3VR8k2mgpNM9Fh66MICToQpXvM8cg+lcgaRTtOPjrszvWyjv4d9pHTIYzLANM
	 haw8eI7M+/mNQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6356817E047B;
	Wed, 16 Sep 2026 16:25:32 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:27 -0400
Subject: [PATCH 2/4] media: Store v4l2_fh in the vb_queue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-2-900fa45e3e6a@collabora.com>
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

To be able to show the fd in the debug fs, add the v4l2_fh pointer to the
queue so that vb2 allocations can retrieve it.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/common/videobuf2/v4l2-allocator.c       | 16 +++++++++++-----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |  1 +
 include/media/v4l2-allocator.h                        |  2 +-
 include/media/videobuf2-core.h                        |  1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/v4l2-allocator.c b/drivers/media/common/videobuf2/v4l2-allocator.c
index 9dde9d4a342b..935fbbacd667 100644
--- a/drivers/media/common/videobuf2/v4l2-allocator.c
+++ b/drivers/media/common/videobuf2/v4l2-allocator.c
@@ -108,8 +108,8 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_allocator_cleanup);
 
-static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
-			      dma_addr_t dma_addr, const char *name)
+static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size, dma_addr_t dma_addr,
+			      struct v4l2_fh *fh, const char *name)
 {
 	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
 	struct v4l2_allocator_entry *entry;
@@ -125,7 +125,13 @@ static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
 	entry->dma_addr = dma_addr;
 	strscpy(entry->name, name, sizeof(entry->name));
 	get_task_comm(entry->creator, current->group_leader);
-	entry->tgid = current->tgid;
+	if (fh) {
+		entry->fd = fh->fd;
+		entry->tgid = fh->tgid;
+	} else {
+		entry->fd = 0;
+		entry->tgid = current->tgid;
+	}
 
 	mutex_lock(&allocator->lock);
 	list_add(&entry->list, &allocator->list);
@@ -156,12 +162,12 @@ static void v4l2_allocator_remove(struct v4l2_device *v4l2_dev, size_t size, dma
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name)
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name)
 {
 	void *ret = dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
 
 	if (ret && v4l2_dev)
-		v4l2_allocator_add(v4l2_dev, size, *dma_handle, name);
+		v4l2_allocator_add(v4l2_dev, size, *dma_handle, fh, name);
 
 	return ret;
 }
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b6b7ddc96b9c..30e136dd02b7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -205,6 +205,7 @@ static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
 					   &buf->dma_addr,
 					   GFP_KERNEL | q->gfp_flags,
 					   buf->attrs,
+					   q->v4l2_fh,
 					   name);
 	if (!buf->cookie)
 		return -ENOMEM;
diff --git a/include/media/v4l2-allocator.h b/include/media/v4l2-allocator.h
index f3fe0da10321..cdf0569bea0a 100644
--- a/include/media/v4l2-allocator.h
+++ b/include/media/v4l2-allocator.h
@@ -19,7 +19,7 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev);
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name);
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name);
 
 void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			 size_t size, void *cpu_addr,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 83a5aea34f3c..aa47f1c7c9d1 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -604,6 +604,7 @@ struct vb2_queue {
 	unsigned int			io_modes;
 	struct device			*dev;
 	struct v4l2_device		*v4l2_dev;
+	struct v4l2_fh			*v4l2_fh;
 	unsigned long			dma_attrs;
 	unsigned int			bidirectional:1;
 	unsigned int			fileio_read_once:1;

-- 
2.55.0


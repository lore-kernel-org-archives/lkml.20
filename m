Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A33769FC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182816; cv=none; b=QzMJTkpS6fFfFQzfWmIWsxwbnv9SV43dS7iSqo5rUvJ7uH5UKYQK+o0lFAFk6j4396zAlcats8E37AMzwqOYtEuruHrexlGZtKl0o+9+IY7UabLSAEyb1/46Y0vicJQrdhGkOsWwQ5hAamZZMRsYXBP6642QXEOX2rkGHNc8aGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182816; c=relaxed/simple;
	bh=NVcBj19XbbYYddhYV+VVVlQwPifJ42KXYiumrbNv5/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3TNZ33YGZWEgsIsMijjirAn7M8qfA76XEmdzspM3pz6WEB1ZJxFy4kOLIeAJFErtFI9ujz8aIaGEQvtQl6heqQIX7622WECapgdKdJ9bwUkA7PBxWCstg5D4RbD+WHUDpzxzWihDq56JIgz+ajZ1MtexY9i+kaTUhiwDtgXMVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7Mi+PzE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7Mi+PzE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso6598245e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182813; x=1791787613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3p/ksaVF9bUxZ/l44uSSprnNI0BM8HQrDHB2YvnRV0=;
        b=X7Mi+PzEkkrbK+H7IoGNdUygFj2UJcf0B4DioZz0WrJgs3HECd8OuAVY1GLL2TaM/b
         TL/RzW3kacvJTLmOAFxScwgcdYUQ1melwES53Id/vSFBYiFhfZdguR3yJnPMpDDUsoSL
         SzHj2UqhBjW2S385GUehcokZ80Gct/XjyAoonCdWGeqVr/AasqT6x7FZdf4rjob3bVD5
         O5NAA+Nl9hMRl43MN+6lYYE6d4/Vp2/B+Q2xF3y/icmQSbD2D34t/dCPJLas2FX4wQnV
         hZp41tXy1RKoYyGlmBgtx6ZMJ7MKrgduDjtPiBXOHOzOh6PJ5ishgqSmda22m+ZmoBNO
         zv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182813; x=1791787613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G3p/ksaVF9bUxZ/l44uSSprnNI0BM8HQrDHB2YvnRV0=;
        b=JBkvFkYJnlil33lmqBuiDn6aUgkxO4n4j3LIS6fkW4i4SwK+YfQ/3yVcdX08vmYr5e
         7PNvyVZ+BD7yBGWDX1KkNx4sdnfSmAn3fASb2aoQ5py/bqAKe6pGhiKWJqnN6i/MBC1C
         shd7juSbn4TaGWuDYuQ1XJR98GgBhW3o5F8t78PndC9f55D7E519MHkrlE74rqct38ho
         w+zhMvHsaNnoYc4fg642dU7215iamoZo5c/WDgILCXyLcGKXZ5AYS8uuQShTvY0Ja3cM
         0EuDdkMJAkK/D6eygHzOOqrDmzd6eopzljQj5db8PTdCzO1ChnoX3l3CADJjiBvES9e7
         dRrw==
X-Forwarded-Encrypted: i=1; AKwUvByPZpfjtbPD7Mcn95YdN/nPTzERxQ2i4wMkH3ucJiaFBNlmPykKhKpatieCbepsmYRdxPbjQBMwzjpSlcQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m3GBeB9S4JLZ9MUKzUvj2PHThOqLge+Cvh9nmzh+HVpU5Cv/f6
	iMKau0sHrJ4jFAMY0j/l9nhzr71wyCX8gLpPrR9w2XFwlfxjQWLLlYJY
X-Gm-Gg: AYBFou33zyIMEe2+SO1Ek5Mmu/X01D2OcKd0dMSwTexi9Kt4DOaEJzeY7nWvq3WghnZ
	nKxV1vlQzObfGe4k/iBQ1jTMMC82zXkComdkYbvQ/BlMPfEcsIvbY3VffpB90Sld0IggipGjoYs
	I78C81yxgvbIJ33y5WoxZp02WmEVZF0hNOd6CVSvl7fmX+GMM0gF3Pu/THmUPKfVebP/ISafldF
	MkpHKIo9TJWTiT3lsGXyOHreunyh7EG0SbQ3ObrX7Otc3FLXdPAVJMfZ3YaOhrz7oxwK9bgp1GK
	UtSJ0O9WMjIalpKB9Vi/gO2D1d7jaWY8w1ZUJm7VV8CCLfjSSA1EK54sZsZGdKYGR3PqSHf/2gn
	/E4UezEVcd6as9DqsUscY1I8VE+fho9d0uBtujavcVT6kCP1Cpsm5ep00t9uHD1mUObxUq1I3vR
	lZ3QIJKw157tewVsBcZNS7PzIJ7Og+YyHIJ9Heq2hGElcsq+ph2fWYo2jvnavregL3SQnamnQnY
	CG7jL80v1UW1n7V4EzNCp58VGmGi1loTwYJVOnuAGKeJJATxOmzX4vwnacgp/uMP5TQRdHysmVb
	RbqzwiTWDT951sTF+KEd3xqcS+fuUN2EHCg4YzSa26wntmzz098lE40FgEV0SkR5J1nXzZyPbxc
	xlA==
X-Received: by 2002:a05:600c:4e13:b0:4a1:7367:5395 with SMTP id 5b1f17b1804b1-4a173675558mr17104845e9.2.1791182813344;
        Sun, 04 Oct 2026 23:46:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315273615e9.14.2026.10.04.23.46.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:46:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dma-buf: heaps: cma: respect the device's maximum segment size
Date: Mon,  5 Oct 2026 08:46:40 +0200
Message-Id: <20261005064640.7776-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064640.7776-1-kmehltretter@gmail.com>
References: <20261005064640.7776-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cma_heap_attach() merges the physically contiguous buffer into one
scatterlist entry without considering the importing device's maximum
segment size. With DMA_API_DEBUG, importing a buffer larger than that
limit reports, here with atmel-hlcdc:

  DMA-API: atmel-hlcdc-display-controller atmel-hlcdc-dc: mapping sg
  segment longer than device claims to support [len=307200] [max=65536]

Build each attachment table using the importing device's segment limit.
Return -EINVAL if the limit is smaller than PAGE_SIZE because the
page-based allocator cannot honor it.

An importer that needs the whole buffer as one entry has to declare a
segment size that covers it. tegra-vde without an IOMMU domain and
armada did not. Their limits must be raised before this change is
applied.

Reproduced with a custom QEMU model of the SAM9X75 Curiosity. Not
tested on real hardware.

Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
Cc: stable+noautosel@kernel.org # needs the tegra-vde and armada segment size changes first
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 with DMA_API_DEBUG and
    DMABUF_DEBUG, on a custom QEMU model of the SAM9X75 Curiosity
    (ARM926EJ-S, TCG) with an XLCDC model.
    
    vivid captures into three 307200-byte CMA heap buffers, which
    atmel-hlcdc imports and scans out. All 8 frames are shown before and
    after the patch, with 3 DMA-API reports before and none after.
    
    A test importer maps a 256 KiB CMA heap buffer with different
    maximum segment sizes (4 KiB pages):
    
      max segment (bytes)   before         after
      2048                  1 x 256 KiB    attach returns -EINVAL
      4096                  1 x 256 KiB    64 x 4 KiB
      65536                 1 x 256 KiB    4 x 64 KiB
      UINT_MAX              1 x 256 KiB    1 x 256 KiB
    
    The first three cases gave a DMA-API report before the patch and
    none after it.

 drivers/dma-buf/heaps/cma_heap.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 3fb4b946c91a..9d61d14688b8 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -58,16 +58,22 @@ static int cma_heap_attach(struct dma_buf *dmabuf,
 {
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
+	unsigned int max_segment;
 	int ret;
 
+	max_segment = dma_get_max_seg_size(attachment->dev);
+	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
+	if (max_segment < PAGE_SIZE)
+		return -EINVAL;
+
 	a = kzalloc_obj(*a);
 	if (!a)
 		return -ENOMEM;
 
-	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
-					buffer->pagecount, 0,
-					buffer->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(&a->table, buffer->pages,
+						buffer->pagecount, 0,
+						buffer->pagecount << PAGE_SHIFT,
+						max_segment, GFP_KERNEL);
 	if (ret) {
 		kfree(a);
 		return ret;
-- 
2.53.0


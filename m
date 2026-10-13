Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A84F30CF;
	Tue, 13 Oct 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891996; cv=none; b=mKrLKdFIItoxHbdWB77f77yAvW+1+AWXGrA8ggsauJw0HPhbtwvDV80USEW8IN6A1jAJlGyFWUtvm56uPAZBICaBYf8S1PI6J4N/ioUPAW7EB3+NH3Gytk6YDk0FPSO3XYUBVSGqYr5x7ZKISYOLg1ppxTbMoM3K5lwnjFRBu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891996; c=relaxed/simple;
	bh=GaxSTJEKw7NrKNdnrf/rzftLsFSg4CQXyrj8J/GQoLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QEFoS4Rt8pQ+47cmD/7c6S1z/KlIBM3aI+eQFYCr70WvA39JNDGqQSw5B2EBVBSfsx2NQNy12USgRzm1wqElsqZc5VjBg9UqCeCKroNs6DtH6YHMogkdxfCm83hhFWLQC5CDTt/EPaDCsmIZr8f4HkbzQHsPgn8GtZ9gmhgfjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBf5KZ1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBf5KZ1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8038F1F00893;
	Tue, 13 Oct 2026 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891995;
	bh=AyME3jR7BKGEt07ty8V+1z5F5uRyjmv3ys/agNuvJak=;
	h=From:To:Cc:Subject:Date;
	b=oBf5KZ1c8p5kslshibazXIXYaJWMCXDB18z0RZoGLnWIja2RtDgsWi/diPYpiGhgU
	 QAy0oJ2giJIoc1VZK92U9LKttxCdHgisyfu8esfOk93E4Hsdv1WQfelvt7jPf86e/d
	 XwYjXkba8mKOm6PK4VkdC5xB0NG9lZxmtfIG6hL+s5n6jZWPMCnJ509tayXYq7ZriO
	 zZDseqi+1wlBQREF3iqu1eBAHBcSb5puBDRzvAfW9fi6YdjAW64nwbgoWf2UrzZ53a
	 HsHF/38c55xe++N7gwH5sNbLc0U+Q3/Ru5N5Iz6Kl8QvHNey40mEZIILim9B4N4IvF
	 9icEfONSczQlQ==
From: Leon Romanovsky <leon@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ankit Agrawal <ankita@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: Restore the scatterlist entry count before freeing
Date: Tue, 13 Oct 2026 14:46:24 +0300
Message-ID: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261013-dma-buf-fixes-99dd3fd00f48
X-Mailer: b4 0.15-dev-18f8f
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

dma_buf_phys_vec_to_sgt() clears orig_nents to mark the returned table
as DMA-only. Since sg_free_table() uses orig_nents to walk and free the
scatterlist, dma_buf_free_sgt() leaks the allocation on every successful
map/unmap cycle.

Restore orig_nents from nents before freeing the table. The helper
allocates the DMA list directly, so nents retains the allocation count,
including for chained scatterlists.


The reported kmemleak output was:

KMEMLEAK LEAK: 2 driver-related leak(s)
KMEMLEAK LEAK: unreferenced object 0xff11000125ceff00 (size 32):
KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295031027
KMEMLEAK LEAK:   hex dump (first 32 bytes):
KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
KMEMLEAK LEAK:     00 00 01 00 28 38 00 00 00 10 00 00 00 00 00 00  ....(8..........
KMEMLEAK LEAK:   backtrace (crc 4e8077f2):
KMEMLEAK LEAK:     __kmalloc_noprof+0x451/0x8b0
KMEMLEAK LEAK:     __sg_alloc_table+0x2a0/0x4d0
KMEMLEAK LEAK:     sg_alloc_table+0x24/0x170
KMEMLEAK LEAK:     dma_buf_phys_vec_to_sgt+0x84f/0xed0
KMEMLEAK LEAK:     0xffffffffa1ad21a8
KMEMLEAK LEAK:     dma_buf_map_attachment+0x138/0x690
KMEMLEAK LEAK:     ib_umem_dmabuf_map_pages+0x249/0xc90 [ib_core]
KMEMLEAK LEAK:     0xffffffffa138f8d2
KMEMLEAK LEAK:     0xffffffffa1396abe
KMEMLEAK LEAK:     0xffffffffa1331a5f
KMEMLEAK LEAK:     0xffffffffa13320dd
KMEMLEAK LEAK:     0xffffffffa1ad696d
KMEMLEAK LEAK:     0xffffffffa1acecc7
KMEMLEAK LEAK:     0xffffffffa1acfd17
KMEMLEAK LEAK:     __x64_sys_ioctl+0x72c/0x11f0
KMEMLEAK LEAK:     do_syscall_64+0xa1/0x4f0
KMEMLEAK LEAK: unreferenced object 0xff1100016dbf3a80 (size 32):
KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295034705
KMEMLEAK LEAK:   hex dump (first 32 bytes):
KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
KMEMLEAK LEAK:     00 20 10 00 28 38 00 00 00 10 00 00 00 00 00 00  . ..(8..........

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 833be519e1e6..cbdf99cb0e05 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -251,6 +251,8 @@ void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
 				       sg_dma_len(sgl), dir, DMA_ATTR_MMIO);
 	}
 
+	/* Restore the allocation count cleared for the DMA-only table. */
+	sgt->orig_nents = sgt->nents;
 	sg_free_table(sgt);
 	kfree(dma->state);
 	kfree(dma);

---
base-commit: 39d3758108bb0ef9da484062d65288bbe9cada0e
change-id: 20261013-dma-buf-fixes-99dd3fd00f48

Best regards,
--  
Leon Romanovsky <leonro@nvidia.com>


Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3766369203
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182510; cv=none; b=OOJ19r41ZYn9zepp57KLyJhhnrbj/eKRWQ59pgTxuRCeGMv9oOxP47Jd+RuWDFgMNQ/Xh6hFhHTlpwrVmCgR+V3KYrjjXpzEpJcWtC9kIn5969Hqc8FAqWs/E7cQXAV8UboLgBag3hs9lnWbOFYyq90qF/LQ4JYmI79JyumdcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182510; c=relaxed/simple;
	bh=C1s1NOK5capGxkAfXNfN1qEhmcibh/Y6yUVlBOkk+A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lRoxs85gAF2fagdwRqMRpduVkaUuZbFiCJLKpPaWoe2YbdnlM+oul9VlrzjcT+sir/1agY/fp+L3k++6tZXBciNZd1xlX7MsGRoh/iUgonbhwuBC58DkPik3tv/F6IMLt1MRAfc/X1PmwZ81FJADo+BKsDPX6sOlo8zqdbLwdIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kw/UulGx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kw/UulGx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso733318f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182502; x=1791787302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AVlpPfw5UZbso5/hscvA6TJLBv2kCVbh4MVGQA/j1o=;
        b=Kw/UulGxoq5DQk9vdWRhQn9s8NgLkpBCNe1DDx7Ae/IKmN6mXffezEydooUf/1cnM8
         Z1Mu+fhAdbSqSDywEjhr/hP0FgTJTWNncjfAK71/hqZZg4BW00RNtXWzkRKL9bIrX+lH
         Z1mHYxkfIbhoW4BhGmqYIt+HHwXmttgV+iGXCszH25psjlETHn1ECLzom6EhGgcH33wq
         +A8vf6yYnKLdGgeCVJYfrORsSdz+Dk6OVKPVQESnxWdAq6bcCkJ1QljNgI8GJI7qhSa3
         iEHdF5w2rNQHx/CVflAWQrZolbuSMqcs2d/qPL+w2kNdzjB5GhjfWuKMMnQfX24g5Pcb
         go2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182502; x=1791787302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AVlpPfw5UZbso5/hscvA6TJLBv2kCVbh4MVGQA/j1o=;
        b=2v/9y9orM223dYYxbyn/ILGBBiDmUokKZXpSP67NY4IvZ7C+7Oh2Shtq05K5eUhvx0
         F2y348p4zA59LF5kfOn9bil8a2aDoKx0AHCvBEECExlS4UnDN2qQrUg8XH5q7FjK5bh3
         GdwiZuwKSXaBrXm68CSuGsadBHqf7DA4nz1dvcEBawAb40MLYjBtlWnz6gw+BPQby6H1
         uK+0YVp7SZTTtvqvVuZ157ARZvaF0flAL/o1LEAMfufGNZ8kypwlSctNAVC+a2L3hs9y
         Lw+cw7n70q/W7jjnlGDjoS0avU1XsxgR/UzHw3z5wze0LRHOnuDLgZF0CT6oL+qi3sr9
         2DqQ==
X-Forwarded-Encrypted: i=1; AKwUvByM6PN2uTsyGhW71zldvH8bfyFel5DmfdwVN216OSttV/OhSI9QzFWw4LQVotnzsG3kK7JlzwqD+ieK3rk=@vger.kernel.org
X-Gm-Message-State: AFuF++mGnUnLldjfk3hXkKQO2EV17Pvr3YrM4VZh25qOAmzWALj/Kkqz
	fSR8SMKzbBgrSdEFveHD/qjycnfQWPo6CpfhObot9pe3UyEvmztso/by
X-Gm-Gg: AYBFou3WfArFGxpJa0EE2qfaMepSORNj8kDWsJ2kP4MWGp/70QtF7C8LXjy1R5Nzl/X
	zs3VI/jA3m9ZtGhmzbjUUGCrQR9tnFMLqMW7xsB4khSf1o+MTS18uNCE5MGU7uaOmLttVwazLJt
	n/wesdYzbGeKiZjfqttGORUGlYoPhjAj8m75zS+C3k/xEB9uepPqqm/f2CbG3gUTPK06q/cJ4g4
	2D/p22PqadHANux634x5lqLhyjOkUB8VyJNH0RQKWTWvNFRJz9j5H9Xl0zvhJkH4Mq78wr7TDW5
	Rx2bDWis8BvN6euyEYo1vIz5pYSEoiSN3gRH4aioEo7v2/WOKLeM04b34rkwFixnTqNNaBFrL8C
	8o8Hl3sCFPf4cO2KDxt9ffCeS2S/ndvNifjVsmxo4DjS9KrFchqpcvvAnnw7f9JSkovy45Zi59Y
	JtdBvgaRFYMVJ6XkCd0T38j3RqK0NpDqtvUxQQnmxdqu3eMq/Rcw9FIhwccu1XxkZATMUqN/xjp
	8GHoIsgvlhvd6CNORVWjAGfbLOPj+9KGrTh4WfVhTpaoIpKOkKaiF6aoxytrIE0LRQd/I91hAy5
	49VSQ4IEGh8YeL7abOy8bZtEZILPV+B4KYjiNay4GdUQ8XkYewNobjI9T4eChdEmMqDH/zzMhXE
	TcRK9xI6fRgrW
X-Received: by 2002:a05:600c:a013:b0:4a1:69fd:f90a with SMTP id 5b1f17b1804b1-4a169fdfac5mr81732785e9.26.1791182502096;
        Sun, 04 Oct 2026 23:41:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289b62sm1666871f8f.20.2026.10.04.23.41.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:41:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] dma-buf: add a warn-only mode to DMABUF_DEBUG
Date: Mon,  5 Oct 2026 08:41:32 +0200
Message-Id: <20261005064133.7305-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064133.7305-1-kmehltretter@gmail.com>
References: <20261005064133.7305-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMABUF_DEBUG hands importers a copy of the exporter's sg_table without
the struct pages. An importer that uses them then fails, often far from
the cause and without a message that points at it. Where sg_dma_len()
is sg->length, the copy cannot hide the length either.

Add DMABUF_DEBUG_WARN. With it the copy keeps the CPU side of the
exporter's table: page, offset and length of all orig_nents entries,
and the exporter's nents and orig_nents. A table without a CPU side
(orig_nents == 0) stays that way. Every entry of the copy is marked
with a new dma_flags bit, SG_DMA_DMABUF_DEBUG.

sg_page(), sg_nents_for_len() and sg_split() test the bit and print a
rate limited message with a stack trace. sg_page() is mostly reached
through DMA and scatterlist helpers, so the trace is what names the
importer. These CPU-side accesses can continue after the report instead
of failing because the fields were cleared.

The report is not a WARN(). It does not taint the kernel and does not
trigger panic_on_warn.

Reads of sg->offset and sg->length that do not go through these
helpers are not seen. The option adds a test to every sg_page() and
selects NEED_SG_DMA_FLAGS.

Strict mode remains the default and continues to remove the CPU-side
fields.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 with GCC 15.2.0.
    
    Builds, without warnings:
    
    - x86_64 with DMABUF_DEBUG_WARN=y, full build
    - arm64 defconfig with DMABUF_DEBUG_WARN=y: Image, and the msm and
      rockchip DRM drivers
    - ARM926 (SAM9X75) with DMABUF_DEBUG_WARN=y and without
      NEED_SG_DMA_LENGTH, full build
    - ARM926 with DMABUF_DEBUG=n and without NEED_SG_DMA_FLAGS, full build.
      dma-buf.o and lib/scatterlist.o disassemble as on the base commit,
      except for __LINE__ constants.
    - x86_64 with SG_SPLIT, W=1, the objects touched here: with
      DMABUF_DEBUG_WARN=y, with DMABUF_DEBUG=y alone, and with
      DMABUF_DEBUG=n
    
    Runtime, both in QEMU with local device models, not on hardware.
    
    Zynq with an AXI ADC, IIO DMABUF capture into udmabuf buffers,
    NEED_SG_DMA_LENGTH=y. The IIO dmaengine buffer calls sg_nents_for_len()
    on the attachment's table. With DMABUF_DEBUG=y alone the capture fails:
    
      DMABUF_ENQUEUE failed: Device or resource busy
    
    With DMABUF_DEBUG_WARN=y all 16 blocks arrive with the right data, the
    kernel is not tainted, and the log has one report:
    
      DMA-BUF: importer used the CPU side of an exporter's sg_table
      CPU: 0 UID: 0 PID: 48 Comm: iio-dmabuf Not tainted 7.3.0-rc4+ #2 VOLUNTARY
      Hardware name: Xilinx Zynq Platform
      Call trace:
       unwind_backtrace from show_stack+0x10/0x14
       show_stack from dump_stack_lvl+0x54/0x68
       dump_stack_lvl from sg_nents_for_len+0xd8/0xe4
       sg_nents_for_len from iio_dmaengine_buffer_submit_block+0x4c/0x33c
       iio_dmaengine_buffer_submit_block from iio_dma_buffer_submit_block.part.0+0x5c/0x104
       iio_dma_buffer_submit_block.part.0 from iio_dma_buffer_enqueue_dmabuf+0x68/0xa0
       iio_dma_buffer_enqueue_dmabuf from iio_buffer_chrdev_ioctl+0x520/0x9a4
       iio_buffer_chrdev_ioctl from sys_ioctl+0x460/0x914
       sys_ioctl from ret_fast_syscall+0x0/0x4c
    
    x86_64 with intel-iommu, xHCI and a SUR40, capture into udmabuf
    buffers. This kernel had a one-line test-only change in sur40 that
    makes the vb2 queue use the USB controller's DMA device. There was no
    report during boot. The capture gives one, from sg_page() in
    iommu_dma_map_sg():
    
      DMA-BUF: importer used the CPU side of an exporter's sg_table
      CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 7.3.0-rc4+ #5 PREEMPT(lazy)
      Workqueue: events_freezable input_dev_poller_work
      Call Trace:
       <TASK>
       dump_stack_lvl+0x4d/0x70
       iommu_dma_map_sg+0x4c0/0x1010
       __dma_map_sg_attrs+0x254/0x3b0
       dma_map_sg_attrs+0xe/0x20
       usb_hcd_map_urb_for_dma+0x7e0/0x1620
       usb_hcd_submit_urb+0x162/0x1af0
       usb_sg_wait+0x17c/0x550
       sur40_poll+0xb3e/0xff0
       input_dev_poller_work+0x54/0x90
       process_one_work+0x692/0xf90
       [...]
    
    The capture did not finish in this setup. The guest stalled in
    xhci_queue_bulk_tx() after the report, so this run only shows the
    report.
    
    The SG_DMA_* defines move up in scatterlist.h because sg_page() needs
    the new one.

 drivers/dma-buf/Kconfig     | 23 +++++++++++++++++++
 drivers/dma-buf/dma-buf.c   | 44 ++++++++++++++++++++++++++++++++++++-
 include/linux/scatterlist.h | 26 +++++++++++++++++++---
 lib/scatterlist.c           | 22 +++++++++++++++++++
 lib/sg_split.c              |  2 ++
 5 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4f078a326a4..06177465091a 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -49,6 +49,29 @@ config DMABUF_DEBUG
 	  exporters. Specifically it validates that importers do not peek at the
 	  underlying struct page when they import a buffer.
 
+config DMABUF_DEBUG_WARN
+	bool "Warn instead of hiding the pages from DMA-BUF importers"
+	depends on DMABUF_DEBUG
+	select NEED_SG_DMA_FLAGS
+	help
+	  DMABUF_DEBUG normally hands importers a copy of the exporter's
+	  sg_table without the struct page pointers, so that an importer which
+	  uses them fails early.
+
+	  With this option the copy keeps the pages, offsets and lengths and is
+	  only marked. sg_page() and the helpers built on it, sg_nents_for_len()
+	  and sg_split() then print a rate limited message with a stack trace
+	  when they are used on such a table. The access itself continues
+	  instead of failing because the fields were cleared. The message is
+	  not a WARN(): it does not taint the kernel or trigger panic_on_warn.
+
+	  Importers that read sg->offset or sg->length directly are not
+	  noticed. The option adds a test to every sg_page() call. It selects
+	  NEED_SG_DMA_FLAGS, which adds dma_flags and may increase the size of
+	  struct scatterlist.
+
+	  If unsure, say N.
+
 config DMABUF_KUNIT_TEST
 	tristate "KUnit tests for DMA-BUF" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b3d311acb883..bd82b6b7f5ff 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -57,6 +57,7 @@
 struct dma_buf_sg_table_wrapper {
 	struct sg_table *original;
 	struct sg_table wrapper;
+	unsigned int alloc_nents;
 };
 
 static inline int is_dma_buf_file(struct file *);
@@ -874,11 +875,42 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
+#ifdef CONFIG_DMABUF_DEBUG_WARN
+/*
+ * Warn mode: the importer also gets the CPU side of the exporter's table,
+ * marked so that sg_page() and friends can report who uses it.
+ */
+static void dma_buf_wrap_cpu_side(struct sg_table *to, struct sg_table *from)
+{
+	struct scatterlist *to_sg, *from_sg;
+	int i;
+
+	for_each_sgtable_sg(to, to_sg, i)
+		to_sg->dma_flags |= SG_DMA_DMABUF_DEBUG;
+
+	to_sg = to->sgl;
+	for_each_sgtable_sg(from, from_sg, i) {
+		sg_assign_page(to_sg, sg_page(from_sg));
+		to_sg->offset = from_sg->offset;
+		to_sg->length = from_sg->length;
+		to_sg = sg_next(to_sg);
+	}
+
+	to->nents = from->nents;
+	to->orig_nents = from->orig_nents;
+}
+#else
+static void dma_buf_wrap_cpu_side(struct sg_table *to, struct sg_table *from)
+{
+}
+#endif
+
 static int dma_buf_wrap_sg_table(struct sg_table **sg_table)
 {
 	struct scatterlist *to_sg, *from_sg;
 	struct sg_table *from = *sg_table;
 	struct dma_buf_sg_table_wrapper *to;
+	unsigned int nents = from->nents;
 	int i, ret;
 
 	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
@@ -888,14 +920,21 @@ static int dma_buf_wrap_sg_table(struct sg_table **sg_table)
 	 * To catch abuse of the underlying struct page by importers copy the
 	 * sg_table without copying the page_link and give only the copy back to
 	 * the importer.
+	 *
+	 * With DMABUF_DEBUG_WARN the copy keeps the CPU side, which can have
+	 * more entries than the DMA side.
 	 */
 	to = kzalloc_obj(*to);
 	if (!to)
 		return -ENOMEM;
 
-	ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
+	if (IS_ENABLED(CONFIG_DMABUF_DEBUG_WARN))
+		nents = max(nents, from->orig_nents);
+
+	ret = sg_alloc_table(&to->wrapper, nents, GFP_KERNEL);
 	if (ret)
 		goto free_to;
+	to->alloc_nents = nents;
 
 	to_sg = to->wrapper.sgl;
 	for_each_sgtable_dma_sg(from, from_sg, i) {
@@ -910,6 +949,7 @@ static int dma_buf_wrap_sg_table(struct sg_table **sg_table)
 #endif
 		to_sg = sg_next(to_sg);
 	}
+	dma_buf_wrap_cpu_side(&to->wrapper, from);
 
 	to->original = from;
 	*sg_table = &to->wrapper;
@@ -929,6 +969,8 @@ static void dma_buf_unwrap_sg_table(struct sg_table **sg_table)
 
 	copy = container_of(*sg_table, typeof(*copy), wrapper);
 	*sg_table = copy->original;
+	/* sg_free_table() needs the number of allocated entries */
+	copy->wrapper.orig_nents = copy->alloc_nents;
 	sg_free_table(&copy->wrapper);
 	kfree(copy);
 }
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 6de1a2434299..5dc8c134ca4c 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -21,6 +21,13 @@ struct scatterlist {
 #endif
 };
 
+/* Bits in dma_flags, see below. sg_page() needs SG_DMA_DMABUF_DEBUG. */
+#ifdef CONFIG_NEED_SG_DMA_FLAGS
+#define SG_DMA_BUS_ADDRESS	(1 << 0)
+#define SG_DMA_SWIOTLB		(1 << 1)
+#define SG_DMA_DMABUF_DEBUG	(1 << 2)
+#endif
+
 /*
  * These macros should be used after a dma_map_sg call has been done
  * to get bus addresses of each of the SG entries and their lengths.
@@ -188,11 +195,27 @@ static inline void sg_set_folio(struct scatterlist *sg, struct folio *folio,
 	sg->length = len;
 }
 
+#ifdef CONFIG_DMABUF_DEBUG_WARN
+void sg_dmabuf_cpu_access_warn(void);
+
+/* Report use of the CPU side of a table that a DMA-BUF importer was given */
+static inline void sg_dmabuf_cpu_access_check(struct scatterlist *sg)
+{
+	if (unlikely(sg->dma_flags & SG_DMA_DMABUF_DEBUG))
+		sg_dmabuf_cpu_access_warn();
+}
+#else
+static inline void sg_dmabuf_cpu_access_check(struct scatterlist *sg)
+{
+}
+#endif
+
 static inline struct page *sg_page(struct scatterlist *sg)
 {
 #ifdef CONFIG_DEBUG_SG
 	BUG_ON(sg_is_chain(sg));
 #endif
+	sg_dmabuf_cpu_access_check(sg);
 	return (struct page *)((sg)->page_link & ~SG_PAGE_LINK_MASK);
 }
 
@@ -303,9 +326,6 @@ static inline void sg_unmark_end(struct scatterlist *sg)
  */
 #ifdef CONFIG_NEED_SG_DMA_FLAGS
 
-#define SG_DMA_BUS_ADDRESS	(1 << 0)
-#define SG_DMA_SWIOTLB		(1 << 1)
-
 /**
  * sg_dma_is_bus_address - Return whether a given segment was marked
  *			   as a bus address
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 6ea40d2e6247..55a3697df881 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -12,6 +12,27 @@
 #include <linux/bvec.h>
 #include <linux/uio.h>
 #include <linux/folio_queue.h>
+#include <linux/printk.h>
+#include <linux/ratelimit.h>
+
+#ifdef CONFIG_DMABUF_DEBUG_WARN
+/*
+ * Not a WARN(): a wrong importer must not taint the kernel or trigger
+ * panic_on_warn. sg_page() is mostly reached through DMA or scatterlist
+ * helpers, so the stack trace is what identifies the importer.
+ */
+void sg_dmabuf_cpu_access_warn(void)
+{
+	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL, 1);
+
+	if (!__ratelimit(&rs))
+		return;
+
+	pr_warn("DMA-BUF: importer used the CPU side of an exporter's sg_table\n");
+	dump_stack_lvl(KERN_WARNING);
+}
+EXPORT_SYMBOL(sg_dmabuf_cpu_access_warn);
+#endif
 
 /**
  * sg_nents - return total count of entries in scatterlist
@@ -54,6 +75,7 @@ int sg_nents_for_len(struct scatterlist *sg, u64 len)
 		return 0;
 
 	for (nents = 0, total = 0; sg; sg = sg_next(sg)) {
+		sg_dmabuf_cpu_access_check(sg);
 		nents++;
 		total += sg->length;
 		if (total >= len)
diff --git a/lib/sg_split.c b/lib/sg_split.c
index 24e8f5e48e63..cbbc7f9a206d 100644
--- a/lib/sg_split.c
+++ b/lib/sg_split.c
@@ -33,6 +33,8 @@ static int sg_calculate_split(struct scatterlist *in, int nents, int nb_splits,
 	}
 
 	for_each_sg(in, sg, nents, i) {
+		if (!mapped)
+			sg_dmabuf_cpu_access_check(sg);
 		sglen = mapped ? sg_dma_len(sg) : sg->length;
 		if (skip > sglen) {
 			skip -= sglen;
-- 
2.53.0


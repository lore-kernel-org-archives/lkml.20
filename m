Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EFF366042
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182503; cv=none; b=IpEc+UcuQ0FasS0TF6LZItSnqTKSkqIMR3p47ukByivpaeX5OPl4xPLOUmOkyn46UJLu1hoDwROJatwR4lDtObQaRXQcttQO60zJNmhoff4GrDyBnw84pzRk7YnFT+iXughHueyhdC17cnnXKKn4ccNE19u6qVzpJmS5irQyqCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182503; c=relaxed/simple;
	bh=yCkXo4sSj6S2ElefNk4UC31+4JoEn9L05JKIXoGqVks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pGnBME5WLm6Jd9brLG/YRHnGVq7jkAcxWwKDxNrJfNxYqcTiW7E6fJImeAYWRjCv8wRgSOv91uEjdM1DFj5QX/LA/NZhwG/vinPhGpJpWNrAD6ZTDXP5gx1MRYdTNwphvURbIhYRZGliInx4cmHB4ki78v009II3swphRPk1qmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpefHT+v; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpefHT+v"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b03f23305so1185972f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182500; x=1791787300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EGFppMfswXU/fV+uWCD2+0j1OKAXO1MerJRCo45qjU=;
        b=gpefHT+v+PuWiM2I9C7k22I8aLGVqVvXcYDdoa/DNkxz4fm2nZ2R04FQkr/+o0/R8r
         SvjRKyHS5vQzGUbOr6O1Ug/h/QSIeVvQWgEzdjHg+c/sp45bzhWKutA6nMLTsRp1tY0I
         KXh43CeNes6fqNt7imQRYOh0lCV9QD9hVwq9TyZNlTzG6Ixc016GJuMmz05nZvf4+Bwe
         n6/DYoED59QpRv7shl9ICdeUYkMU8ZyslGwBAdJdt9eDI99zkzAKJdby85alA5oXqN1G
         6TfxcpsbsyeP+jtsvrxaYhzZ34VrN41pyDIEHg7MT0MrYVAMUH82gI/sVDPaUjad4AgO
         Thug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182500; x=1791787300;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EGFppMfswXU/fV+uWCD2+0j1OKAXO1MerJRCo45qjU=;
        b=vBPJA1qya8byvM78Ye3mdndl4qMcZ+6lKFIL5H8qY2a6M5uctokGfT29jIMk909Cx4
         oge9N03QOeEzXamURvQjywLcrXyZ5Fd4/YPFI5AKaZ5Q8+0ffjgjGmDaPZ5+cOrKzKyt
         a9hKyBiXo9KybZ4y+7vTqe/+Tvs2gMLK89bj3ckOU06/s66v0J76Axz3Xg46AV1A/k3T
         tBq5GhxsawN+7BJXGh7ACOYj45smC05BDcdPzWDT1xky9pBtHwElT1iT15CZ0VPHCKPA
         ouP5XyuuaY3XGSNo4P+bTxsGMAECbA7VVN8NdNwVElPIGDg22mWIPon3jMBnrYvAdObY
         xa7g==
X-Forwarded-Encrypted: i=1; AKwUvBx9junMiWYCaH7l5bniStHl0LKbcvUULDb6vGBaShi9a+8rd9jCgITN8DjkgYTR+wI+vpsRpPGVsOyvwcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsmuOGqpQcW17YE2u7M4Qm8KvbwO3MvWCbOgwWx+xyZOte6x+Y
	YddFTqiFErx38xguA8+A0mvJcjRR/+mZU2lzpCzhY4+OiryYdzg+qEtv
X-Gm-Gg: AYBFou21JwcMUyR0sAtL8jahsvkKuUaMGhS624DOv0F2WeBGpKxMpN8WycOV0wYwlVW
	94m3PH4X0F9CtE4KFWLYh07KDcqmLIgCVLoCxPyuL4jqHMKjxUeQSBWv4iDTKp9WDOYEIQlYChB
	LJoMXGNVm2QShlCjtr3yyO+uFVEOzjU7eQyH2+trOz2UF2ztlYfzG7cnSHQArgLdEI2UpG4GYQf
	rFcThsnwaUsqytCN4Hrkbpogm4ejXbUTpLgxN+M+cAaopodqoHqDFkNgm+BfYCGI5chv/QROv1y
	XXfd+xhM4/Rzif1yr0AvB/HUfbvtcxB8Yt/6Yautwrb6Ms6jrI2hB8DyyRy+ati7mh52QW+9beR
	zsXqGThlZfErPeWuZqpQj7DdR279mQCuGcL2jBp+rpk6xfId0oI+Mc5IJDygmn4XhyA40EtHh/f
	KrUU3Hoq8eqYlepimae0Td28K+J+i2C+n1eDb7CyBs7T7cZ1PgJM7gqGFEyZNuOgvHGj9cEZhtw
	nNKVrZXM9PIhckO1zRs/JjkdGj0jMfdH1Sv7acuajFRqz3aO/zVqcQHNxZQfyfbfESfkFu/OeA1
	IHuqb3oAcDxlt3f4sJgoyh+FgE9Od0WZ9++FBz4LNZl62ydRe4wOW/z8ea9mO+p0OX5GviugIQn
	uyac=
X-Received: by 2002:a05:6000:24c6:b0:48a:f5cb:4356 with SMTP id ffacd0b85a97d-48c4801ac46mr10819804f8f.45.1791182499704;
        Sun, 04 Oct 2026 23:41:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62289b62sm1666871f8f.20.2026.10.04.23.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:41:39 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
Date: Mon,  5 Oct 2026 08:41:30 +0200
Message-Id: <20261005064133.7305-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With DMABUF_DEBUG, dma_buf_map_attachment() gives the importer a copy of
the exporter's sg_table without the struct pages and offsets, and
without the lengths where sg_dma_len() is a separate field. An importer
that uses those fields stops working. That is the point of the option,
but the failure usually shows up somewhere else and says nothing about
the cause.

Commit 143755bdabaa9 ("dma-buf: Make DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels"), which I wrote, went into v7.3-rc4. It made the
default from commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by
default on DEBUG kernels") take effect, and distribution configs
usually have DEBUG_KERNEL=y. Two reports followed:

- Jianfeng Liu: hardware video decode with drm/msm ends in GPU
  translation faults [1]. He then sent a revert [2].

- Diederik de Haas: rockchip fails to import buffers when playing
  video, on a config based on Debian's [3].

In [2] Rob Clark said the problem goes beyond msm and cannot be fixed
quickly, and Christian König offered to set the default to N for
another few months [4]. I listed more importers that look affected and
mentioned this RFC in [5]. As of v7.3-rc6 the default is unchanged.

This series adds DMABUF_DEBUG_WARN as a sub-option of DMABUF_DEBUG. The
importer still gets a copy, but one that keeps the CPU side of the
exporter's table. The entries are marked with a new bit in dma_flags.
sg_page(), sg_nents_for_len() and sg_split() print a rate limited
message with a stack trace when they see the bit. These CPU-side
accesses can continue after the report instead of failing because the
fields were cleared. The report is not a WARN(), so it does not taint
and does not trigger panic_on_warn. Strict mode remains the default and
continues to remove the CPU-side fields.

Known limits:

- Only access through sg_page(), sg_nents_for_len() and sg_split() is
  seen. sg_page() covers sg_phys(), sg_virt() and the page iterators.
  An importer that reads sg->length or sg->offset directly is not
  noticed.

- When the option is enabled, every sg_page() tests the flag.

- It selects NEED_SG_DMA_FLAGS, which adds dma_flags and may increase
  the size of struct scatterlist. It also relies on dma_flags being
  initialised, as the DMA mapping code already does.

- It finds importers. It does not fix them.

Question for the maintainers: could warn mode be what DEBUG_KERNEL
kernels get by default, with strict mode kept for CI? Or is an opt-in
sub-option all that is wanted, if anything? The series does not change
any default.

Testing, on the commits as posted:

- KUnit, the dma-buf suites, under UML and on x86_64 in QEMU, in strict
  and in warn mode: 56 passed, 1 skipped (it needs 2 CPUs) each time.

- Builds: x86_64, arm64 and ARM926 with DMABUF_DEBUG_WARN=y, ARM926
  without DMABUF_DEBUG. Without DMABUF_DEBUG the generated code of
  dma-buf.o and lib/scatterlist.o is the same as before, except for
  line numbers.

- IIO DMABUF capture on a Zynq in QEMU, with local device models. The
  IIO dmaengine buffer calls sg_nents_for_len() on the attachment's
  table. In strict mode with NEED_SG_DMA_LENGTH the capture fails with
  -EBUSY. In warn mode it works, the kernel is not tainted, and the log
  has:

  DMA-BUF: importer used the CPU side of an exporter's sg_table
  CPU: 0 UID: 0 PID: 48 Comm: iio-dmabuf Not tainted 7.3.0-rc4+ #2 VOLUNTARY
  Call trace:
   [...]
   dump_stack_lvl from sg_nents_for_len+0xd8/0xe4
   sg_nents_for_len from iio_dmaengine_buffer_submit_block+0x4c/0x33c
   iio_dmaengine_buffer_submit_block from iio_dma_buffer_submit_block.part.0+0x5c/0x104
   iio_dma_buffer_submit_block.part.0 from iio_dma_buffer_enqueue_dmabuf+0x68/0xa0
   iio_dma_buffer_enqueue_dmabuf from iio_buffer_chrdev_ioctl+0x520/0x9a4
   iio_buffer_chrdev_ioctl from sys_ioctl+0x460/0x914

- sur40 behind xHCI and intel-iommu on x86_64 in QEMU, with a one-line
  test-only change in sur40. Here sg_page() is called in
  iommu_dma_map_sg(), and the trace leads back to sur40_poll(). The
  capture itself did not finish in that setup.

Details are in the notes on the patches. Not tested on hardware.

Based on v7.3-rc4-70-gfe2ec83746e5.

An LLM agent helped with the code and the testing.

[1] https://lore.kernel.org/r/20260923074256.9357-1-liujianfeng1994@gmail.com
[2] https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com
[3] https://lists.freedesktop.org/archives/dri-devel/2026-September/600904.html
[4] https://lore.kernel.org/r/50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com
[5] https://lore.kernel.org/r/arrAvk4aYQ4sDEzN@gmail.com

Karl Mehltretter (3):
  dma-buf: keep the DMA flags in the DMABUF_DEBUG copy
  dma-buf: add a warn-only mode to DMABUF_DEBUG
  dma-buf: test the debug scatterlist wrapper

 drivers/dma-buf/.kunitconfig |   1 +
 drivers/dma-buf/Kconfig      |  23 ++++
 drivers/dma-buf/Makefile     |   1 +
 drivers/dma-buf/dma-buf.c    |  48 ++++++-
 drivers/dma-buf/st-dma-buf.c | 253 +++++++++++++++++++++++++++++++++++
 include/linux/scatterlist.h  |  26 +++-
 lib/scatterlist.c            |  22 +++
 lib/sg_split.c               |   2 +
 8 files changed, 372 insertions(+), 4 deletions(-)
 create mode 100644 drivers/dma-buf/st-dma-buf.c


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0


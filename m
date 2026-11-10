Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328026;
	b=B6GraDt6AmNfMMG16DsDJ/EklVVm+IXtFl9WTvSFYPMGeJMKkI+fJuOyTYkD3+cST/Vn
	 cAm/GbQ0tThcdWp2bhk+pvcg/m8QnRfYQ5Ns93y2R23pwo0W1vLuV9Gedt1SwTaVTeV88
	 kuhRCZC9k2iOBVxU1z2T8kUdq4YFej9x1t9z3sD0u1xNcfPNCnf0Af/pgxSOWITrCCNci
	 Jgadq87HBV+fskUsySSy6E8kUgZ+60++zThJFyfWKCc3ghXUg/FQ35it4JMXBBfT0uEJa
	 +XFQCWO5TWAnuOk/RKkCwNTyeRIIV/nbMsqRHqKPOUZNLR9ISKm+L+FfPb5wwkMmtrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DvKoQYUA8YO38iyCS/TR64Li3qrQPpI5xw5GMTAlH4I=;
	b=ogUyKPxh6d6f8fLPce3lGEj7pSyFI2fpue7UwiP7NKQhlu0XX0o7h4fVy/GNwu+/wmSv
	 Ucq2r+pN+qvC+AiT8Z82lISY/jhZVrk0WESKWmTGshz7+JkJ0AbQmdF2Oc/SlQjBYU6g5
	 NFnsIJDwj/x5iF9zQaTVLtsdWsfD+SRSkJyILuOQIeVxfJlVwKYRbfe/p8I/I5AlYo3Tb
	 doZpuZJNZABKRT+yHjC/eJOF0K4QR1xEHoeJJWzr1IO6m/Il9RicsVTKDduKqR8Kuksyx
	 vs6I0MCYv8/3derXDxZWMkdL6oXZ+ShIE67kuLnWkp2pSxDbiTdAOXc3p1UHcTQ00YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=p9snvHMl;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E860A2624
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2E860A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=p9snvHMl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so24098005e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794328024; x=1794932824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DvKoQYUA8YO38iyCS/TR64Li3qrQPpI5xw5GMTAlH4I=;
        b=p9snvHMlVNctiVz7qu16zuRg0wiYC3x3UR2XGC+JJo1+dzOJjCleN48NgbTnak9cAN
         6zlfkyqlLIegdmbpV+R9tqh70Riga3eNmiMixFULhO3NArZQsuQuu+OMdQiYPZrSb2Or
         d28+XILJxXXnEy/jEstb7BPVWo4mpq0zBcOyHFuAR2v4HvlCjqBtxV5WzQuGa3+T8IZp
         MPd7hFzsDQcXgHvnb6OZXp9Z70s3RWyZUVClUaM1XVtAwAh4gi81vp9gwz4GHzjjzT4f
         IAeBokyek402yfMhq1HQQWJE7SztIMbGddPBclcHdbLQFbSSI36I7Io6DAIgP+YovY1G
         CbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328024; x=1794932824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvKoQYUA8YO38iyCS/TR64Li3qrQPpI5xw5GMTAlH4I=;
        b=r4zFh9SvGambOJeCAIt1mD7d5Q29C4ghSrbu2QTFbhARqKlRIBhiE1IY8dZYpu+rkV
         8awDA1OEM/N5ICaNVBRCojNAvRssOcERhZLT+DIKLLw62zM1Szp/4+wLq4USNzcs89Xb
         vefFs+XHZudr/rGRB1DentvfmK/WQsBLVzikTQT4i732LhM70ZgSQPYuJKgmj1e3NGhV
         LKanJfogWmuQrbn2gQJBwrJSdjBM7cJFHF3TMYBwGfyqQBYc1Pcwi7onGcxi1CyZ1oQA
         SM9+I4Fcp/O/rmDAvRAPOESd7Es13gWe+x73GOmLcdPrjLV0NSg8H7aBPpRRU3eisRMA
         EKiA==
X-Forwarded-Encrypted: i=1; AL+hErHBQjDEjcxgM4FlAvdtI+CCygY8zwcJ/D5r4W8SIosKBasHye+OP0spyaFU0bd023ZBiObgriTbPmvZZLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vGRlxbpy+zSn68H0PJ9wPdZ4I3ih2iRVAV2Px9GFCu/SZJnHq
	1p6LKnoRuZbl0pJF1noLymEpojgO7MRJwV7C7ox11L+9QQGpMDMAKwOsBwOGmWQwaIk=
X-Gm-Gg: AYBFou3DgXhXR4EIM/TeEa5e7cVbZzxADdv7RsdEIykoPaSOAU2qFx5mib3Rg3oym5w
	uPs2D9VcMDh0WGMPY9vH4obvhIKhUfO5VMtMnjYUxN55t0HwKVBK73icPTKljPo82c44abiqslX
	/mNNTwP9h47Lo/FqsbCMhYTf0lhS4kAu8Ew1bGOKB4f5O31OkJO01W5m47+sIELVWiRweHld5LB
	aoUAg+RmibasXWJaiE6rm2gWfNT9/bZMt5MAj+ywY6Zmq719KVOQE4Aus4ZyuleFmRMMsMA86//
	YX0qpMdjwfr5pzTOh8+6YIlpa7YFaGAMMlfSEp/iwUOgoDF2PvswgmAZ29XLhFd5zPiB6fZaTQX
	Ril0QLEjQbt++92xdqt0qnRRpyk3IMR0yj2ZHxSSBxSBTWC5bfMiOp5ZTb1hLSvsOrC95HxODSW
	p82IWIqLeQAYrDoJAdFCHLtRAJShKVM7UkzqI3PsmpQOEPujtu0mEFQZlC7Zr4bM/VJYPpqolLU
	3OfqVM+Fi3boKpuAXJ68tLiZ+O4LBCtO7+GhSzSeKuCCPcs451VUEHJaZJdn81tvJCKc7G9IKbx
	fLWk/hx3TD+SAbvUJfaVDIf65oHP9pJMluxpNhdhL3iMFHafaUcn8udt2UgALGFzFZ2UQKjHDA=
	=
X-Received: by 2002:a05:600c:4f48:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba0234bc33mr62121105e9.24.1794328024456;
        Tue, 10 Nov 2026 08:27:04 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm85050695e9.1.2026.11.10.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:27:03 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	nvdimm@lists.linux.dev
Subject: [PATCH v3 06/20] drbd: add DAX/PMEM support for metadata access
Date: Tue, 10 Nov 2026 17:26:31 +0100
Message-ID: <20261110162646.3028472-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
References: <20261110162646.3028472-1-christoph.boehmwalder@linbit.com>
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

When DRBD's metadata device resides on persistent memory (PMEM/NVDIMM),
accessing it by reading and writing full blocks is unnecessarily
costly.
Add a DAX-based metadata path that directly maps the metadata region,
enabling byte-granular, IRQ-safe access without having to go through
the block layer.

The PMEM path also introduces a more efficient activity log layout:
instead of writing journal transactions, the in-memory LRU-cache hash
table is stored directly in persistent memory and updated in-place.
Similarly, the resync bitmap is accessed directly from PMEM rather than
being loaded into and flushed from DRAM.

This is compiled in only when CONFIG_DEV_DAX_PMEM is enabled.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Makefile        |   1 +
 drivers/block/drbd/drbd_dax_pmem.c | 175 +++++++++++++++++++++++++++++
 drivers/block/drbd/drbd_dax_pmem.h |  43 +++++++
 3 files changed, 219 insertions(+)
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.c
 create mode 100644 drivers/block/drbd/drbd_dax_pmem.h

diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 9f05f74e619c..8ec1ad360449 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -5,6 +5,7 @@ drbd-y += drbd_main.o drbd_strings.o drbd_nl.o
 drbd-y += drbd_interval.o drbd_state.o
 drbd-y += drbd_nl_gen.o
 drbd-y += drbd_transport.o
+drbd-$(CONFIG_DEV_DAX_PMEM) += drbd_dax_pmem.o
 drbd-$(CONFIG_DEBUG_FS) += drbd_debugfs.o
 
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
diff --git a/drivers/block/drbd/drbd_dax_pmem.c b/drivers/block/drbd/drbd_dax_pmem.c
new file mode 100644
index 000000000000..1fb22e57cf5d
--- /dev/null
+++ b/drivers/block/drbd/drbd_dax_pmem.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017, LINBIT HA-Solutions GmbH.
+ */
+
+/*
+ * In case DRBD's meta-data resides in persistent memory do a few things
+ * different.
+ *
+ * 1 direct access the bitmap in place. Do not load it into DRAM, do not
+ *   write it back from DRAM.
+ * 2 Use a better fitting format for the on-disk activity log. Instead of
+ *   writing transactions, the unmangled LRU-cache hash table is there.
+ */
+
+#include <linux/vmalloc.h>
+#include <linux/slab.h>
+#include <linux/dax.h>
+#include <linux/libnvdimm.h>
+#include <linux/blkdev.h>
+#include <linux/sizes.h>
+#include "drbd_int.h"
+#include "drbd_dax_pmem.h"
+#include "drbd_meta_data.h"
+
+/*
+ * Unit conversions for addressing the metadata area through DAX.
+ * DRBD keeps metadata offsets in sectors, dax_direct_access() works in pages.
+ */
+static pgoff_t md_sector_to_pgoff(sector_t sector)
+{
+	return sector >> (PAGE_SHIFT - SECTOR_SHIFT);
+}
+
+static long md_sectors_to_pages(sector_t nr_sectors)
+{
+	return nr_sectors >> (PAGE_SHIFT - SECTOR_SHIFT);
+}
+
+/* Signed, since the bitmap offset relative to the superblock may be negative. */
+static long md_sector_offset_to_bytes(long sector_offset)
+{
+	return sector_offset * SECTOR_SIZE;
+}
+
+static int map_superblock_for_dax(struct drbd_backing_dev *bdev, struct dax_device *dax_dev)
+{
+	long want = 1;
+	pgoff_t pgoff = md_sector_to_pgoff(bdev->md.md_offset);
+	void *kaddr;
+	long len;
+	int id;
+
+	id = dax_read_lock();
+	len = dax_direct_access(dax_dev, pgoff, want, DAX_ACCESS, &kaddr, NULL);
+	dax_read_unlock(id);
+
+	if (len < want)
+		return -EIO;
+
+	bdev->md_on_pmem = kaddr;
+
+	return 0;
+}
+
+/**
+ * drbd_dax_open() - Open device for dax and map metadata superblock
+ * @bdev: backing device to be opened
+ */
+int drbd_dax_open(struct drbd_backing_dev *bdev)
+{
+	struct dax_device *dax_dev;
+	int err;
+	u64 part_off;
+
+	dax_dev = fs_dax_get_by_bdev(bdev->md_bdev, &part_off, NULL, NULL);
+	if (!dax_dev)
+		return -ENODEV;
+
+	err = map_superblock_for_dax(bdev, dax_dev);
+	if (!err)
+		bdev->dax_dev = dax_dev;
+	else
+		put_dax(dax_dev);
+
+	return err;
+}
+
+void drbd_dax_close(struct drbd_backing_dev *bdev)
+{
+	put_dax(bdev->dax_dev);
+}
+
+/**
+ * drbd_dax_map() - Map metadata for dax
+ * @bdev: backing device whose metadata is to be mapped
+ */
+int drbd_dax_map(struct drbd_backing_dev *bdev)
+{
+	struct dax_device *dax_dev = bdev->dax_dev;
+	sector_t first_sector = drbd_md_first_sector(bdev);
+	sector_t al_sector = bdev->md.md_offset + bdev->md.al_offset;
+	long want = md_sectors_to_pages(drbd_md_last_sector(bdev) + 1 - first_sector);
+	pgoff_t pgoff = md_sector_to_pgoff(first_sector);
+	long md_offset_byte = md_sector_offset_to_bytes(bdev->md.md_offset - first_sector);
+	long al_offset_byte = md_sector_offset_to_bytes(al_sector - first_sector);
+	void *kaddr;
+	long len;
+	int id;
+
+	id = dax_read_lock();
+	len = dax_direct_access(dax_dev, pgoff, want, DAX_ACCESS, &kaddr, NULL);
+	dax_read_unlock(id);
+
+	if (len < want)
+		return -EIO;
+
+	bdev->md_on_pmem = kaddr + md_offset_byte;
+	bdev->al_on_pmem = kaddr + al_offset_byte;
+
+	return 0;
+}
+
+void drbd_dax_al_update(struct drbd_device *device, struct lc_element *al_ext)
+{
+	struct al_on_pmem *al_on_pmem = device->ldev->al_on_pmem;
+	__be32 *slot = &al_on_pmem->slots[al_ext->lc_index];
+
+	*slot = cpu_to_be32(al_ext->lc_new_number);
+	arch_wb_cache_pmem(slot, sizeof(*slot));
+}
+
+void drbd_dax_al_begin_io_commit(struct drbd_device *device)
+{
+	struct lc_element *e;
+
+	spin_lock_irq(&device->al_lock);
+
+	list_for_each_entry(e, &device->act_log->to_be_changed, list)
+		drbd_dax_al_update(device, e);
+
+	lc_committed(device->act_log);
+
+	spin_unlock_irq(&device->al_lock);
+}
+
+int drbd_dax_al_initialize(struct drbd_device *device)
+{
+	struct al_on_pmem *al_on_pmem = device->ldev->al_on_pmem;
+	__be32 *slots = al_on_pmem->slots;
+	/* The activity log area holds the magic followed by the slots. */
+	int i, al_slots = device->ldev->md.al_size_4k * (SZ_4K / sizeof(*slots)) - 1;
+
+	al_on_pmem->magic = cpu_to_be32(DRBD_AL_PMEM_MAGIC);
+	/*
+	 * Initialize all slots rather than just the configured number in case
+	 * the configuration is later changed.
+	 */
+	for (i = 0; i < al_slots; i++) {
+		unsigned int extent_nr = i < device->act_log->nr_elements ?
+			lc_element_by_index(device->act_log, i)->lc_number :
+			LC_FREE;
+		slots[i] = cpu_to_be32(extent_nr);
+	}
+
+	return 0;
+}
+
+void *drbd_dax_bitmap(struct drbd_device *device, unsigned long want)
+{
+	struct drbd_backing_dev *bdev = device->ldev;
+	unsigned char *md_on_pmem = (unsigned char *)bdev->md_on_pmem;
+
+	return md_on_pmem + md_sector_offset_to_bytes(bdev->md.bm_offset);
+}
diff --git a/drivers/block/drbd/drbd_dax_pmem.h b/drivers/block/drbd/drbd_dax_pmem.h
new file mode 100644
index 000000000000..52b116300122
--- /dev/null
+++ b/drivers/block/drbd/drbd_dax_pmem.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017, LINBIT HA-Solutions GmbH.
+ */
+#ifndef DRBD_DAX_H
+#define DRBD_DAX_H
+
+#include <linux/kconfig.h>
+
+#if IS_ENABLED(CONFIG_DEV_DAX_PMEM)
+
+int drbd_dax_open(struct drbd_backing_dev *bdev);
+void drbd_dax_close(struct drbd_backing_dev *bdev);
+int drbd_dax_map(struct drbd_backing_dev *bdev);
+void drbd_dax_al_update(struct drbd_device *device, struct lc_element *al_ext);
+void drbd_dax_al_begin_io_commit(struct drbd_device *device);
+int drbd_dax_al_initialize(struct drbd_device *device);
+void *drbd_dax_bitmap(struct drbd_device *device, unsigned long want);
+
+static inline bool drbd_md_dax_active(struct drbd_backing_dev *bdev)
+{
+	return bdev->dax_dev != NULL;
+}
+static inline struct meta_data_on_disk_9 *drbd_dax_md_addr(struct drbd_backing_dev *bdev)
+{
+	return bdev->md_on_pmem;
+}
+#else
+
+#define drbd_dax_open(B) do { } while (0)
+#define drbd_dax_close(B) do { } while (0)
+#define drbd_dax_map(B) (-ENOTSUPP)
+#define drbd_dax_al_begin_io_commit(D) do { } while (0)
+#define drbd_dax_al_initialize(D) (-EIO)
+#define drbd_dax_bitmap(D, L) (NULL)
+#define drbd_md_dax_active(B) (false)
+#define drbd_dax_md_addr(B) (NULL)
+
+#define arch_wb_cache_pmem(A, L) do { } while (0)
+
+#endif /* IS_ENABLED(CONFIG_DEV_DAX_PMEM) */
+
+#endif /* DRBD_DAX_H */
-- 
2.56.0


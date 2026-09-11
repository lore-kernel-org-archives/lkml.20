Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D034334C9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115152; cv=none; b=LFgapIhDRYX+5iCoHTYzjynOWFDD96lfu7DtsYYFzAoSc2/JIZJ22BbDF5xHfTf2Ri891MKdT+xM3KS3MxzFu5vrcTGqQzlv6rpdthIKuxlNBE9aTxoiZMkunx5urpi2Uho7g/hJ31JsMtwGobSEcXAS7sMxuoo8mEoXtRvJsH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115152; c=relaxed/simple;
	bh=k4LK5lbS3gaSrE0kwk0ec7AUi1syZRYY0+qgG0SlrdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvSUkbQhAGCq5YBvHcOHdErZCv53swcrvTMQG50lBEqCeHtLoLLxURCJw1/z00FQ/2n7Z4jzA9dCr4wz23EO2udiUYXnsM6t9TKUaG2wI+Q3lLvy9bd6o6KWhZoESMwa5W7Hpebirv1MNG3B4jYPdH5N9kxg9XZvP9/4nlA94GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHC+caQ0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHC+caQ0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso470079a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789115149; x=1789719949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hh1hhSShntFbj0qIbpZ5cz58KTjWdr8vsIozL/BHi18=;
        b=dHC+caQ0fmYvSJ2et946C+e+Nr63CVUaY6+WJv/i4yfPYgfrxTRZzWVW3n+fm6Q4uZ
         HOsVeL0vk/BMWPR0cGd8LA3u+rmfBOAfXa0c8CTmEcyxNbhbSJ+TTR1zAXp3RLx+p3wn
         17+DFe6kOuiXZp3jnJOuRJ5aKc3kNmAkOtBa5lYc2XqlX8M/xYfhUPLGlyow/IESAof6
         FcdsgiacOjzdgQtuWlx2E79He1KLwtVhHxHy5jMSqlOe5sZaadW/HerbWvOY+lQb1ehq
         +hbhbf8mBTaPhEyv4fOK10p4jZyv0RF+n8uIQxRZB0izn9DLxhTLdbJLsFrrsEg0n/qZ
         BvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789115149; x=1789719949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh1hhSShntFbj0qIbpZ5cz58KTjWdr8vsIozL/BHi18=;
        b=CCQSz/gwv22+rumXNQsMkt7dfDIlHOLAQsohGu7B1QhKlgmdeFf91errptvn5Y6++w
         PCLZBI/BZOBGromDKg5mITY0/AlsQBTUoPeN/0GGklx82TVkIZlmLBv4yBvPLIx8eiUD
         NwDFwvBn9OdG0Pllkmm4goc8pkldG/WyCsU1VmqotlphKtsp8ePW7/IwBq6ARLWBoICf
         X8ZO1peSaPk0zEvt24/p8TcGSWn6Uq0kiAajP+pRpI463LRIE1CpzE/jp8KERirsz+J1
         0cQT32l8Te3uzami0a4GDspeqgMaGt4l/DpI0630u5pZpNV1v5Tr+L/ZcxKdghF1y1F1
         qUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBweQMcZi9pAUIPe0Axp2Lu+hJq7s4nyPu9ViYk0p0LOqPjD9xLckADEqtYQFHS25Y+xNq8YBlEY5gKsV8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nv8NxtLI8x6b8IbtEDT3LJHnZmagZffNMRZxJCSGvh3+blQqD3
	qY0gVoHWUVNpYrMuzzzpqI8U6MeQZvmVu2tEXqfpeKxbtuv+PkN/gH8pI1xOV4v5
X-Gm-Gg: AYBFou0ZoegYzrL+vcqOfiXpzurc2vMsLXt9RuVeLLWmvIShyptX5AEB1lwTrUG7skH
	VISrgOWWFbEs4DtpHP/DbewcyIf6idy1uNHJrBNGMh7+/+NMOm7W4dRH9UBDD6b3KBkAYngnNC9
	PrwzOPGRkTEyICs+0o5QzmOy9sm2Vb+/7OxdZxXYyLsf9suX8AwOA3HDC935xTFynkSblwOnm8i
	JNfx2oliJP42eEyqahxu8/Ko7xLYJEAkgrQ0kf9k2QQ58qIQqSbiqpY2J9aTru674dVreevNT/d
	RQSBHgEJrw3pK6X9TXQebB8mA1CYrHV6R2Cow+3IiS08dft+uas9Oxs2MXsvtEzP/zztC9TDqs7
	YbJ4mwE6CVTxgFRSlOuwi7IvA/fV8pj3/MGGSYz/NSQ7Wi7nnYRxwEtgF46A9vDSZPWjDgpnszF
	5Yt4bT0+JVjSCwGV0bVErA38Raa9ig1wZwbK7SFVTefdwZVftap/L9Qkh1QNDKKRjSA5Cu1XecK
	DFlVglDga/v96M5I61fooikHg==
X-Received: by 2002:a17:90b:4ad2:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39d9c34a241mr4653694a91.21.1789115149333;
        Fri, 11 Sep 2026 01:25:49 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8137fsm4795964c88.9.2026.09.11.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:25:48 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nvdimm/pmem: Release gendisk on probe failure
Date: Fri, 11 Sep 2026 13:55:43 +0530
Message-ID: <20260911082543.473670-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmem_attach_disk() allocates the gendisk with blk_alloc_disk() and hands
it to devres only once device_add_disk() has succeeded.  Until that
point the probe path owns the disk itself, which is why every failure
after the allocation jumps to the out: label and puts it there.

The devm_init_badblocks() failure returns directly instead, so the disk
allocated a few lines earlier is never released.  Nothing releases it
afterwards either: the devres action that would have done so has not
been registered yet, so unbinding the namespace or destroying it does
not reach the disk, and it stays allocated along with its queue and its
bdev inode until the machine is rebooted.

devm_init_badblocks() only fails when a single page allocation fails, so
reaching this at all needs memory exhaustion during namespace probe, and
because device_add_disk() has not run there is nothing user visible left
behind: no device node, no sysfs entry, only the leaked memory.

Release the gendisk through the existing cleanup path on this failure.

Fixes: 3dd60fb9d95d ("nvdimm/pmem: stop using q_usage_count as external pgmap refcount")
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v2, all of it from Alison's review of v1:
 - retitled, and the changelog rewritten as background, problem, impact
   and resolution rather than a walk through the call sequence
 - says whether the disk is permanently leaked: it is, because the
   devres action has not been registered at that point, so no later
   unbind or destroy reaches it
 - says when the failure can be reached at all, and that nothing user
   visible is left behind
 - the Fixes: tag re-derived.  v1 blamed b95f5f4391fa, but the early
   return after the disk was allocated already existed before it; that
   commit only changed which call failed.  The leak starts at
   3dd60fb9d95d, which removed the pmem_release_queue devres action and
   the fsdax_pagemap_ops .cleanup that had been freeing the disk on
   these paths.  accf58afb689 then converted the addr and dax_dev
   returns to goto out, and this one was missed.
 - the object counts kept, but measured across four batch sizes so that
   the scaling is visible, and the shortfall you noticed explained

Found by an AI-assisted review of the error paths in pmem_attach_disk().

Tested on 7.3.0-rc2 in QEMU, with a legacy pmem region (memmap=1G!2G) and
a local debug patch forcing the devm_init_badblocks() branch, as it is
otherwise only reachable under memory exhaustion.  namespace0.0 was bound
and unbound repeatedly with the branch forced, counting bdev_cache in
/proc/slabinfo after a drop_caches and a settle:

    failed probes      32     64    128    256
    growth, unfixed   +24    +60   +120   +252
    growth, fixed     +12    +12    +12    +12

Without the patch the count tracks the number of failed probes, and the
unbind between attempts does not bring it back down, which is what makes
the leak permanent.  With the patch it is flat.  Both rows sit a little
under the probe count because SLUB's active_objs is an estimate, which is
the discrepancy you asked about in v1.  Clearing the debug flag and
binding again still gives a working /dev/pmem0.

v1: https://lore.kernel.org/all/20260824060113.2330468-1-hemanth.selam@gmail.com/

 drivers/nvdimm/pmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 30a51c365ce8..648fc7d66063 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -563,8 +563,10 @@ static int pmem_attach_disk(struct device *dev,
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
 			/ 512);
-	if (devm_init_badblocks(dev, &pmem->bb))
-		return -ENOMEM;
+	if (devm_init_badblocks(dev, &pmem->bb)) {
+		rc = -ENOMEM;
+		goto out;
+	}
 	nvdimm_badblocks_populate(nd_region, &pmem->bb, &bb_range);
 	disk->bb = &pmem->bb;
 
-- 
2.48.1


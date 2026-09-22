Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA548EC67
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055322; cv=none; b=nnXgerJkPRGRxxxTplfj2BLnXvh6r4rXxH2UYgHXS08FZ8aCNPDVRd7MgVnXlwKC60cU3n0nwWuYK7dUmrQGxDBNLqMOT8F/oMkXxrd+SULTdiYqEKnwNNW0QNuW0VV/7cxNIo7UE4uAO2AOHKjImRIXV4MM+RvqG0ir2UUuijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055322; c=relaxed/simple;
	bh=jTTuFQ42teG21/NODquZooAEx+rVK66SJ1HWPla0emA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngiZSt+TEgmjNGnwc0uedI3w4ZTkVW1b/xdCAP8aG1SsrBDrJU91oYa2972KbMEh29vBmmLD/fQUQ6ikSMafIuAFFrIc1+hPEMPho4TbDYUZVwS/+iaAG2C6MNJuj6Om5ve1U77jMUleg3T85QYKDWlpH8Zs5y2qAmg9vdueGhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gy1olaf7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqx7qgbL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gy1olaf7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqx7qgbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rU6cW44LYgRUyAQrC4VYer8F2kJCybD5egmuRztFQqU=;
	b=gy1olaf7U49N7haoKw1ENxwNsfHuU3tpQ+XtiQfGOTpGpOVj2c7wLWmBsHQSwnzbGdzcQh
	Ia1aG/KjbK8uNBxKwt4WuI53F3Wgqs+/5ocuvjMQlK7uU0WIFLcdqOykVDEpfsZKYMUtbY
	iXQ4BK8duVGmGnckUSH5ynlxzuk4hxs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-elHOsZOEN9qHpJ7ewt3djA-1; Tue, 22 Sep 2026 01:35:15 -0400
X-MC-Unique: elHOsZOEN9qHpJ7ewt3djA-1
X-Mimecast-MFC-AGG-ID: elHOsZOEN9qHpJ7ewt3djA_1790055314
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3a468782b61so14482661fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055314; x=1790660114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU6cW44LYgRUyAQrC4VYer8F2kJCybD5egmuRztFQqU=;
        b=fqx7qgbLZM6S/5y9s9zcfjTm3SK9IUuFbER5ja8SbIYypjpdnS9PQHO1OVXNsX6fKL
         A64NrMNVLKgxizi5aW/Ytsm9WnvG6r8KSNJV0u5YDbzAe8bhq/mR/BEJziHRgbP8QlN4
         owUtwOxGgME1nCsfVQ/uaHX2ui1bWO39WW+TzBvEkyRm6/5nljbq2+1Ukonjo6Ckzg19
         K3LXCG61imn0lGNyk8gyQdmS72f+4UqAdMCP7ykWcR6HX7eW5so8k4ayg2mIuRLJQfuU
         zzLVqjYfJaRrd1bB08otqaedWgWsAQUu4patPO1De7fUzqqCi5HVGnfDaTammrOwd8mZ
         tbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055314; x=1790660114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU6cW44LYgRUyAQrC4VYer8F2kJCybD5egmuRztFQqU=;
        b=D/qHRocEjESziQRmK/0ncFCnJHQFFSo32PB9/ShntSAqwwpqRoSh2yyaT+5UUgFHWy
         YFOf7VV40phjSp1RSE3xLU/Rlym56Sh+dpVGj5RC39JHKAU77vpCGrp4JESE87NkUd5F
         R8qtrsE8C3KAfuo0gt0DUBacdr96mByG4lpBkwByxzF/wL6Y6rZB3up3AWeUoX6ugJ73
         jf8/0m47GACi9RDqxH51zh87evOM2sB06ynZgadC/CKUT9uj6nsR8TDfEFVVQ7hq6tWt
         ER7mzDUHZi19WrTsjjaTHRAVZG5rYPRq4nyDDcVQi5zmdHpKt5OXGzHhB/KlMgqxvm4W
         aJmg==
X-Forwarded-Encrypted: i=1; AKwUvByoR2r29PyKqiQz8tJk3xMp68j1KhPkg1yyXRFjan1hsjLD9TriuorjOC7DKwT5zT81VwryjpJmgnu8hJc=@vger.kernel.org
X-Gm-Message-State: AFuF++ko2ChaEEngrNE2yjFwO8REDs0B1q+cp9QaeJVYHtTOqUjIovUV
	bIeAznG/LQxIMJWTwDyx/6Tx+qW/Jie9jfa95YhL4GhgCIPmcExuAZIKKaQgDQbCTokb0QtRy98
	oWTT53EYqF7tR740EdfPsc/N+zoMMLhAenVhvKjjbEnllQvWi71b1dpNlhqbOtGYC
X-Gm-Gg: AYBFou3ogMPBDojwE/NILkge3NHYBBnNgMFgDl+3db45927+cKJNhsS5eHvr1nc6l3e
	r48tAyRVFRNsxUwTOHzmryjHy4KUtVvi9CllCMf10hvf/PMuBbN4fBf0KZzEjBxbJFia2msYXED
	NhJyNxuy7zT0FkZIrshBaZVu0s8sihK+81qdTBG1kIge61BfwVJ/yRZyha3WUJ/hTViH29ow3JB
	sPI3sxYzgAFrC42kwkgl9iapkbJp8sky6gLIHSEhVrMfQpsICYDbnhDZeOi17R0aw1g9WeutMs+
	NG2F30tYRXGNVku2GT5Qpaukxz+QCWcWzSZ8lKwxDzCl+OKQ5Lr+ZqMyaEgyB8dJiHouoajT2ae
	9tn0v04ak6bHhrGQQqcIA
X-Received: by 2002:a05:6512:33c6:b0:5b6:183c:5c9d with SMTP id 2adb3069b0e04-5b8c1958e1fmr3832808e87.59.1790055314053;
        Mon, 21 Sep 2026 22:35:14 -0700 (PDT)
X-Received: by 2002:a05:6512:33c6:b0:5b6:183c:5c9d with SMTP id 2adb3069b0e04-5b8c1958e1fmr3832800e87.59.1790055313530;
        Mon, 21 Sep 2026 22:35:13 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:35:12 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Marco Pagani <marpagan@redhat.com>
Subject: [PATCH v14 11/12] lib/test_hmm: add a new testcase for the migrate on fault
Date: Tue, 22 Sep 2026 08:34:20 +0300
Message-ID: <20260922053421.4092027-12-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

Enhance the hmm test driver (lib/test_hmm) with migrate on fault case.

Cc: David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Marco Pagani <marpagan@redhat.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 lib/test_hmm.c                         | 130 ++++++++++++++++++++++++-
 lib/test_hmm_uapi.h                    |  21 ++--
 tools/testing/selftests/mm/hmm-tests.c |  54 ++++++++++
 3 files changed, 191 insertions(+), 14 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index cd88e8177d0a..b39522c05d83 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -36,6 +36,7 @@
 #define DMIRROR_RANGE_FAULT_TIMEOUT	1000
 #define DEVMEM_CHUNK_SIZE		(256 * 1024 * 1024U)
 #define DEVMEM_CHUNKS_RESERVE		16
+#define PFNS_ARRAY_SIZE			64
 
 /*
  * For device_private pages, dpage is just a dummy struct page
@@ -355,6 +356,7 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 	struct mm_struct *mm = dmirror->notifier.mm;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	bool migrate = range->default_flags & HMM_PFN_REQ_MIGRATE;
 	int ret;
 
 	while (true) {
@@ -364,9 +366,15 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 		}
 
 		range->notifier_seq = mmu_interval_read_begin(range->notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(range);
-		mmap_read_unlock(mm);
+
+		/* mmap lock held for whole migrate on fault operation */
+		if (!migrate) {
+			mmap_read_lock(mm);
+			ret = hmm_range_fault(range);
+			mmap_read_unlock(mm);
+		} else {
+			ret = hmm_range_fault(range);
+		}
 		if (ret) {
 			if (ret == -EBUSY)
 				continue;
@@ -382,7 +390,9 @@ static int dmirror_range_fault(struct dmirror *dmirror,
 		break;
 	}
 
-	ret = dmirror_do_fault(dmirror, range);
+	/* update device page table after migration */
+	if (!migrate)
+		ret = dmirror_do_fault(dmirror, range);
 
 	mutex_unlock(&dmirror->mutex);
 out:
@@ -1377,6 +1387,114 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	return ret;
 }
 
+static int do_fault_and_migrate(struct dmirror *dmirror, struct hmm_range *range)
+{
+	struct migrate_vma *migrate = range->migrate;
+	int ret;
+
+	mmap_read_lock(dmirror->notifier.mm);
+
+	/* Fault-in pages for migration */
+	ret = dmirror_range_fault(dmirror, range);
+	/*
+	 * Set this up even on error: hmm_range_fault() may have collected
+	 * part of the range before failing.
+	 */
+	migrate_hmm_range_setup(range);
+	if (ret) {
+		/*
+		 * dst[] entries are empty, so this marks every collected migration
+		 * as failed. finalize then restores the source mappings and drops
+		 * the associated locks/references.
+		 */
+		migrate_vma_pages(migrate);
+		migrate_vma_finalize(migrate);
+		goto out;
+	}
+
+	pr_debug("Migrating from sys mem to device mem\n");
+
+	dmirror_migrate_alloc_and_copy(migrate, dmirror);
+	migrate_vma_pages(migrate);
+	dmirror_migrate_finalize_and_map(migrate, dmirror);
+	migrate_vma_finalize(migrate);
+out:
+	mmap_read_unlock(dmirror->notifier.mm);
+	return ret;
+}
+
+static int dmirror_fault_and_migrate_to_device(struct dmirror *dmirror,
+					       struct hmm_dmirror_cmd *cmd)
+{
+	unsigned long start, size, end, next;
+	unsigned long src_pfns[PFNS_ARRAY_SIZE] = { 0 };
+	unsigned long dst_pfns[PFNS_ARRAY_SIZE] = { 0 };
+	struct migrate_vma migrate = { 0 };
+	struct hmm_range range = { 0 };
+	struct dmirror_bounce bounce;
+	int ret = 0;
+
+	/* Whole range */
+	start = cmd->addr;
+	size = cmd->npages << PAGE_SHIFT;
+	end = start + size;
+
+	if (!mmget_not_zero(dmirror->notifier.mm)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	migrate.pgmap_owner = dmirror->mdevice;
+	migrate.src = src_pfns;
+	migrate.dst = dst_pfns;
+	migrate.flags = MIGRATE_VMA_SELECT_SYSTEM;
+
+	range.migrate = &migrate;
+	range.hmm_pfns = src_pfns;
+	range.pfn_flags_mask = 0;
+	range.default_flags = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_MIGRATE;
+	range.dev_private_owner = dmirror->mdevice;
+	range.notifier = &dmirror->notifier;
+
+	for (next = start; next < end; next = range.end) {
+		range.start = next;
+		range.end = min(end, next + (PFNS_ARRAY_SIZE << PAGE_SHIFT));
+
+		pr_debug("Fault and migrate range start:%#lx end:%#lx\n",
+			 range.start, range.end);
+
+		ret = do_fault_and_migrate(dmirror, &range);
+		if (ret)
+			goto out_mmput;
+	}
+
+	/*
+	 * Return the migrated data for verification.
+	 * Only for pages in device zone
+	 */
+	ret = dmirror_bounce_init(&bounce, start, size);
+	if (ret)
+		goto out_mmput;
+
+	mutex_lock(&dmirror->mutex);
+	ret = dmirror_do_read(dmirror, start, end, &bounce);
+	mutex_unlock(&dmirror->mutex);
+	if (ret == 0) {
+		ret = copy_to_user(u64_to_user_ptr(cmd->ptr), bounce.ptr, bounce.size);
+		if (ret)
+			ret = -EFAULT;
+	}
+
+	cmd->cpages = bounce.cpages;
+	dmirror_bounce_fini(&bounce);
+
+
+out_mmput:
+	mmput(dmirror->notifier.mm);
+out:
+	return ret;
+}
+
 static void dmirror_mkentry(struct dmirror *dmirror, struct hmm_range *range,
 			    unsigned char *perm, unsigned long entry)
 {
@@ -1643,6 +1761,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_migrate_to_device(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_MIGRATE_ON_FAULT_TO_DEV:
+		ret = dmirror_fault_and_migrate_to_device(dmirror, &cmd);
+		break;
+
 	case HMM_DMIRROR_MIGRATE_TO_SYS:
 		ret = dmirror_migrate_to_system(dmirror, &cmd);
 		break;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index ea9b0ec404fb..67d267a3b999 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -29,16 +29,17 @@ struct hmm_dmirror_cmd {
 };
 
 /* Expose the address space of the calling process through hmm device file */
-#define HMM_DMIRROR_READ		_IOWR('H', 0x00, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_MIGRATE_TO_DEV	_IOWR('H', 0x02, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_MIGRATE_TO_SYS	_IOWR('H', 0x03, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
-#define HMM_DMIRROR_READ_UNLOCKED	_IOWR('H', 0x09, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_READ			_IOWR('H', 0x00, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_WRITE			_IOWR('H', 0x01, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_DEV		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_TO_SYS		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_SNAPSHOT			_IOWR('H', 0x04, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_EXCLUSIVE			_IOWR('H', 0x05, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_CHECK_EXCLUSIVE		_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_RELEASE			_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS			_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_READ_UNLOCKED		_IOWR('H', 0x09, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_MIGRATE_ON_FAULT_TO_DEV	_IOWR('H', 0x0a, struct hmm_dmirror_cmd)
 
 #define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index e2642eca0d02..a2d1b8f494b6 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -334,6 +334,13 @@ static int hmm_migrate_sys_to_dev(int fd,
 	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
 }
 
+static int hmm_migrate_on_fault_sys_to_dev(int fd,
+					   struct hmm_buffer *buffer,
+					   unsigned long npages)
+{
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_ON_FAULT_TO_DEV, buffer, npages);
+}
+
 static int hmm_migrate_dev_to_sys(int fd,
 				   struct hmm_buffer *buffer,
 				   unsigned long npages)
@@ -938,6 +945,53 @@ TEST_F(hmm, migrate)
 	hmm_buffer_free(buffer);
 }
 
+
+/*
+ * Fault and migrate anonymous memory to device private memory.
+ */
+TEST_F(hmm, migrate_on_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Fault and migrate memory to device. */
+	ret = hmm_migrate_on_fault_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Migrate private file memory to device private memory.
  */
-- 
2.55.0


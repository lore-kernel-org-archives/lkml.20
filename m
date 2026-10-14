Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF51569F3C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000697; cv=none; b=Rh1e1iWp00dvJ36ZB90zEG7wY+sQgxvQNdpKCisKSWvN7IgwkxTPK8l+UaJ4cLVJzgitsE4INCvIdFBSlwpouyVq42sUt6xEaojmN2WnhTuoXitr6Mw/zooURWAeEjeteu9GEs2xnC1cxJWuw2hWX3PZeqXHTbFKuKzpgA9fbKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000697; c=relaxed/simple;
	bh=kgADQWXY4bo9DrSOROhr95j5ORvOLXp1+MzIATLp8wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9Oz4IhthCYKx80dYuk1LW5V0dKrj7dlDLfAS9s6b1yMr1NYDCAajwKGvs4SRFPCLZUhw2AEws5VQ2wJt9y3k3xsNlJZUiBwZaLNviZvr8GgMGpBsY1Xs5WaQh1NpEr5iZbnD/KN2u7hLetZ8x5vYuK3AGg0Qm3TG+6iciPRbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PCSluIrH; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PCSluIrH"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91b83459526so37254036d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000694; x=1792605494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oyatGRUxoFSks0yTidJFm5V0CZohajxsNca07bWmCFc=;
        b=PCSluIrHGTIQHhtORFV0GoKP3tF7sKU7V6XHG3emTIpC9ud+qLN+O7hACbtRa3G8D9
         Gls5MwdyB65f52/9SYQKJ+RFKY4PUQr8ynDo+Vlni6HSWuBoI8ltCSvH514/7C/c6gDR
         8BAe1gPj8+WB6Z5O3HskuUUdeqnRlj4v7fWT2m4s28M4xaL1zmTxQtgrWg7KrGjQubYS
         h57f8Vs9bLXZULFvyNj0F02wsxQ03Md79JXlUsSF+XPXXUnrb/+k6i9ua+7pSSAN1bRX
         n05zWuJw5lLYeQLmU2THvaJsuYBIb19Ii5nJGcT+0zu9RcJzu2+El4RDwxfgJCcS6D1s
         ESwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000694; x=1792605494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oyatGRUxoFSks0yTidJFm5V0CZohajxsNca07bWmCFc=;
        b=wur2T9kp76t7WG8T7wK1HhkxijkFl3xXjX6ITJEPeupvuNmt6cqQTuGqvBghPUkV42
         67Z0huRBffTs/MF8vfpbw+Ay29TfYG/N81wYn+WPWzLKLyrofWMcNwbnKkEhQtoxYrKo
         AuVD5fKn3Dl32hNessDpAKzKLWCGZmjdFDsve/2tzAREHAgPMsecx/7W2fd+4Viul4cq
         dzZxCOdb5ZubeEP9ZpmOqTWy3BunQJeMzwk5jNlUcl7N6rHU2dOZcqWbccBLmZ48EMeL
         /sPTZ9cfdfOH+VDOp1yrtsf7UkSKo8ATjiP/c7DPNZZnVJgVT3RTJgx+lBNns1wM5DM5
         Jt/g==
X-Gm-Message-State: AFq9FYKDUlUbOA51d8PiWHdJUTauuqyCktP9+AsKKLkQY3CnfLpSMLnr
	hLMTsoyM51s4QVr+IDaf9np0E/Lub1a+r9OMtlQoPywFwSfo0Jxx1XT03L1uNZiVMA4=
X-Gm-Gg: AYBFou3Rr2VVFQ10PIYJkzTRsxMIHP/TQq0JDORQq2tHW2e8+ktmQ86AyvLdzswhgCC
	THP79NYDKKApLrFk2crlumRdTFwmGzQO8Qx+hPG3obvqpIHr1TVmtSL679NtuAccubnrLrZdLu7
	b+YAfvUU5cfVFvNnUOBFahVB2bVLFCvPVHSJ9CaWo0FpugWY1l1Ss6n3qdirEl6JsJFbwueio5q
	xhIUAa59GXxss3Tfma4HoRxm7LXcJbHkskoXm7MuHEbsHkLzEbz8xq4yqeJFtu7Dz7ovfBrBwXr
	RBLs/WSB/oVAXll9NhMcRP5w9u0Fiz7NBJ3hptkE6oXrJ7dRJYgTQ5xnDmbEStJ6c6rnqch8EJT
	WPAAjH8Ya8oTg5V/Zsb3i+pKzM23vC71Mr8M2+25KXLrGwFKxQ8HCYE5IfT9Oyl2fdXjusB6bi/
	+57/7EqBSyNZxQMrPQ3gJR+60Sx+aVYyQJj2lYiDUEUOx/s5GnFtSHh9j+eAOTq+hACfctoHIWq
	9CyoygdyRaycKAWjuyI9HQ+IrM8XbMxvowzitWUnXi+SaFCPfTazUe5FK68
X-Received: by 2002:a05:6214:4c42:b0:91b:5d3b:4ac1 with SMTP id 6a1803df08f44-91b5d3b4e3cmr222099726d6.54.1792000691642;
        Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 5/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared memory
Date: Wed, 14 Oct 2026 13:57:53 -0400
Message-ID: <20261014175756.2035176-6-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both hints are non-destructive, but the tests so far only check that for
private anonymous memory. Shared memory reaches reclaim through different
paths: a dirty shared file page must be written back or left resident,
shared anonymous memory is paged out through shmem, and a SHM_LOCK'd
segment is unevictable without its VMA being VM_LOCKED.

Check that MADV_COLD and MADV_PAGEOUT preserve a dirty shared file page,
that MADV_PAGEOUT preserves a shared anonymous page, and that it leaves a
SHM_LOCK'd page resident. The SHM_LOCK test needs root to confirm through
/proc/kpageflags that the page is unevictable, and skips if it is not.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 138 +++++++++++++++++++++++++++
 tools/testing/selftests/mm/vm_util.h |   1 +
 2 files changed, 139 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index bd78f63f1314..0851f5428e3d 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -7,7 +7,10 @@
 #include <fcntl.h>
 #include <sched.h>
 #include <stdbool.h>
+#include <stdint.h>
+#include <sys/ipc.h>
 #include <sys/mman.h>
+#include <sys/shm.h>
 #include <unistd.h>
 
 #include "kselftest_harness.h"
@@ -21,6 +24,8 @@ static size_t page_size;
 FIXTURE(madvise)
 {
 	int pagemap_fd;
+	/* Opening it needs CAP_SYS_ADMIN, -1 otherwise. */
+	int kpageflags_fd;
 };
 
 FIXTURE_SETUP(madvise)
@@ -29,10 +34,13 @@ FIXTURE_SETUP(madvise)
 
 	self->pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
 	ASSERT_GE(self->pagemap_fd, 0);
+	self->kpageflags_fd = open("/proc/kpageflags", O_RDONLY);
 }
 
 FIXTURE_TEARDOWN(madvise)
 {
+	if (self->kpageflags_fd >= 0)
+		close(self->kpageflags_fd);
 	close(self->pagemap_fd);
 }
 
@@ -52,6 +60,22 @@ static bool pageout_until_swapped(struct __test_metadata *_metadata,
 	return false;
 }
 
+/* Page out the range until its first page is no longer mapped. */
+static bool pageout_until_evicted(struct __test_metadata *_metadata,
+				  char *mapping, size_t size, int pagemap_fd)
+{
+	int retry;
+
+	for (retry = 0; retry < PAGEOUT_RETRIES; retry++) {
+		ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), 0);
+		if (!pagemap_is_populated(pagemap_fd, mapping))
+			return true;
+		usleep(10000);
+	}
+
+	return false;
+}
+
 /*
  * Keep this task on one CPU, so that draining that CPU's LRU batches drains
  * the folios this task faulted in.
@@ -67,6 +91,25 @@ static void pin_to_current_cpu(struct __test_metadata *_metadata)
 	ASSERT_EQ(sched_setaffinity(0, sizeof(mask), &mask), 0);
 }
 
+/* Map a shared mapping of an unlinked, zero-filled temporary file. */
+static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
+{
+	char template[] = "/tmp/madvise-pageout-XXXXXX";
+	char *mapping;
+	int fd;
+
+	fd = mkstemp(template);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(unlink(template), 0);
+	ASSERT_EQ(ftruncate(fd, size), 0);
+
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	close(fd);
+
+	return mapping;
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -267,4 +310,99 @@ TEST_F(madvise, pageout_skips_swapped_pte)
 	check_skips_swapped_pte(_metadata, self->pagemap_fd, MADV_PAGEOUT);
 }
 
+/* MADV_COLD must not discard a dirty page of a shared file mapping. */
+TEST_F(madvise, cold_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * MADV_PAGEOUT may write a dirty shared file page back or leave it resident,
+ * but must not discard it.
+ */
+TEST_F(madvise, pageout_preserves_dirty_shared_file_page)
+{
+	char *mapping;
+
+	mapping = map_temp_file(_metadata, page_size);
+	mapping[0] = 1;
+
+	if (!pageout_until_evicted(_metadata, mapping, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not unmap the page");
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/* MADV_PAGEOUT must not lose the contents of shared anonymous memory. */
+TEST_F(madvise, pageout_preserves_shared_anon_page)
+{
+	char *mapping;
+
+	mapping = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(mapping, MAP_FAILED);
+	mapping[0] = 1;
+
+	if (!pageout_until_evicted(_metadata, mapping, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not evict the page");
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * SHM_LOCK makes shmem pages unevictable without setting VM_LOCKED on the
+ * VMA, so MADV_PAGEOUT accepts the range but must not reclaim the page.
+ */
+TEST_F(madvise, pageout_skips_unevictable_page)
+{
+	unsigned long pfn;
+	uint64_t flags;
+	char *mapping;
+	int shmid;
+
+	if (self->kpageflags_fd < 0)
+		SKIP(return, "requires root to read page flags");
+	shmid = shmget(IPC_PRIVATE, page_size, IPC_CREAT | 0600);
+	ASSERT_GE(shmid, 0);
+	if (shmctl(shmid, SHM_LOCK, NULL)) {
+		shmctl(shmid, IPC_RMID, NULL);
+		SKIP(return, "could not lock a shmem segment");
+	}
+	mapping = shmat(shmid, NULL, 0);
+	/* The segment is destroyed once it is detached. */
+	shmctl(shmid, IPC_RMID, NULL);
+	ASSERT_NE(mapping, (void *)-1);
+	pin_to_current_cpu(_metadata);
+	mapping[0] = 1;
+
+	/*
+	 * MADV_COLD drains this CPU's LRU add batch, which makes the page
+	 * unevictable.
+	 */
+	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
+	pfn = pagemap_get_pfn(self->pagemap_fd, mapping);
+	ASSERT_NE(pfn, -1UL);
+	ASSERT_EQ(pageflags_get(pfn, self->kpageflags_fd, &flags), 0);
+	if (!(flags & KPF_UNEVICTABLE))
+		SKIP(return, "could not make the page unevictable");
+
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(shmdt(mapping), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d432..95898e045bac 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -24,6 +24,7 @@
 
 #define KPF_COMPOUND_HEAD             BIT_ULL(15)
 #define KPF_COMPOUND_TAIL             BIT_ULL(16)
+#define KPF_UNEVICTABLE               BIT_ULL(18)
 #define KPF_HWPOISON                  BIT_ULL(19)
 #define KPF_THP                       BIT_ULL(22)
 /*
-- 
2.56.0


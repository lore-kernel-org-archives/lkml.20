Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C52BDC0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088238; cv=none; b=DAKOZe7R6Fikwk32bub0jJiuWWnCgwrlS3uNwITUn2k0RxNjeF/sUBeeMcZgzdfqE53/3E/pw2wzkDwxP2ClsKL00Ecr8LBjr11CqYWJ2VxNRnfyer2Ce7nOCB3t5/1zvpZ4yh4fRwLHcSvZS5OsYnmOm3oVIl9KBieGigwgkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088238; c=relaxed/simple;
	bh=aLso4XD+9PCrIoZH1brhw2fzkW0voJ8e+YRWruzsQAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E2Kj+EgvfQquv+B+9zwG1GryNP47YyLvUOyLUbUDnp3VM7MQsxzJXlH5wMPWtluEsnvEl0SFsKiU5pKSv6rWTWxQFmm3s/5KeiMMRuvso7AWT3C6tvK+hnM0ynGWRuPwBZw95uxMr/RKdjFhSXxyA/5V95oFFcJ/qxDnLzk/p/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YetUt8yw; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YetUt8yw"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso350774a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789088236; x=1789693036; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzHPSAfDKEGwk2Qc7G8mI5v1r85OJoGxqZO5j5dMqa4=;
        b=YetUt8yw/EPbt2Yirsc3pG+wqX7zx2A8xpQ7rYa7n4nzix5MOQZZU3N6kPTECE7eng
         lNG+2kDOf4SVl2SN0x1weC+mZaI+EcoS3pZ3O7IXvY5xw//0OU7+s2O/cOXZ9+vuykoS
         nVWFcpUg/btGrAW9Cna5RR+Ff/XGU7976XoXwvVD19K37t+1dlGtRYT0/3aA8bjMkBZe
         Lpa9quxGw52DQFgpRZfGcFHmY40TiLNbD9s+KWz0C6JhgIIhDXFWeqEykuyO4cNQJZJw
         vRzRt/OD7sTTYNGNB70eMtfYoznbYg6QSEmxjRzSMa60r4xcrUMo4/srkj/0ihEDLhmq
         01wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088236; x=1789693036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzHPSAfDKEGwk2Qc7G8mI5v1r85OJoGxqZO5j5dMqa4=;
        b=gNpyLBYJa3gIN0QaxkdeO2Kx7nlQ5HuY3bn4HD4XsHmDuWruCK870DLgSjz26d9dtg
         ZJwE1JY0c3dxWTTV492JTonMIsFlcz5uJfqQyqlKfXCGIBnlivHUqPW2DgbjvhJXPVEQ
         jnFi4bcGniWFwzPyhxdKTCoBMcUem20VOdIPUUvLO61e4ijV1W7oisNYz11sv4rnXcZD
         3JiaON0iULt6SPnSWVI59dsjW5vCwYlExSpyrU83h9inhg2cFSVx3Buf2+QUYgCxLWuD
         VTfYa0dwBD5IJ3l//mAIwbzinLZ+pEXOZiVViG/oirrU/6wL9Z9GGJy7Neuz8vdbNvg8
         97pQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4cEzLbnAqDMvK/NAi9cm7UQZsuvEJKb7UbSnvSKd7IXkkcDjo45oaU/kQkaRbubEtYWYGgBNY7mb880E=@vger.kernel.org
X-Gm-Message-State: AFuF++ntgEW0Hz9h40xGW0jmluJAy0EqZ6tqKU9fk+eB2CB8ORrcwOnj
	kZJYCUAserrEyaDQag1bUVxiYop6uFD6dGuxz80SVkGn66q9FkkYhEPe7DTl0xJetoViC16v65W
	M9Rz5Yrc7GNaV7C3f580JLQ==
X-Received: from pjbhj5.prod.google.com ([2002:a17:90b:40c5:b0:39d:a25b:58bc])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:570b:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39d9c3521ecmr2312066a91.23.1789088235766;
 Thu, 10 Sep 2026 17:57:15 -0700 (PDT)
Date: Fri, 11 Sep 2026 00:57:15 +0000
In-Reply-To: <20260911000300.1052582-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260911000300.1052582-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911005715.1189347-1-jthoughton@google.com>
Subject: Re: [PATCH v3 1/2] mm/khugepaged: Never install PMDs in
 uffd-minor-registered VMAs
From: James Houghton <jthoughton@google.com>
To: akpm@linux-foundation.org
Cc: baohua@kernel.org, baolin.wang@linux.alibaba.com, david@kernel.org, 
	dev.jain@arm.com, hughd@google.com, jthoughton@google.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, ljs@kernel.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, shy828301@gmail.com, usama.arif@linux.dev, 
	ziy@nvidia.com, zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"

Okay so it appears to be a real bug. Here's a diff of what I think would fix it,
though I haven't tested it. I've also included an AI-generated selftest that
checks the behavior when you MADV_COLLAPSE a VMA that maps a shmem file that
had a THP and got truncated.

I'm happy to send this patch on its own to see what others think. I'll test it
properly tomorrow.

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e6947fe142ee..db660cd9d75d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1863,6 +1863,7 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 	pte_t *start_pte, *pte;
 	pmd_t *pmd, pgt_pmd;
 	spinlock_t *pml = NULL, *ptl;
+	pgoff_t file_end;
 	int i;
 
 	mmap_assert_locked(mm);
@@ -1901,6 +1902,11 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 	if (userfaultfd_minor(vma))
 		return SCAN_PTE_UFFD;
 
+	/* Do not map pages past the end of the file. */
+	file_end = DIV_ROUND_UP(i_size_read(file_inode(vma->vm_file)), PAGE_SIZE);
+	if (linear_page_index(vma, haddr) + HPAGE_PMD_NR > file_end)
+		return SCAN_TRUNCATED;
+
 	folio = filemap_lock_folio(vma->vm_file->f_mapping,
 			       linear_page_index(vma, haddr));
 	if (IS_ERR(folio))
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 2d5366196e30..794636dfa485 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -104,6 +104,7 @@ TEST_GEN_FILES += guard-regions
 TEST_GEN_FILES += merge
 TEST_GEN_FILES += rmap
 TEST_GEN_FILES += folio_split_race_test
+TEST_GEN_FILES += collapse_truncate
 
 ifneq ($(ARCH),arm64)
 TEST_GEN_FILES += soft-dirty
diff --git a/tools/testing/selftests/mm/collapse_truncate.c b/tools/testing/selftests/mm/collapse_truncate.c
new file mode 100644
index 000000000000..dd3415c51246
--- /dev/null
+++ b/tools/testing/selftests/mm/collapse_truncate.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test creating a 2M tmpfs file, mapping it 2M-aligned, MADV_NOHUGEPAGE,
+ * writing to each page, truncating 4K off the file, MADV_COLLAPSE, and
+ * attempting to read from the truncated 4K.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+
+#include "kselftest.h"
+#include "vm_util.h"
+
+#ifndef MADV_NOHUGEPAGE
+#define MADV_NOHUGEPAGE 15
+#endif
+
+#ifndef MADV_HUGEPAGE
+#define MADV_HUGEPAGE 14
+#endif
+
+#ifndef MADV_COLLAPSE
+#define MADV_COLLAPSE 25
+#endif
+
+#ifndef MFD_CLOEXEC
+#define MFD_CLOEXEC 0x0001U
+#endif
+
+#ifndef __NR_memfd_create
+#if defined(__x86_64__)
+#define __NR_memfd_create 319
+#elif defined(__aarch64__)
+#define __NR_memfd_create 279
+#elif defined(__i386__)
+#define __NR_memfd_create 356
+#endif
+#endif
+
+#define SIZE_2MB (2 * 1024 * 1024UL)
+#define PAGE_SIZE_DEFAULT 4096UL
+
+static inline int sys_memfd_create(const char *name, unsigned int flags)
+{
+#ifdef SYS_memfd_create
+	return syscall(SYS_memfd_create, name, flags);
+#elif defined(__NR_memfd_create)
+	return syscall(__NR_memfd_create, name, flags);
+#else
+	return memfd_create(name, flags);
+#endif
+}
+
+static sigjmp_buf jmpbuf;
+static volatile sig_atomic_t got_sigbus;
+static volatile sig_atomic_t got_sigsegv;
+
+static void sig_handler(int sig, siginfo_t *si, void *unused)
+{
+	if (sig == SIGBUS)
+		got_sigbus = 1;
+	else if (sig == SIGSEGV)
+		got_sigsegv = 1;
+	siglongjmp(jmpbuf, 1);
+}
+
+static void setup_sighandlers(void)
+{
+	struct sigaction act = {
+		.sa_sigaction = sig_handler,
+		.sa_flags = SA_SIGINFO | SA_NODEFER,
+	};
+	sigemptyset(&act.sa_mask);
+	if (sigaction(SIGBUS, &act, NULL))
+		ksft_exit_fail_msg("sigaction(SIGBUS) failed: %s\n", strerror(errno));
+	if (sigaction(SIGSEGV, &act, NULL))
+		ksft_exit_fail_msg("sigaction(SIGSEGV) failed: %s\n", strerror(errno));
+}
+
+static void test_collapse_truncate(bool clear_nohugepage)
+{
+	unsigned long hpage_size = read_pmd_pagesize();
+	unsigned long page_size = psize();
+	size_t truncated_size;
+	const char *test_name;
+	int fd, collapse_ret, collapse_err;
+	void *res, *p;
+	uintptr_t addr, aligned_addr;
+	bool read_succeeded = false;
+	char val = 0;
+
+	if (!hpage_size)
+		hpage_size = SIZE_2MB;
+	if (!page_size)
+		page_size = PAGE_SIZE_DEFAULT;
+
+	truncated_size = hpage_size - page_size;
+	test_name = clear_nohugepage ?
+		"collapse_truncate (clear MADV_NOHUGEPAGE)" :
+		"collapse_truncate (with MADV_NOHUGEPAGE)";
+
+	ksft_print_msg("[RUN] %s\n", test_name);
+
+	/* 1. Create a 2M tmpfs file */
+	fd = sys_memfd_create("collapse_truncate_tmpfs", MFD_CLOEXEC);
+	if (fd < 0) {
+		ksft_test_result_skip("- %s: memfd_create failed: %s\n",
+				      test_name, strerror(errno));
+		return;
+	}
+
+	if (ftruncate(fd, hpage_size) < 0) {
+		ksft_print_msg("ftruncate to %lu failed: %s\n", hpage_size, strerror(errno));
+		close(fd);
+		ksft_test_result_fail("- %s: initial ftruncate failed\n", test_name);
+		return;
+	}
+
+	/* 2. Map it such that the mapping is 2M-aligned */
+	res = mmap(NULL, 2 * hpage_size, PROT_NONE,
+		   MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (res == MAP_FAILED) {
+		ksft_print_msg("reservation mmap failed: %s\n", strerror(errno));
+		close(fd);
+		ksft_test_result_fail("- %s: reservation mmap failed\n", test_name);
+		return;
+	}
+
+	addr = (uintptr_t)res;
+	aligned_addr = (addr + hpage_size - 1) & ~(hpage_size - 1);
+	munmap(res, 2 * hpage_size);
+
+	p = mmap((void *)aligned_addr, hpage_size, PROT_READ | PROT_WRITE,
+		 MAP_SHARED | MAP_FIXED, fd, 0);
+	if (p == MAP_FAILED) {
+		ksft_print_msg("aligned mmap failed: %s\n", strerror(errno));
+		close(fd);
+		ksft_test_result_fail("- %s: aligned mmap failed\n", test_name);
+		return;
+	}
+
+	/* 3. MADV_NOHUGEPAGE the mapping */
+	if (madvise(p, hpage_size, MADV_NOHUGEPAGE) < 0) {
+		ksft_print_msg("madvise(MADV_NOHUGEPAGE) failed: %s\n", strerror(errno));
+		munmap(p, hpage_size);
+		close(fd);
+		ksft_test_result_fail("- %s: madvise(MADV_NOHUGEPAGE) failed\n", test_name);
+		return;
+	}
+
+	/* 4. Write to each page of the mapping */
+	for (size_t offset = 0; offset < hpage_size; offset += page_size) {
+		*(volatile char *)((char *)p + offset) = 'A';
+	}
+
+	/* 5. Truncate 4K off the file */
+	if (ftruncate(fd, truncated_size) < 0) {
+		ksft_print_msg("ftruncate to %lu failed: %s\n", truncated_size, strerror(errno));
+		munmap(p, hpage_size);
+		close(fd);
+		ksft_test_result_fail("- %s: ftruncate -4K failed\n", test_name);
+		return;
+	}
+
+	/*
+	 * If clear_nohugepage is requested, clear VM_NOHUGEPAGE using
+	 * MADV_HUGEPAGE to allow MADV_COLLAPSE to proceed without EINVAL.
+	 */
+	if (clear_nohugepage) {
+		if (madvise(p, hpage_size, MADV_HUGEPAGE) < 0) {
+			ksft_print_msg("madvise(MADV_HUGEPAGE) failed: %s\n", strerror(errno));
+		}
+	}
+
+	/* 6. MADV_COLLAPSE the mapping */
+	collapse_ret = madvise(p, hpage_size, MADV_COLLAPSE);
+	collapse_err = (collapse_ret == 0) ? 0 : errno;
+	ksft_print_msg("madvise(MADV_COLLAPSE) ret=%d (errno=%d: %s)\n",
+		       collapse_ret, collapse_err,
+		       collapse_ret == 0 ? "Success" : strerror(collapse_err));
+
+	if (collapse_ret == 0) {
+		bool is_huge = check_huge_shmem(p, hpage_size, 1, hpage_size);
+		ksft_print_msg("check_huge_shmem: %s\n",
+			       is_huge ? "huge PMD mapped" : "not huge PMD mapped");
+	}
+
+	/* 7. Attempt to read from the last 4K (the one that was truncated) */
+	got_sigbus = 0;
+	got_sigsegv = 0;
+
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		val = *(volatile char *)((char *)p + truncated_size);
+		read_succeeded = true;
+	}
+
+	if (read_succeeded) {
+		ksft_print_msg("Read from truncated 4K succeeded without SIGBUS! val=0x%02x ('%c')\n",
+			       (unsigned char)val, val ? val : ' ');
+		/*
+		 * Accessing beyond EOF of a file-backed mapping MUST result
+		 * in SIGBUS. If the read succeeded, a huge PMD erroneously
+		 * mapped beyond the end of the file.
+		 */
+		ksft_test_result_fail("- %s: read beyond EOF succeeded without SIGBUS (PMD mapped past EOF)\n",
+				      test_name);
+	} else if (got_sigbus) {
+		ksft_print_msg("Caught SIGBUS on reading truncated 4K page as expected\n");
+		ksft_test_result_pass("- %s: SIGBUS received on reading truncated page\n",
+				      test_name);
+	} else if (got_sigsegv) {
+		ksft_print_msg("Caught unexpected SIGSEGV on reading truncated 4K page\n");
+		ksft_test_result_fail("- %s: caught SIGSEGV instead of SIGBUS\n",
+				      test_name);
+	} else {
+		ksft_test_result_fail("- %s: unknown error reading truncated page\n",
+				      test_name);
+	}
+
+	munmap(p, hpage_size);
+	close(fd);
+}
+
+int main(int argc, char *argv[])
+{
+	int opt;
+	bool run_all = true;
+	bool only_nohugepage = false;
+	bool only_clear = false;
+
+	while ((opt = getopt(argc, argv, "nc12h")) != -1) {
+		switch (opt) {
+		case 'n':
+		case '1':
+			only_nohugepage = true;
+			run_all = false;
+			break;
+		case 'c':
+		case '2':
+			only_clear = true;
+			run_all = false;
+			break;
+		case 'h':
+			printf("Usage: %s [-n|-1] [-c|-2] [-h]\n", argv[0]);
+			printf("  -n, -1: Run only test with MADV_NOHUGEPAGE retained\n");
+			printf("  -c, -2: Run only test with MADV_NOHUGEPAGE cleared before collapse\n");
+			printf("  -h:     Show this help message\n");
+			return 0;
+		default:
+			return 1;
+		}
+	}
+
+	ksft_print_header();
+	ksft_set_plan(run_all ? 2 : 1);
+
+	setup_sighandlers();
+
+	if (run_all || only_nohugepage)
+		test_collapse_truncate(false);
+	if (run_all || only_clear)
+		test_collapse_truncate(true);
+
+	ksft_finished();
+}

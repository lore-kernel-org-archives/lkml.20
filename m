Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8033B49D599
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593865; cv=none; b=MVBY40+gMdbTd1cY9DMrHJ6POW/GC4rbeLNXc9GTyjSHFJCDs2YW0uQHC3ZPy25QG083MMVuX0K2pUDp6o8y8IOvzmeQtyByPDqwJ1aIBdvg39EN5BpCae+twWk1TRkCp7bkMdlyVkA6jYm0y0TVLqB00i+njARLQ6daS9bi6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593865; c=relaxed/simple;
	bh=2dN4T90E13wIFTcHaeLujfAu91tFYp4He/2eVSlx6Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ewlc1nzj9Ck1LuCTy0Omu/Hwnmn30wpRx5xOiZstu+Bnzx2oQJ8H33bMnPnKwaCOaBexyfqyfo5zdV60mxknt+KMcdp78pXtiNa/mWlnStXBtZv51jpCJ6MOk9+IQDlna5TMt5v/AanFx2XQA3XHumkd92XQJlYl35HyQdrplzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn8yS6fR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn8yS6fR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so2294539f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593862; x=1791198662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gr6RdF6V1I6p9W/aP+8aNb8DjQUp/6U5Pbv2mZN+P3w=;
        b=Mn8yS6fRPofRaRFUe/bDLNHZpNmoGWp1siQqYtuJ98YMp/ARDfoki2KtxpV0wqmxhU
         2Gy0mNo9KsRO0upxZATuVZSUwg3mCY6M3e2+0jJiGGcWCihJUGOoGavNVJZKGsUOKERS
         eMUGKo6uVsN+n83P2+bg7wyAyvxANs72qpyAfDriwugoz0WgSbaSSVCW8B5EOmbsh2a1
         ry+i2O7D8W8JmJFXMUpF+qEIrVWRoWefVQrGudgzgHnC9we8BefxadTYf3ibvM65DWSH
         7Dudhnirz0nseaDtz0ynspQiWOd6dEhRJWW41yLkUoHzuSOhtb1oZKDz+OrTOiHlU1Zl
         lRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593862; x=1791198662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gr6RdF6V1I6p9W/aP+8aNb8DjQUp/6U5Pbv2mZN+P3w=;
        b=OR8qxR2AQfT5CeUFpHm+lQkbOKoFot3E2WgqH/WMuam5ZOJ6YnZNpYeZNwBjpXkO4m
         RR55kTVpaqn1Ipa4qnNxM8XD5TxobgQQq37S+A5/GlGR57DC3rKIMzLU0lLwEve6Aaua
         FP2x71JruFqcpApB9FUqUVXyZBttdjkNqH5DAECQKCRbPRg7gST5PraPQMn2fJw+dxGr
         1Qt+NMC4w0hkKcecWQduhPAzW0zLFRW1VZmjEsr3eEBUNKI3DqLnw6OVXTWFrbvun2nM
         6wXo7kGOxgiFNzexVR9z1dGwektwABlu/bKafyS7WzQWwndk2iyBlrjU+lu+f2+MWTEW
         kQhw==
X-Forwarded-Encrypted: i=1; AKwUvBzkkvHBntNfTnSrK1DHxDoQ+7W6Wog7CJMGwWMEVWEXdMtvpXJHUxE6Q/yqcitLL2KZkq+w4O3cycEFRo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ12PZBax+amGBeEksgp9AmchEOfKyQ4rfAFT70epgelJwXpApx
	+v4WaDBskWP6p5G71BLJaCqB1GMu+HXEuh/NmcT1uxCrZmAHbAn0HuNN
X-Gm-Gg: AYBFou0zQIf2W86Oy6A/2VnLOwMlZbnCuJ2jBVG1lWOIEZY6abmRcQCbqGpHwr5krZx
	qQqTOAOEpdIQeGADct5pggl998lC4OGqRZUIuH2L6Mub0LM/sjHQ5nXCRnsGBPoPs0W6pfkfrPY
	MUkXXHKjyJc+2SRTq6oERT02puj4svZD6n+cbg2yicirxTeRQk1QIzQiUtsUqqnjjZjuEYXxTPT
	lvbGxBKaCBYiO4lqgmLr4Qpd7LnurXViF5McayNdUUCcP5FAzDqNW8W9kkhQ/wTjiz7R3W6o2b/
	bneDwFiNZ1HVdYm/iFoWvFpNGUEET5GTCxXf5fw6a0KvMy/z7jMnWPw1HLY5tPLHR4FIRJ1lyXq
	mPyIPtNSl/4ULp7VsbgU99TCGP2p0QeaEF1K2UXOHXXGU5RjyOcgpb3vhMAyxQyknQw9pGKh+PF
	q32wl19DpCUNlzICFzPPXnCBhFvxM/cSwuFHxBd2xhuWSpts6h2aCa300=
X-Received: by 2002:a05:6000:2204:b0:487:2387:7c9 with SMTP id ffacd0b85a97d-488717202f9mr23496795f8f.14.1790593861393;
        Mon, 28 Sep 2026 04:11:01 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm29371081f8f.29.2026.09.28.04.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:11:00 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: check MREMAP_DONTUNMAP mlock accounting
Date: Mon, 28 Sep 2026 13:10:42 +0200
Message-ID: <20260928111055.482136-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MREMAP_DONTUNMAP keeps the source VMA in place, but clears its mlock flags
for the whole VMA while setting them on the destination VMA.  Two cases
leak mm->locked_vm as a result:

 - an unfaulted mlock-on-fault VMA moved behind itself self-merges, so the
   single resulting VMA loses the flags without the accounting being
   dropped;

 - a partial mremap() moves only part of the range, leaving the pages which
   are not moved accounted as locked in a VMA whose flags were cleared.

Add three cases to the MREMAP_DONTUNMAP selftest which mlock() the source
VMA, with and without MLOCK_ONFAULT, perform the operation and check that
VmLck comes back to zero once everything is unmapped.  Each case runs in
its own process, so it starts from a clean mm with VmLck at zero and a
failure cannot propagate to the cases which follow.

Verified on x86_64: the three cases fail on v7.3-rc5 and pass on
mm-unstable with the fixes from the "mm/mremap: fix two issues with
MREMAP_DONTUNMAP" series applied.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 tools/testing/selftests/mm/mremap_dontunmap.c | 273 +++++++++++++++++-
 1 file changed, 272 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 96ba537facf7..2ec58b6cdc9f 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -7,6 +7,8 @@
  */
 #define _GNU_SOURCE
 #include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
 #include <linux/mman.h>
 #include <errno.h>
 #include <stdio.h>
@@ -37,6 +39,61 @@ static void dump_maps(void)
 		}								\
 	} while (0)

+/*
+ * Same as mlock2.h's, plus an ENOSYS fallback for libc headers without
+ * __NR_mlock2.  It is not taken from the header because that also defines
+ * seek_to_smaps_entry(), which nothing here uses and which then warns
+ * (-Wunused-function).
+ */
+static int mlock2_(void *start, size_t len, int flags)
+{
+#ifdef __NR_mlock2
+	return syscall(__NR_mlock2, start, len, flags);
+#else
+	errno = ENOSYS;
+	return -1;
+#endif
+}
+
+/*
+ * Locked memory size in kB, as reported by /proc/self/status, which is
+ * mm->locked_vm accounted in kB.  Used to check that the mlock() accounting
+ * balances across a MREMAP_DONTUNMAP operation.
+ *
+ * Returns LOCKED_VM_UNKNOWN if it cannot be read: the callers run in a child
+ * whose exit status is the test result, so this must not exit the process or
+ * print anything the TAP output parser would act on.
+ */
+#define LOCKED_VM_UNKNOWN	((unsigned long)-1)
+
+static unsigned long get_proc_locked_vm_size(void)
+{
+	unsigned long lock_size;
+	char *line = NULL;
+	size_t size = 0;
+	FILE *f;
+
+	f = fopen("/proc/self/status", "r");
+	if (!f) {
+		fprintf(stderr, "cannot open /proc/self/status: %s\n",
+			strerror(errno));
+		return LOCKED_VM_UNKNOWN;
+	}
+
+	while (getline(&line, &size, f) != -1) {
+		if (sscanf(line, "VmLck:\t%8lu kB", &lock_size) == 1) {
+			free(line);
+			fclose(f);
+			return lock_size;
+		}
+	}
+
+	free(line);
+	fclose(f);
+	fprintf(stderr, "cannot parse VmLck in /proc/self/status\n");
+	return LOCKED_VM_UNKNOWN;
+}
+
 // Try a simple operation for to "test" for kernel support this prevents
 // reporting tests as failed when it's run on an older kernel.
 static int kernel_support_for_mremap_dontunmap()
@@ -335,6 +392,216 @@ static void mremap_dontunmap_partial_mapping_overwrite(void)
 	ksft_test_result_pass("%s\n", __func__);
 }

+/*
+ * Child exit codes for the accounting cases: any other exit code, and any
+ * signal, is reported as an error rather than mistaken for a leak.
+ */
+#define CASE_LEAK		2
+#define CASE_SKIP		77
+#define CASE_SKIP_ENOSYS	78
+#define CASE_SETUP_ERROR	79
+
+/* Report a setup failure from a case: the child's exit status carries it back. */
+static int case_failed(const char *where, const char *what)
+{
+	fprintf(stderr, "%s: %s: %s\n", where, what, strerror(errno));
+	return CASE_SETUP_ERROR;
+}
+
+/* Report a check which failed for a reason errno does not describe. */
+static int case_unexpected(const char *where, const char *what)
+{
+	fprintf(stderr, "%s: unexpected %s\n", where, what);
+	return CASE_SETUP_ERROR;
+}
+
+/*
+ * Only EPERM/ENOMEM are expected with a small RLIMIT_MEMLOCK, and ENOSYS means
+ * the kernel has no mlock2(); anything else is a genuine setup failure.
+ */
+static int lock_failed(const char *where, const char *call)
+{
+	if (errno == EPERM || errno == ENOMEM)
+		return CASE_SKIP;
+	if (errno == ENOSYS)
+		return CASE_SKIP_ENOSYS;
+
+	return case_failed(where, call);
+}
+
+/*
+ * Run one accounting case in a child, so that it starts with a clean mm and an
+ * empty VmLck, and report its outcome.
+ */
+static void run_locked_case(const char *label, int (*fn)(void))
+{
+	int status;
+	pid_t pid;
+
+	/* do not let the child flush a copy of our TAP output */
+	fflush(NULL);
+
+	pid = fork();
+	if (pid < 0) {
+		ksft_test_result_error("%s: fork: %s\n", label,
+				       strerror(errno));
+		return;
+	}
+	if (!pid)
+		_exit(fn());
+
+	if (waitpid(pid, &status, 0) == -1) {
+		ksft_test_result_error("%s: waitpid: %s\n", label,
+				       strerror(errno));
+		return;
+	}
+
+	if (WIFSIGNALED(status)) {
+		ksft_test_result_error("%s: killed by signal %d\n", label,
+				       WTERMSIG(status));
+		return;
+	}
+
+	if (!WIFEXITED(status)) {
+		ksft_test_result_error("%s: child did not exit\n", label);
+		return;
+	}
+
+	switch (WEXITSTATUS(status)) {
+	case 0:
+		ksft_test_result_pass("%s: locked memory released\n", label);
+		break;
+	case CASE_LEAK:
+		ksft_test_result_fail("%s: locked memory leaked\n", label);
+		break;
+	case CASE_SKIP:
+		ksft_test_result_skip("%s: mlock not permitted\n", label);
+		break;
+	case CASE_SKIP_ENOSYS:
+		ksft_test_result_skip("%s: mlock2 not supported\n", label);
+		break;
+	default:
+		ksft_test_result_error("%s: child exited with %d (see stderr)\n",
+				       label, WEXITSTATUS(status));
+		break;
+	}
+}
+
+/*
+ * An unfaulted mlock-on-fault VMA moved behind itself: the source and
+ * destination VMAs are adjacent and mergeable, and merging them clears the
+ * mlock flags of the single resulting VMA, leaking mm->locked_vm.
+ */
+static int case_mlock_onfault_self_merge(void)
+{
+	unsigned long locked;
+	void *source, *dest, *reserve;
+
+	/*
+	 * Two adjacent pages: the source VMA goes in the first, the
+	 * destination in the second, so the two are mergeable.
+	 */
+	reserve = mmap(NULL, 2 * page_size, PROT_NONE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (reserve == MAP_FAILED)
+		return case_failed(__func__, "mmap reserve");
+	if (munmap(reserve, 2 * page_size) == -1)
+		return case_failed(__func__, "munmap reserve");
+
+	source = mmap(reserve, page_size, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+	if (source != reserve)
+		return case_unexpected(__func__, "source address");
+
+	/* Locked on fault, but deliberately left unfaulted. */
+	if (mlock2_(source, page_size, MLOCK_ONFAULT))
+		return lock_failed(__func__, "mlock2");
+
+	dest = mremap(source, page_size, page_size,
+		      MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED,
+		      source + page_size);
+	if (dest == MAP_FAILED)
+		return case_failed(__func__, "mremap");
+
+	if (munmap(dest, page_size) == -1)
+		return case_failed(__func__, "munmap destination");
+	if (munmap(source, page_size) == -1)
+		return case_failed(__func__, "munmap source");
+
+	locked = get_proc_locked_vm_size();
+	if (locked == LOCKED_VM_UNKNOWN)
+		return CASE_SETUP_ERROR;
+
+	return locked ? CASE_LEAK : 0;
+}
+
+/*
+ * A partial MREMAP_DONTUNMAP of a locked VMA: all but the last page is moved,
+ * leaving the source VMA mapped.  Both the moved pages and the VMA left
+ * behind must give up their mlock accounting.
+ *
+ * The destination goes into a window with a guard page on either side, so that
+ * it is not adjacent to and cannot merge with the source VMA: this case must
+ * exercise the partial-copy accounting on its own.  The window's hole is
+ * smaller than the source mapping, so the source cannot land in it.
+ */
+static int case_locked_partial(int onfault)
+{
+	unsigned long num_pages = 3;
+	unsigned long span = (num_pages - 1) * page_size;
+	unsigned long locked;
+	void *source, *guard, *dest, *moved;
+
+	guard = mmap(NULL, span + 2 * page_size, PROT_NONE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (guard == MAP_FAILED)
+		return case_failed(__func__, "mmap guard");
+	dest = guard + page_size;
+	if (munmap(dest, span) == -1)
+		return case_failed(__func__, "munmap destination window");
+
+	source = mmap(NULL, num_pages * page_size, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (source == MAP_FAILED)
+		return case_failed(__func__, "mmap");
+
+	if (onfault) {
+		if (mlock2_(source, num_pages * page_size, MLOCK_ONFAULT))
+			return lock_failed(__func__, "mlock2");
+	} else if (mlock(source, num_pages * page_size)) {
+		return lock_failed(__func__, "mlock");
+	}
+
+	/* Move all but the last page, leaving the source partially mapped. */
+	moved = mremap(source, span, span,
+		       MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED, dest);
+	if (moved == MAP_FAILED)
+		return case_failed(__func__, "mremap");
+	if (moved != dest)
+		return case_unexpected(__func__, "destination address");
+
+	if (munmap(dest, span) == -1)
+		return case_failed(__func__, "munmap destination");
+	if (munmap(source, num_pages * page_size) == -1)
+		return case_failed(__func__, "munmap source");
+
+	locked = get_proc_locked_vm_size();
+	if (locked == LOCKED_VM_UNKNOWN)
+		return CASE_SETUP_ERROR;
+
+	return locked ? CASE_LEAK : 0;
+}
+
+static int case_locked_partial_mlock(void)
+{
+	return case_locked_partial(0);
+}
+
+static int case_locked_partial_onfault(void)
+{
+	return case_locked_partial(1);
+}
+
 int main(void)
 {
 	ksft_print_header();
@@ -348,7 +615,7 @@ int main(void)
 		ksft_finished();
 	}

-	ksft_set_plan(5);
+	ksft_set_plan(8);

 	// Keep a page sized buffer around for when we need it.
 	page_buffer =
@@ -361,6 +628,10 @@ int main(void)
 	mremap_dontunmap_simple_fixed();
 	mremap_dontunmap_partial_mapping();
 	mremap_dontunmap_partial_mapping_overwrite();
+	run_locked_case("mlock-onfault self-merge",
+			case_mlock_onfault_self_merge);
+	run_locked_case("mlock partial", case_locked_partial_mlock);
+	run_locked_case("mlock2 onfault partial", case_locked_partial_onfault);

 	BUG_ON(munmap(page_buffer, page_size) == -1,
 	       "unable to unmap page buffer");
--
2.55.0


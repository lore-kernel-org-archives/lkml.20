Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67982265629
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986790; cv=none; b=mS/RzcCnqOoD3Fxn8DOW+L2HoG3lGQlnuXVOi4VBszOuAN5Oen4sUtpuArEUSmrF4X3aVB1K78If6x4BT/FwogaSru/le9q5D3xjoWG1eSyN9Dprxl6GKeNs4zbUsV/IGiaTnMxKBu6zH3SWpEiO1HhJNarUvAPurz9KGNA6X/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986790; c=relaxed/simple;
	bh=7uPnfvKQ52KmVXElbuPkG+EFCcsPJomFSQLkr/hOcqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MCGaTsuM+z6NJFIefjrt8Zi3Z3C1GboGjOdx5KNc9PGzfc8hQPwfb62I0zX2l5/DzHay9qshj9c5alV8c9qT6h9B+IKeehfrHVveRYDge7EdmY6BJkEWIV3HzTJ8U5CpWxTBKJOzp3cLbh0g/rzeYbVUzFq2Nv48YEucoQgNt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GO491hjN; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GO491hjN"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso51839a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986789; x=1791591589; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZE8POibTlx81KQbGmprkmVIECJXXinoiCqckkz2u65g=;
        b=GO491hjN51rGLSPFBtF0RtvqmfPBEmw3aHRoIwqwAqOw45SvA7xRH9wuXAWYPA9wi5
         XCodn/WgyVUmomWv4A4YZi3VexAP8KF8XWvGrhLpYzaKYXG319zJK5oj5G63wXCmly3e
         ff+Yw1lCpm8fveZ8jP9b3Q5nwMCXxAJ9rnCZI1POS/gq5S6MSAf5r2HkSNL7kdj3XdmI
         b9Ezrf3xeoPJe6pwQZB9NGc2MdghVphc6sec4tVs3igv8G2PG4AyDXjsOKxCEkwLqHsL
         Ya7rBjCaMNKrXaOFfykdouZerM4P/tQXHTLX31OaMzmuNabpemlLitD1asBdpGewHuqh
         9YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986789; x=1791591589;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZE8POibTlx81KQbGmprkmVIECJXXinoiCqckkz2u65g=;
        b=ZfWDsEJ5b+kElRfCI0X2diVcSZXx/AAjfSWFhqzsgPTGZ7/z965JFqR03RpGO0Nvys
         CyAyqC63BbOqEIU9ZSk8vTNI/kubm7VBgc+7Ogc2AlDZ8lzj6AoTYu56xDbx2H9QCF93
         +UZQLHdYBp7x/4ayDfkZKf6ZtZLcqX1Htj1PknanmybUdZUmbOyQYwdjAIu+jYrIXEKh
         f6zz5nURefLBE+ATF439dv57XZCmO1Nvg/JZq+AqaYzQB+E1+QvQL19AqBgH+z0yrYEE
         3PVWI3EJ1ZqGbYHUPNM3CO3UsbncCe38NLvB3Damf2C+Oi4Fx3uLyWgnvbcPBhpg0zPq
         W+fw==
X-Forwarded-Encrypted: i=1; AKwUvBz4ExngBzLB5IGhnuVxpTMuJwpyGrnAhAKXSF80HwbHKdo8BDr/PoGoTEsiTLI1ExowSrl0tEhlTjEAdps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkGFAxjbvrBlw9lgHDCUO5g7+UqWajwh8JRsB09IloL0IfrK2f
	3QAca6YiHMQU8DCAxEHkuJTSnpZEtVE/Qp9aqpSRSbjgzW3VpjsYwVl+pU8Bhp1uhtw30CQUxDN
	PNP0dHLoGxf5wv4Joz09mcw==
X-Received: from pjbfh20.prod.google.com ([2002:a17:90b:354:b0:3a4:8aa5:b794])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:52c7:b0:3a7:f45:5cca with SMTP id 98e67ed59e1d1-3a70f4568b5mr732612a91.14.1790986788466;
 Fri, 02 Oct 2026 17:19:48 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:18:59 +0000
In-Reply-To: <20261003001859.502725-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003001859.502725-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003001859.502725-2-jthoughton@google.com>
Subject: [PATCH v4 2/2] mm: selftests: Adjust the MADV_COLLAPSE selftests for uffd-minor
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, zokeefe@google.com, 
	hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, jthoughton@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The behavior of MADV_COLLAPSE with uffd-minor VMAs has changed.
Previously, MADV_COLLAPSE would install PMDs in parts of a VMA where
PTEs may be missing, essentially suppressing userfaultfd minor faults.
Now, MADV_COLLAPSE returns -EINVAL for uffd-minor VMAs. Update the
selftest to demonstrate this new behavior.

The selftest, if left unmodified, will SKIP when it gets EINVAL back
from MADV_COLLAPSE.
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 69 ++++++++++++++++++--
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 580178630ede..ab195c2c44d3 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -518,19 +518,32 @@ static void uffd_wp_fork_pin_with_event_test(uffd_global_test_opts_t *gopts, uff
 	uffd_wp_fork_pin_test_common(gopts, args, true);
 }
 
-static void check_memory_contents(uffd_global_test_opts_t *gopts, char *p)
+static int __check_memory_contents(unsigned long offset, unsigned long nr_pages,
+		uffd_global_test_opts_t *gopts, char *p)
 {
 	unsigned long i, j;
 	uint8_t expected_byte;
 
-	for (i = 0; i < gopts->nr_pages; ++i) {
+	if (nr_pages + offset < nr_pages)
+		err("overflow in memory check");
+	if (nr_pages + offset > gopts->nr_pages)
+		err("out of bounds memory check");
+
+	for (i = offset; i < offset + nr_pages; ++i) {
 		expected_byte = ~((uint8_t)(i % ((uint8_t)-1)));
 		for (j = 0; j < gopts->page_size; j++) {
 			uint8_t v = *(uint8_t *)(p + (i * gopts->page_size) + j);
 			if (v != expected_byte)
-				err("unexpected page contents");
+				return 1;
 		}
 	}
+
+	return 0;
+}
+
+static int check_memory_contents(uffd_global_test_opts_t *gopts, char *p)
+{
+	return __check_memory_contents(0, gopts->nr_pages, gopts, p);
 }
 
 static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_collapse, bool test_wp)
@@ -538,8 +551,8 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 	unsigned long p;
 	pthread_t uffd_mon;
 	char c = '\0';
-	struct uffd_args args = { 0 };
-	args.gopts = gopts;
+	struct uffd_args args = { .gopts = gopts };
+	bool bad_contents;
 
 	/*
 	 * NOTE: MADV_COLLAPSE is not yet compatible with WP, so testing
@@ -564,20 +577,59 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 	if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
 		err("uffd_poll_thread create");
 
+	if (test_collapse) {
+		/*
+		 * Read just a single page and try collapsing. The collapse
+		 * should either be rejected or be a no-op.
+		 */
+		if (__check_memory_contents(0, 1, gopts, gopts->area_dst_alias))
+			err("unexpected memory contents before collapse");
+
+		/* MADV_COLLAPSE might return EINVAL for uffd-minor VMAs. */
+		if (madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
+			      MADV_COLLAPSE) && errno != EINVAL)
+			err("MADV_COLLAPSE failed unexpectedly");
+		/*
+		 * If the above collapse mapped pages that were not explicitly
+		 * CONTINUE'd, the below __check_memory_contents() will not
+		 * fault on some pages, resulting in incorrect contents.
+		 * The page we already touched should not be unmapped, so a
+		 * second userfault on it should not be generated.
+		 */
+	}
+
 	/*
 	 * Read each of the pages back using the UFFD-registered mapping. We
 	 * expect that the first time we touch a page, it will result in a minor
 	 * fault. uffd_poll_thread will resolve the fault by bit-flipping the
 	 * page's contents, and then issuing a CONTINUE ioctl.
 	 */
-	check_memory_contents(gopts, gopts->area_dst_alias);
+	bad_contents = !!check_memory_contents(gopts, gopts->area_dst_alias);
 
 	if (write(gopts->pipefd[1], &c, sizeof(c)) != sizeof(c))
 		err("pipe write");
 	if (pthread_join(uffd_mon, NULL))
 		err("join() failed");
 
+	if (bad_contents && test_collapse) {
+		uffd_test_fail("unexpected memory contents after collapse");
+		return;
+	}
+
+	if (bad_contents) {
+		uffd_test_fail("unexpected memory contents");
+		return;
+	}
+
 	if (test_collapse) {
+		/*
+		 * MADV_COLLAPSE will fail unless userfaultfd-minor is
+		 * unregistered.
+		 */
+		if (uffd_unregister(gopts->uffd, gopts->area_dst_alias,
+				    gopts->nr_pages * gopts->page_size))
+			err("uffd_unregister before MADV_COLLAPSE failed");
+
 		if (madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
 			    MADV_COLLAPSE)) {
 			/* It's fine to fail for this one... */
@@ -593,7 +645,10 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 		 * This won't cause uffd-fault - it purely just makes sure there
 		 * was no corruption.
 		 */
-		check_memory_contents(gopts, gopts->area_dst_alias);
+		if (check_memory_contents(gopts, gopts->area_dst_alias)) {
+			uffd_test_fail("unexpected memory contents");
+			return;
+		}
 	}
 
 	if (args.missing_faults != 0 || args.minor_faults != gopts->nr_pages)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


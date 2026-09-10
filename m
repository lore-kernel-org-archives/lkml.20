Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE63803E8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789007657; cv=none; b=e0mIz2K2m0743Hsky3dpt44EsptkUDj84JPZQht+R1ETnD2uNt/h43KccBiu/jV55UNZnHrKwvvv0eWKAnSoLgBoi7G0yB3TyDd64Xd8gdh+3Nt5XDtZ7L/aA5cPGeN+Sc5yP/wgOIRNTtEZmLkHg7/Kuo7SMd8GWB9+1xcIxPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789007657; c=relaxed/simple;
	bh=sNUsnOz3881yNGNwfqwE8niZ2cr7QsyszKIYdVRvJ5o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UK/lFm33fRk8aZUKHTjbjIUHP/D2708ESslBpG/GPnNCSNBe3lyTmxGypvbJIoUzbCMKss0YVaSvw9wONmGMCppFkcETELGQcfiYBrz8IafxoYQYIZ4lIjW1GnxrPMSndzf6mP4ozJSpUR6v5tgb2Cz2nwQmjM0QCiAJxgc3UYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a2Ji4Vbm; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a2Ji4Vbm"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so6489779b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789007656; x=1789612456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HN8r1OTKJ5otXSKxSHXxiuMnoDfjm4NiMKL8K3DQtoE=;
        b=a2Ji4VbmDnPBH+46m78m/HnU4ic4KWA0XBYW0HXyYQ7fmcr9QSpcgbd98pesF0uZJO
         j8LslOrjcW0fXEmifeyEBk5ldSJM8CTfKF8aOeB6vzKVXHKceFWDGocl8p7bOfAcwYh1
         e0Ww6I6EYGTIVViL/9RfCdE+Nvq6ZdR2P2m0IqDcRve9XqPq8RGUjw+K9b0+UPrHuXKp
         r2g57g1xvTnmu8/UGtUPHqSsaXpqNd13m5wFNxnf01y6jp/L+yeVb1topyJxn7Iw+J5x
         zJ08yzIfFcj381Dn1AzulG03KDWdKY40N+Mnp/X3A28LNdCyLarJy7byNNd8q3+g8Fjm
         pxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789007656; x=1789612456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HN8r1OTKJ5otXSKxSHXxiuMnoDfjm4NiMKL8K3DQtoE=;
        b=IP/d6pc61bsZ5FK4xPsfsx6br4q0OXRiRyCOayB+GzSf/h9TJ0OAEhxAEYFwmA/rOj
         Q52eVMBgrBd34UmvUQYDMgfyxeHZN1wIHfo5NRzG8FyP58UiOEd11RrxkyOLNkAtIJtA
         bQPOz7y1sztEtY6S2b2rDm1pzSeab3cQTHw3Eyl6RhDjYXaR9PrYvpwKZUkfCKaQqekl
         shNYuy9vkrZqVmJ9oWTbes/p1ruPaRkV5TaQuETixVvsEvAhIbA+cLcka+/5pyNFTFWc
         2YLekbasyhvS8s3VJOSYxWa5xUUMzV8iGGgj5vwfmZ/CtsIELdbwaS8B4MhJiUnqx3HV
         Uk0w==
X-Forwarded-Encrypted: i=1; AKwUvByMrsxDnuAIAVRpDcVK99J6Mm6HiGzaD2Z4uvdgWsOLiSr74LEUp1xeCy983bu1dLK686X9mOuHc/p4CHE=@vger.kernel.org
X-Gm-Message-State: AFuF++l4XU2wHEtuuTd0kR3b+7FK884QErwSisCLvR1AzwHpSEGVi9Nn
	ZMo4B/YX8YIiJFQsH84MrXQXebOxUZ2SJOd6rwk+UM2oOBvG6zczHQ+nl7JtVDW0READV/Em5Lr
	YEJ5h+K/ZdR+bkaWTdYthww==
X-Received: from pfbfy14.prod.google.com ([2002:a05:6a00:828e:b0:868:6325:1e0f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:17a6:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-86948e29d5amr3444561b3a.25.1789007654727;
 Wed, 09 Sep 2026 19:34:14 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:34:11 +0000
In-Reply-To: <20260910023411.514987-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910023411.514987-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910023411.514987-2-jthoughton@google.com>
Subject: [PATCH v3 2/2] mm: selftests: Adjust the MADV_COLLAPSE uffd-minor selftests
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

The behavior of MADV_COLLAPSE with uffd-minor VMAs has changed:
MADV_COLLAPSE will no longer install PTEs where none existed before.
Update the selftest to demonstrate this new behavior.

On an unpatched kernel, the test will hit "unexpected memory contents
after collapse".

If the selftest is left unpatched but the kernel is patched, the
selftest will SKIP when it gets EINVAL back from MADV_COLLAPSE.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 75 ++++++++++++++++++--
 1 file changed, 68 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index ef9b3956bdcf..6f2360f9b75d 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -518,19 +518,34 @@ static void uffd_wp_fork_pin_with_event_test(uffd_global_test_opts_t *gopts, uff
 	uffd_wp_fork_pin_test_common(gopts, args, true);
 }
 
-static void check_memory_contents(uffd_global_test_opts_t *gopts, char *p)
+static int __check_memory_contents(unsigned long offset,
+				   unsigned long nr_pages,
+				   uffd_global_test_opts_t *gopts,
+				   char *p)
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
@@ -539,6 +554,8 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
 	pthread_t uffd_mon;
 	char c = '\0';
 	struct uffd_args args = { 0 };
+	unsigned long checked = 0;
+	bool bad_contents;
 	args.gopts = gopts;
 
 	/*
@@ -564,24 +581,65 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
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
+		madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
+			MADV_COLLAPSE);
+		/*
+		 * If the above collapse mapped pages that were not explicitly
+		 * CONTINUE'd, the below __check_memory_contents() will not
+		 * fault on some pages, resulting in incorrect contents. The
+		 * PTE for the first page may get retracted, so avoid checking
+		 * that page, as we might take a second fault, flipping the
+		 * contents a second time.
+		 */
+		checked = 1;
+	}
+
 	/*
 	 * Read each of the pages back using the UFFD-registered mapping. We
 	 * expect that the first time we touch a page, it will result in a minor
 	 * fault. uffd_poll_thread will resolve the fault by bit-flipping the
 	 * page's contents, and then issuing a CONTINUE ioctl.
 	 */
-	check_memory_contents(gopts, gopts->area_dst_alias);
+	bad_contents = !!__check_memory_contents(checked, gopts->nr_pages - checked,
+						    gopts, gopts->area_dst_alias);
 
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
+		/* MADV_COLLAPSE should succeed with userfaultfd unregistered. */
 		if (madvise(gopts->area_dst_alias, gopts->nr_pages * gopts->page_size,
 			    MADV_COLLAPSE)) {
-			/* It's fine to fail for this one... */
-			uffd_test_skip("MADV_COLLAPSE failed");
+			uffd_test_fail("MADV_COLLAPSE failed");
 			return;
 		}
 
@@ -593,7 +651,10 @@ static void uffd_minor_test_common(uffd_global_test_opts_t *gopts, bool test_col
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
2.55.0.1007.g17ff1f9808-goog


Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9DB282F10
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986918; cv=none; b=ddZkD2RKsqd+WxysPYLs95nGCVJxEX/yG0hiahnXTFAM6ZLC5Q1RY5r+DlZh6z6dnxPAXs3LRk0DN7Y2hW4NyGfX62ZKqNnCKGBgRU/qY8p2wwh7hTdFDOCMo/1goQ7rCwMCjQBW7bAtyhL20Z1x6Vqp8iuWsgyQ8Q4Bt1/JmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986918; c=relaxed/simple;
	bh=pafX7MiCbVkdrwDdtH8rw1ni7zmRH1GTgaLe/pWhugg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F8krHuFqbsJ8Jid7y9fkycZK1uf8HQeFCa8hR1gVCEkecFQdTkEHzhbal568/MCs6HDSBBZqFmj7TN/N+IS6G77nsEw8f/0/J0hTy5RATe7dTFUF9CU/8hvgZdsnB1/vmJJBFvsOeq+/Y/UAOqzwstIY3Iq2szL8lwQyMLc3yek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fsp7/USr; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fsp7/USr"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so53800a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986913; x=1791591713; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/T777lhuRfNwSeNxFtz2iSXI/VIM8j8xuLCcKpt+bw=;
        b=Fsp7/USr4j6W6CCh+iSReD9vwJkUhd2pHoFOr/niy32jdt4zD4MAVy2goVmwRNhoEI
         aTp4Pu5QNLYmWtHA+/gURpdWPsvMq/01z5JAfdei6iSGLiwQuWlCQqoK672tJ/tYePd+
         n2gmCHidJ+IF3iM0V7Dt7arPoXrgeseqyPOjmGgPbfYU9wUuy0gBA9v8E1S5NRqm73iY
         wcoJoZnGPzL5ClGLbMx5y+FTgihfngs0HjG4C1RjMqxPxI0cPaKfAp2hKiRoRnuocyVp
         d9VvaFJ7Pj55oPa37sRXguMWj8LbV6nQeU4/bXFqOonDwq5/zk1/mYkPo2KBmhRZOjQK
         yUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986913; x=1791591713;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/T777lhuRfNwSeNxFtz2iSXI/VIM8j8xuLCcKpt+bw=;
        b=bXd1uAzjG9m7xIP0fIDXuf06VH1eCTmolom410MWAFOE88h19ACa2hz0wJw1RkEXr1
         3g9803p2vebi80I9S+v6WX9i+jHPHpwDeJOWzXcYFlgPfMcsXyUQ3MQHKvw8w9AElHD2
         ElE+dWgm2RDnu55mLeXnUVgAWwQU0Yxn662YbSHx4spKTZsEdZq2q/bD9hTzng89eARz
         ya3nvS7zBWsobfuQdTK1nKPj3RMdwNuv1tSVIHvUo8erX4Dfjj9w0QUpReFEMB4qKfGy
         oMUPJ+28gyFKSOEGvw0aJfHMhqXwXrgxu8u3TbB5n+tNSaKnTViLk7qpYnov60raEHEp
         YMeg==
X-Forwarded-Encrypted: i=1; AKwUvByC52es9LrqYcBa2VdZwE7qTENOE7WJQYmokM7lssUi6WMenSS9OstIlJm0R1cfF3K7V15JOFFuQO7odRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfNayOPLTtvP1qjKbxyxZqlszWDYsmrGqp63KFCym2QcQ18kPg
	mKsc7IMSadu2+xKDflVIxvriqyUCKBWKNsA04UMqttsIGKkMVuYxyRNYl9GK5B+gyp+nYW1OkOD
	aNpGInEP7cYFNpytltVQkaA==
X-Received: from pjbdw15.prod.google.com ([2002:a17:90b:94f:b0:3a6:7ee4:e327])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:dfd0:b0:3a4:bc68:310e with SMTP id 98e67ed59e1d1-3a6ce7f684amr3283851a91.39.1790986912580;
 Fri, 02 Oct 2026 17:21:52 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:23 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-21-jthoughton@google.com>
Subject: [PATCH v2 20/20 DO-NOT-MERGE] selftests/mm: Add HVO pmd-split fault
 injection tests
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Run the stress test with PMD splitting failure injection enabled (if
supported). Keep in mind that vmemmap PMDs are only ever split, never
collapsed back to PMDs, so run this step first, before the main stress
test.

Assisted-by: LLM
Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
index 94357a4a45c2..2c874d15399a 100755
--- a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -4,13 +4,16 @@
 # Stress test for HugeTLB vmemmap optimization (HVO).
 #
 # Phases:
-#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#   1. pmd-inject: churn the pool with fail_hugetlb_vmemmap_pmd enabled.
+#      Runs first because vmemmap PMDs are only split once, so later phases
+#      would leave few PMD splits to fail.
+#   2. accounting: allocate N hugepages, check that nr_memmap_pages +
 #      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
 #      then free them and check it returns to the baseline.
-#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#   3. stress: churn the pool (optimize/restore) while concurrently reading
 #      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
 #      and optionally reading page_owner and offlining/onlining memory.
-#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#   4. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
 #      both the optimize rollback and the restore (partial HVO) paths.
 #
 # After each phase the pool is drained back to its original size, memmap
@@ -252,7 +255,7 @@ cleanup() {
 	local blk t
 
 	stop_workers
-	for t in fail_hugetlb_vmemmap_pte; do
+	for t in fail_hugetlb_vmemmap_pte fail_hugetlb_vmemmap_pmd; do
 		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
 	done
 	if [ -f "$tmpdir/hotplug" ]; then
@@ -333,6 +336,7 @@ accounting_phase() {
 
 echo "$marker" > /dev/kmsg
 
+stress_phase pmd-inject fail_hugetlb_vmemmap_pmd
 accounting_phase
 stress_phase stress ""
 stress_phase pte-inject fail_hugetlb_vmemmap_pte
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


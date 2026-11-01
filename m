Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547908;
	b=KK04w+VBz6uYaU0BNLV1GWTxcTIi3eBvagY/XssquZJnUJF3yqkj1w7JaWhnZqvH0rj3
	 Fc2j72ua9RuHL+kJAFVBdWgxJzciZUfh0GmgdAh35Ey1gN3jzcCE6LyP/RrO8H/mZ9zmw
	 05nFXiomJhIFwrKEyl4LpH3QSLZKaAhKSw4YomirX0MjPSG1/QEcjzWAgIYYQDLd0f+3o
	 gLfOSSycHLcVT/1QPtz9FkI7cgPYjT71tdfaA0VKddS8M3CFWpSN67tRqF4Rsr1XGVIgh
	 5+fQkwrR4yBw/7hrrZVVcEUm5OI8LagbhwkDY1DSiy+G/GbekQEJEqVZNn5QFz6oiwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YMgsbDyfk5xc2AQfHD/KzZ6mFWECrL7raaZo0D0MYyc=;
	b=XZjalw+YrGuu+RG6WqZpp84rZqPaFc3gD1D8FtBe8g7Amk7Ri88m5VCb4/KVssNa+p/U
	 LkYIDZZUyBpoiYPjINSgwzajUBgZJWBD/GlrvdfrQZZW3UmLCJE8SFE83xEMOMJPNYs1c
	 GbDkunZjTAQsXCLmrpPXGm5jynyDqwsKgqFbS6n06gCPWYOAeYKNimBxmooi8hivtwrmf
	 kBn9iy6GJCDxGR5HbHtDSURnt8PHDiSaEdsqMJjkjN35PwtyqntovAPsGMb8/MJr29QJv
	 O3Gn/ghYZqcJQa0S3zZFa4fWunKIPoCh5EPactaIHf8SAN6DxRvcpYh50kYkKPv6lTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--surenb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEVTmJjR;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5C2606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5C2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEVTmJjR
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5360510eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793547907; x=1794152707; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMgsbDyfk5xc2AQfHD/KzZ6mFWECrL7raaZo0D0MYyc=;
        b=BEVTmJjR/as07qvcR1T/vZWhaWcscpoDqcGov0FMdGPyaWajqgDfFO8hdnXIv6fx74
         cIinwpA5oUxrq78By2lw2Uoyb/g29H6H6YE8+KqRYRnk6HEYSarb6e0+VMWyc8i1Ivbs
         h59MD7YgnCMSc3/DjQak+FzpgTZRKpAzTluP0nKB+OJzM8pPlVhyuJ0FiaW8+BBtP3rW
         7x0uJBxEqge5R17kahvQ/tdQEzebTDmsD2Fbbg81Sb5MrGk9/ONJQn/agoWMetdPqrtn
         r5aKQicLlFyy35H/7vwaaPeCJRuiB3EqpQjLOgPk/y2+5IK9+PyVzDygwqfoHI6TNhyX
         D+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547907; x=1794152707;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMgsbDyfk5xc2AQfHD/KzZ6mFWECrL7raaZo0D0MYyc=;
        b=KhOchCTrIGb2oVomlKp+TcIPFPK0v0hUW0nXw6cA9bFYI6JwT2TbfyQD0pJr5dTpZ/
         kd60+6SxuJXeslgvvxIwz1ru5poMNS/WbUziS6HjdNIRJ+Eenzw9o+hueALW2NXDXozj
         wIc2Duecj2FZ5vQb7V1Upe+RBskdO+GCgcS1a4vUToyHAP6yQFUn/wxD2fs0z5Hyja5x
         zasAzOpiEilVYnxp4fhRjuZWmgBw3Ubkq/xN9o5QlYvlMjE9EfHxUK2WRHiZ23GdL9BR
         +blRyQPKEdw0pF/gTH5o5F8TQhlkGZt8gCG62+KgLeOuk6SqpS47e/fMQsbXNRBNrpkY
         jcpA==
X-Forwarded-Encrypted: i=1; AKwUvBxxx4by2cldY9OW8ZgwcVd2GrhSYb9IcE+UMmcOnRZLrcghoobCywdqcwsNDYwjmP/c8VpVy6wM/oH+16E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8952hez9pVeL4utmIbPjP3I4JEbu4lPDh6u2WcvTP5TSUZsHKv
	2Uf5v4PqZ08zDLcwKv3CZg/TS5PBGVBlhPNxtRItiu1epHdanwNKuPZTRbZLGYP1F64ghwU8KJd
	0iv2mcQ==
X-Received: from dybhy42.prod.google.com ([2002:a05:7301:42a:b0:347:7fea:9fec])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6183:20b0:36a:1089:9836
 with SMTP id 5a478bee46e88-36a423c8988mr10973150eec.15.1793547906897; Sun, 01
 Nov 2026 07:45:06 -0800 (PST)
Date: Sun,  1 Nov 2026 07:45:03 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261101154503.3203036-1-surenb@google.com>
Subject: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"

Pss metrics can be affected by map count even if VMA tree stays unchanged,
therefore tests checking VMA tree integrity can't use them. Use Rss instead
and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
double-counted.

To ensure all test VMAs are populated with anonymous pages, remain
mergeable across VMA operations, and do not have their Rss changed by
memory reclaim:
- Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
  all test VMAs remain writable and MAP_POPULATE faults in anonymous pages
  (rather than the shared zero page, which is not accounted in Rss).
- Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
  merge_vma() so the first page of the split VMA stays resident.
  mprotect(..., PROT_NONE) splits the VMA without unmapping the first page
  (pte_present() remains true for PAGE_NONE PTEs), and
  mprotect(..., self->mod_info->prot) merges it back. Both parts of the
  split VMA retain their non-zero Rss.
- Lock all present pages in the child with mlockall(MCL_CURRENT |
  MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
  alter Rss during the test.
- In remap_vma(), unlock next_addr before mremap(..., MREMAP_DONTUNMAP)
  so next_addr is not split, use mmap(..., MAP_FIXED) in patch_vma() to
  merge the middle VMA back into addr, and exclude smaps_rollup tests
  from test_maps_tearing_from_remap since remapping moves and unmaps the
  page from next_addr.

Fixes: ca5480fb53fa ("selftests/proc: add /proc/pid/smaps_rollup tearing tests")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@intel.com
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Changes from v1 [1]:
- fixed the way the odd VMAs are populated to avoid mapping zero pages
- used mprotect for splitting/merging VMAs to prevent split_vma() from
  unmapping and freeing the first page
- mlock all areas to keep Rss unchanged under memory pressure,
  per Pedro Falcato
- exclude smaps_rollup tests from test_maps_tearing_from_remap because
  remapping a populated VMA affects Rss metric

[1] https://lore.kernel.org/all/20261028051312.1505295-1-surenb@google.com/

 tools/testing/selftests/proc/proc-maps-race.c | 53 ++++++++++---------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-maps-race.c b/tools/testing/selftests/proc/proc-maps-race.c
index bf4c5073f6fc..6025aea68190 100644
--- a/tools/testing/selftests/proc/proc-maps-race.c
+++ b/tools/testing/selftests/proc/proc-maps-race.c
@@ -528,13 +528,10 @@ static bool compare_smaps_rollup(FIXTURE_DATA(proc_maps_race) *self,
 		struct smaps_rollup_stats *actual)
 {
 	/*
-	 * Clean/dirty metrics might change but Pss-related ones
-	 * should stay constant.
+	 * Clean/dirty metrics might change. Pss depends on map count and might
+	 * change as well. Rss should stay constant.
 	 */
-	if (cmp_smaps_rollup_stat(expected, actual, Pss) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Anon) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_File) &&
-	    cmp_smaps_rollup_stat(expected, actual, Pss_Shmem))
+	if (cmp_smaps_rollup_stat(expected, actual, Rss))
 		return true;
 
 	print_smaps_rollup_stats("Expected stats:", self, expected);
@@ -637,14 +634,13 @@ static bool query_addr_at(int maps_fd, void *addr,
 static inline bool split_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
 	/* PROT_NONE differs from both readable neighbors. */
-	return mmap(self->mod_info->addr, self->page_size, PROT_NONE,
-		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
+	return mprotect(self->mod_info->addr, self->page_size, PROT_NONE) == 0;
 }
 
 static inline bool merge_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
-	return mmap(self->mod_info->addr, self->page_size, self->mod_info->prot,
-		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
+	return mprotect(self->mod_info->addr, self->page_size,
+			self->mod_info->prot) == 0;
 }
 
 static inline bool check_split_result(struct line_content *mod_last_line,
@@ -681,6 +677,12 @@ static inline bool check_shrink_result(struct line_content *mod_last_line,
 
 static inline bool remap_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
+	/*
+	 * Unlock next_addr so MREMAP_DONTUNMAP does not split it.
+	 */
+	if (munlock(self->mod_info->next_addr, self->page_size * 3) != 0)
+		return false;
+
 	/*
 	 * Remap the last page of the next vma into the middle of the vma.
 	 * This splits the current vma and the first and middle parts (the
@@ -694,8 +696,9 @@ static inline bool remap_vma(FIXTURE_DATA(proc_maps_race) *self)
 
 static inline bool patch_vma(FIXTURE_DATA(proc_maps_race) *self)
 {
-	return mprotect(self->mod_info->addr + self->page_size, self->page_size,
-			self->mod_info->prot) == 0;
+	return mmap(self->mod_info->addr + self->page_size, self->page_size,
+		    self->mod_info->prot,
+		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) != MAP_FAILED;
 }
 
 static inline bool check_remap_result(struct line_content *mod_last_line,
@@ -759,11 +762,17 @@ FIXTURE_SETUP(proc_maps_race)
 
 		for (i = 0; i < mod_info->vma_count; i++) {
 			mod_info->child_mapped_addr[i] = mmap(NULL, self->page_size * 3, prot,
-					MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+					MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
 			ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAILED);
 			/* change protection in adjacent maps to prevent merging */
-			prot ^= PROT_WRITE;
+			prot ^= PROT_EXEC;
 		}
+		/*
+		 * Lock all present pages in memory so memory reclaim cannot
+		 * change RSS during the test, and use MCL_ONFAULT so
+		 * mremap() expansion does not populate new pages.
+		 */
+		ASSERT_EQ(mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT), 0);
 		signal_state(mod_info, CHILD_READY);
 		wait_for_state(mod_info, PARENT_READY);
 		while (true) {
@@ -833,10 +842,10 @@ FIXTURE_SETUP(proc_maps_race)
 	for (int i = 0; i < mod_info->vma_count; i++) {
 		if (mod_info->child_mapped_addr[i] == (void *)self->last_line.start_addr) {
 			mod_info->addr = mod_info->child_mapped_addr[i];
-			mod_info->prot = PROT_READ;
-			/* Even VMAs have write permission */
-			if ((i % 2) == 0)
-				mod_info->prot |= PROT_WRITE;
+			mod_info->prot = PROT_READ | PROT_WRITE;
+			/* Odd VMAs have exec permission */
+			if ((i % 2) != 0)
+				mod_info->prot |= PROT_EXEC;
 		} else if (mod_info->child_mapped_addr[i] == (void *)self->first_line.start_addr) {
 			mod_info->next_addr = mod_info->child_mapped_addr[i];
 		}
@@ -1066,7 +1075,6 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 	struct line_content remapped_first_line;
 	struct line_content restored_last_line;
 	struct line_content restored_first_line;
-	struct smaps_rollup_stats orig_stats;
 
 	wait_for_state(mod_info, SETUP_READY);
 
@@ -1080,8 +1088,6 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 	report_test_start("Tearing from remap", self->verbose);
 	ASSERT_TRUE(capture_mod_pattern(self, &remapped_last_line, &remapped_first_line,
 					&restored_last_line, &restored_first_line));
-	if (self->maps_file == SMAPS)
-		ASSERT_TRUE(parse_smaps_rollup(self, &orig_stats));
 
 	/* Now start concurrent modifications for self->duration_sec */
 	signal_state(mod_info, TEST_READY);
@@ -1134,11 +1140,6 @@ TEST_F(proc_maps_race, test_maps_tearing_from_remap)
 				     vma_end - vma_start == self->page_size * 3) ||
 				    (vma_start == self->last_line.start_addr + self->page_size &&
 				     vma_end - vma_start == self->page_size));
-		} else {
-			struct smaps_rollup_stats stats;
-
-			ASSERT_TRUE(parse_smaps_rollup(self, &stats));
-			ASSERT_TRUE(compare_smaps_rollup(self, &orig_stats, &stats));
 		}
 		clock_gettime(CLOCK_MONOTONIC_COARSE, &end_ts);
 		end_test_iteration(&end_ts, self->verbose);

base-commit: b61fa14ce6bcbba2cb9a96feea31b760226d6b43
-- 
2.56.0.317.g454f8302e1-goog


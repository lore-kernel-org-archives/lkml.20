Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E6456C63B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000698; cv=none; b=VYNfJYAQDAYQBHQT9iQIPxJb0Ug/2Bkgej3c5l4dhhB0h7fTxflNSzFKKFj6Wye+IaCC1aEOePIxnDCeLkuzgATOLL3F6cw/C9ipprq9tYIeKVUhdrmTDs6mjxLfLuK3fJr8NrHfmJ+sVJ78uehPasaaBbQeutqULZnAHlosKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000698; c=relaxed/simple;
	bh=HBt/1d0Jv3UjL6OKaXNhIHKOgd3SR6AWUE1zCkdfaFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgU+eaeLm8Rv7yPRR1Q8Wuivd9T326wLHl6wvo7gV0Ff2mvFfxYerv05J+1f8t6F6uN1Qb4arHBNNzVOukrLyRSfxDn417l+1OBEebD3fDgw9quSubAIMPUgizEubcNDI4XkwXxkOuz9EcqkkBpxy3M8a6lJREh8A8j+z7MWpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B6PYV2vc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B6PYV2vc"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917c04630c2so56179296d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000695; x=1792605495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4y6AvoDjRL3MjFRJLFGO2/ddqJNiHaVlDDXEV/4hBQ=;
        b=B6PYV2vcBpx38nPErbZk9NPYcoHh+3TFVTQ6yriWLTTbpBplVXlhM2SwPVJWtBYZf2
         WpvoZ09jdWhQtgF2GhsPYUmWMy2mxO+xu+AZHIdtNDDaH89NnYTJ3zN7RdHtONTE8WF2
         N5eIOmowXqJbSJUC7KDJI7GiNd++D4WvFXdQjC9z9zQYMiL7HCYAJcIegs2ZoRSlyXyT
         9bOFBUzPvvDuSPBkpHCvxOrlZUI1vBhhjrVD+C2EFo75lrXIMIYb1EXV+TTPQYTZ3d1+
         U5MnefQo37S+JKeHM+K/AGLmOymEVSedZNKvL+W0k9qBqWgv9Y143UszrWY+I9esDE4c
         muAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000695; x=1792605495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4y6AvoDjRL3MjFRJLFGO2/ddqJNiHaVlDDXEV/4hBQ=;
        b=taiOHcRXZ1Ifbq7rl4QG9a6WCdBu3QFBj4su2qOzY5i2pncmA6tOIj+ffoU2i2y0cW
         q/OuR4mnzI+Gis2j4gpT1rGuKvIboFi04mgSqTVWc96qh3pEKg9WeSmrTnVL2FNAGPvj
         KIehxPp6IrNkydzCj19/L56lscsrr/Y9iX4zPSshcAt7gXqX/5kccLBqRU6e4G735BQP
         Y4cfmitaHBe4fFABvG3C/E5uhMAz1nyGxd/aq1e+Vqyi2t5t71KWDOJzZupNy1MmY07N
         BUTt3YQUcz/rE72P5sarzc0Z8hkEuPPzOuPsuxEVMm/8RjrWYOS6+5YEcEbt57tya3t3
         C+xg==
X-Gm-Message-State: AFq9FYL38ygXYXwq57u2m3E9DGheJ+gcGKCnm0PJRhh6qpUQKxHqwoZ7
	2eL0gcOBOpib+ejNLSaqlnoaPAAlUBn0FUT4s/W6FdYETXMOFnB390IyJEYjh8z+MTI=
X-Gm-Gg: AYBFou0mbBnXKeiq4QZVlI8Sr0f/0NcNSRqbpJjESbvxthe3oZHmSaXBHJ31WQdXsaY
	uiuQG9Eg8Z9W03JYeoOY4Bv5atlOiQ2VubUf3PUOknNq083qB2GPOlkYXsuI+TskEl9E3Tw9dV0
	tboB9FYmZqQUu8CrkDrk6OSGV1dXz9IfeKuWxnTEoL6K0K8vOeuHPc8U0X5x4Ekgdb5xQPSFU6E
	6M896y/Qq8XRFz/a/WbIR54Toql86ECjArkdck0vDo8pEhdREiPJa4ZbxmADeMvKyZL5L17oowu
	TmIoSaYcnz3dbpm8I5Xd9ZRR/x+Fffhn0MsNO+zgNlDMT0sPf4stwZbRm/gK3+rKH5xH3Cn3T8U
	CHmpWzB55yEiGounXVqEdeS73wfaLRWeX1kptWmm48OON5cpT/ezvXjXHAX5RBZ2cuI1LiJx+9O
	nvK+DtbzkaECCSf3dRNxiKfG0HWIMa+1L6foZ7R3sZ7xUWTvS4D/0GQhtt+HY+M/4qMRLlTxAFm
	N3rl9oAJirLZ+ns6AZYwu1P1Kh398ahZv/Q5N/T/kvJTVSoKSCm2Ix/oUML
X-Received: by 2002:a05:6214:2469:b0:91b:9441:131a with SMTP id 6a1803df08f44-91b9441155dmr124063136d6.2.1792000694921;
        Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:14 -0700 (PDT)
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
Subject: [PATCH 7/8] selftests/mm: check MADV_PAGEOUT file permissions
Date: Wed, 14 Oct 2026 13:57:55 -0400
Message-ID: <20261014175756.2035176-8-gourry@gourry.net>
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

MADV_PAGEOUT only pages out file pages for a caller that owns the file or
could open it for writing, per can_do_file_pageout(). Any other caller
gets nothing from a shared file mapping, and only the anonymous COW pages
from a private one.

Check that the owner of a read-only file can evict a clean page of it,
once a writable file page shows that file pages can be paged out at all.
That test runs as an unprivileged owner even when started as root, so
that capabilities cannot stand in for ownership.

Also check that an unauthorized caller leaves a shared file page resident,
and that it pages out the COW page of a private mapping but not the file
page next to it. These need root to change credentials, and skip if that
fails.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 105 +++++++++++++++++++++++++--
 1 file changed, 100 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index 8822991eae4a..74202fed2d04 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -5,6 +5,7 @@
 #define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
+#include <grp.h>
 #include <sched.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -12,6 +13,7 @@
 #include <sys/ipc.h>
 #include <sys/mman.h>
 #include <sys/shm.h>
+#include <sys/stat.h>
 #include <unistd.h>
 
 #include "kselftest_harness.h"
@@ -208,8 +210,9 @@ static bool page_is_present(int pagemap_fd, char *addr)
 	return pagemap_get_entry(pagemap_fd, addr) & PM_PRESENT;
 }
 
-/* Map a shared mapping of an unlinked, zero-filled temporary file. */
-static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
+/* Map an unlinked, zero-filled temporary file with the given permissions. */
+static char *map_temp_file(struct __test_metadata *_metadata, size_t size,
+			   int flags, mode_t mode)
 {
 	char template[] = "/tmp/madvise-pageout-XXXXXX";
 	char *mapping;
@@ -219,14 +222,21 @@ static char *map_temp_file(struct __test_metadata *_metadata, size_t size)
 	ASSERT_GE(fd, 0);
 	ASSERT_EQ(unlink(template), 0);
 	ASSERT_EQ(ftruncate(fd, size), 0);
+	ASSERT_EQ(fchmod(fd, mode), 0);
 
-	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, fd, 0);
 	ASSERT_NE(mapping, MAP_FAILED);
 	close(fd);
 
 	return mapping;
 }
 
+/* Become an unprivileged user without capabilities. */
+static bool drop_privileges(void)
+{
+	return !setgroups(0, NULL) && !setgid(65534) && !setuid(65534);
+}
+
 /*
  * Both hints are best effort, so these tests check what userspace can rely
  * on: which mappings are accepted, which pages must never be reclaimed, and
@@ -432,7 +442,7 @@ TEST_F(madvise, cold_preserves_dirty_shared_file_page)
 {
 	char *mapping;
 
-	mapping = map_temp_file(_metadata, page_size);
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
 	mapping[0] = 1;
 
 	ASSERT_EQ(madvise(mapping, page_size, MADV_COLD), 0);
@@ -449,7 +459,7 @@ TEST_F(madvise, pageout_preserves_dirty_shared_file_page)
 {
 	char *mapping;
 
-	mapping = map_temp_file(_metadata, page_size);
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0600);
 	mapping[0] = 1;
 
 	if (!pageout_until_evicted(_metadata, mapping, page_size,
@@ -639,4 +649,89 @@ TEST_F(madvise, cold_preserves_half_of_pte_mapped_thp)
 	ASSERT_EQ(munmap(mapping, pmd_size), 0);
 }
 
+/*
+ * The owner of a file may page out its clean page-cache pages. Run as an
+ * unprivileged owner, so that capabilities cannot stand in for ownership.
+ */
+TEST_F(madvise, pageout_evicts_owned_file_page)
+{
+	char *mapping, *control;
+
+	if (!geteuid() && !drop_privileges())
+		SKIP(return, "could not drop privileges");
+	pin_to_current_cpu(_metadata);
+
+	/* Make sure a writable file page can be paged out at all. */
+	control = map_temp_file(_metadata, page_size, MAP_PRIVATE, 0600);
+	ASSERT_EQ(control[0], 0);
+	if (!pageout_until_evicted(_metadata, control, page_size,
+				   self->pagemap_fd))
+		SKIP(return, "MADV_PAGEOUT did not evict a file page");
+
+	mapping = map_temp_file(_metadata, page_size, MAP_PRIVATE, 0400);
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pageout_until_evicted(_metadata, mapping, page_size,
+					  self->pagemap_fd));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+	ASSERT_EQ(munmap(control, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file must not page out its
+ * shared mappings. MADV_PAGEOUT succeeds but leaves the page resident.
+ */
+TEST_F(madvise, pageout_skips_unauthorized_shared_file)
+{
+	char *mapping;
+
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, page_size, MAP_SHARED, 0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(madvise(mapping, page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd, mapping));
+	ASSERT_EQ(mapping[0], 0);
+
+	ASSERT_EQ(munmap(mapping, page_size), 0);
+}
+
+/*
+ * A caller that neither owns nor may write a file may page out the anonymous
+ * COW pages of a private mapping of it, but must leave the file pages
+ * resident.
+ */
+TEST_F(madvise, pageout_private_file_reclaims_only_cow)
+{
+	char *mapping;
+	bool swapped;
+
+	if (geteuid())
+		SKIP(return, "requires root to change credentials");
+	mapping = map_temp_file(_metadata, 2 * page_size, MAP_PRIVATE,
+				0400);
+	if (!drop_privileges())
+		SKIP(return, "could not drop privileges");
+
+	ASSERT_EQ(mapping[0], 0);
+	ASSERT_EQ(mapping[page_size], 0);
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, 2 * page_size, MADV_PAGEOUT), 0);
+	ASSERT_TRUE(pagemap_is_populated(self->pagemap_fd,
+					 mapping + page_size));
+	swapped = pagemap_is_swapped(self->pagemap_fd, mapping);
+	ASSERT_EQ(mapping[0], 1);
+	ASSERT_EQ(mapping[page_size], 0);
+	if (!swapped)
+		SKIP(return, "MADV_PAGEOUT did not swap the COW page");
+
+	ASSERT_EQ(munmap(mapping, 2 * page_size), 0);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0


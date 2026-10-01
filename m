Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9708328E0
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790813185; cv=none; b=SyisDnZw9eNM8wBybsrTf3pBwj+jHY8k6T1uC75uQYEKLp+NV9k/Help/iQFYHsfmmYVExiHLzZGEH06Sj0sZkgNtAkmkWE607nTyzps/VJP20aVFl2SoIn2hqnUxsMAXPE+gi6NhGDSSLFxG3XQtisCGvZGc3zwrUV3LyNh06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790813185; c=relaxed/simple;
	bh=nx21KnRcFyOf7Oa4YjhJVHRJAa1qP1smH3WmHJPONLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CNE4mu89aRtIw3ijj95V1a5VEWw2yRV7S1YTNt6NwxNgZ3C/MNwXqVF6QLw0n9sk5YEIvVnuMPSdtol3WejaVR1NMKQIfimUdZetQ8LzKCGdSoN7P49378Oi+gTGzyebKjGxeuh2B+ZCDalyUAcPJPbNeylfAlZtRHml7GfoptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Snr02TK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Snr02TK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3708C1F000FF;
	Thu,  1 Oct 2026 00:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790813184;
	bh=2G9ywOqljQFZDKdaAgU095Vl2LGT1PMAEKhFKwrILVk=;
	h=From:To:Cc:Subject:Date;
	b=Snr02TK+vCzf27xXFL943eO7wkvP2tmSHU2ACuNCzYuIYU58ind1uqX0QktO9BsQW
	 CtYGxGcm1UYZkCwcLTWGeMcmHtxG9yds8vi90JZfFd/hthsoHGehJZN3xr5XfwRpF0
	 wQFl809/gWNtva4Cl6oW7NninwTs4vs3ZedTHfZVJJ9lWMP9p4C9Lt68JGDU/4L1mb
	 CslDkIjgGnDu67XFC8KPzVQA9PZnwXu3eU0/gtc4X6LHR4P67hHZFPapLe59c32WzI
	 WHLPnKxmAb2eFyJr8oSpYzeMtH3PqLVe9IUbhmKLD82i4uQQGhJv1MsDpfeikdexDZ
	 mj+3+bfaPbSjA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH] f2fs: fix to check continuousness in f2fs_sync_meta_pages() correctly
Date: Thu,  1 Oct 2026 00:06:16 +0000
Message-ID: <20261001000616.3824366-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

In f2fs_sync_meta_pages(), whenever i becomes zero inside while loop,
below check may be skipped, it failed to check the continuousness:

	if (nr_to_write != LONG_MAX && i != 0 &&
		folio->index != prev +
		folio_nr_pages(fbatch.folios[i-1])) {

Cc: stable@kernel.org
Fixes: 580e7a492608 ("f2fs: convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7b89bb838946..2e5e0ee5feb2 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -606,7 +606,7 @@ void f2fs_write_meta_caches(struct f2fs_sb_info *sbi)
 long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 				bool sync, enum iostat_type io_type)
 {
-	pgoff_t index = 0, prev = ULONG_MAX;
+	pgoff_t index = 0, next = ULONG_MAX;
 	struct f2fs_cached_block *entries[F2FS_ONSTACK_CACHES];
 	long nwritten = 0;
 	int nr;
@@ -629,8 +629,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 				goto stop;
 			}
 
-			if (background && i != 0 &&
-					entry->index != prev + 1) {
+			if (background && next != ULONG_MAX &&
+					entry->index != next) {
 				f2fs_cache_gang_release(entries, nr);
 				goto stop;
 			}
@@ -657,7 +657,7 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 				break;
 			}
 			nwritten++;
-			prev = entry->index;
+			next = entry->index + 1;
 			if (unlikely(nwritten >= nr_to_write))
 				break;
 		}
-- 
2.49.0


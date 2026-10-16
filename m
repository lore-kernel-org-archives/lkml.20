Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339964502F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792117066; cv=none; b=IGYgJsrCYAHj5wfLTDLj5DkLxA9H57KO/IKIDJD0CGVksE/VJVrfZT5noVxkQt+We8NsmnG0uAKizSuzrrPD9n7sp+qzPzbyuukVnn82WRI/dDJer2JKiekS+QIcIHxegnXxYP8IQE+c79l0K9qIU78x2BwmjrTKhJGzLN7gUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792117066; c=relaxed/simple;
	bh=xErXpopCd8UN+mMGNFM56AAFKWg1/RDBwJYs7e0gnUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yi13WyT6tfmjOyCEuHRb8wicVyAHBcSjgqucVLQitiW9hwf9Q0J+fKjfhXCBDXDYHCM2eB6THRB5B00rtfsrbo4jT/8SgHOaN+QW80g1Da8FMXHhSKzAfShL794RsSrtt24JHZGc7np4hMoFSmJFuzX9GKaigbBpkTUIo3oVLsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT7GrIVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT7GrIVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F188E1F000C4;
	Fri, 16 Oct 2026 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792117064;
	bh=L94us/dI4Z6GcNc8VtVqCl6M0xP+pjDIX04oSImnsOo=;
	h=From:To:Cc:Subject:Date;
	b=mT7GrIVYHl56Ghyh8drgVZIDxkh6da8hLUoTenII2SL7fBgbx8OHUcmHH3aXwrQiM
	 dcbvuZADqHjWgx4iNxhiBbnIOoZucL9MO+EaH6MrnlKnjSp4pnb27/edeMN8Br+6uJ
	 NakC3wPUUlGOwZpmrZXx/22XY9p4Me7uRJ8lTlGAIN0h5rwG09WOgC6NKFVsqsF7Nr
	 hcHmwG5rAyOwACM9F/gJlwivjH9espZWMboudKjTSAokC3pffqoX28Lm/jg6a9oobx
	 qhUc+VgougzxYXJTh0q/ftLEeBAVGGwj0oFgwFDJmwv6tTbrz2aCZwmAWCOFUuJu4e
	 uq1p3QlPn9WUg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org,
	Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: fix to avoid potential reference count leak in do_garbage_collect()
Date: Fri, 16 Oct 2026 10:17:37 +0800
Message-ID: <20261016021737.4121867-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

In do_garbage_collect(), we have reserved reference counts on summary cache
of all segments, once gc_thread encounter freezing, we need to release all
reference counts.

Cc: stable@kernel.org
Cc: Daeho Jeong <daehojeong@google.com>
Fixes: 02d91398a602 ("f2fs: fix to freeze GC and discard threads quickly")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5bb117e5e811..ad6f604cc27f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1901,6 +1901,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		if (block_end_segno > end_segno)
 			block_end_segno = end_segno;
 
+		if (unlikely(freezing(current)))
+			goto next_block;
+
 		if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
 			f2fs_err(sbi, "%s: segment %u is used by log",
 							__func__, segno);
@@ -1968,12 +1971,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				sbi->next_victim_seg[gc_type] =
 					(cur_segno + 1 < sec_end_segno) ?
 					cur_segno + 1 : NULL_SEGNO;
-
-			if (unlikely(freezing(current))) {
-				f2fs_put_cache(sum_entry, false);
-				f2fs_put_cache(sum_entry, false);
-				goto stop;
-			}
 		}
 next_block:
 		f2fs_put_cache(sum_entry, false);
@@ -1981,7 +1978,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		segno = block_end_segno;
 	}
 
-stop:
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
-- 
2.49.0


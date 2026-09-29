Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D278420D4F0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648465; cv=none; b=IHwedTLozl5r6D5TaO1KTq6Cf0vwh3I9dfgCRL9oPI6uNpEUgq9ZYuzSaNW//aCnJbqDVN9RcogkK7Tp3bzmdg7duruDSFklVKOv+vUrKdZb5RU8xmNnwbzQ+aUmak1f8A2cAf4ind1LA4OqkGmZ9ouB5bK0v9HMutmdZh+Fcz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648465; c=relaxed/simple;
	bh=zKjFOG1OQoI3oWih22vf71nk3q3n/qN1QPZrAqxXZY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UY3NfN5GP/D8aqziJ4BUqeqy7b89Eu/Ue2zLE9HxBJtzNQalJYa8CvebrCEbZT3LIlY35HDtDi0SvCrKFudQNnmne+kM3Q+ODW8wH+zqHYEPdBoz7kQoSYxe47MS+rmOZl2NZI7t4zKRFL3La+EAnopKe8UqT41jbvIh7dUg4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFrbZiyk; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFrbZiyk"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d5303884so2582970eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648463; x=1791253263; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cso0TqHJzEbhQvVoW2OaiHX8xQ3eBq/VmXI5xLLCaNI=;
        b=mFrbZiykCjvn8frEBwHVnW1pseafQExm83lvAuWSRA3Ie4td/deoco6n5RV130D+6/
         PELyECYnNsg2spvW7EleEAdnyurc/+7OZ5oFxbKrBpEVYg2uDhJG/nx3yFvZIEZLfTyF
         GUDbbTLIQ61qhySV/+oxPuYVHXJwqE5jJKRDMbHXBfowulBCq0JFpcMPLH1EUaeOH9cj
         A67+aEZbvWUy2eJjqGPwcZ4+8LvtKdu0S+x/PEBYU//N04bmq2uZiYPIj9jjWUMm/V3Q
         8w23m6DknvrVgKEP1y/29UDa3xUNgkcjHHvrHPo1TVoG/lACbtM/xGzpSM/6oKOFWpwR
         U7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648463; x=1791253263;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cso0TqHJzEbhQvVoW2OaiHX8xQ3eBq/VmXI5xLLCaNI=;
        b=bi+Wt39Yc6Kkf6tLja/Z62oBkUts347PYYvG3EQmJNo7FCw7RoOeLjzjBX22Vfe7xs
         C6g4n7n6md1akAiOUGRVU8yMf7k1Vlc9RJWASte3nEhAxD3yVToWbm8Sm7QG5BuEC9QV
         gxR5Nl6i/NEOkKW3nLPCmS+GY/J5PeKWHdG5RX4DjLwYIU19vkaiNn8HQgqH2E6Yh+y+
         uxdP8c4Iyal/meb5qw8IFndU4C1cyc7H/yS1OTMajXIPhjLc+O7IbZQC6EB6KpmGlDqr
         hM397+LF+nEnPLHtbNSC+vpUVkOcMmL379hxgRJUGSE0g6WZqjCjzt4rvebRmuqB5+y1
         1muw==
X-Forwarded-Encrypted: i=1; AKwUvBzNpZp7fu/tyjbbnT3lDWsm4b8FyFoHtm/sBKT/E3nR+XfQeUjbFLKcOClw9p47h8nH6Msa+v1ZZqL/r0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGcm1zUtyt8hkw601Oqc3pw8XzaEshADdfFa4FKHz80TPkJU9R
	VfJ+ZW9aDHhL8AF/+r/IpQHH39M+5B0nPI1nA+5Jne4DoSnpyZbJCv02
X-Gm-Gg: AYBFou3AsYureKpNqf8s1vdUNHc68MoVV58UmgF6qTVjx0iXJtYqSREsIvlt2W8TKjf
	pkZD5isF6W4DyyzVtUMT38MwWazTBKiQVJZ2/ckNjpTsZ1DB6jY+LNnNUPaAkY307V/fVul4yTN
	3c/aAboMSkZKVe8XcpBjJl98Fqtlo7q/gULqUqO35RC6QQDPk0T5QR5kLc8MwIpKEWZT8YHlpKm
	orRy55LEYE6XA+CkGxMOIch1ymtgQQxzKJAJSwL1szOnr/NML7MW190NPT5pzde2cb3gtUgybsq
	jqgDJd6AE8Mh6zmMf7yRDGG1Oz9blIzPleqT7YSCzorXxIY0ArrJmTLwV1QYSrvliENJnH/zBBy
	qW9bJxCmzM50glMKBTzoNE3HxIAjOpgEqoNWmpPE+KJ/S/Uc4tzvte9/6RYauP3y/5zqxlmSMQP
	wB5maRvoQA6Im8Uw9/uA1a7iUqegAwkTvMEAlRMoUIqi8E4MeFYSIxbQCVM8Y534gjpA==
X-Received: by 2002:a05:7301:1f15:b0:339:7f8d:60dd with SMTP id 5a478bee46e88-3427207a676mr15535472eec.27.1790648462724;
        Mon, 28 Sep 2026 19:21:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm40577938eec.22.2026.09.28.19.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:21:02 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Tue, 29 Sep 2026 10:20:56 +0800
Subject: [PATCH v2] ext4: fix shrinker scan budget accounting in
 ext4_es_scan()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-fix-ext4-es-scan-nr-scanned-v2-1-f4e8f6f6b8b1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIcgu2oC/42NQQqDMBBFryKz7pQkWI1d9R7FRZpMdKBGSUQs4
 t2b5gRdfd7n8/4BiSJTgnt1QKSNE88hg7pUYEcTBkJ2mUEJ1YhOafS8I+1rjZQwWRMwxJKBHN6
 Mb0Vb176xDrJhiZTnxf7sM4+c1jl+ytkmf+1/3k2ixE46rZXSL2H1Y5gMv692nqA/z/MLfyCnc
 cYAAAA=
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, 
 Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>, 
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The extents_status shrinker's count_objects() callback,
ext4_es_count(), reports the number of shrinkable extent_status
objects via a percpu counter. do_shrink_slab() reads this count
exactly once per invocation and derives a one-shot scan budget
(total_scan) from it, then repeatedly calls scan_objects() in
fixed-size batches until that budget is exhausted.

ext4_es_scan() never updates sc->nr_scanned, even though
include/linux/shrinker.h documents that "the callee should track
its actual progress" in that field. Because sc->nr_scanned defaults
to sc->nr_to_scan before every call, do_shrink_slab() always
believes a full batch was examined, regardless of what __es_shrink()
actually did. When __es_shrink() makes no progress and returns having
examined nothing, do_shrink_slab() has no way to tell "there was
nothing to scan" from "a full batch was scanned and none of it was
freeable". It keeps calling scan_objects() until the original,
one-shot total_scan budget is drained, even though nothing in this
reclaim pass can make further progress.

Make __es_shrink() report the number of extent_status objects it
actually examined through a new nr_scanned output parameter, derived
from the existing per-extent nr_to_scan counter that es_reclaim_extents()
already decrements as it walks the tree. Have ext4_es_scan() copy this
value into sc->nr_scanned, and return SHRINK_STOP once nr_scanned comes
back as zero.

nr_scanned can come back as zero for more than one reason:
sbi->s_es_list can be genuinely empty, every inode walked this call
can have been momentarily skipped (precached, or lock contended), or
every inode walked can have had nothing currently shrinkable
(es_reclaim_extents() returns immediately without touching nr_to_scan
whenever an inode's shrinkable extent count is zero, independent of
locking). Treat all of these the same rather than only returning
SHRINK_STOP for a genuinely empty list: retrying instead, on the
assumption that the other cases are transient, leaves
do_shrink_slab()'s own scan budget undecremented whenever nr_scanned
stays zero, so it never terminates.

Tested by fallocate(2)-ing 10000 4K files (to populate the shrinker
with reclaimable unwritten extents without also exercising the
extent_status "referenced" second-chance path, which needs a
separate two-pass accounting of its own) and triggering
"echo 2 > /proc/sys/vm/drop_caches", while tracing the
ext4_es_shrink* tracepoints:

                      total scan_objects()   calls with
                      calls                  nr_shrunk == 0
  before this patch   429                    189 (44%)
  after this patch    165                    1 (0.6%)
  after (rerun)        242                    1 (0.4%)

nr_skipped stayed at 0 throughout every run, confirming the wasted
calls came from the stale one-shot budget racing ahead of the real
list state, not from the existing precached/trylock skip paths.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Correct the comment and commit message: nr_scanned == 0 is not
  only reachable when sbi->s_es_list is genuinely empty, also when
  every inode walked was skipped or had nothing currently
  shrinkable. No code or test data changes.

v1: https://lore.kernel.org/r/20260928-fix-ext4-es-scan-nr-scanned-v1-1-91d88228b0c8@gmail.com
---
 fs/ext4/extents_status.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 6e4a191e82191..95e0f2d453257 100644
--- a/fs/ext4/extents_status.c
+++ b/fs/ext4/extents_status.c
@@ -184,7 +184,7 @@ static int __es_remove_extent(struct inode *inode, ext4_lblk_t lblk,
 			      struct extent_status *prealloc);
 static int es_reclaim_extents(struct ext4_inode_info *ei, int *nr_to_scan);
 static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
-		       struct ext4_inode_info *locked_ei);
+		       struct ext4_inode_info *locked_ei, int *nr_scanned);
 static int __revise_pending(struct inode *inode, ext4_lblk_t lblk,
 			    ext4_lblk_t len,
 			    struct pending_reservation **prealloc);
@@ -1670,7 +1670,7 @@ void ext4_es_remove_extent(struct inode *inode, ext4_lblk_t lblk,
 }
 
 static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
-		       struct ext4_inode_info *locked_ei)
+		       struct ext4_inode_info *locked_ei, int *nr_scanned)
 {
 	struct ext4_inode_info *ei;
 	struct ext4_es_stats *es_stats;
@@ -1679,6 +1679,7 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 	int nr_to_walk;
 	int nr_shrunk = 0;
 	int retried = 0, nr_skipped = 0;
+	int orig_nr_to_scan = nr_to_scan;
 
 	es_stats = &sbi->s_es_stats;
 	start_time = ktime_get();
@@ -1738,6 +1739,8 @@ static int __es_shrink(struct ext4_sb_info *sbi, int nr_to_scan,
 		nr_shrunk = es_reclaim_extents(locked_ei, &nr_to_scan);
 
 out:
+	*nr_scanned = orig_nr_to_scan - nr_to_scan;
+
 	scan_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
 	if (likely(es_stats->es_stats_scan_time))
 		es_stats->es_stats_scan_time = (scan_time +
@@ -1774,15 +1777,41 @@ static unsigned long ext4_es_scan(struct shrinker *shrink,
 {
 	struct ext4_sb_info *sbi = shrink->private_data;
 	int nr_to_scan = sc->nr_to_scan;
-	int ret, nr_shrunk;
+	int ret, nr_shrunk, nr_scanned;
 
 	ret = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
 	trace_ext4_es_shrink_scan_enter(sbi->s_sb, nr_to_scan, ret);
 
-	nr_shrunk = __es_shrink(sbi, nr_to_scan, NULL);
+	nr_shrunk = __es_shrink(sbi, nr_to_scan, NULL, &nr_scanned);
+	sc->nr_scanned = nr_scanned;
 
 	ret = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
 	trace_ext4_es_shrink_scan_exit(sbi->s_sb, nr_shrunk, ret);
+
+	/*
+	 * nr_scanned == 0 does not necessarily mean sbi->s_es_list is empty:
+	 * es_stats_shk_cnt is a percpu counter and can report a stale/
+	 * approximate value that is still positive after the list has
+	 * actually drained, but nr_scanned also stays 0 when every inode
+	 * __es_shrink() walked this call was momentarily skipped (precached,
+	 * or lock contended) or had nothing currently shrinkable
+	 * (es_reclaim_extents() returns without touching nr_to_scan whenever
+	 * ei->i_es_shk_nr is 0, which can persist for a given inode
+	 * independent of locking).
+	 *
+	 * Treat all of these the same and return SHRINK_STOP rather than
+	 * only doing so for a genuinely empty list: retrying instead, on
+	 * the assumption that the other cases are transient, does not
+	 * decrement do_shrink_slab()'s own scan budget when nr_scanned
+	 * stays 0, so it never terminates. Without SHRINK_STOP here,
+	 * do_shrink_slab() also has no way to tell "nothing was there" from
+	 * "nothing was scanned yet" and will keep calling us with the same
+	 * stale freeable count until its scan budget for this priority
+	 * level is exhausted one batch at a time.
+	 */
+	if (nr_scanned == 0)
+		return SHRINK_STOP;
+
 	return nr_shrunk;
 }
 

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260928-fix-ext4-es-scan-nr-scanned-5af70744f6cd

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


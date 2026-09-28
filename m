Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A94AB3D4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595630; cv=none; b=SGxzt+ajgANu+vpfOR1RH34syQUDHFQvbtsLrdYnlBqPJ+VEMZ8VEQTt2aNG8drqV9T+rOPH8e/siKxX1Nz7Di+XhFWP1sc0ymuCIHJm+9c8UpPTWiq+GB2/T1nWpjz1wotD6qN3byumt+bH3vu3P6wlEUG91K0ts3YHnr4mABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595630; c=relaxed/simple;
	bh=Lzr5bEcyEtqxOcsi0a6Wx4YdU9NF9pl4pgfrg72dBeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HMzG4fJj2GtIni81hH2tRztFLH0j4gqPQ9I6GQwl7y/iR+DC6vKBkb0Mt6IoU1ljAhKWXA2GnHInHKciSEtELhkdv93v0P/L14XgueSVk9M8bjlCfzq9BLDm0noeVApmm8UMn0CkwleShRo6OA41CCmm5Ui9ygu0x4xxUlnUhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URGaXcjk; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URGaXcjk"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-14380910258so695181c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790595628; x=1791200428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xOrrX4VASxwxOHIje5fqVHmltt8bEneArNzq9Pnrg3Y=;
        b=URGaXcjkTBf7gnd63ov5D8Xti1JAlEd7m6aJVQQlZiEpmRoBLZsKj+qCyMJQhFTpwj
         hIrN3g6nnLoHfB+GJm7W+Z6VAkQ2GbXZe4rWAdF5w66MaS/aMa2z9f/ar0M7IFtohf+H
         DJYClU3ZFJLSTONZY16xMJEjrt51BTPW/2ObGLFew2/63e3ZkO7sQUgDzkoaU4wIW3wV
         BP+P5qVP4F5Sqd6TYciM1YuF2Kjm/REl3oesCSB3cH1lOp31Ih2tgUBJb9PDTC06Xn+j
         Po5ryvYm/l0QQb48WhPUCC06jrhliBERXbQRydYRWoyCdjMe9fY4lHERZbO+J+CUGGK4
         u7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595628; x=1791200428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xOrrX4VASxwxOHIje5fqVHmltt8bEneArNzq9Pnrg3Y=;
        b=BLTm5JVOWTdRrrdtqfHyKXmDGqjoGzJ+4mIaJ0ZWRwZ9Gw0ARIVxZVldrinvG7cOTc
         vIh3z9IOG784gh4XR6tCgD4N22R7boZa02rYdkpEslpNHHZwvQ4e+sYN9jiTL8cdTYTi
         CM2YlzhFVshWwbgp//kPtd9d2/HakuoKQ3LPxo9ezX6HC6bTKq9Y6OTqB6qvE+MKT+tp
         MHf+ckUSkboG9FLlILSrQAEj/oFnirRLisJgXSLEUbhxyqvuAnlVq4UgL6Tf8pH/qGDq
         O1HQm+cngsg3FA6sBQEOOXk1ZLH8WJD56EFwhXK88CJx0n93lqRpL4izQp5B1x05cOlB
         tltA==
X-Forwarded-Encrypted: i=1; AKwUvBy8zmP2yfE5zRBK/mhpAE8Pb7C4Lcw7Cr2ng6Dl4yBN3yAFU10tBmgXUSav4QDlOjUYpvoWYx0uZD7s8h0=@vger.kernel.org
X-Gm-Message-State: AFuF++nWgGN0cHtoGit8/xdqMulhozjpWapwKtHlUFvVpIDgKgQk9ebw
	2urCxDCNBFqyASME0rJBJvijRnSupft5xRfd9jxUj9n4DKGzCC8mexe9
X-Gm-Gg: AYBFou0gpYoGlcCXbOHcUwAXKWifo/zj8qjiFXmv6HJ3AIayZX+BYPhBgzE7glnLlTp
	VyltpAMDTl+qPRwFXwGEyYGCs4pf8spXi//YKD1qksXQlUnoJMcI51v+xQM5VGoT2r/nazkOWTL
	6qDMyMQXK4Tr0z3kr8KoXoNnHJmlktJBYSfpryXZqAz5Wt8L7rEQBplXK9nri3Spq/uHwYxGupw
	Iswg+RepZ834ZDrR/bKKyInBv8E4RA1IN2V2mZ+rbB5hCHfHSLZ+mN4sGkqyeglpOoPtBtTu+ww
	/YQ7AWkVWD0HfrXDRFflOcVp86v2PlLg41cLtUomQPuJ32PW0xoPOvaFZv14bwfpH8H1xP9TbUT
	d+bMxQid5fSoDVUjxxneGp0dPOWjMenwhsnHB6VuQdtkyuCw0OF60F8pvJfI4DCOwbBabvyAUyM
	C/lX6CcuHulXPu0RTlFYzN0QCMQqSgpPJZM3l0y1EocJxFVJUfDoaaxQ7+A+Ka9EppLvR/2/WNh
	a+W8g==
X-Received: by 2002:a05:701b:2902:b0:143:56f8:dc5 with SMTP id a92af1059eb24-146cfec877bmr9086036c88.23.1790595628009;
        Mon, 28 Sep 2026 04:40:28 -0700 (PDT)
Received: from [127.0.1.1] ([47.88.22.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c3f8sm24289375c88.3.2026.09.28.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:40:27 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 28 Sep 2026 19:40:21 +0800
Subject: [PATCH] ext4: fix shrinker scan budget accounting in
 ext4_es_scan()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-fix-ext4-es-scan-nr-scanned-v1-1-91d88228b0c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIACVSumoC/x2MSQqAMAwAvyI5G6ilrl8RD6VNNZcojYgg/t3ia
 RgY5gGlzKQwVQ9kulh5lyJNXUHYvKyEHIuDNbYzox0w8Y10nw5JUYMXlPxTKGLrU29651IXIpT
 Dkank/31e3vcDq4kNiG0AAAA=
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
actually did. When __es_shrink() hits an empty sbi->s_es_list and
returns immediately having examined nothing, do_shrink_slab() has
no way to tell "there was nothing to scan" from "a full batch was
scanned and none of it was freeable". It keeps calling scan_objects()
until the original, one-shot total_scan budget is drained, even
though the shrinkable list emptied out long before that budget was
used up.

Make __es_shrink() report the number of extent_status objects it
actually examined through a new nr_scanned output parameter, derived
from the existing per-extent nr_to_scan counter that es_reclaim_extents()
already decrements as it walks the tree. Have ext4_es_scan() copy this
value into sc->nr_scanned, and return SHRINK_STOP once nr_scanned comes
back as zero, since that only happens when sbi->s_es_list was already
empty and no further calls in this reclaim pass can make progress.

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
 fs/ext4/extents_status.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 6e4a191e82191..05ded0c018e08 100644
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
@@ -1774,15 +1777,30 @@ static unsigned long ext4_es_scan(struct shrinker *shrink,
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
+	 * es_stats_shk_cnt is a percpu counter, so count_objects() can report
+	 * a stale/approximate value that is still positive even though
+	 * sbi->s_es_list is actually empty by the time we get here. When that
+	 * happens __es_shrink() returns immediately having examined nothing
+	 * (nr_scanned == 0). Without SHRINK_STOP, do_shrink_slab() has no way
+	 * to tell "nothing was there" from "nothing was scanned yet" and will
+	 * keep calling us with the same stale freeable count until its scan
+	 * budget for this priority level is exhausted one batch at a time.
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


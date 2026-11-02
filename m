Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585033;
	b=PzTnsOu34N20crPwTnvKN4qXaw1iVUk8fuDc4En2mgArwbzTkvYTnH4yB73kccbgk2O1
	 IhKbl3Y495Dw/9+MUt+TkN0cWwzMWRt77P3BU/CCM+7o3HNdTJaMm2RJgh9adVMd+e3Up
	 dgZRbwBuRa102L0w7zvF+gXhzzQTvLL6HjsQzbbnzV0pwx99PU7sCug4eSm7Lq35tNbY4
	 7VdOKMazMNWo9znH+Eic07k5pf7OkNXCfxHGt7TGswEAKiKgR+gZ4TmwJN9Wia/yEodIm
	 zii3EVDWRa2gvKAMJae4vCzesyx5UCfNNZV6/Q5Ug7mgLEv24ZlEvAtQfDOCRHz4r+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=r4VI7UXXI4YmbL2jVA9MPaFqI9dJHWqNQnjA9+3Oft4=;
	b=zIHShBbhkp7iKszjftHrnwzsOe+xX0NegOw9bk7kIOqp2v2Rsy3M9IAEH9JfSXisPFiL
	 jaX8WRwwA1n3nmWo2dyBfKnub+2C2BjGXFUx6R7ce4RdKhqBV4NXxM6pKcHmIauRPTyok
	 nKoYvdnyfN6wuXpd/XbpmcW3Aks8+qP3KLAgVpFzUsveiAKExm8obXurmc/+mMrL36fFe
	 4aDjNmMp7X2JMVKVV2o7D78o4ukxkZt4oxwpzjTxLzij8uOkelB1quTWUQChVpDWTDD04
	 dPggLqJiEMqHSVf/rutuPpxhTuvoYJxtRwhBWg+LFGv50VrqSfKU0YZTWSplWXI1WxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ePWqom8;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED42606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED42606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ePWqom8
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso390153c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585032; x=1794189832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4VI7UXXI4YmbL2jVA9MPaFqI9dJHWqNQnjA9+3Oft4=;
        b=0ePWqom8FDl+tsRMj7rvdaHbjqPQB/Z2VqmvzrXZoHqOT1M9WQYZJeQ+Dul9gZP2Hy
         YB9XjQwfF6+uKHczmtREMhk5Z3xw1KTZndqGkH/+T2fGJslnVw1/rGUmKaYzIbu+3zZC
         oqo+WuSu4N1urQtVWqzPtyg/iCijkJNDzoaenXSx93C29rwC62gUNP4sh4QJPkg4D7q2
         FbINchDBv1X8CMY8fM69UiCFTNbWW4HiNGQvESJzvKI1tnyL+ZiHzb3/pN3yzbptPIOA
         LknFI8GXe9gmUwKd4ohlx+iwf1HvmQxIiAUb7JO6I+Nka68MJajO7znoTnn/gqZYbJcp
         w/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585032; x=1794189832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4VI7UXXI4YmbL2jVA9MPaFqI9dJHWqNQnjA9+3Oft4=;
        b=l0R1zs9JpV0wWU7JZbVJEOs9IHBd3qqB5AAr4Ay1hRtEDcLo4uzdkKxn6MmjXk0bWE
         hMArtNdZ1h0J/Yolu2i1WrN6kBoVGZOuxNx65wJ8XS+TEHeC5AWbrkRTXAbGgWgzMLGK
         KawU+KdpDk0I2PGQ50bqAGzoxhKymsZE7EiN3CXs+po5rkun+fy4GVMvZPW6EP+/lJq4
         56kV3dVE7FscW62wWzkGfq3bZnx75VKBU0J3pK7IJdg4LpWZiIpMSGRsYvc+mYrwNqVC
         ZNkq4rhWaDyLvZ12mRLPtJGxeulidLiexFbMxCdL+35nNLOYA7mxI9qva9LyggIzT/L1
         lVNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQQHvPxzAeM2huiHiJaOPXerSa/5duv2OAyoLILxC6qptfWPoKKp4Ms27G/9uOG+Qg2lPhdDaEGTFrvyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoypt8YuNI4aChoV5Q4NMp+qKHTY0Ax3CmTz4R9UuHvio2s1o2
	n8whJtuNU1/ioLrrn7Y92VjagBZXLfjOi9Sb/RHrXblS2i1Lq5VebHNC
X-Gm-Gg: AYBFou2RE3u5OioLqR0FGpJgUgWp97yXeClPKavHirah9TuqbSzqI7QAt90bB1bDXeo
	WC+nuNsXdProrgGPnoXD18H8diBYWkGD8XUbu3QjdiA/aU8m3c29o3qPKcVi1xXb5YA+QA4A2WO
	K5lUdnh9TaYku+SC68XGWOVvkMZCNwBFveUfKN94N0Nb/YTQhUG7xth3Gc+3EcRcGK/WMFr9szG
	/BkgUwZGiW25+Mp52vAOfXKZb5vkurOzFh6A9IdMy2P4zghnsUISCWLsLnwKlP3BxWxmByUWckK
	ogLoYF+v+9084la3W53WWfhfFiIKbdiBhgc1sRnWHqjT/1jrDoPsRijfHeDpq+s+7cqR+L8Qdo6
	Cs/OUo5rV0/i/lhiXmgp33L5fMf8vVWudYckYf4kKU0vkvZE7wmBiv9hccvwCzcQPgDrLlPMrU9
	VkYnjFeHnJfUdwqEUCF+jF07rAPXGNNZrxp5Ht0mX/DqrJ1LfEMTuc6f0SZRfzGKoopNoZejIcW
	0OA+7f8rxu7ATh13lG05GvH2NrUr/5svEQ2WA7dnZFySfZ1HvDVYKrUeB+9Y9HZOGzlnJWlZx+h
	IFN6/kM4NB/SUbq9tlc1fG5v
X-Received: by 2002:a05:7022:1402:b0:193:9568:b42a with SMTP id a92af1059eb24-1ac5c45fd35mr12531643c88.8.1793585031834;
        Sun, 01 Nov 2026 18:03:51 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm28456015c88.23.2026.11.01.18.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:03:51 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 01 Nov 2026 21:03:44 -0500
Subject: [PATCH RESEND v4 1/2] ext4: fix shrinker scan budget accounting in
 ext4_es_scan()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-fix-ext4-es-scan-nr-scanned-v4-1-1290a288f5ea@gmail.com>
References: <20261101-fix-ext4-es-scan-nr-scanned-v4-0-1290a288f5ea@gmail.com>
In-Reply-To: <20261101-fix-ext4-es-scan-nr-scanned-v4-0-1290a288f5ea@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, 
 Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>, 
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0

do_shrink_slab() reads count_objects() once per invocation to derive
a one-shot scan budget, then calls scan_objects() repeatedly until
that budget is exhausted or scan_objects() returns SHRINK_STOP.
include/linux/shrinker.h documents that scan_objects() "should track
its actual progress" in sc->nr_scanned, so do_shrink_slab() can tell
when there is nothing left to examine and stop early.

ext4_es_scan() never updates sc->nr_scanned, so it defaults to the
full sc->nr_to_scan on every call. do_shrink_slab() therefore always
believes a full batch was examined, regardless of what __es_shrink()
actually did, and keeps calling scan_objects() until the budget
derived from the (possibly stale) percpu extent_status count is
drained, even after sbi->s_es_list has nothing left to examine.

Make __es_shrink() report the number of extent_status objects it
actually examined through a new nr_scanned output parameter, derived
from the existing per-extent nr_to_scan counter that
es_reclaim_extents() already decrements as it walks the tree. Have
ext4_es_scan() copy this into sc->nr_scanned, and return SHRINK_STOP
once it comes back zero. Key this off nr_scanned rather than
nr_shrunk: a batch that finds every extent still referenced
correctly ages them without freeing any, and that is real progress
nr_shrunk would miss.

nr_scanned can come back zero for more than a genuinely empty list:
es_stats_shk_cnt is a stale percpu count, an inode can be
momentarily skipped (precached, lock contended), or durably have
nothing shrinkable (i_es_shk_nr == 0) without es_reclaim_extents()
ever touching nr_to_scan. Treat all of these alike: not stopping
doesn't help the transient cases either, since do_shrink_slab()'s
budget only decrements by nr_scanned, so retrying forever at
nr_scanned == 0 never terminates.

Tested by fallocate(2)-ing 10000 4K files (to populate the shrinker
with reclaimable unwritten extents without also exercising the
extent_status "referenced" second-chance path, which needs a
separate two-pass accounting of its own) and triggering
"echo 2 > /proc/sys/vm/drop_caches", while tracing the
ext4_es_shrink* tracepoints:

                      total scan_objects()   calls with
                      calls                  nr_shrunk == 0
  before this patch   429                    189 (44%)
  after this patch    239                      1 (0.4%)

Fixes: 1ab6c4997e04 ("fs: convert fs shrinkers to new scan/count API")
Cc: stable@vger.kernel.org
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/ext4/extents_status.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
index 6e4a191e82191..b8821b93693a9 100644
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
@@ -1774,15 +1777,36 @@ static unsigned long ext4_es_scan(struct shrinker *shrink,
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
+	 * Key SHRINK_STOP off nr_scanned (extents actually examined), not
+	 * nr_shrunk (extents actually freed): a batch that finds every
+	 * extent still referenced correctly ages them without freeing
+	 * any, and that is real progress nr_shrunk would miss.
+	 *
+	 * nr_scanned can come back 0 for more than a genuinely empty
+	 * sbi->s_es_list: es_stats_shk_cnt is a stale percpu count, an
+	 * inode can be momentarily skipped (precached, lock contended),
+	 * or durably have nothing shrinkable (i_es_shk_nr == 0) without
+	 * es_reclaim_extents() ever touching nr_to_scan. Treat all of
+	 * these alike: not stopping doesn't help the transient cases
+	 * either, since do_shrink_slab()'s budget only decrements by
+	 * nr_scanned, so retrying forever at nr_scanned == 0 never
+	 * terminates.
+	 */
+	if (nr_scanned == 0)
+		return SHRINK_STOP;
+
 	return nr_shrunk;
 }
 

-- 
2.43.0


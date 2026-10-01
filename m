Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284B47CA9F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840648; cv=none; b=UIrgYTYx2/732KyxRiTqCYBfySb19FBuAsjo/lBF8QxRTrn4sDFDa2eFjfp10D88vLurJywgJQzA6zcrlzpyO0lFbrnWvumESdGkWRGDcvIMrw12N97+yETFXsn5dEErQsaPPR0wwPITpubsx4GHTOqDj3m74FXaiarKoTMyC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840648; c=relaxed/simple;
	bh=OefZ+4/2BScElBEkthNoRJlkKh5y/+Ok1Xpl8A9s9SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkGxvlVuZmw/gDatRueEOSPhfRrEC7wucgF6YZSmd5eSa/koD5jN9ZGKN7/WDHA49PYhX/ceRt8UEqGyvQVSZodHM04vUGTLXazRno6rMVxs/Tk7IbnXNRRgvTnPtGaWWhxdsddNqxNS7vMGooEiWvFzNbVeCLQ6uW9Gl2vqGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMtNIlLf; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMtNIlLf"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so355838c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790840646; x=1791445446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4VI7UXXI4YmbL2jVA9MPaFqI9dJHWqNQnjA9+3Oft4=;
        b=WMtNIlLfGFEFcxiNXHKRE84brOpdB60d+FuysOEHOEAi/VmkV0v7s59bBIDuFEeNAc
         WMnrwPrPHslu/aEl6SpR/byxwGiwkHadq9V7Q0jCsOD/P1k2oV6Y1iUIRLFEqButQf57
         gE9M0VDNHfDeDyZvxaKFv4xl+EIuXuhOdmOIJb3GEUM/3kaZfiBSu1aI91X+fbHv0n29
         AaYVx9NcoHoedg+5vUdAck5kNUUcgIFFD0NZ1c06W+32VyV2Ue3Sid4L0/4lHMeBtDkn
         809NBajw5hwxZJcfQGRgGKXpyCf8sb3J2OctDCcWsFQ9M7OS07+8JWQ0Hjxe2blrjwwi
         JUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840646; x=1791445446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4VI7UXXI4YmbL2jVA9MPaFqI9dJHWqNQnjA9+3Oft4=;
        b=Opbkxc1pVlI/zrZVow56vW9Gu6nJddMNZeDv+b+eaqaZTCD2WBfHfsiSydRlT50/xL
         d/ceRotL+Mgu4UvaHUEou9ziv5/EbGU+ri2IAnfDbkA+hcNXHcg6mGpfI71YzvZV4Eg4
         T17/cG0GbfYGnQYXx1QUI/zI5zAr7rWNKZl109kjkYfqHWNGRpjyo2ehjIhkXSFaZODh
         R3bmvahROl51oHUWGFMM+BFzx+De6QArrlTpMH48Qxkas2hAR2UfApN1ZncnsWHbBdFm
         bj6t8AC5J/hOzjcFxFsMyFCKuRrKArW6ZBf0RcFJ7uc+rbGKHyaa/qPfRllSmBbR7h54
         tzTg==
X-Forwarded-Encrypted: i=1; AKwUvByoHhqLiByvWp9YqTYHFq1ZD98SaqeA08SWzQQzQDd1xvtM7abZ9jlD83bJo1t1RVmtqRQvRlM0UabQc+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxzRJaTomwGv87AGyH1RPtWdI1vWHSMNu/qMBFhimJIQ+dpPUT
	aXkVWNAf1p5RhJ5GPUbPAUVDI+LaAHClS5ANNqYdL+pVdOkRZU7tQK1v
X-Gm-Gg: AYBFou0stqDGPcxFe/E7Of7pTai5vtXf7t3wPpez8mzVgASFHAAsjQ8k1YqG581YjS/
	ItHgc5yFEUo+0nKD3Vb0nXJVmQA98Ljty+UKBn/6w2v1N7bv4pZ4PzEiffX4Cc/MwQ3uXhmNhhf
	IX/eowso+md3OM7/m6fuC9Y046dS9FrmTDN9thOWfdryqThUxehUvIfEMAOo9HH18Y47O7Pn8QF
	mzG4sRrWfVPh19cB7U+ai+h3PkGUF10wRnRdkl4qqir9DoNHdvPlWimn0igdwVtfZHGzdy61Kbo
	+T98mk6TsI5065HGjVYEr/rLpy8dhtf6KS9uEVn+V0aAlF4SubszDZwe4V/eaI32q6pp45fOGZm
	madC1zYmXBC9XoV8gw5lYkFh00adoacLOwOWHm4i2xeILvHpO2Vy2/MK+EXy3rGKtXsYbllRrui
	JMVO1/GGBvG9aIKYa9q7t6mGpmqF2plSZmcVWQmYa1x2jLJYw0l431h+Mg7J4cXXpRKA==
X-Received: by 2002:a05:693c:88cd:20b0:33e:4ad0:4bc0 with SMTP id 5a478bee46e88-34cdb8e4cdfmr3821693eec.9.1790840646230;
        Thu, 01 Oct 2026 00:44:06 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e33b73sm4876955eec.18.2026.10.01.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:44:05 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 15:43:56 +0800
Subject: [PATCH v4 1/2] ext4: fix shrinker scan budget accounting in
 ext4_es_scan()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-fix-ext4-es-scan-nr-scanned-v4-1-b13703714ce2@gmail.com>
References: <20261001-fix-ext4-es-scan-nr-scanned-v4-0-b13703714ce2@gmail.com>
In-Reply-To: <20261001-fix-ext4-es-scan-nr-scanned-v4-0-b13703714ce2@gmail.com>
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


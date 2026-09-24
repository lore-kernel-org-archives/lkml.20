Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE722931FB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790213695; cv=none; b=Wa1hWXOx6jxlFfc7z+PBR/vZHWhM9lVPgIubLpoIchBgMKnYVNkoSEP8TIdBfduHwGipVY9NMyOUgkgHDkKkAZGmiJaS2wUeltVriVI8fWvVeiSSVIO3BCpGFmV8dj7LljIY2tnsJw5NqNWrluVobRYAoCbefD8eUJ6W+yWetZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790213695; c=relaxed/simple;
	bh=rm0QZJyhCNRG2njy980FsewnxAh57k5rwRpB/f7YH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0PKhWXEgU4DGGAQ6CK1VcouwhvydMjXOeuVPtwQVRP3n0QbZPBWDCMHTgosAAwk2kiL1tQai/biebwRso4eBmhjIPdSsDwmS9qLxGXUiFH6QvguCNdyzMbdAitNUzTk/5Wwjkh7qrvAR40x7vDiZUwSknTIY22TbB/ktXKLj+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=hc5JU1eP; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="hc5JU1eP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IA
	gpOFMuGWy+t4KkYzW2zYCos/+/v8uv2mYBfk5ALS0=; b=hc5JU1ePbhIIEjvky6
	YV5eTQVZDTG8EGgTKAfzXXJCBQUs9NcEzgdqAqeTLrjz/sBH1t+9CLn5B/T5gT2j
	qlkrUq6k4XpRaHCTGTcyWd1mdKhUj729DEcLgmIS7W2xkv6NBAWwBSvBgYe+AsDO
	gcTPmco3Scw2EkTGWip2Q9J2U=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnT_kJfrRq0Y9wAA--.64694S2;
	Thu, 24 Sep 2026 09:34:03 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 08/14] f2fs: optimize small block size large folio read
Date: Thu, 24 Sep 2026 09:34:01 +0800
Message-ID: <20260924013401.3324687-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_z47SS7OKs_wU=-eiPLTMqF=7w6cekiLFK4ePVAhC8YNg@mail.gmail.com>
References: <20260915041909.2903887-9-zhaonanzhe@xiaomi.com> <CACOAw_z47SS7OKs_wU=-eiPLTMqF=7w6cekiLFK4ePVAhC8YNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT_kJfrRq0Y9wAA--.64694S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jry3uFW3Ww1xKF1rGrykZrb_yoWfArWrpr
	WqgrWqkrsrGFW09anrtanxJ3WrJ34DZFyUJFWkGas3trnFgasxKF40qa4YvFn0krsrCFyx
	Xrs7G34Uuw45ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRuwZsUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQtpOWq0fgt0wgAA33

Hi Daeho,

>2. BIO split risk: If a large folio BIO gets split by the block/crypto
> layer, f2fs_finish_read_bio() would call folio_end_read() prematurely
> on the first completing piece.

I investigated the block layer code a bit, especially the block layer bio
split, and I don't see this will cause a problem.

The call chain of a submitted bio that can be split may look like the
following:

  f2fs_read_data_large_folio()      fs/f2fs/data.c
    submit_bio()                    block/blk-core.c
      submit_bio_noacct()           block/blk-core.c
        submit_bio_noacct_nocheck() block/blk-core.c
          __submit_bio_noacct_mq()  block/blk-core.c
            __submit_bio()          block/blk-core.c
              blk_mq_submit_bio()   block/blk-mq.c
                __bio_split_to_limits()   block/blk.h
                  bio_split_rw()          block/blk-merge.c
                    bio_submit_split()           block/blk-merge.c
                      bio_submit_split_bioset()  block/blk-merge.c
                        split = bio_split(bio, ...)  block/bio.c
                          bio_alloc_clone()          block/bio.c
                        bio_chain(split, bio)        block/bio.c

There are two things I've found:

(1) The split bio does not inherit the original bio's ->bi_end_io.

    bio_split() -> bio_alloc_clone() allocates the new bio with
    bio_alloc_bioset(bdev, 0, bio_src->bi_opf, ...), so bio_init() sets
    ->bi_end_io = NULL, and __bio_clone() (block/bio.c) only copies
    BIO_CLONED, bi_ioprio/bi_write_hint, bi_iter, bi_io_vec and the
    blkg/crypt/integrity state. ->bi_end_io is not copied.

    It is bio_submit_split_bioset() that then calls bio_chain(split, bio)
    (block/bio.c), which sets:

        split->bi_private = parent;
        split->bi_end_io  = bio_chain_endio;
        bio_inc_remaining(parent);      /* include/linux/bio.h */

(2) The original (parent) bio's ->bi_end_io is called only once
    __bi_remaining reaches 0.

    bio_endio() (block/bio.c) first calls bio_remaining_done()
    (block/bio.c). While the bio is chained, that helper atomically
    decrements __bi_remaining and returns false unless the result is 0:

        if (!bio_remaining_done(bio))
                return;

    Only when it reaches 0 does bio_endio() go on to call bio->bi_end_io().
    So the first completing piece (the split bio) only runs
    __bio_chain_endio() (block/bio.c), which forwards bi_status,
    bio_put()s the child and returns the parent. The parent's real end_io,
    f2fs_read_end_io() -> f2fs_finish_read_bio() -> folio_end_read(), is
    reached once, on the parent, after every piece has completed.

    (Note: the decrement is done by bio_remaining_done(), not by
    __bio_chain_endio().)

This is same for crypto.
inline-encryption bio that has to be split goes through the
exact same block layer path above, and bio_split_io_at()
(block/blk-merge.c) only widens the alignment mask to the crypto data
unit size.

So unless there is a path where a split bio carries the parent's end_io,
which I missed, I think f2fs_finish_read_bio() is not called early ?

I also verified the completion behavior on a qemu with kernel version 7.3.0-rc1,
x86_64, f2fs on virtio-blk, order-4 folios, max_sectors_kb=4096, reading a
file sequentially so that the f2fs bio grows to 128 order-4 folios (8MB)
and is split at 4MB.  One split cycle is like this:
(parent bio=ffff888105522f20, split bio created by bio_alloc_clone =ffff888104728cc0):

              dd-679     [007] .....   152.814006: f2fs_read_data_large_folio: BIOTRACE: f2fs_read_data_large_folio: bio=ffff888105522f20 folio=ffffea0004194400 index=4080 len_blks=16 whole_folio_in_bio=1
              dd-679     [007] .....   152.814012: bio_chain: BIOTRACE: bio_chain: child=ffff888104728cc0 parent=ffff888105522f20 parent_remaining=2
              dd-679     [007] .....   152.814013: bio_submit_split_bioset: BIOTRACE: bio_submit_split_bioset: parent=ffff888105522f20 split=ffff888104728cc0 split_sectors=8192 parent_remaining=2
              dd-679     [007] d.h1.   152.816600: bio_endio: BIOTRACE: __bio_chain_endio: child=ffff888104728cc0 parent=ffff888105522f20 status=0
              dd-679     [007] d.h1.   152.816603: bio_endio: BIOTRACE: bio_remaining_done: bio=ffff888105522f20 remaining=1
              dd-679     [007] d.h1.   152.816605: bio_endio: BIOTRACE: bio_remaining_done: bio=ffff888105522f20 remaining=0
              dd-679     [007] d.h1.   152.816605: bio_endio: BIOTRACE: bio_endio: bio=ffff888105522f20 end_io=f2fs_read_end_io
              dd-679     [007] d.h1.   152.816607: f2fs_finish_read_bio: BIOTRACE: f2fs_finish_read_bio: bio=ffff888105522f20 folio=ffffea0004198800 index=2048 nr_pages=4294967295 finished=1

The trace_printk() diff that prints the above logs are here:

diff --git a/block/bio.c b/block/bio.c
index 898b2f5ef8c8..5fa0fa6a2d56 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -324,6 +324,9 @@ static struct bio *__bio_chain_endio(struct bio *bio)
 {
 	struct bio *parent = bio->bi_private;
 
+	trace_printk("BIOTRACE: %s: child=%px parent=%px status=%d\n",
+		     __func__, bio, parent, bio->bi_status);
+
 	if (bio->bi_status && !parent->bi_status)
 		parent->bi_status = bio->bi_status;
 	bio_put(bio);
@@ -357,6 +360,8 @@ void bio_chain(struct bio *bio, struct bio *parent)
 	bio->bi_private = parent;
 	bio->bi_end_io	= bio_chain_endio;
 	bio_inc_remaining(parent);
+	trace_printk("BIOTRACE: %s: child=%px parent=%px parent_remaining=%d\n",
+		     __func__, bio, parent, atomic_read(&parent->__bi_remaining));
 }
 EXPORT_SYMBOL(bio_chain);
 
@@ -1850,6 +1855,8 @@ EXPORT_SYMBOL_GPL(__bio_complete_in_task);
 
 static inline bool bio_remaining_done(struct bio *bio)
 {
+	int remaining;
+
 	/*
 	 * If we're not chaining, then ->__bi_remaining is always 1 and
 	 * we always end io on the first invocation.
@@ -1859,7 +1866,10 @@ static inline bool bio_remaining_done(struct bio *bio)
 
 	BUG_ON(atomic_read(&bio->__bi_remaining) <= 0);
 
-	if (atomic_dec_and_test(&bio->__bi_remaining)) {
+	remaining = atomic_dec_return(&bio->__bi_remaining);
+	trace_printk("BIOTRACE: %s: bio=%px remaining=%d\n",
+		     __func__, bio, remaining);
+	if (remaining == 0) {
 		bio_clear_flag(bio, BIO_CHAIN);
 		return true;
 	}
@@ -1924,8 +1934,11 @@ void bio_endio(struct bio *bio)
 
 	if (bio_flagged(bio, BIO_COMPLETE_IN_TASK) && bio_in_atomic())
 		__bio_complete_in_task(bio);
-	else if (bio->bi_end_io)
+	else if (bio->bi_end_io) {
+		trace_printk("BIOTRACE: %s: bio=%px end_io=%ps\n",
+			     __func__, bio, (void *)bio->bi_end_io);
 		bio->bi_end_io(bio);
+	}
 }
 EXPORT_SYMBOL(bio_endio);
 
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 258a726071d1..834910c61fc6 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -127,6 +127,9 @@ struct bio *bio_submit_split_bioset(struct bio *bio, unsigned int split_sectors,
 	}
 
 	bio_chain(split, bio);
+	trace_printk("BIOTRACE: %s: parent=%px split=%px split_sectors=%u parent_remaining=%d\n",
+		     __func__, bio, split, split_sectors,
+		     atomic_read(&bio->__bi_remaining));
 	trace_block_split(split, bio->bi_iter.bi_sector);
 	WARN_ON_ONCE(bio_zone_write_plugging(bio));
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f5421334ecf3..0376e02c011b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -197,6 +197,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				folio, folio->index, NODE_TYPE_REGULAR, true))
 			bio->bi_status = BLK_STS_IOERR;
 
+		trace_printk("BIOTRACE: %s: bio=%px folio=%px index=%lu nr_pages=%u finished=%d\n",
+			     __func__, bio, folio, folio->index, nr_pages,
+			     finished);
 		if (finished)
 			folio_end_read(folio,
 				bio->bi_status == BLK_STS_OK && uptodate);
@@ -3079,6 +3082,9 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
+		trace_printk("BIOTRACE: %s: bio=%px folio=%px index=%lu len_blks=%u whole_folio_in_bio=%d\n",
+			     __func__, bio, folio, folio->index, len_blks,
+			     whole_folio_in_bio);
 		for (i = 0; i < len_blks; i++)
 			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,


>1. read_blocks_pending underflow: If a folio already has ffs attached
> (from previous writes/holes/reads), whole_folio_in_bio skips
> incrementing read_blocks_pending.
> When the BIO completes, f2fs_finish_read_bio() still decrements it,
> underflowing the counter.

Yes. Thanks for pointing out. I think only when read_pages_pending is not
zero should it decrease in f2fs_finish_read_bio like this ?

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -182,7 +182,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			if (bio->bi_status == BLK_STS_OK)
 				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
 						fi.offset, fi.length);
-			ffs->read_pages_pending -= nr_pages;
+			if (ffs->read_pages_pending)
+				ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
 		}

Thanks!
--
Nanzhe Zhao


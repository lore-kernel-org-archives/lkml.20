Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795DC466B5D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801350; cv=none; b=eblDcRQGvyKqcESB/mqmdls21Z6QxunZX35xpFdvm44q1M6m1HAJVe9+WbBpVImFgELSaxS5niPqRIp365TimH8A+DrNFyuqtGQtntINqIC71H95i3o/GTCkoKT4A/iVaTXnbmP+rbN6GvkTnVf4CZUXXautPCsZMm2Vo08GTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801350; c=relaxed/simple;
	bh=iSu4vq8VUVlCBKz4VBKaC288diGMbFIF0yqfvtN0i1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh8yR8wJhoevGLL4SIbvxniHETfD8066VJAQ4YsHQqIw/TYrBC8SLK0UEmq1fS61UtENRSI74OSUcru0Y91HJg4XXFOHA5+dqCLBWe226LdRAFITqO3WFVzDW8ce+iZpVFe3QmE0hKPmNm3yCPq8aULrc0RKJeHqsVEwiD++iuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3vvqsDh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3vvqsDh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71ae3455aso55919005ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788801349; x=1789406149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZk48Va2SslQwatjNk2SlZrPKFFZPysGFpwSLXm49Bw=;
        b=P3vvqsDhLFjGXIWqhaM4DXqBq79l1/wCZKOrGlQA+9vVCAvu66TquATU1LJw5XAfwf
         gU97Oeia1JPuoQRn6f1j0WdQeGWnNCCg6mMild3plf4otNyedsqkLyxtkTOiWI3H+zsb
         ePU59yC1yrt8tK2cx/4kYKRL6c24hqUsy74I+OSKgXQVC+Lh4eQfyyrzU8h1M6URtJvO
         UOYsnEirDImb5KmdsJUlobcvSsBXzV6wHyaYjJG20Z+K518G83SYUhvdGtY+G+YzhDzV
         G/mjgo0Oq1HlS3ZE8682rJsckYC3MzZlkTGbfU7/mKwk222upxozOMgyCUu+WpcEo+7P
         LUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801349; x=1789406149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZk48Va2SslQwatjNk2SlZrPKFFZPysGFpwSLXm49Bw=;
        b=HGqvHFS57l6g6MnaExFUsTs/6zgKe40qCn9Hm06l3HPMq3AD2XC+q5GJ5JhJfsSOBV
         HBypuLanfCYpUMCm24gdOkQ8du4+hBGaBNl8XsueqSbQytK7ym+uzsXRLbUfxkEQXG3G
         3NS+FN8vTYxRPgvxde88xJxFAJkfev4gvlMwayiOglXvVJAWsyV+7RfHzPFrzsj8gpst
         KxdH8tBqgmG421ZxcebbHJCSW7oCJ4WaKPn62donwxHKPQUkxVBsWt2/ht3DflBROBLV
         MwYsEMoA4Re0DuGLAIAjIhyay+cCcPBZWNlgAAvPt1AzQ66sUWA5rK6+gmDF9XMyvfUT
         CZrA==
X-Forwarded-Encrypted: i=1; AKwUvBxzVHgN0ZoklxPn6LYmm0dLzS4rKoV4GjYkBHYMjkWen5g6tkDSuRFkOCV7QPxrklN2HRBopk62kqTLRNI=@vger.kernel.org
X-Gm-Message-State: AFuF++m29Mn/EqnFHLIotH87rtt8/5bYcF5vf6Zbgkdg5LECVLOGr1iQ
	UosqE4Fhiv/0Q+gRmN05tr8MdXF3pf9BrkXekSMISd8TWBd+bonOevus
X-Gm-Gg: AYBFou0jjpOJ/bwLG4lcULxETB57t1Gf5Z5P9q0HIbRgOAS9mJ5fLryUu2sSU8dV43i
	6SBRsjNi5cV2dsOfDbYsYiJKAVm2+9MyQS+dkjI8l1mtJ+NE1fomuj+ifryn4G9IagL9oMEFFjX
	ArvI9Ghc9TgZOP1jOe+PSFuRBqdUqymWhs7kE3Qjwm0/mVB95GXLTmGSWrgMp2EcjrxIWGNWt1g
	R3VhgC14QWtIhFuryPL+kiSX/tq6lSif8+KelFezwtP/oCKIwF0HuvraPLe8K7SUdpvuujcZ5nA
	rm92GwmFXa8xr/DyNGo/y17k1opK7UrAOpjUDHkQ76xPRd1mroja3Uphp1/4KK+P1NRQe2oThj0
	x0UGV/OilfJGM6jsOAt8NLJfgK6KQnhLJJFNA6b7+eB4BrBYRIP4Q9JW+YK1xjoXiKpS5PrAVb5
	KNu7V/l0sTEA9yodpLJZJ8Bl934/WNFxdnjBsnPQH5vjpG7NZEYjXwpkfpoQ5s1CWCaTOfBlyjk
	Q+hVhU3
X-Received: by 2002:a17:902:7788:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db127c0b20mr262194895ad.12.1788801348608;
        Mon, 07 Sep 2026 10:15:48 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:ab3b:f926:2655:db37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm45963195ad.82.2026.09.07.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:15:48 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: Re: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Tue,  8 Sep 2026 00:15:43 +0700
Message-ID: <20260907171543.8175-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <56524bbf4d0a08e932f9cea18861538151a89534.camel@dubeyko.com>
References: <56524bbf4d0a08e932f9cea18861538151a89534.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

Thanks for looking at this.

> Could you please explain the use-case or workload that is trying to
> claim more blocks that fork can include for Extents Overflow file?

It is not a normal workload -- it requires a corrupted/adversarial
on-disk volume, e.g. a loop-mounted image (removable media, a
downloaded .img/.dmg, or a fuzzer). Per Apple's TN1150 ("HFS Plus
Volume Format"):

  "The extents overflow file also stores additional extents for the
  special files except for the extents overflow file itself."

So by design the extents overflow file must always be fully described
by the eight extents in its own fork record; it can never legitimately
need an overflow extent of its own. The syzbot reproducer mounts an
image whose volume header sets the Extents File fork's total block
count higher than what its eight direct extents describe, which puts
hip->alloc_blocks != hip->first_blocks for HFSPLUS_EXT_CNID -- a state
the volume header alone can force without the extents tree itself
being touched. hfs_btree_open() doesn't currently validate this fork
against the invariant above.

Once mounted, a plain pwritev2() to a regular file (call it FILE_A)
that already has extents cached from a previous lookup is enough to
hit it:

> Could you please share the call trace for the issue?

  pwritev2
   -> hfsplus_get_block(FILE_A)
   -> hfsplus_file_extend(FILE_A)
   -> hfsplus_ext_read_extent(FILE_A) -> hfs_find_init(ext_tree)   [tree_lock acquired]
   -> __hfsplus_ext_cache_extent(FILE_A): FILE_A's cached extent is dirty
   -> __hfsplus_ext_write_extent(FILE_A): needs to insert a new record
   -> hfs_bmap_reserve(ext_tree): ext_tree itself is out of free nodes
   -> hfsplus_file_extend(ext_tree->inode)          <- now growing the tree's own file
   -> hfsplus_ext_read_extent(ext_tree->inode) -> hfs_find_init(ext_tree)  [tree_lock again -> deadlock]

Full syzbot lockdep report for reference:

WARNING: possible recursive locking detected
6.16.0-rc7-syzkaller-00120-g5f33ebd2018c #0 Not tainted
--------------------------------------------
syz-executor310/5840 is trying to acquire lock:
ffff88807fe920b0 (&tree->tree_lock/1){+.+.}-{4:4}, at: hfsplus_find_init+0x15a/0x1d0 fs/hfsplus/bfind.c:28

but task is already holding lock:
ffff88807fe920b0 (&tree->tree_lock/1){+.+.}-{4:4}, at: hfsplus_find_init+0x15a/0x1d0 fs/hfsplus/bfind.c:28

5 locks held by syz-executor310/5840:
 #0: sb_writers#8, at: vfs_writev+0x288/0x960 fs/read_write.c:1055
 #1: &sb->s_type->i_mutex_key#14, at: generic_file_write_iter+0xe3/0x540 mm/filemap.c:4252
 #2: &hip->extents_lock, at: hfsplus_file_extend+0x1fc/0x1990 fs/hfsplus/extents.c:458
 #3: &tree->tree_lock/1, at: hfsplus_find_init+0x15a/0x1d0 fs/hfsplus/bfind.c:28
 #4: &HFSPLUS_I(inode)->extents_lock, at: hfsplus_file_extend+0x1fc/0x1990 fs/hfsplus/extents.c:458

Call Trace:
 hfsplus_find_init fs/hfsplus/bfind.c:28
 hfsplus_ext_read_extent fs/hfsplus/extents.c:216 [inline]
 hfsplus_file_extend+0x416/0x1990 fs/hfsplus/extents.c:462
 hfsplus_bmap_reserve+0x122/0x500 fs/hfsplus/btree.c:358
 __hfsplus_ext_write_extent+0x28d/0x5b0 fs/hfsplus/extents.c:104
 __hfsplus_ext_cache_extent+0x89/0xe30 fs/hfsplus/extents.c:186
 hfsplus_ext_read_extent fs/hfsplus/extents.c:218 [inline]
 hfsplus_file_extend+0x444/0x1990 fs/hfsplus/extents.c:462
 hfsplus_get_block+0x411/0x1530 fs/hfsplus/extents.c:245
 __block_write_begin_int+0x6b2/0x1900 fs/buffer.c:2151
 block_write_begin fs/buffer.c:2262 [inline]
 cont_write_begin+0x789/0xb50 fs/buffer.c:2601
 hfsplus_write_begin+0x66/0xb0 fs/hfsplus/inode.c:46
 generic_perform_write+0x2c4/0x910 mm/filemap.c:4112
 generic_file_write_iter+0x10f/0x540 mm/filemap.c:4255
 do_iter_readv_writev+0x56b/0x7f0 fs/read_write.c:-1
 vfs_writev+0x31a/0x960 fs/read_write.c:1057
 do_pwritev fs/read_write.c:1153 [inline]
 __se_sys_pwritev2+0x179/0x290 fs/read_write.c:1202

(full report: https://syzkaller.appspot.com/text?tag=CrashReport&x=172748a2580000)

hfsplus_get_block() already refuses HFSPLUS_EXT_CNID for the lookup
direction (extents.c:261: "if (inode->i_ino == HFSPLUS_EXT_CNID)
return -EIO;"). This patch adds the same refusal on the grow path in
hfsplus_file_extend(), which is the one hfs_bmap_reserve() can reach
with tree_lock already held. It doesn't fix the underlying corruption,
just stops it from self-deadlocking the tree_lock; a hfs_btree_open()
check that rejects such a volume outright at mount time would close
the hole earlier and I'm happy to send that as a follow-up if you'd
rather validate it there instead.

I have not personally observed the crash on current mainline: I
rebuilt the syzbot C reproducer, and hfs_btree_open(HFSPLUS_CAT_CNID)
now rejects the image at mount (silently) -- it's a 2022-era fuzzed
image and mainline has since gained catalog b-tree validation
(node-size sanity check, record-offset table validation, etc.) that
this image no longer passes. The analysis above is derived from source
plus the syzbot-provided trace, not from a reproduced local crash.

Thanks,
Thang

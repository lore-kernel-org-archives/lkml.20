Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655677;
	b=G7FQVqXtZEeUPNcksxTNGweXH5ouhwPtEKiOaFXcvbvDxk4GRZQtyTYtoJhIkMUBtiNN
	 8gGvRvGuro+XFHKaQywkZZS5I91LuIB3ELFfGlwVRGefWAZF0J7bb+LuTotibu7D77B5B
	 xwoLdlpiDO122gPUgcEu+i/Qz2PFMS2szG/oDHfxMhK444NzxLYJRRa7Xi5XKr8QCX85P
	 5X85tK+ASXO//6CHAodXV4UDDj0h3ncf5chJUj0KjL8s3aevizOa0qXdOG3O+nrlOCaPh
	 tBhDYVh4hT/ze5Yzw7Xz1bg9WXjGWUx5Xkz1fh9+tYyUlueLMDhR1kbTIytCv3/AvTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pTX8QrcyUUm2Sd+x+BosIb8jc8T/wMYsQo2KtUzjNxo=;
	b=SyOEYIh9Zo8p05VFTUfWf+iWVcRF+JSuH9IJLtpBfCnSAQm5Zq0IwRcUDFSWzzOA185R
	 JauBep6c0Pf+MTq2JwtpQPztOUq+R/0y5ZIh4q5EHURHjyzOgeLp/BvnYv5H/dI95rPxn
	 wQMCtQpmxKdIO8jLSkfel3g6mE7je84HGJ0w7egA80R1lCw4C82R9kAbZoVqrjq09Ebik
	 YwpJR5t/1BPuSAEpu98H9wIg4HJXChV9hKjKHeakXhr090rD8HSVOicHlq0RdRzYmTSY8
	 EuRmc0Daa5cbT4qx9G0OlPp+JvITBbyYGbwO/5x+YLgISqgSqkGj7w+tCbg09EVKSDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HleadZEK;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66806606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66806606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HleadZEK
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a0a87595so887470a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655677; x=1793260477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTX8QrcyUUm2Sd+x+BosIb8jc8T/wMYsQo2KtUzjNxo=;
        b=HleadZEKOLGkJQLZRPXpSKv42O3MBG8hsOccAdU2QokOtDqfaWY2fdCjlUGMsca4aB
         oCTYuCbChizEXWWVA5AnYhLCCKuLIWgpDZTuply8lbHX1kY+BdkGF24UgRWwL+9+MNkb
         AAWxMAt8hZaIElj9CITOkugSxv8Ldn4A/wpM8mLqx9msdRMw1DHLQx5R2HPqZmAD3t8f
         Z/hxZUd10+cTrZDMfVmeevg+PCmgT15rC/5/xnqgJX2Gp7w/qTb/GQ1TIElbmvFV8i1L
         tp3nKYvzz7/m2Icqlr2olHPZp6U+x3cy4oJguEtkLzUKlQ3U9s8i7OGhM9BSiRiDnHQW
         f8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655677; x=1793260477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTX8QrcyUUm2Sd+x+BosIb8jc8T/wMYsQo2KtUzjNxo=;
        b=eBsTRJ+d0tCxnR0DKrOSQj3uwoKWv0/9B9AiY+E+T9PjjcV2C+oDNlM9NfuUlAC9uX
         9JgIAh8dnSCLd87QBgLUwmrNIZHDzoiHjbdhZKA5XJbaEoFtr347M773mMzQcA307d9M
         XavU+uPNxGYgatGo74d4V2V0d189To26i/nxheBA1QkGGmwDtIWKNFKUV+PAnjLStF7N
         EoSfX/NPhUQEMr+gPbqhs1bE9o3f88NXYUq5QQRVsKwYgQYN4ATlYH8j2NoXb2TuYU+7
         JQ941BSkcafykYBdRdBmwwx3rbj8jO5/kCGK2ve0UiTlBpc6qiZXSp98/F6JMsWf1yN2
         0ALQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZrgNMZLXWbaRWHnZLmiwXjGIaf/QQWMBt0JQeYEIy61ivgtB/80wks4zxXTrYtdjswCtvG7cJD7uQft4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaBDTgww3yz6RxSomBjK9H1hpTpWgdzj3B1I3No14ZKNTlnJHd
	ccslNAqF1IMcosoenmkB2lFZqPJQ7yvAntx0SVDbeD9R4tSs589P3caP
X-Gm-Gg: AYBFou00DmMShha3ADai+j36dIWkdSdwjrE8nS3eYrNJP+BjeaxQmhRfmPx+opg6daQ
	Dzvo0kzdfASq20qvVg5m81irNjzL0yh9otQ6OvNZSdoO4eZZWp7d7GMYzpP+BS+ygs9nh2mwMLC
	hhVOG9FMmqzaCiRYwNEX+mkzeUefvUZv4zZY3b0/GdmjZb4vbJFNzpjoPkGodbMvSYmeimu32iS
	UI8Ia6TkTAF2YTd8KDJZptp7YW+M2TpcRgoJpL7vPa46mBLYHe4tlwZgN230SMDKbHEIe6O+dPX
	qQhlOVxhe21Fw9m0nnOOQ5qz/oCEVJRlu+sKLOdzF885IrK3bUsTqE/DG+7Osmow1/31N/eLeHi
	DO2SCq6hun8IV3vWNIcON1oxSFKCycxdtgY89zNhDseEqG5NZnBzjvxqivq/leILrS0sC1R0LPo
	cEydeAcF4Z0+ZkEIJLSziEB22cNg5sASw7aSDjxXlRDuvYoiKofTK9mQnE9Kbutcyg3A10bZdPw
	ThXGW6NztKBR6Kzfra1iwlDTojTYHpYFFTSXjCLWaicOCv1ETKEBcFtUMnHnwlLQBB7yk+rm814
	sxOk7FJMoO9cFywte/Sxmf9nNEJfiUT1sf53cVV0
X-Received: by 2002:a17:90b:180d:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3ad8709e501mr3878379a91.55.1792655676655;
        Thu, 22 Oct 2026 00:54:36 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:36 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v6 11/15] f2fs: handle partial truncate of large folio dirty subpages
Date: Thu, 22 Oct 2026 15:53:38 +0800
Message-ID: <20261022075343.3043003-12-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_folio_dirty_range() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e718ed01fe7c..24613b00f843 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -404,7 +404,6 @@ static void f2fs_ffs_put_write_pending(struct folio *folio, unsigned int nr)
 	if (folio_test_writeback(folio))
 		folio_end_writeback(folio);
 }
-
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -2955,6 +2954,41 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 		folio_mark_uptodate(folio);
 }
 
+static void ffs_clear_subrange_uptodate(struct folio *folio,
+					size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages, start, end;
+	unsigned long flags;
+
+	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
+
+	if (!f2fs_folio_has_ffs(folio))
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	bitmap_clear(ffs->state, start, end - start);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+}
+
+static void f2fs_clear_truncated_page_state(struct folio *folio, pgoff_t i)
+{
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs_clear_subrange_uptodate(folio,
+				(loff_t)i << PAGE_SHIFT, PAGE_SIZE);
+		folio_clear_uptodate(folio);
+	} else {
+		folio_clear_uptodate(folio);
+		folio_clear_f2fs_gcing(folio);
+	}
+}
+
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3732,7 +3766,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
-		folio_clear_uptodate(folio);
+		f2fs_clear_truncated_page_state(folio, fio->folio_offset);
 		goto out_writepage;
 	}
 got_it:
@@ -3882,12 +3916,31 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 		}
 
 		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
-		if (err)
+		/*
+		 * If a subpage of folio for a cow file is dirtied but not
+		 * reserve a cow block, fallback to original inode to lookup
+		 * block address
+		 */
+		if (atomic_commit && (err == -ENOENT ||
+		    (!err && dn.data_blkaddr == NULL_ADDR))) {
+			f2fs_put_dnode(&dn);
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, data_idx,
+						     LOOKUP_NODE);
+		}
+		if (err && err != -ENOENT)
 			goto block_done;
 		dn_held = true;
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (err == -ENOENT || fio.old_blkaddr == NULL_ADDR) {
+			f2fs_clear_truncated_page_state(folio, i);
+			err = 0;
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -5426,10 +5479,41 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
 	if (inode->i_ino >= F2FS_ROOT_INO(sbi) &&
-				(offset || length != folio_size(folio)))
+				(offset || length != folio_size(folio))) {
+		size_t clear_start = round_up(offset, PAGE_SIZE);
+		size_t clear_end = round_down(offset + length, PAGE_SIZE);
+		size_t clear_length;
+		bool dirty;
+
+		/*
+		 * If the truncated range falls within a single subpage, no
+		 * subpage state needs to be cleared.
+		 */
+		if (clear_start >= clear_end || !f2fs_folio_has_ffs(folio))
+			return;
+
+		clear_length = clear_end - clear_start;
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
+						clear_start, clear_length);
+		ffs_clear_subrange_uptodate(folio, clear_start, clear_length);
+		folio_clear_uptodate(folio);
+
+		/*
+		 * If the truncated subrange happens to clear the remaining
+		 * dirty bitmap of the whole folio, cancel the folio-level
+		 * dirty state.
+		 */
+		if (!dirty && folio_test_dirty(folio))
+			folio_cancel_dirty(folio);
+		if (!dirty && !folio_test_writeback(folio))
+			folio_clear_f2fs_gcing(folio);
 		return;
+	}
 
-	if (folio_test_dirty(folio)) {
+	if (f2fs_folio_has_ffs(folio)) {
+		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+							folio_size(folio));
+	} else if (folio_test_dirty(folio)) {
 		inode_dec_dirty_block(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
-- 
2.43.0


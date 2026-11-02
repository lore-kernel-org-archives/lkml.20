Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648434;
	b=CmtrpiKAabQpIQFrMkhzhTTraSeUhUlRE3iaMcbXMelxk/IlktT/4TdbSSIcAUk8e7eR
	 q9PD+TT4MpqLyd4jMdAw4AE4e4vReG4QBiYFY3zpS8e03fLSPPL/fK+nc1bmgE8pLoSt2
	 BT6a6q/ddtjhT+dSyJ8JL8obd1pDcqZz07SqOe5+jAWztwDQO0CAGmPZN2NpG1CTWj9/F
	 AzCHkVIUH6WyQKfXEa7Pf7ZvlGKznfdqdlDS7ECAsmBxQZvDy/msfZcmvOHcKoMEBhDZ+
	 CHQvuxnE88q17IGJZSYLOttzGiFeqPLRrTSylt8W1uGBbJnO/ak0No8ATjp/q8bHA+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/EfsdsBU5GGCMcSg3xK/a0oN6TfPFwO3ihDHCjXuTkY=;
	b=tFIr2mizA5wW6jitJPnMGHYRcweQEOSbF/YwEwOh19EPi1rO7XAVVERkmW8ocTjY8n4n
	 X1aL7JF0JHGHjE0We61YpAcNgDHnJ+jkbs3CltEl4GIIylyPkwTYBhyx4GWXQwT417cAX
	 wrLI+kN2mmJxnfIKIFVe0Ikffrgi3x6wHWykoXVrMXeCRwB8KULj1VASdKZHIPjt5jeOX
	 iEpyr1QFA8WX0x6dvRcdkJLlYtirb32bjelS3W1DMqrooE/9g/Ukn2IXW46DRbnO6ijO6
	 O6jo8rfbeMVJnT5raKzPKPcFgpg7Y1ZnOOZ7EurSumUpc9XrdWdisGunTKtpfLUE35Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZUkgx3e;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBE36082BD6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBE36082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZUkgx3e
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a9f9473029so2397097b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648433; x=1794253233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/EfsdsBU5GGCMcSg3xK/a0oN6TfPFwO3ihDHCjXuTkY=;
        b=XZUkgx3eyNWqUYpZkXOC1of3XJc/31t00fgn590e8PGbnMapXuPXso5P0tGkwDwHWT
         iL9Txr4YlJMOQWxyr2WwuUTX1mEFLkG2lcZ0BDoCLGa06eJxapcRMPESPk29Omz6gOu5
         FcTt0bLHx18QwT80oXj+gYpdldZrbXFMlTkG2vbP3UKHCNBVUmWaGHjWqRc+OXP1+Yem
         hy97Oq1cITrZ6mSaggquJ3DG5veH+aGgzrIotegOsG4Z5Xpuis2B5llY/0lfkgRRqyxL
         sFXdJmbZTUTpCldnZ5KvkFJDmebpglKHbEre37PqfrbHinQHTfKNKZ+7AGsvie7+lu63
         Jh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648433; x=1794253233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/EfsdsBU5GGCMcSg3xK/a0oN6TfPFwO3ihDHCjXuTkY=;
        b=R+cHzMqZmjOEOovjrlhO7XsuSvAPXzbAovLFNc1NAE1rk2Wv4kRk0HBbboCdp2td3q
         FIqtq4UrtZnFxH+S9wn5qPjI4mmymAl/5Wn3+IBztIvtSrmRL5bqplDXBQaSrBwga//M
         B4GJtVwVsgmFafc5ckH0MO4DVoKzBwcM/48wkqOW+zyNfG3bl5A+x3+rNa+kZLcW6TkU
         qikdw80Q4R9YMeqnGWRqbFsjThg8LWrQ08YEqpclUxVBHqYcyAz8aiEcR4QR10ERpwkw
         k3bRQTPIbX+VPde1p8tTH82Jl5ZKaTb6NnWKeud00DvSU8/tMiclHxfwAdN0dlsfvTj+
         6T8Q==
X-Gm-Message-State: AFq9FYIMyEeBllWQ2CUUu0PGdBa0Oh0zqB6hRyH2i6OuiEKIwwzc4w7X
	zgGT/7XysllowEDM3rNsTu3LrzKuSd2aSfiwnSfkYzqNQWTW1jnLdJdqYg3HE4dk
X-Gm-Gg: AYBFou1i5Grjr3FLRi1DLl/nLznr/Q9lPvAYEiDxUgpdT4Riyi12fdAPkHKOKSFnnyt
	BKgu5nQaZRSpfpeu46x+clwxhuqWGdIntXmZWzf5ypR5yhDpCg/IhXobb0PTcG7hXrZyzSw1Ynb
	2hn0kgXGYrcFCwhz0/7h6IdH78tLCTyOnYiov6KJ1a5J2/jFQKyAczaMshYj5pCkoE3LmcE9tsu
	3vpXDUYAi+nOaggd+N3SCaPyOxzekqm4JffDVfeo4zmQt0lJn+xzw6yb7lIPkoUcX88JuNyUap+
	jKOd8+MtgIiFeVX4nYMQJVfhtnOsFv9HrTVwJqzI3xy2gI2193iYjd2j28lbLrCJj+1uSV9fMQy
	61xh34r+0WGeK+qjitp9AroGXWn1QReZMOQ0PKRjQbQ939+838iOmKnr4iTy8UFFqYqNOKGNl0x
	5TnjhC/hFKRDVK7ao6iWhGonOJBfj93YnCGu9vgKIn5ILPKJF1H8qiGlNRsjKE+8zZxVWROfjLc
	wXVnBYbLtN0aCGHtbkuMx+v+RhNYezvZ3VUxBKO4LmrA49WVKmLWfc9AiEsq7lCFr25hEXyJWEp
	cHCatt5QNoV3y7AjRH3SEVTTo0i8a3v4D32sDApxDETsdeDUrpcGbJ0d1XoqbbCaS1w6/9EGbHo
	DKp79uEjKOuaSZQJhBOYTEzar49qPIlkJuzqNFHSEoaDtMA==
X-Received: by 2002:a05:6a20:6a0b:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3e928a29f0bmr10451690637.56.1793648433516;
        Mon, 02 Nov 2026 11:40:33 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:32 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 14/20] f2fs: support subpage blocks in fs-verity enablement
Date: Mon,  2 Nov 2026 11:39:46 -0800
Message-ID: <20261102193952.3002018-15-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Check verity per block. While enabling verity, dirty and write back
only the data blocks below i_size in the folios before the verity
metadata. Remove the -EOPNOTSUPP checks. The changes for enabling
verity also apply to large folios when the block size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c   | 15 ++++++++-------
 fs/f2fs/f2fs.h   |  5 +++++
 fs/f2fs/file.c   |  3 ---
 fs/f2fs/verity.c |  8 --------
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 929a2beef379..a23fd4b01a4c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1671,7 +1671,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 static inline struct fsverity_info *f2fs_need_verity(const struct inode *inode,
 						     pgoff_t idx)
 {
-	if (idx < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+	if (idx < F2FS_BLK_ALIGN(F2FS_SB(inode->i_sb), inode->i_size))
 		return fsverity_get_info(inode);
 	return NULL;
 }
@@ -2924,11 +2924,11 @@ struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
 		pgoff_t first_lblk = f2fs_folio_lblk(sbi, folio);
 		pgoff_t valid_blocks = 0;
 
-		if (f2fs_verity_in_progress(inode))
-			valid_blocks = nr_blocks;
-		else if (first_lblk < last_lblk)
+		if (first_lblk < last_lblk)
 			valid_blocks = min_t(pgoff_t, nr_blocks,
 					     last_lblk - first_lblk);
+		else if (f2fs_verity_in_progress(inode))
+			valid_blocks = nr_blocks;
 
 		if (valid_blocks)
 			bitmap_set(ffs->state, nr_blocks, valid_blocks);
@@ -3657,7 +3657,7 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 			return ret;
 	}
 
-	vi = f2fs_need_verity(inode, folio->index);
+	vi = f2fs_need_verity(inode, f2fs_folio_lblk(F2FS_I_SB(inode), folio));
 	if (vi)
 		fsverity_readahead(vi, folio->index, folio_nr_pages(folio));
 	return f2fs_mpage_readpages(inode, vi, NULL, folio);
@@ -3677,7 +3677,8 @@ static void f2fs_readahead(struct readahead_control *rac)
 	if (f2fs_has_inline_data(inode))
 		return;
 
-	vi = f2fs_need_verity(inode, readahead_index(rac));
+	vi = f2fs_need_verity(inode, F2FS_BYTES_TO_BLK(F2FS_I_SB(inode),
+						      readahead_pos(rac)));
 	if (vi)
 		fsverity_readahead(vi, readahead_index(rac),
 				   readahead_count(rac));
@@ -4717,7 +4718,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 			op_locked = true;
 		}
 
-		if (!verity_in_progress) {
+		if (!verity_in_progress || end_pos <= f2fs_verity_metadata_pos(inode)) {
 			poff = offset_in_folio(folio, isize);
 			end_index = isize >> PAGE_SHIFT;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8e3224eacdb5..8e38d46c446c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5345,6 +5345,11 @@ static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
 	return sbi->aligned_blksize;
 }
 
+static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
+{
+	return round_up(i_size_read(inode), 65536);
+}
+
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
 					unsigned long type, enum fault_option fo);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29cfc0e2719a..1c440b5fa9bd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4273,9 +4273,6 @@ static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
-		return -EOPNOTSUPP;
-
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 
 	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index af1b7f21c1d8..5f579d0b917b 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -32,11 +32,6 @@
 
 #define F2FS_VERIFY_VER	(1)
 
-static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
-{
-	return round_up(inode->i_size, 65536);
-}
-
 /*
  * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
  * kernel_write() can't be used because the file descriptor is readonly.
@@ -94,9 +89,6 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	struct inode *inode = file_inode(filp);
 	int err;
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
-		return -EOPNOTSUPP;
-
 	if (f2fs_verity_in_progress(inode))
 		return -EBUSY;
 
-- 
2.56.0.317.g454f8302e1-goog


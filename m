Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903628;
	b=OQegU/O2unvNADHAEr/9k1KQOUQ+jV2m9qdwUsw4FCd4Vm5bUWRW4Vb5D90PI80jk812
	 55kMgkZb/wDcpqZIrofskm9CFd3YWQs1rANNmU0PSAZ5KIu1nwMGbZgzVo31+sGmXA/wD
	 lMADFsMTnfFLYdJC/XZWT16CbwDmv7vWa2fzX76CLrvSrfBHyc2tJpZvQ4f2rFtQT0BZw
	 golmbYrPLU1edhcf9AUDBvOlqhXIzhuZQ23AaBSy1iZZPTP0eklgueAdtlpltr6k7sdJY
	 8wOZUltteURO81DtxzWafnOGa8gaX8VsFol01PAqnTIFKd8TQNDJdWrR7c28TT4bqrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ilfTlGEVdRlPfXiq6l/vyhaxfQkfO2sNEW/ZUn0qoLo=;
	b=uf+Hw++C/1UkpwuTjoB49vI7y4YC0qSRMbYqKsOmICXRHeBRMiZQCwSP3BW1MQ3j3xGu
	 FPvhnakaMo3dHIiNp5yF8a49fiUdEJ4m15BSnJxwMp0mISVjYvt1TU1a9oLpUy9H8NLsQ
	 KMsFFpIJpzN2YbF39ZYyqbMxPehcEqLDOnTY707pSnqZFCmp9OubbJdjvk246S4ijph3t
	 rS/dvQWCa9OfWebr39TXlN6Suh6k2V7PgQayFGAnxytxU+zdivl35HPHDllK/pNsM6iua
	 ZClmv8fn259KTK3t5mQmNb6iZiqNi5nlNgNA36/V945LvSQWWvZSg/TD1XjGuSiEQzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DuOM/rDr";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5D606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB5D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuOM/rDr
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2122733a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794903628; x=1795508428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilfTlGEVdRlPfXiq6l/vyhaxfQkfO2sNEW/ZUn0qoLo=;
        b=DuOM/rDrDPnC5xdKKu6/TivDXImTRdfvb3F3XJAgBmx7L0nv6v9H+B1X7GDUZN4vfV
         KkwmkHcaEDvkNq6lz77dEvjanqI6VkLeHqvqw5X4vgXIfGVHriq2crTAUBO07t3bQ+bN
         Gj2Y/LC1IjqzBcVNS3Kwy0oP1Uwww4OUKNTWVL4476p0MNgZZoWGolPgB0WBm9mc76Ns
         cF0R/iuuEJ8p1gO/unrCsMUYm11985mO3LJiGt4mO+xm7z/hDsZ5kIfkUFW08O+g6OdD
         sUDju1H7tWDYxdyDmHH+JNFOOz/lw3UmbwFUXQRPgEes7RQkh4g7oHDh//javbSPmxqw
         CE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903628; x=1795508428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilfTlGEVdRlPfXiq6l/vyhaxfQkfO2sNEW/ZUn0qoLo=;
        b=bV4gZcjLjUcSoaAPV221w6thShWGJ2jD+Y4DqTGi6TONe+tTfV7lv+8iGrB6BcNksJ
         1JtN1GCMsuC2mS1Cx4GkFayvLqJkzt6fofAkixWam6Zmycxo2ETpeP3L0jIoLPmbQUri
         3+5esjo9hID7UBCuRyygRXALoKku4qJUihJ5fzB8xGShZ97PnBmPBu7umby92Qhgyl28
         1ki6sXUP6cWjdPJSl+9Zzjx35cXQ9qn7IwlnYwYkiIa1uKQaRPtjFJWD+0rkCWzd2I9l
         kY4AeGH6ff8pfmixR966lKZens0Mp0mE9BCnOPTbhfGKLS7jtPxG6TR6Hn4WTq2eWvWy
         nFgw==
X-Forwarded-Encrypted: i=1; AL+hErHK1hH/BOxer+WtLTJZp7oTCMM0YKscjQAlrstcr9/QdsJoiAOPMIfukHfWcmfvKuPztY+2otPZItCCo5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4v7npS89U/xUNRhwrkvhQ2Zo6p5o8PiqIQoANub+g8U+l/IGd
	QrZddBvkP3rwVM2toicjKwVVOgO9bBW7MORN4HZsE3hujVH/UpWWUhKh
X-Gm-Gg: AZFdTZeWAJqZLqr4429IIx4IKi+gRW8KgSlARR9gWq9fq+76q41ciEddsOIXoSG5znC
	r6jIH6wk6ON5bc+o0Y2BVXkVwrpOfw4Ok09gxQz4JzjdeOWzvko2JpsY/P565mdxuGv5IJTuDpI
	NW2KqoVNacsJL1icqAjYfJo4eg5JaWceHD/2KPJlEAmnlHh2xwqfSv0AxVic8SbSHISgt6v1KpX
	6k+L4CB8vBLrnh1TEHGnpsR6vViinz0+XgG71lMM68Xp41IfQi4z08xEkqlx1wbHFwpsolqcO0r
	voYMUnNRWlkyvXTO/m68RC385uLPpMZvAhinljAniAnIOQX978mU3ACGei1ymoT2DbqA1NRAZ6V
	Up1MukgEYQFZefnphH17T9XjjY2hv0/5IKznW5siap4dGeEcpHGDlovxsmM+c8Syq6Ubv04T/JQ
	Kcv+UCW/uW6TkfjqsCPmOkmFmV3krkEy9h6VM0Q/MfOffA2TxM+/iFrjDftMvt0xTj2fg6vdIvQ
	YQwcLHQVcNkE96tpadtAQQR2u52ZkU+9ZdcMdZJrdXjh1q5q2VdQi3k79EwY0ueNwfuz08iPrpr
	Ipz1onq95NrSRF7lmJ5giELc3ezjO+J2TI8yRpdqCj1Axw==
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr11511345a91.40.1794903627496;
        Tue, 17 Nov 2026 00:20:27 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5407545a12.21.2026.11.17.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:20:26 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: liubaolin12138@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v6] ntfs: trim the sizes after a short write
Date: Tue, 17 Nov 2026 16:20:21 +0800
Message-ID: <20261117082021.2947603-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_file_write_iter() moves the data size and, for a non-resident
uncompressed file, the initialized size to pos + count before the copy.
__ntfs_extend_initialized_size() only zeroes [old initialized size, pos),
so the range [pos, pos + count) is initialized only by the copy itself.
When iomap_file_buffered_write() copies less than count, it returns a
positive short count and the error rollback at out: does not run.  The
file keeps the size pos + count, and [pos + ret, pos + count) reads back
whatever the freed clusters held before, also after a remount.  A local
user can read the old contents of freed clusters this way.

Run the existing rollback for a short write as well, and roll the data
size back to the end of what was written.  Keep the initialized size,
as a page fault through a shared mapping may rely on it while the write
is stalled on its source, and zero what the write did not reach, up to
the end of the block holding pos + count.  Only if that fails, take the
initialized size back to where the zeroing started, if it is above that.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v6: cap that fallback at the current initialized size, which a failed
extension before the write can leave below pos (Baolin).
v5 (Baolin):
- start the zeroing at pos, not at the old initialized size, which
  overwrote data stored through a shared mapping below pos
- do the same for a direct write, instead of truncating the page cache
  and taking the initialized size back
- if the zeroing fails, take the initialized size back to where it
  started, instead of skipping both rollbacks
v4: for a buffered write, zero the unwritten range instead of
truncating the page cache and taking the initialized size back, which
dropped data stored through a shared mapping during the copy (Baolin).
v3: clear the cache up to EOF, not up to the extended initialized
size, which left the rest of the block holding pos + count (Baolin).
v2: also clear the cached tail of the last block, which v1 left in
place when the write stayed inside the old data size (Baolin).

v5: https://lore.kernel.org/all/20261116091121.2547497-1-zhanxusheng1024@gmail.com/
v4: https://lore.kernel.org/all/20261113050148.1466682-1-zhanxusheng1024@gmail.com/
v3: https://lore.kernel.org/all/20261112093233.1118469-1-zhanxusheng1024@gmail.com/
v2: https://lore.kernel.org/all/20261112030815.982026-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261111093459.660484-1-zhanxusheng1024@gmail.com/

Tested in a VM on ntfs-next b025f526c5d0, with all free space filled
with a known pattern first.  Short buffered writes of 4M, old data
readable after drop_caches and after remount, 3 runs each:

                                    unfixed    v5     v6
  fallocated, ends block-aligned    3137536    0      0
  fallocated, ends inside a block   3141332    0      0
  fallocated, unaligned start       3137536    0      0
  same, pos + count in that page    -          0      0
  append                            3137536    0      0

Marker stored through a shared mapping at 64K while pwritev() is
stalled on a userfaultfd source page, state after remount, with and
without fallocate():

                                          unfixed  v5     v6
  buffered 4K at 128K, EFAULT             lost     lost   kept
  O_DIRECT 12K at 0, EFAULT               lost     lost   kept
  buffered 12K at 0, short 8192 (v3)      kept     kept   kept

A store into [pos + ret, pos + count) itself during the write is
zeroed, as that range belongs to the write.  With iomap_zero_range()
failing (injected -ENOMEM), a 32K write to a 16K file that returns
12288 leaves the size at 28K with no old data, also after remount.
fsx (buffered, no-mmap, O_DIRECT and mixed), compressed files,
fallocate, insert/collapse range and punch hole give the same results
with v6 as with v5.
---
 fs/ntfs/file.c | 70 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3213a0c9f96b..866aaca1887e 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -928,10 +928,21 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		ret = iomap_file_buffered_write(iocb, from, &ntfs_write_iomap_ops,
 				&ntfs_iomap_folio_ops, NULL);
 out:
-	if (ret < 0 && ret != -EIOCBQUEUED) {
+	/*
+	 * Both sizes were moved to end before the copy, so a short write,
+	 * like a failed one, must take back what it did not write.
+	 */
+	if (ret < count && ret != -EIOCBQUEUED) {
+		loff_t new_init_size = old_init_size;
+		loff_t new_data_size = old_data_size;
 		int init_err = 0;
 		int data_err = 0;
 
+		if (ret > 0) {
+			new_init_size = max(old_init_size, pos + ret);
+			new_data_size = max(old_data_size, pos + ret);
+		}
+
 		/*
 		 * Like ntfs_setattr_size(): __ntfs_attr_truncate_vfs()
 		 * expects the invalidate lock held across the size
@@ -939,14 +950,59 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 */
 		filemap_invalidate_lock(vi->i_mapping);
 
+		/*
+		 * A page fault through a shared mapping may have used the
+		 * extended initialized size while the write was stalled on
+		 * its source, so keep that size and zero what the write did
+		 * not reach instead.  [old_init_size, pos) was zeroed before
+		 * the write.  Past end, zero the rest of the block that a
+		 * buffered copy may have read from disk, unless such a fault
+		 * already moved the initialized size past end and zeroed it.
+		 */
+		if (NInoNonResident(ni) && !NInoCompressed(ni) &&
+		    ni->initialized_size > new_init_size) {
+			loff_t zstart = max(pos, new_init_size);
+			loff_t zend = ni->initialized_size > end ? end :
+				      round_up(end, i_blocksize(vi));
+			int err = 0;
+
+			zend = min(zend, new_data_size);
+			if (zend > zstart) {
+				err = iomap_zero_range(vi, zstart,
+						zend - zstart, NULL,
+						&ntfs_seek_iomap_ops,
+						&ntfs_iomap_folio_ops, NULL);
+				/* A direct read must not see the old blocks. */
+				if (!err && iocb->ki_flags & IOCB_DIRECT)
+					err = filemap_write_and_wait_range(
+						vi->i_mapping, zstart, zend - 1);
+			}
+			if (!err)
+				new_init_size = min(ni->initialized_size,
+						    new_data_size);
+			else
+				new_init_size = min3(ni->initialized_size,
+						     zstart, new_data_size);
+		}
+
 		/* ntfs_attr_set_initialized_size() rejects a resident one. */
-		if (ni->initialized_size != old_init_size &&
+		if (ni->initialized_size != new_init_size &&
 		    NInoNonResident(ni)) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
+			/*
+			 * Only reached when the zeroing above failed or did
+			 * not apply.  Drop what was cached past the new
+			 * initialized size, as __ntfs_extend_initialized_size()
+			 * does.
+			 */
+			if (ni->initialized_size > new_init_size)
+				truncate_pagecache_range(vi, new_init_size,
+						max_t(loff_t, i_size_read(vi),
+						      ni->initialized_size) - 1);
 			mutex_lock(&mrec_ni->mrec_lock);
 			init_err = ntfs_attr_set_initialized_size(ni,
-					old_init_size);
+					new_init_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 		}
 		/*
@@ -955,13 +1011,13 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * the uninitialized tail, so skip it unless the rollback
 		 * above restored that size.
 		 */
-		if (ni->data_size != old_data_size && !init_err) {
+		if (ni->data_size != new_data_size && !init_err) {
 			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
 
-			truncate_setsize(vi, old_data_size);
+			truncate_setsize(vi, new_data_size);
 			mutex_lock(&mrec_ni->mrec_lock);
-			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
-					old_data_size);
+			data_err = __ntfs_attr_truncate_vfs(ni, new_data_size,
+					new_data_size);
 			mutex_unlock(&mrec_ni->mrec_lock);
 			/* Like ntfs_setattr_size(): stay on the durable size. */
 			if (data_err)

base-commit: b025f526c5d04929212c9d5fb7ffc96608f3eacc
-- 
2.43.0


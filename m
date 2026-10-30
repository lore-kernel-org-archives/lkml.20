Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333131;
	b=k6vQb6C2fEu6YxxxpSuG9QVNaec6ZO1chkJCEvBwJSTmIgaWqfm/v+Fr94UxHAZG+eUg
	 BEFZAt985qCkuHU7xdLp9OuOqOFLmUcUWmWnNzI/vW9MHSZuU4U9BHmE06Qi7lQ3Rq3k4
	 baeGnnXX2oRDjsYaZxuTxErJXeA9R+2cwHcg/dPXVbZDOM1CxYrCsZl/GidwSxlWYkPTO
	 PvT6Xi1Ado9IojYDeYqAyAVsr7Q5YVvxQc9wmODEyh4zDFv8ONbK/BwUDsOjLxmRCUXDp
	 HGVspWt0adfaLWs6BUTiycabFtyESYkeB/+RqNJYuBwyHRMO1E3JBxJCCJ4t5GxLVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=inldKJPdjUUjviysI9T8tJ8KvrfY36K+5GvzIRj3mzM=;
	b=m+gFq7n5OUch6SVXuima6kFGvGIcimbPv/fMoW2u4txyI1msXro19TNQ7CUGIpoteAMg
	 18Qgouecy0veMCm/70rO8MVT/W7Y5o9ddT7cAtZ41mzKpWuVZrDANOmVqB/r7uv1Arr4g
	 Kt65nsFNT64KQWZyK3qmQmO9tCRzCsyjkQcN41vPix8MikbgysUSB/sw0ecu9cuf4Zi+V
	 U9H1NOdw0Yep+CbTWIxYbbvD0YyxM9nL2nFnFPikotVE/hKOaZtgaY6liOFJumEC8ONh/
	 P9hl3pgrznlxgZISd4Y7LaaCDmjA178BwNiMtsQ4CKCd/7mo8lPDUAe5Nw8uR3WvR6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=B6BcJVh1;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=B6BcJVh1
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c76540d0bso3378276d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793333129; x=1793937929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=inldKJPdjUUjviysI9T8tJ8KvrfY36K+5GvzIRj3mzM=;
        b=B6BcJVh1LIQiZ3lYnDbQEJJwlpdtM3BZwI22Anwj8q1oOkusRP3UreS0rDXWcIZQ5V
         4SCwvoVme9KrGXAYL8h0RmuL/E/o9n+qmfuBgZI/JwjKiG4lmztVBoq4SCVMnWsfvDgb
         Wz7gRJslWGgTdk0Zo5GLioKBl9ezpEpMVe2ac4GywI/rIf/yRspzohF5bGWgojngQ7SG
         ZctQgULHEXRXzrnH++KMG10pD50ncAdF5wdtuZ3b4YS1/gIoPwMb12vaRuVU9ppgEwxA
         f5SF/Jx+dDMy3rB6g3UW44HdhkWJQ6cqIW2WVk4UjHUIi4YOesmqgiQZAIAb/FJXupWD
         M78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333129; x=1793937929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inldKJPdjUUjviysI9T8tJ8KvrfY36K+5GvzIRj3mzM=;
        b=1llxVwWLR+08rOJwr9jSJNrAeI73llnJMLZMNj12aulon7owVk2Hnn3X1cXTZT/eFq
         G3YfVMDhUrmOlr8NmA0piD9x99QwkRZnlPBjoBET+kPwA6XnrYi9kjGgHS0ida2MaDXs
         cC1B/ZjqAlUKWgv9wZFyds2l8TMrseEKu6MfuxrMbtVTxGZc0gwlm1jyAEfaxBb1MHCT
         q5hsMdmGBd6uoUVfA0EHhFU1EiR8cXstg+bfK0H5gBWV/UzJe0Qe33lEic4h43O3BzGY
         P9YCUTRIxXNXKD/v9NYhUk5oM6+fgP2sktSp8Fuw8OrEkJ2yuU9flWgj4AAW1sdWD5Ln
         Wh9A==
X-Forwarded-Encrypted: i=1; AKwUvBwWuFQyjJqeR7WsKYXS/Ivx67XAPf/nd2D4PIHVmhRKyyhWRl0RNfiuGkGuFliBOlVLNp5uqV9mwpQlftE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCl83rNGtm6lUih4xVMPPwaZCw1za08v5L47gM9cCmauPeQyGu
	IHnXnXqzHwI2IbPwEKarFFVEXtM0Zp1dDLESfUxyIB2gyLIffhmNeV0LJf2dipRrNw==
X-Gm-Gg: AYBFou1vAdDkp8suXhktR1MliQlzaL3OHc16gSK5MUXMsn5B1rma+RfuQonQef46OmA
	76SIZYoxAfLcu6tPubKFV++tphbjMa4Tv+Fu/T/iUg71PVZToTsxhxlbXIVZZu8rf0PFX9gi1E2
	Mypw0u4V1R4rptmqoMS2wPDSw9Bfj0RhZqEJCJVqmTJSUClWInwtjTKzVEJnwRbKP6jtLqOXGXL
	IFlITuf3EFJqqGfX5iyMAmDbUV9Qs6Gu9WbnBSuH3ZTJgw1ve13ksflRt6kBeN+BpLDPJsUYt38
	LPcRDvG+iW4xcW+MAhOSzrczaLIrXaXs2sY4nvwqGi1vTH1lRJo0g5zXs7drkxfp5D6daH9OoUZ
	3j10BCH6ShOZUPi0V00P2aTFEYRvtZuSWOCAtQQPIjtMVVZ8IlPpeyuh3IsmcCAQQrgpTKjlBRs
	iM32rfBa8o1EkQzBPftplfwa05S+IrcmNG6OsgS6Z8LEMdsztW4mHpfQiQCz1WM1VPVBIcf+OEc
	4PzihW4gNCde0y4lLW0JVrMrkU1Inw0wARr9/LkkambMUS+ZHXjQ850sC17TQ9+ajxK5GaoNv5k
	ZfpdeFvD3zABx0g4ee49Mb4+Qz98hLxOuwYwx2CDAc5Foprg6ciE75P8zwLCsff4WgfxgcXISw=
	=
X-Received: by 2002:a05:6214:5bc5:b0:91c:7da5:2185 with SMTP id 6a1803df08f44-91ca4bb4a15mr17162136d6.38.1793333128998;
        Thu, 29 Oct 2026 21:05:28 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f4367dsm4659526d6.20.2026.10.29.21.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:27 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: tytso@mit.edu,
	linux-ext4@vger.kernel.org
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	yi.zhang@huaweicloud.com,
	yizhang089@gmail.com,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] ext4: do not advance i_size on a buffered write that copied nothing
Date: Fri, 30 Oct 2026 00:05:20 -0400
Message-ID: <20261030040520.4138904-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit 665575cff098 ("filemap: move prefaulting out of hot write path")
made generic_perform_write() call ->write_begin() and ->write_end()
before it finds out that the source buffer cannot be read.  In that
case ->write_end() is called with copied == 0.

However, ext4_write_end(), ext4_journalled_write_end() and
ext4_da_do_write_end() set i_size to pos + copied without checking
copied.  As of now, a buffered write() past EOF that fails with EFAULT
grows the file to the write offset, and the new size can reach the
disk.

The issue can be reproduced on an ext4 mount with:

    char *p = mmap(NULL, 4096, PROT_NONE,
                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    int fd = open("/mnt/ext4/file", O_CREAT | O_TRUNC | O_RDWR, 0600);
    pwrite(fd, p, 4096, 1024 * 1024);   /* fails with EFAULT */
    fstat(fd, &st);

Before that commit, the result is st_size = 0.
After it, the result is st_size = 1048576.

This patch will leave i_size alone when nothing was copied, as
ext4_write_inline_data_end() already does.  Unlike ext4_write_end(),
the delalloc path does not trim after a short write, so the folio and
the delayed blocks that ->write_begin() set up beyond i_size are left
behind, and the blocks stay reserved until the inode is evicted.  When
the write ends beyond i_size, drop them as well.

Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Changes in v3:
- Also trim after a short copy: drop the '!copied' check and compare
  pos + len with i_size after the update, as ext4_write_end() does
  (Zhang Yi).
- Reword the last paragraph of the commit message.
- v2: https://lore.kernel.org/r/20261023172532.3271348-1-hengyul@cs.unc.edu

Tested in KVM with KASAN: the reproducer above, failed writes around
EOF, and short copies on delalloc, nodelalloc and 1k block filesystems.
e2fsck -fn reports no errors.

 fs/ext4/inode.c | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 6ede3644a738..9c20876629bc 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1578,15 +1578,18 @@ static int ext4_write_end(const struct kiocb *iocb,
 	 * it's important to update i_size while still holding folio lock:
 	 * page writeout could otherwise come in and zero beyond i_size.
 	 *
+	 * If nothing was copied (e.g. the source buffer was unreadable), do
+	 * not move i_size up to pos.
+	 *
 	 * If FS_IOC_ENABLE_VERITY is running on this inode, then Merkle tree
 	 * blocks are being written past EOF, so skip the i_size update.
 	 */
-	if (!verity)
+	if (copied && !verity)
 		i_size_changed = ext4_update_inode_size(inode, pos + copied);
 	folio_unlock(folio);
 	folio_put(folio);
 
-	if (old_size < pos && !verity)
+	if (copied && old_size < pos && !verity)
 		pagecache_isize_extended(inode, old_size, pos);
 
 	/*
@@ -1697,13 +1700,13 @@ static int ext4_journalled_write_end(const struct kiocb *iocb,
 		if (!partial)
 			folio_mark_uptodate(folio);
 	}
-	if (!verity)
+	if (copied && !verity)
 		size_changed = ext4_update_inode_size(inode, pos + copied);
 	EXT4_I(inode)->i_datasync_tid = handle->h_transaction->t_tid;
 	folio_unlock(folio);
 	folio_put(folio);
 
-	if (old_size < pos && !verity)
+	if (copied && old_size < pos && !verity)
 		pagecache_isize_extended(inode, old_size, pos);
 
 	if (size_changed) {
@@ -3349,6 +3352,24 @@ static int ext4_da_should_update_i_disksize(struct folio *folio,
 	return 1;
 }
 
+/*
+ * Delalloc counterpart of ext4_truncate_failed_write(): ->write_begin() only
+ * reserved delayed blocks, so drop the page cache and the delayed extents
+ * beyond i_size and leave the blocks that are allocated there alone.
+ */
+static void ext4_da_truncate_failed_write(struct inode *inode)
+{
+	struct address_space *mapping = inode->i_mapping;
+	ext4_lblk_t lblk = EXT4_B_TO_LBLK(inode, inode->i_size);
+
+	filemap_invalidate_lock(mapping);
+	truncate_inode_pages(mapping, inode->i_size);
+	down_write(&EXT4_I(inode)->i_data_sem);
+	ext4_es_remove_extent(inode, lblk, EXT_MAX_BLOCKS - lblk);
+	up_write(&EXT4_I(inode)->i_data_sem);
+	filemap_invalidate_unlock(mapping);
+}
+
 static int ext4_da_do_write_end(struct address_space *mapping,
 			loff_t pos, unsigned len, unsigned copied,
 			struct folio *folio)
@@ -3386,12 +3407,12 @@ static int ext4_da_do_write_end(struct address_space *mapping,
 	 * checked, we need to update i_disksize here as certain
 	 * ext4_writepages() paths not allocating blocks and update i_disksize.
 	 */
-	if (new_i_size > inode->i_size) {
+	if (copied && new_i_size > inode->i_size) {
 		unsigned long end;
 
 		i_size_write(inode, new_i_size);
 		end = offset_in_folio(folio, new_i_size - 1);
-		if (copied && ext4_da_should_update_i_disksize(folio, end)) {
+		if (ext4_da_should_update_i_disksize(folio, end)) {
 			ext4_update_i_disksize(inode, new_i_size);
 			disksize_changed = true;
 		}
@@ -3400,9 +3421,13 @@ static int ext4_da_do_write_end(struct address_space *mapping,
 	folio_unlock(folio);
 	folio_put(folio);
 
-	if (pos > old_size)
+	if (copied && pos > old_size)
 		pagecache_isize_extended(inode, old_size, pos);
 
+	/* Drop what ->write_begin() prepared beyond the resulting i_size. */
+	if (pos + len > inode->i_size)
+		ext4_da_truncate_failed_write(inode);
+
 	if (!disksize_changed)
 		return copied;
 

base-commit: 8c4f6e3376348fc3162eed86a05b933921c8f9ed
-- 
2.53.0


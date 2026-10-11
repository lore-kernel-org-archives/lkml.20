Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5199923E334
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735783; cv=none; b=rMnchHu6jdzqDmXZZfn2t7i9wYS60CbjBQMVMgcl5CJzjlU0g+1JGsiilM5+onmlCZOlXW/7JqkSgqjNJLcdnENXXdgbGiqougW9I/Ho9fhjCwhHBmj4Rfapxhd0RjueJidLf9f6KkAkfQf20xp+MOr55GBp0aphLHAFHB94Xh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735783; c=relaxed/simple;
	bh=na0Rs5cgYcyg96JqIx+sCGZR100qGX7janR84BnhWxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOtOk7mSFHuT1B8LEQVYw1seqipTNebDEDoCaLMGIphRMESH2SwepKjhoYcmdOq7MA62qx7HG2KnNLKFlBzJ+00qYQsZf2pJdGQOl9yqGZYD3UniQ2H77AnVtwmfaVObm1dD9GB/SSkqpzdVQdtZyfG1ihkCt0dqhU9kckB25EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=e7cobyO0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="e7cobyO0"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e5c8f53a9so102888485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791735781; x=1792340581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtDxIjzt4VQirv06ox/zVsY4rdSoAbkCVb7vU/cZ4HU=;
        b=e7cobyO0UcszluLJOwwKqQ8FvyLiwnhRJOotDGLg2PGHtlbu8qwHC3QU8isnUerfXb
         nH/JVoo3lsiMJUTCy9HyO5lb0jOBlXqSQRX7By/Wpym8GzdLgWqpKWW97OPJ99/1CYOT
         pECIAeV+27mCyUoCOgcl85HmSvXKOLcSw+vs949fkwZDlmFqo9YkGeyVrO7McPug+oGj
         KOYpKg8UzbIf9oFyYmEIVMCfacDkbLOlAY1gXiZQBwPPuaxipFavvSTHt96wlA7Us2cQ
         7p2O6p/NDy12JRhwxGIe5IhUyQslUO73eOsobVaVj4s+OLEKz3REF4+yv0cLaGyboGjK
         grTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735781; x=1792340581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtDxIjzt4VQirv06ox/zVsY4rdSoAbkCVb7vU/cZ4HU=;
        b=nYLjO/soqQpCM5aaaPRNJxlzSsUwrwCe98LkHqCN9bdke8NbWauE+h8VulG5LFMtaj
         iOHtnxD7b6EKJGAbKw0EABdDdODfta1qI9NrTJ2OfLhsmMN4vHlw25mLpxrYyriZI5CA
         6hUYBAPYX/Pn/98/58wVkOzVIftzZf6sZDCauNIYLqfCrY6/2Z3XATv6e+VRh1mxkJh+
         iUr5Emw+gr9ECNxEks4q+awd2CuScrrUdt7pwOjj3fJYGNd266JaLEFhvPfeMoyzEoZ/
         cx9D29AIb7aLM+6rp+yvmHWfD5kF3wBih6R/+vbLYlL+m86/lU9H+pSHLRD0xHTWy4ra
         TuOA==
X-Forwarded-Encrypted: i=1; AKwUvBz4U9Mr4HWdO9iyxytVhO2pNQlBKnnJ3XKTftUoBgBNY+EdmKTPVBne6lITWkmvQy+vCyTqlHMg0DUZqqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBisPHQEPM3rgONvnHNg+fZTeWO8YkGuYNdw2jrAtpcUoIeHSf
	GCeklin8IT03eI/J4N3iA4t8HjmWtdXExHYtswmCjFfXRcFwlyO/ygjHwndt8BKwaQ8LRX15Uvv
	e9NSpxg==
X-Gm-Gg: AYBFou2LixE8Jbw0aMCg+MgtufYaVzLXFUXErsta7Hq+UEiJ4P6yN20szAv8l8R5yBC
	pYjd/fjV+oyTUiXJWY8pvP/6DFleHbGQKqwGvwThbTsWDFRcipz3beq3ItTkgwVCrbnvE7Emow5
	jaQOZoXSj/EI6GxBcNgsX4vrIL3EpHIZeAWi3n3IxtGiIa3v0UUKfOgxM5Di0VSo1gNhd1CeCk+
	G0CEl3Yqk499APooOIAdFnStHb1aBWWcMsQk3ypkjP9Dd3UUAmf7V9NCYIuU3CZYHlAhqMlZJ3I
	k7TFUV+FWmBwThfnZBAuhlxu5SDonadoTt2IeVqLd9X34ELsjwQRpwFNZJ5zrtBP7pi9+ioMico
	TT/hq1NeMQDfkBQiWX/U/PEPClYklYo99Djqh/abUghXEoQ7bqFmb+cFXiBGjFRuv7mGC/TojSY
	e9YV4sc+6GggfJBm6MYl/ms8UUDZohaBFsx4dNqYgHHj6yuGV0k+QkJeoJnCPzpqnxr7YobQKJc
	SJ3J9NXqFcjgKU5gi/ktQ==
X-Received: by 2002:a05:620a:2b90:b0:93e:561c:5bce with SMTP id af79cd13be357-93ebd295d73mr1148456085a.55.1791735781048;
        Sun, 11 Oct 2026 09:23:01 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98906c3sm671070285a.26.2026.10.11.09.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:23:00 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: stop direct reads at the valid data size
Date: Sun, 11 Oct 2026 12:22:46 -0400
Message-ID: <20261011162246.1580911-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
made ntfs_iomap_begin() report a read extent that starts below the valid
size as mapped for its whole length.

However, ntfs_get_block_vbo() used to end such an extent at the block
that holds the valid size, and ntfs_file_read_iter() zeroes only up to
the count it returns. As of now, a direct read that reaches the end of
the file returns the right count, but the rest of the user buffer is
filled from the clusters beyond the valid size. These hold old contents
of the disk: the rest of a large cluster, clusters preallocated for a
file that is being written, or what a truncate has cut off.

For example, on a volume with 64K clusters a 5000-byte file is read with
one O_DIRECT read of 1M.

Before commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file
operations"), the read returns 5000 and the buffer is not changed past
offset 8192.

After that commit, the read returns 5000 and bytes 8192..65535 of the
buffer hold the contents of a file that was deleted earlier.

This patch will end a read extent at the block that holds the valid
size, so that the rest is reported as unwritten and read as zeros, and
zero the tail of that block in the buffer also past the returned bytes.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
A test program is available on request.

 fs/ntfs3/file.c  |  9 +++++++++
 fs/ntfs3/inode.c | 12 +++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 95dfe6878860..1a3f1d1e6a28 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -905,6 +905,15 @@ static ssize_t ntfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 			iov_iter_revert(iter, to_zero);
 			iov_iter_zero(to_zero, iter);
 		}
+
+		/* The block with 'valid' is read as a whole, zero its tail. */
+		valid = min_t(loff_t, ntfs_up_block(inode->i_sb, valid),
+			      vbo + bytes);
+		if (end < valid) {
+			size_t done = iov_iter_zero(valid - end, iter);
+
+			iov_iter_revert(iter, done);
+		}
 	} else if (vbo < i_size) {
 		if (end > i_size)
 			bytes = i_size - vbo;
diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index e6c96ef88b01..b9a5bf8352e2 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1056,8 +1056,18 @@ static int ntfs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 			iomap->type = IOMAP_MAPPED;
 		} else if (offset < ni->i_valid) {
 			iomap->type = IOMAP_MAPPED;
-			if (flags & IOMAP_REPORT)
+			if (flags & IOMAP_REPORT) {
 				iomap->length = ni->i_valid - offset;
+			} else if (!rw && !(flags & IOMAP_ZERO)) {
+				/*
+				 * Read. Stop at the end of the block with
+				 * 'valid', the rest is reported as unwritten.
+				 */
+				loff_t vend = ntfs_up_block(sbi->sb, ni->i_valid);
+
+				if (endbyte > vend)
+					iomap->length = vend - offset;
+			}
 		} else if (rw || (flags & IOMAP_ZERO)) {
 			iomap->type = IOMAP_MAPPED;
 		} else {
-- 
2.53.0


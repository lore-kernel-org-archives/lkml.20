Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494311;
	b=qFTxR8n7R4rmvZjkuIZIhD40kDZgvgO86XWPSryDHe44z1EnR4r53L0mp3/4rcNLi+Ki
	 JGUZFT/8KR+GCQhJSql/KCqNu29aUNDfYIrwbGYZZUDex5bbbhGJujPdNP15b8/evuTQp
	 +w7vrdL3+a3Rzenb7XN8NJCBj3MGa4FqR9eWLFw4kmN7gq3kTPsPFLWOF4IuT/gy/IY+v
	 ypdwWvbfxroBy8rKJf+o/AHcu3f7nsS1J/FyQgg5+LASl+QraPmswwgU4HZk2SOmwDXK7
	 H9w/j/5xWsKMOEWJKySi53YDNdnQwYwYNmxCR5p7keHnUgZe9YjqFkwIML9QrY8GF1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5tk8+SHD72HahM8IWSQnY+YLH+AP0ICkb8Kww1tFiUk=;
	b=y2KLEOICB/papQOq2aGewkRcLAUBAhDfZEo2yIHoBifK+N0iEF4t2moQjEvlHYAdH8GY
	 TRC/GqjbCO8A9qbZDl1nVM6VkfNfvUgXTtpMbFABvF3S2r6/OjsA5ShD5Uq7glEPapjih
	 6YommXnstMS73iqWMk+jndQrSGgLx2r4QOnSuSjORp/ueS0FPNV01NlJK/awCi6lrtD8g
	 uCZ0nf5RiN8diQj3r5e83HwIhYxDElGcaoOCiBE+v3qFnBGu3ewx4D/1462he4Nvn9zYT
	 75aZz3YhR/nM1Gygqtu7lJj09bt9EIQaXmAEhMY5WyH+sUCjgLIA/8UZf8CHJRWg7Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CtmZ+y+l;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D56606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D56606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jprusakowski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CtmZ+y+l
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso3986538a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794494309; x=1795099109; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tk8+SHD72HahM8IWSQnY+YLH+AP0ICkb8Kww1tFiUk=;
        b=CtmZ+y+l+Erf2/XDcQcpRrJ/eDinicHGkSmmRmJ98G0gwXXJoFRlxzba9lfgGlH1s3
         4LgqzEj5AD5fTB1XxA0jdA0fOZtPPFbQdIcvSERypM2cripwMViNLXoipwafyMohUEgu
         18JWP59fdX3oiVwH4Vf/okftZr/94KL6Ut6G/mKdBlJolpbErYeTSQ/NNkHiA1H2rrvq
         vpSPKxdak3qTg4oTwJzwmSNs/eyx6X8TBvZxAe/KJi83wrDZGDRrfTSQzTRnmUDYs0Ac
         wtQ/L5t3X56d/iRHzlmmtRPR8Oh4NSmxL+s6tPwgWHdBLpdvvu6Tg2GaD8CkCZARF8vH
         UC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494309; x=1795099109;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tk8+SHD72HahM8IWSQnY+YLH+AP0ICkb8Kww1tFiUk=;
        b=q1+nz1/mdogmRYX9LTn08W4+P7Z2M+rzxhKi84NAavU16d+i+pFvgZ2VRcu+NLpNPk
         MGY3CqYK2mccpaTOZD6AGIG9C8/v8svwOuOltfqTs4wLxLient5Q/23pa87KpXxv9Rz+
         ClZ6704iop7STdcQFH69xq7joQVQVNiGE/3UaZiISUXTLHAPLEPJKCnOYwhLqQmSvs8p
         VFu+e5DsB6mWqvam478jK1hTjQh/ewXgkq//fx9pVzRvWVjJeIwRHPEtg/6DXVuPabSt
         bE300zDJ+fEgzKPPOtRXphChRboh2Qo+BSwYsp20McRkhcFewfecpE1SZAC0qUmS2qLA
         LPEQ==
X-Forwarded-Encrypted: i=1; AL+hErEWhFnR2cHK13w+JOWZebUD8Vm+xbJ8N6rfcAYOK304JBesL7UM4r/ZbxRKctXxpitCcPka2mtR70FfIm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qt1pVfM84HbxeCQA50k+rPtxBIAN2rUL0VQP7xqGCk9V6xptW
	HYRQIocjCmJW/v/ICycc7l3gLWQBSTI9Ua5x6tUev0pUv4vcjJfnl7QC8YvKF+33Z+a7lrYwVKM
	p5x9gz1PMCX7+nRuIgVNcvbQDG30f8A==
X-Received: from edgc3.prod.google.com ([2002:a05:6402:a603:b0:6b1:df6e:46a0])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3210:b0:6b7:b0bc:f4bc with SMTP id 4fb4d7f45d1cf-6b7b0bcf5abmr1148633a12.17.1794494308993;
 Thu, 12 Nov 2026 06:38:28 -0800 (PST)
Date: Thu, 12 Nov 2026 14:33:50 +0000
In-Reply-To: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112143355.2923939-1-jprusakowski@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112143355.2923939-5-jprusakowski@google.com>
Subject: [PATCH RESEND 4/9] f2fs: propagate errors from buffered fallback of
 O_DIRECT writes
From: Jan Prusakowski <jprusakowski@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Jan Prusakowski <jprusakowski@google.com>, Eric Biggers <ebiggers@google.com>, 
	Yonggil Song <yonggil.song@samsung.com>, Hans Holmberg <hans.holmberg@wdc.com>
Content-Type: text/plain; charset="UTF-8"

f2fs falls back to buffered I/O for O_DIRECT writes in two places:
f2fs_file_write_iter() when f2fs_should_use_dio() rejects direct I/O
(e.g. compressed files or unaligned requests), and f2fs_dio_write_iter()
for the remainder of a partial direct write. In both cases the data is
then written back and dropped from the page cache by
f2fs_flush_buffered_write() to preserve O_DIRECT semantics, but errors
are lost:

- f2fs_flush_buffered_write() ignores the result of
  filemap_write_and_wait_range(), so a write that fails at writeback
  time (e.g. on compressed files with dm-error in generic/250 and
  generic/252) is reported to the user as fully successful.

- In f2fs_dio_write_iter(), if nothing was written by direct I/O and the
  buffered write fails (e.g. with -ENOSPC in generic/299), the function
  returns 0 instead of the error.

Follow direct_write_fallback(): if the buffered write fails, return the
number of bytes written by direct I/O, or the error if there were none.
If writeback fails, reset ki_pos to the start of the buffered part,
since we don't know how much of it reached the disk, and return the
direct I/O byte count or the error.

For f2fs_file_write_iter(), flush before generic_write_sync() and while
still holding the inode lock, so the error can be returned and the range
can't be re-dirtied by another writer in the meantime.

Writing a part of a compressed cluster marks the whole cluster dirty
(set_cluster_dirty()), so flush and invalidate whole clusters for
compressed files; otherwise dirty pages outside the written range stay
in the page cache.

Also don't fall back to buffered I/O in f2fs_dio_write_iter() for
IOCB_NOWAIT, where f2fs_buffered_write_iter() would just return
-EOPNOTSUPP. Return -EAGAIN instead if nothing was written, so that the
caller retries in a blocking context.

Fixes: a1e09b03e6f5 ("f2fs: use iomap for direct I/O")
Fixes: 92318f20d703 ("f2fs: preserve direct write semantics when buffering is forced")
Assisted-by: LLM
Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 fs/f2fs/file.c | 77 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..b67782043396 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5643,17 +5643,32 @@ static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
 	.submit_io	= f2fs_dio_write_submit_io,
 };
 
-static void f2fs_flush_buffered_write(struct address_space *mapping,
-				      loff_t start_pos, loff_t end_pos)
+/*
+ * Write back and drop the page cache of a buffered fallback of an O_DIRECT
+ * write.  Writing a part of a compressed cluster dirties the whole cluster,
+ * so extend the range to cluster boundaries for compressed files.
+ */
+static int f2fs_flush_buffered_write(struct address_space *mapping,
+				     loff_t start_pos, loff_t end_pos)
 {
+	struct inode *inode = mapping->host;
 	int ret;
 
+	if (f2fs_compressed_file(inode)) {
+		loff_t cluster_bytes =
+			(loff_t)F2FS_I(inode)->i_cluster_size << PAGE_SHIFT;
+
+		start_pos = round_down(start_pos, cluster_bytes);
+		end_pos = round_up(end_pos + 1, cluster_bytes) - 1;
+	}
+
 	ret = filemap_write_and_wait_range(mapping, start_pos, end_pos);
 	if (ret < 0)
-		return;
+		return ret;
 	invalidate_mapping_pages(mapping,
 				 start_pos >> PAGE_SHIFT,
 				 end_pos >> PAGE_SHIFT);
+	return 0;
 }
 
 static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
@@ -5740,6 +5755,13 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 		ssize_t ret2;
 		loff_t bufio_start_pos = iocb->ki_pos;
 
+		/* A buffered write can block, so don't fall back for NOWAIT. */
+		if (iocb->ki_flags & IOCB_NOWAIT) {
+			if (!ret)
+				ret = -EAGAIN;
+			goto out;
+		}
+
 		/*
 		 * The direct write was partial, so we need to fall back to a
 		 * buffered write for the remainder.
@@ -5748,8 +5770,15 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 		ret2 = f2fs_buffered_write_iter(iocb, from);
 		if (iov_iter_count(from))
 			f2fs_write_failed(inode, iocb->ki_pos);
-		if (ret2 < 0)
+		/*
+		 * Return the number of bytes written by direct I/O, or the
+		 * error if there were none, same as direct_write_fallback().
+		 */
+		if (ret2 < 0) {
+			if (!ret)
+				ret = ret2;
 			goto out;
+		}
 
 		/*
 		 * Ensure that the pagecache pages are written to disk and
@@ -5757,12 +5786,20 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 		 */
 		if (ret2 > 0) {
 			loff_t bufio_end_pos = bufio_start_pos + ret2 - 1;
+			int err;
+
+			err = f2fs_flush_buffered_write(file->f_mapping,
+							bufio_start_pos,
+							bufio_end_pos);
+			if (err) {
+				/* We don't know how much of it was written. */
+				iocb->ki_pos = bufio_start_pos;
+				if (!ret)
+					ret = err;
+				goto out;
+			}
 
 			ret += ret2;
-
-			f2fs_flush_buffered_write(file->f_mapping,
-						  bufio_start_pos,
-						  bufio_end_pos);
 		}
 	} else {
 		/* iomap_dio_rw() already handled the generic_write_sync(). */
@@ -5841,6 +5878,22 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			f2fs_buffered_write_iter(iocb, from);
 
 		trace_f2fs_datawrite_end(inode, orig_pos, ret);
+
+		/*
+		 * If buffered IO was forced, flush and drop the data from
+		 * the page cache to preserve O_DIRECT semantics.
+		 */
+		if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT)) {
+			int err;
+
+			err = f2fs_flush_buffered_write(iocb->ki_filp->f_mapping,
+							bufio_start_pos,
+							bufio_start_pos + ret - 1);
+			if (err) {
+				iocb->ki_pos = bufio_start_pos;
+				ret = err;
+			}
+		}
 	}
 
 	/* Don't leave any preallocated blocks around past i_size. */
@@ -5864,14 +5917,6 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (ret > 0 && may_need_sync)
 		ret = generic_write_sync(iocb, ret);
 
-	/* If buffered IO was forced, flush and drop the data from
-	 * the page cache to preserve O_DIRECT semantics
-	 */
-	if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT))
-		f2fs_flush_buffered_write(iocb->ki_filp->f_mapping,
-					  bufio_start_pos,
-					  bufio_start_pos + ret - 1);
-
 	return ret;
 }
 
-- 
2.56.0.567.gdb80ae8cd5-goog


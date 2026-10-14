Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CE270552
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005617; cv=none; b=XQnwgzEPRrF2COih2LNSZNW0E4/gqYAR4ZMqbEvqLEZQGSfQcoDEj1F5SQyhymeRhM1d3fX+uIMK/CKcIO87vUs4RmmSt2h/H4UjW+HoBV7lgHtMYQRWkkzwF0t4SGoStO5OlcXFsGas5eoT3cQ4m+cSGJX/ecbui+Hw5HaBGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005617; c=relaxed/simple;
	bh=ewchwNOJSoKlJ9JagQs/kTQULWbRvWajLmzGwT+tl6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PAZfCFdKaiFJa/nRcehC0Wwom1i6ZUfjDb7DKQJPY0sqJ+FxWmvTuNH4DUKcb4VGHMcotpEqN4prBhAVSSIvJ9C3RNaoOrQkgQUeRju2WFj8y6F8eM4Tx5gNxTpx9Rgx8urKEEVcfJZEbeGq75h+RqwQ1NXJ0L+s7JrVnJOZ2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKOImBGV; arc=none smtp.client-ip=74.125.82.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shayba.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKOImBGV"
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-156b5338d4bso1250824c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792005615; x=1792610415; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aECaE+DbTs0zA1//hmy17ogzl4KfVyvhPwgQUxqIw5k=;
        b=oKOImBGVnXXN0fXFQ+tdr21jnQ+EWccfEZvxjvDiyIAywqtYh1D/OZ2oeF1rOHCLJm
         7IjjDFUBLblyzpAlYtqtxdUjtqsBqUUZNScpvpDRb2A3c2CqUtXDdeHdJJ/6E0dmL1fO
         k+Kz2qUL5Pu13D/NpymyPJD+p7yLsMgnL2pu6sTewVKRa9IKyF3AAwlQPxBtDCHYhxV3
         HHLNhdSlaPskBSgXjts69f4BWDE/PHI48BgaA6CwwgXfNpURjJReGsK/PBx6jB3cnKrr
         d79KQP2yZ+sF0goaKJfuBHenaxewfd64hh2PzK7kxMH+ZVthLltiXNv8Wzy8kDYdCRuu
         5WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005615; x=1792610415;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aECaE+DbTs0zA1//hmy17ogzl4KfVyvhPwgQUxqIw5k=;
        b=MPbdDjGypMUCu+mFg4qcnDxablXqemcwS2uuYZb8m5b20dyoVf/MDJtsxA5dMszDVP
         6byKFwxk3ravGWstytVVv319jhAvOGSo/AqPze5BIHkHCNAHDr5Zz3KD/NZDER/e7LFZ
         5qkaUA2GsKETVpdm97zNLh9NNEJHjuiE1CNqNF8HabgvjnTGLsZAqPS2Y2Q/FHuXVdlb
         uWPSqo/b9Hp5n+EWUePrIABruYGd7ifSxCWtybnpmARYPDf8MttrMPNvnyaBR/M8TD+t
         os6+9kL47sThjlEzA37VNvQBesmoeFqOHOaus1xGn1bVTdTc7g1y7K7zov0gicsjdMXi
         j2ag==
X-Forwarded-Encrypted: i=1; AKwUvBx00GS8xsfwrlvxy9svOOildvcRt482Jt3sxJGjZDE9Vkx3D5nFYvw2sz6ox/844J96Rgy5D9CpNfN8S7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkNus6vBu31nJws2+gj+OVx/S/nfPPPsVUtXJrOj9NbAjI/jYB
	fo5e5QSOohVOFS3K6VhUgsg6G2VGS3Ebum3ay5b5UOGVUGnKouA316uAihzT7qwWKHghRgYNC4w
	HwUsJCA==
X-Received: from dldyr18-n2.prod.google.com ([2002:a05:701b:4512:20b0:168:3bc7:9e8])
 (user=shayba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:5f14:b0:168:6ad8:e89f
 with SMTP id a92af1059eb24-16a56c9dd9dmr21867195c88.3.1792005615123; Wed, 14
 Oct 2026 12:20:15 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:20:14 +0000
In-Reply-To: <20260910184424.156341-1-shayba@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910184424.156341-1-shayba@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014192014.3373048-1-shayba@google.com>
Subject: [PATCH v3] fuse: Forward vfs_fadvise to backing_file in passthrough mode
From: Shai Barack <shayba@google.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>, Bernd Schubert <bschubert@ddn.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Sandeep Dhavale <dhavale@google.com>, 
	Akilesh Kailash <akailash@google.com>, Suren Baghdasaryan <surenb@google.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shai Barack <shayba@google.com>
Content-Type: text/plain; charset="UTF-8"

When an application invokes posix_fadvise(..., POSIX_FADV_DONTNEED) or
other fadvise advice on a FUSE passthrough file descriptor, the VFS
currently only executes generic_fadvise() on the upper FUSE inode
mapping.

Because FUSE passthrough does not forward fadvise operations to the
underlying backing file, pages residing in the lower filesystem's
pagecache remain resident in memory.

During media-heavy workloads (such as image thumbnail generation or
streaming), single-access file data accumulates in the inactive pagecache
of the lower filesystem. Under memory pressure, the kernel retains these
stale media pages and instead evicts active executable pages from
running processes, leading to severe direct reclaim latency spikes.

Architecturally, Linux VFS supports filesystem-specific fadvise
delegation via the .fadvise hook in struct file_operations. Implement
fuse_file_fadvise() in fs/fuse/file.c and register it in
fuse_file_operations. When passthrough is active on a fuse_file,
fuse_file_fadvise() forwards the vfs_fadvise() call to the lower
backing_file under the opened credentials, allowing POSIX_FADV_DONTNEED
to cleanly invalidate the physical backing filesystem pagecache.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Shai Barack <shayba@google.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Bernd Schubert <bschubert@ddn.com>
Cc: T.J. Mercier <tjmercier@google.com>
Cc: Sandeep Dhavale <dhavale@google.com>
Cc: Akilesh Kailash <akailash@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: fuse-devel@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
v3:
- Rebase onto fuse.git for-next (commit bbe2d73a8231 "fuse: don't assume
  ff->passthrough is set for FOPEN_PASSTHROUGH"): use fuse_is_passthrough()
  in fuse_file_fadvise(), take struct file * in fuse_passthrough_fadvise(),
  and fall back to generic_fadvise() when backing_file is NULL (T.J. Mercier)
- Collect Reviewed-by tags from Amir Goldstein and T.J. Mercier

v2:
- Remove redundant !backing_file check in fuse_passthrough_fadvise() (Amir Goldstein)
- Remove unused fuse_passthrough_fadvise() stub under #ifndef CONFIG_FUSE_PASSTHROUGH (Amir Goldstein)
- Reorder fuse_passthrough_fadvise() above fuse_passthrough_open() alongside other passthrough ops (Amir Goldstein)
- Add fuse-devel@lists.linux.dev to CC list (Amir Goldstein, T.J. Mercier)

 fs/fuse/file.c        | 11 +++++++++++
 fs/fuse/fuse_i.h      |  1 +
 fs/fuse/passthrough.c | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6d707f2..6e6136e 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3100,6 +3100,16 @@ static ssize_t fuse_copy_file_range(struct file *src_file, loff_t src_off,
 	return ret;
 }
 
+static int fuse_file_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
+{
+	struct fuse_file *ff = file->private_data;
+
+	if (fuse_is_passthrough(ff))
+		return fuse_passthrough_fadvise(file, offset, len, advice);
+
+	return generic_fadvise(file, offset, len, advice);
+}
+
 static const struct file_operations fuse_file_operations = {
 	.llseek		= fuse_file_llseek,
 	.read_iter	= fuse_file_read_iter,
@@ -3120,6 +3130,7 @@ static const struct file_operations fuse_file_operations = {
 	.fallocate	= fuse_file_fallocate,
 	.copy_file_range = fuse_copy_file_range,
 	.setlease	= generic_setlease,
+	.fadvise	= fuse_file_fadvise,
 };
 
 static const struct address_space_operations fuse_file_aops  = {
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8546855..49b3101 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1316,6 +1316,7 @@ ssize_t fuse_passthrough_splice_write(struct pipe_inode_info *pipe,
 				      struct file *out, loff_t *ppos,
 				      size_t len, unsigned int flags);
 ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma);
+int fuse_passthrough_fadvise(struct file *file, loff_t offset, loff_t len, int advice);
 
 #ifdef CONFIG_SYSCTL
 extern int fuse_sysctl_register(void);
diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
index b43d3e0..2d29ff6 100644
--- a/fs/fuse/passthrough.c
+++ b/fs/fuse/passthrough.c
@@ -148,6 +148,23 @@ ssize_t fuse_passthrough_mmap(struct file *file, struct vm_area_struct *vma)
 	return backing_file_mmap(backing_file, vma, &ctx);
 }
 
+int fuse_passthrough_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
+{
+	struct fuse_file *ff = file->private_data;
+	struct file *backing_file = fuse_file_passthrough(ff);
+	const struct cred *old_cred;
+	int ret;
+
+	if (!backing_file)
+		return generic_fadvise(file, offset, len, advice);
+
+	old_cred = override_creds(ff->cred);
+	ret = vfs_fadvise(backing_file, offset, len, advice);
+	revert_creds(old_cred);
+
+	return ret;
+}
+
 /*
  * Setup passthrough to a backing file.
  *
-- 
2.56.0.385.gd3acb90ef8-goog


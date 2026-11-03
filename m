Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667752;
	b=EnJiEzApGhI73n1MNVgwv/kDEGBipF7IIQgOFLWEXUx9FWrF3w6RxeYLXiV8Ko5I9647
	 51sXLE5Rd5R+PniKX1WgtnV1aW+KARCPW1O9u/V6p+OvYBxAeI0fyEurz4Sl0n7qgZF5O
	 aPWxoZtB0ptddXMflJJpb+FANM6g1aSPb7aDMRntsykxe/g6puFl+h72Kv7Ddky/iBscP
	 sOnsfCCg5Pe+dBlhiF6QnSxkX0Jv0zKHWsO10F9AGPhdKgPZ3ujufOcF1ySz1BMfmC5My
	 0e0m9qlf6NWIAQ5qBoyyB0CFhj/zrdQ14P5yYOuxkgX+EfD4RA1OQCbzNv7b4gFm2ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f7jy8MubX3hGHk5TxpJrbkUXvzo9K2tHVQ0bkJ4pbKo=;
	b=roZ4QV1qRuW0hnJOfk5RZxBpSK1kIsJhVT9ZirWdrlAMpRm8CLCotdm+3Bmc5bOZa3MP
	 FTXMglGfZknw5/egsxYanBkrbhMirsYSfxZUdNsDm5lf8GNNvp33WaQAg29JVhi6bBSLs
	 V3I5JoVowFgTtI/Wdgdbeve+7a1rez7H6zQdfX2/61sDBUMwfS4DLWnKt4QDKsltA8AK6
	 yMJ+0ioqee+nOPlgrQOZKyYXfeM+jJ539mfq52FvCzxlFwQXTrHwnAfG7oHPVhkOXlHJZ
	 qOjy8KaSrzovv8+oM+CYL0fLVF07N/sTPkcPp8aKgSE/ZiMTyoryc9AxVZCuLA6ee6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hngUx31M;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF9606D80D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BF9606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hngUx31M
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2758106a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667752; x=1794272552; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7jy8MubX3hGHk5TxpJrbkUXvzo9K2tHVQ0bkJ4pbKo=;
        b=hngUx31MflnZWG7IyMGVRzuWU0A7FfM9DejatCTmV6uiL81fWjUwvZ1MAA8yS2bLgT
         uq4h4R4m0HD8kcyS+mY0i/p1ZI1FrcFhA01NEsbVycExy6547FQCFVIxwJgeHKIcc+4R
         slPkFYje0Cm0HEiNgT65zkUxulV86b9nrYnbL12Tdwf8Qiaqcsw/7mC1CBKRtsuNXmPv
         I8WUVVCfzUutkT/0trki02vtL+u4OhrFQ0cyr9ORaCOoCLJZP8e4TW+1ULSXi5dPL/ic
         6VEuX6zOUHUNhs/hLC0kEr7mVE1Ymo/MFNOx9siq0Qnuu+T2soCnj0j9JsjJleYXfJ3j
         VE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667752; x=1794272552;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7jy8MubX3hGHk5TxpJrbkUXvzo9K2tHVQ0bkJ4pbKo=;
        b=wO/Iai8nZhf9qHMEyCzrfZrN/YIB6ZF//k2yYJ1apRw+ub2T3Zl5fxoO3Es830bxO6
         vC6FhDSFPWGdzqfOZMbjgZMR5CmfTZ9XMLEarAbtZTQHIpvW3KtORNPp+iBNVjqq+ZfG
         f4BOnl7fatWjeafIDOozcQjL6vQgZcXg/wF8+tGVGdMSZHU/NaKDiA5B03Y0r4YhWLDG
         LH2G4jvwUG5A3y/9J9nC4PW+nBA9IpqxN2ZUHFLFHwkQEZ4PSDO9HSQpmChEo5Isw2qo
         Cu7AiksFPShc9XxaAia+MLhXsvnhe3HQxI84erLH3m13CF1BkhEeDRImEy+IYxGrivJj
         dS5w==
X-Forwarded-Encrypted: i=1; AKwUvBxMsqOiOpewX4glUu5L7/Qq/GpB4ejzxW+kYMOulXoY4moWjFqF826DYHwZFEodFqxN9i97VV9o3Z5vIRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ijh9rOydGAiahF4kLG4YF3GbjKFOBOwIl9Y4j4KnvtafC0Btu
	98jCrC96ZSUF9KzYrG3zXTmmhLGfSbaH7XLFxkMCQ+1ARv731JF3EeMVSArSX30QZMgIn87xhnO
	KRsxGRqoo10AFgA==
X-Received: from pjqg15.prod.google.com ([2002:a17:90a:a80f:b0:3aa:f38e:cb2d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a8b:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3ae8970fd9dmr9928947a91.13.1793667751455;
 Mon, 02 Nov 2026 17:02:31 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:14 +0000
In-Reply-To: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103010216.3447716-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103010216.3447716-9-dmatlack@google.com>
Subject: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that are
 still linked
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow preserving tmpfs files that are still linked. To preserve any
file, require permission to write to it and the file to be opened for
reading, and reject append-only files.

shmem_luo already accepts any shmem file without links, which includes
unlinked tmpfs files and files created with O_TMPFILE. Accepting linked
files means that userspace doesn't have to unlink files to preserve them
and can keep using them by path until the live update.

The path of the file isn't preserved. Like other files from tmpfs
mounts, a linked file is retrieved onto a tmpfs mount chosen by
userspace, which can then link it at the path it wants.

While a file is preserved, its size is frozen, so truncating it,
fallocate() and writes past its end fail with -EPERM. For a linked file,
this affects everyone who opens the file by its path, so a caller that
can only read the file, e.g. a world-readable file in /dev/shm, could
use it to break the owner of the file. So require permission to write to
the file to preserve it, for all files. Like FS_IOC_ENABLE_VERITY, don't
require a file opened for writing, so that binaries that are being
executed can still be preserved through read-only fds. Also don't
require a writable mount, since preserving a file doesn't write to the
filesystem. If the size of the file can't change anyway, because it is
immutable or on a read-only superblock, also let its owner preserve it.
Don't let others do that, since the size could change again once the
file is made writable. Like FS_IOC_ENABLE_VERITY, reject append-only
files, since their writers can only append to them, and freezing their
size would stop all appends.

Also like FS_IOC_ENABLE_VERITY, require the file to be opened for
reading. The retrieved file can be read, so otherwise a caller that can
only write to a file could preserve it to read its contents.

Preserving a file also fills its holes, but don't require any permission
for that. Anyone who can read a tmpfs file can already fill its holes by
faulting them in through a read-only mapping, also on read-only mounts
and for immutable files.

Document the frozen size and the permission requirements.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 mm/shmem_luo.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index ecbeb37d33a8..0c012f242fc5 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -28,6 +28,24 @@
  * the file are preserved. All others are reset to default. The preserved
  * properties are described below.
  *
+ * A tmpfs file can be preserved even if it is linked, but its path is not
+ * preserved. Userspace chooses where to put the file when retrieving it, as
+ * described in "Retrieving Tmpfs Files" below.
+ *
+ * Preserving a file requires it to be opened for reading, since the retrieved
+ * file can be read. It also requires permission to write to the file, since
+ * preserving it affects all of its users, as described below. But the file
+ * doesn't need to be opened for writing. For example, a binary that is being
+ * executed can be preserved through a read-only file descriptor. The owner of
+ * a file whose size can't change anyway, because it is immutable or on a
+ * read-only superblock, may also preserve it. The file can be preserved
+ * through a read-only mount. Append-only files can't be preserved.
+ *
+ * While a file is preserved, its size can't change and no holes can be punched
+ * into it. Truncating the file, ``fallocate()`` and writes past the end of the
+ * file fail with ``-EPERM``. This applies to all users of the file, including
+ * users that open it by its path.
+ *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
  *    or tmpfs file are also not stable and are subject to backwards
@@ -298,6 +316,45 @@ static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	vfree(folios_ser);
 }
 
+/*
+ * Check whether the caller may preserve @file. The retrieved file can be read,
+ * so require @file to be opened for reading, like FS_IOC_ENABLE_VERITY does.
+ *
+ * Preserving the file freezes its size until it is unpreserved, for all users
+ * of the file, so require permission to write to the file. Like
+ * FS_IOC_ENABLE_VERITY, don't require a file opened for writing, so that e.g.
+ * a binary that is being executed can be preserved. Also don't require a
+ * writable mount, since preserving the file doesn't write to the filesystem.
+ * If the size of the file can't change anyway, because it is on a read-only
+ * superblock or immutable, its owner may also preserve it. The size could only
+ * change again after the file is made writable, which is up to the owner or
+ * root. Reject append-only files: Their writers can only append to them, and
+ * freezing the size would stop all appends.
+ *
+ * Preserving the file also fills its holes, but that doesn't need any more
+ * permission: Anyone who can read the file can fill its holes by faulting
+ * them in through a read-only mapping.
+ */
+static int shmem_luo_may_preserve(struct file *file)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	struct inode *inode = file_inode(file);
+	int err;
+
+	if (!(file->f_mode & FMODE_READ))
+		return -EBADF;
+
+	if (IS_APPEND(inode))
+		return -EPERM;
+
+	err = inode_permission(idmap, inode, MAY_WRITE);
+	if (err && (sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
+	    inode_owner_or_capable(idmap, inode))
+		return 0;
+
+	return err;
+}
+
 static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
@@ -307,6 +364,11 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	int err = 0, seals;
 
 	inode_lock(inode);
+
+	err = shmem_luo_may_preserve(args->file);
+	if (err)
+		goto err_unlock_inode;
+
 	shmem_freeze(inode, true);
 
 	/* Allocate the main serialization structure in preserved memory */
@@ -362,6 +424,7 @@ static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 	kho_unpreserve_free(ser);
 err_unlock:
 	shmem_freeze(inode, false);
+err_unlock_inode:
 	inode_unlock(inode);
 	return err;
 }
@@ -710,9 +773,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.0.385.gac671c819a-goog


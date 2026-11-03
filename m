Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667753;
	b=fkUoYDhDQ8MNL1upF8gfqDkjdSyRDrhDHCUHCEdgLmQDo5fqmKSKz7qurjFEzuDOilp6
	 IdiNa3OQdjxZxvtlUUg9Ou0Kpn4AnJ3eQ0VkyI61l2OoybaoJwSoT9J0+Ixq4drgRC7Jt
	 ghFMpSRDgQQ3w3EOkVUKl3oQGVbEllnZClB9bdvLWwGGNSu/rRmjxpmTUyoNmabY7wIZx
	 L91RkY9kXJt0zaPXhcTnnwISK8ZeWV3K3B06vSjjnaoM2ScmmsGZGKHbAF/dhgx4NcC9k
	 jLzhTukAiu24IPf6tCfspAbP5rxhrYS5q9/jPh3POrLjjVSbL0q8jvZa7q7+8bc5I2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7I0mAJcE66JF6RmNkJWZGa5rIBu7EHzJOM3NkpUE8Fo=;
	b=HVX+vhzqFANmGufA8DCedzBWGoHuHD7tHJTM0bduT35NCDITIJr4kf4PuiAt3JZ5y+8K
	 5mmdhxCCgBNN86ajR+YqgPUOcgQZsjXS86C4HipE+nty/t5k0+b/EhP7klSgfhoFzqxQF
	 s65NVcr78njlYa3oLgYj030isMAO2nF0QIfhcAWuBG2PybBtX2GPdTg2ypw2oiPh8qa7R
	 8FKH1rPuBCjr35fSSl6thCEkNM/EEYDRE9WE+/D1beoz6k1pMZd1jwhFkaUOr3F4CcZak
	 Va+WJvezDBaaRyYgLZfNrGDXnnnV/lcNK41oqsXc2GYNvGcVhAdPqf01AD2IK2syzdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gl5qXu6Y;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3896606EE91
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3896606EE91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gl5qXu6Y
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eac6e96bd4so54425655ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667752; x=1794272552; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7I0mAJcE66JF6RmNkJWZGa5rIBu7EHzJOM3NkpUE8Fo=;
        b=Gl5qXu6YNE2JHkhlR4xgAORfAozo3wczdARzUWrMGY4BdPCLLJf8Y10tTksuPrsWoH
         1P/xnKKONx6gvdl/GcNTAfmcyTsDIGKYm/CWLG0JYy/GXNlSEm0wMVUSYJOc951qZ1hl
         O7Ykl1zwtejEdVhSFEEeug4czH+RP+5VthD/K6LDNjFQLRj6GiNQORRH4ldEKGKmQQ7i
         upM3HnB09J+qaUOTggXdXhnhCw8pTWPz5aRLgchTEjRi02e5BiEThZ0oW96PKtkvHGiy
         n7uUurxK0sNxB8slmdoUyoY1kc9PNmibO3TQ4IZdn8QPFNbrBOvj9khdykCT5C/FCu7z
         35QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667752; x=1794272552;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7I0mAJcE66JF6RmNkJWZGa5rIBu7EHzJOM3NkpUE8Fo=;
        b=gs7R1YIMOGkzWODbN/a1GGITFlbVU8nSiA+4MgI3iUvyt2Stcm5fQHeaztmp2pQ7wr
         vTdMrGw/n/yam8NZHEpxkKS/kafqj9iWlMNJzazJMuH8FyNYraYgYNK7nbPq4D/b0mLz
         ymJnJItY5VX1gT7yKIKXh1pHXuAWLpMqZ+35aDO+mcpppQB0SoBzAuWQrRsvvICt1cDE
         O18NSSysjb9veB7i1p4Nd0jMSnmVc8vTmn988eIjOFq5MGWWfd0zt17UaR1GfrgX9Vf0
         /vVJ9qDQ06Gl4b8sxDlUSVQOTsjF0RjKxD6bTkGUzIsxPIdrHikXqpxjvBxWqohh6rW2
         qM9A==
X-Forwarded-Encrypted: i=1; AKwUvBw1wkNj7SURpxkE17/oO4tB0m9BBiMTsOwDgSoMPgHyMJ1e1aCZk497ORxvlBRtGMA1J1wcyBbvZcVUlnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3XtHo2NV89txUfBsQ0aPh/79NrRJEwZV8C+faDE5jGVFnK9lD
	0nO4z6cGbBN3mpFq7mPho//g2xxavDX1E4qITb2qZ7PsAb9CexqICygUm1NNMNV5J5pho1QbTUr
	7/KOScAmZtueAow==
X-Received: from plil13.prod.google.com ([2002:a17:903:17cd:b0:2eb:515:b000])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e74a:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2eb364d1882mr123516745ad.39.1793667752259;
 Mon, 02 Nov 2026 17:02:32 -0800 (PST)
Date: Tue,  3 Nov 2026 01:02:15 +0000
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
Message-ID: <20261103010216.3447716-10-dmatlack@google.com>
Subject: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with O_RDONLY
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

Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
to retrieve a tmpfs file read-only.

open() requires write access for O_TMPFILE, so create the file writable
like before, then reopen it read-only with dentry_open() using the flags
of the writable file, which file_open_root() normalized, and drop the
writable file. Like open(), which grants the requested access to a new
file regardless of its mode, don't check permission for the read-only
open.

Retrieving a file read-only allows a restored binary to be executed
before the session is finished. LUO keeps the retrieved file open until
then, and executing a binary that is open for writing fails with
-ETXTBSY. Being able to execute restored binaries right away matters
when they are needed to finish restoring the system, e.g. to bring up
the services that retrieve and finish the remaining sessions.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/liveupdate.h |  6 +++---
 mm/shmem_luo.c                  | 34 ++++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index a9dcc4fcc87b..790742a247e8 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -265,9 +265,9 @@ struct liveupdate_session_get_name {
  *
  * The kernel creates a new file as if by openat(@dirfd, ".", O_TMPFILE |
  * @flags, @mode), fills it with the preserved contents, and returns it in
- * &struct liveupdate_session_retrieve_fd.fd. Like any O_TMPFILE file, the file
- * is not linked into the filesystem. Userspace can link it with linkat(),
- * unless @flags contains O_EXCL.
+ * &struct liveupdate_session_retrieve_fd.fd. Unlike open(), O_RDONLY is
+ * allowed. Like any O_TMPFILE file, the file is not linked into the filesystem.
+ * Userspace can link it with linkat(), unless @flags contains O_EXCL.
  *
  * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
  * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 0c012f242fc5..c669416a8a59 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -113,9 +113,10 @@
  *
  * Like any ``O_TMPFILE`` file, the new file is not linked into the filesystem.
  * Userspace can link it at the path it wants with ``linkat()``, unless it asked
- * for ``O_EXCL``. Like with ``open()``, the file must be opened for writing.
- * LUO keeps the file open until the session is finished, so a retrieved binary
- * can't be executed until then.
+ * for ``O_EXCL``. Unlike ``open()``, the file can be retrieved with
+ * ``O_RDONLY``. LUO keeps the file open until the session is finished, so a
+ * binary retrieved with ``O_RDWR`` or ``O_WRONLY`` can't be executed until
+ * then.
  *
  * The blocks of the file are charged to the target mount, so the size limit
  * and quotas of the mount apply. If the file doesn't fit, the retrieve fails
@@ -661,7 +662,9 @@ static struct file *shmem_luo_create_memfd(const struct liveupdate_shmem_retriev
 static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_retrieve_arg *arg,
 						unsigned int seals)
 {
-	struct file *file;
+	struct file *file, *ro_file;
+	bool rdonly;
+	int flags;
 	int err;
 
 	if (!arg)
@@ -685,10 +688,16 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 
 	/*
 	 * Create the file like open(O_TMPFILE) does, so that it gets the same
-	 * flag checks, permission checks, owner and security labels.
+	 * flag checks, permission checks, owner and security labels. open()
+	 * requires write access for O_TMPFILE, so create the file writable and
+	 * reopen it read-only below if that is what userspace asked for. LUO
+	 * keeps the file until the session is finished, and a file opened for
+	 * writing couldn't be executed until then.
 	 */
+	flags = O_TMPFILE | O_LARGEFILE | arg->flags;
+	rdonly = (flags & O_ACCMODE) == O_RDONLY;
 	file = file_open_root(&fd_file(dir)->f_path, ".",
-			      O_TMPFILE | O_LARGEFILE | arg->flags, arg->mode);
+			      flags | (rdonly ? O_RDWR : 0), arg->mode);
 	if (IS_ERR(file))
 		return file;
 
@@ -706,7 +715,18 @@ static struct file *shmem_luo_create_tmpfs_file(const struct liveupdate_shmem_re
 	}
 	SHMEM_I(file_inode(file))->seals = seals;
 
-	return file;
+	if (!rdonly)
+		return file;
+
+	/*
+	 * Reopen the file with the flags of the writable file, which
+	 * file_open_root() normalized, e.g. by dropping O_CLOEXEC.
+	 */
+	ro_file = dentry_open(&file->f_path,
+			      (file->f_flags & ~O_ACCMODE) | O_RDONLY,
+			      current_cred());
+	fput(file);
+	return ro_file;
 }
 
 static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
-- 
2.56.0.385.gac671c819a-goog


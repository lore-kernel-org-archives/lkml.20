Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138781;
	b=pfsRvBHdj0IBsE9/lD2TuvbGlphM5wmp/Vyj42wnvsQOuV5ZF3V6gjBBkFHxNe0DLPm+
	 6aOK1lErMK9RvZNN4pBI+s4oF4IEKr58qbvvA3BefwLn5Ag2y8lnVxQBLVcEo9vUX9Yx7
	 +xqavshrz8KMNLbVM/BmFBObw6iIF9YD5Gt0T0LIWjnY0q0XGERwdCOb6g8DLcceemYFw
	 I63e0a/y4sruGP/zrswrnUixRSgYw/EnGt5JKZ7cvm1puL9kd4AsdgWlqtpeKWOOV4Ear
	 l+G3HucN89s2yWq67Iy6u2FV6ckupYjyp56z168B/DHHs8AdiKLj8wU3yTDduz4jKPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oFG4800z/5XBXYEMQ6fOts4AqgybfNDSLGn1ehBYBjQ=;
	b=e7Q4Eqo9ul6VAtnufVE1qsRnhLr5IXUQNeDZW4xEysFPjXJXmwGL3oJvhxSbFtsFZcwA
	 jssTimVgfKLSIlq2R3i1ItMmtGlYP+V2DF6FNaFK26O2JrTTyZRxfckMKCDPqBWPxPmP4
	 8gJJPmIqpvpUIZyagtPf1tCZr++5jlxvdyooQhit/If0bqlavtAqL8dOa2xNThJIJ6WWF
	 CG+XgnzDo2HyL1aQ6vYdPAUEg1rY3ciHqz2rZovLf/zdKRnGFZtI02Giaerc9bXJnRhoB
	 5EmmlZAacMmxql7KibRQmbIa6hK2FC2SR0E63bdXo+RreMip+7nfw6z0Tx6wC1JnW4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2mvGEs4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9292606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9292606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2mvGEs4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so9250145e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793138779; x=1793743579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFG4800z/5XBXYEMQ6fOts4AqgybfNDSLGn1ehBYBjQ=;
        b=U2mvGEs4Wrm2gKzvB/kHh5tCe4bITYJ5xL20ONwTj2Tzwi26sR6qRLV1eOFcftJLGv
         dDxnCAJN/kovUKRhVnirCK5pJ1IA60nxlDSh2SONVTseg6gpyf2rvjkXwAUVwv/HDZg8
         8J1s8cgppqOf94Ym9n6eZirEpp4tOSod5z2f41Is4JTKuNJwZLv838O1flPhGRcsjYp3
         bdvlGfM5kCcKr4jQ5sm4TGSH4pBoMX7SDI4iuhBzUbR42tgm5euYevOaO83g5AoTE2a3
         GgNVhAQh+J6qSA8sI89Qeie6MQQ0YA4A/ebXeXwOGi3lCllkm0lLtD2DqDHClcUjp12F
         q9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138779; x=1793743579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFG4800z/5XBXYEMQ6fOts4AqgybfNDSLGn1ehBYBjQ=;
        b=fq1b9xRbok46okrpuPZ9U1hmvq20f9PSwaHHUTh9z/vF7hNfHbNKICYQALxBGgAG7I
         Vj1hXjlb6DmUagTvlhbbjFGZYQtiq6HTRFm37mOj4gTjAPena8PhGeBLofdJ1wAiEoQu
         HiQh41z/6pP3mkr+AEkZjtjo5h4QCbGx4iwV5ff7qRpyBL+CNPg44cs5hhmQIM22blcG
         elFFPUuUs+IH6y26TBCv6fyCgc8JhVacjWWcTCcxCJTcb1ALLchnD5gmmkG/wKtqxmBY
         rcBv32bLxcVBlqZ/VvuBXFFBo3b0Og5ggUHE95JQemNNwyLGDMtsUHkHrP65weWmYyGa
         zXYA==
X-Forwarded-Encrypted: i=1; AKwUvBzwERLFfI+aBhrHPAGSDIurllR7K4aSsK0Gu0KoJnIMQf/tmeFI2q0S47tpj5jeBFTbIqQgo4q7+nPIwjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmv7v5Ji0sC/W5G0J4N6zLLkWZyYKm16P6cuL9VVS8HlKv8E+u
	dXNR00qGArlVuDRSXyPWdsOSagilLwy0okqfyLRpykrcFXuIC0xUA2R3
X-Gm-Gg: AYBFou3Zsxsyr6ub0sR8SuDhQbwGNhAQh9e8ygPwZWwXSvbL7FVIpsDdBIaZIRYrxn1
	p1YArWIkUuD7JBo/Kwb85aHOmKAhSp26tD4Xul8w9/N2QItP5n79rHELeRGjQ9/KHxIqwiIjQc+
	7asQxL9VmhlRVMWh89UUGP5ov2KaEGj8e91TS2edf1z1qwhkfJm5LLwThy8jdUqNmTV2bnEE3eO
	LPycIOHHNPNAzI00A2DnuNJn9aPnpgCgkQALMl8nqXv0eWvBvTYyJxC53jm+zBRKuxG3VFladD7
	aRvinJopwSkqZR8IoLtUinnc/BqZbgerE3dhaMI8OxUa1p5/aNLZiFlzYpkllCGOnVkW+WECZ8H
	YZaSUkalQVbXfl3liQGObxd+8fHpVjbJyycEQvDDbPoTfpDzTol2AsFI2RJHS+HYzLoC7YL730j
	ObKTeTJndYNEkXPDJrCR7cT1fazbtL56yWAn2xTSnX8bm+yNH8tt5CXG2Rrj0nWA1k6nbEFm7nJ
	yJZWVlojS6oVHWVUpA6X1rE/CnzZav2MJhEqHmqqt09Rsfzc30=
X-Received: by 2002:a05:600c:190b:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a967e8c069mr6565965e9.16.1793138779392;
        Tue, 27 Oct 2026 15:06:19 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc08fsm1752495e9.4.2026.10.27.15.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:06:18 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH 1/2] vfs: add provenance time (ptime)
Date: Tue, 27 Oct 2026 23:05:31 +0100
Message-ID: <20261027220532.736352-2-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027220532.736352-1-koray.fra@gmail.com>
References: <20261027220532.736352-1-koray.fra@gmail.com>
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

Add provenance time (ptime), indicating the time when the file
*contents* were created. This is user-settable via file_setattr() and
retrievable via statx(2) (using STATX_PTIME) or file_getattr().

The semantics of when to preserve this new timestamp are the same as
mtime, the idea being that there is a correspondence like this:

ctime <-> btime
mtime <-> ptime

so every operation (copying, moving, ...) that currently preserves mtime
should also preserve ptime.

Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
allow ptime to be used with the file_setattr()/file_getattr() syscalls.

[ This is a re-implementation of the initial patch[1] by Sean Smith
  <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
  Wong <djwong@kernel.org> of using file_setattr() instead of updating
  utimensat() ]

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c            | 24 ++++++++++++++++++++++--
 fs/stat.c                 |  2 ++
 include/linux/fileattr.h  |  5 +++++
 include/linux/stat.h      |  1 +
 include/uapi/linux/fs.h   |  8 +++++++-
 include/uapi/linux/stat.h |  7 ++++++-
 6 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..14dddd459969 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
 static void fileattr_to_file_attr(const struct file_kattr *fa,
 				  struct file_attr *fattr)
 {
-	__u32 mask = FS_XFLAGS_MASK;
+	__u32 mask = FS_FILE_ATTR_XFLAGS_MASK;
 
 	memset(fattr, 0, sizeof(struct file_attr));
 	fattr->fa_xflags = fa->fsx_xflags & mask;
@@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	fattr->fa_ptime_sec = fa->fsx_ptime.tv_sec;
+	fattr->fa_ptime_nsec = fa->fsx_ptime.tv_nsec;
 }
 
 /**
@@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
 static int file_attr_to_fileattr(const struct file_attr *fattr,
 				 struct file_kattr *fa)
 {
-	__u64 mask = FS_XFLAGS_MASK;
+	__u64 mask = FS_FILE_ATTR_XFLAGS_MASK;
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
 
+	if (fattr->fa_pad != 0)
+		return -EINVAL;
+
 	fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK);
 	fa->fsx_extsize = fattr->fa_extsize;
 	fa->fsx_projid = fattr->fa_projid;
 	fa->fsx_cowextsize = fattr->fa_cowextsize;
+	fa->fsx_ptime.tv_sec = fattr->fa_ptime_sec;
+	fa->fsx_ptime.tv_nsec = fattr->fa_ptime_nsec;
 
 	return 0;
 }
@@ -232,6 +239,11 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
 		return -EINVAL;
 
+	/* Check provenance time's nanoseconds */
+	if ((fa->fsx_xflags & FS_XFLAG_PTIME) &&
+	    (unsigned long)fa->fsx_ptime.tv_nsec >= NSEC_PER_SEC)
+		return -EINVAL;
+
 	/*
 	 * It is only valid to set the DAX flag on regular files and
 	 * directories on filesystems.
@@ -293,6 +305,7 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 			fa->fsx_nextents = old_ma.fsx_nextents;
 			fa->fsx_projid = old_ma.fsx_projid;
 			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+			fa->fsx_ptime = old_ma.fsx_ptime;
 		} else {
 			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
 		}
@@ -423,6 +436,10 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
 		return error;
 
 	fileattr_to_file_attr(&fa, &fattr);
+
+	if (usize < FILE_ATTR_SIZE_VER1)
+		fattr.fa_xflags &= ~FS_XFLAG_PTIME;
+
 	error = copy_struct_to_user(ufattr, usize, &fattr,
 				    sizeof(struct file_attr), NULL);
 
@@ -459,6 +476,9 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
 	if (error)
 		return error;
 
+	if ((fattr.fa_xflags & FS_XFLAG_PTIME) && usize < FILE_ATTR_SIZE_VER1)
+		return -EINVAL;
+
 	error = file_attr_to_fileattr(&fattr, &fa);
 	if (error)
 		return error;
diff --git a/fs/stat.c b/fs/stat.c
index a2e63c6c45b7..e426f41253f6 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -728,6 +728,8 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
 	tmp.stx_ctime.tv_nsec = stat->ctime.tv_nsec;
 	tmp.stx_mtime.tv_sec = stat->mtime.tv_sec;
 	tmp.stx_mtime.tv_nsec = stat->mtime.tv_nsec;
+	tmp.stx_ptime.tv_sec = stat->ptime.tv_sec;
+	tmp.stx_ptime.tv_nsec = stat->ptime.tv_nsec;
 	tmp.stx_rdev_major = MAJOR(stat->rdev);
 	tmp.stx_rdev_minor = MINOR(stat->rdev);
 	tmp.stx_dev_major = MAJOR(stat->dev);
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 09e32b84e02a..0b93f9609284 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -35,6 +35,10 @@
 	(FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | \
 	 FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
 
+/* Flags only for fa_ fields */
+#define FS_FILE_ATTR_XFLAGS_MASK \
+	(FS_XFLAGS_MASK | FS_XFLAG_PTIME)
+
 /*
  * Merged interface for miscellaneous file attributes.  'flags' originates from
  * ext* and 'fsx_flags' from xfs.  There's some overlap between the two, which
@@ -49,6 +53,7 @@ struct file_kattr {
 	u32	fsx_nextents;	/* nextents field value (get)	*/
 	u32	fsx_projid;	/* project identifier (get/set) */
 	u32	fsx_cowextsize;	/* CoW extsize field value (get/set)*/
+	struct timespec64 fsx_ptime; /* provenance (settable birth) time */
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
diff --git a/include/linux/stat.h b/include/linux/stat.h
index 9c5709132862..69d2ecfd1bf2 100644
--- a/include/linux/stat.h
+++ b/include/linux/stat.h
@@ -48,6 +48,7 @@ struct kstat {
 	struct timespec64 mtime;
 	struct timespec64 ctime;
 	struct timespec64 btime;			/* File creation time */
+	struct timespec64 ptime;	/* File provenance (user-settable creation) time */
 	u64		blocks;
 	u64		mnt_id;
 	u64		change_cookie;
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index a46c33692aa2..c00e72fcfa3e 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,14 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	__s64 fa_ptime_sec;	/* provenance (settable birth) time (seconds) */
+	__u32 fa_ptime_nsec;	/* provenance (settable birth) time (nanoseconds) */
+	__u32 fa_pad;
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 40
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
 
 /*
  * Flags for the fsx_xflags field
@@ -261,6 +265,8 @@ struct file_attr {
  */
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
+
+#define FS_XFLAG_PTIME		0x00100000	/* provenance time */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
index 1686861aae20..f3a1013ba022 100644
--- a/include/uapi/linux/stat.h
+++ b/include/uapi/linux/stat.h
@@ -187,7 +187,11 @@ struct statx {
 	__u32	__spare2[1];
 
 	/* 0xc0 */
-	__u64	__spare3[8];	/* Spare space for future expansion */
+	/* Data provenance (creation) time */
+	struct statx_timestamp	stx_ptime;
+
+	/* 0xd0 */
+	__u64	__spare3[6];	/* Spare space for future expansion */
 
 	/* 0x100 */
 };
@@ -219,6 +223,7 @@ struct statx {
 #define STATX_SUBVOL		0x00008000U	/* Want/got stx_subvol */
 #define STATX_WRITE_ATOMIC	0x00010000U	/* Want/got atomic_write_* fields */
 #define STATX_DIO_READ_ALIGN	0x00020000U	/* Want/got dio read alignment info */
+#define STATX_PTIME		0x00040000U	/* Want/got stx_ptime */
 
 #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
 
-- 
2.56.0


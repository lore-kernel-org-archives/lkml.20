Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C53FF1CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762781; cv=none; b=mBL10y6TXM9WRfR5GAqZMLDrv1pCNVjnlk7RU1oysr1tPyLVFDiMOmVIncNnguQ77Cd/HxhvBe2lq2PBjgjd1CDWPnXCruT5scq5qNrg0tPhxF6rauViY63FzzxiTZibeCUrFKeIcgLNsAMWwziGsPHhLO77L34K9C188DZmwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762781; c=relaxed/simple;
	bh=VbpCYoPPIPt0Kteo19f69UoQEtPnUcD8MjzhN0W5QNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jP5ogjXundBtvePCJq1D6AoqPKkUchuNUje+NGJ3nfwjTwsF00G+nbfqAu0/f7sCp0ETciXlRUwrLnM0Q9fYPgeykNCPdJPMw1Qt+BZPqg7wC3h43UIe9i9XGq0Q9wz+18lPCf2Rg7bk/WEnfJXGW0E4KbjXKzSqrKmiShZLsgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao02LZG7; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao02LZG7"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso2259642a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762778; x=1789367578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCA9qPbIZqmwvP7w/JxqQ15cuVQj4FzKWfM0qbvtCw4=;
        b=Ao02LZG7pj+NtAykUxnE5pFMCt9tXPQuH1aXZDICPp9VbTKh+f7AGnUjIwtQL6WPGQ
         oGsnTC86WiMiRSUZ03iuIZXh3j0TksDlIYrOt+LAHIxet5T1hzYNVUDBcmbGiuNTm1Sq
         8MvODIB1glvEuNp3PU/AQ6dM1PT5ByTE50JN0gJqDdBmYylRulJ9z2j/tkyG5u4ceWzT
         WnjSiY4zldANBKAItr/xcj2uUShR0gseAtll4awcMtgafaO3wrBUQ9kU1NeCK07+plpo
         +/hipBlQMRSsA3ekGe4miAyIaTcd9AXLCoQVP71cBDtEC/NKNESVEEl0SNJjCEzCJa/4
         kHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762778; x=1789367578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCA9qPbIZqmwvP7w/JxqQ15cuVQj4FzKWfM0qbvtCw4=;
        b=YHgBRXUv6DEMsY4hvyv7wMDBb1kTQdannkTtuJLL76gxJfbuPz7zkW2Raw7I4V9a0v
         Qhq9siGJmfxHmOj5LoqxnNoaaIwpWdxLaKJURtQZk3ARKgZ4D8U9Zuz4i3xHPG7oNZGT
         AHJzYm/pfS+CsV5f98u8nCgURB9ukSyK4eWvdiBKCUvhq0iu7rJMzW/7J+2nvX8yWUlq
         7pL8HQy4oUVTr68WNKv47xNG8ZVtUA6jREtvSuvQK5ehJt6oCojui9g6uoPY+oLBQPyJ
         iBw0JSijyrWVresiyj9G3+/PSySOaZJVsSgD6yQellpb6/YJ5CFnIC9gweY0IsP8jmlp
         r5VA==
X-Forwarded-Encrypted: i=1; AKwUvBwc+T6tuOkd+OgU6dZb/GAhUwrucOL6Runhfs1wzjrhnwoLfIJ8Vz10KB0N7X4cnIcQqcSyj7i02ZOLzjs=@vger.kernel.org
X-Gm-Message-State: AFuF++lObuYA/XkwgRiigFejBXUWBeKc2DNnj9avP/0VoCaN6jv9Ngyv
	NkB0duBBfa+/SBYHWZ1pdGge2s5Zn/q+DK61QwftZJKt/Vxhw9xsL9VD
X-Gm-Gg: AYBFou0ku+nFHqZzJkLB1//MkEeK0UXpydoUq8Fc+g7n1v+G70bxjCtr0AgZot9F2tw
	JVM9z2cYqNNFIXRlH21EKWMkKxUJPFDR51ZIZzRZZLRd7CBhnt97ObiFP9vb1yoQgP4e5sG7qIM
	8AFG31Vlt5SSjPen3YiMX2QBCLl/XETBNG21vrqyO5ii3ReTfmUXMWI5LUuAA3AMjpy/WkyAckr
	EkJ5eIWZQS16Q/oce2qB3D6uqitOQYlRYH0nLyAxLRj1ZjFM7SYDsNPbVYejxI6mt9Bn/wYPCdu
	sKSLkB3Q+gLZFzwtHJIQSp95hVNqYk2CFf1b8859Q6LkaQFRILi+kArv5drTDGxLCTt1O430NNt
	8EXaWelQpOe8xjGEdZMb3UvATOeqmMlkeGFWXAJebhJaFhTlRwx45Z+zJliDSEIvvTIizcRkVVE
	BjNQcSSy4ST9eoCSkc0X67w1WJv6qThnRh8d1tTmkO+/pgq5GM62EeRbz/V42hqfIgoIcyro5ch
	eT4MnwaBRe+Dw==
X-Received: by 2002:a05:6a21:3a41:b0:3d3:adbf:7782 with SMTP id adf61e73a8af0-3da3a16baebmr36766901637.23.1788762777928;
        Sun, 06 Sep 2026 23:32:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3369856a9f7sm7803268eec.5.2026.09.06.23.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:32:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Benjamin LaHaise <bcrl@kvack.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-aio@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: fix typos in comments
Date: Mon,  7 Sep 2026 12:02:52 +0530
Message-ID: <20260907063252.21433-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/aio.c                | 4 ++--
 fs/coredump.c           | 2 +-
 fs/fs-writeback.c       | 6 +++---
 fs/inode.c              | 2 +-
 fs/namespace.c          | 2 +-
 include/linux/fs.h      | 2 +-
 include/uapi/linux/fs.h | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index d78acc69f487..685525aef7a3 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -936,7 +936,7 @@ static int kill_ioctx(struct mm_struct *mm, struct kioctx *ctx,
 
 /*
  * exit_aio: called when the last user of mm goes away.  At this point, there is
- * no way for any new requests to be submited or any of the io_* syscalls to be
+ * no way for any new requests to be submitted or any of the io_* syscalls to be
  * called on the context.
  *
  * There may be outstanding kiocbs, but free_ioctx() will explicitly wait on
@@ -1280,7 +1280,7 @@ static long aio_read_events_ring(struct kioctx *ctx,
 	 * The mutex can block and wake us up and that will cause
 	 * wait_event_interruptible_hrtimeout() to schedule without sleeping
 	 * and repeat. This should be rare enough that it doesn't cause
-	 * peformance issues. See the comment in read_events() for more detail.
+	 * performance issues. See the comment in read_events() for more detail.
 	 */
 	sched_annotate_sleep();
 	mutex_lock(&ctx->ring_lock);
diff --git a/fs/coredump.c b/fs/coredump.c
index ac3cd74808c6..2e8f247efd65 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -1047,7 +1047,7 @@ static bool coredump_write(struct core_name *cn,
 	cn->core_dumped = binfmt->core_dump(cprm);
 	/*
 	 * Ensures that file size is big enough to contain the current
-	 * file postion. This prevents gdb from complaining about
+	 * file position. This prevents gdb from complaining about
 	 * a truncated file if the last "write" to the file was
 	 * dump_skip.
 	 */
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index e744f9f9d43f..f303936446da 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -233,7 +233,7 @@ void wb_wait_for_completion(struct wb_completion *done)
  * Parameters for foreign inode detection, see wbc_detach_inode() to see
  * how they're used.
  *
- * These paramters are inherently heuristical as the detection target
+ * These parameters are inherently heuristical as the detection target
  * itself is fuzzy.  All we want to do is detaching an inode from the
  * current owner if it's being written to by some other cgroups too much.
  *
@@ -248,7 +248,7 @@ void wb_wait_for_completion(struct wb_completion *done)
  * to 16 slots.  To avoid tiny writes from swinging the decision too much,
  * writes smaller than 1/8 of avg size are ignored.
  */
-#define WB_FRN_TIME_SHIFT	13	/* 1s = 2^13, upto 8 secs w/ 16bit */
+#define WB_FRN_TIME_SHIFT	13	/* 1s = 2^13, up to 8 secs w/ 16bit */
 #define WB_FRN_TIME_AVG_SHIFT	3	/* avg = avg * 7/8 + new * 1/8 */
 #define WB_FRN_TIME_CUT_DIV	8	/* ignore rounds < avg / 8 */
 #define WB_FRN_TIME_PERIOD	(2 * (1 << WB_FRN_TIME_SHIFT))	/* 2s */
@@ -259,7 +259,7 @@ void wb_wait_for_completion(struct wb_completion *done)
 #define WB_FRN_HIST_THR_SLOTS	(WB_FRN_HIST_SLOTS / 2)
 					/* if foreign slots >= 8, switch */
 #define WB_FRN_HIST_MAX_SLOTS	(WB_FRN_HIST_THR_SLOTS / 2 + 1)
-					/* one round can affect upto 5 slots */
+					/* one round can affect up to 5 slots */
 #define WB_FRN_MAX_IN_FLIGHT	1024	/* don't queue too many concurrently */
 
 /*
diff --git a/fs/inode.c b/fs/inode.c
index ba7da39be4a3..817fd5254495 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1771,7 +1771,7 @@ EXPORT_SYMBOL(ilookup);
  * function must never block --- find_inode() can block in
  * __wait_on_freeing_inode() --- or when the caller can not increment
  * the reference count because the resulting iput() might cause an
- * inode eviction.  The tradeoff is that the @match funtion must be
+ * inode eviction.  The tradeoff is that the @match function must be
  * very carefully implemented.
  */
 struct inode *find_inode_nowait(struct super_block *sb,
diff --git a/fs/namespace.c b/fs/namespace.c
index 1ecd96c918b3..f45233f425f7 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -4115,7 +4115,7 @@ int path_mount(const char *dev_name, const struct path *path,
 	if (flags & SB_MANDLOCK)
 		warn_mandlock();
 
-	/* Default to relatime unless overriden */
+	/* Default to relatime unless overridden */
 	if (!(flags & MS_NOATIME))
 		mnt_flags |= MNT_RELATIME;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index f9d1e05e8ae6..05d05bb9c951 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1436,7 +1436,7 @@ static inline void i_gid_write(struct inode *inode, gid_t gid)
  * @idmap: idmap of the mount the inode was found from
  * @inode: inode to map
  *
- * Return: whe inode's i_uid mapped down according to @idmap.
+ * Return: the inode's i_uid mapped down according to @idmap.
  * If the inode's i_uid has no mapping INVALID_VFSUID is returned.
  */
 static inline vfsuid_t i_uid_into_vfsuid(struct mnt_idmap *idmap,
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 34c6f219462a..a46c33692aa2 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -88,7 +88,7 @@ struct fstrim_range {
  * We include a length field because some filesystems (vfat) have an identifier
  * that we do want to expose as a UUID, but doesn't have the standard length.
  *
- * We use a fixed size buffer beacuse this interface will, by fiat, never
+ * We use a fixed size buffer because this interface will, by fiat, never
  * support "UUIDs" longer than 16 bytes; we don't want to force all downstream
  * users to have to deal with that.
  */
-- 
2.48.1


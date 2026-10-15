Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576C568FDA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087035; cv=none; b=HIOdC7DshBB8ywfHAD2lteZYpQcjEMVasSQ6820pd2j87lgUvmLIknBgIHDO/3CYdYOxfvc7nVwN4hNmbAz3D+VWN2T5+byGcttSCFX/OoNbzRwNoGc5dSHPU/UfXSMARoJIJ1Vl1vGYKKK50AY3fdqv7mWhFuGdyzJO1ZJtlHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087035; c=relaxed/simple;
	bh=Rvewqy63voh2KM3pnUX1AhozXB4DfzYFGfF8JiPjSKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P53GVEC2Pji2SeDXyTDWc8efhYO24d5VZsRAss7Am0O+BI5MnPgo/vlos3056JLZw2RLEHEMNK/ZSsJlUfPKzYBIiLxJVzODxEOFN2L97KJADsplYzwQBjjkU8pQ5I7dc/6JfAZ2l7M6/ni7Dy1KMuW75mHbhNOb7Lw9M0zgPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvD0K3zw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvD0K3zw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so45209455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792087026; x=1792691826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2N7ZKdxtWSo3FIB7Chn8lN5wJYT/uoxLiCD25cL2kTs=;
        b=SvD0K3zwBxzeT3becAbiOlnE0kkXv92B4o2AAy+6mpQWa4njjtLS+4KLh0NPxptIhL
         WjaoPcgrIHHmhAhkbqsU4xegshak5FJtT2l5o/+XtRXoxvm2OT8OMnmLv+km8E1i5vod
         Tm7d4sc3oizQL2FIU/n2WzS+KIRQbzskUeA8m6pUX94/9qowExE9lFAaa8OOsXusgGqU
         MAzoYJ17NTYJ62fZ00lGU0qkhuH5zDifWwDzImpJx1bho6MCqTlQWGzFbRhgconaDvTl
         vG/R/FTWqSe5UmueidLOdCUIXJlj+4MXqHhQcMKoq+A4RGoFMV6qk83uzlnEWKz6U9jh
         Adcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792087026; x=1792691826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2N7ZKdxtWSo3FIB7Chn8lN5wJYT/uoxLiCD25cL2kTs=;
        b=hMZ8soaSUe0rUGJj0OljOHXb3ns79CdM3jnRvMOqnVAN0LDI7l6qVEXMlU9cRb4XL8
         XnhJvDxGxobcEl5u2+VukK5GAKl5ASlEhy7Z17ZS15Z/ooGUAnY4ssC8sobaY+LbUt+e
         25FedSMSNPAd99+Y0o5m9gLxb7E8wlbITkNAYIJjLxWhV23sRSs3FKu1dAatGTZ63kDS
         UwD5JQMtx7rh2xkrLNS8DgPenW6cKGhb/CSLcCEL7/c+4JMRwCxPdNuZs7+b+kKarly1
         w9ztbxO1muDjVSH5wgtEtGyHEjI0G3n3puWobnbvK35sSRq6Eeo+vP9IDG7W8vaMtTMa
         9Zfw==
X-Forwarded-Encrypted: i=1; AKwUvBy9CcOWviNzHmYv6Wyx3SijdH75jhvdbXa5biB1b4IrT+/uFyhJlGeiEexeg4NWeaawTVp5IOxQZf64MWI=@vger.kernel.org
X-Gm-Message-State: AFq9FYImpPRO6v3MtDoKOnzRk0KpgUnvqu+JAWkxapBXIaudGcW3G53C
	hiQpFo1XPU0GcPOq/Gg54ZNWAdXe7QITruBA2Pq3pdsjYoAwgLA6GjR6
X-Gm-Gg: AYBFou3elfS/k2UoHh4rjlTtFV3WvL8e+XFiDpTaCIlPLIOB21xCMVfvuxe2qsv1Jkp
	rqJtuuxyvyawZ+Fgd4aX8bvFwo86i8JFF6yQgvhVkMl/jhhohpXdLoyngdaGEN8R/j4b5UCCW8D
	aQXN4mPWl/deKZDzt3fOm8Brn0i3m2XyZ8O9pru7b/h/z7wWmYD6F2AllUuApbIghfnbpXt7TRT
	GDBSsk/7eJfE4aLIwP9aS8R/KFp746woto2pw3xzWu3UXkLvCZcQpFHxhq96krTHbNGvDmrAxjP
	1HYGsIW0hpZQE4vXQtFDWLsocJbFB8W7UE8K5bzzt2vnq824WuGkO68NeRzbDqLRcl6ZFfFghFk
	XGxGtL/dxFvS3etmeYOFNgqBY68NhlEOpK/ZXbLko2pLin4uSIbdyKdAjeu3UmykPlRCmySHAft
	j5Y6yXIlq7mCWcSneXH4ICckomk1ItHU98ghq4L7tR+uYAsq5aPdC5EK2EakIRoIkxYOsmPPTyQ
	lNUG8K4fONLL9v602ikqYM=
X-Received: by 2002:a05:600c:8218:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-4a18e49d9f5mr392948675e9.9.1792087026167;
        Thu, 15 Oct 2026 10:57:06 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:b8a0:279b:6918:c3ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm96673775e9.1.2026.10.15.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:57:05 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] fsnotify: preserve 64-bit pre-content ranges
Date: Thu, 15 Oct 2026 20:57:01 +0300
Message-ID: <20261015175701.3674449-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfs_fallocate() and remap_verify_area() pass 64-bit lengths to
fsnotify_file_area_perm(), which truncates them to size_t on
32-bit systems.

Use 64 bit (unsigned) types throughout the entire pre-content
notification chain to keep the full range. The userspace range
field is already 64-bits.

Fixes: 9740d17162de ("fsnotify: pass optional file access range in pre-content event")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Tested on a 32-bit x86 kernel in QEMU with ext4 and
FAN_CLASS_PRE_CONTENT / FAN_PRE_ACCESS with regular 
(4KB), boundary, near-boundary, and beyond boundary counts.

requested count    before   with the fix
          4096      4096           4096
    4294967295         0     4294967296
    4294967296         0     4294967296
    4294971392      4096     4294971392

diff --git a/fs/notify/fanotify/fanotify.h b/fs/notify/fanotify/fanotify.h
index 3710543dbf827..225919d7347bf 100644
--- a/fs/notify/fanotify/fanotify.h
+++ b/fs/notify/fanotify/fanotify.h
@@ -441,7 +441,7 @@ struct fanotify_perm_event {
 	struct fanotify_event fae;
 	struct path path;
 	loff_t pos;			/* FANOTIFY_NO_RANGE if unavailable */
-	size_t count;
+	u64 count;
 	u32 response;			/* userspace answer to the event */
 	unsigned short state;		/* state of the event */
 	unsigned short watchdog_cnt;	/* already scanned by watchdog? */
diff --git a/fs/notify/fsnotify.c b/fs/notify/fsnotify.c
index 7e2f330fd2837..8657bb94dfa8b 100644
--- a/fs/notify/fsnotify.c
+++ b/fs/notify/fsnotify.c
@@ -157,7 +157,7 @@ static inline __u32 fsnotify_object_watched(struct inode *inode, __u32 mnt_mask,
 
 /* Report pre-content event with optional range info */
 int fsnotify_pre_content(const struct path *path, const loff_t *ppos,
-			 size_t count)
+			 u64 count)
 {
 	struct file_range range;
 
diff --git a/include/linux/fsnotify.h b/include/linux/fsnotify.h
index bda798bc67bc5..a4a29b3650080 100644
--- a/include/linux/fsnotify.h
+++ b/include/linux/fsnotify.h
@@ -135,7 +135,7 @@ int fsnotify_open_perm_and_set_mode(struct file *file);
  * fsnotify_file_area_perm - permission hook before access to file range
  */
 static inline int fsnotify_file_area_perm(struct file *file, int perm_mask,
-					  const loff_t *ppos, size_t count)
+					  const loff_t *ppos, u64 count)
 {
 	/*
 	 * filesystem may be modified in the context of permission events
@@ -213,7 +213,7 @@ static inline int fsnotify_open_perm_and_set_mode(struct file *file)
 }
 
 static inline int fsnotify_file_area_perm(struct file *file, int perm_mask,
-					  const loff_t *ppos, size_t count)
+					  const loff_t *ppos, u64 count)
 {
 	return 0;
 }
diff --git a/include/linux/fsnotify_backend.h b/include/linux/fsnotify_backend.h
index 618eed4d6d724..a25ae4ed879c7 100644
--- a/include/linux/fsnotify_backend.h
+++ b/include/linux/fsnotify_backend.h
@@ -323,7 +323,7 @@ struct fs_error_report {
 struct file_range {
 	const struct path *path;
 	loff_t pos;
-	size_t count;
+	u64 count;
 };
 
 static inline const struct path *file_range_path(const struct file_range *range)
@@ -945,12 +945,12 @@ static inline void fsnotify_init_event(struct fsnotify_event *event)
 	INIT_LIST_HEAD(&event->list);
 }
 int fsnotify_pre_content(const struct path *path, const loff_t *ppos,
-			 size_t count);
+			 u64 count);
 
 #else
 
 static inline int fsnotify_pre_content(const struct path *path,
-				       const loff_t *ppos, size_t count)
+				       const loff_t *ppos, u64 count)
 {
 	return 0;
 }

base-commit: 045958acaa75205b31578cb22c4345e28dd2e4bf
-- 
2.43.0


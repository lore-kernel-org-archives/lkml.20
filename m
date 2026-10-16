Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5025616AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171047; cv=none; b=euJYzPGdLr4MQ9+ECxuNueT4TDcsV9+WcYWxi/20aUKAqdH6b1rg/zcwn321XMJBSexlWrvWIpKWrfr771ed2L+N5yFbAztNic51DwO3osN46nbHJcLxTP6zEcD9LRd8hNoqu5tSLFS+wrr96M8Dsj7F9z0gVK8p5CknIs8asQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171047; c=relaxed/simple;
	bh=PDeQKDGVqwZ4U/KLEclMbrbOGz/7Qym/qxwL0GKnZu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UryfXmmlK7VM1Eg9GPq+iUHfCEvvqsE2oOryR1Fzl8RrVjiTUF4mOABq7jQRujussCkvGAMDafIapsRyFlSmOHPymiq5K77bv0wFpgYRNyK3Bf5/953BwVAxs4AUs2KabrSXdM4b1Z81q6W/nLHHAbxL8u5LUiJxLkieOTqId+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6br5TzY; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6br5TzY"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso121405a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171044; x=1792775844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Gmw5gaxDOzBmPpJ0CCQs51QbryjVy3dY9vuKu88q2A=;
        b=G6br5TzYBZLXXOl1zZZw05WwsGCi/UvNYa2h1RWUOvUVC/QjbO1HvZvBF3Hw4FlN6d
         NZ3vZh421tJa/5//thzU6qeQtT5xOP2sAmOptJ9W3U41mo9ThzcKVtohbpF6CVJ2UY+p
         t9VeDRHPQE/KrppKwFpo/1hc03o0RK3RLp8OGiNJ8fMcydD1zFAZoV0KNBJc086NT6yr
         bf9DyNpMHvLdmM+XzsV+C+5OzFySPrgN1awEeEQ6mvFMjXMbg1KvoY6+LBDP+eXV0QXv
         tK9pDfdFyw9BD4QBOhsLRoXgfhFEogHtCgB2WJSeCzSHvXBZ/FceLocqmrgxScX2DGhj
         /BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171044; x=1792775844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Gmw5gaxDOzBmPpJ0CCQs51QbryjVy3dY9vuKu88q2A=;
        b=ew//esPiQoYKsMfquvzkiGGH/WkYqxUAp2QEvvRVoCKgxAF8eclvQP8d/v25/oxmnZ
         MjUZIGkBMitcLwwuhEHKB0+in0P/g53IbNlSAGxkSvWvyNV8EAepNs5dwaWTMqfoBZbB
         rwRHKz3CxTzh5gdzih2c2HY9JdGPEXlc7grP3vMSfeaLhKg9dv8hPsyBDX090oDg7f51
         U6lmVATH2LlZdZ4CIlXlA8HuGycSK9NCu77xxCs2beIgD/RDP+RV82CYoyt6EhffDZJu
         3KvO4bQrfe+KPnoRuQAKZ2oUHdo+lz4Side7YDivBoYyB45nsSPzNnB8GgJhJLZ/CVjq
         1MHg==
X-Forwarded-Encrypted: i=1; AKwUvBwQaL7SaycrCySJMcMh4/JGlr8AA2pL0trRW/wnXWN/8UaEr5RQkDlLPr6PfbISau7pBxeiIcra0LxgWh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL19UFO2kzoZEBFXyymPGgmdfnN47r7kwV6vAfbplW3/hMOrEHf
	sCRqHz+RRdfh66tFAI5G8TOBo5ff1mcmWdVRJTLp7ozOk6b0fEV7ZAxH
X-Gm-Gg: AYBFou3MRo7WpjtiVJY5H5ZXIizV9Y4HK0Qcs3Z0bQPUOwLfoX16wzbk3eH9Fvoxv7V
	xmDMao7a74WhlUCwGMtICRnAzLZrAc7FO8ZZ0qXuY0PZ3FVYocSndvXjim6gCLTc5klxRQ/omI7
	oewPPqSA6cDm9cjeKHicqspBW+oxfkHgnGADxBh1MTht5V0A/OS4Sz2EMtPTjGjZzyikVUNJ6V/
	4pKoj2VgFOoNgpokbSrrF8De157P90J29yljxhdHZa0Gn0FcdbD04m4Tz9mis16nVw+BeQy2VxA
	4omt/vfos8VlZE6Hj164QF4hwIn3/XJuC91SHCJfLxWdNyf982Eo5+jOJr47TpfgsxZj9jG3iH2
	FaJjUZUlD89HUwWFOVtxSqwyB0QSKXn1kXB+sgY5CxnCXCF9f9Uox8yee9/IZ9XBJ04D8NKvYZo
	BUwaHKkkIp6+vLks98zSEcWSAFU47wM7s75Rn07eAIyPl6ntTD9X8NswNjH+ZEQDJu9BN5ZTTl
X-Received: by 2002:a17:902:ea12:b0:2e5:78b1:33fc with SMTP id d9443c01a7336-2e9a705023emr5958185ad.53.1792171044290;
        Fri, 16 Oct 2026 10:17:24 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16dc::247:b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d51b5sm13396075ad.8.2026.10.16.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:17:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	willy@infradead.org,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+399510418a0b0cf1fc29@syzkaller.appspotmail.com
Subject: [PATCH] fs: annotate lockless file position updates in sendfile
Date: Sat, 17 Oct 2026 00:17:18 +0700
Message-ID: <20261016171718.243099-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sendfile(2) does not take f_pos_lock, so with a NULL offset it reads
and writes file->f_pos of both files locklessly. Two tasks sharing a
file, or one running lseek(2), race on it. The splice read paths
likewise update in->f_ra.prev_pos, a readahead hint, without
serialization. KCSAN reports all of these:

  BUG: KCSAN: data-race in do_sendfile / do_sendfile
  BUG: KCSAN: data-race in do_sendfile / generic_file_llseek_size
  BUG: KCSAN: data-race in shmem_file_splice_read / shmem_file_splice_read

The races are benign. The worst outcome of concurrent sendfile() on a
shared file position is an unpredictable offset, which is already the
case for any caller that shares an fd without synchronizing. prev_pos
only steers readahead.

Mark the accesses with data_race(). Locking f_pos in sendfile would
change behavior for no gain.

Reported-by: syzbot+399510418a0b0cf1fc29@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=399510418a0b0cf1fc29
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced in QEMU with the syzbot C repro on a KCSAN build of
cfec639c844f: 42 and 43 reports over two boots, covering all three
pairs above. With this patch there are none for those pairs over four
boots. The remaining reports are lseek/lseek between the repro's own
threads (a different pair) and an unrelated ps2 race.

I used data_race() rather than taking f_pos_lock, which would change
sendfile behavior. Happy to respin if you prefer locking.

No Fixes tag: the race predates the history I can bisect.
 fs/read_write.c | 11 +++++++----
 mm/filemap.c    |  3 ++-
 mm/shmem.c      |  3 ++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index e8c14e2760b2..ca2916472e7d 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1319,7 +1319,8 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 	if (!(fd_file(in)->f_mode & FMODE_READ))
 		return -EBADF;
 	if (!ppos) {
-		pos = fd_file(in)->f_pos;
+		/* f_pos is not locked here; racing updates are benign */
+		pos = data_race(fd_file(in)->f_pos);
 	} else {
 		pos = *ppos;
 		if (!(fd_file(in)->f_mode & FMODE_PREAD))
@@ -1341,7 +1342,8 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 		return -EBADF;
 	in_inode = file_inode(fd_file(in));
 	out_inode = file_inode(fd_file(out));
-	out_pos = fd_file(out)->f_pos;
+	/* see above */
+	out_pos = data_race(fd_file(out)->f_pos);
 
 	if (!max)
 		max = min(in_inode->i_sb->s_maxbytes, out_inode->i_sb->s_maxbytes);
@@ -1382,11 +1384,12 @@ static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 		add_wchar(current, retval);
 		fsnotify_access(fd_file(in));
 		fsnotify_modify(fd_file(out));
-		fd_file(out)->f_pos = out_pos;
+		/* see above */
+		data_race(fd_file(out)->f_pos = out_pos);
 		if (ppos)
 			*ppos = pos;
 		else
-			fd_file(in)->f_pos = pos;
+			data_race(fd_file(in)->f_pos = pos); /* see above */
 	}
 
 	inc_syscr(current);
diff --git a/mm/filemap.c b/mm/filemap.c
index 00fd89cf6f55..d5a4a5ead4e2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3146,7 +3146,8 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
 			len -= n;
 			total_spliced += n;
 			*ppos += n;
-			in->f_ra.prev_pos = *ppos;
+			/* readahead hint, racy updates are benign */
+			data_race(in->f_ra.prev_pos = *ppos);
 			if (pipe_is_full(pipe))
 				goto out;
 		}
diff --git a/mm/shmem.c b/mm/shmem.c
index 897fa2b61346..56fa2bc520ed 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3586,7 +3586,8 @@ static ssize_t shmem_file_splice_read(struct file *in, loff_t *ppos,
 		len -= n;
 		total_spliced += n;
 		*ppos += n;
-		in->f_ra.prev_pos = *ppos;
+		/* readahead hint, racy updates are benign */
+		data_race(in->f_ra.prev_pos = *ppos);
 		if (pipe_is_full(pipe))
 			break;
 
-- 
2.43.0


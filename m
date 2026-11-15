Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735304;
	b=LIR9w9y1DN3QyRa6VE9KncY7580JG/WxZM6x9AasatOXDBWTeEi+Fy2NhScBoXE/eyBI
	 aGqjYzkL8kU/3D8hv7rcUQDKNzhxEAXEOHzSx2io/IpNLYdLmcnoZxISPuLDSkKWUI/fY
	 qXxUX2K9la1iQ2wom8wkBgUyXVHriZT9UtBvjZWZTAmzI6erm2316whjypoVUslnEgJah
	 HCdH4KY1ZlO1XR+5xeM7RTLDEAmRFkAeV6j4mV2OX4Z4JrZDrwJp/bQwGg/6vZBGmrb8H
	 n2avThlKEmLluUzDB3uChb/4Y7h+ZgWDbGHPnYxuJoG8ykviU5zjsb8Ko8k3YdU+9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8qOsEVx0lNcqncRsI92WD8XITRb8ty6XS3PW5jLkLOA=;
	b=uchDzKgo605ZLluAyn105DygP8KkCzF5KV/Unf7eKp6dN6W4N1kdkhxHNhQRB/p+WsYF
	 /mKsoOX1V/rF/Vx1sLC5GRvZpfMxeVCWFznQgmSTzdcveA0iY6XTjud5cdju7Qrcb2gW/
	 Fnt7DqWGU13gx4YZeGy0TxcM5V1soPkdH6+WHJLAxoKcnZ8o1ybFrkwxucC99OYR3rF8P
	 rrVdjoXraACsUS+lSCgRIdLiwaGUuYvh4TvbwPhNHuUZixChLorvWKtgSRE2s1oiG5vJQ
	 ZGxxDmS5ETXHImWIhyPbdi3OAkaN7bOd+O5Xkzz5XQJP1miXo/HXe5CkpphkWsQDcFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OH9Ha2/i";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B629606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B629606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OH9Ha2/i
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so3563125c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735303; x=1795340103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qOsEVx0lNcqncRsI92WD8XITRb8ty6XS3PW5jLkLOA=;
        b=OH9Ha2/imUV/OnHLqHUoaeryW5odeCWmwi9sYyHkCX6FHUC+26UCLGHFvTIdIUdwiR
         BOf1LrbfYSQUP1q4zV9KJT/EdnOl3/bHokfdLXU5n7VJjk+CvZJ1pk8yTd+Qdz4iGROl
         Wg4xRNR8JEimOQxpFrHk+XwmhANCXtH+zNDEAQ2bWB6kwIOnPkdU8iITQPeCqlcFLJ6r
         BpMBeO7lTVJsutserfG4onnRJb/43I6pB7akUYt07GY3SNNTKq+ruGE5G05PvpanWIFZ
         tjmVtqr03c3z28AIfFSE7274GFiTY3oh0NNPml3SF4GiYieyId6+jfNTmKeyToOAXpRz
         RdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735303; x=1795340103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qOsEVx0lNcqncRsI92WD8XITRb8ty6XS3PW5jLkLOA=;
        b=YXGPjBS1D1kQeAKFn6D5vkmIGfWLylrseMHG60R2a/9Q5Q/VUyXwsve9roVSiAuXNr
         rLzdYlULN3HkjtLlcxWbES/nk/BpinZqB93wYVVwyKtlRuNoZaxrLvQzlpEOfvd8Y6hE
         nK/bm88T9SrbNc1kW5xm8mCm7JJIw3gEsZRHHs3s92Xtshw9IH47sGNq+UvB6vFfq1OC
         IGz/Nhg1kQVIK8p5fw/t5LVmx/r8gZb+gFybDj0IJLy5vgYe4bVYC/kPv6VGokjqI5iy
         mEI9haVVZa3710dBMOQDgo87jtO5klSk8nNqZAMLmdxvkumC0k7Km5M3DzzcBPz/+6Gj
         a8/A==
X-Forwarded-Encrypted: i=1; AL+hErEtjt9aZ+jm8NVX8/kYkpgVobC+9HlOkaNhs0FMar4cdq6PZ5kRo//5RTcScFnOcVdN5YW6pJaTYght5/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sVMn2HpBPtuu3fkLyT1BDLIFaQn/m88wNoL6htDjuTz7dF4Fc
	f1htjQ5X/+S+OhOvLyh/N3kB8dnyDbvWMfq43JbZvmKP4GPWyxBGDgbS
X-Gm-Gg: AYBFou0m/UtmdygbN9HL9Qg4p6i4/9VhtpAoO/rL1+SxPXXNhvZBXMwpuagUVoCAuIx
	b0F0tNndMzZPLhFlU3JtXXCmRolgXWKnFKv66El8aC1aST+eE9KFv5yuxJEkYfOChEAbxVRt8BD
	wDJHdo/PevePC5z2PbVn7w6DQLaPKc5TNuIQdNaWDuXQI5SDaMgrZa42V1x+NILZINc0tA4VViF
	pyWp8ygD8vOJJWkPWgtdcPFiVvB1vzwLNxS84ED5jRntDQhanRvjSUAG4yUJ41cmLneaZkD3ZzL
	mygBdaNASIFxbE4xD/00GkQhTblWn7JQZVcHxjKxUr2H3lcYoj08EEEhCUvxxbGLCVQGU1kA3mT
	+wyB7WmOUL/a1/lUC7rBBt7rFn7btNWjkdT/gPlr3AecsdnjUHQ2/YoKKZ7wPRV1SAJIaYW7T4b
	QqFc1tK8x8RUKclqew2Qn317bMezqJW+MpOOZB6juzOum5n7kCvedk0Ma2wdvF3hVTPspDhT3t5
	B3IEQOVRo6NabWv804ioaAtxb/lX3iZ4AUmHWGa+3m03QlnVrgI+i36B9Fdcf2N4zu1YBvOjMdV
	iQqBqPAjSR6MLafQJGpVFKToH2BxIFLTKojNPvcxFsGoOY8sNTiwZE5ofp+Sag7aC31kPmBLFEa
	p0ck5dGieYGbTUvvD+DzpZSy9esQQ
X-Received: by 2002:a05:7300:c01c:20b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-37967dd6078mr7137823eec.30.1794735302432;
        Sun, 15 Nov 2026 01:35:02 -0800 (PST)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm26298603eec.24.2026.11.15.01.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:35:01 -0800 (PST)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Seongjae Jeong <jsjlee1020@gmail.com>,
	stable@kernel.org
Subject: [PATCH] f2fs: fix to use atomic write for strict fsync on the inode update path
Date: Sun, 15 Nov 2026 09:34:13 +0000
Message-ID: <20261115093413.118399-1-jsjlee1020@gmail.com>
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

In strict fsync mode, f2fs_do_sync_file() uses atomic node writes
for OPU to preserve ordering between data and node writes and
prevent data corruption after a sudden power loss.

When an inode update is needed, f2fs_do_sync_file() calls
f2fs_write_inode() and jumps to go_write, bypassing the check that
sets atomic. This can lead to non-atomic node writes even after an OPU
in strict fsync mode.

Move the OPU and strict fsync checks before the inode update branch
so that atomic mode is enabled before the jump to go_write.

Cc: stable@kernel.org
Fixes: 278799151646 ("f2fs: fix to force keeping write barrier for strict fsync mode")
Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/file.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05061254c3b2..3b51d84177e0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -372,6 +372,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	int ret = 0;
 	enum cp_reason_type cp_reason = 0;
 	unsigned int seq_id = 0;
+	bool has_append;
 
 	if (unlikely(f2fs_readonly(inode->i_sb)))
 		return 0;
@@ -392,6 +393,21 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 		return ret;
 	}
 
+	has_append = is_inode_flag_set(inode, FI_APPEND_WRITE) ||
+		     f2fs_exist_written_data(sbi, ino, APPEND_INO);
+
+	/*
+	 * for OPU case, during fsync(), node can be persisted before
+	 * data when lower device doesn't support write barrier, result
+	 * in data corruption after SPO.
+	 * So for strict fsync mode, force to use atomic write semantics
+	 * to keep write order in between data/node and last node to
+	 * avoid potential data corruption.
+	 */
+	if (!atomic && has_append &&
+	    F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
+		atomic = true;
+
 	/* if the inode is dirty, let's recover all the time */
 	if (!f2fs_skip_inode_update(inode, datasync)) {
 		f2fs_write_inode(inode, NULL);
@@ -401,8 +417,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	/*
 	 * if there is no written data, don't waste time to write recovery info.
 	 */
-	if (!is_inode_flag_set(inode, FI_APPEND_WRITE) &&
-			!f2fs_exist_written_data(sbi, ino, APPEND_INO)) {
+	if (!has_append) {
 
 		/* it may call write_inode just prior to fsync */
 		if (need_inode_page_update(sbi, ino))
@@ -412,18 +427,6 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 				f2fs_exist_written_data(sbi, ino, UPDATE_INO))
 			goto flush_out;
 		goto out;
-	} else {
-		/*
-		 * for OPU case, during fsync(), node can be persisted before
-		 * data when lower device doesn't support write barrier, result
-		 * in data corruption after SPO.
-		 * So for strict fsync mode, force to use atomic write semantics
-		 * to keep write order in between data/node and last node to
-		 * avoid potential data corruption.
-		 */
-		if (F2FS_OPTION(sbi).fsync_mode ==
-				FSYNC_MODE_STRICT && !atomic)
-			atomic = true;
 	}
 go_write:
 	/*
-- 
2.53.0


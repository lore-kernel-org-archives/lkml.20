Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364ED445AFA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521075; cv=none; b=LcRRx7gXuZkV+xuTg5xuyTHgKG3tycp1VZIUkbdS375h5aVEF6+GrbMPsNtalXFspBNPOGlJk7c79HrIddPLul/VATEM1sSySmWU5qVIDbCV3xw0ZSJrFwfflHpK/5fK+0mgoeWsODv+v1oarFF0d72zlT6jn8YFjO/4U/QjhyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521075; c=relaxed/simple;
	bh=mTEsa+wnW8JxspbUbddTGRiVvEnMnjzNQWfCNFCnCfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DuP5skGj8yLmsQCD+gmSEed6mC52WzkvP4icA82WikbvUt89Iq4fC52QJejLhQ6/DgJlmOHvJgLleqUHHNCnOcNjTeVQILhFjaoLnJha37VZkS7IECkJfVBLoGAqbaKK5kbOpGfxNRfeprgGDMEGgigtrRIH948erZBRgzZ8Tys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjdWkY4a; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjdWkY4a"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9aea40d799so594659a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521073; x=1789125873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wExxqxYMMDmKusQmYDv/felazU5hgbFnEoDaQ9pzTlI=;
        b=NjdWkY4am5tUEncS9j3H178Z0UUf0DhOHS1y7EFT3fA7kaiYqF5KfDPRa+6AI8JU4A
         uFeqvK8LuskQ6c4vfzZVV3KMEXHpgy780tJHw9Zv+uywGKsMWAFix0x4FeQN5JWGegnM
         cHnCWLjZcpSC4848Ef4D/p2huGkCcjh3mpByw7IKUsiDWQhc+kZGrK8HNVrEXXKiZxyL
         fJgMTwj1z2bfQpxwXs3JoDkNjpXbgDkEomrWKDDSdpzls8XVKG+ju/PwNJkMcjF45DXJ
         cLAY4893A5V4v9rTNOzQZm1XbtXKmySOhbVivz7vTgu00EcVTPsxFP+z7rjhlBkfxwxI
         06QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521073; x=1789125873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wExxqxYMMDmKusQmYDv/felazU5hgbFnEoDaQ9pzTlI=;
        b=rpdlFCuENkFPmhV0Yqmpv1V2UHhPIkPCaTRixnDQ6vOpDt0bIb5YQdc3WH75iTk3YK
         ME39xB+T02GMSQIHE6Rddwf/gHp0O2pbCdtfh/QVtKQkY4hPapRXGJatbtZYA5dvGxqe
         bs8cFREO6logPB3WVSrTNd/S/BukGPym1S/MPEpB1nVwPjdUjJ+cSUQBaGDnYu/MRQyS
         xTyW+HEJmlvZqDcLo6VrxlsQUdDk0JaTFXIdOD7Vyld9wcrM2x3U7t2GSXxMi+l2A+//
         zijH+1uYFwVyFYQHG4i/B90qQB6z/ZF6Uc1aAmj3k/PamrMJPRznEx9KgCtaQQ2kc9C8
         koKw==
X-Gm-Message-State: AFuF++kzlfqdwGcOcWd9XDyocwGaK4grVZUb9hxRnKFtj8vLV9KE4TDg
	85Voj99iZ8bgWYutoFDg/DkMYzJT3zBMAC4pfH/+g0uwgjQKGJpiFIJJ
X-Gm-Gg: AYBFou1s1Me06rpcaZEt8jUazjxF/tCFG3YZNuA3QcQM43uXxUmxvuf3hB90HUZrPfK
	SPTIOMqHFN4s0Z/Rxa6QT9kXC9xAZOPNAK9/kr3OyJnebpVsEo9Jdr0zzivW4nniY42WlnlIegd
	UlrgZROh2K4xhl7UeSRHJAhT+LoLYNOsPNxkHEhpSUbx12gDiWhbSIy3iVgOBbxN9ymw3+mzVqn
	5BiK6KeG0gQ1FU154/k/kHMG4DYdJ5fn+f33jQzZ22A+Kqj+o1n4Ti4DOjKfZIanr/Mp/RM430U
	wyvJ4LvRLaRtXDbr41hLFsNu8a0SyOMPQCkzKzZA0hIQ9jIU90UhKMnXmU53jKB1TQGyhLZy8NO
	4iO8JVu5uMUeMCRPEZxV7tVWa2HQ5puFL9kgjoQcGJv+qlltfqiyD8VI6dcUMuwNTtpgQBZl1fI
	HuXHRsA6dATJgdFvpxLeg4mcsXDjnTY3uqF1Z7IOMUSebmUmWG+k+kP4QwFv0/GC1oCRd/fK1oc
	mfiJn2hD87R5xT3vC9TJ3xwaGBjqwfmdCF19g==
X-Received: by 2002:a17:90b:2c87:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-39b26191cf2mr8362233a91.9.1788521073173;
        Fri, 04 Sep 2026 04:24:33 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm6683658eec.21.2026.09.04.04.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:24:32 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	gfs2@lists.linux.dev
Subject: [PATCH] gfs2: fix typos in comments
Date: Fri,  4 Sep 2026 16:54:27 +0530
Message-ID: <20260904112429.39814-1-hemanth.selam@gmail.com>
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
 fs/gfs2/bmap.c     | 2 +-
 fs/gfs2/lock_dlm.c | 4 ++--
 fs/gfs2/recovery.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 73c626971163..8c734450c998 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1212,7 +1212,7 @@ const struct iomap_ops gfs2_iomap_ops = {
  * @inode: The inode
  * @lblock: The logical block number
  * @bh_map: The bh to be mapped
- * @create: True if its ok to alloc blocks to satify the request
+ * @create: True if its ok to alloc blocks to satisfy the request
  *
  * The size of the requested mapping is defined in bh_map->b_size.
  *
diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index cef4bdee92a8..47eec0c13025 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -431,7 +431,7 @@ static void gdlm_cancel(struct gfs2_glock *gl)
  * 10. gfs2_control sets control_lock lvb = new gen + bits for failed jids
  * 12. gfs2_recover does journal recoveries for failed jids identified above
  * 14. gfs2_control clears control_lock lvb bits for recovered jids
- * 15. gfs2_control checks if recover_block == recover_start (step 3 occured
+ * 15. gfs2_control checks if recover_block == recover_start (step 3 occurred
  *     again) then do nothing, otherwise if recover_start > recover_block
  *     then clear BLOCK_LOCKS.
  *
@@ -809,7 +809,7 @@ static void gfs2_control_func(struct work_struct *work)
 
 	/*
 	 * No more jid bits set in lvb, all recovery is done, unblock locks
-	 * (unless a new recover_prep callback has occured blocking locks
+	 * (unless a new recover_prep callback has occurred blocking locks
 	 * again while working above)
 	 */
 
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 616c46aa3434..27777497677f 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -155,7 +155,7 @@ int __get_log_header(struct gfs2_sbd *sdp, const struct gfs2_log_header *lh,
  * @blk: the block to look at
  * @head: the log header to return
  *
- * Read the log header for a given segement in a given journal.  Do a few
+ * Read the log header for a given segment in a given journal.  Do a few
  * sanity checks on it.
  *
  * Returns: 0 on success,
-- 
2.48.1


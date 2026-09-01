Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FAC38D6A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271738; cv=none; b=Tg53nFPwmKZPS/3M8VaQAJO+w4W80yw79NHmrooY2IHO7Jn0EnLfwZ71jV5T7bKwC2YUXVvJB71imnY3/rWAG0pxwihL1x71XFsQPilXFKoOUjlaEVY/tyPJuld/v1+XqoDg7ADNFZh+R6K5I9ckFgGlPR8sJBNEDdZOyThasqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271738; c=relaxed/simple;
	bh=R9jw5+yED1oqu+yhdh6AtJxL116VZPYEHyhNMu+jin4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHJA6guycHBFadvobB51/8uzDLZSnzCNIhdyj/zUc4iUsJKEg9djv+CcXtnElXVKQZsUSw4zPt9DEX+Va9LRh7GSIbm4FtTCuxHIfIDdJ3nsPRL1C42+jvL/5muKtvjvsEheVJWQReIC4GAf5zM661/rKc61L7MVqlGoiOfT+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFjRyHMR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFjRyHMR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so3065340b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271737; x=1788876537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+0LONJ4G1sroaO33U1ZGH+R6K9EfmZf2pk20ljy1Ss=;
        b=PFjRyHMRPaTKzxhOxrUOKLQY7xltsC97RXqJKse/Jqog5Q4Q92wJdo5xq1gZVauz7S
         Hp0QHR0pc9ckzdNzELSPiBFtnQuKdLnbzRb7+jGDNsjInn9JyGxwnsJLkfI6Zai30pb4
         nIkbMalRNKXnoo4RIHEdJHUkS9LNoirCyaKAnzgXiNCmHeMFjIoZeb9qPorpByAMszn7
         Y/Cux5Kw1qPp8ocNIiWlZyk/NOItDB06EqTRuhBuWcmLSzD8QpTNCHVqDuS4nQBOmuKO
         ZhvUj2RQhsQcV/aWtMS/y7r/QTVTW5gv2JRo/b320PdVE2PhAXnLTLKFWX4NsiX0w1RX
         qcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271737; x=1788876537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+0LONJ4G1sroaO33U1ZGH+R6K9EfmZf2pk20ljy1Ss=;
        b=HnqHPBi08NmM43uC+9frVM6dQmeoSs6QzlqZBi5q+MBKrgLA/xYOW06fvLVI9qkQKz
         aIOKnZfQbGnvroOLh0/Gamtsp9MciD80EtSJ6is6pKJzfKHddLlr8AEHQ0AQU1NUKyNh
         K6kK+BuHemAhR7bstNx5rlDdak2qabpHvi2yVAcnRxqJM5npllBQt4lBj3LuzCJ5A+WD
         Rsra5ZnR3J2+Vr4qx+q25g9smb7q8XeLr/R4c2mAKLJa5t1wdOejtXKSs9/Kvfi44Abf
         5IVQBQdO9NalwAXkG/CNI4Oi47P88WMxY3J8HQhqC6Lh4eScnYt22gc+Fji/7AEhSYkP
         tRCA==
X-Forwarded-Encrypted: i=1; AHgh+RosSIeYEMNWZ3SXndjnMq1WXatZbMe0CDa21krtN4+8SygXvqe5Wps6kJXhqrmE4vxNZLLNAmzfW0uNICU=@vger.kernel.org
X-Gm-Message-State: AFuF++kAdBjntg0iGQRHNoL5+3DTDTMovZW5FHENfInie9h21W6E3ok6
	RGIqNpCdHB+IlvBZImn7xHAgwN4XTBE2EiNClJjByJp7b8GMgB3b5xoc
X-Gm-Gg: AR+sD13Udi3Hlnua3zpIgoufBHAoi4fcwlHaSqV4138MdbgkywDA+AoTb4vlQnEoNyy
	21BdUGrXNL5N6/BgX4u7rtJArTFFBG7Ce6FwlR8Ng1gKLMym6ASR5fv+X0vexZqJJ6T2Df+gpbX
	PsdnpkQhiQ4QzOfFsnoSDkIa7oaG73sYqADy/h5QR+oFxbK8MY6+rpYV6/8L3Z9UoIEVXnBtWdx
	3Glj55nqFhXrtTudl8XqjadGA60vQs3KxHJ3HSZb/nB8MMr9GqoLuPo2rhp84ZCmOiyxMayG9Hv
	B/R4Q39/r+kyRH/9wKIc/k2cItCt4nDGtj1zdPr2KjFEODy/Nws4/8jRP7vZQNmIYVc7hYnt3CT
	ZEXZmm/qSxL1et5wjDklmHfREMYUxZ1+aZZ7qlh+RsPoY7kZpDqvNyKulJ+3RE/zpGlALkGBJs2
	6WcPS1r837iT9+VKgBUbBVJVE6yQeUbXuef6y4Hod/kUepqUE03uEOtqyhgbILAi0M4dThpr+Sp
	friylPE958SMwl0PfV1eagp
X-Received: by 2002:a05:6a20:2d2c:b0:3d1:39e9:b261 with SMTP id adf61e73a8af0-3d7aacd026bmr13822515637.0.1788271736523;
        Tue, 01 Sep 2026 07:08:56 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36ac729sm6364551a12.17.2026.09.01.07.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:08:55 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v2] f2fs: wait for inode record work before clearing ino bitmaps
Date: Tue,  1 Sep 2026 22:08:49 +0800
Message-ID: <20260901140849.3405971-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

APPEND/UPDATE inode state recording was moved to the inode eviction
workqueue. These entries were later converted to bitmap values stored in
XArrays, but the workqueue drain was left behind in the list cleanup loop
where it is now a no-op.

During unmount, inode eviction work can therefore remain queued when
f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
repopulate them before the workqueue is finally destroyed, leaking newly
allocated XArray nodes when the F2FS superblock is freed.

Wait for APPEND/UPDATE inode record work before destroying each bitmap
XArray, restoring the required ordering.

Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
v2:
- Remove the no-op wait from the ORPHAN/FLUSH cleanup loop.
- Wait once before bitmap XArray cleanup since APPEND/UPDATE share evict_wq.

 fs/f2fs/checkpoint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4b59f30ef45d5..642a771e0f63c 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -887,8 +887,6 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
 	for (i = all ? ORPHAN_INO : FLUSH_INO; i <= FLUSH_INO; i++) {
 		struct inode_management *im = &sbi->im[i];
 
-		f2fs_wait_for_inode_record(sbi, i);
-
 		spin_lock(&im->ino_lock);
 		list_for_each_entry_safe(e, tmp, &im->ino_list, list) {
 			list_del(&e->list);
@@ -899,6 +897,8 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
 		spin_unlock(&im->ino_lock);
 	}
 
+	f2fs_wait_for_inode_record(sbi, APPEND_INO);
+
 	for (i = APPEND_INO; i < MAX_INO_ENTRY; i++) {
 		struct inode_management *im = &sbi->im[i];
 
-- 
2.43.0

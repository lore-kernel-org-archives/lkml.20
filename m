Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63140A92F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339980; cv=none; b=Xl6UAVRoFQC3YFDAsrQU+JCX5O4g/1GEFXUbkcK3VT8r8/30LqxxhgHUu3+Ng6+IzDkKo0ZHMwOmbbKQlNxrkbGXcTJrZ2R7VmbLo0EyI9Zrclf1p7cBqF9HZbJSMdvamt/ADXeV4fm0ByfnQXuCzGWvINn/jzPLHAxdciUWEBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339980; c=relaxed/simple;
	bh=NzlKhzcvk9/WSKLs3Pn3VsTgaEOU26c//hMU7M9NsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgyjVp4sCXArMYiI3GgCMJzMT/1BlRE1uZgramL1hKz5TaVupqV3u0uicrxAtGkMS+YCy4JIKlOCjb7of6RUNG8GD2kOJ0PUsGtmIawzROjDEVV8++kGzGCVykoyp+uImkN8fr/Tk0SkuslJQxvVJN7lG8ZBdXJD8LTq+D5lQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIfzZ35x; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIfzZ35x"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so655527a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788339978; x=1788944778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=taNa6B3EmauuyVm4ZB81pFrGCPMICbTOjcQ4EwXiQVE=;
        b=pIfzZ35xnfnbRvqpJGPbbGes0jfZWq5AN2HiC7azXl6lv78tNPdIt84hoIGqJdTYWF
         /s7fVsoyr0wHn83MPYFb1JMOUcRVe/QkVXHIPQOTvVQ/OLNZ7Okbt8FScbKr1xupH2vG
         tt86ELI/CnRSUO2TlB/gOvZTQqeyqEQ5+0+t173rMbluNCeRkpZ2iZLfzEyRC1+Kttue
         NojExTV5E5n7icHgd9dQISd/wCdwTs2eye2Amt7LHtdO7wKXpqxWaFj52qniOlh7kNa9
         W8DyUu8M1sj3VDJJpz4SrtN2D+Y6r+HbPTgtWoDrohv6B8ert6aWDUHub10L88daqsCo
         x8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339978; x=1788944778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taNa6B3EmauuyVm4ZB81pFrGCPMICbTOjcQ4EwXiQVE=;
        b=A4vZl/opZGbjc42Y7vphMnn78wRvfzl4dGGcbzpkitX2d0Vel6WrQCgf1bhzhUUnCM
         vm6V82+kGx142PimxEt2y5CdfJaOWb+PT2Ai6QHMAv3gMbo2gsm3kY52T2FKJUUT/HW9
         aizNI96zFT8egJHOpuAGzx2kda7tEb+V7JL3CwvCTWtuK8Hl0WJO3W5z59E12vlyjZQh
         /nhyGj4/0YLdue0dfwXQpjAfbJ8fNzXN8TfHn13jkxuQpwaTvezyChwu+yibVBiIf+WP
         WqJeSZ1jbCThLmS/jYsZmHnIUd9iJt5KXXHwE/rKn8XmWRIvS0iHR4AgsY0YaT700zdO
         1PJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9AoQV4t/da74zO474TvvA/8Er4X9burPpIz4k7t5baqM2ZN3Q6nveYOpdQA+ZObjNe1hAhtpTm3Onf74=@vger.kernel.org
X-Gm-Message-State: AFuF++khAAmnylanVmEIOOraOfmdFjEbozfYEspUzJHk+DvVdd1iVxO1
	z5BsNv0dgXNIY5tScKyjh27Y8k5FSQI1clIjvnMKGgATqPSefjoJ7Wrr
X-Gm-Gg: AYBFou3VMKEQ4x3FncrRxGCVcFlg48KknbQD0G7Si+54T+vraeeREp2FKoqMOIxEzjA
	WUkUOkS4q4zH5BPiAyX6a4c8UaGjwW6hGZhqL0+ha9xk4LcuLNF3oV724Wfrag+pUR3qSqRRDm+
	P6H7DUm8QJB3RvK847Wlls4cj7J8/k0pmqlsiBT5W9e5UCVOo+p7qMrMtw6AyrTmfzusaAdW6E6
	oiG4kP7HLnywpdG2enhCA6G+ibpDNviOooaKKiQEwBWB+mmBq48C34jRX+ZDT8BXxsPBhmJbSEr
	MoPKv5yIgZWQHdQiOPFh7FcQXSDQSc8pIyHoBt72hSS435Yp+pAakwo8uuOZBHdPYDubEa9swDw
	NlDxeAJ8febLunwtSligiWVNBUAXTTktW9wRgiiyWD3MQAfv8+xlmD0G1kSnsdc3f6PAOhIigAK
	hipkxqN+QEWr/IZWPX1d4vdH3OpzjXMyO+mlCDb2pJKxxQsOsRS3g2RhpBkfJ3kQud/UeKXdI4+
	AQ7TdBaINSOryTw93rrGY9TOW+3Ffkvnz8=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr5257955a91.14.1788339978481;
        Wed, 02 Sep 2026 02:06:18 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae380d0bdsm4373589a91.11.2026.09.02.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:06:17 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v3] f2fs: wait for inode record work before clearing ino bitmaps
Date: Wed,  2 Sep 2026 17:06:11 +0800
Message-ID: <20260902090611.564876-1-qiwenjie@xiaomi.com>
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
v3:
- Call flush_workqueue() directly, remove the obsolete helper, and retain
  a comment explaining the APPEND/UPDATE state-record wait.

 fs/f2fs/checkpoint.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 4b59f30ef45d5..cf88b463fde51 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -825,15 +825,6 @@ static void __clear_ino_bitmap(struct f2fs_sb_info *sbi, nid_t ino, int type)
 	spin_unlock(&im->ino_lock);
 }
 
-static void f2fs_wait_for_inode_record(struct f2fs_sb_info *sbi, int mode)
-{
-	if (mode != APPEND_INO && mode != UPDATE_INO)
-		return;
-
-	/* Let's wait for some pending updates for APPEND_INO and UPDATE_INO. */
-	flush_workqueue(sbi->evict_wq);
-}
-
 static void __f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
 					unsigned int devidx, int type)
 {
@@ -887,8 +878,6 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
 	for (i = all ? ORPHAN_INO : FLUSH_INO; i <= FLUSH_INO; i++) {
 		struct inode_management *im = &sbi->im[i];
 
-		f2fs_wait_for_inode_record(sbi, i);
-
 		spin_lock(&im->ino_lock);
 		list_for_each_entry_safe(e, tmp, &im->ino_list, list) {
 			list_del(&e->list);
@@ -899,6 +888,9 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
 		spin_unlock(&im->ino_lock);
 	}
 
+	/* Wait for pending APPEND/UPDATE inode state updates. */
+	flush_workqueue(sbi->evict_wq);
+
 	for (i = APPEND_INO; i < MAX_INO_ENTRY; i++) {
 		struct inode_management *im = &sbi->im[i];
 
-- 
2.43.0


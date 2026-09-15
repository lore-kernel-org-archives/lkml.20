Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D8A34676F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436315; cv=none; b=q2TQRPLWV0/E11qIX82QEvCDaKyDjxgXD84z3NffUtuNzbo2P+rUw+RvuAjVJHFvb9NSlFgP3oToRWtUgwtU9tKGHTUxqzdE0CXh1pYezJ3JuFmQ0dVFwHVCb7wfN3T3IE9UkYbsI5geGQNJmuQfgZpkNdxp6jpJP2idO93CcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436315; c=relaxed/simple;
	bh=OYPwEzIwiGt/ZTffibNRUfnNb5BHgXyZfKhBGJTD4lE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QjjxGDva9EswAHdKu8pXjzpeFxmBKiNc4Qr9gzsFJUnXZYNIHXHvLqqB9jQlHF5X9q4uKkYVxcCEqIVBlmC+JUF0djMKcJW3F51QghhMS9bz4PhAH3L1UPhkqqnUZ+0blafJ8QOMODbo1AnYCRUHp74XO+QbhaCkGlxO92kGdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so4679431eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436313; x=1790041113;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7MpkYnDZncdX42AkUQsCi+nS/mOeknbxn1IPtAp3x0M=;
        b=zYethn2wpCSZohsLuXwuKXs8Rom5NrKc+zuTTT6H6TxGb6vb/T4ivbHMeNImzR6oyg
         5h3Q9v4aYNm3zNqElE4uZkeafMYRZJu8wP+x2PEU1vSCETdlI3izJ6CVg1MLObBQVKFx
         ejeWF/zINJABPiHYsDmo3zIYiVTZgkqRuebaXWlkCm6qtBCYn4qnAiZ3z8NEnNAQDVZ3
         Yb6FGSCrZPC4bU4GDjr9WMwFUb3e25nuULNZfKRbV079MgttS1Gm8hZR1OJvXkDPv+Vj
         L03tMw99AkOuy75KLj9xTMWFtga64/Ja/Fb80NcWMfEWCeX+Sgiz0tjZdFlllRsbi7F0
         i64w==
X-Gm-Message-State: AFuF++lRQKaUQUZmGpwwtt3/etMkf7HRbsafmcoBG5u4L4P0tTslgHsv
	WSkSj3ARGtHQqt9WaXFHUiHSsEa/+av1Xmeny1wEK5rJKJBkF7J55oJMqhA5w68T0oAGvqwyjXF
	MUN5Ix7qkLQdrVDeWMzqFt8xYsoZjLa6CKsy8vUfN35jpfQ9kjvTxgHoNe4k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4d09:b0:6b1:858:28a9 with SMTP id
 006d021491bc7-6c53f44bbd4mr2876597eaf.9.1789436312816; Mon, 14 Sep 2026
 18:38:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:32 -0700
In-Reply-To: <6a9b44e0.a5e650b3.363816.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a198.a211d2ce.1a5198.029f.GAE@google.com>
Subject: Forwarded: [PATCH] BUG: sleeping function called from invalid context
 in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] BUG: sleeping function called from invalid context in null_insert_page
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 6beb1f5b7..e22e79b02 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1861,8 +1861,15 @@ static int null_init_global_tag_set(void)
 		tag_set.flags |= BLK_MQ_F_NO_SCHED_BY_DEFAULT;
 	if (g_shared_tag_bitmap)
 		tag_set.flags |= BLK_MQ_F_TAG_HCTX_SHARED;
-	if (g_blocking)
-		tag_set.flags |= BLK_MQ_F_BLOCKING;
+	/*
+	 * Shared tag sets can be used by memory-backed devices, which may
+	 * sleep in ->queue_rq() while allocating a page.  The flag cannot be
+	 * changed after the tag set is allocated, so always mark shared tag
+	 * sets as blocking.  blk-mq will then use an SRCU read lock instead
+	 * of an RCU read lock around dispatch and the allocation is allowed
+	 * to sleep.
+	 */
+	tag_set.flags |= BLK_MQ_F_BLOCKING;
 
 	error = null_init_tag_set(&tag_set, g_poll_queues);
 	if (error)

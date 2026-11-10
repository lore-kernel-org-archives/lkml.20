Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316888;
	b=ggjwA6KT5VbZhYkRTdyG/no4ky6es7FMaAqW3gakwFVbvyin1jdIlJWu+zGBF44XDmqJ
	 Mz1Hw3GS0W7UfcluWDe+C+ONdvXC50YRYA691m5hIWDtGG935BnUZPn51nGjjKfVoBKdq
	 YbVBMwYbLHzjszz1kAblCx2oW84VvWCij+Bo86qMmXEHcz0vFGBKyLYFrfZKHGJWgOTW4
	 4VH7Pj3rHbH5B9NTmS7dmCA2kQrQrgJ31e7UwfLdXpW4rtb+WJEyGx9RX5KxfM2ShjvCJ
	 BwFmY85Zz9k3C8aXwtQq4ocrnYBsjI/rJtdzUgJojA6+6t+Ry8rbtK9/pv98FiNp7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3tWiq7aHA+IGdy3MoPePq5JolrdZPCWKlrUl1uu+r1E=;
	b=ODib2Q1lyDQk0Edh/Ha+6wTyv/JNXph6nE3gPhR7QMpvBe+tdMBu3gP5XxeBp4+do2C5
	 Ymyl63ok/Itwd1JqV4BR9fVbS2icvnXeudGzSohlEbd4InIans2jYOBan9gah0WIzGyjD
	 FDdxBz+oRU1x0/kYuDdx76PoZpulcs1Z7kOSr9KrCuGIsU+jdUr98Lv9fku/n+F5d+xsh
	 CbwsZvkj6EvTcGSbfiG7MzgLm1LbxP5J2rBKFhOubujfKH0V1j1w66xnAqyDAKZKN7TCR
	 jOElEirL2rWZRJw6tgdi/WxOXiT7k/dxsu04PAxjLCgPK0tnYGutV7xFxs44XCfJrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yokdV/NT";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883E607B131
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A883E607B131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yokdV/NT
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1024080a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316887; x=1794921687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tWiq7aHA+IGdy3MoPePq5JolrdZPCWKlrUl1uu+r1E=;
        b=yokdV/NT+sxAcdfoZRwwYwindb7sUW6pJD/V0DWZnhBwloPOmxnLzXgD7wPPmWXmvh
         DidRq5OGwuFDtvdBtyZEyLy5bdNqZxkKMEjMuCdfyj9DylXTCjvalJcr93yLKYn6qmhF
         oJXItmr5I26wNNT2feuasYVd7w4QnY8Uq063Mwh9hHgn36dYAWPEO1NsX8DgNCnHXhMb
         gAvVsts8fK6jjiQac+GxZFOrm6Lq32Fdt4wwniOLHMkkkngHzVCilEJTpek0c23jGdDe
         bXaiHTSqSZAbiHpO7yNlZ225QggqnToREQQMsnmNnomLKr6B9qie0iXY0qTcSKJtCG8/
         bFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316887; x=1794921687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tWiq7aHA+IGdy3MoPePq5JolrdZPCWKlrUl1uu+r1E=;
        b=cGFplPv2wqh9eipjd8p8WKdG/daOek+oio8F4OD34zU10LhbEyDDgyuV/ga6q97kiQ
         vbyugy/eZq+10er/hOdTOvicaalxkcxdRQ65GNAc0e9DuD8iDf7dfBi1p19kDeJRuo2A
         ISRSCivORYqHx4GXTSjnwprdK+fPdspfjlqiOPNZih51ZHGYj7i4IysignGuJQjX0tdj
         rusF0NMBUczMFoh+dj6pqhPAL8bDA36JpAgcpCJJxSC2YvRQw7kDXIkOareoqsLUY7yh
         m3lgJSZxoM+CUJNmsP1KDjlCWg6Zwb72+o1JTP2M4WdHJB9KlQwwwkPICtheGiLjl0S5
         W9Eg==
X-Forwarded-Encrypted: i=1; AL+hErE2GunhoKGaZTt2+INGp3+sAoXNbWlzArcrzn7xWlvvF5ATNXrjyirlBAuxN/5lAj607KqCiSA8B/tZPd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uqnvbgT/wo13dXOQ9E0IZ8KCeq+aL0Dayu1jK2YUqJPQh9upJ
	nK9gpjAWTWfQOVpjszBq4IRLNEfGIXL1b8xBnBae9shYI79jmxousfVA
X-Gm-Gg: AYBFou3easTB1rGBT+IlHjBYFZAAw1RehRADXJxNsljMrwPAUCuNahwmWDK2QwOaSTW
	VTjakpzSj9gYCJ25aNXJpZqqOAkiUGAPy8fGrIMf+thEb8cfRWNgEY5iKhdVvRMO+eB4O8/D3x7
	+sa+pHjqm2q7qCmnMX88PDhtXSY0ArVFqi5fqOUcKfDqJ64C7GPIbUTNzFnLFwVCNAl60Ev/WJo
	R/vPqhzAXY74dTIPgQk8PdTE8x8zyc8a0HGzvfb8xnawJ5jIukMLqA3pwvDIRXpzZwddziZ5rw+
	K/IQvPIY0xD0Ufwa0DXZg0BWY5PyCcYBdyUx9XDPiS+WeRt3wpOm/3+akbkebdyWkpwLsDu3vdy
	BhliGdpKNezyGfF+xQfdtM+lXGNvytBAjBcqOdehJdW42MH7dswerfcF6Pe+smAT9c2RGibBSSa
	5lJsf0UJBnuW6o3H593H7Iph+AxYkjY3BqKB6hv5V7xreSx0rv4uVi1OiTBRs8zioGqGhf+cxdM
	36XS367x3Royz8B6peStXECvxrO2hmmr0RW5jp5PmZek+A0KsCazGk0xzIEPXsnzLszNOof+ijD
	Wm8HwyaU8eudpJAfv6WPg7Li7J5i24u7oFmALC1cc1Vm8VfYqdaq
X-Received: by 2002:a17:90b:574c:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3b166ce2b98mr2944296a91.53.1794316886911;
        Tue, 10 Nov 2026 05:21:26 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168eacb73sm1945635a91.1.2026.11.10.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:26 -0800 (PST)
From: diasyzhangqing@gmail.com
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: linux-ext4@vger.kernel.org,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Qing Zhang <diasyzhang@tencent.com>
Subject: [PATCH] ext4: make concurrent DEFAULT shutdown waits killable
Date: Tue, 10 Nov 2026 21:21:18 +0800
Message-ID: <20261110132118.11265-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <6af1e75f.3e87765f.91969.0010.GAE@google.com>
References: <6af1e75f.3e87765f.91969.0010.GAE@google.com>
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

From: Qing Zhang <diasyzhang@tencent.com>

Concurrent DEFAULT shutdown callers can all pass the shutdown flag
check before the first caller finishes bdev_freeze().  They then wait
uninterruptibly on bd_fsfreeze_mutex and may perform redundant
freeze/thaw operations, triggering hung-task reports if the initial
freeze takes long enough.

Serialize DEFAULT shutdown attempts with a per-superblock mutex
acquired killably.  Re-check the shutdown flag after acquiring it to
skip the freeze after a successful attempt, or retry if the previous
attempt failed.

Leave LOGFLUSH and NOLOGFLUSH unchanged.  The ->shutdown callback uses
NOLOGFLUSH with s_umount held, so it must not acquire a mutex held
across a freeze.  This does not shorten the initial freeze or prevent
hung-task reports for the active freezer and other freeze-blocked
tasks.

Fixes: 783d94854499 ("ext4: add EXT4_IOC_GOINGDOWN ioctl")
Reported-by: syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d4ecb9a1e5b3dcf8baec
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 fs/ext4/ext4.h  |  1 +
 fs/ext4/ioctl.c | 14 +++++++++++++-
 fs/ext4/super.c |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f38fec3167fb..c4e44e3d58cc 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1647,6 +1647,7 @@ struct ext4_sb_info {
 	/* Journaling */
 	struct journal_s *s_journal;
 	unsigned long s_ext4_flags;		/* Ext4 superblock flags */
+	struct mutex s_shutdown_lock;	/* Serializes DEFAULT shutdown requests */
 	struct mutex s_orphan_lock;	/* Protects on disk list changes */
 	struct list_head s_orphan;	/* List of orphaned inodes in on disk
 					   list */
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index e8e579498c99..3019b16320a0 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -818,16 +818,28 @@ int ext4_force_shutdown(struct super_block *sb, u32 flags)
 	if (ext4_forced_shutdown(sb))
 		return 0;
 
+	if (flags == EXT4_GOING_FLAGS_DEFAULT) {
+		if (mutex_lock_killable(&sbi->s_shutdown_lock))
+			return -EINTR;
+		if (ext4_forced_shutdown(sb)) {
+			mutex_unlock(&sbi->s_shutdown_lock);
+			return 0;
+		}
+	}
+
 	ext4_msg(sb, KERN_ALERT, "shut down requested (%d)", flags);
 	trace_ext4_shutdown(sb, flags);
 
 	switch (flags) {
 	case EXT4_GOING_FLAGS_DEFAULT:
 		ret = bdev_freeze(sb->s_bdev);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&sbi->s_shutdown_lock);
 			return ret;
+		}
 		set_bit(EXT4_FLAGS_SHUTDOWN, &sbi->s_ext4_flags);
 		bdev_thaw(sb->s_bdev);
+		mutex_unlock(&sbi->s_shutdown_lock);
 		break;
 	case EXT4_GOING_FLAGS_LOGFLUSH:
 		/*
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9cae52471dee..a1d4fc5c0a68 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5547,6 +5547,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 
 	INIT_LIST_HEAD(&sbi->s_orphan); /* unlinked but open files */
 	mutex_init(&sbi->s_orphan_lock);
+	mutex_init(&sbi->s_shutdown_lock);
 
 	spin_lock_init(&sbi->s_bdev_wb_lock);
 
-- 
2.43.7


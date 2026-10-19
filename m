Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D46C851
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416268; cv=none; b=NuYzvO7hrX/4ohbHsi8Xk+U66TCEMdmMUO58AmHzMXyYL/HEcE5B79EovXxFRu+j70Mp5xLuiOfxKm8fBw4SCVboHbIHjVqFibQwx91cKIGrYvFPyfXn0g9GgkJLkarjLv9MS+HsUDz2XQhXAqiAfMT6iNCzn4sB5k2Usi87K58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416268; c=relaxed/simple;
	bh=yoaGZiQ9H2vRb1xLQBCf1fZhJ3mt/eR09MUsi84PMZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sc5urrcvjntGLjOp4LExyTyMCLun8XPBjZRX8c1xn5RexwT/TGF4YQAb0DMuGLvUX4hIbutY7En3ZG9VidAwwRXGjJWiuHfv/yKz7So7utiWbWEg4vE9IheZAodft/KIafiZjrh5Ps6oIYCz41Nvi4RSDw6uEsjtNBEsD5Gfd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgpdvKhq; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgpdvKhq"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso4035216eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416265; x=1793021065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gHkvJRImAGRTzqUxR43Iw2Rk7eqpTmHI2Ma9f9R50ho=;
        b=AgpdvKhqi04YMn77dpglwRqTiOMJgCik0Xrsk19JmSfAy7kQyeFYMOHO5xvcFwN7ic
         wvJiUTG4tNrzPSqM+faQfxRerBA1eqjp/HxLlHkBke0zyD2JyheZdEy1ridSV+8RAQcN
         yCo8xRrnvHbzyJ18Pj7P4vkbBWaWWqp7aJSdRcf6n/YVPjGwsMr7zqbdVbi1jGhEAYUy
         W+nwpwEdMsmUpajs2MEz0RC1GMVblPc8QBXhLVjBIQnVKgEvVTRFjVgZuplY34m4UzAL
         UZhotemi9TrR3dyXE/B9VvhrLANOi2Lt/Jq8B5MMivXpf0DmwYz3nHeeTovHoUzE1AvR
         p1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416265; x=1793021065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHkvJRImAGRTzqUxR43Iw2Rk7eqpTmHI2Ma9f9R50ho=;
        b=rIcEKgYjLQYd4mmVx7BBshb5MbAwxaccQ/zMv3+jOLsVihy5UM71W0LA20W9LcSKw5
         23i0Ae3aZwzWcBxk1RdTo8RVR5Pkza+nSNQhCxqOQ5NQ5DRSzt7UyeX5JfUOvpQD5Enh
         NeHlF5HmrVf76MoRnjgu74bqFwozEYk7mWn1wcH+7VSUEQzAKXGA7LE4+oBo5jQSgTGV
         CYLuGy2mST/2kZOAtbU+Ndh6fXBI+BnKSJqte0aJfaT6AjSWn5VAsrv/QExg6SoM6bWW
         z6fyhM6mThLBqzW+w5QyurM/t6bWW4S/MJ3GajrAVk5CXxPKr1yWAtgHsblGK/++x/gK
         3pEA==
X-Forwarded-Encrypted: i=1; AKwUvBw1jPaDqFl3s/3UaScbbP1z+n6V30Pb91SzG4AxEu167hJ0CNyMnf6VOgAvNVqYRLXcUzQ/cwcrw0shCSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHhasihgGalZprLV+D8O7ieCT1vtDYToiUCZE0R/xtRtaykG44
	AQDqhHAa4Ara/Nh3+yEB9iujYSjO3loTMQFFZpnAfrADLYBiKXKuszKh
X-Gm-Gg: AYBFou0e5eUWULRLweDzeRSOSPKHBbpSdEuCrk24n1GxWPvvNIlJReqKtp/aNpW1/aG
	W+REppJcqpsdKQp65KWTSQ5yMvOU/jT0+ZF1nKCMMpIr4yERa7LCYFkNBAAwAjXw0ZyEsuf293E
	vwUwgG/jfFtzlDsvFiudDxx1ExoZu6edSfLE4DZax7XbSoDzy0idDM5UGHFLOIMq2vL2ePbORLB
	/YuJ93yAVBSs9mRqN6nCKb4rRRZKaKGzgEvpiYFeJf9/ib1zCSO+dF7bdnRRy6HJfD6kK41L0B7
	wgmlvp8kB7JEDX6FnF60yAxnyCCxXgIJps4gQYaYLKqi+XbBUicFfJ2i2vtVIy7IS5l0VA4t8uF
	oAPo5VPlnHH57oZlSSCuoucj2hr07drpK1KNtleX/45j0TOQK8M5PJ4V+zmZ8G3/XSQd2RFJ8LN
	r378i3QNeUFFd/b7UrysLUDnkPBN+hEn2+l0MWPl/ukgyH+MP8o7bKi8IH7T/e35DValhRHw==
X-Received: by 2002:a05:7300:d0ab:b0:35d:2633:ff79 with SMTP id 5a478bee46e88-361a2a3c429mr11431088eec.40.1792416265293;
        Mon, 19 Oct 2026 06:24:25 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm52717230eec.12.2026.10.19.06.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:24:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH] d_path: fall back to init_fs when called after exit_fs()
Date: Mon, 19 Oct 2026 20:24:19 +0700
Message-ID: <20261019132419.62905-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

d_path() dereferences current->fs unconditionally. do_exit() runs
exit_fs() before exit_task_work(), so a deferred __fput() sees
current->fs == NULL. If that fput ends up in d_path(), it crashes:

  ima_file_free() -> ima_update_xattr() -> ima_calc_file_hash()
    -> dentry_open() -> smack_file_open() -> smack_log()
    -> common_lsm_audit() -> audit_log_d_path() -> d_path()
    -> read_seqbegin(&current->fs->seq)

Any LSM or audit path that formats a path on open can hit this. Fall
back to init_fs, whose root is always valid, when the task has no fs.

Reported-by: syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=975ace299d6ba2eb1cea
Fixes: 4a9d4b024a31 ("switch fput to task_work_add")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced in QEMU (x86_64, KASAN, Smack+IMA+audit) with the syzbot C
reproducer: without the patch the first exiting child hits a null-ptr-deref
in d_path(); with it the reproducer runs to completion with no KASAN/Oops.

Alternatives considered: fixing only the IMA->Smack audit path (too narrow,
any open-time LSM/audit hook can hit this), or reordering exit_fs() and
exit_task_work() (too invasive). Happy to rework if you prefer another approach.

 fs/d_path.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/d_path.c b/fs/d_path.c
index c25309006d5d..24fd56e80631 100644
--- a/fs/d_path.c
+++ b/fs/d_path.c
@@ -3,6 +3,7 @@
 #include <linux/export.h>
 #include <linux/uaccess.h>
 #include <linux/fs_struct.h>
+#include <linux/init_task.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/prefetch.h>
@@ -284,7 +285,8 @@ char *d_path(const struct path *path, char *buf, int buflen)
 		return path->dentry->d_op->d_dname(path->dentry, buf, buflen);
 
 	rcu_read_lock();
-	get_fs_root_rcu(current->fs, &root);
+	/* exit_fs() already ran if we are called from exit_task_work() */
+	get_fs_root_rcu(current->fs ?: &init_fs, &root);
 	if (unlikely(d_unlinked(path->dentry)))
 		prepend(&b, " (deleted)", 11);
 	else
-- 
2.43.0


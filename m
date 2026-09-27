Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FFE41DEDA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534488; cv=none; b=DpGXo4chDmAqB4qxS8xhrRws2u0sWGUKfJM8gaj1rbJRDkF6mlPmBsbH6p6cCjeMuS7fXbHHw54qS0ZpYGAlJJuDxVsimWjy9Xj5F/nPsdCSD2FGqqNkUfb2jJhyLWwb34uN4NOBCwitN9amJRjqLIIsuFVG31TMknrHWKhbsvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534488; c=relaxed/simple;
	bh=AM0ZeG53m8nZsdbJwAbupQm0gock2/+86cTvy+fxmKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=doCbfA7z51aV9846YRiTOLJ7BVo4vp0s8pfQSeD+cB3IRbgSGf7ehPmV+77fr60LI7jSH8cLhH4bfO4Js3oj5NIGEAKsxbZNhO/+W3zK4cLqi7sdqmk4Q7Dl18NDhLO+WsHpWC3kGRCpxR+7Sfo5fnTn03vCCpdYawcQGqDbDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH3Sm6xD; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH3Sm6xD"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso4267435e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790534485; x=1791139285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zRE15kB3Sxm7qjUxusMYhKxW4joBv9X+kZz/oXeSwA=;
        b=SH3Sm6xDwSb2yyZqqvIvWmzh5o1NdHhCmn/FSasbg8Wk8q7swuQm7AcOvx4fPh5im9
         MRPscIB7E9z5Gd7I1d7p1jUoZvKMIdVqEj5EOn2xd8Kh8ctf6cvaHtsiW8BmdylFLePT
         CPOKT0FRHIuhLrrJ4ES9P58SVHSJwxOlCVMtJnNeTv8KG17Nk9SEu9rvHDDLFLFswCkm
         6Kar37ZfZjIVyiVT+bJIxYpNDqB4O6+4AIzx1PWv3FmeaeIRacLA+Oq6f8Aj50mwMQfg
         NF1kVuAgc+33rKdoFFfOUyi1txDcJBKbMMHmtLZVPOS3iNCkgnBAEtJnDg4tWc817RQL
         4aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790534485; x=1791139285;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zRE15kB3Sxm7qjUxusMYhKxW4joBv9X+kZz/oXeSwA=;
        b=CEfSBU5x6QcyN8p+g9zj6u1O38dZ9ExZV2cqffLZ6F8OxnfEri6WkHQlN4NQl73qFu
         xKRC5fcBpTjCd/GaJhUUbhCW1J/JPu6Qi+XhvSJ+8b1AlgSIYM1gA/NJn2vFmVpqSKip
         Tj8cHZZVfvD+0JXZp5UD5R6jrTWuIt+JVrrLXPFGp0uRs4Kgv9oqNKwd27e+sqAPL8yT
         XjAABWOgcS3OuebZxo6lDnRrY0Be01DPKOH3VMCbXS0hmDXD6ef6a0JWDY533B1CKrm+
         S7LzqFxwWoSB7rNInXKDU9yXNvW2EL6vr1vLw5SMeKKOXjmYjsq0hpwi8jZllOUhHwiK
         Fu7Q==
X-Gm-Message-State: AFuF++lePOVJpKgU7H1g/ugekK0XkIKBSQ3QSUc/6wKq2KHdc4OIa3Hu
	O74250ReM+Q9fipxMn0DWB6UnlKkFWs8tgVradqx4LRZ6twbgk/yins=
X-Gm-Gg: AYBFou3K1GzOSdD0HX5bbHnyq3NEi8Oy67XqK4Rm35RcJ7y5p/K604JDRQxNEiBDCwm
	BQ7iJnpEWfkqh1ljqZ0/Z/Oc+BjFnG/bAngPwgbUwgZJhCWTMoX3MfsOmIsKhzXMs6NA37gVU19
	wRMfpFtAlYsPLfUgmcAwSf54IcswadFFiGLhNf3BzCq+kqQP/6hPC1bNqWaXdUMqd80lqHMgk4S
	LeP+4AjSGiTGUelpTqVByLKKMgJ22AZjBfggE7ddOBIX0qxIlbzQKqMVJijZmhtjTnD3wmjI3Dc
	4mK/ltJ/pzQu8C0l8O5CbttWPJnaAp+NfcoGlLVVZSCfo1sqTe5eGJN/QJD+HKQc0ya2Oa2u5im
	FMNU6vvbGrXNNs788mSWzF0a+OgAfH70F9AqDNh02osBe+AbK6+L7s8Q28yxwKnBIk7JAII5Vlr
	9sg7/RJMWf/Rjsx+Wp60ObAqgK0UxWrjXYFehZPzz+EYMSmrKvCC5PVUMRFEHGhG65SqTIkTlaE
	KgORRl2uEkCMxmcAuJtvOTVYYfUsfD7itwgYUWvJtZFyruqGC8=
X-Received: by 2002:a05:600c:8b5b:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49fe66f17damr199123515e9.10.1790534484758;
        Sun, 27 Sep 2026 11:41:24 -0700 (PDT)
Received: from localhost.localdomain ([31.223.26.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0016a8c2asm81144815e9.0.2026.09.27.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:41:24 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>,
	syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com
Subject: [PATCH] char/hpet: Fix missing TASK_RUNNING before put_user() in hpet_read()
Date: Sun, 27 Sep 2026 21:39:23 +0300
Message-ID: <20260927184111.25590-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hpet_read() sets the current task state to TASK_INTERRUPTIBLE within
the read loop. However, when data becomes available, it exits the loop
without restoring the TASK_RUNNING state. The subsequent put_user()
operation may go to sleep due to a page fault, which triggers:

        do not call blocking ops when !TASK_RUNNING; state=1 set at
        [<ffffffff85b6d1eb>] hpet_read+0x21b/0x6a0 drivers/char/hpet.c:285

        WARNING: kernel/sched/core.c:9187 at __might_sleep+0x94/0xc0
        kernel/sched/core.c:9187, CPU#0: syz.0.873/9126

        Call Trace:
        __might_fault+0x8b/0x140 mm/memory.c:7480
        hpet_read+0x56f/0x6a0 drivers/char/hpet.c:309
        do_loop_readv_writev fs/read_write.c:848 [inline]
        do_loop_readv_writev fs/read_write.c:836 [inline]
        vfs_readv+0x5d8/0x8d0 fs/read_write.c:1021
        do_preadv+0x1ac/0x270 fs/read_write.c:1133
        do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
        do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
        entry_SYSCALL_64_after_hwframe+0x77/0x7f

Restore TASK_RUNNING before breaking out of the loop.

Reported-by: syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fc3a448093c17a792368
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 drivers/char/hpet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 285c60374..7ad319c6d 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -290,6 +290,7 @@ hpet_read(struct file *file, char __user *buf, size_t count, loff_t * ppos)
 		spin_unlock_irq(&hpet_lock);
 
 		if (data) {
+			__set_current_state(TASK_RUNNING);
 			break;
 		} else if (file->f_flags & O_NONBLOCK) {
 			retval = -EAGAIN;
-- 
2.47.3


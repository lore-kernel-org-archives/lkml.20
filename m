Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB539EF0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816403; cv=none; b=V+hH/P5mTSHs123TciNzujLT8wgNjmRp3zc3FrPS6M+rbpfbR/eu7sVG8OEfkZROBcD4ILDilfoYC5ZYx+JVozFCkG+22d1zZ88CE7O43KImXXby/pi9WrjeT+vsyp0OLxk1ZjNbfTSKxI8uCpVxFmXXOzKDlp5gnCTHBzrFHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816403; c=relaxed/simple;
	bh=Pt3mK+0ZNA9CMJHEAkdLHJWnBxav//gmOF27YEuQ9ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a0O1lnMWE+BnCA0aRn+InKcU0VswyX9eXX1ATQj6hTY6A+BjeeTv1kzHf/WA7GAA0M6AkWyCn6Teij+8aPgDZz4pmeBJkeMyaVij6qxfYDYnTVNH9PnEvbi9rxHU/pe2jImr5XaF5qvkzdV/z0QbCY3+pZAxpN6Mvb5Q7cZUHpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESC1snvq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESC1snvq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso87895e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788816400; x=1789421200; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qkljoxpxAxxPq21+AvVJh3UswkdUWKfwz5YiyhHP7QA=;
        b=ESC1snvqOgbpUVRPaiSKLgXvORw5rzT5te//TorK7hkpbMZA7Uokhj97SU2SlSBnsS
         Q63CSW4nyHT5xmQeHEF7gnV0c+rpZBvDKJ6Qx+0QWUAikg2qEw20G6UjjscHfguTcjd0
         Njg2ZRy1huMmLjQ6BOiLNEd00AOd74KgnJFJ50Ub6lDe2k3rGkXDUNkz5xpkt900RqyY
         guZQiRKVldW4f4IYDt+VzMTrqi1LZax1CNvqMDH+3Rj2NCvXOJaCI/w9sShpm/+MazJU
         4FgD/ogEgjLbH3/Euon0jZS5ZX2pgFV77qe8Bm/jYv7Ty8PRVr+BjeTPpYl+XnibSzqp
         +jzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816400; x=1789421200;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qkljoxpxAxxPq21+AvVJh3UswkdUWKfwz5YiyhHP7QA=;
        b=MKZFL3trqJ+aQTqtU1+XudLwvtxFNu0+1DZ9kPg3v4hcGJAL2vpMLQqxierjZCLZt/
         MkMyy2rrMY8abIQoUF3bOk3E+yxA4v+W9CtclunwZkdl44NiGDHu7hU/Yv5lHpKvTr6s
         9/mKeHQ1R1/9b85Da2gX3duKo1Sg0d6arztqsLIoz2U4ndhPf5v4CY9ZdVOolLLLt4fg
         h/gr9x8Favo+7Femnn6G0y/Yqcz2zV3x83fgYiHF+MdobEpKku1rUzbEdWwNA5c6dkxk
         geF7Zx/ckt7RU24k7vCBA5MPcca66MbK3oqqKYCk5krWobCYj+HHuLWq9p0m64ftnPwy
         CdbA==
X-Forwarded-Encrypted: i=1; AKwUvBws1nWwQsFqX7vo/CS9+AJr5l8OX+zE4mSsfjjDr634dG+NAg12dZdT1Wd9IsYEx3lgUB39Lq25wnrORZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lM5YxNBmK04FJedTaB5o+BP6O115uOZVJSlD/HNRmZ6U6Emz5r
	78nfzWhOAnudLFNFyOOKl+NkwJOleNZbeClZbaFashvA7JXg3YtqQx6V4uB0Cf6dYg==
X-Gm-Gg: AYBFou2mbklCAT1AyysLMbeqajcjUx/885tBNHPvdp/DmamDRgSOFoQqLuEtUC3eUDV
	reTmdraEHQUCfY7g05TA5Cyls2GSQstz7aBHuqOp1VK1CNqKXzsTdYoIp4Lb+7AW2yzCXgoTxin
	QUlHpWv1SHfkKVjeE0GDh/b4G3zxUDzIz+G587Ljm7s2jLhrXrhZK2AAPscHBq1ZDa1W+4P3Kgo
	uuXab8V6c5KtaJXOylJS2BnXgEr15Xbnj5YUY7dtL+23tNLsoMxXr94dL5uAT2zIwGvYLJ3GYTy
	Wz8te3tRsohijapYyXuQa1HZBaNqBC0Ya7lGTYzfIsIhtcA3a1bJvD/5XdX7ccL0luY5AHqlBl2
	gxQhyxSNK6bXw4jssUF1B8BELKb3nkok+Ry+/X+8ozmtRMTJHvsWzcyXfOEswR1x1wUAW4msF1h
	93/LglsbCJ31pZWdxiWdNBOoGl5M7atdbCs9P86ni+/7yTcMXBs/J/uxDO9gh/mau1UfCbAaq1L
	aIOqIixy6dtJYWaAznXKYGI4M56eIIRkb9+yq3NpRQFY/Ow
X-Received: by 2002:a05:600c:a313:b0:49c:ca44:63db with SMTP id 5b1f17b1804b1-49d0cb45e43mr1433875e9.13.1788816399509;
        Mon, 07 Sep 2026 14:26:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:437c:9ac6:4a41:e58b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm29981878f8f.16.2026.09.07.14.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:26:38 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 07 Sep 2026 23:26:32 +0200
Subject: [PATCH] exec: do_close_on_exec() before taking exec_update_lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-cloexec-before-exec-update-lock-v1-1-8018c201a7df@google.com>
X-B4-Tracking: v=1; b=H4sIAAcsn2oC/yXNwQ6CMBCE4Vche3aTtokivorxULaDrhJKWiAkh
 He34m2+yz8bZSRFplu1UcKiWeNQYE8VycsPT7CGYnLGXUxjapY+YoVwiy4m8LHnMfgJ3Ef5cFM
 7H6y5nq0RKpUxodP1eLg//s5z+4ZMvyzt+xfQhYYGgwAAAA==
X-Change-ID: 20260907-cloexec-before-exec-update-lock-972ad108510c
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Benjamin Peterson <benjamin@locrian.net>
Cc: Jan Kara <jack@suse.cz>, Arjan van de Ven <arjan@linux.intel.com>, 
 "Eric W. Biederman" <ebiederm@xmission.com>, Jake Edge <jake@lwn.net>, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 stable@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788816397; l=2822;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Pt3mK+0ZNA9CMJHEAkdLHJWnBxav//gmOF27YEuQ9ds=;
 b=AwaXyTEY9qpiShqdufkAcGgNjKGo/DWK5pXUVA4Aq1oolo8E8fd9npcOAtwvul1lRV1JuNGw2
 UEJ8fCTloyAAiZ4c6TE4xjYY19jWIBl5Ljf5tGzFjcjSDlsC0/Zt+s/
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

do_close_on_exec() currently happens while holding the exec_update_lock,
which is used in a lot of places that access process state to
synchronize access checks.
I recently added another such use of exec_update_lock, causing a
regression.

do_close_on_exec() can block waiting for a reply from a filesystem.
That means a hung filesystem can block codepaths that use
exec_update_lock; and it also means that a FUSE filesystem which
attempts to inspect the calling process can deadlock.

To avoid such problems, move do_close_on_exec() before the
exec_update_lock is taken, but after the FD table has been copied if
necessary.

I have looked through all the calls between the old and new position of
the do_close_on_exec() call; there seems to be no file descriptor table
access in between.

Reported-by: Benjamin Peterson <benjamin@locrian.net>
Closes: https://lore.kernel.org/r/f5e8166a-88be-46c5-8939-1e5227ffe4c2@app.fastmail.com
Fixes: 6650527444da ("proc: protect ptrace_may_access() with exec_update_lock (part 1)")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 fs/exec.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 745f6eb5279e..b51e5d7e4536 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1164,6 +1164,20 @@ int begin_new_exec(struct linux_binprm * bprm)
 	if (retval)
 		goto out;
 
+	/*
+	 * We have to apply CLOEXEC before we change whether the process is
+	 * dumpable (in setup_new_exec) to avoid a race with a process in userspace
+	 * trying to access the should-be-closed file descriptors of a process
+	 * undergoing exec(2).
+	 *
+	 * This can block on filesystem ->flush() handlers, including waiting
+	 * for FUSE daemons, so do it before exec_mmap takes the
+	 * exec_update_lock.
+	 * This must happen after the point of no return, and after unsharing
+	 * the FD table.
+	 */
+	do_close_on_exec(me->files);
+
 	/*
 	 * Must be called _before_ exec_mmap() as bprm->mm is
 	 * not visible until then. Doing it here also ensures
@@ -1214,14 +1228,6 @@ int begin_new_exec(struct linux_binprm * bprm)
 
 	clear_syscall_work_syscall_user_dispatch(me);
 
-	/*
-	 * We have to apply CLOEXEC before we change whether the process is
-	 * dumpable (in setup_new_exec) to avoid a race with a process in userspace
-	 * trying to access the should-be-closed file descriptors of a process
-	 * undergoing exec(2).
-	 */
-	do_close_on_exec(me->files);
-
 	if (bprm->secureexec) {
 		/* Make sure parent cannot signal privileged process. */
 		me->pdeath_signal = 0;

---
base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
change-id: 20260907-cloexec-before-exec-update-lock-972ad108510c

Best regards,
--  
Jann Horn <jannh@google.com>


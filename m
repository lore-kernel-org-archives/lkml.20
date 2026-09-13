Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39476302767
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311009; cv=none; b=GUSTKPeRuABGMSAgc6kPKqNYHJRNlrwoJzwDCWTuErdeL2VX5MhmIYRRDGXa4XC7rb7xvStNtPTHtolOXx9mtIHCoZqNsZW7ErmwmsgFjcgU750AituPfN/b8x16ZmF/I76kvYnzQC4Yovsdk22fPXwRqF6/kPzbMMKbQEAz2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311009; c=relaxed/simple;
	bh=hcHBjfQv2vt4O6bNCDsSTnuv3uAc9pY+xex1NeHkj3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu9J0xem69F8uaoDQWqLX9PyxcpY9/YEseYC4KStDKID4CR7PA9IV5dRFLdZhSOdOY9eDtIa1rf33vfreVnlArNi1FKeuPCQW4TNfJ+rTJnUdKiJ3u64ojsaOnSjGE5g6MNm2twJusKHuQci2ei/hYguwxhlHgV+RMxlUvjzPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8/P96AF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8/P96AF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so26838015e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311004; x=1789915804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W133JhUAHBaW2yCEgAwNUk4+ZgihaBOC1mOOkFbU1Iw=;
        b=k8/P96AFDiK1s9ycYJwuGroDreTey0n+6MQeDu58gbYAEj5y0MfzqYwb36XT18fk9D
         vRf33uUnika5lEDOKjZ+EeeLK47SixwLN1VbvqhIJe2wz8hxr3kBzM0QbmBNEP+Zb+d0
         jptZCqI8cJYjRSoeVa8foqjZcX8+H/OVr4XBlvmVmRju2U9abGt+gKpM/1LfyP+uyiJI
         t1kesrDZpHKWHThS2ZlttvYvmCuhsXlxAPYJQdzsas8PkAvaus0yF5O0wn6c+i0zsf5t
         yWH8nfFNEfQUaYZpJJJirySv/non9laJn6uoxoaf6wjta3kTrtt5zcRNwnZdeXK8NC1W
         XGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311004; x=1789915804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W133JhUAHBaW2yCEgAwNUk4+ZgihaBOC1mOOkFbU1Iw=;
        b=nJ9ruWQRGph/kzJoO+9a4YtE+lwqS2C1auxqeNq/RyZs1N4yzbZrdgXv7/k02s5X4H
         xHvdxf9guZrTeyNfmOkP5m7nNHwXpXr9In8e0gw1MiWuBsKxB/lZv2PVEMjQxXh4OBK5
         kQJm+Y3MkeEKye367FeH0K4u+SLLrLAvyhIOPPi4r8SMA7hKyYCblMvJ/2LQ/0Xk2kJf
         +qbqxvBKPelfhHHlDkr3POIdg7u9wdWeesImEUZLZ4h06Qv90KjmcveDa2pHuzreGi+h
         xXjqIzkMeNjj2rAE1Q7x5Pmzf69KQPcWyIkRHbLT089OonlWCR2hBzGYXRHaeZPXNUR4
         kNMA==
X-Forwarded-Encrypted: i=1; AKwUvBxKVgsQ7OCjKfxiTdveu10Y+e0FMcnRwoQH17AKB4LtA54Vu+/I3gWMu8uGtLiXEJKUxrPgDBilM+QTo5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lgvg69CcAJg25/XtItZjDDK1XqZcrUzZXkPOeTh03ypzT22teg
	0hzas/afUrDlWScm+zZqSjpokTb6pBkE3tgQl3h9Ub6NbH2RgN312lYH
X-Gm-Gg: AYBFou3uCe02npdKilgatHweJmAwcXc08k1URGrR+YEC6M7Vy8Nbd+pUFUNWsACLJlI
	6ruYCOcdUTPxgTmt9g50mkQ4t0gkDv5RzqXXMp0jBx9MxjdxT/RnQ1nRyrDFBGwvnEF0RkcbvWk
	SkLRHKhRJo/LTRQ4oOjqtScwTeb7gh4tsBx5aEwBV7RADkAhL8FVMO1zqg4nh2lXskZOOFA4IwE
	se2A0VhW4KwKEtt/uSb9OxIToJ5f118fTy1/g8VJ43o/eaiDQxmvetztymtgDcjzT4k9F8lp2g4
	QB6PSEECA7++kIjgxqyZQbDH31v3exbLf0HIFUXP9XUZztHL3IYtOmurdcF3UbTtw2sYIbEqg3i
	oJH+wkhktuyqnT6o5au6xYvuSHuq7j3JvqlEq0YOvI6VU3cXlp//V2DEPUb0sRr5hDTBg28GoVb
	xCyGJi59gP7oRjgXbUbyzGsEb7sD3kJ+BgNAT4AE43QQfEd/coCrkhKkdC6XQJa4Z+GnyHEY/zC
	5EYTPycAKSzSgHJXXhtW40emNj92nltudDw36ELOOQ=
X-Received: by 2002:a05:600d:6501:20b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49e61988e73mr99621045e9.11.1789311004217;
        Sun, 13 Sep 2026 07:50:04 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:50:03 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 09/10] proc: use path_clone()
Date: Sun, 13 Sep 2026 16:49:16 +0200
Message-ID: <20260913144918.1606123-10-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/proc/base.c | 3 +--
 fs/proc/fd.c   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 01d8bfe1c410..6b055352eabd 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1766,8 +1766,7 @@ static int proc_exe_link(struct dentry *dentry, struct path *exe_path,
 
 	exe_file = get_task_exe_file(task);
 	if (exe_file) {
-		*exe_path = exe_file->f_path;
-		path_get(&exe_file->f_path);
+		path_clone(&exe_file->f_path, exe_path);
 		fput(exe_file);
 		return 0;
 	} else
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 0f9a1556f2a3..9ab9bfd6e48d 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -180,8 +180,7 @@ static int proc_fd_link(struct dentry *dentry, struct path *path,
 
 	fd_file = fget_task(task, fd);
 	if (fd_file) {
-		*path = fd_file->f_path;
-		path_get(&fd_file->f_path);
+		path_clone(&fd_file->f_path, path);
 		ret = 0;
 		fput(fd_file);
 	}
-- 
2.53.0


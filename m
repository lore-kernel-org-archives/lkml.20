Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683371EBFE0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310991; cv=none; b=S+LJuxkmsKf0lHdy7oRx4G4mWkXj6aRvMXNzzIHsBMdX/cgIUePgOAyc4BfIlBYgypAZbRHUOFHU6FZVRvk+6N0fd4XseAMeB+v/l0zoJ4sfsdJZg0h6FzyZfkIE6h20Ca3sgXrSBVuTR9q8u+PXab9OXIGJ6KhJ0EY0oOesj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310991; c=relaxed/simple;
	bh=U8dx4z7lnyllJ+6JAd+UOAAmPATgrg/BtWHKWvClBK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBFUqc5sOSxuhUOKZ+B8PxXQoyHA4yARZ5hUJqowZMyqbFK3otoUWszlTS/tRKtbAxhiPeyvUIaY/qiMYqQgka7SpSw2OW+8qhp7fkDUsgaALMq13kir0u1nE9ICjXjyM9wtIflGLLcb0pLNqQUJzJL2Rm3UsB/Nk0XsXPt14XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXsrZQzD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXsrZQzD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so10606835e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310988; x=1789915788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+IUVAdxsXkpHSpKAcwhzoqAkwM9BlQ0eSfO829Y7ly4=;
        b=SXsrZQzDT2OOvtQKfAEAchRuaBNO9PJPxIUXvfK5a6hNDOqqz3fUyfCnOnLVufPUar
         t7GeQwhVG6lsMnM5ZtymZ86SugR7z2qpE83Xhzsc5N4XidjQnVP5+so0wxpzoM0fEasA
         F6+PjT8pjaDKngyCeJSzRws2TSzou4r8LRDKNle9w1GGJqTH3W2ERF9CRB++9vvVH01U
         8ydzhHj4ol8JJGjG4kybbhMeVMdWpDm2E5hR4214lXT2I6/0QADYWkyZTEjF+OEl0qFW
         m7/h1Orb9QajAvdjFMMDazLgZJ5V4Z27LXoeRVnyeWwWaynzcdrDX+Hi1iiKFSFcIXOI
         f6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310989; x=1789915789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IUVAdxsXkpHSpKAcwhzoqAkwM9BlQ0eSfO829Y7ly4=;
        b=DghvPLo0fHYMLv2mN9AuWF0lVyzw8hax8ETvhPKd2YwWlJ8341VS0TIJvkzQ4o0f+U
         3CHBKkz8LGMDk5Roc5u6KKgGAfemfjr50RayEiFuw5rmWojTY48sRmoMEozir3F53U3b
         Cl3HNjSERGuZZ/SWDe/wMFgA/RorDYknsFbb5OuWpJlQypIIGIbdjKbbLlbtv9e7iDnS
         mfw2GM9iXO0kuQrSsSkS23nXfpkpLTEXjLEkIlHE/bFbg0KoFvHA/wx7lS0F0QMO+gL8
         Y5xAI3RmvzF3HYB9XQ1Rpoq3E2EDCA1YgxaDYq+wZGx3y+jMTg0EKZtRKTrqnTgPSOkq
         sDiA==
X-Forwarded-Encrypted: i=1; AKwUvBwiG5ABmBhfM/0K9rpa1a0MrBegB4f0Eixv3u4FteX4jYvbL+uwUsEWPGo6TlTcNALRIvcbmnqBe+EIQKY=@vger.kernel.org
X-Gm-Message-State: AFuF++l608t08z9IBx3r7OeW4t7za9AjR9KEyces8vVa0n0CFfTq4ADx
	PiAaVZQrfqMSFRXz6PnzI7C4XDyrnBsIZmwQwYjiH3NxCJraJ8L7AUcp
X-Gm-Gg: AYBFou2U5lH95MfwmCksAQPRIx49DMMKb+of/4L6bsLSqjCp2W6s8ySmGVi70wU9dnj
	0FNM5R15+xtsxLIUwhqgmr1PeKSMaByfjWwe19QQn35t8RcKFDrxryUiIqHPIsXk3Mmq6KToIfi
	6eHPfGkl1jLhH3e5YqnNMngZbm8asHdN8tkI0GYvspzLesVumo/Bzv/NefNAloj2Welv/+f6LGn
	mDBgMaCkyzaJQ2b0cq2sUEBqiixxOtew9ubP5aDtSuy7EFdLvgYLnCPUG7f3wY+B/s4tDXGuh1B
	H7FZfZm/D1q+/CTEEl0m5Tt9JFmirB6BoLZxc0shBT+ZeSiHGP6TomKuOY0YVPEdrcoWvz1V0I3
	gkFXL/7NAkENU5U3W6+b4XwoJo6kjQe/3H0yiH97M4qLMiS+V13sL0wn+qzqZ4E2c6H92C7YY94
	CFSSGs6eaI2+bN7/iKL4dtLfISFFXfIwGvCVJ3Z3Bzv9bo1vDhagEr/IR9DK8IfjRVG7kUfjI6F
	b/badGmFXXUljVosBuFpMzgyLmOVkTCSj7+OezAf+XNqih/0lEHKQ==
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr96141535e9.2.1789310988499;
        Sun, 13 Sep 2026 07:49:48 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:47 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 00/10] Towards safer path_* API
Date: Sun, 13 Sep 2026 16:49:07 +0200
Message-ID: <20260913144918.1606123-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the handling is highly error-prone with consumers allowed to
arbitrarily manipulate references, notably with path_get().

In the past this resulted in preventable bugs.

The end goal, not yet achieved with this patchset, will provide an
invariant that a populated 'struct path' has precisely one set of
references on it.

While consumers can still cause leaks by neglecting to path_put(), the
footgun of path_get() can be eliminated.

With this patchset instead of hand-rolling a path copy and issuing
path_get() on it, callers can resort to path_clone() instead.

Almost all path_get() consumers get converted, most of which with
coccinelle.

Few instances are left until I figure out a nice way to sort them out.

Overall almost entirety of this patchset is a NOP.

Mateusz Guzik (10):
  fs: unexport backing_file_set_user_path() and make it take the ref on
    its own
  fs: add path_create(), path_move() and path_clone()
  fs: use path_clone() in path_init()
  fs: use path_clone() and path_move() in vfs_open*
  fs: use path_clone() in backing_file_set_user_path()
  Coccinelle-based conversion of path_* consumers to use the new
    primitives
  autofs: use path_create()
  fsnotify: use path_clone()
  proc: use path_clone()
  nfsd: use path_clone()

 drivers/block/loop.c               |  3 +-
 fs/autofs/dev-ioctl.c              |  3 +-
 fs/autofs/expire.c                 |  4 +--
 fs/backing-file.c                  |  2 --
 fs/devpts/inode.c                  |  6 ++--
 fs/failfs.c                        |  3 +-
 fs/fhandle.c                       |  3 +-
 fs/file_attr.c                     |  6 ++--
 fs/file_table.c                    |  3 +-
 fs/fs_struct.c                     |  6 ++--
 fs/namei.c                         | 44 ++++++++++++++++++++++++------
 fs/namespace.c                     |  3 +-
 fs/nfsd/export.c                   |  6 ++--
 fs/nfsd/nfs4xdr.c                  |  8 +++---
 fs/notify/fanotify/fanotify.c      |  6 ++--
 fs/notify/fanotify/fanotify_user.c |  3 +-
 fs/nsfs.c                          |  3 +-
 fs/open.c                          | 10 ++-----
 fs/overlayfs/params.c              |  3 +-
 fs/pidfs.c                         |  3 +-
 fs/proc/base.c                     |  6 ++--
 fs/proc/fd.c                       |  3 +-
 fs/smb/server/vfs.c                |  3 +-
 fs/xfs/xfs_handle.c                |  3 +-
 include/linux/path.h               | 14 ++++++++--
 kernel/trace/bpf_trace.c           |  3 +-
 security/apparmor/task.c           |  3 +-
 security/keys/big_key.c            |  3 +-
 security/landlock/fs.c             |  3 +-
 security/landlock/syscalls.c       |  3 +-
 30 files changed, 87 insertions(+), 85 deletions(-)

-- 
2.53.0


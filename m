Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785852120B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910112; cv=none; b=Ey4y3jbmhskDL/umKm1MNSNXkuhl3Yq9D+qsljbSFVG84PRVxYGTEvhbvSG2t7dBEVR2d13QMTrv5UAEsH5cc4s8CwQsbMnHmOVyPUHAuzGDfIM5JQe9XC45ddH1Lt2s46WCvSjrbBGWQHIw2kKLHYMxWrf+QjFQ57JulevJOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910112; c=relaxed/simple;
	bh=K6RB3zG/56k22YI3NmNQcP41aWDJsiJH7Kgzt82dYec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ET8Qhq8dTbLgRLarJcU3AzKsUojSue/eYIDZ1RiddPMPSDQxMqfvd7SaQQYdoVp5WajoMnm/UELL1GgenvMwFBdzTnUTNWe8gUCRsO0cy9sRS9OrDBstfyd1vW6nIkhWpNanlYyBIoUZvBwCO001jvsNKGdpldSJeUZvKviPCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrUaiLvC; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrUaiLvC"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fca0709caso2587094d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791910110; x=1792514910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/dvtBEldp5k/dyI1GCMlCiiP1Mw5D+YND/XHmJTYxQ=;
        b=WrUaiLvCbLZuplWS4/6pNj3dd22buHgUjEBc4nN5pgn/Vdi58E7mIp/7pU4Ul3U8/F
         jprHLi4dYLWvoWLZ8rtHDyaoIdmqGERsyoCx+0RTpw0IBvBbbU7woPXPLzuYedxGEWXu
         VsV5E9QzQzfCQ9bIvKQrYO+CVxVpdw0/cQ41tfOWHPQrP8ht9+hQAWydlknXsWYSZDdt
         BPof+81uKgfEpJZCSYgJXQev+dHQluBr4VLH+FP1DpWjFwEqqic2FSXqQQsfnxeNDJU1
         Qg8AzrObofAeWhYmd75MvZbFej+pejlFLMHgyhkFokUrmjVf6qPUaQMx8HkCn3hs4+VJ
         zz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910110; x=1792514910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/dvtBEldp5k/dyI1GCMlCiiP1Mw5D+YND/XHmJTYxQ=;
        b=O5eG+N48H+TkQ/Y3tRRSz8JSAdliovXe0dxUvWDSCR1XLZKkgOCYsN6BCt/gzRHejD
         uS3twN/ZNdBV50M0pHwSv5FOV8Mgd6EXZKXM4wpxgQQ41sCx0d2WtCcpu5WyRoGDKko2
         p2bM+zuOZxTnybGN4ilGY/87OflrbFNcVweqLbZ3Z4ZzUGHAyrE6tfM8pUBGbPZ+D9q8
         oqEp6I6bEPNal2TGRIX5danfFlef/9+KponmXIfvdKvvGaR7XuWVhDBm5vAw25bnXNNH
         siWI5S5R4lcg9rQkOuftJ7Avmoie8q7RRQQZnBew7yVsYXA1tRU22feVyHsPk2LWzcfg
         IRCA==
X-Forwarded-Encrypted: i=1; AKwUvBylT31ClkxT60ItIAICozxtSfScZhphx82UuK15syUog5RI5TyxD0O49hD/cZyZWl/fBtyQKLsT/av0CV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuPz6WPpEpMRUtO/3VBmlyehzCINmGdMXrRFyPoI5qwmJ4zXYV
	pIh9xB95GdhET+DKVYgMk0cx50hJ8/r1jtY+rTZ7Gt+6+rAmbVdDTp3S
X-Gm-Gg: AYBFou2LuIDMJ2/DqI/uSXc4JInTIOjIvpdajtMDodxnBzWKtHzuqSC4RMe4HzQdNyv
	YjBV8WLcpLbUVYwY4ebaBUzi2J59I2jKKmv/gP55Dh3tRD7oCAXjBCSILAFlH3R+FfM/OSVJAw+
	PQykBywQj12mOtCi9ynGnIyt2tmhzlaOTiJ1ZiZ4Vj1Vo10OQ0SHWeIngLYJ7oH64BrQbFbWTP2
	6koWON1ogqPSqAxRT9qPZVQhflobvxs+yUdrmCgwGPxzu6MxAfLRbMLnLVBnpTvXJT0Mmfe5ZRY
	HBXoMrW9/9dJLCwdUzSf4PBa2F/msOlST/YAF9EfAXmYiRd72IgHO7UOUJKvdkCq6wVnyCjIyJ2
	+svjzQa+5UUAc2bmAYXB5hIi1pId6tRyRn1+0r1fKzY0sdxApSa4XDq2SsV+B2qCzaKuL2UGM8K
	1CuXniehdq0/2zf/vbeVe0yCIkuVKtk/DOkRwZ/EDb3Gi9Fgb5yxEctg40MNbiI8F/Yg0hXEqw
X-Received: by 2002:a05:690e:138d:b0:677:b589:d002 with SMTP id 956f58d0204a3-679362f3616mr5451286d50.78.1791910110471;
        Tue, 13 Oct 2026 09:48:30 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d326:f863:5ae3:683])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986a89294sm81136d50.15.2026.10.13.09.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:48:30 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Song Liu <song@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Tingmao Wang <m@maowtm.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH bpf-next v1 04/11] namei: expose the stepwise ancestor walk to fs/
Date: Tue, 13 Oct 2026 12:47:53 -0400
Message-ID: <20261013164800.2906577-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013164800.2906577-1-utilityemal77@gmail.com>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make vfs_walk_start(), vfs_walk_next() and vfs_walk_end() non-static
and declare them in fs/internal.h next to the walk state, so an
iterating consumer (BPF) can drive the walk with every step and
invariant staying in namei.c.  vfs_walk_ancestors() and its callback
contract are unchanged.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 fs/internal.h | 5 +++++
 fs/namei.c    | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index bfe62c9bdfc9..3ce2220ff57f 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -81,6 +81,11 @@ struct vfs_ancestor_walk {
 	unsigned int flags;	/* VFS_WALK_* */
 };
 
+void vfs_walk_start(struct vfs_ancestor_walk *aw, const struct path *path,
+		    unsigned int flags);
+int vfs_walk_next(struct vfs_ancestor_walk *aw);
+void vfs_walk_end(struct vfs_ancestor_walk *aw);
+
 void __init filename_init(void);
 
 /*
diff --git a/fs/namei.c b/fs/namei.c
index 6d5b4b214334..d6151fa27844 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2249,8 +2249,8 @@ static const struct path vfs_walk_no_root;
  * @path: position to walk up from; never modified
  * @flags: %VFS_WALK_* flags; none defined yet, pass 0
  */
-static void vfs_walk_start(struct vfs_ancestor_walk *aw,
-			   const struct path *path, unsigned int flags)
+void vfs_walk_start(struct vfs_ancestor_walk *aw, const struct path *path,
+		    unsigned int flags)
 {
 	if (WARN_ON_ONCE(flags))
 		flags = 0;
@@ -2299,7 +2299,7 @@ static int vfs_walk_step_ref(struct vfs_ancestor_walk *aw)
  * Returns: 0 with @aw->pos valid, 1 once the walk has passed the real
  * root.
  */
-static int vfs_walk_next(struct vfs_ancestor_walk *aw)
+int vfs_walk_next(struct vfs_ancestor_walk *aw)
 {
 	if (aw->flags & VFS_WALK_STARTED) {
 		int err = vfs_walk_step_ref(aw);
@@ -2317,7 +2317,7 @@ static int vfs_walk_next(struct vfs_ancestor_walk *aw)
  * vfs_walk_end - finish a stepwise ancestor walk
  * @aw: the walk; its positions, including @aw->pos, become invalid
  */
-static void vfs_walk_end(struct vfs_ancestor_walk *aw)
+void vfs_walk_end(struct vfs_ancestor_walk *aw)
 {
 	path_put(&aw->pos);
 }
-- 
2.55.0


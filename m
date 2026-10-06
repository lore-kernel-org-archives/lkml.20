Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795302701B6
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246036; cv=none; b=XHKDxj2HLoCkfaObLPV6wIXY7Yi23wfANFB1K5JoVj7KG3s4+C3ea0jvsogU542Iza/a02DbJRDYL3SB89Oe9n0epcogsvfz7L1zsNIn2ovhz8XWhs3+y3XORCZQgIUUg45EZ+mumzdjJrXO0dI6K2PTOudh5NHVjhlbWTcyqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246036; c=relaxed/simple;
	bh=DIsH8LhRgy5De7wrfmXFB40fy5GLNjqhOnWKee0JJik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RV4zA2loZtt3x7RIiPnuhHiPhH1e1cyki1GUTS3ehOVhCgWmAsRfwljiBvyJQz3+KlOAMWG72B6rQgoUJC4dH2Ww0q4RHvrsSfWkGHzXmTldjQsXY7f66dPZPT5vCH0CLeejYOaF7kAqxNGvcAYnm6S/ixSPMOtOMo/nh2i/8/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQVCym1s; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQVCym1s"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab37e44643so17976337b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791246033; x=1791850833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pibLRMB5X78yAjvj6wK6JEPDe7qdxNtboEvLx0/jkVU=;
        b=oQVCym1s9ATvJLeMsh4DB9usLeA2zxMRxNYUog88N477X6WtccfOUbLMDOfIy0IZgx
         uFMidH5Ucc+J82/A6iYtBCTXec6juHhlf+oBQ4CpVag9Fl7SEjgjj6aT7EQjSEHff7Xz
         LrY3/d8Ky1YiuvpqOC1Y/QoKReYx8NuhlC4soc9H7zHjq5aeY2jWy6b9hfkT8d/p971A
         YrhtNTDbtmKM/VGPZfLfxfUpMi9WASXUxza47b7yodoo1Sh+nUvdKuaBppxppxHbybc9
         Pcq3ZdM0OWvCXjN7/xcBXdvPPZ0XeKnC6rK6krZF6I2KVjiQ/DQIMpgbflkF5xYdZJ06
         TUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246033; x=1791850833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pibLRMB5X78yAjvj6wK6JEPDe7qdxNtboEvLx0/jkVU=;
        b=0oJ0dNRohnsq09JdcdgZ/8BKpofJYs4+hZZc9dBTBov1wIFWJ9nwtKlG+XEzAfr246
         jaC7WXobZ8yk2GZCq4WV5F1UCVh7Icob8vwQ5wvA4l9hsk9B51Sgzqksc2NMbWF3dBO7
         RdNMbkEpO0i+aimKqAEPZJs/QAyF6qHJ4wjwcooiZtDiqhMCqxWfNNra/Dv6bS+tYeDe
         aSrFHyfepSXi2w6R1x4CQV0739Dp/Cn2hnh4C9XJTcAwzMN5sZT1gaPeXnvCUm8IDHC4
         ni9zXCcwGAHLtrob5M93QrqnZJ8O6IGNPCcyyyyEP4gOkYjG8dxIPQhpIih8I/1ZgjI+
         BX0A==
X-Forwarded-Encrypted: i=1; AKwUvBzxy96CS8Y13SssqFjPf+zjbd/iF8hBDSMZY3uewKveQCqNr2TIRq3ZOPwqtsGHPCB00FwDfccASYwrmJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkkpzJ+MG/mwkn2wxCT8JiVsVl7lJ1Gkp1bVMg1GvhTkx/YloF
	Q7WhJWO22ajXBi1DOBWAs7mXKTauFNrC1HLvUOarHHmd5/2GWbLO26LV
X-Gm-Gg: AYBFou2xeBjNvnlbTBOl2/0ttnfzmS2gaKXsGEPUHsi6hYHo3qpGuUIFWM6V1cvCU2c
	SYIKB/JgXnKokWheOfEerf6SA4hRwO2OLq+vceCdUPk9/n9SYvHpB8eKQvDM/aTVbjiSBh0Zs3U
	oRzGfh+jbqtsolDfHaq+FMgzur3lXz6MVNO5wScpw5oLiOSs9yzDNk7qmgA7F978vQ5RHDTZVO8
	nwQLi8zAQaM56ORh0DPKLlLJ0vWkN51TWKQ9CzlbobQKBILK8H2KAESAH+pEtGEYgybtjiMt9P+
	93bjfR82ykKy/P8KtiekiVO4P2dbbngNRRFunPgpHh2pw4mHVLTUk87QGtwX1oFz6bt9yMAp6Ed
	Ocl9y0P6xADHmudkYWJN+HLZPqVqGpZt3iKBmUWnnOePqj6rW3GyPmBfXr4BZocvrUWqfZHwcXQ
	6mZHYUkLyjs28ABJVCTlEVplnEa1Cw+HE63IzNq+ZvD5o0I2vS1itJxIeXR0dVTRGBVDJIrp2M/
	9w=
X-Received: by 2002:a05:690c:ec6:b0:8a8:8f62:ebd with SMTP id 00721157ae682-8ae957d256dmr26869597b3.41.1791246033335;
        Mon, 05 Oct 2026 17:20:33 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6dc9:4ffd:1851:60b1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33be0e58sm46636277b3.43.2026.10.05.17.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:20:32 -0700 (PDT)
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
Subject: [RFC PATCH bpf-next 02/12] namei: add vfs_walk_ancestors()
Date: Mon,  5 Oct 2026 20:20:09 -0400
Message-ID: <20261006002020.2890858-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006002020.2890858-1-utilityemal77@gmail.com>
References: <20261006002020.2890858-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a callback-based walk over a path and its ancestors, built on
__path_walk_parent(): the kernel owns the loop and the callback must
not sleep, so an rcu-walk engine can be added later without changing
the API.

Disconnected root dentries are reported to the callback instead of
terminating the walk; continuing over one resumes at the root of its
mount.  A disconnected mountpoint landed on by a mount crossing - the
one position this walk visits that a dget_parent()/follow_up() loop
never does - is additionally flagged VFS_WALK_POS_MOUNTPOINT, so
security callers can reproduce their pre-conversion evaluation
sequence exactly.

Suggested-by: NeilBrown <neil@brown.name>
Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 fs/namei.c            | 76 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/namei.h | 14 ++++++++
 2 files changed, 90 insertions(+)

diff --git a/fs/namei.c b/fs/namei.c
index 808fb4bed7c4..2e6ea19714b2 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2229,6 +2229,82 @@ static struct dentry *__path_walk_parent(struct path *path, const struct path *r
 	return dget(path->dentry);
 }
 
+/**
+ * vfs_walk_ancestors - invoke a callback on a path and each of its ancestors
+ * @path: path to walk up from; the caller's path is never modified
+ * @cb: callback invoked on @path, then on each ancestor up to the real
+ *      root, crossing mount boundaries.  @cb must not sleep and returns
+ *      %VFS_WALK_CONTINUE, %VFS_WALK_STOP or a negative errno to abort the
+ *      walk.  @ancestor is only valid during the invocation; @cb must take
+ *      its own references to keep a position.
+ *      A position whose dentry is a disconnected root is flagged with
+ *      %VFS_WALK_POS_DISCONNECTED (plus %VFS_WALK_POS_MOUNTPOINT when it
+ *      is a mountpoint a mount crossing landed on rather than a parent);
+ *      if @cb continues over it, the walk resumes at the root of that
+ *      position's mount.
+ * @data: opaque argument passed to @cb
+ * @flags: %VFS_WALK_* flags; none defined yet, pass 0
+ *
+ * Returns: 0 once the real root was reached, 1 if @cb stopped the walk, or
+ * the negative errno @cb aborted with.
+ */
+int vfs_walk_ancestors(const struct path *path,
+		       int (*cb)(const struct path *ancestor,
+				 unsigned int pos_flags, void *data),
+		       void *data, unsigned int flags)
+{
+	const struct path root = {};
+	struct path walk = *path;
+	unsigned int pos_flags = 0;
+	int ret;
+
+	path_get(&walk);
+	if (unlikely(IS_ROOT(walk.dentry) &&
+		     walk.dentry != walk.mnt->mnt_root))
+		pos_flags = VFS_WALK_POS_DISCONNECTED;
+	for (;;) {
+		struct dentry *parent;
+
+		ret = cb(&walk, pos_flags, data);
+		if (ret < 0)
+			break;
+		if (ret == VFS_WALK_STOP) {
+			ret = 1;
+			break;
+		}
+
+		if (unlikely(pos_flags & VFS_WALK_POS_DISCONNECTED)) {
+			dput(walk.dentry);
+			walk.dentry = dget(walk.mnt->mnt_root);
+			pos_flags = 0;
+			continue;
+		}
+		parent = __path_walk_parent(&walk, &root, LOOKUP_BENEATH);
+		if (IS_ERR(parent)) {
+			/* The real root. */
+			ret = 0;
+			break;
+		}
+		/*
+		 * A mount crossing can step onto a disconnected root, whose
+		 * parent is itself: only then is the mountpoint itself
+		 * visited, flagged, next iteration.
+		 */
+		if (unlikely(parent == walk.dentry))
+			pos_flags = VFS_WALK_POS_DISCONNECTED |
+				    VFS_WALK_POS_MOUNTPOINT;
+		else if (unlikely(IS_ROOT(parent) &&
+				  parent != walk.mnt->mnt_root))
+			pos_flags = VFS_WALK_POS_DISCONNECTED;
+		else
+			pos_flags = 0;
+		dput(walk.dentry);
+		walk.dentry = parent;
+	}
+	path_put(&walk);
+	return ret;
+}
+
 static struct dentry *follow_dotdot(struct nameidata *nd)
 {
 	struct dentry *parent;
diff --git a/include/linux/namei.h b/include/linux/namei.h
index 86d657b24fc6..3e198de7a0d3 100644
--- a/include/linux/namei.h
+++ b/include/linux/namei.h
@@ -162,6 +162,20 @@ extern int follow_down_one(struct path *);
 extern int follow_down(struct path *path, unsigned int flags);
 extern int follow_up(struct path *);
 
+/* per-position flags passed to the vfs_walk_ancestors() callback */
+#define VFS_WALK_POS_DISCONNECTED	BIT(0)
+/* the position is a mountpoint landed on by a mount crossing */
+#define VFS_WALK_POS_MOUNTPOINT		BIT(1)
+
+/* vfs_walk_ancestors() callback verdicts; negative values abort the walk */
+#define VFS_WALK_STOP		0
+#define VFS_WALK_CONTINUE	1
+
+int vfs_walk_ancestors(const struct path *path,
+		       int (*cb)(const struct path *ancestor,
+				 unsigned int pos_flags, void *data),
+		       void *data, unsigned int flags);
+
 int start_renaming(struct renamedata *rd, int lookup_flags,
 		   struct qstr *old_last, struct qstr *new_last);
 int start_renaming_dentry(struct renamedata *rd, int lookup_flags,
-- 
2.55.0


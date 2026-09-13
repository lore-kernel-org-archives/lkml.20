Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99F4314B73
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310995; cv=none; b=oPa7AxbrB+PxmzkeP495bzZOknzOiwpnBPpMrM/c4KpSvJRjH6yLfkwOoWLVVvozzkLY1dmc9hXyJRuMhzaAXX20S4SFSFXCc2NvBargfo/3gvc14xp06V8J47ixWMKfyF3T9koOBkXl0LVoNCiuJHBnB+uJKXChtA323l6OdFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310995; c=relaxed/simple;
	bh=f/JGvyozr5jeaQuC/YPBC4EZWLzX+hOKaQnE0gOoXKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPzPm/WvMXJroJ+ZLGPrPcC7aa2eRuXfwJCrw9kdhdYB6sk6qT2t49wdk3vnJLX1RcUN/SSn8r61naAJWNaTXuEASuR9+joGjmiCx4Dw+J0IwITUmlIHEIsuKCCS97Jhu3VnSspRAJhl/JLBS+cnrcyS4Mmveu7YOwaur48KhHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLsnFoPd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLsnFoPd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so369576f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310992; x=1789915792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEgrf0WZPqVqJ7RIhBAsuccBYx+nrV9P/xGJSXqzGyg=;
        b=WLsnFoPdjiVo7jSLN7mGOqSUrXSE9qV29lFGYkmpWo/b4TDWRWdSZ+bluJ4KyoS0oh
         GNyGyT3wrfynb8J2oR7XqcMWgoEdwoGGlp1V0sNJO7vkCD2kXWUVy7XYwOlPQhGoatMQ
         o8LeOBvcuGgBx4GUfgVJWyV2fjixcLwkP3XsDNZ7tsXI+AH1FzeHPkhbOgbTWPIyBk02
         tdEfxI3UkhkajeODBnORJaUc1op+L+WDLh7EFbqe/g/PMVmzhV6bejAUQkfbCAqJXP7S
         XtKeV0t9eKgQIgSt44oicnVbdZvjLaL0P+lXn9/EqoRFa9Jp47BlDsHNfWP8HujH8nbI
         dXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310992; x=1789915792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEgrf0WZPqVqJ7RIhBAsuccBYx+nrV9P/xGJSXqzGyg=;
        b=myRv3EGDccWij4xIwh4N71roXHit6qwhNFMOHFC0YhTl5UoEboAAeuqxa+F0tIgzVo
         7DDvPh08+Q5FPBCSQwqrmglAtbgq0HGMHA4Q3QrYdT+zJedDhI4cXUce0ccuvKUy3B6B
         m+iT/X3ponNRy1lG4JahkFEdL1uVEFGJaMEjs44bFtzGSYgQqpr4/IlNbrlgevFvvnn7
         rAwoiCta4TBuprGzSJzWJcfIQ94Isfu+r3TO9cMOQuwfIFe63arT5IBR1YpB11xel3KC
         BZWQK2PBceEpevipM62Ar9GRRw1bPaw2ML2jFzaWO9SNMNVqWflx3BT7jB6fb1MniNy+
         xTXw==
X-Forwarded-Encrypted: i=1; AKwUvBywrFIWGdR7rnPcW0vmj2qrfS6W7FmU6Ao/0uYlHXOR2JBto80lKoNPcnjmrPr6IZz+Vku3iP9jV6PzTMA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDTzDDIdxbs9vpebXfyJwmPt28UzP+l3MfVhGLzvVTZ+xV9Kqr
	UIkwIDd8R3BhK7GVX65THUfEE0+vUwHziQEQKyzxMM8NDtMLRtm71scM
X-Gm-Gg: AYBFou0tjFC8J9/BhT6yi3LPJrqCZkthYEmwLFWVmPCDmxNqjj5e2LHOjKfSIjuSa+O
	vTYvUIK67DzNav6+91VyfRTcqaW4MghNyXuCRo/9HyQ+bIlRv/30Zh3Vncjc7r23VJ2kBaKHG44
	660AQWgJOzwbcs3unu8jNRjqoWJiZT378yaHXAjTT9pxoE5Aa9M5j5Y005pL05CaPByyQ2Wn4XT
	WlIleMeOjRXWU4HC4HmmTEGTL0yFPXUDGk+A5/rYWGgpqzkAM7bH6kCZHWjboQbF+5P3isz2zhV
	WgxRplQDU69MhTdfceHgOHm8N47s2BZmYXMo2GQMKF4SjTAura6ebVR0NpGglYQnhF9TKp8eLwk
	XkiAugLCHp5WukdRWtbB9ZdjfUG5xCmfOMfmnmrByNmoUHxxjwlC4yHl9PQ2bTwHrqc0x/TTKY+
	q5srdK0k9gA+4Kuxj8mjL4KSGNYwJZ09sD604qg9IBtnLKKOMYbIB+dts0w2NW8FsPHnG6K7adg
	Ieq3LhTBV2as8E/iHSOrQsY9/pKMb0FgxNmRywBVb0=
X-Received: by 2002:a05:600c:5248:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49e76068364mr29300465e9.12.1789310991798;
        Sun, 13 Sep 2026 07:49:51 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:51 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 02/10] fs: add path_create(), path_move() and path_clone()
Date: Sun, 13 Sep 2026 16:49:09 +0200
Message-ID: <20260913144918.1606123-3-mjguzik@gmail.com>
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

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/namei.c           | 29 +++++++++++++++++++++++++++++
 include/linux/path.h | 14 ++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index ca4f5e3be99a..c8754c7ba8be 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -698,6 +698,35 @@ static __always_inline int lookup_inode_permission_may_exec(struct mnt_idmap *id
 	return security_inode_permission(inode, mask);
 }
 
+/**
+ * path_create - WRITEME
+ * @path: path to get the reference to
+ * @mnt: WRITEME
+ * @dentry: WRITEME
+ *
+ * Create a path object using the given vfsmount and dentry pair while incrementing
+ * the reference count on both.
+ */
+void path_create(struct path *path, struct vfsmount *mnt, struct dentry *dentry)
+{
+	path->mnt = mntget(mnt);
+	path->dentry = dget(dentry);
+}
+EXPORT_SYMBOL(path_create);
+
+/**
+ * path_clone - WRITEME
+ * @path: path to get the reference to
+ *
+ * Given a path increment the reference count to the dentry and the vfsmount.
+ */
+void path_clone(const struct path *src, struct path *dst)
+{
+	dst->mnt = mntget(src->mnt);
+	dst->dentry = dget(src->dentry);
+}
+EXPORT_SYMBOL(path_clone);
+
 /**
  * path_get - get a reference to a path
  * @path: path to get the reference to
diff --git a/include/linux/path.h b/include/linux/path.h
index 7ea389dc764b..8a621e0e1921 100644
--- a/include/linux/path.h
+++ b/include/linux/path.h
@@ -10,8 +10,18 @@ struct path {
 	struct dentry *dentry;
 } __randomize_layout;
 
-extern void path_get(const struct path *);
-extern void path_put(const struct path *);
+void path_create(struct path *, struct vfsmount *, struct dentry *);
+void path_clone(const struct path *, struct path *);
+void path_get(const struct path *);
+void path_put(const struct path *);
+
+static inline void path_move(struct path *src, struct path *dst)
+{
+	dst->mnt = src->mnt;
+	dst->dentry = src->dentry;
+	src->mnt = NULL;
+	src->dentry = NULL;
+}
 
 static inline int path_equal(const struct path *path1, const struct path *path2)
 {
-- 
2.53.0


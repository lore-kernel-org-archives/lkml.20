Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBD26738B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246032; cv=none; b=KS3mHZFas4+e20+lu3VTpAbW2vA0agJnEIffbX9YJekmpdPpW/8iOFD08nIo1ig2HY0Cu9vOvpCsmzx4JFvpR98LKEOagrI1CeeKcqlgLi4n/eI+0jx/5B0O5nXgJIv/bQUNDBwOvf2nAR6h5GmMAQwrbd7rdAaWHNiISw/5c64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246032; c=relaxed/simple;
	bh=CrnP/j6cbPUgh+l4ikUyaCHY+R2QqsjDap3IgzAfqBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXpx/sRx7+2/OVrObX824Y/x5P33lbjMpmcsVTpIoYIv6rUuF35h1cm67SMyAVyPGlkpAGMNbNlc8pBFf3nh/wXaNER7AVcCwIFBDVgm2oV3lxOYCeEkNrv4R7T7oo+1n/Y9GQGkB8gqkTYCmz0xCc8eG29tQ4lKjGUG54SPLqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsWjH1B/; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsWjH1B/"
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac4deda6d5so20108427b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791246029; x=1791850829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nd9w4dPTZ+abWi8KVOZVVNdngpKRtmSbi2Eu/1b0iCI=;
        b=fsWjH1B/S9AwS+6+vlsmr8CvOErZ2IOAXdpnetKftnsnmjXfigPwHgIZfi8FMVyYfw
         0C3KLAZQWGyWwbdAOExAu3XeadBWderqzpGottU4WG+qMKYSgCjL6n7BvT7MMUNK3qiI
         khUG/AEK5AmZideyRDECO6t8yUpkxNVIk+Q1wYkbYveYTsGaNfF/8ZMcRNfP/PDTn/i9
         R6EYHESl+xGfQpWvTektSPlWB1o7Gu1ViWYFE184sK5Q7eRytV7D2mlZEDZ/UrPWaooC
         Uzr+vRK8kB48x8PyvaZvZwH10bqWSOXvCciOgs9OQKNBsZukuKopImLen4TTDFwRrKbI
         K0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246029; x=1791850829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nd9w4dPTZ+abWi8KVOZVVNdngpKRtmSbi2Eu/1b0iCI=;
        b=gJv5NOpiz53vOFL1wwLajg72tF4i4uoS1geeoU6BLVE0gHlqtRPofxtf1sSVJ2Mmup
         9nYO9RCWWsX7ybXmirUW7RGJWHBb2mYKtArUCeOoMg9htjPsFre3pkTj49ExfZOZ9X4E
         ugpURHzP8S2b3kxSSXkvL9vSAd6jFjKsRbBcdIyAumS/MuOl4ltVCuJTC2btDQlQqpZd
         D4shjf6h8gKak1x94tNwF9YeZotfa/Mc4I8C532kLsrvk/gUeBgNCnH22iIymMH3XgIW
         OmxjsPDtVkM4UW910rub1lTaWLirPO1otHSjmMDLPqxMOYchcK5lyvutRzK7mqqV/CIu
         N2qg==
X-Forwarded-Encrypted: i=1; AKwUvBxfuOAmgPEJkbBHM9JWHqpaWQ2REd41npsHPzTtM+zu1mXZKMbxuPKkEw0X19k/jywJhP1tf0F44PdlCZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpLYZ5v0+QZOKYC9URnK0hwbgoQjYC/lU007JJaj2hXuFDGSA8
	JXfGJlPnJfOK/cVIk6RU+S8m+H0O0EMARkBC5ogCXV5GqK0zPk3ieAPX
X-Gm-Gg: AYBFou3KD3wfibKGWWoMPpaa2KL9jnyGD3ff62FpQLk4YUwerTey8pSAeqf/2rbOT3m
	WeARgqUXtA1Qf6ggdZB5cMrghK20FgLSEswGKFLo/HfKT1Qw6zWUPkTQrGyivaXlScg4F+FLV6p
	kT/hPeExM/oVdYc/42hcgUZEOK5xVSpHuzC/WrdZ98PWlIemyL4j2xo8ULyOFH6lnbkidJuepem
	BSjqTuREZeDFDKxZdtiSdGcrt5LnESNLMT8zh6ttOuWJyzrGaEXa2T9nv4JM2Okz/joQsDPQ5Pc
	2c/FLd8D1mCIWTH+vxso0zqTEbslZlXEXY0DaPAgAHTV43QoTfuZWi0d4E9Uq5uTR8McfndfY2q
	6+5lxSUP4VWgHD1gl3x4/hIe4tkF/6b/igIA/LUjFEuts052Qh2wjiNENf1nM2Vwb2oUoZBHXw1
	HGPAne9ucW53V4z/+kdMpKPWWO4AnoOBMB57EpYFZT+UlXN8AulhPIxWriqEm/AYixUIHOGdjIO
	37+YOx3N9Nm
X-Received: by 2002:a05:690c:6b12:b0:8af:1c27:9b89 with SMTP id 00721157ae682-8af1c279f0fmr16207967b3.5.1791246029153;
        Mon, 05 Oct 2026 17:20:29 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:6dc9:4ffd:1851:60b1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33be0e58sm46636277b3.43.2026.10.05.17.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:20:28 -0700 (PDT)
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
Subject: [RFC PATCH bpf-next 01/12] namei: introduce __path_walk_parent()
Date: Mon,  5 Oct 2026 20:20:08 -0400
Message-ID: <20261006002020.2890858-2-utilityemal77@gmail.com>
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

From: Song Liu <song@kernel.org>

Factor the step-to-parent logic out of follow_dotdot() into
__path_walk_parent(), which walks a plain struct path to its parent,
crossing mount trees via choose_mountpoint().

This will be used by a VFS ancestor walker serving landlock and BPF.

Suggested-by: Neil Brown <neil@brown.name>
Signed-off-by: Song Liu <song@kernel.org>
[justin: rebased, kept the helper static to namei.c, dropped the
 path_walk_parent() wrapper and the namei.h export]
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 fs/namei.c | 62 ++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 20a6534ea3ef..808fb4bed7c4 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2192,36 +2192,62 @@ static struct dentry *follow_dotdot_rcu(struct nameidata *nd)
 	return nd->path.dentry;
 }
 
-static struct dentry *follow_dotdot(struct nameidata *nd)
+/**
+ * __path_walk_parent - step towards the parent of the given struct path
+ * @path: position to step up from; if it is the root of a mounted tree, it
+ *        is first updated to the mount point that tree is mounted on
+ * @root: boundary not to be crossed; if zero'ed, walk all the way to the
+ *        global root
+ * @flags: %LOOKUP_NO_XDEV returns -EXDEV once @path was updated to a new
+ *         mount; %LOOKUP_BENEATH returns -EXDEV at @root or at the root of
+ *         an unmounted tree, where @path->dentry itself is returned
+ *         otherwise
+ *
+ * Returns: the parent dentry with its refcount incremented, or an ERR_PTR().
+ */
+static struct dentry *__path_walk_parent(struct path *path, const struct path *root, int flags)
 {
-	struct dentry *parent;
-
-	if (path_equal(&nd->path, &nd->root))
+	if (path_equal(path, root))
 		goto in_root;
-	if (unlikely(nd->path.dentry == nd->path.mnt->mnt_root)) {
-		struct path path;
+	if (unlikely(path->dentry == path->mnt->mnt_root)) {
+		struct path new_path;
 
-		if (!choose_mountpoint(real_mount(nd->path.mnt),
-				       &nd->root, &path))
+		if (!choose_mountpoint(real_mount(path->mnt),
+				       root, &new_path))
 			goto in_root;
-		path_put(&nd->path);
-		nd->path = path;
-		nd->inode = path.dentry->d_inode;
-		if (unlikely(nd->flags & LOOKUP_NO_XDEV))
+		path_put(path);
+		*path = new_path;
+		if (unlikely(flags & LOOKUP_NO_XDEV))
 			return ERR_PTR(-EXDEV);
 	}
 	/* rare case of legitimate dget_parent()... */
-	parent = dget_parent(nd->path.dentry);
+	return dget_parent(path->dentry);
+
+in_root:
+	if (unlikely(flags & LOOKUP_BENEATH))
+		return ERR_PTR(-EXDEV);
+	return dget(path->dentry);
+}
+
+static struct dentry *follow_dotdot(struct nameidata *nd)
+{
+	struct dentry *parent;
+
+	if (path_equal(&nd->path, &nd->root)) {
+		/* nd->root is never path_connected()-checked. */
+		if (unlikely(nd->flags & LOOKUP_BENEATH))
+			return ERR_PTR(-EXDEV);
+		return dget(nd->path.dentry);
+	}
+	parent = __path_walk_parent(&nd->path, &nd->root, nd->flags);
+	nd->inode = nd->path.dentry->d_inode;
+	if (IS_ERR(parent))
+		return parent;
 	if (unlikely(!path_connected(nd->path.mnt, parent))) {
 		dput(parent);
 		return ERR_PTR(-ENOENT);
 	}
 	return parent;
-
-in_root:
-	if (unlikely(nd->flags & LOOKUP_BENEATH))
-		return ERR_PTR(-EXDEV);
-	return dget(nd->path.dentry);
 }
 
 static const char *handle_dots(struct nameidata *nd, enum last_type type)
-- 
2.55.0


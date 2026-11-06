Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988904;
	b=OKsWZU5x+fB7vq78dmbYtL+DCPmglFG4uiMEGsvX6PoIBjO9NKuUjASe7CJr7EPraAUu
	 houeZH8FzC9xk85a1oS6QMrmoELb/nbxEK6PQ/jnMjPV7z7p0qQKvuI5H/HMNilwq46Ec
	 +4bo71cxhGyuf0EPDjM69aB4t2jFAkUIhsm7WHuUNeQ81Elxk+ZbUmoJNw5VpXXE9jJDZ
	 I08ka/vLaOWVFLGOUwK9kjMjr/TplYfA/9Drv7I/pCXSCO7FCTAO5OeRDPGrwGq26QRc5
	 4DgQCAVxx/cccxGvN3PGx/wrtMTixQGJAb88Idv/xoKdKNWStz6qnSMWhuUG9tlJAQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DfnthQGT530XBD4xK8fouGBMfFf3/AWAiNhXHcUmwcA=;
	b=QyyrLtEFQPU/Fxq0ex2ldbfpPwAxKHd9tCNfu076lGY9xA9ZYp38VcBk/tcElxGqPyQi
	 tYYMaBWxg6+TRin3JTU5k2ttbm5pwRLd295d7RE0O4M9JDByalkV3vTg9ek/iO/z9GiA5
	 0aAiBB+0pwAStyw76n5ibfcFQhnT7TFFHIbHmawUANf1pBvmoRwuMOd7Q8uqYtzHQi6Aa
	 dfoYA+BTlgdrLLUBuH3K7BeqmFZ3buE53OuEqY1+flDymJRcGTG0xtozpaZcnqbYB9YLp
	 R0b7HR+alXx985aHgsnim3EwDAj6t9JTkf38RXWptu8tieF/xUrGnWsbFE0yiGmuXGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=NyWNLTh2;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F78606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F78606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=NyWNLTh2
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so1410793f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1793988903; x=1794593703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfnthQGT530XBD4xK8fouGBMfFf3/AWAiNhXHcUmwcA=;
        b=NyWNLTh2KuNktgWrvexNqLWSKsigmjEJFnz7uOMCFLGNIU8KwqCL4Vs0HKShgn+vx1
         Qn/KQI28LgJV3lJidR1yF3kS3zjnNKU+wlyTyLPWHjTISQicY3Su0KmVTKEeAcv5EBzK
         m4Lf1Nmhep8RUC9dt/LN2OtJfKDeULe/8l300kQingBcSuRG2Xmrk7bMvR03g/CIijt3
         xD8uZRYYuTtlzP2b1x/BetuusQ10jCDMf/dZHjTWSaGXNG1GxyrszAfB1IWVf8xd5qJS
         lQiEhZtjWRuUY6Cy6uF2ucgk0Zhq0b/1aUz28uitWx0NAL4TYgkK8hiGRfK4dRu5QZVK
         x5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988903; x=1794593703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfnthQGT530XBD4xK8fouGBMfFf3/AWAiNhXHcUmwcA=;
        b=BBsjxuTlz1UnAgi9gBNHDRsA1FhTWzeQnghqSoxuBpxiCuTsL8obSK+QQrPPW/vC6b
         doaJhnUqC6aPam4+Ydu1aay4AiglzdXOCPUo9csRtURLlGonHi+r0bbPFh37FAmW2cMb
         HziK4QACZgZaYIyJ1bAxE/luCVwuYDaOmxm058U86hNIZ5Etv5z1pOeuqMHSVhbmkD+8
         NDk5MLZaUUDHecpqshX9drJEfmQas34Z5XSbD2CZ/oofhJEl0ytPgKaCJtJMNKBQjFgo
         xwX736ZjcVTh9ZRsInw5EmjfNWprSVQABYxF8T6uz1lNOz84XjOLj5uDSjm4ZQVd2pxp
         FhSA==
X-Forwarded-Encrypted: i=1; AKwUvBwDv8kLioryfEAChWO2QRnT4PKlYtxsRTzZO+VvWbNzYSowNA3xdUU/MPOp7qSlaex/51Dpr+qdaSO95rI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WH7NJd/TFLOSVLh6fZbPy02OnDwzVYPQH2Qq9dVmNw0ZUbxz4
	vliFje10VWMQSr40vGTQL1AjgUtireZST0zM+UXOGMHJEQ+h1lzC+XLrBdJK5zm1+ys=
X-Gm-Gg: AYBFou3PHB9CoA2D0bbY5MZv9ncYd5ePLX5JuEN9XY66CmSnvwNx8m7pXpLQ8u1nu/D
	DXxFEFBwg7u2n5Rq4AU3LeI9x6UwXaLabEjrczeDDp1HT9R8JjOP+o4fyDe/2R++nK9rqnqNUKY
	kMNtpiKpzOxsZtqhG2q5K2YcwstHAWAC1VWhT3x4kH5Lom+JXH870DjfaogXPCLJ1cZQZY4MV98
	03B/TMzVDTmJb+v66Ts0mu+3pvzqQ1vl9ae2sxQg7/tXTfJqi8nBWPZTOwh1QpFsCxPmiDaU6LI
	TtWcBJLmJ82wlWc97KcOWqlZ8aUdco66ggHT/5ZIYFqpK2gRbCZCjDqq4ou9LJtkGauxLsbDcxH
	XnBvwRHrH581hM5edpQT+I3I7yxteICqqtONcD7i+L0kYmdNGpEsdlukJ4iF3DWcSDnPhvgoeWh
	pMOUl7FG6MUiPQSCrxakLdA/gOVDXWTS/A/EpcS5+K65uD54fyws3EWiIWxjp1GHUUM3hiQW6g8
	sNEjO28WkyoJoV3Jz8fo5DjBrKL+7I5M0bVO7rFcuO9hEuHdKguvujwxe3U9oU+VdVLOV2y0xym
	tDcjLli/cs2m+BzWdg==
X-Received: by 2002:a05:600c:8b05:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4b6dff855a6mr64101605e9.12.1793988902485;
        Fri, 06 Nov 2026 10:15:02 -0800 (PST)
Received: from athena ([2a06:5b06:b600:300:1983:68c3:80e8:4ae2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm71788845e9.2.2026.11.06.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:15:01 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: miklos@szeredi.hu,
	amir73il@gmail.com
Cc: linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Denis V. Lunev" <den@openvz.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: [PATCH] ovl: release the upperdir/workdir in-use locks before the umount sync
Date: Fri,  6 Nov 2026 19:14:59 +0100
Message-ID: <20261106181459.4166343-1-den@openvz.org>
X-Mailer: git-send-email 2.53.0
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

From: Denis V. Lunev <den@openvz.org>

The in-use locks on upperdir and workdir are released by ovl_free_fs()
from ->put_super(). generic_shutdown_super() calls sync_filesystem()
before that, and ovl_sync_fs() syncs the whole upper filesystem, so the
locks stay held across a journal commit and a cache flush of the upper
fs after the overlay is gone. With index=on a new overlay that uses the
same upperdir, or uses it as a lowerdir, fails to mount in that window:

  overlayfs: upperdir is in-use as upperdir/workdir of another mount,
  mount with '-o index=off' to override exclusive upperdir protection.

Userspace hits this when the last reference is not dropped by umount(2)
itself. Docker with the containerd snapshotter mounts a snapshot on a
thread with a private mount namespace for docker cp and for buildkit,
and the superblock dies when that thread exits, after the reply to the
client has gone out. The next request then gets EBUSY. The window grows
with the flush latency of the upper fs and is there even if nothing was
written through the overlay, as the mount itself dirties the upper.

->kill_sb() is called once s_active drops to zero, with no mount and no
open file left. Release the locks there, before generic_shutdown_super()
runs. What the dying superblock still does to the upper fs, the sync and
dropping its references to upper dentries and inodes, does not touch the
contents of upperdir or workdir. ovl_free_fs() still releases the locks
for a failed mount, so clear the *_locked flags to keep it from
unlocking a second time and dropping the lock of a newer mount.

This takes the sync out of the window but does not close it: the final
mntput of a dying mount namespace runs from task_work, after the exiting
thread may have reported completion. Userspace that needs the
directories free should umount(2) before saying the job is done.

Fixes: 2cac0c00a6cd ("ovl: get exclusive ownership on upper/work dirs")
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
Tested on a 6.12-based distribution kernel, where this code is the
same, with a reproducer built on unshare(1) and with docker cp and
docker build in a container. Built and checked on master.

 fs/overlayfs/overlayfs.h |  1 +
 fs/overlayfs/params.c    |  5 +----
 fs/overlayfs/super.c     | 12 +++++++++++-
 fs/overlayfs/util.c      | 12 ++++++++++++
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 901335026a20..85e167a060f4 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -583,6 +583,7 @@ static inline int ovl_set_impure_dir(struct dentry *dentry)
 bool ovl_inuse_trylock(struct dentry *dentry);
 void ovl_inuse_unlock(struct dentry *dentry);
 bool ovl_is_inuse(struct dentry *dentry);
+void ovl_inuse_unlock_all(struct ovl_fs *ofs);
 bool ovl_need_index(struct dentry *dentry);
 int ovl_nlink_start(struct dentry *dentry);
 void ovl_nlink_end(struct dentry *dentry);
diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 5a15e5478a6b..82e270711dbc 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -849,11 +849,8 @@ void ovl_free_fs(struct ovl_fs *ofs)
 	iput(ofs->workdir_trap);
 	dput(ofs->whiteout);
 	dput(ofs->workdir);
-	if (ofs->workdir_locked)
-		ovl_inuse_unlock(ofs->workbasedir);
+	ovl_inuse_unlock_all(ofs);
 	dput(ofs->workbasedir);
-	if (ofs->upperdir_locked)
-		ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
 
 	/* Reuse ofs->config.lowerdirs as a vfsmount array before freeing it */
 	mounts = (struct vfsmount **) ofs->config.lowerdirs;
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index d9174eaccce2..c7018dde1228 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1609,13 +1609,23 @@ int ovl_fill_super(struct super_block *sb, struct fs_context *fc)
 	return err;
 }
 
+static void ovl_kill_sb(struct super_block *sb)
+{
+	struct ovl_fs *ofs = OVL_FS(sb);
+
+	/* Nothing can modify them now, do not hold them across the sync */
+	if (ofs)
+		ovl_inuse_unlock_all(ofs);
+	kill_anon_super(sb);
+}
+
 struct file_system_type ovl_fs_type = {
 	.owner			= THIS_MODULE,
 	.name			= "overlay",
 	.init_fs_context	= ovl_init_fs_context,
 	.parameters		= ovl_parameter_spec,
 	.fs_flags		= FS_USERNS_MOUNT | FS_ALLOW_IDMAP,
-	.kill_sb		= kill_anon_super,
+	.kill_sb		= ovl_kill_sb,
 };
 MODULE_ALIAS_FS("overlay");
 
diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
index 521717209b2e..517d503fc557 100644
--- a/fs/overlayfs/util.c
+++ b/fs/overlayfs/util.c
@@ -1050,6 +1050,18 @@ bool ovl_is_inuse(struct dentry *dentry)
 	return inuse;
 }
 
+void ovl_inuse_unlock_all(struct ovl_fs *ofs)
+{
+	if (ofs->workdir_locked) {
+		ovl_inuse_unlock(ofs->workbasedir);
+		ofs->workdir_locked = false;
+	}
+	if (ofs->upperdir_locked) {
+		ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
+		ofs->upperdir_locked = false;
+	}
+}
+
 /*
  * Does this overlay dentry need to be indexed on copy up?
  */
-- 
2.53.0


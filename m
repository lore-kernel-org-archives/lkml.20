Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977CF34E766
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406060; cv=none; b=aRvK7VqK5fa+9VSKlsYg2Q3X1R9VGQ0HcNmE20EpNi0AZxOA7QMoYPHzZWc3pTl6BpoIAd7dZ3SEc1hy/+wJEBXKLAo0g5z1ehDpOlSbI6rCdsEsaBJAPw7GxbM7EAuEfJQLkaHnlzU6p8iQiTDsoBddWP9BALwQNlZx4C7xiSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406060; c=relaxed/simple;
	bh=BZ3s97O49b+EAR8Q3zBrxLr2kqYJdhIHQ+/CQ5+RvJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJutjEqK+MdMOy1Elsa6lrbO/3sT1k5yoY6+3GwGZlppxoD0/R/eocBdbdzjzbrysZXWKXgvPqEUD4BZx0P6b4xJiavZZVn1G1iNrdsdThNQXQQFJTFjslyF7vm9Qj2Nx7rHUlbzWfQyOHrty1NX5qqA8W9+VLt0oHjbpJGmNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz0fX8yJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz0fX8yJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so932309a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406058; x=1791010858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuCHSLDBBboZlHuOfK9lMUVu77IH1LyXyjN9G3YNN6g=;
        b=Gz0fX8yJsVOz1Ka6dlTufaVQtHAcC+daj8TkWuLJvAU9S1JTSYk5niNDijcsdDV+8W
         xfDw6fJHQDjFRnpQW+v5YLOue+ywo1qGefO8uB4nknUDsu9+RerPK6m3x1fPIgSNXbHs
         AgEajDZbjjHB8XQuQZKyHqMb3y51tUBtC2MMdY8jrqkNm7gh0MnlaoTWkOtxJjyxYnp6
         gi3GvABUBwo2Zm2I+QecKAYT/eHp23aPhycd55D3QNhwlQigLZ7bY5fW/dAT1wL2EELH
         SsFyIOtf+9byjM6wgbwgBZf8p6APGoorrpm/Fm+m9aIxl4PCqqeIB4O8SOhHNVr0sHl8
         edKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406058; x=1791010858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuCHSLDBBboZlHuOfK9lMUVu77IH1LyXyjN9G3YNN6g=;
        b=abMapamGZlNYlcfh8TrvzJ4WcFigNrYenWQDqCP0e7SibcG861n378Cpj+G5P6g6UQ
         kdN+pkeKcWv1cyYqr9sJ+gDzuK2QhHrtysdTFuX98rcB/D5h7ziZlvCLUlUEhJj/yt0H
         tGHd3Q9MkqwcdpDgKt3HxVZyqaLNbR6WqRUdhW16KIGNO/avYcBiYnm5h4Uit+iY5E/c
         70gp483j4UwoQJNvGpKjQ2nDNJgkvpW4UaVyXDiESIufLpPMkAadXU8mcJDtjabB6VTO
         BCu3dOM9PwV6x5HEPvIJcCt0lzecxmqBqdbCxTWFvlRpYZhkRSXFBuX5UtnCXeKgVnf4
         eQjA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ++rJKY1MORxI4Xn91oPHWETo2ctozRvkIkoKTiNCQLJPlhhMAXMLfqhPHx0xK5WpMXS3kgpZHXl2Kf8=@vger.kernel.org
X-Gm-Message-State: AFuF++m+BikRjH19YpxqiFP3rjsaBnUqbdqEYvHEkF8T069WpcqnKgMn
	8haTjfrSL8deSJzxyUTHU4e0+IFg0xopFkBwqDX+CO3D9e/5wjbUi7pv
X-Gm-Gg: AYBFou0jge0N3DExZXh5mlTxnr6Dql5ctPSO5IKAIb8whNL5zeMkbdiL4aFOO0kiG3z
	u1V7h2Fwk+5GhYPj5ORQ9Kw3r+zt6NSjDQvIItOUPzXVtWznxP4Mne2Ae9K5eeQtox7yaaUF/4/
	W1tkrW7SH5MH7zOX48v28/YDv3zJHMLyy4JEIv7KHIaBUDCndrOsc/SqODz3qBDKGjXya7Dxmuz
	KVONumUhZlfySGtV0W/KB71R+XQLtbEX1AeFmMySp5kbjYE83Hq9DrBSLJ97eBGOEZ3byRTKcuq
	obmJqsgoKuvnvyOVubQP8r6326CNoh4Tn3sHJpt5Mg4Qw+Wgv7YwsOfdJz/vCksU/Sv16+0cBZX
	yQTblnPV3qmB6S1qyM/0krvhGjRm7K5x0QkROpnJxYveaOvwGDP49Nphu2UqyHLMTW+Tkl3NdsX
	gp+0sL3X48y7G/PdyFPmd7IaMtzmOnQkk0EKWBxkAjDgiYlIsq+AH4GqQgbGtyL3vBL2szOQ==
X-Received: by 2002:a17:90a:d2c6:b0:3a0:e245:7c1b with SMTP id 98e67ed59e1d1-3a0e2457d6dmr516596a91.37.1790406057923;
        Sat, 26 Sep 2026 00:00:57 -0700 (PDT)
Received: from [10.1.2.130] ([67.185.120.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm15987119a91.4.2026.09.26.00.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 00:00:57 -0700 (PDT)
From: Kir Kolyshkin <kolyshkin@gmail.com>
Date: Sat, 26 Sep 2026 00:00:53 -0700
Subject: [PATCH v2 1/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com>
References: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
In-Reply-To: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
To: Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>
Cc: Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>, 
 David Howells <dhowells@redhat.com>, Amir Goldstein <amir73il@gmail.com>, 
 Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
 Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 containers@lists.linux.dev, Kir Kolyshkin <kolyshkin@gmail.com>
X-Mailer: b4 0.14.3

A recursive open_tree(OPEN_TREE_CLONE) copies the nsfs mounts of any
mount namespaces pinned below the source.  When the clone is attached
inside a mount namespace younger than a pinned one, move_mount(2) fails
with ELOOP from check_for_nsfs_mounts(), per the rule from commit
8823c079ba71 ("vfs: Add setns support for the mount namespace") that
prevents mount namespace reference loops.

This breaks container runtimes that use OPEN_TREE_NAMESPACE, such as
crun [1].  The new namespace is younger than everything else, so bind
mounting e.g. the host root fails on any host that pins a mount namespace
(snapd does, under /run/snapd/ns).  By the time it fails, setns() has
already run and userspace cannot recover: the host tree is out of reach,
and the offending mounts cannot be unmounted from the detached copy.

copy_mnt_ns() and create_new_namespace() already leave these mounts
behind; only get_detached_copy() copies them.  Add an open_tree() flag to
drop them from the clone, as suggested by Aleksa [2].  Locked nsfs mounts
are dropped the same way copy_mnt_ns() does it, so nothing new is exposed.

Keep it opt-in: open_tree(OPEN_TREE_CLONE) plus move_mount(2) is how
mount --rbind works through a file descriptor, and in the caller's own
or an older namespace such mounts remain usable.

The flag requires OPEN_TREE_CLONE or OPEN_TREE_NAMESPACE.  With the
latter it is a no-op, so a runtime can pass it unconditionally.

Link: https://github.com/containers/crun/issues/2262 [1]
Link: https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spills-ywC2O3@cyphar.com/ [2]
Assisted-by: Claude:claude-opus-5
Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 fs/namespace.c             | 14 ++++++++++++--
 include/uapi/linux/mount.h |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index ae5dc64f8b45..a95173996a8f 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -3062,7 +3062,8 @@ static struct mnt_namespace *get_detached_copy(const struct path *path, unsigned
 			ns->seq_origin = src_mnt_ns->ns.ns_id;
 	}
 
-	mnt = __do_loopback(path, (flags & AT_RECURSIVE), CL_COPY_MNT_NS_FILE);
+	mnt = __do_loopback(path, (flags & AT_RECURSIVE),
+			    (flags & OPEN_TREE_DROP_MNTNS_MOUNTS) ? 0 : CL_COPY_MNT_NS_FILE);
 	if (IS_ERR(mnt)) {
 		emptied_ns = ns;
 		return ERR_CAST(mnt);
@@ -3204,7 +3205,16 @@ static struct file *vfs_open_tree(int dfd, const char __user *filename, unsigned
 
 	if (flags & ~(AT_EMPTY_PATH | AT_NO_AUTOMOUNT | AT_RECURSIVE |
 		      AT_SYMLINK_NOFOLLOW | OPEN_TREE_CLONE |
-		      OPEN_TREE_CLOEXEC | OPEN_TREE_NAMESPACE))
+		      OPEN_TREE_CLOEXEC | OPEN_TREE_NAMESPACE |
+		      OPEN_TREE_DROP_MNTNS_MOUNTS))
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Only meaningful when a tree is copied.  OPEN_TREE_NAMESPACE never
+	 * copies pinned mount namespaces, so there the flag is a no-op.
+	 */
+	if ((flags & OPEN_TREE_DROP_MNTNS_MOUNTS) &&
+	    !(flags & (OPEN_TREE_CLONE | OPEN_TREE_NAMESPACE)))
 		return ERR_PTR(-EINVAL);
 
 	if ((flags & (AT_RECURSIVE | OPEN_TREE_CLONE | OPEN_TREE_NAMESPACE)) ==
diff --git a/include/uapi/linux/mount.h b/include/uapi/linux/mount.h
index 2204708dbf7a..ac865edac517 100644
--- a/include/uapi/linux/mount.h
+++ b/include/uapi/linux/mount.h
@@ -63,6 +63,7 @@
  */
 #define OPEN_TREE_CLONE		(1 << 0)	/* Clone the target tree and attach the clone */
 #define OPEN_TREE_NAMESPACE	(1 << 1)	/* Clone the target tree into a new mount namespace */
+#define OPEN_TREE_DROP_MNTNS_MOUNTS	(1 << 2)	/* Drop mntns mounts from the clone */
 #define OPEN_TREE_CLOEXEC	O_CLOEXEC	/* Close the file on execve() */
 
 /*

-- 
2.55.0


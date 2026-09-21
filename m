Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012934A8433
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004142; cv=none; b=Xzl225n7H1vpjx/ofH9t+GqHEocOvup7UGbNLXtFx7oDIT4RDL8XtjwlsPN1i44DWTPbMSg9N+5wr5qg4rr8BN9x9ACsd05UoXL2Yqj6RZktAk////5sdDqTpY6D+/Tnx3fRuGU0iK7Rirqit1jNODWQAZf4va7UbtGqSSEA1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004142; c=relaxed/simple;
	bh=Qrjq3GF8zqqRi7eBe4TO5ATX4Z027sHFlu3vrKg/1+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT5E1rqPWkwwNLoXO52OsB0znGuHF841gChFugrNU4QfliZpjQChhavE0Y75P1I9PsBjouQTQb3skABA+HH6v64A+f7nm1aqpLbSLzGcZ4DJs+eL4nupbaQz5RDzsewVtibHzkU5rbSmCGQA4g1Vkel1ZiJzfnA63waAT9qoi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC1JhXnz; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC1JhXnz"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-811424a645bso869593a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004139; x=1790608939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4xU0nqrQ8g7FJSumFsB8Q8qsMur42hfNo4/mC2b2KQ=;
        b=VC1JhXnza1ZnssGdnWU9+m9aTdnKqyokPWpd2newizc23JQZb7a1CLrXg6SQtDKigc
         fzEJeh/QnwpDTYwZ5+Z62ZCswwcO63K6ahOcXBtDoBP+dT0pUdgDL+hn32eKZ100UVF7
         +m1O4UYTR/icJn66mrYtVDtLnZ5vbpGR8al7H37gOzAeQZ+gilesRsYDJoK4QUzU+2Oz
         W7nQtxJVHJYldbJuviAXDRG/uhBhMkrRGZVNK8YoSNTHs7hiwecarMwYLZFkbNUVz3xg
         ZylTuHq0tSj4b56FOEECCZum6RYSZE8PBsXoHSm0t37Rdr25GEpKKP2nAPx0iBUNmzcU
         gDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004139; x=1790608939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4xU0nqrQ8g7FJSumFsB8Q8qsMur42hfNo4/mC2b2KQ=;
        b=hVX82NodyTp2uVFGlMB0cNxUX9rdzuxTPvkgsgZaYkXIqSzZwJPlUR9BEMFuGFHqxW
         cT4mXY6TuENlVNhv7kdH/fP3bBYdzXDuRWuIBOHN1lflO9BWDsZNFce2e1YF6iUWC8FR
         DqIp41V6nDoKJ/t28x8EjZzBQTQzQMUshjlYiOW3ygDwTeoI8CVAC/Qet0mPd4ouXXnE
         2tK06bppaw3seSitSBP5wPVB7gJZDQmInJUETQJ3/s2fiX3V9bpKNbitO1Vkw3hxoXLY
         1s4TGrXkF2pcDEOIIY7qhJHTf6CTT61NcEqW9SjkQc5jRVt46GUqVyi8jKyja8XudY2h
         Zavw==
X-Forwarded-Encrypted: i=1; AKwUvBw5QRflSB7HJpI546tAFouXhh2TsWCD34WwJZA/YHgy4u3xflrOj51GsPkHvRUUJGRbyJByAjuJJK+q2LU=@vger.kernel.org
X-Gm-Message-State: AFuF++k+pRcOn14aJMG2Z6rImovsj0w87aFGrVODeUrC1HO4pfMpwUQC
	r3c8X0RgduqAu4Wc3c/9o6jGeMI6y7xYEEk8gImLIKfVjJH7orHrfLKw
X-Gm-Gg: AYBFou0szVPixLF/gQpcjbjGQSo5B2GcSBpwHzzjq8S2YUGSlhZZe2H5E6iehWI9Qry
	lYksw0g6FSeMiEPjQkTIHC+M4YojA+frhwFsWS6DVjqHJcvIKwqqI9H/5BBIg4QOrY81/9Mjpnc
	S979m7+Uix6pa2o76AyNf7JfFlNTfx0n5fKQR89rC0Jom0C7HD8dLfRp7GFbM5TFcdjcbX+Pr5p
	ztluj7Hlj7843t58WYNPWzQWvLJUPiHOs7Qdn/36BcZ0Kz/1ktIhC5+nFQkqhkkBNBsRctDmB2g
	w5hRgpi5UfF/ZIEsImEYNB1jYVgmTbU9CCepmCjynnNYqkSgsG6jKPF+OPDBzhU0UfRH6o1jANh
	1IxLndCUi+q8oEo9e/V4XDPozgBnuQL7G3LQek2B/B799FOI52Kwr3GInZr7VfUIioP7GYO3cp4
	vX4rsnv3w3gbSyMjYJuraP/i8oDuLXqPNg93vOig9d/sny3NKvGNL8Rav5g5gh9HU=
X-Received: by 2002:a05:6820:4cc8:b0:6b7:83c5:fdef with SMTP id 006d021491bc7-6ca9c45b8cdmr10810453eaf.48.1790004137290;
        Mon, 21 Sep 2026 08:22:17 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d1476b906asm185690eaf.14.2026.09.21.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:16 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: konishi.ryusuke@gmail.com
Cc: dubeyko@comp.asu.ru,
	linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v4] nilfs2: fix checkpoint root lifetime on sysfs errors
Date: Mon, 21 Sep 2026 12:19:39 -0300
Message-ID: <20260921152144.3983736-2-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921152144.3983736-1-qwe.aldo@gmail.com>
References: <CAKFNMonYVUbzjYm343Aw-=xjUk78x4EdUwGBfNRwE6zfmRVhvA@mail.gmail.com>
 <20260921152144.3983736-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nilfs_find_or_create_root() links a new checkpoint root into the
checkpoint tree and drops ns_cptree_lock before creating the root's
sysfs group.  If nilfs_sysfs_create_snapshot_group() then fails, the
root is freed while it is still reachable from ns_cptree, so a
concurrent nilfs_lookup_root() can dereference freed memory.

nilfs_sysfs_create_snapshot_group() allocates memory and creates sysfs
nodes and may sleep, so it cannot run under the ns_cptree_lock spinlock.
Reorder the creation path so that the sysfs group is set up before the
root is published: initialize the root, create its sysfs group outside
the lock, and only then take ns_cptree_lock to link it into the tree.
On sysfs failure the root was never visible and is freed directly; in
the unlikely case a root with the same checkpoint number is already
present, the sysfs group of the new root is removed before it is freed.
Concurrent insertions are already serialized by ns_snapshot_mount_mutex,
so only the race against nilfs_lookup_root() needs to be closed.

Because kobject_put() does not guarantee that the embedded kobject's
release callback has run by the time it returns
(CONFIG_DEBUG_KOBJECT_RELEASE defers it), the container must not be
freed until the release completes.  Keep that wait_for_completion() of
snapshot_kobj_unregister inside the sysfs helpers, so both the creation
error path and nilfs_sysfs_delete_snapshot_group() wait for the release
before their callers free the root.

Fixes: dd70edbde262 ("nilfs2: integrate sysfs support into driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
Changes in v4:
  - Keep ns_cptree_lock as a spinlock instead of converting it to a
    mutex, and create the sysfs group before taking the lock, as
    suggested by Ryusuke Konishi. Concurrent insertions are already
    serialized by ns_snapshot_mount_mutex; only the race against
    nilfs_lookup_root() needs to be closed.
  - Move the wait_for_completion() of snapshot_kobj_unregister into the
    sysfs helpers (create error path and delete), so the checkpoint
    tree functions no longer manage the kobject completion state, as
    suggested by Ryusuke Konishi.

Changes in v3:
  - Move wait_for_completion() out of the locked section in
    nilfs_put_root() (the mutex-based v2/v3 approach; dropped in v4).

Changes in v2:
  - Serialize the sysfs registration against the tree instead of adding
    a second lock, as suggested by Viacheslav Dubeyko.

 fs/nilfs2/sysfs.c     |  5 ++++-
 fs/nilfs2/the_nilfs.c | 34 +++++++++++++++++++++-------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/nilfs2/sysfs.c b/fs/nilfs2/sysfs.c
index bc52afbfc5c7..5bb74a45ad1e 100644
--- a/fs/nilfs2/sysfs.c
+++ b/fs/nilfs2/sysfs.c
@@ -195,8 +195,10 @@ int nilfs_sysfs_create_snapshot_group(struct nilfs_root *root)
 					    "%llu", root->cno);
 	}
 
-	if (err)
+	if (err) {
 		kobject_put(&root->snapshot_kobj);
+		wait_for_completion(&root->snapshot_kobj_unregister);
+	}
 
 	return err;
 }
@@ -204,6 +206,7 @@ int nilfs_sysfs_create_snapshot_group(struct nilfs_root *root)
 void nilfs_sysfs_delete_snapshot_group(struct nilfs_root *root)
 {
 	kobject_put(&root->snapshot_kobj);
+	wait_for_completion(&root->snapshot_kobj_unregister);
 }
 
 /************************************************************************
diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
index ecd71c190885..1d5d2293c9c7 100644
--- a/fs/nilfs2/the_nilfs.c
+++ b/fs/nilfs2/the_nilfs.c
@@ -869,6 +869,26 @@ nilfs_find_or_create_root(struct the_nilfs *nilfs, __u64 cno)
 	if (!new)
 		return NULL;
 
+	new->cno = cno;
+	new->ifile = NULL;
+	new->nilfs = nilfs;
+	refcount_set(&new->count, 1);
+	atomic64_set(&new->inodes_count, 0);
+	atomic64_set(&new->blocks_count, 0);
+
+	/*
+	 * Register the sysfs group before publishing the root in the
+	 * checkpoint tree.  nilfs_sysfs_create_snapshot_group() can sleep,
+	 * so it must run outside ns_cptree_lock; creating it first also
+	 * ensures a concurrent nilfs_lookup_root() can never observe a root
+	 * whose sysfs registration later fails and gets freed.
+	 */
+	err = nilfs_sysfs_create_snapshot_group(new);
+	if (err) {
+		kfree(new);
+		return NULL;
+	}
+
 	spin_lock(&nilfs->ns_cptree_lock);
 
 	p = &nilfs->ns_cptree.rb_node;
@@ -885,29 +905,17 @@ nilfs_find_or_create_root(struct the_nilfs *nilfs, __u64 cno)
 		} else {
 			refcount_inc(&root->count);
 			spin_unlock(&nilfs->ns_cptree_lock);
+			nilfs_sysfs_delete_snapshot_group(new);
 			kfree(new);
 			return root;
 		}
 	}
 
-	new->cno = cno;
-	new->ifile = NULL;
-	new->nilfs = nilfs;
-	refcount_set(&new->count, 1);
-	atomic64_set(&new->inodes_count, 0);
-	atomic64_set(&new->blocks_count, 0);
-
 	rb_link_node(&new->rb_node, parent, p);
 	rb_insert_color(&new->rb_node, &nilfs->ns_cptree);
 
 	spin_unlock(&nilfs->ns_cptree_lock);
 
-	err = nilfs_sysfs_create_snapshot_group(new);
-	if (err) {
-		kfree(new);
-		new = NULL;
-	}
-
 	return new;
 }
 
-- 
2.43.0


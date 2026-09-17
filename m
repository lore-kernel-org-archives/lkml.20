Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921E49CF59
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686830; cv=none; b=Ub45JEIMQPz16/jCaVhP4n4drtlCsLsZB8ZPZCz1qFAFTIhLde1nHWJB0ymyYg6oVtOq8eO7EVGBK+IQkPY4p1WmAilShS6SajiLJAE6Qf4DYo92NY8NAwmBEkqgs3tGNjBg6a6Yaq2dDe0n/fYNKM2n2Qd6ggRuX6jWWdzZwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686830; c=relaxed/simple;
	bh=rKECdrtTh/9oQNX26orwPLtHO7/P7wNEuMGKh24NjWA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Exbb1zkwqcaqw0zC33wcbIsLChBxq/0eii6CSwxzwh+X3EtT+eAjoqXTgeXVhXGOQDAHsCSQ5ZtOqjakA4YeJIs/7qunvWfLEztcEmqcMtBe+IdrkPDRZejlcNCnYgDeDLWwTuoqMZ47yo+N7BvgEuuHhxOtlOdzvgOeDnRuTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b36cf0d9d3so182138eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686817; x=1790291617;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o8qnUyPomWwbZH7Op0ArgLcle/V7rGz3218A1pVlEDs=;
        b=klFmQit79LuSjOTgsi+p7/xOetkIGpLX4HfjdgsTsFNteZsb6rAwKuiuVDwiPFhPGc
         Cx6BWooQxYKI+PIuUxdvnOKmL6Kv3fZ0QDT/hT0H6/vRDRrgRXfSuM0HTpn0qiqwXaXX
         skwZWPH0l1RJqO06+ntdIuef24OLV8lN2RELphMzcBy9bBAhyZFMfXNxlTywVJDvqQoM
         VrVkrMFdko02C+gSoID5ULZuZFyZs8E/kRd1o+U/4EAFusZUmiTjKCszQxbgSnRxyClo
         H3DrxCXhoPvtFTbu3sCsdWwJ4l0Lm2UKjHZvaHc4JNWAI9cw6lmtQo6ewx4jlsjq6PZO
         g06Q==
X-Gm-Message-State: AFuF++ksQyQi4dOr8zjaD+9l8izbFZ58vWlG83PHaeCuTl9mesRIcyPC
	E1e8spinww/tOUCD4BKvWaOpS5xwAordWWAQ4+7KRiGRYzCFApMuPGYD/Z66UGWP4D6SznaTkFL
	vr1TuMVifo80snVyt072Qenwy+hlYPAhRGWMooetWwcjQOxlrPLMe7gp8F5s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b82:b0:6c9:80d8:a1f1 with SMTP id
 006d021491bc7-6ca9cb53b91mr570939eaf.46.1789686817183; Thu, 17 Sep 2026
 16:13:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:13:37 -0700
In-Reply-To: <6aaab8e8.bbedf9ee.1860ea.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac7421.87c06881.1db2b3.001b.GAE@google.com>
Subject: Forwarded: [PATCH] romfs: reject directory entry chains that do not
 move forward
From: syzbot <syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] romfs: reject directory entry chains that do not move forward
Author: raghunathpalla.0209@gmail.com

romfs_lookup() and romfs_readdir() walk a directory's entry chain by
following ri.next, and stop only once the offset is zero or past the end
of the image. Nothing stops an entry from pointing at itself, so on a
crafted image a lookup of a name that is not present spins forever.

That loop has no cond_resched() and no signal check, so the task cannot
be killed, and it spins with i_rwsem held and the dentry left in the
in-lookup state. A second lookup of the same name then waits forever in
d_alloc_parallel(), and it is that waiter the hung task watchdog
reports, which makes this look like a dcache problem:

  INFO: task syz-executor239:5636 blocked for more than 143 seconds.
   d_alloc_parallel+0xd13/0x16c0 fs/dcache.c:2839
   __lookup_slow+0x82/0x2f0 fs/namei.c:1904

Require the chain to move forward and return -EIO if it does not. File
headers are laid out in increasing order and both loops already treat
the chain as a bounded forward-only walk, so this only enforces what
they assume. In romfs_readdir() a cycle never advances ctx->pos and has
getdents() repeat entries forever, so check there too.

The hard link chain bounded by commit d30b5a954e0a ("romfs: detect hard
link cycles") is a separate one. Sangho Lee posted a fix for this chain
in July 2026 that validates it at inode instantiation; it has had no
replies.

Reported-by: syzbot+e8ebfecec06a009dd2d3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e8ebfecec06a009dd2d3
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf

 fs/romfs/super.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 7f783d6173e8..846b57f265ef 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -143,7 +143,7 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *i = file_inode(file);
 	struct romfs_inode ri;
-	unsigned long offset, maxoff;
+	unsigned long offset, maxoff, next;
 	int j, ino, nextfh;
 	char fsname[ROMFS_MAXFN];	/* XXX dynamic? */
 	int ret;
@@ -191,7 +191,16 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 			    romfs_dtype_table[nextfh & ROMFH_TYPE]))
 			goto out;
 
-		offset = nextfh & ROMFH_MASK;
+		/* likewise, a chain that does not move forward would have
+		 * getdents() repeat entries forever
+		 */
+		next = nextfh & ROMFH_MASK;
+		if (next && next <= offset) {
+			offset = maxoff;
+			ctx->pos = offset;
+			goto out;
+		}
+		offset = next;
 	}
 out:
 	return 0;
@@ -203,7 +212,7 @@ static int romfs_readdir(struct file *file, struct dir_context *ctx)
 static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 				   unsigned int flags)
 {
-	unsigned long offset, maxoff;
+	unsigned long offset, maxoff, next;
 	struct inode *inode = NULL;
 	struct romfs_inode ri;
 	const char *name;		/* got from dentry */
@@ -245,8 +254,15 @@ static struct dentry *romfs_lookup(struct inode *dir, struct dentry *dentry,
 			break;
 		}
 
-		/* next entry */
-		offset = be32_to_cpu(ri.next) & ROMFH_MASK;
+		/* next entry; the chain must move forward, or a corrupt image
+		 * will keep us here forever
+		 */
+		next = be32_to_cpu(ri.next) & ROMFH_MASK;
+		if (next && next <= offset) {
+			ret = -EIO;
+			goto error;
+		}
+		offset = next;
 	}
 
 	return d_splice_alias(inode, dentry);
-- 
2.34.1


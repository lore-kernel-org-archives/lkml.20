Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266588;
	b=QHSheevFQqaOckO6XgjlRDU/47jhsKRJh5MQs0tW/+Ey1pgsr9OLql1oSvq11jZ+Eb7l
	 mSa0NRk+5Whej3QpS/BBV5t5MhauXXRI5gWNnB944zqACSB59l+gsBiSJp6VAOroonlAT
	 fNrfIqouVtNY23idG8knTE8xS2M4QqQaeCcIwMkG0RosbEaHJGu9x55TIO30xJc/NELdJ
	 +sig4JgnQA4/G3fCqoer4ZXsfGryUUp3MknfvyeJnGd6k24HCV17fd6KBZz9XCVITz9iq
	 i1yxQZN+3VD7cpdcb2I5f2zkW9KCjQTnh/wxnbB2VQ5zE/ey4Dqp14+0Sc1JSNtF4Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266588;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QbA0yKmP1tqlBqk0XBzSCkNF2nGhAJ8D22bj1XP53Cw=;
	b=idwD8vlOp3L7LyD021UK5nNp7D1k8fZrhoL9r+KZaVdbzxSoMkO7zfsQV0ntB7SPherq
	 7UBBkR5HZCKzHyodqLHlqBb+HTbo+tgGnqIbuPOjUX5Aak8AGBnUQe8cKdO9c7RGtHshK
	 wbKOVwX+e6HQjmeZHGfmx6mQ/c+fIIGyE2UYb7DJC4UeOJXwmMtFJYBg4Xxma6f67LoYg
	 30S7DfBUAAQbDRjQdM+XAgR7fUud/nX7X2xV17+KNXIOGFpa0yPnxgX3JEzIvaf8m/phS
	 kAYlqpoKONougm89H3LMG2UTt22e+hVKEQfUu4E4Im0dSJSWa/Yx8puQOdxPGxdldrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PGgBTEDI;
	arc=none smtp.remote-ip=203.205.221.205
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB67606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB67606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PGgBTEDI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793266584; bh=QbA0yKmP1tqlBqk0XBzSCkNF2nGhAJ8D22bj1XP53Cw=;
	h=From:To:Cc:Subject:Date;
	b=PGgBTEDIDNOZ/VFluDkAckBsho8ULubxskIr6n3Els+o0aHyGGh9T81DhK+ca6Ci8
	 lPHzDpB+wYKGBF3DRZiboceNVAE/CmW3rEHDYaFiJgHRZGUAdboAhAAn86YzenoDBb
	 oQ/y3QCcLRA4NT81bswJ9RsB+iE15Nv8eu8X8h/o=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 91620CBE; Thu, 29 Oct 2026 17:36:22 +0800
X-QQ-mid: xmsmtpt1793266582tlfqundro
Message-ID: <tencent_B7C43D503A8965459EB1690D174EEC604205@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5boKhaSNR/rZUOKK1Y7onsMxuQ/UyWk3DK8LolyXwmRPNEPA01c
	 ag5fh9X19epMPLFmR5ffz7KDTvDVrfN+M74wPSF51KSIOHgnxwFrFZqHkghEBuGJXK4ddHH5BzJY
	 JREsbDwupMmSgx7atnGQUyh/ii0Z63Zq+qvaWkQGOTaXCOSBHxrw5+kn0adRA8c8tz8b5nPeKiZT
	 XUWxd83gZkUmmhpwnGhp4qn3QoHZp/hJ34inParppM33zDw7QXQyoUquB9B1Zfc0Tf8PloCtW41U
	 q0+lp4NxK93sRiRxBsJ7ghfvWWHz/DTS4q24JU3yhoZGONm2qPOfrQBqMxNS/7xTXk+yv9G1Iuz7
	 fwJp1HXuK2+DAcaLNyzeKx6D/X7DctVF7nxPFAiNC43yRg/Q7HQyLQyQPQVJ9CKlggzKzm8O9RyF
	 Xs0dtNk6fQxVsuLq7ubI2eg/jYsi1A7Z321KYL5bwOLs8bYE9/dQxn4CUX7nYnQ3q03znMfz/Kg6
	 h4w3Kh+SPmERsj3oHpsB51rbm5wN5SZPwPdyT11LdrgmdhH6r9klg1mGQRXZ6IG/qZaGdYcqN0L3
	 ClK3UlUF8ojcosddKfYY1Mnzm1OLsjn0EzQuBjF8pGYvNCDhKb9ejhjLksdExhdcy69ECyp59IFd
	 oGrRPcS5NsJH9rLXy37MyGYwujDVLvhoKjIdXCvRmKBh3UxwrgJu+Hh5OqoGajuVh+SGT2eou0k1
	 zQw3pzM8fTEwjXzXbXzKyD2XjM3mgE3Be2952e3QzssuX9+ad8sd0JNTtnuRUt8PL6gqwsVoSxFf
	 hZURfnoYwFlgsapOcxhqf7BgSHSnKDIP+CwdRux5+HBH5tQ3kXABeQouUWmoWof/R5SBoMegjbAh
	 5db0uZShXi8V05rnQsWZmkSDfQnvXfvUgNwvvIf4+50uDNX42kHniQ5OlYSmBrUKkJWJztje6yMK
	 ofjITAhQwD2z0q4rAIRggV6e6Z4cefEC2DOp2ac3B2BLQEty/MxFL8ebXXwl6Q9Avp2Xn+skklsr
	 MnNHztaglmax0wvCS14qIPUvZ064ioN7uWH42mr9iGkGnR4xzE2BenLrJwL5a/FV+1K2Zj7OVs7p
	 Ksd0L3T+Cm2IqLEh4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at,
	chengzhihao1@huawei.com,
	syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: prevent xattr_sem -> fs_reclaim deadlock
Date: Thu, 29 Oct 2026 17:36:22 +0800
X-OQ-MSGID: <20261029093622.3152309-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
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

do_jffs2_setxattr() and several other xattr paths allocate memory
(e.g. jffs2_alloc_xattr_datum() via kmem_cache_alloc() inside
create_xattr_datum()) and write to flash while holding
c->xattr_sem, using GFP_KERNEL.  Such allocations may enter direct
reclaim and take fs_reclaim, establishing the
xattr_sem -> fs_reclaim dependency.

kswapd, on the other hand, holds fs_reclaim while shrinking
dcaches and inodes: shrink_slab() -> prune_dcache_sb() ->
dentry_kill() -> evict() -> jffs2_do_clear_inode() ->
jffs2_xattr_delete_inode() takes down_write(&c->xattr_sem),
giving the reverse fs_reclaim -> xattr_sem dependency.  The
resulting lock cycle can deadlock:

    CPU0                    CPU1
    ----                    ----
    lock(xattr_sem)         lock(fs_reclaim)
    lock(fs_reclaim)        lock(xattr_sem)

syzbot reports exactly this circular dependency with lockdep [1]:
kswapd0 acquiring xattr_sem in jffs2_xattr_delete_inode() while
holding fs_reclaim, with the recorded chain showing
do_jffs2_setxattr() allocating (jffs2_alloc_xattr_datum() ->
kmem_cache_alloc() -> fs_reclaim_acquire) while holding
xattr_sem.

Fix it by wrapping every critical section that holds c->xattr_sem
and can allocate memory or write flash with
memalloc_nofs_save()/memalloc_nofs_restore(), so allocations made
under xattr_sem never enter direct reclaim.  This cuts the
xattr_sem -> fs_reclaim edge; reclaim contexts taking xattr_sem
remain harmless.  The covered paths are:

  - jffs2_xattr_delete_inode(): delete_xattr_ref() writes flash
  - check_xattr_ref_inode(): load_xattr_datum() allocates,
    delete_xattr_ref() writes flash
  - the write-lock upgrade sections of jffs2_listxattr() and
    do_jffs2_getxattr(): load_xattr_datum() allocates
  - do_jffs2_setxattr(): create_xattr_datum() allocates,
    save_xattr_ref() writes flash (both lock sections)
  - jffs2_garbage_collect_xattr_datum() /
    jffs2_garbage_collect_xattr_ref(): jffs2_reserve_space_gc()
    may trigger GC, save_xattr_datum()/save_xattr_ref() write
    flash
  - jffs2_verify_xattr(): do_verify_xattr_datum() reads flash

jffs2_xattr_free_inode() is deliberately left alone: it only
frees memory and cannot allocate.

A related but distinct cycle between fs_reclaim and &f->sem
(jffs2_do_read_inode() allocates while holding f->sem during
iget) also exists; it is a separate issue not addressed here.

Verified with the syzbot reproducer under QEMU (mtdram + JFFS2 +
OverlayFS, CONFIG_PROVE_LOCKING=y): without this patch lockdep
reports the xattr_sem <-> fs_reclaim cycle reproduced above;
with this patch that warning no longer appears.

[1] https://syzkaller.appspot.com/bug?id=eefefd759ef3b48ddad4da086ff8f4b9194576f9

Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/xattr.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 6b4f68593c29..7b873fe2e08d 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -15,6 +15,7 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/sched/mm.h>
 #include <linux/fs.h>
 #include <linux/time.h>
 #include <linux/pagemap.h>
@@ -598,10 +599,20 @@ void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache
 	/* It's called from jffs2_evict_inode() on inode removing.
 	   When an inode with XATTR is removed, those XATTRs must be removed. */
 	struct jffs2_xattr_ref *ref, *_ref;
+	unsigned int nofs;
 
 	if (!ic || ic->pino_nlink > 0)
 		return;
 
+	/*
+	 * delete_xattr_ref() below writes flash nodes.  This function runs
+	 * from inode eviction, i.e. memory reclaim may be waiting for this
+	 * lock.  Keep allocations under xattr_sem out of direct reclaim so
+	 * that holders of xattr_sem never wait on fs_reclaim -- otherwise
+	 * reclaim contexts taking xattr_sem while holding fs_reclaim can
+	 * deadlock with the setxattr() paths doing the reverse.
+	 */
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	for (ref = ic->xref; ref; ref = _ref) {
 		_ref = ref->next;
@@ -609,6 +620,7 @@ void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache
 	}
 	ic->xref = NULL;
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 }
 
 void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
@@ -638,10 +650,12 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 	 * one will be removed.
 	 */
 	struct jffs2_xattr_ref *ref, *cmp, **pref, **pcmp;
+	unsigned int nofs;
 	int rc = 0;
 
 	if (likely(ic->flags & INO_FLAGS_XATTR_CHECKED))
 		return 0;
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
  retry:
 	rc = 0;
@@ -683,6 +697,7 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 	ic->flags |= INO_FLAGS_XATTR_CHECKED;
  out:
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 
 	return rc;
 }
@@ -973,6 +988,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	const char *prefix;
 	ssize_t prefix_len, len, rc;
 	int retry = 0;
+	unsigned int nofs = 0;
 
 	rc = check_xattr_ref_inode(c, ic);
 	if (unlikely(rc))
@@ -990,6 +1006,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 				retry = 1;
 				up_read(&c->xattr_sem);
 				down_write(&c->xattr_sem);
+				nofs = memalloc_nofs_save();
 				goto retry;
 			} else {
 				rc = load_xattr_datum(c, xd);
@@ -1027,6 +1044,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		up_read(&c->xattr_sem);
 	} else {
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 	}
 	return rc;
 }
@@ -1040,6 +1058,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 	struct jffs2_xattr_datum *xd;
 	struct jffs2_xattr_ref *ref, **pref;
 	int rc, retry = 0;
+	unsigned int nofs = 0;
 
 	rc = check_xattr_ref_inode(c, ic);
 	if (unlikely(rc))
@@ -1059,6 +1078,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 				retry = 1;
 				up_read(&c->xattr_sem);
 				down_write(&c->xattr_sem);
+				nofs = memalloc_nofs_save();
 				goto retry;
 			} else {
 				rc = load_xattr_datum(c, xd);
@@ -1089,6 +1109,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 		up_read(&c->xattr_sem);
 	} else {
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 	}
 	return rc;
 }
@@ -1102,6 +1123,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	struct jffs2_xattr_datum *xd;
 	struct jffs2_xattr_ref *ref, *newref, **pref;
 	uint32_t length, request;
+	unsigned int nofs;
 	int rc;
 
 	rc = check_xattr_ref_inode(c, ic);
@@ -1120,6 +1142,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	}
 
 	/* Find existing xattr */
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
  retry:
 	for (ref=ic->xref, pref=&ic->xref; ref; pref=&ref->next, ref=ref->next) {
@@ -1189,6 +1212,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 		JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
 		unrefer_xattr_datum(c, xd);
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 		return rc;
 	}
 	if (ref)
@@ -1206,6 +1230,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	}
  out:
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	jffs2_complete_reservation(c);
 	return rc;
 }
@@ -1226,8 +1251,10 @@ int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xatt
 				      struct jffs2_raw_node_ref *raw)
 {
 	uint32_t totlen, length, old_ofs;
+	unsigned int nofs;
 	int rc = 0;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	if (xd->node != raw)
 		goto out;
@@ -1255,6 +1282,7 @@ int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xatt
 	if (!rc)
 		jffs2_mark_node_obsolete(c, raw);
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return rc;
 }
 
@@ -1262,8 +1290,10 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 				    struct jffs2_raw_node_ref *raw)
 {
 	uint32_t totlen, length, old_ofs;
+	unsigned int nofs;
 	int rc = 0;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	BUG_ON(!ref->node);
 
@@ -1289,6 +1319,7 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 	if (!rc)
 		jffs2_mark_node_obsolete(c, raw);
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return rc;
 }
 
@@ -1298,8 +1329,10 @@ int jffs2_verify_xattr(struct jffs2_sb_info *c)
 	struct jffs2_eraseblock *jeb;
 	struct jffs2_raw_node_ref *raw;
 	uint32_t totlen;
+	unsigned int nofs;
 	int rc;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	list_for_each_entry_safe(xd, _xd, &c->xattr_unchecked, xindex) {
 		rc = do_verify_xattr_datum(c, xd);
@@ -1322,6 +1355,7 @@ int jffs2_verify_xattr(struct jffs2_sb_info *c)
 		spin_unlock(&c->erase_completion_lock);
 	}
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return list_empty(&c->xattr_unchecked) ? 1 : 0;
 }
 
-- 
2.43.0


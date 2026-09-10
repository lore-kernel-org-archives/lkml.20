Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FB63DEAD6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033166; cv=none; b=j669SyvLUc8OCM2WAV4t7wOyPUibAksqM4WtV6OasK+1HDtA4f7yxdJWDRFE2Qdmsvc6+js+Wdc9RLUanFjslOIPdWa4qCvhQeLAI3mXnre6hKAnAohIT/1mGE4z/gbBDa1leV17JwOK0kLHgwyT33ggE5W+FUq8u4WnYf0fdiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033166; c=relaxed/simple;
	bh=RkUsSpiierfJbMiLhin5nqTV289lNTwLWO3rDYBcqvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AptnMYL029slP3EQsE7G8RJJdTPITplLZUIsn6NdpzP1aXGw251Y72nQG2dR/90Uk3zO1ADK8s+4fRipu2MpAQDEnJ3iIlxFm2UzCMyQQKMGC8u9T2MAtwYyi6WF6uotD7vyf3BAThTOoSuaOI+GJbSDj33iyWHbzPpd0uuZFmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tsinghua.edu.cn; spf=pass smtp.mailfrom=tsinghua.edu.cn; dkim=pass (1024-bit key) header.d=tsinghua.edu.cn header.i=@tsinghua.edu.cn header.b=kNKvbykc; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tsinghua.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tsinghua.edu.cn header.i=@tsinghua.edu.cn header.b="kNKvbykc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tsinghua.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=PKepVeL9yo
	zNjhjRkpx3tQSDTdxMGkDGBywPpPTNL5E=; b=kNKvbykc3AxdM3PaLTtsfEU+h+
	R8abYpOLqFBvLJESD9L6EgcV2h80IryLkYsa1wge+MRuaNMYxebDdeR8epWU/X2f
	Xno2Ocu943fSIchzwQurPRqkhci9WT9e9W7P4rgi10fCtvRuuKavrXd7Wu8GOYKO
	rgr/+cBH2KQP4N4Ew=
Received: from BOOKWORM-PASCAL.lan (unknown [61.149.15.167])
	by web2 (Coremail) with SMTP id yQQGZQAnILK_eqJqOfSwAQ--.35941S2;
	Thu, 10 Sep 2026 17:39:11 +0800 (CST)
From: chengyaqiang@tsinghua.edu.cn
To: mikulas@artax.karlin.mff.cuni.cz
Cc: linux-kernel@vger.kernel.org,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>
Subject: [PATCH] hpfs: validate in-fnode EA area and entries before walking
Date: Thu, 10 Sep 2026 17:38:58 +0800
Message-Id: <20260910093858.396361-1-chengyaqiang@tsinghua.edu.cn>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yQQGZQAnILK_eqJqOfSwAQ--.35941S2
X-Coremail-Antispam: 1UD129KBjvJXoW3ArW7XFW8KF45Ww4kJw48Xrb_yoWfAFWxpF
	W7G343Kw4DJrnrWr97tF1UJrn3u34fXw4Ut34Ik3say3Z8WrySgw15tayj93ZxCrs3Wr4F
	qr4Ygw4Dur1Dt3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2
	z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26r4rKr1UJr1lOx8S6xCaFVCjc4AY
	6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwAKzVCY07xG64
	k0F24lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GrWk
	Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU0eOJ5UUUUU==
X-CM-SenderInfo: xfkh0w51dtxttqj632xlqjx3vdohv3gofq/1tbiAgAGB2qiTeWGZwAAsC

From: chengyaqiang <chengyaqiang@tsinghua.edu.cn>

The HPFS fnode inline EA walkers (hpfs_get_ea(), hpfs_read_ea(),
hpfs_set_ea() and hpfs_remove_fnode()) trust the on-disk ea_offs,
acl_size_s, ea_size_s, namelen and valuelen fields without any bounds
checking of their own.  The only validation of the EA area lives in
hpfs_map_fnode() and is gated on the check= mount option, so with
check=none nothing stops the walkers from running past the end of the
512-byte fnode sector.

A crafted image whose fnode declares an EA area larger than the sector
makes the walkers dereference memory beyond the mapped buffer while
strcmp()ing their way through it: entry names are read out of bounds,
hpfs_set_ea() can write out of bounds, and hpfs_remove_fnode() feeds
sector numbers read past the buffer end to hpfs_ea_remove().

Whether such an out-of-bounds walk is actually caught depends on what
the walk runs into.  The fnode buffer itself is page-cache memory
without KASAN redzones, so the corruption only surfaces when the walk
lands on freed slab memory or a redzone.  This makes the bug
layout-dependent and non-deterministic: syzkaller observed it as
"KASAN: slab-use-after-free Read in hpfs_get_ea" - the walk hit a
freshly freed skbuff_small_head object - in a long-running fuzzing
instance, while a freshly booted system may silently compare garbage
and let the mount succeed.

Validate the EA area unconditionally - ea_offs >= 0xc4 and
ea_offs + acl_size_s + ea_size_s <= 0x200, mirroring the existing
hpfs_map_fnode() checks but independent of the check= option - and
require each entry's 4-byte header and the entry as a whole to fit
inside the area before any of its fields are dereferenced.  Indirect
entries must reserve 8 bytes for the ea_len()/ea_sec() pair.  The
checks only inspect the on-disk fnode header, so a corrupt EA area
is now rejected deterministically at mount time, before any
out-of-bounds access can happen: the problem is reported through
hpfs_error() and the attribute is treated as absent.  The structural
EA walk in hpfs_map_fnode() gets the same header bounds check, as it
read the entry header with only the area end as the limit.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
Signed-off-by: chengyaqiang <chengyaqiang@tsinghua.edu.cn>
---
 fs/hpfs/anode.c   | 19 +++++++++++++++----
 fs/hpfs/ea.c      | 42 +++++++++++++++++++++++++++++++++++++++---
 fs/hpfs/hpfs_fn.h | 23 +++++++++++++++++++++++
 fs/hpfs/map.c     |  3 ++-
 4 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/fs/hpfs/anode.c b/fs/hpfs/anode.c
index a4f5321eafae..30a14cec55c4 100644
--- a/fs/hpfs/anode.c
+++ b/fs/hpfs/anode.c
@@ -488,10 +488,21 @@ void hpfs_remove_fnode(struct super_block *s, fnode_secno fno)
 	if (!(fnode = hpfs_map_fnode(s, fno, &bh))) return;
 	if (!fnode_is_dir(fnode)) hpfs_remove_btree(s, GET_BTREE_PTR(&fnode->btree));
 	else hpfs_remove_dtree(s, le32_to_cpu(fnode->u.external[0].disk_secno));
-	ea_end = fnode_end_ea(fnode);
-	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea))
-		if (ea_indirect(ea))
-			hpfs_ea_remove(s, ea_sec(ea), ea_in_anode(ea), ea_len(ea));
+	if (fnode_ea_area_ok(fnode)) {
+		ea_end = fnode_end_ea(fnode);
+		for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea)) {
+			if (!ea_entry_ok(ea, ea_end)) {
+				hpfs_error(s, "bad EA entry in fnode %08lx", (unsigned long)fno);
+				break;
+			}
+			if (ea_indirect(ea))
+				hpfs_ea_remove(s, ea_sec(ea), ea_in_anode(ea), ea_len(ea));
+		}
+	} else {
+		hpfs_error(s, "bad EA info in fnode %08lx: offs=%04x acl=%04x size=%04x",
+			   (unsigned long)fno, le16_to_cpu(fnode->ea_offs),
+			   le16_to_cpu(fnode->acl_size_s), le16_to_cpu(fnode->ea_size_s));
+	}
 	hpfs_ea_ext_remove(s, le32_to_cpu(fnode->ea_secno), fnode_in_anode(fnode), le32_to_cpu(fnode->ea_size_l));
 	brelse(bh);
 	hpfs_free_sectors(s, fno, 1);
diff --git a/fs/hpfs/ea.c b/fs/hpfs/ea.c
index 4664f9ab06ee..39e5ac11c66c 100644
--- a/fs/hpfs/ea.c
+++ b/fs/hpfs/ea.c
@@ -80,7 +80,18 @@ int hpfs_read_ea(struct super_block *s, struct fnode *fnode, char *key,
 	char ex[4 + 255 + 1 + 8];
 	struct extended_attribute *ea;
 	struct extended_attribute *ea_end = fnode_end_ea(fnode);
-	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea))
+
+	if (!fnode_ea_area_ok(fnode)) {
+		hpfs_error(s, "bad EA info in fnode: offs=%04x acl=%04x size=%04x",
+			   le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->acl_size_s),
+			   le16_to_cpu(fnode->ea_size_s));
+		return -EIO;
+	}
+	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea)) {
+		if (!ea_entry_ok(ea, ea_end)) {
+			hpfs_error(s, "bad EA entry in fnode");
+			return -EIO;
+		}
 		if (!strcmp(ea->name, key)) {
 			if (ea_indirect(ea))
 				goto indirect;
@@ -90,6 +101,7 @@ int hpfs_read_ea(struct super_block *s, struct fnode *fnode, char *key,
 			buf[ea_valuelen(ea)] = 0;
 			return 0;
 		}
+	}
 	a = le32_to_cpu(fnode->ea_secno);
 	len = le32_to_cpu(fnode->ea_size_l);
 	ano = fnode_in_anode(fnode);
@@ -135,7 +147,18 @@ char *hpfs_get_ea(struct super_block *s, struct fnode *fnode, char *key, int *si
 	secno a;
 	struct extended_attribute *ea;
 	struct extended_attribute *ea_end = fnode_end_ea(fnode);
-	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea))
+
+	if (!fnode_ea_area_ok(fnode)) {
+		hpfs_error(s, "bad EA info in fnode: offs=%04x acl=%04x size=%04x",
+			   le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->acl_size_s),
+			   le16_to_cpu(fnode->ea_size_s));
+		return NULL;
+	}
+	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea)) {
+		if (!ea_entry_ok(ea, ea_end)) {
+			hpfs_error(s, "bad EA entry in fnode");
+			return NULL;
+		}
 		if (!strcmp(ea->name, key)) {
 			if (ea_indirect(ea))
 				return get_indirect_ea(s, ea_in_anode(ea), ea_sec(ea), *size = ea_len(ea));
@@ -147,6 +170,7 @@ char *hpfs_get_ea(struct super_block *s, struct fnode *fnode, char *key, int *si
 			ret[ea_valuelen(ea)] = 0;
 			return ret;
 		}
+	}
 	a = le32_to_cpu(fnode->ea_secno);
 	len = le32_to_cpu(fnode->ea_size_l);
 	ano = fnode_in_anode(fnode);
@@ -198,7 +222,18 @@ void hpfs_set_ea(struct inode *inode, struct fnode *fnode, const char *key,
 	unsigned char h[4];
 	struct extended_attribute *ea;
 	struct extended_attribute *ea_end = fnode_end_ea(fnode);
-	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea))
+
+	if (!fnode_ea_area_ok(fnode)) {
+		hpfs_error(s, "bad EA info in fnode %08lx: offs=%04x acl=%04x size=%04x",
+			   (unsigned long)fno, le16_to_cpu(fnode->ea_offs),
+			   le16_to_cpu(fnode->acl_size_s), le16_to_cpu(fnode->ea_size_s));
+		return;
+	}
+	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea)) {
+		if (!ea_entry_ok(ea, ea_end)) {
+			hpfs_error(s, "bad EA entry in fnode %08lx", (unsigned long)fno);
+			return;
+		}
 		if (!strcmp(ea->name, key)) {
 			if (ea_indirect(ea)) {
 				if (ea_len(ea) == size)
@@ -208,6 +243,7 @@ void hpfs_set_ea(struct inode *inode, struct fnode *fnode, const char *key,
 			}
 			return;
 		}
+	}
 	a = le32_to_cpu(fnode->ea_secno);
 	len = le32_to_cpu(fnode->ea_size_l);
 	ano = fnode_in_anode(fnode);
diff --git a/fs/hpfs/hpfs_fn.h b/fs/hpfs/hpfs_fn.h
index 237c1c23e855..d5efe7a572dd 100644
--- a/fs/hpfs/hpfs_fn.h
+++ b/fs/hpfs/hpfs_fn.h
@@ -152,6 +152,29 @@ static inline struct extended_attribute *next_ea(struct extended_attribute *ea)
 	return (struct extended_attribute *)((char *)ea + 5 + ea->namelen + ea_valuelen(ea));
 }
 
+/*
+ * EAs are read from disk and cannot be trusted: validate that the EA area
+ * fits inside the fnode sector and that each entry - its 4-byte header
+ * first, then the entry as a whole - fits inside the area before any of
+ * its fields are dereferenced, regardless of the check= mount option.
+ */
+static inline bool fnode_ea_area_ok(struct fnode *fnode)
+{
+	return !le16_to_cpu(fnode->ea_size_s) ||
+	       (le16_to_cpu(fnode->ea_offs) >= 0xc4 &&
+		le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) +
+		le16_to_cpu(fnode->ea_size_s) <= 0x200);
+}
+
+static inline bool ea_entry_ok(struct extended_attribute *ea,
+			       struct extended_attribute *ea_end)
+{
+	if ((char *)ea + 4 > (char *)ea_end)
+		return false;	/* truncated entry header */
+	return (char *)ea + 5 + ea->namelen +
+	       (ea_indirect(ea) ? 8 : ea_valuelen(ea)) <= (char *)ea_end;
+}
+
 static inline secno ea_sec(struct extended_attribute *ea)
 {
 	return le32_to_cpu(get_unaligned((__le32 *)((char *)ea + 9 + ea->namelen)));
diff --git a/fs/hpfs/map.c b/fs/hpfs/map.c
index be73233502f8..c76519990686 100644
--- a/fs/hpfs/map.c
+++ b/fs/hpfs/map.c
@@ -203,7 +203,8 @@ struct fnode *hpfs_map_fnode(struct super_block *s, ino_t ino, struct buffer_hea
 			ea = fnode_ea(fnode);
 			ea_end = fnode_end_ea(fnode);
 			while (ea != ea_end) {
-				if (ea > ea_end) {
+				if (ea > ea_end ||
+				    (char *)ea + 4 > (char *)ea_end) {
 					hpfs_error(s, "bad EA in fnode %08lx",
 						(unsigned long)ino);
 					goto bail;
-- 
2.39.5


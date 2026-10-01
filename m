Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC233F23BF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891597; cv=none; b=NS3mb4AA1wK3WNuVGzp+O0E2M/zsEg4N5X8ti0eHRSOEtdjmPmgoMdUiGY+9Cd8V/w3kxnF3wCZiNgd278Y2AJZYpI6PI+7gR0IuzCBb54uhXK/9iRgU1bNB7jQBqmSpsk1S7CpUluVomwg8qVM4GDwkIBM5iunwyIodc7E23AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891597; c=relaxed/simple;
	bh=K98gb4QshljAY7E+xVRy8/ZqzUeY5S+H4MfMHowqKVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3XL+xcyuSysfMlYYy4cJSVXTZ4NWLHhtSTYGAXMw4pjDR/1x/EWsW2BoLiejcpjyQEK3D5CP9cReXaDsvLLLE9651MAOk/7kGPkQn9RT9gCUw6nm/QqZTvjeXgMgRqd6Z8PfUhwv0cCpKR2X57TXB1EM62/yhPNeDe25BnRQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com; spf=pass smtp.mailfrom=noroxi.com; dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b=Uk0wHG4S; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=noroxi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noroxi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noroxi.com header.i=@noroxi.com header.b="Uk0wHG4S"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87a4aa6f2so8152041fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noroxi.com; s=google; t=1790891594; x=1791496394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ktwzSQw9heRGokOoOy26T3wT6X3rhc72JGOS7UgFoE=;
        b=Uk0wHG4Sd3jQAdBOvco4YKIGkDgWnzhpuoZd8xTWYxSPiKLQ0nQL+IdkU/S7+Dn2J6
         Q+FjpuSAixnsx82ZyBfHAHfQkpTiGY9b6chyfYqUFvxff9pHOsoB1aXDzhFHrf99+Rb2
         x2MQdoobhePrupZMBIITDuWT3FsE7d01/T8wrw9jQquisi6Mu7+kZDHa7iPqitK9e7UX
         pBIOB1Dmw9/LVlmMWwuREK/8YL0bRW7Ibo8EJC9v1QgcqDNUgaKdgS7p29fzWT8Zjp66
         MDf0DgFpYqBIJtFBrVYo0DJoY+2M+jgE1Rp0wZwp1zbTrbYYjXrP4+6OWv6c5dAqbDqB
         Z6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891594; x=1791496394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ktwzSQw9heRGokOoOy26T3wT6X3rhc72JGOS7UgFoE=;
        b=Lp53HBTWE0AqAGhFQXourB8kBTCRacrnzs5+6i0z6qaq4mcU2T35myvVA9F/R5G8SQ
         +ajtqIjx5EI1Eg7TnMjjiP1cuaqGnldRvLNTz09C5Fen/xw0BweZjM9PupEVc7x4az97
         4QLRKQY+rM093na/av3xcIu07MXevUo7TiM1xeuJ/pZhVNVEa2VSFREOfxSmC8TiRwzG
         nMNOrx8/5e2yip+aOlZTAN3k4es1g6mg6xWoppL6EtSilKOoK2RxPlAiirhyeAkdw94p
         ify0zL6arlwRWUbkELOMXvWKhViLB0TOSl2avCsrY983J1A1HrSbwc6yPLz1u8WfIcdj
         QuRw==
X-Forwarded-Encrypted: i=1; AKwUvBxFpkb/+49nkkQOZq6GaJLGY/HGuZProfgc88anx65uDhXgBMYax8St6GuY7I3KcBSWH/lYl0naFFvWf0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJqnE08rfYWMqXf3stHPNmJdCFD5FS5tzUHOC52dTFYjTJ5Wr5
	bd/OTNx1RWKz8ugnhJ/lpZR/SHw9+Z0AavtuyHovyoETiUkeD7N6a+KZG31VCS6nSKc7
X-Gm-Gg: AYBFou2mliHZ/PdG0Bl1wrdrnIsvPmAFQTAuMa3rFYuECADTgn+FIAZNWjKwLT2idIO
	cXB1cNyv/mGEq2WedjID7ttCdmtmcsym/jm2D7f9/NypsyhXfQF4nipocY92AY1P7kCO6YTR3Y8
	NSt8ryB7Wo3aROAtnvc6k/F251/3m5Sv/Q+S05GQgU5iekhGJsVGbbt+oysm+V3mMc2X3QGLtgn
	vhbre4BYvJhBltE6gyEzu4qM5uhMkLVXbdZX2SFIulSdMJfQ+I9JncxlRaIC5XuOlgf7bYLhqpz
	hwtH0s6acA1ma5c/vw+mIgwpb/Uc7asAM7d6pxXRNWxdz3wu9/vBn7KOKxx96xJxthwzuwQg4at
	PY9s2zm1+0nACxbzoTwXlai6Lsf5HkWH7CPM7bSVEu4KneO0iWssFt29RXeT3GAjbSDMZhaCHZx
	fAxU4ylAU58X55u08icz9bDLJ4Pdgerez84OoW4M6DRi8U17W0KWGP8ruQ1E+aafno7mOMR37g
X-Received: by 2002:a2e:8a9c:0:b0:3a3:7682:49a1 with SMTP id 38308e7fff4ca-3a8877c09femr1383891fa.22.1790891593483;
        Thu, 01 Oct 2026 14:53:13 -0700 (PDT)
Received: from lab01.. ([2a01:4f9:1a:a462::2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e310343sm2427401fa.29.2026.10.01.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:53:13 -0700 (PDT)
From: Mahmut Emin Kurhan <guvenlik@noroxi.com>
To: linux-fsdevel@vger.kernel.org
Cc: slava@dubeyko.com,
	glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-kernel@vger.kernel.org,
	Mahmut Emin Kurhan <guvenlik@noroxi.com>
Subject: [PATCH v2] hfsplus: annotate extents_lock nesting to silence lockdep false positive
Date: Thu,  1 Oct 2026 23:53:04 +0200
Message-ID: <20261001215304.1520907-1-guvenlik@noroxi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9f8b8dacee5d24c94185bab75ff905eb51a95999.camel@dubeyko.com>
References: <9f8b8dacee5d24c94185bab75ff905eb51a95999.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep reports a possible recursive locking on HFSPLUS_I(inode)->extents_lock
when unlinking a file on a crafted image: hfsplus_file_truncate() holds a
regular file's extents_lock and, while freeing blocks, reads the allocation
file, whose get_block() takes that file's own extents_lock. They are distinct
inodes of the same lock class taken in a fixed order, so it is not a real
deadlock, only a missing nesting annotation.

Give the special inodes (allocation, attributes, catalog) distinct
extents_lock subclasses and take the lock with mutex_lock_nested(), mirroring
hfsplus_btree_lock_class(). Regular files (CNID >= HFSPLUS_FIRSTUSER_CNID) keep
their own subclass so a genuine regular-vs-regular recursion is still detected;
the remaining reserved inodes use a separate subclass instead of being treated
as regular files.

Found via coverage-guided fuzzing (syzkaller + lockdep) by Noroxi.

Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
---
v2:
 - shorten the comment (Slava Dubeyko)
 - rename HFSPLUS_EXTENTS_LOCK_NORMAL to _REGULAR_FILE (Slava Dubeyko)
 - use HFSPLUS_FIRSTUSER_CNID so reserved inodes are not treated as
   regular files; add a separate _OTHER subclass (Slava Dubeyko)
 - hfsplus_extents_lock_class() signature is 74 cols (< 80)
 fs/hfsplus/extents.c    | 12 ++++++++----
 fs/hfsplus/hfsplus_fs.h | 26 ++++++++++++++++++++++++++
 fs/hfsplus/xattr.c      |  3 ++-
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d..54a05eaa8f 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -150,7 +150,8 @@ int hfsplus_ext_write_extent(struct inode *inode)
 {
 	int res;
 
-	mutex_lock(&HFSPLUS_I(inode)->extents_lock);
+	mutex_lock_nested(&HFSPLUS_I(inode)->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 	res = hfsplus_ext_write_extent_locked(inode);
 	mutex_unlock(&HFSPLUS_I(inode)->extents_lock);
 
@@ -261,7 +262,8 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
 	if (inode->i_ino == HFSPLUS_EXT_CNID)
 		return -EIO;
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 
 	/*
 	 * hfsplus_ext_read_extent will write out a cached extent into
@@ -454,7 +456,8 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 		return -ENOSPC;
 	}
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 	if (hip->alloc_blocks == hip->first_blocks)
 		goal = hfsplus_ext_lastblock(hip->first_extents);
 	else {
@@ -576,7 +579,8 @@ void hfsplus_file_truncate(struct inode *inode)
 	blk_cnt = (inode->i_size + HFSPLUS_SB(sb)->alloc_blksz - 1) >>
 			HFSPLUS_SB(sb)->alloc_blksz_shift;
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(inode));
 
 	alloc_cnt = hip->alloc_blocks;
 	if (blk_cnt == alloc_cnt)
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 916e6552e3..7e2411b8f1 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -37,6 +37,15 @@ enum hfsplus_btree_mutex_classes {
 	ATTR_BTREE_MUTEX,
 };
 
+/* lockdep subclasses for extents_lock: special inodes nest under regular files */
+enum hfsplus_extents_mutex_classes {
+	HFSPLUS_EXTENTS_LOCK_REGULAR_FILE,
+	HFSPLUS_EXTENTS_LOCK_CATALOG,
+	HFSPLUS_EXTENTS_LOCK_ALLOC,
+	HFSPLUS_EXTENTS_LOCK_ATTR,
+	HFSPLUS_EXTENTS_LOCK_OTHER,
+};
+
 /* An HFS+ BTree held in memory */
 struct hfs_btree {
 	struct super_block *sb;
@@ -568,6 +577,23 @@ hfsplus_btree_lock_class(struct hfs_btree *tree)
 	return class;
 }
 
+static inline unsigned int hfsplus_extents_lock_class(struct inode *inode)
+{
+	if (inode->i_ino >= HFSPLUS_FIRSTUSER_CNID)
+		return HFSPLUS_EXTENTS_LOCK_REGULAR_FILE;
+
+	switch (inode->i_ino) {
+	case HFSPLUS_CAT_CNID:
+		return HFSPLUS_EXTENTS_LOCK_CATALOG;
+	case HFSPLUS_ALLOC_CNID:
+		return HFSPLUS_EXTENTS_LOCK_ALLOC;
+	case HFSPLUS_ATTR_CNID:
+		return HFSPLUS_EXTENTS_LOCK_ATTR;
+	default:
+		return HFSPLUS_EXTENTS_LOCK_OTHER;
+	}
+}
+
 static inline
 bool is_bnode_offset_valid(struct hfs_bnode *node, u32 off)
 {
diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
index 21a1c196c7..7bf4ba8f18 100644
--- a/fs/hfsplus/xattr.c
+++ b/fs/hfsplus/xattr.c
@@ -264,7 +264,8 @@ static int hfsplus_create_attributes_file(struct super_block *sb)
 						    sbi->sect_count,
 						    HFSPLUS_ATTR_CNID);
 
-	mutex_lock(&hip->extents_lock);
+	mutex_lock_nested(&hip->extents_lock,
+			  hfsplus_extents_lock_class(attr_file));
 	hip->clump_blocks = clump_size >> sbi->alloc_blksz_shift;
 	mutex_unlock(&hip->extents_lock);
 
-- 
2.43.0


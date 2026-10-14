Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E9B47ECF6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960386; cv=none; b=dPmC1HKxWWRPAHrPQgQDEq+0CBsUeHHLnQsE5pqGB7fjLUNwkwGn+BB9g3D1HqUx2uYNtgUObNjkWHgS5ZnRqAE6bYjLWlvAYYcILNhTFG/Rm5RW69fzYyt6Q7p5hgeFUdv34RQNb7HvDjyFnR5yp8E0mE6Q6k9Ag9rnbgZAwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960386; c=relaxed/simple;
	bh=UAdyZSpmedpSxvj/4fXxSj48GCAHvzY3a2CsrlVLooA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBiAGAk1JU7VxRin/SRJAKlVLVzpqS/WddybCsnCE9wMhQsGQGX2TufKtR32DsOYxTqslEBoUSIu68Sbj52Yt7zS6o7tEYfRGMbbeWfjFb8xv5So9rJbDUs6Y7KffLtxzJaRa24067uwKh6lcJ72Og/348+cmkITEDC7om3KSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3Z92uys; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3Z92uys"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1096422a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960382; x=1792565182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d51OaHjNWv8Izp5BdDFoIII7UFVdhf7f4jHUBNxIQfs=;
        b=Q3Z92uysNh+t5blDkEn76xRiZLGQqyh6dMSZLVzMUGGjVcUYuHePEGSRyqazbJTkVs
         OeuLuk9Xn+cHeZAZuo8Z+zWhAYUqqvMvgf+IG3oq7/aXl5PVoR9/2QRVXps8ntp7W6K1
         nG9/geCePNPNlOUyXGzEaFoXgv3yadiEHPPOeScLvLb7IzcoyueJoSOZEFlSsNzbzoZ6
         3a8SBD2bUyx1Igy/LIdeKJrHpoLxptj96mhE9kgd+AtNhhfPldwlg6V+me/jZdgP02TE
         SuA+2itsFv6bG+xGq22knwQAm/NC0Zz4vHJjqjWLGmwiLH+9Oz/A6DnwfThLB4p7zKci
         ZDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960382; x=1792565182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d51OaHjNWv8Izp5BdDFoIII7UFVdhf7f4jHUBNxIQfs=;
        b=uIG6VpwEZV5ha88StHopuLp51aaRtlTc2/aWshhjaKpDR1/dZTZBy4UvDl6xzFAWTq
         +kj1JHU7QT7LqQTKAbm+Qabc38G3IDYxB0SbIFBCKP5Xn5KxYglfy7q9/EqorLeRK1l0
         2d9Pl32YduwXZ6hzxXkBQ9APgmjlXxv3Npa9xKJzk8iidaQTkrTWzu8/3zYfGxSsnLxL
         MY3Z9ZEL8Ra+1GxIHhcb7j+hdLzMx2WZF/VY5NRbTsaAE6WS+QYJmR2zZeFI+PDU6Uh2
         oZMxU3OdlatG9tE5k8YrPCItZOSbpAmHir/pN9KiHPjNJ+HFoOqHlNt4w/ou3gC55khz
         Gqlw==
X-Forwarded-Encrypted: i=1; AKwUvBw0gmnSal6N9VHnLc2lI8fZ/oe0c1mvIj/3Dz1QU8hRHndzWH0wHZdHitNvrmYAOkSltuLBoiE3oUYgqA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9q6X9ff36N+G/Zw7f82I4kRvZ/iuKwjLAdyHEXaTbrJg57LpY
	L/18bqQ36r/sLHHp/vHoDMssgB8Kd6BZiadeLIqnibhrBymO0GC4JnVw
X-Gm-Gg: AYBFou2j1Vpnx+M7I8Ae0b/BjTsBMAD9o1tn5cEhwXWy5MQ26F4J5N09Jr5bq8YMoU6
	UBhdc1AW04AIVDD8U5B1G3w1BckoSnTewQehjJQhsw+IaAxjw75ZUagTqYY5WPP6xXGWkA0FBVR
	lSW3tQRI0YTloylUxR84w9af12EQ8RhjkAnoIlXk7V4B6hby/LHPYvR42NHFChahiVpy8ZLDrTN
	F5XwVN87q+dyFtzZCCU2jHZ2IF9BXLICZhmVCA6e+Z5BRBMhba1DEXtWBH8zg+dRyfp9bTLO/U1
	5vfjdMZM22hKc5gOfECnjZVxtjfo7oZLIvZmv4sVNWX9JiPH+vOZF6pVs4CeM97ngdw/Y+Eo0Pc
	nAIB60CIcEVNYoQrALBbgtU6rDOVEcrHXU7VKCnJ1izC+mvsdOeAlai2DJuiLw98G+asd/I69fA
	mh+gottP2kmOcGnxf2ALlR7ReiemGg+OKpU9IUo6cUwOd5WOzfaibw8zHbJAC06Ge+EkRT5MOJb
	RPECq7jY+LN1txbyiiaAZP9yE7ksZvEZ+hC
X-Received: by 2002:a17:90b:28ce:b0:3a0:809b:1972 with SMTP id 98e67ed59e1d1-3ab3a745e5bmr11938256a91.26.1791960381967;
        Tue, 13 Oct 2026 23:46:21 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:20 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v5 15/16] f2fs: allow large folio support to writeable files
Date: Wed, 14 Oct 2026 14:44:44 +0800
Message-ID: <20261014064445.2835813-16-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now we make all write path support large folios,
so we open permission to let writeable file set
large folio mapping.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   | 17 +++++++++++++++++
 fs/f2fs/file.c   | 16 +---------------
 fs/f2fs/inline.c |  6 ++++++
 fs/f2fs/inode.c  |  4 +---
 fs/f2fs/namei.c  |  1 +
 6 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 45861c31fe76..a476464b856c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3242,7 +3242,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ddff43bcb800..1f9bd8e3b526 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5348,6 +5348,23 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
 	return false;
 }
 
+static inline void f2fs_mapping_set_large_folio(struct inode *inode)
+{
+	if (!S_ISREG(inode->i_mode) ||
+	    f2fs_compressed_file(inode) ||
+	    f2fs_quota_file(F2FS_I_SB(inode), inode->i_ino))
+		return;
+
+	/*
+	 * Keep the folio order range at 0 as a transitional step; large
+	 * folios will be enabled once the whole write path is audited.
+	 */
+	if (IS_IMMUTABLE(inode))
+		mapping_set_folio_min_order(inode->i_mapping, 0);
+	else
+		mapping_set_folio_order_range(inode->i_mapping, 0, 0);
+}
+
 static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 {
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cad5329bbfd6..803e2b9900d1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -163,17 +163,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	int err = 0;
 	vm_fault_t ret;
 
-	/*
-	 * We only support large folio on the read case.
-	 * Don't make any dirty pages.
-	 */
-	if (unlikely(IS_IMMUTABLE(inode)) ||
-	    mapping_large_folio_support(inode->i_mapping)) {
-		f2fs_err(sbi, "Not expected: immutable: %d large_folio: %d",
-				IS_IMMUTABLE(inode),
-				mapping_large_folio_support(inode->i_mapping));
+	if (unlikely(IS_IMMUTABLE(inode)))
 		return VM_FAULT_SIGBUS;
-	}
 
 	/* mmap stores bypass the COW inode and would break atomicity */
 	if (f2fs_is_atomic_file(inode))
@@ -724,9 +715,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
 
 	err = fsverity_file_open(inode, filp);
 	if (err)
@@ -1198,8 +1186,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
-		if (mapping_large_folio_support(inode->i_mapping))
-			return -EOPNOTSUPP;
 		if (IS_DEVICE_ALIASING(inode))
 			return -EPERM;
 		if (!f2fs_is_compress_backend_ready(inode))
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 49905aa08418..0dca6c3d58fb 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -239,6 +239,12 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 
+	/*
+	 * Inline data is only supported in an order-0 index #0 folio; the
+	 * inline write and mmap fault paths never request a larger order.
+	 */
+	f2fs_bug_on(sbi, folio_test_large(folio));
+
 	f2fs_lock_op(sbi, &lc);
 
 	ientry = f2fs_get_inode_cache(sbi, inode->i_ino);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9164a2b5d9f0..f5a4dac98ef2 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -599,9 +599,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_op = &f2fs_file_inode_operations;
 		inode->i_fop = &f2fs_file_operations;
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
-		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
-		    !f2fs_quota_file(sbi, inode->i_ino))
-			mapping_set_folio_min_order(inode->i_mapping, 0);
+		f2fs_mapping_set_large_folio(inode);
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = &f2fs_dir_inode_operations;
 		inode->i_fop = &f2fs_dir_operations;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 38fcea8b72bf..6a1ff631393c 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -341,6 +341,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	f2fs_set_inode_flags(inode);
 
 	f2fs_init_extent_tree(inode);
+	f2fs_mapping_set_large_folio(inode);
 
 	trace_f2fs_new_inode(inode, 0);
 	return inode;
-- 
2.43.0


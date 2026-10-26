Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985938;
	b=JBwUglmGHolvjxjnqaHqSKwoqTi+ZS8WjdKrVt4HAZSSpYer9ISBRV4tCV/J1/foTlqD
	 KOmjc9Xe3mYBIvmsmtZtl+aai6izyAUimChV9xl7jd4JIabyKLB9/lYX/5wjgA2t4tuRT
	 RTVoQRPrE27dK7ssqydbPfm8HEdwSk4lYyN1ysr0bGS/FlK3KmMU+UPneI9G3eK9NN1i2
	 E6RH5Frt23I/zqvjEfxgXClOnhAhILiEObveYkY9Cz+LMH4QjPJH/dVmd9PQSseitrPy1
	 H/Fy8lWJq8ZZuUSsCztJ9KUoA7G8Xe5rtuSj3V52pn39HvFC3oA9sYDZ5/rwqxAxmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mcKmQWD5BzKPZcYyv/2kD79SsEZPAeCLB89VrkV54d8=;
	b=hdC8UuZ3vr9YGVPmtYsdcSnDok1gX0YTp1H/6BI6z2W+laZit6dGFId1aRaJ+3lVvQeG
	 JlJBK27RPdUhRXHKWbNAtVM42BjIupC0Wqgkzg9NteHopcROwzXBZITFPaF/dwS1mx3ps
	 YVUCO0er4s5kZ419h7ePfmkSb9/LP9DNN/OsdzQbZWZrbfXfeTYCZAqDQV8F7dBckPXSU
	 Ab5p1DG7XjxO8Wm7QYd9JnwF+ILj40irM+4Y9TG/OvIsRDlOmq456SNjE851oirzRtXe8
	 lZQWbQlpxU4vABwcfP0xFsL+qGGyitfJOssK2iVmnZz4e/iEQljIL6JbIGX9GD+87YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3IQ2mTA;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4E606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E4E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A3IQ2mTA
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3adc8668936so747990a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985938; x=1793590738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcKmQWD5BzKPZcYyv/2kD79SsEZPAeCLB89VrkV54d8=;
        b=A3IQ2mTA8cQEHI6S4baWIMjJjrD0Z8Cfx3R2KgYQsYptRhsmzdRrMtWzDDOU4U31HN
         /XCAhfUfV2m1vnbrLgpdEmqRH8A4T1JzXiI/b7pO0+Emv7TagfyZZIZ+vFaudJYoW8Ul
         fLeJesfdAzVY3068aL8altLCq23GScbAKG84FRxWcl7oqqBiUtqf9E0fIz9385UyjARl
         z2YrJObZU95zkUR7G3zOTy8NZTVJpldcPUseptiLB3p8ALysL31uMXRdYJQ17i066ks6
         yNpWdVmLVEJv1npuc1MrrAnEwTzvzic//HyWF3L/Wbg4gmEMjCMxHaY42Hi1HMI/OKJX
         LmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985938; x=1793590738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcKmQWD5BzKPZcYyv/2kD79SsEZPAeCLB89VrkV54d8=;
        b=fYivkWqRZBGF9xs5qncGhOcDBFpV3cYSkYU+IZBo62lcwgrw2/YFxn3NkErPzTGEec
         0sROPBxMtNu6+BmhI/OlVign8CCo8sNft7iXM3uMjW3yffjD3es1TTyiqPkJomkGGEsT
         qn6umVPwKKcgg06mPQHKsqPTCmoVabsvRd5e4BasIJ44qMIsvyJ+NA7f0MIQtm78BbW3
         BogmxhtE2YfPZusizeF0TkOsGnarLZVELiMBk+OcO317dE5uuMCQKsZOzyj2+8uLPIP0
         qi/hYKzCzfZ4waVDt+ifNQPBYAWDpEXj1jGt8OfMpER3aOLDpMT/KosB2+fD9R8CMb6s
         sY9Q==
X-Forwarded-Encrypted: i=1; AKwUvByheur/RejskE9MdMx2Sab0sCvXKQTkmmtP0LvX78PPhXHkZXf6CgL/jdJcBr24XeFUSGbOub2l6Ws4Goo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwmhJU6nne7CE2Rk2UO0TOufEgF1Wr16psvfK/bJhRk/bn0CD5
	006On6yzigz2KL7YzEO3mtdx/nNknsiduGZxzPgBN9PS0BJEuYyKEgKP
X-Gm-Gg: AYBFou3g1zHoZnbJzraWk81zOBNYaBs2Hd7g4r1/y8Z7/s08iu9nAsAen4K35D1FBNc
	BsQY9s1OzLVqLjjj+inQScId78AJPQfYYuCFbC7jRjdS5AWyVfM9hWpaCdrw/zGhR1ovtuTO+u8
	gqM6E+dQrmVQGguTpNZpzCTQHpdnRKkz0qJYcskA8bDscVBHvW20GFNaaIgPyrmf/ziAXmXsVbl
	eLo2OiCUS1NxT4GU8Wun+WYgXXdXOoI3/BY1OJ/K+mmg1SX+HR2oWkbcTrznR3kpLZn/gcKwa44
	nN34HYzzSmCl6bbA7mSwN1wElwtcAC8L2ldNrxPLiyPuk9nVcm6t4WERkVt3fwcG+x916flS8iS
	9Uf6CtYJqT3CT5sd84DuwhHISrcpTNtAtlyxk2pAzGQ4pafwrRBvSobQWbIbRP/ZRJwsU5ePUwT
	3//uX17Jw3p5+3WAS0pl1kIAkyKpP2IMjakv+Q2pNBiQl7QVlnDV/OuH50R1/ZarbIV4DwqNyq4
	lfQ4s9FjcPoFZwd20JjTCF6ehp5xgcEUAG5MOrO5HvOLQc/Zze2MnmmkIqtM/sEg+njZOdqYnv3
	9BHBYw2BD0kzD9KHGOtPyQ97JfCn7dr0rDtBb6M=
X-Received: by 2002:a17:90b:1b09:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3adead248d6mr4684275a91.24.1792985937744;
        Sun, 25 Oct 2026 20:38:57 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:57 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v7 14/15] f2fs: allow large folio support to writeable files
Date: Mon, 26 Oct 2026 11:37:44 +0800
Message-ID: <20261026033745.784107-15-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

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
index 29d39737232d..4db92c85ea99 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3282,7 +3282,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2c9343eb6b5e..53914629c604 100644
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
index f621d5e65023..3d621a20766d 100644
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
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		err = -EIO;
@@ -720,9 +711,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
 
 	err = fsverity_file_open(inode, filp);
 	if (err)
@@ -1194,8 +1182,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
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


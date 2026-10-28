Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202329;
	b=MKMk1zcI6ZeCRQTSi1gs/BO2HXcqk2BycYg6z2ZNfL3eMHFNzb2Vuwg6zUeI+MlL6E4a
	 wh8F/0rr7jQ6cNiRnB6WIukLK/9jBOOZD34UPxMXaiZoq29bIUZPBvfaH2Bo6oU1whRma
	 AXlQ6H/EG2MG4yReAu2l9QwnKrfF7/erDEfZYZjfL3A7PDt4OxuQwmZg58lNYw7xq2dYG
	 qJDIYyqXaZpOb+G3//bL9rOpcGc1un3i0a5RQxFWbk9IfiD4ce60xhadZHzSCCOU7QIhu
	 FyVzCxLxEI9EuZ6WtBx7vajm+9A/IV8VSn42pKS7EvUyqeAYrRBwg3SijGWnMCbRNKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gtH4j3tT1itrQEFkbnlrDQChbAZM+EFXcvfy+QYs5TA=;
	b=cZ1wWtblwroJBicOgpeUz4+4yfg80Xbs5uvpH+1UgfxKz/FOR5CA402zFHKugLjll37Q
	 RDwlWrb+t9+zU0YDgoOQBwYTetq+xpPZyDN/VCaSpJbKwc2lr+fz5wB7VePb/bLHlA0jt
	 5PJyjLOQef6U2+ustQyYirbViK0Wsosmn0rbYuCE1uVOZYMS76qipTCvu2HHUodsoFduI
	 6F/+vzq4d4aoFRL+ZfNa/S5VgDH3Xhn1WHf0my48uGv1BfYn7Cn8yUiSgPs9GDTPX+FJz
	 iw3+AmVlRYtyu8do5RiQ3JEZLizdJl8e80Edp7mV9gbltxtcG6tDsNdfOzXCmKnz78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ghvZkxDV;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D5B60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D5B60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ghvZkxDV
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so3796645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202328; x=1793807128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtH4j3tT1itrQEFkbnlrDQChbAZM+EFXcvfy+QYs5TA=;
        b=ghvZkxDVNMk4PcB/B2DGr8aOAcnd8P6iWaBbaI31FWEYtFX3EnbRitHCsimyJjKUIi
         U4PRo+f2oph/bcEGPPiZiBP7ylRGDx1BtB4tgGC+wuU4IXl8HxkDuaV5LpbmUDMX6+Hf
         wmqWTGVxkDeTMZeQ/G0A5cgmZCn3GdWVjRdRcdmgaMLYnroWIIZSLDVhShwQfNCkVmGH
         pUbunjqMRN12oHRxlc4gHxzDcoOFV8LtkW5xR9ETp638NdBhKnYKLGE8ecyc05k/DxOe
         aHR9JCV2r6ptxo+hX9RiZafp7SHdpOLO2RtyV5YZqbIvlh7oKfkkRmI260Sq7mYw0ijH
         xy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202328; x=1793807128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtH4j3tT1itrQEFkbnlrDQChbAZM+EFXcvfy+QYs5TA=;
        b=IDLDkAqc/IfEcme4TZaKYBaHuQA7MC10lbO/Bsne6cv7gz5W8h1aZYWNs+UWkfS/BC
         NE+QsnnVj3YBB/gN+UtQCaqIDHh9vFK6q950bspcbCDv2/C3ampexatgZnJT/YQQJ2vP
         84iHkvweesv09fzxUWrGsmdHlpQdL06PMghN6klTZ+I2GLG5OXhZY/yZaAsdXxY5zOv8
         c13XifQ46AfgnUYj/qfzFKZ9JthCZZDxRqarupEbqnPt2fCayGxtAw9b2ow/OivUI+Ho
         EZH5PlJIXhFZ75y9p71xTiHqpZa9J7LvxY9XEGX79HBeTL/ss/jNLj4DcoVQSUPNcuQK
         lYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFZiVegC7wwBzzOvXu5LMo8FIt9rQBVYJF01xslKE8QkTV5BPSAzwr7ihF6rLSXw7H0so1HZEI3ntOmi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVotLbvy/8uV6yf0zh7pk2uUewO8SHjbl2OHsJrX4W293tkUdH
	8U6GrdnZWvsDOcTas/EEMvQL+ywJqQxCkGU7daop/VziSy1Wef0NqzCT
X-Gm-Gg: AYBFou053bR78GQdoX5QiWscphSZUfZgk6jUh7SqAapA4bb/XqTGFR5OSAZn1x6O1p9
	z6F3MoL2AwZoU203N24EqDvuKW9hRO1WO0npFi+YqBR4NBmcjMLwSNMecsTMrRv+IQAPXtN8Dx6
	nvBM49bAtKyqhLtYNMOJR4K6t9s+mh3uPqEWR4Igygc4ETEf1ZLbxZCTbiF7Nh0bmcsLzEMnMpa
	qtOSV940w1+A8v1nCKCRLB2I0pvyPB5yvgiGSr3uIVnbx+6YZHpNOsCKhCNZpq/w6ZwfWxYAoz4
	Yb5r4uWi2wG7iBqeiZ0lskPD4C3haRrTz3lUrQnqFkwmYyOzbPt0i7egSgwrAGLblbqQwOJq9x9
	gQgxUKArlz1Fmr5KOeARlVbAfVHi8IR/7ZkCNOiQA2Erv6d/sxtLtn2EoFiCLdstnC5L7qFXMZk
	+czvNaDoBzHYN4gJdqp32H+XSGM7wabl0eXLOwnxcumJKJtykTrEo6fN0CeOOKnvho43McPB5Bz
	A6aUHXfStL3t9E6zuZoJ0AdW1mcirsC4YrCsHDF9PIS/BeLR5fVIS1T5AhIu5JqdCEnkvQNC2ws
	djD+tPtUCtaZUgmzVQjn8iJrHGGxgv8E26IXqVA/RaYG1q8iurwUlWUBj8yQJKjgBe8aoQGweUc
	wTtGjxwL2+Qkh
X-Received: by 2002:a17:903:2c0e:b0:2e9:4243:431d with SMTP id d9443c01a7336-2eb003b8866mr27729785ad.30.1793202327795;
        Wed, 28 Oct 2026 08:45:27 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:27 -0700 (PDT)
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
Subject: [PATCH v8 14/15] f2fs: allow large folio support to writeable files
Date: Wed, 28 Oct 2026 23:44:05 +0800
Message-ID: <20261028154407.1601430-15-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c  |  2 +-
 fs/f2fs/f2fs.h  | 17 +++++++++++++++++
 fs/f2fs/file.c  | 16 +---------------
 fs/f2fs/inode.c |  4 +---
 fs/f2fs/namei.c |  1 +
 5 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index da54fe425f78..cc3c9e51db9c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3288,7 +3288,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio = false;
 
-	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+	if (f2fs_compressed_file(inode)) {
 		if (folio)
 			folio_unlock(folio);
 		return -EOPNOTSUPP;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 412053e1e507..7974f04893db 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -5360,6 +5360,23 @@ static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
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
index 8360ac4317f3..15bea642e986 100644
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
@@ -733,9 +724,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	if (mapping_large_folio_support(inode->i_mapping) &&
-	    filp->f_mode & FMODE_WRITE)
-		return -EOPNOTSUPP;
 
 	err = fsverity_file_open(inode, filp);
 	if (err)
@@ -1207,8 +1195,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	if ((attr->ia_valid & ATTR_SIZE)) {
-		if (mapping_large_folio_support(inode->i_mapping))
-			return -EOPNOTSUPP;
 		if (IS_DEVICE_ALIASING(inode))
 			return -EPERM;
 		if (!f2fs_is_compress_backend_ready(inode))
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


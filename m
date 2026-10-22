Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655690;
	b=kLr8ZvrjqrTbQoDYgbqvwo/VBjdyQiDQj7nJx2/eIJPAkS0oYbVxVhLXZzNhOHrBXFGM
	 O54QT8LVDBGEtM9USNr8guHsjriwqvVstFbTfEO7WubXJ6TpZlEqwioQey8bocg56es2N
	 Hz+tZC3EdH3eT6nzeC0FWVT4dSG0ZIKFr/KreF6Z91u9gU9C4vllBe5i2UjFZ8bgVDbIH
	 CQckuVBkArmETYlGOoNSDpec4gjIRt1HIjG6CSCW2VS+LavWBMOOfAeVnO0AhUABGKYuL
	 G4CVFOmmfcB39DxKhxvDy6C76F166gzazuMeoM/rmQdiQbhkpjnwpG+s9KhPorq38kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m7Q7KrqKTgzsyXWYTLXb+HgkSh3Yf95tMI/2ie5hxYU=;
	b=FlCiTiVUxpkDeQi1zgjcVob4AFoRTevNe4v9xX+zGyM6TNmbumtcMdaRmrS/sB8u4WeD
	 q1OX9ontiLbA8yE/DJXBxw6vmlJRo5HLL20DMqr8dEmAm7/7tbAcAopbqO80pI8qV8EH3
	 JHfFqiIFzjnHDW667GKTu1lBFOaum7Qnnq925Zjc6aFCWFUIvIPGES8NKRZ+n1uoT6h0h
	 bm1b20tWTZOB5PKJ8bB+zqmmQ/TR2C1tPgJwIx3Z3z3wu491JKhRjC0mxhgcAJxGr7M3i
	 pjGB++/qdrXhXTPr/76pFC9vV9byvc/R6OaNwkZlUMIEPAaWaxf+qkkj8sCnSWqFNWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0g+IrFZ;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202C8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0g+IrFZ
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac5f801d7cso424771a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655689; x=1793260489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7Q7KrqKTgzsyXWYTLXb+HgkSh3Yf95tMI/2ie5hxYU=;
        b=K0g+IrFZ/+Xtro90L89mhnG+Bs1XeiZtwVHYyxrBYFvBL1fr7GOZKnc1/CWQJ9qEK6
         pa6Bo7Vq1q3FS/EUZ61n73939+gVNBL1s5BojbIFoJbaHWvPZAs+pxO2/MEINaO82R2Y
         M6N/80W2vzWmT7kvN1kyBbFF7SAITPmPorW4cSWxr2198vHolpXWXPG7TieBqEckOxfK
         hIba63jdFFzEEpcbRgAEVjwy/aA9VjgAmMqfk8AyIvHmAyM0hrn+lhdU0LUnWXjoZtjV
         ua2LwcEa8wuhiskBd/rBKnCjG5RdwoyAhuOpXbmSEV6BekNN6sGWG41/1oqlSFYoqHwP
         1vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655689; x=1793260489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7Q7KrqKTgzsyXWYTLXb+HgkSh3Yf95tMI/2ie5hxYU=;
        b=BjOXluTIZ0SoEv/3Lvp4NITn5gLRubb1H3SrcQRaKFxV+DMfI3zUvSc8OO9r0KwyIv
         AaOsBtt7OBeK4ldbuq600+eR3CC1OmYc3vsIgCuNm5NYFd0kQ1qbIfbbwJuPzw+apAMG
         VNO0GnnPSbjp4j1yujAErj+k0cWMlZhqnDhqeJadvTIqwUSz9fauYOatCx9tzjAc8vVn
         brVXuRi32XrQtM+sYJTqJfHdZpulcwyFwYFgv3u1cTFltcMTglKsOqEr54lZcTrUf8V7
         Xiwht4sW4/rlW6+ja2+QbG89uzOT2vBbIk73+VBTk0XXEwzaG3/zKp4vLebMP7OkPgio
         6tNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHw87IAf2bAkd40p2FpsAHZS7A4K5RimMj0ROfCMyb50S5rYjMmZK1gELxLdA6TX138kJWhnyaQ387NIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd4yP3C7kzlpxmKFm4RzRjNKxoROwjiW+hh6o6W75XiPmbsqjX
	VPVOWcLl9YIel2yJ67jVdsL3U8elkINF5eS0R0QVPiao3lI/mLkFbmSH
X-Gm-Gg: AYBFou1uQKCltoKgifwImn29o25JjmdxEq0vdDrvt7ECZod0ZKvPwdEfVOFuF1qR0Yv
	AYPYfgNRhuKB28YfjCOokDs40uHggJA06GxRhzACje7xSZrru/zg6Cm5GpuKI7czGOxK2PJRQKs
	KkGQIWoCMjdjgeKEsyJFpanUuCV9vQL7aAIkP0++Fj7BCUWlT6bXWuDCdfBtd1VICU7lnKFrfko
	kEWpVyUu7Nb90bmZfKmDUuo90iGIZAokVGsFu0/77OKO/MjGgCY537j+XUR9bxXEb0pLXA+Y128
	Gv6AVtgE10/EHbmZIlSWzvzOpEw7PzgML48Jt94S/bz6PHQfIKO1N4YQ8TlpwsnGvh9Y2+zXrLD
	j5CEkFyzzI2Xkc/cjMYvJxULXi8eHFAngnSefcemD1NtSd06WfSh2QuSwvC9ns3OJa7mf8vuFyR
	3XMRYmHWp30dFPCgkJgqaF+RC23yM33D6rH13Mbnfc5wrf4QJQqL5tr49HDFzrRrQb2q6pN7YOE
	M3nPzfD4y1gbZA2HNxIGNolLmJbDaweD8qOcsHDb+/3dZhPb1hZoYxlvPquVWBQ0REA9Tnlq9HL
	M8zmuJoEa1Nif8uHQA==
X-Received: by 2002:a17:90b:1d43:b0:3ab:2737:3392 with SMTP id 98e67ed59e1d1-3ad86d4e4d1mr3616837a91.53.1792655689458;
        Thu, 22 Oct 2026 00:54:49 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:49 -0700 (PDT)
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
Subject: [PATCH v6 14/15] f2fs: allow large folio support to writeable files
Date: Thu, 22 Oct 2026 15:53:41 +0800
Message-ID: <20261022075343.3043003-15-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
index f71fb7c993ef..2338450ce031 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3266,7 +3266,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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


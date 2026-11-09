Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215766;
	b=QfJ+NZ18jMyje2tw7GShNTBo6D+v23f7qkPgSFOy5M5G9sr9yIdf3MXvdNK4a0Ewkd1/
	 R+tgi6ua4r0CYg1zRsmWJj8LagcTF+Sq2cw1+5QAk3E42T47XX/OmECwB4OkLbOPjSFgA
	 03J9WZMgSbZDO0rtRdtSiOj6D6ZqliucCnQ+NZTgpeUjgs2URjPN6xZm4fktBw8cUST8i
	 FkUujoiwVgJgxADA0IHa3BDrQJA6CDs5Oi9turNDAQWXdz+wuUV1S42pwU5DumTGjPdzR
	 eTmWZDYHU9FFfp17Sx5IL0uyzXx6vEswuxXJlJOFOPLV8WhGZOG6pwQtaLo69YQ7dkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References;
	bh=cK1hba0wbQVz5E/7rE/2Wc77WiqrBd6zURjsMcO1Vjk=;
	b=JXLoM0uukpjP3zv/maI7LGSG4i0NWYjIk5NEJgcJaAcRf+NnYD/sQwNt0n27CDsGQnU0
	 Njwg/hpSlbbC5oTuZ48/f2rmv4v9nJWTjmG8gN4ltX8dpJyLgIdbq94DQWjWHtGUvpujf
	 aMuTxT3z6Pl0z52yNU08XzVVOcwwXFjJrgtg1yY4g8hXsB9i85AlnjD2O4FelCQ3XM9GS
	 cV5uhfwakyxpEOwjuUvaA/51BPgZArmMbfgFkQCnk3YQWVH8JoLg/mLsJYtYt7Qe2tAdD
	 eZUtdKSyQkIvyjQutspL+hT9xoyUPHTMDpDtp3HOUVd8YvbQY3ihJ2YtO/wbekP/+zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A2bG5/F7";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355A60A2623
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5355A60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2bG5/F7
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so517814b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215766; x=1794820566; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cK1hba0wbQVz5E/7rE/2Wc77WiqrBd6zURjsMcO1Vjk=;
        b=A2bG5/F7rpBRnvN1rtfRxhIBK9hy4fTcGOyMoj4zr802l52AEbYMxAvKpZ0sl0LbbM
         maOeVLoNWw4h85CCMUis5sh2GOQh+HPVTnXgIp/PAuBD/c1grxBc6mZe9DZZT84KK4xB
         UmTHAMZ3I/nvZz8nN0EJJK85Qw9pDS/9Uzyv/gpGvmPeEw1Yqe5MaAiBR5v8+zM1o7Xp
         zYHr4qeN5ynRCmUxbWhLiGHVHnN/ApZvQc4hvRD9psfRtwBcltChYkn6SoHYa4ZpEvyZ
         ZfvjS3YjLzutNdWwqA7aqXmqYpDIIM96jOWErBW7hfs8PqAy9wvyCiKXCwOO0X737LoE
         7Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215766; x=1794820566;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK1hba0wbQVz5E/7rE/2Wc77WiqrBd6zURjsMcO1Vjk=;
        b=2Tm+YH1qZ0z9l09TVHjK0o7XaJAgs2src5176WK1OBXf4JvW57UFdfewcDqwGcWawP
         fNT5QlomM/wD3lT3qh/4ob2UdWB9sTtm/JNpYOuw3QSrphr/GEEUORwozHfjOG/OdXPc
         +DEmc1BUMk2bVfkc28pCXO1NCMSHRr/WVC7pzT1KWZhtgoh0j1WF95wzhM16imLSX7pS
         RsW/YSFD/JrVXhDUdxjelHKZgK/gs1WXc7aPI890ZOONPYYCZTvqTZ7I/tsoPecEYOX9
         x55xWJblO2PAYOXjcM6KjADXKRlU0l8j8QG/TTnd7G8bBZ/9U+eEtYx6JpH/pVz+34Vb
         Pocw==
X-Forwarded-Encrypted: i=1; AL+hErENbUJAEGxOQbO/2ntFLJcIzVtOkYBOYQ9i2rtkwJ7ZDPmh+q+QXNaM5CaQmv3rp6vK0ztY2uBRv2YAlnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IrMXBXZfDEk/2Kx/1abELqQ5995IBNjREVyuB3ZDo/DA8BdDY
	DCHu0MxyV2c6yXgpdSKC2bsJuTtAvHpuDI7WEvzXrHrkAMa0MAjevk7g
X-Gm-Gg: AYBFou1jOxfKDa97ac6rfSPThVSSVFULL8/2wGNdLzBBV3d5sXvEN1UO321kn49+5Oj
	RLcg21AcdeVKCaqUwuZ/QIdGtosb/0iCvU72PJhilWOwcyx3e7mkgtKIySrY1K4t0cjdjWN1NDT
	pvoVEt+iUN79qsGP5Su082U/vN4WpZLFPw4BhrEQQHklrLg7sGmqQwGT9cliYkDz6RecpboIKNg
	DVtPhB4e27HKYPD+qi7q46buF7jiK0BzvcUWvRP2NEsSKQJaoHGuUrOgkFmf7Gd+e8tN7fsAcBm
	phtCCa23UpPVz23XS01uz00p65c9hvVqyiG1jlPgLjHV39mpxlIlME6yit0Ea9KzP22zWA+GV/e
	hNIBcpz7Y2sVQVv5qXrRWzVU3B9DuzUHOrCZDIW+f82FNnT6GDTgt9bjR0It8SE8y6+TH6zfDcz
	lwORjkMpGwV6d5iKSmf8w/diZ7NmGNoDUeEqth+uZL7dUp51djgWtKmuxlU33SkwxVcoKp24utv
	8axFATLM3+XtW6xqug6F/JnxZoknevKskzAkzfM9UImWDbMISQFsyc7SOVQW3zXYYJzwSjkQy42
	x62/THzKZpTC3vCjYBOSqYLes83nVm8P5nDxhg==
X-Received: by 2002:a05:6a00:8086:b0:8b1:e8dc:c899 with SMTP id d2e1a72fcca58-8b66c3c75c1mr3221568b3a.6.1794215765645;
        Mon, 09 Nov 2026 01:16:05 -0800 (PST)
Received: from [58.206.202.11] ([104.28.215.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b648e54747sm1063339b3a.11.2026.11.09.01.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:16:04 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Haoran Wang <haoranwangsec@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org
Cc: linux-f2fs-devel@lists.linux.dev, linux-kernel@vger.kernel.org, yi1.lai@intel.com, haoranwangsec@gmail.com
Subject: [PATCH v2] f2fs: verify inode data-block ownership at mount
Date: Mon, 09 Nov 2026 17:16:01 +0800
Message-ID: <20261109171601.75996-1-haoranwangsec@gmail.com>
In-Reply-To: <6ad2359d.0083e9c2.97e0f.79de@mx.google.com>
References: <6ad2359d.0083e9c2.97e0f.79de@mx.google.com>

At mount time, walk the NAT to enumerate live inode blocks and claim the
direct data blocks referenced by each regular inode's i_addr region in a
bitmap.  If two inodes claim the same data block, fail the mount with
-EFSCORRUPTED, since at least one of them is forged or corrupted.

The check is NAT-driven, so blocks unreachable from the NAT - such as
stale images left by earlier mkfs runs on untrimmed disks - are ignored
and cannot trigger false positives.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610262143.a92547a9-lkp@intel.com
Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>

---
Changes since v1: fix the false positive reported by the kernel test
robot: v1 scanned the whole main area with sb_bread and trusted stale
inode blocks left on disk by earlier mkfs runs, failing the mount.
Rework the scan to walk the NAT so only NAT-reachable inodes are checked.

 fs/f2fs/f2fs.h  |    1 +
 fs/f2fs/node.c  |   98 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c |    5 ++
 3 files changed, 104 insertions(+)

--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4000,6 +4000,7 @@
 bool f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino);
+int f2fs_verify_inode_data_ownership(struct f2fs_sb_info *sbi);
 int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 				struct node_info *ni, bool checkpoint_context);
 pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs);
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3455,6 +3455,111 @@
 	return 0;
 }
 
+
+static int f2fs_claim_data_addr(unsigned long *claimed, block_t main_b,
+		block_t total, block_t blkaddr)
+{
+	if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR)
+		return 0;
+	if (blkaddr < main_b || blkaddr >= total)
+		return 0;
+	if (test_and_set_bit(blkaddr - main_b, claimed))
+		return -EFSCORRUPTED;
+	return 0;
+}
+
+/*
+ * Verify that no data block in the main area is claimed by more than one
+ * regular inode.  Walk the NAT (the authoritative index of live node
+ * blocks) instead of scanning the raw main area, so stale node blocks
+ * left on disk by previous filesystem generations are ignored.  Only
+ * inodes reachable from the NAT are checked; inline-data files carry no
+ * separate data block and are out of scope.
+ */
+int f2fs_verify_inode_data_ownership(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct f2fs_super_block *raw = F2FS_RAW_SUPER(sbi);
+	block_t main_b = le32_to_cpu(raw->main_blkaddr);
+	block_t total = le64_to_cpu(raw->block_count);
+	unsigned long *claimed;
+	struct f2fs_node *fn;
+	struct f2fs_inode *ri;
+	struct folio *folio;
+	unsigned long *bitmap_bits;
+	nid_t nid;
+	int err = 0;
+
+	bitmap_bits = kvzalloc_objs(*bitmap_bits,
+				      BITS_TO_LONGS(total - main_b),
+				      GFP_KERNEL);
+	if (!bitmap_bits)
+		return -ENOMEM;
+	claimed = bitmap_bits;
+
+	/* skip the f2fs-internal metadata inodes (NODE_INO, META_INO):
+	 * their NAT entries are not user data and trip
+	 * "inconsistent nat entry" on every lookup.
+	 */
+	for (nid = F2FS_ROOT_INO(sbi); nid < nm_i->max_nid; nid++) {
+		struct node_info ni;
+		int base, end, i;
+
+		/* only live inode blocks: NAT entry valid and nid == ino */
+		if (f2fs_get_node_info(sbi, nid, &ni, false))
+			continue;
+		if (ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR)
+			continue;
+		if (ni.ino != nid)
+			continue;
+
+		folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_INODE);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
+			if (err == -ENOENT)
+				err = 0;	/* node gone, skip */
+			else
+				break;
+			continue;
+		}
+		fn = F2FS_NODE(folio);
+		ri = &fn->i;
+		if (!S_ISREG(le16_to_cpu(ri->i_mode)))
+			goto next;
+		if (ri->i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))
+			goto next;
+		if (le32_to_cpu(ri->i_flags) & F2FS_COMPR_FL)
+			goto next;
+		base = (ri->i_inline & F2FS_EXTRA_ATTR)
+			? le16_to_cpu(ri->i_extra_isize) / 4 : 0;
+		end = DEF_ADDRS_PER_INODE;
+		if (ri->i_inline & F2FS_INLINE_XATTR) {
+			if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
+					(ri->i_inline & F2FS_EXTRA_ATTR))
+				end -= le16_to_cpu(ri->i_inline_xattr_size);
+			else
+				end -= DEFAULT_INLINE_XATTR_ADDRS;
+		}
+		if (base > end || end > DEF_ADDRS_PER_INODE)
+			goto next;
+		for (i = base; i < end; i++) {
+			err = f2fs_claim_data_addr(claimed, main_b, total,
+					le32_to_cpu(ri->i_addr[i]));
+			if (err) {
+				f2fs_err(sbi, "inode %u claims data block %u already owned by another inode",
+					 nid, le32_to_cpu(ri->i_addr[i]));
+				f2fs_folio_put(folio, true);
+				goto out;
+			}
+		}
+next:
+		f2fs_folio_put(folio, true);
+	}
+out:
+	kvfree(claimed);
+	return err;
+}
+
 int f2fs_build_node_manager(struct f2fs_sb_info *sbi)
 {
 	int err;
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5372,6 +5372,12 @@
 	if (err)
 		goto free_root_inode;
 
+	err = f2fs_verify_inode_data_ownership(sbi);
+	if (err) {
+		f2fs_err(sbi, "data block referenced by multiple inodes");
+		goto free_root_inode;
+	}
+
 	err = f2fs_register_sysfs(sbi);
 	if (err)
 		goto free_compress_inode;

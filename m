Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A263C872C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033061; cv=none; b=Iv4ABpuZd+j3LJbNs026Uf3XiJGMHI9uAYnp80ytdJWpyW7fSi4OtL/UN3218CljAZC9OLMfku2Ih+HU1Id97uJVppJxZacvYp6jUr1m/oAvYlboj9t0LEZU2iJPLxy+qbi2cBdSWM+Tz4bw0oPrLili2c01BoeiO3pp75dRddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033061; c=relaxed/simple;
	bh=sZniqozc4w8922ObuoQPVNbXGED/+im3bzoyWHB/MwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hpu74PMBYl6PxWSIUn1mRBVv33GDDaCYTYy1r77iMGHCx69hbO/K7In/oRlo9EhrOl+cySq0T0HZatUVA5yJx7LZ3x/hfrk7BU2Wu0x5s18Q5O30ZfJGKcu+bOana7J0Dhb+9xcZqPHme6AW6n9VmVq6VyJ0xHiRB2tJ2Tv/WFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf63Rz2z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf63Rz2z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso10831175ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033058; x=1792637858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsDm/3n5TTGtnRMOmw6WlAZLpwcXANG4w05bJxvvhdo=;
        b=Gf63Rz2zsCglLz82wyN2e+QTp+6erLtQluCoRxfdjC+mtDmFRTW6LEpO5L4hyqGFGH
         Bc6b+5gZQW2QityinyBydsDKkYD3cxemoZjHvyTTzJsJ4q+ueSsFLpCXtxLHTnZKvyLW
         VUo/TKhbiTYDf4dXlHGRgwV/cYKWsDdxW7IblIneOmdvVLSyTQOgEwWpfv0kat/jyM/Q
         5BBkIE7eOU7YH0gbvWEHALv5Tf4d2kZkZ0vC/QEpcCJRHP3gWThrR2jFSMr2jJjJgbxG
         YDNcH/ooklT+VzhoR6N9wZsODJYBevtR2+yjUrTqkIWPU4crtMpggATnVOl+kL3hau3y
         EIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033058; x=1792637858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsDm/3n5TTGtnRMOmw6WlAZLpwcXANG4w05bJxvvhdo=;
        b=Xmqfx2DFjGv52edxmMRoNqn0zINQWIMK+R3+CHYYGn4ESnwpXTQyo497XXmDN1gjzA
         qfT9KViBo2HTwspAkmGCmUHNBd45Iw31P2GGkzKirpMHPa0CSi6SyhLNq5jLWRVYlYU5
         2CuzNV8TymchXq0ZKRn2MXnsr495UagI63FFDQSdirmGPkKlKxVGSk7E4K9Q+bxAy//n
         ImxCKrAMR6WHARQKeN4Y0bwuzMLIbfAygW9WU/6t4MCxqDolDYvrfd46kAtd10xrs8Tq
         jZavI9ArUhX5CSGTOsJwZN/7ogM+mTIKFRsNJc83BEawrQpScY/FzPA09Th/hZQ1+Vyf
         I9ZA==
X-Gm-Message-State: AFq9FYKsRiKRIBSFU/WsDhoFA2GuxttWnGuaWUxq8ze9SrTnyWlwx4cF
	VjDfcY8J4OiPeVayaFceMpHtxVXnYa7slBMiAzBZj+V02hHNdfNpJ9eV+aamU2cV
X-Gm-Gg: AYBFou2hoYj3Qp3N5iiBcCHwCpPciwWFbjftRLqm/ElRh9wHJCL62oFvyoehcRG8aHh
	ctAz0N5X/dssimOu014YkgSgtjstN3CTf0VFDy39VimvDIrEkn+qjr4ZehhANYPNl6R91ndsRcn
	PKXA7a+do16/XlyigIELOO4pv/pYNGPo3nRQ5qJIz4kq4VlUu0AzQluY0fwBYuROaiTZBx4JyQU
	uGaESXjSmg3PKAQK6mpAlBJDQ/vWsCkyWSj3hlRLuPp83bjZpz1lEzLHZMXfUtRiezvgGS2m9f8
	8n+HE1oBIHzhCTXE7bLpmCNCH7FE+EkUlg7liPA0aCDa3VSz3fMG2i65iYL1m8GLZxL9b0zayYp
	HRtLlMLkhyx+o+D6zDsHjEBKAkeCUhf20p0MlDlDxapa9NU+l6sU3wijBH4QF/tIskt3vZQnYKX
	w10ZjtwLvOQMJDdr0T59x9qVg64gdOiwY8QS0ZdiA92AJhrnFFy4KaVjlSvuth2uvfcgc47pLDa
	7LVEDTzYmDApOpsnH1Ga25Eyto2tiK/C8aCsOnGbsiuVRZ8u40p35MfS8tPLjU1O1xAfHk7T/V7
	Us1XppJyRTOWtaY=
X-Received: by 2002:a17:903:32c2:b0:2e6:23e5:4938 with SMTP id d9443c01a7336-2e842bc54bemr163564685ad.22.1792033057837;
        Wed, 14 Oct 2026 19:57:37 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4eb2sm76539465ad.74.2026.10.14.19.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:57:37 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] f2fs: release a removed xattr node in roll-forward recovery
Date: Thu, 15 Oct 2026 02:57:31 +0000
Message-ID: <20261015025732.1564032-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

When xattrs shrink enough to fit in the inline xattr area,
write_all_xattrs() truncates the xattr node and clears i_xattr_nid. If
the file is then fsynced without a checkpoint, only the inode block is
written, with i_xattr_nid of 0.

Roll-forward recovery starts from the checkpointed inode, whose
i_xattr_nid still points to the old xattr node.
f2fs_recover_inline_xattr() copies only the inline xattr area, and
f2fs_update_inode() writes the old i_xattr_nid back. So the inode keeps
the stale xattr node:

 - The node block is never released, and fsck reports "nonzero bytes in
   xattr space after end of list".
 - If the inline xattr list ends exactly at the end of the inline area,
   its terminator is read from the stale node, and the removed xattrs
   come back after recovery.

When the fsynced inode has no xattr node but the checkpointed one has,
release the old xattr node as truncate_node() does: check its block
address, invalidate the block and drop its node cache, which may still
be dirty.

Fixes: 28cdce0459cc ("f2fs: recover inline xattr data in roll-forward process")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v2:
 - Drop the cached xattr node, which may still be dirty, as
   truncate_node() does (Chao Yu).
 - Check the block address of the old xattr node before releasing it.
---
 fs/f2fs/node.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 55008f18afd..13f977ca6d4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2831,6 +2831,43 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct f2fs_cached_block *ent
 	f2fs_cache_wait_writeback(ientry);
 	memcpy(dst_addr, src_addr, inline_size);
 update_inode:
+	/*
+	 * The xattr node of the checkpoint was removed before fsync, e.g. the
+	 * xattrs became small enough to fit inline. Release it as well, or
+	 * the inode keeps pointing to the stale xattrs.
+	 */
+	if (!ri->i_xattr_nid && F2FS_I(inode)->i_xattr_nid) {
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+		struct node_info ni;
+		int err;
+
+		err = f2fs_get_node_info(sbi, F2FS_I(inode)->i_xattr_nid,
+								&ni, false);
+		if (err) {
+			f2fs_put_cache(ientry, true);
+			return err;
+		}
+
+		if (ni.blk_addr != NEW_ADDR &&
+		    !f2fs_is_valid_blkaddr(sbi, ni.blk_addr,
+					   DATA_GENERIC_ENHANCE)) {
+			f2fs_err_ratelimited(sbi,
+				"nat entry is corrupted, run fsck to fix it, ino:%u, nid:%u, blkaddr:%u",
+				ni.ino, ni.nid, ni.blk_addr);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
+			f2fs_put_cache(ientry, true);
+			return -EFSCORRUPTED;
+		}
+
+		f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
+		dec_valid_node_count(sbi, inode, false);
+		set_node_addr(sbi, &ni, NULL_ADDR, false);
+		/* drop the cached xattr node, which may be dirty */
+		f2fs_truncate_node_caches(sbi, ni.nid, 1);
+		f2fs_i_xnid_write(inode, 0);
+	}
+
 	f2fs_update_inode(inode, ientry);
 	f2fs_put_cache(ientry, true);
 	return 0;
-- 
2.56.0.385.gd3acb90ef8-goog


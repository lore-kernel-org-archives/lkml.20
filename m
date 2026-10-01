Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6AC49E142
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872500; cv=none; b=RiPIZVXw9czX8cqBTT8Em3+lAokhfJI2YyWWGlX5ZVdptoTtzPYvmJLvlJ9lgJ7FfBlt8TAzPxbRGFQJBaxkNudwLNXPmaq0GMBid0a74oYe/qKNg5c9ohEyQL5k+V6kMZOEDO7kqTvt6FBlWC4WDkFdgdYrtesWc0k+ZE8pJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872500; c=relaxed/simple;
	bh=zrZwbjnwFa2fvtKd1riZTpYubuiOygKlk11p9wvAiaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=slCAIqq6+eydkc7mAMkRWqpDQlGmyL9yjyd4XeiyOD6Ki7hucelouzcQ47/WsyWHjquG+UurZV+JEHGAuN7qn93m1dOP1G/tpLlX+hcMdv2BZzDmWWUZBL8f/c9xH3OtqTVE3MrRPZ8yZnz5UJFYCbQmZTLr6ptD0/t151L3LEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y57irXey; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y57irXey"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d8709e0e13so2114791eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872498; x=1791477298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoKxOTjOYPY0jJKf2vvmoT8EEKuylC7jQJjw/PcHr2A=;
        b=Y57irXeyBtQzrnu7gORbK/VFx5J/kId/tN6l8xkwriUi13/+4tRKGrh7gYpyAylyS6
         kzvTk2ZStrD7mUbfdLkGdWGz5C77Ab10IBGGBVYB58z81LpAuByHQkoRzxFJxNtKEYd7
         Np7apDo2+/tnEpWeXPyz/7pY1moGnJe7rWWIPzJ0vjH/1nmxq92JL6QRPPB1YN5+++d4
         g2dJ5rQETItqNjlz1A49W1ag9J5cvtf2oG9oKOwjw34CebOg+WIWq8cXna4/QJOeRxDE
         5TfChpija7fTnKorT+vM57twATOxMTCfei/2E9ut1S2Ykb7dgOZm7XWbo/L7e4bUqeAx
         hbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872498; x=1791477298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoKxOTjOYPY0jJKf2vvmoT8EEKuylC7jQJjw/PcHr2A=;
        b=RufObnfyImZnJJYFYPt8SfgYt/UDm2UmjbA4f4FmtcNoMeobO2agjkzkJAZFfY1VLS
         s7BK/HxFWqq99Gp1SVMaDOYJgidJZ96NGkF4PN9+TVQ28gs/2pVPAxLRKitwR8XY7Z0P
         5dfvwVsltsvnej2CCwivGkiEamMI5HCmweXbSc8w6OWMAAmBHQQhPmWP768GLWWk4/1e
         3eLkcQUUWA49qDTb/xbVDZTFxYakHAHhCdrCRo05cVp22/TfWCUUoWSBMEZrUUFBuoCy
         k64QFM/MjdFB3DtJ8r5+v2qey0D23Hl0QXs+0ylITlad7Uh1u/T/KcU1SUL0XpHf6nv9
         z4pw==
X-Forwarded-Encrypted: i=1; AKwUvBzqx6HImAE+EaDHNAD/IsFN5LkQvd1Y+U9DhRktOvudkWgoiUmu0hdQnwStwdokU3oaiN5UVAjKp9NTllg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2ZXB7tVVo88DojfBce+lPNpAUNbI/w22AuHIR/VsUq3GcVKgz
	9TVTc6xJ7OxB90RPX2+8OQEIy3h8ELgY1vkhQ4iV6tQvP02qa1ZCPTi9
X-Gm-Gg: AYBFou3PQxv0bqRTI8TF/PeaAPzhAKg5ILGulZ9gUcOtN5wXeuP4VkXdCtYDLnaIWm7
	WP5UiezVVMHTiicESOlRxw0xINqyKYJ2YYHSI1e4RElGot2lXU97WWDTz78tbGkIAzmsopuYp7A
	LJFxMqZk5Rr17JAGGGdhTNwRHMs95LASN9yDk1kvj/6Eu+ueAa51SSYWjvDdQToRnfwmzBZRZWf
	NEbZtJLML3Boy+On314tun7CBUS4aUxW3+HDiQac34UYEGofI1IBcxpSJl9cvhoNy6jMNTXb4v2
	ViTjQGlB8PCoJs+B6/Dzd01nS3yPgPExvieybacheYQwpTZShJNLZXZsiUno8VTrYFlqxRfEZC0
	PxLcNJiiykcr7Rp4I5RrFPRoGOcsdLGIuNuUnOOWgeCR/O9jvIOTZyO/Ghc0oIwzjeQNKyTJBEw
	/x74l6YVAZuzV/05jhY/vXb1F1jzieYIdGDJMk8IvWTKRWJtFvvBz0pNm3Eek74UKh6i4fb0VyX
	RwCM7+Sz/M4vhz4GbEdwS8hECAxAz7LDG8l44XgABvagrmJcSwtOb3fAXLMHWrcYjId/Ihqwxq2
	sJV1PdoZpu451IstGZwq7AxCNxJRk13reteMLCG+qg0bkCkbv04TY0z5SXE=
X-Received: by 2002:a05:6820:4c04:b0:6c0:f44d:fb9c with SMTP id 006d021491bc7-6dcf50558a7mr5271071eaf.47.1790872497439;
        Thu, 01 Oct 2026 09:34:57 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49ded33505esm2712687fac.18.2026.10.01.09.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:34:57 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+799a0e744ac47f928024@syzkaller.appspotmail.com,
	syzbot+43fc5ba6dcb33e3261ca@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH 2/3] udf: check the unallocated space table when it is loaded
Date: Fri,  2 Oct 2026 00:34:47 +0800
Message-ID: <20261001163448.753190-3-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udf_table_new_block() hands out the first block of the extent closest
to its goal and trusts that the extent covers at least one whole block
inside the partition.  Nothing checks that.  A zero-length extent makes
it return the block the extent points at, which need not be free, and
the subtraction of one block then underflows the length into the type
bits, turning the entry into a bogus continuation.  An extent running
past the end of the partition makes it return blocks behind the
partition.

Such tables are not only found on crafted images: until the previous
commit, udf_table_new_block() itself left zero-length extents behind
in tables written by mkudffs, and then converted them into extents
running past the partition.

Check every extent once when the table is loaded, and refuse
read-write access if one is empty, is not a whole number of blocks, or
does not lie inside the partition, in the same way as for other
allocation information the kernel cannot use.  Check first that the
table is an Unallocated Space Entry at all: the walk starts at the
offset of the allocation descriptors in one, and for a file entry that
offset lies before the inode's in-memory copy of the descriptors.
Treat a chain of allocation extent descriptors that leads back to
itself the same way: the walk would otherwise return the same extents
forever, and the mount would never finish.  Let a fatal signal
interrupt the walk and fail the mount.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/udf/super.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 5351755aca3e..995969e6c7c5 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1106,6 +1106,73 @@ static int check_partition_desc(struct super_block *sb,
 	return 0;
 }
 
+/*
+ * Check the Unallocated Space Table once when it is loaded: the allocator
+ * hands out blocks from the start of each extent and trusts that every
+ * extent covers at least one whole block inside the partition.
+ */
+static int udf_check_unalloc_table(struct super_block *sb,
+				   struct inode *table, u32 partition_len)
+{
+	struct extent_position epos = {
+		.block = UDF_I(table)->i_location,
+		.offset = sizeof(struct unallocSpaceEntry),
+	};
+	struct kernel_lb_addr eloc;
+	uint32_t elen, blocks;
+	struct kernel_lb_addr seen_block = {};
+	uint32_t seen_offset = 0;
+	u64 steps = 0, period = 1;
+	int8_t etype;
+	int ret;
+
+	/* The walk below assumes the layout of an Unallocated Space Entry */
+	if (!UDF_I(table)->i_use) {
+		udf_err(sb, "unallocated space table is not an unallocated space entry\n");
+		return -EFSCORRUPTED;
+	}
+
+	while ((ret = udf_next_aext(table, &epos, &eloc, &elen, &etype, 1)) > 0) {
+		blocks = elen >> sb->s_blocksize_bits;
+		if (!blocks || (elen & (sb->s_blocksize - 1)) ||
+		    eloc.logicalBlockNum >= partition_len ||
+		    blocks > partition_len - eloc.logicalBlockNum) {
+			udf_err(sb, "invalid unallocated space table extent (block %u, length %u)\n",
+				eloc.logicalBlockNum, elen);
+			ret = -EFSCORRUPTED;
+			break;
+		}
+		/*
+		 * A chain of allocation extents can lead back to itself, and
+		 * then the walk returns the same extents forever.  Remember a
+		 * position at doubling intervals (Brent's cycle detection);
+		 * a walk that comes back to it is in a loop.
+		 */
+		if (epos.block.logicalBlockNum == seen_block.logicalBlockNum &&
+		    epos.block.partitionReferenceNum ==
+				seen_block.partitionReferenceNum &&
+		    epos.offset == seen_offset) {
+			udf_err(sb, "unallocated space table loops back on itself\n");
+			ret = -EFSCORRUPTED;
+			break;
+		}
+		if (++steps == period) {
+			seen_block = epos.block;
+			seen_offset = epos.offset;
+			steps = 0;
+			period <<= 1;
+		}
+		if (fatal_signal_pending(current)) {
+			udf_err(sb, "interrupted while checking the unallocated space table\n");
+			ret = -EINTR;
+			break;
+		}
+		cond_resched();
+	}
+	brelse(epos.bh);
+	return ret;
+}
+
 static int udf_fill_partdesc_info(struct super_block *sb,
 		struct partitionDesc *p, int p_index)
 {
@@ -1166,6 +1233,16 @@ static int udf_fill_partdesc_info(struct super_block *sb,
 				  p_index);
 			return PTR_ERR(inode);
 		}
+		err = udf_check_unalloc_table(sb, inode, map->s_partition_len);
+		if (err) {
+			iput(inode);
+			if (err == -EINTR)
+				return err;
+			if (!sb_rdonly(sb))
+				return -EACCES;
+			UDF_SET_FLAG(sb, UDF_FLAG_RW_INCOMPAT);
+			return 0;
+		}
 		map->s_uspace.s_table = inode;
 		map->s_partition_flags |= UDF_PART_FLAG_UNALLOC_TABLE;
 		udf_debug("unallocSpaceTable (part %d) @ %llu\n",
@@ -2233,8 +2310,9 @@ static int udf_fill_super(struct super_block *sb, struct fs_context *fc)
 				/*
 				 * EACCES is special - we want to propagate to
 				 * upper layers that we cannot handle RW mount.
+				 * EINTR means that a fatal signal is pending.
 				 */
-				if (ret == -EACCES)
+				if (ret == -EACCES || ret == -EINTR)
 					break;
 			} else
 				break;
-- 
2.55.0


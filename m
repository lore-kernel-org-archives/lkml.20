Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428C63F39E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533972; cv=none; b=TS8k3pfvxg6BZoxyjp55P0kLKR/aa8B58RWOOBziTQ9a+mT9/bGj7Fd6ETTY2n7RachWvB7fF5WRzbgC3mkFjP0OM7VxlC+ASwXrPme7+7XI8Jyri0veJITZl6Qjjy4EBj3rpkf1+fM01s+3y/Vyr5Ylub7hNBcCW6F4Sm3+5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533972; c=relaxed/simple;
	bh=5+1ZIpv6L6JHTVkiqfHpSF38h/44flaH63VEroC/WlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nwlaV/UH7uDxoq7wuifoPn/jQ2dBio5bfk+qZWlVTpCtWtGXc8x7g9EIV413ICOfULZFRf5jmch6my0bSvZ2cFb9Vky2Epsl97oDZp7waVwPQcO6g8hV7Dvf4FOF58Vm2XSwUS0TyoljJxDHJ8VMp4fwNuu3DhADtLjOF8CsBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz4fIdGS; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz4fIdGS"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f3ff92cf4aso1267195a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533970; x=1789138770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uknERYDMxgUO8g616vV1jOSNsSH1WjlXdGQkk1pq6JA=;
        b=Dz4fIdGSii24EnP6SfLzeAUPLKREPD68fVScA0khz9og9slxaJ83y0y+OB28WerNHr
         rz9FdZyJIUUaKfNzYuXX3QzrBk4NHntSEPkEVQRMmoT69gho854ElqkAs1EsOZ70Annt
         lHjLYPWcX2xAUINDMV+NdhjddGq5/XvmjnmzN00ElBjNeDEhxtB4VsZPgLJZUC15cpq9
         Gfg+jPqlp3+CoJ2svHx+B7iXtPdNWP2JNpMF/X5yHg82CBqGPPgaYcxtIsntwRD5Damv
         BSqfpgThv7ElvQON1a3fWbKf/9S83ERZK4Dd4YeHvzpzzUXMnRzXHPxmne4pH6o6PPF+
         Yc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533970; x=1789138770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uknERYDMxgUO8g616vV1jOSNsSH1WjlXdGQkk1pq6JA=;
        b=D7InfnoKJIMEZOHuP247bEvTkcYpuEOwPW0Sfa4RaNjxqg3/pacLC1OLQqLK6Cde0J
         Ft3AwzdKed5a0shFF1f6t9dP9pNSijfu72mKhujBsgTCFBMLbD4mpVR67EsqMYVKIEqh
         rdqmodyTsRgzQq+7nQVjlmFimLOriYXc3ciDSyfsx1JDnBYJbPrMbcVy8nq3By9nr1CI
         EuAvskoQHMKeZSkyHz/fOvfxmj+0oZb1pT9AChTfzugMDQVd0WomXxmHOspk0xCuZ3OO
         2rabzbjUxDVsdXzfzfo+TjtqO4d8+x9Xn4nmAGhfvepZB/Rhdtk1k28ur5mXUF4A4M+O
         PcQw==
X-Gm-Message-State: AFuF++mBkNcnE+gRLnZizSs2NJx6xRYWR53jFmU+tUrpVGA5VLXCN9wn
	eO8rPdfN7BfZu2KCWQwu+bOlCrHcC+5wrW4enuze5agYOa5j9lELo5yTr6dKsezS
X-Gm-Gg: AYBFou24qKAwCpa1Nc3Nccp36hPDkS/o5gkdfpgxvlH50V4jS+zCRxgIYjNez5latZx
	yoOfOSWHj+jkdIGDdsFy1HrTng10NtCtq1ggfZ40dbztilGxNj1FbUSLcspp+s6JBTeeWPZT0vd
	D8ZjdVc/hnZaQ6Wo12v4wCGbxGlMVnlkYmdKXXRYQDQakJOevFHMvuDipzKc3MSoUkd6Rjkq0iL
	3XEl9nD09I3qtKUO/ugRfPx/7Nv7aH09Dl7DH1f8r1uWxIIHGXUqGcvyApp+jf7CPp/hngz0w1n
	r0AmCmpUBHx/m4SJGNKemGzWTx7QjbkbFIH7IRqi4NYekazvv/bzcysaSaLrdAHcp8xg7lVX7bi
	bkb4PWcU8gw0/53xSHXwG1bcP3BZd13AEoD/oVDnc+LStB9pqsRnWNcfR9nxl3TYidG3QupYktx
	Tgcy1Sk3QVTRG4vEVM2aA1Jszvvnd6vrTYM6uB6eGj+Hp+4RSFcceLIEX1SvqkBPQwX1g7lP/YD
	mcbIRsBZYwZbKPA40JV0+q7j3TO5gIHA3mscdSWu8FDwoBk9y8pH3GjhyNV/EBZnjqAPvrZG/2K
	xw7EpIpckuE=
X-Received: by 2002:a05:6830:828c:b0:7f4:ea33:8f56 with SMTP id 46e09a7af769-7fa1e8eafb8mr6618239a34.6.1788533969600;
        Fri, 04 Sep 2026 07:59:29 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:3bd3:26b1:e8bb:156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f53sm2999625a34.6.2026.09.04.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:59:28 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: fix livelock in f2fs_sync_inode_meta()
Date: Fri,  4 Sep 2026 07:59:23 -0700
Message-ID: <20260904145923.1936598-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

During checkpoint, f2fs_sync_inode_meta() iterates over dirty inodes in
the DIRTY_META list. If igrab() fails on an inode (e.g. because it is in
the freeing state), the loop continues without moving the current inode to
the tail of the list. As a result, subsequent iterations pick the same
inode repeatedly, preventing other ready dirty inodes in the list from
making forward progress and leading to a livelock.

Fix this by moving the current inode to the tail of the list
(list_move_tail(&fi->gdirty_list, head)) before attempting igrab().

Additionally, if igrab() fails, the freeing inode may be waiting for its
pending writeback data pages to complete during eviction.
Submit any pending merged data writes and yield the
CPU with cond_resched() to allow the eviction to make progress.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/checkpoint.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index ef22692cef0a..5597033533b0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1460,6 +1460,7 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 		}
 		fi = list_first_entry(head, struct f2fs_inode_info,
 							gdirty_list);
+		list_move_tail(&fi->gdirty_list, head);
 		inode = igrab(&fi->vfs_inode);
 		spin_unlock(&sbi->inode_lock[DIRTY_META]);
 		if (inode) {
@@ -1469,6 +1470,13 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 			if (is_inode_flag_set(inode, FI_DIRTY_INODE))
 				f2fs_update_inode_page(inode);
 			iput(inode);
+		} else {
+			/*
+			 * We should submit bio, since it exists several
+			 * writebacking pages in the freeing inode.
+			 */
+			f2fs_submit_merged_write(sbi, DATA);
+			cond_resched();
 		}
 	}
 	return 0;
-- 
2.55.0.979.g7e5102b832-goog


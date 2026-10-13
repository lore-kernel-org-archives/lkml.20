Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4A44E66A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857389; cv=none; b=WML5lAwXQbUDISmx76Y//AxTvlynnICFqR98pALyfIVe5DpJC53nWgnPhEkeGznR/E9LNJbMmZFnwcr/N6DOd4OzLookm0N66SCXPoyqXlcq20LV5hEYzPjPMCmaYxoHvihcWMl51cALYnXurxXS2GQv7DbJ+FEY9g4vpJlYDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857389; c=relaxed/simple;
	bh=///uuY9jbj++gbJGzjzpOoqz67KdoOg1gGFB1Qb8Yi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mj69I0pQzf9RXUdJcgvl8p9I1oIBcb8jQToyYsb/klwuDJaKLwHLVdjSuDqR2w3nMhHZOymWB0T0TyuqJmPUIQcBNrR77NiflBBfWYKwwcyja/LPj+QlD8laBIhd4GpYsJk8Y86TRyutxYtG+UOCXrp+xyAI9GX+9wlz/gPOG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0kBjkcW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0kBjkcW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8455755f3so11960665ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791857388; x=1792462188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yfQb/NIWEqP4dfQyyW1F46esS1vblLkgAQScX3XltE=;
        b=D0kBjkcWRNEdwYrDZKC1BwlcbmmPHgDOBGMaT2Kg/idr2/p8rETcHROhvFGe5rbEAQ
         wyv4MrIQBseEFza97Y9LamMWy9BhtLUTNNOaZwUSbiHv1t1V+/ZkZUE+qmEZUh1U39LU
         7Sn+DqK7Rxio454w4JJKl8b+A53Hkg01MQjdftcTDH4bfxzik3yDcyjH43VAqpKGe62R
         wb1fbwPOy8JnrAC/b+2/GVW4NY6qUl5LHHXX6+9lH3Uy+6JpdfgwGEQPM8gAsuuL/OFV
         7xQPrwav0BIp2RrKRuOyMZB5eUhz22cpsRJWuNbJIbRa5pdp7ISg7Ghj/FWumgczb5SE
         L62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791857388; x=1792462188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yfQb/NIWEqP4dfQyyW1F46esS1vblLkgAQScX3XltE=;
        b=ZAwhNL5dcCt/x/Ji0tA1c1JC65Hb+ziYx4csr5IW2sEydq8A0CsqzpFUl5EXkg/e1W
         SvaEyFXZnHGUhMoaz03ZqSvqUQMbko0iyCb5/jVuFdmbjrnKDjIDcgaVCcj++1UaAcJr
         AZzgmEgC9Olp9+DGnp2a8vCpihR2bHrFah7TYHZ5DBUjRJnvHpT3CylsBFNpkZ6H6rt0
         lBMgpaSxWkUi2IQ5+Jcz/XNJXdu02DfCBmcENsA/SztnEDNokeFQLOUScOMmhSAWdI1e
         77yoWKV47s+RTHy/IIfOLUwKHC5rIxvxnhTKXoz/R14Dojb/AeEiHMyKK16333AZFjQM
         ftSQ==
X-Gm-Message-State: AFq9FYKNmO18d6hQkypfIgTMTX32Aj74jD1Mo3b6nHFA6J7Be1XrsXvt
	+GkpcALyj4VeKFDwOv4yd8zt+5w7HvTTaJRuIFdjSwE039q3x+DxfxJeCezDSQ==
X-Gm-Gg: AYBFou3B0jtWd/Pe5HxthBo3+lEw2mdRkFbELdi7162GHZwGEjspQXGF27/wx7+BLnU
	3EKIx5rEAkuszYESO6TKzw0TYybuOJw1U6FQEkkNTelRRwLvyEVocTpLt/ktaWqxHDzElQVk0Or
	do5hBr7QHFIpFJYxgsTHPXMykkHmwscfMWdEdvFlqEe2AfSbf6hTqpcyWkfkj60sAVCijak1QQ8
	Qkp6AiPsjkwDSbEXBIKr0TlvKZG5vAV7+MYwjWthYB3+wAyqtMBZzzzupPOIsyGUt3kNLS4lA+z
	t/6iepAa84PTasUTgZd2k6HDLYDesnFpq4yHCVY2N7j21uYKyJsDZ/qahxFWyTEBeHGYa8lNjc/
	MC88htv+IQHApHJ/m1CXoRu5ZF8bmXMOhuX+UrhwdJ2bcX95oqfYdV1FHCvzGB4EkWvgkn7CJwt
	ONPo7sFr5Ck8983DIIH/OJrHYYUz0q2McPuxHUB4DMNTjFWST3NfEL9VeNJFvZGXQNsTrJGO+2U
	JP+Yc1BJd8PAs7Ukz69a9JAhB0JFrela9EziHVnNf/ypqs9mKsxOlkU2bDLjRKQ9/cXj0dD5ul7
	I0lkSdR/KA9prwY=
X-Received: by 2002:a17:903:2a87:b0:2dd:c100:b2c5 with SMTP id d9443c01a7336-2e842ce4e2fmr99096335ad.48.1791857387543;
        Mon, 12 Oct 2026 19:09:47 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e90977deafsm4319505ad.68.2026.10.12.19.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:09:46 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: release a removed xattr node in roll-forward recovery
Date: Tue, 13 Oct 2026 02:09:41 +0000
Message-ID: <20261013020941.4025355-1-daeho43@gmail.com>
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
release the old xattr node in the same way as f2fs_recover_xattr_data().

Fixes: 28cdce0459cc ("f2fs: recover inline xattr data in roll-forward process")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/node.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 55008f18afd..590fdedf9c2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2831,6 +2831,29 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct f2fs_cached_block *ent
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
+		f2fs_invalidate_blocks(sbi, ni.blk_addr, 1);
+		dec_valid_node_count(sbi, inode, false);
+		set_node_addr(sbi, &ni, NULL_ADDR, false);
+		f2fs_i_xnid_write(inode, 0);
+	}
+
 	f2fs_update_inode(inode, ientry);
 	f2fs_put_cache(ientry, true);
 	return 0;
-- 
2.56.0.385.gd3acb90ef8-goog


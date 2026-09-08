Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA1F52ED5E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868461; cv=none; b=Nej82s/fm/x8528NB0lerYHb4n+jq2cYO92teVpHsyA1eOHz2dOKiRO4t7VTJnlm6QDLDTuN2oc+3E/jXpugZspYeA8/6Yzh2L1EdnFyvasiZJmBGoVVzG3ZuKT27CrEE2bRs+2lA4wQp8VuKOrH4WGh7LEGhu0osv/MmZ5X2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868461; c=relaxed/simple;
	bh=lfEfgWaIXkWQzXO3mgmKwuNG0GZXb8kDAWn8OJKZ6EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+dsbraZBZ5ZoI7q5VYqWo54lS4HsWlDD7zwLj+hLx/WM1JQhsScPfNERMwBq2yUl5vquTeHuu9M9s/AkFR0c9rJGCyLQFGGFzkd0OsQFqz0e40f5nrEgBPxajRumnueJJWs4pHaZjmFfqFaTOvVzXFM6hljS+0muLjR2zpcesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2CnzLXZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2CnzLXZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc149372c14so2186421a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868455; x=1789473255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZOE11OpCwNaV09UAPonV57TojdiUArUTJ8kxHL6A1s=;
        b=g2CnzLXZNB39NdVSDMwg/hcF7x58SlWaI+pC6c0RYgco6KtdoI48olUiaGQrHv7twK
         swprr+Qf9rm5bGKSM76MopstRGzQRy5Yyf2IJpe6RV6ahOpEyHCpyU6Shozou2Qu3dAX
         wUEjkaOg21/D4Uphz3y0JevokVae9wdCe9yVXhtQvNfrxlAqSRozSZe5Ih57vLTSNh5i
         onkh8CQMDv6ykPja+tJ+kRsG7l+7BV8Gf0Cq4gDutE1rBI3Iu0heVRXaBGyPr+I/Ajyl
         uOzEyIAbcpq0OrBwEsUXeVZ6Uz9y0/S1rb1VGPeHPfQpR8LWMp76mperDofxxo3YAx6i
         zceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868455; x=1789473255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZOE11OpCwNaV09UAPonV57TojdiUArUTJ8kxHL6A1s=;
        b=oksckj3wpGV2gxdimmZbd4opsNj3WwuXlvf3rZY3lB9mo1CsZdCBpU4vyVmmqEWwni
         0C84vrhPgPEwpwqAad+0WJ1WNpmEu7hWP9zHmzVTymBCTFXbQHlFFGDIKRbg0JEpArzm
         xG7JL8ilixmI3ZE+N3XuVofcYhiSq4pupwuJe+JXA2CMZA6boCmAzUxxfKKaZYsvNZlL
         eibLjfTf+W8fpQOYO2UKnvAFZVGnm6gtW1/e0cQR5Z8mBHfE2Eiep/Vrht0GkMMd8Mag
         Dretb8z+MMrq//O82GRkswxKvwnYEQl+7XRS7tBgipSb4/sf90w8GmaOd1KJ2YYjp+R2
         DD7A==
X-Forwarded-Encrypted: i=1; AKwUvBwTVRTGxInuEBdMps5EbdKOtdu9IdDhUiis9NdkWahUeJOubbVaH2B79kyfY+DsbIw5Yz+JPhYErmN4bhs=@vger.kernel.org
X-Gm-Message-State: AFuF++nJGj2o4P40WtAnyF7X6xy0XivXubtQNT1ro+Z2Vd83wLtLbWWo
	7tR3sRtHe3jeUM9DCmikhZ5d/qrBtp7CWIakdUUgsDaU2Z7M+xEEgWiO
X-Gm-Gg: AYBFou0qh6wqNV0U+uvpwjaG929XyLkYxrzUqTpNTq8b/3EKf5AzuiiTh9E5yXG6/V3
	FXJ2aW2QG8KwKCMl9f2LaNGEHzKDve4+hJmgsriUkE2ASJcxzcmXM6p5oU28gTqlab2vxKWh56J
	VuVydv4jOErCzZY2nu4DSMsA2jqQt7RkDmG9/csjK06l3SEY+aYdGQJdj+FLsxIqnY2+Z1UiE5B
	Xi9KnbA7GJWgN0oQ66LUOkkmepzXNCkovQ2IK1bf/n9YOu6D/J8RlnFL9RwFkm7G6yYckhmuNtV
	Z1mwJOlwSbEPkKDCWXghyQiIzCvLiGL5vt4ha5vDaCjcKObDlH6ClEquC+UQfuCuueK5wlt/wI2
	TpNOv4WnR9bMc7JwmPZVKWC74xoy0VgzeTb6xQ60xF01QTZKHZIWByCZCACaX8dRuh+EWbi1Rn5
	bruM9QqWF0slGEt/Nx8ahcfKYVfg/i7IIhTGtkx5l7oGAq3BAz7nu9Y3KS+TyTQkKuOzFJCXn+8
	BUqCRMj
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr44564090a91.24.1788868455113;
        Tue, 08 Sep 2026 04:54:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:702d:8dd0:cd86:11f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm26397740a91.9.2026.09.08.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:54:14 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: Re: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Tue,  8 Sep 2026 18:54:09 +0700
Message-ID: <20260908115409.9818-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1b3ba7f7afc3509720cad69ba8c7c17a9276ecd1.camel@dubeyko.com>
References: <1b3ba7f7afc3509720cad69ba8c7c17a9276ecd1.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

> Could you share the dump/content of the Extents Overflow file's fork?

Decoded the volume header from the syzbot image. The Extents Overflow
fork (offset 192 in the header):

  logicalSize=32768 clumpSize=32768 totalBlocks=32
  extents[0]=(start=3,   count=32)
  extents[1]=(start=0,   count=0)
  extents[2]=(start=0,   count=0)
  extents[3]=(start=0,   count=134217728)   <- garbage
  extents[4]=(start=0,   count=0)
  extents[5]=(start=0,   count=0)
  extents[6]=(start=0,   count=11796736)    <- garbage
  extents[7]=(start=0,   count=0)

Correction to my last mail: it's not totalBlocks exceeding the fork's
extents, it's the reverse and messier. hfsplus_inode_read_fork() sums
all 8 extents' block_count into hip->first_blocks with no validation
(inode.c:569). Slots 3 and 6 have start_block=0 (i.e. "unused") but
garbage non-zero block_count, so first_blocks comes out to 146014496
against a real totalBlocks (hip->alloc_blocks) of 32. Either direction
of that mismatch takes hfsplus_file_extend() down the same
hfsplus_ext_read_extent() path, since the code only tests
alloc_blocks == first_blocks.

> Could we detect the corruption of the fork during the mount phase?
> If we can then we need to mount in Read-Only mode the corrupted
> volume.

Yes. Proposed v2, forcing read-only instead of touching extents.c:

--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -293,6 +293,14 @@ struct hfs_btree *hfs_btree_open(struct super_block *sb, u32 id)
 		goto free_inode;
 	}

+	/* Per TN1150, the extents file can't have overflow extents of its own. */
+	if (id == HFSPLUS_EXT_CNID &&
+	    HFSPLUS_I(tree->inode)->first_blocks !=
+	    HFSPLUS_I(tree->inode)->alloc_blocks) {
+		pr_warn("extents overflow file has overflow extents of its own, forcing read-only.\n");
+		sb->s_flags |= SB_RDONLY;
+	}
+
 	mapping = tree->inode->i_mapping;
 	page = read_mapping_page(mapping, 0, NULL);
 	if (IS_ERR(page))

One catch: the reproducer mounts MS_RDONLY, then remounts rw via a
bare MS_REMOUNT|MS_MOVE. hfsplus_reconfigure() only re-checks
VOL_UNMNT/SOFTLOCK/JOURNALED before allowing that, and this image sets
VOL_UNMNT, so a read-only-only fix in hfs_btree_open() gets undone by
that remount. Same check needs to go in hfsplus_reconfigure() too:

--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -400,6 +400,12 @@ static int hfsplus_reconfigure(struct fs_context *fc)
 			pr_warn("filesystem is marked journaled, leaving read-only.\n");
 			sb->s_flags |= SB_RDONLY;
 			fc->sb_flags |= SB_RDONLY;
+		} else if (HFSPLUS_I(sbi->ext_tree->inode)->first_blocks !=
+				HFSPLUS_I(sbi->ext_tree->inode)->alloc_blocks) {
+			/* Per TN1150, the extents file can't have overflow extents of its own. */
+			pr_warn("extents overflow file has overflow extents of its own, leaving read-only.\n");
+			sb->s_flags |= SB_RDONLY;
+			fc->sb_flags |= SB_RDONLY;
 		}
 	}
 	return 0;

Both hunks build cleanly here. Want me to send this as v2 replacing
the extents.c hunk, or keep the extents.c guard too as a second line
of defense (it's independent of mount-time state and free)?

Thanks,
Thang

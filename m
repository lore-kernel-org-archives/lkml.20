Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C1345751
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658056; cv=none; b=QJ8GGUyL/Q5GRuzzEpmsQ6+M627w/Kv9yie7GxXJn1wJj7Zl7NBa6coywTufpkKZS62bLAF5fmKmGA4x2Y4m5N7TT2KwyDT0qLW4TFTOh2lYe323majMHqosbkPEb2vPPLlCDBaLH7GKNuG+CwFGfkWkU1xIEiN4rwlBS3GFZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658056; c=relaxed/simple;
	bh=t6h+v1TMwHLddYzQCfbsmVI6zKcZ51BmkGJamlXAlBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WzyowWCBdm4dT1b/W9osZpiKzZOHk+sRtBjYdUX8jQVEUk5hYEkwq+36o/Ul+0qIzVbcVgQfyNcLJ8TzA5z1Z+D1epM0kfXSDz9iQTFidOhEqI0Ah0Jm6rBZh/fFmyxDGeo65UJUG75CIt8nGlCOUFlMBzXSneNcCbCzmTHttCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOYkIWu+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOYkIWu+"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso709952a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658040; x=1790262840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kcXKRIDcw5mAZxkYucxI77vzHbmXLBieOuahAT0hPgU=;
        b=AOYkIWu+u46JFv4WEc53lIosaWtWG66TXNTeq+QU96hUlOwR2iSB7CyDKHMJtdgD4e
         hYOuT+Cq3/pLPxWhbXS+lPqdjI+q3s/XesFeTM2w1DfOvi9jsD7g/IF11zJb8x/75sqJ
         UrpcUtb6L7eQuhqpQGAdbodNZzrXYOhCdiBldH3zfRctwziuTE5VTHE1OUqU2XCirnrx
         76YuPnfAdBqvHjjlzyP3lJKQbC8TpIVsTMMIWHw9W/TT2vV5+s5sX2nx8F3qLu0T7psl
         zD9d4BQ10X7hnm59XVSK9V40l1VKJp1/7v6LBCk28YK/xGOHYC/XdNiOWlGVBcnHX++h
         48yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658040; x=1790262840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcXKRIDcw5mAZxkYucxI77vzHbmXLBieOuahAT0hPgU=;
        b=TA0+6kjgyu95g7iOKuHKhGp63tMaJAai1yAPow/VaGp/Qpw6u0FVWQcJpwFBysNOWu
         oqB/9k5bpoUGmTxmy6MWw1P5sKRv44ei6YnoXcAsEeXcDbvQHN+PRpcFu/X9FBt/WJzU
         Iipc2TJUxlScEWTbU+3fU4AnCf7sjlklkcbsBLWzlFGExPa2hrvVifXF2nWaranIK9ux
         M0b6gOQzFu4b9x6hm+6v3MrOOli2xnzQgAxDBDOlyD6oMBYoB1MccNW7h0TJwqFz6ccO
         +Nf0TZFGfbbRxkDfZX048Qm0ONbpOQGv4+oOZCN0uahVJ37UOlUkPNTokGzbMjJFDLWc
         yn0g==
X-Forwarded-Encrypted: i=1; AKwUvBxVMGGaQhF7vWattho+4s2oxSSXgb64fYa/XSRPSvmpQdum+CY2KHprzFsJ7b2wnUsvj2yTt4IqZGMgaTU=@vger.kernel.org
X-Gm-Message-State: AFuF++nBt6Qe6gbXdFvFICndDTW1+Lxix0ZGt19AWNBUXl9lv3fhaS+q
	9c0T5FuRzPENkjQy6CyJWcOY+WwTd/gDYkrje5HOD/Xa7qxyVAl8FXmJQNFUu0CZ
X-Gm-Gg: AYBFou1TXPiStnL5HxdmqhMAB+pgAhc5q8eR7d1RKYRXzaCRN3cfnbRrwOIsR/kTlcs
	cO9Hy3iuFmaNzAnAOSe3phi42qofasdy1BVOrAVahwYBG5ITpUW4npEawsI6zyvvKr1+rXUGuAS
	950ITGUhpp6+lwhE4YpzSaovNhd7k+TsihhDJRPOt1H1pgTBY95WYlDmPQuAkrxSX3Auijpsn9E
	+qGKqc3Af8Qzt4VfRXQQS/AGk+FakmOGwc71cLpcWLV/J1I+8FekMVxob7UIGnLy+gLQuaPnFfF
	1i17epEfyKLSrvpEiXEejzkIYjUZCs1D8wq8JwlWd+WtmVhuiIHZ0THD36fbIKMRLimXSIEe9hr
	XdZ8pT7izUBdfVhw7GHvfwcTig2r5IS28W5nyJobKvSQl6psw1dx7atHgczw+bI1jpEnNRotI/Y
	3oDw5pCo5cIDwYwgTmv2Yg8zvj6UcewPVxeJky8bdGc+4fq/1yT6Im8uKMZNFZUP39BEAcUePCl
	jxoBqyFZ6c/NJ9aZsSTVO1r
X-Received: by 2002:a17:90b:2ec7:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e1e4907f3mr23769529a91.14.1789658039358;
        Thu, 17 Sep 2026 08:13:59 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c2132dfsm3834454a91.3.2026.09.17.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:58 -0700 (PDT)
From: MarkLee131 <kaixuanli0131@gmail.com>
X-Google-Original-From: MarkLee131 <kaixuan.li@ntu.edu.sg>
To: kaixuanli0131@gmail.com,
	linux-ext4@vger.kernel.org
Cc: "Theodore Ts'o" <tytso@mit.edu>,
	linux-kernel@vger.kernel.org
Subject: [BUG] ext4: stack OOB in set_flexbg_block_bitmap() via EXT4_IOC_GROUP_ADD
Date: Thu, 17 Sep 2026 23:13:40 +0800
Message-Id: <20260917151340.412498-1-kaixuan.li@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaixuan Li <kaixuanli0131@gmail.com>

EXT4_IOC_GROUP_ADD can make set_flexbg_block_bitmap() index two one-element
arrays at offset 1. KASAN reports a stack out-of-bounds read on v6.12.9 and
v7.2.4; a reproducer is below.

EXT4_IOC_GROUP_ADD requires CAP_SYS_RESOURCE, so this goes to the list
rather than security@kernel.org. The ioctl returns 0 whether or not the
read happens.

ext4_group_add() builds a one-element flex group descriptor whose arrays
are locals in its own frame:

	__u16 bg_flags = 0;
	...
	flex_gd.count = 1;
	flex_gd.groups = input;          /* the ioctl's single struct */
	flex_gd.bg_flags = &bg_flags;    /* one __u16 */
	err = ext4_flex_group_add(sb, inode, &flex_gd);

set_flexbg_block_bitmap() derives its index from a block number, not from
flex_gd->count (fs/ext4/resize.c):

	group  = ext4_get_group_number(sb, EXT4_C2B(sbi, first_cluster));
	start  = EXT4_B2C(sbi, ext4_group_first_block_no(sb, group));
	group -= flex_gd->groups[0].group;
	...
	if (flex_gd->bg_flags[group] & EXT4_BG_BLOCK_UNINIT) {
		BUG_ON(flex_gd->count > 1);
		continue;
	}
	...
	bh = sb_getblk(sb, flex_gd->groups[group].block_bitmap);

The BUG_ON tests flex_gd->count, not group, so it does not fire.

verify_group_input() bounds the three supplied blocks against
[start, start + input->blocks_count), but nothing bounds blocks_count
against EXT4_BLOCKS_PER_GROUP(sb). A blocks_count spanning more than one
group lets inode_table sit in group N+1, so group above becomes 1 while
both arrays hold one element.

The second access feeds a journalled write: the out-of-bounds 8 bytes
become the block number passed to sb_getblk(),
ext4_journal_get_write_access(), mb_set_bits() and
ext4_handle_dirty_metadata().

ext4_resize_fs() is not affected. ext4_setup_next_flex_gd() sets
blocks_count = EXT4_BLOCKS_PER_GROUP(sb) and ext4_alloc_group_tables()
keeps the tables inside the flex group, so group stays below flex_gd->count
there. Only EXT4_IOC_GROUP_ADD takes these numbers from userspace.

Reproducer
==========

blocks_count must be first_data_block + N * blocks_per_group, or
verify_group_input() stops at "Last group not full" first:

	truncate -s 64M img
	mke2fs -q -F -t ext4 -b 1024 -g 1024 -O ^has_journal img 4097
	mount -o loop img /mnt

Group 4 is the next group and carries no superblock backup, so overhead is
0. inode_table is the first block of group 5, which makes the index 1:

	struct ext4_new_group_input in = {
		.group		 = 4,
		.block_bitmap	 = 4097,
		.inode_bitmap	 = 4098,
		.inode_table	 = 5121,
		.blocks_count	 = 1088,
		.reserved_blocks = 0,
	};
	ioctl(fd_on_mnt, EXT4_IOC_GROUP_ADD, &in);	/* returns 0 */

KASAN
=====

v7.2.4, x86_64 defconfig plus CONFIG_KASAN=y CONFIG_KASAN_STACK=y
CONFIG_KASAN_INLINE=y, under QEMU:

	BUG: KASAN: stack-out-of-bounds in set_flexbg_block_bitmap+0x531/0x6a0
	Read of size 2 at addr ffff8880072b7b2a by task init/1
	CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 7.2.4 #1 PREEMPT(lazy)
	Call Trace:
	 <TASK>
	 set_flexbg_block_bitmap+0x531/0x6a0
	 ext4_flex_group_add+0x3885/0x5730
	 ext4_group_add+0xc13/0x14b0
	 ext4_ioctl_group_add+0x1a4/0x4a0

	BUG: KASAN: stack-out-of-bounds in set_flexbg_block_bitmap+0x646/0x6a0
	Read of size 8 at addr ffff8880072b7da8 by task init/1

Size 2 is bg_flags, size 8 is groups[1].block_bitmap. v6.12.9 gives the
same pair. set_flexbg_block_bitmap() and verify_group_input() are unchanged
in current master.

set_flexbg_block_bitmap() has computed the index this way since
33afdcc5402d ("ext4: add a function which sets up group blocks of a flex
bg"), v3.3.

Fix
===

Either bounds check works, and I do not know which you prefer:

  - reject blocks_count > EXT4_BLOCKS_PER_GROUP(sb) in
    verify_group_input(), which is what the single-group path means; or

  - bound group against flex_gd->count in set_flexbg_block_bitmap(), which
    also covers a future multi-group caller.

I can send a patch for either, and test one.

Kaixuan

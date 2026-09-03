Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC94AC171
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440885; cv=none; b=PWOllvNmDHFiwGLmd01brZF/eh+mlD5fi0rwXoTNMwcTmSyOwnXfsyFjFG4nfBfwBBKb6D4dhOMNnZmMh6nI71U3z24Y9gyH07SoU/Ftk7EaRDtE5ZJoJXqdyBIy3rJ9/gXEq3ozaVO4GYlxpDI4sP+qE6q1b7WDf1JPk8zPVsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440885; c=relaxed/simple;
	bh=1v7KX+C+tu2AqnQKZ695+6Gpsh2RG2eu61erNbbBFhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u/oZm2ViA0dDXEZv/ig+ckrfBy7b8fJAo03zbol/28ysQdyxT0tBrE2DAo+5gAeYk6i66a8Yv/8SXwCRXyxnH0rxUltKsKDn4f+k/55Gob4Y8Bvx82ZfzR3AROzWldskPenFuBEnrgxBRewKQ/0JsOdUEVQdRxqKfk8Kd55uFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=b8wOpEAh; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=BpIcMdXj; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="b8wOpEAh";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="BpIcMdXj"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id F035126F76A0;
	Thu,  3 Sep 2026 22:07:47 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1788440868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip+eNZuGNEyfB9bWU2A3VV4XQHzqkbqxrO5K29H1sy8=;
	b=b8wOpEAhTz52TKCmKQTzDStvcMK9Ee2H1wtI62QM+vbVWb8NrlmAW3khNv90unDRScLgU1
	HfkJGGjP3x4QsU0M5E0BTcYsf2Jvkq7cQbKQnXCs5T3VAb8ryz8uZDNQXkAhP79SLAevOV
	JsE9dS7x78lzYQ7/lCDDCxfq0y4+LjIGRsY3ZgUugyuCtnjR94ot1ZYb7qbVGVBVxPadz9
	eAGb9wc44i0C9OD4nn2k26S1Di9XO9pn4SACFUonol1NRuftffDCWrJKYVRCHFJuFmFpC7
	m1deh0/f4XEbt1rPz+dyPBRroaf8u6XR2XgTT7LmfKWFZ9vlg5aCmVFi3QcIcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1788440868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip+eNZuGNEyfB9bWU2A3VV4XQHzqkbqxrO5K29H1sy8=;
	b=BpIcMdXj9vfqK728bs0nDaAnVfE2vsM/qjrT40lmA3g5LIeRD1lMgwEdzSAtlOTppm4VwG
	glje+3Sqk68BqsBQ==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 6F69EE0050C;
	Thu, 03 Sep 2026 22:07:47 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 66A112200237; Thu, 03 Sep 2026 22:07:47 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hengyul@cs.unc.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] fat: calculate data area start without overflow
In-Reply-To: <20260902170115.4162222-1-hengyul@cs.unc.edu>
References: <20260902170115.4162222-1-hengyul@cs.unc.edu>
Date: Thu, 03 Sep 2026 22:07:47 +0900
Message-ID: <87o6eejxek.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

hengyul@cs.unc.edu writes:

> From: Hengyu Liang <hengyul@cs.unc.edu>
>
> On 32-bit architectures, sbi->fat_length, sbi->dir_start and
> sbi->data_start are unsigned long. The number of FATs is an 8-bit BPB
> field, while the FAT32 length is a 32-bit BPB field. Therefore, the
> calculation
>
>     sbi->fat_start + sbi->fats * sbi->fat_length
>
> can wrap before data_start is checked against total_sectors.
>
> For example, with fat_start=32, fats=2 and fat_length=0x80000001,
> the unwrapped data area start is 0x100000022 (4294967330), but the
> calculation wraps to 34 on i386. With total_sectors=36, the
> validation then incorrectly passes.
>
> The following script creates an image that demonstrates the problem:
>
>     python3 - <<'PY'
>     import struct
>
>     S = 512
>     b = bytearray(36 * S)
>
>     def p(off, fmt, value):
>         struct.pack_into(fmt, b, off, value)
>
>     # FAT32 BPB
>     b[0:3] = b'\xeb\x58\x90'
>     b[3:11] = b'MSWIN4.1'
>     p(11, '<H', 512)
>     b[13] = 1
>     p(14, '<H', 32)             # reserved sectors
>     b[16] = 2                   # number of FATs
>     p(17, '<H', 0)
>     p(19, '<H', 0)
>     b[21] = 0xf8
>     p(22, '<H', 0)
>     p(24, '<H', 1)
>     p(26, '<H', 1)
>     p(32, '<I', 36)             # total sectors
>     p(36, '<I', 0x80000001)     # FAT32 length
>     p(44, '<I', 2)              # root cluster
>     p(48, '<H', 1)              # FSINFO sector
>     b[64] = 0x80
>     b[66] = 0x29
>     p(67, '<I', 0x12345678)
>     b[71:82] = b'OVERFLOW   '
>     b[82:90] = b'FAT32   '
>     b[510:512] = b'\x55\xaa'
>
>     # FSINFO
>     p(S, '<I', 0x41615252)
>     p(S + 484, '<I', 0x61417272)
>     p(S + 488, '<I', 0xffffffff)
>     p(S + 492, '<I', 0xffffffff)
>
>     # Wrapped FAT starts at sector 32
>     fat = 32 * S
>     p(fat + 8, '<I', 0x0fffffff)   # FAT[2]
>     p(fat + 12, '<I', 0x0fffffff)  # FAT[3]
>
>     # Wrapped data_start == 34
>     root = 34 * S
>     b[root:root + 11] = b'ESCAPE  TXT'
>     b[root + 11] = 0x20
>     p(root + 26, '<H', 3)
>     p(root + 28, '<I', 4)
>     b[35 * S:35 * S + 4] = b'OOB!'
>
>     open('fat-overflow.img', 'wb').write(b)
>     PY
>
> Attach fat-overflow.img as /dev/sdb and run:
>
>     mount -t vfat -o ro /dev/sdb /mnt
>     cat /mnt/ESCAPE.TXT
>
> On an unpatched i386 kernel, the mount succeeds and reading the file
> returns:
>
>     OOB!
>
> On an x86-64 kernel and on a patched i386 kernel, mounting is rejected
> with:
>
>     mount: mounting /dev/sdb on /mnt failed: Invalid argument
>
> Calculate dir_start and data_start in u32 using
> check_mul_overflow() and check_add_overflow(). Since total_sectors is
> also a u32 value, any result that overflows u32 cannot describe a valid
> volume. Reject such layouts before storing the values in the existing
> unsigned long fields. The existing total_sectors check handles values
> that fit in u32 but still lie beyond the volume.
>
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>

Thank you. Looks good.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> ---
> Changes in v3:
> - Keep the multiplication check on one line for readability.
> - Report overflow before rejecting the volume.
>
>  fs/fat/inode.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/fs/fat/inode.c b/fs/fat/inode.c
> index f775a004cae1..0b0bbe777842 100644
> --- a/fs/fat/inode.c
> +++ b/fs/fat/inode.c
> @@ -20,6 +20,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/backing-dev.h>
>  #include <linux/unaligned.h>
> +#include <linux/overflow.h>
>  #include <linux/random.h>
>  #include <linux/iversion.h>
>  #include <linux/fs_struct.h>
> @@ -1577,6 +1578,7 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
>  	struct msdos_sb_info *sbi;
>  	u16 logical_sector_size;
>  	u32 total_sectors, total_clusters, fat_clusters, rootdir_sectors;
> +	u32 dir_start, data_start;
>  	long error;
>  	char buf[50];
>  	struct timespec64 ts;
> @@ -1752,7 +1754,6 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
>  	sbi->dir_per_block = sb->s_blocksize / sizeof(struct msdos_dir_entry);
>  	sbi->dir_per_block_bits = ffs(sbi->dir_per_block) - 1;
>  
> -	sbi->dir_start = sbi->fat_start + sbi->fats * sbi->fat_length;
>  	sbi->dir_entries = bpb.fat_dir_entries;
>  	if (sbi->dir_entries & (sbi->dir_per_block - 1)) {
>  		if (!silent)
> @@ -1763,20 +1764,30 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
>  
>  	rootdir_sectors = sbi->dir_entries
>  		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
> -	sbi->data_start = sbi->dir_start + rootdir_sectors;
> +	if (check_mul_overflow(sbi->fats, sbi->fat_length, &dir_start) ||
> +	    check_add_overflow(sbi->fat_start, dir_start, &dir_start) ||
> +	    check_add_overflow(dir_start, rootdir_sectors, &data_start)) {
> +		if (!silent)
> +			fat_msg(sb, KERN_ERR,
> +				"overflow of root dir or data layout");
> +		goto out_invalid;
> +	}
> +
>  	total_sectors = bpb.fat_sectors;
>  	if (total_sectors == 0)
>  		total_sectors = bpb.fat_total_sect;
>  
> -	if (total_sectors < sbi->data_start) {
> +	if (total_sectors < data_start) {
>  		if (!silent)
>  			fat_msg(sb, KERN_ERR,
> -				"data area starts beyond volume (%lu > %u)",
> -				sbi->data_start, total_sectors);
> +				"data area starts beyond volume (%u > %u)",
> +				data_start, total_sectors);
>  		goto out_invalid;
>  	}
>  
> -	total_clusters = (total_sectors - sbi->data_start) / sbi->sec_per_clus;
> +	sbi->dir_start = dir_start;
> +	sbi->data_start = data_start;
> +	total_clusters = (total_sectors - data_start) / sbi->sec_per_clus;
>  
>  	if (!is_fat32(sbi))
>  		sbi->fat_bits = (total_clusters > MAX_FAT12) ? 16 : 12;
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

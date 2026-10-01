Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595383D3CF5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883989; cv=none; b=F6g4VfbeZY5z5DqxX525URC1hA15rUaOwaNYs0nS4Bch2AAcLN/vkFWk+uedYl1zM3RCK4DFaIslE/gxbhVbbeG7EhmbMDvh4jjf6n2XJejWh0rbDmh7JxQaucRwJYAqeRTu93FC/IWOX/8IOI0ungs1q4th5yR6rGAgE30HjFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883989; c=relaxed/simple;
	bh=+olYPGjAlmK6NE+YFnm23dLf01KP75sfvHLhz2HLs4E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=gK7dJP+XDe7ZQXbVQmayCn/kSJggrST2ohQdjXXbiprnrfo5pxbRdr8xdnyvHmdpfmPkGIZh4Y71mgbeOrLI+2L1zXlSSITb4DWDd9NJliA5pLuu54jlOAQ5t2/wSW7QphrnuwVy+yBl3EisG+5+IrN0hE2hnOvDOJVNcoz6Dgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so8829823b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883985; x=1791488785;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=voQyzRpaPJ2BQI3mBiHxv4bnRfZWrvt0UJZNt3CowyA=;
        b=cmRnymnsoQtcPOP/EvSzpoegSV+mUQU/+FZZq8Mnlt2+TPxIon5zjeZMHaZfI2vkjL
         sH/P1J8iVK4OUHW9sJLWFwBpXCjttnvFewRJwaXNuFIahfFokhRQHN1+lHcGuuBgU5Bu
         GqqcqVFWcsWh1KwSwBuSJ0KuYgtxww7GTYIrN4m5X899+HCH8jPPId8T0CtV+WJTdF0x
         PYTvwns1IxOuQrCWS20d+7a6I5VhSdvOB/KA9n0dZilX00CJy4ooB5MVVPebQGGNhLDM
         QgyIw2H0etiChvm+1xQJNLT3q/Zr0Xp7+njHwC0aF9C8tDSNfo5HG0xQHiho5vY3SeXA
         gKXA==
X-Forwarded-Encrypted: i=1; AKwUvBwJD5Uk/ocNU+pi3o0FyREeon1BZVT9vCasGyaZnF3VF/f4gOp6ZAkZgRKzTJPnvuBaIWknpmtFLhl5mi0=@vger.kernel.org
X-Gm-Message-State: AFuF++lETboOVv6qTN2jbqC5YHxMpfToa4QW+Myf2gihYbgDs3t2jVuR
	JE9cvx6bu9YM3LiOx2ORpis4EGUqiDdq7AIakJFTe91zMlcq01Z6DKmuZ0TRl2a2TnqVuqLk0Mv
	1uNqwd3Hh35Ok8G6DeqItPxOg8r6lTVFAAHluZR3I4iOeu/ZGeYT/uoCS9dA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1997:b0:4c3:e608:ade6 with SMTP id
 5614622812f47-4f529a0c250mr213050b6e.18.1790883984992; Thu, 01 Oct 2026
 12:46:24 -0700 (PDT)
Date: Thu, 01 Oct 2026 12:46:24 -0700
In-Reply-To: <20261001194618.1254552-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abeb890.7503fbd6.2d3f6.0007.GAE@google.com>
Subject: Re: [PATCH] ext4: validate dirents before splitting a directory
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com
Cc: adrianox@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: upstream

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

> syzbot reported a slab-use-after-free write in do_split() while
> renaming an entry in a directory that is being converted into an
> indexed (htree) directory by make_indexed_dir():
>
>   BUG: KASAN: slab-use-after-free in dx_move_dirents [inline]
>   BUG: KASAN: slab-use-after-free in do_split+0x1241/0x1e90
>   Write of size 90458 at addr ffff88803b38ac6e by task syz.0.17/6003
>
> do_split() builds a map of the leaf's dirents and then moves a subset
> of them to a new block.  dx_move_dirents() trusts map[i].offs and uses
> the rec_len found there as the length of a memset().  With a corrupted
> or crafted directory block, a bogus map entry makes that rec_len
> garbage (here 90464), turning the memset() into an out-of-bounds write
> that can corrupt arbitrary memory.
>
> Validate each entry that is about to be moved with
> ext4_check_dir_entry() before using it, and bail out with
> -EFSCORRUPTED if the entry does not lie inside the block.  This is the
> same class of validation already used elsewhere in the directory code.
>
> This is a filesystem-corruption hardening issue; the crash needs a
> corrupt directory, which is why it is not reachable on a consistent
> filesystem.  The syzbot "introduced by" bisection pointed at an
> unrelated btrfs commit and can be ignored.
>
> Closes: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
> ---
>  fs/ext4/namei.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index a6386c1d237f..b2ec222b15e4 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1951,6 +1951,25 @@ static struct ext4_dir_entry_2 *do_split(handle_t *handle, struct inode *dir,
>  		goto journal_error;
>  	}
>  	map -= count;
> +	/*
> +	 * The map is built from the on-disk dirents, so its entries should
> +	 * always refer to valid dirents.  However, if the leaf block is
> +	 * corrupted (e.g. a crafted image), a bogus map entry can make
> +	 * dx_move_dirents() read a rec_len from an arbitrary location and use
> +	 * it as the length of a memset(), writing far out of bounds.  Validate
> +	 * every entry we are about to move before using it.
> +	 */
> +	for (i = 0; i < count; i++) {
> +		unsigned int off = map[i].offs << 2;
> +
> +		if (off > blocksize - sizeof(struct ext4_dir_entry_2) ||
> +		    ext4_check_dir_entry(dir, NULL,
> +					 (struct ext4_dir_entry_2 *)(data1 + off),
> +					 *bh, data1, blocksize, off)) {
> +			err = -EFSCORRUPTED;
> +			goto out;
> +		}
> +	}
>  	dx_sort_map(map, count);
>  	/* Ensure that neither split block is over half full */
>  	size = 0;
> -- 
> 2.51.0
>

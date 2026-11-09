Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193001;
	b=P1iRQ4JePwd1BVs3VMwe761mZcXagi5ORJcoJPPAuEpXGpT+SDYxjN9VqifuaR8IctAR
	 34KxvKgTPAi+JTMJH7dTSOdB2Vc3myYyre3Zu4ghqSj+Vc13pDULwUH+U8fdxP9hW/h5l
	 ohEb+Yy7mFLE/VJphlC6uKtyi9/FrACkiwdZVds2kGoGyykeJ+2EOsFXVhOxrES5/wVow
	 jHTqmZCVi/hfd4yqH67IXNaoHbMM4VK/SobsofgIg8maALmXU1+AOI1Q46A8heyy0zGqj
	 6KT+0GWFJShA4THXfKT/HcIn6fcaSq9ei6rYaLQx+NFcyjHDp9qIGVjitwLMMXP0PdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193001;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=l0N+1tV51NomvRw2YSGSJFWSnM5g2H6wDnWRUKkQHIM=;
	b=2HpLl5K6mbt8+kP/arOVJ6oKkoVr0Da2u+x7z8GE94Ebf7VG4brgA1HJ9+2OjXgzZB6X
	 I6ZHQgIzWScqqAZyb99xcxHuVahHuzr7ur9mTNQnsDjSn9LtoB2cGJpJvbdD6rlWVcW8h
	 0PMMlBxrFw6Xw3iXGbLI9GkDWznY/J6EE5kLwAyqI/f+eK1pOTp780302JABI6IKZRURM
	 keefhC/WrYM7r4BeJiz2P1/f3FhbyGYcg0JX9w5EYwvqX/oMXILJC1RyFh+9d9okrOWR7
	 gcN5kJRFpSv1qgnGvkyRZI5BHF2W7726bOvdFFloNWTfeZm2QwvIC5DDElVQCelAVew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYIhfkD9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CB606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYIhfkD9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319AD1F00906;
	Mon,  9 Nov 2026 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794193000;
	bh=l0N+1tV51NomvRw2YSGSJFWSnM5g2H6wDnWRUKkQHIM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=UYIhfkD9walzJNcw1CtF72FNggb/O18A9/J88GjCyydkiJwBXnkZHjFlrHati2lmc
	 3fLmd5hxkoBb9bDEr3tNX6/FYE2eQMWUOBpyqZ8VyuTk7cpoCaug1ZE2TofhBGInif
	 nFV6mxujD37LusJxKjNAdUAOl3lq47kV6r4QpH6m4MtKGIbU8TD08TwpwlOPWFMqDf
	 NSl+ia83MMEqMXdVgrxK0uoQHfyQtuEGrQxeH9ebIugn+v2bkXd7ujTp5/vXPJuAde
	 NRq0BsFBEEg+iIM6NX99O+XcB0JRWqBZL6f4nAZhekNFtMXATjUGkRg1CHkp0td4HZ
	 IAdZK6buYi46g==
Message-ID: <f53843e5-7dc5-49f2-b551-9ce5273b278d@kernel.org>
Date: Mon, 9 Nov 2026 10:56:37 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH 15/20] f2fs: support subpage blocks in atomic
 writes
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261102193952.3002018-1-daeho43@gmail.com>
 <20261102193952.3002018-16-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261102193952.3002018-16-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Writeback already writes dirty blocks to the COW inode per block. Make
> write_begin of atomic files reserve and read COW blocks per block as
> well, and remove the -EOPNOTSUPP checks. Skipping the read of the
> blocks that a write fully covers also applies to large folios when the
> block size equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/data.c | 24 ++++++++++++++++--------
>   fs/f2fs/file.c |  5 +----
>   2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a23fd4b01a4c..4e4d1b0d6004 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4624,7 +4624,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
>   		}
>   
>   		if (f2fs_has_subpage_blocks(sbi) &&
> -		    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
> +		    f2fs_compressed_file(inode)) {
>   			WARN_ON_ONCE(1);
>   			mapping_set_error(mapping, -EOPNOTSUPP);
>   			folio_clear_dirty_for_io(folio);
> @@ -5247,7 +5247,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>   	int err = 0;
>   
>   	if (f2fs_has_subpage_blocks(sbi) &&
> -	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
> +	    f2fs_compressed_file(inode))
>   		return -EOPNOTSUPP;
>   
>   	/*
> @@ -5359,13 +5359,16 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
>   	/* Inline data must have been converted before reaching here. */
>   	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>   
> -	start = folio->index + (ori_off >> PAGE_SHIFT);
> -	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
> +	start = f2fs_folio_lblk(sbi, folio) + (ori_off >> sbi->log_blocksize);

F2FS_BYTES_TO_BLK(sbi, ori_off)

> +	end = f2fs_folio_lblk(sbi, folio) +
> +		((ori_off + len - 1) >> sbi->log_blocksize);

F2FS_BYTES_TO_BLK(sbi, ori_off + len - 1)

Thanks,

>   
>   	for (index = start; index <= end; index++) {
> +		loff_t block_start = F2FS_BLK_TO_BYTES(sbi, index);
> +		loff_t block_end = block_start + F2FS_BLKSIZE(sbi);
>   		block_t blkaddr = NULL_ADDR;
>   		bool node_changed = false;
> -		size_t off = (index - folio->index) << PAGE_SHIFT;
> +		size_t off = f2fs_folio_byte_offset(sbi, folio, index);
>   
>   		err = prepare_atomic_write_begin(sbi, inode, index,
>   						&blkaddr, &node_changed,
> @@ -5373,12 +5376,17 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
>   		if (err)
>   			return err;
>   
> +		/* Skip read if the write covers the entire block. */
> +		if (pos <= block_start && pos + len >= block_end)
> +			goto balance;
> +
>   		if (f2fs_ffs_test_blk_uptodate(folio, index))
>   			goto balance;
>   
>   		if (blkaddr == NEW_ADDR) {
> -			folio_zero_segment(folio, off, off + PAGE_SIZE);
> -			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +			folio_zero_segment(folio, off, off + F2FS_BLKSIZE(sbi));
> +			f2fs_ffs_mark_subrange_uptodate(folio, off,
> +							F2FS_BLKSIZE(sbi));
>   			goto balance;
>   		}
>   
> @@ -5436,7 +5444,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   	}
>   
>   	if (f2fs_has_subpage_blocks(sbi) &&
> -	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
> +	    f2fs_compressed_file(inode)) {
>   		err = -EOPNOTSUPP;
>   		goto fail;
>   	}
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 1c440b5fa9bd..91f792cf879f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2299,7 +2299,7 @@ static long f2fs_fallocate(struct file *file, int mode,
>   	}
>   
>   	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> -		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> +		if (f2fs_compressed_file(inode)) {
>   			ret = -EOPNOTSUPP;
>   			goto out;
>   		}
> @@ -2553,9 +2553,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>   	loff_t isize;
>   	int ret;
>   
> -	if (f2fs_has_subpage_blocks(sbi))
> -		return -EOPNOTSUPP;
> -
>   	if (!(filp->f_mode & FMODE_WRITE))
>   		return -EBADF;
>   


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910237EFFF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223731; cv=none; b=MvhT8RpEZw9OsM5vtuC8vXmcVx9gJWCX+iLQKBgALjpO5c3X3N18nuwT6dHh2CIhEX2r9CoplPMX2MaWF+DI8FF6RkDDfWdn3eS+XhasgFYIgQUSAuWh4C7nVtCWOAa1KV64+vVItRJevTJQFZXuUNezsHBdSKmiVfkgix0jeTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223731; c=relaxed/simple;
	bh=BCp9j2AHKmsaEs5VbyA4xb0BhE7rEy15SugQKQk5MU8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pl2kBnpV8O67xMLqLgKa2y93o5zKhRw/i2RDZwZt8hJuBssxLwCfMyopATNM/+jqLGZJL1F5dNHtup9ZqHpQ2+FDfRW2OSmjYU0bWiLrQIYnfmpG1hFkMwpBZcYNK8Yeqgj+2WuoB6LI/Vdr5WXl+WtsQf5EIMLfRJp0jnQ4cWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUIIiXxj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUIIiXxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9C41F000E9;
	Tue,  1 Sep 2026 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788223729;
	bh=4GM7YLcTrZAhuHNncgplMw79c7B1b/yStv4vzrmeQFA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OUIIiXxjbvl5g33d+o3USzwKmcOTFhSB+GHaD5l4IAbNDVfRRUBB62ExE95xz6EVe
	 p6KdPH61W29LOMQLAJJTX/ZBAaz7UoNmSjB3mgEO7dQ2Xr+CoL9vt+5PuVFeaCVaON
	 cdrLbKu5xtNSuwh8ezuY+HoQxpStxxGttJyg4yG39n/Ro6uUCFix9d3uuzctxvPdla
	 Q71UHXnwfhPXNTjEbMl/WoRlCLQMf4UfuRgU2MrNCMgPhAVFUaidwkfOaG5bmoqhUN
	 TJYI5SZlvc2sCXZsORGmnf2RiH+k0waQJOO3BNGavVgd7wmGhHvc288VlDTsFeTAVY
	 Ad4HDsJ0VOn4g==
Message-ID: <7ab51a29-a214-4e39-b684-4c4b3b87eca4@kernel.org>
Date: Tue, 1 Sep 2026 08:48:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/11] f2fs: initialize sb_info early in
 f2fs_fill_super
To: Kelvin Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <cover.1788213716.git.zhangxp1998@gmail.com>
 <d3fa15836c409ac6028956c06dbe11a8e0149734.1788213716.git.zhangxp1998@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <d3fa15836c409ac6028956c06dbe11a8e0149734.1788213716.git.zhangxp1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 06:05, Kelvin Zhang wrote:
> Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
> processing superblock error tracking, mount options, and sb->s_maxbytes.
> 
> However, read_raw_super_block() reads the superblock folio directly
> from the block device mapping using folio page offsets. This makes the
> initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.
> 
> Move init_sb_info() to execute immediately after sbi->raw_super is
> attached, allowing the block device block size to be set dynamically via
> sb_set_blocksize(sb, sbi->blocksize).
> 
> This early initialization also prepares for upcoming patches that add
> dynamically computed filesystem geometry fields, such as
> sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
> fields are required by earlier initialization steps, including mount option
> consistency checks and sb->s_maxbytes computation.
> 
> Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
> ---
>   fs/f2fs/super.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 253a579e9d5b..2d9f5b77f815 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   	}
>   	mutex_init(&sbi->flush_lock);
>   
> -	/* set a block size */
> -	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
> -		f2fs_err(sbi, "unable to set blocksize");
> -		goto free_sbi;
> -	}
> -
>   	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
>   								&recovery);
>   	if (err)
> @@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   
>   	sb->s_fs_info = sbi;
>   	sbi->raw_super = raw_super;
> +	init_sb_info(sbi);
> +
> +	/* set a block size */
> +	if (!sb_set_blocksize(sb, sbi->blocksize)) {

It's better to keep unlikely.

if (unlikely(!sb_set_blocksize(sb, sbi->blocksize))) {

Thanks,

> +		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
> +		err = -EINVAL;
> +		goto free_sb_buf;
> +	}
>   	sbi->max_atc_write_bio_size = UINT_MAX;
>   
>   	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
> @@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   	if (err)
>   		goto free_bio_info;
>   
> -	init_sb_info(sbi);
> -
>   	err = f2fs_init_iostat(sbi);
>   	if (err)
>   		goto free_bio_info;


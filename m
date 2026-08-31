Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1C435DA68
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159092; cv=none; b=iKbxWJOMo+jC3JIA4NUo/5ZJPlVeU/XQrdS9FUQGYCGvQrQDbc4EVL9LGERUY/tJmG2jMD7LA+99EeBD+DN+BFtV6WiSN9QMOgY0z1Te1xomJAI5XhnO7DZx2wpZAClztB8EcaYuXtPp/sxAP8pt0HMakzbCQ0fvinob5sGS0ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159092; c=relaxed/simple;
	bh=MIp0cpiVR5a8QO7X6w7FDWMJ1XONp6uEpev1U1IdYiY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U3/93JufgG/XNGoi6MlO+7HkRDE73qNkn22O3Kw3UdsID6LozvTnyaYq7DEzcmvlGS7HBJOExTBS8AvYwuP1U4pVW50410IkMoKgPg0tQV10DOFVkn/SGjF4DhzCkP5Pql5E+EDixFTA5OjtbsgjKsX/kQtNaOcwBo02zKweTxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RU8uoJnW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RU8uoJnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB991F000E9;
	Mon, 31 Aug 2026 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159091;
	bh=lnm5Hm8KxB87ch6ERXweKmqJnt+emfIA8af2LTRWWyQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=RU8uoJnWIVv35qX8gYwwPMWQ4zGtXMg1Un6ImInQsH1oi2yJnMDjpO+sJ0uMOB6Md
	 B/Q49ViGlBIZezU1pG9EwXx5EBSboq6YiOYV0oJjEDA5AhLONCm4KhoaeVIzVRplo5
	 DKp03i9eW3nXQUjz2PylcgF5sEQAIbfio1HHOS71q1u/2R2e328Dz09yP4d27wAdjf
	 m3AKnVRJhmPtzXiE3eTgLBpNnDRm2X5vBycydiPAIs5KTyVB92GpetkozOuN1FrC+Z
	 MYtJNyKvQ4VwWQzWquPUWWceF4uMpTccua619eIBWa5h0mXy6XSbfDOPR5I9L7q3hR
	 EITzWc7Lb09Hg==
Message-ID: <69df3654-4f5d-4f8e-8860-62e545897192@kernel.org>
Date: Mon, 31 Aug 2026 14:51:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] f2fs: initialize sb_info early in
 f2fs_fill_super
To: Xinping Zhang <zhangxp1998@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
 <CAH=xXfHL4bWFMVa=-a8sRuR_bn9VcaFRo+X3eeZfedSa0C7dww@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAH=xXfHL4bWFMVa=-a8sRuR_bn9VcaFRo+X3eeZfedSa0C7dww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 13:32, Xinping Zhang wrote:
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
> @@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block
> *sb, struct fs_context *fc)
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
> @@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block

Kelvin,

I can't apply the patch in my git tree, it notices that the patch is corrupted:

Applying: f2fs: initialize sb_info early in f2fs_fill_super
error: patch fragment without header at .git/rebase-apply/patch:6: @@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block
Patch failed at 0001 f2fs: initialize sb_info early in f2fs_fill_super

I suspect your email client force to wrap long line after "super_block".

Thanks,

> *sb, struct fs_context *fc)
 > >   	sb->s_fs_info = sbi;
>   	sbi->raw_super = raw_super;
> +	init_sb_info(sbi);
> +
> +	/* set a block size */
> +	if (!sb_set_blocksize(sb, sbi->blocksize)) {
> +		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
> +		err = -EINVAL;
> +		goto free_sb_buf;
> +	}
>   	sbi->max_atc_write_bio_size = UINT_MAX;
> 
>   	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
> @@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block
> *sb, struct fs_context *fc)
>   	if (err)
>   		goto free_bio_info;
> 
> -	init_sb_info(sbi);
> -
>   	err = f2fs_init_iostat(sbi);
>   	if (err)
>   		goto free_bio_info;


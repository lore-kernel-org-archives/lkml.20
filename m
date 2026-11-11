Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396981;
	b=J/zegYTa1p7vIUXDB5tUvipoovPf26gG5IkcXc0mlDe8z4tx5ABuSPqWxHcDp9FmgKWW
	 hIWrKRHiIkYTE+3irkdBAwgfSmbdThE1t14czyYHKpmaJ21jT5WZWVxa7GD9RqkLhz2IH
	 5DIoJNZLicYjZ7A2TtS+Xu9lXrGiJLc/JGJiTfTk5bYIMhs+p/pYkWTkF3rHUynGOphNW
	 7mfus6on01acjz+FWgMJv1kLTuQ5NFnaXh6qRu7JeuPRkeXdBT6e9QMV/3qk/wOf/eEPb
	 97muxfTOxpyBPT917LU1td0qfTaj38sVIEqR2JGDKzjbvZdbkPOXgGL/dbz2ILQ+4eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396981;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6ef3BW3A5FVT5x/mpefs4145su/1qFLNbKYUDqCerLU=;
	b=L/nvliVnDHYvfhaNoTH/h75qvK3rLkJViaNvZVcS6ZL5a5dZCU+/3dKjbmiFD0HswyQ8
	 MOg+l00CZsfOpYGJkebCLNgsxvXnizNJqF7yZkhpeP8Wm6PDJ7kvs+GDv0xnx+Ku4ONtf
	 UoMa2lPXHjfZ9GhEvD46626cem6LCJTxFp3lkcV5pdoTRwS7VRPZUFpmcGTP47IvsJlI1
	 8KfF5uGvCypOeW0LA5MiwQBff02OqHjzpFiCPNVg0+uoGxf5L8Q4HHNyTiNlXMBkee4En
	 RDv7vQH1kCIr14MxzAU1SmjV8FW4w8PxlbdOQa+teKNlpXkHFfI6yE2K8vsdAx5pxZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXNCcv7A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D87606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXNCcv7A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE291F00A05;
	Wed, 11 Nov 2026 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794396980;
	bh=6ef3BW3A5FVT5x/mpefs4145su/1qFLNbKYUDqCerLU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=mXNCcv7AXNopwNMQPTesiR1qQrAdv3fbAmc58SeIoRuUlniu3GMcK149CgUQ90txD
	 XJuyrmzfEh1U+r4J7KnFuOkDkEsa2MGHAgxQN6L4s/7uGP9Si0geyi+LwXQpnSYGdX
	 i1+syBY8hEyma1ohntJTd0yb86lKIP0i4jea5AOOEf+TCRXYCfuU0BYdad/+dyzXyx
	 hDyKV8g7BF4VdO1cfrvjOD5Ru1zWjYa/RJFFCv9JNvVjIkTwWwOEuf48rMZveFWzQV
	 +FEeyFpjxsi39MM0K1pVgb43DcRPSmyOUKboscRThZJzKK/XKIPeivshnWSfXXdMqS
	 s624B+RcZyPsw==
Message-ID: <f26ac11b-cf63-4627-9d12-e1216fc0135e@kernel.org>
Date: Wed, 11 Nov 2026 19:36:18 +0800
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
Cc: chao@kernel.org, daehojeong@google.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: require inode ownership for ioctls that change
 per-file state
To: Hungyu Lin <dennylin0707@gmail.com>, jaegeuk@kernel.org
References: <20261108045722.12091-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261108045722.12091-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/8/26 12:57, Hungyu Lin wrote:
> F2FS_IOC_RELEASE_COMPRESS_BLOCKS, F2FS_IOC_RESERVE_COMPRESS_BLOCKS,
> F2FS_IOC_SET_PIN_FILE and F2FS_IOC_IO_PRIO change the state of the inode
> behind the file descriptor without checking who the caller is. Any user
> who can open a file, even read-only, can:

How about checking write permission instead of inode_owner_or_capable()?

	if (inode_permission(file_mnt_idmap(filp), inode, MAY_WRITE))
		return -EACCES;

> 
>  - release its compressed blocks, after which writes to the file fail
>    with -EPERM until the blocks are reserved again or the file is
>    truncated to zero;
>  - reserve released blocks again, which consumes free space;
>  - pin it while it has no data blocks, after which writes that extend
>    the file fail with -EIO;
>  - unpin it, so that garbage collection may move blocks that a user of
>    F2FS_IOC_SET_PIN_FILE expects to stay in place;
>  - set its write I/O priority hint.
> 
> F2FS_IOC_SET_PIN_FILE checked inode_owner_or_capable() when it was
> added. Commit aff7b628ac2d ("f2fs: set pin_file under CAP_SYS_ADMIN")
> replaced that with a CAP_SYS_ADMIN check, and commit b13bdf03bb80
> ("f2fs: allow all the users to pin a file") then removed the
> CAP_SYS_ADMIN check, leaving the ioctl without any permission check.
> 
> The atomic write ioctls require both FMODE_WRITE and
> inode_owner_or_capable(). Requiring FMODE_WRITE here would break
> f2fs_io, which releases and reserves compressed blocks through a

I think we can fix f2fs_io.

> read-only file descriptor, and Android, which releases them the same
> way. Require only inode_owner_or_capable(), as F2FS_IOC_SET_PIN_FILE
> originally did, so that only the owner or a caller with CAP_FOWNER can
> change this state. Users can still pin their own files.
> 
> Fixes: b13bdf03bb80 ("f2fs: allow all the users to pin a file")
> Fixes: ef8d563f184e ("f2fs: introduce F2FS_IOC_RELEASE_COMPRESS_BLOCKS")
> Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
> Fixes: 5f95c1812a65 ("f2fs: add ioctl to get IO priority hint")

IMO, we'd better to fix them in separated patches.

Thanks,

> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/f2fs/file.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e2c0f5083313..0730de36554a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3664,6 +3664,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>  	if (!pin && IS_DEVICE_ALIASING(inode))
>  		return -EOPNOTSUPP;
>  
> +	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
> +		return -EACCES;
> +
>  	ret = mnt_want_write_file(filp);
>  	if (ret)
>  		return ret;
> @@ -3982,6 +3985,9 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
>  	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
>  		return -EINVAL;
>  
> +	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
> +		return -EACCES;
> +
>  	inode_lock(inode);
>  	F2FS_I(inode)->ioprio_hint = level;
>  	inode_unlock(inode);
> @@ -4235,6 +4241,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  	if (f2fs_readonly(sbi->sb))
>  		return -EROFS;
>  
> +	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
> +		return -EACCES;
> +
>  	ret = mnt_want_write_file(filp);
>  	if (ret)
>  		return ret;
> @@ -4430,6 +4439,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	if (f2fs_readonly(sbi->sb))
>  		return -EROFS;
>  
> +	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
> +		return -EACCES;
> +
>  	ret = mnt_want_write_file(filp);
>  	if (ret)
>  		return ret;


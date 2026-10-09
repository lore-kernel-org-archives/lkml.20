Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B836494B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534948; cv=none; b=syXTUvt255jSN93ddNcaeNH4ZV1thJchamgw1bLENrkPDHiZ5S1kRWlA+B78HAKvIjzUA11/JZeUG5d0FyN9/3JwFyf+edq5/esdPT1lC06xG2r03X9UabSPLXE4Mgft8nJ2yQgQZWaNB4zC+96MaFfAyy3Qqz3Ys9q49a8/Ljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534948; c=relaxed/simple;
	bh=DcIG2shn3T0xcPy26ZYooPqk+CSxU0JY/AS9GXVd1rw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XO/hU33aF2PBqh8lIT8YPU9HMB2HklmUUPXdYE0ojstUmmTmgnx2GRjlDV7QsILWH6AO5mgrqI7TGYlWvCweKzBPRS3p6eZ/f0IIlUNzykrARy8TxM4Pl2upT7KGIsIquio+higE7cGl+AKuqPqV0HoBC8IeZLoRTGc4vDGBkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrrGn15x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrrGn15x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F301F000FF;
	Fri,  9 Oct 2026 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791534947;
	bh=LJp1ABo9XG9ZF+W5UNjHtd6WdeHvlA8w8SgIAeqqbUA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ZrrGn15xHDm0VBgW6cpZpvLBFU48SqjH9iXbyqj1D1FjB9srg4CbU5KN8mODXGbRs
	 LAJPTXHifupnXvMnMuB37aOfvA2ATmG6MQdISYboACKENt8IhC5i7FFhj/yE9XyjIm
	 YG3SeW6COSUtuv1TQpM4AEIj5hAU0kTxEehtvHvDw71pyUM2JGBjRSJEL6MSQIEgrr
	 PrJMGBftKH9kgo+P/Te/wRwyXeJAEoiWFLVX4gH/2vLkUaazpkmEzcbMWoI3ixmXoS
	 jWles1FkEFLrmUObz4BJJbMru066TuSZQkj9EV447jKM+AY51OCuyO7kg5uFzjYPT2
	 BKvZdBLvvuBpw==
Message-ID: <63812000-4677-4af6-a3e1-4e87e39f0d88@kernel.org>
Date: Fri, 9 Oct 2026 16:35:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: disallow mmap write and data-modifying
 fallocate on atomic files
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261002171704.3652570-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261002171704.3652570-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/3/26 01:17, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Stores through a shared writable mapping and fallocate with
> FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
> FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
> the COW inode and modify the original inode directly. Reject them while
> the file is in atomic write mode, as fallocate already does for pinned
> and compressed files. A write fault gets SIGBUS and fallocate gets
> -EOPNOTSUPP.
> 
> fallocate without these flags only preallocates blocks and stays
> allowed.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/file.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ef4d218e694..56c686b8580 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -140,6 +140,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> +	/* mmap stores bypass the COW inode and would break atomicity */
> +	if (f2fs_is_atomic_file(inode))
> +		return VM_FAULT_SIGBUS;

Will we suffer race issue due to the check w/o lock?

Thanks,

> +
>  	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
>  		err = -EIO;
>  		goto out;
> @@ -2113,9 +2117,11 @@ static long f2fs_fallocate(struct file *file, int mode,
>  
>  	/*
>  	 * Pinned file should not support partial truncation since the block
> -	 * can be used by applications.
> +	 * can be used by applications. Atomic files should not either, since
> +	 * these modify the original inode directly and break atomicity.
>  	 */
> -	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
> +	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
> +	     f2fs_is_atomic_file(inode)) &&
>  		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
>  			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
>  		ret = -EOPNOTSUPP;


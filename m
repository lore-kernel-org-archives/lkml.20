Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7F2F851
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617842; cv=none; b=BpxTeN9sKH7Yz9K4sTVbxfIxf5KdfgvGnCrr1y4ekb8cePhzLrFMDCIn4XI7Ejv4sVlD7dASo0A/B5rZnkBMeqwnWFwlQxJ2h65eyOgDpNJof5wB1DW9dGE24LO5G2e7VwGc8ywxbynCeqaNyyO1/+/Pg2N2ZsJk9pgYANbCEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617842; c=relaxed/simple;
	bh=g2wX7a2vYqi5wvxOvzOLMPjNjOgfOcbFit6oOKZwrwY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HMQUpZgaPX7KCfJRtxZA8uzvq+hvJ6QYgeQHH63LW7VayYq3PZH6BZgHm1HhEgmQHF44huPHKNH0PT4h42IJ9VoeUXDs5Ma6/Fr2Ur1d0+LYSjhdT+V21wxopI68CnznuX5EmS7mGSDPtXrwvjwsfuLhdyQ2oGkUPJh5w5twujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1VjOGHi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1VjOGHi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62B71F000FF;
	Sat, 10 Oct 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791617840;
	bh=5XbZZqJRmmZ/LFvu5kMHlzZA0oahdFNUV1rYwMv2suY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=b1VjOGHi4EjnwFrW/B2RnJd/v5fcIr6As2XRK1F7oYNTUCddi6wjdJ6awrLpLNvjk
	 7Q8jnI8EqbALMHQ5gAh6ARozGS8/jWEGMj4WqygcR55GvRewjXDghypOTQgBbWH7kP
	 N70Mj3ADwOjyjzh/8JX10PySrPcaQSlyhdJTmc3+Kib5Vncl24jFNEDKs7U0AxqeKN
	 bXeb01qId1WUP6bpU4DhP5yfDhHMDhJJ7C/pKqZET6tgpqwG6euNq/C2zbJ9g4mSnd
	 TpW67NFlvo+KqazMZmZvkeuF2cqMCwWMFc+mTxP/Of8Qsb3FmrI6xW3Dtvor5B6P+r
	 hvWjNRZTA5nuw==
Message-ID: <99957074-c89a-44c4-a86d-f65e7dc85024@kernel.org>
Date: Sat, 10 Oct 2026 15:37:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>, stable@kernel.org
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: disallow mmap write and
 data-modifying fallocate on atomic files
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261010024133.2444761-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261010024133.2444761-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/26 10:41, Daeho Jeong wrote:
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
> f2fs_vm_page_mkwrite() cannot take inode_lock, so check the flag under
> invalidate_lock, and hold invalidate_lock in
> f2fs_ioc_start_atomic_write() from the flush until the flag is set.
> Otherwise a fault could check the flag, then start_atomic_write could
> flush and set the flag, and the fault would dirty the folio afterwards.
> 
> Cc: stable@kernel.org
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Daeho,

Please take a look at https://sashiko.dev/#/patchset/20261010024133.2444761-1-daeho43%40gmail.com

I think we need to apply this after ("f2fs: remove mappedtodisk flag usage in mmap write path")

More details are in my comments on this patch:
https://lore.kernel.org/linux-f2fs-devel/496b913c-eb81-4fa8-be72-c6a06a10aba2@kernel.org/

Otherwise it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
> v2: serialize atomic flag check in f2fs_vm_page_mkwrite().
> ---
>  fs/f2fs/file.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ef4d218e694..7020b3e8940 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -187,6 +187,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>  	file_update_time(vmf->vma->vm_file);
>  	filemap_invalidate_lock_shared(inode->i_mapping);
>  
> +	/*
> +	 * mmap stores bypass the COW inode and would break atomicity. Check
> +	 * under invalidate_lock: f2fs_ioc_start_atomic_write() holds it while
> +	 * flushing dirty folios and setting FI_ATOMIC_FILE, so either it sees
> +	 * our dirty folio and writes it back, or we see the flag.
> +	 */
> +	if (unlikely(f2fs_is_atomic_file(inode))) {
> +		err = -EOPNOTSUPP;
> +		goto out_sem;
> +	}
> +
>  	folio_lock(folio);
>  	if (unlikely(folio->mapping != inode->i_mapping ||
>  			folio_pos(folio) > i_size_read(inode) ||
> @@ -2113,9 +2124,11 @@ static long f2fs_fallocate(struct file *file, int mode,
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
> @@ -2403,6 +2416,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  
>  	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>  	f2fs_down_write(&fi->i_gc_rwsem[READ]);
> +	/* serialize with f2fs_vm_page_mkwrite(), see the comment there */
> +	filemap_invalidate_lock(inode->i_mapping);
>  
>  	/*
>  	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
> @@ -2458,6 +2473,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  	f2fs_i_size_write(fi->cow_inode, isize);
>  
>  out_unlock:
> +	filemap_invalidate_unlock(inode->i_mapping);
>  	f2fs_up_write(&fi->i_gc_rwsem[READ]);
>  	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>  	if (ret)


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311402;
	b=emEB6kkTrUzBvyJprKPerDx7vQ9UqvVdfY8wUh9RNvRN0sM4gv6QaUZGEWVgaR3FJiGI
	 0NQDarxEr5rjLOuWEZUI3u3hh4QJhqayF29crt/lT8Tgs9IZ8mOt8lp8iOgG4Gtr+Ab/t
	 1/5xbbJAQuV/MUwTbGDl/YvvzQ+a/BUDhEkvmZhdHOjy5mxIYbx8ghXxeTKXZDEEdxHlv
	 w4/sRfCIq05EOW9/P9yKLH1pZxLBvORlEVSvVyoAQIJsE9BSQXvdUTCZ28ov+8xnsW6JW
	 eLCMVVdbIK/zDOj5mnvYC5dsxkZ57jMeEAhOx2CImQQaws1KddqCTijfWMEF+3kFgJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311402;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ItAXHSlUPIZQNmR9opFqhtbfungH9CIICRVQjVJ10k=;
	b=Af1/l1Dg+VkwqLAQxbTwdkT0P6+2IxH4dDxCnOjjk1wtbKz5Q2jQ+4LJSSXuUxkQcuhF
	 iHhwaXR8tAJNC2CcM1gqBd7pNx/zWJV0TNj+GA6rm4VpkWEM0ZYMF0BlNNJAFY4QJDQ2j
	 Cr5JI1TPdGA6mCiaBnvOeYiZZmf3dkEw43JkaP0CDno2UyC1WwNOyOLhd5J5WzSSHLOt0
	 GW7uayboL0g1qR4p8lHz4vDz+Df7KKqb26puxYsktaf44+VQICCFsLLLssgApq6hJ8cFH
	 S+zT7n1yykNcLPdhT+221t3bPLEDgkvx0Rg8Js2abVbJ7JXByfddsUPpJeaVMoZNzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuFEgcje;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F5B60A3834
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuFEgcje
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CB51F008A4;
	Tue, 10 Nov 2026 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311401;
	bh=1ItAXHSlUPIZQNmR9opFqhtbfungH9CIICRVQjVJ10k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=QuFEgcjeAsY6iC2CNlC9tG2aM+pZiQ1mY9Dk6iIc0NvlfR8v+GY4ARM8GLGkZl4wQ
	 SHC7SpIXMI+ihrpHabBm5E9lomF1m2zbrkaxTAgoxrh8KLL4J3Io2LbMPrWmbojM7N
	 YFF0euuJpAlO0H91Si55ygK0h1s3CTTxkqSDztsFpavyU5ws36hXOjlwEalpNKftBf
	 GLWWnOW/MKCkIfLkKnCXmLViGEcQD0eILElFzKGdBMQQUeguT2k3aIe6481WPYxk64
	 CWDLVwg78rConcCSbNnQ1GcNHp1un3F0MH+w5v95Jrp9hnq2qJZbeyMSOAqV3pCWWu
	 X31Ma7DiTQ+IQ==
Message-ID: <32f2a9f7-2c87-4200-b562-61ae8d0ac91a@kernel.org>
Date: Tue, 10 Nov 2026 19:49:58 +0800
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 03:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Writeback already writes dirty blocks to the COW inode per block. Make
> write_begin of atomic files reserve and read COW blocks per block as
> well, and remove the -EOPNOTSUPP checks. Skipping the read of the
> blocks that a write fully covers also applies to large folios when the
> block size equals PAGE_SIZE.

With this patch atomic files are allowed in subpage mode, so
f2fs_abort_atomic_write(inode, true) can extend i_size back to
original_i_size (e.g. after F2FS_IOC_START_ATOMIC_REPLACE set it to 0).
FI_ATOMIC_FILE is cleared before i_size is restored and abort doesn't hold
invalidate_lock, so a racing mmap fault can run ->page_mkwrite() with the
small i_size and map the folio writable; stores to its blocks between the
old EOF and original_i_size then don't fault and aren't marked dirty.
Should we call pagecache_isize_extended() after restoring i_size there, as
patch 08 does for the other i_size extension paths?

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/data.c | 24 ++++++++++++++++--------
>  fs/f2fs/file.c |  5 +----
>  2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a23fd4b01a4c..4e4d1b0d6004 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4624,7 +4624,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
>  		}
>  
>  		if (f2fs_has_subpage_blocks(sbi) &&
> -		    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
> +		    f2fs_compressed_file(inode)) {
>  			WARN_ON_ONCE(1);
>  			mapping_set_error(mapping, -EOPNOTSUPP);
>  			folio_clear_dirty_for_io(folio);
> @@ -5247,7 +5247,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
>  	int err = 0;
>  
>  	if (f2fs_has_subpage_blocks(sbi) &&
> -	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
> +	    f2fs_compressed_file(inode))
>  		return -EOPNOTSUPP;
>  
>  	/*
> @@ -5359,13 +5359,16 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
>  	/* Inline data must have been converted before reaching here. */
>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>  
> -	start = folio->index + (ori_off >> PAGE_SHIFT);
> -	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
> +	start = f2fs_folio_lblk(sbi, folio) + (ori_off >> sbi->log_blocksize);
> +	end = f2fs_folio_lblk(sbi, folio) +
> +		((ori_off + len - 1) >> sbi->log_blocksize);
>  
>  	for (index = start; index <= end; index++) {
> +		loff_t block_start = F2FS_BLK_TO_BYTES(sbi, index);
> +		loff_t block_end = block_start + F2FS_BLKSIZE(sbi);
>  		block_t blkaddr = NULL_ADDR;
>  		bool node_changed = false;
> -		size_t off = (index - folio->index) << PAGE_SHIFT;
> +		size_t off = f2fs_folio_byte_offset(sbi, folio, index);
>  
>  		err = prepare_atomic_write_begin(sbi, inode, index,
>  						&blkaddr, &node_changed,
> @@ -5373,12 +5376,17 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
>  		if (err)
>  			return err;
>  
> +		/* Skip read if the write covers the entire block. */
> +		if (pos <= block_start && pos + len >= block_end)
> +			goto balance;
> +
>  		if (f2fs_ffs_test_blk_uptodate(folio, index))
>  			goto balance;
>  
>  		if (blkaddr == NEW_ADDR) {
> -			folio_zero_segment(folio, off, off + PAGE_SIZE);
> -			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
> +			folio_zero_segment(folio, off, off + F2FS_BLKSIZE(sbi));
> +			f2fs_ffs_mark_subrange_uptodate(folio, off,
> +							F2FS_BLKSIZE(sbi));
>  			goto balance;
>  		}
>  
> @@ -5436,7 +5444,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	}
>  
>  	if (f2fs_has_subpage_blocks(sbi) &&
> -	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
> +	    f2fs_compressed_file(inode)) {
>  		err = -EOPNOTSUPP;
>  		goto fail;
>  	}
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 1c440b5fa9bd..91f792cf879f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2299,7 +2299,7 @@ static long f2fs_fallocate(struct file *file, int mode,
>  	}
>  
>  	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
> -		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> +		if (f2fs_compressed_file(inode)) {
>  			ret = -EOPNOTSUPP;
>  			goto out;
>  		}
> @@ -2553,9 +2553,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  	loff_t isize;
>  	int ret;
>  
> -	if (f2fs_has_subpage_blocks(sbi))
> -		return -EOPNOTSUPP;
> -
>  	if (!(filp->f_mode & FMODE_WRITE))
>  		return -EBADF;
>  


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7539E19C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790046581; cv=none; b=IUMODwIQZ/S/nQhoSDRNYnVAeEjiC3dWfcJVDyhCNKziiZQZDrH2hbvgymBJdkVmAPMFa/pIxZR+SJ/2R5vMP/Zk8jkh8JICdIkW1rPwT0v64bf0XsFhkerWvYJh+uyoJUAr5j1NTxjoDSBrLpispwcZhZ01bP2OmqkKmBzBwJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790046581; c=relaxed/simple;
	bh=g+4UhE/miynh/nrL+ppRVYV8EK/P7dnl+OZxiQwvWKE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mw1TLHKC9DL2mC4l8k3uK1AwbiJ+sYHymZG0P6+wvZZ5n22oLCgtME8J5MFmXBTrrZeYLyT2+jlB2iomjiUvFTo/PcUFg3tLjdwTM/jXlxYP3YOC/P+oLPEcXbcr9OuR64dSISEnfZoj24qMA09Ow7v/Pn/cydcRLbB1WHwBZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGH8lUKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGH8lUKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEB11F000FF;
	Tue, 22 Sep 2026 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790046579;
	bh=CBrq0W4hwuHtFakDlzYoO5CFxEwhKTqvSW2yit9CFf4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=iGH8lUKFZTsbN++vJ/QwgzV0AfW4e21HkwgcxJtIBtce0InGcNNKyQVmFb/Y488e2
	 sE2k/I6sXlnJ4pSqL6/AWnwzHg/pdkIxKMyaX/5Ccw919j8KpfKtXz7yUnjw10GC/l
	 gZcuBAPGEW7S4SyL2n2HbnnrxP03XnMOS02PFImiTMo8sUDXLNFV+e65pOlaUMSS/u
	 OlNxLb2Fa+rjqYCXbTD6Q6cK5VpxXwICBax0bzK9rR/DV5OHGTHvJy3dl8LhmFmDCb
	 iR+aO663/okc1AjvfWfBa2ujn55i/d3brjCERAr0Kcw7EgdZvFEGSRiS6/pfjPMiI2
	 5OhybF6cmvJPw==
Message-ID: <747d2cbe-01ce-4261-a699-e51ede593434@kernel.org>
Date: Tue, 22 Sep 2026 11:09:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Pengfei Li <lipengfei28@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v2 14/14] f2fs: make compressed files compatible with
 large folio
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
 <20260915042503.2912616-4-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260915042503.2912616-4-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/26 12:25, Nanzhe Zhao wrote:
> The compression flag is the hint indicates that the inode can be
> compressed, when the inode is using large folio, we expected it keeps
> using the large folio read/write paths and its data stays uncompressed
> on disk until the inode is evicted and re-read
> 
> Let f2fs_write_begin() skip the compression overwrite preparation for
> such inodes and remove the compressed-file gate in
> f2fs_read_data_large_folio() so the data is simply read/written as
> regular blocks.
> 
> For the same reason, reject F2FS_IOC_COMPRESS_FILE with -EOPNOTSUPP
> once the inode mapping is switched to large folios.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>  Documentation/filesystems/f2fs.rst | 10 ++++++++++
>  fs/f2fs/compress.c                 |  2 ++
>  fs/f2fs/data.c                     |  9 ++-------
>  fs/f2fs/file.c                     |  7 +++++++
>  4 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 771216f45207..b4f436ffd9ac 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -941,6 +941,16 @@ Compression implementation
>    reserved via ioctl(F2FS_IOC_RESERVE_COMPRESS_BLOCKS) or the file size is
>    truncated to zero.
>  
> +- Compression and large folios are not effective at the same time on a file:
> +  a compressed inode does not use large folios, while an inode which is
> +  using large folios keeps its data uncompressed on disk.  If the compression
> +  flag is set on an inode that is already using large folios, the flag works
> +  as a hint until the inode is evicted: the inode keeps using the large folio
> +  read/write paths, f2fs_write_begin() skips the compression overwrite
> +  preparation, and ioctl(F2FS_IOC_COMPRESS_FILE) fails with -EOPNOTSUPP.
> +  Once the inode is evicted and read back, it uses order-0 folios again and
> +  compression is applied as usual.
> +
>  Compress metadata layout::
>  
>  				[Dnode Structure]
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b130e43b4566..fa0f8449a12c 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -78,6 +78,8 @@ bool f2fs_is_compressed_page(struct folio *folio)
>  		return false;
>  	if (folio_test_f2fs_nonpointer(folio))
>  		return false;
> +	if (f2fs_folio_has_ffs(folio))
> +		return false;
>  
>  	f2fs_bug_on(F2FS_F_SB(folio),
>  		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c9dba8d0ad3d..f5421334ecf3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2941,12 +2941,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>  	int ret = 0;
>  	bool folio_in_bio = false;
>  
> -	if (f2fs_compressed_file(inode)) {
> -		if (folio)
> -			folio_unlock(folio);
> -		return -EOPNOTSUPP;
> -	}
> -
>  	map.m_seg_type = NO_CHECK_TYPE;
>  
>  	if (rac)
> @@ -4828,7 +4822,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	}
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -	if (f2fs_compressed_file(inode)) {
> +	if (f2fs_compressed_file(inode) &&
> +	    !mapping_large_folio_support(inode->i_mapping)) {
>  		int ret;
>  		struct page *page;
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index db71cadefabd..c5cb0b0384b6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -5002,6 +5002,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
>  	if (!(filp->f_mode & FMODE_WRITE))
>  		return -EBADF;
>  
> +	/*
> +	 * The mapping is already using large folios, where the data is kept
> +	 * uncompressed, so refuse to start compressing the file.
> +	 */
> +	if (mapping_large_folio_support(inode->i_mapping))

It needs to print log here to give notice.

e.g "not support if large folio bit is set, drop inode cache to unset the flag and retry" ?

Thanks,

> +		return -EOPNOTSUPP;
> +
>  	f2fs_balance_fs(sbi, true);
>  
>  	ret = mnt_want_write_file(filp);


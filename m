Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257957;
	b=O/0xs5A0MHV+9gXn5mE7rOxuAaVhqhyo8X5+5knq0twnXAPKXYMYREt9zsEngvUtkNy0
	 vBpVqQimb/UBw4LooFAi7mrYn5emgv37UVvdr9BOS0CSxUQjWZQLx6ivFgwrNc71OrGTC
	 chqDkN/uy1baNzDCkcOiZe0GRu42joWZvJUjfNS3cJkZ9YLQ4FF8b3pgRP+d8UYQFmWIb
	 SirC2UtKxlZUcoQhavDjPrCKj5R1eKYaEGQG/AlbS6AcaJ2DJWIQkeTpShr0cQaSbJdfO
	 1c1tk7pII3RJv7sktDlnsx14icV6i1AY9hviz41hCbOEuRgFQ7NlAwauiBVhPjZxHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257957;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZqIP8rHFVaUvr35xWWY1cogweghasOeeLqDOh4JkDs8=;
	b=qxzParH3O5SeUkjDvLGer9Ln8o9v8hmpjbm1RyG6hsn1AG+9OdrDo2yziJjd6DQ9P69C
	 LDC15rz4OOwRthv5y36l/ezrXwiERUc4NGD2K9T4qtzQ3Ia6/TX0rHEwfRYCDkx85cvlR
	 oykHPNQO26feU6JqxjyyUqtPWAf62BFn12HkMCuyVSbDdOlocYaoj66dljgHX9hE4kG7W
	 ZGMn/iFqHDxS5bVE3nZuM4cQWChonTFeXjY7LS5f3bPvjaWkxCr1sZ9Ul/iNgZFzUniqC
	 QhA6mSkLjXrsDy/94Kvoie1qCU4Lj75sRpvwRtb9mp1AETWPrsEKfMMpiuuW90IsjZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFitKNmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC80E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFitKNmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54681F031E0;
	Thu, 29 Oct 2026 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793257956;
	bh=ZqIP8rHFVaUvr35xWWY1cogweghasOeeLqDOh4JkDs8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=RFitKNmIrd6y7IrXk2BT1ELcOf0HTtHywtmUd996Emu1nybB138jKXa+4xmcGxdiO
	 DOtKLNL8HYeGJSDqy6R5ZIVmp5bYORMxicU3xDCLKxhx5oT4Ya9Qp8IV3YL/5yW1xm
	 /CinfMhBwOOY0YCaiax74gDhuf7rdXix8rq4y3skoTUGVWS37NOcG2KOKGwqvfTPTD
	 Lvl0aHh5PnF7cYfQyG0xOGACTv+tUTNBOcAYgvaKyZSIOn7pCf6kH0nAvmyqJ7TGjA
	 JTZGAvefgtZlVHmnSGUb5V5m7oYNDGZ/LEXMBcEEkmqZfeEgQ8ZhhzxD11/64O4B8d
	 6xhbS9X42kFuw==
Message-ID: <54cbfb8a-c87e-4fea-9448-175706e22ac2@kernel.org>
Date: Thu, 29 Oct 2026 15:12:32 +0800
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
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 15/15] f2fs: make compressed files compatible with
 large folio
To: Jaegeuk Kim <jaegeuk@kernel.org>, Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-16-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
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
>  Documentation/filesystems/f2fs.rst | 10 ++++++++
>  fs/f2fs/compress.c                 |  2 ++
>  fs/f2fs/data.c                     |  9 ++-----
>  fs/f2fs/file.c                     | 38 ++++++++++++++++++++++++++++++
>  4 files changed, 52 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 55798421f2c4..b79bb67ee78e 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -942,6 +942,16 @@ Compression implementation
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
> index 162bd8ef822a..721b01dd0d24 100644
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
> index cc3c9e51db9c..ab8f5b44d63a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3288,12 +3288,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
> @@ -5331,7 +5325,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
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
> index 15bea642e986..cb7a9d4227f4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4907,6 +4907,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>  	struct address_space *mapping = inode->i_mapping;
>  	struct folio *folio;
>  	pgoff_t redirty_idx = page_idx;
> +	pgoff_t end_idx = page_idx + len;
>  	int page_len = 0, ret = 0;
>  
>  	filemap_invalidate_lock_shared(mapping);
> @@ -4924,6 +4925,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>  	} while (page_len < len);
>  
>  	while (redirty_idx < page_idx) {
> +		pgoff_t next_idx;
> +		size_t off, dlen;
> +
>  		folio = filemap_lock_folio(mapping, redirty_idx);
>  
>  		/* It will never fail, when folio has pinned above */
> @@ -4931,6 +4935,33 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>  
>  		f2fs_folio_wait_writeback(folio, true, true);
>  
> +		/*
> +		 * Only this cluster is rewritten, while a large folio can
> +		 * cover more than one cluster, so mark the intersection of
> +		 * the folio and [redirty_idx, end_idx).
> +		 */
> +		next_idx = min_t(pgoff_t, folio_next_index(folio), end_idx);
> +		off = offset_in_folio(folio, (loff_t)redirty_idx << PAGE_SHIFT);
> +		dlen = (size_t)(next_idx - redirty_idx) << PAGE_SHIFT;
> +
> +		if (folio_test_large(folio)) {
> +			/*
> +			 * A compressed inode can keep using large folios, in
> +			 * which case the compression flag only works as a hint
> +			 * until the inode is evicted.  Update the subpage dirty
> +			 * bitmap as well, otherwise f2fs_write_cache_folios()
> +			 * finds no dirty range and skips the whole folio.
> +			 */
> +			if (!f2fs_ffs_find_or_alloc(folio)) {
> +				ret = -ENOMEM;
> +				folio_unlock(folio);
> +				folio_put_refs(folio, 2);
> +				redirty_idx = folio_next_index(folio);

Jaegeuk, Nanzhe,

I missed this potential UAF, please fix this.

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 162b7f7aa6d4..3de67522beef 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4941,16 +4941,14 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
                         */
                        if (!f2fs_ffs_find_or_alloc(folio)) {
                                ret = -ENOMEM;
-                               folio_unlock(folio);
-                               folio_put_refs(folio, 2);
-                               redirty_idx = folio_next_index(folio);
-                               continue;
+                               goto next;
                        }
                        f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
                }

                folio_mark_dirty(folio);
                folio_set_f2fs_gcing(folio);
+next:
                redirty_idx = folio_next_index(folio);
                folio_unlock(folio);
                folio_put_refs(folio, 2);

Thanks,

> +				continue;
> +			}
> +			f2fs_ffs_mark_subrange_dirty(folio, off, dlen);
> +		}
> +
>  		folio_mark_dirty(folio);
>  		folio_set_f2fs_gcing(folio);
>  		redirty_idx = folio_next_index(folio);
> @@ -5037,6 +5068,13 @@ static int f2fs_ioc_compress_file(struct file *filp)
>  	if (!(filp->f_mode & FMODE_WRITE))
>  		return -EBADF;
>  
> +	/*
> +	 * The mapping is already using large folios, where the data is kept
> +	 * uncompressed, so refuse to start compressing the file.
> +	 */
> +	if (mapping_large_folio_support(inode->i_mapping))
> +		return -EOPNOTSUPP;
> +
>  	f2fs_balance_fs(sbi, true);
>  
>  	ret = mnt_want_write_file(filp);


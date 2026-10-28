Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176332;
	b=FRDsqfeQ2o4kDVc4WRTx/UPzIflnv7oBN6Ny8907wBmdR9ahtyAEk9+v5kXDvtZ6svrW
	 pVQxkIcagJr7kDAt8Qnf1RopP1YDuEWzQMlZxrX07be+lDAYpn4N13vsU9fH5s8QeEQ+/
	 WV6DzADPEg8Wo+5tlZQzTgfKFvUpP1n7G7XRgCtHOEn3lJHKPRFYYl/BH69FX6wUlv70v
	 ci6ViUNZg9QcOIRndMXreMmgTeCrEdrD3G9OP3iCLDwx5pgd5sV9kYNkkAUCLy8NGDUGm
	 JYL8P+TYhdQnAPpx8YMKOW6ApEdxORH2cpxzwLIbbQrjUfb7Ti8LwTL92d+Dr1JBr9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176332;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WOvYHaDnwhLnDAkmJn59wu8Bjgkafm+4E2jvkhnkGRI=;
	b=w1hR0T6SPGSOypP77o/Km5mmpk6ys6VZF72q9RJ9sP/yiLoydkM+FfC7UrGX54nMnKIM
	 e5DQ8lPlqP3X9Kot+GDoZrzGhkDD+k80eeKzIQvSRsLg7PU+YhnpzRH1tnjDcUHkPxGra
	 hiffIKx/5PuCkGMhx+spYyb6qll5BW9iObNheLIKd0UgQgihZ2q5nzJTU9vvPnDt3DTaa
	 eiCMNujI6NrfBqEA5wHNw3lZK/RvmVt5moN6ePZ14+NHTnv/x8HU/DQBgr6ssBfblzwQL
	 GqaEltsFItqeKdEmwKnsU7eWUnZb08OYfaCy0O0AT1BvcGA8LB988utY4rzYpkyJMuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DJ6/Q1/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJ6/Q1/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B9A1F01825;
	Wed, 28 Oct 2026 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176332;
	bh=WOvYHaDnwhLnDAkmJn59wu8Bjgkafm+4E2jvkhnkGRI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DJ6/Q1/TMQusKRba6JRQAmK/vGoD7Aq5ZUlXIHhKNIiOjhr5mxX/E/LeY+vGAKSiR
	 lheGxAmIntZkP34nyX86Doj8soYtVeYzDC4Ka6JTNHWnsvW26gJ1fJ2zG5cplMARQ3
	 szR0fAw7kYGYOkXYgaf8treeLqYV6FddoL6cC9E5GiGtuWTQ7DofbCN2n7eCjKnbY2
	 T0fW0434arHFE9MM39FwBQNFNteHS4zYZjyryAf0zsFUnrSgPlc7GKt95ByHCCSIaO
	 AkPjayxpb2+C4FjzuDovaUgoGlu0mKBF0gM3fAVZN+0Zj5ySptJH6F40UJc34XcaMt
	 TUe+vWuOvZFsw==
Message-ID: <c87b011c-08fa-4e65-8b22-a6bf5a2efd5a@kernel.org>
Date: Wed, 28 Oct 2026 16:32:09 +0800
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
Cc: chao@kernel.org, stable@kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: do f2fs_zero_post_eof_page for all the
 time
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20261028050615.259268-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028050615.259268-1-jaegeuk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 13:06, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This fixes xfstests/generic/794, since the issue is not related to the
> posix=strict mode only.

Jaegeuk,

Actually, I fixed this only in fsync_mode=strict because I don't see such
scenario (described in original patch) in Android:

    Steps of generic/794:
    1. write 4096 bytes to file w/ 0x5a
    2. use fiemap to get PBA of first block in file
    3. truncate file to 4080
    4. umount; write 4096 bytes to file w/ 0x5a directly via PBA; mount
    5. extend filesize via
       a) append 4096 from offset 4096, or
       b) truncate 8192, or
       c) fallocate 4096 from offset 4096
    6. verify the gap is zeroed in memory [4080,4096)
    7. sync range 4096 from offset 4096; shutdown -f (flush meta before shutdown)
    8. umount; mount; verify [4080,4096) is zeroed or not.

Maybe we should only enable fsync_mode=strict for 794 to let it pass?

Thanks,

> 
> Cc: stable@kernel.org
> Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8b4a7a9d7dbe..823df06ae0f2 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -74,15 +74,10 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
>  					loff_t new_size, bool lock, bool writeback)
>  {
>  	loff_t old_size = i_size_read(inode);
> -	bool strict =
> -		F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode == FSYNC_MODE_STRICT;
>  
>  	if (old_size >= new_size)
>  		return 0;
>  
> -	if (!strict && mapping_empty(inode->i_mapping))
> -		return 0;
> -
>  	if (lock)
>  		filemap_invalidate_lock(inode->i_mapping);
>  	/* zero or drop pages only in range of [old_size, new_size] */
> @@ -90,14 +85,9 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
>  	if (lock)
>  		filemap_invalidate_unlock(inode->i_mapping);
>  
> -	if (!writeback || !strict)
> +	if (!writeback)
>  		return 0;
> -	/*
> -	 * In fsync_mode=strict, when we expand an unaligned EOF size, we
> -	 * should zero post EOF data and writeback the data immediately,
> -	 * so that it can avoid exposing stale data after metadata flush
> -	 * and POR.
> -	 */
> +
>  	return do_zero_post_eof_page(inode, new_size);
>  }
>  


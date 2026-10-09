Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D283D371899
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536607; cv=none; b=dMqRaADIukQVYSt4DoKagKMKUIy08AVhkv6S0kZuodvn14WiZ3meFF5jx/vN6SGhWsVkn3Ok2U0a0ozt1d+sQAwJ7SA9xxjlng2UI1DwKnxwPhwKtOny50D3uj+2MJE6z4Wz0h5uUAx3rpqOtOuFtTupM63tznyVBiTCdF/0Hsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536607; c=relaxed/simple;
	bh=xzntjARytziLXy6uHz1vvJ/6Ljuig4bbqbmU3XySnwg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gw0yRSFyjKX+zQM1WH45d7+9DYdV1CYRw01MdPGFg/1axyme1i5V6BEem0YfgSGkRdnLCjZPj9EFB6qiJKGCTbt9BtuKBnG9QqF5JdWfRFNugOm84okaQIHocjuvNMtJQ38Dp7e+Tx/t2t2Q6216+dkGIR6j7WqLheYKuW65q04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsJz4rSS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsJz4rSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2CA1F000FF;
	Fri,  9 Oct 2026 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536606;
	bh=Ke1OKsIbzF21VRYo2cmF8OlO/VOMA3LWhBS8fov9rNM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=SsJz4rSSxdBYy7fLgwh/Yuy/htYyNdJKnqB7xVGLNwQhSiUsbgYugIxkYJvluCWwE
	 Ah5WZ2VC+DDOQXV44rmV+3jK1+5fxyvhUgXvLv5kE6ES16v+ult4XNuUqdtoye7ebE
	 yU3R4MCHfC0bIJP1TOjVZo3O47+6wOV36pBIVxRrf8kSF0S59sWyoO41EqxNlT+Inq
	 tGAmjaim0t6tJDqNmbS7+pu99qfTteTcCQkSVMfsfgXalbGle/A5qAhIW4zEiO7wTh
	 Tj/BHYeZxbGBUADrHW2ApubIr6l0wfODbdpAcTX0sPxLgVra6p3/GaIY+9Ew0sISNP
	 Onl6Af3YHlPKQ==
Message-ID: <411bd479-f3ba-48cd-9b96-ec017c685b1c@kernel.org>
Date: Fri, 9 Oct 2026 17:03:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: write the directory inode in fsync
 before checkpoint
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261007223608.2158904-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261007223608.2158904-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 06:36, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> fsync() on a directory is done by a checkpoint, but the checkpoint
> does not write timestamp-only inode updates. Since commit 7c45729a4d6d
> ("f2fs: keep dirty inodes selectively for checkpoint"), such updates
> are marked with sync=false and left to inode writeback on purpose.
> 
> fsync() on a regular file calls f2fs_write_inode() first when the
> inode is dirty, but fsync() on a directory goes to the checkpoint
> directly and misses it. So if the last change to a directory only
> updated its timestamps, e.g. unlinking a file in it, the new mtime is
> lost after a sudden power off even though fsync() returned. generic/547
> fails sometimes because of this.

Has 9ec09d5f4b31 ("f2fs: dirty directory inodes on mtime/ctime update") fixed
this issue?

Thanks,

> 
> Call f2fs_write_inode() for a directory before the checkpoint, as the
> regular file path does. The inode block becomes dirty and is written by
> the same checkpoint, so no extra checkpoint or flush is added.
> Timestamp-only updates without fsync() are still not written by the
> checkpoint.
> 
> Fixes: 7c45729a4d6d ("f2fs: keep dirty inodes selectively for checkpoint")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/file.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 56c686b8580..b012cc22307 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -351,8 +351,15 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  
>  	trace_f2fs_sync_file_enter(inode);
>  
> -	if (S_ISDIR(inode->i_mode))
> +	if (S_ISDIR(inode->i_mode)) {
> +		/*
> +		 * Checkpoint writes only the inodes on the dirty meta list.
> +		 * Timestamp updates of a directory, e.g. by unlinking a file
> +		 * in it, do not put it on the list, so write it here.
> +		 */
> +		f2fs_write_inode(inode, NULL);
>  		goto go_write;
> +	}
>  
>  	/* if fdatasync is triggered, let's do in-place-update */
>  	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)


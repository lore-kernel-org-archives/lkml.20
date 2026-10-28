Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201212;
	b=K6c+KEA4XwL39ESxDVnRIk+ndXqLPY2Yp8pT5ij8yxT3OkvM/1A9b7ftDXYu73LZAIeF
	 0lQwDF1uH+f7yg8/c83Iftp1dZ7FfSRZtCqJTHgq/wxoZWg5bOAm/KvDDTTDMD0YmVyd4
	 o4fZaI+PAej4uAXuxIJ3RkUbt/1uUNam4Ioy0J6X+3mUWEYi8hEsCkacwcEHe+w2WxTxo
	 tTPkWotL3ujn4S7FyXky4uDl0TmRC6wtYOKOShtiU+RttIn4//HwzJQEy/+5Vljm0POta
	 6Icq1p85LkcysQJnoqv4hXKRRgcHC19XjwaKbKHtTMLUF1NkvffBU9Ynt4kfVjOX6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201212;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sirCQZqxefXuHL4irgboS/LvB2QlM6ul3cOLcu7k13Q=;
	b=yVLTboUGdE9Rzw/Uyb5+GpTai5m1gQZwHZ6RLiTKwbHbxLKggbMgc/OoFXv74zNVQsgr
	 eimxZPkGqMPVPPJ2vMqTeVsKEk9F79hxYlpzt+arq9Svb5/9hwkZg3hdw9vxvctuSFcc1
	 C5eh+CBjdExlSmlCP886AA4OEt5m+oddjZT7QW/gfp/13JmtQ3tSaoFPWs9gYDzDH5xU9
	 O2g6dxnXtR0QWZg+b8blOUYuYmzLTRByAvbE+NpnQPAKhHoPQmvHgRNKEezCee2OyoGkT
	 nYFLTnb5gEtY5KRJU83bW31gERseVgbZjtbR2afEE3fFHdZz094J3zp3p6l5HVK3v6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="guqvCF2/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E906606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guqvCF2/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD9B1F01828;
	Wed, 28 Oct 2026 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201211;
	bh=sirCQZqxefXuHL4irgboS/LvB2QlM6ul3cOLcu7k13Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=guqvCF2/p/ybbJZ0RCEKf7JZa886e8hTrp9n9QOsjENzfDTVQYeisqc9v3p+GHu2h
	 NU8UmkF2W68lm/46T50nfiD8xtv23pD+mMiPmQGQbGKTPzkqnC+MglDFF735I93Ohu
	 KG98TTDLY8T0YeubIjbuRlqplUD6pG97hcApOTMOzfd1/eNdK8M5f7MR334xjGYFB4
	 MJmLLI6E66aCPLx62GPg4e/LjsID49KDZh6MV2LsYinC4AEGUI8kW+DY0eZgqJxF/Y
	 Mt0CupN27JhaMRK6vPaUzA1msd5TAJHaQXAuWX6QEhDorrS9SxQdXWCe7+aHag2n0c
	 uMxx27u+4RRWw==
Date: Wed, 28 Oct 2026 15:26:50 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	stable@kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: do f2fs_zero_post_eof_page for all the
 time
Message-ID: <auIUOuuiz3rbwSuZ@google.com>
References: <20261028050615.259268-1-jaegeuk@kernel.org>
 <c87b011c-08fa-4e65-8b22-a6bf5a2efd5a@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c87b011c-08fa-4e65-8b22-a6bf5a2efd5a@kernel.org>

On 10/28, Chao Yu via Linux-f2fs-devel wrote:
> On 10/28/26 13:06, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > This fixes xfstests/generic/794, since the issue is not related to the
> > posix=strict mode only.
> 
> Jaegeuk,
> 
> Actually, I fixed this only in fsync_mode=strict because I don't see such
> scenario (described in original patch) in Android:
> 
>     Steps of generic/794:
>     1. write 4096 bytes to file w/ 0x5a
>     2. use fiemap to get PBA of first block in file
>     3. truncate file to 4080
>     4. umount; write 4096 bytes to file w/ 0x5a directly via PBA; mount
>     5. extend filesize via
>        a) append 4096 from offset 4096, or
>        b) truncate 8192, or
>        c) fallocate 4096 from offset 4096
>     6. verify the gap is zeroed in memory [4080,4096)
>     7. sync range 4096 from offset 4096; shutdown -f (flush meta before shutdown)
>     8. umount; mount; verify [4080,4096) is zeroed or not.

I saw your comment and I think we should not connect posix=strict to who's
using that. It was supposed to handle the myth of the recovery on rename().
This sequence looks general which seems we should guarantee.

> 
> Maybe we should only enable fsync_mode=strict for 794 to let it pass?
> 
> Thanks,
> 
> > 
> > Cc: stable@kernel.org
> > Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 8b4a7a9d7dbe..823df06ae0f2 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -74,15 +74,10 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
> >  					loff_t new_size, bool lock, bool writeback)
> >  {
> >  	loff_t old_size = i_size_read(inode);
> > -	bool strict =
> > -		F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode == FSYNC_MODE_STRICT;
> >  
> >  	if (old_size >= new_size)
> >  		return 0;
> >  
> > -	if (!strict && mapping_empty(inode->i_mapping))
> > -		return 0;
> > -
> >  	if (lock)
> >  		filemap_invalidate_lock(inode->i_mapping);
> >  	/* zero or drop pages only in range of [old_size, new_size] */
> > @@ -90,14 +85,9 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
> >  	if (lock)
> >  		filemap_invalidate_unlock(inode->i_mapping);
> >  
> > -	if (!writeback || !strict)
> > +	if (!writeback)
> >  		return 0;
> > -	/*
> > -	 * In fsync_mode=strict, when we expand an unaligned EOF size, we
> > -	 * should zero post EOF data and writeback the data immediately,
> > -	 * so that it can avoid exposing stale data after metadata flush
> > -	 * and POR.
> > -	 */
> > +
> >  	return do_zero_post_eof_page(inode, new_size);
> >  }
> >  
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

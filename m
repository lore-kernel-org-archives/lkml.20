Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4EB3BADB4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272740; cv=none; b=FULvzBhV9N+NfJvu70MP9s7jwfd3CFZuX7xgtuoee1CG2ctMVmM/CJ/CRFSp2Wei7HSx0vLLgA2Eye8TfCFrbWOSf0fvsHobZ2L0fhZoHgKOLNxD0C6VrAiVjXaQX+ZQQYwp1ob+73GrrAFnQ95rD9TyQazXp0nrntBVvCZK6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272740; c=relaxed/simple;
	bh=gswyYHgG6+cbNtDgGgjUv36ANWNguTy6txMhWw/9Q/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/57Ah5CjqjqRSH1eP0t0E+yz2fcrvlkKTxXFZPTFA4fPb8KPgMmZU3gqEyK96nGjMnp+hk0ZrQ1iLdNw7dxupxnkq13RGTB57wdVzc9wbEBoPWNKeQhqLmfpzOCklnwtEDRRxzsvPwGWTh7wxlyPBrj+bBzoPu0q58LxqHWjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1RHRwCa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1RHRwCa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a82223ca9aso199269a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272738; x=1791877538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeOABbw1AEMgbuUTv7+MYPnb9w8CsNeZNb8Vm/4uxnk=;
        b=A1RHRwCa44ZNdpi2+H8Bl6GS6qw9RDkRaQsaRJaqoZsdOGhLbkLOnWk5CwDcKq0NqK
         cQeVzIZPxHgXQKhOrRYaRGMyNTdKx3I1ms8zZqSEOx3hwMFFusTfsGs099lbp0gFWtaj
         N4SVKmgZP0e9J2RC3cm20tVxfiEldx9Y1ThMDiyGOhcFlbzGlLc63SgzvA3Z5rk/Tg/Y
         mX7z/cZbsjEV86CQVLNqYg+n2vph9g//6ueNQmlY5srpZKsFOndCPdc1+UD9wo+nduR4
         Ds56i4q7p6TBksK8pgyzp7r2xocA2ykHaJoRgI74f22k7qh2pOr6z8HBRrOwFq22bIkG
         yEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272738; x=1791877538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeOABbw1AEMgbuUTv7+MYPnb9w8CsNeZNb8Vm/4uxnk=;
        b=hGZEZk4ILA2eT+177RsEn2vQIz/rYrEYEbbeflvymiWK+q6CQ2xAkOHqhFdsorMEah
         9eB8bIPoxJY6E0rIg0rr3zd+1Du85mMQehItPL7aHfKPDQJ/OgC1lWFnHQQIDRGfnXPS
         h/efb7KJT869dsn9DydhlitH8D2IjKXV56ERYowujO87Yynx4q/RAfcbsloiBS264esg
         ItdUIGIFIgjPKbHybQFE+G3cRKHuGpbhmdW3n2IA66qtfmWEpOYdK6wsOicSm8hHjMcW
         flJJW2//pSK3v8OBkZA04NsvjAY3OeJ6wOWNnWGI3iybMKGXdav0qGXwqGELw7E650py
         2Cfw==
X-Forwarded-Encrypted: i=1; AKwUvBxBbViFc9BzPpJ5iBwuTmtFMj7r8e1DrFxECEDPpbvSJoG4u5/K7L0uZi0rQFGSZ0in9Bt4X0cTdzQwO3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYINFmpGGcQ/UyI0RRL20D7/W9QQINWdOK3LFjGj+ENRkTWIJWdm
	GMIrcNnyIgy/rglODBUQyblnR89pj55iNlR9a0jJ5kb3GrbDcrd2/vbO
X-Gm-Gg: AYBFou1SV7Gf9ItbKoxilYS2QllFwbTIpAJJlU1m3+PmyMXM7SK9QbI9LwJWrkiR6mE
	txTdrKhWSfyIRkgMSCJAXz0duUy2VwIOxlMrsBplXQIlustIyNNhvJ0vcuf9hi/2Q57QCdG4GKa
	cC2GS6gy7EhE7vqV479WeqN4s1aeKtfe/YqaCjMwJnh63PE+Y3aHlALEB5IG1RL04aAX62wo3UX
	EtsV8w2Rt7Y73F6RUjmMhbEth9MAjqQBheC5A+lFliEEvBxvoZr3kCjAMU5pyeAhmwuUmMllgx3
	LxJZ69xBtNFTVhvNGznGjaRZ5nCPKggjHCCYfaCer0v6HrkkQDkW4AzX6eZZgS/IkHN/rCZZuNN
	ih17+o+Thp8M32ixcxFsGy8s7k6IOyqf4D20bkuf0mbZVuwpmMNWwzXjzz0rtU2dXc4RTBK5Uyg
	HYkbrKTuG+qJiC7UVFN0pbCrlNuM6XbpeTEMa7mEqBB7BEhbTvHbO9CTmjblZ2
X-Received: by 2002:a17:90b:582f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3a87373d2f3mr388324a91.58.1791272738167;
        Tue, 06 Oct 2026 00:45:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85c7677ebsm1410530a91.3.2026.10.06.00.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:45:37 -0700 (PDT)
Date: Tue, 6 Oct 2026 16:45:34 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v4 2/3] ntfs: drain in-flight DIO before buffered write
 fallback
Message-ID: <asSnHv9NPHpFAxqS@hyunchul-PC02>
References: <20261003093035.532916-1-yaojiale02@163.com>
 <20261003093035.532916-3-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003093035.532916-3-yaojiale02@163.com>

On Sat, Oct 03, 2026 at 05:30:34PM +0800, Jiale Yao wrote:
> An asynchronous direct write can remain in flight after the inode lock is
> released.  If another direct write falls back to buffered I/O while the
> first write is still pending, iomap_file_buffered_write() can dirty pages
> before the first write completes its post-I/O page cache invalidation.
> The invalidation then finds dirty pages, reports a page cache invalidation
> failure, and records -EIO in the mapping error sequence.  A later fsync()
> therefore returns -EIO.
> 
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4.  NTFS has an equivalent fallback after iomap_dio_rw() returns
> -ENOTBLK or a short write, but does not drain other in-flight DIO before
> dirtying the page cache.
> 
> Wait for in-flight DIO before calling iomap_file_buffered_write() in the
> fallback path.  Since NTFS supports IOCB_NOWAIT, do not enter the blocking
> fallback for such requests.  Return -EAGAIN if no bytes were written, or
> preserve the positive short-write result if the direct write made partial
> progress.
> 
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
> 
>   Page cache invalidation failure on direct I/O.  Possible data corruption
>   due to collision with buffered I/O!
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/file.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 007d1614b9ac..8bbfa842889a 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -525,8 +525,21 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		ssize_t written;
>  		int ret2;
>  
> +		if (iocb->ki_flags & IOCB_NOWAIT) {
> +			if (!ret)
> +				ret = -EAGAIN;
> +			goto out;
> +		}
> +
>  		offset = iocb->ki_pos;
>  		iocb->ki_flags &= ~IOCB_DIRECT;
> +
> +		/*
> +		 * Prevent concurrent direct I/O and buffered I/O to the same file
> +		 * range. Wait for in-flight DIO to finish before dirtying pages.
> +		 */
> +		inode_dio_wait(file_inode(iocb->ki_filp));
> +
>  		written = iomap_file_buffered_write(iocb, from,
>  				&ntfs_write_iomap_ops, &ntfs_iomap_folio_ops,
>  				NULL);
> -- 
> 2.34.1
> 
> 

-- 
Thanks,
Hyunchul

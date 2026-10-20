Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464878;
	b=LwF+1zyqwCcndIDzDpfOiYsXkMRybvywtIXrTG8aWn1JOw5Tu4Y7/y3gP7y3d214nzMZ
	 yCOLj3PnBnlfKSAcvzGrbbrKucFGs/HuRdh4sT1Eu5DR6UcsrujwvMuROwiRCxx+RNktY
	 TlqKuF1XSI4cte4vZitCF5luErtKIGzIbQWx5Tl0hHZba+9dv/eMnTNTGE6PWrAX58Ju0
	 SeX8dXgD7xQyfiG/tOOhBq2fbJK4mlKxpKu5LxdKJ8k53hPukQOXeBipdabn9uysPWOgG
	 oNgSzbn+vJw/cGyuhxSWicty+k+PVKMMPnpT1H4KaqMpOhJhsDWqrwaKmOEyP6thyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
	b=lojRBUQ4thB/ho77ed0Fb/OJJXnH9pxLPRQH5n3l22HjWPt+YHeWWctsZB4XkgK81r2Z
	 zKPv7ru1lS263cdBfV11J82uTX0bOkeqfNeg+azLhjHuThSyLc9n28yZQf1LilZsJWpbL
	 o77Hx6/I4R5k7APonZgLu4eT/lNFvxLqonKq1bg1d2rIjRiKQunn4k0HV/wAArBRpRyib
	 2EYqxksjaCXP6b+uMqrv2SgwjeCo0GYSknznXdcKM3NnGL4nSmMwLVRB5lGFCWlUygNC3
	 6rUYtPdQHqDstkT9LU4SWnluP/o/6ejFiR9YmVR2cfXkIkMUc4GWENrC0swf0eEtpHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MDltKZ8o;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF58606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MDltKZ8o
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e608cd460eso15291255ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464877; x=1793069677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
        b=MDltKZ8oxZDweO8myubzzv38QuevbNdw6ARAwGnS2A5Sf9qxALlLW/RA7p9kt0rGxS
         CU34iBVZFHcRdwn0fxYBbc/n6Ialtk9T5J781UJYAF0xm/APpPXCZjDqJHU7hdEBbYfO
         pXNeHR1NjzhNrn/nO3uRbB1tJbpIlXNT1sBsk6YhgThD8p/II/Hk2LzgPa/SlEmtLzlI
         b/kw5ocfOmPcW/K6jFbefMNY3uV8GCE0S1RdsiK4MuG1qMUL/1Gb5kcWCum3/+9x6Ib4
         QvaCJSc9fhN6KAKR9yPQjAmfNQDbch+oQHvxPWY9IIkxNVFMHYmltS5N5EoNDjpFyTNg
         fbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464877; x=1793069677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHHMdux+IKbxsb4cqhar0LQ9q5oFKRSlwMjgy1dsTvg=;
        b=niwHetnG4WU5pw2x73Jgj02WasuJ4gkGz6lOXT+ESytFdR9vEz1qrOiyp5rKx2jEKc
         /hdmTaVpS+II8a5nu9SjHcrq+zV9NG58HGzhc51mmIR6bFQn8Eyk3R4LBSlgCprvSoig
         DRTQYOJyLJ4B43wJRww/yF8JOTnj+MVV7nUAWpK0VxHe5LzcxUYlRirUwJHiULY9BhLu
         fywvzWQSid+5sksqwHwTGQeJg6JzmY76AjjJc46pmYZU9KwV5IXRVShZ1//ykOEaIx5f
         qpIhIQEFUavm048+mLBwZI+CTKX04892xHJv4U7BDYE/DCf8q9Tl67lUTTozSkzGRfQY
         dXTg==
X-Forwarded-Encrypted: i=1; AKwUvBz+lkEBcljMSGYNFjAd8Sb/4e37uXQuykZYq/PtJDJYXUW/m0ykfbGHI1Pi11S0OFNFcioMtKnWHq8TDwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwDFkNeh1pgTRbfZq+w1WqzcxB2CQxlwrXPg36ZOhF0mzi4oYx
	2j8zBoD2V9ynH2IVwyqxr+8+rxagcU64X4nIrr16z3qY537B222m/nvt
X-Gm-Gg: AYBFou2mlMzLZUNdPyDGasvl1cDLeXkQxRCIJUQIEU2cT027dRqBZyVHBrZWLJkrdq9
	w95jUstxAjUikTRV92YyFT+Qj2WzA6go5EsZf8RuqyM28e4CwA0BG4xWVEtOuaPF9DedxqJj36f
	QUSxqKZIguLcbyiKwtZN0wneHeF5WDsX+u+RYmYphyH+eHmsaNvyusWZ6gbVxhyl6zvxW3kNbOk
	0/orykbcgZYfhWWl2hhN0M8i98980m1M0L+ygJvGQBTy/SyqKEjELNqMR9VbtGoq6/xXTaZrvEs
	shiLyubvkCTkZVbslL+ZQQPerLclegihHfbmAwu+90Y+tCCxpvKwOkiM8juATotf+XcID9qtclZ
	sX5h0qUcMqvryFvW+oVTy+XsGkUs0n6cVQBiWF7Il6DVPPccx4wpGtLXpYgTXXR2VfwA8/3lrg6
	2D/++c61jSxbcwMURep6PFRdMGizUEyXiZVQ8OChdxlnzSqD0z2M5IIPiJrX6b
X-Received: by 2002:a17:90b:2790:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3acef153994mr7234905a91.50.1792464876928;
        Mon, 19 Oct 2026 19:54:36 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60bf2039sm1776689a91.1.2026.10.19.19.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:54:36 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:54:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v2] ntfs: handle a failed size rollback in the write
 error path
Message-ID: <atbX6ZAHk8U4Xsuo@hyunchul-PC02>
References: <20261019064918.152859-1-zenghongling@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019064918.152859-1-zenghongling@kylinos.cn>

Hi Hongling,

On Mon, Oct 19, 2026 at 02:49:18PM +0800, Hongling Zeng wrote:
> ntfs_file_write_iter() extends the data and initialized sizes before
> it copies the user data and restores them when the write then fails.
> The restoration is best-effort: both results are discarded, even
> though the extension is already recorded in the dirty MFT record.
> When the restoration fails too, the extended sizes reach the disk
> while the VFS inode keeps reporting the old ones: after a remount the
> file appears grown again, with an uninitialized tail where the failed
> write never put any data, and nothing records the failure.
> 
> Keep both undo results: on failure, set NVolSetErrors(), which the next
> persistence point persists as VOLUME_IS_DIRTY, and log a message for
> the errors= policy.
> 
> Fixes: 9c87959601e8 ("ntfs: update file operations")
> Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Changes in v2:
> - do not roll the initialized size back on a resident data attribute,
>   where ntfs_attr_set_initialized_size() always fails with -EINVAL and
>   the data size rollback restores both coupled sizes.
> ---
>  fs/ntfs/file.c | 46 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index d810ca5904bd..597fd70ed30b 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -934,22 +934,50 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> -		if (ni->initialized_size != old_init_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +		int undo_err = 0;
> +		int init_err = 0;
> +
> +		/* ntfs_attr_set_initialized_size() rejects a resident one. */
> +		if (ni->initialized_size != old_init_size &&
> +		    NInoNonResident(ni)) {
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>  
>  			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);
>  			mutex_unlock(&mrec_ni->mrec_lock);
> +			if (init_err && !undo_err)
> +				undo_err = init_err;
>  		}
>  		if (ni->data_size != old_data_size) {
> -			struct ntfs_inode *mrec_ni =
> -				ntfs_base_inode(ni);
> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
> +			int data_err = 0;
>  
>  			truncate_setsize(vi, old_data_size);
> -			mutex_lock(&mrec_ni->mrec_lock);
> -			ntfs_attr_truncate(ni, old_data_size);
> -			mutex_unlock(&mrec_ni->mrec_lock);
> +			/*
> +			 * ntfs_attr_truncate() rejects a compressed one.
> +			 * Skip it also after a failed initialized size
> +			 * rollback: the shrunk data size would stay below
> +			 * the initialized size, which the loader rejects.
> +			 */
> +			if (!NInoCompressed(ni) && !init_err) {
> +				mutex_lock(&mrec_ni->mrec_lock);
> +				data_err = ntfs_attr_truncate(ni,
> +						old_data_size);
> +				mutex_unlock(&mrec_ni->mrec_lock);
> +			}
> +			if (data_err && !undo_err)
> +				undo_err = data_err;
> +		}
> +		if (ni->data_size != old_data_size && NInoCompressed(ni))
> +			ntfs_warning(vi->i_sb,

For compressed-file, the code only emits a warning, which causes the
VOLUME_IS_DIRTY persistence to be bypassed even though the MFT data size
remains expanded.

I think that we should report the compressed rollback as an error.

-- 
Thanks,
Hyunchul

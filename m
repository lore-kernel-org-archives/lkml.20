Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DD37C91E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266020; cv=none; b=qYG6R366BIw7c6Au0b7aL3un5QIM/7z5LCgA4P5BjHWAO8ToX25+93Xsf0zl8FxjLcVDY9KSZMS9Z1QEUs3U0EW9qmpT1/MjZamV/lCOJP9+yr+sIkyehklOstvQ9ZOBia7dxpOdbyrq9YN0RL9vYyVZDHZDpZHNS1xw92pQ488=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266020; c=relaxed/simple;
	bh=My/fORUKZgbhPcKtFojcsvPV7jhgh3rAkw1XdxaJxA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIp1vkfkr/lUMQVf0EXTq0nfxNYLbpizF39y756H6rGiN6g+N2R1oUTmCPsJKk17EjvB9rWnLZIUB39bOX+6OAYJNXTvT+HwVMMWhF/o5hw8+KhvUYbCL+HT/Y3f8L1VrziIdazmRRtNSCa9gLFG576PiIh7ht0mqRzmgFW8EpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZt8sXrf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZt8sXrf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so755497b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266018; x=1791870818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aW12SFpvFc1iSA1EJus8VaKRrWk8UTqkcWWYajxdsok=;
        b=PZt8sXrfKcJp5umO4oD75QermyAgOciQgyEumVCI4VuBQnS9CMjR0kN3fkZuQaVify
         sIfGdqhrl+NoYhAr+pqbnI1Qk8E1CDgjsxKGBFe/8OrBc9Pq8H25U17MUa8RsEc9wTUr
         9+a6SNyLlW2cA8HXKkvualrZ/k57E+Ebj8Q6A8PsN43yOAR4xg/E3e94CSNOIf4PMbt0
         HiARI04fTNEHjhwVcQiNovVYrVgYYbjN02BD3zguMN2NjPf/z1CbsyoTHgl0WKBrZUXu
         yQKyBlMmz9BGmtDLKCLzZo5Key2cVQmlwX3MQ33hquaQo5WvZQf9GvE31tzRkERLNrDz
         wagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266018; x=1791870818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aW12SFpvFc1iSA1EJus8VaKRrWk8UTqkcWWYajxdsok=;
        b=bANQet+jxcxdOz3ht6q08a83OKeeTkciN1xuwGjAEeWs90hF8TU4Ghif/HW/bMREej
         h4Ppn8DqmZm/IN7EZSU+4dZOqswLTuYKuUgNIGnGBcdW9AURGx/Cp+ukVwnPtpY142Gl
         787ta1sgK8+xuo9Q3jhUKUADjfbKqWMe+YZ7zmMGKYnS/raKH92M0KrTjGowVvlryoGQ
         Aee/5yjCYAO3owjJ6Hzdysd4mPuf04WZLNkMdm2dv4MpI2XbCr9H+M0KvwPfRXeWct5m
         0qee0BulBAJGoaZzes7JLCxus/3IJo70MXRFZv/xcgrgjMbI1M8m9CoZ7/h1InNgYJrG
         phKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzia7F8he83B9Tykrgs39r02yYgfjaUqarxwabgMbbjj/cdadQi5WBOifFGzLQMzVWltneUTxXl/n2iqiU=@vger.kernel.org
X-Gm-Message-State: AFuF++kvK6wgDYCiz3cMkxz4z9qyO9FazjuVhGhZgnKjChsymDy5rlzg
	Nl4ES+M7qtIe6MI2NxTwsMWCOgp14RhaNkFWZAlFAYzJpkYD5jWkG87K
X-Gm-Gg: AYBFou3wMbjg639fi/xtOI8E51jXQ3wxNf75FTbdrQi5x4C450Dyn+mXWc0JzNfbYQo
	KzkyP2b8izF4S3CoogkGDAKJOB/Fq37Wy47VrPojJ4txBooXuV6AqApsGD6suLi3UigdAEeKcgR
	tRH8j9HdZSVhH28zhkgMEycGHk+eFdc+WhPn0Ib6QP80YtpQ4Mmfp+UHV219HJGH25h0HnWYPKJ
	qpQlx/t7Od/DTi9rYD1L0hTt4v5r+Yv8JDKZXJSK9/3G3DNVA8QWcqSKuiowfoaDI0ObE7qLWAb
	ByoxSpIeoIcXXBLZ4OV+1ioiFQWZ4lzFpC6BYC0nuPXiczIxvnRQc9FUN+1ZVjeM6DgPxweX3f6
	1Lm0M0zKo0LXLfsbxarpt5KZBYpjJ8hWGiavbXE+5N4nSXQUzrR6DWtuNMWiS7oHkRxw9DYcBO1
	kEoVrJWSUBGWYlT0Vxz50yioOQdGeL0t3zxWIli9tZAs7JDeRsN9h1aR8vYR7XZmdpt4MAG7M=
X-Received: by 2002:a05:6a00:2d8b:b0:882:94ab:20f6 with SMTP id d2e1a72fcca58-890dba87bd6mr367008b3a.1.1791266018130;
        Mon, 05 Oct 2026 22:53:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0cb76185sm4247213b3a.46.2026.10.05.22.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:53:37 -0700 (PDT)
Date: Tue, 6 Oct 2026 14:53:32 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH] ntfs: handle a failed size rollback in the write error
 path
Message-ID: <asSM3LZyQymjjuj8@hyunchul-PC02>
References: <20261004024822.640574-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004024822.640574-1-zenghongling@kylinos.cn>

On Sun, Oct 04, 2026 at 10:48:22AM +0800, Hongling Zeng wrote:
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
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  fs/ntfs/file.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
> index 3ec82715a588..b5b30e44ac51 100644
> --- a/fs/ntfs/file.c
> +++ b/fs/ntfs/file.c
> @@ -678,14 +678,39 @@ static ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  				&ntfs_iomap_folio_ops, NULL);
>  out:
>  	if (ret < 0 && ret != -EIOCBQUEUED) {
> +		int undo_err = 0;
> +
>  		if (ni->initialized_size != old_init_size) {
> +			int init_err;
> +
>  			mutex_lock(&ni->mrec_lock);
> -			ntfs_attr_set_initialized_size(ni, old_init_size);
> +			init_err = ntfs_attr_set_initialized_size(ni,
> +					old_init_size);

I think the rollback needs to distinguish resident and compressed
attributes.
If the data attribute is still resident,
ntfs_attr_set_initialized_size() always return -EINVAL.


>  			mutex_unlock(&ni->mrec_lock);
> +			if (init_err && !undo_err)
> +				undo_err = init_err;
>  		}
>  		if (ni->data_size != old_data_size) {
> +			int data_err;
> +
>  			truncate_setsize(vi, old_data_size);
> -			ntfs_attr_truncate(ni, old_data_size);

> +			data_err = ntfs_attr_truncate(ni, old_data_size);

And ntfs_attr_truncate() always return -EOPNOTSUPP for a compressed
attribute.

> +			if (data_err && !undo_err)
> +				undo_err = data_err;
> +		}
> +		if (undo_err) {
> +			/*
> +			 * The extension is recorded in the dirty MFT
> +			 * record already, so a failed rollback leaves the
> +			 * new sizes on disk while the VFS inode keeps
> +			 * reporting the old ones.  Record the error: the
> +			 * next persistence point persists it as
> +			 * VOLUME_IS_DIRTY.  Run chkdsk.
> +			 */
> +			NVolSetErrors(vol);
> +			ntfs_error(vi->i_sb,
> +				   "Failed to roll back the size update: %d",
> +				   undo_err);
>  		}
>  	}
>  out_lock:
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul

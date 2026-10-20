Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505506;
	b=P7FRhq797O+7+GgZBsvvZJxABDc9NUBNzIthmiO7jbS8MX7LmdOy6g868e7MDdua+Xro
	 4zw73RMI3ILFf6OxYsXrhzkgohWyRI/VP6B+t/8faBe45ve4Pnq++tZUcXiHjLFYSgAJs
	 2kC6Ad4VAUffHNSpyE60We7mHXtTuBRHJfAU2yvQBcpLh0rfx+n6gud3tLl9i3sKEfutq
	 4Br0KeyB7Mf5jKy4v7k3ovY5Hmps4Iyho6CvV0KzewFaQmx6Cz5lAcmGBcJ7zIRX16qMY
	 QYNtJTpMcwSt5rOLffKwwfWiJEN42vQ9GvWi9F1l43QdnyNbO2tlGnWozRay/iuc7Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
	b=ht+uztMzXoO/C8UeBjpvsoroicp2DV4B9DhzEY2MH17KzizmhwxbyX4jnQEtvZQaF1Pp
	 RQIobcKBKKDDbtt8W94LQ643F+r8K+usy1T1I96BmvZFxtj2Yp2+ThcxuiSLF73bhZb0t
	 PBsl/xH3B2XSkCeFHof3z9YKJyC4RxDwwfK+E6WygLEccqPacx5+563E2qYl6PyekQiOB
	 DcHeuOc+nh6rBoKW1x0I+DAgEavAP5a2qvgEEscEVOYsT4dDQLB9RF+nMHiHq7QyN7m8H
	 17EGMSciMtecuTmYbzuqG/hXgCBpNfU1BWGG92G8YUybENAUNZUudR/69stLE46qhnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CQqZm4Qq;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8760A4AFE
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B8760A4AFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CQqZm4Qq
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91beb36fcc6so22788476d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792505504; x=1793110304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
        b=CQqZm4QqzQBrGwRTNeTgjajTHWY5MaTuXaVA+ATI86hSLgiW1FB774vgWc3O4miO5t
         fu41DHQSSTmYMD85XbQQElBqDVXE7y1HvgWF2Jnyn9+tI8gPRSkb5b5emYx+EvwCQEkg
         EIUtsg7/v32JJRMZaanidELXfEvOYzZLx3LdxawrZ31IoABDmkiXrX14xkm2e4ZVZzN2
         10ce2wsbzecI0sAzpvZnMoBjlaIAUTWDQvssIUFvmK1nZgrPFZmue7SkHG2a0RSAdD6P
         bkHTA74GoHxzI2exBgb7i6elGN8KPdFaJ3ZAq1enl1BGDRTl21oSlZ6rGxb/3xY081Rw
         17UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505504; x=1793110304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phh2bd3K2u8/kNcJb+pNLZuDiJF2bTQud6vADUqieMI=;
        b=BxOkzei0wBU1TEXQaKUSt/eY9nUVHxLy9l4ggxadccFgZpSCG9QHPkj62lwMFefAYW
         4zE6pn+XFaLMUq2/IGYTjg+Ou3PqZQjWPRVrEEs+JzJFbcNAViE5c4PHO9XnoPMnZOVj
         666i4to2ST65SpyRg5NM/Ng8ysq3f3CF+gXu6YsArldYaZb+4Kw0088yJU7h4tSJrU+P
         hwNnzg2+JYitYqAiGho8uDJwFntwEMinXogJMaz7gs+yRaJp3uB3u9QHse6eD2U/CxaQ
         sdUE1t7tr48BA4IwkIwjoX14anfmyBaPoUQveSow6pFCy+aUwZ4ldgG13MPyCluseZ4i
         FSNA==
X-Forwarded-Encrypted: i=1; AKwUvBxa07MTucEETL+Ur+TIl0K+FpknAlwCcqvYBpai3rnej6BxcJMTYcg4l9IcZ1A+l+YVZIgdTeGrhTyKgCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0qtOBWuAVo60S7rBtjIawYpBhb/WTieG8W1RSgvYl+ZI6NYWj
	V8EDo3k94dOGQNbbC8OC6uFa85zJi+DgDPZ2xx8w2gJF4sGcQpKpv0EF9wfSCqCaIw==
X-Gm-Gg: AYBFou14u415W71tw6fnSwmqtKGqYbG6wdvbzC3kEhKKcBxyt/6Pk4V/Gl/PhjlIt0b
	5pa9mzkGc1pheCAVt/BMJYR3nP+3wiyW3ZskoCUueoEBPi/U7k0HrUCGiM961cgY34RWTW+4Yul
	u9A2485u489aGth1WpdZAHZk9f5mdZ7VHUr3dlgwajapo4RQl0RcP9XugMXOLbFGEtDBVFrVRbm
	V1ZlF6WVtoSpqjJkqOZmfoDSkE16faT2neZLRUxqcbEjXWX8j2NNqpiwiMrSBZ2ir9UwKACXZfH
	h3umeJZKydfJpv5RrlF1lY5ftjMyouuPS6RMypLurH9DGt+gXLQxMSZBwFXO+3G3CG8AWaTYdjH
	o0S9hHNjrKIdKAHW4esV4P6GqhkKqgTgJACNF2cG2g7LakIetXHF3qFJ2zOV4P5u6hViC7Cg9T0
	tmxJ3hU8NaGOQIXMxScmJhV/7ErecuWPCjysDMgdyNgxqtYpLEPzygFzbRP962BAJokdlZvkE=
X-Received: by 2002:a05:620a:4042:b0:93e:920c:c012 with SMTP id af79cd13be357-93f29b7f9e9mr1754715285a.10.1792505503808;
        Tue, 20 Oct 2026 07:11:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b05e2f3sm228265585a.8.2026.10.20.07.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:11:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:11:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: take filesem in nofua
 store to fix backing-file UAF
Message-ID: <3f13c0d1-0e3a-4a62-a149-4c719ee3cab5@rowland.harvard.edu>
References: <20261018130519.65850-1-yuz08559@gmail.com>
 <20261020023050.87701-1-yuz08559@gmail.com>
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
In-Reply-To: <20261020023050.87701-1-yuz08559@gmail.com>

On Tue, Oct 20, 2026 at 12:30:50PM +1000, Yu Zhang wrote:
> fsg_store_nofua() syncs the LUN's backing file when switching from async
> to sync mode:
> 
> 	if (!nofua && curlun->nofua)
> 		fsg_lun_fsync_sub(curlun);
> 
> fsg_lun_fsync_sub() dereferences curlun->filp (vfs_fsync(filp)). Unlike
> every other store that touches the backing file -- fsg_store_ro() and
> fsg_store_cdrom() (down_read), fsg_store_file() (down_write) --
> fsg_store_nofua() holds no filesem while doing so.
> 
> A concurrent close of the backing file runs under down_write(filesem) and
> does fput(curlun->filp) in fsg_lun_close() (fsg_store_file() with an empty
> path, the SCSI START_STOP eject in do_start_stop(), or forced_eject), so
> it can free the file while fsg_store_nofua() is dereferencing it:
> 
> 	BUG: KASAN: slab-use-after-free in vfs_fsync+0x20/0xe0
> 	 vfs_fsync+0x20/0xe0
> 	 fsg_lun_fsync_sub+0xa0/0xd0
> 	 fsg_store_nofua+0x138/0x160
> 	 configfs_write_iter+0x1a7/0x250
> 	 vfs_write+0x5df/0x940
> 	Allocated by task 3459:
> 	 fsg_store_file+0x150/0x1f0
> 	 configfs_write_iter+0x1a7/0x250
> 	Freed by task 3459:
> 	 __fput+0x456/0x6c0
> 	 __fput_deferred+0x10d/0x330
> 	 fsg_store_file+0x9e/0x1f0
> 	 configfs_write_iter+0x1a7/0x250
> 
> Hold filesem for read around the fsync in fsg_store_nofua() so the backing
> file cannot be closed underneath it. The lock is only needed when the
> fsync actually runs, so it is taken only in that branch.
> 
> Reproduced on a mass_storage gadget over dummy_hcd by writing lun.N/nofua
> (1 then 0) from one task while another task rewrites and clears lun.N/file.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>
> ---
> v2:
>  - Use guard(rwsem_read) instead of a bare down_read()/up_read() pair
>    (Greg KH).
>  - Take filesem only inside the branch that actually calls
>    fsg_lun_fsync_sub(), not around the whole function / the
>    curlun->nofua assignment, since the lock is only needed for the sync
>    (Alan Stern).
> 
> v1: https://lore.kernel.org/all/20261018130519.65850-1-yuz08559@gmail.com/
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 8 ++++++--
>  drivers/usb/gadget/function/storage_common.c | 7 +++++--
>  drivers/usb/gadget/function/storage_common.h | 3 ++-
>  3 files changed, 13 insertions(+), 5 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index b7b06cb..6712566 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -2663,8 +2663,9 @@ static ssize_t nofua_store(struct device *dev, struct device_attribute *attr,
>  			   const char *buf, size_t count)
>  {
>  	struct fsg_lun		*curlun = fsg_lun_from_dev(dev);
> +	struct rw_semaphore	*filesem = dev_get_drvdata(dev);
>  
> -	return fsg_store_nofua(curlun, buf, count);
> +	return fsg_store_nofua(curlun, filesem, buf, count);
>  }
>  
>  static ssize_t file_store(struct device *dev, struct device_attribute *attr,
> @@ -3239,7 +3240,10 @@ static ssize_t fsg_lun_opts_nofua_show(struct config_item *item, char *page)
>  static ssize_t fsg_lun_opts_nofua_store(struct config_item *item,
>  				       const char *page, size_t len)
>  {
> -	return fsg_store_nofua(to_fsg_lun_opts(item)->lun, page, len);
> +	struct fsg_lun_opts *opts = to_fsg_lun_opts(item);
> +	struct fsg_opts *fsg_opts = to_fsg_opts(opts->group.cg_item.ci_parent);
> +
> +	return fsg_store_nofua(opts->lun, &fsg_opts->common->filesem, page, len);
>  }
>  
>  CONFIGFS_ATTR(fsg_lun_opts_, nofua);
> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
> index 75831f2..51a70f2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -415,7 +415,8 @@ ssize_t fsg_store_ro(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  }
>  EXPORT_SYMBOL_GPL(fsg_store_ro);
>  
> -ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count)
> +ssize_t fsg_store_nofua(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> +			const char *buf, size_t count)
>  {
>  	bool		nofua;
>  	int		ret;
> @@ -425,8 +426,10 @@ ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count)
>  		return ret;
>  
>  	/* Sync data when switching from async mode to sync */
> -	if (!nofua && curlun->nofua)
> +	if (!nofua && curlun->nofua) {
> +		guard(rwsem_read)(filesem);
>  		fsg_lun_fsync_sub(curlun);
> +	}
>  
>  	curlun->nofua = nofua;
>  
> diff --git a/drivers/usb/gadget/function/storage_common.h b/drivers/usb/gadget/function/storage_common.h
> index 11ac785..347a86b 100644
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -210,7 +210,8 @@ ssize_t fsg_show_cdrom(struct fsg_lun *curlun, char *buf);
>  ssize_t fsg_show_removable(struct fsg_lun *curlun, char *buf);
>  ssize_t fsg_store_ro(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  		     const char *buf, size_t count);
> -ssize_t fsg_store_nofua(struct fsg_lun *curlun, const char *buf, size_t count);
> +ssize_t fsg_store_nofua(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> +			const char *buf, size_t count);
>  ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>  		       const char *buf, size_t count);
>  ssize_t fsg_store_cdrom(struct fsg_lun *curlun, struct rw_semaphore *filesem,
> -- 
> 2.43.0
> 

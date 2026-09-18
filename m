Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C272749DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716574; cv=none; b=DPQYCf6gzg4VeTyUfieEtxRf7cYaM2hKuTokV7/vnUOJcfjaF+C6oIchi0IBSoC/xAUM75PeEWG8gGrIlxg/LDNlALYx6JqCCPvb0ND5ViMHtMuRx9JuNu6ARjYB2MwOO7njN8y61mHqGUcXFDbAggUz8UlKXJTr66TXWnFQgrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716574; c=relaxed/simple;
	bh=WDDrsj3MP/rvTsNgD+qJqzzVmh4M8SD67CGugJwWT8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YRFgno4R0dJD4SV7uzZTa0SKdSlRdCYKttZ2Ie0hzGNKxNAr12WSlvYfTqP8i4pmrmBGqMqgfpTCZd8M3SoIiM1/3ehbfFNC5ZFns3FwjG7mE7nkKjVUtTMpyn2GYWXwJ7wbbSA0awNc69gJRlnOQiOx0IfkwlleDEugE8DzSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDUw60TG; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDUw60TG"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso203038f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716566; x=1790321366; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Vu0EvQrpbLKC29N+ScN0xiwtkq+vrGuM1q8m/KsCcg=;
        b=PDUw60TGiqW73o9UVfcPA3/sg5xgUG9ne1AYaMML7XJ3D6stHyKMgW8gYm2gDGALXS
         14x9JiD3+nlOpZC9MmezNBks2MONTg5xw45DiJO0hOopu2MqarsVHFe5D1HgNcEvDoAj
         RE+hakAJt6zsQzC2o5t5QQZS3wtvXLhofKQ+JCSwhda3QKy44ipJmZcu/aHKtOtEnre/
         SCOg2qv7kAFdr+KwKYM3HlGviFdAq7C7u/AqGZ46ikcmpHIPJTmmoEWhDC1cPdZWrSzt
         kQPSQy8rUpsrWE3NYVnnOMOhpdvVtcliOwhC+ceqxkAYgGRNzvQRqhq9yWqkfAqgLyuq
         Mmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716566; x=1790321366;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Vu0EvQrpbLKC29N+ScN0xiwtkq+vrGuM1q8m/KsCcg=;
        b=vY2b6/wAywjFaSvw5Jzhgo1tK/ki/Umxg9dzySZj03XfFVOS0ALVWNNOeOV9wU/Zwa
         8Qqn1i0nqkRHqHMKLOeeXfJcDP8VaP/iZjJKswxUxK+Ctl6F+0BMnuk6sVCPt3lGngYQ
         HPwGxBrqJBCEkkd239PcnWZieieDkgqQ9wSTRiAQREfJAkZiIM2WDTEsObJi9C+9zmXS
         X/qc6dalT5hwFSBwjntczFgEF69kN1UMR508JtJSbqdNueylGqGsGh/IIB+vxh3Luc3v
         O857ufVfTzybs00TYWEikYwgyv52PQbLUWSDLR6aYrlL5jqN7m67c/g5/NheOXPbgpaf
         YzWg==
X-Forwarded-Encrypted: i=1; AKwUvBzOQLpOKoj9114rirl/4mYKVZc2F6nNlDuwoRUDhFMiiaCVlj4trsEP01w656Xhp7UhK6GAgcmpfQfB/Lo=@vger.kernel.org
X-Gm-Message-State: AFuF++mGF953Tdr+Ao5X54dzdFK8Is4ZmiHJIiMztsDEvX3cG3Bxbajr
	pXSx1TEPH+4EcA3/1aQ0UV+pHNoEtbCshyRP5SurOLEE/UvKzzP2KZS+
X-Gm-Gg: AYBFou26YNdlt+jqs12qJjvUfo2+l+CH1yDgwj1T8Xlg/wYHyi/Zo8mH4kM+tUhde/0
	q7tPSoq85aj/MunP4t+nLo6GFKreq03jZMI8NrjH3UYahuVnOnseIJi+yvVeXn3SY5hevcAO+P7
	Naw3A748tgw5we6mKwCXwpOlOU/mfnlILRxXQQfSG1BkjUvYBguHueWA1rO8BTdz3dr0Y5PwLCF
	D2+pOzCaOosv8egvSnk1CO5xNgBej8QDwRNpEYAFEHmCu9VYvpTIsAdol0pE6+RiMDFghjLjkmS
	Jqt0IWg0l/jhw4/6mdCZY5wdx6mJQgUXgReoOm60n2ctctH9C6Ul6UhYqAhaEC/1N7crCOmRn2l
	sQfXAECBEzEehNKfprJ2RL+xXcZ9n7RJIV6jiJYKm+Y5mwLrmBk3x+OHfUF5XFBLuEJ+GksmqRM
	w2EtcyeVxDjGnf9KiuHKpQPUv/3TWS0xcPDFUSEjp8kstZ7AGalgCBSsjs+MWjW8ZDqJItxOQv1
	0hCSCQebPD2wj7vxWEdU3WWKhcsJo/iZu05irH+DA==
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be7mr35269585e9.14.1789716565774;
        Fri, 18 Sep 2026 00:29:25 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([2a02:3037:31e:59ba:f5a3:393a:4cdc:d23f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm27323855e9.8.2026.09.18.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:29:25 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, song@kernel.org, yukuai@fygo.io,
 xiao@kernel.org, magiclinan@didiglobal.com, eadavis@sina.com
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 chengzhihao1@huawei.com, yangerkun@huawei.com, yi.zhang@huawei.com
Subject: Re: [PATCH v3] md: Fix the null-ptr-deref of 'mddev->private' while
 submitting IO
In-Reply-To: <20260918070900.1945351-1-chengzhihao1@huawei.com>
References: <20260918070900.1945351-1-chengzhihao1@huawei.com>
Date: Fri, 18 Sep 2026 09:29:23 +0200
Message-ID: <m233v7586k.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Zhihao,

On Fri, Sep 18, 2026 at 15:09 +0800, Zhihao Cheng wrote:
> Concurrent processes md_stop and IO submitting could trigger a
> null-ptr-deref of 'mddev->private':
>
>  BUG: kernel NULL pointer dereference, address: 0000000000000070
>  RIP: 0010:_wait_barrier+0x2f/0x250
>  Call Trace:
>   raid1_make_request+0x150/0xf50
>   md_handle_request+0x104/0x530
>   md_submit_bio+0x76/0x130
>   submit_bio+0xdd/0x250
>   submit_bio_wait+0x1f/0x40
>   __blkdev_direct_IO_simple+0x1f6/0x370
>   blkdev_write_iter+0x3b2/0x520
>   ksys_write+0x7d/0x190
>
>               P1
>   fd = open(/dev/md0, O_RDWR)
> 	                      P2 (forked from P1, fd' <= fd)
>   write(fd)
>    submit_bio
>     md_handle_request
>      raid1_make_request
>       raid1_write_request
>                                   ioctl(fd, STOP_ARRAY)
> 		                   mddev_set_closing_and_sync_blockdev
> 				   // check passed, mddev->openers = 1,
> 				   // because md_open() is only called
> 				   // once in P1->open
> 				   do_md_stop
> 				    __md_stop
> 				     mddev->private = NULL
>
>        conf = mddev->private // NULL
>         wait_barrier(conf, sector) // null-ptr-deref !
>
> It is a common problem for raid0/1/10/5, and __md_stop could be triggered
> by several paths(eg. ioctl, sysfs, ->dtr). Fix it by replacing
> mddev_lock() with mddev_suspend_and_lock() for all __md_stop() callers.
> The caller dm_table_destroy() is guaranteed being invoked with device
> suspended, so raid_dtr() could keep using mddev_lock_nointr().
> The caller array_state_store() is guaranteed by the check
> mddev_set_closing_and_sync_blockdev(mddev, 0). For example, someone open
> /dev/mdx, write something and close /dev/mdx, it won't trigger the
> problem, all dirty pages can be flushed before mddev->openers decrement.
> Besides, fail the submitting IO in md_handle_request() if the
> 'mddev->pers' becomes NULL.
>
> Fetch a reproducer in https://bugzilla.kernel.org/show_bug.cgi?id=222020
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3fe892ea5fc292e1353f
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  v1->v2:
>   1. Add 'mddev->pers != NULL' check before make_request
>   2. Delete dm-raid caller(->dtr) modifications
>   3. Move memalloc_noio_restore after mddev_unlock_and_resume
>  v2->v3:
>   1. Remove modifications in array_state_store()
>   2. update commit msg
>  drivers/md/md.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 680b34a63cb3..e73338c26d53 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -414,6 +414,20 @@ bool md_handle_request(struct mddev *mddev, struct bio *bio)
>  		if (!percpu_ref_tryget_live(&mddev->active_io))
>  			goto check_suspended;
>  	}
> +	if (!mddev->pers) {
Isn't this case already handled by md_submit_bio(). take a look in
md_submit_bio()

> +		/*
> +		 * The __md_stop() sets 'mddev->private' to NULL during
> +		 * the IO submitting, check 'mddev->pers' before the IO
> +		 * being processed by specific driver to avoid the
> +		 * null-ptr-deref of 'mddev-><member>'. The check is
> +		 * safe because the IO has got the 'mddev->active_io'
> +		 * reference, and all __md_stop() callers will wait for
> +		 * the reference to be zero.
> +		 */
> +		bio_io_error(bio);
> +		percpu_ref_put(&mddev->active_io);
> +		return true;
> +	}
>  	if (!mddev->pers->make_request(mddev, bio)) {
>  		percpu_ref_put(&mddev->active_io);
>  		if (mddev_is_dm(mddev) && mddev->pers->prepare_suspend)
> @@ -8299,6 +8313,7 @@ static bool md_ioctl_need_suspend(unsigned int cmd)
>  	case HOT_REMOVE_DISK:
>  	case SET_BITMAP_FILE:
>  	case SET_ARRAY_INFO:
> +	case STOP_ARRAY:
>  		return true;
>  	default:
>  		return false;
> -- 
> 2.52.0
>

-- 
Best Regards,
Abd-Alrhman

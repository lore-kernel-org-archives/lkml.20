Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF924B5143
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719667; cv=none; b=Am4kUbk+y7ofic1fmi41NiQXAvkMVeqNG/2FGjlBwVkANWurilSfEx7t5x1jOBga55zZhBXLp1Y2Bwq32BSLp5Sen89eddvNqbHPdCp8NrZViAzbtuZxucroecqrcfdiY2nvqtoRLY7ASOMsX7DxzhPu5MwBZNpmKr/oysTCdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719667; c=relaxed/simple;
	bh=a+Fv/LhlsGDlYUXr11vVrXGMImIXSraeA6GsKpVzO3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sEVvLd1248TNxCugxNA3SIPX2I6BOakY9o+vHUZtmqtyJWHxP3F/2FzpjvVzHgx3DO/vz9SetH/1Bi+q/T1cm28RoXH/2kRvyL8jklhLoeb4Z6WrjPHLPyYQRft0vQ9Xz0tPwkTVXLHlnj4ORBbdIF5kKB7Kt/QqldXgbY35OQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYKOMYQR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYKOMYQR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so2366715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789719662; x=1790324462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzgifFIg7S25Ffg0TAIgdejFS0cnX9a6flhsQgy5bEc=;
        b=RYKOMYQRXS3MgsKLWCbIVE81Kbpa14nl7xP6jeMRZNG+kGJZt+YH909mSoPfscZ2rr
         QVSW9PxodXzEK+i4CBpg/2b0mm/bdj6JkLUMFZHZ8vsFZMeobrzPKdtQreRdzve6vN8d
         m2QeUKs9XBT+hx8K5qIIDVYGSmdhG2zXdgLpuD68n1eKoLH546JutOA2xAR5EsfQ3W2+
         oW23wMU5LWInjpnvLXMwLdqlNP4aVrnNi6f96W7JY+1Dm3VgJXwSmZteIQJBb5dRvu0S
         07chN7/cViPjQlaLNgIolUG/2F/YkpU0se7SugXpjkR+TmQQZKZMaJTuYBd02v3h965+
         Jk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719662; x=1790324462;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzgifFIg7S25Ffg0TAIgdejFS0cnX9a6flhsQgy5bEc=;
        b=aezqPOIr4LaPZZZqUANGBFGLye42PLQXrCmXTS+/CfBx1mMjtU+oKpXOpx1E3ikksh
         omRaJN1n9o54zpFfrx1pspLcktrTyA1jAESIbXpp2INc0XQG+6ifLXtelnOZG7HpKJDq
         O2a8VVXubQXi3jqUJn7EKtVwMZ/C1qPCGhDslMdYUtj8OOlt/BzyfIYOj7EVpVmv6Vf0
         8+9h/dFfzucZR7x/G6nR0xdyd9F21jmmg/p4ywUEIeUYb8pp1cJo+22OfDWh6FoKc1cF
         AtY0hCKPoZUTyyCe/pJiTu+t0fxqORs2YfklFBFxkxT3nRBQhWfe2atypFdv0EgshGGS
         YPuA==
X-Forwarded-Encrypted: i=1; AKwUvByzeDELbcF7eRqqap95rRHLHQaFaBJiDPiDECzJZZ6FKe8DsIH4dTcCygUDJaMfVHPydgO07dyYnxT+CB4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6zJGzjIqRaUrIjmx2zAkt0XcoKRh0OdiH7LKcyzRPKhUBaK1m
	eoXA59PRNkfW2PNnN5MyH6yp9jgQJH1EKiw68VWbXa4nHsx58g2VpWxx
X-Gm-Gg: AYBFou0owukclMq33x/9ERc/b1ipRtb02wCYv0lC+Wro2hBN709fIGWKGHUVAEEe7cE
	kGKpwE4I71FS3QUWBHJ7W0cxtcQuI28Wv6gbP67rPDWamzyPleAJ6Ii0gjUVEOigco08Xk2zM9q
	YDln/aNzaqUJsL6TOzFr/Dzxak6TdN+vY8GkUkQc+baaZZNQ2kuZnzTMuWh03pVXfEe2ZxP2z4t
	k5CGpOsGwar8ukbp1UnVIHJKsrWAQrGM0R7yyhGvn/irrn2cZwU/CdCU8fx3zGJMMvs47XNPnjM
	sP11BKrlg8zZGk5+/S3i8XGCb9c3YwJ7sbCLK2DgKbnJaeLF2/fOp8r+mj3w32vM+fT49vxJDWl
	Q/ZemIvzmVRFtpgjeP2Qyu4dMSwgBu1BM7NC4ix1CwDnf/kjji37OcjIkC72cmmbtE56hL0BZL3
	1E6ZeSyyEqH5C02vyTXQ+9MNVzkIZMtLnEstgWMqnPc1B27//STxgzeXqUHYF9kZBHC9K1qKJCW
	xgTFmKJWqkceo9WpPKlT8ED3+M8enO35Jhsxj9UUQ/Z4cxRpl/H
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr20953055e9.3.1789719662070;
        Fri, 18 Sep 2026 01:21:02 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([2a02:3037:31e:59ba:f5a3:393a:4cdc:d23f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc59286b6sm31925015e9.4.2026.09.18.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:21:01 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, song@kernel.org, yukuai@fygo.io,
 xiao@kernel.org, magiclinan@didiglobal.com, eadavis@sina.com
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 yangerkun@huawei.com, yi.zhang@huawei.com
Subject: Re: [PATCH v3] md: Fix the null-ptr-deref of 'mddev->private' while
 submitting IO
In-Reply-To: <249f987d-9d2d-8f5c-91dd-3af6baefe587@huawei.com>
References: <20260918070900.1945351-1-chengzhihao1@huawei.com>
 <m233v7586k.fsf@gmail.com>
 <249f987d-9d2d-8f5c-91dd-3af6baefe587@huawei.com>
Date: Fri, 18 Sep 2026 10:20:59 +0200
Message-ID: <m2zexf3r84.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 15:38 +0800, Zhihao Cheng wrote:
> =E5=9C=A8 2026/9/18 15:29, Abd-Alrhman Masalkhi =E5=86=99=E9=81=93:
>>=20
>> Hi Zhihao,
>>=20
>> On Fri, Sep 18, 2026 at 15:09 +0800, Zhihao Cheng wrote:
>>> Concurrent processes md_stop and IO submitting could trigger a
>>> null-ptr-deref of 'mddev->private':
>>>
>>>   BUG: kernel NULL pointer dereference, address: 0000000000000070
>>>   RIP: 0010:_wait_barrier+0x2f/0x250
>>>   Call Trace:
>>>    raid1_make_request+0x150/0xf50
>>>    md_handle_request+0x104/0x530
>>>    md_submit_bio+0x76/0x130
>>>    submit_bio+0xdd/0x250
>>>    submit_bio_wait+0x1f/0x40
>>>    __blkdev_direct_IO_simple+0x1f6/0x370
>>>    blkdev_write_iter+0x3b2/0x520
>>>    ksys_write+0x7d/0x190
>>>
>>>                P1
>>>    fd =3D open(/dev/md0, O_RDWR)
>>> 	                      P2 (forked from P1, fd' <=3D fd)
>>>    write(fd)
>>>     submit_bio
>>>      md_handle_request
>>>       raid1_make_request
>>>        raid1_write_request
>>>                                    ioctl(fd, STOP_ARRAY)
>>> 		                   mddev_set_closing_and_sync_blockdev
>>> 				   // check passed, mddev->openers =3D 1,
>>> 				   // because md_open() is only called
>>> 				   // once in P1->open
>>> 				   do_md_stop
>>> 				    __md_stop
>>> 				     mddev->private =3D NULL
>>>
>>>         conf =3D mddev->private // NULL
>>>          wait_barrier(conf, sector) // null-ptr-deref !
>>>
>>> It is a common problem for raid0/1/10/5, and __md_stop could be trigger=
ed
>>> by several paths(eg. ioctl, sysfs, ->dtr). Fix it by replacing
>>> mddev_lock() with mddev_suspend_and_lock() for all __md_stop() callers.
>>> The caller dm_table_destroy() is guaranteed being invoked with device
>>> suspended, so raid_dtr() could keep using mddev_lock_nointr().
>>> The caller array_state_store() is guaranteed by the check
>>> mddev_set_closing_and_sync_blockdev(mddev, 0). For example, someone open
>>> /dev/mdx, write something and close /dev/mdx, it won't trigger the
>>> problem, all dirty pages can be flushed before mddev->openers decrement.
>>> Besides, fail the submitting IO in md_handle_request() if the
>>> 'mddev->pers' becomes NULL.
>>>
>>> Fetch a reproducer in https://bugzilla.kernel.org/show_bug.cgi?id=3D222=
020
>>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>> Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
>>> Closes: https://syzkaller.appspot.com/bug?extid=3D3fe892ea5fc292e1353f
>>> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
>>> ---
>>>   v1->v2:
>>>    1. Add 'mddev->pers !=3D NULL' check before make_request
>>>    2. Delete dm-raid caller(->dtr) modifications
>>>    3. Move memalloc_noio_restore after mddev_unlock_and_resume
>>>   v2->v3:
>>>    1. Remove modifications in array_state_store()
>>>    2. update commit msg
>>>   drivers/md/md.c | 15 +++++++++++++++
>>>   1 file changed, 15 insertions(+)
>>>
>>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>>> index 680b34a63cb3..e73338c26d53 100644
>>> --- a/drivers/md/md.c
>>> +++ b/drivers/md/md.c
>>> @@ -414,6 +414,20 @@ bool md_handle_request(struct mddev *mddev, struct=
 bio *bio)
>>>   		if (!percpu_ref_tryget_live(&mddev->active_io))
>>>   			goto check_suspended;
>>>   	}
>>> +	if (!mddev->pers) {
>> Isn't this case already handled by md_submit_bio(). take a look in
>> md_submit_bio()
> Hi,Abd-Alrhman
> I understand that 'mddev =3D=3D NULL || mddev->pers =3D=3D NULL' in=20
> md_submit_bio() is a qiuck check, there still exists a small race window:
>       P1                     P2
> md_submit_bio
>   if (mddev =3D=3D NULL || mddev->pers =3D=3D NULL)
>                          md_ioctl
>                           mddev_suspend_and_lock
>                           do_md_stop->__md_stop
>                           // set mddev->pers/private as NULL
>                           mddev_unlock_and_resume
>   md_handle_request
>    if (is_suspended(mddev, bio))
>    percpu_ref_tryget_live(&mddev->active_io)
>    mddev->pers // null-ptr-deref

It makes sense. It would solve only the null pointer reference, but I
see another issue. Look at the comment before calling
mddev_set_closing_and_sync_blockdev() in md_ioctl(). it says "Need to
flush page cache, and ensure no-one else opens and writes". The
suspending happens after flushing the page cache, in this case,
there might be other writes in-flight.

>>=20
>>> +		/*
>>> +		 * The __md_stop() sets 'mddev->private' to NULL during
>>> +		 * the IO submitting, check 'mddev->pers' before the IO
>>> +		 * being processed by specific driver to avoid the
>>> +		 * null-ptr-deref of 'mddev-><member>'. The check is
>>> +		 * safe because the IO has got the 'mddev->active_io'
>>> +		 * reference, and all __md_stop() callers will wait for
>>> +		 * the reference to be zero.
>>> +		 */
>>> +		bio_io_error(bio);
>>> +		percpu_ref_put(&mddev->active_io);
>>> +		return true;
>>> +	}
>>>   	if (!mddev->pers->make_request(mddev, bio)) {
>>>   		percpu_ref_put(&mddev->active_io);
>>>   		if (mddev_is_dm(mddev) && mddev->pers->prepare_suspend)
>>> @@ -8299,6 +8313,7 @@ static bool md_ioctl_need_suspend(unsigned int cm=
d)
>>>   	case HOT_REMOVE_DISK:
>>>   	case SET_BITMAP_FILE:
>>>   	case SET_ARRAY_INFO:
>>> +	case STOP_ARRAY:
>>>   		return true;
>>>   	default:
>>>   		return false;
>>> --=20
>>> 2.52.0
>>>
>>=20
>

--=20
Best Regards,
Abd-Alrhman

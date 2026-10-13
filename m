Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F1C3FD955
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890002; cv=pass; b=ic7C2Vkxla1JX6gI6KyEF+52770BDLT1+npHKnJUHBhvsyfSkNFMWLYL8+6XRlMipvwqO7J9YcQXMtkAm73HDGeMts1LEdOvuY6jjiQu47nr3whnjVBcphsENKieJXflziAn4ZWTNh5fBnIZ91p6mkh8tntkZ6bN9psI16jbIvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890002; c=relaxed/simple;
	bh=W6WTGsXRBI8mYN8L0qSr5GQI9BhXSERGgvRH9PMEXzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FC44PRsZN9yaMdQA3oHJ+UqvRc3FrwgG1jqLfqJwTM4Kca/zY+BcCZ95NUwMc2qPwp6wwkNwM9HPwt6rydr+kOt6aEwCxf71DYiyoINawfdJFLHP1BnXlWq6QRiEUv8wtOWYoVGuizrv9Nmj2lzn59MBPoUcYOU59AxtowiBSZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IDIGWwIa; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IDIGWwIa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so33872055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791889998; cv=none;
        d=google.com; s=arc-20260327;
        b=k1zfH87FsUb2skqTI9dEff9GrrMJ81IAcouqulsuHJnxbWvnvgmwdLH+sZjXhNRmci
         qT1Tvt0FF2rcR+6HXiohvw+qsEB6uH7ehUyCsEN8dNA6qNEo6ivFIyx+p1B7HEIw3GCb
         sUxWsFlfuUtOeLiOEHPz/NtzagA7BVmiIh6aSXXG/MreF8NW0JnIrfCH7+0t6dKQtMRI
         2ZzgZ46/zHsL2ShZuGIw/hSiOhJoKIbe0TVE5xvSTaLu9HPsCdo2X7gcE8sXFlQxspWy
         GnBWK2+P1igfiRBFr7lh6+YzWLBrAsj+D/B7vckrtzNWEguREUs3lczh74KdYtNLqFkz
         hjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0al2L/zJTanu+94NFMRYKtJkCF8mmt8cwR1wMSTnrxE=;
        fh=s5Qcc4LmYxP+90GxeUFGbJywuZXCxxXHGKDzi+nEyK8=;
        b=dnXY3Dewd3SMyNPU2SLD3KFPxNekGzNRh9ZS/TUOjjtSjcOFqMGDspzEy7GI9rURxv
         9ia35ryUtzPSPR6SKvsIPC/QKgy7mHGV+7/w2mj4oM6mGAJ4F78dlCWwbcpwB+/TEBUK
         6WPWWVQiyDCgy5D9Hxx1EU4Z2lo/xmKjyN/E6NMMJjjd+ZBvEwD29SVj7k679yeClA39
         7AZoTw4hmtc7zai2eyrwG85RgkHMz4zOTnTPG4CEI8bwKPjab4xlEcPZMUNYr3S7nYzF
         RnG3MOpjOhFLQTVmvq4mDRKSpaKhjrfQZnJajV8fDARUVCNHn8bV68QD6qjxrCML1KTe
         VX3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791889998; x=1792494798; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0al2L/zJTanu+94NFMRYKtJkCF8mmt8cwR1wMSTnrxE=;
        b=IDIGWwIaut2bLfX+1Caef8inF88Pe78St8VQXsVqGztxP7FsItbyyEyMA1bU1h0LMT
         8cWmtJaHOnOfTNtDToQaepRJhOE1Hw0Cs44t6osAKR5r5XtWhfmnxM0DOQHiFeUg9hk9
         ZPdADdd/gidkGqSc6TLzBRzb19hZpVvSE4UqvSvqdhQN7yjSBSscYk0ufdn20XfDrKg8
         7oPB2JTvaPM9yTjcjtPXbB0loYtY8qt3Tbyjjys4hSQbFuy29Ckkbyb4TJCCgWAKw0x7
         MGNpEi19nI3TqrXspZSVMx3+JeTmv1QoYUxRHdbvME5KdJ3mKWakJrxM/m5BfJDJAbxz
         wEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889998; x=1792494798;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0al2L/zJTanu+94NFMRYKtJkCF8mmt8cwR1wMSTnrxE=;
        b=FkDV/sWPoyIKAy/wG7xVJ6eSQxGIKTx1KO/wkUcet0nCzSN6CvVvuoT++9xE3kcLGc
         oz5yg6qhP7VB9PDtKhrovo42jSlo9gsgxUrL5XMXAOi8O/33Ma0oBJnu2EdIC9GcuTPb
         F0SnpptVtG8Nbgt6QGDVxA9bQdUaC/8AmnUDOmJwqdZ3Gach1sM1yULmItLQnoijK9Yi
         ucUfcO3o+dh1aaVUdW/K9Zr1Zy3P7TTGWBlOZ4vAW39vUt66OycaN3m2BcYx0elaPpCj
         6bbsWDuRuNKkYw76UKuw1JeFBsod0DXh6TM+eaptTR4sDN755aGev2M+3ePh7SNw6DPM
         zOBg==
X-Forwarded-Encrypted: i=1; AKwUvByjeuAB1l/E+6kqw5kH0my97SYg8V0PWTn8NCvcHSRBHvY3vUYbWq3scMpnngXk1X/wDFw+VlivU/Ve1T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwLzRYOcoQCG5xpm+rw0/sXAkCQFUTAmL5bJHKyz45w5dUSc5j
	WBpoiIw3sL0fodGzYuepztlCSTqYONHLG5zEdXTjQ7ZSKwmVOieWJe2NRIICOt4DmIYiYKWSWBL
	nnlNP3STArA8XgcXUOQkrbh8+aC70XZJ6SqaGxB8wiQ==
X-Gm-Gg: AYBFou2/3jsmBkG4sUuEssHnktx6QL31RrGi/y63tA0lDZxdcTseLQXxRFfqvML3jcI
	GeLUg70Q6Lv84rlD8rp7KE/b7VfD1MQrRfaKkdTUA186AmMblA/l3NiTqsBAWtl2Cwhbtnmt5Ey
	+NeNGYtydAdcPyicuicLPZo309naitaKeQO+J43ReubD18vhS9mu0RqhXtjw3CATXHitXlSMzpE
	7LtVCxwpHDk5KObz5VC6VoPernaTQuzhkbXOG5EWxVxRiyxfN33H5n+exR34Q7aEoR5MOivO04e
	8auqUXiUH08S1REAowdtgUSk4KPrUiLqeoL78DxUXwVDveOUqJln/U2ThzUfRIBsA9wxYTRR+cF
	E0U10u1IQZO4gSHGw9oeUTgTWN44R6eDwVmUTVVh3cct/Yd522fOLxg==
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id
 5b1f17b1804b1-4a18e4e7a85mr231148915e9.30.1791889998109; Tue, 13 Oct 2026
 04:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eb63c9f9-a158-4a70-b3ed-30046b15de11@wdc.com> <20261007160349.22411-1-adarshdas950@gmail.com>
In-Reply-To: <20261007160349.22411-1-adarshdas950@gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 13 Oct 2026 13:13:06 +0200
X-Gm-Features: AclHuK8-yEscoTG0Qgn4MHnDQBj5lanM9_dYA2t6goTepP0TOEot4V9lOrBTODE
Message-ID: <CAPjX3Fd-MEY5mMk9eu_3ukhZ7yixhWSqECEALCAVFHA0P6HYDg@mail.gmail.com>
Subject: Re: [PATCH v2] btrfs: unwind device add when sysfs registration fails
To: Adarsh Das <adarshdas950@gmail.com>
Cc: johannes.thumshirn@wdc.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mason@kernel.org, 
	syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 18:04, Adarsh Das <adarshdas950@gmail.com> wrote:
> btrfs_init_new_device() ignored the return value of
> btrfs_sysfs_add_device(). When sysfs link creation failed (e.g. -EEXIST),
> the add path continued, aborted the transaction with the same errno, and
> tripped WARN_ON(btrfs_abort_should_print_stack()) while leaving the device
> half-registered in memory.
>
> Check the return value and unwind when registration fails, without
> aborting the filesystem for errnos like -EEXIST. If add failed before
> anything was published in sysfs, tear down the in-memory device state only
> and do not call btrfs_sysfs_remove_device(). When the block-device link
> was created but devid kobject registration fails, drop the link inside
> btrfs_sysfs_add_device() before returning the error.
>
> Reported-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6a791c94.01d0871a.3a0d52.0099.GAE@google.com
> Tested-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
> Assisted-by: LLM
> Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
> ---
> v2:
>  - Unwind without sysfs remove when add failed (review on v1)
>  - Roll back block-device link if devid kobject add fails
> v1: https://lore.kernel.org/all/20261003111951.24527-1-adarshdas950@gmail.com/
> ---
>  fs/btrfs/sysfs.c   | 3 +++
>  fs/btrfs/volumes.c | 7 ++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
> index 39cb01ee441a..2f034689e71b 100644
> --- a/fs/btrfs/sysfs.c
> +++ b/fs/btrfs/sysfs.c
> @@ -2165,6 +2165,9 @@ int btrfs_sysfs_add_device(struct btrfs_device *device)
>         ret = kobject_init_and_add(&device->devid_kobj, &devid_ktype,
>                                    devinfo_kobj, "%llu", device->devid);
>         if (ret) {
> +               if (device->bdev)
> +                       sysfs_remove_link(devices_kobj,
> +                                         bdev_kobj(device->bdev)->name);
>                 kobject_put(&device->devid_kobj);
>                 btrfs_warn(device->fs_info,
>                            "devinfo init for devid %llu failed: %d",
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 85ea9c5d4536..56b38f012093 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -3066,7 +3066,11 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
>         mutex_unlock(&fs_info->chunk_mutex);
>
>         /* Add sysfs device entry */
> -       btrfs_sysfs_add_device(device);
> +       ret = btrfs_sysfs_add_device(device);
> +       if (ret) {
> +               mutex_unlock(&fs_devices->device_list_mutex);
> +               goto error_unwind_device;
> +       }
>
>         mutex_unlock(&fs_devices->device_list_mutex);
>
> @@ -3147,6 +3151,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
>
>  error_sysfs:
>         btrfs_sysfs_remove_device(device);
> +error_unwind_device:
>         mutex_lock(&fs_info->fs_devices->device_list_mutex);
>         if (seeding_dev)
>                 btrfs_assign_next_active_device(device, seed_devices->latest_dev);

I'm wondering why not this?:

@@ -3066,7 +3066,9 @@ int btrfs_init_new_device(struct btrfs_fs_info
*fs_info, const char *device_path
        mutex_unlock(&fs_info->chunk_mutex);

        /* Add sysfs device entry */
-       btrfs_sysfs_add_device(device);
+       ret = btrfs_sysfs_add_device(device);
+       if (ret)
+               goto error_device;

        mutex_unlock(&fs_devices->device_list_mutex);

@@ -3148,6 +3150,7 @@ int btrfs_init_new_device(struct btrfs_fs_info
*fs_info, const char *device_path
 error_sysfs:
        btrfs_sysfs_remove_device(device);
        mutex_lock(&fs_info->fs_devices->device_list_mutex);
+error_device:
        mutex_lock(&fs_info->chunk_mutex);
        list_del_rcu(&device->dev_list);
        list_del(&device->dev_alloc_list);

--nX

Received: from va-2-60.ptr.blmpb.com (va-2-60.ptr.blmpb.com [209.127.231.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811203876B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043860; cv=none; b=Rwafl7lzDEbGxybwMOVtPDzR0Zen1xrx2ZicyLEFCZcAaSXMkAG8GGz1Vj0ha0UZ23KJaFgxrF0FwZLdjzZfzmuqV4ikq+BytHk9oI34IBAGsS27cJQPrtUbTP0ld+wcBf8JWxHm2M1bhUjGbgFaxxm5i9Dwb4oz3FVxHwUUdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043860; c=relaxed/simple;
	bh=WajXHx4nyP1bqLJhU0xpOreDBI721whriRTqIiiZAvk=;
	h=Message-Id:Mime-Version:References:From:To:Cc:Content-Type:Date:
	 In-Reply-To:Subject; b=YXSyyFndRUF9h6miqZItm15RGOryIl87RaT9oklYSGizLELkdKEZB9TjciMwLuK4c6TAbu4HMtMCsgo+24izBtlPBTXTlCP+VRjzCzZwaIUTlEO+ZYUMjVGtiUqnEQNnb92rF78LWFwHmVfCJ+EoTS9i4fH7s45Pdp8AkhRy06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=TQoaIvAF; arc=none smtp.client-ip=209.127.231.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="TQoaIvAF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1790043846;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fw4jhSRMooq9m2/iqxv1olhkpehxFm8SKQQqYOoWwu8=;
 b=TQoaIvAF2FOKcyYJYvn/xfGAt6sK0s1MZzEuociSCXVLxhB4jcjV6ET/uzDGig6BNI5J8f
 JvUyIx9nKNJKoks2WmyOgitFFntKchm7I/d7SqdT1uL2Uqw0Bknmy1wUhPoag5pzy+Dggb
 prq+V4qlhvHISNqE22fVliKcH+axJ7Lj9/3QhCaZfNGb99UDsI+4GgvWUukssmUT7/30b4
 Oa+5lDwTm8fogDATTtSjYxaI6Kf353jtVrYW5yDLh4NLYPXy60j/W/scYVCZ9XxL50sKa4
 67Nuy6GvpYoyd50+0GkB7KOonw0CsZGFq0yN83jDwEULnPTKPumUkhGiJMyQJQ==
Message-Id: <43d139ac-7d54-41b2-9e4c-8fba8e6ac5ee@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260919091118.3272955-1-benquike@gmail.com> <20260919112522.3872315-1-benquike@gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26ab1e6c6+52133c+vger.kernel.org+yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
To: "Hui Peng" <benquike@gmail.com>, <song@kernel.org>, 
	<magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
Cc: <linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Original-From: yu kuai <yukuai@fygo.io>
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
Reply-To: yukuai@fygo.io
Date: Tue, 22 Sep 2026 10:24:02 +0800
In-Reply-To: <20260919112522.3872315-1-benquike@gmail.com>
Received: from [192.168.1.104] ([39.182.0.164]) by smtp.larksuite.com with ESMTPS; Tue, 22 Sep 2026 02:24:05 +0000
Subject: Re: [PATCH v2] md: reject raid_disks >= MD_SB_DISKS in md_set_array_info()

Hi=EF=BC=8C

=E5=9C=A8 2026/9/19 19:25, Hui Peng =E5=86=99=E9=81=93:
> md_set_array_info() copies info->raid_disks straight into
> mddev->raid_disks without any upper bound, while also setting
> mddev->max_disks to MD_SB_DISKS for persistent arrays. The resulting
> mddev is internally inconsistent: raid_disks can be far larger than the
> number of devices a v0.90 superblock is able to describe.
>
> super_90_sync() lays the device table out inside the single page that
> holds the v0.90 superblock and picks slot numbers starting at
> mddev->raid_disks:
>
> 	next_spare =3D mddev->raid_disks;
> 	...
> 	desc_nr =3D next_spare++;
> 	rdev2->desc_nr =3D desc_nr;
> 	d =3D &sb->disks[rdev2->desc_nr];
>
> sb->disks[] only has MD_SB_DISKS (27) entries, so an
> ioctl(SET_ARRAY_INFO) with raid_disks =3D 1000 followed by any operation
> that writes the superblock walks tens of kilobytes past the end of the
> superblock page:
>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   BUG: KASAN: use-after-free in super_90_sync+0x1c5e/0x20c0
>   Write of size 4 at addr 0xffff888009623c00 by task init/1
>
>   CPU: 1 UID: 0 PID: 1 Comm: init Tainted: G      D W    7.3.0-rc3-g5dd18=
18b15d9 #3 PREEMPT(lazy)
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x4d/0x70
>    print_report+0x153/0x4c6
>    kasan_report+0xda/0x110
>    super_90_sync+0x1c5e/0x20c0
>    md_update_sb+0x850/0x1e90
>    new_level_store+0x11a/0x190
>    md_attr_store+0x12f/0x270
>    kernfs_fop_write_iter+0x323/0x4e0
>    vfs_write+0x54f/0xde0
>    ksys_write+0xfd/0x200
>    do_syscall_64+0xda/0x4b0
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    </TASK>
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Reject the request before mddev is modified. Non-persistent arrays do
> not write a v0.90 superblock, so the MD_SB_DISKS limit is only applied
> when info->not_persistent is clear.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> v2: Add a Fixes: tag. v1 said the check predated the history I had; I
> now have the full tree, and it really does go back to the initial git
> import - set_array_info() in v2.6.12-rc2 already did
>
> 	mddev->raid_disks    =3D info->raid_disks;
> 	mddev->max_disks     =3D MD_SB_DISKS;
>
> with no bound, and super_90_sync() already seeded next_spare from
> mddev->raid_disks and stored into sb->disks[rdev2->desc_nr]. So
> 1da177e4c3f4 ("Linux-2.6.12-rc2") it is. The later commits that blame
> points at are not introducers: 7e0adbfc20c5 ("md: factor out
> md_set_array_info") only renames set_array_info(), and 86e6ffdd243a
> ("md: extend md sysfs support to component devices") only restructured
> how desc_nr is chosen.
>
> The reason the MD_SB_DISKS limit is gated on !info->not_persistent is
> 1b3bae49fba5 ("md: don't impose the MD_SB_DISKS limit on arrays without
> metadata"), which moved max_disks =3D MD_SB_DISKS inside
> if (mddev->persistent). Arrays without metadata never write a v0.90
> superblock, so the limit must not apply to them.
>
> Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU:
> create an md array over a loop device, issue
> ioctl(fd, SET_ARRAY_INFO) with raid_disks =3D 1000, then write to
> /sys/block/md0/md/new_level to force md_update_sb(). With this patch the
> ioctl fails with -EINVAL and no splat is produced.
>
> Note that raid_disks_store() has a related but weaker check: it bounds n
> against mddev->max_disks, which is still 0 before any superblock has
> been loaded. I have deliberately not touched it here, since an
> unconditional MD_SB_DISKS limit there would break v1.x arrays with more
> than MD_SB_DISKS members. It may deserve a separate fix - input from
> the maintainers would be welcome.

v1.x array do not have this problem, and it's not acceptable to limit v1.x
array with MD_SB_DISKS. How about following solution:

If metadata is set as 0.9 before raid_disk_store, you can check max_disks i=
n
raid_disk_store; If metadata is not set yet, check later when metadata is s=
elected.

>
>   drivers/md/md.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -7926,6 +7926,10 @@ int md_set_array_info(struct mddev *mdde
>   		mddev->ctime         =3D ktime_get_real_seconds();
>   		return 0;
>   	}
> +	if (info->raid_disks <=3D 0 ||
> +	    (!info->not_persistent && info->raid_disks >=3D MD_SB_DISKS))
> +		return -EINVAL;
> +
>   	mddev->major_version =3D MD_MAJOR_VERSION;
>   	mddev->minor_version =3D MD_MINOR_VERSION;
>   	mddev->patch_version =3D MD_PATCHLEVEL_VERSION;

--=20
Thanks,
Kuai

Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3887748E0DC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155121; cv=pass; b=spGFsFJw/C8dV3mqTRIJaS0oxv9c3aVPySF2mz7ZIImuWK4l//9f6a9NR8O3GCdC02JerFfrVaKOMLV8ix+cY3/zHjehD9RDw3sc+rr1gi2mhUQJg00dD1ddcQ8fUtAcGpySRE/jRHydN1wWcYM3UEvzjyFQhGdjoSX4/8MW5W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155121; c=relaxed/simple;
	bh=hKICZWLA5RsMjLO8UXLqtxxIkVmz51Vlt7o8QcZtuUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKSD2IUsNlUcVsChvzRmuR3+eAsC1xfThbqrI0995nUdd7Kz+PAt1TWX1YJraTOOMvPo2eHHUNGXP6a5H8VPpHShPO6EkHrjOLj6Hzyg1esuUppcUr+EOgfidYUAlmFis1qa3sqiWd/TJ6yIIXwF6wceFMzFU47gIzKWgAZ2PvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEONZ0Nz; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEONZ0Nz"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6798eb0d190so2410217d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792155117; cv=none;
        d=google.com; s=arc-20260327;
        b=aAz/GwZoBAEd6lXe8nOEawi0UpJ67vmMFHp0BuWbhNl/vvT4QOzh0yXz5WUH+qW5IW
         EgMJXvqFp6knKfp2sPjwMNVrdfnumYr+jysWk3Hh4wct9hWLUTVsoDIKcZvLYqdUNY6D
         zT91L0SlKRdHmm8i6NzUXjvtz1Gx7qjXE7GU/Oef4S0f/Dg+LK0Tkbmbfepqr+4bUiYW
         oIxxZ6HdIdNF/jQPBatAbSMEfCH1aUAiskqkuIAqeWniAm6oNBN0GmQQcXj2S1Yie+JA
         RlOo4YUPc3WXR74R48cCkMQDsKxIK/dHb3dtuGvntdXDlSeARfGeNr9O3gQFEkAX5GVL
         86cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6l+1/7krsFZpRBFydVqob7OkjMRdjcgUOwpkkb3EGec=;
        fh=rNSxxJhOCBXbQAXrGprcdCRisSjUyoxL6KGQa5Dpo/8=;
        b=r4JQJ0d6pZcSws/5Y2gfnDERUH1QS6Xq1GTNfUh5+p/PKqCVf/cveHAQGqiuISo0TU
         Nbv5lfIcQeJO73LKUAq+L2BaxlHBS2M9wb2Ttj534jtpq5F6SB6vq1hYSEMnsVt7RFUa
         53mq4K+hkM/82I6KAUT0o2ef5VKJtT9VzM7/yBuHuYqL1HjkaazaexaohxSdaVAP4TFw
         2aHT2ITO9pYwFoYFVEqzyhve29ZV5G6A+HUMgQTPw1C+1sUpUobpEjBrltEz7E4I1B1i
         a463KkxPWNL/+gmWj7WcBlhqU57rJxKQ7orjyJ1rNuctCKjs3Zw5z/S+Hn6HejqxMSTE
         tVAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155117; x=1792759917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6l+1/7krsFZpRBFydVqob7OkjMRdjcgUOwpkkb3EGec=;
        b=rEONZ0NzrSGIBPneXDHULbu3hv+dFUmS9zxSIvhguENiKwlIXYl+c7edgcCVqFrR7B
         fjOlwgIvfyA4MitOkPFdlhgV7754MIJKKC8YD2fHPIU44yTlS3u0e1cRG0APTG9kmx+4
         W0fIzIDkAFCU6qBXU//yaBmzJqkLKTYCZTYgifBVp88U+6OxaXU8wA+O3/6b2FKkHJS2
         VJW72ZxL6rkDnHq20GfImDjJmbpX9XKQwwOi2m6CipGy4H1lO+ac3LSekVLD43nGB3cl
         k2yN0CmXy/pEdAdCe+YKq3Toor3Ozv8Aul4npZw56cbUWKeaPCffwQFHLxGp4bFX6JLK
         N1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155117; x=1792759917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6l+1/7krsFZpRBFydVqob7OkjMRdjcgUOwpkkb3EGec=;
        b=IIDoCYy4EYwvZ1gFxZCiFrJrKicgFwBhf6zvMWowVH/PIWrpA7bI15dS120LTc1l5U
         B35ObPqhYwZRC22K3Z+gHPYCKOU+uYX1Z4+eGn9e4/pvE3Qs34FHfnzz/x8HXw+QdxLX
         7hWjpInIndmSdr6b7/pqUpcNgpvK3AXTLlXuqihji41neO3MrMW6CByevv5tMuL9h+Lr
         QGR0FW7SxxXfneyEywZbKixheBThlI8BghUuAfr2QvslHYmGmffjYo7PvPZbpsD/KylE
         6Gz8ifKWHcewmUaEVGhKpE9T1NIvQ3BzaXsJ7YHr/j7XhpVpHOpsz9QhG1OPsCheMvD3
         zcxA==
X-Forwarded-Encrypted: i=1; AKwUvBzIA3QF4nl9QZ8MqBU6Yi0EdqBAYfhtifLWHVaAltmtQCKfZrdfWnkQ7tn6IvTCSvyhn7STnu5m0OPHydE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKKjDAmxhyjuVdVrm4L8IDFVR6RBD7Z62XKIE2U41KwDXSU3p4
	jYPZJCKZ5VM0jM8xLObvKzMr60PvNka8q+uzmlt3P1A4nk5eBkG4NQHdCMTSh75C//jZEMiTEXA
	rnuE/CVINoXhOBp4emkUzWgbCDdNNaUk=
X-Gm-Gg: AYBFou0hOqsNEMue5kFzbDr+infAS88kC6K3/yWGSxxQL2R4AgkeBXGDkUvbgwo+nju
	NGkpK9RKISnC8fMBWkiEpRgAxDvA6xnx/BKRBSD8R86/qcqUZu+XrypnMkUEQt5/RZ48Fm4OLkC
	8UZ56o70vQa0xtxbTVqmaE3sbiT+lv+efSMAA+OCHcHanceNStLqBCwqlIiDjtQ/Z8/V+v8X6qv
	AEOhukyq9XSNlNiaWT0Z0z7Day5/JOuIAuq1YgpqmYC/SRPskewkt2AVhtfPdJ+wm7uvQ7Atrc3
	T3svxXbiWNiK7ZkzhRX/nhle4ZgtocVnUnZcfAc3PWKvfN/3uWISIVoFsOecZfguYmw/qcg8fhK
	P9khBFtyRJw==
X-Received: by 2002:a05:690c:dc6:b0:8ae:b617:7113 with SMTP id
 00721157ae682-8b07ebf4cd1mr79810017b3.6.1792155116960; Fri, 16 Oct 2026
 05:51:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-0d5be4c3f73a268b6e4e-v2-33b37cf9980d74d33ee3@gmail.com>
In-Reply-To: <pm-pmb-0d5be4c3f73a268b6e4e-v2-33b37cf9980d74d33ee3@gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 20:51:43 +0800
X-Gm-Features: AclHuK-X737h9BghQqlTouYKUNNXRdml9Jq7Tf4Jd8ELwTClBZxo4ttj7f0oXvw
Message-ID: <CAFRLqsXG8xb_1=UsCR-Myh-THrWLBF9JPP01AYmR19SjE-vAPQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: dummy: Revalidate CD Volume before updating its access
To: perex@perex.cz, tiwai@suse.com, thomas.weissschuh@linutronix.de, 
	sammiee5311@gmail.com, tglx@kernel.org, phucduc.bui@gmail.com, 
	kees@kernel.org, clemens@ladisch.de
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Cen Zhang <zzzccc427@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=
=A5=E5=91=A8=E4=BA=94 10:17=E5=86=99=E9=81=93=EF=BC=9A
>
> The CD Volume control must remain live while snd_dummy_iobox_put()
> updates its access flags and sends an INFO notification. The mixer
> constructor caches a raw pointer to that control, but removing it does
> not invalidate the cached pointer.
>
> This can happen when a kernel client removes CD Volume through
> snd_ctl_remove_id() while the dummy card remains connected and External
> I/O Box is still present. Userspace ELEM_REMOVE rejects this driver
> control, so a kernel control-removal caller is required. With I/O Box
> initially set to 1, the following ordering is possible:
>
>   1. The kernel client takes controls_rwsem for write in
>      snd_ctl_remove_id(). __snd_ctl_remove() unlinks CD Volume, sends
>      REMOVE notifications and frees it through snd_ctl_free_one(). The
>      semaphore is released and removal returns.
>   2. After removal returns, a native ELEM_WRITE changes External I/O Box
>      from 1 to 0. snd_ctl_elem_write() takes controls_rwsem for write
>      and calls snd_dummy_iobox_put(), which follows the cached CD Volume
>      pointer to update vd[0].access.
>
> The access update starts with a use-after-free read. The subsequent
> write and notification ID access also use the freed allocation. The
> semaphore serializes removal and the callback, but does not preserve a
> control removed before callback entry.
>
> Save the control ID after successful addition and look it up again
> inside snd_dummy_iobox_put(). The existing control-write semaphore keeps
> a found control live through the access update and INFO notification.
> Skip those operations when the lookup fails, preserving the I/O Box
> value change and the surviving control's update.
>
> KASAN report as below:
>
>     BUG: KASAN: slab-use-after-free in snd_dummy_iobox_put+0x391/0x440 [s=
nd_dummy]
>     Read of size 4 at addr ffff88810d8b4c98 by task alsa-trigger/415
>
>     CPU: 0 UID: 0 PID: 415 Comm: alsa-trigger Tainted: G           O     =
   7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=3DOOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,=
 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
>      kasan_report+0xe0/0x110
>      ? snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
>      snd_dummy_iobox_put+0x391/0x440 [snd_dummy]
>      snd_ctl_elem_write+0x376/0x5a0
>      snd_ctl_ioctl+0x997/0xdd0
>      ? __pfx_snd_ctl_ioctl+0x10/0x10
>      ? __pfx_do_sys_openat2+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_ioctl+0xaa/0x280
>      ? __pfx_snd_ctl_ioctl+0x10/0x10
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7fc9c21a991b
>     Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 =
89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 0=
0 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>     RSP: 002b:00007ffc08d51f80 EFLAGS: 00000246 ORIG_RAX: 000000000000001=
0
>     RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fc9c21a991b
>     RDX: 00007ffc08d51fe0 RSI: 00000000c4c85513 RDI: 0000000000000003
>     RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>     R13: 00007ffc08d52600 R14: 00007fc9c22d8000 R15: 00005578bae81d58
>      </TASK>
>
>     Allocated by task 415:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_noprof+0x2d7/0x770
>      snd_ctl_new+0x51/0x190
>      snd_ctl_new1+0x13c/0x650
>      snd_dummy_probe+0xba5/0x1240 [snd_dummy]
>      platform_probe+0xbe/0x1d0
>      really_probe+0x21f/0xa90
>      __driver_probe_device+0x1ec/0x490
>      driver_probe_device+0x4f/0x130
>      __device_attach_driver+0x1d2/0x2e0
>      bus_for_each_drv+0x155/0x1d0
>      __device_attach+0x1c3/0x490
>      device_initial_probe+0x96/0xb0
>      bus_probe_device+0x69/0x160
>      device_add+0xfff/0x1700
>      platform_device_add+0x318/0x7b0
>      platform_device_register_full+0x596/0x7b0
>      pmbd_remove_cd_exit+0x12a/0xf90 [remove_cd]
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
>     Freed by task 415:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_ctl_free_one+0x6b/0x110
>      __snd_ctl_remove+0x26f/0x360
>      snd_ctl_remove_id+0x4f/0x70
>      0xffffffffc04060c9
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
>     The buggy address belongs to the object at ffff88810d8b4c00
>      which belongs to the cache kmalloc-192 of size 192
>     The buggy address is located 152 bytes inside of
>      freed 192-byte region [ffff88810d8b4c00, ffff88810d8b4cc0)
>
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x=
10d8b4
>     flags: 0x200000000000000(node=3D0|zone=3D2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff8881000423c0 dead000000000122 0000000000000=
000
>     raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000=
000
>     page dumped because: kasan: bad access detected
>
>     Memory state around the buggy address:
>      ffff88810d8b4b80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
>      ffff88810d8b4c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>     >ffff88810d8b4c80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>                                 ^
>      ffff88810d8b4d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      ffff88810d8b4d80: 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc fc
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Fixes: 16e434670e95 ("ALSA: dummy: allow disabling mixer controls")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>
> diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
> index 6b0a06e5c87638264e5d22deda1fe4bc028febe7..d422fb3fa25d1279df2e971e0=
f5546a329db4049 100644
> --- a/sound/drivers/dummy.c
> +++ b/sound/drivers/dummy.c
> @@ -134,7 +134,7 @@ struct snd_dummy {
>         int mixer_volume[MIXER_ADDR_LAST+1][2];
>         int capture_source[MIXER_ADDR_LAST+1][2];
>         int iobox;
> -       struct snd_kcontrol *cd_volume_ctl;
> +       struct snd_ctl_elem_id cd_volume_id;
>         struct snd_kcontrol *cd_switch_ctl;
>  };
>
> @@ -836,6 +836,7 @@ static int snd_dummy_iobox_put(struct snd_kcontrol *k=
control,
>                                struct snd_ctl_elem_value *value)
>  {
>         struct snd_dummy *dummy =3D snd_kcontrol_chip(kcontrol);
> +       struct snd_kcontrol *cd_volume_ctl;
>         int changed;
>
>         if (value->value.enumerated.item[0] > 1)
> @@ -845,20 +846,27 @@ static int snd_dummy_iobox_put(struct snd_kcontrol =
*kcontrol,
>         if (changed) {
>                 dummy->iobox =3D value->value.enumerated.item[0];
>
> +               /* The control-write path holds controls_rwsem. */
> +               cd_volume_ctl =3D snd_ctl_find_id(dummy->card,
> +                                               &dummy->cd_volume_id);
>                 if (dummy->iobox) {
> -                       dummy->cd_volume_ctl->vd[0].access &=3D
> -                               ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
> +                       if (cd_volume_ctl)
> +                               cd_volume_ctl->vd[0].access &=3D
> +                                       ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
>                         dummy->cd_switch_ctl->vd[0].access &=3D
>                                 ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
>                 } else {
> -                       dummy->cd_volume_ctl->vd[0].access |=3D
> -                               SNDRV_CTL_ELEM_ACCESS_INACTIVE;
> +                       if (cd_volume_ctl)
> +                               cd_volume_ctl->vd[0].access |=3D
> +                                       SNDRV_CTL_ELEM_ACCESS_INACTIVE;
>                         dummy->cd_switch_ctl->vd[0].access |=3D
>                                 SNDRV_CTL_ELEM_ACCESS_INACTIVE;
>                 }
>
> -               snd_ctl_notify(dummy->card, SNDRV_CTL_EVENT_MASK_INFO,
> -                              &dummy->cd_volume_ctl->id);
> +               if (cd_volume_ctl)
> +                       snd_ctl_notify(dummy->card,
> +                                      SNDRV_CTL_EVENT_MASK_INFO,
> +                                      &cd_volume_ctl->id);
>                 snd_ctl_notify(dummy->card, SNDRV_CTL_EVENT_MASK_INFO,
>                                &dummy->cd_switch_ctl->id);
>         }
> @@ -903,7 +911,7 @@ static int snd_card_dummy_new_mixer(struct snd_dummy =
*dummy)
>                 if (err < 0)
>                         return err;
>                 if (!strcmp(kcontrol->id.name, "CD Volume"))
> -                       dummy->cd_volume_ctl =3D kcontrol;
> +                       dummy->cd_volume_id =3D kcontrol->id;
>                 else if (!strcmp(kcontrol->id.name, "CD Capture Switch"))
>                         dummy->cd_switch_ctl =3D kcontrol;
>

This is AI obfuscation. I'm very, very sorry for this noise. It is all my f=
ault.

Sorry for this again :(

Best regards,
Cen Zhang

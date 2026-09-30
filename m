Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02354F472F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781192; cv=pass; b=DytW1BdGiXXAwI7augn8ixOR99cfA1XZ4dEEJjUcm0vKWhZluRWDtJ7v4ICbc+k2wCaG0LCwJxEnKROFYTHEGP4ijrGmi1C5myxrQRgsV+7n/zn8W1ZUyRe+SYjXhi4iTjABJgvp62tP1IIrjy1821Po2Q/PE7BKzTQRk6Hz0wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781192; c=relaxed/simple;
	bh=dWPoP5tiJFfGs3d+AjtKuoPQm6W7knvCUa4Vdkd92c0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R26LxmfWCiatmOHXV00TPL7wZP2V+3x5o5wkkTyDEoq5IUrOz11xYP+/VMQRK4ezCruofGFfn/KTiACLNRoD+fkf7WqCb9C0hq0KBnqqzRpRslQnCPmS7rJdV5prPH3uWW4xBFq3P2f6Hpfh0khWT/pp7jt9czn8oSYEkOYCnxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dGlX8+He; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dGlX8+He"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso18552815e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781176; cv=none;
        d=google.com; s=arc-20260327;
        b=GeoJPLuM01Fte4pXhY2vRe9yjxxRE3g0v1QvaLnR3Jp8HfSLKeCmKXYLLFOnO6Wxe7
         CeGiCDi4DL7oP71Im424AYK4XtXn7EtyiCXAjFm4QQCj4/Bw+nrwotFfAITGQJjOMUGL
         KKII/xd+U+Whp0U6ekmH73bTtqGJBIXcUfVytbyG1BsEQxc0hEOm6+rtsNv9qGDbKpCI
         LUqSFMMd1wtis6GED5bTDMmiFI6V9m/HAPfKpSxy0Ur/kOxJhoyKmd3e2HJ4v/+irQre
         XpWVwxPSlWYF3wqgyJGq424PK6ZI/Rb0k0YYamSOAl61teVuQSjY0YO0GCpw3NozQ6BS
         J7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sKOHEJ5lVElWIr3V7PS2oyi4Sxq4Ni0O03Yi9pepGg=;
        fh=fKNxejJHITFEz8InfR5gJ0bI01fj6l77PzeCu1rdQnE=;
        b=shM9OygNVVstMVRBTGOgV5VVgkpyolRR1o11S9yZ+pZtz++SzJ/ZYdr7fKkVV31kek
         rw90B5fYokP5GQS8LhsTBP93JfVH0sId8vdyB7/bvY0PYrI0OA5hGk3NzuvHVbNGmBSd
         z+3pegghSKr3NC0JYK08MQm+Uub/78RMniIcObF5mzsGLFJDmWWTAXsSu0gCBswkT16m
         EcsRTEdXEhPuoO4iL58u6pWcyghYJGSdkIuSkxUgpX/skKOJIPVp88U1MGrHZyUGg0z9
         YYaF18BR+msUN6C4kkiPaGi15WCPDXwBkbMd//Dtx336P1TMEgSP4CQT5WYgGItjw4DU
         WlMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790781176; x=1791385976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sKOHEJ5lVElWIr3V7PS2oyi4Sxq4Ni0O03Yi9pepGg=;
        b=dGlX8+He4fUICrRxmUItgNWcCNvAvhPrE102SyAPXGgsYjZ+47ZufGiBE2PXQ0KhLD
         vOWyl9qCS5WjJ87l2mbj9pbeD1d8R8OMm5rL/L4uPJZSj6+QAbaFMWn1j04wyhdIeL4K
         R/i9at8F6Kob9GC6Luw83F52K7HryXqugcqEu2wkkxO6eeeF7rR8azEWPSnv9uEo2jFD
         0jqsmGitqDLFjTYllg6MkH+P6XpQiQg30hQvvUJ4pKVbt3fC94fubrp4CaABxQzvlmE7
         pThr/0uFjxSG5V2uqEst0Q5S+4p+bnqpjkqdPdy3IKssE7vR0ZfaW9YJXYGJlcOXa4/Y
         Pjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781176; x=1791385976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sKOHEJ5lVElWIr3V7PS2oyi4Sxq4Ni0O03Yi9pepGg=;
        b=jYj+aNaL7OtqF9TR20wBqS9TmmXP44ctlvcG3Z01PtWjsVhRvQgsPBpqeX2+UpjLXF
         SL7RX9JjbpRg2Lgrc+SJHZ1KC3cdE/nUkUf63AH1YM2Ni2C6AcbcvKq02M0F4uiUZ9eM
         sJN+BDrwHYgYLOG3gWd4WRuXgWTEuiPFjymA0zv/Eo4RYbdpWzDKN6PPRftC3cx1tVjT
         LUCTJ8TZJUInuYlTcZpXktcYI3z7IP/Fb69nMmTX2W7axpMsOfBOsJzAbYYbSUi8GmIs
         2HegKdptDXMFea+u+4OqF5FL4zZ4JRSvyBeG5mntyZVdZMdaMrbzC8WgMq9lb7ae9DCn
         ATgg==
X-Forwarded-Encrypted: i=1; AKwUvBzrtyYC4Isqzp62RORcsJtn9xrhSXTn8d1HHnGsk1PXCbRbL2W2CyK56h6Jkq+h+9BeHQq84IQw4CSt8hs=@vger.kernel.org
X-Gm-Message-State: AFuF++lYm8POChMD58Ro3V9q33z+Fe3oXe1je9Y5n14E9K6TAsW5GdH/
	yxiWAq8J/H9lSjVXaufBohalErm50jFnZlB2CBqvXLandzZWrPqwSMH1Mn7a1DaUcP+B04nIl6N
	7LnmQoTd+T0yjP2iRZxgOaQ7RN6PRHvb9QQHZkSzcLA==
X-Gm-Gg: AYBFou1LiTP/K78toqh/fbe5RRbZQHXO/fC5vsQitjek1b084cdTYI+KWW99wboE5zK
	39s1PWyu5ItqsHGpVxZzhoYQ24MAMSaTYrJ0ywxykzlkrWsfAool0qo/6/k8FOZmfk0xe+KuRyL
	P8c+2joeJLaiQ9F0yPzWUT24NCny8cPCNi8hnUyi2CGVOm7j6Vy1bqUpWPbzrQ6Vp3F8n67qDZA
	TKZe1XgM1dpj/X+NjatvarKH9e7VcDCwgmJpiTVoBRInfZ3r39VEeSopXvgeUxiqbQnzOw981ET
	Cz6HtH8ha+wvvwhmS7RkJYH4S32QvzcKZnCgVorqUnFl1qBNS2pkYadA3tM/2PpJzUKfhuOhn1s
	z2wAefzgqZ6C9tl4FlJ6mSrlf4iYop2vt7uOaopNe+hTisyDyq2Ss
X-Received: by 2002:a05:600c:45d3:b0:49f:cac3:c68a with SMTP id
 5b1f17b1804b1-4a01affeca0mr26046025e9.31.1790781176386; Wed, 30 Sep 2026
 08:12:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929123616.139759-1-18983559317@163.com> <66eaba4a-9b3a-4a65-bab5-8c336477faa2@gmx.com>
In-Reply-To: <66eaba4a-9b3a-4a65-bab5-8c336477faa2@gmx.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Sep 2026 17:12:45 +0200
X-Gm-Features: AclHuK_5J9yKSzibQ3_PkDRAaClKmgotVRkVXp1ETvrcDpdVESzC-EzaCItLOfg
Message-ID: <CAPjX3FdRzd7HYAJJEKrpe=r-O1iDBOLeoMf-VQs_62VFHrtV_w@mail.gmail.com>
Subject: Re: [PATCH v1] btrfs: wait for a grace period before freeing a new device
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Binbin Deng <18983559317@163.com>, dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 01:29, Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
> =E5=9C=A8 2026/9/29 22:06, Binbin Deng =E5=86=99=E9=81=93:
> > KASAN reports a slab-use-after-free in btrfs_statfs() walking
> > fs_devices->devices. btrfs_init_new_device() publishes the new device
> > with list_add_rcu() and can fail afterwards, for example with -ENOSPC
> > in init_first_rw_device() when a user with CAP_SYS_ADMIN adds a device
> > that is too small to a seeding filesystem mounted read-only. The error
> > path removes the entry with list_del_rcu() and frees the object in
> > btrfs_free_device() without waiting for a grace period, while
> > btrfs_calc_avail_data_space() and btrfs_ioctl_fs_info() keep reading
> > the device list under rcu_read_lock().
> >
> > BUG: KASAN: slab-use-after-free in btrfs_statfs+0x11af/0x14a0
> > Read of size 8 at addr ffff8880096be858 by task poc/252
> > Call Trace:
> >   <TASK>
> >   dump_stack_lvl+0x53/0x70
> >   print_report+0xd0/0x630
> >   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> >   ? filename_lookup+0x1a9/0x540
> >   ? btrfs_statfs+0x11af/0x14a0
> >   kasan_report+0xce/0x100
> >   ? btrfs_statfs+0x11af/0x14a0
> >   btrfs_statfs+0x11af/0x14a0
> >   statfs_by_dentry+0x117/0x1e0
> >   user_statfs+0xac/0x130
> >   ? __pfx_user_statfs+0x10/0x10
> >   __do_sys_statfs+0x80/0xe0
> >   ? __pfx___do_sys_statfs+0x10/0x10
> >   do_syscall_64+0xf9/0x540
> >   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Allocated by task 256:
> >   kasan_save_stack+0x33/0x60
> >   kasan_save_track+0x14/0x30
> >   __kasan_kmalloc+0x8f/0xa0
> >   __kmalloc_cache_noprof+0x158/0x370
> >   btrfs_alloc_device+0xad/0x3e0
> >   btrfs_init_new_device+0x3e8/0x36e0
> >   btrfs_ioctl+0x150d/0x6c20
> >   __x64_sys_ioctl+0x134/0x1c0
> >   do_syscall_64+0xf9/0x540
> >   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Freed by task 256:
> >   kasan_save_stack+0x33/0x60
> >   kasan_save_track+0x14/0x30
> >   kasan_save_free_info+0x3b/0x60
> >   __kasan_slab_free+0x43/0x70
> >   kfree+0x121/0x380
> >   btrfs_init_new_device+0x4a0/0x36e0
> >   btrfs_ioctl+0x150d/0x6c20
> >   __x64_sys_ioctl+0x134/0x1c0
> >   do_syscall_64+0xf9/0x540
> >   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Fix by waiting for an RCU grace period after the device is removed
> > from the list and before it is freed.
> >
> > Fixes: 1f78160ce1b1 ("Btrfs: using rcu lock in the reader side of devic=
es list")
> > Signed-off-by: Binbin Deng <18983559317@163.com>
> > ---
> >   fs/btrfs/volumes.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> > index 85ea9c5d4536..2693dacd1da7 100644
> > --- a/fs/btrfs/volumes.c
> > +++ b/fs/btrfs/volumes.c
> > @@ -3168,6 +3168,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *f=
s_info, const char *device_path
> >       btrfs_update_per_profile_avail(fs_info);
> >       mutex_unlock(&fs_info->chunk_mutex);
> >       mutex_unlock(&fs_info->fs_devices->device_list_mutex);
> > +     synchronize_rcu();
>
> Please follow all other call sites where synchronize_rcu() is called
> just before btrfs_free_device().

This call site is unlike the others. The device is allocated and
initialized here.
There's no need to sync with RCU until the device has been published;
i.e. the other error paths are perfectly fine to just free the device
right away.
Placing the synchronize_rcu() after dropping the mutexes and before
the `error_trans` label is exactly the right spot in this function.
We should really be serious about needless RCU syncs.

--nX

> >   error_trans:
> >       if (trans)
> >               btrfs_end_transaction(trans);

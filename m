Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3038E4FD7A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781343; cv=pass; b=jvUxzjFqjmK7GyIgrXRRC+hs5mup10XqqT/wpuB7oOn+VrYMGUNDF4Jsu606GLSutrU0yZQbNuGOVTyhYiyv58FOTfBYOAOYwcCdjI5FYm+iaI0ye35VVPw1fMiYiYBqtPNhnvcWf3YwO1enEbG/ippGZD6E4nWhcczDIU4baRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781343; c=relaxed/simple;
	bh=T8M5+WAa5eRfBdC5jOImCi4Z1P9fZSQvbmpoYos19RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csQQybHY6ycPFdKFmLVWW+vvpZEg5xFzS/vgLUE4R2jSK5fM+l3cZoZq7zuNznOEuxgbqSlKjdNzygR1QPz/tdCREDapDJdAEp8Rzc0dcTxZIF4YCAIzPN6J2j17yJhEYLu0l9dHkZYag97G6C0bX8ATL6+S+VTsdFyYdQN57SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T4XBXgPQ; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T4XBXgPQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e73611928so11583945e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790781326; cv=none;
        d=google.com; s=arc-20260327;
        b=bKm2j3gsKHJijl0XSwU4cG3qDqpPIMU1MESXsG6W+GBtEu2ukOxO3W7WwKrEzFjFIz
         7tYNFqJLLK4M6kRICaGrBlW0MJQQAzkjr1QrtYHRWdVRPRoOgrEZUF//EAVenIhhm51q
         f2t9tNl1KijyujvOfcrAz7EGeidhLUeubj5m6etpAAS1HDP2K8xVhsETuYbsAOzVok8d
         VNN5mJ3MWmXWfNDZjlRnyQLb5KnMBF0umeShbPpj3E8Gck86QGW1fu1lgNGXpVxlk7UO
         cGasuDIqOt1HPJJx8JA8sFmMqs74K3KVZzcUy+Twnh2iKBf2jQ4TF2odAm+O8P8OzrTh
         FKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6ezcTOg+btvYGvscdxJXEFqblYT6m0ireQk8xLTmAY0=;
        fh=x93zu3Junw6jvT2k+IZhoHw9zhUYjanI+uXQP0Flxd8=;
        b=TY3wMM8mQzT6c5ty0YHpOZV7sxtaTR2Gwi95Yd9ZcKHsSThLXReQnRzWD7IQR3J4Li
         kVqWjwXHoIhq02aqxqI4S4BeqTWs/Os+2lwOjFywk4udNCZtSrer1owSqC2qnZYw26LV
         uXq4+KS2eof0cMSwQ8v3BDeYgQTUJgl8I/SpUNYie71kbZyf10JULo+9OnPVsQVsHciJ
         7XAT+soBwQC1hutLiIL2GDwRUWw+F8wdM2r3t/LBMd28hcUnSPN90xfNFcvdYNRf6xNc
         iu5wubZ4up8umlGlLxDcVdDTZ0Cu9SvE1f+6B2ENtOkGUZMau2Uo/UeEvJUsfALUlEtR
         UnIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790781326; x=1791386126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ezcTOg+btvYGvscdxJXEFqblYT6m0ireQk8xLTmAY0=;
        b=T4XBXgPQYhviWMkjz1IKDSZh9IHGs7QfYc9MuRBvJfg9mMuAX4lzDXE50mQHtuODIS
         7ZuE6wtxdpaxe1hwjYKMYNiN5G00DWEMiMNzUUVSJQ5EGBIQ4/CFmWKoqxcSD9MRUalZ
         4Z4HQU9CL/c9hnfzPRVYCQ/Xc4E6afZrTSYtb8gwGzaWMBqj7GZ24TCwUAycLMz15OUQ
         Fxfb8HygcF6DHxpgW98U+CjlsjTM2al6yjCI0cpAhC4fdlHR/eFh4De6zwZaNf84rcp7
         O4UClrTJyN2Dq+Tnvi8l4fryGIRIqFhFesz34LD/DyO0Raz/xc/s7s+9yu1tm5pFi/Tk
         JMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781326; x=1791386126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ezcTOg+btvYGvscdxJXEFqblYT6m0ireQk8xLTmAY0=;
        b=Bqw8mEmbw47Tdn2FtMSDILSkpBrqjgFdpaLJPJ61VkgZ1gtwBlf4580lXh8joc8mXR
         QWPXV5jBHKwpbliBn+Ida+ECdGuagsSbZNc+06tJenfG2MWSPok1JU0ncP3JrlpIRVKQ
         CJBY5aNLeMCbjs53GwHWtz5RWKLrcbt92SRMqv7u2IKFdMrpm3pwOqtuOfqJ5f9647Ky
         RQyl4KJwr2uEDILT6dNm/4MdIYwfXi0UtI26+88fnSAXwkDXRaZOv1wMcLQpx+VZRx+V
         xvNeFLe0WOtMiXgb01i7LhVzveX41Wb/MsycjrTGmyzAhKyl6zciWj8seDemLBNEpAY2
         Ki2w==
X-Forwarded-Encrypted: i=1; AKwUvBwi9Q37ZBX3RfrGzegNQ6pNtC6DEyTWa2mPRic+EGheUZGSPnH/8DyJXstXJ7KIS7qebF6NzUNkeyZXml0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG8f2GJXZYcsiuekLv+y0d4R44sGMaBx/QjOBAtoOn1BxYSJ62
	C5vitRfwwAE+ko/4CxwfFbZyWhVWGMmZfUEGvJbB+ub6a3RYZGPZ4MoAW8UTqJWvXpRVIY8XZsi
	lGq/OypP24GABUS619K85h4HvZKu8A0bsgAVdcil5zA==
X-Gm-Gg: AYBFou2IzT4hUctx1QqjCj7l6NPBF/IoS32K9mJaHNOibpr6YBx9w+JA1Qn6lZm81Fz
	X8omvuk2ZkfUHvfo3aW4QsN+f2Uz8UxI787rp2EURRbbgoUqkNAcNPaZZDKvHxQqn+DHkLR8psV
	VBSCkuJjlrPnwWD4Ayk5TTHka0QeuFcN2RA2tuh55PWTUumk092ropaizssoXmwDeJR1OWObhQa
	VS7o9DBK1wxgpxOa2Bm2r/L25ZT+rtTZT7N+r3YNsuvTZ5CMiaWJKyC/272xL7LsKcYrAtfhVtz
	XgWlBJ6ry9NpVRqRYgxIgKvYMDF+rsU4KnbDyJY61uWrGYn06qMNL5Rdb44MNq+ePMT+GGc3ckA
	Cgo85tLciyt+vXYXdRXjhQMndGPu4iWh6wYj/zuLA50wqWgr+ua0t
X-Received: by 2002:a5d:5f55:0:b0:485:8413:5272 with SMTP id
 ffacd0b85a97d-48b02521988mr3221377f8f.26.1790781325777; Wed, 30 Sep 2026
 08:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930134808.399544-1-18983559317@163.com>
In-Reply-To: <20260930134808.399544-1-18983559317@163.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Sep 2026 17:15:14 +0200
X-Gm-Features: AclHuK9n1yMpQcY96WbBWhY4VgmmWkiraZ8f4ykE9U2ItzQPNufu8jSq7nFkxwU
Message-ID: <CAPjX3Fc_gnuJZbUfJ=sPTBbhNDwajGRMmZ_gr6g2Jb_evg7Rhw@mail.gmail.com>
Subject: Re: [PATCH v2] btrfs: wait for a grace period before freeing a new device
To: Binbin Deng <18983559317@163.com>
Cc: dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 16:09, Binbin Deng <18983559317@163.com> wrote:
> KASAN reports a slab-use-after-free in btrfs_statfs() walking
> fs_devices->devices. btrfs_init_new_device() publishes the new device
> with list_add_rcu() and can fail afterwards, for example with -ENOSPC
> in init_first_rw_device() when a user with CAP_SYS_ADMIN adds a device
> that is too small to a seeding filesystem mounted read-only. The error
> path removes the entry with list_del_rcu() and frees the object in
> btrfs_free_device() without waiting for a grace period, while
> btrfs_calc_avail_data_space() and btrfs_ioctl_fs_info() keep reading
> the device list under rcu_read_lock().
>
> BUG: KASAN: slab-use-after-free in btrfs_statfs+0x11af/0x14a0
> Read of size 8 at addr ffff8880096be858 by task poc/252
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x53/0x70
>  print_report+0xd0/0x630
>  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>  ? filename_lookup+0x1a9/0x540
>  ? btrfs_statfs+0x11af/0x14a0
>  kasan_report+0xce/0x100
>  ? btrfs_statfs+0x11af/0x14a0
>  btrfs_statfs+0x11af/0x14a0
>  statfs_by_dentry+0x117/0x1e0
>  user_statfs+0xac/0x130
>  ? __pfx_user_statfs+0x10/0x10
>  __do_sys_statfs+0x80/0xe0
>  ? __pfx___do_sys_statfs+0x10/0x10
>  do_syscall_64+0xf9/0x540
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Allocated by task 256:
>  kasan_save_stack+0x33/0x60
>  kasan_save_track+0x14/0x30
>  __kasan_kmalloc+0x8f/0xa0
>  __kmalloc_cache_noprof+0x158/0x370
>  btrfs_alloc_device+0xad/0x3e0
>  btrfs_init_new_device+0x3e8/0x36e0
>  btrfs_ioctl+0x150d/0x6c20
>  __x64_sys_ioctl+0x134/0x1c0
>  do_syscall_64+0xf9/0x540
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Freed by task 256:
>  kasan_save_stack+0x33/0x60
>  kasan_save_track+0x14/0x30
>  kasan_save_free_info+0x3b/0x60
>  __kasan_slab_free+0x43/0x70
>  kfree+0x121/0x380
>  btrfs_init_new_device+0x4a0/0x36e0
>  btrfs_ioctl+0x150d/0x6c20
>  __x64_sys_ioctl+0x134/0x1c0
>  do_syscall_64+0xf9/0x540
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Fix by waiting for an RCU grace period after the device is removed
> from the list and before it is freed.
>
> Fixes: 1f78160ce1b1 ("Btrfs: using rcu lock in the reader side of devices list")
> Signed-off-by: Binbin Deng <18983559317@163.com>
> ---
>  fs/btrfs/volumes.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 85ea9c5d4536..ec89dc3dc4cd 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -3174,6 +3174,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
>  error_free_zone:
>         btrfs_destroy_dev_zone_info(device);
>  error_free_device:
> +       synchronize_rcu();
>         btrfs_free_device(device);

I believe v1 was better regarding the RCU sync logic.

--nX

>  error:
>         btrfs_release_device_allow_freeze(bdev_file);
> --
> 2.43.0
>
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793369508;
	b=CJTYC1dFw5pOWPTsGbbEgm7Coh0kbsjkQVOpTto2VWzw2vwElyB6obxlWjI4NhAjzQol
	 emlZpgyZTCfYmCOcS86qZHWzZaLNsg/ijMgRu4YaFcrRLcWpXMYPJF138rccvqgEe0NEJ
	 3kLV63ssdoSG89gs04g0EcJ5crBhA+xzJZ/UM0tT2yUAJQJso19OnM3wyw0widxV8CE3H
	 fvCjFVmZ5fQMbHE3OGJh74NFmKhr/IG4cGPq8bg/vtAwzM48xfEQE1cQX6LnUcEqvM0fT
	 szBtBT9nE8NIBHAFApg19JVH/4eWWxxq+5n6ws/9JU9eSY0htF33FxKxviei5NEnXTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=66LBFrIdvPN5I/Sp7uCyiL3h5+EwlBIU1Tk64BEBwyA=;
	b=SvQFHTpKa8hUd5uNMiZ7pea7weXZ2bihvf0Z8wylt94/yFDHZPvMj8fHslsJS/wrzCSj
	 PKTGqqOhhHV6TbfKyxxmFgRhz2KWxyyjvpZ1HTsbvvLpnVcmkUl8vnFvkhqgrF3l7xFwn
	 8oV0V3WjxsaDzAZmyv4Hi1M/9WpjfE34sTpYTteUZXKikNgD6aEJVKZKyTuv8FK7qxUnL
	 YEvJO/DYLMWk4IzzmdHZ8LLzTb+5wpxzjvRFAczBoa49yFpxSE/RCuprGpo0bxCFUes+8
	 SR2/Jvm19wb58HBY17JURYjrDq9VdvqJ8jquoHvXqJ6MTo/UmLGVtaLif5OTUHn1JFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BuL1neDN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BuL1neDN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d885929so620669f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793369505; cv=none;
        d=google.com; s=arc-20260327;
        b=p8k3HIGdTK/AxmzK3J63Im6AmunOx6lFMej0SIOzgYnqixHg0jwQwu7iCKco9UjsyJ
         RIhv+cNgo0W6R3RZrtX+UOdAy4p8JtfZD0DMauQ7p0mCcQD1Ib4hYiyUFyFoWPPeZj5M
         1TdaLK5/BNpQ7pOUWoW46hfLggPoy/D2tA94JrGmsFYn7xg1nBWFoBj3PMWn62YRxzaK
         IikrIXV11xQgZdUsEwbu6c9IlwhWOyjDL843XV6FegLwJ9JF63uMHmeDzPYKA6ndCpRb
         f/r1HPfQThIenEk0i9B3zIYK53ry830Fr+Eau5SOv+TQStqAZjeEaR1JI+r4vKs7RB6E
         JLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=66LBFrIdvPN5I/Sp7uCyiL3h5+EwlBIU1Tk64BEBwyA=;
        fh=KON+aeKlWSsPwbSzHMJjRSpGwtGoG925ZS6/c5dW50M=;
        b=jLwakieMZFxdNeKKv3FURK7R7ORHz4S4pkNtAlXpJGgE1Qho4S0HrUAo/IIvbV7t3B
         nJ5DArlrzpHvAIXIPt+KXvqVMBiDgZCsSbQCOT1pVIKt9ynM8NEvocSY30APWGUxKIQy
         I32uFIFyt/yu8MpU/TW8izf2Pf1/7POKKacO9DvPg3apqAJjyW9TqrLxgmmKWAColPqU
         QWeux29sPJL+UxeQ7jMLrZHcSwepA8YBIlL4hCRy5i5VkM6FaCtwNLADqH1hfWFPyRQE
         QSOnUeL2TXKiugCjcmssUJyxDKXry3bncUg5wWMmuB4Djtn795eYdZM8l0Zp/yyJYyvN
         1osQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793369505; x=1793974305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66LBFrIdvPN5I/Sp7uCyiL3h5+EwlBIU1Tk64BEBwyA=;
        b=BuL1neDNGdWshafjIbCeK741DC/opGgdwzqcNKNID8jAu0tcoYnijbuv+IrBjue3IX
         KqU8tnNgBxAJ72rLfaeWKz9HTni0q6xbO3BR0ID6rBESZGZeUVV95jGaHsz+nMzkzp9y
         T+rFJkA/rRg64LKHvr3QF1c+DtPySdoDbiaPAAFhV5zk1Bq8pBCO3zZQkJ1xTM6DxDaL
         QuebSWNHELM9gAAg2IkIibtK/q5HPLpcfbWzZeIgPcZQC2t50cFZMbtuuk4MFwqnSbO1
         RxcbbiOS/dX4kA0DjWi9NmSHhhzUZwZyJy7fCpvcybDdG0MeEHi/v5zO+KMeloFoLPdn
         2Zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369505; x=1793974305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=66LBFrIdvPN5I/Sp7uCyiL3h5+EwlBIU1Tk64BEBwyA=;
        b=vTNMf+6aJ5SDJ+nBksChgNkWXGzR0PrxAnlp4xGUgvfF/WBIVuux8JSG/PsEPa/kk1
         e2FgssNNHkEjzBEg8NbQWROYhK7F2mil0od70Yfw6kBusRRQW14sMKRrGycdQGgDEs3g
         3OhjD8DFo6zkdvDOPuE48IefPpOcJm4EK86LQ1xUa20thRx3xY5P+9BrO7OyeSJywUj8
         pFWDkzairVPG+YCW5/r3yGOlWvaKmS1tD7hZBiBeUqe+1UhLeHNeh1ENQ6fH79QHjwEu
         evs/bqvP4b09f+tVBCo2xqQujCiLsdGQ67e1Pmev5w6ay+Lug8qGCWwGpq8xQ5yPLwS2
         OmOw==
X-Forwarded-Encrypted: i=1; AKwUvByaOaQCTBGMKQj9OKA5WEWR18jm/Xlo40S4jEcc9HZyu1MUn4DrUZKW5Z2L1hL2H7ERECYmd0YEQD5uzUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJerqxvZrpsvLIFdEKol/lq5uezziMNs4YCXZEccGh9MBDHSH7K
	YQ7ICe9zLE5t6rsypszaVmdxIp2UZQ9W/EbkpgM9iPUsPGQZcUnaY4W235P2qRukFQjllClTqQB
	XIWuc6Lb/a19u0nqgJdMIZRtjs0B5skCLjBE31dQRkl9bWGxKNpG22SY=
X-Gm-Gg: AYBFou0BviRSdu57QGm7wuDVFKT4mHZk9XpZL/0AEi/1yroIILY2m5EvSwAenF31xTb
	1cEcFmtSpF6EWf74ZXMNWVXRyNZEkQ7ZZczzclrVc8FCOQlmQezLrlRQ32T5H9zmcCf+Biwwo21
	hQ68J+xcP/kNn/d+31f1Vl4+EY0SjIZmS0vv+I58arF8YoyTAJ8LDOsLSnLBM3VuZoyAORC07gL
	+ky84NLHO7gN/Kp4w5WbE2FGVjBqWE6q/h51VIIJ/XpiaqPCUsgcrvQjtOOs2lEJm07plPeW63s
	PpT5F4CRWkKapiVVbqSdweKSyNEqjm3mqs90V6C1aGGZt7J3FcKyGRquyRokBvvRCCS7DSQ96sW
	FMe4kz8xrdo9eKW3TQRTG5Q8PPzO1Gtiwv7T75LuqNf69blOBjE34Aw8UuS/2MI8FwrUhsZwVp3
	fHLZpIZ2P8dCm7WkihwxJxsNM+5Fs8K+kTsSI=
X-Received: by 2002:a5d:5d06:0:b0:48d:ff71:dd87 with SMTP id
 ffacd0b85a97d-48e6e303f29mr5929875f8f.17.1793369505232; Fri, 30 Oct 2026
 07:11:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014023733.266854-1-18983559317@163.com>
In-Reply-To: <20261014023733.266854-1-18983559317@163.com>
From: Daniel Vacek <neelx@suse.com>
Date: Fri, 30 Oct 2026 15:11:33 +0100
X-Gm-Features: AclHuK9_U1sdsfah92JETnlIiZP0F7Q7mLVpYaOkJD3_p8ZASapxcKb1MBMHWaE
Message-ID: <CAPjX3FdCZpJkj+QaCMObtTy0_W=uxXfZfatUHvOPdjN07v7KTQ@mail.gmail.com>
Subject: Re: [PATCH v3] btrfs: wait for a grace period before freeing a new device
To: Binbin Deng <18983559317@163.com>
Cc: dsterba@suse.com, mason@kernel.org, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qu Wenruo <quwenruo.btrfs@gmx.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 04:37, Binbin Deng <18983559317@163.com> wrote:
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
> from the list and before it is freed.Place the synchronize_rcu() after
> dropping the mutexes and before the `error_trans` label.
>
> Fixes: 1f78160ce1b1 ("Btrfs: using rcu lock in the reader side of devices list")
> Signed-off-by: Binbin Deng <18983559317@163.com>
> Reviewed-by: Qu Wenruo<quwenruo.btrfs@gmx.com>
> Reviewed-by: Daniel Vacek<neelx@suse.com>

Pushed to for-next. Thanks

--nX

> ---
>  fs/btrfs/volumes.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> index 85ea9c5d4536..2693dacd1da7 100644
> --- a/fs/btrfs/volumes.c
> +++ b/fs/btrfs/volumes.c
> @@ -3168,6 +3168,7 @@ int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path
>         btrfs_update_per_profile_avail(fs_info);
>         mutex_unlock(&fs_info->chunk_mutex);
>         mutex_unlock(&fs_info->fs_devices->device_list_mutex);
> +       synchronize_rcu();
>  error_trans:
>         if (trans)
>                 btrfs_end_transaction(trans);
> --
> 2.43.0

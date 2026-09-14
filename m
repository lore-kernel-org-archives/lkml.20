Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E33418A28
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376928; cv=pass; b=YykLcB7J6lWxJPsntBz0h+R1Zi0xWSO9YobSCloi8ySwzwv465HiuNq/z4iiiXuMDit9/7nv2OngERFzWgUziJ3TkJ9Zh8ukl6tOTFTrrqpaPRFc3KqRV0nUcW8EJsEWi1RFQO6XsfcFaD9ijq1lfp5aKLk9Ffe7uDJg25reZQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376928; c=relaxed/simple;
	bh=H9KzJdFwBJ5RE5a0OPMZdX3R4a8evFN/nIZSKpi3FnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJMhAU0nj+waYMNKSDHL6ZhvlheVnv1EL1slJHOs5bLLhIusiqs+ihDOATGyhCgJ411wFxpE/42677Qpblhxt8MK4Bqrv98DBZo5xj7lo2H0IKFGYUyRw+8VehK6Y23amNsirUuX8KNDCe1H0SQGbP3oEoB+wgaTu8tPguSdWHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nX9ToRX1; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nX9ToRX1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so87145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789376924; cv=none;
        d=google.com; s=arc-20260327;
        b=DCbVeTzEQ8qEXx2Xe+iSLzDVnSkOa1qhzihb0d2PM1FREnCX/Iw0itdJct0ROKRh0S
         AHd82vXsqfDVHFXZQjp5zK22z7KPHNLNNbrEfilDLVj1v3zX2tFl4Gr1IAVxf4TxONfw
         3iDEcHinOLBL+5aRB/PV7b4iMjeC4MKeTE9684qccsVj4jnRmMMymdh2bGBTiQ7RlHJg
         pzpAkZUnrSkp4X33QlgrqAH51cda4vyq5JhtdPlQDMwf+EOe1mF3V0kHgnD3RKSKALY9
         dPrtB4x9oyXCHN+mNExKewW0HLszUZiZDoBC0rGOChG1skxz45LVhXLqj4VVfuVlX5hM
         /ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ared8Q7o82wgOuUu4oNue1VztlP6cL1fp9xQwldykVk=;
        fh=XC1/wFtfw3jj2QRRxl0ZIgB/P+plqx3Rxbl6UN5CeiI=;
        b=Wn6CfPSHJ7DTDn0m2fEhTZ2ONMpCzhzHpY31ibIaEyu+QbEOqJ3lFfAH5Qr6TCVVC5
         trBJ+/ZsSpdeK8nONFYN+WetEjoGDxde3jaLEhYC1X95q7YwKarn6TxFLOifsPX81tsB
         RlisLlZI/pMjBFXPZnr3e80LBGe7JzYEsD0dHOevx2qvighMSyWp4Pwb7hATWdeWgT0v
         cwuzmwfVTF8CpTcHDOeIMZJIl6sWbwv0bkG1FTmfrvaRCwbHXoMvlcuCVlILOy3PiXq5
         iMuczY+CiaGcuaK27yXK8WcGK8yF8GX+JPhqaL9eZlGo7CzzDA5FbTCAfLklL9U0fjVa
         HD8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376924; x=1789981724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ared8Q7o82wgOuUu4oNue1VztlP6cL1fp9xQwldykVk=;
        b=nX9ToRX1wBc5hluCx7M42VQjPk8iEOkgndOYfo1SzyQ/RdyNoPibuqwzCVkLPmneSz
         G/vZuHDewM8atPczdfINGBu92Xvbji4RwN9pLAjcEElMmPHe+qIEkPPT9VG8cfVo8BOQ
         CseWxjSC20Rok6vixbLwyOnR1Fp/iAQPwsUPHVh0HffrEcTpmEn7UJ6jCDQgAxrs2U5m
         GRrWQaRrSwW7POFYKF3KBKYGraq/sz7aE4JY+5XfVGGkE43A1Y698N9EoqUTMvaJPwjw
         gVtAcwp6nGVUbnZeDE7RH/okVDyvR3p04uIf0AjfMtTc0m8j6NgHkHZKdr6ZTiwLgsMu
         1bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376924; x=1789981724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ared8Q7o82wgOuUu4oNue1VztlP6cL1fp9xQwldykVk=;
        b=FcdveiVcdiHWO+P2oJi6Iyffqm98P/oZ3lbenqXTEpsmzX9tXZEVbQ6ZpdgvfpU0qE
         KoB598pH/84iT5uWeExZWHz4f28krkAb14zJ8nnqFJt+sZajF8XNiwH7S4d+CllHnryK
         ZdBGga/PuLlnSY44o26H15h1s1+CwCUHXlMFR5J0oyDgjh00786tPKIlZUXAZN6xMeCA
         +N+rb0ApCgIcbuwClixa4V9fGrZA86wSlZmgpIQayxxIph7o5MbZc8S2wIxZj1Gsmmcv
         BU4G2WeyQBoA7rqLws/rJjAZ2lVaUhWqDWSt7uFtbaxiOPwU8nPc1pJwMncOyrib1hRq
         aPsw==
X-Forwarded-Encrypted: i=1; AKwUvBzMRFEj2Mt9rlq3M9lvov+fUPMAwqt7bhr+PxAT12GghF8AaxKNQRHn49kWCE7pCTdUc6OzFx9/FIwK1OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l2yw0itlR1gENWpk0Ma/3fi3aRjFmHjPTWEMHCrCVx/+QYs2+Y
	xyVIiQzCAvVU9jEiZMyOHt22JDinj3zlWrD/MOvmcgtQrrKYQYIsUpyKt5oc0DqCqT0DvQOslEX
	lr2rjIze2Y4HIDZR8lpHPnDZw5skSYrY=
X-Gm-Gg: AYBFou1sKsQCxV9qosEoFmiKY5apEoJw2fsVeuILLeiIq69UGZCnE91lD58CcP0GOvx
	oX56HPkt1ktVzIosn5ihCERF6yi4nCXW0NHJk3sbS43HLIKyt5fhSoGyg+fMX7+2srPQmMO4GrX
	EivbDheitElSRz1PjA5gVTj0QD98wquEaMAydy8XVdVKc3uvHxUYZbNdTkIh1VBcK9xZGJF3eEA
	4YJzB/puMQfyNYpoUf2EBziYBJfEHHDtE9vSf94F+1KLw+HpYOmnxAbq5nHFnZqw+3jHK1IIqoW
	p+Qv4MQ944xuvyMDIH0O9pmfk5AEdA90qg9suWnU8HmXNxdpTLeivoBx
X-Received: by 2002:a05:600c:3b9f:b0:49e:745d:5768 with SMTP id
 5b1f17b1804b1-49e7a5f1f60mr22056895e9.0.1789376923731; Mon, 14 Sep 2026
 02:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-5-chao@kernel.org>
In-Reply-To: <20260911232405.1815804-5-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 14 Sep 2026 17:08:31 +0800
X-Gm-Features: AcwNN1Xt8ktbYc8s4HwbTTmvwmq2yJI5UStd_t0FUxjhZ7_FN_SQY2C5Oe-N8Yk
Message-ID: <CAHJ8P3++-+J4EpkFrsHAX4=tSVvJS24R2BRvTpKe4_vT84fgpA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 04/12] f2fs: cache: introduce writeback thread
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=86=
=99=E9=81=93=EF=BC=9A
>
> From: Chao Yu <chao@kernel.org>
>
> This patch introduces a background writeback kthread (f2fs_writeback-x:y)
> to periodically flush dirty metadata cache entries with a default
> interval of 5 seconds.
>
> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
> transitions.
>
> It introduces a sysfs entry /sys/fs/f2fs/<disk>/cache_wb_interval to cont=
rol
> writeback interval.
>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
>  fs/f2fs/cache.c                         | 56 +++++++++++++++++++++++++
>  fs/f2fs/cache.h                         | 12 ++++++
>  fs/f2fs/f2fs.h                          |  3 ++
>  fs/f2fs/super.c                         | 33 ++++++++++++++-
>  fs/f2fs/sysfs.c                         | 13 +++++-
>  6 files changed, 120 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/=
testing/sysfs-fs-f2fs
> index 0cebc89799dd..d2665b7f1f14 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -1020,3 +1020,9 @@ Contact:  "Daeho Jeong" <daehojeong@google.com>
>  Description:   This is a read-only entry to show the upper bound section=
 number
>                 for pinned files. Pinned files will only be allocated wit=
hin
>                 sections 0 to pinned_area_max_secno - 1.
> +
> +What:          /sys/fs/f2fs/<disk>/cache_wb_interval
> +Date:          August 2026
> +Contact:       "Chao Yu" <chao@kernel.org>
> +Description:   This is a writable entry to control writeback interval of
> +               f2fs_writeback-x:y, by default the value is 5000, unit is=
 ms.
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 563615761d11..404ceac9e6bf 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -626,3 +626,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info =
*sbi,
>  {
>         return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>  }
> +
Hi Chao
> +static int f2fs_cache_writeback_kthread(void *data)
> +{
> +       struct f2fs_sb_info *sbi =3D data;
> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread;
> +       wait_queue_head_t *wq =3D &cache_thread->cache_wb_wq;
> +       unsigned int interval =3D cache_thread->cache_wb_interval;
> +
> +       set_freezable();
> +
> +       while (!kthread_should_stop()) {
> +               wait_event_freezable_timeout(*wq,
> +                               kthread_should_stop(),
> +                               msecs_to_jiffies(interval));
if wb thread is running and user set cache_wb_interval at the same
time=EF=BC=8C the wb thread can not get the new wb interval value for next
round? because local varible is used here
> +
> +               if (kthread_should_stop())
> +                       break;
> +               if (f2fs_cp_error(sbi))
> +                       continue;
> +       }
> +       return 0;
> +}
> +
> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
> +{
> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread;
> +       struct task_struct *task;
> +       dev_t dev =3D sbi->sb->s_dev;
> +       char name[36];
> +
> +       if (cache_thread->cache_wb_task)
> +               return 0;
> +
> +       init_waitqueue_head(&cache_thread->cache_wb_wq);
> +       cache_thread->cache_wb_interval =3D DEF_DIRTY_CACHE_TIMEOUT;
> +       snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
> +                       MAJOR(dev), MINOR(dev));
> +
> +       task =3D kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", nam=
e);
> +       if (IS_ERR(task))
> +               return PTR_ERR(task);
> +
> +       cache_thread->cache_wb_task =3D task;
> +       return 0;
> +}
> +
> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi)
> +{
> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread;
> +
> +       if (!cache_thread->cache_wb_task)
> +               return;
> +
> +       kthread_stop(cache_thread->cache_wb_task);
> +       cache_thread->cache_wb_task =3D NULL;
> +}
> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> index 5728e2225465..ea0cf9adf194 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -209,4 +209,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *=
sbi);
>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>                                 unsigned long nr_to_scan);
>
> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
> +
> +struct f2fs_cache_kthread {
> +       struct task_struct *cache_wb_task;
> +       wait_queue_head_t cache_wb_wq;
> +       atomic_t cache_wb_trigger;
not used?
thanks!
> +       unsigned int cache_wb_interval;
> +};
> +
> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
> +
>  #endif /* _LINUX_F2FS_CACHE_H */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 85c4bf40b4aa..c0f82b63d732 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2110,6 +2110,9 @@ struct f2fs_sb_info {
>
>         /* f2fs internal cache */
>         struct f2fs_cached_block_list meta_blocks;
> +
> +       /* internal cache flush thread */
> +       struct f2fs_cache_kthread cache_thread;
>  };
>
>  /* Definitions to access f2fs_sb_info */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b731b9bb7b54..516b4ee12564 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2039,6 +2039,7 @@ static void f2fs_put_super(struct super_block *sb)
>          * flush all issued checkpoints and stop checkpoint issue thread.
>          * after then, all checkpoints should be done by each process con=
text.
>          */
> +       f2fs_stop_cache_wb_thread(sbi);
>         f2fs_stop_ckpt_thread(sbi);
>
>         /*
> @@ -2845,6 +2846,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>         unsigned int flags =3D fc->sb_flags;
>         int err;
>         bool need_restart_gc =3D false, need_stop_gc =3D false;
> +       bool need_restart_wb =3D false, need_stop_wb =3D false;
>         bool need_restart_flush =3D false, need_stop_flush =3D false;
>         bool need_restart_discard =3D false, need_stop_discard =3D false;
>         bool need_enable_checkpoint =3D false, need_disable_checkpoint =
=3D false;
> @@ -3004,6 +3006,18 @@ static int __f2fs_remount(struct fs_context *fc, s=
truct super_block *sb)
>                 need_stop_gc =3D true;
>         }
>
> +       if (flags & SB_RDONLY) {
> +               if (sbi->cache_thread.cache_wb_task) {
> +                       f2fs_stop_cache_wb_thread(sbi);
> +                       need_restart_wb =3D true;
> +               }
> +       } else if (!sbi->cache_thread.cache_wb_task) {
> +               err =3D f2fs_start_cache_wb_thread(sbi);
> +               if (err)
> +                       goto restore_gc;
> +               need_stop_wb =3D true;
> +       }
> +
>         if (flags & SB_RDONLY) {
>                 sync_inodes_sb(sb);
>
> @@ -3011,7 +3025,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>                 set_sbi_flag(sbi, SBI_IS_CLOSE);
>                 err =3D f2fs_sync_fs(sb, 1);
>                 if (err)
> -                       goto restore_gc;
> +                       goto restore_wb;
>                 clear_sbi_flag(sbi, SBI_IS_CLOSE);
>         }
>
> @@ -3026,7 +3040,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>         } else {
>                 err =3D f2fs_create_flush_cmd_control(sbi);
>                 if (err)
> -                       goto restore_gc;
> +                       goto restore_wb;
>                 need_stop_flush =3D true;
>         }
>
> @@ -3123,6 +3137,13 @@ static int __f2fs_remount(struct fs_context *fc, s=
truct super_block *sb)
>                 clear_opt(sbi, FLUSH_MERGE);
>                 f2fs_destroy_flush_cmd_control(sbi, false);
>         }
> +restore_wb:
> +       if (need_restart_wb) {
> +               if (f2fs_start_cache_wb_thread(sbi))
> +                       f2fs_warn(sbi, "background cache writeback thread=
 has stopped");
> +       } else if (need_stop_wb) {
> +               f2fs_stop_cache_wb_thread(sbi);
> +       }
>  restore_gc:
>         if (need_restart_gc) {
>                 if (f2fs_start_gc_thread(sbi))
> @@ -5529,6 +5550,12 @@ static int f2fs_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                         goto sync_free_meta;
>         }
>
> +       if (!f2fs_readonly(sb)) {
> +               err =3D f2fs_start_cache_wb_thread(sbi);
> +               if (err)
> +                       goto stop_gc_thread;
> +       }
> +
>         /* recover broken superblock */
>         if (recovery) {
>                 err =3D f2fs_commit_super(sbi, true);
> @@ -5551,6 +5578,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         sbi->umount_lock_holder =3D NULL;
>         return 0;
>
> +stop_gc_thread:
> +       f2fs_stop_gc_thread(sbi);
>  sync_free_meta:
>         /* safe to flush all the data */
>         sync_filesystem(sbi->sb);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index aaca9ed9b169..ad25733e32c0 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -40,6 +40,7 @@ enum {
>         RESERVED_BLOCKS,        /* struct f2fs_sb_info */
>         CPRC_INFO,      /* struct ckpt_req_control */
>         ATGC_INFO,      /* struct atgc_management */
> +       WB_THREAD,      /* struct f2fs_cache_kthread */
>  };
>
>  static const char *gc_mode_names[MAX_GC_MODE] =3D {
> @@ -98,6 +99,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info =
*sbi, int struct_type)
>                 return (unsigned char *)&sbi->cprc_info;
>         else if (struct_type =3D=3D ATGC_INFO)
>                 return (unsigned char *)&sbi->am;
> +       else if (struct_type =3D=3D WB_THREAD)
> +               return (unsigned char *)&sbi->cache_thread;
>         return NULL;
>  }
>
> @@ -1008,7 +1011,8 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
>         bool gc_entry =3D (!strcmp(a->attr.name, "gc_urgent") ||
>                                         a->struct_type =3D=3D GC_THREAD);
>         bool thread_entry =3D !strcmp(a->attr.name, "ckpt_thread_ioprio")=
 ||
> -                       !strcmp(a->attr.name, "critical_task_priority");
> +                       !strcmp(a->attr.name, "critical_task_priority") |=
|
> +                       !strcmp(a->attr.name, "cache_wb_interval");
>
>         if (gc_entry || thread_entry) {
>                 if (!down_read_trylock(&sbi->sb->s_umount))
> @@ -1218,6 +1222,9 @@ static struct f2fs_attr f2fs_attr_##name =3D __ATTR=
(name, 0444, name##_show, NULL)
>  #define ATGC_INFO_RW_ATTR(name, elname)                                \
>         F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)
>
> +#define WB_THREAD_RW_ATTR(name, elname)                                \
> +       F2FS_RW_ATTR(WB_THREAD, f2fs_cache_kthread, name, elname)
> +
>  /* GC_THREAD ATTR */
>  GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
>  GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
> @@ -1347,6 +1354,9 @@ ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candida=
te_count);
>  ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
>  ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
>
> +/* WB_THREAD ATTR */
> +WB_THREAD_RW_ATTR(cache_wb_interval, cache_wb_interval);
> +
>  F2FS_GENERAL_RO_ATTR(dirty_segments);
>  F2FS_GENERAL_RO_ATTR(free_segments);
>  F2FS_GENERAL_RO_ATTR(ovp_segments);
> @@ -1533,6 +1543,7 @@ static struct attribute *f2fs_attrs[] =3D {
>         ATTR_LIST(lock_duration_priority),
>         ATTR_LIST(adjust_lock_priority),
>         ATTR_LIST(critical_task_priority),
> +       ATTR_LIST(cache_wb_interval),
>         NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

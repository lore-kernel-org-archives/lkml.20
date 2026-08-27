Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723F387599
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850242; cv=pass; b=kiuO/bmUn1lxgj3h5AIE0BmpEF2mshqfuW4rp35q3mPXyUx5ZPr46NZuVXM5J+KUzhEvulpXKv6Clb8QajE7nZAaPmGiQ2ytNy4kdZlYC2fKmQXgwAkZ/A6hIDLximbF+BLyQLKwfl0LkW2XKZ65JhIwJNqZjvfiMpYug0heuKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850242; c=relaxed/simple;
	bh=e2AEnXbKPKFHkfPBW5Mf1t/RMG8vmbZ9MY2GwJRhl48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZgsb0pUwsqY7aB0YyAQEyxoYStvhapEnXKseyZLTYGQcD1yrfU93KuYtaLir4iAqAcO0EoA2K+tzjMTXL4tCT2YRxQbV4gB790XAPmNZy5bn65Zzi/G00lcf4iuhVlYn4RPkjRAWxHSIX7HO4v59LJN7hqmUz2BjPcMU2HqP64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rsblKo5K; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rsblKo5K"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b523efb0bfso5349e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787850238; cv=none;
        d=google.com; s=arc-20260327;
        b=pW8/OFyWFDDnQTAJglaxKnMX4ZdEr3DFA5NMIYyr9DoFRwm/wB5hZAyR/nAB5scrOh
         sHe34yYv45x4k2chZgQ72008i5CN6WuvcHCQhQ+yN4a5RinwOvfbkRo1y+XSdcym8Wmr
         Ql/9QqByrt/bDM7J2UNSezoFySVHHzJsPDH3t7urC+b9W/Anc/1zbUCQNinQjs3wVcAj
         1PRmHM+JmYoK/KUBxUPTuXqTNpCltqA9Q9jd04q/ucMixLDHyuctul0MLIGPLAL/VrKi
         dClamF5MrOGxLGI+93lHuTn+eZvarD01rDlb0BIMfv4U473BliXJLsg6fhRGTCKUNq1R
         IxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GpzOOzpZjUDwvTD3qEMbgjmTFpivVOyKWzuX9lDy/rA=;
        fh=HXRkV/TTS6U0Gu+vvDogS9ewc4n7qR0eGkjZjItktp0=;
        b=SLMQWLQxbu4JRJaVvy95EukqzZKH+IMnoBxjd1GhM7Mqp0GpIFj/LtIlxXZRfOGW6Q
         VtcNh/tDfwPl4Zlu/2731mREyWaBqF58l2R7VloV12N8ihKsALSyKHbkjqRaDvPfaySa
         h5LjP4q42o6JTWe0hyFD43S1+ihoLNeRZLeQmpRj/K7Yijky+E/wOIsfHl89j3KMcuoJ
         5I5BqMtJg55rgGSXB1UiDwOJnAxkT0VHsN7V8EtPlLOGaGH4TmdX+H+YYXxv0X/nn7gO
         92FPdIPgwFg9UHa8A7k6Xh0YB33L/3Ubqagf85F9H62TDWEffndU7ptE+B/zI1vMvyW9
         xtQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787850238; x=1788455038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GpzOOzpZjUDwvTD3qEMbgjmTFpivVOyKWzuX9lDy/rA=;
        b=rsblKo5K10ibk6AArXj5jQYH6rO5dPbQNG518FWgU6JWp6uwyQPU88DIJKzTUN88+q
         zHplR7jvRGmPZXbQL/mAaQEFBk5/+v9QTKXuBhKcZYnHHRn56NuemDFBU8y99DXFkXPx
         NADF8zlyIMxHKmCO2gufJnh5sYjwB/IXASSDMpLmzPJIqh/B1m6D8FTnKjZ5wvWp6MnW
         nZhM3lNHrjqUtA3gEP60g8ueKLXlkHaJnstVz9D4X3KN4mdHk6XkIRSPb8tZRR6vMabQ
         UOXdKpqC2M3zb+t/PaFUTU5lgC2+xGuGGuCe239JBBoyd7u8tpB213Z8QzDAzbY8rowM
         rROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850238; x=1788455038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpzOOzpZjUDwvTD3qEMbgjmTFpivVOyKWzuX9lDy/rA=;
        b=PSRgmi3nt++L2ctWhWZUTwXi5lz2zKXtl8Eh6VHFZCz0BeFjEoozdyh7LLSE9+jHBc
         zldjbDgUN13Fhc01oTcGFoIeV+tyQ+bpyPA7Y7CA2S89t10ke1noLUQgZDQDOkhGzKf6
         TbIEqxT8GHQ3G70xWRD945H0enpVQXzeAC/Z+ZiVENCOeXBtnQGLX8nZpyHSGe3JftCc
         1CZ+Z2/yF8HfI9cmCNvPxoS1JOdc/JSxlLJ4DxxyRrkXh21bhZwWduNXQqBuxkNrSQnU
         NWAxRwGz9v1YE5KXVEemTZFU4XE9WE9Y0rALPfDFfANnNh7bD88nFV26P7uugN34TqPN
         Ry7g==
X-Forwarded-Encrypted: i=1; AHgh+RpyELCFE5c2C40KZHtcBrGRqLuiT0dSL8NCowL4EFBfjdzDV03v4awUru6yK0DRqF9fCOrblWY1o1N9U9g=@vger.kernel.org
X-Gm-Message-State: AFuF++mu97+g4xeo44oDQSsiXH+wSSLsbUNeW+nEc1fQBL650PNvohRB
	3R2eet3LQwXzOgNpBtZteqeofSZp9s3pxfEq9W1PWVv6nzUZ/mThz6NhUiAWxmBWeJxZKX4vM3t
	sERnqz7nF1QI9EZd8+ek9rSgeA7XFHU4=
X-Gm-Gg: AR+sD13gOolPDOMPbum52U3x0+CZkaJ9z+c5QKWPS+boSrtJ4ll7ASi4g2t+gSmonpb
	Y9+ryUXo6MpJyAG3Wq4uGkgTMjUa63zyJhm2DeF3XEsPi13JSVOo//A3D2MV3EYe49uWvyIoDDa
	16qQwwbo9PTXBdc12VGT39X6TYi484SRnKwoe2Ax5WDGRsB6dd9JlqdPpB+8abEFzkM1c9t9ciI
	6uO7LGg+OBJM9302SWNdaaXt4bRMiTxcQdAcvDYkH1ds6nKHAGwTtyzycHItLedbcfltHPuFPEx
	xPo3AO+/m55lmpfZe8YNs6f0H7RE4BEkSh/KvAhavtEKzwA2XXX8vgO2HVgJiSrlfXdpw4qXbt3
	hdglK0xOpo+VUMnhgK9DK1bPkv0KIDJvc3Q8Taxxfuw==
X-Received: by 2002:a05:6512:1549:b0:5b5:e265:5215 with SMTP id
 2adb3069b0e04-5b5e6afe07fmr6793e87.22.1787850237938; Thu, 27 Aug 2026
 10:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-5-chao@kernel.org>
 <CACOAw_zrWasT=zW1yGSXQKzbj6u5v41MgLQhUjO2yxKYqca8TQ@mail.gmail.com> <d3a0b74f-6879-4bb6-9c49-1cb37db7b2a2@kernel.org>
In-Reply-To: <d3a0b74f-6879-4bb6-9c49-1cb37db7b2a2@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 10:03:45 -0700
X-Gm-Features: AcwNN1WZ5DVxIIdXTsfcQMgtAss0dN-rmdUuGLfHrrKp8cNbDHmiCcYgA5N2jiE
Message-ID: <CACOAw_xE=FmB1mW6_z8gqW=HJFBSuca3TV7rw0B_4+XUEPMogg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 04/12] f2fs: cache: introduce writeback thread
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:28=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/27/26 03:37, Daeho Jeong wrote:
> > On Tue, Aug 25, 2026 at 6:06=E2=80=AFAM Chao Yu via Linux-f2fs-devel
> > <linux-f2fs-devel@lists.sourceforge.net> wrote:
> >>
> >> This patch introduces a background writeback kthread (f2fs_writeback-x=
:y)
> >> to periodically flush dirty metadata cache entries with a default
> >> interval of 5 seconds.
> >>
> >> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
> >> transitions, and hooks synchronous flushing into checkpoint commits.
> >
> > What do you mean by the above line saying "hooks.."?
>
> Oh, it's just a replacement from folio based flush to cache entry based f=
lush
> in checkpoint, I think I need to update the description to avoid misunder=
standing,
> sorry.
>
> >
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/cache.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++=
+
> >>  fs/f2fs/cache.h | 13 ++++++++++++
> >>  fs/f2fs/f2fs.h  |  3 +++
> >>  fs/f2fs/super.c | 31 ++++++++++++++++++++++++++-
> >>  4 files changed, 102 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >> index 3cee33c69880..dcfea6c2e1bb 100644
> >> --- a/fs/f2fs/cache.c
> >> +++ b/fs/f2fs/cache.c
> >> @@ -615,3 +615,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_in=
fo *sbi,
> >>  {
> >>         return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> >>  }
> >> +
> >> +static int f2fs_cache_writeback_kthread(void *data)
> >> +{
> >> +       struct f2fs_sb_info *sbi =3D data;
> >> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread=
;
> >> +       wait_queue_head_t *wq =3D &cache_thread->cache_wb_wq;
> >> +       unsigned int interval =3D DEF_DIRTY_CACHE_TIMEOUT;
> >> +
> >> +       set_freezable();
> >> +
> >> +       while (!kthread_should_stop()) {
> >> +               wait_event_freezable_timeout(*wq,
> >> +                               kthread_should_stop() ||
> >> +                               cache_thread->cache_wb_task =3D=3D NUL=
L,
> >
> > Maybe a redundant check?
>
> Yes,

If it is, plz, remove "cache_thread->cache_wb_task =3D=3D NULL".

Thanks,

>
> >
> >> +                               msecs_to_jiffies(interval));
> >> +
> >> +               if (kthread_should_stop())
> >> +                       break;
> >> +               if (f2fs_cp_error(sbi))
> >> +                       continue;
> >> +       }
> >> +       return 0;
> >> +}
> >> +
> >> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
> >> +{
> >> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread=
;
> >> +       struct task_struct *task;
> >> +       dev_t dev =3D sbi->sb->s_dev;
> >> +       char name[36];
> >> +
> >> +       if (cache_thread->cache_wb_task)
> >> +               return 0;
> >> +
> >> +       init_waitqueue_head(&cache_thread->cache_wb_wq);
> >> +       snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
> >> +                       MAJOR(dev), MINOR(dev));
> >> +
> >> +       task =3D kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", =
name);
> >> +       if (IS_ERR(task))
> >> +               return PTR_ERR(task);
> >> +
> >> +       cache_thread->cache_wb_task =3D task;
> >> +       return 0;
> >> +}
> >> +
> >> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi)
> >> +{
> >> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread=
;
> >> +
> >> +       if (!cache_thread->cache_wb_task)
> >> +               return;
> >> +
> >> +       kthread_stop(cache_thread->cache_wb_task);
> >> +       cache_thread->cache_wb_task =3D NULL;
> >> +}
> >> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> >> index 618b377590da..ff3d8781119c 100644
> >> --- a/fs/f2fs/cache.h
> >> +++ b/fs/f2fs/cache.h
> >> @@ -187,4 +187,17 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_inf=
o *sbi);
> >>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >>                                 unsigned long nr_to_scan);
> >>
> >> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
> >
> > Maybe this one should be tunnable, right?
>
> I think so, let me introduce a sysfs entry for that.
>
> >
> >> +
> >> +struct f2fs_cache_kthread {
> >> +       struct task_struct *cache_wb_task;
> >> +       wait_queue_head_t cache_wb_wq;
> >
> > There is no wakeup all around the patchset. Is this for future usage?
>
> Yeah, I planned to, but still didn't have a full picture, suspect there i=
s
> any chance to wake up the writeback thread to speed up metadata flushing =
in a
> synchronous scheme, like syncfs.
>
> >
> >> +       atomic_t cache_wb_trigger;
> >> +       unsigned int cache_wb_interval_ms;
> >
> > Plz, remove unused fields from above struct.
>
> Okay, let me check first if we can reuse it for sysfs.
>
> >
> >> +};
> >> +
> >> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> >> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
> >> +void f2fs_sync_cache_wb(struct f2fs_sb_info *sbi);
> >
> > dead code?
>
> Oh, will drop them.
>
> >
> > Thanks,
> >
> >> +
> >>  #endif /* _LINUX_F2FS_CACHE_H */
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 0f855ac7d1e8..9fe9fadbb810 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -2111,6 +2111,9 @@ struct f2fs_sb_info {
> >>
> >>         /* f2fs internal cache */
> >>         struct f2fs_cached_block_list meta_blocks;
> >> +
> >> +       /* internal cache flush thread */
> >> +       struct f2fs_cache_kthread cache_thread;
> >>  };
> >>
> >>  /* Definitions to access f2fs_sb_info */
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index 32e80c70e141..9bb19f4c5fd2 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -2020,6 +2020,7 @@ static void f2fs_put_super(struct super_block *s=
b)
> >>          * flush all issued checkpoints and stop checkpoint issue thre=
ad.
> >>          * after then, all checkpoints should be done by each process =
context.
> >>          */
> >> +       f2fs_stop_cache_wb_thread(sbi);
> >>         f2fs_stop_ckpt_thread(sbi);
> >>
> >>         /*
> >> @@ -2826,6 +2827,7 @@ static int __f2fs_remount(struct fs_context *fc,=
 struct super_block *sb)
> >>         unsigned int flags =3D fc->sb_flags;
> >>         int err;
> >>         bool need_restart_gc =3D false, need_stop_gc =3D false;
> >> +       bool need_restart_wb =3D false, need_stop_wb =3D false;
> >>         bool need_restart_flush =3D false, need_stop_flush =3D false;
> >>         bool need_restart_discard =3D false, need_stop_discard =3D fal=
se;
> >>         bool need_enable_checkpoint =3D false, need_disable_checkpoint=
 =3D false;
> >> @@ -2984,6 +2986,18 @@ static int __f2fs_remount(struct fs_context *fc=
, struct super_block *sb)
> >>                 need_stop_gc =3D true;
> >>         }
> >>
> >> +       if (flags & SB_RDONLY) {
> >> +               if (sbi->cache_thread.cache_wb_task) {
> >> +                       f2fs_stop_cache_wb_thread(sbi);
> >> +                       need_restart_wb =3D true;
> >> +               }
> >> +       } else if (!sbi->cache_thread.cache_wb_task) {
> >> +               err =3D f2fs_start_cache_wb_thread(sbi);
> >> +               if (err)
> >> +                       goto restore_gc;
> >> +               need_stop_wb =3D true;
> >> +       }
> >> +
> >>         if (flags & SB_RDONLY) {
> >>                 sync_inodes_sb(sb);
> >>
> >> @@ -3006,7 +3020,7 @@ static int __f2fs_remount(struct fs_context *fc,=
 struct super_block *sb)
> >>         } else {
> >>                 err =3D f2fs_create_flush_cmd_control(sbi);
> >>                 if (err)
> >> -                       goto restore_gc;
> >> +                       goto restore_wb;
> >>                 need_stop_flush =3D true;
> >>         }
> >>
> >> @@ -3103,6 +3117,13 @@ static int __f2fs_remount(struct fs_context *fc=
, struct super_block *sb)
> >>                 clear_opt(sbi, FLUSH_MERGE);
> >>                 f2fs_destroy_flush_cmd_control(sbi, false);
> >>         }
> >> +restore_wb:
> >> +       if (need_restart_wb) {
> >> +               if (f2fs_start_cache_wb_thread(sbi))
> >> +                       f2fs_warn(sbi, "background cache writeback thr=
ead has stopped");
> >> +       } else if (need_stop_wb) {
> >> +               f2fs_stop_cache_wb_thread(sbi);
> >> +       }
> >>  restore_gc:
> >>         if (need_restart_gc) {
> >>                 if (f2fs_start_gc_thread(sbi))
> >> @@ -5497,6 +5518,12 @@ static int f2fs_fill_super(struct super_block *=
sb, struct fs_context *fc)
> >>                         goto sync_free_meta;
> >>         }
> >>
> >> +       if (!f2fs_readonly(sb)) {
> >> +               err =3D f2fs_start_cache_wb_thread(sbi);
> >> +               if (err)
> >> +                       goto stop_gc_thread;
> >> +       }
> >> +
> >>         /* recover broken superblock */
> >>         if (recovery) {
> >>                 err =3D f2fs_commit_super(sbi, true);
> >> @@ -5519,6 +5546,8 @@ static int f2fs_fill_super(struct super_block *s=
b, struct fs_context *fc)
> >>         sbi->umount_lock_holder =3D NULL;
> >>         return 0;
> >>
> >> +stop_gc_thread:
> >> +       f2fs_stop_gc_thread(sbi);
> >>  sync_free_meta:
> >>         /* safe to flush all the data */
> >>         sync_filesystem(sbi->sb);
> >> --
> >> 2.49.0
> >>
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>

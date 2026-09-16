Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE938469834
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547825; cv=pass; b=NouHUduAwtIfTXNczXJvUEi0aMnzoun4iyrdwm9u5rlYzaz/n9MtZb5mVbr4R3EAaG6QbKQmIxCfxJ3qO2LJO2Ub5N5D8lP/qnzRVkOQ3ytdjCSjqh6eb82GW/RPvjoS0n6nH3di6q3Mh1pMqheOkEob4cXCwJb0W0uswuwo6R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547825; c=relaxed/simple;
	bh=v5htP4c9TAUa+ESqaHO1IuhZckPYrSY91AUudQo2Db0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRSJ9v7ZLMnqDzoOI1n0tcDY6INWLf4Eet8Q8a+bMxHs2HJK/ycRMmiAVjE4v6CUfns8JB+jgSOvaYwQyj3g6QI+kR42Kb051DGz4+aC8kT+pPLw0HFNrv5BquDoZ0njDGDzEMP/VvHYIxdQTtuDpeUyz7C/+YJ824ROwbuBDkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1didZ/P; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1didZ/P"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b31bf4so105469e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547822; cv=none;
        d=google.com; s=arc-20260327;
        b=Qg5fdztCzrEmex0lcfA/9UmQhGrxQIj7LGb52Fww4/I8DD7NaEsRsNLJXyofFaF+Oy
         EPqrkC0ykM2W6HHe16mTjs3z/La5SgTbJw10zOC3qREfFUVB2edu4SG7lXHDvCbFn7hj
         okApsKgStRoYuibf7PtL17D54gm+6HAsNFQtDyLauApaYQiCZcchcq5731hovvdJQl2n
         6b2qA3gz7tzdOj97f7EqKafNRgl8qypicramVMTR72yX4ykl4p0HDv5l5PvEB9Ul5Caz
         CcN51q5BGf+LiWfIlLZs4ZtvgSnoZmfrh2KmF2jR7/Mhn8PkvCF5XhBBVGiPoZYlznll
         RvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8aOEf3vLOEaCjWzs/u3oP6jIR06jn3+j+iVGKr8OVkk=;
        fh=sBuFh0gqz94bcJ1wnc8MStRh+dT5/fuSPUBec9jD8NQ=;
        b=kxWyvdldQBPQtBlrx7xSF3n8axx6FlNb69hXx+RMFmOrL+kLRuU3E61jNM2uXXMWda
         PfRGGS2GlmlSNI3LaqZ0G5FETef/eEEo38VZz+SevRCm1Q3PEsjnKy29Mo9clKQHG4on
         C0tzEgyVe8w5LJohG54WSxSyQg+AJg1cM4DDG8rc22lCXDc/tOXNojOPD3Tb6orm9LEf
         HAF8WhNgnfZsZl3aOmBgB6QMMh+cB8EzIhexvY2jM1VUaJZRcwkC5SxkZQj/OqqyJRQy
         Y3MFoPTVJCXRihvE79b2ty3TSEkWz1p4A3Ot6fgs4Bd38eosL5E+qAcT/am7v27V1arC
         vevA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789547822; x=1790152622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8aOEf3vLOEaCjWzs/u3oP6jIR06jn3+j+iVGKr8OVkk=;
        b=o1didZ/PDNVK21z5f4J6Gih4Ro5AplY5tZLNUQEkcver0hAGXtMnasDMw8g06pQ6PW
         ClGQAdpiuSH9whkAHs66CEnyl4mYccY7Xkohr4xk6C4iKV4dkrrCOdUgEAm687SbgLf5
         lwN7Rf9RxruBVsGE9W2BuuL/UlPZYLjYFodZRXURxGg0kHb2vXu8qGK30nFqgozKq8Jo
         XIAfchkElVeM7ufywzSPN56aovAPOCo9cCP0K/62odlGoToFpxsplGvmkDRPqRBhTlW3
         bSe36gPAKv31C/jvBCORKEQt0a/dnMZQXLAGefaZGrDIfTRnDoe9nxj2Sj4yp46dTqnZ
         KBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547822; x=1790152622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aOEf3vLOEaCjWzs/u3oP6jIR06jn3+j+iVGKr8OVkk=;
        b=VgqzmKlZDNYflOfr5wMRblx/ipkz4Dcn+eMrIMDqhq/69SaN19WwJSz29eyFcEWCHJ
         xEYIUP6jW+L7qILLQbqvlzUO0aQANgn2I2RMa1P4TRrnaZuklowZ633eJnttGoyBJtNn
         N4tdIMSfxmteq4k/RcbXO6Q7yHLT64mHCPxRaXiVuGg6+lUitQqreGB328yqDb4UGFqK
         OUhkzUZfAXbTBQ1dtyx1WsM56qV+yz5OG+e/hgYqSlOcCAE3XyNk2yIFh912J5ZIU9w6
         O95sroUb8hIk0p8sQ6RdA5NYWjdT97x7HhNbfCuD100O0PUYtFf9OIwLhwUYyAyqMmrp
         SECw==
X-Forwarded-Encrypted: i=1; AKwUvBw7vyNi7DMpHeLdXYtfO+cvMI2JIBFqREHa+pkiVxFwD9zKTD4UQd9o3f200k7Kmd2YGLnle9WyvUUeA5o=@vger.kernel.org
X-Gm-Message-State: AFuF++kYQn/MI9JaCRWB0nD7j0SxdVbPCN3XzvSr5HYXcjlevj0Hp6r2
	VKbt3wVl5LZ0wbn/BxN2v7lrakgYfTzt586ASb7Jp+EFBgNmllz34hjj4FdIz0SAjH4WPZgZXjx
	gcv/q8tiy8/HGGL2PyupixhUPSh9gYCk=
X-Gm-Gg: AYBFou1S2GWGauT5BTwNrVPqHePp5T0ilkEHyePILCABk5gfMT/kBKzxBd3cUZ9v5b9
	V0rpSBXyJz1kEWwOebQ51TDSef5nOb06Ug1GeuHPjt1NF3eR4Qyw3t8kEcGp1a1fYyX/c9Pqmkj
	QbcrIqfbHxPk4UPBkecTkbnI8CyW2TArHl8IrOeW9vQ12mwUDoH4KAt99tfOcexStsB1ey0JW4m
	NJxL9WVicXwCoCa7SmtiI2twhlEULURWpV4wKVhJXrLe+L0VWorPmsKgtdS1HCPjWZMMzu/j0kC
	RlhlMkPPWEsv06xcz4sLd1Elqnmu53mhKrkD8qPXz01z4WrHW7QGnzOL
X-Received: by 2002:a05:6512:3b2a:b0:5b6:1913:8d38 with SMTP id
 2adb3069b0e04-5b8b66ae2b5mr398441e87.6.1789547821349; Wed, 16 Sep 2026
 01:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916015440.2232938-1-chao@kernel.org> <20260916015440.2232938-5-chao@kernel.org>
In-Reply-To: <20260916015440.2232938-5-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 16 Sep 2026 16:36:22 +0800
X-Gm-Features: AcwNN1X9oU0avqokHQ5HqXHNmmyFEyBuuBpY7wDWHPm6TByjGO6o3Ly27WlDi_Q
Message-ID: <CAHJ8P3+Qd3MNnbO-Ez5zy3EiTR7_F-45S2QzEBJNmkW-KxhAZQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v8 04/12] f2fs: cache: introduce writeback thread
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 09:57=E5=86=
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
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
>  fs/f2fs/cache.c                         | 69 +++++++++++++++++++++++++
>  fs/f2fs/cache.h                         | 11 ++++
>  fs/f2fs/f2fs.h                          |  3 ++
>  fs/f2fs/super.c                         | 33 +++++++++++-
>  fs/f2fs/sysfs.c                         | 13 ++++-
>  6 files changed, 132 insertions(+), 3 deletions(-)
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
> index 563615761d11..d8504f7dd692 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -626,3 +626,72 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info =
*sbi,
>  {
>         return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>  }
> +
> +static int f2fs_cache_writeback_kthread(void *data)
> +{
> +       struct f2fs_sb_info *sbi =3D data;
> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread;
> +       wait_queue_head_t *wq =3D &cache_thread->cache_wb_wq;
> +
> +       set_freezable();
> +
> +       while (!kthread_should_stop()) {
> +               unsigned int interval =3D cache_thread->cache_wb_interval=
;
> +
> +               wait_event_freezable_timeout(*wq,
> +                               kthread_should_stop(),
> +                               msecs_to_jiffies(interval));
> +
> +               if (kthread_should_stop())
> +                       break;
> +
> +               if (f2fs_readonly(sbi->sb))
> +                       continue;
> +
> +               if (f2fs_cp_error(sbi))
> +                       continue;
> +
> +               if (unlikely(freezing(current)))
> +                       continue;
> +
> +               if (!sb_start_write_trylock(sbi->sb))
> +                       continue;
> +
> +               sb_end_write(sbi->sb);
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
> index 6c38fc9e18f6..9a7053a9af66 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -205,4 +205,15 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_=
list *cache,
>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>                                 unsigned long nr_to_scan);
>
> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
> +
> +struct f2fs_cache_kthread {
> +       struct task_struct *cache_wb_task;
> +       wait_queue_head_t cache_wb_wq;
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
> index bc3d378371e5..9004456b079d 100644
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
> @@ -5527,6 +5548,12 @@ static int f2fs_fill_super(struct super_block *sb,=
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
> @@ -5549,6 +5576,8 @@ static int f2fs_fill_super(struct super_block *sb, =
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

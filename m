Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969C4562BA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773085; cv=pass; b=GZ4ANNDwJH/KEM/hiRevKCPO6mHqe0JD++PWP/H9KpcfuBqtmm0UjGz4cGgGtxcGtR4L/Myt7euFhe5rZ2U4xQ4MqJh9fi0E7sZFlxKoJWzA1eJ1up5ilDUvXP1QRdLcYkJ9DlLk6W8PpNqLzFlQokXgUvUSZ6wIJFqi4ykJMyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773085; c=relaxed/simple;
	bh=OcHge7s0DZwL3EKcgVXFZLGOqWajSFPSWQjzS3t5ZAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNuSewJQjFKA7NYKelDDuN3bAt9ZpSV4Q//tuyNGM2Knw767HhxkekMYZi0zy1f9aSJny7QkQ9Z6Pzm6JBL8qDViFQmFbfwN9+yEFnnt53iwIMKP25kTUmt6hlmxAKNcmRULuANJWd4VxchOXgbirVoSrYbl76TetlWbqcg9LQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMJ27tJy; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMJ27tJy"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1254014e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787773065; cv=none;
        d=google.com; s=arc-20260327;
        b=jv2vbsoGTiabu3+Fu0yu5g+x5A+VL7gWxb4AXS9Nm/lehMPYnvG1neoYhVp1qndp/A
         mv0afdtfz7v1AeeXYA3gEwXfrtyngQ/NLy3K9e5vKhnGcQdBVShUbw3OdRUa+mHK6eY7
         tW1UFrd6G/nMrj8J+/ZY0r2wOm2m4y2pMjc+feIwf6lrf2vfQYPta/Js4nAVB5skbFDc
         jlKo57iaK2sdqrX5HvkGwiNNy+BZSiX51aHT7mTYP6QC9FSVEY5uvdX3sw8OV47NRoRy
         CACmWc09BOKNkx2E/attDqGnCu5UiTS1s9kaKgSOnsTTL3inAirrmuednibV5gFamwaj
         7zAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H84eDPOKpJkVt3S/d5o9xAl9l94PSSYoJJQLT6hvIdY=;
        fh=HF3xtcQr/cP5Y8mA9euNKkngatTcdglJwUtfNmd5ZVw=;
        b=qON08dxjzbHewDvifHz1JfV1rOw10XSw2NOz3HVSgxMYzvJJoKtbLLJTo+6iSjW9lL
         HvZyX492cpPoIyNjNVoRVETJXAJ1JwfbCjUIcE4rUVJUBRGe6V8L2Wrx4IoIePKcngR6
         utOpFkQp90DZEwRbjWEQeje0kMM3ZLpDvop4eDxIHkaesMr8JP2iT3qBVM2Tuph+d3MG
         lDj5fbxKk7hb06pMSwDtt4/4ZK6ExlzQ3D+2Z48TmKWD04MpWyhNXSQMM3zNikQM0wgW
         E/MbGQ/jcN97l1NcqM6tu1psFtwk1HvFnyM3tK77dAMJ4s3hbD28aXTEMShAkFPQOF4U
         Glhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787773065; x=1788377865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H84eDPOKpJkVt3S/d5o9xAl9l94PSSYoJJQLT6hvIdY=;
        b=kMJ27tJy8LanZlrD3PnGyb6zkJD5RWnkL6WajSll//d6JPx96FAaunxUg2mqlRgshK
         xNm2Qi4wuKfANnD8vNJy9ViKNkLk8gZeE9OB68xWpyEJFYX/ckV8ExkioIUUnt0XDx6s
         ArMXcepJ7jxB0BiBIirvftZs4dly7aRrz+ohI7NAU0R+DEmirPTnTxwsqE9gY/lrtcj4
         HkqnGidROGu8q1bni8SEW7NOfm21ZSvkZlUtQ5krKPH2ku/XwPcfXIcmm5DHy00pDwGr
         RXiCaE4WhcYKp4PbrrMWMtYovPBsXxeO2Ktc70LjOqt60ogU1/YqaQQZiVwugUj3+cfU
         rCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787773065; x=1788377865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H84eDPOKpJkVt3S/d5o9xAl9l94PSSYoJJQLT6hvIdY=;
        b=TS3PiESCNXanwQHxJRfVWq0rqddTlVgf91g4b/OTkLdle2soyGo95/ngubSPrGjpt0
         TfNeJC13LILOtkELT+Rml8Nt0T7V4m9SCp82TLdKhmgLZ86d3K+uY2KiiUNmwywiURg6
         REYkfz7sfo3piRX2VormCBlHfsGInUUYDylnofBa584MLuBs5lb+Yy7XHZIvAhgWPiCt
         9KmPE/mLZW5b9oa0Oyguxm8rmyOXdWKULlptB/6mxqCJ05wJKd2AevcFqSpW1mnGD/d5
         pAI8Rc/U3h051ZGylXA1OlZz4n05ql6nUjZFXDCUeh98kU1Mo4GHtCYzVpLgVgHtI0Tt
         52tA==
X-Forwarded-Encrypted: i=1; AHgh+RokQSKEG5tOkBREi4kp7xGPg6XaXFSihNPcBjwBnwM4MahfFdZ/UuvuCBbF+MgbTJ+nuJFet6cs2spj6vU=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Mu8hNvrlziT/+LyA1lsRktw5GXc/V9BMb8sSV9WhiMvWxwAy
	UuiHFF0Q6eqIdjWZBdaAPnJs7vzeHxB/bcrrbCAy5jLhc6NKXfQ3jYIjpA4mSQAf4HrukHv203u
	qdaoX7eybI68XEd/rT5YvYlydZ3tt6YD++TOXh+A=
X-Gm-Gg: AR+sD12O4El0JLtl7JBbMrZdOOjzhw1tpSnmBKoNm82XrORCgFeBatvkcVX4pL3esDr
	OrWSg5lWCCk6c6uKVxyG72RK17PsuWYWe5og3qEmpEqYiTE7lWXqelpu2wpaiGqqntWADo3+2Rk
	X4W/XuXDWN/dhGBp1fKe3Pe1nDzR04xFiKxpbLWh8xBnmGd/XdNIqMieWjjPH2JYT/EZ5ZN1cSG
	PsraSZDSp58J5yN3hzG6JEUkvXTlHbJctIBVO84YNYBNiOvRZuEBqAAmahpufsqUjf/sxUngWCi
	rSrgq2Rl/4mtU6LLObNM+Qg5E1oSrhorU6UAXHt/TRVBzGHAUzyCOkh0YDlWaKuCN0olRWr/psd
	o8fttxCQSn1a4y/Xqnt2458FjVu2M53gRDQ==
X-Received: by 2002:a05:6512:2342:b0:5b2:a1fe:5e86 with SMTP id
 2adb3069b0e04-5b4a8fdab25mr2721390e87.1.1787773064619; Wed, 26 Aug 2026
 12:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-5-chao@kernel.org>
In-Reply-To: <20260825130126.2078627-5-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 26 Aug 2026 12:37:32 -0700
X-Gm-Features: AcwNN1WX8gx_eE5BmjxC6VUSPsThB4tes96U7e4BTD4rmiSXWeNrMSFYHcJIp5k
Message-ID: <CACOAw_zrWasT=zW1yGSXQKzbj6u5v41MgLQhUjO2yxKYqca8TQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 04/12] f2fs: cache: introduce writeback thread
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 6:06=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> This patch introduces a background writeback kthread (f2fs_writeback-x:y)
> to periodically flush dirty metadata cache entries with a default
> interval of 5 seconds.
>
> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
> transitions, and hooks synchronous flushing into checkpoint commits.

What do you mean by the above line saying "hooks.."?

>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/cache.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/cache.h | 13 ++++++++++++
>  fs/f2fs/f2fs.h  |  3 +++
>  fs/f2fs/super.c | 31 ++++++++++++++++++++++++++-
>  4 files changed, 102 insertions(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> index 3cee33c69880..dcfea6c2e1bb 100644
> --- a/fs/f2fs/cache.c
> +++ b/fs/f2fs/cache.c
> @@ -615,3 +615,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info =
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
> +       unsigned int interval =3D DEF_DIRTY_CACHE_TIMEOUT;
> +
> +       set_freezable();
> +
> +       while (!kthread_should_stop()) {
> +               wait_event_freezable_timeout(*wq,
> +                               kthread_should_stop() ||
> +                               cache_thread->cache_wb_task =3D=3D NULL,

Maybe a redundant check?

> +                               msecs_to_jiffies(interval));
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
> index 618b377590da..ff3d8781119c 100644
> --- a/fs/f2fs/cache.h
> +++ b/fs/f2fs/cache.h
> @@ -187,4 +187,17 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *=
sbi);
>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>                                 unsigned long nr_to_scan);
>
> +#define DEF_DIRTY_CACHE_TIMEOUT 5000

Maybe this one should be tunnable, right?

> +
> +struct f2fs_cache_kthread {
> +       struct task_struct *cache_wb_task;
> +       wait_queue_head_t cache_wb_wq;

There is no wakeup all around the patchset. Is this for future usage?

> +       atomic_t cache_wb_trigger;
> +       unsigned int cache_wb_interval_ms;

Plz, remove unused fields from above struct.

> +};
> +
> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
> +void f2fs_sync_cache_wb(struct f2fs_sb_info *sbi);

dead code?

Thanks,

> +
>  #endif /* _LINUX_F2FS_CACHE_H */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0f855ac7d1e8..9fe9fadbb810 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2111,6 +2111,9 @@ struct f2fs_sb_info {
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
> index 32e80c70e141..9bb19f4c5fd2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2020,6 +2020,7 @@ static void f2fs_put_super(struct super_block *sb)
>          * flush all issued checkpoints and stop checkpoint issue thread.
>          * after then, all checkpoints should be done by each process con=
text.
>          */
> +       f2fs_stop_cache_wb_thread(sbi);
>         f2fs_stop_ckpt_thread(sbi);
>
>         /*
> @@ -2826,6 +2827,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>         unsigned int flags =3D fc->sb_flags;
>         int err;
>         bool need_restart_gc =3D false, need_stop_gc =3D false;
> +       bool need_restart_wb =3D false, need_stop_wb =3D false;
>         bool need_restart_flush =3D false, need_stop_flush =3D false;
>         bool need_restart_discard =3D false, need_stop_discard =3D false;
>         bool need_enable_checkpoint =3D false, need_disable_checkpoint =
=3D false;
> @@ -2984,6 +2986,18 @@ static int __f2fs_remount(struct fs_context *fc, s=
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
> @@ -3006,7 +3020,7 @@ static int __f2fs_remount(struct fs_context *fc, st=
ruct super_block *sb)
>         } else {
>                 err =3D f2fs_create_flush_cmd_control(sbi);
>                 if (err)
> -                       goto restore_gc;
> +                       goto restore_wb;
>                 need_stop_flush =3D true;
>         }
>
> @@ -3103,6 +3117,13 @@ static int __f2fs_remount(struct fs_context *fc, s=
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
> @@ -5497,6 +5518,12 @@ static int f2fs_fill_super(struct super_block *sb,=
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
> @@ -5519,6 +5546,8 @@ static int f2fs_fill_super(struct super_block *sb, =
struct fs_context *fc)
>         sbi->umount_lock_holder =3D NULL;
>         return 0;
>
> +stop_gc_thread:
> +       f2fs_stop_gc_thread(sbi);
>  sync_free_meta:
>         /* safe to flush all the data */
>         sync_filesystem(sbi->sb);
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

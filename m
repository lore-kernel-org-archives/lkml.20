Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C5391845
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462720; cv=pass; b=W8+JRzjfVWiKb0NdilEIv8PSayItawmgCV3VLqTi1YF6hE7vfRZIUfpvk8IGU4pIyuCok720ZPStlaO+XdidqBAthSDwik5iBlbZr1XEOyvHMVYinR3LPNpItTRYYkuXXTbZXyNZBGAWSLGsyHFmyZwXQ7imOqIdW3MrvIDk3WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462720; c=relaxed/simple;
	bh=vIashNltpPDTAZYAgYklngE1UEokGyob1GePJ63Rjj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwDU/mhVnG+5nwskO9TWkk8I8x13nYrnYLKQe5CxQiEXw+t0VkFpRDnRi3MawYWO+AkI56zZAJCVHT8yJ71r5y2Q3A8IG6/G18CCwLCa9LrVrL9NdCk5ySCuaLZvhexYXdA1tyah9UeOwJJYR4POUf2AFl5MBXrHGNS7AOcLGr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnomGYWo; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnomGYWo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6af07e08so1572845e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:58:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789462717; cv=none;
        d=google.com; s=arc-20260327;
        b=EQxuKjq66ny+Oa4Wt3+Xr2J549KkNAubmmLgojaiAqZTrmPxSNFRYeD6pmH7Ryg0lM
         q27qz9U2xhO44mGVOknqvg4q/31OCJRQZDvd0B/hrZ0kIWWTzNh3dBkBI2eJQUiKfWvK
         ABqMSZGiKOVIqLbuwDSbzsQ7dxyBjCGkP2C25bFze7KSKa65Bz1bRt+QVHN4xUqDsfjE
         oCNYn/eRA0QyNA5FyxymJ5q7VsisSbrVS+2tHXyd+cuGT8NTYlsbfFL/II2qz0xIzKZV
         R/BSBduI6x1r/PZz9ceVQAWiDwQMzNELznlgyzVRuOmul0oDKZkTLfAWeamM8XpaQcE0
         86cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dCMKgIoutgRI2Ypp0WtQxBZAYSPA4UG0J9gt8Q/sqKs=;
        fh=GN9wEX8Kgai4zqR88KusSnHVcRfHO3xwElpc2UQSztI=;
        b=G23Hw45eFcWBZ4pQFVcK/z9V6K8S6Gu0LiLbVTD+4LELAn7Fch9NJwbfofZA5JRLQi
         ItOpCV4AtRkAywE2CO1SsBJ1+kIm6GFs31tZ+0tRvMQKTzScXVn62pmxsc6hrfnfu/6Z
         THxbLFkNhpagSFPGGfznA/iheCD31HjWVSvWWS04N6UZNgYEd+kRNGnG30MKJR+4dUg5
         +s9b1WtVENMaPiBF/i7e1ILrTLw3S+Mba7PV+Rrwcb2etcbwufm79NQ9P7O654c3ivBi
         7ifTuzPoiR7tI8Igh2K6MCygeQTry4SD3lYtWExD9zhW+mZL8NGjn3Hn+3XvR51QGo6v
         tm+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462717; x=1790067517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCMKgIoutgRI2Ypp0WtQxBZAYSPA4UG0J9gt8Q/sqKs=;
        b=WnomGYWoOZMifXD3xqubJ8zt/gOdswH8dUVIo4wOZgMdtMLAznLgOuVEqj1fsCvh85
         t4IjArPBmjigdWLk2v769V+1IFLurjU8UgaIexaeNhKA2KfOThbMslN6iplLbYWZM10B
         cq+t1VW3Pp3qBYscvIeqKqdCO1NmrmsBxVgBCbn6YUDAeLdgoinqxd0oJSKqq177ejQ4
         3+T6kySGHIKZrhoEdo1cXliXeUARlU0vYRhbvvNtAvMc2zj05NFxl8h/89ELVlys+LT0
         gSd0vLXRYv1FhUg8EMYut9lRysWWuFzY6ZYXsuTrQIAbD90vFygD6QHVJroVNt55kO5/
         IuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462717; x=1790067517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCMKgIoutgRI2Ypp0WtQxBZAYSPA4UG0J9gt8Q/sqKs=;
        b=wafII/uwt1FmY0Iw7WM5r9u5pJXtr3XenR8LtD2rYHBR5EgEZnMexjNqvZcUVKFS0T
         Xblzt/1QYpRNUSwk32rMmJttWgnb+fJxxcJmgWRX8p5WOsxJg1MPm4+uVSWJ+KaenGFi
         jE5O+bgYJ2FETfyQg0sem3txEbbGBN3py3pEYQ1codxWFfsWLFBs38FYHP0ucJtMDM2Z
         4Q2RWYcAZLA2Oo1yKLuBp5RHBgAjIXJkv0niKMpGEzuD5V68sAX/bM/+6TPsCQTZBwvq
         +Nmb7cRHg7IaGSdYnAkNvuT68AYtExhq9AAUVfqpbTITM1xBlcuauP9ryKNlV3zq/QVh
         Kjpw==
X-Forwarded-Encrypted: i=1; AKwUvByFRhzlLL0ciZgbA6rVReLeANgHCMUusGItnLmdVvUHZTE67LKczpxyHqj0zM7VXI5+h/BsdI7LJqfNEi4=@vger.kernel.org
X-Gm-Message-State: AFuF++lOSP4by58UXdaZbeZpzMITFd4/U918H13ymM+Cq/lOWOUUY00y
	7UO3lVfZtS/hG5CPk4iMV2g7LkPwJGysgVa8L9yWDP7hGlnQZdOP2tckr+nIHJu+a7YJ2M/QF6o
	xJMVNm5gk+HisYCJo1/OjgNJsPPRxg7A=
X-Gm-Gg: AYBFou3CLDtU9ijDEgwGliceWfER9c7C4/o4TaRrX0Dl6PWA4e8yXLCZUR2u2C58Xjs
	Cnjabge/LeH1XDlm8ydD+DLExV6/kE5cSuYlee9L8iddGeFx+dWNVY7HcaHUuGxbD9fKqPHTeSp
	J+J26guYTrevyar7FHmCEQFdX7NjSmifY2GnKasoatLgLGCauX/vIDdb2SiuFi1NCTqhyuTkXzI
	dO4r9Jrd/bgic2YGDXENkfzvUeJuPaSvJUL9SAPhYxj35wWgMR0U7wSPXH84FgfDULZ62zby19z
	ZlDDHJGR0+kuFTf5Pt0aCXFMa8gy3fQnjVh8r/XNTUof0XrhlsknwwU+5L1W/TUMRGo=
X-Received: by 2002:a05:600c:19cf:b0:49d:1da4:511b with SMTP id
 5b1f17b1804b1-49e7a6859e1mr68986715e9.1.1789462716687; Tue, 15 Sep 2026
 01:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911232405.1815804-1-chao@kernel.org> <20260911232405.1815804-5-chao@kernel.org>
 <CAHJ8P3++-+J4EpkFrsHAX4=tSVvJS24R2BRvTpKe4_vT84fgpA@mail.gmail.com> <420b564b-c40b-4618-b072-7c169eca2f87@kernel.org>
In-Reply-To: <420b564b-c40b-4618-b072-7c169eca2f87@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 15 Sep 2026 16:57:58 +0800
X-Gm-Features: AcwNN1UEJDY6yb6lIlMAU5mFHVktg2lkqBJX0QQOSLiCg5JBG377MjkgdZXdC0g
Message-ID: <CAHJ8P3+qZv_U7HTmFBBytywiCUWYpPLQ2vKfw5Vy6UqsxJP9zA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 04/12] f2fs: cache: introduce writeback thread
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu <chao@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C 10:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Zhiguo,
>
> Thanks for the review, let fix them all.
>
> Thanks,
>
> On 9/14/26 17:08, Zhiguo Niu wrote:
> > Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> > =E4=BA=8E2026=E5=B9=B49=E6=9C=8812=E6=97=A5=E5=91=A8=E5=85=AD 07:28=E5=
=86=99=E9=81=93=EF=BC=9A
> >>
> >> From: Chao Yu <chao@kernel.org>
> >>
> >> This patch introduces a background writeback kthread (f2fs_writeback-x=
:y)
> >> to periodically flush dirty metadata cache entries with a default
> >> interval of 5 seconds.
> >>
> >> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
> >> transitions.
> >>
> >> It introduces a sysfs entry /sys/fs/f2fs/<disk>/cache_wb_interval to c=
ontrol
> >> writeback interval.
> >>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
> >>   fs/f2fs/cache.c                         | 56 +++++++++++++++++++++++=
++
> >>   fs/f2fs/cache.h                         | 12 ++++++
> >>   fs/f2fs/f2fs.h                          |  3 ++
> >>   fs/f2fs/super.c                         | 33 ++++++++++++++-
> >>   fs/f2fs/sysfs.c                         | 13 +++++-
> >>   6 files changed, 120 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/A=
BI/testing/sysfs-fs-f2fs
> >> index 0cebc89799dd..d2665b7f1f14 100644
> >> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> >> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> >> @@ -1020,3 +1020,9 @@ Contact:  "Daeho Jeong" <daehojeong@google.com>
> >>   Description:   This is a read-only entry to show the upper bound sec=
tion number
> >>                  for pinned files. Pinned files will only be allocated=
 within
> >>                  sections 0 to pinned_area_max_secno - 1.
> >> +
> >> +What:          /sys/fs/f2fs/<disk>/cache_wb_interval
> >> +Date:          August 2026
> >> +Contact:       "Chao Yu" <chao@kernel.org>
> >> +Description:   This is a writable entry to control writeback interval=
 of
> >> +               f2fs_writeback-x:y, by default the value is 5000, unit=
 is ms.
> >> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> >> index 563615761d11..404ceac9e6bf 100644
> >> --- a/fs/f2fs/cache.c
> >> +++ b/fs/f2fs/cache.c
> >> @@ -626,3 +626,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_in=
fo *sbi,
> >>   {
> >>          return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
> >>   }
> >> +
> > Hi Chao
> >> +static int f2fs_cache_writeback_kthread(void *data)
> >> +{
> >> +       struct f2fs_sb_info *sbi =3D data;
> >> +       struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread=
;
> >> +       wait_queue_head_t *wq =3D &cache_thread->cache_wb_wq;
> >> +       unsigned int interval =3D cache_thread->cache_wb_interval;
> >> +
> >> +       set_freezable();
> >> +
> >> +       while (!kthread_should_stop()) {
> >> +               wait_event_freezable_timeout(*wq,
> >> +                               kthread_should_stop(),
> >> +                               msecs_to_jiffies(interval));
> > if wb thread is running and user set cache_wb_interval at the same
> > time=EF=BC=8C the wb thread can not get the new wb interval value for n=
ext
> > round? because local varible is used here
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
> >> +       cache_thread->cache_wb_interval =3D DEF_DIRTY_CACHE_TIMEOUT;
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
> >> index 5728e2225465..ea0cf9adf194 100644
> >> --- a/fs/f2fs/cache.h
> >> +++ b/fs/f2fs/cache.h
> >> @@ -209,4 +209,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_inf=
o *sbi);
> >>   unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
> >>                                  unsigned long nr_to_scan);
> >>
> >> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
> >> +
> >> +struct f2fs_cache_kthread {
> >> +       struct task_struct *cache_wb_task;
> >> +       wait_queue_head_t cache_wb_wq;
> >> +       atomic_t cache_wb_trigger;
> > not used?
> > thanks!
> >> +       unsigned int cache_wb_interval;
> >> +};
> >> +
> >> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> >> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
hi Chao,
Another minor issue: seems these 2 function has been declared twice.
thanks!
> >> +
> >>   #endif /* _LINUX_F2FS_CACHE_H */
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 85c4bf40b4aa..c0f82b63d732 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -2110,6 +2110,9 @@ struct f2fs_sb_info {
> >>
> >>          /* f2fs internal cache */
> >>          struct f2fs_cached_block_list meta_blocks;
> >> +
> >> +       /* internal cache flush thread */
> >> +       struct f2fs_cache_kthread cache_thread;
> >>   };
> >>
> >>   /* Definitions to access f2fs_sb_info */
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> >> index b731b9bb7b54..516b4ee12564 100644
> >> --- a/fs/f2fs/super.c
> >> +++ b/fs/f2fs/super.c
> >> @@ -2039,6 +2039,7 @@ static void f2fs_put_super(struct super_block *s=
b)
> >>           * flush all issued checkpoints and stop checkpoint issue thr=
ead.
> >>           * after then, all checkpoints should be done by each process=
 context.
> >>           */
> >> +       f2fs_stop_cache_wb_thread(sbi);
> >>          f2fs_stop_ckpt_thread(sbi);
> >>
> >>          /*
> >> @@ -2845,6 +2846,7 @@ static int __f2fs_remount(struct fs_context *fc,=
 struct super_block *sb)
> >>          unsigned int flags =3D fc->sb_flags;
> >>          int err;
> >>          bool need_restart_gc =3D false, need_stop_gc =3D false;
> >> +       bool need_restart_wb =3D false, need_stop_wb =3D false;
> >>          bool need_restart_flush =3D false, need_stop_flush =3D false;
> >>          bool need_restart_discard =3D false, need_stop_discard =3D fa=
lse;
> >>          bool need_enable_checkpoint =3D false, need_disable_checkpoin=
t =3D false;
> >> @@ -3004,6 +3006,18 @@ static int __f2fs_remount(struct fs_context *fc=
, struct super_block *sb)
> >>                  need_stop_gc =3D true;
> >>          }
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
> >>          if (flags & SB_RDONLY) {
> >>                  sync_inodes_sb(sb);
> >>
> >> @@ -3011,7 +3025,7 @@ static int __f2fs_remount(struct fs_context *fc,=
 struct super_block *sb)
> >>                  set_sbi_flag(sbi, SBI_IS_CLOSE);
> >>                  err =3D f2fs_sync_fs(sb, 1);
> >>                  if (err)
> >> -                       goto restore_gc;
> >> +                       goto restore_wb;
> >>                  clear_sbi_flag(sbi, SBI_IS_CLOSE);
> >>          }
> >>
> >> @@ -3026,7 +3040,7 @@ static int __f2fs_remount(struct fs_context *fc,=
 struct super_block *sb)
> >>          } else {
> >>                  err =3D f2fs_create_flush_cmd_control(sbi);
> >>                  if (err)
> >> -                       goto restore_gc;
> >> +                       goto restore_wb;
> >>                  need_stop_flush =3D true;
> >>          }
> >>
> >> @@ -3123,6 +3137,13 @@ static int __f2fs_remount(struct fs_context *fc=
, struct super_block *sb)
> >>                  clear_opt(sbi, FLUSH_MERGE);
> >>                  f2fs_destroy_flush_cmd_control(sbi, false);
> >>          }
> >> +restore_wb:
> >> +       if (need_restart_wb) {
> >> +               if (f2fs_start_cache_wb_thread(sbi))
> >> +                       f2fs_warn(sbi, "background cache writeback thr=
ead has stopped");
> >> +       } else if (need_stop_wb) {
> >> +               f2fs_stop_cache_wb_thread(sbi);
> >> +       }
> >>   restore_gc:
> >>          if (need_restart_gc) {
> >>                  if (f2fs_start_gc_thread(sbi))
> >> @@ -5529,6 +5550,12 @@ static int f2fs_fill_super(struct super_block *=
sb, struct fs_context *fc)
> >>                          goto sync_free_meta;
> >>          }
> >>
> >> +       if (!f2fs_readonly(sb)) {
> >> +               err =3D f2fs_start_cache_wb_thread(sbi);
> >> +               if (err)
> >> +                       goto stop_gc_thread;
> >> +       }
> >> +
> >>          /* recover broken superblock */
> >>          if (recovery) {
> >>                  err =3D f2fs_commit_super(sbi, true);
> >> @@ -5551,6 +5578,8 @@ static int f2fs_fill_super(struct super_block *s=
b, struct fs_context *fc)
> >>          sbi->umount_lock_holder =3D NULL;
> >>          return 0;
> >>
> >> +stop_gc_thread:
> >> +       f2fs_stop_gc_thread(sbi);
> >>   sync_free_meta:
> >>          /* safe to flush all the data */
> >>          sync_filesystem(sbi->sb);
> >> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> >> index aaca9ed9b169..ad25733e32c0 100644
> >> --- a/fs/f2fs/sysfs.c
> >> +++ b/fs/f2fs/sysfs.c
> >> @@ -40,6 +40,7 @@ enum {
> >>          RESERVED_BLOCKS,        /* struct f2fs_sb_info */
> >>          CPRC_INFO,      /* struct ckpt_req_control */
> >>          ATGC_INFO,      /* struct atgc_management */
> >> +       WB_THREAD,      /* struct f2fs_cache_kthread */
> >>   };
> >>
> >>   static const char *gc_mode_names[MAX_GC_MODE] =3D {
> >> @@ -98,6 +99,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_in=
fo *sbi, int struct_type)
> >>                  return (unsigned char *)&sbi->cprc_info;
> >>          else if (struct_type =3D=3D ATGC_INFO)
> >>                  return (unsigned char *)&sbi->am;
> >> +       else if (struct_type =3D=3D WB_THREAD)
> >> +               return (unsigned char *)&sbi->cache_thread;
> >>          return NULL;
> >>   }
> >>
> >> @@ -1008,7 +1011,8 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *=
a,
> >>          bool gc_entry =3D (!strcmp(a->attr.name, "gc_urgent") ||
> >>                                          a->struct_type =3D=3D GC_THRE=
AD);
> >>          bool thread_entry =3D !strcmp(a->attr.name, "ckpt_thread_iopr=
io") ||
> >> -                       !strcmp(a->attr.name, "critical_task_priority"=
);
> >> +                       !strcmp(a->attr.name, "critical_task_priority"=
) ||
> >> +                       !strcmp(a->attr.name, "cache_wb_interval");
> >>
> >>          if (gc_entry || thread_entry) {
> >>                  if (!down_read_trylock(&sbi->sb->s_umount))
> >> @@ -1218,6 +1222,9 @@ static struct f2fs_attr f2fs_attr_##name =3D __A=
TTR(name, 0444, name##_show, NULL)
> >>   #define ATGC_INFO_RW_ATTR(name, elname)                             =
   \
> >>          F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)
> >>
> >> +#define WB_THREAD_RW_ATTR(name, elname)                              =
  \
> >> +       F2FS_RW_ATTR(WB_THREAD, f2fs_cache_kthread, name, elname)
> >> +
> >>   /* GC_THREAD ATTR */
> >>   GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
> >>   GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
> >> @@ -1347,6 +1354,9 @@ ATGC_INFO_RW_ATTR(atgc_candidate_count, max_cand=
idate_count);
> >>   ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
> >>   ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
> >>
> >> +/* WB_THREAD ATTR */
> >> +WB_THREAD_RW_ATTR(cache_wb_interval, cache_wb_interval);
> >> +
> >>   F2FS_GENERAL_RO_ATTR(dirty_segments);
> >>   F2FS_GENERAL_RO_ATTR(free_segments);
> >>   F2FS_GENERAL_RO_ATTR(ovp_segments);
> >> @@ -1533,6 +1543,7 @@ static struct attribute *f2fs_attrs[] =3D {
> >>          ATTR_LIST(lock_duration_priority),
> >>          ATTR_LIST(adjust_lock_priority),
> >>          ATTR_LIST(critical_task_priority),
> >> +       ATTR_LIST(cache_wb_interval),
> >>          NULL,
> >>   };
> >>   ATTRIBUTE_GROUPS(f2fs);
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

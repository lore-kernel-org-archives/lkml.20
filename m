Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F7248F57
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791732867; cv=pass; b=t5rkn2I7eTGIzSd6+JOCl7fPLvyJRLFvnSBV2EHXPPSK2NW6oh1hODorpM69+qutQCS3xxCdF1wfwgaqdNV6r6T0gbTIk6ilRBs7jcLJNOzyDd1DN5QiZ89FIslKh9AYQCc5FW8HIgCaUTTGmXeUbXfPPKC4KVdumqsMsk55+xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791732867; c=relaxed/simple;
	bh=Sj5yyuPvYN6ZKvxEV4F1P5gDON53VA/IY3g49RSqFy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVkqVDcO63xsg+wnEsTHD9gUXCwNiLqD7lZ9/Tn/F79RDeN2pEmwcMGu2omhNm6FeLijGjnFpxw6VgM9/Eg5gzsVbU8QFORFQia7YqULTHabn/IwU8jbOBur905eBYhamjc0iqx6VRDSKf4Hj9GnMBa3D2ISPP0qpe+a0tfPYqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5fp8QMG; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5fp8QMG"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a9ad623098so10645151fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791732864; cv=none;
        d=google.com; s=arc-20260327;
        b=Xp18hBEQVxpkLQTW4bP6Pz6wNINQ2PIOayDatqpi8eJ6AvDEPYxkq7ZOY4QXUl+NDE
         UDNjtllg6rJMk3DU+ssRcyDZ9RiloQiYjRU1trS6tQvtusUEySTM7Kp5/2P72/WnmGFz
         5jyDbcNuKoJfops9LKqyxORglU2a1sG5gc8/Bi2JllUV9ShP5WOSsHio/EOFwGeD6bTV
         ggfegLckzHcLrqRxlGJz3vLQ33Ulzkf3sHLxZRBSjVbt8PcWB+4Q6GuuuWX3vdaG3Qfd
         knzVcsgc2SRuP2Ms3JF2it3VZHHIcB/8bBmHVrDLLTnRaBdQhx2pH/Dq2sjEi4DudHEQ
         aswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIqqDV705JeS8gKS9WKK7E1LbHj9qbphXeHw0zjFDGE=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=jQpDeFlg1Eeulbj9jprLCF6d8alrv3HgoHQeGMtwZz/3ppXNHQjlsFu862PnRJjPf3
         dmhLfjaUwtYsnpw+Zdbm/4bhH05gP3XsDe8gdMbWgJCyDzTZ0G9+qoURUWRSMDWoLh7O
         d9rD616lydeYT7yfxeB9Nhnv49IeTcyumUxW/daaFe9svBtgNm6NOL/eeaC8hkHnDk6T
         fLeQesEd53n/nGmCOfnDxJHchXc28HSD8s8h21y4RMR0pe8OkkVFmPF3v0Pbrv/Zjtww
         i+dR2wHWH2mE7MzrEfc2e/+/1GcUNsT7UOYo694TbrUdb+G2QWqnWa1Ooa08b1wfW3bk
         rqdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791732864; x=1792337664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIqqDV705JeS8gKS9WKK7E1LbHj9qbphXeHw0zjFDGE=;
        b=F5fp8QMG8uJiWNbFNsW/3cdilDuWtW41oFLhBThmT+XkRixtptT8bXvPGwOUDN2MSb
         WOhsvC/dB/hu2Kng9r5OqKxETlBVzRVhEJ42D7xgRLmiDpsH5rQtD5qIKy+AKfiY04mW
         HNo7o5+cuxzj2VPmOP/cQYA80aJN1CvEJad2jNKGjaXj82G59qsl/C355OlRBgkLSCYk
         12/j8PqMhBV3dcKU0s+ZsiSvaAgX3GxG+TY7KtA057LyzeLXkTJuifIkQI1n3bOI0dfF
         jpb+3Z7hH91fxa14rQuTnSb2hEVPYwRa4nRqhvEljRPoF7eSyOpwiO6w8thwL/NAZwCP
         z3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791732864; x=1792337664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIqqDV705JeS8gKS9WKK7E1LbHj9qbphXeHw0zjFDGE=;
        b=CDIG/X5PKK9OJhwhnw7WRiZ5fSh5qiLL9MDLijcew/6yyJi0eZ4ZtsI7Kz2bTCv2UZ
         2+Cwp2hWJ2gExi1h/wIUCpa5I9in24tTLZjc8X2FF6ujxw5iSXzJ0GofiRtA5e52gqch
         HoNiI0Mu32e57eHA61uS74yaGofmXvd+m/OVF2FvAyYvlyr92exiyNqKqfItiu2i85z+
         S343tIh1mz9yB5I4gRZplk6PRN0J//1homPHzWX3xBgYKZiO8cSWfLgCvqtQza+VR5FE
         ANuHF/YMoPgNmGSPa2osjCFdztO9Vfrd4p66EyLveE6CkxpSUVsh/qfsZwp4k6FG+KvM
         m/Xg==
X-Gm-Message-State: AFq9FYI2uSx1z0IpBvWYS17fWjasXJtrh1IBur/uvnz6cpg5FwXPLpKz
	gCZBCK3qRSQ8++4fr8srSco66iWo/wgSm6UH5swGgC+DpUYUGki+68i8yDvgjxZIEqrPxop3Cg6
	EAuUxU9hA/xY2pPQdWqLEtJGp/qqCIx4=
X-Gm-Gg: AYBFou01AeK0IGs3E2zxy3vYJffkNHFg3gTRolvtCF2CA2lWcZCs5gE9M3l5nkV+TVi
	vyleP/m8RBXIUNuHj/d++/Gg/6uvfrkImTz1btd0QHnnqdEl517W3yXIsDLfnhiS3Bkz9/Wg8vq
	buuAeWRyMs9LMXa5U+e6eX90xLF2IIGGHErRwvWRI5OnxRpp6T9zcrBIuXIY0nNZQxG82Jd1WTQ
	s3P6TKoln32YzxRnY0o7QeukS4Kgk+CTyPFLomY2X7o7//pi3QnMt+ZdaeMCiaVYgGJVAAcvmey
	45VYIXs3FfxZ8SCNOc9i756ldTa+fxlNqdDVEgkpYr26H15PTVbN9HzVwg8zHLTsxiPXzhfeHYX
	/Mn3QoRb81jqvJNAmsUlSg5ueQbyxjJaLNizs6ikMXEtT
X-Received: by 2002:a05:651c:1503:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3a9c55b5768mr19616651fa.15.1791732863780; Sun, 11 Oct 2026
 08:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007193131.1785199-1-daeho43@gmail.com> <dabc2517-6915-4df6-b638-9a7ec14efe70@kernel.org>
In-Reply-To: <dabc2517-6915-4df6-b638-9a7ec14efe70@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Sun, 11 Oct 2026 08:34:11 -0700
X-Gm-Features: AclHuK_koZl57lWSQnrPuaWVX5nhQYlN5RL0lPVYqKnVeV1x85oEtl185LETSfw
Message-ID: <CACOAw_wrHCPq=fxo4Zbpi4tmtDrYkWYdjvM3q7ySh2AxkaHqVg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache: wake up the writeback thread
 while checkpoint is disabled
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:22=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/8/26 03:31, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > Dirty node and meta caches are written back by the cache writeback
> > thread and by checkpoint. The thread wakes up every cache_wb_interval
> > (5 seconds by default) and writes at most 512 node caches and one
> > contiguous run of meta caches. Checkpoint, which f2fs_balance_fs_bg()
> > triggers when there are too many dirty caches, writes the rest.
> >
> > While checkpoint is disabled, checkpoint does not run: f2fs_sync_fs()
> > returns early and f2fs_balance_fs() returns before doing anything. So
> > dirty node caches pile up without a limit. They are kmalloc'd, and the
> > shrinker skips dirty entries, so this memory cannot be reclaimed. When
> > node and meta blocks were in the page cache, the dirty pages were
> > counted as dirty page cache, and the flusher threads wrote them back in
> > the background.
> >
> > A checkpoint=3Ddisable test that remounts the filesystem with
> > checkpoint=3Ddisable and runs fsstress -p 32 for 300 seconds left about
> > 160K dirty node caches (2.7GB of kmalloc-16k) with 16KB blocks and
> > about 226K with 4KB blocks in QEMU, and drop_caches freed none of them.
> >
> > While checkpoint is disabled, wake up the thread from
> > f2fs_mark_cache_dirty() once there are as many dirty node or meta
> > caches as f2fs_write_node_caches() and f2fs_write_meta_caches() collect
> > before writing, and let the thread go on without waiting while that is
> > still true and each round writes some of them. Each round writes the
> > same number of caches as before. Split nr_caches_to_collect() out of
> > nr_caches_to_skip() to share these numbers without the dirty_exceeded
> > check.
> >
> > With this, the same test keeps about 4K dirty node caches with both
> > 4KB and 16KB blocks. Nothing changes while checkpoint is enabled.
>
> I've sent a patch to wake up f2fs_writeback to flush dirty data according
> to configurable sysfs value, I guess it can fix your checkpoint disable
> case, please take a look.
>
> [PATCH 3/5] f2fs: cache: wake up f2fs_writeback when exceeding threshold
>
> Thanks,

Hi Chao,

Thanks, I think it covers my case.

Two things in v2:

1. The wait condition stays true when the thread can't reduce the dirty
   count, so it loops without sleeping: on f2fs_cp_error(), readonly,
   freezing(current) or a failed sb_start_write_trylock() (dirty caches
   stay after shutdown/freeze with checkpoint=3Ddisable, and during
   suspend the thread may never freeze), or when the threshold is below
   nr_caches_to_skip() so the write functions write nothing. How about
   sleeping for the interval when a round doesn't reduce the dirty
   count?

2. With both thresholds 0, dirty caches grow again under
   checkpoint=3Ddisable. Should that case wake the thread anyway?

I'm fine to drop my patch if you take this in your series.

Thanks,
Daeho

>
> >
> > Fixes: 7a1cf2a76b71 ("f2fs: cache: use meta cache")
> > Fixes: 493b9dc8b52c ("f2fs: cache: use node cache")
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/cache.c   | 59 +++++++++++++++++++++++++++++++++++++++++++++-=
-
> >   fs/f2fs/cache.h   |  1 +
> >   fs/f2fs/segment.h | 13 +++++++----
> >   3 files changed, 67 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
> > index 04b5408cbc5..6b6f49fae25 100644
> > --- a/fs/f2fs/cache.c
> > +++ b/fs/f2fs/cache.c
> > @@ -61,6 +61,42 @@ void f2fs_cache_update_tag(struct f2fs_cached_block =
*entry,
> >       spin_unlock_irqrestore(&cache->tree_lock, flags);
> >   }
> >
> > +/*
> > + * While checkpoint is disabled, checkpoint does not write back dirty =
node and
> > + * meta caches, and the writeback thread is the only one that writes t=
hem. Tell
> > + * whether there are as many dirty caches as f2fs_write_node_caches() =
and
> > + * f2fs_write_meta_caches() collect before writing, so that the thread=
 should
> > + * write them now instead of every cache_wb_interval.
> > + */
> > +static bool f2fs_cache_wb_needed(struct f2fs_sb_info *sbi)
> > +{
> > +     if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> > +             return false;
> > +
> > +     return get_nr_caches(sbi, F2FS_DIRTY_NODES) >=3D
> > +                             nr_caches_to_collect(sbi, NODE) ||
> > +             get_nr_caches(sbi, F2FS_DIRTY_META) >=3D
> > +                             nr_caches_to_collect(sbi, META);
> > +}
> > +
> > +static void f2fs_wake_cache_wb_thread(struct f2fs_sb_info *sbi)
> > +{
> > +     struct f2fs_cache_kthread *cache_thread =3D &sbi->cache_thread;
> > +
> > +     if (!f2fs_cache_wb_needed(sbi))
> > +             return;
> > +
> > +     /* pairs with smp_store_release() in f2fs_start_cache_wb_thread()=
 */
> > +     if (!smp_load_acquire(&cache_thread->cache_wb_task))
> > +             return;
> > +
> > +     if (READ_ONCE(cache_thread->cache_wb_urgent))
> > +             return;
> > +
> > +     WRITE_ONCE(cache_thread->cache_wb_urgent, true);
> > +     wake_up(&cache_thread->cache_wb_wq);
> > +}
> > +
> >   bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
> >   {
> >       struct f2fs_cached_block_list *cache =3D entry->cache;
> > @@ -81,6 +117,7 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block =
*entry)
> >               f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
> >                                               F2FS_CACHE_TAG_DIRTY);
> >               inc_cache_count(cache->sbi, type);
> > +             f2fs_wake_cache_wb_thread(cache->sbi);
> >               return true;
> >       }
> >
> > @@ -679,10 +716,13 @@ static int f2fs_cache_writeback_kthread(void *dat=
a)
> >
> >       while (!kthread_should_stop()) {
> >               unsigned int interval =3D cache_thread->cache_wb_interval=
;
> > +             s64 nr_dirty;
> >
> >               wait_event_freezable_timeout(*wq,
> > -                             kthread_should_stop(),
> > +                             kthread_should_stop() ||
> > +                             READ_ONCE(cache_thread->cache_wb_urgent),
> >                               msecs_to_jiffies(interval));
> > +             WRITE_ONCE(cache_thread->cache_wb_urgent, false);
> >
> >               if (kthread_should_stop())
> >                       break;
> > @@ -699,10 +739,23 @@ static int f2fs_cache_writeback_kthread(void *dat=
a)
> >               if (!sb_start_write_trylock(sbi->sb))
> >                       continue;
> >
> > +             nr_dirty =3D get_nr_caches(sbi, F2FS_DIRTY_NODES) +
> > +                             get_nr_caches(sbi, F2FS_DIRTY_META);
> > +
> >               f2fs_write_meta_caches(sbi);
> >               f2fs_write_node_caches(sbi);
> >
> >               sb_end_write(sbi->sb);
> > +
> > +             /*
> > +              * Each round writes a limited number of caches. Go on wi=
thout
> > +              * waiting while there are still many dirty caches, as lo=
ng as
> > +              * this round wrote some of them.
> > +              */
> > +             if (f2fs_cache_wb_needed(sbi) &&
> > +                     get_nr_caches(sbi, F2FS_DIRTY_NODES) +
> > +                     get_nr_caches(sbi, F2FS_DIRTY_META) < nr_dirty)
> > +                     WRITE_ONCE(cache_thread->cache_wb_urgent, true);
> >       }
> >       return 0;
> >   }
> > @@ -719,6 +772,7 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info =
*sbi)
> >
> >       init_waitqueue_head(&cache_thread->cache_wb_wq);
> >       cache_thread->cache_wb_interval =3D DEF_DIRTY_CACHE_TIMEOUT;
> > +     cache_thread->cache_wb_urgent =3D false;
> >       snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
> >                       MAJOR(dev), MINOR(dev));
> >
> > @@ -726,7 +780,8 @@ int f2fs_start_cache_wb_thread(struct f2fs_sb_info =
*sbi)
> >       if (IS_ERR(task))
> >               return PTR_ERR(task);
> >
> > -     cache_thread->cache_wb_task =3D task;
> > +     /* pairs with smp_load_acquire() in f2fs_wake_cache_wb_thread() *=
/
> > +     smp_store_release(&cache_thread->cache_wb_task, task);
> >       return 0;
> >   }
> >
> > diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
> > index 6c4db910d76..1d0216d2128 100644
> > --- a/fs/f2fs/cache.h
> > +++ b/fs/f2fs/cache.h
> > @@ -232,6 +232,7 @@ struct f2fs_cache_kthread {
> >       struct task_struct *cache_wb_task;
> >       wait_queue_head_t cache_wb_wq;
> >       unsigned int cache_wb_interval;
> > +     bool cache_wb_urgent;           /* write back without waiting */
> >   };
> >
> >   int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 526764ba31a..58804e9cc29 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -983,11 +983,8 @@ static inline bool sec_usage_check(struct f2fs_sb_=
info *sbi, unsigned int secno)
> >    * 512 blocks (2MB) * 8 for nodes, and
> >    * 256 blocks * 8 for meta are set.
> >    */
> > -static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type=
)
> > +static inline int nr_caches_to_collect(struct f2fs_sb_info *sbi, int t=
ype)
> >   {
> > -     if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
> > -             return 0;
> > -
> >       if (type =3D=3D DATA)
> >               return BLKS_PER_SEG(sbi);
> >       else if (type =3D=3D NODE)
> > @@ -998,6 +995,14 @@ static inline int nr_caches_to_skip(struct f2fs_sb=
_info *sbi, int type)
> >               return 0;
> >   }
> >
> > +static inline int nr_caches_to_skip(struct f2fs_sb_info *sbi, int type=
)
> > +{
> > +     if (bdi_wb_dirty_exceeded(sbi->sb->s_bdi))
> > +             return 0;
> > +
> > +     return nr_caches_to_collect(sbi, type);
> > +}
> > +
> >   /*
> >    * When writing cache asynchronously, align nr_to_write to BIO_MAX_VE=
CS.
> >    */
>

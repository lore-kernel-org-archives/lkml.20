Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D11379ED7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794092; cv=none; b=dzR2Sp5XG8aKH5bj16gLr5AQj+2BVhp63MJUG9+xqUB+re499rS/OBbvarsACu63PwcipDT8OV3SMInn8AatxebUjBVI4BCNvnq/h3JVIjiVUE1RpUrXCAedDlYFZfUeFk7qwxKFCsZT/XlEUfKJPfgdxTNl0HZ+lIT0c2E6oLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794092; c=relaxed/simple;
	bh=cVVEJXeyfvTgsSv+fOUCzAgGLXK29P3QlbAKdMCkPz8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XHA8ex5NjSlYny4OankAthOAdBSnb5Asiwey8XWsoOaxM3A4qcE32fii+K5FWJmOZvsH72yoOszR1a5YMr+VFAwrroeHWnZ70mH9eOwr6vAul6e7i5hpnanonKGyJyJ/owuFp0OdSu/e4UBauoIQUg4PH1YPzXWk0IqbgJGRsHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmctKDH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmctKDH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DA41F000E9;
	Thu, 27 Aug 2026 01:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787794090;
	bh=lbuC4aoA14FlGrWO2r9StK8nTLZvAoCi8L4zQLrF/uw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=dmctKDH/vSKTlkWPKa0iwI/GBr+5UiUXbSK71be2sHaYNYJ4Z//ogyZSfpMA+61yI
	 +ZcXqYeA8rNsEpo/1bZpk2jyIie3qnqxRRv/M89j+dXnZVXsRJlKamwqoprORnyGFZ
	 ydBDZBVXEuQYDSuczNKLRzC29W0hYLfhg0hJKHGq6x46oqj1nWt8ODItsot3OX9eHZ
	 +db4OP9NoZCy8fuBW5LI8hVuQO0E1L5cLZTBPEIPjJSh8FP0q1HC9I9d7A+24CRD0Z
	 Mv3cFcwxljqlyNtT8stepXRnSTH8iscf4xRJJkvR+ZBGI+Nm+EAwcWVElcx19l58zL
	 aAwROP7nHu3cw==
Message-ID: <d3a0b74f-6879-4bb6-9c49-1cb37db7b2a2@kernel.org>
Date: Thu, 27 Aug 2026 09:28:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 04/12] f2fs: cache: introduce writeback
 thread
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-5-chao@kernel.org>
 <CACOAw_zrWasT=zW1yGSXQKzbj6u5v41MgLQhUjO2yxKYqca8TQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zrWasT=zW1yGSXQKzbj6u5v41MgLQhUjO2yxKYqca8TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/27/26 03:37, Daeho Jeong wrote:
> On Tue, Aug 25, 2026 at 6:06 AM Chao Yu via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
>>
>> This patch introduces a background writeback kthread (f2fs_writeback-x:y)
>> to periodically flush dirty metadata cache entries with a default
>> interval of 5 seconds.
>>
>> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
>> transitions, and hooks synchronous flushing into checkpoint commits.
> 
> What do you mean by the above line saying "hooks.."?

Oh, it's just a replacement from folio based flush to cache entry based flush
in checkpoint, I think I need to update the description to avoid misunderstanding,
sorry.

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/cache.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  fs/f2fs/cache.h | 13 ++++++++++++
>>  fs/f2fs/f2fs.h  |  3 +++
>>  fs/f2fs/super.c | 31 ++++++++++++++++++++++++++-
>>  4 files changed, 102 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index 3cee33c69880..dcfea6c2e1bb 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -615,3 +615,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>  {
>>         return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>>  }
>> +
>> +static int f2fs_cache_writeback_kthread(void *data)
>> +{
>> +       struct f2fs_sb_info *sbi = data;
>> +       struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
>> +       wait_queue_head_t *wq = &cache_thread->cache_wb_wq;
>> +       unsigned int interval = DEF_DIRTY_CACHE_TIMEOUT;
>> +
>> +       set_freezable();
>> +
>> +       while (!kthread_should_stop()) {
>> +               wait_event_freezable_timeout(*wq,
>> +                               kthread_should_stop() ||
>> +                               cache_thread->cache_wb_task == NULL,
> 
> Maybe a redundant check?

Yes,

> 
>> +                               msecs_to_jiffies(interval));
>> +
>> +               if (kthread_should_stop())
>> +                       break;
>> +               if (f2fs_cp_error(sbi))
>> +                       continue;
>> +       }
>> +       return 0;
>> +}
>> +
>> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi)
>> +{
>> +       struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
>> +       struct task_struct *task;
>> +       dev_t dev = sbi->sb->s_dev;
>> +       char name[36];
>> +
>> +       if (cache_thread->cache_wb_task)
>> +               return 0;
>> +
>> +       init_waitqueue_head(&cache_thread->cache_wb_wq);
>> +       snprintf(name, sizeof(name), "f2fs_writeback-%u:%u",
>> +                       MAJOR(dev), MINOR(dev));
>> +
>> +       task = kthread_run(f2fs_cache_writeback_kthread, sbi, "%s", name);
>> +       if (IS_ERR(task))
>> +               return PTR_ERR(task);
>> +
>> +       cache_thread->cache_wb_task = task;
>> +       return 0;
>> +}
>> +
>> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi)
>> +{
>> +       struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
>> +
>> +       if (!cache_thread->cache_wb_task)
>> +               return;
>> +
>> +       kthread_stop(cache_thread->cache_wb_task);
>> +       cache_thread->cache_wb_task = NULL;
>> +}
>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
>> index 618b377590da..ff3d8781119c 100644
>> --- a/fs/f2fs/cache.h
>> +++ b/fs/f2fs/cache.h
>> @@ -187,4 +187,17 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>>  unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>                                 unsigned long nr_to_scan);
>>
>> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
> 
> Maybe this one should be tunnable, right?

I think so, let me introduce a sysfs entry for that.

> 
>> +
>> +struct f2fs_cache_kthread {
>> +       struct task_struct *cache_wb_task;
>> +       wait_queue_head_t cache_wb_wq;
> 
> There is no wakeup all around the patchset. Is this for future usage?

Yeah, I planned to, but still didn't have a full picture, suspect there is
any chance to wake up the writeback thread to speed up metadata flushing in a
synchronous scheme, like syncfs.

> 
>> +       atomic_t cache_wb_trigger;
>> +       unsigned int cache_wb_interval_ms;
> 
> Plz, remove unused fields from above struct.

Okay, let me check first if we can reuse it for sysfs.

> 
>> +};
>> +
>> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +void f2fs_sync_cache_wb(struct f2fs_sb_info *sbi);
> 
> dead code?

Oh, will drop them.

> 
> Thanks,
> 
>> +
>>  #endif /* _LINUX_F2FS_CACHE_H */
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 0f855ac7d1e8..9fe9fadbb810 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2111,6 +2111,9 @@ struct f2fs_sb_info {
>>
>>         /* f2fs internal cache */
>>         struct f2fs_cached_block_list meta_blocks;
>> +
>> +       /* internal cache flush thread */
>> +       struct f2fs_cache_kthread cache_thread;
>>  };
>>
>>  /* Definitions to access f2fs_sb_info */
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 32e80c70e141..9bb19f4c5fd2 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2020,6 +2020,7 @@ static void f2fs_put_super(struct super_block *sb)
>>          * flush all issued checkpoints and stop checkpoint issue thread.
>>          * after then, all checkpoints should be done by each process context.
>>          */
>> +       f2fs_stop_cache_wb_thread(sbi);
>>         f2fs_stop_ckpt_thread(sbi);
>>
>>         /*
>> @@ -2826,6 +2827,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>         unsigned int flags = fc->sb_flags;
>>         int err;
>>         bool need_restart_gc = false, need_stop_gc = false;
>> +       bool need_restart_wb = false, need_stop_wb = false;
>>         bool need_restart_flush = false, need_stop_flush = false;
>>         bool need_restart_discard = false, need_stop_discard = false;
>>         bool need_enable_checkpoint = false, need_disable_checkpoint = false;
>> @@ -2984,6 +2986,18 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>                 need_stop_gc = true;
>>         }
>>
>> +       if (flags & SB_RDONLY) {
>> +               if (sbi->cache_thread.cache_wb_task) {
>> +                       f2fs_stop_cache_wb_thread(sbi);
>> +                       need_restart_wb = true;
>> +               }
>> +       } else if (!sbi->cache_thread.cache_wb_task) {
>> +               err = f2fs_start_cache_wb_thread(sbi);
>> +               if (err)
>> +                       goto restore_gc;
>> +               need_stop_wb = true;
>> +       }
>> +
>>         if (flags & SB_RDONLY) {
>>                 sync_inodes_sb(sb);
>>
>> @@ -3006,7 +3020,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>         } else {
>>                 err = f2fs_create_flush_cmd_control(sbi);
>>                 if (err)
>> -                       goto restore_gc;
>> +                       goto restore_wb;
>>                 need_stop_flush = true;
>>         }
>>
>> @@ -3103,6 +3117,13 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>                 clear_opt(sbi, FLUSH_MERGE);
>>                 f2fs_destroy_flush_cmd_control(sbi, false);
>>         }
>> +restore_wb:
>> +       if (need_restart_wb) {
>> +               if (f2fs_start_cache_wb_thread(sbi))
>> +                       f2fs_warn(sbi, "background cache writeback thread has stopped");
>> +       } else if (need_stop_wb) {
>> +               f2fs_stop_cache_wb_thread(sbi);
>> +       }
>>  restore_gc:
>>         if (need_restart_gc) {
>>                 if (f2fs_start_gc_thread(sbi))
>> @@ -5497,6 +5518,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>                         goto sync_free_meta;
>>         }
>>
>> +       if (!f2fs_readonly(sb)) {
>> +               err = f2fs_start_cache_wb_thread(sbi);
>> +               if (err)
>> +                       goto stop_gc_thread;
>> +       }
>> +
>>         /* recover broken superblock */
>>         if (recovery) {
>>                 err = f2fs_commit_super(sbi, true);
>> @@ -5519,6 +5546,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>         sbi->umount_lock_holder = NULL;
>>         return 0;
>>
>> +stop_gc_thread:
>> +       f2fs_stop_gc_thread(sbi);
>>  sync_free_meta:
>>         /* safe to flush all the data */
>>         sync_filesystem(sbi->sb);
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


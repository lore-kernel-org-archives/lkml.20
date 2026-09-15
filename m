Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC5280331
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438709; cv=none; b=DxXB3ktuAIaHgJvLiTis6LfZMfwwYcKFUUdkKW06vpOYQLP8LwaC3f/XJ/gB5YDVQtLU4T/l6WJrU3CRx8WDovtnliyicKxdVcPAdpstAWG0oAXCt+5OajjGvekan4F/0PjS5lf58iJoqhP8HC2dh33SOxigbtxRueyBxA8NlwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438709; c=relaxed/simple;
	bh=0Y2LGc6g5p8+/EfjPiXxaJ+3LSHoqGwcLHSelx8Y7dM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IErCqhb6gNt//rVUiH7Kn7c2I32wmU4dHeB1pO4fJs8Fpzc4NQs2TA7Hvvpxa94dW3KFciFMJt0mA3Bc+eY3159keBhcJYQ1g4fFA60MdQICvL56yQfR3m+LeZrbQxoTz/KSN6Qg2y2X7V4P+XxULNQt8tx+BdPshM4fkfR6rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKNJcTQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKNJcTQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C31F000FF;
	Tue, 15 Sep 2026 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438708;
	bh=L8n+b2jyjPCQEyeK+sxO0PfXUZwS78bHwCOgi1jJE1s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=HKNJcTQ6iz+1h9p7UZBRSm6RDzZtcspbCcBupI0JswkSqHo9R529JKN/Xw0Ch33Og
	 YgTcH1C7vy6r5FjyP+5pGlLSNbwTcGDgKRxfltkxO6LLoylxnFTKTu69mb61K5Mb9h
	 psOl9joXkgpWBMzj+Rvm36c8KF33G+5/ZRN9aFIOObucV+r5XpG4d9u6E/ZmavlW9U
	 4osL1QjUSTcRA/omqM2aS4SkghV3Omi4+VeHpF/yHSjn8vYtG+3Gx+kCEAp4eKOXvf
	 J3OEF7051cf7xjPE6+auXPK18Q9Yptig0tqT1eQ60jgk1QHe6IKtuLTXCNsSsJE18u
	 Ku0Zd4B73ThTg==
Message-ID: <420b564b-c40b-4618-b072-7c169eca2f87@kernel.org>
Date: Tue, 15 Sep 2026 10:18:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v7 04/12] f2fs: cache: introduce writeback
 thread
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260911232405.1815804-1-chao@kernel.org>
 <20260911232405.1815804-5-chao@kernel.org>
 <CAHJ8P3++-+J4EpkFrsHAX4=tSVvJS24R2BRvTpKe4_vT84fgpA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3++-+J4EpkFrsHAX4=tSVvJS24R2BRvTpKe4_vT84fgpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Zhiguo,

Thanks for the review, let fix them all.

Thanks,

On 9/14/26 17:08, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年9月12日周六 07:28写道：
>>
>> From: Chao Yu <chao@kernel.org>
>>
>> This patch introduces a background writeback kthread (f2fs_writeback-x:y)
>> to periodically flush dirty metadata cache entries with a default
>> interval of 5 seconds.
>>
>> It manages thread lifecycle across mount, unmount, and remount (rw/ro)
>> transitions.
>>
>> It introduces a sysfs entry /sys/fs/f2fs/<disk>/cache_wb_interval to control
>> writeback interval.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   Documentation/ABI/testing/sysfs-fs-f2fs |  6 +++
>>   fs/f2fs/cache.c                         | 56 +++++++++++++++++++++++++
>>   fs/f2fs/cache.h                         | 12 ++++++
>>   fs/f2fs/f2fs.h                          |  3 ++
>>   fs/f2fs/super.c                         | 33 ++++++++++++++-
>>   fs/f2fs/sysfs.c                         | 13 +++++-
>>   6 files changed, 120 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index 0cebc89799dd..d2665b7f1f14 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -1020,3 +1020,9 @@ Contact:  "Daeho Jeong" <daehojeong@google.com>
>>   Description:   This is a read-only entry to show the upper bound section number
>>                  for pinned files. Pinned files will only be allocated within
>>                  sections 0 to pinned_area_max_secno - 1.
>> +
>> +What:          /sys/fs/f2fs/<disk>/cache_wb_interval
>> +Date:          August 2026
>> +Contact:       "Chao Yu" <chao@kernel.org>
>> +Description:   This is a writable entry to control writeback interval of
>> +               f2fs_writeback-x:y, by default the value is 5000, unit is ms.
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index 563615761d11..404ceac9e6bf 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -626,3 +626,59 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>   {
>>          return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
>>   }
>> +
> Hi Chao
>> +static int f2fs_cache_writeback_kthread(void *data)
>> +{
>> +       struct f2fs_sb_info *sbi = data;
>> +       struct f2fs_cache_kthread *cache_thread = &sbi->cache_thread;
>> +       wait_queue_head_t *wq = &cache_thread->cache_wb_wq;
>> +       unsigned int interval = cache_thread->cache_wb_interval;
>> +
>> +       set_freezable();
>> +
>> +       while (!kthread_should_stop()) {
>> +               wait_event_freezable_timeout(*wq,
>> +                               kthread_should_stop(),
>> +                               msecs_to_jiffies(interval));
> if wb thread is running and user set cache_wb_interval at the same
> time， the wb thread can not get the new wb interval value for next
> round? because local varible is used here
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
>> +       cache_thread->cache_wb_interval = DEF_DIRTY_CACHE_TIMEOUT;
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
>> index 5728e2225465..ea0cf9adf194 100644
>> --- a/fs/f2fs/cache.h
>> +++ b/fs/f2fs/cache.h
>> @@ -209,4 +209,16 @@ void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>>   unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
>>                                  unsigned long nr_to_scan);
>>
>> +#define DEF_DIRTY_CACHE_TIMEOUT 5000
>> +
>> +struct f2fs_cache_kthread {
>> +       struct task_struct *cache_wb_task;
>> +       wait_queue_head_t cache_wb_wq;
>> +       atomic_t cache_wb_trigger;
> not used?
> thanks!
>> +       unsigned int cache_wb_interval;
>> +};
>> +
>> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +
>>   #endif /* _LINUX_F2FS_CACHE_H */
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 85c4bf40b4aa..c0f82b63d732 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2110,6 +2110,9 @@ struct f2fs_sb_info {
>>
>>          /* f2fs internal cache */
>>          struct f2fs_cached_block_list meta_blocks;
>> +
>> +       /* internal cache flush thread */
>> +       struct f2fs_cache_kthread cache_thread;
>>   };
>>
>>   /* Definitions to access f2fs_sb_info */
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index b731b9bb7b54..516b4ee12564 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2039,6 +2039,7 @@ static void f2fs_put_super(struct super_block *sb)
>>           * flush all issued checkpoints and stop checkpoint issue thread.
>>           * after then, all checkpoints should be done by each process context.
>>           */
>> +       f2fs_stop_cache_wb_thread(sbi);
>>          f2fs_stop_ckpt_thread(sbi);
>>
>>          /*
>> @@ -2845,6 +2846,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>          unsigned int flags = fc->sb_flags;
>>          int err;
>>          bool need_restart_gc = false, need_stop_gc = false;
>> +       bool need_restart_wb = false, need_stop_wb = false;
>>          bool need_restart_flush = false, need_stop_flush = false;
>>          bool need_restart_discard = false, need_stop_discard = false;
>>          bool need_enable_checkpoint = false, need_disable_checkpoint = false;
>> @@ -3004,6 +3006,18 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>                  need_stop_gc = true;
>>          }
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
>>          if (flags & SB_RDONLY) {
>>                  sync_inodes_sb(sb);
>>
>> @@ -3011,7 +3025,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>                  set_sbi_flag(sbi, SBI_IS_CLOSE);
>>                  err = f2fs_sync_fs(sb, 1);
>>                  if (err)
>> -                       goto restore_gc;
>> +                       goto restore_wb;
>>                  clear_sbi_flag(sbi, SBI_IS_CLOSE);
>>          }
>>
>> @@ -3026,7 +3040,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>          } else {
>>                  err = f2fs_create_flush_cmd_control(sbi);
>>                  if (err)
>> -                       goto restore_gc;
>> +                       goto restore_wb;
>>                  need_stop_flush = true;
>>          }
>>
>> @@ -3123,6 +3137,13 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>                  clear_opt(sbi, FLUSH_MERGE);
>>                  f2fs_destroy_flush_cmd_control(sbi, false);
>>          }
>> +restore_wb:
>> +       if (need_restart_wb) {
>> +               if (f2fs_start_cache_wb_thread(sbi))
>> +                       f2fs_warn(sbi, "background cache writeback thread has stopped");
>> +       } else if (need_stop_wb) {
>> +               f2fs_stop_cache_wb_thread(sbi);
>> +       }
>>   restore_gc:
>>          if (need_restart_gc) {
>>                  if (f2fs_start_gc_thread(sbi))
>> @@ -5529,6 +5550,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>                          goto sync_free_meta;
>>          }
>>
>> +       if (!f2fs_readonly(sb)) {
>> +               err = f2fs_start_cache_wb_thread(sbi);
>> +               if (err)
>> +                       goto stop_gc_thread;
>> +       }
>> +
>>          /* recover broken superblock */
>>          if (recovery) {
>>                  err = f2fs_commit_super(sbi, true);
>> @@ -5551,6 +5578,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>          sbi->umount_lock_holder = NULL;
>>          return 0;
>>
>> +stop_gc_thread:
>> +       f2fs_stop_gc_thread(sbi);
>>   sync_free_meta:
>>          /* safe to flush all the data */
>>          sync_filesystem(sbi->sb);
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index aaca9ed9b169..ad25733e32c0 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -40,6 +40,7 @@ enum {
>>          RESERVED_BLOCKS,        /* struct f2fs_sb_info */
>>          CPRC_INFO,      /* struct ckpt_req_control */
>>          ATGC_INFO,      /* struct atgc_management */
>> +       WB_THREAD,      /* struct f2fs_cache_kthread */
>>   };
>>
>>   static const char *gc_mode_names[MAX_GC_MODE] = {
>> @@ -98,6 +99,8 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
>>                  return (unsigned char *)&sbi->cprc_info;
>>          else if (struct_type == ATGC_INFO)
>>                  return (unsigned char *)&sbi->am;
>> +       else if (struct_type == WB_THREAD)
>> +               return (unsigned char *)&sbi->cache_thread;
>>          return NULL;
>>   }
>>
>> @@ -1008,7 +1011,8 @@ static ssize_t f2fs_sbi_store(struct f2fs_attr *a,
>>          bool gc_entry = (!strcmp(a->attr.name, "gc_urgent") ||
>>                                          a->struct_type == GC_THREAD);
>>          bool thread_entry = !strcmp(a->attr.name, "ckpt_thread_ioprio") ||
>> -                       !strcmp(a->attr.name, "critical_task_priority");
>> +                       !strcmp(a->attr.name, "critical_task_priority") ||
>> +                       !strcmp(a->attr.name, "cache_wb_interval");
>>
>>          if (gc_entry || thread_entry) {
>>                  if (!down_read_trylock(&sbi->sb->s_umount))
>> @@ -1218,6 +1222,9 @@ static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
>>   #define ATGC_INFO_RW_ATTR(name, elname)                                \
>>          F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)
>>
>> +#define WB_THREAD_RW_ATTR(name, elname)                                \
>> +       F2FS_RW_ATTR(WB_THREAD, f2fs_cache_kthread, name, elname)
>> +
>>   /* GC_THREAD ATTR */
>>   GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
>>   GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
>> @@ -1347,6 +1354,9 @@ ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
>>   ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
>>   ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
>>
>> +/* WB_THREAD ATTR */
>> +WB_THREAD_RW_ATTR(cache_wb_interval, cache_wb_interval);
>> +
>>   F2FS_GENERAL_RO_ATTR(dirty_segments);
>>   F2FS_GENERAL_RO_ATTR(free_segments);
>>   F2FS_GENERAL_RO_ATTR(ovp_segments);
>> @@ -1533,6 +1543,7 @@ static struct attribute *f2fs_attrs[] = {
>>          ATTR_LIST(lock_duration_priority),
>>          ATTR_LIST(adjust_lock_priority),
>>          ATTR_LIST(critical_task_priority),
>> +       ATTR_LIST(cache_wb_interval),
>>          NULL,
>>   };
>>   ATTRIBUTE_GROUPS(f2fs);
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


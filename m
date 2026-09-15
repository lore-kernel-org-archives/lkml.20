Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FD3921DD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438826; cv=none; b=UZRSubiZjxlt1OL3NSw9ghYkXtC/0EfPwuhIlHnP4Vv5t5nNzuORaCx9xEc6cVTGky7VNzyCKm9zt1tnDWlVObLvrfhVjxuP9JePB1GXRk69jQty+qWqLtA9t4EVej0IzW+c2IzSva8DKeVYLVsSMg03p/1eKXbOiUxtydI8FqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438826; c=relaxed/simple;
	bh=qWp66S3kHwxJV3ZdNfijEC/wIK0pztD7BiP025YtaqI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NITtHJbYGh6l/e0uMpmSGwaN40rV95kg5IoB1mkupr9PySUtCy8OiVpLn5z8kZHq/+J0suTJ6b8cXE8mm3uJpPQA6GfaQWh0j2UmV+OYnfXwmiBMMrEm0dYp0f6nNdTFJUJGUOUR4ud5g5gzdrvK9jcFltw4E1s3+Zn2D5x/sCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k78FD3S3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k78FD3S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8546A1F000FF;
	Tue, 15 Sep 2026 02:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438824;
	bh=BtKIzx2WWKvcOYtAmGPY5M6AXlLYrxPNUnVdVrUmmFI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=k78FD3S3HLckxiCJs/jPLvztJ4XdBdtNlc7eITI/I8UI/3Leg6IZOCa+SpgxXbdxw
	 KAJPuBWzXz6vOLG3QmY6uugID5pYp6BsGso4/Mcpv+4d6y59J7MO8dSfIfTwO/eSwR
	 STvfXYaXVIXhLfUktVhoK2vvYyFNfULuDvRC3sfenBk4lFbIp0GZHgr6p3EfINrjAp
	 kVhKy7I8aa4129Efnt9uj3LaigsNmM/01qTA4wcckZ3XnH8TFUGWyXIf3eG54MoSzL
	 TuscHaws78mm9RDIMwvJeW0aYPHvXOzPhn/AbSbW8gKQeBUdoCwpiYZJXom8NRDkgp
	 C4YfkzcX5vgLA==
Message-ID: <0ed7f94f-d4c6-4589-814c-77357451b021@kernel.org>
Date: Tue, 15 Sep 2026 10:20:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v7 11/12] f2fs: cache: introduce tracepoints
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260911232405.1815804-1-chao@kernel.org>
 <20260911232405.1815804-12-chao@kernel.org>
 <CAHJ8P3J0azH2EgsDQXOYgtfZLqjkwh15o+crG3SxOYLQGPd4Ww@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J0azH2EgsDQXOYgtfZLqjkwh15o+crG3SxOYLQGPd4Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 17:41, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年9月12日周六 07:28写道：
>>
>> From: Chao Yu <chao@kernel.org>
>>
>> This patch introduces ftrace tracepoints to observe and profile metadata
>> cache operations:
>> - trace_f2fs_cache_set_dirty to trace marking a cached block dirty
>> - trace_f2fs_write_cache to trace single block writeback submission
>> - trace_f2fs_write_caches to tracesbatch writeback and sync sessions
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/cache.c             |  3 ++
>>   fs/f2fs/checkpoint.c        |  6 ++++
>>   fs/f2fs/segment.c           |  3 ++
>>   include/trace/events/f2fs.h | 71 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 83 insertions(+)
>>
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index dcab0f321730..33da3f243783 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -15,6 +15,7 @@
>>   #include "f2fs.h"
>>   #include "cache.h"
>>   #include "node.h"
>> +#include <trace/events/f2fs.h>
>>   #include "segment.h"
>>
>>   void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
>> @@ -73,6 +74,8 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
>>                  enum count_type type = IS_META_CACHE(cache) ?
>>                                  F2FS_DIRTY_META : F2FS_DIRTY_NODES;
>>
>> +               trace_f2fs_cache_set_dirty(entry,
>> +                               IS_META_CACHE(cache) ? META : NODE);
>>                  f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_NONE,
>>                                                  F2FS_CACHE_TAG_DIRTY);
>>                  inc_page_count(cache->sbi, type);
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 40a96eb9179c..2542b1a29989 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -550,6 +550,8 @@ static bool __f2fs_write_meta_cache(struct f2fs_cached_block *entry,
>>   {
>>          struct f2fs_sb_info *sbi = entry->cache->sbi;
>>
>> +       trace_f2fs_write_cache(entry, META);
>> +
>>          if (unlikely(f2fs_cp_error(sbi))) {
>>                  if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
>>                          f2fs_cache_clear_uptodate(entry);
>> @@ -611,6 +613,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
>>          struct blk_plug plug;
>>          bool background = nr_to_write != LONG_MAX;
>>
>> +       trace_f2fs_write_caches(sbi, nr_to_write, 0, META);
>> +
>>          blk_start_plug(&plug);
>>
>>          while ((nr = f2fs_cache_gang_lookup_tag(META_CACHE(sbi), entries,
>> @@ -666,6 +670,8 @@ long f2fs_sync_meta_caches(struct f2fs_sb_info *sbi, long nr_to_write,
>>
>>          blk_finish_plug(&plug);
>>
>> +       trace_f2fs_write_caches(sbi, nr_to_write, nwritten, META);
>> +
>>          return nwritten;
>>   }
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 87e24d0306e8..15cffbb5b407 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4226,6 +4226,9 @@ void f2fs_do_write_node_cache(unsigned int nid, struct f2fs_io_info *fio)
> Hi Chao,
> Do we also need to add tracepoints in f2fs_writeback_node_caches??

You're right, will fix.

Thanks,

> thanks!
>>   {
>>          struct f2fs_summary sum;
>>
>> +       if (fio->is_cache)
>> +               trace_f2fs_write_cache(fio->cache_entry, NODE);
>> +
>>          set_summary(&sum, nid, 0, 0);
>>          do_write_block(&sum, fio);
>>
>> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
>> index d53be932df01..df4cd346ae72 100644
>> --- a/include/trace/events/f2fs.h
>> +++ b/include/trace/events/f2fs.h
>> @@ -1430,6 +1430,50 @@ DEFINE_EVENT(f2fs__folio, f2fs_set_page_dirty,
>>          TP_ARGS(folio, type)
>>   );
>>
>> +DECLARE_EVENT_CLASS(f2fs__cached_block,
>> +
>> +       TP_PROTO(struct f2fs_cached_block *block, int type),
>> +
>> +       TP_ARGS(block, type),
>> +
>> +       TP_STRUCT__entry(
>> +               __field(dev_t,  dev)
>> +               __field(pgoff_t, index)
>> +               __field(int,    type)
>> +               __field(int,    dirty)
>> +               __field(int,    uptodate)
>> +       ),
>> +
>> +       TP_fast_assign(
>> +               __entry->dev    = block->cache->sbi->sb->s_dev;
>> +               __entry->index  = block->index;
>> +               __entry->type   = type;
>> +               __entry->dirty  = f2fs_cache_test_dirty(block);
>> +               __entry->uptodate = f2fs_cache_test_uptodate(block);
>> +       ),
>> +
>> +       TP_printk("dev = (%d,%d), %s, index = %lu, dirty = %d, uptodate = %d",
>> +               show_dev(__entry->dev),
>> +               show_block_type(__entry->type),
>> +               (unsigned long)__entry->index,
>> +               __entry->dirty,
>> +               __entry->uptodate)
>> +);
>> +
>> +DEFINE_EVENT(f2fs__cached_block, f2fs_write_cache,
>> +
>> +       TP_PROTO(struct f2fs_cached_block *block, int type),
>> +
>> +       TP_ARGS(block, type)
>> +);
>> +
>> +DEFINE_EVENT(f2fs__cached_block, f2fs_cache_set_dirty,
>> +
>> +       TP_PROTO(struct f2fs_cached_block *block, int type),
>> +
>> +       TP_ARGS(block, type)
>> +);
>> +
>>   TRACE_EVENT(f2fs_replace_atomic_write_block,
>>
>>          TP_PROTO(struct inode *inode, struct inode *cow_inode, pgoff_t index,
>> @@ -1574,6 +1618,33 @@ TRACE_EVENT(f2fs_writepages,
>>                  __entry->for_sync)
>>   );
>>
>> +TRACE_EVENT(f2fs_write_caches,
>> +
>> +       TP_PROTO(struct f2fs_sb_info *sbi, long nr_to_write, long nwritten, int type),
>> +
>> +       TP_ARGS(sbi, nr_to_write, nwritten, type),
>> +
>> +       TP_STRUCT__entry(
>> +               __field(dev_t,  dev)
>> +               __field(long,   nr_to_write)
>> +               __field(long,   nwritten)
>> +               __field(int,    type)
>> +       ),
>> +
>> +       TP_fast_assign(
>> +               __entry->dev            = sbi->sb->s_dev;
>> +               __entry->nr_to_write    = nr_to_write;
>> +               __entry->nwritten       = nwritten;
>> +               __entry->type           = type;
>> +       ),
>> +
>> +       TP_printk("dev = (%d,%d), %s, nr_to_write = %ld, nwritten = %ld",
>> +               show_dev(__entry->dev),
>> +               show_block_type(__entry->type),
>> +               __entry->nr_to_write,
>> +               __entry->nwritten)
>> +);
>> +
>>   TRACE_EVENT(f2fs_readpages,
>>
>>          TP_PROTO(struct inode *inode, pgoff_t start, unsigned int nrpage),
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


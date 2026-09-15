Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB891BD9D0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438746; cv=none; b=kuHkvCd2io0EQ49Js1GF1ZkcqAfH0UkpU15sD98Cy32ezHYsKkV1fspEt/n8pJ8SSvz/jW9crIhyrxVSd1MZwu6qZJbYutePbC6Y21AHcbP4Qw2ymhiNSXufrI0+Ma7GTIWUHhuS/otRpaCbbHptarbeosEwkO2t3axDh3l8j6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438746; c=relaxed/simple;
	bh=lWFt7ucjufnZyGUzRyLGRMrgllttHTaLmrRpBr9gUdk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LpqLuYTkFc/kGq8tagp3hKRdR/aoPNp8K7IlZhpZL+gzb2pLjFA7sRR14SfstXuurjOpsAbSiy51rOoF1Fs7m9Ty17w5vfnIq96euqS2kwBSJ0CBpICu86KyFHuIQ5X194SaYMYLraGTNOzKAKezVU8coPyWuY3LoHjLlf0/IoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjmRrfyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjmRrfyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30501F000FF;
	Tue, 15 Sep 2026 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438744;
	bh=wsJFM5lGSqVqpj1Wvq3qwMzbcNrTLZ77Ch6iAAxQYx0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=mjmRrfykLaJqFWHGfmyF3bNk0Jt+l4DbdShBkEmeHjO09IJigf0Zq3GrUJIrdMVbt
	 C2CJgPYSsry9LQ05Ezyd0yqAaOUYFqeL2cKMks6WXkc96cBV4jLjfOZ1uhdCFKuH7B
	 xxkwsFQEk/cKywCygQAUxo6eQBijx49c/BquP2hDPt1OEbP0acvaq5ouISNdcepqK+
	 eMbNwDnPSpjoPMWYnNZytHHE89prgXX/Fe2vLQNcByfZ1tX5jRV+DAAXEIsUCv/2id
	 3x5TJa7Xp3JGW2hCRiedTRV+0kG4jHTnrhwXLdhU6eVsBOVmfBzx00953SWLE6A/ox
	 h/val+8IW84sw==
Message-ID: <c79a8f13-7ef4-425a-a046-831b024f7a76@kernel.org>
Date: Tue, 15 Sep 2026 10:19:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v7 02/12] f2fs: cache: initialize meta cache
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260911232405.1815804-1-chao@kernel.org>
 <20260911232405.1815804-3-chao@kernel.org>
 <CAHJ8P3JSW+y4PK+Zb6HvpnDgYt7uPko5kOVsbn3zRPefd5o98Q@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3JSW+y4PK+Zb6HvpnDgYt7uPko5kOVsbn3zRPefd5o98Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 17:21, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年9月12日周六 07:28写道：
>>
>> From: Chao Yu <chao@kernel.org>
>>
>> This patch introduces meta_blocks in f2fs_sb_info structure, initializes
>> and destroys the meta cache during filesystem mount and unmount.
>>
>> It also introduces helper wrappers for meta cache operation.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/cache.h | 12 ++++++++++++
>>   fs/f2fs/data.c  |  3 +++
>>   fs/f2fs/f2fs.h  |  3 +++
>>   fs/f2fs/super.c | 10 +++++++++-
>>   4 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
>> index 72dbf26ab26e..d5ee51691fac 100644
>> --- a/fs/f2fs/cache.h
>> +++ b/fs/f2fs/cache.h
>> @@ -194,4 +194,16 @@ void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty);
>>   void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
>>                  unsigned long start, unsigned long len, bool drop_dirty);
>>
>> +int f2fs_start_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +void f2fs_stop_cache_wb_thread(struct f2fs_sb_info *sbi);
>> +
>> +#define META_CACHE(sbi)                (&(sbi)->meta_blocks)
>> +
>> +#define f2fs_find_meta_cache(sbi, blkaddr)             \
>> +       f2fs_find_cache(META_CACHE(sbi), blkaddr)
>> +#define f2fs_invalidate_meta_caches(sbi, start, len)   \
>> +       f2fs_drop_cache_range(META_CACHE(sbi), start, len, false)
>> +#define f2fs_truncate_meta_caches(sbi, start, len)     \
>> +       f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
>> +
>>   #endif /* _LINUX_F2FS_CACHE_H */
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index d868b939caee..59fef2132177 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -670,6 +670,9 @@ static bool __has_merged_page(struct f2fs_sb_info *sbi, struct bio *bio,
>>          if (!inode && !folio && !ino)
>>                  return true;
>>
>> +       if (f2fs_is_cache_bio(bio))
>> +               return false;
>> +
>>          bio_for_each_folio_all(fi, bio) {
>>                  struct folio *target = fi.folio;
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index c0c7d51c830f..85c4bf40b4aa 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2107,6 +2107,9 @@ struct f2fs_sb_info {
>>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>          struct lock_class_key cp_global_sem_key;
>>   #endif
>> +
>> +       /* f2fs internal cache */
>> +       struct f2fs_cached_block_list meta_blocks;
>>   };
>>
>>   /* Definitions to access f2fs_sb_info */
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 6a2f09c61dcd..b731b9bb7b54 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -2094,6 +2094,8 @@ static void f2fs_put_super(struct super_block *sb)
>>          iput(sbi->meta_inode);
>>          sbi->meta_inode = NULL;
>>
>> +       f2fs_destroy_cache(META_CACHE(sbi));
>> +
>>          /* Should check the page counts after dropping all node/meta pages */
>>          for (i = 0; i < NR_COUNT_TYPE; i++) {
>>                  if (!get_pages(sbi, i))
>> @@ -5263,12 +5265,16 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>          if (err)
>>                  goto free_percpu;
>>
>> +       err = f2fs_init_cache(sbi, META_CACHE(sbi), F2FS_META_CACHE);
> never fail now?

Yes, will clean up.

Thanks,

>> +       if (err)
>> +               goto free_page_array_cache;
>> +
>>          /* get an inode for meta space */
>>          sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
>>          if (IS_ERR(sbi->meta_inode)) {
>>                  f2fs_err(sbi, "Failed to read F2FS meta data inode");
>>                  err = PTR_ERR(sbi->meta_inode);
>> -               goto free_page_array_cache;
>> +               goto free_meta_cache;
>>          }
>>
>>          err = f2fs_get_valid_checkpoint(sbi);
>> @@ -5596,6 +5602,8 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>          make_bad_inode(sbi->meta_inode);
>>          iput(sbi->meta_inode);
>>          sbi->meta_inode = NULL;
>> +free_meta_cache:
>> +       f2fs_destroy_cache(META_CACHE(sbi));
>>   free_page_array_cache:
>>          f2fs_destroy_page_array_cache(sbi);
>>   free_percpu:
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


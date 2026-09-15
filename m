Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA06F78F26
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438766; cv=none; b=NjBZmbJwxj6QpABxUeZfHyjfnRbFQeXygHhnlTUU05lDU5rH9I7eIircfUd2ZpVfq4M7qbfHNYjQeam3Jj+NMO6XVzW2uAUM+Ezgf7RnVnDVrLL5125wO8WFG5ybQvq5QwhSQwqiJNAhjBdgRVQ+oI2Si1h0AzeM9zRFBJ7ApWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438766; c=relaxed/simple;
	bh=+I/bdNSufdN3ZaXoMr2Bg1XOg5eEUZGlx1qMXzzFkeo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f/+Sroew49sSWcOm7yR/agodG3nLCSjgmkHCigpFUAGrPIb31Th8psRzYgdEBNj0wvq/hbkpsUxt/KsSkbl8UO+JasxbECvYa0ruU3IBzmgiVyPUXK4BoZoU4WzZA7YByFkOzhbSEayVBCyIRhk68YPwOUxzD+AS9nuSeCNKpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYJFepxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYJFepxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF88B1F000FF;
	Tue, 15 Sep 2026 02:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438764;
	bh=WqICZCmo+XU66iHWMmT0ym9EBpC3glaNJd36LYT/K5M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=dYJFepxLFfD43Vcn0o9o9Sf6WsBAgfRpV6HC67x/zmtqwQQNr+cQqHzNI+Tug17qa
	 nQNcIzWY8Lk06iDB/gUIllQ8gd4t+G3jQwVH/EGqRTHNACh3L35ptGo0ecDqlrXhkv
	 BPWMey07Vz9RTmdyzAte4jZ0RLxL9xXn/zp9XCNxQezJcQi8tJNj3MhCmBuKcimcFm
	 EeBaK7CK4yWFfTtoNpc+3foiKXkrBA84OIvpiFYm7q4O+Sq2RFXCtJr7kKo7kkONRu
	 pjfeDHX01yFi/3/8NqgRJEonPjDWm9Mdz9zqYSAMtM2TELdIUdd02qleIE9/u2byZG
	 txN22R37rRrHw==
Message-ID: <e8a2114f-6f76-45bc-a10c-2193790f2cee@kernel.org>
Date: Tue, 15 Sep 2026 10:19:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v7 10/12] f2fs: cache: support fault injection
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260911232405.1815804-1-chao@kernel.org>
 <20260911232405.1815804-11-chao@kernel.org>
 <CAHJ8P3+cDHYmS22Jj4Za1=9bHEDQzsDYP=uBvDHT3ZyAizYZXA@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+cDHYmS22Jj4Za1=9bHEDQzsDYP=uBvDHT3ZyAizYZXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/14/26 17:35, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年9月12日周六 07:28写道：
>>
>> From: Chao Yu <chao@kernel.org>
>>
>> This patch adds fault injection support for metadata cache allocations
>> to improve error-path test coverage.
>> - it integrates entry allocations with FAULT_KALLOC
> FAULT_KALLOC ->  FAULT_KMALLOC?

Will fix.

Thanks,

>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/cache.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
>> index 7260c157654b..dcab0f321730 100644
>> --- a/fs/f2fs/cache.c
>> +++ b/fs/f2fs/cache.c
>> @@ -154,23 +154,27 @@ static struct f2fs_cached_block *f2fs_create_cache(
>>                  struct f2fs_cached_block_list *cache,
>>                  unsigned long index, bool nofail)
>>   {
>> +       struct f2fs_sb_info *sbi = cache->sbi;
>>          struct f2fs_cached_block *entry;
>>          unsigned int flags = GFP_NOFS;
>>
>>          if (index == ULONG_MAX)
>>                  return ERR_PTR(-ERANGE);
>>
>> -       if (nofail)
>> +       if (nofail) {
>>                  flags |= __GFP_NOFAIL;
>> -
>> -       entry = kzalloc_obj(*entry, flags);
>> -       if (!entry)
>> -               return ERR_PTR(-ENOMEM);
>> -
>> -       entry->data = kmalloc(cache->sbi->blocksize, flags);
>> -       if (!entry->data) {
>> -               kfree(entry);
>> -               return ERR_PTR(-ENOMEM);
>> +               entry = kzalloc_obj(*entry, flags);
>> +               entry->data = kmalloc(sbi->blocksize, flags);
>> +       } else {
>> +               entry = f2fs_kzalloc(sbi, sizeof(*entry), flags);
>> +               if (!entry)
>> +                       return ERR_PTR(-ENOMEM);
>> +
>> +               entry->data = f2fs_kmalloc(sbi, sbi->blocksize, flags);
>> +               if (!entry->data) {
>> +                       kfree(entry);
>> +                       return ERR_PTR(-ENOMEM);
>> +               }
>>          }
>>
>>          entry->index = index;
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


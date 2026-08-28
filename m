Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7795823F40D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787880983; cv=none; b=kYm/+RMW5EKM9rYUnzuQlV1daDKMQCk11dE5znOYs43lah/HTMCsLK4TzsO2pUxiLrZUtRlm1QA3YoLopop2fQlNWW/VKxlCxEt2UK3m7BUjuOQsPe/3VeP36Eg5vD+LONW5xEbSldRZRq0HHRqZXxBvkg2bsLaqmzgaSVIhTqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787880983; c=relaxed/simple;
	bh=7qRBKgfw90awntKJC9A77UmMWvwj1F1mWPL5mdSlSEA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UrTfbhUrNkQBdjzGTqb3uaPMftNIYVb/zcsOr8phY2mSumC2MCTwDJrHzhz3ueGCyJmeaF1jI5yJe7ogEKqR/KxS1b9MpK4nL722+qozV8ynvIz5p+NZFtwXoQS741StDn/eB4q6ffStjoSnMZK3XMb2sZZj5sYzz7RbTTcF4gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6L9NuYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6L9NuYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E92E1F000E9;
	Fri, 28 Aug 2026 01:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787880982;
	bh=YKKARV2vN9NQxyou3JfUO6z68mH3Kf/Mg2OcZ94panQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=h6L9NuYfxeoJNMYcS7lrcrZ2Q9C6hEuY7m/T3OjGTILZzl13ryinfc7HhOJb4VuRB
	 8nUANpFrn0HHmyJBxfaFaSb3R4/enM9Br7MwDUeP9CTbhxtKVvO51N09zzZXOrIeC8
	 PmZEKSfV4C4iYWSItgK7MYnAv7EiYsjLrtPx/kVZfE9jtV9mZQOT+2911eo2nIJIxK
	 nf+lk4cEU6aLF+HWU22mVJHtfqqX4UsoC0b82zaHqtdog+yvXFyOGUFSZdepEAHcaN
	 G3ZN41OMHdNeKy5Qe51TBLOROkan6UcMhhgcKYJKHzYm3oM575QAUhn6aEH5OdAgBh
	 2BHqzVDsXbJSQ==
Message-ID: <e223e7e8-92cb-4264-a39e-08ca1dfb4cce@kernel.org>
Date: Fri, 28 Aug 2026 09:36:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v3 01/12] f2fs: cache: implement metadata cache
To: Daeho Jeong <daeho43@gmail.com>
References: <20260825130126.2078627-1-chao@kernel.org>
 <20260825130126.2078627-2-chao@kernel.org>
 <CACOAw_z5fKX2refsnOzUFSXQLVkCetHyzujxEepuja5x+E=mkw@mail.gmail.com>
 <1719b723-988a-4f97-b46f-b74c8d1a94e0@kernel.org>
 <CACOAw_z-QjubNTcodONJoa07qQvvNufBE7sDVegyonJoFPoARQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_z-QjubNTcodONJoa07qQvvNufBE7sDVegyonJoFPoARQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/28/26 00:56, Daeho Jeong wrote:
> The idea is to drop list_lock completely from f2fs_find_cache() by
> deferring LRU rotation to the shrinker (like page cache's
> PG_referenced / clock algorithm):

Ah, I see, let me implement the logic as you suggested, thanks for the idea!

> 
> In f2fs_find_cache() (no list_lock at all):
> 
> if (entry) {
>     f2fs_cache_get(entry);
>     set_bit(F2FS_BLOCK_REFERENCED, &entry->state);
> }
> 
> In f2fs_do_shrink_cache() Phase 1 (under list_lock):
> 
> list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
>     /* If accessed, give it a second chance and rotate to tail */
>     if (test_and_clear_bit(F2FS_BLOCK_REFERENCED, &entry->state)) {
>         list_move_tail(&entry->list, &cache->lru_list);
>         continue;
>     }
>     ...
>     /* Reclaim cold entry */
> }
> 
> This completely eliminates list_lock overhead from the read lookup
> path while keeping active entries protected from eviction.
Thanks,

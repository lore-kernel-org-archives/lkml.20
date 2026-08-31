Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD037996B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143304; cv=none; b=XoDZcx47+QtPSGL4N4UWxaVrJrxKQ62kN9cvFUMsDHjND7n4CGsKHc1SZAixlKmr2YbjrqhyHQ1iASkMEmrtXUXj53YLe1o3NXZGjDfMN6PfjF5f/S0AnzLQ8ZBAHOTnZjrS+I0Yn/+vnqZz+cvd9GEIeHBl4Im3LNJRHglnWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143304; c=relaxed/simple;
	bh=FlD54LcSt+NZlq7D9GrYKYXHGNdn1dwZ5TEhIQvteAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iE/FCA+ei/nAe9CzYucFlraQryCY76OMd4vPs6s/h5Kbl2UVrhDnBhln8Zbc/Bo+7bP4S9dnt0IJOYcJs770CzfsUKvNDSKoWRBAgIDgNpKoDWu6vYrvFgsOaxoWR01GBZWKFUoxk4jhXa9UNYqCW9HTxieVXym9eX/wJrk7nIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bmStEd8N; arc=none smtp.client-ip=95.215.58.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bmStEd8N"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FlD54LcSt+NZlq7D9GrYKYXHGNdn1dwZ5TEhIQvteAM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788143294; v=1; x=1788748094;
 b=bmStEd8NE/ucj4J8M/w/Y6phdgdh1G91NbqqAuoOfNin/BTsO66DH11e5Eu90l5uX/o++Kn2
 K8Bu1EBL85QOTc/4vWaSKmkJL+TyYH0TKv1dEYXNDVfAZujROnkhNiNvW9Ofm7XMeA4TZLYRfMH
 M7VRss+YhUnkaEAslP71jR00=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a4496ccf4f994c7;
	Mon, 31 Aug 2026 02:28:03 +0000
X-Mizu-Trace-ID: 5a4496ccf4f994c7
X-Migadu-Flow: FLOW_OUT
Message-ID: <c1ad6e39-3b21-413c-ad02-f90cfc4102f9@linux.dev>
Date: Mon, 31 Aug 2026 10:28:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
 <3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
 <20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
 <eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
 <20260829162350.1ee9e17d71a297b06b171941@linux-foundation.org>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260829162350.1ee9e17d71a297b06b171941@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 8/30/26 7:23 AM, Andrew Morton wrote:
> On Sat, 29 Aug 2026 09:49:44 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> 
>> Hi Andrew,
>>
>> On 8/29/26 2:41 AM, Andrew Morton wrote:
>>> On Mon, 17 Aug 2026 17:03:25 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
>>>
>>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>
>>>> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
>>>> individual filesystems") forgot to drop the super_fs_objects_eligible(),
>>>> just fix it.
>>>
>>> Oh.  Why?  Please can we have a description of what's wrong with the
>>> current code?
>>
>> As I replied in another thread [1], this fix and commit 0ef8faff490be
>> together make up the complete patch originally sent by Usama [2], so
>> they should be squashed together.
> 
> 0ef8faff490be is upstream so they can't be squashed!

So sad.

> 
>> Without this fix, all memcg-aware
>> nr_cached_objects() will be skipped during memcg-level shrinking.
>> Besides the newly added memcg-aware shmem huge shrinker, XFS will also
>> run into issues.
> 
> OK, please add this info to this patch's changelog.  Please also decide
> whether a cc:stable should be added and if so, ensure the changelog
> makes clear why we're recommending a backport.
> 
> As part of this, let's expand on "XFS will also run into issues".

How about this instead:

---
Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
individual filesystems") was meant to drop the blanket memcg gate in
fs/super.c and let each ->nr_cached_objects() implementation decide
for itself whether it is meaningful in per-memcg reclaim. However,
when that patch was applied the removal of super_fs_objects_eligible()
and its two call sites in super_cache_scan() / super_cache_count() was
lost, so the helper is still gating every ->nr_cached_objects() hook
and 0ef8faff490be is effectively a no-op.

Consequences of the leftover gate:

   - XFS's inode-reclaim hook, which is intentionally driven from
     per-memcg contexts to free memcg-charged slab, is still
     short-circuited in fs/super.c — exactly the regression from
     commit 0baad6f9b997 ("fs/super: skip non-memcg-aware
     nr_cached_objects in memcg slab shrink") that 0ef8faff490be was
     written to undo. Memcg-charged XFS inode slab therefore keeps
     piling up under per-memcg pressure until global reclaim kicks in.

   - Any future ->nr_cached_objects()/->free_cached_objects() that
     grows memcg awareness is likewise blocked before it can run, so
     filesystems cannot opt in to per-memcg reclaim on their own —
     defeating the whole point of pushing the gating decision down
     into the callbacks.

Drop the leftover helper and its call sites so the intent of
0ef8faff490be actually takes effect.

Fixes: 0ef8faff490be ("fs: push nr_cached_objects memcg gating into 
individual filesystems")
Cc: stable@vger.kernel.org
---

Can you fix up the commit message directly on your end? Let me know if
you prefer me to spin a v5 instead.

Thank,
Qi

> 
> Thanks.
> 


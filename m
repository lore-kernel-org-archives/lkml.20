Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9219476044
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256337; cv=none; b=FMnLnWENVays6LZILxYlQnukY0erI9VgnelNSL1LE7n4800+4OqokopmWhopMRv6qyI9u7OvARCiz8wa1JpDSgVQkENHVjedVLaCAx/CC6X0iApClgd/wQj+NKgw7+9oVeC2xam9R9EUDPg1rFLiaIkCNnA5jhahld0Si28DEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256337; c=relaxed/simple;
	bh=gWBMzccwztkDTNjZRc6ZiXACyk8Q9RyrtZihlTbMSpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUf/yaEOpfZlgU9eVFiKvCB2LjakJSF68vmLRE07bJ5XoV65JWlUHPGzp5ycImAgQAvBBiETAACBe9LLUudosqFMQ7Dlr5uhQuu0titIY9BmSQPWq0eBLBhfsns6klkC4LG9iKlZdYYmRPLuLvGrvhFvrJBga0I580XTgxLl3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=siiticGL; arc=none smtp.client-ip=91.218.175.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="siiticGL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gWBMzccwztkDTNjZRc6ZiXACyk8Q9RyrtZihlTbMSpQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788256333; v=1; x=1788861133;
 b=siiticGLo+Qxtde5ELFC5ZGjEy9v5mMlCR2lWFYHHFpTnT0Syt15h0UhzlTfP77u0uAgcwe7
 h9VO6gNKPkMGTug5JG9Un5k8ILYUr1cIjq8m4H3/W/UqHZAuS49Wo4r7z247DOmrOLIg3qTFY9S
 ApDnYqPqjAGmtsz9o/g2d+N4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9cd017cf59f4577d;
	Tue, 01 Sep 2026 09:52:03 +0000
X-Mizu-Trace-ID: 9cd017cf59f4577d
X-Migadu-Flow: FLOW_OUT
Message-ID: <2638f163-7647-4739-9ee4-5a7e9993455b@linux.dev>
Date: Tue, 1 Sep 2026 10:51:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
To: Andrew Morton <akpm@linux-foundation.org>, Qi Zheng <qi.zheng@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
 <3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
 <20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
 <eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
 <20260829162350.1ee9e17d71a297b06b171941@linux-foundation.org>
 <c1ad6e39-3b21-413c-ad02-f90cfc4102f9@linux.dev>
 <20260831192143.84da447c4fa2afb60757afa4@linux-foundation.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260831192143.84da447c4fa2afb60757afa4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/09/2026 03:21, Andrew Morton wrote:
> On Mon, 31 Aug 2026 10:28:00 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:
> 
>>> OK, please add this info to this patch's changelog.  Please also decide
>>> whether a cc:stable should be added and if so, ensure the changelog
>>> makes clear why we're recommending a backport.
>>>
>>> As part of this, let's expand on "XFS will also run into issues".
>>
>> How about this instead:
>>
>> ---
>> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
>> individual filesystems") was meant to drop the blanket memcg gate in
>> fs/super.c and let each ->nr_cached_objects() implementation decide
>> for itself whether it is meaningful in per-memcg reclaim. However,
>> when that patch was applied the removal of super_fs_objects_eligible()
>> and its two call sites in super_cache_scan() / super_cache_count() was
>> lost, so the helper is still gating every ->nr_cached_objects() hook
>> and 0ef8faff490be is effectively a no-op.
>>
>> Consequences of the leftover gate:
>>
>>    - XFS's inode-reclaim hook, which is intentionally driven from
>>      per-memcg contexts to free memcg-charged slab, is still
>>      short-circuited in fs/super.c — exactly the regression from
>>      commit 0baad6f9b997 ("fs/super: skip non-memcg-aware
>>      nr_cached_objects in memcg slab shrink") that 0ef8faff490be was
>>      written to undo. Memcg-charged XFS inode slab therefore keeps
>>      piling up under per-memcg pressure until global reclaim kicks in.
>>
>>    - Any future ->nr_cached_objects()/->free_cached_objects() that
>>      grows memcg awareness is likewise blocked before it can run, so
>>      filesystems cannot opt in to per-memcg reclaim on their own —
>>      defeating the whole point of pushing the gating decision down
>>      into the callbacks.
>>
>> Drop the leftover helper and its call sites so the intent of
>> 0ef8faff490be actually takes effect.
>>
>> Fixes: 0ef8faff490be ("fs: push nr_cached_objects memcg gating into 
>> individual filesystems")
>> Cc: stable@vger.kernel.org
>> ---
>>
>> Can you fix up the commit message directly on your end? Let me know if
>> you prefer me to spin a v5 instead.
> 
> Thanks.  I pasted this in and turned your [1/4] into a standalone patch
> for mm-hotfixes, with a cc:stable.
> 
> The remaining three patches I turned into a separate series for the
> next merge window.
> 
> This particular patch has no evidence of reviewer input yet?
> 
> 
> From: Qi Zheng <zhengqi.arch@bytedance.com>
> Subject: fs: fix missed removal of super_fs_objects_eligible()
> Date: Mon, 17 Aug 2026 17:03:25 +0800
> 
> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
> individual filesystems") was meant to drop the blanket memcg gate in
> fs/super.c and let each ->nr_cached_objects() implementation decide for
> itself whether it is meaningful in per-memcg reclaim.  However, when
> that patch was applied the removal of super_fs_objects_eligible() and
> its two call sites in super_cache_scan() / super_cache_count() was
> lost, so the helper is still gating every ->nr_cached_objects() hook
> and 0ef8faff490be is effectively a no-op.
> 
> Consequences of the leftover gate:
> 
>    - XFS's inode-reclaim hook, which is intentionally driven from
>      per-memcg contexts to free memcg-charged slab, is still
>      short-circuited in fs/super.c  exactly the regression from
>      commit 0baad6f9b997 ("fs/super: skip non-memcg-aware
>      nr_cached_objects in memcg slab shrink") that 0ef8faff490be was
>      written to undo. Memcg-charged XFS inode slab therefore keeps
>      piling up under per-memcg pressure until global reclaim kicks in.
> 
>    - Any future ->nr_cached_objects()/->free_cached_objects() that
>      grows memcg awareness is likewise blocked before it can run, so
>      filesystems cannot opt in to per-memcg reclaim on their own 
>      defeating the whole point of pushing the gating decision down
>      into the callbacks.
> 
> Drop the leftover helper and its call sites so the intent of
> 0ef8faff490be actually takes effect.
> 
> Link: https://lore.kernel.org/cover.1786955972.git.zhengqi.arch@bytedance.com
> Link: https://lore.kernel.org/3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com
> Link: https://lore.kernel.org/all/20260715103516.2410175-1-usama.arif@linux.dev/ [0]
> Fixes: 0ef8faff490b ("fs: push nr_cached_objects memcg gating into individual filesystems")
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
Yeah unfortunately this was a mess up with a part of the patch not being applied.

Acked-by: Usama Arif <usama.arif@linux.dev>



Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDA239E9BF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156561; cv=none; b=jjp8N5gsGvYeA0+tpHLzob950dq+Wym/b9zxc8uWGMfgUazFj95CLNti4W13oKOOl9Wu2D5hD4Osqvfo8uFaAY9M2Q854uQmleETX1MlkgjUimtraDgblWokYzuRHrxIdrBVHo5oIYo5iPwl+s9rECY9PyEDAXMvnwvZ4A6Xtkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156561; c=relaxed/simple;
	bh=XMjiDlUWUD0lEd7uWazW4CIIYSMDuTnUsQicLckbR0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIL+EOaEWGjiTY0FzgzXUY5v1BOfMROBP48Gwr8n8PC+qlDqcB4PNhrduP+JCZPiNi1YOFpqwOgwBmV5NGViAX2okwhi4Nx9MBzxD8gSiNGiuBb7XB+KwrU/TEo9D/S8hI67wAwjufaL2eXToqsYDp8HzGEfOlnNJpPUdsZGV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NhYV4X83; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NhYV4X83"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53E8E14BF;
	Sun, 30 Aug 2026 23:09:15 -0700 (PDT)
Received: from [10.164.19.53] (unknown [10.164.19.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B26A3F8C6;
	Sun, 30 Aug 2026 23:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788156559; bh=XMjiDlUWUD0lEd7uWazW4CIIYSMDuTnUsQicLckbR0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhYV4X83xcSoXc3krWIy4c3Q+4GvV8j3Y57msAuhGticUjas+j+t63IiPIfMJvy5W
	 KW+KG96C0prQYGADilYGIQGFNyltA9FGVa9sJow3Y2qfbNdqB0OZ0zGzlajZIdpI0k
	 qXFVh4f93XkmBsi/ll3CHAAQCaG84ssRDmjaawC8=
Message-ID: <bec5eaef-d084-467f-9bfd-43f7dedc1aa7@arm.com>
Date: Mon, 31 Aug 2026 11:39:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under memory
 pressure
To: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <ye.liu@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Ye Liu <liuye@kylinos.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260828091753.299295-1-ye.liu@linux.dev>
 <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28/08/26 11:35 pm, Andrew Morton wrote:
> On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> 
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> The vmap_purge_lock mutex can be held for an extended period by
>> __purge_vmap_area_lazy() which calls flush_work() to wait for
>> purge_vmap_node workers while holding the lock.  Under memory
>> pressure, those workers may themselves be blocked in direct
>> reclaim trying to acquire the same lock via the
>> vmap_node_shrink_scan() shrinker callback, creating a circular
>> dependency that deadlocks the entire system.
>>
>> Two places acquire vmap_purge_lock from paths that can be reached
>> during direct reclaim:
>>
>> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
>>    mutex_trylock().  This is a shrinker that only decays the vmap
>>    pool and returns SHRINK_STOP without freeing memory; skipping a
>>    decay cycle when the lock is contended is harmless and prevents
>>    tasks from piling up on the mutex in the direct reclaim path.
>>
>> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
>>    mutex_trylock().  This is called from the vmalloc allocation
>>    overflow path; if trylock fails, another thread is already
>>    purging and the allocator's retry will find freed space.  The
>>    notifier chain provides a fallback if the retry still fails.
>>
>> Both trylock failures break the circular dependency: the lock
>> holder's flush_work() can complete because workers are no longer
>> blocked on vmap_purge_lock in the direct reclaim path.
> 
> Thanks.  AI review expressed a couple of concerns:
> 	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev


Sounds legit to me. Now there is no guarantee of purge being successful, and we
can get a spurious failure.

How about using a WQ_RECLAIM workqueue:

vmap_purge_wq = alloc_workqueue("vmap_purge",
				WQ_MEM_RECLAIM | WQ_PERCPU, 0);

I see the same pattern in __lru_add_drain_all() and kmem_cache_init_late().


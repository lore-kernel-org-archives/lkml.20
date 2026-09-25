Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26438737B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790306018; cv=none; b=I10HvCfYwseHA2pSttGBicFwA9i2O5yS0AcAOrNCi8wZdgh60CGU8mDvlFC3Ov8yTO2bFG9JQI+NArGpDVKhrqLQSSy60NEkcVjX5CtjXuKBhBXazcQ3pdUF07kGts0aMMBWsN7LKXW4MzeC3wbP/g0zj/7TnAReXFvGT/PBZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790306018; c=relaxed/simple;
	bh=cVk0fwmHlGWiQY3wRXaMcPOvQHl1z/urVxS/MPahtZc=;
	h=From:Cc:Date:References:Content-Type:Subject:Message-Id:
	 Mime-Version:In-Reply-To:To; b=flsJU0QmhXeDXjmCsPTAZocKIb1v8DSoAiBGuliGhDlIXDN1o9SgXbwa6imkVOoUc0Ac+Y/77qTQSz4JZZx8RoddQK5Xa5E6wFzNpF8bXoR9qGevnSIODuEQMlFw8ehAkXnFUlASXt47S8W7/XPmwADJaJK8VYa+7U6g2+AoC6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HDMtqNZM; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HDMtqNZM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790306004; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=avKKwd5cal353VXVjwLmx9houVqa88TvZg+eD/uVkwE=;
 b=HDMtqNZMtjJmNxJDyzpYaCWHY7WmTQhg9OVSAQjMDHI11RLUNNAnWT2zBzpGKw3uNbKPgJ
 WyntyFTCGg0ICQ3RE7UgMSZ5WYExBJHeWKAAktdtd5OsbrTKKKdwhDH78rBrDBH5+R3nXS
 aUT4Qtft4eZxGFyRnHv9MXpMIJYuVJYrB8bmxoyuPWM0jSeAGVtst0GQFFmBRE9ZGE3b4W
 MV4jutzKWhgpOIh5Tza+wZ0/1iEVUpXLU2CWC0U88hGOA095rq+CqVlQaXmFaEtttbMOYR
 tzd5esb8GUsCcz0wV4bh9xbZ/kxDFE7D7vI/3v/y2Pf1hpVb7ca2pXA3FmC/YA==
User-Agent: Mozilla Thunderbird
From: "Rui Qi" <qirui.001@bytedance.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Date: Fri, 25 Sep 2026 11:13:11 +0800
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com> <20260826035314.1536340-5-qirui.001@bytedance.com> <20260924161746.GI1080284@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26ab5e6d2+558669+vger.kernel.org+qirui.001@bytedance.com>
Subject: Re: [PATCH v2 4/4] RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails
Message-Id: <e804e406-9732-49d5-a84d-ee309f5702f8@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260924161746.GI1080284@yaz-khff2.amd.com>
Content-Transfer-Encoding: 7bit
To: "Yazen Ghannam" <yazen.ghannam@amd.com>

On 9/25/26 12:17 AM, Yazen Ghannam wrote:
> On Wed, Aug 26, 2026 at 11:53:14AM +0800, Rui Qi wrote:
>> When erst_get_record_id_begin() returns an error, get_saved_records()
>> jumps to the out_end label which unconditionally calls
>> erst_get_record_id_end(). This is wrong because:
>>
>> - If erst_disable is true, begin() returns -ENODEV without
>>   incrementing the refcount. Then end() hits BUG_ON(erst_disable)
>>   and panics.
>>
>> - If mutex_lock_interruptible() is interrupted, begin() returns
>>   -EINTR without incrementing the refcount. Then end() decrements
>>   refcount below zero, hitting BUG_ON(refcount < 0).
>>
>> The comment in erst_get_record_id_end() warns that it should not be
>> called when erst_disable is true, so callers must not invoke it after
>> begin() fails.
>>
>> Fix by jumping to the out label when begin() fails, skipping the
>> erst_get_record_id_end() call. This is safe because kfree() handles
>> NULL pointers.
>>
>> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
>> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
>> ---
>>  drivers/ras/amd/fmpm.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
>> index c13db1f743e5..48a437042953 100644
>> --- a/drivers/ras/amd/fmpm.c
>> +++ b/drivers/ras/amd/fmpm.c
>> @@ -673,7 +673,7 @@ static int get_saved_records(void)
>>  
>>  	ret = erst_get_record_id_begin(&pos);
>>  	if (ret < 0)
>> -		goto out_end;
>> +		goto out;
>>  
>>  	while (!erst_get_record_id_next(&pos, &record_id)) {
>>  		if (record_id == APEI_ERST_INVALID_RECORD_ID)
>> @@ -714,8 +714,8 @@ static int get_saved_records(void)
>>  
>>  out_end:
>>  	erst_get_record_id_end();
>> -	kfree(old);
>>  out:
>> +	kfree(old);
>>  	return ret;
>>  }
>>  
>> -- 
> 
> The patch is okay, but the 'erst_disable' part didn't make sense to me.
> So I went over it with an AI assistant. Response is below.
> 
> Basically, the commit message needs to be reworded to cover the actual
> issue.
> 
> Thanks,
> Yazen
> 
> =========================
> 
> `erst_get_record_id_begin()` has two ways to fail, and the commit
> message describes both. Only one of them can happen when fmpm calls it.
> 
> ```c
> int erst_get_record_id_begin(int *pos)
> {
> 	if (erst_disable)
> 		return -ENODEV;			/* case 1 */
> 
> 	rc = mutex_lock_interruptible(&erst_record_id_cache.lock);
> 	if (rc)
> 		return rc;			/* case 2: -EINTR */
> 	erst_record_id_cache.refcount++;
> 	...
> ```
> 
> **Case 1 (`-ENODEV`) can't happen from `get_saved_records()`:**
> - `fru_mem_poison_init()` already returns `-ENODEV` when `erst_disable`
>   is set, before it calls `get_saved_records()`.
> - `erst_disable` has only two writers: the `erst_disable` boot parameter
>   (`__setup`) and the error path of `erst_init()`.
> - `erst_init()` is a `device_initcall` in `drivers/acpi/`, which links
>   ahead of `drivers/ras/`. When fmpm is built in, `erst_init()` has
>   already run by the time fmpm's initcall runs. When fmpm is a module,
>   it loads later still.
> - So `erst_disable` can't change between fmpm's check and the `begin()`
>   call, and the `BUG_ON(erst_disable)` in `end()` can't fire here.
> 
> **Case 2 (`-EINTR`) can happen, but only under narrow conditions:**
> - The lock has to be contended. `mutex_lock_interruptible()` takes an
>   uncontended lock without checking for signals. Other code that takes
>   `erst_record_id_cache.lock` includes the other `begin()` callers:
>   `erst_open_pstore()`, `erst_dbg_open()` and `apei_read_mce()`.
> - A signal has to be pending while the task waits. That's realistic when
>   fmpm is a module, for example Ctrl-C or SIGKILL sent to `modprobe`
>   while pstore or erst-dbg holds the lock. When fmpm is built in, its
>   init runs in the `kernel_init` thread before userspace starts, so no
>   signal can reach it.
> - Before the patch, this path calls `end()`. The refcount drops to -1
>   and hits `BUG_ON(refcount < 0)` while `erst_record_id_cache.lock` is
>   held. The oops kills the task with the mutex still locked, so every
>   later ERST user blocks on it forever.
> 
> In short, "reachable" was loose wording. The `-ENODEV` case can't happen
> from fmpm at all. The `-EINTR` case can happen, but only when fmpm is a
> module, the lock is contended, and the load is interrupted by a signal.
> The patch fixes that case, which is real. The commit message just leads
> with the case that can't happen from fmpm and understates the
> consequence of the one that can.
> 
> 

Thanks Yazen. The commit message is reworded in v3 to lead with the
reachable -EINTR case and to spell out the deadlock (loader dies
holding erst_record_id_cache.lock); the -ENODEV case is dropped.
No code changes.

v3:
https://lore.kernel.org/r/20260925030918.3428029-1-qirui.001@bytedance.com/

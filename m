Received: from mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A759396D03
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908990; cv=none; b=mdlwoSD63Oj8t85w7WLHuQL7MAQWDaUk3031mLr22ilSRh4RyAgn5aQqaHb34I5ApYRaOVlt6Ge8S2Kyfdy4Ecyuj2gtYlKVPls9WprTupfEWA3D+d1tdmq/F4KhiCYAtjEvrUFY/jL4UoGMBqDDZoMzLwtjtK4kMyHIIH3KcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908990; c=relaxed/simple;
	bh=W2mLHB6kx+ymVq/ryG0/Ntgfi59bYxFBsTJVA6D4EUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwAXJomqn7FeZR+EF2lYta9IaRmBeVybKdOLdVbdzAHWeAGxmxUFAxXc+evOWeyL1/3tu6V6n2JFLrsDsu/GOU3OrzD+/Qh20a4wrIWhaxErNK+heobMoDtFLooJOfFdo9fGE6zfxwL+Irhl6IklNqGg2LViXwy9WohXMFbvsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LOZOCZel; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LOZOCZel"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W2mLHB6kx+ymVq/ryG0/Ntgfi59bYxFBsTJVA6D4EUk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787908985; v=1; x=1788513785;
 b=LOZOCZel2WuPPetP6DJLe5RFL0fj4gx0vJb0kV4F5FWQxqff6NEHeCYbMW7ktKCB/fa7+ns1
 5NTGqdYlKg6uB8EN39f0+b4EqYJdB8lg0ApEGdxGNoe9fGwXQB8YtFgX3afaUV0Fo7338I69S37
 w0MR1uckg4PjWjOg5iNsTMaA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cd96e012bdad3c10;
	Fri, 28 Aug 2026 09:23:04 +0000
X-Mizu-Trace-ID: cd96e012bdad3c10
X-Migadu-Flow: FLOW_OUT
Message-ID: <bd452f33-a34c-443a-bad9-a03012de7c29@linux.dev>
Date: Fri, 28 Aug 2026 17:22:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] hung_task: Reset warning budget when problem gets
 resolved
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
Cc: atomlin@atomlin.com, akpm@linux-foundation.org, mhiramat@kernel.org,
 linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, neelx@suse.com,
 sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com,
 nick.lange@gmail.com
References: <ao7LW7-3GjJzKNp0@pathway.suse.cz>
 <20260827153001.18515-1-lance.yang@linux.dev>
 <apFPXhPynOlfON4B@pathway.suse.cz>
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <apFPXhPynOlfON4B@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/28 17:05, Petr Mladek wrote:
> On Thu 2026-08-27 23:30:01, Lance Yang wrote:
>> On Wed, Aug 26, 2026 at 01:17:47PM +0200, Petr Mladek wrote:
>>>> @@ -314,6 +317,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>>>   	if (test_taint(TAINT_DIE) || did_panic)
>>>>   		return;
>>>>   
>>>> +	if (atomic_xchg(&reset_hung_task_warnings, 0))
>>>
>>> I would use here atomic_xchg_acquire(). It serializes the ordering
>>> of reset_hung_task_warnings vs sysctl_hung_task_warnings.
>>> It would make it symetric with the barrier in the sysctl handler.
>>
>> Yep, _acquire is enough here. Plain atomic_xchg() is already fully
>> ordered, though, so this looks like making the intent clearer rather
>> than fixing the ordering :)
> 
> Yes, my intention was to make the ordering more clear and symmetric.

Yep, that makes sense. atomic_xchg_acquire() is a better fit here :)

> The original code worked because the barrier was even stronger.
> 
>> The old-value return already makes plain atomic_xchg() fully ordered :)
>>
>> ORDERING  (see memory-barriers.txt)
>> --------
>>
>> The rule of thumb:
>> ...
>> - RMW operations that have a return value are fully ordered;
>> ...
>> Except of course when a successful operation has an explicit ordering
>> like:
>>
>> {}_relaxed: unordered
>> {}_acquire: the R of the RMW (or atomic_read) is an ACQUIRE
>> {}_release: the W of the RMW (or atomic_set)  is a  RELEASE
>>
>>>
>>>> +		hung_task_warnings_printed =
>>>> +			READ_ONCE(sysctl_hung_task_warnings);
>>>
>>> This would work only when "sysctl_hung_task_warnings"
>>> is updated using WRITE_ONCE(). But it seems that this
>>> is not the case. My understading is that it is updated by:
>>
>> Wait, I think proc_dointvec_minmax() already handles this.
> 
> You are right.
> 
>> For proc_dointvec_minmax(), the converter is:
>>
>> int proc_dointvec_minmax(const struct ctl_table *table, int dir,
>> 		  void *buffer, size_t *lenp, loff_t *ppos)
>> {
>> 	return do_proc_dointvec(table, dir, buffer, lenp, ppos,
>> 				do_proc_int_conv_minmax);
>> }
>>
>> Here, i is table->data, while lval is local:
> 
> I have missed this.

No worries at all. This was easy to miss in that call chain ...

> 
>> static int do_proc_dointvec(const struct ctl_table *table, int dir,
>> 		  void *buffer, size_t *lenp, loff_t *ppos,
>> 		  int (*conv)(bool *negp, unsigned long *u_ptr, int *k_ptr,
>> 			      int dir, const struct ctl_table *table))
>> {
>> ...
>> 	i = (int *) table->data;
>> 	vleft = table->maxlen / sizeof(*i);
>> ...
>> 	for (; left && vleft--; i++, first=0) {
>> 		unsigned long lval;
>> 		bool neg;
>>
>> 		if (SYSCTL_USER_TO_KERN(dir)) {
>> 			proc_skip_spaces(&p, &left);
>>
>> 			if (!left)
>> 				break;
>> 			err = proc_get_long(&p, &left, &lval, &neg,
>> 					     proc_wspace_sep,
>> 					     sizeof(proc_wspace_sep), NULL);
> 
> I have missed that proc_get_long() assigns the value to the local
> variable @lval.
> 
>> 			if (err)
>> 				break;
>> 			if (conv(&neg, &lval, i, 1, table)) {
>> 				err = -EINVAL;
>> 				break;
> 
> The real asigment to table->data is done here. And I agree that it
> goes down to proc_int_conv() which does WRITE_ONCE().
> 
> So, we are on the safe side and do _not_ need the proxy table.

Agreed.

> 
> Now, I am not sure whether we need v10. It might be worth it.
> AFAIK, Andrew has not taken this patchset yet...

I think we do. Definitely :) And if Andrew hasn't picked it up
yet, even better. There's still time to fold the changes in :)

> 
> I am sorry for complications.

No need to apologize at all, Petr. I really appreciate you taking
another careful look!

Cheers, Lance


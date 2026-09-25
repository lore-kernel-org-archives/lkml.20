Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1C4E80C0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364789; cv=none; b=YRRO32FjjMP0YIHInvu1FxTdcATCNbk/brh5GHz7T/p8yplDVkkCkDd3Sp3j7WWikECwcXJ4SDCL1RgfwZJMGRI8ZM/NqIimMfNOzSWfpqVBeoOepNOM8zlsf5SPnBJz/v2oHQ3HA3N6ko+2Pn4B5Gq25gBSU8hx3Jg7GyLui1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364789; c=relaxed/simple;
	bh=8V5VwhpeXhxeuPpsgf59bCJyOR0PZgomhhn/k9/LjAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdfctISb6ArFZ12UwXLKGjqySynjSz9lWjr95Fbfj8iZ6ClWYGyGbtelIovTnpcrS/y329F/KkHtkwyUq2di+Nzy1pkVRiBi2mQ4XiXV/nnLCGac+UAHcGkBZ+VfH1atfVUy7H8a0RZUrEr834/caoFLehspBl+KVfpCzVPFBxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G4gYQciE; arc=none smtp.client-ip=91.218.175.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G4gYQciE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8V5VwhpeXhxeuPpsgf59bCJyOR0PZgomhhn/k9/LjAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790364782; v=1; x=1790969582;
 b=G4gYQciEHkDxVMM4pn3G/GkXLFs6Yj7jbT4d/k9jo6M24uYxxKftMoKo+F9ULCdPechykOkb
 hQ0OWrfWfQfUFK3fj0CaDevkx5OT15ccJO3B5Mpru7GJ0TZYi1zyoPVXTkBW1tO/YACcLuW8LtW
 Uymv4TL8Ron+97Q/PaiZM1sM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 88cdd669b54f57db;
	Fri, 25 Sep 2026 19:32:52 +0000
X-Mizu-Trace-ID: 88cdd669b54f57db
X-Migadu-Flow: FLOW_OUT
Message-ID: <1e223334-b371-487b-a60a-7f1f5c007f7e@linux.dev>
Date: Fri, 25 Sep 2026 12:32:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tracing: fgraph: Raise FTRACE_RETSTACK_ALLOC_SIZE to
 1024
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
 mathieu.desnoyers@efficios.com, andrii@kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, kernel-team@meta.com, stable@vger.kernel.org
References: <20260922225526.1554758-1-vineet.gupta@linux.dev>
 <20260922225526.1554758-2-vineet.gupta@linux.dev>
 <20260924100040.GD4121339@noisy.programming.kicks-ass.net>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20260924100040.GD4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 3:00 AM, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 03:55:25PM -0700, Vineet Gupta wrote:
>> When ftrace graphing is turned on, all tasks in the system missing
>> return stack page are assigned one. This is done in a simplistic
>> multi-sweep loop of FTRACE_RETSTACK_ALLOC_SIZE (currently 32) tasks
>> at a time as follows:
>>
>>     start_graph_tracing()
>> 	do {
>> 		alloc_retstack_tasklist
>> 	} while (-EAGAIN);
>>
>>     alloc_retstack_tasklist()
>> 	alloc x32           # GFP_KERNEL, may sleep
>> 	rcu_read_lock()     # preempt off
>> 		for_each_process_thread    walk N_total, no cond_resched
>>                       t->ret_stack = new_page
>> 	rcu_read_unlock()   # preempt enable but no explicit yield
>>
>> Each successive iteration of loop invokes for_each_process_thread()
>> which doesn't support cursor based resume and always restarts from the
>> init_task. Thus each successive loop needs to skip the tasks assigned
>> ret_stack in prior sweeps and thus take longer and longer to find the
>> candidate 32 tasks.
> Does this work?

Yes it does and much better at that: test run for 400k threads went down 
from 227 s (stock) to 7.2 s (my patch) to 92 ms. Woo hoo !
I didn't know about this cool trick.

A couple of things worth pointing out:


> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> index ed455b53513b..155dafad474d 100644
> --- a/kernel/trace/fgraph.c
> +++ b/kernel/trace/fgraph.c
> @@ -1036,10 +1036,9 @@ trace_func_graph_ent_t ftrace_graph_entry = ftrace_graph_entry_stub;
>   /* Try to assign a return stack array on FTRACE_RETSTACK_ALLOC_SIZE tasks. */
>   static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
>   {
> -	int i;
> -	int ret = 0;
>   	int start = 0, end = FTRACE_RETSTACK_ALLOC_SIZE;
>   	struct task_struct *g, *t;
> +	int i, ret = 0;
>   
>   	if (WARN_ON_ONCE(!fgraph_stack_cachep))
>   		return -ENOMEM;
> @@ -1054,26 +1053,29 @@ static int alloc_retstack_tasklist(unsigned long **ret_stack_list)
>   		}
>   	}
>   
> -	rcu_read_lock();
> -	for_each_process_thread(g, t) {
> -		if (start == end) {
> -			ret = -EAGAIN;
> -			goto unlock;
> -		}
> +	scoped_guard (rcu) {
> +		for_each_process_thread(g, t) {
> +			unsigned long *rs;
> +
> +			if (t->ret_stack)
> +				continue;
> +
> +			rs = kmem_cache_alloc(fgraph_stack_cachep, GFP_NOWAIT);

It still pre-allocates FTRACE_RETSTACK_ALLOC_SIZE reserves in the fast 
path - my (limited) testing never hit the reserves, but I agree better 
to keep it and 32 seems like a reasonably low number?
> +			if (!rs) {
> +				if (start == end)
> +					return -EAGAIN;

This indicates the reserve pool is exhausted so it safe to elide the 
free: loop at the end: warrants a comment IMO.

For submission, would you take this up as reported-by me or do you 
prefer I send a v2 (your authorship and SoB etc) ? No big deal either 
ways just not sure what the std operating procedure is and nuances of 
all the tags etc.

Thx,
-Vineet

> +				rs = ret_stack_list[start++];
> +			}
>   
> -		if (t->ret_stack == NULL) {
>   			atomic_set(&t->trace_overrun, 0);
> -			ret_stack_init_task_vars(ret_stack_list[start]);
> +			ret_stack_init_task_vars(rs);
>   			t->curr_ret_stack = 0;
>   			t->curr_ret_depth = -1;
>   			/* Make sure the tasks see the 0 first: */
> -			smp_wmb();
> -			t->ret_stack = ret_stack_list[start++];
> +			smp_store_release(&t->ret_stack, rs);
>   		}
>   	}
>   
> -unlock:
> -	rcu_read_unlock();
>   free:
>   	for (i = start; i < end; i++)
>   		kmem_cache_free(fgraph_stack_cachep, ret_stack_list[i]);


Received: from mta0.migadu.com (out-241.mta0.migadu.com [91.218.175.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ADF484223
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844615; cv=none; b=c4xCbkziy7sCBRPJBprG57m1uATrjMLPcNt9FwlLK93Z28j13/cTAG5caHHHox2kNST7nUWjjwVokHoIXwi7cgRS7aB/XHOEBppqupVyFl2wGnwghP1kDBZXbL1g4kA1upvk4+eO+HyaofjytcNaommrZcB4Cblo6DloYTV96NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844615; c=relaxed/simple;
	bh=Dcpe/MLdzTV2d19igkk0+MfzV5w7oUwPoV5yK+c21oI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hsrdNDogFW42cYbFphyrYLzb8h14SwMaYF6Ph652DEOoAxoY58E03jop3TYvI/bmhMiF+HhbK/LkZ7TFl6BHwRXVTTgTbvD3NvJDZDuIvGp0rUGzNEocFjWdXi0PEvxaEhVowFOmRJFKrHi3s5akcjqKoUhU1274Z/GvlyxYVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZuhjPzEs; arc=none smtp.client-ip=91.218.175.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZuhjPzEs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dcpe/MLdzTV2d19igkk0+MfzV5w7oUwPoV5yK+c21oI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787844608; v=1; x=1788449408;
 b=ZuhjPzEsg6meSTazNwRhPrDVVGHGbPrSdPtKv7oAIXpAyNnmzYhwOmFTXNyef/cKUWRV+1nQ
 8QzvikDKHT4kNkawUXkpm26QZwxd+NegWAmW68bb06lhggQPnbcTnqOukZXnYJ2QgQ+ua4d28ik
 28SSQc5Ar91sDyVa0SfMi+A4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ab4829f96f3a7d7;
	Thu, 27 Aug 2026 15:30:07 +0000
X-Mizu-Trace-ID: 3ab4829f96f3a7d7
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: pmladek@suse.com,
	atomlin@atomlin.com
Cc: akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	steve@abita.co,
	mproche@gmail.com,
	nick.lange@gmail.com
Subject: Re: [PATCH v9 1/2] hung_task: Reset warning budget when problem gets resolved
Date: Thu, 27 Aug 2026 23:30:01 +0800
Message-Id: <20260827153001.18515-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <ao7LW7-3GjJzKNp0@pathway.suse.cz>
References: <ao7LW7-3GjJzKNp0@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Aug 26, 2026 at 01:17:47PM +0200, Petr Mladek wrote:
[...]
>/*
> * The number of hung tasks which still can be reported.
> * The budget gets restored to the original limit when
> * the previous stall is resolved.
> */
>static int hung_task_warnings_budget = 10;

Yeah, hung_task_warnings_budget is better. Comments too.

></proposal>
>
>> +static atomic_t reset_hung_task_warnings = ATOMIC_INIT(0);
>> +
>>  static int __read_mostly did_panic;
>>  static bool hung_task_call_panic;
>>  
>> @@ -245,11 +248,11 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
>>  	/*
>>  	 * The given task did not get scheduled for more than
>>  	 * CONFIG_DEFAULT_HUNG_TASK_TIMEOUT. Therefore, complain
>> -	 * accordingly
>> +	 * accordingly with full details if the budget is not exhausted.
>>  	 */
>> -	if (sysctl_hung_task_warnings || hung_task_call_panic) {
>> -		if (sysctl_hung_task_warnings > 0)
>> -			sysctl_hung_task_warnings--;
>> +	if (hung_task_warnings_printed || hung_task_call_panic) {
>> +		if (hung_task_warnings_printed > 0)
>> +			hung_task_warnings_printed--;
>>  		pr_err("INFO: task %s:%d blocked%s for more than %ld seconds.\n",
>>  		       t->comm, t->pid, t->in_iowait ? " in I/O wait" : "",
>>  		       (jiffies - t->last_switch_time) / HZ);
>> @@ -264,7 +267,7 @@ static void hung_task_info(struct task_struct *t, unsigned long timeout,
>>  		sched_show_task(t);
>>  		debug_show_blocker(t, timeout);
>>  
>> -		if (!sysctl_hung_task_warnings)
>> +		if (!hung_task_warnings_printed)
>>  			pr_info("Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings\n");
>>  	}
>>  
>> @@ -304,7 +307,7 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>  	unsigned long last_break = jiffies;
>>  	struct task_struct *g, *t;
>>  	unsigned long this_round_count;
>> -	int need_warning = sysctl_hung_task_warnings;
>> +	int need_warning;
>>  	unsigned long si_mask = hung_task_si_mask;
>>  
>>  	/*
>> @@ -314,6 +317,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>  	if (test_taint(TAINT_DIE) || did_panic)
>>  		return;
>>  
>> +	if (atomic_xchg(&reset_hung_task_warnings, 0))
>
>I would use here atomic_xchg_acquire(). It serializes the ordering
>of reset_hung_task_warnings vs sysctl_hung_task_warnings.
>It would make it symetric with the barrier in the sysctl handler.

Yep, _acquire is enough here. Plain atomic_xchg() is already fully
ordered, though, so this looks like making the intent clearer rather
than fixing the ordering :)

The old-value return already makes plain atomic_xchg() fully ordered :)

ORDERING  (see memory-barriers.txt)
--------

The rule of thumb:
...
- RMW operations that have a return value are fully ordered;
...
Except of course when a successful operation has an explicit ordering
like:

{}_relaxed: unordered
{}_acquire: the R of the RMW (or atomic_read) is an ACQUIRE
{}_release: the W of the RMW (or atomic_set)  is a  RELEASE

>
>> +		hung_task_warnings_printed =
>> +			READ_ONCE(sysctl_hung_task_warnings);
>
>This would work only when "sysctl_hung_task_warnings"
>is updated using WRITE_ONCE(). But it seems that this
>is not the case. My understading is that it is updated by:

Wait, I think proc_dointvec_minmax() already handles this.

The handler publishes the reset only after proc_dointvec_minmax()
succeeds:

static int proc_dohung_task_warnings(const struct ctl_table *table, int write,
				     void *buffer,
				     size_t *lenp, loff_t *ppos)
{
	int ret;

	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
	if (!ret && write)
		atomic_set_release(&reset_hung_task_warnings, 1);

	return ret;
}

For proc_dointvec_minmax(), the converter is:

int proc_dointvec_minmax(const struct ctl_table *table, int dir,
		  void *buffer, size_t *lenp, loff_t *ppos)
{
	return do_proc_dointvec(table, dir, buffer, lenp, ppos,
				do_proc_int_conv_minmax);
}

Here, i is table->data, while lval is local:

static int do_proc_dointvec(const struct ctl_table *table, int dir,
		  void *buffer, size_t *lenp, loff_t *ppos,
		  int (*conv)(bool *negp, unsigned long *u_ptr, int *k_ptr,
			      int dir, const struct ctl_table *table))
{
...
	i = (int *) table->data;
	vleft = table->maxlen / sizeof(*i);
...
	for (; left && vleft--; i++, first=0) {
		unsigned long lval;
		bool neg;

		if (SYSCTL_USER_TO_KERN(dir)) {
			proc_skip_spaces(&p, &left);

			if (!left)
				break;
			err = proc_get_long(&p, &left, &lval, &neg,
					     proc_wspace_sep,
					     sizeof(proc_wspace_sep), NULL);
			if (err)
				break;
			if (conv(&neg, &lval, i, 1, table)) {
				err = -EINVAL;
				break;
			}
...
	*lenp -= left;
out:
	*ppos += *lenp;
	return err;
}

The min/max callback passes true for k_ptr_range_check:

static int do_proc_int_conv_minmax(bool *negp, unsigned long *u_ptr, int *k_ptr,
				   int dir, const struct ctl_table *tbl)
{
	return proc_int_conv(negp, u_ptr, k_ptr, dir, tbl, true,
			     sysctl_user_to_kern_int_conv,
			     sysctl_kern_to_user_int_conv);
}

proc_int_conv() writes i here:

int proc_int_conv(bool *negp, ulong *u_ptr, int *k_ptr, int dir,
		  const struct ctl_table *tbl, bool k_ptr_range_check,
		  int (*user_to_kern)(const bool *negp, const ulong *u_ptr, int *k_ptr),
		  int (*kern_to_user)(bool *negp, ulong *u_ptr, const int *k_ptr))
{
...
	if (k_ptr_range_check) {
		int tmp_k, ret;

		if (!tbl)
			return -EINVAL;
		ret = user_to_kern(negp, u_ptr, &tmp_k);
		if (ret)
			return ret;
		if ((tbl->extra1 && *(int *)tbl->extra1 > tmp_k) ||
		    (tbl->extra2 && *(int *)tbl->extra2 < tmp_k))
			return -EINVAL;
		WRITE_ONCE(*k_ptr, tmp_k);
...
	return 0;
}

So table->data already gets WRITE_ONCE() before atomic_set_release(). No
need for proxy_table here, AFAICS. I'd keep the rename and _acquire
change :)

WDYT?

Cheers, Lance

>
>   + proc_dointvec_minmax()
>     + do_proc_vec()
>       + proc_get_long()
>	 + strtoul_lenient()
>
>which does a plain assigment:
>
>static int strtoul_lenient(const char *cp, char **endp, unsigned int base,
>			   unsigned long *res)
>{
>[...]
>	*res = (unsigned long)result;
>[...]
>}
>
>It can be solved by using temporary variable in proc_dointvec_minmax().
>We have a custom proc_dohung_task_warnings() handler anyway.
>See below.
>
>> +	need_warning = hung_task_warnings_printed;
>> +
>>  	this_round_count = 0;
>>  	rcu_read_lock();
>>  	for_each_process_thread(g, t) {
>> @@ -340,8 +348,11 @@ static void check_hung_uninterruptible_tasks(unsigned long timeout)
>>   unlock:
>>  	rcu_read_unlock();
>>  
>> -	if (!this_round_count)
>> +	if (!this_round_count) {
>> +		hung_task_warnings_printed =
>> +			READ_ONCE(sysctl_hung_task_warnings);
>>  		return;
>> +	}
>>  
>>  	if (need_warning || hung_task_call_panic) {
>>  		si_mask |= SYS_INFO_LOCKS;
>> @@ -425,6 +436,19 @@ static int proc_dohung_task_timeout_secs(const struct ctl_table *table, int writ
>>  	return ret;
>>  }
>>  
>> +static int proc_dohung_task_warnings(const struct ctl_table *table, int write,
>> +				     void *buffer,
>> +				     size_t *lenp, loff_t *ppos)
>> +{
>> +	int ret;
>> +
>> +	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>> +	if (!ret && write)
>> +		atomic_set_release(&reset_hung_task_warnings, 1);
>> +
>> +	return ret;
>> +}
>
>We should use WRITE_ONCE() when updating proc_dohung_task_warnings.
>So, we need similar trick with proxy_table like in
>proc_dohung_task_detect_count. Something like, on top of this patch:
>
>--- a/kernel/hung_task.c
>+++ b/kernel/hung_task.c
>@@ -444,13 +444,26 @@ static int proc_dohung_task_warnings(const struct ctl_table *table, int write,
> 				     void *buffer,
> 				     size_t *lenp, loff_t *ppos)
> {
>+	struct ctl_table proxy_table;
>+	int warnings;
> 	int ret;
> 
>-	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>-	if (!ret && write)
>-		atomic_set_release(&reset_hung_task_warnings, 1);
>+	proxy_table = *table;
>+	proxy_table.data = &warnings;
> 
>-	return ret;
>+	if (SYSCTL_KERN_TO_USER(write))
>+		warnings = READ_ONCE(sysctl_hung_task_warnings);
>+
>+	ret = proc_dointvec_minmax(&proxy_table, write, buffer, lenp, ppos);
>+	if (ret < 0)
>+		return ret;
>+
>+	if (SYSCTL_USER_TO_KERN(write)) {
>+		WRITE_ONCE(sysctl_hung_task_warnings, warnings);
>+		atomic_set_release(&reset_hung_task_warnings, 1);
>+	}
>+
>+	return 0;
> }
> 
> /*
>
>Otherwise, it looks good to me.
>
>Best Regards,
>Petr
>

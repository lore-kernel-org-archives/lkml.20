Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544807;
	b=f4LewUpxbQuZWqnMGDfMR1hv2unoZe8b/4nUvgPHEI/XkvWaSYkyxk2GhCqFY7TXr1yg
	 RBTKt7fJucIKuRw8vlQaFCJ1SGw+AxUFFvUfRziDmq2RvVi7CqsW4WOfU+bWT/8UxgWhb
	 9CaxBw2QVKyp4o9nRjO42Oq81b10tYWCduzAMiVLvqqof32teVcmPdqyuxogGW6yjaCCm
	 xnON3Bj8UVI4uLBuR3cYDrNl+7MaE1UHevpZBsQvgulum6Q4ZnL1imtiVi+wV6pZF6gbr
	 FKekZyWeYHxHV9gnZMOkwDZxcXJjFi9dglKapBRI2w2hVzdsgki2/wxd8tXrhQVQUzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544807;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hrTqoFg4XSxjMW7Otm0fxEFKSoob9JY/XjLutZLZvIM=;
	b=geExKxBjnJsNDSTLgRYcYfGB6c1TD/BLFCmFcXH9vvYH6HyyXxl+MYmw9JTvFI1daNG2
	 eM+LuVo2GzMrCAgBJel6H2edkje/2UiKWvCSzvdxLIxe04b8IeNW7bKttg2SXVfx+1oa2
	 EFoK26tDfvwxmZixeQh+QLf8Wo89+Oee4NAMRTOxNQryk+3KfYFyu9UvkhPmuVPSAWX6O
	 3hkXUQwhvWESLoE0tmmzbyRHOmHWNTCzMHZ6mfNlO2YIVqw5jeH0/sFGatWK55v+CZAat
	 7zSQJrhN8gDL9aVWjU5bwUMR745RzrvaaC0QcqEn1i5+O7RG3cuAH98DxkpKN7Zq0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="X/oyih6V";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=c74O9Vqd;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724F606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A724F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=X/oyih6V;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=c74O9Vqd
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793544791; bh=hrTqoFg4XSxjMW7Otm0fxEF
	KSoob9JY/XjLutZLZvIM=; b=X/oyih6VQcxHdc9rBcZJiZLJalQOvX6py//yPqbTna/+K1a8VF
	1KPnpdTwL+fi7WuzOY1cGc4EVqZO7wEcFJTXRcprIW1XXJmHP/5Ie8Br4waqHf/P9b/YEx6/qnG
	tM5zygfTTD7EdY3uyU36tL1+1X2g0prf/sXbI3JNf93kI5KpNeRm2u+pQbNxjdK6QXfn5HhyvFj
	Fmbk+qRwQkbZI14NsfVPyqxDZ9wrDSmYloLSnD7sr8tiwI/snzr/fFvZ+GQnB1B/eJE2oq0NXJP
	JCNzEBFV2KNgvOn0ZQ53v901wQg+fp3622r4cRIs99o5rwLlNLLDM5SKaPSiqzihOOA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793544791; bh=hrTqoFg4XSxjMW7Otm0fxEF
	KSoob9JY/XjLutZLZvIM=; b=c74O9Vqd4yWBnW7y8Yi+MIYen5G3iYYTUefbeVotfeND7scGl4
	tqplqn22DBNONK7nk5bzKBxv90GGl0JV+ZBQ==;
Date: Sun, 01 Nov 2026 14:53:10 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Oleg Nesterov <oleg@redhat.com>, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
CC: Balbir Singh <bsingharora@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_taskstats=3A_Avoid_counting_?=
 =?US-ASCII?Q?an_exiting_thread_twice_in_TGID_queries?=
In-Reply-To: <audMK54OZfUMGdqe@redhat.com>
References: <20261031052451.78846-1-pocj8ur4in@gmail.com> <audMK54OZfUMGdqe@redhat.com>
Message-ID: <0666FDD8-7596-458C-9FF0-9A15259BF616@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 1 November 2026 14:26:51 GMT, Oleg Nesterov <oleg@redhat.com> wrote:
>On 10/31, Baek Kyu, Kim wrote:
>>
>> fill_tgid_exit() adds a thread's contribution to signal->stats before
>> exit_notify() sets exit_state. A TGID query in that interval copies the
>> cached contribution, then scans the same thread because exit_state is
>> still clear. The thread's contribution is counted twice.
>
>I forgot everything about this code, quite possibly I am wrong but let
>me add some comments anyway...
>
>Yes, known problem. Plus afaics fill_stats_for_tgid() can also miss an
>exiting task, see below.
>
>Another problem is that taskstats_exit(group_exit => true) can miss other
>threads which have not called taskstats_exit() yet and report TGID/AGROUP.
>Afaics this patch doesn't try to fix this.
>
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -2202,6 +2202,9 @@ __latent_entropy struct task_struct *copy_process(
>>  		goto bad_fork_cleanup_count;
>>
>>  	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
>> +#ifdef CONFIG_TASKSTATS
>> +	p->taskstats_tgid_accounted = false;
>> +#endif
>
>I agree with Bradley, this looks unnecessary.
>

I checked, it is dead code, it IS unnecessary (impossible to reach)

>> @@ -261,7 +261,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct
>taskstats *stats)
>>
>>  	now_ns = ktime_get_ns();
>>  	for_each_thread(first, tsk) {
>> -		if (tsk->exit_state)
>> +		if (tsk->exit_state || tsk->taskstats_tgid_accounted)
>>  			continue;
>
>If we add taskstats_tgid_accounted, why do we need to check exit_state?
>
>In the multithreaded case, if taskstats_tgid_accounted is true, then
>exit_state should be true too (ignoring the kmem_cache_zalloc() failures).
>
>In the single threaded case this looks simply wrong. The exiting single
>threaded task will not call fill_tgid_exit(). If cmd_attr_tgid() is called
>after exit_notify(), it will miss that zombie.
>
>
>And... Perhaps it would be better to use ->atomic_flags rather than add
>yet another member to task_struct?
>
>Oleg.
>

--- Thanks!

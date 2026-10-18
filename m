Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258653A6418
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313858; cv=none; b=dr5R8WQJXNsQQiqN7s6hWlDxy1h1rOeqQttziMZU/EMRRc3FgOQU9FAWvKXIWfGYeSdEbjpHFXKcMcOBD51OdQmwHaiBRCL4/UzfGVSZQq+wLA1WGS0H5MKJBRwNkXV1Kh1MNdRZJzu7zNmFlPt7s1r8JmQIG8CrIzOwaCcFBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313858; c=relaxed/simple;
	bh=nENAYkziLDO/dfWnrWZvMbQgf1kuFCik+87Kahko8Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGPq2RgXKEfdRgf5k0WgDS2gWiEEtx/n7un7NH0xgMuU1iEESW5KucwVY/914nUZTxqk9O0TiFX3NggpZAld50fa34PUvNBT0P3W3moDA5wov6ZPjdNgcjEsr9/o/tygrnMmpgrefLV7BQ2ZSX1o5Tw3oFsDeRV30j0XbnGLTPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=colorfullife.com; spf=pass smtp.mailfrom=colorfullife.com; dkim=pass (2048-bit key) header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.b=sHz7SCeD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=colorfullife.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=colorfullife-com.20251104.gappssmtp.com header.i=@colorfullife-com.20251104.gappssmtp.com header.b="sHz7SCeD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so899680f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20251104.gappssmtp.com; s=20251104; t=1792313855; x=1792918655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRpMKu16Q/46x/JCsK9hFw+qY2y44myLhR4+B4ycuBg=;
        b=sHz7SCeDkAV8fuppUWANDnj9mw888OXaz1tgzrw5K/jqAYvTKgFJUw6qDDkHK8+OUV
         F9Nx8JcKvfI3VPbID9bywT7SKDntIih9XS7TqePhQo0apMVZMnBhsny8/qCdx7jHbetX
         ddlf3HLiyXFtWEp/Bsm0Lbgsu8Vty87mKZYFOAzz+pxCpYspdRBn4ql4UeoZW90NO2S4
         M9+DImJCZeTnAwaQEk80XEaqE/xiAjrZANbYyI2q95UIqmbZnw4eK/qWHVVrVvXXWcUj
         uOSkjgleRsIrIaf0XT8PUDRaVAdJR6aSz67YhRSlYSvplpwOzBw3c88HNu7uTDKKVrkz
         acLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792313855; x=1792918655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRpMKu16Q/46x/JCsK9hFw+qY2y44myLhR4+B4ycuBg=;
        b=nphaJmP3rtgS0ag39elgLGZruScDJroadpz25GNKR5kqZxiKdJwTVhQF8YxcouI2GP
         0lLdHJDcALlXP62UvpTpwsma+LA17DT3n7taLfWP25tO/A34md66QwGE0joZw+smW/y5
         WKvRZrSp4L+VLaeF3Zhx0Q8Pt4AYUA2n+sW8lNXNMpaUlkpHw+B648NTWBzdpiSSCMqK
         x8YQwKdc2IlgRMcW9qLtFUGIBpO7WEk5KCZfz7PnfCuIlmTZuifgw1Gbgc4GDH5kiYEo
         n/Y9wCgj5707agyGtxkwJO2Vs/MALiy3rKYFm6wzsxh9fByPVHOodfTda9KNOjJs7n6D
         Jl/g==
X-Forwarded-Encrypted: i=1; AKwUvBzoEeJHxe8DAm9SAcVun7a/bZTQE0XpA7k+Ak1Llm3YVOH8DrUjENKmcqtDzjhTkx2FFzyD5JqqW5hqD+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqO1/R/0i+svwqPevQMvGv9JBur9ojaQq0clwtUobrid7IasJt
	djD4nOtAnuyEc1RsaAZpr9T0u5x8LjJ97vAcXtjo6OhqPeccLNH2a1Uh20quz5BQAw==
X-Gm-Gg: AYBFou0eV4QG6n4C3dBxiCvTm8SoyWw/10FGeYl7HcyKmIPdwfCN71L2MTQTsjaTEYT
	KXIxcdoLOpCwXwLlLsA4AF1xFFdVub8bhK1UIVtPi4Efrh3IeiLMBddBjQFwj4Gi5YRv1xCsSve
	xEsfugT5ZmUu8IrtRMeZiE5h+H3Uz0tCS6SUS1//2FbFl/LyBUF7tcQFG7GLNcbcggv7dDNCPca
	E0yoCUbLLwhzNzwGA4PIp2cK1yTM4tXl6SRfC1ZCQFiYmsEtYPIa2231d+t4E2PTK0G9z2rh0wg
	9ak8md7os9dYcB9gZsVlbhUK04rl0SZID1MXmzRHzAnxg87NkPdKZse7GWhgr55yB5TU6FCWG4M
	8O+UgKfMVLB0YeNfPAvd2qx5o513qAC/Pbup0l6COml5bF0CTjZAROl3q7674OD6jt/2jXNracW
	/dx49fhI0D48yVuZY4LkOgYzlqHj6Tc1Mz2jtzpGybVBVHbuUPN8cjvXtXukOIlWZs6/QM6wCdg
	+9zJiA+mQJsIPuTlmtEHRER6KOUs+lTWw1MbJIzz/EcwMyQhVpcVaO5zK0UYPMUjzpZEhHU7a+e
	aagS59Evu35gCLVMAXEL5pc3E3uH/UyxxOjHYg==
X-Received: by 2002:a05:600c:8219:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a1d76031bfmr97737755e9.20.1792313855253;
        Sun, 18 Oct 2026 01:57:35 -0700 (PDT)
Received: from ?IPV6:2003:d9:9733:4d00:46a9:a5ac:4915:e68f? (p200300d997334d0046a9a5ac4915e68f.dip0.t-ipconnect.de. [2003:d9:9733:4d00:46a9:a5ac:4915:e68f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a88bbsm282747915e9.3.2026.10.18.01.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 01:57:34 -0700 (PDT)
Message-ID: <51c93c19-f1dd-455f-8698-6b1ee30eb630@colorfullife.com>
Date: Sun, 18 Oct 2026 12:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipc/sem: account enlarged sops arrays to memcg
To: Andrew Morton <akpm@linux-foundation.org>,
 Wang Yingjie <x-professor@outlook.com>
Cc: Alexey Gladkov <legion@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Vasily Averin <vasily.averin@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
References: <20261016152609.2528805-1-x-professor@outlook.com>
 <20261016155905.2a659b7bb7d61f33467a3263@linux-foundation.org>
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
In-Reply-To: <20261016155905.2a659b7bb7d61f33467a3263@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/17/26 12:59 AM, Andrew Morton wrote:
> (Alexey, Eric, others: please weigh in)
>
> On Fri, 16 Oct 2026 15:26:11 +0000 Wang Yingjie <x-professor@outlook.com> wrote:
>
>> Commit 50ec499b9a43 ("sysctl: allow change system v ipc sysctls
>> inside ipc namespace") lets an IPC namespace owner change kernel.sem.
>> The SEMOPM field defaults to 500 but has no semantic range check.
>>
>> do_semtimedop() allocates nsops * sizeof(struct sembuf) with
>> GFP_KERNEL. A blocking operation retains that buffer, so a user can
>> raise SEMOPM and hold large attacker-selected amounts of host kernel
>> memory without charging the calling task memcg.
>>
>> On the current mainline base, one 10,000,000-operation call retained
>> 60,936,448 bytes while a 32 MiB cgroup peaked at 909,312 bytes and
>> reported no limit event. Sixteen 1,000,000-operation calls retained
>> 100,860,416 bytes while the cgroup peaked at 1,310,720 bytes.

Just for understanding:

Each sleeping thread (within do_semtimedop()) can use 60 MB, assuming it 
triggers a 10 mio semop() call.

It could be a bogus 5 mio times "increase by 1, decrease by 1" semop(), 
or a valid semop() on a suitably large array.

>> Commit 6a4746ba0619 ("ipc: remove memcg accounting for sops objects in
>> do_semtimedop()") removed accounting on the premise that the buffer was
>> at most two pages. Preserve that default-sized path, but account arrays
>> larger than the default SEMOPM value.
> OK, I think. But...
>
>> With this change, both test configurations reach the 32 MiB cgroup
>> limit and the caller is terminated by the memcg OOM killer before it
>> can retain the enlarged arrays.
> Only if memcg is enabled and the task's memory cgroup has an effective
> limit.  Otherwise we can end up handing out idiotic amounts of kernel
> memory.  Memcg accounting isn't a substitute for limiting the
> allocation size.

The previous assumption was the other way around:

ipc is full of legacy users.

Thus any hard limit risks to break existing setups.

If I remember it right, either SHM or MSG had code that tried to split 
the permitted allocation, i.e. if someone creates a new namespace, then 
each name space inherits half of the limit.

This was removed, since memcg would be the better substitute.

Old discussion: https://marc.info/?l=linux-mm&m=139639755705736&w=2

But I can't find right now the code that tried to split the limits.

>> The sysctl also accepts negative SEMOPM values. Since nsops is unsigned,
>> SEMOPM=-1 bypasses the intended operation-count check.
> Let's fix this first. nsops is unsigned int, whereas ns->sc_semopm is
> int. In the comparison nsops > ns->sc_semopm, a negative SEMOPM is
> converted to unsigned, so SEMOPM=-1 effectively sets the limit to
> UINT_MAX.
>
> I'm thinking:
>
> - Permit init_ipc_ns.sc_semopm to be set to any value from 1 to INT_MAX.
>    This preserves the existing ability of host root to configure larger
>    limits.
> - For all other IPC namespaces, permit values from 1 to 1000. The
>    documentation has long recommended 1000 as an upper limit, although
>    it hasn't been enforced. This would be a new restriction, so the
>    changelog should explain why we're introducing it.

This would mean workloads with higher SEMOPM values cannot run in 
containers, correct?

According to commit e4243b8062c1 "ipc/sem: play nicer with large nsops 
allocations", values up to 1000 are recommended.

And 
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html/Tuning_and_Optimizing_Red_Hat_Enterprise_Linux_for_Oracle_9i_and_10g_Databases/sect-Oracle_9i_and_10g_Tuning_Guide-Setting_Semaphores-An_Example_of_Semaphore_Settings.html 
recommends to set it to SEMMSL, i.e. 5000 in the given example.

> - Validate the new values before installing any of them.  The current
>    proc_ipc_sem_dointvec() updates the live array directly, and
>    rejecting an invalid value afterward would leave a window in which
>    other tasks could observe it.
>
> - Update the comment in include/uapi/linux/sem.h. The warning about
>    physical memory fragmentation is outdated now that the allocation
>    uses kvmalloc(). Document the new 1000 limit for non-initial IPC
>    namespaces instead.
>
> Ideally, a new IPC namespace would inherit its parent's configured
> limit, but currently every new namespace starts at SEMOPM=500. I don't
> think we need to change that as part of this fix.
>
> Then please redo your memcg-accounting patch as a separate followup,
> with suitably adjusted changelogging. That would provide additional
> protection for legitimately enlarged allocations in the initial IPC
> namespace and for allocations between 501 and 1000 operations elsewhere.
>
> Thanks.



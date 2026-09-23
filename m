Received: from mail-pj2-f20.google.com (mail-pj2-f20.google.com [74.125.227.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75425535FD9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172272; cv=none; b=FwZzwMyw0YKMyFvXw7ZvDIXgwH+ty/4jTyS0LLJwfsj4KAANGsK0nsanpMEiJZ8lzEyxcxLgRqREERdRZTg/8Ei9vUfilkb16g+4VZAm0xFJCtBbBMf7cGD0mal3353gLFFHlv3BE97WBGUAT9lHho7DCOzq2Td7sj2qRWoybo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172272; c=relaxed/simple;
	bh=fzexYp9ocVXfzX+dA4wVPUR0BQc9WKEVJV6bMs7zCNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paq8Uc7uaHHo+mYyBzMaCRAYYwrRmyY+A9QRmYMVLCmBwQISFPzbizuNMCkwmSGPz+ekPXspgSlfgJqFdJMdXzmLLVfXEDOndsfOwDZpMhcCPlnfvjvx5MrHwOZI2aL6NjjzA91TzZ1oUszlu62h/7BSaCZmXW4TS6FG1zE/7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9mwimB2; arc=none smtp.client-ip=74.125.227.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9mwimB2"
Received: by mail-pj2-f20.google.com with SMTP id d9443c01a7336-2d747ed9866so7102155ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790172271; x=1790777071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BuzPip0qaZAWzTRFnN9M+nLsfF91txM3L3Zprj8FCwE=;
        b=F9mwimB28JeErsAEaTEXV8NKBCO0KDS18f2XKXu7PYbb+m9EA4y70GmScJifyR3vr8
         PyDCjjc0JANc9hJpFz7snom3iupP5kpK/hYaq+zmv4vreUyQ6zfqAxsozxrLKcg2a92G
         2k41OaouW67DcR1W9AgkL4iGSKPthBFZzElWRp6WSRu8BKxrJj80ccCF4hPvhEEIoEwQ
         fm+joo7XZcggsbhnc103lOaGwpqqmMyDcmiUZY107zy7LK9Mmz5WbqcU04AgOuTbgwYt
         BQhL/e2+zxFrU26WXGAAyYQRSVoFwx4AYsxceZUumVfjTMo1yRrvmpcGExKqRrnlcO1r
         IYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172271; x=1790777071;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuzPip0qaZAWzTRFnN9M+nLsfF91txM3L3Zprj8FCwE=;
        b=IF+A6S6fNL5wialqiN2kfD2ndTwCCQVNRp42dGgb2Xr2mbvBFZ2rHNFH0qltsf7hzF
         0TNqB+pdUIRKNxHX0I8Kxl2j5bx3vsUgwTjoh0Ps/qwEpv8T4+v+2Y5V/tkiYWgv756j
         86G36C1Xh0QMC1Jer6wSq+pNWQJ+0wo+C1mgxpZj7aspiqnFj75g05ElBmvAsXPfMJQK
         Y1gpMmNFIUCwWGk2Uj2SQT3ardWt2Abaa08FlUQwpx+i2PaD6USK0yM2Ev1jBEvABGXm
         zNZNPMBKv5uFtIWuMoqQ1U8NsuGx5e1t+89vZWhpeYp/XuPNmgUkOSH/t9hE7UU12K7c
         onBg==
X-Forwarded-Encrypted: i=1; AKwUvByzumQ+jjXeIbm2oAXxU+1NCt92/McTnMIxioXYU9ytNFPCK+M8e26FeYdBoDyx5LFLmvdb3wVvdeLkwVE=@vger.kernel.org
X-Gm-Message-State: AFuF++m8yyzqBCx3yVMKdId45W/52Lf+UH4S8NL0y3BvA+IlJ2qVKZqt
	fxX6J1L5+GbjZHenz/CmUCrxC+KpXAJwOSS+UoJ/SE4AtBM8Y6OvwJcF
X-Gm-Gg: AYBFou27p7LnX1gIinmeYHZCk1zM/h6T8mdbDkErN/4btfw3ezKF054aDWy8xu7xAYe
	pJB3Ce1RnuoYVXG+uFe5PDURdIjCNU7lcoXx3waDZCI0Sy3dpXspAjT5pydEF3XanPzKU1zy0rw
	8U13gmQB4lAksnybfmKGTwQmvKj90hwydPVWyjE/trN3wVx4rsjKzOUm/PFDzGWrj0FU/9r2dTD
	NSkS+k3W5JvzCgBqHdG2bQimYKL4R7TAYDcR1wU6NuaiumPIQ/a0DQpX881VVGNtdKM4zeJOlrI
	M6sxlvXDTENu7UrSCQLSpW+uG/AuzoPxHirNW+arx9KNiYrqobpOBRDWxQ0PpNnBOLm2+hQnwp5
	K5UrKwqPHbe+o2tor7SZ0yitCw8yRqyEcGdnYFtE3O64SGcSMqXnyjuBxbsIUGH6Bv1XG1Gd4jI
	uR8OLyAcASua10Wh8X3Y4tSh4K2mw1JE6GNlqKgIg0n5XHkSdQQN+9k1oOS9OKruEdhTxW/DUx
X-Received: by 2002:a17:903:3846:b0:2da:f1b1:56c4 with SMTP id d9443c01a7336-2df69d2985bmr25634075ad.3.1790172270375;
        Wed, 23 Sep 2026 07:04:30 -0700 (PDT)
Received: from [127.0.0.1] ([103.152.226.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f965esm11301515ad.75.2026.09.23.07.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:04:29 -0700 (PDT)
Message-ID: <d60be130-23eb-4e11-9bb0-1df0ec6ad42e@gmail.com>
Date: Wed, 23 Sep 2026 22:04:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [RFC PATCH 07/12] futex: Make FUTEX_*_PING use Proxy Execution.
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: suleiman@google.com, andrealmeid@igalia.com, bsegall@google.com,
 dave@stgolabs.net, dietmar.eggemann@arm.com, dvhart@infradead.org,
 jstultz@google.com, juri.lelli@redhat.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, qyousef@google.com, rostedt@goodmis.org,
 soolaugust@gmail.com, ssouhlal@freebsd.org, tglx@kernel.org,
 vincent.guittot@linaro.org, vschneid@redhat.com
References: <20260917043339.2093426-8-suleiman@google.com>
 <887eff66-35f3-4703-8ff7-c0c959621b69@gmail.com>
 <8abf8b0f-38eb-4a25-a40a-57d5439e52e7@amd.com>
 <20260917153649.GK4121339@noisy.programming.kicks-ass.net>
 <d7d00454-0789-486a-9439-1734a64f304f@amd.com>
From: Jihan LIN <linjh22s@gmail.com>
In-Reply-To: <d7d00454-0789-486a-9439-1734a64f304f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/21/26 12:51 PM, K Prateek Nayak wrote:
> On 9/17/2026 9:06 PM, Peter Zijlstra wrote:
>>>> Could we handle cycles in find_proxy_task(), or add a chain walk for
>>>> deadlock detection for FUTEX_LOCK_PING like rtmutex?
>>> https://lore.kernel.org/lkml/20260714152220.4046736-1-soolaugust@gmail.com/
>> Ah yes, that thing. I would suggest to still have a hard-coded limit,
>> but perhaps in addition to the sequence mark.
>>
>> Without a hard-coded limit, userspace is free to create chains of
>> arbitrary length. This should be discouraged :-)
>>
>> Also, we need to be able to return -EDEADLK to userspace.
>>
>> Ideally userspace gets to have an extra graph walk on block though, and
>> not rely on pick time sanity checks.
> Ack!
> 
> One way to do that is by setting the "p->blocked_on" to -1 when
> find_proxy_task() detects a chain and then clear the "p->is_blocked"
> making it runnable.
> 
> Once the task exits out of schedule_preempt_disabled() and grabs the
> wait_lock, we can check the "p->blocked_on" to return -EDEADLK / stop
> proxy and fully block the task.

This approach could reuse the owner walk, which sounds useful for
avoiding an extra chain walk in the contended futex path.

That said, checking for deadlocks before sleeping would also be more
similar with PI futexes, and extra walk might be worth the cost if the
last lock attempt can simply return -EDEADLK to userspace.


Best regards,
Jihan

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793504247;
	b=5RA75oom/RgfBCUOGsBThvHK5RA/LyoP9jXM+X7L5gbt7KoUFZxWg2LcR0TX/3+dhiB+
	 YMpPPB0X5rornpuRq68TIWQfp/qK1Shhmp+FOn5uBvbocwqt1cT0QykXslrkJWHtJFPTL
	 +apZZadUKKHvl4NVmmbrRQq1DYUgxcXh77qZ6hCybB7unBLMwsTycAgvGXl6ithvUXKR3
	 yYUpjZ+9xYNKdMAPuHeap+6DN9VMnlNZOjyHhfb6fmV3qboiX8Xps0IEhZ1U+4y7OuB3w
	 vieyo6N634o88vkllaxmZBUitdB3SPcIvdSrjCGxVOKLPocXTR29+fnW0hV/yJ20/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793504247;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G1tFTKUBc2+iGTzDECw5/2ac1gX4DuSirPbto9t/U2Y=;
	b=34sZ2kSb3FuDGq7U+y9TkwWwesJYlD+nG3KrRCp5CKv3IvU5amxkhbyg6sYdHZlHEn6q
	 0YyrbaqR7fmqoiqCU0RZCyP7wSFrFGrBH9PosrPBkVL+/xKMpgVrZEy3MzD96NgGBGQ09
	 jxmS583phawRskaBtapVFImzvPvGXfn186JjS2abvPTDNVjSZDabr8j9WwSfmq1J0afcs
	 DglE10OpK89ekvDtKxJIkagYdaEjBHs5e+JVmugpa3+E30TCSbktDlr98aRNN+It3Sj0r
	 F4To1zIol/smC4+nibYISC1A6YqtV3WlVmOenm8uqB7IomrLfj1ev5ErCF6c86uQ3BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zZL999tf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD6606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=zZL999tf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819E81F000C1;
	Sun,  1 Nov 2026 03:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793504247;
	bh=G1tFTKUBc2+iGTzDECw5/2ac1gX4DuSirPbto9t/U2Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zZL999tfH5pFUtNBJCiS+dMlFz/f55Px5Ti43L4BhkNaNVNvh4gL4E5fm/H6iX/sN
	 e4OQBFW9YQokq1GITbuOg5IiDSWQwEzR0cYXgAyrjSHJbldG6XHhunQI5RRPvH5LLW
	 aLuLItcYuIdPHDek/9Dugywk9o/MRbE6Pjp5apwQ=
Date: Sat, 31 Oct 2026 20:37:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ren Wei <n05ec@lzu.edu.cn>
Cc: linux-kernel@vger.kernel.org, david@kernel.org, arnd@arndb.de,
 ljs@kernel.org, kees@kernel.org, schuster.simon@siemens-energy.com,
 yuantan098@gmail.com, yifanwucs@gmail.com, tomapufckgml@gmail.com,
 bird@lzu.edu.cn, caoruide123@gmail.com, enjou1224z@gmail.com, Manfred
 Spraul <manfred@colorfullife.com>, Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 1/1] ipc: sem: fix used_sems overflow in newary()
Message-Id: <20261031203726.2dca9645bd13ac9c18248380@linux-foundation.org>
In-Reply-To: <849fb1fdecd1cc241fd5b032602dbffa90f9dd93.1778477179.git.caoruide123@gmail.com>
References: <cover.1778477179.git.caoruide123@gmail.com>
	<849fb1fdecd1cc241fd5b032602dbffa90f9dd93.1778477179.git.caoruide123@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> On Mon, 11 May 2026 18:42:53 +0800 Ren Wei <n05ec@lzu.edu.cn> wrote:

Slight delay, sorry!

> From: Ruide Cao <caoruide123@gmail.com>
> 
> newary() checks namespace-wide semaphore usage before creating a new
> array, but the current accounting uses a plain signed addition.
> 
> If the accumulated semaphore count overflows, the limit check can fail
> open and allow allocations past sc_semmns, breaking namespace semaphore
> resource enforcement and potentially leading to resource exhaustion.
> 
> Fix this by using check_add_overflow() before comparing the new total
> against sc_semmns, and reject overflow the same way as a true limit
> exceed.

LLM review tells me

: The fix looks correct. The existing writer lock covers the check and
: the later used_sems increment, so that increment needs no further
: change.

and

: Please qualify the changelog. Default SEMMNS and SEMMSL cannot trigger
: this overflow. It requires raised limits and substantial existing
: allocations: sem_alloc() separately bounds each array's size, so one
: enormous request isn't sufficient to demonstrate a successful bypass.
:
: With sufficient memory, semget() can then succeed instead of returning
: ENOSPC, exceed the namespace quota and wrap the semaphore usage reported
: by SEM_INFO negative. Additional allocations can increase memory
: pressure.

So I propose this changelog.  Please check:

: newary() checks the namespace-wide semaphore limit using a signed
: addition of used_sems and nsems. If that addition overflows, the
: comparison can fail to reject a request which exceeds sc_semmns.
: 
: The default semaphore limits cannot trigger this overflow. It requires
: raised limits and substantial existing allocations. sem_alloc()
: separately bounds each array's allocation size, so a single enormous
: request is insufficient to demonstrate a successful quota bypass.
: 
: With enough memory, semget() can succeed instead of returning ENOSPC,
: allowing allocations beyond the namespace semaphore quota and increasing
: memory pressure. The wrapped used_sems count can also cause SEM_INFO to
: report a negative semaphore usage count.
: 
: Use check_add_overflow() before comparing the new total against
: sc_semmns, rejecting overflow with ENOSPC. The existing writer lock
: covers both the check and the later accounting update.


> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@kernel.org
> Reported-by: Yuan Tan <yuantan098@gmail.com>
> Reported-by: Yifan Wu <yifanwucs@gmail.com>
> Reported-by: Juefei Pu <tomapufckgml@gmail.com>
> Reported-by: Xin Liu <bird@lzu.edu.cn>
> Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> Tested-by: Ren Wei <enjou1224z@gmail.com>
> Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
> ---
>  ipc/sem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/ipc/sem.c b/ipc/sem.c
> index 6cdf862b1f5c..00c45de33c46 100644
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@ -535,11 +535,13 @@ static int newary(struct ipc_namespace *ns, struct ipc_params *params)
>  	key_t key = params->key;
>  	int nsems = params->u.nsems;
>  	int semflg = params->flg;
> +	int total_sems;
>  	int i;
>  
>  	if (!nsems)
>  		return -EINVAL;
> -	if (ns->used_sems + nsems > ns->sc_semmns)
> +	if (check_add_overflow(ns->used_sems, nsems, &total_sems) ||
> +	    total_sems > ns->sc_semmns)
>  		return -ENOSPC;
>  
>  	sma = sem_alloc(nsems);
> -- 
> 2.34.1
> 

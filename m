Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802759;
	b=vERw3e4a5V5pjQpNhmo8mR0ejuxpq+v5LX0vRW1Zm/iUTospNe6VGYnLLoAKMuiFBcuE
	 B3FzWBuZk5ATPod3tidjSSro0qOupn1QICqtuB8tGVOkaajJgwQ/546YFBuxiDtSVvIwJ
	 g1VTKEMvbIl/STaY3glN4F3Fqbf/waLRdaX0D1yRDruFRf3ToCLbt3VGQmVddvK+2bfYq
	 c+izhGS8kJNDs4UoDrf1s+sGi4pITGnCnPF9MCMvEl0hUt2ZI8fQsSJcs2dIB7P7GUbcd
	 KKtNknG3ByLrLb34PDk3gk0Qg5mG/QxsswqRi8Hbpg0Hfka6/CpX7jjC+BtaDN5tftQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802759;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n4CDV4ziRFU3xddHncpYnLzq3A+HLPidciJ1bfu5cIk=;
	b=3pYzLCE102VHpgXcp+JQyYR27Ug16kY/0/fHu0vfF664qaounqC+j4zuI3Ea59TL3Ghj
	 LP5D+27rSvfQS2twVXsbPyF680jCnosgPPMDzogQ4D6zUoO8m5GZ/OgJWU4oBQ0gC5cRo
	 UYe3mot+b6LBySK98cqcj1xJeZRKMYaE4tdnc5QXaG4Y5RPkBRBIUdnQVr/yfv3yiojvY
	 mwABcXDXRDi33EZyuhl+IfQCkhhNnRrNCu6G6WS1etICzh+amQ1DkAwqYBmF7XIWflpAN
	 hbrOa7oKqKBaT0q7atd4UWW/FurUlOpMNvqKrLwe/61YooQvT57TYXswvlJv+LFwhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jw0iSV5Y;
	arc=none smtp.remote-ip=95.215.58.123
Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60535606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60535606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jw0iSV5Y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IjpKErh6Re8z+1/3lW8pFvWGsn41vSm3orTI4RjKMEE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794802756; v=1; x=1795407556;
 b=Jw0iSV5Yzt7XlM7CPt8TBpBWyib0JnfRWnaLD39IkMnizBJ8ngyyPVR3ljoABA4N2yRb199j
 8QtSD2okD/RlDSshHDqP5dFxT5xPa9z+H75Hahv9tzUP+lT5D9pCDFtf++YjQ5NFdt6p2PdaPXw
 QtW+ZinnBn3t3hBT/+TzKOmg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 59a289117738f648;
	Mon, 16 Nov 2026 04:19:16 +0000
X-Mizu-Trace-ID: 59a289117738f648
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 20:19:12 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Yingjie Wang <x-professor@outlook.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	Manfred Spraul <manfred@colorfullife.com>, Alexey Gladkov <legion@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Vasily Averin <vasily.averin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Michal Hocko <mhocko@suse.com>, Alejandro Colomar <alx@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] ipc/sem: account dynamically allocated sops
 arrays to memcg
Message-ID: <avqD2Z3KJwPsCcVG@linux.dev>
References: <cover.1793250194.git.x-professor@outlook.com>
 <07d9034ec1fb5b6fd5eed2cf60ef3c84d5149e51.1793250194.git.x-professor@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07d9034ec1fb5b6fd5eed2cf60ef3c84d5149e51.1793250194.git.x-professor@outlook.com>

On Thu, Oct 29, 2026 at 05:03:25AM +0000, Yingjie Wang wrote:
> Commit 6a4746ba0619 ("ipc: remove memcg accounting for sops objects in
> do_semtimedop()") removed accounting based on the assumption that sops
> arrays would remain small, describing a maximum cost of two pages.
> 
> SEMOPM is a UAPI default that can be changed at build time and through
> the per-namespace sysctl. Commit 50ec499b9a43 ("sysctl: allow change
> system v ipc sysctls inside ipc namespace") made that limit tunable by
> IPC namespace owners without capabilities in the initial user namespace.
> 
> do_semtimedop() keeps up to SEMOPM_FAST operations on the stack. Charge
> every larger, dynamically allocated operation array to the caller's memory
> cgroup. This avoids a second size threshold and prevents a configured
> SEMOPM limit from expanding an unaccounted heap-allocation range.
> 
> In a 4-vCPU KVM guest, with the benchmark pinned to one vCPU in a leaf
> memory cgroup, accounting raised the median time per successful semop()
> call by 2.3% to 3.2% for 65, 500 and 1000 operations, compared with
> unaccounted allocation. An invalid semid, which allocates and copies the
> array before returning EINVAL, rose by 5.6% to 11.9%. The 64-operation
> stack path changed by at most 0.9%, and successful calls in the root
> cgroup by at most 2.3%. Each result used 21 samples from three boots.

There is no kmem accounting in root cgroup, do you know why there is an increase
of 2.3% there? 

> 
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Link: https://lore.kernel.org/r/20261016152609.2528805-1-x-professor@outlook.com
> Fixes: 6a4746ba0619 ("ipc: remove memcg accounting for sops objects in do_semtimedop()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>
> ---
>  ipc/sem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ipc/sem.c b/ipc/sem.c
> index 5ec41de7e85b2..ea95cca5bb0ec 100644
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@ -2234,7 +2234,7 @@ static long do_semtimedop(int semid, struct sembuf __user *tsops,
>  		return -EINVAL;
>  
>  	if (nsops > SEMOPM_FAST) {
> -		sops = kvmalloc_objs(*sops, nsops);
> +		sops = kvmalloc_objs(*sops, nsops, GFP_KERNEL_ACCOUNT);
>  		if (sops == NULL)
>  			return -ENOMEM;
>  	}
> -- 
> 2.43.0
> 

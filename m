Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674143;
	b=FY/NMq4uYRLiG6VeRC4o2i6Gm6V61FEtqfDo6cNq4qsIBqkzXoZUGG9KucAC8V+9knkz
	 x5cZe7yNwbXQg1b8NY3bdLyyeEd0/x9ZrrZWls6jpY3uqOPexyCwTIY4jeSYsbqaisCpE
	 5/HKva7/gQvXiipnEmzre13wmowncQe/kv7LvdxH46lrjGhup7OUTLCuyytcG4yNEksbN
	 jSJS3f5ZDkBztfSKZoD0V6ISOveaPyyrZG4UAOkIruG2G46ob/1CPexxLWzeOo4K8I/1u
	 oF/NkdsYJ/HeGxrTp/QjTgt40n4EK7JBTmaQEf+rOKubeWUa+7mZSUEnUfxrNlybtFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DoDCGmpaF9TJDAMFtbT2QMrNd5G5ZzhW2VZ6L8kTSQo=;
	b=Gy/ECttOjZWoe7AyrQxGVOH+qUeb2uLOQuHbday/plljaJakjw/zttXHiUkYTbtLbNMB
	 oT5kJp67Xwe/eyNrVHryrcAaDSs/U0u+NkqqBNN66zN3ZSUYY/FcEdKgFp1ePbJY+FlY3
	 ZaMn0yU7frT0p80uFYNpZkD1kEClhe5NZTt0vn3LJN0B9b7ZcQB3apQKpocrS+oA3MWYs
	 ZcEPrapLFdrPAR6rXh5nXeOaQ55irbQdss/WwFb4BxL+AKjRTUllxDal9iAkm7MDMZmM8
	 7UcgRQquiNOrSO0lD52+E7GOr8ud0vO3JwM9WsaD+6OHTAwuj11NzkdxyDJjoV5Q+ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgFZnq39;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0677B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kgFZnq39
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F251F000C2;
	Thu, 22 Oct 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674142;
	bh=DoDCGmpaF9TJDAMFtbT2QMrNd5G5ZzhW2VZ6L8kTSQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kgFZnq39CKfZvJT+x/rf0v4DLUYAzQxJmCuHgdfJ6k2Xiy+Wo597OLtq3jiRswqDI
	 f11ReG6DfZFE3e2E6kJdaQmjP+MFNC1zirKYWL1W0oZBpfXkQMoR7y8Ha3VtuetZeb
	 9ffirV2bpHhO3GFJCrTic53Mt+teLP1krCUJPfI6JMzku7rixHyZlfbd6VJOcZOj+n
	 q2ZH9gJmiHG8R3DBqxOBAU5siOBLOveFubDsTuYoMNF3N3l+RTF23fhwcYIxIH8MWU
	 AxG4qt+JQX6HPxT7ln9wCElyjnCVG6dqMOo5RqkbgB6MMQ5cAWYaKsorXuvjdt3kKZ
	 SmkEFpzUxujSw==
Date: Thu, 22 Oct 2026 15:02:19 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kthread: fall back when no preferred housekeeping CPU is
 online
Message-ID: <atoJWzlJwtxY5I3h@localhost.localdomain>
References: <20261020125518.1114230-1-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020125518.1114230-1-thnkslprpt@gmail.com>

Le Tue, Oct 20, 2026 at 03:55:18PM +0300, Avi Weiss a écrit :
> kthread_fetch_affinity() falls back to the housekeeping mask
> only when the intersection with the preferred mask is empty.
> 
> If the intersection contains only offline CPUs,
> set_cpus_allowed_ptr() returns -EINVAL and the kthread keeps
> its previous affinity, which may still include an isolated CPU.
> 
> Check whether the intersection contains an online CPU instead.
> Fall back to the full housekeeping mask when none are online.
> 
> Fixes: e894f6339808 ("kthread: Honour kthreads preferred affinity after cpuset changes")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> 
> Tested on x86_64 Linux 7.3.0 with vng/qemu and a kthread with 
> preferred CPUs 1-2.
> 
> With CPU 2 offline and CPU 1 isolated, the unpatched kernel kept
> affinity 1-2 and set_cpus_allowed_ptr() returned -EINVAL. With the
> fix, affinity changed to 0,2. Bringing CPU 2 online restored 
> affinity to 2, and removing isolation restored 1-2.
> 
>  kernel/kthread.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index cc8cb5d3eab7..fdb8fb07f40b 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -343,7 +343,7 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
>  	}
>  
>  	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
> -	if (cpumask_empty(cpumask))
> +	if (!cpumask_intersects(cpumask, cpu_online_mask))
>  		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
>  }

Good catch thank you! Queueing it.



>  
> 
> base-commit: f47d223627f80cb7a1eb14c585fe6cb35de5e984
> -- 
> 2.43.0
> 

-- 
Frederic Weisbecker
SUSE Labs

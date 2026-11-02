Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582949;
	b=ewV/GZiPrwvAYYZPy2IWVQVQ5leZTOFjtEeI3j3HFeFtNh38IZaAgM+5ZmKqKlAwsg7k
	 SEDN/Xn2CPc2mCTmcx4tYc1doZCL9YNLVH5hoaYN/X6bOL2++TLYjlV7/3Urhs56oD0TB
	 T/uxYTk4Do9hrYs4OBB/xdCs8yQZLj3nJHgeyadh4wZA4LkuisyGu8IGckOLPHNAvH8gM
	 mmAxx6C5aksr3wxIM5UxkOJdI5Msl3JcitMYd0ID9lTMmtGHP85QzsHzjwcArCdP7eyQB
	 o/v7ZaPhtp9RipKrZcBl0KQJLcCSBHZefoOHDvec4twBgO08nT+uf2WQMQ2pfhhneEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RfRd34hbQ3fNwbe9mZRyC1FUgyB8k24TDialm2Z8OBI=;
	b=yifa9/joorLp/1ju4DNSKFGbp9kYEbS9WqK+aBOB5kv9/kTdz1PeaxARWWQBEqkHku7d
	 kdQQu8RVwG++RuuifmjtW5ozLC5SvmaxYDOE/WMDY5aUym4lT84JlhLk3bUjWJZg6Vxw2
	 y7GJUcNCqNQ6rdkSW33yo8bGJNhK1P6HemYQ1r3GpFskLjFbF572L8REaxWSjoAPZYeMn
	 HSePE+4uPgzz2zleRouWLwwWmS4bMetU/anZiB4GlZ6lQYkXnuqtQKpSCANXfupmJDLEW
	 GC1KxIBHLYL19IsK5Ct9A7U0j+ucAAub60n6HmEuKNmntfMmqaGVXTcBLvxH7LU1zWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pucFvS3W;
	arc=none smtp.remote-ip=91.218.175.66
Received: from mta0.migadu.com (out-66.mta0.migadu.com [91.218.175.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A8606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5A8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pucFvS3W
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sX0hSFxSFmqYm4dEqA48I5gNAB/p57bOI6zGz5tQowQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793582947; v=1; x=1794187747;
 b=pucFvS3WZDL1fFZohs1EwUhAuYXRaIZxVQAWzRxzXwqAW0ybTBiHF7fHTNQVyvgoPUl6rvje
 YPtmyZTK9Ss/TCcrXG+PC1qOhW+NHqofwkapFGiK9o8SC4rhbenS1yv/gRFBSiMAS0iXIzwGiu1
 jnFK8YanXRXp/5PIftOyJenc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f967bc48abe79d33;
	Mon, 02 Nov 2026 01:29:07 +0000
X-Mizu-Trace-ID: f967bc48abe79d33
X-Migadu-Flow: FLOW_OUT
Message-ID: <c4b63601-ab06-4ee0-8d15-4c4acfa35f81@linux.dev>
Date: Mon, 2 Nov 2026 09:28:53 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] cgroup/cpuset: Recompute effective cpumask in
 update_cpumasks_hier() after calling update_parent_effective_cpumask()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261030190701.78308-1-longman@redhat.com>
 <20261030190701.78308-3-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261030190701.78308-3-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/31 03:07, Waiman Long 写道:
> It is reported by sashiko that calling update_parent_effective_cpumask()
> may clobber tmp->new_cpus when update_sibling_cpumasks() needs to be
> called due to possible change in the parent's effective_cpus value.
> Therefore the new effective cpumask has to be recomputed after calling
> update_parent_effective_cpumask() to get a correct value back into
> tmp->new_cpus.
> 
> Fixes: f0af1bfc27b5 ("cgroup/cpuset: Relax constraints to partition & cpus changes")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 39c81a0a8ab9..ed014ecb770c 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2359,12 +2359,12 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  			update_parent_effective_cpumask(cp, partcmd_update, NULL, tmp);
>  			/*
>  			 * Capture current partition_root_state as it may have
> -			 * changed. Recompute effective cpumask if changed.
> +			 * changed. Always recompute effective cpumask as tmp->new_cpus
> +			 * may be clobbered when update_sibling_cpumasks() is called
> +			 * within update_parent_effective_cpumask().
>  			 */
>  			new_prs = cp->partition_root_state;
> -			if (new_prs != old_prs) {
> -				compute_effective_cpumask(tmp->new_cpus, cp, parent);
> -			}
> +			compute_effective_cpumask(tmp->new_cpus, cp, parent);
>  		}
>  
>  		spin_lock_irq(&callback_lock);

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng

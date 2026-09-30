Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25D44DE722
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774131; cv=none; b=Mm/dEC3Xgx+jsv+mXTl2U89svL2WtIzTk14d3fSNDItPC/VvUglXe9NuOgmg3mGNzTPI5XIL1cCv2NOzGE8Ww4iyo6oQBL/9fIbUBxegMaC4Lyy91XFAocnBlqAHNkY1jI9v9AwWEXr1kYSL6zfPrjZUQLkWUbCGc1uMCoBrkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774131; c=relaxed/simple;
	bh=wt9kiW1+fHkVPbpgsXGt1SKRZBWNVq7HvMHMfXj6Ue8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzlcW7cn11DVkYUwA1cTcmEiWRbxnzYMoQWTGNb12GgCuJdvjLcHfFY7yhCbTTLvJlj1qS9EjxjNCRJtxYZ0pgdoAJjgNBH0qx2MIVryzS/3y7/sYLSMv0Kw2XHBkdnf2bBFm5C8zHL/9ULsn+SB9WCQFAu1RPKSyj1VnnnY37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FtqOYieU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FtqOYieU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9580143D;
	Wed, 30 Sep 2026 06:15:19 -0700 (PDT)
Received: from [10.0.130.165] (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1FF33F86F;
	Wed, 30 Sep 2026 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790774123; bh=wt9kiW1+fHkVPbpgsXGt1SKRZBWNVq7HvMHMfXj6Ue8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FtqOYieUcxeNSyPZuFbrLBH9dH1Hl+DUMG6xomW9RUOPxbp/xzgc8Qz3xUG2OGbaX
	 RKYhkHKnbMPlkAB4pvEMsZpJNI/JQWdU2s621KOBWcx66WwO5c5OlK6w4AcW4QTKKz
	 h8yDl+3sstDvQXTQ58qugGTHkPw6ThhPghsH4Aew=
Message-ID: <9ea8703f-ef5a-425b-9d95-dbecacf5238b@arm.com>
Date: Wed, 30 Sep 2026 14:15:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/eevdf: Cap protection when current has the
 shortest slice
To: linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, kayracizmeci@gmail.com,
 Elif Topuz <elif.topuz@arm.com>
References: <cover.1790756779.git.christian.loehle@arm.com>
 <dd46b8eddbd760b4d5f2cb7d0eb5027bf70fad32.1790756779.git.christian.loehle@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <dd46b8eddbd760b4d5f2cb7d0eb5027bf70fad32.1790756779.git.christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/30/26 09:47, Christian Loehle wrote:
> Changing a task's slice does not discard its remaining request. With
> PLACE_REL_DEADLINE, the preserved deadline can therefore extend beyond
> the new slice after sched_setattr() reduces it.
> 
> set_protect_slice() starts from that deadline and only applies the slice
> cap when another entity has a shorter slice. If current itself has the
> shortest slice, a later pick can protect it for the remainder of the old
> request. update_curr() then need not request another selection when a
> competitor becomes eligible.
> 
> For a preserved deadline d beyond the new virtual slice vslice:
> 
>            v                 v + vslice                  d
>            |---------------------|----------------------|
>     old:   |<---------------- protection -------------->|
>     new:   |<---- protection --->|
> 
> Commit aae2a33ea662 ("sched/eevdf: Ensure that vprot will never go above a
> min slice") caps protection even when the ineligibility boundary is later,
> but leaves this slice == se->slice case uncovered.
> 
> Apply the minimum-slice cap unconditionally, including when it is
> current's own slice. Keep the earlier ineligibility boundary for the
> PREEMPT_SHORT case when a shorter slice is competing. This preserves the
> outstanding request while limiting protection at each fresh pick.
> 
> Fixes: 82e9d0456e06 ("sched/fair: Avoid re-setting virtual deadline on 'migrations'")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/fair.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 85bf02570473..868c3911337a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1128,13 +1128,12 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
>  		slice = cfs_rq_min_slice(cfs_rq);
>  
>  	slice = min(slice, se->slice);
> +	/* A preserved deadline can extend beyond the current slice. */
> +	vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
>  
>  	/* If there are shorter slices than se's one */
> -	if (slice != se->slice) {
> -		vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
> -		if (sched_feat(PREEMPT_SHORT))
> -			vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
> -	}
> +	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
> +		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
>  
>  	se->vprot = vprot;
>  }

Elif (+CC) made me aware that apart from the slice protection boundary and vruntime, which is:
set_protect_slice(): deadline, se->vruntime
update_protect_slice(): vprot, min(se->vruntime, avg_vruntime())

this now mirrors update_protect_slice() so should probably be merged into one, I'll resend.


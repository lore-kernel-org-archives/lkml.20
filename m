Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793900549;
	b=KpeU5HQiug3N9SHPukeS572d3HeIKAfK0s1idthILZjSpQ8OuxaULnO7I0PWAchkV6r4
	 4u3vjkzpyinHdjZY/ZnlPceorxLgMJBUP0ToxLXzX3rZBkki3VRjUnMXi6pxw7/FvUDm2
	 WlyMS1krsV1ey38+uspHfJDjF+mw4EkNPUzNgL47iXwGbDX3/U5VENg175peHBfIOXEPb
	 mGw/0TU7Vd6KC3qXBG8Ep/XfHkLFKyHbo/tZMy5QRvfIXYe12EnzxMk8KVv86l5kxQ6ID
	 EMDqGt5jTywrSQebtwPpUjqQASKSMMBbc7Muu4HBUAKRjHh9sldi2C8EV2EkAZb/TSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793900549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=znZi5XPOpibvSUdFjkYHoaeLXekOiSfwft86exrlB+c=;
	b=iZldDHKk3LYNuPn/mmINAPqoMGP7X6VjUm+1aAMUABv8nA2Ha3Hx5LipPxgzTVlru3dS
	 GnPszoxiTqfAkLMenJtmoT+OaxiRAGIaDI2rq7f921jWZiAgR1/9RqxRiLh8mcQ4jheag
	 FEH7XcYb6ELUPwKPApBhkmsHJKdwxEBXr/Ps/LK17IAcffFBy1AXXJ+V/7fTegqzigEne
	 DhI64W1igYnmlmnH+4VLaPrXfKZav4fCFBom9xTSgAHR19hsUyc6jCgw0B5n1wCmtZjMH
	 8nmdod6/AZebxzMMuTarBHDuayPGkOp2YIp59EJbNcUb9OmCVACdsl32vAMmGyk8VbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4ijY5pQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70388606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70388606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m4ijY5pQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2628605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793900548; x=1794505348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znZi5XPOpibvSUdFjkYHoaeLXekOiSfwft86exrlB+c=;
        b=m4ijY5pQlAnYq1VZcUQOAu8daTWghxIn/qAoxCk12gPeX2l3S39P4GygjGpwP+AsNp
         7yAHZ224VFyJ5D0PJbVDAa6DjWZXWytPZKjCO7LmmbsQEMqzKlVUvk6BruzbbJpybffi
         RNqqv8piT6lvWc2s//gtFzTZsUqAoeuzIsSUOydzP7aJVe2OVdNFmLX2yYFqkbMCu6jm
         m22P4cWnbKb7OovSPlp3XXRsqZjgeARfvgoWx3l5wLBAnhgxu5rTQmROadSGLUU5ox/H
         CN9QbHVs8SNVFN7jNVtsfniasDZAejNiaMhoLFx0MuuC6VZD+FcAE1UJuvA18zRLn5Rq
         3QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793900548; x=1794505348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znZi5XPOpibvSUdFjkYHoaeLXekOiSfwft86exrlB+c=;
        b=ZlRYu7kACox3JjeeEQnRpjcfc6RRzys40ompd1R0mncECdJiwFSARZGKsusNa2wOus
         C2MwCqQ8H00KqqJUlKzGLwyr6k5D8S6xevNkH5WsEUGfQCgVIp9LaI2D6kyoWvpGcrm9
         nJc0SV092dkJ/LNQAhHvawlZL+/GNR5jgn0gTL6fN0GkJYJ1VQ+AQvSX4edh3KhpuQLa
         wWEy6prsKDg3/7YsfhGREw0vLOob2FYgrhW6r5+Ppqy0gPw62+NVnyMbXPM7gF6xtFT/
         Ru0R6AAxSiZrqO85Y+udlBIb7Un8FbmI37KzsP/fN9L2V2FxpDkcFnmnbxacyt7rlKqv
         SWNA==
X-Forwarded-Encrypted: i=1; AKwUvByNafQvbD0IKQAzbntQqExYtpQph6ej9L2arT7wnTL4345yn9Tj6iEAZZTlQkjO/M9XXR9ZzOSaEM0mhRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kgo6qLGAAgvX2FWe73gWiOWONIHsk4Gtt37PRh3nOVxYFxi+3
	JaxitVXAQ2li7cGq4sWskJTbsG/h5rav6UxIwbNQKD6Pw9cHT1ylOlZh
X-Gm-Gg: AYBFou0XdqKBqgkSCeJjQxli9fn2aKtNu94nJ+FTDZpj+GPA7cWcowY/pMVF/cfi5uO
	K3e1yf2ma8ZreGYcjPnnUyhF4adoRGJCZsUUoT5nuueWFulFHAoUj1XTIoxrdw2O/GoTWOAaHJJ
	55uj+CtnhPV1nOjpdpuWLZgjPjVrmYyx4XP1OrcUb16Z3zZxZxi13BAdfqrAHri9dX0HP2KOvJD
	yLJw8IIvW2Zjg6BzwpcGEFM8t5xU4QqpxbyiHERy5tz/0qMlzogExAv20GpYLt3Uu4Rvjy+GLz5
	tZGsV3xFvbxECFaRIPHe4T2MwUYYCA1GmQErEA+cuNLzCdN6znBBfLj1y1dAtEdyahybxDMrdMt
	xhN/6lRrXxxkYcFDUq3S/01O3jGMkaV7cOMwu425WPj/wdHSWLN7EQ/6p/xZkfvVx4sbAZC3svY
	K3EMNF5jWj1xyT/yq6etYTz/9yw6rAqqEyewV4XxnMsVTbt5BD15rNKv5+6pur5hy+AkPqP/67I
	Vj4LMx8aEFhpJHETnagjyf8N2ptYPwATMfJ+H7v4U+NdW7mC9MESG1vYaqvnboRfYe39znfjPNV
	eEZwBd5wO/bNkAKsBm/TYtSTRt9vi5KSeEmdceCW+uLNslZtAKiDOGs=
X-Received: by 2002:a05:600c:a5a5:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4ac1765d60fmr279764925e9.1.1793900547627;
        Thu, 05 Nov 2026 09:42:27 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm45937875e9.2.2026.11.05.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:42:27 -0800 (PST)
Date: Thu, 5 Nov 2026 20:42:24 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 1/3] sched/fair: Use guard in sched_group_set_idle()
Message-ID: <auy-i8DDjDRWEnNu@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.453569788@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105170157.453569788@infradead.org>


Hi Peter,

On Thu, Nov 05, 2026 at 05:55:26PM +0100, Peter Zijlstra wrote:

> Cleanup the code by using guards; prepares for further changes in this function.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/fair.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15790,12 +15790,9 @@ int sched_group_set_idle(struct task_gro
>  	if (idle < 0 || idle > 1)
>  		return -EINVAL;
>  
> -	mutex_lock(&shares_mutex);
> -
> -	if (tg->idle == idle) {
> -		mutex_unlock(&shares_mutex);
> +	guard(mutex)(&shares_mutex);
> +	if (tg->idle == idle)
>  		return 0;
> -	}
>  
>  	tg->idle = idle;
>  
> @@ -15805,13 +15802,12 @@ int sched_group_set_idle(struct task_gro
>  		struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
>  		bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
>  		long idle_task_delta;
> -		struct rq_flags rf;
>  
> -		rq_lock_irqsave(rq, &rf);
> +		guard(rq_lock_irqsave)(rq);
>  
>  		grp_cfs_rq->idle = idle;
>  		if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
> -			goto next_cpu;
> +			continue;
>  
>  		idle_task_delta = grp_cfs_rq->h_nr_queued -
>  				  grp_cfs_rq->h_nr_idle;
> @@ -15830,9 +15826,6 @@ int sched_group_set_idle(struct task_gro
>  			if (cfs_rq_is_idle(cfs_rq))
>  				break;
>  		}
> -
> -next_cpu:
> -		rq_unlock_irqrestore(rq, &rf);
>  	}
>  
>  	/* Idle groups have minimum weight. */
> @@ -15841,7 +15834,6 @@ int sched_group_set_idle(struct task_gro
>  	else
>  		__sched_group_set_shares(tg, NICE_0_LOAD);
>  
> -	mutex_unlock(&shares_mutex);
>  	return 0;
>  }
>  
> 
> 

LGTM.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Cheers,

Kayra

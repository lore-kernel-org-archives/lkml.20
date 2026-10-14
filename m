Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346B50C2B7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982976; cv=none; b=A4gpceVfr0dfbnR5rCNseYpXi0zALjJZ8HcdO1FmRGrxf+EgGq06Wdll0IG/SVPRnxo4QhCt37Dj5COwrn4sLh8notNgkwhi5tftB8/ioJxbLyqhS7U4nMcIqp7dOzOMkWBd/44Mc6j8qTbAv1jz2Uiz1dikglmEeiyDYDAHTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982976; c=relaxed/simple;
	bh=+ykcXLkofymWRd52it0fOc+h3cXzH/rkltUSBHqL56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNdSmW9EotsBzsRdlRqx320bSRIqKUE4bk+QQ9zEkrwKsnjMyPcn7suQa5exlpgsPr59xAQYcWJQ7yU2tyzTl+dYhvJyqIhPHWOc68t5HF/VYZPGCgVJCMmGDu9YA7fxUgW+mOcrPyj7LrCCoW1yUjYJkOFdCCVu5tTWwLC0cH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CDuyBdWI; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CDuyBdWI"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5350cc60b51so57138611cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791982971; x=1792587771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+g+JcQ9fBuosfYzKHFrjP1VpW5rAUzuZgfEvkBjq+A=;
        b=CDuyBdWIix5TuqbxWqvVs4W/nAVlCh3sVbL31A3axH9tlngOrG93wvMa9Rz71vP+Rs
         bKUx5AAHhkMBS/9o2QIWA0hIcdHK6TJZyHol+rwTe5skZZUg3OZ23SgOnvagd3DFLHQ7
         TOBGZGoi+PuEW/QBRO9e+uI7/V1R0Vh6/OyJaKYNqSKBi/rq5Nn4HugV/E3pMBwjkWR6
         aunY/ff3ZUOXyWI7kPDVaWY+dayTocJqoi+AVQ8gHWa/I3+UAM5uWqxrcuGeJUaZWITC
         P7Qp2uTBJqLnQUmdZjHpLhtSsxq9C3+IxhYb1h04MYCWDMYvSQaUZD78/NxMsYdtKiSx
         eGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982971; x=1792587771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+g+JcQ9fBuosfYzKHFrjP1VpW5rAUzuZgfEvkBjq+A=;
        b=r5H1uGA1wXmRl8KL6c8ARyH00YDeFPw591pKPp29olV03Z5IESxYl0r2C4zBjt1R8h
         0Qzl0QzyymKtQG4N1VcsEUK2vSd1lMzTicZPgD8iEi4p6wEFHSHQ/rZANjpVtnd/vsrU
         squg9qqONTyn8DpNKwpOgl0+boSRSqthjesiIo7z6mLhjq2C2qFJjxLD4QiYqKSTOH9L
         vXJNtk6Rico4tKRosg2kpiUYkBseWZBZNqCV+O4LtxcBS4sBM8F9ylcfNt/NBQRS7RI1
         ix7JmCDl/LDS0LEEhCWymzaQoJ52Heeo0Lt6Fny5E1+BMlXJopTM3HFcAgfAhE53UopD
         uzUw==
X-Forwarded-Encrypted: i=1; AKwUvBwooow8RoFPtOUWxiX3b0Q9jb1M39hqXCUMgnyhC4OhOx2eaSpYYc46Nuyaj/jUvdEOkqzOZv4mPk0Wz94=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJY5UEDTbnKRIgWeVFgkCTm8hwYfSCjPeSZcsB6p0H3sRjSvrK
	d1LQXzMevITEu90yEq1XUlQ9cYdqzl2dB92SrYb5juQwEADg6ILrjcFtq2fTVfXGsJw=
X-Gm-Gg: AYBFou2GxQ1N47EF/PTDhe6bU1+4JRmTAA/VcUPTiUpZSH/XVKEqpFjAP2I9shCW61M
	/zcw2bDQqacAPJUEKqpv7IoL+KO6BiJnWnNadbsFiPxuusx9emTGSUObluyIg9t1lbxlTCiDNOV
	1XUkucCz7MJZrEQgkyJI5V7zV1lJiamqqSy9/cN0jBzfScuLuRCbIw+mR7YB0Fk9gtlZTTKiGj6
	foK35oqrTdyXHIlHvPoA8Y8J2dXZTfx5yYgoNe7sFMfeYuGwSWebOO/tv0xuqCaA9joASiGtLFA
	4EjyERGclIfTSUVHHktrFOOFoFE7XQ0+75kAujmTeiOs++2qV2nmZZwW1A2Fp3WBffBrovDegy3
	NiHYC9d4onPikU582lXjP4cjUPVQNZNGwLxQMbRzHJ6Xf6ueTSUx80S/s/J2ClQVxu+Lvwm/f0w
	bUeu8IX7ypBkH6QhlmGyIeLBeF8D267saOQ9EGB44r3dGgYHlDA/EH46bcDzqUUW5xyuUcceyXp
	wDiZAgEUflqhKHVjlMKz+LFe0+eixioh7SH6rEr3ztBRWEDa0hRzbs=
X-Received: by 2002:a05:622a:e14e:20b0:535:b506:11c8 with SMTP id d75a77b69052e-535b5062ea3mr142869471cf.46.1791982969440;
        Wed, 14 Oct 2026 06:02:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76b030sm124693521cf.17.2026.10.14.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:02:45 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/6] sched/numa: clear fault locality state on execve
Message-ID: <as98SA5yfBaeI4oj@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-2-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-2-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:42PM +0800, Li Zhe wrote:
> task_numa_free(p, false) is used by execve() to reset NUMA balancing
> state without freeing p->numa_faults, because concurrent readers may
> still observe the task.
> 

Is a process that exec()'s going to run long enough to actually collect
any real numa fault data?

> the retained p->numa_faults array, but leaves the current-window buffer
> half and p->numa_faults_locality unchanged. Those are also NUMA fault
> feedback consumed by task_numa_placement() and update_task_scan_period(),
> so a newly executed image can inherit stale fault feedback from the old
> image.

I'm not sure this actually corrects much unless you have a long running
program that eventually exec()'s - and even then it seems like this all
self-corrects within a couple seconds.

Do you have some clear reproduction that makes an obvious wrong effect,
or was this just some static analysis?

It's "not wrong", but I'm trying to understand what impact this actually
has.

> The non-final path clears p->total_numa_faults and the averaged half of
> 
> Clear the whole retained p->numa_faults array and p->numa_faults_locality
> together in the non-final reset path.
> 
> Fixes: 04bb2f947505 ("sched/numa: Adjust scan rate in task_numa_placement")
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 57360f5cdde4..1053437933ee 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4177,8 +4177,9 @@ void task_numa_free(struct task_struct *p, bool final)
>  		kfree(numa_faults);
>  	} else {
>  		p->total_numa_faults = 0;
> -		for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++)
> -			numa_faults[i] = 0;
> +		memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
> +		memset(numa_faults, 0, sizeof(*numa_faults) *
> +		       NR_NUMA_HINT_FAULT_BUCKETS * nr_node_ids);
>  	}
>  }
>  
> -- 
> 2.20.1

Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82ED3CF043
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901125; cv=none; b=YC5jH5TBMgdEQr6t1S90cg6j33RXt+qCHPZVbpES1NzFX8rbTGni+/oHQcdi92WJlall32qReVGWEvdctHjCpyHBhmmJicYgJRlGGo5Utx6KaIOvfhCPvbwraea5mYpiK3X6C6Cr+bZf7VTCducguThkU+c/xUUD6iLfxK4s5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901125; c=relaxed/simple;
	bh=DjN1Z1sIdx3HQP5D5CjZo1VeUEgmovGu3tSOZXPPIL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olDduKFtHMCC8nzqKsePBca462yP4LJzpHE8m2+hplne0CZBgmImQAZnauQuMWCrEtsjzJGoYeAM/INl3dN91CfPf38SpnZQfh6NaCgYeaU1OuON1Aj4eZpiOZg3303oGu7N5hc5nvXLQ7Y6dKDNSCbtWZSyN465bcwRvGaQWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYszhVmQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYszhVmQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1819024e9so3201825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791901122; x=1792505922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FF7kGrjYVroQvx3Js402xF8Hx+AYtPxucnLzO3Yxey8=;
        b=HYszhVmQiuUnHNRdYtip6rk2zJFIoYvjziQ3FJCcT8FOhzRzwI+XMn8VPQD9Ab+pZO
         WPdveNxFNGXiYL7mDhLKZrKpuTK+tJ55RIqSTfbDP/K0j9Ukje9YfZRcyDFpFR5XHblC
         QSdIpXZIQTaqs6BJ9gFoA2qYk24WyqHO9cMC2jDcA2YyxSYKyBcoeLkHoRNJuRUqGyvF
         3sdmXkkdSn6+HIa47k6pbyGwTN8V+QVcl0qvnvr78cfnyRpFxJTkwc5m3xtj4sLbpM1A
         9Ouq1EyD6hOHkJcCjuHTNPMFVNwAnrxTsukiqLL/GH+WCJTa78ecHWFSEdAqsTTAXzVg
         gj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901122; x=1792505922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FF7kGrjYVroQvx3Js402xF8Hx+AYtPxucnLzO3Yxey8=;
        b=BaKHBvEn19wmJxZiCHrZe3nfGPSMgXsgpM+xhk4GsbdvgObpUojsHVsHDPCboocUfv
         B4rBlP5Y8YB9BikamjFpQk0b6NhbzevxSd+aI26Vo2DEVdlpbQ+zO7mrhdURK2AHJstd
         9fOuwjm2j8A5oV4oY2kDeijKg+uChfFUDjrqgC3m5v4GOwZLOm6j3d3fRThYLIMj+BJB
         lGkOCiEfx7ba1a3SeGlSfk6PFdtLdezTvMfoX/mZmDTRunrqBaQy89gxiVK5hl3+fFdX
         IAMkQs2reyPT1UrGuFOd1HazCwKLjVOUZGpoGBC6UJ6KqtboDhfOz4nGOiwQxV4A1O12
         OcMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVrbh6yY0nhuAeMU9QPVMSrdqstOb0+YKSn8N/xdG56Qu1zTLJFmOAnpA3AkhaOOFbziFVNiCNRMa2SjA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQTG9B1BSrkribw5lajbe4Yf/x3B2Dxg9FnfZl0/Rw6dkhK9H9
	TIudV47w/P7ilGG448DqEqvZpit/PzRw+XI1jwYDiFKStSUaMwZ1o1r9
X-Gm-Gg: AYBFou1RdVHqam2AMQwdzoc3EvZtMfOE9c5fSBnlDcawL1iPSIfKs74FR7+QvKxGlFV
	deNxX5jSJe+SwkhGVU4qhc932jeg2ByzXCgDa35UBAu3iHMiZ/3gZpEizTO1s2uEiFTsJIWmlQJ
	L+KDZcUCzvx+K8gu+Tug4jj+e3plFE3NEyC6700dA6VJIPjG7eLptXEx2PAQWHoc1ovNEgBcYbq
	7XzEFHnC84JsLNJDLf1cRAweomkFUKUkm9o/uCo0n4ZyDo9m61JmqxYjji/jMMRMPY98OxnIHev
	gfMgTyAVeIyorEWcwCSLIpKnY4JSZWgupZt0giVzzWrVtqO+v1Sf1nsQdPuQb+FcOGTmUxyRePM
	hKDkjS2gIlxYdj60C9HRNggnzRyfT0wJzIk0o1FfcfXcsHcYv6ZY9aoFiqJxKgKTSJBWfIft0Ol
	4Rmf0hSAkG+hUOnZf1/5yGBd449QVt0f/gJoPCavamvzxjEdH2biGH3yLHs5t24ekMrvVtRtT8b
	z4BMsTn4C9h4ckL8SCdPw==
X-Received: by 2002:a05:600c:a086:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a18e3ea887mr219864785e9.0.1791901121695;
        Tue, 13 Oct 2026 07:18:41 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm458795225e9.4.2026.10.13.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:18:41 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: elif.topuz@arm.com
Cc: christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: Re: [PATCH] sched/eevdf: Remove redundant RUN_TO_PARITY check
Date: Tue, 13 Oct 2026 17:18:36 +0300
Message-ID: <20261013141837.57168-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012105001.131311-1-elif.topuz@arm.com>
References: <20261012105001.131311-1-elif.topuz@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> update_protect_slice() is only called from wakeup_preempt_fair() when
> RUN_TO_PARITY is enabled. Remove RUN_TO_PARITY check inside
> update_protect_slice() and use cfs_rq_min_slice() directly.

> Signed-off-by: Elif Topuz <elif.topuz@arm.com>
> ---
>  kernel/sched/fair.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b42a0ca2a69e..f493fa29aed6 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1133,13 +1133,8 @@ static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity
>  static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  {
>  	u64 vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
> -	u64 slice = normalized_sysctl_sched_base_slice;
> -	u64 vprot;
> -
> -	if (sched_feat(RUN_TO_PARITY))
> -		slice = cfs_rq_min_slice(cfs_rq);
> -
> -	vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
> +	u64 slice = cfs_rq_min_slice(cfs_rq);
> +	u64 vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
>  
>  	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
>  		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));

LGTM.

> base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1

Finally someone who enters their base commit...

I boot tested the changes. Did some work to test it. It's pointless, but
still I wanted to do some test. Because IDK.

Yeah well,

Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>

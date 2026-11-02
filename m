Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634444;
	b=wJwIG7f79yOmZGqG70QYftX00sSficv3FNfpG8ftCJ2Flf+uzLg4Hg3JdYhDEI3KORIa
	 diCY/rj9k6m+RrUhvWmV7xnusgE8F7fTb6KQwmSHyWmYFr21XZHUWKkaX4Xvg8oCw4Wu/
	 TAK+BhgZlO0s929l+xwleTXOvf7JemCwTvvkCPJx/YJ1hxWiaKBLPRznPCfEVhDS1l7GO
	 IGbsdOvgxvWtBeuiw7+YVvzsMKdLVyZnf1ukCmI+CQJ5jkFCotUA2LercJA9iHenvRLNJ
	 WUilzYoLdCARIG+GAzvPt+/x6Rcv4Hd9j5P5CjRGMB/iKg7UozRD1UsPGd7jGvfC+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+aPQ/bEuRJE66ZkZ1N1K788ZV0S5XvqiSxNz34MixTk=;
	b=wA14V/1bXe9mkjQ3Qo5HGuQoJP4wYE/6a48xnD4XmevEb+b8uDUWs3q+onQ3dXq78gvs
	 r/N5WCpbXMUYcm8M1LOOjZutf/oh75m3idDg4bUHGKJxsi2dCgeV1FKQYwvihXFh4CyOP
	 nwdVm8D5aWp2cRdLIn4VE/67wSyG0TwVKpuahRpeDA+ItjIg3mvuNCkoq9WT5eCKh7ZDc
	 ex4n3vmXRjKN/qXMXwQL1dmLYSw0ZBR8lv9NaaN2ziwimp/Xb9jAWFfJhHo5mzLzRvij6
	 cYkngtqifWFwsQ2t00vZEE9mAetIS/eQrrx3AmC6kWKw1vySmTV5F3hLqQtadAShq3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyJSxg6+;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424D606D82F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3424D606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyJSxg6+
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4af520023fdso9192085e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634442; x=1794239242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+aPQ/bEuRJE66ZkZ1N1K788ZV0S5XvqiSxNz34MixTk=;
        b=KyJSxg6+cbZeUYpZ1/gu0QLgAa2b3SpCqji3t1b/mopJFdnDcTnb1cqFHQF4PGpHhg
         BVh/zR6a4PIafIc6QIF5RlOw0ds/EwPMEzTJ9goJoIi7JKlC1AcS645tgjVgaysNY2Tp
         lJS3ab1iDpYmHbWPFytwWSAkcNHI320RJ2ixf7N5IC6uu06gNH/DY01Hj263wJWO3SkE
         Ic3F5gQJMppZpjroWxN2nNtaZgnOtqTe0lgSAGyc3zec+OqH+1l95o4n21iUCrD34zBL
         uBgM5+UuvJdECA/7Esbv4r1nzG1tmmZPdeM5ERfExpFjdzXvrO9Ltm/hU2TFzH76tDl4
         RnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634442; x=1794239242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aPQ/bEuRJE66ZkZ1N1K788ZV0S5XvqiSxNz34MixTk=;
        b=oXonvGJcFnxOX1IMce2qM12ZMOFX/VqO5WmllesvcKTHQWEwIQ/KwejdYoMlw9wgj2
         5K5EkhEC+qA/K65HKeVB+ZlsBOKHqG9nfYDtsko0oXsvOQ72epShx4AMikRxjAq8PC43
         auB4KHOB812M0RDPMY5PJKR7yk0bDugJoOm4x7cyD+e5Qp1WnRRNkU9fVe7uUrWQ6EJz
         RPb2VmiZMTfaVcmWeoG1frojUZ1iDT5/X37eYPabLmgbf98b71bfaiDHEUh+DPg8a/zk
         eqymIDG9QRur266BJ/QQplWOmKcFlIhAz8S55/MsxguOjh1umjdBx5hyRR5V68jXUzf5
         1VNg==
X-Forwarded-Encrypted: i=1; AKwUvBw2udgrDWGeuCyAxG4bcxKoFzdSKKZx203Saox8nLSNiplZ8hE4kJcSCQQnldaXPo9UESPuVY5D18gJgyw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8YEybukQlj81bdRTztNAHE0poXCfyZCWtKUjl+/8x2PcDeFaR
	4lpOp9lClMSm6ZvbumZoK8PJiEt41q2WNzFyAg+kVcbP0pvRqbZPKHaZ
X-Gm-Gg: AYBFou3AcYERI0TmFch3apHUzMe2dEgr+XiohFjek6xcVvXUnVjirjxwIaqPWQNaZvw
	E0wjFDCMKnhUX4hIKNcLiKVV675KLYaHDfPrP/rLkVB4zjc7x3EUhTvs7v9VMx4QJxfDJ0T4H3Q
	FcozYQyiRRLv9yU5oFyZJj7u3qxrpzoxpv+CMUAVX0U6kAH5MnAS1aPUXrYuJo9RV5Yc9m7+VKV
	2puOkq+gqiXWjKdQBTQQw/GWwmosXcvq4f+4pgDzZBXR1SgxNKb0KsMecoKlodlaKkfNLIFE9e3
	s3ZfQAfC6L2Zr7/4ZrjWknmIuj0fAX169WzZElesEizU+UrwKehqwywColnkiC2ddM5uBXNm1PQ
	lHlWg4NqMZE0nAxHrqqmwJsnLeCIlOxWz/eGY1AyYjlTk/yYOjZHWdulDRmT3rOwGgUvk5DJR1d
	ickj+daZZwfCShGrQ6NZDzqnhWMVw7zAiqjgJtZUl2JkEhcgHOuWoN8frcnD0IPbYTrKHTAOEXQ
	PEpmC+3nyM9OLaj/ALqbkZ3Uv9g7ILDpDNYtsm3Nq9paqvriFqi4fSgFURz219Q+BlxYtI/rgZe
	yX08Y3b0HONaO19dYBvJKNHEuHz7cQXiDiGiTR2s8+TAMZsSmJHgc+HbYlOtOD1yzB7NaigMbvP
	g
X-Received: by 2002:a05:600c:c08c:b0:4a2:1a:a115 with SMTP id 5b1f17b1804b1-4ac1209f120mr204038965e9.0.1793634442375;
        Mon, 02 Nov 2026 07:47:22 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm359259525e9.12.2026.11.02.07.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:47:21 -0800 (PST)
Date: Mon, 2 Nov 2026 18:47:17 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>, Hui Su <sh_def@163.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Fix cpuset_mutex double unlock in
 __sched_setscheduler()
Message-ID: <auimbkttN-iPGtwZ@scheduler.schedules>
References: <20261102134606.242743-1-parri.andrea@gmail.com>
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
In-Reply-To: <20261102134606.242743-1-parri.andrea@gmail.com>

On Mon, Nov 02, 2026 at 02:46:05PM +0100, Andrea Parri wrote:
:
> A sched_setattr() with SCHED_FLAG_KEEP_POLICY on a SCHED_DEADLINE task
> unlocks cpuset_mutex twice if the task's policy changes concurrently:

Uh-oh.

>  kernel/sched/syscalls.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 45a127deeadd9..2af550f92ac65 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -640,8 +640,10 @@ int __sched_setscheduler(struct task_struct *p,
>  	if (unlikely(oldpolicy != -1 && oldpolicy != p->policy)) {
>  		policy = oldpolicy = -1;
>  		task_rq_unlock(rq, p, &rf);
> -		if (cpuset_locked)
> +		if (cpuset_locked) {
>  			cpuset_unlock();
> +			cpuset_locked = false;
> +		}
>  		goto recheck;
>  	}
>  
> -- 
> 2.53.0
> 

So the issue is that when tasks policy changes before we come to this
check, we don't clear cpuset_locked while calling cpuset_unlock().

In the other calls of cpuset_unlock() this is not a problem since we
just return and don't use the local cpuset_locked. But on this one we
do. And if we don't retake the lock it just stays true. Even if we
didn't claimed the lock. And that causes bad, bad, bad, bad problems.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Thanks,

Kayra


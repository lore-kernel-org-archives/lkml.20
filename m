Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD82C15A0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902956; cv=none; b=JKqfxfd39Jmvz5Z7SM5VaWLSzk0ka2Sjs+BBgGvkoHIX5mA17g5FekDo9gvNzKQcWmnLkx5/H2dNjYG9e6+VNJGCCyf+AUKgKudyZK8VdIvkJOaBr6dWYnB1CGhO4Fu1G21WfPNkTePQpPMVPvEf0xuj+2xdWlYu14TxAmmvAqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902956; c=relaxed/simple;
	bh=Ou7UGV6dNy/T9FsaukQKSw/uw1JsRf0iCbQkN4eT0vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2e/et6n8CpvI/0ZDOxvjsDeBlHAnu4bTN7Vic19C2Ot219g2S5RbVDFzaHxpZZ407SolHNWmms0jJRUPNHuvA94KH0Z7BkMC9dsQ7vp19ZfK/sFhHbUtEIIPj2RLLz8pla2AitMHIn+Rtxen0hlA9KAKQpWa+2W1Nlusj3nfqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIksK5Cu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIksK5Cu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e82ea30faso946655e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789902950; x=1790507750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQVGhW4wO8ypbQC69nbJ2BVdixylnwtyZPLV5BDILlM=;
        b=jIksK5CuZSOBR9Gvk+6rqlP3CinIvMXt5IpdD0QGYfyT/V/40f+b38MNy8zQ5XP1Nd
         VKNRjyNPsk1hlWa6NmZPPvH5xQB0VypbNRhbD18OaxAFvsEnsf2xZ7IgnS/MjUxhPCWM
         JXyIYshVydBDdF06spz7TJx80DXaRJ5BJTPWMhhPfFMeYV78aECs1tpdMOF053CGgix9
         mcUnjBNKYlMJXMa1SzhWniyIngXZtiw5fQ3hyb7NE/FNOjrvJoVqfEq9L3h0DNk9BpXf
         tcNeXdykAgfeq3J9hjppGXRxdlrerVD3eWdMb7MvGoo1cxMI7UsGweDgXW6AeSJIAoBo
         Z/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789902950; x=1790507750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQVGhW4wO8ypbQC69nbJ2BVdixylnwtyZPLV5BDILlM=;
        b=kY9SqvGs51uiuCmNSmh79I8hKtDu5Katl4qEn5uumYim4P/lUM2XWjSnUw041fCjsv
         Cg7FSBDPxUSK2mmmiVY3klpcCA1T9S60dQF/NHAGst2B598VHJEhzX/79cS8Ex08y/6k
         5yfsP7fKDKZaqtjBDRoOoQC7Uzzl7+ckretPaQfD8HUWvzXdw46m86XphvnlB/2SsPpL
         ZzodJpoUP74nVxg1KS79YRIvvZJs5vPWrpnEpKbpnMvWfceOSkC5yZEClAcENz+jFpHI
         FJpJUXeEScpD5XkS3aGyEMHlf5DX15wXMbiba57gcn+sz6HhZJlU2fZPQZ3nyhQwHTEr
         xS2g==
X-Forwarded-Encrypted: i=1; AKwUvBxCiV8YhV2L+GetnMU1ZkJz+Pnl9BVLDQeI67q8knQGuZ+00fpuOuDzVfol1I5Cjn526olXc5diiz5JR1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k8+w1S1GrHnT/xeZTXnc45kCyFAWCy4RinLTBvrcF7gdHvWPaF
	m9w8uzA81hvRNEg2eFW7b7Z7hEHuXvDd8SeZhy8xp+XENCWLLqCMF/pt
X-Gm-Gg: AYBFou1lFr3wgnbL+WlQVPxPJ9A5z6kcmaadEa3jvy/m/a4WG/cTseuKuFGeXakDJvr
	6LqqJOgH+Pr/g5cURsi8Lf7G/lWkhycNViMyhmF1j9KXY9GKC31WUxEyl61bG8A+Qk/nHbgfJqD
	FT34kQDu3L+yKrihtBhXnxXP664k0CvJ3u0QXzgY3T3HJHl2LJv9Pth79L/+HgEJvz2BU6bNqQg
	Eajz1a8Ubc/hJbFvqUaUOTbnFTtKEvDBkXlKrz3ryALZF+oqKOy/hSVqorHz3FuMhNkWDtgSyik
	wLHwwhNdZEtlWQHWT/gMxhYUgg29zSjsrMzYV6lq2as4f/gbubvqXsVJAX4fcNeWqPfFHlAk5/z
	/cwxl39hqPjr3Z0E+zsP7xXUls9OtrhKn40t9VvHF/ZbVPEH0Tbjez2P/7e/629jJUtj9tvHbT0
	4eiyj7pdregFkENdQaaA4Wu6ZMd9CeXGdwhMoooCnKEGnUEVGjAqbmHZLZ4AenbxXgstZ8Q629i
	mO2GLElLIwSk32XexQxzw==
X-Received: by 2002:a05:6000:400e:b0:487:fa3:7630 with SMTP id ffacd0b85a97d-4871faae24cmr9628215f8f.6.1789902949785;
        Sun, 20 Sep 2026 04:15:49 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4885a0549c3sm1606146f8f.25.2026.09.20.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:15:49 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	mintaohuang@tencent.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v2] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sun, 20 Sep 2026 14:15:35 +0300
Message-ID: <20260920111535.117996-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920043116.1298017-1-albin_yang@163.com>
References: <20260920043116.1298017-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wei,

> Load balance is affected too: the sched_delayed check in can_migrate_task()
> bails out only when env->migration_type != migrate_load, so it does not
> block migration when the type is migrate_load - which active load balance
> always uses (its lb_env leaves migration_type at 0 == migrate_load), and
> which regular load balance can also use via calculate_imbalance(). Either
> way the re-attach goes through attach_task() -> activate_task(rq, p,
> ENQUEUE_NOCLOCK), without ENQUEUE_RESTORE.

> @@ -290,7 +290,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued)
> +	if (!t->sched_info.last_queued && !t->se.sched_delayed)
>  		t->sched_info.last_queued = rq_clock(rq);
>  }

Well sched_info_enqueue() gets called from 2 places. The comment above says
otherwise but it's wrong. It gets called from sched_info_depart() and
enqueue_task().

I'll send a patch about that comment later. 

Anyway,

Let's say detach_one_task() found the p to detach on active_load_balance_cpu_stop(),
from there, p goes to attach_task() from there. And then 
activate_task(), therefore enqueue_task() and
sched_info_enqueue().

If p is delayed then, correctly the sched_info_enqueue() will not start the clock.
If not, it will. 

On the second call chain tho, there are task_is_running protection before entering sched_info_enqueue(),
therefore a task cannot run if it is delayed. So the patch's case never runs on that path. 

Here:
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Thanks,
Kayra :>

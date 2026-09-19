Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3B3F4138
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813466; cv=none; b=YyUsVjHfbLfiS2VyVjEyOCF8HeftIMGGz02gRBk0QfdMenDs7FYOMIVyylm0/Kry4kD+Vx+G2lLGR75+Mpezf34V37FjKSCd3u0y2hr1OPHxt7wMLbqTjoHTPr0TlBUS4E9n9aDTORsZaCkK8lf86V7tuJZ7Qm3m+P9bZKaqnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813466; c=relaxed/simple;
	bh=Xv+FRzctZJl/t8SrBpNQEBEjzqAX+HYWlxzXu8WOHmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQoDL7ouXlMZ39uPz0Z/JbxSxBreXDC5hBhvAODHy6DSJkCp2VJOqf0/zZL/iWkUNDBHZ4xK3KjFsHgLPew5Vuomj5GWMOhiovYBs3U9g/Fp5PoTVBWfPl8FSuNF7xqu22bfmAZJHFazCWyIlBLG4YNsC7D7hf6c1n5gLQuxnco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itTcH74w; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itTcH74w"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so1042875e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789813463; x=1790418263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zO/pRduGdl1VmozSVkt24+GElAcDrPuwrHDdaP+xhcA=;
        b=itTcH74wC85TzBa1NTT/dTXkjASC8SnSpdI516xgCiFZULxJA8CQqhKhOtUgvKamAr
         g/P/8iQNrQe/nIs1mDZmtZcnPql3JvFWk+BKOfjHLho5hdMEGccUHoy0IVMTBx8micA7
         Z3kyZHsVBQnI/8hZT8TJw81DNY8imOB5xSBwCrQgJ23aTZTHRMJq2qT9uaKxKeb1HQsN
         aA8hK+OXap9q0yBvkLN9XI41khgmJHzeZf6fVUP5SCZwawwAb00xevxK9wZoZcy3tj2J
         lf6DtPkkGwFGphjVI+oBDDeyuxx5exg2YXZB+PyqiwgbkS1RtUy+iSQ7TssjgG0hkOuM
         s6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789813463; x=1790418263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zO/pRduGdl1VmozSVkt24+GElAcDrPuwrHDdaP+xhcA=;
        b=dVK+jcvHk7rctb9cNmEOVrwyLBRkDj8Tw8MFTU2ImcOT2Geb0yahJFFbefesBoLJAz
         bhcBgwFuOmukvEXctIVeoXxis9c/mE1QCfUfe9DbTcoCfy3vgkRfyN1bmSREd3lHGiZm
         vv0qiaSxZEaTd+e4ODHUBt5vFcv+7T2qdMfPVDN5PqpUk7L87O+4dSXxJxHiqQVm1DTq
         RzTAkdyCoUNOIT8I40R5rdIqGgPhbR3Cdxt8Slar9mqQ7Eo++3SeaNFhnL4AnCcxxojL
         MAK95Vu2YYabt4ULZdAD8fs6hVz1wX/uq/QpP2U7Umx5dMnA8175TRaHy4yXiLeo7NiT
         U55A==
X-Forwarded-Encrypted: i=1; AKwUvBwEjWAaZnaCkei71MeIb9LgNMG8Rq3XB2KDlY7pXWtbg1RBbLVQxAt8oPZeBLo9+wZBZ28+68JZ+5GcOaU=@vger.kernel.org
X-Gm-Message-State: AFuF++m+EziMbxfo2YSk+gBhfD/+emmnPc1sKR1Eqdpau8C9mYw5pHCH
	gB9thkisbQHlZTT3haDf2v/T7jXMHImbxRFXO5DxtHlX1Z13mcs32CwI
X-Gm-Gg: AYBFou1smJGlD7owQhcIDoCO6+YVl3H0C+eg7wX8gouKgLpoHgIxF/wofIXUOKM1sjT
	oaPxVHBo1TkF3d7rOaBfZf7+hNLWrX6DMwjqPYpqhJNBgb/w3AmRwOycvfu0SN9+f5vCAZOBlje
	Z3JLYQZkZmocRUxUGOImVqQBzJEl4zhfU36nnatg6sdolTugF6PVT+H63YxQj2cpkD9VOFdciX/
	+OK+vY7u7TKXYVF0wsHeBGqT88iFrAeD+upP7CG9us4J7Gcx8L6OJRklk8HLFslARFBCfELIY39
	51B39Q/zouy3LBDQuio5eA2FeaBgz3PS4CFNjmxTRN48q5CVhM/LpeI+RlS5X4QOyjUGJ95XmCM
	7uZ5XR3ctsI31N2SMLPtbOr2nF+R8dbu5rSCS+bFkc3G3WJ1H8A7k50DRju1nM3W36GUPS08m7h
	clp8loak6pmeCPGjEWQSymFOWP+GiL7+BZyJXI8CJRx/YB5Q6WNUgzMp5JJI76kd5Jw9ZIwJjOq
	Aq1JL8SJIn+ph9HPBqQmw==
X-Received: by 2002:a05:600c:4708:b0:49e:745d:5768 with SMTP id 5b1f17b1804b1-49fc7b9a4f8mr55379335e9.0.1789813463150;
        Sat, 19 Sep 2026 03:24:23 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068124sm62462245e9.3.2026.09.19.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:24:22 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: albinwyang@tencent.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sat, 19 Sep 2026 13:24:20 +0300
Message-ID: <20260919102420.108000-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909133345.1572954-1-albin_yang@163.com>
References: <20260909133345.1572954-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> With DELAY_DEQUEUE, a blocked task stays on the runqueue with
> se.sched_delayed set and its sched_info.last_queued is cleared, so the sleep
> is not counted into run_delay.

> When such a delayed (sleeping) task is migrated across CPUs via the plain
> migration paths (move_queued_task / move_queued_task_locked, the latter used
> by __migrate_swap_task), activate_task(dst, 0) calls enqueue_task() without
> ENQUEUE_RESTORE, re-arming last_queued to the migration timestamp while the
> task is still sleeping. The later real wakeup (ENQUEUE_DELAYED) tries to
> re-arm last_queued at wakeup time but is suppressed because last_queued is
> already non-zero, so sched_info_arrive() folds the whole sleep duration
> between migration and wakeup into run_delay.

> Fix by not re-arming last_queued for a sched_delayed task in
> sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
> sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
> runnable tasks and load-balance migrations are unaffected (sched_delayed
> tasks are excluded from active load balancing).

No? can_migrate_task() skips delayed tasks unless they are both delayed and 
migration_type not equals migrate_load. 

And can_migrate_task() is called from detach_one_task() which
gets called from active_load_balance_cpu_stop(), with a custom
env where the migration type is not set. That means, the migration
type is migrate_load, and can_migrate_task() can return 1 for delayed
tasks on this path. 

> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Signed-off-by: Wei Yang <albinwyang@tencent.com>

Thanks,
Kayra :>

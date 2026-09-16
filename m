Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1442345731
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528921; cv=none; b=XgUQzHkJtuaMIAXw+8f0Uq5Pl3InY77uQaoYKpb3B0Qs34lHuxuoTN8gZo2BbpfXiWDQjM3CN4LCdPvUTIsMAOERv8sgU7xH1J9DbokImukn0LhxRL/zlB1kacd3V/spRJzgo3H7Pavo3Gwi8MYGzsIPCXEVWYHUdEWwQ9BS+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528921; c=relaxed/simple;
	bh=D3CLGNiwVCABHuas+SAZs7G8ZXekXIlZp9TTHLSjYHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjVdW2ZS8RqhBKoabPA9AzPthcJJn9uuzsdsbwpYVmIqw4CiJtJ8RDOwXG+mtwmV1TNvw3znFH36sY2gp0zF7BqCoEeaZs8rhseEGtW3mlIb7TRwOtkJBYVHt0GEKpTgLtTvSrMGQCoWsEFpMbnm14MXzniTz3Qw4HMyY9yL/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDHR4mgv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDHR4mgv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so400675a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528919; x=1790133719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7E5IwM38XGhPSN8pkZyIhxO0i8q0d5y20DyNnAE64s=;
        b=aDHR4mgvfSqei1/2D05JpMqJ1R9bgxCTGxY2eBx4RX3miS7wlo6F0NMlhfMIZ29iAj
         l76D/duIBq1gt+tKSt+VGU0Sb5aYP6CzekX++PQF/Bh/KrM+H+igXLtP+qMqhkHf+vKs
         2ujWK17ZjUl3p7+pwMUgWiOQSPjNaSI/r/yDynvOZziGb797hPU8EqStMhrbSkghTP7v
         WyE0ProjsyN1WfiVA4MLzj1k9K9uFvKecoAqulTIiOXbAOnW24j6LCaAVxbZD5W0PYxB
         LaUiOqXsMx8PXcpa4M6mVIbDfdWOrg3WQ8AXzzJnbVVwxqk5nWB2zKrDXBDqhnGTrHkA
         HsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528919; x=1790133719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7E5IwM38XGhPSN8pkZyIhxO0i8q0d5y20DyNnAE64s=;
        b=KBIOsoaienngq8y2JTcSvqblSAEXCjaYlDqcHbqChssyF5HKf1of6SkxVOaBM8zOWi
         pFW1Q2MbiJiULtCQdDL6heX3Z4ScGhhXy0jk1it6UChg11Hn4U5WM+ezvNDIsT6/MGb6
         4qqBm2Ed9HX951LH5RL6YNstnX0PiM24kv/GgglFm4vTqKHhZSO4MWnZFf/B6AVwO2Yo
         xpsFDUK600rv77UtRfCqPYILfu2WcS4uAGN9QpH8Ya1fXf9HLZ0LSh+AV8ORkLSr6gcV
         8g8edst8HXlNVv5BjWpdzw6hKy4PKbmJiJzr6aQb1eGyZ4QOcp8SzoxImH+y980JqEOy
         wzcQ==
X-Forwarded-Encrypted: i=1; AKwUvByOnGHKXR37f/rTiR9zDG8O4yZxkKduuj11z1g8+46lzoevExuoRnxHyKXRXe2vc3ZBU0q06h2rVZvBHnI=@vger.kernel.org
X-Gm-Message-State: AFuF++mqKZwMRcmMRpNDDTsfvMojU6BU5VtZcMbxRlqd6NjrgS7Oq93N
	PtwUoZyMGMhr4rfVr+UTgHxklB9IZHZbkezMWeGBpWIJRfRT7yOWXYcr
X-Gm-Gg: AYBFou3T/fFGrXiG0VJh5IUGhm939fs0inv0IdvENNgeDVQQfqQ7v1X20LlxJurJIE9
	eDFEDhPZB+ozhXBhAe054x5/kkSsdwOP/AmU/EYt+A1pWl+zff6Kfo8usNgcD9TnVRZUPJaj1bU
	C0d3E5XIPeQjPSuszUoxkPwdhu1LFbRXZeegUn7PAe9Akns3yRPJdzAwSEiA17nip+0HqUz/QBh
	aN5hRx+gyzr3u9MzqbIa4QtOaNI+9y65NVOHcDrNjAR8cXbIAjkfIluk5YfmCcxw0lncLaqxjin
	jDbjEk+oSsH+0YgfVI65C03wywKlqrIu2mlgak+V4gaN0YL6vDcB1yJbz6pz7+h5rkSOLKyUjvn
	qgK7RDv9tGq1Dt2XwZthI6IBcbxXKTQkLCbJTB21hEx2VbJLKNy30akxF0F8g29fTlaHAIb4WIC
	A5n1skVrtn7ZEZ3XrbodVo6AM2YFkkoAsoqGfVC8YFwb8PWReh3dXMawSIk8FE9QjiKDWzigSXr
	19xdGJyKJc=
X-Received: by 2002:a17:90b:524d:b0:39d:eca2:5c81 with SMTP id 98e67ed59e1d1-39e1e2dea05mr2365276a91.8.1789528919112;
        Tue, 15 Sep 2026 20:21:59 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b9068c6sm1799310a91.1.2026.09.15.20.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:21:58 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shubhang Kaushik <shubhang@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev
Subject: Re: [PATCH v3] sched: Restart fair hrtick after same-task repicks
Date: Wed, 16 Sep 2026 11:21:49 +0800
Message-ID: <20260916032150.487242-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915-sched-fair-hrtick-restart-v3-1-7517f388f0c8@gentwo.org>
References: <20260915-sched-fair-hrtick-restart-v3-1-7517f388f0c8@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 06:13:18PM -0700, Shubhang Kaushik (Ampere) wrote:
> Do not restart the DL hrtick for SNT_REPICK. put_prev_task_dl() is
> skipped for next == prev, so dl_se->runtime may be stale.

put_prev_task_fair() is skipped for next == prev too, so as written this
reason applies to fair as well.

What separates them is that rq->cfs.curr holds the task entity rather
than the root-level one, so pick_task_fair()'s update_curr_eevdf()
refreshes exactly the entity hrtick_start_fair() reads, group scheduling
or not.  pick_task_dl() has no counterpart.  update_deadline() then exits
with deadline > vruntime, which is what keeps the repick out of

	if ((s64)vdelta < 0) {
		if (task_current_donor(rq, p))
			resched_curr(rq);
		return;
	}

That branch arms nothing, and __schedule() clears TIF_NEED_RESCHED just
after pick_next_task(), so a repick reaching it would come out with no
preemption point at all, which is the state you are fixing.  Two lines in
the changelog, or a comment at the repick label, would stop that
invariant from being broken silently from three functions away.

> +enum snt_e {
> + SNT_NORMAL,
> + SNT_PICK,
> + SNT_REPICK,
> +};

Three values, six classes reading them, no comment.  SNT_REPICK explains
itself; NORMAL versus PICK does not.  At the call sites they mean
"through set_next_task()" and "the running task changed".

I checked the conversion with the compiler rather than by grepping:
reverting any one class to bool fails on the incompatible function
pointer, and rt, stop, fair, idle and deadline build W=1 clean.
ext/ext.c I could not compile, SCHED_CLASS_EXT wants DEBUG_INFO_BTF and
pahole is broken here.  first is unused in set_next_task_scx()'s body so
the rename is safe, but someone with BTF should build it.

Booted 4 CPUs, HRTICK on, four spinners under panic_on_warn=1: clean.  I
did not reproduce the latency numbers.

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

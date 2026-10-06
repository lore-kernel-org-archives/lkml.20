Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B33BE620
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791314661; cv=none; b=RgU+qgYEWneKrnaZUXzKTomUc30C7sjQOamy5cOilgCkJ3RHM+M7KYuwWx00m2S854B+drOEjk07NhqQimfuNhnwCMKnZCSovKjmrRsWsb3sO5oveE3crR+GbPEfuZ7iAN4MRPqrT9kAS4L5wE9QPVNOhyewiushIZRLS5JKu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791314661; c=relaxed/simple;
	bh=Kt8YNEWfbwDWsI+SQanVP9qIuuvXMzBnWOpvIaiQncQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlkPSWaINg/r+G+kPgS/opBv1PuJkAanITc9ahv2LW+Lcy45eFgfudqzlEoOrk/23SXGkqI/L/HFWLG6VXj+qYovXJYMwo1Iu1s7sDDMpHNbc0f1s6KwFXfImRtyHobPs3k20EVnLweVzSW4ZhkpYYuApavxYztjXRGj9mMd8o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy1T48Dc; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy1T48Dc"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48c6a19c353so105888f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791314658; x=1791919458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx7UFENNd+zDz7Za9PxYYzlJTn11JexZcpPUkJvIP5A=;
        b=iy1T48Dchs5Q595vWIwkVMbeW1aZ56l2G1vcSpiNPB9AH/Mp0esmpojfgjE8sl9HVV
         hSYXFf6hQYA1vsIxUm3N3Xser62FnQQe9UNOMF3pSiiUA6uE+L9WlS3ODyfMhOR5y7sI
         t7Jwe/J9Vw/8TgMCcWJZetavAV+wk1/PO6hWTy0YAjMHoEEBXFBr7dPQbuXjkxM79ZQY
         U7leNZwrBorpLgWZ0/eBfQ18KQ5xp6YOWaxRx7SFBRxbH+kezexLQ5t67HWftgISxutj
         YTlVSn2VEw/kPAmUq/HTQ1N65nLNMMtYJpUvL/ehYwWBXBR3g8tvNeUMP5+OTCZgDicc
         r+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791314658; x=1791919458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yx7UFENNd+zDz7Za9PxYYzlJTn11JexZcpPUkJvIP5A=;
        b=C1reQU/rDZynQnBZRWU7+zIrySx8mQagQQYFuMqHyb0+i6KB7ismRq8xjzsWkEcIvv
         n1TY/CeNShPs5gaWS8NRyOB1IrjPANvQgi7YZWWGtmhrqo2gSIxNxcn6tTOG5MPhaFux
         FpfXJ3riK/aXkrSiHE0AeAm6KmjK3ja+8GYSwt2eudpBfs9TXpnawMzaupIPo0LwTzdO
         4sI90edbe2cAa4rLSEsmZtj8iDeKd3pmf+2xLzUsQHRzQdU2ioltbseaOBIdsAj39X1C
         eKRQWBRRCfuhlVZMABAt6JJkqElEKUPL7qz9E2OKuSALHawD5HwppDR6IlN6jESEiKeb
         8QiQ==
X-Forwarded-Encrypted: i=1; AKwUvByhVGCOrl9k/GUQ56ogbHAiub1G5mTgjM726gemJTN+JkVyHohYWVEe6wKfpPyEz75hOeHf5cjSKvianGc=@vger.kernel.org
X-Gm-Message-State: AFuF++mp65PALTToRxtG4p13rrMz8OFYNSj5ucS+GMFF+U1zyL0oGNk6
	c6ZhANzXaF9RkCHepM4XwB+jo9ACMe7pO1eDKH9Xj5UaSrnz4tFYXZo6
X-Gm-Gg: AYBFou3HYDNnFuCiXmNfX3b4hHKKItavGbcyxnQnSdI+ZravgtEfu14zII5SuJUeXeK
	bZV5i1zmGXVaNVseznAohf3EYRVi2GjbcaY9dOMeo3oAJpLahSIUN/j5GXnnek4eMoKeIifZ+6j
	Y1QT2KoRmKCxM9Pm6SvScWaKn3JVsfQ2skAa2mZWY8OyP4SsrLtG+Q9gvGUYoE0eFEgiw00j3qw
	pRrUIAoFEMAY2VEa4WpKNjgDUT0fgv5bUDshntvAnv489QEo31d0zw1asHe/nif/kKvRb5R8qep
	5bqoQb0O/mT0Tv70B11YmO9yILava67Vg8v+MKpix1g1aCq6JVu4qHY/yGI7hYVMSKMabB6GJ9Z
	+tIxPCFnidBZScMxJvi3bZNUKBRmdi6teqOtD3YJvm3MjU/aI+KSh8CyAq2L9XfRIy7yY7touz4
	kZVicoT++9kopKy9s7MIGWgnNk7jdoCuItxOVxpPW0he5op7NgLbx0fy7h1Ypl2xlUxUM7cHmXU
	Z0MYI+1SxK9GEppUNmyUEh7ETHTHP4=
X-Received: by 2002:a05:600c:46d5:b0:4a0:1ca8:70e2 with SMTP id 5b1f17b1804b1-4a02751fa7fmr252725835e9.1.1791314658282;
        Tue, 06 Oct 2026 12:24:18 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f54a5cesm6315185e9.5.2026.10.06.12.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 12:24:17 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
Date: Tue,  6 Oct 2026 22:24:14 +0300
Message-ID: <20261006192414.7308-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-11-vincent.guittot@linaro.org>
References: <20261002154415.2270586-11-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When the task is alone on the CPU, it's never put back in the enqueued
> list; In this special case, we use the tick to run the check used to push
> runnable task on a btter CPU.

I love typos. Like, in here. 'btter'. I think it should be bitter. Like:
"In this special case, we use the tick to run the check used to push runnable task on a bitter
CPU."
(Or maybe by a really low chance, it could be 'better' too. Maybe tho... :>)

> +static int active_load_balance_cpu_stop(void *data);
> +
> +/*
> + * See if the alone task running on the CPU should migrate on a better than
> + * the local one.
> + */
> +static inline bool tick_pushable_task(struct task_struct *p, struct rq *rq, struct rq_flags *rf)
> +{
> +	int new_cpu, cpu = cpu_of(rq);
> +
> +	if (!sched_push_task_enabled())
> +		return false;
> +
> +	if (!rf)
> +		return false;
> + 
> +	if (WARN_ON(!p))
> +		return false;
> +
> +	if (WARN_ON(!task_current(rq, p)))
> +		return false;
> +

OK. So, this is called from task_tick_fair() and task_tick_fair() is
called from sched_tick() with rq->donor. So on Proxy bla bla
this could get true. Or maybe I'm missing something. Dunno.

NOTE: Some more places could have the same case. Again, dunno.

I need more tea. And sleep for not having to drink that much tea.

Thanks,
Kayra :>

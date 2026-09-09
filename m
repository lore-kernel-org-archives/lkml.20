Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4423BD241
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947321; cv=none; b=aH74hPSHfxY+MFFVpuEUaV8PPk7w8SZfSQZd/3mpM7Sj9sOaiKG839BT3DM0hx4QMl76kLFtSqyYB26x0v9qkuztZfiMU/I5AECPmiNhZOi+rxiXEGsO3tUln5UGQwcDVQyZNIWSsrEV7WztxPHtotXwwqNep4tNlJBZ3+SB/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947321; c=relaxed/simple;
	bh=BYClkJ6aGtRl+T5K8ulnbOxBXrmzczAETnchmGb14g8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References; b=ah5V5C/8p91uZz3UgSYjNTmj3Qoq4iuS1ataO8dZzcLi+efX9kBaYTaXlOya8Kk7UPjVZ06tIx5ZHuMvTPGwdGlr6v3D+567PZ09w2tl6CrfmRx9Yn9LRRm/72O4vjzXqPNC74Ld1dFrIwU8Fp07U1Ve7efMKCPTeFSiIYuzENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hYNyCQGS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hYNyCQGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:From:To:Subject:Date; bh=BYClkJ6aGtRl+T5
	K8ulnbOxBXrmzczAETnchmGb14g8=; b=hYNyCQGSdi0+qdDnIDaKPbVYaLlKU67
	U62xcpYosGCtYFuBFpRM5HuTiO/W32NO+cqdb49JAchZ+Uk0ue/tJLWjemr1ixrb
	z+wTi/+8EsqgWFfZtvLCpPeeSuMVNiB9tPgNhI5ZJO16TapX3BNHON5fHEzfm0oO
	joqiwdVf0Fl4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAX4M05K6FqgktxBg--.25794S2;
	Wed, 09 Sep 2026 17:47:38 +0800 (CST)
Message-ID: <0c064defe3ae8a522150ead7ee1980dd.sh_def@163.com>
From: Hui Su <sh_def@163.com>
To: linux-kernel@vger.kernel.org, sh_def@163.com
Cc: peterz@infradead.org, juri.lelli@redhat.com,
	mingo@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, jstultz@google.com,
	connoro@google.com
Subject: Re: [PATCH] sched/rt: Fix RT watchdog accounting for proxy execution
Date: Wed, 09 Sep 2026 18:38:55 +0900
In-Reply-To: <20260903111247.3538976-1-sh_def@163.com>
References: <20260903111247.3538976-1-sh_def@163.com>
X-CM-TRANSID:_____wAX4M05K6FqgktxBg--.25794S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy3Jry8Kw1rtryDtFy8AFb_yoWfAFbE9r
	Z7CFW8Gw1v9r4DXF4fKrW5AF45tw1UtF1rJw18Xry3Ga4DZrZ7Gan3Krs3ZrnxX397Can7
	JasIya17Xr9FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjaii7UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RrbO2qhKzr91gAA3i
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, Sep 03, 2026 at 07:12:47PM +0800, Hui Su wrote:
> With proxy execution, task_tick_rt() is invoked for the scheduling
> context in rq->donor, while rq->curr identifies the task that is
> actually executing.
>
> Pass rq->curr to watchdog() so these state updates follow the actual
> execution context.

This standalone patch has been superseded by the v4 series. The scheduler
task-tick framework has since been reworked to dispatch both the donor and
execution classes, and the RT watchdog fix has been rebased and folded into
patch 4/5.

The v4 series is available at:

https://lore.kernel.org/r/20260909092901.2989564-1-sh_def@163.com

The task-tick framework redesign was discussed in Peter Zijlstra's review:

https://lore.kernel.org/r/20260908104407.GD687043@noisy.programming.kicks-ass.net

Please consider this standalone patch superseded.

Thanks,
Hui


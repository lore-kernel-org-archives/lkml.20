Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0440846A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059652; cv=none; b=TVu9LUMT2szzMPS5fwRPVSaw3qGihU5g5nQDiS1fqOGx4cM/PAoE0feCqY/VUThOpt+d4bEloPt7ecl0NLGL2cDeKZbAeWan702yKypd00vmoLuxeYyqi/0j0PkmzG7/jk6anwkUq0Vw0D7R7smKtFmtmgEK12EoS5RG4ONx1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059652; c=relaxed/simple;
	bh=7j6R7XyLrjvHTrdTmVM0r7drnRl+mws/qrfKUyKOnwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BSoqAjBxsd043MWqsYEcv5Lcvm6k2fjjLQ9raRRQpXCL7QlGTOzyjHGG5uHeKoqTm/IqGL4yHh7pgdGc506DP0j42zOTWn8EINRbtT5WhluBY8qzwb/yWNlxff+pykAdg7F24AaPbwir8Ls1uk26RIYN2rOUHgTMXBxhwanM49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QDYD25yW; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QDYD25yW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=lxMYcvUkkuNk79rs+LZDStQFf7C6NUXablNC1+JGmSs=;
	b=QDYD25yWetcBIeWEJoMeQAw6JTJI+UpEgxEwBlx9Mk+Vfxx4O6XPS6c58KxLxv
	alvD1OkmsIgyXAkZG35gF5uuUKOvXZZv2MvpNOheeQSooZcgV/k/wgkBoK1D6MYM
	pkZ+NjcC/5DoK767bZVLQ1Y2zoVnv+6PLPkClJiWUDg0k=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_7WvqNBqcVbyEQ--.39707S2;
	Thu, 15 Oct 2026 18:19:28 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Avoid overflow in place_entity()
In-Reply-To: <20261015094008.GW4120091@noisy.programming.kicks-ass.net>
References: <20260928124754.1692077-1-sh_def@163.com>
	<20261015094008.GW4120091@noisy.programming.kicks-ass.net>
Date: Thu, 15 Oct 2026 19:10:30 +0900
Message-ID: <20261015101030.e41fec0c-b3c4-42e9-982e-4f3d7750940c@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_7WvqNBqcVbyEQ--.39707S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rCrWDCr15XF47GrW8Xrb_yoW8Gr1UpF
	Wqqay5trsrtw1Ivw4jka1v9rW5Kwn0gw47CF1ruF18CrnxGr92vF9aqF13XFsYvw1DKr1a
	qFWqvFZrAFy7WFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYD7-UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6hAlhGrQqLA8dQAA3w

> Indeed so; however I've rewritten things like below. Hope that works for
> you.
>
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7455a83a6a99..6ce7233cd339 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6266,12 +6266,20 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> 		load = cfs_rq->sum_weight;
> 		if (curr && curr->on_rq)
> 			load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
> -
> -		weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
> -		lag *= load + weight;
> 		if (WARN_ON_ONCE(!load))
> 			load = 1;
> -		lag = div64_long(lag, load);
> +
> +		weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
> +
> +		/*
> +		 * Rewrite, because the product (W + w_i)*vl'_i might
> +		 * overflow s64:
> +		 *
> +		 *   vl_i = (W + w_i)*vl'_i / W
> +		 *        = (W*vl'_i + w_i*vl'_i) / W
> +		 *        = vl'_i + w_i*vl'_i/W
> +		 */
> +		lag += div64_long(lag * weight, load);
> 
> 		/*
> 		 * A heavy entity (relative to the tree) will pull the

Yes, this looks good to me for the normal path. One minor difference is the
`WARN_ON_ONCE(!load)` fallback: the old code produces `lag * weight`, while
this rewrite produces `lag * (weight + 1)` after setting `load` to one.
Since that should be an invariant-violation path, I don't think it matters
in practice.

Thanks for the rewrite.

Hui


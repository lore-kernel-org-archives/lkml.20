Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB652F293
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789720; cv=none; b=US2XyjkiQXJn8o0+5MGeme25KMijfj0YyB2uQeHUyyTP1MEVEewYOuCYLffYWDq/AMTXNG0VdHhr04fKDSYkbfbTkNSSuFgwnRpdU0ZQ4I9QCAxuaudkQKcr8d8xBZ0K5GhvBSgQevPWu6uMY4rNVMoj2NoHVGZXq42XmZAX260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789720; c=relaxed/simple;
	bh=rLUlZrWV1v3mln6a6H1vxw72int1hX649ZUZFszp/TA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=uZgDry9oSaJ3mA0uNe2UvrSX5CElu8wFfH3sjhg6bT46Ujh/dT1B5BZKFwbveZJCtvmnS+dm7yiIOSF2g0si/gwwgynWwnVCcgqy48Tp/+hXmUlksRyEOGkgXKepMG5hM1P/HeMoGcHb7B8LqL4YBrIHignKELmCavh5lxUJJhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COcqrfrL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COcqrfrL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6047E1F008BD;
	Wed, 30 Sep 2026 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790789718;
	bh=RnoiYZ3nwZtIWG8yHxEKA2mTn407D1BHUca8kcgMRyc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=COcqrfrLXc6PB/Fnl6cg2ogc5TNAO9gk0bRtjEmA8EjqZsVEW56nFCvlQP/U3wOok
	 Bm6K8bBKcX5FndZkb6mTXCNfSNu8uVfovHpvBsylrAJ0yC7FQwUi5mKmGN6L798oZr
	 N9tX+3EXQjp9hMxo3Pl0bWQeUnX3K/PgqN5FoWWjYidEaE+IorqdIEjP5aEsalzgCm
	 QZj7CX8reuVxhVf7Kjtuakw79dC5MkvhkMp2DoQpn26Iyqsx9MoclDTV0xW7jScQb9
	 12jmsUTn33F//K6MIRD9TspgXAzmZO2YT0v4r1QCVYlwwgRj8oYOh/vRg4RN8hvimF
	 4PpkfmmmK3B7A==
Date: Wed, 30 Sep 2026 07:35:17 -1000
Message-ID: <39d267b537b00b0b04a4a1999cb498a0@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: leitao@debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] tools/workqueue/wq_dump.py: Add busy worker inspection
 and BH pool states
In-Reply-To: <20260930143958.252572-1-atomlin@atomlin.com>
References: <20260930143958.252572-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello, Aaron.

On Wed, Sep 30, 2026 at 10:39:58AM -0400, Aaron Tomlin wrote:
> +  flags     pool flags (bh, draining, disassociated)

bh-hi is missing. Also, the pool line already has a numeric flags=0x..
field, so using the same label for these is a bit confusing.

> +            bh_type = 'bh-hi' if pool.attrs.nice == HIGHPRI_NICE_LEVEL else 'bh'

The busy worker loop computes this again. Maybe compute it once per pool
and reuse it there?

> +        for bkt in pool.busy_hash:
> +            if incomplete:
> +                break

After the first bad bucket, this and the break in the except below skip
the rest of the pool. Maybe move on to the next bucket instead? The
warning still gets printed and the busy workers in the other buckets
aren't lost.

> +                            elif worker.task.value_():
...
> +                            else:
> +                                w_id = f'worker[{worker.id.value_()}]'

Only BH workers have NULL ->task and they take the POOL_BH branch, so this
can't be reached. Can we drop it?

Thanks.

--
tejun

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768069;
	b=ZWXimMTWu9GXHfGg30n1t+Cj1CdCgzXjB9Tt+Ibt4D9FHxTqB7HO707ordiTcoFWvbXw
	 23fiXmKLyNhzvfFjB3nQ0D5PQIQHsNmApmUCqoLpPganIqqOdVe/2jzLbCIf3idhvAUCm
	 Ew/tz/S+7ArXU3yu2o6vbZ92MZo3FpQZ8AdVeBMMYwEwfjmRRsa1/b0J4BOzQOyZnJW0O
	 egLpvL5UPn5uDRRvkg8/HfkDMFLUeNfwXVqU6jIAJonh+L91zLCdfM59C+uB+usPKwnNU
	 lWGxG5JsabQGOtn0GibkFr5AlvsllJkq44JaV5r3AeSB34oanxp4/9tbQBzlvZBwa7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768069;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=UE9rWzGH8UjwxdIGL93K25DG+3x5w79Wpt62w3WJdRQ=;
	b=hSlXGe58xrKhUFMXMHRcHctzQsD6imhVKAA70nRXJAAkmnbnKRdI2rBsVQhQoiyn9S5d
	 kKbvcf+qPcv/EDXVKKiGeTwATkwNAiDHT7FTg42/musoHs66enGOXRydsVaosunD3txad
	 WvW8zacEFrcB9dgTD6BlyfIAf/bs2zpoTrLsdVCipwVLFH5Vx87HlH4xr5bZ4ey771Sc2
	 hsOUs8KQdgVFW6ToFZDIzjbaW6zGgsYgls57DlbvOwZJqEnntBXiaiJc8FA54v/gfE/V6
	 3f9MUbLpN9CDP7TbuR6PjvCtvGqVFs2ONJpq4yOjhrtYwtQHRDBv0DB12uFtEaAx79g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJEZ0WM5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cJEZ0WM5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA4F1F01828;
	Fri, 23 Oct 2026 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792768069;
	bh=UE9rWzGH8UjwxdIGL93K25DG+3x5w79Wpt62w3WJdRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cJEZ0WM5UpuzEn8HlxGN/fjhCns4vlPF7a3Uvyc0A3B25vvRTO3pNKE34u0xhdC91
	 Cx8M8BbpsuIphKX4lD6TRtIvwVlGX+x9qut/iqfHoZgsJoBs7yqI7x7KHYisUVwinj
	 dqLuBV0k8hmCESlZtpjMEOJ1BcvjmURR0YZ4sbGaUaAwaT09b0rAI3YWLjWcIRIk6M
	 ztWx5HLMlyjgHashYHA+vjfnYqBFio6J/9L8BKcahDECjF52S5qFyepkRKnsxFNiGl
	 BMLKPENfoYzN5tosPdOcTcsZLzaoahmxVlXS/AhqTWpSeMFF187/oO5aeYMQQ7+XvY
	 xPGd3XzZcimZQ==
Date: Fri, 23 Oct 2026 17:07:46 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peng Wang <peng_wang@linux.alibaba.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	He Rongguang <herongguang@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] tick/nohz: Reevaluate the tick for kicks flushed
 outside hardirq
Message-ID: <att4QqLE4ZsOJwxN@localhost.localdomain>
References: <atthrrwRchO2FL8g@localhost.localdomain>
 <20261023145101.8217-1-peng_wang@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023145101.8217-1-peng_wang@linux.alibaba.com>

Le Fri, Oct 23, 2026 at 10:51:00PM +0800, Peng Wang a écrit :
> The nohz full kick relies on IRQ exit to reevaluate the tick. However,
> a remote kick can also be flushed from task context without an IRQ
> exit guaranteed to follow. If a tick dependency is set or an earlier
> timer is queued after the idle-exit reevaluation, the required tick
> update can be delayed until another interrupt.
> 
> Reevaluate the tick directly from the callback outside hardirq context.
> Keep the existing IRQ-exit handling for hardirq callbacks. The offline
> flush remains harmless because tick_sched_timer_dying() has already
> cleared TS_FLAG_NOHZ.
> 
> Fixes: 4b44a21dd640 ("irq_work, smp: Allow irq_work on call_single_queue")
> Fixes: a5183862e76f ("tick/nohz: Conditionally restart tick on idle exit")
> Suggested-by: Frederic Weisbecker <frederic@kernel.org>
> Co-developed-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: He Rongguang <herongguang@linux.alibaba.com>
> Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks a lot!

-- 
Frederic Weisbecker
SUSE Labs

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794256177;
	b=1Svh8DIY3oZ0BGuAXjbv5hx/oj7ruMgObb13aQQFKrzE4PbFC+pWn9UqdSWi4prt6Tqn
	 dpnBsrDPyEAudAgE2bHhbv4QcPKK10H5l9x+HgJHYo6WRN3Vppwqr5N05TwzZy3kpgicV
	 OyPBOOLFksYySTxKdfohPbcoc+vnGyNOqfQDgRL9YQ+dNwOEQLjhVys01R0x4xC9JFyAR
	 i0EthTG+otXNb1WZk6DfT9WBpmTunhdHWABBs9U1StyXwaIu2GXFdeoZ3v8bLLtxG323h
	 vlj9HQpdYU9l0ZHCzzFXCbbb9A7FL3OP/kH3dlg91IvmGSys7F97dK/yRLLXx/hnirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256177;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=xQ23nP789ffc0DNTErQAnYiMRTEY8+c7DrBJJzBiENE=;
	b=I5u6hpnQiDFxhJCvYyIiymScIssRk4T9lisP5U+VvI06bHhdgxw9ghgw3QHUiEqmSh+s
	 tmleyuauXPlo7iTdFL4T0Hb12nO+9XZQXIIRe9tRPd5Q8UAU0bHiOOZjXQda02hKacQNk
	 E9FxV6UxF8hq6rgy5Ds6y/SRmJzbRAR1GGjj6VP0Da3WVVPkmYqsxICJsJyR3HHTx5wv8
	 ae57Umi0EJtw56CcrIscdRfyNw6XwgNFbylV9q6dUx15tptfuUEhwxJnvJVmZPqrm4+Dl
	 449wH9+Wg5Wt3B1pmCl19IIbHhp4Oz7R22fw0VUjPzx1D2Y4zx9jHIkHfHUgnbtOt3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agJiZTYu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F23606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agJiZTYu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505EA1F0089F;
	Mon,  9 Nov 2026 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794256177;
	bh=xQ23nP789ffc0DNTErQAnYiMRTEY8+c7DrBJJzBiENE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=agJiZTYud6WAueQFv9IyHq9519QtZTBVt/YA5B7ZOIokg/j5nB8BhvDzUkmCiukXf
	 loiiszIZyWKZinLpwbSz+uYqJxkizl0njOueZI9a+3Z5rCmkJFTOmKU6D2mmPI3SIR
	 0yYxVxscVo8auAvj1QFfN0rqBTkMAtONUylRxPvNQ6GKlGnpVcOJVpV/gQcr+14tLA
	 2TUJ8lo9jfNH4zElt3fqBM2u8y8SdGeK8mqKtCA3Js11pwVjh1iNyT+HJYzbr/+Nw5
	 ijVfG5NWqslcpaiBlRWQqsbkaXSVEz/qy0YpsWARCvFwWxbFZrmHfFsRmw4UaACPU7
	 AE6VSpQnlSsCg==
From: Thomas Gleixner <tglx@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>, jstultz@google.com
Cc: sboyd@kernel.org, mlichvar@redhat.com, linux-kernel@vger.kernel.org, Avi
 Weiss <thnkslprpt@gmail.com>
Subject: Re: [PATCH] alarmtimer: Preserve rearmed alarms during callback expiry
In-Reply-To: <20261101163954.767646-2-thnkslprpt@gmail.com>
References: <20261101163954.767646-2-thnkslprpt@gmail.com>
Date: Mon, 09 Nov 2026 21:29:33 +0100
Message-ID: <875wy5vjde.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 01 2026 at 18:39, Avi Weiss wrote:
> An alarm can be rearmed while its previous hrtimer callback is still
> running. alarmtimer_fired() then dequeues the newly armed alarm, so
> alarmtimer_suspend() no longer sees the wakeup even though the hrtimer
> remains queued.

This fails to explain wich alarm timer user is affected. POSIX-timers
and timerfd timers are not as they cancel the timer before re-arming it.
Which leaves the other two users of alarm_start_timer() which I did not
look at.

But if that actually happens then alarm_start_timer() is subtly broken
because of this sequence:

        alarm->node.expires = expires;
        alarmtime_enqueue(base, alarm);

Setting alarm->node.expires on a queued timer temporarily "corrupts" the
rbtree. That's "harmless" because it's serialized via base->lock and
timerqueue_del() does not care as of today, but that's all but robust
and future proof.

So this needs to be fixed as well and all of this needs to be
documented.
  
>  	scoped_guard(spinlock_irqsave, &base->lock)
> -		alarmtimer_dequeue(base, alarm);
> +		if (!hrtimer_is_queued(timer))
> +			alarmtimer_dequeue(base, alarm);

Reading this without a comment just makes me scratch my head and you
will scratch yours too three month down the road.

Thanks,

        tglx

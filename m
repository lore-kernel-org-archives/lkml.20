Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F9431A44;
	Fri,  9 Oct 2026 06:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526239; cv=none; b=CobtlnH6V+9CzL/pITvEdE6HKRNrL9w1NW4rWGafwz4lF3f0keb2eb89IdlgG6E6FH7G+Qeb30xsoKy4BvEZE0Tr/SDyVFqA0UDZo1iD+5u5TLmMdgPH3ksfu2gWMqJn/a3UWaEV/vhCtg/gBaAJt3pXH/4maEsmLk5CEgFgXrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526239; c=relaxed/simple;
	bh=Lu2Ltr3/Ksh0rUUz4TP+cGlhV1FTJXteCg9QUdIuA/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6b011F0bCFfVrphgP8flaG4Jwg7jf6cZQ0fX4dpAvTJw0pEJNIOfKDvOH7MU/52i6Y0uAguEYNS9ba26Xawz2RS1s428AlC2eZRDt3a1sItLxn4Pfqnj8/YuKbb53/46DiT7E/iSQ1py4uOFKxlU9YXTLVdshB/4SdJFYy6sr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m94c6dJS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m94c6dJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331381F000FF;
	Fri,  9 Oct 2026 06:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526232;
	bh=KS3sgP/eUxT87vqgC+drQoOFDrxJo6kTsTRnflTVKSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m94c6dJSC6KB2dY78IwIoo8ekBqOmd5nw+PtP+EH8lg2F8MXcrX/vt3CFVrmOjORv
	 2EZcDAFb4QoRnqGS5kx7W98EH9zEaLaPwkPI/sSf6f+cYA5X3B4MimVwk5d4etzekH
	 CJKJoXOxGGIsm6zdVospuTVNU3mm07SjCcgwNg6s2dM/85dezrqsNeydzljQ/CFw6g
	 GB200OaV+9b8p32LdR1KpQpP2jAdQESH9QrZk9J7w8bRpbqyo6FrNQG37HatBt2XSb
	 2V9ADm+ETbiwbYEFCiuS/DB95TengT1AHQbNZdwCYpxRA75JeP7K0e7JhB4w6vCjdw
	 Obi/bn1qnQ3mg==
Date: Fri, 9 Oct 2026 08:10:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: imx@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-imx-gpt: fix resource leak
 on init error paths
Message-ID: <20261009-miniature-platinum-beaver-fcf647@quoll>
References: <20261009022818.3025610-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009022818.3025610-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 10:28:18 +0800, Haotian Zhang wrote:
> mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
> the ipg and per clocks with of_clk_get_by_name(), but every error path
> jumps to err_kfree, which only frees the imx_timer structure.  The
> ioremap'd mapping, the clock references and the mapping created by
> irq_of_parse_and_map() are leaked when irq_of_parse_and_map() or
> _mxc_timer_init() fails.
> 
> Release the ioremap mapping when irq_of_parse_and_map() fails, and drop
> the clock references and the IRQ mapping when _mxc_timer_init() fails.
> 
> _mxc_timer_init() can fail after mxc_clocksource_init() has registered
> the sched_clock and the clocksource, and after mxc_clockevent_init() has
> registered the clock event device.  Those subsystems keep using
> imxtm->base and imxtm, so neither the mapping nor imxtm itself may be
> released on that path; request_irq() cannot have succeeded there, so
> disposing the IRQ mapping is safe.
> 
> Fixes: 8051a993ce22 ("clocksource/drivers/timer-imx-gpt: Fix potential memory leak")
> Assisted-by: DeepSeek-V4.1-Flash
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
> Changes in v2:
>  - Dispose the IRQ mapping and drop the clock references when
>    _mxc_timer_init() fails, instead of leaking the IRQ mapping.
>  - Do not unmap imxtm->base nor free imxtm on that path: the sched_clock,
>    the clocksource and the clock event device may already have been
>    registered and keep using them.
> 
>  drivers/clocksource/timer-imx-gpt.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof





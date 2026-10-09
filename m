Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3D4302F8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526269; cv=none; b=bXTrIt1ljbYVAW6knPSOfhY5D8zxHBaZoPP/5htUAiuGwqWWX8q2GEr0MHX3lX+j8cQu0soPGv8KG7uGxfIK7g//AHx1BA96pQhCG3yX2mkT7HwGJseQSZ+am33rS2DpLhHOSc9OQ2kOG6xpKjzm7EQDmLBP+Qt/rQSe2ni5g6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526269; c=relaxed/simple;
	bh=WtZ2lfU8NN4Y/WmbC47b0BWvEVEUByJHbvvgz9LCKyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU43vVtBxTW73WAEtxbHyAZWT2zU6Vv2YfaEWcSDOqx4qVeAkTcbl6m9MDxfew6z6PGY+MicF08PhLg6rlpgC7NG8rJqHe2yMXyqQGB5XKQzzBwG5tKLBe7EI0auiPwLVXQmMpXfHF3VKLcdVlSCIMydFWDoHtfX+UIrvZaY5Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCMdwMox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCMdwMox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708421F000FF;
	Fri,  9 Oct 2026 06:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526268;
	bh=Iz5p9hNQGBjR6SpC7ZMKpGlkazr9m8xKfxfqARCLf9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BCMdwMox7DLsHQJT6d7ModGZ6svUZxjhLIEFINDEp1FuWWy99u15cJX707UA/qsFJ
	 /+ck8L10oq/Dq5pBm3vN7mdPXkEHx1xkJyMk/kPw1b1CCEqorUZecfrCfq3O1PM3D2
	 72vXWJVBq28EnCAlbyFzyFo105jGhYX/SSeYmQMRcudqfzqnUr5YA2OGGGwtivfytg
	 GGbwPfadHHlEIjTgzs+xz3wTQ+uip2gPf5Nb7m29JZdKba04mAxOL/i2oHvlqo42ha
	 TzZvHW2xZoV4TyLM2OaV/xpBcIVzBqb6sUmnTtzMg6P8/9CBWVGu5AUqoFjEPj04YR
	 m7rXY6xK6iD9g==
Date: Fri, 9 Oct 2026 08:11:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Govindraj Raja <govindraj.raja@imgtec.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH] clocksource/drivers/pistachio: fix leaked iomap on error
 paths
Message-ID: <20261009-hound-of-satisfying-whirlwind-5b0bf4@quoll>
References: <20261008160243.2664167-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008160243.2664167-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 00:02:43 +0800, Haotian Zhang wrote:
> pistachio_clksrc_of_init() maps the timer registers with of_iomap() and
> stores the result in the static global pcs_gpt.base, but every error path
> after the mapping (syscon lookup, regmap_update_bits, the two
> of_clk_get_by_name() calls and both clk_prepare_enable() calls) returns
> without calling iounmap(), leaking the mapping.
> 
> Route all these error paths through a common err_unmap label that calls
> iounmap() and clears pcs_gpt.base.
> 
> Fixes: 84583983c319 ("CLOCKSOURCE: Add Pistachio clocksource-only driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clocksource/timer-pistachio.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
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





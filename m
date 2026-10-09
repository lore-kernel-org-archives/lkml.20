Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736C43A7FB;
	Fri,  9 Oct 2026 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526256; cv=none; b=ii+6cqPwgAudGjf4jo8haAhRxPQRRDT9d7R59/z91+EqaLJ5otVV09ANejs2T6XRVrn24OprwES1M50r8r1i1e+a94rmBOZF2fFl72ba6HL+B4jSUta5ZSV+/tETi2hOUD/3qZrnIvM9ctjiusKu5a0XMO/HsuV7Dcq6BaY0MME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526256; c=relaxed/simple;
	bh=FUZ1JcDrUhVLsFzhzk85s4QWDAJILCnmBVHEIJbAEEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKUUkIPMJJ5+50TvggpOaWfU8XhwP0b6NV5ke/rfEAnVqFw42/2WnUacULLcQ7nAGdyzfXNO7ZJdRKYBb00vdUvPItZpI1zDUUlz6jzgLZf/Xnx0DpbfqBX6lptbE3CeGvvD27qpAGusCULuH9OINrV8U7lfNJAaPrH8dKsuyPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo6RksSS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo6RksSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F31A1F000FF;
	Fri,  9 Oct 2026 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526254;
	bh=c86SoGE1Kg7yW8Xxg7bYgRohDAmBjRHhxs1LV7dRFlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eo6RksSSxkU6k+l+kl0JUmYd0VQm4MWjr/ltDGnWYAqesoJZtgjTrPdZF6rzLSsi7
	 NNskKdRM4s2KdwrDLFtm6BA900F9OTX1bzYgarfFmdn3uGvYZi1wc3rhWF+iHy3alJ
	 rRcaVG3Lu6FAMvizi6/x9uYauef+8ajhuPrdDeuX/Rha5Yaf7fxuvTyqpORpPwxAre
	 cOo4l575Q6l94S0z4AhLS6OgYcW4Uvunv40Vv6aOfIBzcbnST1xM5nqXyBRbMDPe6C
	 XXocUbThrD1ewcu1hcs5IsR0/HkFXdkLctICsrRcT2rwSgGl7lJV0wrkHZM8CWTcb9
	 WZkU+y+QNsqPA==
Date: Fri, 9 Oct 2026 08:10:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, 
	Romain Perier <romain.perier@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-rockchip@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, 
	Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rockchip: fix device node reference leak in
 rk3288_hdmi_analog
Message-ID: <20261009-formidable-ubiquitous-buffalo-2127bc@quoll>
References: <20261008181459.2762862-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008181459.2762862-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 02:14:59 +0800, Haotian Zhang wrote:
> snd_rk_mc_probe() acquires references to the codec and CPU device nodes
> with of_parse_phandle() and stores them in the static rk_dailink, but the
> driver never calls of_node_put() on them. All error paths and the success
> path simply return, and the driver has no remove callback, so the
> references are leaked for the whole lifetime of the card and each failed
> or repeated probe leaks another pair. The same pattern was fixed for the
> sibling rockchip_rt5645.c driver.
> 
> Release the codec and CPU device nodes on every probe error path and in a
> new remove callback, and also drop the extra reference placed in args.np
> by of_parse_phandle_with_fixed_args().
> 
> Fixes: eaae2ea73593 ("ASoC: rockchip: Add machine driver for RK3288 boards that use analog/HDMI")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  sound/soc/rockchip/rk3288_hdmi_analog.c | 42 +++++++++++++++++++------
>  1 file changed, 33 insertions(+), 9 deletions(-)
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





Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E61A3DDB16
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526263; cv=none; b=A2lT+BKyC8AGik0MatuEL0oUGnrX93iVxuOUCqGgJAZabnO33RUZ4hpFr7J+zhw43LOc9WlTlTyFvLA4WODKuQ629odCJTqZ3yGET9m+klD0n3JWbq/GscOW3Qv8Q3JnrwzTh0NJ/Jh4Ybx2SWS+CxpdKMxw4RG+N16iy2DsXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526263; c=relaxed/simple;
	bh=KL9a2hJFkH4posBzeLX0oc0oIg2MMy4zqLX63Kjg1LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVmuL+QjjGwpOLMQc7ZuUAb+kqi8XQn59nL0yhli4DwzDM4yxUBrtrYvMSSuzndZUAaaDlM/VcOabW/Q/QjTnqhyGEbfOcWuhaK7juBkPQEQSIsdXjGA1Yx1og0vyvYpYar5RdrDQxr7vLpZYdD0wiZj/4+YqSUWw6aL/Ljy59A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjV5sNeU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjV5sNeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF241F00893;
	Fri,  9 Oct 2026 06:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526261;
	bh=RZFU6ADpAuPrjkYSKIgfTgNybramYLhR9Rl5HgqqtBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjV5sNeU6DRr08pwzNxoDYiJZtN4nTi0ZROnCHVF0mzUS+ONf/4tSevCTYmnWHjal
	 PEi6ONyvQibxPZqe0jNx9qe8IJGakmCle2vhNJj0Hho/bMi6FXYVHTlq08ao5ZJlyB
	 0XZMvnFOn+3bCobhHT7yjaw3mdhEoPCa7jnKNsh4ihQGFqfaCdjgEYE5ItYQID5wEK
	 bayNKbap6Dc5CnwF33XcxVe+cuaUCqUzZvkqdolTczlaXp+vVOv6WG+Fhx6Mvyou8P
	 JBIOxgjIE/hgXB2e+XAHjYOO1p2zrJ2S/ljStcAQ23rLJECYA36ECYm5PCz7j/+3MB
	 TxoEc4hxDreJg==
Date: Fri, 9 Oct 2026 08:10:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/mchp-eic: fix clk reference leak on probe error
 paths
Message-ID: <20261009-just-pink-coyote-a55f80@quoll>
References: <20261008174412.2740045-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008174412.2740045-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 01:44:12 +0800, Haotian Zhang wrote:
> mchp_eic_probe() acquires the peripheral clock with
> of_clk_get_by_name(), which takes a reference on the underlying struct
> clk, but the error paths only call clk_disable_unprepare() and never
> clk_put(). When clk_prepare_enable() fails, or when of_irq_parse_one(),
> the IRQ argument validation or irq_domain_create_hierarchy() fails, the
> probe function jumps to the cleanup labels, frees the private data and
> returns with the clock reference still held.
> 
> Release the clock reference with clk_put() on all error paths that occur
> after the clock has been successfully looked up.
> 
> Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/irqchip/irq-mchp-eic.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
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





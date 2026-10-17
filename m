Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4F3822A1
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246933; cv=none; b=OVVshh8rR32Wlzk9lJL4tdoGXB1AjarbZ7KqbJGvlqhxm0CNLqW7W2+AGYbwDEWlHpeZGp297YsHO+d/jby96OmwxkSxrIvNQSc5Djss+kyTs9kHVYH0zWAQYA2T4nrmCPWioOaRsmeDVQ+Ow1L/jm7kmGzJnf5V6VICuticqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246933; c=relaxed/simple;
	bh=9VB+n9r8SAtE7pgAuVrM0JM4YuxP7Q20SYsFzX4ewR8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kV5e63R9yZM84sOfUmSzp2qr2IjeqGV3ln+igDFLqUaZHXTyuspmld1bwo0sr/kLTjaNjclRXgSGC9ZhLHhU02DMSa/Bdrdfu/DdAsOD5DtXl2t5Fb/4uYQ1IkMIO58g60UsOffi5uaSr551R//MNfTTk02Y5lUCzLDpwPwvcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LSQsroSL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LSQsroSL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso8909255e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792246930; x=1792851730; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=LSQsroSLbiOxsN5Ba0/zHf3o4IhtrzVqlfSldw7Klh+o4XnSxhMmfqMOS4RwUxT+VC
         CJS1ttsgbcwrVIfzJK1z5Dx3b6OIu1HwCHEtYlA7/VJQ06LKWlrVBX+v5A1SR30qTAOo
         3kNweOsHY6QEhT3pFW5HjvuW2c/pmLMrruD9CkcD16A8zIhxgSa8ii2cPqMRn9eodhom
         ubSvs/blPYdB7QDdXBKmFWaPwgYVtk9q0+l5N2E+tEzM+OJ/PrgQGpQBVGnwjgKLQ+t4
         DLFEHkJmxomIhbR7jMUrCINrCwWnPWfb0TjGm+GLvz2YHd92QLCYeek1OYMZDrJFRB9m
         QKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246930; x=1792851730;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=ndez0/XLa44waF1JnxJB2+aHGJFSk6dEJg21cqG7Hmvze7EHUQsKIaO3xtoIObZ+01
         oc3rkV7n7McpqVWwGjN9jnfgHmHobA4MnRLDGjzg7GBEtAePe+D3lX01YbOApRswyqP0
         x6nlhzgZ6FnJkB/tSm/pi0D+LRjxxSVyp2V+rjinuh0Xu2es3pFGcQXrYAyrzbO2Bz56
         Sdt/cLfotNBFBO+/yMeUqdsJZAapdlqlZGcGyAZ0Thc8PbOoBQbZwCAqYzZXWDEstxqM
         oLATCV+kal1HbCWADvPkG9BFkupz/HnX5sl4frmmHKv8TpI1O+hP0/yq54dh8mXDemJq
         o0yw==
X-Forwarded-Encrypted: i=1; AKwUvBy5mitzo1W69QidCxJe7UXdxZmJpvESKGWJ6qZzFj+VW+aSoiL2+4zXRTmueG6DQNHyEjHC+UzGbfq/Uxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmtGJNIK6oIO07NZgpDOUIcbcl8Awc3/Cc1RPViUzHbfNtbCcu
	SEDuuu70EnGUsIASUG0m+6vpZy7+1pfUKRBdBQGzUAyPJWJsMik/S7xLBs81CZUJO5s=
X-Gm-Gg: AYBFou38ZUQqGB9BuUnBu2+QTia3ZSyMV3AqX9UbbR548zYIuP57t3BkCN8iesk2Z5P
	6Hub/PdqVbdvWJVY8P1bU26V9Qbz0p18wLbyXiZyhYsTyTnXcwq+azBQSu/Rx/kOeZm0LMSXgvI
	fYTgV1eQJT7WxIwvJGRe+dHWsLT5mU35PvKUN2/dqx93jVx9h90WlsKMlnQ4TSyLo5TOGSgtmm0
	0Ypev6vaifNCQB376BZIrnqCtOh0YQu8xABI1ALQv2TSb+JlI9HSVYWHwdqYgahpWJJlJa2CA/x
	ATr8Ppl99h/rj+OvlsKtMMxnB4Pe+E9gjj0de1RSfll5GRqIxL+OJO67/P70KWz04L1E5meCc29
	wFjBmneJeo68nqfljv4r915Jd5o4+eBzgmP0NncLgrbk5QVt//nKjyH5HBp7u+jwGroGoOEYgK0
	HUfiH718wUQZtjlbhtpVTvLKNltEjX2lOtP8AoafCn2J2J/HzTvs0gUI9V+AoY+/HJ5K95avGaI
	BY/HIymzLziowtjkg==
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1d76224f0mr59164765e9.31.1792246928866;
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm74285205e9.2.2026.10.17.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
 <179180050742.66744.154947682767663962.b4-review@b4>
 <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Sat, 17 Oct 2026 16:22:06 +0200
Message-Id: <179224692686.859276.1840996329833650526.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9VB+n9r8SAtE7pgAuVrM0JM4YuxP7Q20SYsFzX4ewR8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXW/oNnjycuHTRz/v1c2U2/gvJidgvcJGDpzn+6vMVi
 Yu3nfG931HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJfBBkZFiYnqcvt4u5xWle
 87Sy9Vx/fue/UZFpWx/sIWTUVtNQu5qRoX3yom1vHzbEr0ya/SfXNfJScmZv15uZvXxlWbXSNta
 B7AA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-14 03:16 +0000, Changhuang Liang wrote:
> Hi, Jerome
> 
> > > Some StarFive clocks only advertise the divider and invert
> > > capabilities (via JH71X0_CLK_INVERT, without ENABLE). Add the
> > > JH71X0_IDIV() macro to declare such clocks, and jh71x0_clk_idiv_ops,
> > > which combines the divider rate operations with get_phase/set_phase.
> > >
> > 
> > Please rephrase, I don't understand what you mean
> > 
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
> > > drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
> > >  2 files changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > index c5ee82db3c92..224fcc3d08db 100644
> > > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
> > >  	.debug_init = jh71x0_clk_debug_init,  };
> > >
> > > +static const struct clk_ops jh71x0_clk_idiv_ops = {
> > > +	.get_phase = jh71x0_clk_get_phase,
> > > +	.set_phase = jh71x0_clk_set_phase,
> > > +	.recalc_rate = jh71x0_clk_recalc_rate,
> > > +	.determine_rate = jh71x0_clk_determine_rate,
> > > +	.set_rate = jh71x0_clk_set_rate,
> > > +	.debug_init = jh71x0_clk_debug_init,
> > 
> > Instead of trying to cover all the combination that could exist, can you just
> > chain 2 elements ?
> > a div then an inv ?
> 
> This may require introducing quite a few new changes.
> 
> In the current code, struct clk_hw *hw is used to obtain struct jh71x0_clk *clk through hw, and then the register offset is obtained through clk->idx.
> 
> static void jh71x0_clk_reg_rmw(struct jh71x0_clk *clk, u32 mask, u32 value)
> {
> 	struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
> 	void __iomem *reg = priv->base + 4 * clk->idx;
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&priv->rmw_lock, flags);
> 	value |= readl_relaxed(reg) & ~mask;
> 	writel_relaxed(value, reg);
> 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
> }
> 
> static int jh71x0_clk_enable(struct clk_hw *hw)
> {
> 	struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> 
> 	jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, JH71X0_CLK_ENABLE);
> 	return 0;
> }
> 
> Therefore, the existing code has one struct clk_hw corresponding to one register offset.
> 
> If it is split into a div and an inv, two struct clk_hw descriptions will be needed.
> The jh71x0_crg_probe() will need to implement different branches for different clocks:
> 
> if (a div and an inv) {
>     devm_clk_hw_register (div)
>     devm_clk_hw_register (inv)
> } else {
>     devm_clk_hw_register (other)
> }
> 
> Do you need me to make this part of the adjustment?

No, it is ok this time around but understand that if this patterns repeats, you will have to
fix this. Best would be to start thinking about it at least.

-- 
Jerome


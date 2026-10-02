Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8CC1BD00C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967111; cv=none; b=rNS9QUggFz24o1lwruksylCJTZrZQBvkq7ZBABmRDi5sV096e4BYdlb5z8cePozU8ZIgv7ixcjX7WdfHMjwIStHnqwkTLtpU5ApVTCOKfKn2kvF5aIr87vfxBTLCQeUdJjVoboKuH+xTnN3cFPmJik+/3g0s9Bbu7WdaA07Twbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967111; c=relaxed/simple;
	bh=QDX7lQ1hmHgJ9y3o5Z/Hm00xEaK1qYts6FM/BQ1Nm/Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SJM5CeQvC6iF17HM2s97rvD7qtBMfM4r4Xmi2CjJaGv8VFlOPX9qjx/eO7K9H13pt2kQsIvWXK/v13RvldrOBRqyixHVh6umTFDdzHN5Kyszg8vGKKsfz/4beJGnvO3o5nG2oGhypSSHgNq3ICY9elMMWpW58LlARk4cgJ2cnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjcYhHxE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jj7ZH8NY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjcYhHxE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jj7ZH8NY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
	b=hjcYhHxEH7yf4rXm1ExMf43k8n/1KWwwrSiociz2LZJ6sJNPbac0g+ADahFIGUz+cAT0uk
	GowAKA7bpUwJSZcXVK9jX2Xyq+xbiPGbkSfJIjAcqH12znIFokLLQTIU5YK36+vMbUeLec
	WFZiQteoLOou9oPYQZHEPm2v7miAqtY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-pc0wc13dOc6Nud_YfEy7Bg-1; Fri, 02 Oct 2026 14:51:47 -0400
X-MC-Unique: pc0wc13dOc6Nud_YfEy7Bg-1
X-Mimecast-MFC-AGG-ID: pc0wc13dOc6Nud_YfEy7Bg_1790967107
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso365717785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967107; x=1791571907; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
        b=jj7ZH8NYVEdrxdyXvrrUVICgkUNovrKhQx+jcTeFBx5OkC9wtNxlui6CAFLwIhpTXH
         Q4WMOn2oN8HgJpJOQ31tQLG+DuZW0PeBib1ixm18GMht/xVFQH4+IFh+ZrmEgFWTqbt9
         yd0RVLz5XVElEu+zZTC+52DGvV6pHZhGuZazaZ9zyrgMjcYkt/yE6lWJyf8gsiLpfya0
         J7JBbMOEpCXcweTfK49rA5pMYf/EqecurRHOphKhFxafpGxewjKX2YhTKBOeIAGyGDqy
         OguFx7j0Fqtjscv1zFRp2HurZb1GLlp3zayaiFVAaRSftMJt/zOY84pIUNKhJGsMwpbB
         4JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967107; x=1791571907;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwzsAXBdR1BkVlkk6NnC6X5ecf++oyv9cFOEdcbokxc=;
        b=ZmqvbNdtMDFUMsCrjTuepac9HkCU6sFXq7JvaUJeK+guxwYe3rD5M0XTQtcN+oLWUO
         nRNln3lKjsnANVJvVKKoxbgxj35ipiNv29pJQtUFKCJ34ymGV99bluI22YEtirAnhUvi
         qD5LCI5DfNloh7VRAPyztH8UMEUSzkOkz20xMum1wkfiJYwSWxV+b7qjGyy2aQf+ZPAM
         WkurQq/eYBMmYJrF2G9I/Z+ruJZ6UlyJcbqDxmNrgmwz5YczkvwXvas3++Fvb0efesLF
         8HMD0wzo2+XpAaG/+Q/xRMyz/g5cICdD0u0pS8LtRMXf2aJssqW4oC0ojoK/AKrZ+hU7
         Clew==
X-Forwarded-Encrypted: i=1; AKwUvByS64QOoys/KNkZg6rmmfW0JAKij3RYscQWpgM643tyzbNcdW1noTuv2v0OrmYRUvWBN/p3/WturASjlG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXTo6F9BQXlg1bkBFNZDvr4dqHKH2GIbdq7U+DNNz6nwcK2FMq
	m5sRPUkZ7aYKSStSjtVWdtHVNMPBugRUbtNfkxJOYWWEAjgyKrF0TTuevs5bpOY8ruo3DCaLxqr
	NUg+WqBJIGPqa1aw09Z7o4C5gkfAoh/5va9RikyhRAMGy4We+T43hIHEiL+XGvjQNfw==
X-Gm-Gg: AYBFou0aulEAZ3dzjBHAYOJL1gW/2Efpdg/li8ylihMtsfROxvI+Z2FatgeWVpkarEq
	FyB8Lztso+0SlqIqmR01y0AVA4wItbOVA4oA6mDYngiblQB+X2xfTvYmo+2yJP+x1ximQA45Bi4
	7F1gcAmm6dYfmLbqYSDOUYiCp+YuvZHQZNouURqdRcKmUfEDucnak/bdmog6OTpBn9m3GmE18qq
	WYV8DNKrYrawQhFvxcA0zKLY6LRrr79ivDtOo7xB6B4nuZqsWF9UMnQJrZKg2yHvu9l6eVX2XEs
	5P9PDGhPctjydbP9BHHNTt767xYL9sSWgg/O2qGbqJvECZaiel1IR/xDx7HFxv0Ol5TL+QI3I2n
	wt5J5xbquibQQEA==
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639036585a.21.1790967106982;
        Fri, 02 Oct 2026 11:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:32e7:bbe with SMTP id af79cd13be357-93cf177ead7mr639030785a.21.1790967106284;
        Fri, 02 Oct 2026 11:51:46 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 04/23] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260930124317.5648-5-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-5-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707363.821688.2728247121300145722.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4235; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QDX7lQ1hmHgJ9y3o5Z/Hm00xEaK1qYts6FM/BQ1Nm/Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/zV1zvtv7+SlXtHBUHFGbF2avMt2pk/9ujcLTCxi3
 ln8f/y5o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIlkT2L477RhtiqP0LV1IWGM
 ZU1dt/UfT9fN8wuQLvAMmf5nqsZPDYb/SZGX7zI8PTwx9kJQFcftAndb56ryh2camk4sv/s3O1S
 VGQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table, external
> clock names and reset auxiliary device name. The reset auxiliary device
> is registered with jh71x0_reset_controller_register().
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 2cc71f49ddee..bb7706ede1a6 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>

Add #include <linux/property.h> for device_get_match_data()

>  #include <linux/slab.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
> @@ -334,10 +335,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
>  	struct jh71x0_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
>  
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
>  
> @@ -391,3 +396,87 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  					jh71x0_reset_unregister_adev, adev);
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> +
> +int jh71x0_crg_probe(struct platform_device *pdev)
> +{
> +	const struct jh71x0_crg_domain_info *info;
> +	struct jh71x0_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	if (info->power_domain) {
> +		ret = devm_pm_runtime_enable(priv->dev);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to enable runtime PM\n");
> +	}
> +
> +	for (idx = 0; idx < info->num_clk; idx++) {
> +		u32 max = info->clk_data[idx].max;
> +		struct clk_parent_data parents[4] = {};
> +		struct clk_init_data init = {
> +			.name = info->clk_data[idx].name,
> +			.ops = starfive_jh71x0_clk_ops(max),
> +			.parent_data = parents,
> +			.num_parents =
> +				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +			.flags = info->clk_data[idx].flags,
> +		};
> +		struct jh71x0_clk *clk = &priv->reg[idx];
> +		unsigned int i;
> +
> +		if (!init.name)
> +			continue;
> +
> +		if (init.num_parents > ARRAY_SIZE(parents))
> +			return dev_err_probe(priv->dev, -EINVAL,
> +					     "clock %s: too many parents (%u > %zu)\n",
> +					     init.name, init.num_parents, ARRAY_SIZE(parents));
> +
> +		for (i = 0; i < init.num_parents; i++) {
> +			unsigned int pidx = info->clk_data[idx].parents[i];
> +
> +			if (pidx < info->num_clk) {
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			} else {
> +				if (pidx - info->num_clk >= info->num_ext_clk)
> +					return -EINVAL;

What do you think about adding a dev_err_probe() here as well to make it
easier to troubleshoot any failures here?

Brian

-- 
Brian Masney <bmasney@redhat.com>


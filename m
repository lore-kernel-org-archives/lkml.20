Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869220;
	b=SCLzWKLco9htKU8eRflh0aTi2XXU6XGiowTjXUaJfV69lKrX02rTs8n75chUaHpg3jfE
	 qfgxH/co2JJNL0pGt8XT1nE2nx0ajhFAsMKOajewpKjpU7IRFs4LnPaol7fK2BJNrbJs8
	 EBKSyIP5oFmpCpM0ck9vGh+MIUodq8Qd1oW/r1z/08U8145SzDLoNVjNTdR679r6brlDf
	 en8NVlUS1y2Tv23QXFn5EJ8Xsg1U1yFBAG7LvsoKhYpkzupEJ3baL0LFm1vrpINCFH5an
	 HhOHUwg5DOczDqWH6TzUSQ+xtjN2TJF5+3076OoodG119PpY1Jm8J75f9vWpdlzrIfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869220;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HmYOI6OvjM4jd4ffqfJ98NdtDMwj8BkWxzXi+FrHdLA=;
	b=IFSRksnlYnX6/LE26u8jIqbDmfwSRZzCIaXaKTDo3GFNEuDnolgGaRpmlrD8YDyxK4iM
	 D8A/OoyGNuyl5O0kgQymXSLQ5JMmcLV8jdIfrpQK9FgiP5E6Jpwl/Xvz6L9P36fAYgOE4
	 mSfYV4N1ooPIY6hzd05EGdivMvUivAU80fS0sUcrUAMMq0iMNEf000A8nQZRayB25dcfV
	 ZKjVgbiuMNOTsa3AbNrJgR+Z4Yovl/z97sZqCeT+Ptm3wXTDaJHcOgQ3TTzI918OaX1vb
	 nMtn7qi+FsPV6syKzvJkrgmyT7At1jexcI3q+qp++2QAO+N77aTm+MQWNMRgH4RunMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhdiEJuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8BFA0606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lhdiEJuB
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 48E8F1F000C1;
	Thu,  5 Nov 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869220;
	bh=HmYOI6OvjM4jd4ffqfJ98NdtDMwj8BkWxzXi+FrHdLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lhdiEJuBiBd0BhIH1unccaDcRQc8M6TZnRiXcQd710bJzpJ9zdhfPJ7RXdcsacAp7
	 Htk7IlLL65Lkha75/Jv9uyMu2JPeCYYvLgZjPBVrc3j3FPtg4MghzsNS/MnbJjcbx7
	 Ynvm+qIJbcOZsaFJLR3cWE0rmwRS6PXHUCbjluG9wpeGw/1ezC4piW4mDPGbNjvu0r
	 rG3mUgPvC7JJpK6mGVo7NLWKZPn8KgGQUMX+381UBkMOK7eiC+slm5i/qn9M0D4KNb
	 odo99iAm2yHZd2i8S+B3atQig/0dmQwpFVpVv3Qx8BPmYxG+VF1ZMSLvc3S8S5m+yO
	 1G5bIibKZMhQQ==
Date: Thu, 5 Nov 2026 10:00:16 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	WenTao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] regulator: as3722: use the platform OF node setter
Message-ID: <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rc-review-20261103-19-ee1e37733b2e@gmail.com>

On Thu, Nov 05, 2026 at 02:09:20AM +0800, Yige Jiang wrote:
> as3722_get_regulator_dt_data() gets the regulators child node and
> assigns it only to dev.of_node. Platform device release now puts
> dev.fwnode, leaving the acquired node reference unreleased.
> 
> Use platform_device_set_of_node() to synchronize both fields and
> give the device its own reference, then put the local lookup
> reference. This keeps the node valid for regulator matching and
> the platform device lifetime, while also replacing the previous
> device-owned reference on a probe retry.
> 
> Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261102 (2637bdec0535).
> Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
> COMPILE_TEST=y.
> Baseline and patched target objects built from this exact base.
> No full kernel/module-link, hardware or runtime test was performed.
> AI assistance: Codex (LLM) for ownership analysis, code and changelog.
> 
> The earlier dangling-node fix is already present in this base.
> 
>  drivers/regulator/as3722-regulator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/as3722-regulator.c b/drivers/regulator/as3722-regulator.c
> index 85e2aaa1a06b..9bf28e4b9821 100644
> --- a/drivers/regulator/as3722-regulator.c
> +++ b/drivers/regulator/as3722-regulator.c
> @@ -596,7 +596,8 @@ static int as3722_get_regulator_dt_data(struct platform_device *pdev,
>  		dev_err(&pdev->dev, "Device is not having regulators node\n");
>  		return -ENODEV;
>  	}
> -	pdev->dev.of_node = np;
> +	platform_device_set_of_node(pdev, np);
> +	of_node_put(np);
>  
>  	ret = of_regulator_match(&pdev->dev, np, as3722_regulator_matches,
>  			ARRAY_SIZE(as3722_regulator_matches));
>

Same comment as for the other patch, use __free(device_node).

Bart

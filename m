Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964747;
	b=3lkg3Pgva6vNuCRdPl/QQ81rdyBf1AIgTQUWS5fZkbews/A5nznal2ihruzuW88DOjjJ
	 IpTcGRgsF/C6RdPF0qyRQJwkJeYf76g3CNJgYLOOJvOVlI3by4lMzW5hy0c6fqN+Ffzfz
	 FzbrhZST9c+cqMEoy22NsAPmph4o0McbmS5Lv1BNlKCRoreCgqhzGli9sr5opaVPFqBiz
	 McI6Tt3OZrJoQ1j7ytKQlDloKb4VZdv9mKQlAoa0OHUvsYt7+IeOONrbfy1v282ImYyDJ
	 83odcp1GQhbgOX7fesr4B4M/Ig9NgH1BItLd5XKWCY/i2plqek8wdx5Lh0ilROh6y+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964747;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vCxzfrh3q0viOpjyPodt9wvLDl7OKyvDyHqlIZTolkw=;
	b=0JDwXeVvjUjRQdUiJpVJQyL3+LyolmlCNf+70A5df7AS39JgoNvIkcW07Q9a4yi0xjr0
	 ConVkLeNSp3AvyLIuOH628qLjvUKz5C/FfKV4bqM/dEK+qjREyXR6BdGxJFS0IOLqStdL
	 9uV4HzIQZV/27HZ1UQnqOvomFbI0/Vif0uQ2jS3wfV3wMYjcjnLUBGD+COKGouYoXOyOx
	 n8OIzfFFgLepDmAZYaf0V+/xmLtsdC7UGH3Dz04iAcqpFLXVtyeAME8LMwV3JbkiQq4hW
	 xUpyds2OfYfNpwtCDFPGY/zk20QDchXb1D+3mVEa5md4c+27qharDJsSVmmvh+Db6tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXtMhkNY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C72B606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KXtMhkNY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0401F01825;
	Sun, 25 Oct 2026 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792964746;
	bh=vCxzfrh3q0viOpjyPodt9wvLDl7OKyvDyHqlIZTolkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KXtMhkNYnoehSxItXKKJV7yo/sxJfiyYez1Mfyvl+AFlOF79MTC6MfU7C8bwiv0sH
	 rYM2Rb5Hgz5f/FU/DjHcssFjiqZFiV8/hotHGXQzOpPsFfBARTOEiEBgkbUquombbo
	 JD0w72lphUjCqG1x1+duhx2Iq2ILToRzFlpkuatfzoDA18bRiC38mtrMEDdTN6kOCF
	 bVnMEFKULFNsa361OukS9Ej9CArKPfuPnnGqyHLWf7ebr17+k4ksLW7s/y6raSxsOq
	 +tf2PKbtUMa/bOXykFnqlv3hmBAoBJzOaiFJrhTqF84AFiUJ2QegwUGo0A1pVhoxy9
	 A9b1BDH52JsHQ==
Message-ID: <e96837cf-d874-413a-9936-572b4d425259@kernel.org>
Date: Sun, 25 Oct 2026 22:45:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] extcon: rtk-type-c, ptn5150: fix connector fwnode_handle
 leaks
To: Selby Mashiki <mashikiselby@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org
References: <20261025203146.455051-1-mashikiselby@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261025203146.455051-1-mashikiselby@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2026 21:31, Selby Mashiki wrote:
> In extcon_rtk_type_c_init(), device_get_named_child_node(dev, "connector")
> acquires a reference to the connector fwnode_handle that is never released
> on any return path.
> 
> Similarly, in ptn5150_i2c_probe(), device_get_named_child_node(dev,
> "connector") acquires a reference to connector that is passed to
> fwnode_typec_switch_get() and fwnode_usb_role_switch_get() and then leaked
> when the function returns.
> 
> Mark both variables with __free(fwnode_handle) so the references are
> automatically released on scope exit.
> 
> Fixes: 8a590d7371f0 ("extcon: add Realtek DHC RTD SoC Type-C driver")
> Fixes: 842546c56345 ("extcon: ptn5150: Add Type-C orientation switch support")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
> ---
>  drivers/extcon/extcon-ptn5150.c    |  2 +-
>  drivers/extcon/extcon-rtk-type-c.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> index eca1b140a..b5e1a3f3d 100644
> --- a/drivers/extcon/extcon-ptn5150.c
> +++ b/drivers/extcon/extcon-ptn5150.c
> @@ -256,7 +256,7 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct device *dev = &i2c->dev;
>  	struct device_node *np = i2c->dev.of_node;
> -	struct fwnode_handle *connector;
> +	struct fwnode_handle *connector __free(fwnode_handle) = NULL;

Why is the constructor empty? I cannot find any multi-assignment, which
would lead to exceptions. Did you read description of cleanup usage?

>  	struct ptn5150_info *info;
>  	int ret;
>  
> diff --git a/drivers/extcon/extcon-rtk-type-c.c b/drivers/extcon/extcon-rtk-type-c.c
> index 82b60b927..4b1fc084f 100644
> --- a/drivers/extcon/extcon-rtk-type-c.c
> +++ b/drivers/extcon/extcon-rtk-type-c.c
> @@ -1236,20 +1236,20 @@ static int extcon_rtk_type_c_init(struct type_c_data *type_c)
>  	schedule_delayed_work(&type_c->delayed_work, msecs_to_jiffies(0));
>  
>  	if (!type_c->port) {
> +		struct fwnode_handle *fwnode __free(fwnode_handle) =
> +			device_get_named_child_node(dev, "connector");

This is odd. Why do you move it to the top?

>  		struct typec_capability typec_cap = { };
> -		struct fwnode_handle *fwnode;
>  		const char *buf;
>  		int ret;
>  
> +		if (!fwnode)

Here is the usage.

> +			return -EINVAL;
> +

cleanup.h is not always making code readable, so please avoid it if you
do not intend to read its description how it supposed to be used.

Best regards,
Krzysztof

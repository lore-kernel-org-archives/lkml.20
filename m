Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79DE3C277B;
	Thu, 10 Sep 2026 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032323; cv=none; b=jZUjgTApAcblAA01lJGaIG6yjdGI++qGBbf1/ATysrphO6aTca0n9ssMwH88EVrAYIl34jlZsSd3CFeUgbIK6FgGcIXSCNkGrRI6VAGQ0ssj1SsGJRFg1/XHA4rxEQkDJLl9ybFxc+htN2SxHXkuSFzrSMTRGUr7deEoKIul2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032323; c=relaxed/simple;
	bh=8t4lKEKxTZHSEzt8frEyi4f93NxP9d5Ri4mE6FFt/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9Gt8mXaMFa7p9B4bMGOwSBUU1gVndi6Qs4TJzrX1BVsUYP1qjBD5KeAut20Klo+8/wrflrvIfQqTLHlPUyk9uYkD3Xh0SSedM0pyo8SyXPJxlWt2vs9PVxcYUsRyPAl6Hr6OWBqtG01kVoYB1HU5tKeCe2SfsGY1EtqnCFixY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTgfRpPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTgfRpPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CE11F000FF;
	Thu, 10 Sep 2026 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032317;
	bh=zzNaTHn+2bmu1Tx1GyGTGTveKhyOI1exEBvNDmdJDq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTgfRpPqQHHzf3bcBm0QPiXc2X4dnW4S+j6tQc70YGAcOw8WYP9xgixgHNb2LjH4C
	 P/gQgP+pf94wh31+vF8T9l24GxbEjonDNeBY8K++4zM2ekSennagIiGNZwZ+lwcjoX
	 1g4HnpcLp3sXM+Z4Dmbihj4JOIB23ieJSYip6xH1OM4SLM3Otz3VN/Mj+OfZRIllCm
	 bpdNzXaFV1bdH7hbyjH6c9PUBrn5Q4RwGHrINnZv/me9Pr6U1iX58441xlhDbfDFrR
	 N5ApMHjroNgbwfhJmPFpc7Hi4sdgta3FyIBxVge3sLuUkK5VM3rHguikfbcWC6EaG5
	 3m72zJL/hYb1g==
Date: Thu, 10 Sep 2026 10:25:13 +0100
From: Lee Jones <lee@kernel.org>
To: "hpp.iscas" <hppiscas@163.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH] mfd: max77620: publish I2C and OF module aliases
Message-ID: <20260910092513.GM2133376@google.com>
References: <20260905134051.66545-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905134051.66545-1-hppiscas@163.com>

On Sat, 05 Sep 2026, hpp.iscas wrote:

> MFD_MAX77620 became tristate without publishing any module alias for the
> I2C driver. Device Tree I2C clients emit OF modaliases, while legacy
> board-info clients use the existing I2C IDs, so both supported
> enumeration paths need module metadata.
> 
> Publish the I2C table and add an OF table for the three documented
> compatibles. Keep i2c_client_get_device_id() as the source of chip data
> and leave MFD child registration unchanged.
> 
> Fixes: 0d084ee9ba87 ("mfd: max77620: Allow building as a module")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Real name please.

> ---
>  drivers/mfd/max77620.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index c4f89a9..6a624e6 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -699,6 +699,15 @@ static const struct i2c_device_id max77620_id[] = {
>  	{"max77663", MAX77663},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(i2c, max77620_id);
> +
> +static const struct of_device_id max77620_of_match[] = {
> +	{ .compatible = "maxim,max77620" },
> +	{ .compatible = "maxim,max20024" },
> +	{ .compatible = "maxim,max77663" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77620_of_match);
>  
>  static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  				max77620_i2c_suspend, max77620_i2c_resume);
> @@ -706,6 +715,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  static struct i2c_driver max77620_driver = {
>  	.driver = {
>  		.name = "max77620",
> +		.of_match_table = max77620_of_match,
>  		.pm = pm_sleep_ptr(&max77620_pm_ops),
>  	},
>  	.probe = max77620_probe,
> 

-- 
Lee Jones

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BF538D8C;
	Wed, 14 Oct 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986448; cv=none; b=BrAQrVxoWjy0/4Gbvoe65DIF2ZzDvkGrMMpcmRFkYBf4ba2LD81/lRBVc/+SU7Dsd0HLW8gZ74mrYyifTOUchG9y8sLIzt7rJ1iv35mCP2gPGp6485TCYituuOcAgbsgaQSlDQfFTSoLrnHUGsx5h6MKc54Py+ipyqPHJ1noCAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986448; c=relaxed/simple;
	bh=eC8NLukDIpBtuA2KwQr+tWlDW1EMq1FNkuG5GY3Niqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOWmwisEDgdgwGN+BdptQhREAeWRMvPCnLMIwjIe6JSzeipSQzjL/zzb0VLpRFU5yh/hYRE2myXbf5ATFO7zh6io3xPC5rsysDcTP8vRnj9AWLE0hm5Bg+Y5c4i+ki9Ky/dRyWYnOPlotglkLQesz7LE5Nsgym/ngnAbttGKbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmm388tk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmm388tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E041F00A2F;
	Wed, 14 Oct 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791986441;
	bh=fshOZWlu5/9cxLtz9RzAY3nl628bQD8gTsbdb522wOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmm388tk2yJYC+Js/eI2tlGqToe2qgh0bdGayGpszE3Z4TpWzsmbsUWP+vNnv2z1w
	 PZpDWZXp5xdKMHkpXOPtHsjMBLDKIPvVrNcCNTs4uNRm5EcYsxUo3/XwLq9vCbCzkp
	 A6CWiinPVtP33DiOuocr2ETRsVodtNVKdH9i3+OGIA3WpwqhVBlN9v89QnMrEK5rk3
	 YMuu8MI4VMzxuiFK7+s2B6WLVz3EgigC6lwjHeXWh032teHlkeGmiSP/9vG85+iOmb
	 3aaGAA8kWHiiGB6WYC/KEo9W6RaWhPig4UOy/3fOWWPSC/F3qYwn0XWiiU2suG0Y+B
	 WkNmLLO+iooQw==
Date: Wed, 14 Oct 2026 15:00:37 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <hppiscas@163.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v2] mfd: max77620: publish module aliases with variant
 match data
Message-ID: <179198324452.839288.10919510385745503720@kernel.org>
References: <20261014032139.10971-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014032139.10971-1-hppiscas@163.com>
X-AI-Review-Draft: <20261014032139.10971-1-hppiscas@163.com>

On Wed, 14 Oct 2026, Pengpeng Hou wrote:

Please review, explain or fix the Sashiko review(s).

> MAX77620 can be built as a module, but its I2C ID table is not exported
> and it has no OF match table to provide OF aliases.
>
> Publish both tables and obtain the chip variant through
> i2c_get_match_data(). Adding OF matching alone is insufficient: a fallback
> compatible can match the OF table while client->name has no corresponding
> I2C ID. Dereferencing i2c_client_get_device_id() would then be invalid.
>
> Use pointers to chip IDs in both tables. This also keeps MAX77620, whose
> enum value is zero, distinguishable from missing match data. Leave the
> variant-specific regmap configuration and child devices unchanged.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: 0d084ee9ba87 ("mfd: max77620: Allow building as a module")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v1:
> - use the author's real name
> - address the matching-path issue Lee asked to review: populate OF data
>   and migrate probe to i2c_get_match_data() with a missing-data check
> - use non-NULL pointers for all variants, including enum value zero
>
> Previous version:
> https://lore.kernel.org/all/20260905134051.66545-1-hppiscas@163.com/
>
>  drivers/mfd/max77620.c |   29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index c4f89a9681f34792d24c5b75c4b88df84b3c2c66..4947ee96cc62cdeae37a15f65497d7f1013dbf11 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -496,7 +496,7 @@ static int max77620_pm_power_off(struct sys_off_data *data)
>
>  static int max77620_probe(struct i2c_client *client)
>  {
> -	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	const enum max77620_chip_id *id = i2c_get_match_data(client);
>  	const struct regmap_config *rmap_config;
>  	struct max77620_chip *chip;
>  	struct regmap_irq_chip *chip_desc;
> @@ -504,6 +504,9 @@ static int max77620_probe(struct i2c_client *client)
>  	int n_mfd_cells;
>  	int ret;
>
> +	if (!id)
> +		return -ENODEV;
> +
>  	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>  	if (!chip)
>  		return -ENOMEM;
> @@ -519,7 +522,7 @@ static int max77620_probe(struct i2c_client *client)
>
>  	chip->dev = &client->dev;
>  	chip->chip_irq = client->irq;
> -	chip->chip_id = (enum max77620_chip_id)id->driver_data;
> +	chip->chip_id = *id;
>
>  	switch (chip->chip_id) {
>  	case MAX77620:
> @@ -693,12 +696,27 @@ out:
>  	return 0;
>  }
>
> +static const enum max77620_chip_id max77620_chip_ids[] = {
> +	[MAX77620] = MAX77620,
> +	[MAX20024] = MAX20024,
> +	[MAX77663] = MAX77663,
> +};

What on earth is happening here?  Where have you seen this before?

Please don't create an array of enums just to take the address of its
elements.  Either ensure the enum in 'include/linux/mfd/max77620.h' does
not start at 0, or cast directly via '(const void *)MAX77620' and
'(uintptr_t)i2c_get_match_data(client)'.

>  static const struct i2c_device_id max77620_id[] = {
> -	{"max77620", MAX77620},
> -	{"max20024", MAX20024},
> -	{"max77663", MAX77663},
> +	{"max77620", (kernel_ulong_t)&max77620_chip_ids[MAX77620]},
> +	{"max20024", (kernel_ulong_t)&max77620_chip_ids[MAX20024]},
> +	{"max77663", (kernel_ulong_t)&max77620_chip_ids[MAX77663]},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(i2c, max77620_id);
> +
> +static const struct of_device_id max77620_of_match[] = {
> +	{ .compatible = "maxim,max77620", .data = &max77620_chip_ids[MAX77620] },
> +	{ .compatible = "maxim,max20024", .data = &max77620_chip_ids[MAX20024] },
> +	{ .compatible = "maxim,max77663", .data = &max77620_chip_ids[MAX77663] },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77620_of_match);
>
>  static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  				max77620_i2c_suspend, max77620_i2c_resume);
> @@ -706,6 +724,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  static struct i2c_driver max77620_driver = {
>  	.driver = {
>  		.name = "max77620",
> +		.of_match_table = max77620_of_match,
>  		.pm = pm_sleep_ptr(&max77620_pm_ops),
>  	},
>  	.probe = max77620_probe,
>
> base-commit: 319633b06ff2bfc2a7a60d2cfcab2e681a343b27
>

-- 
Lee Jones

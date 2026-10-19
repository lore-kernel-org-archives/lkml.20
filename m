Received: from out-zbxj-a74.jellyfish.systems (out-zbxj-a74.jellyfish.systems [198.54.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6C48DB37
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395130; cv=none; b=ulmDGhYWPlyw8+ro+aEBEF2DOp6hMifRZQO6eateO3O906s2eva0d6tp8E68Ym9nvs6CV+k5j1MNG0gssw+PMyidglJVdF9DfMxYxSUif4uU2r4X9OzrymLOf5r/4VWwmoHr1qM2XXr+cn0Rg9Dxl7EZIbq5QoLPAsdCRVG4aTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395130; c=relaxed/simple;
	bh=zkr9P/yieVGKche40oAQyePfe4vUKpa6+ZShtoZvspI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBmFcJxZF3s4xurMEWO+koVSOFY5xe4FMxCYv4CZADvf+THV/tMsmA/ieqaMNPrwKgCef2va74MNM+YRk6dJF1ALkRQ6a/CVJGr6GzuxR+dUBqOK5GO/tDZPuUsADpp0GfIkLcYbzriNLNA1pUWOyOAGQmmOE4Vm48vBAq6Iyn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=b02TRzge; arc=none smtp.client-ip=198.54.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="b02TRzge"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7S0s68sVz8sWR;
	Mon, 19 Oct 2026 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1792395118;
	bh=ydyG9CsFPpWnTKZ3v3+9TyJH8VRr2lJLleDf8sVV8A0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b02TRzge7IPeiPH7rzBO6itl9G89sv7ypubRYXgvkAO7+uyitGkHtL+laYzQY1jwO
	 vdNgSgM1hRq2mcoCbCyN7OE/cUhBE3QZB18VOjGnNh7nwLK+fK+HUpDwAoYdI1uieq
	 7l73oLgiCYMKxGGGPLBzmI6QP9UBFthPaoHmREw/sl/RQolwzGZs/u0GvXOClfRbuW
	 nY6IDuylt8k63EbpPTK2ZIIuoMFquzGgZgr8G7FxRMSmN6DJe11zjLyUnOnfcnals3
	 8PtToNdUInl89gYTdIgJcwWyPZolssCn3ZrCoKGYzFzg8xVPADApqW1U1RKq85ZBBp
	 n3mdvxn5c8rsQ==
Date: Mon, 19 Oct 2026 00:31:55 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Message-ID: <atXHa8ZhwEaVUlGa@gurudas.dev>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
X-Envelope-From: linux@gurudas.dev

On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)

...

>  static int pm8008_regulator_probe(struct platform_device *pdev)
>  {
>  	const struct pm8008_match_data *match_data;
> @@ -155,6 +222,7 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>  	struct regulator_dev *rdev;
>  	struct regmap *regmap;
>  	unsigned int val;
> +	bool is_pm8010;
>  	int ret, i;
>  
>  	id = platform_get_device_id(pdev);
> @@ -169,6 +237,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>  	if (!regmap)
>  		return -EINVAL;
>  
> +	is_pm8010 = of_device_is_compatible(dev->parent->of_node,
> +					    "qcom,pm8010-i2c");

Patch 2 adds a new `driver_data` match data struct for PM8010. Could this is_pm8010
variable be avoided by stashing the regulator ops in the match data for each
variant and using that instead?

> +
>  	for (i = 0; i < match_data->num_regulators; i++) {
>  		data = &match_data->regulator_data[i];
>  
> @@ -185,7 +256,9 @@ static int pm8008_regulator_probe(struct platform_device *pdev)
>  		desc->supply_name = data->supply_name;
>  		desc->of_match = data->name;
>  		desc->regulators_node = of_match_ptr("regulators");
> -		desc->ops = &pm8008_regulator_ops;
> +		desc->ops = is_pm8010 ? &pm8010_regulator_ops : &pm8008_regulator_ops;
> +		if (is_pm8010)
> +			desc->of_map_mode = pm8010_regulator_of_map_mode;
>  		desc->type = REGULATOR_VOLTAGE;
>  		desc->owner = THIS_MODULE;

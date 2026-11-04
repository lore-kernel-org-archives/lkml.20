Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778873;
	b=ME/eBRpyLEyAg+DA5BKzsoHaEll+QLAj9PuAKdkN8qASZNETe/wrYcZrTJ4g8QIYfUhD
	 LvSbUsbvcDoC58PsnFIWSPb8n84FlknU/JfMF5qLCw6//XfKqqKtP8OhduSmAibsAHs8H
	 5Wz7F5vv9yXZvxJQ1FuUd2V+UYIxU3mjubCwargdOg5FVuVy4CJRTrVSOvst91U3V09Yy
	 N8js5aC5ydbAOxAXC/L8kyjWEvHLfZEU+pPYkfc2Jb6XkMSGPObOVZV5rvpmCbgt8NJPP
	 Gwa67AyXUow+R+BSn1puV4DTmkGdfbEA8DXFkwbq2GHTIIp48Nw8Ci8pjG10E8htQug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778873;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bMhQ8DbH8YprQQtk+DeoV/O9noCHpNTfYAfjMaX8Kxs=;
	b=s8hzGrJovk4Lewt+8BHeNMwESPsUWPyhRNZxH7366rgzE4QgpGuqEwXDILnHUAMx9Son
	 mU0t7GCNd1Q1HZRrFpGi1qW3VVcT+4C7HV2ISSVe8/1lPdxltH1p2dkh5au+uURoRLzod
	 eh3+CIUijaKbaJ/4/R+1sxVLHj3wyklxpeV3RsIvxjN20VicyiIqzs0U2+Ns9IQ1qB0Tp
	 +qvlYReMS7FFM9bemWZpVooRpxDA08FjbjLcnndsTtWUqFxo0tyzEQhuPngSPP4/4vUCw
	 b0l3IJsZRiFyTazWfNgOiL3W+WOiVES/zN7igXn1BpaPeLsgQpFN22Vp4JZw78KdAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SAyLHS8K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D940606A32E;
	Wed,  4 Nov 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SAyLHS8K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BA61F00919;
	Wed,  4 Nov 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778872;
	bh=bMhQ8DbH8YprQQtk+DeoV/O9noCHpNTfYAfjMaX8Kxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SAyLHS8KaxxdieI0W2Mkl49Kr7Ijil77TWsDEUno0l/2ro8neCxtPIJH70kzAeQi0
	 EyM3iaG9m4y/TJVzX0V0r/DK4GrVNDtm+P4FUQNMN/R1BBScd+wtCNo38mbDbIZM5B
	 8WWpAW4aGyyDgsdHkHWcrQVESIqCGd06A/dW+AUKYgrbJ7Zym6DIyMXIc0HqCM50Yb
	 sc4xrM0uY4LN9BVEjLHybe0g0lOvb4f+bo6Q2Yrgst4E1TuAboQH1zRsUO6k83Eeru
	 RLh8RstvnySHlo7SLArZ9JhX47+Uak+tq3woJQANT50ystp42+DkajxWCBGNAvmUS4
	 Cza9HPCiVFMxA==
Message-ID: <6029d402-7916-4076-a463-6ed27dcdcba9@kernel.org>
Date: Wed, 4 Nov 2026 08:54:25 +0100
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
Subject: Re: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
To: =?UTF-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
 <hongliang.yang@cixtech.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?= <Gary.Yang@cixtech.com>,
 =?UTF-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?= <fugang.duan@cixtech.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <20261103074929.1971195-3-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261103074929.1971195-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2026 08:49, Hongliang Yang (杨宏亮) wrote:
> +	data->rcsu_axi_base = devm_platform_ioremap_resource_byname(pdev, "axi");
> +	if (IS_ERR(data->rcsu_axi_base))
> +		return PTR_ERR(data->rcsu_axi_base);
> +	data->rcsu_ctst_base = devm_platform_ioremap_resource_byname(pdev, "status");
> +	if (IS_ERR(data->rcsu_ctst_base))
> +		return PTR_ERR(data->rcsu_ctst_base);
> +	data->reset = devm_reset_control_get_exclusive(&pdev->dev, "core");
> +	if (IS_ERR(data->reset)) {
> +		ret = PTR_ERR(data->reset);
> +		dev_err(dev, "get reset error:%d\n", ret);
> +		return ret;
> +	}
> +	data->preset = devm_reset_control_get_exclusive(&pdev->dev, "apb");
> +	if (IS_ERR(data->preset)) {
> +		ret = PTR_ERR(data->preset);
> +		dev_err(dev, "get reset error:%d\n", ret);
> +		return ret;
> +	}
> +	platform_set_drvdata(pdev, data);
> +	data->dev = dev;
> +	ret = of_alias_get_id(dev->of_node, "usb");

NAK, undocumented ABI. Drop entire alias and do not sneak such stuff in
the future.

> +	if (ret == -ENODEV) {
> +		if (device_property_read_u32(dev, "id", &ret))
> +			ret = -ENODEV;
> +	}
> +	if (ret < 0 || ret >=  SKY1_USB_S5_NUM) {
> +		dev_err(dev, "get alias failed.\n");
> +		return ret;
> +	}
> +	data->id = ret;
> +	data->usb_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							   "cix,usb-syscon");
> +	if (IS_ERR(data->usb_syscon)) {
> +		dev_err(dev, "Unable to get cix,usb-syscon regmap");
> +		return PTR_ERR(data->usb_syscon);

From where did you copy such syntax of error handling?



Best regards,
Krzysztof

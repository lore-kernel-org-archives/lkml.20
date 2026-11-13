Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599238;
	b=wut9BDTQv/e1d9MieugtYzzeCqibwT3NQbheEoDT8/0J+RG7irfiG1zQeYu2R6qpQ4IM
	 XCS+Nn0pMGJLWYTzLjU43Vrmr3LNzFz3V9XllkeR/oVMzYTyBkvEMUSOW1WEstlL7N5Aa
	 5Y5bukMFCNS+0HNHEJRhFEbd7KaxjJkyTkLVoZfdxFTw+BVL6xpG7u84VSM0WymbLkuhS
	 isRKR1UgDVD4Akzeqw3zP7wqGxHKj0/2+oqUNwFzJGDIZyPF8+4EJ+VpqabPjRbqQN4cu
	 g80C7eMgJP+hvFlh2XbdYMjyaVYOdHiuG80DJthwOB3HQDupn8ri3YGRE0VdaiJSxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
	b=Dg9/ffNCLMW0em6dEr0VCo+LKJnsreKFfkLzkXoN4UZChvABTQ38hg/Xr2uvrcBZ55gH
	 CBBQ/sSDb5iJTSqc0G2szpyQt5ZGGIBxUJcAN2MwEGwG4JcAYU3ct9/sgZWHj8uzOH+Hx
	 llSoMGPilAah3FU0SJ2ZoCMYrYl12KuDBLM8Ebj+fGPymrbtqdGN5VLyLcN+r5E2Sxq1W
	 lw/RFzpZmfx4HUrYQc9i0R19ssXD1t2JHOXgJmDQBwOKPx4Ob1NLArQOvZpG8P7R6I6+c
	 0AILbARGenRZKMj7VpMqoARvvCF+0gdo4c4onAfXAhJVpGuJnZTq3wM08BctTo9DzyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB06606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB06606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FGpcEftj
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3720addb068so2185954eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599237; x=1795204037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=FGpcEftjGf/8FeLN5xx8lCOAqwDTwoq4kDQD/mgzYbfy+mu5nR+BGXOJ0a/01GFvSx
         Eq53qQ35WUOg89/AJrzV5OQu5EVEf3qMAdin182glN9Yl0/NWgtVQYH//8aOcdKYqavQ
         lK10NcJw7FiG4CTWFP95gxEDOspGbopsMws5QHEQKGHGVPC2d6jLoeUeDBTfJvg+V8Mr
         Op7NpOmFiIIWblp6grKK+UhaJ5tTzIoVh7hSgqJYlYx9M4ot0z3Ae4T6pxW/hQzcQfPd
         GKjPKAbhFHA12Ato5S20OJM6PdX3IPwr/KngIqGmYk13Znt7ecuUm5ULe5biyqNw5LuW
         K9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599237; x=1795204037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeG8GW29CPTq2V+5DOuKsl8l1CpVGznlbRHng5hlVeQ=;
        b=uYHiFRegzDLVl/yYZC8b2F/GjWKjef/SeyNfg0exWKzqJXVvXb8vbbqBIgqhjMlcqS
         r17Lg4JrmxFlxTSYX8I7cP46/TGS/73ELkn5dKiPa/rRKoFt83APGdT8DzDAdOXPqHYG
         UIgCYPdifGoNeMQ5VM7YjiDTqrN6NdTYCpcDB9Pm/AvdSOoJGgUChiDKC4h2+bkrD/Tw
         DUDLzSg7N4OW2jQfxZm3S96X78EmAQVYLNS0cqYD8S8MoO0Tqyaq6oeXPyYUhXEvkZ9R
         7NFFmvAanWc1Y4KMo4ULR/w6y+MrP5Y0tknIALIaKRow14MH4eqp6gc+csFvUGfaCXXf
         oInw==
X-Forwarded-Encrypted: i=1; AL+hErGibHGs0BVFyArzIyVB1TJ6PeXERga8BMHJDLyOf4aoBRNxFMGhRdVahWvaqvUSj8paDTcIN6vy4vEiAg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1UWapoy88Dm5ebb+AWrbsPNlIj1D0sEsKhUiVd+QB5tJlhnlm
	H4JFHNu84kjiLCG6TtxEslTCMd8aiW5KlQix77HAUqJA3Y6ke83pLUrB
X-Gm-Gg: AYBFou1u3RHnPgp5y4bmBmJVCqm0hPqbptfgarWmUHvKUhY2+DNeEWLwC+wdvVyPZRi
	OWdcbbxJJqrr0uaRNqzB0uak8rYL5LSM06Nt2cFS9pFzZsgUXGI/56zuRJc0CRXl0qJ5MSFU8MT
	MOBMOmqEZCQL3zvl3ThEtPz3i/QIX2E30+842WXbrD79JcNhyflZZNvQfbTukrX1SfzIhMt41PG
	v9R8wSQOqghBSudlTrt7ks2cf84XW/yppG797z0pQclEaMCKXb61sG9Hqy1LDWJ/5ZMTOT0+xLb
	WOBEnxsN7dWoK8aRRGQGogf0ui1w1AfO7+J7uSvVKLM7j3GVpXilVyQkHzopljopGN7xerYig+j
	MFkZlYrVN8vcor3hEn5oY5O7mVj6GDWmgFtksG/vIwozz7If3x04p+MbGDSuF9c3HpYcacltxvU
	FdxBuOJow90VyQu+ct+nl5Qp7sHPG4v0jplu8yrB22q1+ocuJmh9x4eS9iCpxQ7YBJLB6ljOva3
	d2W54I29dPJ1a7YbYcDSxQgm6WcKljNrgKeCHnClriFv4S9yKVuOF22MTGtlISmMFt+pvFZW1dM
	hMYAQBveKnedmz6okiGgZgaHfiRYuy26KeIAWF/lSG/ZDthmpCcnhNappybDRwi7iA==
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr2832268eec.32.1794599236582;
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Received: from [192.168.35.9] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm10172682eec.14.2026.11.13.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:47:16 -0800 (PST)
Message-ID: <953597c5-80f6-4ee7-b8db-ec7264d99e40@gmail.com>
Date: Sat, 14 Nov 2026 04:47:09 +0900
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
Subject: Re: [PATCH v2 2/5] devfreq: Use %pe to print error pointers
 symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>, rafael@kernel.org,
 krzk@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
 thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org,
 sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com,
 kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net,
 marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org,
 wens@kernel.org, t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org,
 kernel@pengutronix.de, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Language: ko
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260912191156.185448-3-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/13/2026 4:11 AM, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
> -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
> gracefully and prints the raw integer value. This makes messages more
> readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/devfreq/imx-bus.c    | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
> index 49798f542d68..dba76d8b9e5a 100644
> --- a/drivers/devfreq/imx-bus.c
> +++ b/drivers/devfreq/imx-bus.c
> @@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
>  	priv->icc_pdev = platform_device_register_data(
>  			dev, icc_driver_name, -1, NULL, 0);
>  	if (IS_ERR(priv->icc_pdev)) {
> -		dev_err(dev, "failed to register icc provider %s: %ld\n",
> -				icc_driver_name, PTR_ERR(priv->icc_pdev));
> +		dev_err(dev, "failed to register icc provider %s: %pe\n",
> +				icc_driver_name, priv->icc_pdev);
>  		return PTR_ERR(priv->icc_pdev);
>  	}
>  
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index 52beeb5b7d65..28d7c595fa17 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
>  	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
>  		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>  		if (IS_ERR(opp)) {
> -			dev_err(dev, "Failed enumerating OPPs: %ld\n",
> -				PTR_ERR(opp));
> +			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
>  			return PTR_ERR(opp);
>  		}
>  		dev_pm_opp_put(opp);

Hi,

Applied it.

Thanks


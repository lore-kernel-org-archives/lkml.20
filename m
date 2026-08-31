Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9D44AB68
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193737; cv=none; b=HllLyTQbT9feHFsuPGzhHNWDPT1yo6z9YFNZSfDkCGHJqQ8HHNwbp6wLV3y5wQOV9JLEULUUod04SnO2wB+tdgKmvdLRFWz9pFfGWyDiRqma1ZQpIhtUUPL/y+Mcf9rTx4rGIIk9Y1Q7uXtf41R0QRMcWQ1kztcW5uqRlu0Cyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193737; c=relaxed/simple;
	bh=RBFdUe9Lqu+3E6HjxM/7EycY+o+q4NHjhQ/1rLOnzpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+1ZyzPGXNWvrOwx9Y3LfQQlB1RuQYb8Xa8NVtoxBiaRb11OnVp3e8MmYJ3Saxg2QAi2RM7zL0dOCMEvy9h9snjDqD65krh0PVaBirujuW3kU9Shxk8QA4pk2OqpxMD8GLUpSe3saER6c1qWZgjo43lNcdCxkvEsr0VJGnQHwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cVvUotV8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cVvUotV8"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f4e1568932so3607930a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788193733; x=1788798533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWqZKH5cJQNgKE7le/WSTlw6Pq/lpoqP4enPlKSIv4U=;
        b=cVvUotV8t4gHLwPbNl0AUFJniJl4drCTxW8s4qKnZo1uH3AAeYJUdaXa/UJ7PKWJDW
         BsMSX4oZSvkeYOV1uGuG5uGLAUNkWyXd+YSO2pSdd7ubXsew9Sj3iJz3Gqza6nDTSRAT
         dCe7YRWtgVLXl6sBVuC4+m442YektGGfoVDjXTwRuXSv/4SbZlYeNKtNhRymIWVoyu01
         w7HO8z/FeUaC188xu/bD+3XqmcGYoRLzFNOPL8bA/qPY7518k/EibzWdoSP31TFVMUSV
         sKUyEHk7VBx0Poh8QW/t0oAWdAM0jTEjS5pLmW52UcEcar6kx/ACFPI5b/rKMKbTGBld
         +rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193733; x=1788798533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWqZKH5cJQNgKE7le/WSTlw6Pq/lpoqP4enPlKSIv4U=;
        b=rtvRxUcYii3IUhDQ79b3ZHsAu0jitk70x3RPKCt0GLs0RY6PHYdDSf/uRxPh+vBplL
         hXZRvld8c3ikdeijxp0Ln8fiG6FWES3rLmtmzFlk+KKguzHSt3wULNzxbPqGUvzWzlo3
         lEUtlrvzfPdhqXYZEaaLnGiyLiiB44kmqAM+LINgCV0W1YYRIM2P8pAXHAeneGEcgH8/
         1ompxrnBJWSli30SNhrXkYLsdP2UkaArXH6LOixX5E6kfbxMrSiAaKyunLBm6whFTphi
         E17dXYAoG5bePT6w/9pMpLlmziXBBXhdk3lNv7usaqz7nteuVYxEmY6KENVmACuXgEv6
         0AQw==
X-Forwarded-Encrypted: i=1; AHgh+RqW/qHgCV/sxsX5jMSW0uU6kNdcfIwuS7xnB5XtdymZz7LCm7DRwFHfZwNJFikmn0EsN9fubSKb33+Bauw=@vger.kernel.org
X-Gm-Message-State: AFuF++liQg+0Y1RWQqR3kkoZEMagsBy8RAqtNDV8AT8GSTqEXD0TZF7a
	MtFi1ZdSzPtQJC1WZzOsQ4nQekBwFc8mnoyTefsZI5r0pCT2slVdQe+NMGi6V5HjB7Y=
X-Gm-Gg: AR+sD11vwsNHQguV/hesJ0m954y8MjmtLn6eEbfwxbImhRz+rHBcSC9NTCB8LuvjdUX
	D+8fqwMo/k837jX5M2VyimuoaewO1AuQCE9r51YB46Pt0SsLpFTwCgc/QWT4Cb3h+o5Z8VO0fFx
	OhhDZtmh5G7dOkIkp6JiKpOIsxalouFCmB2lA7i9y1g80vqPSUWRdwvQ6MId3v/edatJ14LaX+p
	UcKhh2OTsrOu5yozkTVxscmNiqbVuGvbXEp6Y0SRg3LNnJCAj166tuHFZp4TK4CT30ou53/NE5Y
	bdXg9IsU4TM4UHaUTS7001bXWOf93U4oCgnQQdH5x1X1RSCz+Om39+PlHL35Jj8CWSAGL93k3BU
	PIRnQrUYVjkaKUc7Lj51wqgtI9Tmt9rfIOp/YVw4hUjUgBEf4O3zqXjJen4IWcpockntmTQ75pj
	vqJB2PiplsX2FEHsIi9XWGAX6EuXGID3XUxSSMF9PIQVqv8DFTp75/az8Vld6P0XyzPp2A1IenH
	LPOaSjTqHshLtliCkZc+MjBUbP7/m+EMuU3
X-Received: by 2002:a05:6830:208a:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-7f687bcaa4cmr1802418a34.14.1788193733045;
        Mon, 31 Aug 2026 09:28:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:778b:da9:a8a1:bc78? ([2600:8803:e7e4:500:778b:da9:a8a1:bc78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa96cd7csm8181194a34.14.2026.08.31.09.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:52 -0700 (PDT)
Message-ID: <268eb714-2849-4ebb-9f9d-9607fcce3358@baylibre.com>
Date: Mon, 31 Aug 2026 11:28:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824-ti-ads112c04-driver-v7-0-6b3c9c87d0e4@gmail.com>
 <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260824-ti-ads112c04-driver-v7-2-6b3c9c87d0e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/24/26 3:49 AM, Kyle Hsieh wrote:
> Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
> delta-sigma ADCs.
> 
> The driver implements:
> - Single-shot conversions using the IIO raw read interface.
> - Dynamic parsing of single-ended and differential channels from
>   device tree child nodes.
> - Hardware interrupt support via the DRDY pin, falling back to
>   software polling if no IRQ is provided.
> - Per-channel reference source selection (internal 2.048V, external
>   REFP/REFN, or AVDD) via the reference-sources device tree property.
>   refn-supply is not yet supported.
> - Hardware reset via the reset controller framework, falling back to
>   the RESET command when no reset controller is present.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


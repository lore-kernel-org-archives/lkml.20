Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB94137B2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385833; cv=none; b=j06BYlALnfh+cVj7YMwT/+jHQDWWtWOxLvAKg3ZsirfCqxyv67V10iSHtcPvMAWlKq3YjKa2M7F3utKd0GYDB+IQVg0GXVoSHKNHYZolH2045BZfmY0GwT4gqYdqAgIZm84YJ3V7eciZgDIxYW01sXM0hHoP2nmnuwjFCsY6O3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385833; c=relaxed/simple;
	bh=fVFayjc2eOqsSz3WXVu1VPZKmGsi43dhiuYuNC+XHjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0xnKv+mkameGyNiXA17oBUB7ROEzlL3kV6V4y4Dy4oOqXlsGkFl//J81U2VvSrETIkPS/tZVYGU3i29/0QRyNyfU6OpHFvjVgh7Q9ME4KdF1kcqf/ut3sFXLWM0UId2jEezZSt+rM+BdmOAcFUMrM8NOtpaD64uP/BHIWzeVRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHsPQhQa; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHsPQhQa"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso260994366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789385830; x=1789990630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrFobApx96GbKEm837whkFKjtf7GL+qiMSoZ+3ZGcro=;
        b=wHsPQhQaTJzUQzz1qYlTn4P++71n2Iy5bqhx0T7CRPf+7i3lKHY1rexkOlNGQMCwcZ
         u0Si7AN1hryouOPT0nQ0XaHFU17Iz0k837RLoBm0pTbq3bVh3u6e8NjjrxEZo1yzlreq
         1zeFFjjSVCVNE917fZ1a0rcs2BBY86bNkcm8ynrlvONS2osqrRYMOqKc4nbC9jcDbBaR
         8Mo1vHCg2uYDr/G9ok+a/q8fdH2mrPsd4SB5QMrq9jVl5Vb8QjRxzNjhzSrHzNM275s4
         w8KsXaUL4F+uO0EjoogrCOS/Qg7/3bCEvsns7xfnDYsM2h8qyihbpQOc/NHgDu7MPpdn
         3q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385830; x=1789990630;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrFobApx96GbKEm837whkFKjtf7GL+qiMSoZ+3ZGcro=;
        b=n4ZZ0HLpTNpy4moUnAZY5LZdFdqhcAcGnEXI7QC7uFsbkaZdj060km271PLdfNZmRC
         uazmWdMTtC9aNWUhlZRvQZt6cyca6kWV3Qpf9ZjHCmUAVM/URmtsHQTaXJ51oMz1gx1V
         kohoEXX0FTRwA6xyXE8glIfaPWQwCPM9sjNpgqUbR16AhOPcMR7xTrnrZQg+lAY0UYTs
         tKAOzKKZBHFqjYw8eGOKH4TPNeHN2/Nn8Eb92DzrrcS6WGNdSblGutm/ywYV88hxH9/L
         L85aizB+Bu/gxf+6iL+DgypOqZMZlfbLfX5K6EZFOletGV5mfokShy/cSkzkbavmvAX1
         jCzA==
X-Forwarded-Encrypted: i=1; AKwUvBxoW27du/V9n8Pqw1VY96M8G4CPjuRMHMNmz/hMGso2iie0DXUgAJ6YlWBzunlio1KHj6HxnWTEZRoXJPY=@vger.kernel.org
X-Gm-Message-State: AFuF++nvOTys1mXlkTQrDg7cfn6OgZJ54+bGAu0N9OZE04s+l2IK4lqN
	mufNZhJOwPRMLZBpXpJJjhnMOKYcP/vu7Q2V9rfFWMdpbg8/DxNJOCZSEQhw+adeeEU=
X-Gm-Gg: AYBFou3cZnDkVxUmgNERpK08/+0wp6Flq4VQ6UYl9dTqe1kSg0wlQjSlq6kre/itO72
	AC6wakLNRMWnaKf4hnw5D87iz9u11XnUZmwehYi3AqXIH6COjRwsqTEKHjGxPcrhl2nUmiXqVyG
	MbIthSChsi32MewVSBSGKiwiVZM8j11IIY5PvkV+/YQe/UEOIHEFc+m1Tm0r5P2YPwUYCEQ0u28
	h6i4/ipPuE5D1oEEOBfGcyBPv9AnCfqy+zsWOklNYkg7K7CnPHMnBJgmTUY3qPwYxIpJQ/7+w2E
	rgzHJoepqJ0g8KBI20pdnD/rEaWM0ySN3rQc8FF16ktny6Vz081ma5efP6tq8vSjDZx8Sx7coDP
	ZweoPZ2SnbwLWaLkR8OxZ2pb6VFJozdndRGy4FBUz2FK7vLjqrNu/T0Dx+VzYr8orEqWikM5rke
	c2FbCCo69TRuUYDdh/JKj2NcNqmiR18wUuDNjamOzwnQ10OFMj86gOlExUC/aF+Q78l6k0enfsQ
	eMECaZotw==
X-Received: by 2002:a17:907:806:b0:c29:53b5:c69d with SMTP id a640c23a62f3a-c29b86f99a5mr151242966b.28.1789385830007;
        Mon, 14 Sep 2026 04:37:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219ecsm412455366b.16.2026.09.14.04.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:37:09 -0700 (PDT)
Message-ID: <44634913-fd6c-454d-a3a2-6a8d541b2c1e@linaro.org>
Date: Mon, 14 Sep 2026 12:37:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/5] phy: core: Fix use-after-free in phy_get paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-1-f7bd68b5369f@linaro.org>
 <aqRq-xZRIDL1apdI@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aqRq-xZRIDL1apdI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2026 21:56, Frank Li wrote:
> suggested subject:
> 
> phy: core: use phy_provider_mutex protect between _of_phy_get and try_module_get()

A pattern I try to encourage and role-model is making fixes very 
explicit and obvious - frequently I'll ask people to prefix their 
patches fixing things with Fix.

I'll split the difference with you since now that I read this submitted 
patch title you're right, it could read better.

"Fix race-condition between _of_phy_get and try_module_get()"
>> Sashiko asked during a patch review if the existing usage pattern had a
>> race condition; specifically in of_phy_get() if it was possible between
>> returning from _of_phy_get() and running try_module_get() that a module
>> might be unbound leading to use-after-free.
>>
>> Looking at the code this appears to be so, there is no linkage between the
>> phy and module under a synchronisation primitive.
>>
>> Using the phy_provider_mutex in phy_get() will ensure there is a link between
>> the returned phy pointer and the module_get() bumping the module reference
>> count.
>>
>> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
>> same usage pattern.
>>
>> phy_provider_unregister() must take the phy_provider_mutex so amending
>> phy_get()/of_phy_get() to take that same mutex guarantees there is no
>> use-after-free.
>>
>> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
>> Cc:stable@vger.kernel.org
>> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> ---
> ...
>> @@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, const char *con_id)
>>   	if (con_id)
>>   		index = of_property_match_string(np, "phy-names", con_id);
>>
>> +	mutex_lock(&phy_provider_mutex);
>> +
>>   	phy = _of_phy_get(np, index);
>>   	if (IS_ERR(phy))
>> -		return phy;
>> +		goto out_unlock;
>>
>> -	if (!try_module_get(phy->ops->owner))
>> -		return ERR_PTR(-EPROBE_DEFER);
>> +	if (!try_module_get(phy->ops->owner)) {
>> +		phy = ERR_PTR(-EPROBE_DEFER);
>> +		goto out_unlock;
>> +	}
> why no use auto cleanup guard() for mutex lock?

Technically this fix would apply to kernels predating scoped_guard() - 
kernel 6.5 v Fixes: @ ~ 3.13.

Not really sure how far back the cherry-pick will work but I'd like to 
give the possibility.

We can always sweep this file to use scoped_guard() on tip-of-tree later.

---
bod

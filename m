Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC4503BD0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902293; cv=none; b=E5MCQ8u5bj00abc+j4HM+nZXjPUNWHW6GSkstmqyV9JJoD9XXnaFzkTrW4Ayk5Dk8krOUout6rEQ+DqlRsy0NrE7XT5SphwrkjnuHnPxQjBXmuvmeq3Z/SJK+Ub+dxOCmwlpF9PgF5D75RfzkgifIoqslrOehJx5gIlqS9cG3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902293; c=relaxed/simple;
	bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkkmKpU86vJQ04w2V/YpNl8rNnQFETCxu+S1UcDn0tkqbcK3nnvAUZQaMAF5kPvHfBXoMm+mTb3X0q8zu9KoZ6SPNGrwHgZzGxBP0wMi8vsOyt3CwXbS9RwxbtHRsQvpe5KSl+bjcXtbXDWp9cRQmWpYUvm1/JsQd2/0PlymBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b1pbe1si; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b1pbe1si"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so24762875e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791902290; x=1792507090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=;
        b=b1pbe1si2E3iCvTwpnUvD68ItEgscrvhe6z0QxoCT4Lk9Q+AaVPC8gosjyH+hNVD5Q
         n6H3H6tqols9NIuIA8vK8bzggzNpPcL+1V0bGEPaLuHRCWItBkIAQ9vzqCMfqmI9duvB
         W4nkhH6e2QrqNSUtASVrG5tSq1C/73+cYsWeXh21p6wpAk4IaeWDR2AYzCBBlFq2Mfm5
         WqidzRV1LIfUgOjXwc/3uwZ6i0LFczf5l83yd8xX2eh0DMtOI7f9qpSpgmEdMI2xcC6k
         1sQSRAWM9D/zdnr6eMD9aGPQINnLnByV1S5sQnfxZV16fDr/YLuB9ZZqSkP3XJTSPcm/
         VGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902290; x=1792507090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy4hww/bwmxQbL1BwdmGfWhDcfwRm+UBIieq6CF5cl4=;
        b=ynijN+S8bKPnsxxM0mRxyHVKnR1VIt0lYIb2Q4PptNMg4186dJJR5jKgz5VDU70Si+
         Q/d/9rXdWFsEcsg+tqjcZXNlICksEFq3o24737rDnpR0SKIpNjbDZR9J+XxNOLemjjhj
         mlFJ7l07DnqgeIEfBe+nUp5g1EPxIwVZ6QimskMmbOrhE90nUTXyNCeaWY4XyYtU5ZHL
         t7kx0KPPoLCkYTrWxi3xKdEvlpOdxZ7mNl3TvuuIbRLSOT4pRftUKglbW/dt+K7KrlRt
         dtJwhWMFVvNwz3t5Dl0PD9RjmNThEiQ9HuZgz7sOO6hG7MqwQv9uPLcElr6FpiuJ3ZT2
         MhCA==
X-Forwarded-Encrypted: i=1; AKwUvByWc0FF4qVhCPnNqYrnwtimoZmrrRglNS2ndGEcgL9baTsOHz3byl6REYAux2jo9TkAenNuzSRD/2cIk78=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoLWvGs22QEvbM0DObPlQXu3Pde9u4WkPuOR4zIxdLsTYF5U8c
	Hj+nDq362hMlnNV+B6AtUMB8W+gHBcyMcCLtKNs0dBPiYpLgsTfjlzaos8pIxnWE0KA=
X-Gm-Gg: AYBFou3kIibI9v+9UJVwufTr+XTCXXuZ0GWaz9o1XAj36QcXIG3eb/GGk52kFR50ta7
	sPCwIMTsrqEomdCXFsMwuLu4bbEeUF0/ryqyK+JKgjPu8gPiHzRQHC08rVY+TrIZLRFXSj8NlWJ
	LWfVK1fPHvAprUo4r9GiWV93Tdm5zGM6pYDY0KDRtW2p/yTiLrycidl9ZKzN2Eg/N2ktqntXnD+
	YvP1IT0GNzOhzgKr/WTez4nrMdTKIpTnE14xdlrveZw0oaMHvbkcxS+VhRzN0Z4a4ROpeVbIDn7
	fwSECOmZjFalj6+XLD4jFkLHfBPN1ijRGVgO15OOWIXiLonjNZKAqsE4KHjhFfttSYkvZ5qe9yv
	saY+qXKSuNP44J+uEmZ0QiVx9BYRGyRBWK18ki6+T7IO2+Mj0cuwYLM8NfWF7IpYPjzB/R6BAei
	CCQhf0LZV0BwQXFpeAlqlNZ5KLDcuTlInCp+XGzT2C0HcJ+NamIfBopZdhTpdYDle3vhoXEudv6
	HkyT26z
X-Received: by 2002:a05:600c:310b:b0:4a1:813f:2a5b with SMTP id 5b1f17b1804b1-4a18e4a9da8mr235341925e9.14.1791902290063;
        Tue, 13 Oct 2026 07:38:10 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm198277585e9.2.2026.10.13.07.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:38:09 -0700 (PDT)
Message-ID: <4576292d-2c3c-47db-8422-9f9e730cfecc@linaro.org>
Date: Tue, 13 Oct 2026 17:38:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <fe159792-c58a-46a9-950b-6c21d2172601@linaro.org>
 <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <04a1331f-1375-471e-a674-87039aeb0328@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/13/26 5:31 PM, Daniel Lezcano wrote:
> On 10/13/26 16:26, Tudor Ambarus wrote:
>>
>>
>> On 10/13/26 4:33 PM, Daniel Lezcano wrote:
>>> Hi Tudor,
>>
>> Hi!
>>
>>>
>>> I noticed I picked up your series without notifying you
>>>
>>> However, I did not pay attention but picked also the dts files.
>>>
>>> Shall I drop them ? (AFAICS there is one comment) and let you handle them separately ?
>>>
>>
>> Yes, please. dts and defconfig patches shall go via the Samsung SoC tree.
>>
>> About the driver itself, I was about to send a v9, where I addressed
>> some issues sashiko spotted. Do you prefer to drop everything and wait
>> for my v9? Otherwise I can do incremental patches.
> Well the v8 is in my tree since a while now and I'm about to send a PR. The patches can be dropped but the v9 will have to wait for the next release. If you want this v8 in, it depends on the sashiko report. Is it minor or major ?

They are minor corner-case races (an interrupt firing midway through
system suspend after runtime PM is force-suspended, and module unload
racing with a concurrent sysfs temperature read), plus a few small
cleanups (adding `select REGMAP_MMIO`, implementing `.change_mode()`,
and renaming the driver from "gs-tmu" to "exynos-acpm-tmu").

None of them affect normal operation, so please keep patches 1-3
(dt-bindings, driver, MAINTAINERS) for your PR and just drop patches 4
and 5 (dts and defconfig). I will send incremental patches on top to
address those items.

Thanks!
ta

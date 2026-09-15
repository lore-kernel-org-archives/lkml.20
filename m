Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A860374E42
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483956; cv=none; b=YvvjJc44Fqo1FcrF405rOC4U5HOMs8mFBSDg9ThSzN7KSG3ltRfdBEjmosSFSbj+m5736N9fWF8eoEx6mqFUtmIZwTjp4V1EY9ZqiQkGhR4nNmuqdA+e6Dbxv52K80r6bT1/tiad/Enx3NrEmXimbqIrVqhE8WbZosrFugN1WYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483956; c=relaxed/simple;
	bh=Urw5a8upeNm1SOsQTtN4iahTE9tcKv302lbLJeGlBvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HR9sl/U2h5x0WroUuQVxqTB95Xm4B1/ba16wZSuwTSLP5AETujKOtEqJh37hUmr0mEGpOuyryxTdvNuYCb6h79aVoWgAxCfcdhkz6mTuSX9zuCROo7HYObFMl0jj+Rof75YoQ0srjtKsa0UbLKckn+BVWNsMA6qTy8hUSRKpoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQ8X5Qhh; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQ8X5Qhh"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-4678d3e490bso796985fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483954; x=1790088754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=eQ8X5QhhOM46iyUktsSUkhYSgljZiZCM2zspXqspnS+CCfuC2Xp93tqnwObr/Tj/Qu
         33lJ90qcHWx1YV+13fJuaUl7RIT4kprfqG/oztRMm9NdTiHUysIb9EqFOMACBvbAGKqU
         Rcn5SzF1i/nWbM4H4WQoqijxG0NxGY6l3/mxyx0iEmE0kGBVeQF6Do6T6VC57BZVf2d+
         +tpq0+sbOqMQHOmqUG4ClfJ2PKaee4TmHATFdMnSzhsV70xiSnDle3egwwQTwpSTVL/V
         w2uYm2pjC3L/Oe2GdixRCCwDiL40nH3UHcQo8hNpaR0e/1Y74KYujCFix0xgRRE9o3Ho
         GcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483954; x=1790088754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=kVfsSD3NGWFKo5InIzhp1eglqiEo0BeXWNoBlAAp2/42JX1c+Z9XQRS5uqJHE9jvEd
         +l7wCgd1sH+pUz0FvaHTMa1/9wO9RZe8qc5q5uziNsipFlmLeFQ9Wf0t9cPCtU+Tyd+L
         fQBAFdznDaL4M8hqd80l94cglyhRF1VvPXDVu0BT7y+NSzA3VH3KRb2RHU+FhxIUAuTF
         sBrX3tCHO3EcQtavLkctgkBkydMwQ2HUI6TeAa0cnLTPdzkIEbzyLFJCwbPBoFcG9gGW
         e2hU8aFwfuoeQtgUkapfSlf/F/eXpkaHPf6/NAXr8zJ89rnEJlJd4IS0P7Eb9nqe0l8g
         j/ng==
X-Forwarded-Encrypted: i=1; AKwUvBxHAgeSZAt1PWwYVRtOjksNlEYae8qDaxXmFuIzjvHypgwn/X+0NKsnWbADGhWwFoNoJv250rxgwptiuwc=@vger.kernel.org
X-Gm-Message-State: AFuF++lkJPehkSkS6uc1yf6ENThNwa2HdjOe7kcEkIQ/bAhFqPpQxnYX
	5BHtWHj1DSkDCRvIazyfeDDaPXnCbP5LJFSZ5xllz+UHdFkzOXrMAp6A
X-Gm-Gg: AYBFou1qIITwzew6rA7UlKmLz1/MGW4t1zrBo1HxBYYIKbfV6LAlyxIoYVGwJ5gGldA
	XQCSgJf1PV6QKtS1EfpuvEF2qvdkM3BbJAcWYNF+WS1E7TV9py9nIipYMXzM52rsy2Br77w3a/1
	ccY1JVdoDnFxSVR9aAfCVP0D2mK+GregTtdRj3fj0vLanWObs855oQbmSdC5sJ7HaWmtN/JS4jm
	PTUZR3qCAwJj5fcCdog0X/hGe3e/Ca7D6enxYjSLRzTH32F+enRFctf5yY8ak21Ztp4AF2UPEKv
	cmwCH7afAWfL67gLMzHTR9IbeJPS9LQOZM4x091n3ThArtpREg/35g9fuUUE8sMsjSCoW8hN4OQ
	9QgyxdHPsRjB+KwcqLCDymduTkZ9WPPF7VYr8X070t006g5A8mDDbY6aIx3cAq5kJu7mmeEVSo2
	TyOP/FMSqEBxThbsNVM/uEt/fGtabAFxw5Ok4tRDQfYUnG08DbfS/2KvI3SPAvmp52NOCUCX9wh
	h5sYFHcYijv8Y29
X-Received: by 2002:a05:6870:459b:b0:462:e12e:c561 with SMTP id 586e51a60fabf-482e39ea87amr2549366fac.4.1789483953749;
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df86995d6sm12588398fac.6.2026.09.15.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Message-ID: <2791fd80-627a-4353-be41-213240e207ed@gmail.com>
Date: Tue, 15 Sep 2026 09:52:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
 <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 5:39 AM, Krzysztof Kozlowski wrote:

> On Sun, Sep 13, 2026 at 12:23:46PM -0500, Ryan Brue wrote:
>> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017),
>> boe,tv101wum-nm0
> This tag is applicable only to one patch out of tree, so just respond
> there instead of causing scripts to get this tag to all patches.
>
> Best regards,
> Krzysztof
My apologies, I'm new to kernel development, and didn't realize, but in 
hindsight it makes sense. Thanks for being kind about it, it won't 
happen again.

Best regards,
Ryan

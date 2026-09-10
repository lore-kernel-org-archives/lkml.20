Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DE4718CF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076339; cv=none; b=ayH31T+62FQM2b2HBOFy9Yj+eIyYBoq0YmOJbzscKqJ896d4zwtq8hV9QupBvVPmINj7dEjdCn6wGEJ3yvNAOQiXHD5eZdynU0+HVq6oePumxWxAzFl7upQpQT67sqaHNlBvxBPtmyIZwu1SAPYYa95W1J7hQlN/U7qpBhY06Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076339; c=relaxed/simple;
	bh=IhoXtIPy27R9nmeBtoMiaiTsuzKkKC2i/cZ0nUhc11o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=olUxRRUl18/avadFHroGVwGiHyu5dZVr2OXdtrTkvlLdgT6rI/UDT4W33jvtYGTtWinr5mP++wH1Ygk4tHc54HqDCfDdIkP3OoUY7nZgNx4T+easq/DhOrTxiEW8m8vLMOA3jZruJDAZzzQw4/sxac44qei/6Dr67WgsP9bGEQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pqm5a8R0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pqm5a8R0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so2834335e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789076336; x=1789681136; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=Pqm5a8R0mXbgsDDL/O2/yW2btDZvs0/DjC75To+H/bi1ZD9Y2sdE212B0dvDbj2H+L
         L9eJV2i7ByR1aMWxud2SJnCkbUChCZzAdR72vxUFoHx5Wt+vvbd3d2aqAthw7nysFL9r
         4V24TvlahaaGRM8NrCPUuQTHipOOlJz8UflPAY4kdmcszc6rKeRy+UDZ9JUlAfU5TpSn
         8YD0sFf0uepyqOL4dDU4kEW/t5DRGJ3JzWu7sVYi+ar6w+APWvOqmPvtqUGhHJ1cMYD4
         +4/vi7qgC+GiPZuqygcxp9ePvpjpUJYuUgYSs0E+hXV4VGa/m/4dsAPbzXFax3t9V+N3
         gK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076336; x=1789681136;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0occsfLmodcsn9s1z8E/JBq4kBSFx1YK4S42OPyg7Rc=;
        b=H/V8ZZLJB2efyEyRTRR69An5Q/iYID2jgxJSEvoBwqiVX+tKPRoFGMP9p6MyXntnGY
         DEwiddJyqIgMfUOcgN+DDZZp/UnL94bLwYR2N9AgjL0kqQplJuuM1McwBDAgIrdhFu49
         x+tpRA7oWAaQ0kQVfL9SfasIt5/J6fPXKJi5zreyNf55DMWQp0CUeXBk2PfitM60mnen
         E5FAegFFGDonszdoHrYH00s1p+WSrilzCs3F8DXVnzvKjRxP7MvQ0zUy1e50pm/bouo7
         RSNZas1iyRSPjVw6lJQHgg9WaHBembm0WMVYOS49MnGR62nYYSqQZect8ygtLsiq++vE
         i2yw==
X-Forwarded-Encrypted: i=1; AKwUvBzNKZU2L3mdRXTh2UR+IwvIkwUEeWExR86o+rCJWMhZVPWOhLprNhbG2EzupnTIm1aUfDMuul6mOkf1IYU=@vger.kernel.org
X-Gm-Message-State: AFuF++n7Q3GXNgML51i3u3UUCLKJczampL55WicKKXe0bOefJSuQiPlt
	5bxAkyg7CBx5G6+I6h4JgwwFB2bJ+4B5SaYjvQIMXo1ib73cMMZKqlCvPBHnae3VWqo=
X-Gm-Gg: AYBFou2a+NBJ1Cumbp4UT4rH2gHXHqzeuFWE2AN3rnboCSmEvsk+NKyNIZrM8Yd/NGq
	G+hKT71QBDmNj2jK0yxxmGYC7rEpxG73JT2jNwpwPO9+FkwfveyjdwhNUKj3v6zC0YNltqwKdDx
	jHl3Pe1C65+8MzmqG0ymWNjOhirjjumVzmCJZBwR47d2F7gYjXeyJw2Bkrh64R6TN7FevZJFUog
	ui0ngnYFR/ZbEN3oxGQSywYbUy9CWANY+u0mE9ZBZn8gnR/GmNJCwHVepPhEg3JKOv6mrfz4A+y
	Hb9sHpGkTRRwqzTDB52J4Rf+vepTXL6ZNxusb/xmu5Q4/UhORyURU/0Eg8qkk/rDM29RWpnLrsI
	8sHB768woIAIhNHVE/ZAK7l0BuBI1AKR3N+CHOcMaruHQ6tAIsD059rBEZhcLnfOqxWQArJJiJc
	oruV8fapuEP7ZforYe3HFxGmutORJkU19pjvCBgUpA0EuSrtyrGt8fngCA3MOQH4YlhLHrZEUlm
	nMQmVSPi3lCsOfoEaspyj0hNCCmoZSLuaZTEKfy/yuvf17VflwkQZOPR8gQ
X-Received: by 2002:a05:600c:1385:b0:49e:2a61:a17b with SMTP id 5b1f17b1804b1-49e619a0905mr8799185e9.5.1789076335948;
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm4434585e9.3.2026.09.10.14.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 22:38:53 +0100
Message-Id: <DLBYMPDTOM7N.3I07C9Q0IJJ19@linaro.org>
Subject: Re: [PATCH v3 0/2] Exynos850 ACPM SRAM devicetree node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: "Peter Griffin" <peter.griffin@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org>

Hi all,

On Mon Jul 27, 2026 at 2:23 PM BST, Alexey Klimov wrote:
> Hi all,
>
> this is a small series that adds sram node required for ACPM communicatio=
n.
> Bindings update adds new compatible "samsung,exynos850-acpm-sram" there a=
nd
> excludes it from having child nodes and not required properties.

Gentle ping.

What is missing here? Should it be split into two separate coomits?
There are no comments for at least a month.

[..]

> Alexey Klimov (2):
>       dt-bindings: sram: Document samsung,exynos850-acpm-sram
>       arm64: dts: exynos850: Add acpm SRAM node
>
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
>  2 files changed, 7 insertions(+)
> ---

Thanks,
Alexey

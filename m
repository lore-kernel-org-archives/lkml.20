Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832073;
	b=zrMC0zfd+zl824wT9ugrXvwTflqz7mBkT0dQyQJOi5WR99e2ZUUDMEN0hHbwK0CnD/pf
	 vhNg34ya1Ob073Jh6Ao1haQZFTCp2QgWZZpKjTmob8j7eXA1V5iTXBgUtLo3dERPnGk05
	 Hq6ffGFIEA1zSSuOCRahZ/NaPvu+9dMbMcIf95t8iSrTg3a25E7IwBrWpFgT8Ia6p1e2L
	 DNnI7hC1RriSgimWu9cUN+vwMP5Oorei///uW7149BQ7IuTtaSgsv7Rg1W5OCYGne8uQn
	 vDntZYwaeC656DISSkz2aUeCGlZiu7uQGeHv8lrmKv3AlqB68hljakfHh18wsNwshlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
	b=W2jyz4/aFv1ky07UdvUAdlIolPobOKjYEJvSuFmfQ8OmBGuysPDEPu8v0Di48QhyUuv3
	 51xoYXHvVPC1E7rjIBD2gR9CtU6G+/n1CLMPqPEMHmYvVFTejcMHx9Y8s2hsSBBET+XjZ
	 9hZuJ2I2BfaSOhS/9FFM9FOxCqnF019joFr6rdQwr9Lr9PjlPx3hU3LvFjPaPLqtV6ohh
	 31OJPMUKGp239QeWNEnY5wAh4xoBA4QCIn01gKopJpOPD35SihVvJ8ocTRJvfAjCEcuol
	 chZcyuCoDwoebKUbrD0NAF+OVSK+r9vvpP0jNc4g3+klKN7KUbhvOxrfCBDHUxmGDZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E97606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VblTHW8t
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10193115e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793832071; x=1794436871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=VblTHW8tFX/DEh57e325ubcAiELluEymaW2vTWJuEEHyAuM3tm7KpOyqmWbQG/Op3f
         Msw0b1pJGBWgfSh66KmwWzwckkRp6IePhYqHGIkYUFna08m/hgJZd6QQDswNo0PXVObu
         3CpiTQiXj5E4+WZdskOIi7h0GjU40neX6tFnJ8NY1Sd2YVcZ12618lqLKskZg/T6dbYn
         mYxG36peURPv7BA0Mr/ughxR+KzpZXsw9r8R5fYIME9yNHAVdz8a9PRP1fQI38oKuPrd
         TvSa2T9416wZnCTTXJcP9uSG4Dwf2kTo0XZoaNmbIxIBmJpoHEd7hhkaTpqcR0TqdV4M
         46Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832071; x=1794436871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nW6715EtFswgRm8I9cbPPt4Or68BEFqTuXQQkMmvZ0=;
        b=j/HDcOvjon5AYR6E4ySlgOpU/mY4bOzaqF8rwnmMeTntzpzyP5LQ6+dlvcuRYbviEz
         HJsIfwFVbW+4jp5DQn04m1scdMYws09rsvUsRVT/9JGalO5jh2Kza5v29De7q9DXBfgi
         hb1mUCX7mFU382yzQawJp0ZL/3HH2EViy3tkw2Ha0aDnxLdD3QeTYNI2kRwz4y30sGh7
         Qd6Sagf2E6OFYH68FtIYvRpB6XLBoFOm6wAf13Py+H+VnW/KjcUj13zN5dHTNSJZxm9R
         7UEK568LYIWWsmOkMatqIMhEdSTaacHC+7hAA39J/BGuaIweqNHw7GcfEy1TZUJkyR+7
         oEbw==
X-Forwarded-Encrypted: i=1; AKwUvByefzC8tA4hFdkAp5o8r6+pMtmGibcV8qVwjeMgbuTUQ6VPA1pB4ZGnxkXvq522SJ3Fo3Sc3wo+oxGtZwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YgPhDkRT0cU8nMouq4I8+GI9pXz+k18QEUUX1ipVi9j+mklIp
	q5thnw3KsU/bjL4+nzXrXd4vy34KZRpT/SsAbR0fVIMiO97huHkdiT3pZbVYaziuA+c=
X-Gm-Gg: AYBFou0PJ1jvgM3v7xJ0PDN/Dh0QxlpUDJe61kWO5QuzQx00Gk4sO0V3V9IwpSubZV5
	y0/jOVt3X3Lm81YfPUN3N/fphmcAirJgcQRgfINiVmxeE9rlY6aaVo26KZoT5qW9Jt2P9kGELaW
	3XlxKPBMEIS9e5Raf22uqcYks0q/Hyxp/3/3qCa9gwz9FXueg1hAnviWijvJ0OCjIJZnQfr0LP5
	fDmuhWvBzx/um3Hj7jrBctl0QkRem94ug5pMwYE9vhDTf9jUwFsN4UM31om9J8J2NPYAHd6+Q5m
	+duHibAaUQEBBUztb76sD8ZUo3I13BifgVjvZ2m0aKvwBzy9O85OfxzyajBiGVBNXznt1ieccXW
	2GtbxeCwbC86Kxov3bVnYF9GqKmn3taSNz/0TTVkxOvg4D61bjb7WKz3suOQdM8HbUl+MNIMV/n
	BJn9mynDWcW/QoyD4K33aF879tfSmfJJMmXPVRyn/4QcV24JU8leOegyQXquq6uDP+Gc6XKZN8f
	JI8MFStAjB3KSwLVhv+RMkZmXcQGngUcZeVoWRbNifSa7NE0wziF4dxwWRHGoREHbyIAPCZu5wv
	gfTM4wlyXiTnHctZw9wlqt0Zun9GYVqS5hezYrZD5Vzs8r9V7jCDg6ytD/1ATX0=
X-Received: by 2002:a05:600c:848c:b0:4a5:dc5d:20f7 with SMTP id 5b1f17b1804b1-4ac175669d8mr428288325e9.14.1793832070829;
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm16013915e9.12.2026.11.04.14.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:41:10 -0800 (PST)
Message-ID: <ca9d806b-567d-41fd-95a6-daa6aa14d7cd@linaro.org>
Date: Wed, 4 Nov 2026 22:41:08 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:54, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add qcom,sm8150-cci as a CCI v2 compatible, with qcom,msm8996-cci as
> the fallback.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0e..b545fd2378da 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                 - qcom,shikra-cci
>                 - qcom,sm6150-cci
>                 - qcom,sm6350-cci
> +              - qcom,sm8150-cci
>                 - qcom,sm8250-cci
>                 - qcom,sm8450-cci
>                 - qcom,sm8550-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

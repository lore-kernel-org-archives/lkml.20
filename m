Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC694EE87E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858279; cv=none; b=VrisHmVdbSc/612zP6ZhMjYprlSSb05txCydYeKSFrdpukH2QJIC5IJqaAaMiNLY9r/9rEGZTNLRJv4iA1KsjKWU7dTtyA5HD0HgDotSILvy/NCD3o7DojXQLLeeU+5bvdfNzhbJHg/3N2OLx567nMQKdDzXor1PWezhAwAQAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858279; c=relaxed/simple;
	bh=fd4uQRKYnny77/Bik4CEh4j4GRWixJylCkkRTAY1Z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqxmmtbvJQsWalv5/kTQfzSD7GA33MY+9OSWwRHJ2pOUsPY+yRhWzpAkM68iUgQvz6F85jaOdd1GrGx8Nk2sXaK6FEo3qK6nWIH3PAGOTtp87kodyhvtYK3AeCxFbTHPQ+3W2QrU5zxrik6WEva15TvukULb7vWXvc5lNoKiiOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aT3We8aA; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aT3We8aA"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9c60b9so64594266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788858275; x=1789463075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jOiAPr/lYhowaNGed4DcrBIROTXHsiVna6rmwj5qtY=;
        b=aT3We8aAy41hynQfTPrxSM8iyaFXUWCRNsRvgh2rLxnU2E+n04JcPC2k1Vou7vbbF2
         N/F/NTDSZQ5GgmyfsjRDJ7iRwCR9sw1+KBKRYjVUuGycioGLyh9KZnP0nzUqGR54FrOw
         buM9o66ckgCOaGdhfSV8fdJBMy1ZgTdMC1Fs0Sb4l5h0JES/LEup/LsLifxgCn40j70P
         hftRTKII4JWsIov9GFRHCbLiVcwejV4sdp/uKvpARvtkybnr+Da4is8urf3yT4s6V5ad
         f80gMSGYgPPvi/DIUy1VUbv+geGqZqe9q1vz6NVRLSowy8iu5BlvWg06qLh7paEPPVze
         EVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858275; x=1789463075;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jOiAPr/lYhowaNGed4DcrBIROTXHsiVna6rmwj5qtY=;
        b=ogcBvFkEF3+5NJF2pYIDrAj0CyjloPvcZ2i1GW+iqvVBBdI20cmJtsUPEwrDRUx01h
         B1wCoMvbivzCSHFXr5OlIqIUCw/jEoH0twuotYvTznHkn+zJ3x+i6LyJdgunv8Xnn2fC
         Tk8l6nghNnXl//JfY98ipLqiqDImsUkiXq42M/FVg4wlKOk67uzOkrOgfpxae0SXmssM
         E2OKVGJm/4Z3qfNW0FqeqJf6TM6GTBw02OSyX7bTeVnLn36tPbhxdJTpQrFhDHUmhZDl
         WFxMTahEhr/w7iPhTG+ucpLMgfbXG0yBapDm3dEzDTQhNxSrf/CzoxNslWZL9oSfx1eA
         4S0g==
X-Forwarded-Encrypted: i=1; AKwUvBwv+QvcqpJWa+bntVFUdDz7ft4xTlx3WL9A73tcqLNioaW+flxl2qBd07RSMbK7REeQ1oYapYZGMXaji1g=@vger.kernel.org
X-Gm-Message-State: AFuF++lh61kViebi4lTk5zxCIRP5MuTu9KIAZibk4ka/DvG9f2izqL9f
	OJjLguogY/+5Z3Qws/XDObyGPZ0ttWNaWsjwTj4GO791jRIm81A8mUsyKgf/kryhUHk=
X-Gm-Gg: AYBFou1MniF35p7H1CpHCiqB9dkEFgHFle79of2EbO5LRcJoK6xHAZ/idGzdAQKqCdi
	xEji2Z89oq8+p1m8+hrvPq8NPj8tU4GPIKeJsi+L2NH+rN/aaOoF2KG9hZFivc175izZkht6Rms
	qvjdLJazuv7D0M+tLfc/lGJkv7M6GmQtIH29AkCVVZB/xocFC+uukwgG1pOmU8BNdx9wdrtbEm7
	QsOsYPz9uTqmrYs6c1lJy9U0ugFOeuFntPjodDZpdgJdi77ybggo+XM5tE6QvV0oo78Zv3QWckW
	nsZXw+Z5j0WfEKZ92SdGileD1d3hO+Z4EISAOXCd2e9d2q/6q4shkn4JrlbjAukFjrzDlluMb00
	lcz4OSlsr6ZIjKNwvRTjWvwZbOXnINWoAa1MhCeIG16W1TmQqsxzq3Tf+2/+OpDidWUU4eEfcF3
	KQihudR+MCqdk3NNQUlKgaUrhHxQ14PNc7THJ49eIHmuwoD7uAKKlO/tq5GwYLxHedVs5k0VkG
X-Received: by 2002:a17:907:1c81:b0:c16:6dac:a008 with SMTP id a640c23a62f3a-c2904315bf1mr256440766b.8.1788858275130;
        Tue, 08 Sep 2026 02:04:35 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm580109266b.46.2026.09.08.02.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:04:34 -0700 (PDT)
Message-ID: <ac084a5e-2767-45e8-95d1-db623c80ee2a@linaro.org>
Date: Tue, 8 Sep 2026 10:04:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: ov02c10: Drop duplicate register write
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <Tms-fUHfw0sPf1-YX_rgSNq7z1MNyvtfCImHXhxAUQAoTq-fwKvZF-p8a3ozCxAJ7kJCo-lKEU_JSkfUJy6oIA==@protonmail.internalid>
 <20260905030732.39196-1-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-1-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
> The second write is redundant; drop it. No functional change.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>
> ---
>   drivers/media/i2c/ov02c10.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index cf93d3603..6220461fd 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x395d, 0x05},
>   	{0x395e, 0x02},
>   	{0x395f, 0x00},
> -	{0x395f, 0x00},

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

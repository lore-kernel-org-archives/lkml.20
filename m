Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870405;
	b=R/QyFxpMczc1kmG5UK9VTQgnd1aBIegazSpnAJ8PSAX5XfNVGbLpaFJcAuF0cCv4xmk1
	 +T+L9IOPckXow3Ky0/oBM5v/MFsr15g4t04ffG+lBlvzDojSLyftgiaHRkOy7Se0tTrWl
	 T2W4UMC0Z8iwbrB9Qo8COJI99yebd/vh2ejycFy/Kwa2HRUfXCWWcv9kPdvB/ebtqm4tk
	 WImEw5K2u43g2KYTr1N8WI+hbtmnnHqtgBvbyQDcwiIbnZ3Vlh4HwlO/4n/cAZuBeJLOA
	 gK4G9XJ9MUHfE7N+fIC9DRXVym0ImcZmXguDGjykWhit6Mfvszy5J1D/RlDbsN9H1og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
	b=hDX5bGD0kbbDtbiZp97QAThm0AMSbBYXq+CK2x3wPeniF42oaqsxs/++WGBMpmfsksRs
	 OexBHDPtAw+/b4lp4vOb1ScJITMtLB5brZEMxMueIJj5ELz2iEPKV7FEaiFseyzxY7OJx
	 JA43kc3LUWw6J5EhcNn1kwrGyQTd9lvcyIhM36HFpS0fnTMjHhA0JK19ufQWLk1BdbYVV
	 PA2/HRWcks4j0xMqKDYCT+dWAJ0e4elbYsJxwFPISWgqaGhL71Pfa1PsF7irMOn9FQSDY
	 GU6D7/tP3cgHH3jwoPMWFGsuPXOhScseVtQXTc1FbNeidms5nJF8r8dqvzW6I1tU9ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2590F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nUPwfzc0
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso410665f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794870402; x=1795475202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=nUPwfzc0SJy2NglXAMZADWXP3O5XbEar5kuQ3ZaYgCEL9BAo9fYukYwP3StBnAf8AO
         zLsw2M5YP1aDg0Tm7JVz6VjqXm6NM7cJdngFa4ZpLYB7Gr8rv8yt9NBOWvIqBxn2BWgM
         ACXx/XnBEa6oBhTILZAPLYtCUBYhnVlNiKjdZct9HzpMg4wkDKQJdA7gWNc59NY/X0xE
         FOPLomTGmQdUgXh0st7q+ycak/5Xr+kiEofhqJrrex1EhPXFYwGcpaVFnx6jW5ul8Y5A
         t/LB127BgKZw6eSCvIbfCtvh19aubqbrjS6Fvb7pPKdZbjf3CuGwYi+LwoMX4RbQjlqj
         02Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870402; x=1795475202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMRabWLMCSHEq9av7y6ywR85Ullm7taZPfMTAVGFuHY=;
        b=lO4bKrjDyxhqhdT7G/+Pe7DBK8QdBCxyKD57qK8gWNIo2gza3Ce/NdL1p+blhfk5Oj
         I7a6jEOpz6PBv+IPxFZ19WU70sSIysOwv6IlGL4zkcvOC+Ix7TMW7jpQYF2FjMh1bH3E
         oihvxIiNoAv4qVJH0isuw433tgq1i5e7gtaUMH8O40C4t219h8kZgiRg02jjRvwKQrvz
         RVVoVnTjGHsN9oU6NheGlyZkspAeoAHbIZ5sIcI31NgVIlRSo0P//vGn/qoFf6XiJL1P
         Bue4iw9AZHDdGt728lB7offSXVpvIY1IWbAIK6P2IQxya1qn6v8nk5qfShmNUvGnpyfV
         X7kA==
X-Forwarded-Encrypted: i=1; AL+hErFtanJIbpXWrQdDX1mPEliaowEvlLgCEWaB5iSnVCIKOJbDWghH/t+1Cz4oHZDqzuvysBpRaX2JHWc6u7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wRMdcD8vD92HVBJ4Y/ZrT6Us24M9kOvYh4XlVyhjAw3IEzfxP
	Hvu7wp0ShQuqwxLpk4dL72UIr/2zIbsqSpWGcYR397AagyoeuDCuEfC+7uxPUEBJXQQ=
X-Gm-Gg: AZFdTZeqrr3xYvbMZv22zYdp5T8GTiNI+jZBQ9u8FmA6Hiw8KFkyUuI5tnq+G0HCBTJ
	l8olBiz1q8YIyic3fbIToP/2BIZmJ94kEu2m+XoB8A6DCzyEtPXSxjlV9FDjJAZZqbmUAd4fcJt
	ejRkB8MyTXuFHD4nz9ADKhAjxevik9iSky4rTETCRhhE1B6v1b2WcNy6mrve/bxOwjfip03H3w+
	9kpuKgcg9Q6HAeRR3zvKOV0mApNE2Fm58qfubBNm9BrfjlOOfqdRFvcqB35lgQ/bkVETRjgbqss
	q1zihNz8wp28uyy7SAID7l4egJUSoHXQRUgqZUpIAb30eAxJMON1Sp6T8JWGUAlABcoAqcmMOog
	ieBwIjM1VnEG9ymJqBpKTZBDMaMjUkC/zYn2EXKL73/2zZp1MnHqc8fIV8BIxVGM0vzY+EAbUky
	8zMIjWdDvHIt8i8Rc6weTjGg87tV8P9/e+auymF5uJB8uk9KSwm0ck0NLhXobCPfHH7gR/MzC71
	E/9kYX7uS9/J32tdrUrJ73s3Q+vo6Fj1m4gTOdofaDCAY5yeVqihOETUBkS3D3XKju++KaA/brk
	XcYl3eYAdScUjD1VSz7yz6U/a31rJ2H6
X-Received: by 2002:a05:6000:2288:b0:49c:6a45:ca33 with SMTP id ffacd0b85a97d-49c70ed923amr27070236f8f.9.1794870402452;
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm24359908f8f.18.2026.11.16.15.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:42 -0800 (PST)
Message-ID: <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
Date: Tue, 17 Nov 2026 00:06:40 +0100
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
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>> +               return meson_card_set_fe_link(card, dai_link, np, false);
> I suggest using the "audin" prefix. AIU / audin seem close enough on
> all supported SoCs that we don't need a SoC generation prefix  in
> there to handle this differently.

Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the 
compatible?
If so I'm not sure this is allowed nowadays. As far as I understood 
"meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says

   "DO use a SoC-specific compatible for all SoC devices [...]"

-- 
Valerio


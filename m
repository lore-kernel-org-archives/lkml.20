Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A123DAAAF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587646; cv=none; b=W0mXYKKWeIOvVM8YuPG+USt9STnv4ddqI5YLnP43L+RjFM+nuQROPGJItgY4stGwZwmfEpHVgQzgd0l+3+x6ol7Q0RFVINDjbY6j/1vSf5LM+iXesNGGKsK2bUv6NPoF7XC6XzxRIjWMCHirnZwVH6Wzob5FVe0ihk2YsYCMT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587646; c=relaxed/simple;
	bh=3ZSLLTasKr76GEJrzVSyl+Bcz5oJzIQqfkWykCzS+oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddLV9R89eZUkwxUZYLFLXECFz4RU+HysD4mNRzvlEumE7HAt0NVR1PBctWzae2X4QMA5mmuWESsSTxguRCRBp1HvCTJvMFHFXE1gMvvVKmvI9KE/fvUmd5BaLKe4gCSVuTvrqWXpzlIIy78BvoSzNU5hBNNb2kJTgHMQ5WPk97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KW2B4n4B; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KW2B4n4B"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-455ca262ccbso216095fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791587643; x=1792192443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEvNFYjzpJm+hMocPX+GyMaf5UQXS7PHxcnAyw39Bg4=;
        b=KW2B4n4BDcBYuF1mXpP0ncaOy9a8vjalps7Gm52gK1XwhuSSqRn2K/dHZzTOogsNTW
         8wY9tsSBNKpM4/PyH3nGXJD1uxHWjQbN6VjwgbX8D3CntW+S+u+rdseAz9dV1FEhErHi
         MYgTa0/cBBPIT7FtAmZkoHKJM0LdooJTT/shmanq93u378fXytodA0MIaXkD6zmElZNB
         f6QN7e5HTIk2R3F+sVljUTyYY7O+ac2BB2O/ePpiKPv7QsDyh1IGXB7rVgY7lpJRlv4C
         FtKmvOBhtwhzVzIbjobxi7KnGr5NTOSuELsvJK+6tfzBxT2qzoI9rbVntnW4xtbgEGI7
         N8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587643; x=1792192443;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEvNFYjzpJm+hMocPX+GyMaf5UQXS7PHxcnAyw39Bg4=;
        b=1InXDbpnZFOhKzxY9has/GblhLz2ZSPb7vUjzi4GaIZEn3lDgbHZgJRWiw01yKMPbK
         2nXhAKwfY6piQ9DI3MRnKmF6F41kYec+TeTF8qBEFYOUJePFZZV4cWB1dM/Zft4pmLwT
         rsa1HqxwIWWFiI9WW8v86JMPJJbJnC3Hmc9KnO1MxpGYC68hWgStvvs0IGRiDcC3/3Z6
         50ETxZjAXZ/D1QxIzzIG1vyMAT5Lbpu3JYXCibjjAvbsKFCNWhonHhwc3JWl1cAdNed8
         JuxKb1KSgxfA107vfl+NQwQRD2z2NFXYmUO2kEyHjQMmuZOkksokvHH0oM+f9J7SfsgP
         QCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTMHqrO+EA6V+nrfTZeg7Ag7emycQ9mV2OVHLsjcd3WlSxIzzdWtFoWxfL4GYyevnkKdl0SNYznzIRzs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpPcPNJacoQFFGzu4C9emZ27b7jMIIuPxy/w7VJCl27yBJi0G5
	eL80ZFgd1AN2ibW93RMv3hb5RQ/8gCQY9UDyOy+fd4+8LFPZbwHWMctVMphQpT5Xk/w=
X-Gm-Gg: AYBFou3lSwmhY47h26ntz3AtSpwhRNwtZog9u+LIvc7BLJL6fFKKz7mY/kh/YiOsCjA
	Fl7XHQte0ITxhzfJ9ouEvJUUlQTnzN1VkpmikB0SKAh+IHsDqYrWq0filu6JrquPxYYQ+1+Yx3S
	VWnZg8OPa7+1lBzUtSh2Jx4aLdEa0xhXN5MBfs+V2t3j1AjDAUZIQ76NiymN5iRbQmMHh00SK4w
	Ecm6zPJ8ykqBDhFEzQdCxz4cV5D14RP3AgVMZxXEGH82oGd6XYN6r09K9VumKToCbSwGYvMKzEA
	YXADlbnx7E6r5NH1llnfW3RkH7cbxnccxfyFNxixRci6mD31acNo+TpsoA1UJEAvtQLOHsNwEe4
	b9x2a+P3R83sPUIVkjVsCnQuMRrNBxBBP408+jPq4LQBwcsLUQQUgaIfMRIvzTi+Oa1oqNnSQyh
	+1RZz8ShWuxHixoVxiauZ6lNEbOR8fIe2Az9WVq8wmXWQJ+3gLO+Z8s+u72I/gDkJSMPy/EbWSv
	1mNIFmEAyBOr1Ji3DGFcGJ3jQ06Nv7Pkh03OiA2FRKm86rn
X-Received: by 2002:a05:6870:6586:b0:49e:16bf:1f87 with SMTP id 586e51a60fabf-4a2a8a7ad2cmr2643174fac.38.1791587643522;
        Fri, 09 Oct 2026 16:14:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:29bd:56f6:5ae7:35d2? ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a8592e2dsm2982529fac.13.2026.10.09.16.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:14:02 -0700 (PDT)
Message-ID: <7d542de9-0c87-4a1f-9d9a-48af8431cba1@baylibre.com>
Date: Fri, 9 Oct 2026 18:14:00 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ti-ads112c14: add gpio support
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>,
 Kurt Borja <kuurtb@gmail.com>
References: <20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com>
 <20260926014620.3b07660f@jic23-hlaptop>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260926014620.3b07660f@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 7:46 PM, Jonathan Cameron wrote:
> On Fri, 25 Sep 2026 16:50:47 -0500
> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> 
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>


> Even better if we give that helper and the mask shorter names.  resv probably enough for
> reserve for instance.
> 
> 
>> +				ads112c14_reserve_gpio_for_ain(gpio_reserved_mask, pair[1]);
>> +
> 

I tried the shorter name, but didn't like the way it looked (abbreviations
didn't seem immediately clear what they meant to me). It only saved two line
wraps anyway, so I kept reserve(d) spelled out everywhere.


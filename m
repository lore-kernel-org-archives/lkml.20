Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309269;
	b=trE2QjEgxyfXptZXkkaqbrWk+ZySV5YS7xympVzNACWiSgIsQH1vRXtSnC4tM8H4E7Rw
	 iBOL0aT6htEbUCehDm3k5lqidpPoiNnn8EGt9oYInJCIEhOA9jQ3dfs5iigrCPzMTkrJm
	 /PwrqQvmptkCbTrnZ3A8z173JYa0rianG7xjOVhUBDspYWk1/zMivDAO8feBek1qd9ZPp
	 2qQhtuuEFzL3f3OpWnuzf57sVNWe6UGF2pl9Tr/xZf/GAqMyGBIAXuKTDjd+WAmP71aqS
	 8PCley7rPtfOrhaoZb8b3Aa8IoLr4XNFTYqcl0ZrWy1SzKII7v6Pnss/ZfS9gn6yNgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
	b=ZVef4y32pf0XnBHuXHkssiGWQlx5nfCRRt8HNQ3tBr7EONPcr+/UcKNMh6JHQBEXFzum
	 B3c/TFcRUfvpiVJxLCUwHHGLyGuHG28oF6b1gS9a1gyEPbI7DbmCnqF85oC2zYlWuTkyH
	 E3h7OU2naQuvEzwNFUIqlxPmxh6c8epgHVxyQWln9nGXvxhGMnmspP8OqHcbetwwOtfMg
	 Q+wckI8OpSihXbQYXwHqGb6jgs8pLMfYJ37OmFt1Z6T3g8uKrPqJ9wkGdLo5nL3MID1Jf
	 okfjxJRBnISJ47R0WIPgQqMyXs3KbM+7VUvOrfdzuzAYw+YiOunQgeKy+fmhegIkZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hGfUAKuo;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB5F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hGfUAKuo
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so14139955e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794309266; x=1794914066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=hGfUAKuoU8WVVrATySszgzvOyBQWURQjoxAYcusqxr00mbG9lLJ5YurmZyaZAXWbrs
         O400VeVYivYCW8fyu6+Dvqp5OaVfYP3myT2OpkOoGR0u3aFVFEoZGejFSmaCwvEiIQkZ
         roI6fjGYDwpgzcuTHJ7Las8b62EneeV9ghLyUXE6VEZXXKGvWoPQdPnLXNTH0Hpp8Jk6
         5/pklK9B1N9VubIaExX3gN+ZT0YRWjBR3/6srd/2UZT8+0xNEoLQH8Gc1AeBou7Thu17
         iUhGpyGKF4A8m4u7sMhEu8srrwTsUDIKh0rNLG9LyufE47ann7PBBKyDs9e0T8GyxFiH
         VSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309266; x=1794914066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=sdYRJsh/7Xy1Tw8iFzgSbuQUse/YkgK3PLTue89DfSEN4E6wtehZe4HIZxL9pW0Ik1
         RFy6w7zUNzQkCR+wpc+v5AgxoBPrW6/fhD5iuS5q4ea86+WyJ/tuApoktl06jZ/J0GmA
         2US6Ex3E9AiHzjphB+axZFnfau6uXDJxBKmp8yzJGiT8EQbQzDdP0I+y86J/L6/5ZNAA
         CoyBvepD7jMz8ZNV2RJs9OAZ78z1tITypwA+46VXkDJihajIfI3/li6euJD9UBOmE+79
         9rrMfHCjnrgiL+Q3bG8MG5gq+a4LX+3KrpLoBg3FCq3EbMDl4v8Yc6DbGqjWLv2jiqPI
         jm3g==
X-Forwarded-Encrypted: i=1; AL+hErHcy9802POYev73gxuRE2unhzw6cOInFWxbGu2RMPvbIRPKKTjPVh6DH+4JnrmfL0CnA7tF+eLvMtTSabI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bpi7U8PEzf8TayGA++LuCJkGQzwfE1QnU1lJjkpdqg5/7gpa8
	kJnMM25dUF3/o0YHFbzgA6+ZSGeevo9X2PQRtlQDHISeEraL5FjMXt71gsWNCd9YRes=
X-Gm-Gg: AYBFou28s4MT50YYOgJhM1RGpSEZoH6RVI1HNp5zfSUbR/b+U39XU+dqCh4sRNr/FFy
	IZjq/zvKhkiEKDgp1XX8WdEXUW4b3OLttHPHWrJ6qY2iwdcCB/wNPP7nP70m89bM13YBQBme0gH
	eSyUjZJMKKLWmh5a311n4g+VHa7Qr66QYO/sdx2iBhD+7C4+76ZrUGirKDXCrJWK222v2H7Sykm
	AGqi5ihE9frsrJ7kNIv7D3xwdbV6zgi7frugEMeJGQ4T/QZDJS8xhLGqTBsnQ49iXTIaR9zDmcb
	2oLfnCgi5ullAHbbcXuq0OoTT1V7hLY0s8Mri/8HVg/hx0cQOI5efWl9kizt8wiL0ilaEER7eGf
	gmdKq9OluliJ+oDTF6120Gl0GHSS/fAiOOA7uDRJVAp+DbnxN2rTM4t2Fn9F/YMbpYyVnwzjjvO
	yLWlGn8EO9U3PixNjnvOB0Zg/6U47IA3f1mAifUQGN7RZMdEFgk/g9elbn+5kLqCaeYxAQt5+2i
	N5bNUTjbyLQYoeu/Y/Z6mHiNE/V0SrJZEm6KbUSJ5NpVkperyvRJ1SnRwYeW3rFViKg4nK63wmb
	uYXl7Zm0oyHlfCP7Qj9RiKkI2WWV5xoU
X-Received: by 2002:a05:600c:c16f:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4ba0234e2e5mr35596445e9.26.1794309265823;
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm4366683f8f.44.2026.11.10.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Message-ID: <ca4c9e4e-80bf-435d-9f55-18f1a38c4472@baylibre.com>
Date: Tue, 10 Nov 2026 12:14:24 +0100
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
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
 <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/26 10:01 PM, Martin Blumenstingl wrote:
> Hi Valerio,
> 
> On Wed, Oct 21, 2026 at 11:52 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
>>          if (!ts)
>>                  return;
>>
>> -       mutex_lock(&ts->lock);
>> +       spin_lock_irq(&ts->lock);
>>          list_del(&formatter->list);
>> -       mutex_unlock(&ts->lock);
>> +       spin_unlock_irq(&ts->lock);
>>
>>          gx_formatter_disable(formatter);
> The documentation below states that ->ops->disable is called with the lock held.
> gx_stream_stop() does call it with the locks held but
> gx_formatter_detach here doesn't.
> 
> It doesn't seem to be problematic yet because aiu-formatter-i2s.c
> doesn't register a ->disable callback.
> Can you please still look into whether this is a problem?
> 
> Also for a future patch (not this bugfix anymore) it would be great to
> have lockdep_assert_held validate that the lock has been taken (inside
> ->enable, ->disable and ->prepare).
> 
> [...]
>>   struct gx_formatter_ops {
>>          struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
>> +       /*
>> +        * Following functions are called with gx_stream->lock held and local
>> +        * IRQs disabled so they must not sleep.
>> +        */
>>          void (*enable)(struct regmap *map);
>>          void (*disable)(struct regmap *map);
>>          int (*prepare)(struct regmap *map,

Hi Martin.

Oh, good catch indeed.

As you correctly pointed out that's not a problem today because the only 
formatter currently present in the tree doesn't implement the 
'disable()' callback. However the upcoming AUDIN support [1] will use 
that callback, so the question might remain.

Technically in 'gx_formatter_detach' the formatter is first removed from 
the formatter list (with spinlock held) before being disabled. This 
means that other start/stop actions cannot be called on that formatter.

So even though this is ideally safe, I think that moving 
'gx_formatter_disable' under the spinlock guard is better: all the 
register access are MMIO (not sleeping) and then the behavior would be 
symmetrical with 'gx_formatter_attach'.

Thanks also for the suggestion about 'lockdep_assert_held'.

I will send an updated version with these problem fixed.

Thanks for the review!

-- 
Valerio


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851245;
	b=scVNKp+Et1mplGA6batXIXeWVV9L49IrM+r80f9TR0bmyemGSRUNIlEZ0F7GTCZNCis5
	 OIXppu8HVc2tKfF4+OISPKq1vUsCsKzQHlsaj0dP9J+qNIW3BI6VzYwsPKRl/+zmzzdoU
	 5fgG+2Ap5Gt7sN/hZZGCdeO0JiOZjgXVyeNCLm5JGdKnERb6SP2AW35/zLuaKnDY1bQjn
	 KW13ms32Oprq/0vn6Ic7ypabfl1ST47xa8ht4qH4gvnWiCJHxpDH6Usk6I0lmknO0wDLR
	 Uj+0IhkrKkINPMs/Wm93m5ek10LmeaBeOgzvQAJr14KwOG5y6w5LIIBnpieToEbdggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
	b=jDndlZTisetkWMIhVAdldsugkw2ky6XetO0OiKvhVt6dCnqJmKZ7oMpq/ZRnbgFcFZju
	 +ck1O9XPYo/kVNRLDUlzdlNI3zIKVnJLRnUTqktLmXVrNKT4beJHIL+bEnru5P1JjVLCJ
	 T/y68J/Vc84latYz8P4Y3jMMCfXyRtreIvQKuf48OVgJlIJb+EI0CYr0ltSLMddPOD00f
	 t3F53hrjVbjOO8xQDEuH4dUDKelBZd2jfx31WP5VnoTkvkR3Ngu38L09onkaRs+9W+LE4
	 gIrG7Ijlf593B/YPqKyp6nETes57cdEJ0J9bX3yq+ScnFDciFUKK+vxRRHpLj7t4J8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=PCDf4AFU;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A19606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A19606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=PCDf4AFU
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70094949641so1563418eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792851243; x=1793456043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
        b=PCDf4AFUPcoMwJEsPToZlvA0AbfeIIch7rSzbwffG46to0WMd5aPQAoV4AKVNTqT5i
         pdwxW94j3PfUDqtRzzR6pgvgpreJ71Qh8ix9Ah1NCTMbOxHxT3kY5Hu6DWStWF2DCdl/
         hGtbwhtwjIk5RWHJ1M6qR6gi2NXh9raPgLaMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792851243; x=1793456043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RurSR5QCrb3dOlmzaugDAkyS4iQBb3WW248QweZw5e8=;
        b=uNdhOZO+xm30JCAR0WFaq7fA//ygQm7oEcqk4GhVm9PRFOcEEOdUxlc/9Q8uI9b6mP
         nSkVWU27VxjbgiHF506UuJVEOjAyicAnzBCdYEP12vNjnGmnfBi6zBaeA8VbWhtT5Om2
         4CnNkEenV3yuuJmTgBSp7sO2APsuqeqtyzrZN69N+TE6LqcJ/OHoL76FJgK67UF2MVOD
         XPAA2hh0xDFg9T3WTO+aRL4V1f1rSJpUBIxom7N0XG5+caKHgU6UHaftYnD4mTdSqGjk
         jf+KCG2t6wdPnoqpYIM1ZCbbTPPLHhFxoMHREolMZivDno8PjpCB1xBMSsJu1N3uzFzA
         FObQ==
X-Forwarded-Encrypted: i=1; AKwUvBwua6/UQfhHcEsHdxRDoJpP0tNpTDLlIdAhZRTG6mUxKyAXwfU7FDHMdgJhi61/3LPweTWhQvyRJTDyXuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbUEiLnd0ycWhftIF6eSBLT5MEYaSOfP8n0D0SjbyxB8deZbGL
	c5MwgoZGLTxrrOgLQY1Ze2wzw0/miS6CVp0VH8GuEA4kOV0v7ZoebS23Vp8us0dgaQ==
X-Gm-Gg: AYBFou2qXHfF2st7Og62ba8GQ2QWdKVO1IiIGQWOD/josIq80o7FKRTiKooEKsoc80Z
	MV6a+B50JDNNr6ofaig3ESR/BFCrvAw3axVTRsbRuHu85ExUW+LvrhWRpZ5rQ7lbBVgk0vRItXw
	lq2IeG2W4VDCMWWV15tDqxCa450eu7lnsKT9m8dBBmjz7NGR9i51Z/uKaXH4jdzy1CZaSpO93DF
	PZTywTSnjuwauDrTW98tHs5oRFlIGMCIousQYVBkz2VM+QXU+CC450Fgx6VGnvYbO2eDUfUQseV
	j+rxDiau6oDJzeds3XxMPvAGmFUtwWDUnN/E2IqTTJ3p+FAk6aLrHCrQ3jyin6skeqn2BUi8Dlf
	jVL9GJKSW5aZZZ7gTKssZc/YvXr1vBeVoJvmViuKwVtxDIGdiYdwxC/hDosEDGXmo1Z+tIMNGWJ
	euAAoAIA9Z5OzoEuFxX9Y6Y81wHvRHXjwMFWWOLyPgmObhELl/Sa3NWglbVWG7RTphhJ1sks0a1
	aHePVAsMMBJPpRaunEUz/prorCjWwqplZArrNEUaJr2LJnR4mFICG+8mE+/SUANaSk6SBIn/pyD
	eBS5PA==
X-Received: by 2002:a4a:e907:0:b0:6f4:e301:cc28 with SMTP id 006d021491bc7-70ba0e91903mr844092eaf.24.1792851242978;
        Sat, 24 Oct 2026 07:14:02 -0700 (PDT)
Received: from [10.211.55.5] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-850fc0fc7a1sm2509401a34.25.2026.10.24.07.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 07:14:01 -0700 (PDT)
Message-ID: <3d919bc5-0fe0-4afc-a5fe-12c0ef1989dd@ieee.org>
Date: Sat, 24 Oct 2026 09:14:00 -0500
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
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
 vireshk@kernel.org, rmfrfs@gmail.com, dtwlin@gmail.com,
 pure.logic@nexus-software.ie, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <77adf02-43a9-7621-a94-9da41f8c5a56@inria.fr> <atuYWuWeqvEG6j4B@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <atuYWuWeqvEG6j4B@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 12:24 PM, Yalagada Pavan Kumar wrote:
> On Thu, Oct 22, 2026 at 09:30:26AM -0400, Julia Lawall wrote:
>>
>> On Thu, 22 Oct 2026, Alex Elder wrote:
>>
>>> On 10/21/26 11:34 AM,pavankumaryalagada@gmail.com wrote:
>>>> From: Yalagada Pavan Kumar<pavankumaryalagada@gmail.com>
>>>>
>>>> Unsigned variables are printed using %d.
>>>> Replace them with %u to match their types.
>>>>
>>>> Signed-off-by: Yalagada Pavan Kumar<pavankumaryalagada@gmail.com>
>>> I have reviewed every one of these and they look good.  Quite a few
>>> of them--because the size of the value being formatted is less than
>>> 32 bits--would print correctly no matter what their value.  But I
>>> think it at least does no harm to convert the format specifier to
>>> unsigned in all of these cases.
>> I was suprised the compiler doesn't complain about this.  It seems to
>> complain a lot about type-related format specifiers.  Yalagada maybe it
>> could be worth adding something clearly invalid in one of the argument
>> lists to see if the code is actually getting compiled, or if you need to
>> set some config option to make that happen.
> The files compiled sucessfully with the normal build settings. I also
> enabled -Wformat-signedness to check for format mismatchse, as this check
> is not enabled by default. It revealed a few more issues, which i'll look
> into as well.

I think you might find that "sparse" complains.  Run your build
with "C=1" to run (by default) sparse, and see if it says something.

					-Alex

> 
> Pavan
> 
>> julia


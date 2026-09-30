Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BA2F7EE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760953; cv=none; b=Zw/4SsV7nSVpka0jqLgNxBDfIldNoDxpQjhjGgAnCmMlW4ikp8b9a4skbbLNTQGgH2ls+xCMmUh0cgexFu/d1Da96FohhXNAWGRHP07XXarP9EBZOfSjKyCAQSb5Y5kRbGKRhjXTwKNYCvzaTXT+cG693kTzPWLT+NVrLpnKgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760953; c=relaxed/simple;
	bh=bL/6QZalbkaeA7VZhKey1mioozKjprKSM8N14eru/Oc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DyfpKmC7Z6RQ8dwdQfk8thPyvXcWZbcTLbFLvmmEOJdJaoTff37J3/f7gGSdKr57vkzbSDUeUmtvLJScWzYOflNmDIwucp0arf4aCyzc+xMjCU2zBOi2PKShreJH5mH+VuUBKWXF6um/IKKG1ElVpW27D1Prvt1bpGb6+jFc480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=I7L9ZXbY; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="I7L9ZXbY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GmFmoHcXTe0n+WMVj76Jj804M0wcTKoxpS7YPckB+Eo=; b=I7L9ZXbYl8uc+h6HKbwF9jhS05
	Gy4wHAKLtitF9jr2AzTPSzK7ixLqzrBngGEDIiM+GbXaEfMI3uqStnpj4dJsjVqNhruLP8CUPAP6R
	XLIxFxa3dILciQ+Krm5QETpUMBBE/EeCqE6lX7Agql8AMeYWpnmtcRKVlIJFO4jPj4Wk5JeH6X8S9
	WdUUbZpntqLg7DZntopUhkos+02tbVHMZEWVYBZOhQO7GloF2HW3aUJTwyEBh2hf3LQqh2fXd94Kq
	Scxkr8qTfGsK9vTgOGAV0IdwmkXb0jv3r62brPLlEgvGTgoWdrb9WSwNXpKHQ0WjDC+56wz0OkUBS
	M97kgW2A==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBqj8-0071N5-2c
	for linux-kernel@vger.kernel.org;
	Wed, 30 Sep 2026 11:35:50 +0200
Message-ID: <13fc6905-832c-41bb-a5fd-14021320037b@bitvisir.nu>
Date: Wed, 30 Sep 2026 11:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Visir FIR as IIR Filter = No GFX Card or DSP Card Needed
 (Supporting Fair Pay Philosophy and Low Jitter)
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
To: linux-kernel@vger.kernel.org
References: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
 <07b34ea8-6eea-494e-80c0-338ccf9b8bea@bitvisir.nu>
 <4f248225-f188-49ec-af80-5eb6c4c684af@bitvisir.nu>
 <fb7abacd-6893-4beb-a6dd-3feb301e81e1@bitvisir.nu>
 <3780cde9-9d76-4db1-8330-52391943d60a@bitvisir.nu>
In-Reply-To: <3780cde9-9d76-4db1-8330-52391943d60a@bitvisir.nu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ASCII gets kind of poor on this one really.

Rather see: https://bitvisir.nu/Visir_3-Bit_D_A.png

Serenity.

Den 30.09.2026 11:04, skrev Ywe Cærlyn:
> Example:
> 
> Visir FIR as IIR filter (fast):
> 
> - Anisotropic (Can be run via Cache, for GFX Card alleviation)
>    6 point, lod bias included, optimized for retina and fair pay politics.
> - RMS (Can be run via Cache, for DSP Card alleviation)
> - Constant-Q 24 dB Analog (Can be run via Cache, for DSP Card alleviation)
> - Resampling (Can be run via Cache, for DSP Card alleviation)
>    24 point, optimized for ear and fair pay politics.
> 
> buf1 = buf1 + ( - (buf01 * cut));
> buf2 = buf2 + ( - (buf02 * (cut / 1.3)));
> buf3 = buf3 + ( - (buf03 * ((cut / 1.3)/1.3))));
> 
> double fil = buf1 - buf2 + buf3;
> 
> ..negative "pole" gives a zero.
> 
> Serenity.
> https://bitvisir.nu/
> 
> 
> Den 30.09.2026 10:39, skrev Ywe Cærlyn:
>> IIR version (fastest) can also be modified for impulse response decay 
>> optimized for zoom.
>>
>>  >>> mid pole negative in sum (making a zero).
>>
>> Den 30.09.2026 10:36, skrev Ywe Cærlyn:
>>> 6 point anisotropy I think, lod bias in it. Perfect for Retina, 4k w/ 
>>> rYb pixel, 72,7 minimal psychovisual noise refresh rate.
>>>
>>> Serenity.
>>>
>>> Den 29.09.2026 05:42, skrev Ywe Cærlyn:
>>>> Here is some graphics on that one aswell: https://bitvisir.nu/ 
>>>> Visir_3- Bit_D_A.png
>>>>
>>>> Den 29.09.2026 03:52, skrev Ywe Cærlyn:
>>>>> Visir 24dB -
>>>>> constitutes RMS, Constant-Q, Anisotropic in one filter.
>>>>> 3 poles, 1.3 cut down pr pole
>>>>> last pole negative in sum
>>>>> IIR typically for Constant-Q (minphase analog) FIR other.
>>>>>
>>>>> Used via Cache, should abolish the use of GFX Card, and DSP card.
>>>>>
>>>>> This is part of supporting my work with Fair Pay Philosophy Unity 
>>>>> and Low Jitter, for ITS.
>>>>>
>>>>> Serenity!
>>>>> https://bitvisir.nu/
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
> 


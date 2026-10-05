Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050094AA1D7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210674; cv=none; b=AtmkTLwRT6pptGSHCKBB/Unu+6msVtmpCGR2s9OFqcQjOjRdLwS1ler8+2l9jDLlzOmF6IGP0HZ+K3KbIAcJ/xAWFACG+TqnLKsdh+aA/WyI3VHDCZCvIrVBsBUKWrCJTo4OcNL+wJn28YEkrmPtbNkoHM+fXPLzJgzFB1V+UT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210674; c=relaxed/simple;
	bh=ZWO44zYglxObWKrg9VAmyejiQtca2OgElhSwJQyh46o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HEGifpp1+UvIB1G+X5wNr3NWOeuKkEVkwunOpIa3OInBa4Qzb/sFJ8hMNC10xTeiehtDHCwb/AS2rY4Padn4F3Tk4C1TfNGEUxcuCJpCN4gJa+YwuEVjuuZTUSbQG3EMmaW96j13wPjwz+4AIrTU19ezF+m0Wr6lEi0gKWEoLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=GRufFDNO; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="GRufFDNO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DAte4IqVEjYLg+XdlTmSsH1wYJIesu2F1xWb/GwU5Kc=; b=GRufFDNOuVAHyF2dfwK52Rw+Q1
	dvsENtLtgDwbclISfF750PGMwN7JvuhO09axx/K+Wv18Tpmv+GQ2/XXcV36bFhBgqwqD0BlAUxf75
	b8fgVpX9g9U4cUH7+ATEZlXJKgpGJRCueyjaK1OIvC5BA/D35BQfbEMuL2DgQgz5CO92APvQ0U9hb
	8liagoO3urmcOfj59TaW2YYzZ21QAEsoZXahs/YHTSb8/BlE04tVLPv4y6tBfQ9gquicc+zxeX8DZ
	AcgiEyDz0xv+97HhkRJtS09sthZMefkIXzzxiVE8kBEujD6taNM+iJzk+tZPwfoMAw9oeUHj60DJ9
	2SscHPbg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xDjiX-005P9n-9i
	for linux-kernel@vger.kernel.org;
	Mon, 05 Oct 2026 16:31:01 +0200
Message-ID: <57810a51-ffe4-4dc6-bc81-a51a181180ea@bitvisir.nu>
Date: Mon, 5 Oct 2026 16:31:00 +0200
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
 <13fc6905-832c-41bb-a5fd-14021320037b@bitvisir.nu>
In-Reply-To: <13fc6905-832c-41bb-a5fd-14021320037b@bitvisir.nu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Updated gfx to indicate modification of Stack to run Visir filters via 
Cache.

https://bitvisir.nu/Visir_3-Bit_D_A.png


Den 30.09.2026 11:35, skrev Ywe Cærlyn:
> ASCII gets kind of poor on this one really.
> 
> Rather see: https://bitvisir.nu/Visir_3-Bit_D_A.png
> 
> Serenity.
> 
> Den 30.09.2026 11:04, skrev Ywe Cærlyn:
>> Example:
>>
>> Visir FIR as IIR filter (fast):
>>
>> - Anisotropic (Can be run via Cache, for GFX Card alleviation)
>>    6 point, lod bias included, optimized for retina and fair pay 
>> politics.
>> - RMS (Can be run via Cache, for DSP Card alleviation)
>> - Constant-Q 24 dB Analog (Can be run via Cache, for DSP Card 
>> alleviation)
>> - Resampling (Can be run via Cache, for DSP Card alleviation)
>>    24 point, optimized for ear and fair pay politics.
>>
>> buf1 = buf1 + ( - (buf01 * cut));
>> buf2 = buf2 + ( - (buf02 * (cut / 1.3)));
>> buf3 = buf3 + ( - (buf03 * ((cut / 1.3)/1.3))));
>>
>> double fil = buf1 - buf2 + buf3;
>>
>> ..negative "pole" gives a zero.
>>
>> Serenity.
>> https://bitvisir.nu/
>>
>>
>> Den 30.09.2026 10:39, skrev Ywe Cærlyn:
>>> IIR version (fastest) can also be modified for impulse response decay 
>>> optimized for zoom.
>>>
>>>  >>> mid pole negative in sum (making a zero).
>>>
>>> Den 30.09.2026 10:36, skrev Ywe Cærlyn:
>>>> 6 point anisotropy I think, lod bias in it. Perfect for Retina, 4k 
>>>> w/ rYb pixel, 72,7 minimal psychovisual noise refresh rate.
>>>>
>>>> Serenity.
>>>>
>>>> Den 29.09.2026 05:42, skrev Ywe Cærlyn:
>>>>> Here is some graphics on that one aswell: https://bitvisir.nu/ 
>>>>> Visir_3- Bit_D_A.png
>>>>>
>>>>> Den 29.09.2026 03:52, skrev Ywe Cærlyn:
>>>>>> Visir 24dB -
>>>>>> constitutes RMS, Constant-Q, Anisotropic in one filter.
>>>>>> 3 poles, 1.3 cut down pr pole
>>>>>> last pole negative in sum
>>>>>> IIR typically for Constant-Q (minphase analog) FIR other.
>>>>>>
>>>>>> Used via Cache, should abolish the use of GFX Card, and DSP card.
>>>>>>
>>>>>> This is part of supporting my work with Fair Pay Philosophy Unity 
>>>>>> and Low Jitter, for ITS.
>>>>>>
>>>>>> Serenity!
>>>>>> https://bitvisir.nu/
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 


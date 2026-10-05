Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1830DECE;
	Mon,  5 Oct 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194502; cv=none; b=gJ5PpIZEa4P8gGcSAnXmnpE31F7aOw+4SpwDGvgL2j0FCFaoOtRoaAXt56a+lw4FDz9l5GoC3ofvl5p5y79Pf3FdHIA6OjITPNrf3OvjdaO6/ufrXwi3tIAIwmthr+LnHfpwCNvbOxri41dFGWy2SbH9p5q+hBURXT3+bKYYBNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194502; c=relaxed/simple;
	bh=pSoRY2Pv7DXWjBni4zIQhh4HemPs+G/k20bgRvzuTyc=;
	h=Message-ID:Date:MIME-Version:Subject:References:Cc:From:
	 In-Reply-To:Content-Type; b=S6pf3a0EZSklpABm32A/7AaWBMtzyIQGTs+YDPwq4vmIvg+QrrEU/nOW59HAPSfbT8oSFTTHDoodu8kgyvxI3E7AeRn+CDyIFp5PI2Ne7VOulWhA0GHAD9PkSYGMi+a/KaoDHuCXKwIABb/U3NeWJUObUd4Z52hgATR9++J+g7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=tMGE6ux6; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="tMGE6ux6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D41992AD4B;
	Mon, 05 Oct 2026 11:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1791194141; h=from:subject:date:message-id:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uhTVs9quQt9NBt6OrZGY4aWjJVeVr2ktdMXBropE/Ro=;
	b=tMGE6ux61Eil1ZynFkTeDPlQ9qlW5bg4d0riJMPReCDTVlZSV3vMevbwTzKD+AkHgJPDQu
	q80PA2BJ8bXdkSUFFIr2OlwubEf/YmcLpjWRPUkQOeAHtUEq52InIPhi9Oj6sg5uolFTwA
	v7tN095N/c1E5mMTEiOLLENxFW5u492T1zuHAjT5vqpMqjJ4Dh0dnmZERc85XwECSABpgC
	2L9VeK1XsJpM+67c5fVS097M2ZwnvOYJCFTt+93KZdVoT5WRTxXDUTvK82gnsOR7x55OKE
	3Sh8wjASZyww1jmKHdRVedgJkfPpCOP3qO8cz0QPEdQb6CHqKaBQAuof+5W5fg==
Message-ID: <f3661b8b-6d4e-4244-8a7c-a5811b1fbea1@zipdox.net>
Date: Mon, 5 Oct 2026 11:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR
 and RANGE
Content-Language: en-US
References: <2dfe5d78-9c87-42a2-a306-ab5c58b17756@zipdox.net>
Cc: linux-sound@vger.kernel.org, perex@perex.cz,
 linux-kernel@vger.kernel.org, tiwai@suse.com
From: Zipdox <zipdox@zipdox.net>
In-Reply-To: <2dfe5d78-9c87-42a2-a306-ab5c58b17756@zipdox.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/28/26 12:59 PM, Takashi Iwai wrote:
>>  From a UX perspective, I would prefer if the lowest setting on the
>> control equals mute. This makes the most sense for a "mixer". Like I
>> mentioned before, extending the range down by 1 and making that
>> translate to -32768 seems like a convenient solution. When setting,
>> simply check if it's a mixer unit (UAC1 or UAC2, both do this) and if
>> the set value is equal to the minimum, and set the value to
>> -32768. For getting, check if it's a mixer unit and check if the
>> retrieved value is -32768, and then set the value to the minimum. The
>> only caveat is that the resolution might not align anymore with the
>> range. What do you think of this idea?
> 
> I thought of it, too.  OTOH, it'll be a bit tricky, because the range
> isn't usually covering -32767 but only a part.  So -32768 won't be
> reached continuously.
> 
> I'm inclined to have a simple mute switch in addition.
> 
> 
> thanks,
> 
> Takashi
> 
A mute switch could work if you add the necessary state management code. 
For now I think that's the most straightforward solution, seeing I don't 
know how ALSA would handle a misaligned range and resolution in the case 
of my proposal. Could you write a patch?

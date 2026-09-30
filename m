Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF804052DE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757565; cv=none; b=QCyQsqI7Eq+2Ph2wCtHVDy6Jir2bQXKLLmzOR/3MiHqbXHuHL9ajpJ+VliEh7f+cDd7lB30zUdHbbl6riba1ZWDUf7wYy+++7gmLTg2evTaBLcNZR7kwvj7ccvLLRMUUiVZpkn9k5hoddzQB6exFCwHbEvBfcs91Tyt4cJtSGaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757565; c=relaxed/simple;
	bh=5aoc0O/BN2ovURTO1MtYVfaKbRWBuw1kgYR5PqbAdd0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=H8+8uHIMblS4s68yyKqoifK6Al0jYaS49h92U4EcU8hZQRoHOiRMH+qB8wSm04A2bdAk2RlvhndYX09nz1uKWNnlnkc/Yjozj1XcOrEMcLqsHfkbrTxghR50WdD3oB3GBjf0EeLA3oWv3kaZ5czRDFsjN277IskQxcyKEOqvW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=C0YQHFDK; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="C0YQHFDK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References
	:To:From:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jpxDoP16/8PFboV3WtHqz1HCrUuQ6hvio8QU215vsvc=; b=C0YQHFDKG35gJk0DZkq7kHe1oP
	vnT+b9U3+cMLHBtPy2Ijvu8RHCwZdBRL9TRKPIb1clDU6MjeHErJhNwvFI8CGCvalzIyUM1bYjjjC
	dyAXLrHj1cfDc+lfZTMMJQ4KV8zwlL9LTi1u5dM0TAv2yLdWa0UYRmoqJi0+qvLco7C+QK6PfTrVJ
	0eUPMjqs1OhKOuE+Cbk8MWJwz2wI72j7K61sDtv9cTKogD/E2WVezTmaocMml/BqZ+QK+TwBC+fmv
	7kVHkm9chDuLJu8vIL6GW8pvBjoHfsGQBfv3mIZgyqA/Ck58J0wgM9wC0RkM+ttz433Wn7Nh0u0Cf
	h4hMfjFg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBpqS-006ZvK-FG
	for linux-kernel@vger.kernel.org;
	Wed, 30 Sep 2026 10:39:20 +0200
Message-ID: <fb7abacd-6893-4beb-a6dd-3feb301e81e1@bitvisir.nu>
Date: Wed, 30 Sep 2026 10:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Visir 24dB Filter = No GFX Card Needed (Supporting Fair Pay
 Philosophy Unity and Low Jitter)
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
To: linux-kernel@vger.kernel.org
References: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
 <07b34ea8-6eea-494e-80c0-338ccf9b8bea@bitvisir.nu>
 <4f248225-f188-49ec-af80-5eb6c4c684af@bitvisir.nu>
In-Reply-To: <4f248225-f188-49ec-af80-5eb6c4c684af@bitvisir.nu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

IIR version (fastest) can also be modified for impulse response decay 
optimized for zoom.

 >>> mid pole negative in sum (making a zero).

Den 30.09.2026 10:36, skrev Ywe Cærlyn:
> 6 point anisotropy I think, lod bias in it. Perfect for Retina, 4k w/ 
> rYb pixel, 72,7 minimal psychovisual noise refresh rate.
> 
> Serenity.
> 
> Den 29.09.2026 05:42, skrev Ywe Cærlyn:
>> Here is some graphics on that one aswell: https://bitvisir.nu/Visir_3- 
>> Bit_D_A.png
>>
>> Den 29.09.2026 03:52, skrev Ywe Cærlyn:
>>> Visir 24dB -
>>> constitutes RMS, Constant-Q, Anisotropic in one filter.
>>> 3 poles, 1.3 cut down pr pole
>>> last pole negative in sum
>>> IIR typically for Constant-Q (minphase analog) FIR other.
>>>
>>> Used via Cache, should abolish the use of GFX Card, and DSP card.
>>>
>>> This is part of supporting my work with Fair Pay Philosophy Unity and 
>>> Low Jitter, for ITS.
>>>
>>> Serenity!
>>> https://bitvisir.nu/
>>>
>>>
>>>
>>>
>>>
>>
> 


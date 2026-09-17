Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DC383980;
	Thu, 17 Sep 2026 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662839; cv=none; b=nxpYLV5hn7Uh2qf3BksndI5fUQvKiBzNp5tDkJe73S7Znl7IUWFWHMS9hrJuI83XUvpyPAs9Jc9L+8/7Ijpk0UpArhSn8aGNBbEw1EheAxL7yCadDZtUkpUt01lVO2HHODD0/oWEao+70UdhX45EuHbq4rC42//PI2FcjNa5yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662839; c=relaxed/simple;
	bh=CM13bxYpCJ4R3NHDdjue1bq61hQjw3yWugPDTa+E6ag=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MJaqo/9QvCQZtbSIt+gF+nWljcwCdVamtBi8V2cap49/w2KlBAf72aI8Q4EjHRLnQbvaArWm+LSKEGHllqEYPNLMIloai70mg4PsAznFqVvk7y0TNlInA6k9Is0yis/UEW2XHLeWZ7GKwlf3AgcULpI6V3Il7SZnj7UuYEPRzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=hzEJSFX7; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="hzEJSFX7"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60A3B9214C4;
	Thu, 17 Sep 2026 18:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789662835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wgzewPudobSX9TkcWtfz5e8/eFckLonkdyYYX31ELnw=;
	b=hzEJSFX7oRjWHfTrhCx/RMlzEwZ728larvPosBZ3QT1nOY93oKXLUQoOo6k3C4nFgVajun
	dAxL7NCDshFb39BaNgFec8/k1jcw2BoAD7pNXlQN9g5w4tyF8e+h6L6N9i/LHR1HzBsW4B
	V6Bw/AEPwB4q9twsH4g0qoyW186jLpJq3aFXh7g8pDz6fpCfOrV1+zd86Fby6HTz+4XyU4
	JoDaJ7JOcNN9ACsGfgSjou7S4reJBOhKbycA9ckNYTr+7CPJq1BW9Poow/oTytM7uW2ucY
	pqJGB2ODuSj3hebVS5U4V3zOslN/CLvsxdUNM2VW5X/155C8kIphWm3+GCdfLQ==
Message-ID: <13f9ee6e-acf2-4166-93cc-33cbc2d4bd89@zipdox.net>
Date: Thu, 17 Sep 2026 18:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zipdox <zipdox@zipdox.net>
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR
 and RANGE
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, perex@perex.cz,
 linux-kernel@vger.kernel.org, tiwai@suse.com
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
 <87bj9yn55n.wl-tiwai@suse.de>
 <59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
 <8733vamwaz.wl-tiwai@suse.de>
 <da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
 <87a4phjjay.wl-tiwai@suse.de> <8733v9jfp1.wl-tiwai@suse.de>
 <87y0d1hx9y.wl-tiwai@suse.de>
 <895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
 <05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
 <87se37g8gu.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87se37g8gu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/17/26 6:15 PM, Takashi Iwai wrote:
> Good to hear.  If you have a chance to test my last series of patches,
> it'd be appreciated.
> 
> BTW, I'll be off from tomorrow, and the issue is no new bug to be
> urgently fixed, so I'll handle after back to work again :)
> 
> 
> thanks,
> 
> Takashi

I have compiled your patches and the mixer unit control seems to work 
correctly.

Another thing on my mind is the following section from section 5.2.5.5.1 
from the spec:
> A Mixer Unit consists of a number of Mixer Controls, either programmable or fixed. A Mixer Control must
> support the CUR and RANGE(MIN, MAX, RES) attributes. The settings for the CUR, MIN, and MAX
> attributes can range from +127.9961 dB (0x7FFF) down to -127.9961 dB (0x8001) in steps of 1/256 dB or
> 0.00390625 dB (0x0001). The settings for the RES attribute can only have positive values and range from
> 1/256 dB (0x0001) to +127.9961 dB (0x7FFF).
> In addition, code 0x8000, representing silence (i.e., -∞ dB), must always be implemented. However, it must
> never be reported as the MIN attribute value.

Is this presently handled? For reference, 0x8000 is -32768. When I use 
qasmixer or alsamixer, for example, it only goes down to -32767. This is 
the same in UAC1 by the way. Should we add a mute control to mixer 
nodes? Or perhaps extend the reported range downward by one, and 
overwrite the lowest value to -32768 when writing to a mixer unit. The 
latter is my preferred solution.

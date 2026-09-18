Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255AB37E2E9;
	Fri, 18 Sep 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720549; cv=none; b=SPCSarwEFxbmczinwrAeM4gtpYy4HPWGr/rcnW02gP1UZOe7CmE5PqPAe2CkGqhzoRXRslOU2xZfuYmxS2QKOcidd/Ud42vEdCm5RjAf4zPLP3plU+XsZSSbKuaaJZvCET76p+vTN2s1hSavN6G6LBeJ6cFQGSPMLFrQuLoXwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720549; c=relaxed/simple;
	bh=eC8+tsByYwytmswdDK3hJfTZocNvgb1cwsPNGXjG8as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhfSvgjwfyYUC/+mXJordsWrrTHYaQvbdsmoIKnvo/mk36cN2NSOMnUifetzDkt0Tva9MxWBrVNu7XdSpgp8AlNFdK0qu009pJCcUodKlAkKnCBTHdxeicm4KrJICEvRyBgLT5MW+0ZWTeNwo2ng97himiM6CeZvhdWMgoSiTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=NK9l/pJ5; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="NK9l/pJ5"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 898959214C4;
	Fri, 18 Sep 2026 10:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789720544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bkno+yOCEDbj/j3ZXpHo9WZy4c4PGqOkUkOcSWt3sXE=;
	b=NK9l/pJ5+QLizURMCFetsvltr2lKrvWHvt031RDNlk8y/22zzK658CvNdjVhUj5pXkO9Ar
	NuVBVcJZoqs/IIpkOt12PzP3JKGtqrmtlUGllrMy8IwUiNvNp3JXV89mcdbBhSWuk32Nfc
	YpQzJHtDoNaulMjzrJ9u7db7I+tEstoBjJ1e7mZMi74rMSqgEZDk669Q9lX7ynCPqjnlge
	wqyuduiiJlDZWbbi1P0vVxSUb+/GtyeOxUDL/pMVLH8t0eU/2rUhqLRdl4Uh0xZ/FJqi8Z
	f0i8JHhMT5o+yhbJ0PNcxDY/tLBa2vl6pPBshQsGZ9k57+/4LJNKjv4fVqtHaQ==
Message-ID: <b3af9756-d008-46e6-9465-13a059584ead@zipdox.net>
Date: Fri, 18 Sep 2026 10:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <13f9ee6e-acf2-4166-93cc-33cbc2d4bd89@zipdox.net>
 <87o6dvg7ai.wl-tiwai@suse.de>
Content-Language: en-US
From: Zipdox <zipdox@zipdox.net>
In-Reply-To: <87o6dvg7ai.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 9/17/26 6:40 PM, Takashi Iwai wrote:
>> Another thing on my mind is the following section from section
>> 5.2.5.5.1 from the spec:
>>> A Mixer Unit consists of a number of Mixer Controls, either programmable or fixed. A Mixer Control must
>>> support the CUR and RANGE(MIN, MAX, RES) attributes. The settings for the CUR, MIN, and MAX
>>> attributes can range from +127.9961 dB (0x7FFF) down to -127.9961 dB (0x8001) in steps of 1/256 dB or
>>> 0.00390625 dB (0x0001). The settings for the RES attribute can only have positive values and range from
>>> 1/256 dB (0x0001) to +127.9961 dB (0x7FFF).
>>> In addition, code 0x8000, representing silence (i.e., -∞ dB), must always be implemented. However, it must
>>> never be reported as the MIN attribute value.
>>
>> Is this presently handled? For reference, 0x8000 is -32768. When I use
>> qasmixer or alsamixer, for example, it only goes down to -32767. This
>> is the same in UAC1 by the way. Should we add a mute control to mixer
>> nodes? Or perhaps extend the reported range downward by one, and
>> overwrite the lowest value to -32768 when writing to a mixer unit. The
>> latter is my preferred solution.
> 
> I guess it's not; there is cval->min_mute flag, but it's for another
> case (the minimal volume = mute) for the statically mapped mixer
> elements, and not for this mixer unit case.
> 
> Maybe they should be implemented by additional mute switches.
> 
> Overall, the mixer unit controls have been rarely used by the devices,
> so far, and that's the reason we didn't hit this over years :)
> 
> 
> Takashi
> 

 From a UX perspective, I would prefer if the lowest setting on the 
control equals mute. This makes the most sense for a "mixer". Like I 
mentioned before, extending the range down by 1 and making that 
translate to -32768 seems like a convenient solution. When setting, 
simply check if it's a mixer unit (UAC1 or UAC2, both do this) and if 
the set value is equal to the minimum, and set the value to -32768. For 
getting, check if it's a mixer unit and check if the retrieved value is 
-32768, and then set the value to the minimum. The only caveat is that 
the resolution might not align anymore with the range. What do you think 
of this idea?

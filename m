Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95559E353;
	Thu, 17 Sep 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656920; cv=none; b=W/+XT7m2s8sQslK+62gZymFf3PasLablo1IHz3I7Ji24SWfhbconJG+X1cmhqdBwBPcjSpS7m6wMaLXdxvAaVcGeV30rwyED8XT+kPqwaUhXNlVSwdNQWWJSz5wslYsATSFG10FBm79Ghy5mig3eNBKCj6rGRLhvWxh/8lBBuTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656920; c=relaxed/simple;
	bh=g6hxWKJEYSYx1GwYu7fPNWoD/cYsSOww7jhETWke+TU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NowIPEKAIfpEZ4rX0t0JT9gllctRwcKFW+PtgwbrDWyNx18498idnyKF3ULYddIvkdJ/XgwMdS1T+PUPXKoVJ+w+MatBPEpR9PEwQIWJOQxZ7O+AfBc7NjpgT7DpKgaui7cOtJF7aLQUS2pMbaJf6nqytk1Y81DuTO3kdCOqFrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=fAD4oZmH; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="fAD4oZmH"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9E159214C4;
	Thu, 17 Sep 2026 16:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789656897; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=41s0aSbkSfFo1iMv5WcM7yGk70aaW+Q5AABDLtWUmvU=;
	b=fAD4oZmHXLKu9zecSH939AXqWL2ANjMA1FfqIBMZcpBaixbgnBR4+Qn/+Q9uu4x9IngheX
	aqJC8Iik+CI3dEns0bnuoLBlRQlHRxp/tJbGoRHfSCsFKoYzV/Hfn8LnPGhocuPy7LLq/H
	4EjITuD6OkRiNZNM35i90DY7IIJ3DoMGXI8avfqR9k1Tz8hogpXSDTyXPdqkx/0TQ/UXK7
	/FBTlMQMchAanC6C/N2WKBtrZrbAu01QjMxzloMG7D8FfGaHVhWscFh23a61WDk/B7CFYt
	T5k0xswhcH9PHTTcu304A8FR8mgTAXAHla4UYAl2sJGMj6Wr5I0KAi+Cz8Tr3w==
Message-ID: <05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
Date: Thu, 17 Sep 2026 16:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR
 and RANGE
From: Zipdox <zipdox@zipdox.net>
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
Content-Language: en-US
In-Reply-To: <895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/17/26 4:23 PM, Zipdox wrote:
> 
> 
> On 9/16/26 8:22 PM, Takashi Iwai wrote:
>>
>> ... or maybe a less cryptic version like below.
>>
>>
>> Takashi
>>
>> -- 8< --
>> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
>> index 33a6a1281410..c6639a45fb24 100644
>> --- a/sound/usb/mixer.c
>> +++ b/sound/usb/mixer.c
>> @@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct 
>> usb_mixer_elem_info *cval, int request,
>>       return -EINVAL;
>>   }
>> +/* convert the given UAC1 wValue (ICN+1|OCN+1) to UAC2 MCN */
>> +static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
>> +               unsigned int validx)
>> +{
>> +    unsigned char m = (validx >> 8) & 0xff;
>> +    unsigned char v = validx & 0xff;
>> +
>> +    return (m - 1) * cval->num_outputs * (v - 1);
>> +}
> You used multiplication instead of addition for the last part. I assume 
> this is a mistake? Also you should probably also bitwise and that with 
> 0xFF to make sure it's not more than one byte. The product of the number 
> of input and output channels must be no greater than 256 according to 
> the spec. I don't know if this is checked elsewhere. Other than that it 
> looks good for a patch to get it working. I'll try it out and send a 
> follow-up email shortly.
> 
If you fix the code like this:

static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
			   unsigned int validx)
{
	unsigned char icn = (validx >> 8) & 0xff;
	unsigned char ocn = validx & 0xff;

	return (icn - 1) * cval->num_outputs + (ocn - 1);
}

then it works correctly. As far as I'm concerned you can merge that 
as-is. It would be good to try on some other hardware as well to check 
for regressions though.

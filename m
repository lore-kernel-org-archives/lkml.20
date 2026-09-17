Received: from mail.zipdox.net (195-240-81-79.fixed.kpn.net [195.240.81.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1C5908AC;
	Thu, 17 Sep 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.240.81.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655040; cv=none; b=Gl6DnkbQFSELZf7kL05fA4OgIB3idtOF8N6fkvllK2P/yt49du3vWJS//XCrb40ODLnOs8avx7wcJWPDfEj+5klS4RmkHbpuHD12HqO49iTyH2f0iGbrV9CnSjx4rgP8oGPB32rezS4anpqyOPSG9eXmjdhEhMewGbcxcN+DJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655040; c=relaxed/simple;
	bh=jsmkWGdkOXjl5vCehHtXpCIFIRPU1ahWWGONREhd7AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/b+tJtdO/ZMjR0xCtVGnbvSh2rCcbpWpxLame7O9GMX89bPHMXEIQHwt49vExXEBDdIcpVaKWAWlENFlRpoPsUTYTP658aIaYRFq9xupMS34w9k60iipZIZbkTjiTOg6jpRy2gY7rxhQvNswLh+dEv72cHUlHJvmsElnthVtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net; spf=pass smtp.mailfrom=zipdox.net; dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b=A8pUoPok; arc=none smtp.client-ip=195.240.81.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zipdox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zipdox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zipdox.net header.i=@zipdox.net header.b="A8pUoPok"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F326D9214C4;
	Thu, 17 Sep 2026 16:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zipdox.net; s=dkim;
	t=1789655027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=A/+4s5tba7S/aVWS7Khr8WD3jS2p0L3YwMxihJqGpMQ=;
	b=A8pUoPokHBcXvbjwQaHAfr+qS1yvdg9SZRPRkGh4L6d/DvgDkt5GkFH28wCFyhhyHNAr6B
	YoSIXAh1VRb2XdJFJ1Vhw+GpmFtlgxOmUP/9u60h2O/wV+TKaKfDlMz6PkYZZDKc6QQ3Nb
	4c2udji/Qk7pHU2+Z14oUl4Hc55W5RxWLxpfPzCPhlJyxef85OVLlAlMAK2fETSyk9z/0v
	y9MAq9ZE67NGhfNwW+FiiO/Njw6ugVMZTyGwSZBqq7ArfUnC0mM4PKdVreZ2kreAlgcz/F
	mrnVuKg+CHBTfVC0L0mWhsfNM/bLHZYXC2NkPpNaFqXfYRHIvJjjj3HAA0s8Hw==
Message-ID: <895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
Date: Thu, 17 Sep 2026 16:23:41 +0200
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
Content-Language: en-US
From: Zipdox <zipdox@zipdox.net>
In-Reply-To: <87y0d1hx9y.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 9/16/26 8:22 PM, Takashi Iwai wrote:
> 
> ... or maybe a less cryptic version like below.
> 
> 
> Takashi
> 
> -- 8< --
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index 33a6a1281410..c6639a45fb24 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct usb_mixer_elem_info *cval, int request,
>   	return -EINVAL;
>   }
>   
> +/* convert the given UAC1 wValue (ICN+1|OCN+1) to UAC2 MCN */
> +static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
> +			   unsigned int validx)
> +{
> +	unsigned char m = (validx >> 8) & 0xff;
> +	unsigned char v = validx & 0xff;
> +
> +	return (m - 1) * cval->num_outputs * (v - 1);
> +}
You used multiplication instead of addition for the last part. I assume 
this is a mistake? Also you should probably also bitwise and that with 
0xFF to make sure it's not more than one byte. The product of the number 
of input and output channels must be no greater than 256 according to 
the spec. I don't know if this is checked elsewhere. Other than that it 
looks good for a patch to get it working. I'll try it out and send a 
follow-up email shortly.

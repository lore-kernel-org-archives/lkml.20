Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC504F3ECB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613986; cv=none; b=OPGOjlpqBUK6fMDDolswVZfpDowV2fqiK++S/WQQbQKq1G4fZ/xmHk2hr9CwJtLIA9jYKPBuc6YuhrlF/uU1WUeBo5L663kYK3Ba8xVTyVfiMJcWMiy44QDssQ+fmTbniprTUhveIlexq2bQkH65ouv9ZCBQxaJxVDgwMknuRwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613986; c=relaxed/simple;
	bh=sHeFtEdLj2VdrjXwbKpBHKXExOqIlOqU56efVgnwlto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agJqxYp+KUCuaUqaCANIQAXAuxfBbIHdOcPTtLf39debHk5i32++OH5vUC8LypOSq2Fa63pXBfD2C6l9gc94gmAM/71vq2umr6kcC5zCO26zxsNeeIokFp4hER6a6nV+e7ud8KyCyX/bInZ+DJoLhz5pMnRu9ANvY5lS0z7qZ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjQ5zZ4K; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjQ5zZ4K"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso4646364a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790613981; x=1791218781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WJjtMKfomHRJ13Kl4mfSx1TJ/imJHPJguTX6sa7AjA=;
        b=fjQ5zZ4Kg32X1HnKS1Cc1tDZg5GohrBBc3FCWde0BuFjaZneSr7j0ABrTls0NaWdiU
         mYr5mgow8k7TmHMatisnTV4u0TBt/Nllz+oOxN5ANk24nrMRMS0dXAkRaUIjdIZO0xvp
         nc4etXtL3PBbTkCWqLlnobXIs26f4xsZwpWyNVSfzmCsotUCDaKWq5AWljYnugpCADIn
         3fALiD0T2T5096HrULJa3kXUlOeQaBGZ2SlR0uZ+F8NoxGPXlYQ68bmSXgenz7Ryjp70
         xiidFpZAWHjWRM8hW2JVYzoTjATRiKQcBIwngJ2RmVbLrtIiyv7IM4/awWBMJ8gXc+70
         QH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613981; x=1791218781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WJjtMKfomHRJ13Kl4mfSx1TJ/imJHPJguTX6sa7AjA=;
        b=kcZTK2bknux6gINvBenrbgkJxWTeNwEJdvSkyLaEQ4Ue5Ky61NtBSlJkz0cFP1TpmU
         ATbfbiCby5osta3ntvCnT0EuojbCpm6uxkBnVSuQJmDAS/qbVhkn1+ncy/AzRRdxrHy3
         2XWQ7mYSfgVuyrxK5Cl0/syFkAKggwcXiAHYa59D7/2SlYFWRt+WHDYvM4MP4TPhNKJ/
         1rdmjXAyjTwIx77C8P5zAC4t9exC69McULdrL8jcjL9SD9WHX0l6r2Mz7Iq7vQ0adhW7
         tR+cx1QA9fe9Uc+9C3cz77UL3gjU7QhcXypqtrS0wkQFSpdGqohZt8varcJxezlNst4+
         IQ3A==
X-Forwarded-Encrypted: i=1; AKwUvBz2JPsyNyD9BfAr3qaAhUf5XHc2RgU4EqpmxGj2hxz9zoGmPpNTUUfgttcN/n4RpJsC89YtmRilqecC7lc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjhGDIXbWDlBrI87jLw890sLLQwkl023hkLI72DDcSDLcXB+wG
	NjfIBUgp5Yr1FNsMoWIS1ymKx1q2TsUEB5waAR+VPPdWrVc6QjBCWVOf
X-Gm-Gg: AYBFou2op+Jt8pUsbQ8mQlbxCrjwuW+1x85HhiMnpH73Cjsqz4DQ2IcUaq8Loouo7HF
	Tx17IgJTd6TRvavCHuNsanqKqTel0ttwDv3sXe9B5CJmZvJGh9fDC8WnlFhR35Q5G+xm0YXm0g/
	QHZww8KIiOW3fk3OR0rl+bO0OtVliu8uYDH/SpzjIjOUT0zw68j815LUm/XoaVs2OXkSJF9RkjM
	EVVfKV2p4eAkcl2YAHkMxSVbtu2iHmk9HkmBl+p5HYgC/nJ4XsIMh+ep4bf6/KoycLzCp5QqDvg
	8bf9/K4Ig+X/dA02q4PNO3zOtz2lj5MNkhbfQRTRx4G2OdsfheBMbJW885Q3cBHdylrTiSwg8nt
	RdhrUdtqBXVCQkCP3GO78bbxi/m9LxpnYGsc1/ToXovYNvmfKmFgEH5N4qRDVjYas7ixpeGtHll
	35q9tYPOgxMgNpH0UPe8x7XVMWpYCnITOkGZJAOr1jzPebdVUlF1+Vxd6ESC84rrjWIzQ1uKhUp
	5+3vEH7Sq4gO+2zGoNb+EyTVJhRR01sCv5QIF/0raioueqrR4ywCA1xl9Q2z6NdVZt2yV//OfSF
	zu460SGv0yBeVGFmDUtvyxm/rwAm0kKCnUNVvA/MEueRHroWgn7e
X-Received: by 2002:a05:6402:11d0:b0:6a9:aff5:c6e0 with SMTP id 4fb4d7f45d1cf-6aac8f07897mr10901544a12.17.1790613980945;
        Mon, 28 Sep 2026 09:46:20 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dc0cddsm4422209a12.14.2026.09.28.09.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:46:20 -0700 (PDT)
Message-ID: <1f77d943-cc99-48d2-b6c7-a791a64d98f1@gmail.com>
Date: Mon, 28 Sep 2026 17:46:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky
 GET_CUR
To: Takashi Iwai <tiwai@suse.de>
Cc: adventureFAN@gmx.de, corbet@lwn.net, i@rong.moe,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tiwai@suse.com
References: <87h5klw6kp.wl-tiwai@suse.de>
 <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
 <87a4p14bzd.wl-tiwai@suse.de>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <87a4p14bzd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I just tested the latest 7.3.0-rc5 which also exhibited this issue.

However, after reporting this regression separately I found it wasn't 
related to this issue, and instead to 87a6f2fa6e6c ("ALSA: usb-audio: 
Propagate write errors
in generic mixer put callbacks").

I reported this separately here:

https://lore.kernel.org/regressions/CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com/T/#mfc03d59d61c4c46165dedde6dc23e26aff5f697d


Apologies for the noise on this issue,

Faaris

On 28/09/2026 16:44, Takashi Iwai wrote:
> On Fri, 25 Sep 2026 20:33:17 +0200,
> Faaris Ansari wrote:
>> Hi there,
>>
>> I am continuing to have a bug across the latest 7.2 kernels, as well
>> as 6.18 and 6.12 LTS branches concerning hardware volume control on my
>> Audient EVO4, that I think is related to this issue - would appreciate
>> some guidance if not.
> Could you verify the behavior on the latest 7.3-rc?
> Once after confirming that the issue is addressed, we may consider
> backporting to the older kernels.
>
>
> thanks,
>
> Takashi

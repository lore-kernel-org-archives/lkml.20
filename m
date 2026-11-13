Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531891;
	b=VU7yfsgVEFhiRPXO1bQIsWwzexnZZcaXi4gPVOcnAdFRUA5ndqo5XhJ9QCUqWUu7XHRW
	 QkOqQF8tP05dUjt2EYNRFvD33MDvG0iYYDs4YKLsD5GvAnxJmPv9lVqnQHdWtPiN3cJpY
	 JfmRubWGTX3V1olMfND01FTlAbYVU8BbMeHsqhxIchdmynu4WgtJTkmD3OLq7DHesjtvf
	 F+NsvkENVd9PSbpF3EMu+SqzEqYWaC5OUI661Q0Hs1j36D6cQnOBZoDjiUdSxHAPzzje5
	 V81YE1LqIQVBl5zV2q5Z+dVfRhh/pYOzMGYL6HCevhNG3UiaPwa+hRA/mScvTPXWyhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t2MxTc2Fv1MEa7Y8XQgZN4nrlh0LEBvUVZK4U5Q5+68=;
	b=bLREzFZNFUY/ZTSQaRUn55aTnY8vWc9mjqmRMsIHYiIu68at2A9dwz39dYcx3felB04K
	 N3fHGG2Q0gAoX5P4NU2U6w7dhdd7hInme86AE6a8x5qCveVmT2jC7kuOW9G3cBYeRahQf
	 0nN9Ch/RtQ6aWO2nflf2VpVrXV4awYLFsdai+dLg0dkjVDwFgHT3/MXel3uVV4wWY+ZiY
	 8RN/Y2I1XmvZON1QsOGWUqxdBLvxJiSSYqIVWMUWEtoVR77CjiwCgv/J1JfyNEIA6ZpMa
	 Il57L+d/Kse1pY9r5m6VomqDtIRlesUZ7bPbBv6v+4PCtC2Tfdqm6pMcRF+SjaaCkcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc0iTdFP;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA05E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA05E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc0iTdFP
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a058315c79so299028b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531890; x=1795136690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2MxTc2Fv1MEa7Y8XQgZN4nrlh0LEBvUVZK4U5Q5+68=;
        b=bc0iTdFPriAHSfuJXyG6sWma8K96Nqbdgne4jcE3xSOqEA88q4Q+WzuX//6yMt6zsu
         j2JfO5Z7wB6nRAJdhZ/FKHN16lpb8Ki/wDvw7srrdSs4atwrKjmaZr4bX/o5V3eXxMIa
         io6D8CPBQ3kTT2y68/b/wrKb9fMhAiN/t3er5CNrX6vg4g96gKDGVlMlbUgn7S+Y7IHX
         sPL2usxLi4pQg6zM6Ib9doz5/njOVCcDOautj2AIpPvNZkFcCSrebjo8ftwajx9dors9
         A9x5HtFW0K5n7tRVlE4oJZtQZ97yQBO2JJf8qvf+3vhnX6bQZ9us1GUuY3lMyeB9jP1/
         KcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531890; x=1795136690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2MxTc2Fv1MEa7Y8XQgZN4nrlh0LEBvUVZK4U5Q5+68=;
        b=YB45vzoBMyKr1SIemBoTTJPV4sdsx40qtrD7jGu95W75MiKMDDXwGg0S2u9dmNz+mb
         M0HrJk+bG2rnJgKU70PwZuFpOpljsR/jjrFIr0bPN1hO/h7GCKPIrNbBaNhcLH5OxFKw
         Lm6dlUyp3Q8Bosk7OFTeywi3w+G5GtkurIV9GD1j16lTEubZfVKO4J6t4splxcBGNVIk
         3C4G9k25T/DUeH9tH2K12gaFx3NkKceOD+q2nBoKhHf0gSbUyK74keFEmzEog0wQgleF
         p9JB53Sor1XgPC+Ld2DuQkEhoRwqp3kC7bxwgaWQTdMMxXmXFzfT2zZF7aRlOCJDoebD
         pVqg==
X-Forwarded-Encrypted: i=1; AL+hErG7uChX6fGHGOGjzvbBUMT7FCE/QtmZhsoQj+zl1+iNZVrLnjjymxaJ3DF6R7b/XiQFeDzjIyH3UOThw70=@vger.kernel.org
X-Gm-Message-State: APuU4Z92aGxYwFhZ/Fd16uDSDQpOZ46bJzzgJau1OQkw9EgYHS+EMUz4
	fodOkLiI52gm5jwDgNgSgT7A9hcL/7mtfT7xABEPJZ+Qflf8ruSfLmz6NjrMcA==
X-Gm-Gg: AYBFou3MHMMD4hExC4GRtD9Raak8h9kTwN2AtLmjGIZQuboR2vdM5qh0WBLTdhSITZq
	2ij4HcMFfTfdJGGpRZoeAEHAviSt45gLHe+DAAFZgc8iRmwo7NrcktJDv2DZNWNfQYrdiYgTxlG
	VlhCdJmEn69c3q8XihX2aLv5uKeqCrWizi2Cj+Fki+wUR+wzZoYh0HoXrn3cHmcKyCSOSbStYkt
	2F81JKnCAlvRHui0opcjH/XxQnMf91QYg1NzJL27Y6bk9oC4ErYUbSXo0dfWwceAQJ/HrXgsrzI
	wh3Gdzuxvs21KD3yFgIbz3DLHk7VIX9N2ibGcPiHkGVKriTPGAw21CokeV6mWzBMoWhDmBBs/BN
	A1+6orzQGsywm76j9X0OTU7hpY9nBYAuSHlqBuDjLvkF10z1Qxq7QbS9N8CoGTS3PjcOlK1tJ6N
	L8IAi87MaXNrq1NyQaoSQChDIBtPMVYIvpCHQkoW0vfGMkS4ijz3A6guUXxkVojimF8sXxPDU+P
	UrQIG5JUZYCONiEy6Dzsx5u6+bvoh2fiyTDm9ZRUvaqZ3n2sCLeVRQDkjnOFeCnqNJmpx0uz5u+
	Q5rmYPuHnwTKGmpTRaMEycdlqJr9UvI6OGPP3dyN8w0P9cAvbIFIfxdi3kEBvM4euJMeV0c=
X-Received: by 2002:a05:701b:45d8:20b0:14d:baf5:c419 with SMTP id a92af1059eb24-1b50308b54amr1088369c88.6.1794531889873;
        Thu, 12 Nov 2026 17:04:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm2344725c88.6.2026.11.12.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:04:49 -0800 (PST)
Date: Thu, 12 Nov 2026 17:04:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zhang Jiaxi <Z1529105815@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] Input: goodix-berlin - validate the complete IC info
 misc block
Message-ID: <avZh230CD-_-tlXG@google.com>
References: <SY5PR01MB106009B0C8D0A657BA9CC5D92A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SY5PR01MB106009B0C8D0A657BA9CC5D92A1932@SY5PR01MB10600.ausprd01.prod.outlook.com>

Hi Zhang,

On Thu, Oct 08, 2026 at 10:34:45PM +0000, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> The variable-length parameter arrays are checked while advancing the
> offset, but the final misc structure is dereferenced without checking that
> the complete structure fits in the reported IC info length. Reject a
> truncated misc block before reading its register addresses.
> 
> Extracted from the v165 source; no firmware-mode change is included.

What does this mean? What is v165 source?

> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> 
> ---
> The bounds payload is unchanged and reuses its successful exact-target
> object compilation. No coordinate-mode or reset/resume change is included.

I am not sure what you are trying to say here.

> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -347,6 +347,9 @@
>  	ADVANCE_LE16_PARAMS(); /* stylus_freq_num */
>  #undef ADVANCE_LE16_PARAMS
>  
> +	if (offset + sizeof(*misc) > length)
> +		goto invalid_offset;
> +
>  	misc = (struct goodix_berlin_ic_info_misc *)&data[offset];
>  	cd->touch_data_addr = le32_to_cpu(misc->touch_data_addr);
>  

-- 
Dmitry

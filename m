Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006546;
	b=D0DWt5tHuVaou525kBGlRwTOkIKEOftyyMuyksV7uJIZXNljs1pLWxA9aX077tecTYqB
	 w+cpa/BjAuYiF+8Or/1KWLAjX3sgXAnAILbXFhsytMn/X+t6EjnFHhJsPTnmIBKAId8LI
	 0pg4Gvws5gipZkaS5+dGPHr3/Gg4KdBpOWO3W9G5YI6dzba8bPlKV42AQucmqi7BG6NLj
	 M7jSzvZ3sA/w21FcEeeE3L8eiWsRtKdmUY7oWVNlIJuPf1Zl6H2OsRkUpOgfSqeizzNoJ
	 8xOotGZ3GXtu8Rp40CcgEpTIAjbke/E4wTIWcycLVV8MuBSXUuvn83AZNwA4wzMpIEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
	b=OHQ1aHvvozDt/4mOABjfFR+f/oQxZk8UrqZtOKDHM8PY6fAn0pspNdpA4p9zm7RYBjW8
	 FdzHbDg7hXxagVTtjxUduRr9SUtoOUssKKW5X9Qc2M1RxUcvTTeEuOdDkNUGMiHa/Jkkt
	 TJAx16YOoahNS568Dgz+UHjziTxz9Ony4B0uIxZ9n1CUuKWz6iuhZoEZ2r87x2s6iewU8
	 dH4JLMzQ0tz0d7tKAueVa7yj1DI9BpfgTSTDdG6lyknD94fClyUT2SeoH8swoDFUUuVS2
	 CATVDkQD5f6kGKX5geuiByGrVj8SfxhtCEQrYXOk1h4TtZTNFb5cMKlVCq/BpEDp/wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pB7B5UZh;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BE2606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BE2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pB7B5UZh
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1527654f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793006544; x=1793611344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=pB7B5UZh92Vl2OCgdj0Ce/SFQiad4yYYyQnKuP0k9WbZAC4/shpL6dpSNnhVHI4mhq
         vZ6xbo7kWdoZqFcpLDDetrrQxkzs/1rPBD6YF1vmGLGvm1yUxtFWTzSQ/bHkke3iDPyx
         gtosadZH0zXr1ivEopWQvZu7ezR/CWsOcBsp++w/s3q4BKXAsFwiskZmtnFn0swya1Ml
         do8j2VrU0zkEc2WQYFWM+BznoCRDpWFjPfaGEXnWioXwbqosGK5miWbgeLJWTaiKYGKA
         Zy5nD9GDd8AoxdXrr7MVbgw+Yvr5aFW+urZvRjtpub5S2k6gN3jvN2xr9AlbVHCVDHw/
         eTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006544; x=1793611344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8YYNHqrt33tQh3j/NNFt0Ir9INku8h3/joaCNcuNYA=;
        b=spFaT+z9w2FIssyB4Bkdn+nocdIzJXFZ748FrpFsC7vIN26x9BQawJZfSzfNDdeXPS
         yQJ7BnBG/qtN8v0+6+ZhEbjcaUwLoG3scuyXUxiEFCF3Soa5snO9w+8YVQk4E9zPanJf
         V0b/Ma5n+NbT/QwZu5djSQYKj/LHGyZABfQN5ajInhfwX/nvumnCcid1f4uguNDd4LtX
         +1RSQClL/KLK6t4Jj8tg33+2wPlRxcpCfywBg2ul7QtE92JQ48upG+XNuKFD7q535/Ww
         WrvDOyq+f6wgUI0kb9kT6ksgHtUNBWhBA5YhQ5wyLmHPRj4BwgIL/ugctE47CCc9Xi36
         WMwA==
X-Forwarded-Encrypted: i=1; AKwUvBzKTOWBdUW7tokxWcYleEEZslxk+g8J9aLdjYVj+5OC5p8HR63C7YjX5JMMeooHKajWmAV1AxHtIphVX0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcmsHxYkPlKtU8LSslkk7FSyVWvFr0Yw1s/o4uIevKLuoGkpB2
	w047923VweQ96Jua5MDRGHzxu41hm7QBPVyRBjKJDfi4/WpczepkU96z9TkXmmq9jK0=
X-Gm-Gg: AYBFou1o0IJ33dg/Z+TJDVkJICjry70E3HOeSxWtLUjjqcg+PEFgsGrWpAUH3mP+3bV
	fC7varutyzxiVp8lGnO5ga8DiOBJ7aasK0zZwW53iYAJlOR95BN7X4s3zTtfrM0v53jn5cfhrky
	qWk6krYWs1c/N64DtjrH582AfgpZTZqCAK/YkRktc9C6hzZQmxGi+6eCgsQxZ+v7uXGsym4Yv38
	3PQbdkVNcnIZg0/ILC7NVZE8BHs2KwUII2L1jf+iPCu7s/27vE3BoVUyTJ7AFWiL6IlENdcCiJr
	pwS22SjVB9IhVPJOI3ndHClkdv6RN37FrOHDVJR5yizk84nYEJI4RGQxhj5lJK4viK52PKK/HVm
	4+DSUOVGedkkmPz2cpUW9aoXy0unBEiKeQVhpLxL1T7yT49DhwRny2xoOJw+eViNfy9t0gUWFyK
	pT0e+QQmI6jEdJy1tIRkonqhsAkyxY/PenfuN5TgG/q+wznteYab+Vy2JhTZ0QMbQAemm3MiFEt
	gG0taAf182oGZ7w/5RC4vJcAu94CocmwG7Da2mNC5nAU3MT7L3iR7PJLzqDZw==
X-Received: by 2002:a05:6000:470d:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-48e3eb3cc6fmr11105736f8f.7.1793006544434;
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm15042461f8f.59.2026.10.26.02.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:24 -0700 (PDT)
Message-ID: <1de1884e-11e1-4375-97af-fe3bf924a584@linaro.org>
Date: Mon, 26 Oct 2026 09:22:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
To: Leo Yan <leo.yan@arm.com>
Cc: Amir Ayupov <aaupov@fb.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
 <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
 <20261023140013.GK26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261023140013.GK26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/10/2026 15:00, Leo Yan wrote:
> On Fri, Oct 23, 2026 at 10:49:40AM +0100, James Clark wrote:
> 
> [...]
> 
>>>>     * a device that matches one of its classes and has all of its capabilities.
>>>>     */
>>>>    #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
>>>> +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
>>>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
>>
>> Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use that
>> instead?
> 
> TBC, are you suggesting using separate capability bits to represent
> TRCEXTOUT0-3? Why can't we use a single capability bit to indicate
> whether the feature is supported and caps->num_event to indicate
> the number of external output signals?

Just the pattern of *_SHIFT and other stuff to make a bitfield is 
usually better done with GENMASK(). Or if there are only 4 of them, even 
defining four BIT()s would be clearer.

But yes if a single bit and caps->num_event works we should do that instead.

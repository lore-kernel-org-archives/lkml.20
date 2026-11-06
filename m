Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977531;
	b=hHeoiNIWo0nB9Ls8N385jk9HFaFeIQXjF3am0t1udo3+erG9CARFgWT4Wm+3v7jLdti6
	 idq75Ae9CTC9uQn1xVCd8+Sxb8tOqj26ckh5i5VSy3jnFx/EGfoz3miF1GaEFHXq0OdI4
	 0jrBwGljTcU+bmAPbhhzorYhfbZEpIH/EmpdhbyvIKIbOwWjf91K5kl73x4BQ1gUs0p1y
	 EtWbui1SiCRms0HjqRzPmMROcGbhXeJqNBcxQ1roGz47ygOJ7uUtSXgaiN7e+qYHw+dIY
	 ln1g/2Wmj2+M8p9DE6TUlPbd6b02nW9Sxl80XESAyrW+HLJxofHuBySXugR/6DjuS9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
	b=i8BwZ8SXqKSLUCRmRnypNk8yOQpEZ0JRSyX2VvFAQv9ygPY2ZSEkPa4X/FuSWRTCMjxf
	 V0he26WwL6URt9JsW7J/OkHYEEPNLKuzUSEtNUBZW0HEjRd9J6zc07Hu/IbvWt6IyZ2Ly
	 hWVaJfyDLYizi+WAagS5kV06l7xU+kUfptMhoBzJ4ylkc0GVfRyyEEayxGIcQedBdHM6N
	 u6BMAyInhPResNtcRDui1NUa8Mj1pFnjupPSoEdm+qabGdKW7nMmLVl0Oq5+yC93VGFTB
	 X3lwj0kO7qnr9EZXIriN26EcQ2wKJf/PITqObqWsM2v4c6fNxt+Me47r6Nuff57u5qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx7TubHk;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AE1606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0AE1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx7TubHk
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so580812a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977530; x=1794582330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
        b=kx7TubHklvtCZ7E5nh7vfQ5sAJwZMBZckhG8KuQy+TstrTyum8jGg3qoQCPK6+Q1nb
         j8BxD3Q4RCS7Wwb2ybB9J3p7ZNIeRPrP2NpvHbvOJVrL0S3jlt6pIzzxXANUg4yeY7f9
         FOz5LZaFjcFJUe2cNFfqXNXpFcgc/RgFyUJeGvtx2U2rDERlMhGKEFykEZEJvdPWitDD
         teQ/4BBtY1tLFm3isB24yzjVH8Gc0beGyThen7HnRZ+3OBZ/8AGjUAi+x+1GZxfyfp7r
         FsCmWP1dtmsh+bHFihL3EnYSTgph/iL1TTPmfsZFXJT5Ql51/tx+eSFbn6GqWY2NanPd
         LkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977530; x=1794582330;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
        b=kPRBYH0vFuqLJwdCCd+mH+bOkM2e2IzqasLdlipeJyvs4fgfeE1gHAiYLGLIVylEb7
         a4iduk7lxQBUOoKctV+XFaKHB9zpa11oRFjxc9ZbLANG671DZTq3TFLmmG+CjrTVqaqH
         ZXZRDHxHnrV7Lbs2cLxCkiPwctPaGOtLx4HGF0Wd84HUeqiKMIIziC3KpU56l9beMngU
         nfFAiyQQE83cLQeCx2UAybLscvBXdOKzFZ20FV8flQolcqwQaeEDwDG656ZYt2fJ5izk
         EpVv/yDxSmPflaMWFB/hzMRiDio/VIJnUNtTzeAKjtxjoy2NqjuNjpIuIkp6SuzAS0OR
         uoSw==
X-Forwarded-Encrypted: i=1; AL+hErFRT0HvBWF6R5a60XhwvI35JJpD9WUPTdF6bmrXTcdlv3fortRUaQqAWcqfvVAAyv2sBjK0M6Y0uLoHXsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/12Y/3vYyHcRY0jOnAjvv6ihGXpLzGPpUks2aDpXEYVkIg+hPT
	SswLpTeMue3XNYQIubRxiuTZBvJc2qEOZouIBBYjcTVS2WhhrqTsmp4i
X-Gm-Gg: AYBFou3zNsn/++c8DBZwhrfaq2oZJciC+YYW4kksnGz10gj01BQTVpr4Rnh5QJR127E
	tMRc7ATeWneCKY1IPQfr7x4p6ccNyCjrRyK/3GW/pDwCIFc/V0mAmS0+62BF2GKYduRP2wSngx5
	+vJrBrrOMRnS+Bffqxmc84rzqSPni/kq1SLUhfFW4DnEWJyWc1b3div2Gl3ijU2ms1lqHf9pFfo
	RoEp+14rCgHl/EKwBWxwA45Id5n3n8hVeJ/v2FcX6tiG1Hzieafkq5BGa21RIBB3beWn1gdPKzo
	+kLeOZMpBzqW/JCnsmPTxANTBf7CMzq89p4SQ4RnZQkGN9ofKeO4K4n3/hfgvkBY6qtVFcgb52S
	37O4gPHYZFA/naIfAoQYEGhFZ/pK0iwkulM3KAi95nFMUeXqDOi1TbIhNwvfm3A0Hf3mrlDUsqq
	B4LlI6A4F1s2FSV/NhhGQOxydi40cS+3nuQ9glVFpNhJEHbyZMYYyw6MlBz2rMGcJyqukuI9yWZ
	i93PkxkuWhLgzDMQ1LrdK/QU25wIRTNzDDCHH/q69rUmtz2cc/dtoRtuDw5c6oQJXlzMNlvJ+NL
	1t84BOYhCMP+caR/7pfAUm6J45gAHNdE5qW9aUyRZyf0BOxjRFsqVMxdm+UrmZpawdnnhujobQI
	aANBmHbeLPryXgQ==
X-Received: by 2002:a17:90b:180d:b0:3b0:9deb:d990 with SMTP id 98e67ed59e1d1-3b0db6d93c5mr2662079a91.39.1793977529728;
        Fri, 06 Nov 2026 07:05:29 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bfa8:849c:2010:a1c1? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc2775adsm95281a91.2.2026.11.06.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:05:29 -0800 (PST)
Message-ID: <78f9211c-3673-4c64-a1ce-8ea56ee13ae3@gmail.com>
Date: Fri, 6 Nov 2026 23:05:23 +0800
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
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
From: Mingyou Chen <qby140326@gmail.com>
To: Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, chris@miget.com, kento@kekto.ru,
 wolf109909@outlook.com, vlku.milos.fun@gmail.com, btx342@gmail.com,
 zsanya322@gmail.com, i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
 <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
 <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Content-Language: en-US
In-Reply-To: <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 23:03, Mingyou Chen wrote:
> On 10/18/26 11:03, Bozhen Peng wrote:
>> Hi Anton,
>>
>> I tested your patch as posted on my MECHREVO WUJIE15 PRO
>> (WUJIE15 Series-HPT), using your stated for-next base:
>>
>> 98f039265e580291d5e76a11b2072541fbb1c393
>>
>> I booted the baseline and then the same kernel with only your patch
>> applied. On the baseline, kb_mode was present, but reading it returned
>> "Input/output error". With your patch, kb_mode was absent and I got:
>>
>>    kb_mode not supported (-5), hiding it
>>
>> The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
>> With your patch, the probe still reports the ACPI error,
>> but kb_mode is correctly hidden.
>>
>> I cycled the keyboard backlight with Fn+F7 from off through levels
>> 1, 2 and 3, then back to off. All levels worked. During this check,
>> atkbd logged unknown scancode 0xf6 messages.
>>
>> This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
>> is not RGB, so I didn't tested the supported RGB-mode case.
>>
>> Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>
>>
>> Thanks,
>> Bozhen
>
> Hi,
>
> Sorry for the late reply.
>
> Attrs are not covered in this patch series.
>
> I might start a new patch series for this after the currently one is 
> merged.

Sorry about that, I replied to the wrong thread.

Please ignore this Email.


Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7296518137
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066001; cv=none; b=B8dIRbsEjiyPe7UrdQXBcGWbWdCMQ0C0AHzR9ZB8UURZTBKNAdSBVBf4igVeUxvIIgXUZuxqhf4NOK96SsMKm7VZYIaKb5wZoss138QDKOenSu0rqBfSpphpKSRnIqHvLKdVSifD6c2zF4RxRDFpuj/l4QILTrRKwIGFj7kEtvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066001; c=relaxed/simple;
	bh=83OX0UMUv0Bs3Z8aWMj2bQ4M5vK54eyMiLDCVnQIxVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFlwGdzSCpCt2c2O9NZdXCeEtrLMQZ2Aq/RpSBmzdQROPKZrWIUiDTcT2/QgLLgpgIun/NXfSjrgFK2DXRKREqLTEH8aIyOz86mSeuIoV8uwWZ99pfjXV33MmiiHPBTKzP5hgJTmIVQ4tpj19khrca/ktStjaoJ6wBw2Kbotsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeHO6fZU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeHO6fZU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so720505a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066000; x=1792670800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jcthknIbaUqeqDySgJzkRaHnqH6Cw0x7W9ii1wYj40s=;
        b=qeHO6fZUDn1v0ThIo8ZuR3GxgqrnoH5P05YRFB/HUo1HZpxzwTf+KdRUiFnuoGTDAq
         JVbOspnSPLkxMk3jXf0IDLNHy2hIJ6wOHDvwL1zdYmDTvLnTf2WZfByC3JmuClywkx1n
         fmxLjhFcyI2yT9Z/Ws7/ymCHKX7nA87Wd5yz3N1TB1jNTw4+ZXZeZAjvYHm6gnmh1ypj
         ReOd4YGLSlt/MqdCsqhdxHHvGd+L4Wge2hqN+BcMr+sUTwxtbf+XlUfYIW8CfHxvRzhf
         qR4w6kcf4mrpVZPxRk0JgDwNPty1BjPevoFJ2sSBvJ+Q3+hoiur0UTyTagguobWpddDI
         x36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066000; x=1792670800;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcthknIbaUqeqDySgJzkRaHnqH6Cw0x7W9ii1wYj40s=;
        b=eIQ7N1re/dx/UaakU8Kin/m6BsC9g0jFECKJr020jIXLvu4hmfCz06A7KG3idsXc/B
         FyDpgNCROsCz3KlPxDIn5UPaMXnEzoTJNdg4q+yOMjfoTHptdS0J8moKuBYMAi7wWski
         pv+zedLFp43zg424xk4uE046nhrqCBVn5bCOldhIfkoL1P2QUPA4kxnGP+crYo9Y90Od
         RYhfwt35zVcVqB2zHdypwQ8CtMFRnTSkmhS5gbizzYpI0+vYFIdRhs09CJLtGNZxGOIa
         403lFsjCNkoSLGaoP6cvd35TJnBLNBq+kjTB/qBy2t8Pc83NvwWNBU7H40hgPnRgp7Z7
         h1mA==
X-Forwarded-Encrypted: i=1; AKwUvBxnGska1Djg116BZSD4hzAtgRjr77fPfAIU/DLMeWxo3t2Txh1mFpsa5jNGtCgaMMfoDN2xM4iIB1r8CIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJonavtxSKYkN/KxexrzG9RfYu95bMbIJAxy3w4jUB6MvBUfb3K
	8SI6ULK49nIn+cL0ZM9anV3jW9Vz4d8HuJ4wq8hMDRXmAeVIef1Ptig=
X-Gm-Gg: AYBFou1ZFwIv+RK+UQQN1QOQuAF7RVGwhlGH7JqkwjsXjf7E/bwY7S4lixvRSGfNnFQ
	MxrEcvuMZJ4fy1fuEy46HcS9dIA4IUIs8t0o/0K6Ph0tjkYcsUPba5NERk6+5CJdb3EaZmNRvwn
	A6qpP9JgFJ5MAKyXSvxeRVsORwkSOnq9dhfLJ3Q+VHYDnsBdlT/cIwXLR1QWcoDT3AJV5QqLkl8
	xzJ7Rq7dFGRU5KJOJ3QeHO1JBssIFIgA/87C6WsmLZp2GJpRa23sAMgHRojlZSDS6JPWjhKh3Hf
	u8q3nbiFQ0yACt+ZxdlMmqOOGSEv9c4KnO/LfhjacUebHRBhRw0MFttrpVtSlD+dwlXpkXkiaRz
	ZIC7L+VC1kh7KLTaeNiZqwlTO5wexIS+7QhnS0S+N13MGr/IIUtqORo/tx+WSzeK3OqU/PLDlTh
	xTbPMY185Ja1wMo6Drs2VFw53BXKI40mGcZDApLOQELG7h4H+m36mx1AZqbFOVt4G14Zocgr8mQ
	lbfbvhYQLi0wsYWIO625uUmvYg7vfDszfF8dr8Onhc=
X-Received: by 2002:a17:90b:2644:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3acb048faaamr495599a91.67.1792065999597;
        Thu, 15 Oct 2026 05:06:39 -0700 (PDT)
Received: from [192.168.1.45] ([45.127.46.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94375f3fsm4324163a91.4.2026.10.15.05.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:06:37 -0700 (PDT)
Message-ID: <c0a5726c-2a35-4e2f-afc4-8cef65877e8b@gmail.com>
Date: Thu, 15 Oct 2026 17:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: ccs811: Deassert WAKE GPIO on error paths
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
References: <20261014152250.8324-1-nikhilgtr@gmail.com>
 <20261015111145.000065b3@gmail.com>
Content-Language: en-US
From: Nikhil Gautam <nikhilgtr@gmail.com>
In-Reply-To: <20261015111145.000065b3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Joshua,

Thanks for the review.

> Please add a Fixes tag.
>
> ...
Sure, will add Fixes tag in next version
>>   	ret = i2c_smbus_read_i2c_block_data(data->client,
>>   					    CCS811_ALG_RESULT_DATA, 8,
>>   					    (char *)&data->buffer);
>> +out:
>>   	ccs811_set_wakeup(data, false);
>> -
> Keep the blank line.
Noted.
> Otherwise,
>
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Regards,
Nikhil

Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF9F49158E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895680; cv=none; b=iTWMcZSlnFNwrqIapPnKBql1m/DE1SpM9LmEBh6/erbEnUhN1ph8oA7fTtENMfs3AOI/uACeh3gZcWgjcykr5SbD4APWAsp+Tcun0/Bok93YeN4Rx9SPw/2HBRR4DYzqxa9D9XhdcsxJE9mURRCRyQGDZaQWTul7fxOYAXRXw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895680; c=relaxed/simple;
	bh=5h8KiJRiazv+A5U2D2I0iqD/eAremAYeCZYJI0BhpVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/Hm8Y/oY9U7sZRPem8OWu1yMB3nbYOPAK6jP/BOfIuhSpXNYmWigC1NPfsGnSEaDCWJ5VQpwWrKKASw0hRD7SrxEc4nkFMViWiR2jMkRn33EgaByJ3mnSR8/yHKAzHD79HiGkoCioYSrZGlOt8gK4RgkFPhNnrzuWbQwZdoAKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3UieXY6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3UieXY6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so4517807a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895678; x=1789500478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vlvzTdo6hc/Hb1ALKMfVG8dR36XZikTOJ3AgufLTsc=;
        b=d3UieXY6IbtRvqclqbKT22fTfD+CYW1aDsPVz0qyKb0rXBM/ZYzLr4Jw34knbNquvT
         Uc1XyOCU5Amk+iJQ8FS2UqUZRFtqkaJH5nvqY9BJdU5LhfNSimvviVmQJW+84mcszCb8
         HBIl4QvFy1Ic2xULeioz3Hmj85n69md0SfVW5ZXOnIodpacqS0hMRcUSYo8ge4Dq7z1X
         f5ljxbsTIwDhM8vmdDVWpFkhf8YL6QKL7Q360bbfsahspX5QhLaPn7Hb5r3FXfPYRCYf
         KV1Wvrz2b9UkCqeMU4LGDvRwkjsKqy+bqRxtoEdKt6X22mCV7l6FAju3y61hV7Cfm6mU
         scGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895678; x=1789500478;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7vlvzTdo6hc/Hb1ALKMfVG8dR36XZikTOJ3AgufLTsc=;
        b=M58n3MgSTI+Dm7u5HGstuHGs3498zchZnsowchm80mJf575Jb+erjg4cFGfTffr4/K
         MTukbeiX23kKCKh5SbMAJHGVf4L27ZrfAe0pxX8M3kVPJans04kg/TjGCzOVPtuWRP1e
         IjOgXABSBVa3eDCyQXIdAWXR73ikJNYW2Ed/llC7lB+IsCgSJpX+KoDU55NZK8oMwRDg
         x/hRm7/SpiG9FP+dcLFTRiXPIbVd/mOjI4Yo+kawgeAR2w/c9FYx7HjZsiD1YXlNPdxE
         xM+J1DngGjC+C0xkQQPrCuR5szKPJwGMEpy1MtkOHgfpM9E8hsa0R3VvKPU0FwzrbyQd
         ulnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/oZIl7HLciuXQmpPg4IMHr47VTNUMiA0OG746aXLg8Vp29nuXhLBx0ERRi3J3Q/pqWUwbpnZc0Js5VW0=@vger.kernel.org
X-Gm-Message-State: AFuF++lvJdRJqx697Plu4+bk0Qo/0Aqd1iO5GU/fddVe/FhssSeMFAPY
	dPg9SqLCzFTzDCbOrJeO6cIfoq9HH8D9joWJ9KEFt1aFD51+sJ6UN5BgDm3pbw==
X-Gm-Gg: AYBFou3eq20pAMDE8g6bTFX9rGJz/qlgYh3EF3+t8Fq+3bX+17y2IxZbcFgHowfv8JU
	R/IEaWEIoQ3rFgM6XGLtefilQoCAPYoroT04pR7aV+hlUeLQYqreyW2M+5mBMGLyxOkeSSgUZUl
	LK+kmWUSiuVdLpsBmbLB2MsS3v7egyboULlFDO2dZU4uAlqPK8RXn37W+9c5CQXUAT/qRQBsmCC
	u5cMvmcToSrdrEQoQfz+2H2g12Isef2nIJAvBWYAqQ4u8MT87LQNZRjUC7gsKr9JAwoxZUpPgMO
	6jWoO9/5jS1h2NO+cR/IbagFi+V2vu8Hnix/GfIwaBSlw2PX2W+ut6Eul/u38CjbEZ/OUb21QSw
	j+f3f6c5rYBGbgsBL6E6eNlX6OLA1omXt4swYg4H9ztZ2nRAUK4IrFzKNydUjKlQzMKUrL/Uhwa
	N4havjMlB34PmBypbHqFslOEMB1Fa1f9ZIekRaVGk6saQUxHHUDw5mbQRnGoZTIQ9ukjquPq7XG
	0BP82mmtMoOk+ajQi5o0OWiu1AIguMgMD6S1Q==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr44563242a91.14.1788895678110;
        Tue, 08 Sep 2026 12:27:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm27565947a91.10.2026.09.08.12.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 12:27:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <83e0d080-9b58-4f48-94c6-f7ddf4d2b531@roeck-us.net>
Date: Tue, 8 Sep 2026 12:27:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (yogafan) Update reference database and
 contributors for new models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <32638fb3-4f3f-4798-a166-3cf1efe0c424@roeck-us.net>
 <20260908184813.2353047-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908184813.2353047-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 11:48, Sergio Melas wrote:
> Hi Guenter,
> 
> Understood. My apologies, I misinterpreted your feedback and split the
> documentation thinking you wanted it strictly isolated from the driver changes.
> 
No, separation is per logical change, and the documentation should be updated
together with the code. In the original patch you also implemented functional
changes. I wanted those separated.

> Since the driver patch is already in, please either apply this documentation
> update as-is to keep things in sync, or let me know if I should drop it
> and bundle it with the next patch set.
> 

It looks like it has some formatting issues. Please fix and resubmit
just this patch, and I can squash it with the driver change. Alternatively,
submit both the driver and documentation update as single patch but, again,
_only_ add the new models with that patch. In that case I'll just replace
the applied patch with the new one.

Thanks,
Guenter


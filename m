Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865507;
	b=UQTtBokjqbU7ts7QKHp0YMRJSBgCTT/Dxykxg3hM/+mux8lD4sAWOUzHwtD/uUllJjK1
	 wdQw/nrW1Bi2UY05bI6O9/jtQfQ3NdJG36yR8IDI+vcP31my9B1eADeCqeQFFJY7LTYSx
	 mXqJWrooCLvC+A6RMCFj9VihRsuz4cOePb3Ztv5BG6ky8PBy/FQk7m4fsTmvTcjlX9OF3
	 SynanpdY6Xo/LEOmPBGmaiZI/E3AbyemsvdmvcAnzvBk7zHONTsm3TWUBwdoFKIfHnEsS
	 zU4lc8HhE2vg5iubS0B9OxSEim0OEG/llAffhwaAL1+kbb6b8BKI3QWLAFBCgUdd/0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9LcdG9WFpB5LuqvKh3Ca4mkyAaHpvvuN6mGaEVhMOmI=;
	b=YZNJ6JbNv5yelZrkEZOT49BxbSATq8no9a1ulPcA5V8+GG9asI3ZvE+51gSLgwh/6arg
	 nplJg/yYRS9cVmq1o61qPjR55II+yutv/MHuzSYnOA/pzxBH7Q7VnqQ4psNjZNUrRmDfB
	 EP57I1HNBM+rpqkVeby5EkrW6/c/SMMWf9y93pXlKAk5JV8kIZHS793rVWXK+i32lPp9H
	 +Q9a7efbH4jq19pb5104+lzGQO/wPee9JDvEU8pqRhpaU3tPNhE8jfyO8xk4mUCT+XYqp
	 6klT1x5PSEjSziQNGL4y8XX4+qBbkloWG2B4ojuq/KwtwW7rzMGYpBfy2BegurqR8sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/pAbmC4";
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75594606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75594606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/pAbmC4
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1817041e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865506; x=1794470306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LcdG9WFpB5LuqvKh3Ca4mkyAaHpvvuN6mGaEVhMOmI=;
        b=o/pAbmC4focyiVC5jgdCvgOihIWOBGH/2ysTvIsTIJU15IsBrSezafjVdTY12EtNNS
         v0nb1JUSqdTGjHS/JYHqvfj2F5AIhqAOQnGNoeK6uu2I/XtZz2lqBVmLOLDHxyGr/f7M
         9fRSz3uK5e87b1fV5AaQqijHUPkrH4fxoCsBE044ktN97WVewpQ2GA6ra+gAVqai4b5A
         gAKodZw6VD+bLJTFkQYmcOpCsnHqwtSJpEr6rsErrvLol2eIcvz3wyhllxS237NzMtkb
         N8eH3ThuS/qsyqWEVegi+HlC1i/nV1Cd/Qh0MgDmsEv6r9KPpzSiyfIX4pS0+H6cCBJy
         P8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865506; x=1794470306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LcdG9WFpB5LuqvKh3Ca4mkyAaHpvvuN6mGaEVhMOmI=;
        b=QdHmewKHoXlAebAD24cy0hAgHJ6NV+XBFvWZnKMGe6BRJ1mx0GfqpS6+6MSDn/qpBj
         HPYvxtL04rJaApqGlRvAkHFbrn4mOGRAMTF66gAAy5emzVBUnvJxyS5ku4hccku/bS/C
         sV0bzorHoo1zl+J293PKqlWbq0RV2OVYyI80/d4AwQzjhv6XgIarmOIpEOUqRYgFLV2Q
         /TdoFHYB2iRdqFU/p3IZd62yw60LmSi3Q83i6HaJDeO5HAnL9zG9URRDYgzKvN+K0IjQ
         WSlH+wItpj0/F3WPY95PGnTABIHK0VazYrLW+6KSgOeFp67v6+KnbcLkUVJS9sUKha55
         tW2A==
X-Forwarded-Encrypted: i=1; AKwUvBxBVuFNR4xWhVoJ2bit9CzHpqVBVahGG1FvgrZee9eRRMf7+gGO2fdnMphRNinRJznsvc4EZWd9nG8DLYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dWLACXp5XnH0u29nJVzG/GHdhuhmNNQz3lWCDrEz53gv+i2Wv
	pjdpLCKRAAVIm4OlCTK9nRyOYPAWlgh6cYBTLMRXiyvqg9auAsiajS+O
X-Gm-Gg: AYBFou32oM0uffQ8Iy9vCGZ4dARf6XAySMbS7hSz0vptEFTmKPQbffJ6rbxszNpnwwP
	tfvLHIgAwZSAY8Ri8HxnQv/advEzKkPLOcGwGhAyzafWxc9Lkw3gWmUpL+gZdINGcp0bdN5I3vq
	vprgJckTGoXTQmlPi9uOgyxGxHdexs4vBOArtBgy049UJcuT6WJjsCy/Wyzwx/FU3FVtwm0uhbd
	yNZdr6Ko6Du+ATCC8q435Hwdya1aggr5C1C8CAQdUfAYsrBaT+Mh1MbXjrw/RwHErXMubZAriYC
	tq1Qz3unOhe+/kFgumnmmUep9bcWNL0ocbxZyBSZh68QNPzoPV/7M0eyLRfiNbi8SWn1E0dhZ9s
	mSgyJ2qW8Z1RXSCmVX6+l4gW0b89AKmoFUM2WWsnrx0/jIepkZtmFNNzzmem39jp82868DaAya9
	LrAj2A6lWpTDg3wcPjGb75RCoJMN/u7pXRD31Ay3SMDHQiUgBLNU0SNbp8dGVryLQV8uJ/ZM28d
	7dCA96f9sQUHDiFQM5BE/n7LOlJog22YqBPZaAj9UGPyPbYQ4qu1BUK8fHev0hvpEroT0DkcmcE
	Mn0k/F9E47B98kGNy04FmaUqKasMHqqiK3mel1WmTjOzY4oDwlTkygSS8/WIGgbYJdIAW3jNqsN
	oI6lRjw86
X-Received: by 2002:a05:6512:a83:b0:5bf:fa79:9863 with SMTP id 2adb3069b0e04-5bffa799a9fmr455927e87.8.1793865505307;
        Wed, 04 Nov 2026 23:58:25 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff384c97csm710105e87.5.2026.11.04.23.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:58:24 -0800 (PST)
Message-ID: <a99baee6-e494-4f8d-b82c-9dec66a25ffa@gmail.com>
Date: Thu, 5 Nov 2026 09:58:23 +0200
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
Subject: Re: [PATCH 01/10] regulator: irq_helpers: Clear caller handle in
 regulator_irq_helper_cancel()
To: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jiale Yao <yaojiale02@163.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261104182148.1176116-1-lee@kernel.org>
 <20261104182148.1176116-2-lee@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261104182148.1176116-2-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:20, Lee Jones wrote:
> regulator_irq_helper_cancel() is documented as clearing the caller's
> handle pointer upon return, and takes a void **handle parameter for
> that purpose.  Instead, it assigns NULL to the local pointer h before
> returning, leaving the caller with a dangling pointer to freed memory.
> 
> Dereference handle to clear the caller's pointer as intended.
> 
> Fixes: 7111c6d1b31b ("regulator: IRQ based event/error notification helpers")
> Closes: https://sashiko.dev/#/bug/linux-5c3d3b21-3823-4654-bf5d-85407c5fd05f
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Good catch! Thanks a lot :)

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/regulator/irq_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/irq_helpers.c b/drivers/regulator/irq_helpers.c
> index cdbd170d2b15..7b25eae667e3 100644
> --- a/drivers/regulator/irq_helpers.c
> +++ b/drivers/regulator/irq_helpers.c
> @@ -403,7 +403,7 @@ void regulator_irq_helper_cancel(void **handle)
>   				destroy_workqueue(h->wq);
>   		}
>   
> -		h = NULL;
> +		*handle = NULL;
>   	}
>   }
>   EXPORT_SYMBOL_GPL(regulator_irq_helper_cancel);


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

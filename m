Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D14E56F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070845; cv=none; b=OW1L9B8ZmsGEI5PL3tM9Wd2EB9yvbiwo9uVokyzgVKVi0i3WO4o6HX5us2bJc2KqiGpAX0kRO90DG8odqbrS7V3F6hSaMlrL5eWtWVdDQB9DbdR/I/gxJADR3Ds0CGlqA/9vwJCRBLVATLCK+NDkHPBOch/I+KRUQXAqTe6vGIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070845; c=relaxed/simple;
	bh=sXVKg4EbmRu7yPh3SaS0wsgWNPj96GEMOKxp/SBRHrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIUaEjD5cFMM4f3ug52Orz/WWMMc5IQchLz4sO1AHBKG3l6iaBnoL07GD0gdLftubt0/shMaAQcFYOgMTdjWc0QEEvz2LZF/rJScYAML2HtCo3gJDFQDFMxx3TK0ooFzhWa9UPxdT45/t4+lznJnwpP9mwQkzwie2BFOfVbEVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVEVtb3F; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVEVtb3F"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so1169725ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070843; x=1789675643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qnsVcp0ygYged1uz6VwSHb140QB2xftDP7LSuWB3m0=;
        b=ZVEVtb3FeNTwDm6fV4RdYelQuniTtHHMuKCBt3IxPKZNXVzG6Ldtes10sRNyz1Er94
         9UzOjFindqwSCJwivwRPxwyopCPqSZP/LhIjczJEuJ/nzlR2CZphJnooo8gbtdb4/kRU
         8N1Dto9eOKTsoFMvBEEcSlj6aTXrjwEzP4YxH9J7NPgxqN1lBFOEjiQ+Rrqw2Yjr9R+m
         mtfPMJeUFniAg4FJ1JzGtmFEIl2rly7PneL2tV/TaVI4B0JLFBnRJLcOFxdcuFmKah92
         ymXm9WvZa/zD2Ly2YC1tqnX/RLVuIPR2LxhSkWFIKOCJpyayAA/MTa0WASxxx8qfbPxD
         T5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070843; x=1789675643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qnsVcp0ygYged1uz6VwSHb140QB2xftDP7LSuWB3m0=;
        b=BbxGTOJbznWPffqcWsPGsvnvKh5zXKG68SCdWx2ir3dsumBxOoVElxdwSXyBXEqmFD
         f8dwHA8LAvKCSSJfQpkcRk9+qP4w29uS9xnk5N5arcamQ2MBNevRYpU8FI0rZqQAcqwF
         RGwFUIeDrELZfZjQb6jUDE6fsWOff3jJdI9VKnnxiFmvZZpDCdoO0noxoMmUP8ha+prE
         YI0m+YDEZGfwa9FFOGfkl+3ZURamrwyS8iymzcAnGilZ753eTglINMhbbCpfsaIGNbS2
         oMbdPQKbjwsg8LWOvd3k4mA8WPgWHP0EjmBSY5TJ0esZ9H1Yvs3DqcRprsqfL6aMub5V
         auDg==
X-Forwarded-Encrypted: i=1; AKwUvBz+ijVt0AIBUO2KxBpTOL5BnAap0Wbb/2qUH7UH6K6AtY+T3jQD8A8oRP6HGX74Hz6aJBIj/kUeYaxIUGk=@vger.kernel.org
X-Gm-Message-State: AFuF++ksxKcdQr3bccPdAyH2ceynONCvJ7F6njQVe1GgVYgZN2b/tX7u
	/+tmBUiZto/70ja31CeHDbVAb27dbO1rRJI9YbCTYAus09GlpIDpLU67
X-Gm-Gg: AYBFou1R0z8hNiFtEEkOfRb+mjWKLQ2jJjUCJRQI+RETh+jre6r+HDui/nJQhE9ZN8Z
	qqKbRiLqUa343S5ORQOB/OsbrFWhLfx2NbTjOPdHf7pyWbz1+KK0Dm+qVnt3zstCO2dfQedeg4Y
	gxcHurEr9q52MxhMtJm/5C70GvqScTMaH79+BrY8tVzkmwdLOXbFqvz1bdZgzSdw+IojhKDwo+k
	fC4w+iPD+rUbScr+BhJu6BfvsvexF/zZne6ieZa5Hm5Cand2YBurYY1kl+21etm8olKa8fjcc5N
	5HqDevHO2XWaLO2RCLxUievZ/WO7b2W9JI6Y9grUcZ7LIVC32eDBXFwcmLWniEJqbzFnxUj7ucd
	59z+OPkKdxtiQ4px+tkkwkMN8/3r+cLIzYkG9WkJbfonw3jt2bHKDmzToz9j3iT3SuSu7jJPOL9
	0zEdmGj1VtKMAkyf0IaRDBGROLICVi8Mm4+Jz49nnEOYa7iDSZLzZidDBDmxN3sI0AmIUHJuiGr
	fW1QMqfASAI9u/Hs9mUDiqiqrffbDHnqDICqra0p4mkSCnOkJnjhFHvI5IyMdS2SQ==
X-Received: by 2002:a17:902:ce10:b0:2db:3729:22de with SMTP id d9443c01a7336-2dd29e0ecddmr24004245ad.0.1789070842839;
        Thu, 10 Sep 2026 13:07:22 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm387884eec.20.2026.09.10.13.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:07:22 -0700 (PDT)
Message-ID: <20057caf-aac9-4288-a82d-0f87fe1d3fc0@gmail.com>
Date: Thu, 10 Sep 2026 13:07:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] HID: hid-oxp: fix multicolor LED intensity scaling
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-6-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-6-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> The controller accepts eight-bit RGB components, but the sub-LED channel
> maximum currently inherits the 0-100 overall brightness range. This
> prevents userspace from selecting channel intensities above 100.
>
> Set each channel maximum to 255 and use the multicolor LED core helper to
> scale components with the requested brightness. This also replaces the
> private truncating calculation with the LED core's rounded calculation.
>
> Keep the existing Gen1 and Gen2 color packet layouts unchanged.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index c3cfa95..bee1317 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -1088,7 +1088,6 @@ static ssize_t oxp_rgb_status_show(void)
>   
>   static int oxp_rgb_color_set(void)
>   {
> -	u8 max_br = drvdata.led_mc->led_cdev.max_brightness;
>   	u8 br = drvdata.led_mc->led_cdev.brightness;
>   	u16 up = get_usage_page(drvdata.hdev);
>   	u8 green, red, blue;
> @@ -1096,9 +1095,10 @@ static int oxp_rgb_color_set(void)
>   	u8 *data;
>   	int i;
>   
> -	red = br * drvdata.led_mc->subled_info[0].intensity / max_br;
> -	green = br * drvdata.led_mc->subled_info[1].intensity / max_br;
> -	blue = br * drvdata.led_mc->subled_info[2].intensity / max_br;
> +	led_mc_calc_color_components(drvdata.led_mc, br);
> +	red = drvdata.led_mc->subled_info[0].brightness;
> +	green = drvdata.led_mc->subled_info[1].brightness;
> +	blue = drvdata.led_mc->subled_info[2].brightness;
>   
>   	switch (up) {
>   	case GEN1_USAGE_PAGE:
> @@ -1383,16 +1383,19 @@ static struct mc_subled oxp_rgb_subled_info[] = {
>   	{
>   		.color_index = LED_COLOR_ID_RED,
>   		.intensity = 0x24,
> +		.max_intensity = 0xff,
>   		.channel = 0x1,
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_GREEN,
>   		.intensity = 0x22,
> +		.max_intensity = 0xff,
>   		.channel = 0x2,
>   	},
>   	{
>   		.color_index = LED_COLOR_ID_BLUE,
>   		.intensity = 0x99,
> +		.max_intensity = 0xff,
>   		.channel = 0x3,
>   	},
>   };

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

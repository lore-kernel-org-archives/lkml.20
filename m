Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C095496D3F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071089; cv=none; b=o8HARaR+GIHK8pArK2Y5gHY/pfWye5911KOiDx3TM9DOnZ1GqI7A40wSQQvX9bJmDmNUT0SnyFXqqCTjlKA85mt2F0JEZQPMnfV7en6aCdCjdYZ/zEDkpTdIyqwiW8kblYS3tGvjUUhKPxH2hmqq6kdV27ouFD9t72ozN55xras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071089; c=relaxed/simple;
	bh=70JpcLWpChN9TggxfsupsPzSJyZcERoa5xrjGNGx7hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocGoXi/49qieECALOu2+efaQV+1vXNv/3XXrPFdUdztIYC3XbJCYI5N7Wgja7an1U2bi0wv1wRNOHdRnLUp9pUsphwnGauBDi/KYLb08p7tkJ3x9g91Sy5M1iUuXVgeQLLSJuDNAC5rA+C+pElgwT5+7gBikaSi/28H7Ug5ePfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0gO5fN/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0gO5fN/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso134350a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071085; x=1789675885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgdj2pqHYPEmivAmLwAJxzuvMuZle0+ZMxeCxj5yEEA=;
        b=e0gO5fN/yp5frL4o1ZPYeAgeCE7m4NrUYN5UXNR22c3+QQYGAAM66xJHloWAHHmpRM
         sd7KE59DMNLjofwor+qTL8S1pAdFXMRP5jrnD06x+8EDJTA7CcUHgyzGTISxUkW/184m
         mJhzDqnwnUCE+jT0fDnJb6wTnRIFi+4Q99GlLZw3PrlpHszOTGD25wIgMn/u8bjcTvpf
         fxIg05doB3U5llS66FcUO2mteX7xgXYnQCpD45ip5CekhWdjxj9cjKopPuf+wXGcaGOy
         Hwc1M5C9p94PyWWfPqKoEMt+Ee3EhosPo/ZzJfbOV8iS+W/D+SPMwsJVKhjrHZWa9DCJ
         aU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071085; x=1789675885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgdj2pqHYPEmivAmLwAJxzuvMuZle0+ZMxeCxj5yEEA=;
        b=GQEgo7ymXMBDgPU2mUkWywy1/SIq4zQrc2eWNnQ4tGkoLP2pLuwQV2G1zGR9IHRjmR
         SHryWSQaMvVcUpIpJU3reqi3f5ta/7hm+Ien7e0P+kZBVM37QRaUOL6mznPMrM8Q1Rdp
         3JL6y/rSo/eBcsk2Ly6GnXGk2Ro+oFtyxZJIh+YAH+rgtKeV96n28Jmrm7YBt/up8KL0
         CrrmHunspu0m7x+Y3w4kkPP339I+FyBsVaVEgstQFqWreCkEUO0hgaQ8Dyv3+sretAmG
         JaW+CIGrGKPjcFdjTwPswFr1ugpa5wLUDdw/lRN/UTWnKilSCFqUxFBa/dDdmupP74KK
         C8Mg==
X-Forwarded-Encrypted: i=1; AKwUvBy19Nz3G/gyvgIgfisQcG3FmRyEsyxlrgU2YAMOrK4WLN8EGgX6DLY5uIQEgUgVY3bu59JASGwBCerCiTM=@vger.kernel.org
X-Gm-Message-State: AFuF++nGNZhAWsELN3NO4E0H/rPnIyqhDtJf5QGutp8pGJzC7AIggI29
	fHRaTb0SeTFXM8IRxhH9pKpKu85gZYs96nX1uWgg1yoEaUQ6p9+6hsbP
X-Gm-Gg: AYBFou2vppqyyW2kiD/9FzYzs8d5wZvOv4ba/Za0G2tI9DVP2QCZHhba+imtD03ZCEQ
	8SCEXESMXW88zsa7N2ptjZ7AVSuxAlRaopWvS5slJHkD98Dw/8YfsDiAceiOGDoiSiI61lVIfwv
	/x82x1uPbFuYAQ/BeTVicIuRv8F96b/qJAwTkuJ9BZKHmWn9mYqs7nvoQwpInn1dS+g+Vy0cxld
	WlwM/nAPedfKOaMqkMdvOWl5lNUJueyWO7UgfIvf3/z7iZNu+BMkE/6llcj+fYEAZaQzOSpeYVs
	6M916R8xN9hRPgIfssiA87hOA8Wa4hrPlZFnmr6oTV0BGiZnmshtunemCGmBnxEq/LOiccFYsJZ
	Xxj61keOkN+WH6FZq2EOZkHxWSXbIg6XTZ9Bq0xy3z9qNQHQ88aSivwMXr0YQj6tq4mLefd/tqY
	yll0+FNJC5a5w2fAIXv0Tr9186CLsgASHzp1PB8/8o4bUUHBTs4Arq24odcUsfRcLfjpeV3QceY
	jPV96iERLmbG6CRuEKTnH67aVEzO9WiWHwFKCKUw/6RVobld+gSqv8FvlDgF0tYIQ==
X-Received: by 2002:a17:90b:582b:b0:398:c0ad:711c with SMTP id 98e67ed59e1d1-39d9c1d1f85mr626260a91.15.1789071085459;
        Thu, 10 Sep 2026 13:11:25 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm562594eec.4.2026.09.10.13.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:11:25 -0700 (PDT)
Message-ID: <d5714550-61d6-45a6-a0f7-2ca8b472ca49@gmail.com>
Date: Thu, 10 Sep 2026 13:11:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] HID: hid-oxp: select brightness policy for the new
 RGB effect
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-8-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-8-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Set the requested effect before constructing its status command, since
> monocolor uses maximum hardware brightness and software intensity scaling.
> Previously entering or leaving monocolor used the old effect's brightness
> policy. Restore the cached effect if either output command fails.
>
> Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 8d07816..9c22c8e 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -1240,6 +1240,7 @@ static DEVICE_ATTR_RO(enabled_index);
>   static ssize_t effect_store(struct device *dev, struct device_attribute *attr,
>   			    const char *buf, size_t count)
>   {
> +	u8 old_effect;
>   	int ret;
>   	u8 val;
>   
> @@ -1250,15 +1251,21 @@ static ssize_t effect_store(struct device *dev, struct device_attribute *attr,
>   	val = ret;
>   
>   	guard(mutex)(&drvdata.rgb_mutex);
> +	old_effect = drvdata.rgb_effect;
> +	drvdata.rgb_effect = val;
>   
>   	ret = oxp_rgb_status_store(drvdata.rgb_en, drvdata.rgb_speed,
>   				   drvdata.rgb_brightness);
> -	if (ret)
> +	if (ret) {
> +		drvdata.rgb_effect = old_effect;
>   		return ret;
> +	}
>   
>   	ret = oxp_rgb_effect_set(val);
> -	if (ret)
> +	if (ret) {
> +		drvdata.rgb_effect = old_effect;
>   		return ret;
> +	}
>   
>   	return count;
>   }

Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

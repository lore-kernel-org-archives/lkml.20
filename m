Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551B4A4EFD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069209; cv=none; b=f8/73BlRlUbHhv0WkLi20OCxrIXfTFfmVtNpdVQ4kGTb9RHw05GSfO7hpSJJGMqeZqDYl/C1uMc1+0/4KNu1jbfF4EYMeH3XfenowjQKFmABeo/QGzNz/9tOPdT125ejgtaf1bAZUxSUYTtwfVVGxzaJ9YsRzx7juqmKFMLVgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069209; c=relaxed/simple;
	bh=16EuTssqwYcY7F70h/BUM8kp38l/Q6N8yPmq7gB2Px0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZrlY1r3O1f2nU9UqVf7Z3SOzueeR1q50BAd4WvEON/WDdpEk/fSFKta/2Ygd9olc/NyYVPy05K3N3QyEvhQAjbtkouO0R+dVx8OWfdtk0QeeFyZ1gzPceWbBRPjK6AjtyhbaPSM62Pt+Ra6It2uQ3wA8Y6J+XNe5/PcTUJTA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TvO/4yHX; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TvO/4yHX"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6fe4372c5f3so762218eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792069206; x=1792674006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRJz94p2M/MzIGOAR59y6E7XPhv7pLCszJw1BEP/IR8=;
        b=TvO/4yHXA4OYdh5SQcaK6R5Bn9Qi9vl2PjcTbl6wQvPmV/PSRkz7MjIThjaCn7ol9T
         zlj7R82L5SpHI3EdrqgdWeL8CI0gAF/6T6ZGyelr9euzBwuTrg2BIPmVRobgNNB9APiC
         rl8OCnvLpTWblzG7Bk9GP1ABjPPq/Oo1tjigrnQ997aO4wSwNWHI+SKiTeg5t8DlN5hD
         uNQQmHVkpmPATcZ9dpe5LB+1p2OgNaP4XOS5E3rFGNjdQt/R7PLX3k6EBDVRb9NQYKzm
         RL8E4u84xry9F1drlBGRrqIMuaFyx96myNbz2Eitosb/hA9mkK0L/5+6Cb37J3aIfwEY
         QK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069206; x=1792674006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRJz94p2M/MzIGOAR59y6E7XPhv7pLCszJw1BEP/IR8=;
        b=GO38o9HUahR5yDRSYQvGR+ewN4TGtw1QIU1860ZlgVugQ2oA25W047k8Ed8RqK96w/
         JHCrgINRFcVHpg+BcfADzky3rHyKJKA2HCwVqPAvI8VkiXOBl2FlDAwgAyJ7/eSsTHEb
         k8V59/oaZLbarhJddjQrehrs2GI3tIZnCGHBgDdTaplGtKkc6Gt/KrBNwAi96xxuXl1A
         ybM3lh8F7pkBrFcbxsbs8MC5+PhT6WkoKr5Pdi+PZ2alrfr9WPyplrBdF/xb/DYQWhKY
         qs6ydymh6tU8WNXbl4WMu3NrZnrdgjsABiRWHRqNU5Dc5CCDzMML7hdU/39FkIOpCXsx
         8xIQ==
X-Forwarded-Encrypted: i=1; AKwUvBydLqAb+czeqgPDEMUBB42TvEHbSu2T9u1DwgckaBYMXEawi6KianIyAuuVJjJBmxtsAZE5vwvqE8X0HmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqfragRoFNH37jrUqW5jf23KZqWFhvtqLt5WN+L6j5+aHv3FtE
	xwF4SFKu1cDjqV1EHmsD2ACocvXn2EaWVfNX/u6V9I9Db6GDLgFoJKFXvyHc8wOk1Ic=
X-Gm-Gg: AYBFou1yzUkdM1/cdCR47zxiKYxWa4FprkWOBEb/PmK76cnSxfiVFzC7nmOoVDCgPpd
	OsEMEeiZJn2L+NQ1nxQ19Ho1xKFVIl6VknS77ny6Tio5nHoshW0A93RTS28akDjgYJ9vgzWHx5a
	UNGLlFlxkYvNWHUTsnyS9FGtLGMgrTm+wN0vnL1svdN3YczEvXiMj2WoSyfEKzkcgD6C4Hj7SeK
	2uMIMXoEEwpb+NtdiQ4C+qUA3MLGavNoDCa3ff6gE4Lr5GPTl3kQWyNFy7glZVVuJP9WBEdyjgc
	lZzejjMbbgehGcxSqhYrZC7vaKJZKxNpCKP2SOuVPRbul0pBFAScwEyjyVUdVQqFWvMa4Vr22jf
	9eVaH7rr9yME4MUOe915jfu6zS90OEAGUt6Iz1MAN2sYR5TYL2eu1T4XJdaUISAbz5KlWazxtVZ
	TmTRpRuQoLlbNb0/ceMx/0D6xg6traK525FcO7nzFMg0Euj4Jo2lbq6dh6G+jJPqB85QyPrf6vS
	dUVi4w+KucuF8NobrJ1khmunOp2iULj6HnUOiSRCyhJ5oM=
X-Received: by 2002:a05:6820:1791:b0:6dc:5ccd:a0bd with SMTP id 006d021491bc7-6ef0dcff9dcmr15609717eaf.33.1792069206163;
        Thu, 15 Oct 2026 06:00:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a64:39ea:e5ac:f974? ([2600:8803:e7e4:500:7a64:39ea:e5ac:f974])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f4a1303572sm10651029eaf.12.2026.10.15.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:00:05 -0700 (PDT)
Message-ID: <f8b97c1c-7dae-4eea-9d64-c2c81ab4ef49@baylibre.com>
Date: Thu, 15 Oct 2026 08:00:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ti-ads112c14: add gpio support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>
References: <20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com>
 <arom9T0azKX9jV5m@ashevche-desk.local>
 <f4ddbc02-1fdd-4205-b511-fb39329fa5f3@baylibre.com>
 <as46JtMAij8yqcVQ@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <as46JtMAij8yqcVQ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 9:03 AM, Andy Shevchenko wrote:
> On Fri, Oct 09, 2026 at 06:04:21PM -0500, David Lechner wrote:
>> On 9/28/26 3:36 AM, Andy Shevchenko wrote:
>>> On Fri, Sep 25, 2026 at 04:50:47PM -0500, David Lechner (TI) wrote:
> 
> ...
> 
>>>> +static int ads112c14_gpio_init(struct iio_dev *indio_dev)
>>>> +{
>>>> +	struct ads112c14_data *data = iio_priv(indio_dev);
>>>> +	struct device *dev = indio_dev->dev.parent;
>>>> +
>>>> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
>>>> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
>>>> +						     dev_name(&indio_dev->dev), i);
>>>> +		if (!data->gpio_names[i])
>>>> +			return -ENOMEM;
>>>
>>> Wondering if you can utilise devm_kasprintf_strarray().
>>>
>> That uses "%s-%zu" internally, so would add a "-" where I don't want it.
> 
> What's the problem with a dash?
> 

I want to match the datasheet pin name.

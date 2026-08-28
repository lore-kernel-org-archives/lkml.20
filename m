Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB9224AF9
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910691; cv=none; b=eRI+q6QTlf5P8tfxW3oa62kdxbS4LXR58TOjBnZsRoJCPSMwqM99F++WX27DNzRhVBBPMAYyKie3tqPGegQm5kOofdGCQV3UE+SaU+XwjDfa0wHVuEB226UKMfyyf+4leVxBi3eIPeInO5xNqNHtZ2Ek2brKnY6kZGdp5yKIdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910691; c=relaxed/simple;
	bh=YgKf8rPNlAy6eEsUqC5wwHsyqREJn1lfAA/Svf3ion4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G86uB+Z6FvgJKhcUhhDQeuOVE/71q5DnDUX9XNrYY+8oXwG9FkYffoawhAdUwW2RW5uTQWKmQHOZkBDu/ALDAWLnDIy4gZ3jhhWzyQu3vfAXaCuSWO94Vv28a3b39i0qUrtS91AyWucR2CdrBmh0ZVYjRU08ph7fd7WHVQV3uEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3g6+0hr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3g6+0hr"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso629490e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910680; x=1788515480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfr71wsqB8wCC6pMhB0diEVUU4Ylze5fQF263Bs69OM=;
        b=i3g6+0hr1EvHYn5xNRb02X9IuQLnRQbUnycJ+NxR8CsB9xSLQp4Q78Sj+2FspFVgtJ
         XfrkgI+5WuzPeNKO7k+SEY93yVELXV3kiPyvwsnUXssidCBq4x1Oa1RHCMJ5/21zhK+e
         Tx3PYg59YbKT/84naDZmDPKPmVdCsNueI6Gr1z/bFvuNelh0M8TZSYLGKEOEmSyI8FGE
         HoFeFg26oecP632Uc4bvWqBvCUFeCNV5AJ5H/VhH4XASJpmcXnQ6p8wurGar7ectiMoN
         rQZHcSxfOetnrTxCloD91WQU2sC8lYUKI8ZAZOkD7qM2rn007xsSEHNjacv/rH5OXRbp
         Ec1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910680; x=1788515480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfr71wsqB8wCC6pMhB0diEVUU4Ylze5fQF263Bs69OM=;
        b=UZ5N8+jQo2ZBv23kdcHW3kT1/czj2Ioy1/ILoKajIG2q+HY+4M3aiApSxS5mVBVpNx
         +hYmDZfOcHTjl8uipLz9NYflkROUxT3E6KN6b0/DMWziI+F93rXPcd0UyLZhfHiil7af
         A4XyV16gq82U6fpmfv85iSvOG0WlRe4mQUHQdKZlgFbqk+AO3nAoAtr9F3DCNgnI4xuH
         IYy340GPBN7lUMIiHOVbqnCQIU0GCc0ORB/AlRUj7wOVdqz2tiz+hsep4DKzT0wK4aAV
         T4wJvLp3R3T1SJ4IGGidiXtAISgsDcKodAFruU8t0wUf0yPPLm4zYS+kXKzGd3maecrK
         +rLw==
X-Forwarded-Encrypted: i=1; AHgh+RoR4ou5eNaOYI89qgkR9etAmWBn7xAfTCvQXtqKpeWWq0zfo7eCIdOlvpAWCAzcfPvof2pAvJ8RRRRRFmE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktbQsCG11oqxd+di2iufC97aSkjhvlSd7L5fHXqpajEeRSBQvY
	QYPdRVpvErQyEZ7PSlE7cnntdIJlxuue3yNkw6i4naYZvfgNpMtAMuM5
X-Gm-Gg: AR+sD11ABEgf6BgwUYqvUqRFOsBCrYT500JR3ekp3EUod7fK2NUwdHhh6idf7tqaVHi
	T+n2cDwZPK8Da1X+jjV+2n+zM3FwkwIRExDPe0jd43gSsd4ROg8XXlY5VCR0ecLl/bYEHwCtt4E
	EE8yJhOVlZxcKZwsoD7ujb0fVYWxVZlgKQ5u7Kgjg6LzMWKd2skNWx+VOPaoTFGmZGdGmb9ghsQ
	18wNH0TI3AWrzNHyHs4/N9hEgyK5qChHdIcaGhi1sR56zXsm0ekAKh9z6PBbdMH/otoPFKlFFrd
	6wkrKOqF9LGcWdaQfXwb5eZdIZZ1XDZyZsLi3XZuByT5RvePi6FA7hACvtW8X9K/Ek+axR62wwE
	K/V/+mrERiFby9dt4fZyIphSseA/KFMhYTFirHDvHhYcz9RKOlAdn5FeT3zs0PH6gLgGBohYoAK
	NaMMU/4OPs2KAm4GPbjrO4c0CAuJ57Z1jY9hOG06V7ZJzZo8OGU94QQDDhA6ZH1PDjyMJk4NASi
	6kU5/Shgyoa33pNzhhh8UjKbGk8AHl07Wf11LCv7pSO
X-Received: by 2002:a05:6512:224a:b0:5ae:befc:97a7 with SMTP id 2adb3069b0e04-5b5e68ec53amr1749105e87.13.1787910679358;
        Fri, 28 Aug 2026 02:51:19 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5e2dsm290343e87.1.2026.08.28.02.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 02:51:18 -0700 (PDT)
Message-ID: <1dd22b2e-80d5-40aa-b275-e8089601e093@gmail.com>
Date: Fri, 28 Aug 2026 12:51:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: accel: kionix-kx022a: Prevent memory leak and
 fix state
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Mehdi Djait <mehdi.djait.k@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1787901813.git.mazziesaccount@gmail.com>
 <9e4453fcc00df6ec988207df8916226d18aecb20.1787901813.git.mazziesaccount@gmail.com>
 <apE_RZJu37iMuWnJ@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <apE_RZJu37iMuWnJ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/08/2026 10:56, Andy Shevchenko wrote:
> On Fri, Aug 28, 2026 at 10:40:51AM +0300, Matti Vaittinen wrote:
> 
>> The driver allocates memory for samples at buffer enable path. If regmap
>> operation fails in the kx022a_fifo_enable() at the buffer enable path, the
>> allocated memory is never freed. Furthermore, the state information and
>> previous hardware configuration(s) aren't undone, potentially leaving
>> WMI interrupts and buffers enabled, or driver state flags wrong.
>>
>> Free the memory and revert the hardware configuration and state flags on
>> error path.
> 
> ...
> 
>> static int kx022a_fifo_enable(struct kx022a_data *data)
> 
> With
> 
> 	struct regmap *map = data->regmap;
> 
>>   	guard(mutex)(&data->mutex);
>>   	ret = __kx022a_turn_on_off(data, false);
>>   	if (ret)
>> -		return ret;
>> +		goto err_free_out;
>>   
>>   	/* Update watermark to HW */
>>   	ret = kx022a_fifo_set_wmi(data);
>>   	if (ret)
>> -		return ret;
>> +		goto err_wmi_out;
>>   
>>   	/* Enable buffer */
>>   	ret = regmap_set_bits(data->regmap, data->chip_info->buf_cntl2,
>>   			      KX022A_MASK_BUF_EN);
>>   	if (ret)
>> -		return ret;
>> +		goto err_wmi_out;
>>   
>>   	data->state |= KX022A_STATE_FIFO;
>>   	ret = regmap_set_bits(data->regmap, data->ien_reg,
>>   			      KX022A_MASK_WMI);
>>   	if (ret)
>> -		return ret;
>> +		goto err_buf_en_out;
>>   
>> -	return __kx022a_turn_on_off(data, true);
>> +	ret = __kx022a_turn_on_off(data, true);
>> +	if (ret)
>> +		goto err_on_out;
>> +
>> +	return ret;
>> +
>> +err_on_out:
>> +	regmap_clear_bits(data->regmap, data->ien_reg,
>> +			  KX022A_MASK_WMI);
> 
> in particular this will be
> 
> 	regmap_clear_bits(map, data->ien_reg, KX022A_MASK_WMI);
> 
>> +err_buf_en_out:
>> +	regmap_clear_bits(data->regmap, data->chip_info->buf_cntl2,
>> +			  KX022A_MASK_BUF_EN);
> 
> 	regmap_clear_bits(map, data->chip_info->buf_cntl2, KX022A_MASK_BUF_EN);
> 
> Which saves a single line, and the followup may shorten the existing code even
> more.

As far as I can see, the driver is consistently using the 'data->regmap' 
everywhere. Using 'map' just in one function would raise question if it 
is different regmap from every other place.

I am 100% Ok with anyone changing the data->regmap to 'map' throughout 
the whole driver in order to cut the amount of lines - but it is not 
something to be done in a bugfix commit.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

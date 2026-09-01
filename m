Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACA480DC4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280515; cv=none; b=XPb6jptV6WWEU8sEUHMogjSUGqn2yBjAj225N74RIrJrJZeFIUG7NHoCnWDImXDcjGlBXk+HoxZBxXZy8S07C9Fq4ifBLL9BubZD1fZcJGQZkozKXyJLjjW5euMggoKeOvMMsQlR72l6yxyNpLC2B1PR2fHHM9tdmL2F5BpHtbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280515; c=relaxed/simple;
	bh=rCcg9vrif69ZwmXACVaopDYlpdT4DXXi+eSGc7gUXo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKcXdGAESvCNk0AC+LlS4Yd2fmm3+shfeIyF78JEJQrvvhKhC3ow1BvSegOC4SDxSRMQZGj4QcmQAQJQEvq2NUR1BDHDfAbWeKIhOnCJ0GxQVtND2GZcBMeOB9FchgAPX2sKCwe8sLkUMBZRMl/gh2FY0SshtJ8LvvEFNb+XfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyDKO3jz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyDKO3jz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so46047715ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280514; x=1788885314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JPSia1XqMZa5rdnjOn7qFb9VJPSenwTQ1dQnlKq7yQ=;
        b=hyDKO3jzKNUqsKGNTfnojLVoRXC67mwzSU2qaqkpMuFKU9xnrGcukvKVvsbi29KyCD
         Ctx5nkzJdjxG9tr0HN8ky1i3zcEeNN41ftrr/IANhly46xwD5xMQCj3E5eWl8BNjYFqD
         8IhxgzSFL5KP+3itu5dAryeme4LSav+Y46lQpNuclA5008rMRrRvVcVJGJU340GGKb/k
         u5HHn8zQXt1OFqssbcwas7rQ6Ee/NzMXHjhHkC77Qvs9VMolKt1PdpJtb/5aF+PtyEvD
         4fIFApTLxAeJElNDdzEPxW6MyjUB7uEq55JXFFmnFD2SFiTxI2DkECdoF8h4MF4MZzYZ
         Bd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280514; x=1788885314;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JPSia1XqMZa5rdnjOn7qFb9VJPSenwTQ1dQnlKq7yQ=;
        b=ofNJSPTLr7ZYkpafqaQwXIxwFO1yVGYDyAyHntY8sPphZ2bBCZsVHbznHWNJAYVnFk
         iiiH4zelWtJYmkVJ63z5Z4+LC3wpGpdPgI4xFPYg+1DsdNrq4c97VFn0fWByWT04wHZs
         y9AE2t419tDF4grE1y1a2myVneizwbZdgD7PYitxcedWOnkXb1c4vhds7VCfuJ2prHrb
         eRtCK1lSbIXlUrDuMI2bNa0s7cSA39xBVl4i6Di88Bb16UPJDj4FydL7xCZ64oqrm4qE
         512U+KzcVljFmDLVdCfn07uNrl1f5d+e9wTcguYfLZZaTSIF8VvhJ/NMTbE6+QkfyF0q
         8A8A==
X-Forwarded-Encrypted: i=1; AKwUvBztkfVt+NF6qf+jNk1T7Qjh59vZ1l6q57xH6ZXCSA18VPyer5n86vB7o1UqeMgT0qDwZUVIfgxmm/j3qdw=@vger.kernel.org
X-Gm-Message-State: AFuF++n4KSw3Nvuf11tav7fdExUa6hMiNZwo53wIFR1DzVrbyeHHijbf
	lyR+eTUBH9Idse4HKcyI+OAO4GOQexOigmMk9VAa//Sd1wlFZX6Dr6y8
X-Gm-Gg: AYBFou3PP2/X5TQqmfJ98f8vL9EzuT7IE9Xmr0gB/uaURud/E2QW8dz4CtfShTvb2a0
	D0kDojF/bJuQUkF6BB0kNb3mXdJxOcwgCaKMHt4Oce/7BZCmU8C0oFPSt2f3Efk1yfLqsu4vlEm
	K0y7V1qMUcqZ6zbjD4/C9OlmdY1+Aw5r1qM1IHJ2AFTwQCD3PQ+qKqyHzlA0RqPf/8AbDJQa17s
	rU/Mq9ERyUbHIi5qFIzRadI+ldx0tKTuZbWtb4GzGLttrYWdEAQy0Z8gPjginrOirYmPK6A6G99
	JwgrvfG7P2oDOeB2OUeJwHeIBJe6k/5jyprxdm1rm7NopUxnNgDW43MtSCDZBzCtFXfij9xkvcA
	M2QTBd3E04zjI/4K/eM+Fb111GCTtfrJtOTq6jIuquUO6JsFnnFlKeL8SpW39RPEe+AaDrKzips
	5fUj3jIpr7jRLq2zPEWfcF8ojla1bHTTBM6WXZZO9Bt++F770wn/j5ZNdsdr1LrZsuL3wVsV3Iw
	4LOc8MxB9pGXSzfiXvpsLvuK1+aXhMN2H+68A==
X-Received: by 2002:a17:903:354b:b0:2d9:49b3:abac with SMTP id d9443c01a7336-2d949b3ac16mr155938775ad.18.1788280513473;
        Tue, 01 Sep 2026 09:35:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488d18sm1510595ad.45.2026.09.01.09.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:35:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <497d1e4f-a1c2-4d2f-9874-187da23dd8f9@roeck-us.net>
Date: Tue, 1 Sep 2026 09:35:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (spd5118) Select page 0 unconditionally during
 probe
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 ggirouard@bungeetaco.com
References: <20260831193424.95135-1-W_Armin@gmx.de>
 <555c7300-c742-4b91-a67e-5a4aa144bebe@roeck-us.net>
 <0c6c5e65-a781-4607-a43a-3aa25d794144@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <0c6c5e65-a781-4607-a43a-3aa25d794144@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 09:09, Armin Wolf wrote:
> Am 01.09.26 um 00:22 schrieb Guenter Roeck:
> 
>> On 8/31/26 12:34, Armin Wolf wrote:
>>> Some Intel i2c controllers can be configured by the BIOS to reject
>>> writes to the SPD device. This often causes problems when the register
>>> page needs to be changed, usually during resume.
>>>
>>> Avoid probing on affected devices by unconditionally selecting page 0
>>> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
>>> This will fail on affected controllers and thus prevent the driver
>>> from probing.
>>>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>> Changes since v2:
>>> - restore original register content if i2c init fails
>>>
>>> Changes since v1:
>>> - Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
>>> ---
>>>   drivers/hwmon/spd5118.c | 55 ++++++++++++++++-------------------------
>>>   1 file changed, 21 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 9724cf70b61d..038d9e6e6a73 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>>> @@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client *client)
>>>                        I2C_FUNC_SMBUS_WORD_DATA))
>>>           return -ENODEV;
>>>   -    regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>>> -    if (regval < 0 || (regval && regval != 0x5118))
>>> -        return -ENODEV;
>>> -
>>
>> Thinking about it, Sashiko has a point here. I think we should keep
>> the above code to have an early exit point.
>>>       /*
>>> -     * If the device type registers return 0, it is possible that the chip
>>> -     * has a non-zero page selected and takes the specification literally,
>>> +     * We must first select page 0 to ensure that we can reliably read
>>> +     * the volatile registers on chips that take the specification literally,
>>>        * i.e. disables access to volatile registers besides the page register
>>>        * if the page is not 0. The Renesas/ITD SPD5118 Hub Controller is known
>>> -     * to show this behavior. Try to identify such chips.
>>> +     * to show this behavior.
>>> +     *
>>> +     * We must also perform an unconditional register write to detect if
>>> +     * the i2c controller blocks write accesses to the SPD device. Some Intel
>>> +     * controllers might be configured by the BIOS to do this.
>>>        */
>>> -    if (!regval) {
>>> -        /* Vendor ID registers must also be 0 */
>>> -        regval = i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
>>> -        if (regval)
>>> -            return -ENODEV;
>>> -
>>> -        /* The selected page in MR11 must not be 0 */
>>> -        mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
>>> -        if (mode < 0 || (mode & ~SPD5118_LEGACY_MODE_MASK) ||
>>> -            !(mode & SPD5118_LEGACY_PAGE_MASK))
>>> -            return -ENODEV;
>>> -
>>> -        err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
>>> -                        mode & SPD5118_LEGACY_MODE_ADDR);
>>> -        if (err)
>>> -            return -ENODEV;
>>> -
>>> -        /*
>>> -         * If the device type registers are still bad after selecting
>>> -         * page 0, this is not a SPD5118 device. Restore original
>>> -         * legacy mode register value and abort.
>>> -         */
>>> -        regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>>> -        if (regval != 0x5118) {
>>> -            i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
>>> -            return -ENODEV;
>>> -        }
>>> +    mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
>>> +    if (mode < 0)
>>> +        return mode;
>>> +
>>
>> I also wonder if we should strengthen this and bail out if any of bit 3..7 is
>> set. 2-byte addressing is known not to work in the first place, and bit 4..7
>> are reserved in the supported version of the standard and should always be 0.
>>
> This would prevent the driver from being forward-compatible to newer standard revisions.
> 
Good point.

>> Also, if we keep above check, we should only only get here if the page is != 0.
>> That means the register value has to be 0x01..0x07. So we could bail out with
>>
>>     if (!mode || (mode & ~SPD5118_LEGACY_PAGE_MASK))
>>         return -ENODEV;
>> followed by
>>     err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, 0);
>>
>> Thoughts ?
> 
> Honestly i think that users should rely on the detection feature if they are not sure
> if a given device is really a spd5118 device. Manually instantiating a spd5118 device
> on a given bus address tells the kernel that there _is_ a valid spd5118 device at this
> address.
> 
> Otherwise we would basically duplicate parts of the detect callback inside spd5118_i2c_init().
> 

This _is_ the detect callback inside spd5118_i2c_init(). Problem is that the device
currently instantiates if bit 3 of MR11 is set, even though it is known not to work.
Prior to commit 7bf5a11dde2c ("hwmon: spd5118: Remove 16-bit addressing") it would
at least bail out if the controller does not support I2C_FUNC_I2C. That means we'll
at least need to check for bit 3 (SPD5118_LEGACY_MODE_ADDR) and bail out if the bit
is set.

Thanks,
Guenter


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676494;
	b=KNa5biZNdSeCqWKFViI3aLXPiAbVWuLts0zoer2eXJ5s7GEns6v7R5/PB35fSle9yyBQ
	 w3l3kMnMwDgsSdf5JNBvYpAN2dkTsoml7dNsCOtJba4ITtKwMXFzR3Go/vq3a1Y2lwPF9
	 iMgJC7ta6enIv1o+rlAAOQ9m5Oyn3DMsuwkqgM4GpSxNhqjJTP1Aayw//sflLNHzUWm4V
	 fd2j17GwOBok43mEEGfvZFz5K8tDtnMfWilQd1qC9NRqXF+KsISX7Q8UborVmlgRzAhjY
	 cIqoOOgOXJWFLKMDqPnaAq2jpY0oxabCY6UhBut/T6EW9JEfRnfZbVSVJt2QGIO/aKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
	b=VRMy3f3pBLW1l9rl7xiBVEsf+4HD1LiefIcIUdadRj+BrQDZckFQbXTS+xIuAyCnsDbH
	 UnsOzTptt9dMkLEAK7xlWEaw+Gzv2N/lLMssJPN68JAGjUsBPSzsjL6/9aUgfL6gzdzob
	 feEp7yVvcwZOfiKPDMEXZimz/AMCZA8VTMab693THLfHKdNB9BrTxsVfnoyU63ZFi5ikJ
	 zKBjXIzT90xWSFHph/tst+m591TdMQnovd7bXK120JVmH5ij2QoeJH+XFUd/zMCpKnRKR
	 eaZalDI33APL+bcXtWgGhsPGiPTBnPFomXcCLL7aVwYqL3hyOLEnfI2t3uyv/kbU2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fWbMUGya;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286BA606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286BA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fWbMUGya
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-49ddddefadbso821579fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792676492; x=1793281292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
        b=fWbMUGya2K7+Nmil9sN21MmZs2uisIuv3XoBjKxp76Oqek/RxwflASm7PxfbbtGlMq
         gpFH+AU+gInLjAdN4VcMTeV9lUJ8dX2opQ+H1x9vbOF8WYsb3vw/t9LgCRYlivJd/d59
         b9o79sYAXiGZEeNl5SFAMwlTsIC0Dlp4/3WiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676492; x=1793281292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gehmgppZeEU7bmBwwBNEsm7rSVlUxWbD/W3/fn7p9JQ=;
        b=h445D+wWAyb95EUjJnOhRtJ0JGp+ua42jPV1TGGu/1To/CxlHJhUIWRxqSEUcdWXcG
         WMpgK1yCgIrujjSJSCoapcl6IpaczmZRlu5xoQxL7or6mtcpX735bkq8lvi7HMNHNXly
         /c5qE2GuWdS4FOEpKwQ5fmXIhYMXeVQTMrPMW02FD2fDLFS2y59D4lQGwUbzFAq7+qCK
         IPXQTX/s3SsfQ6RWcC4V7ytcP9vHXT0beJI19elCPyjFCZR6y2Jyh0ejvpKLL4pRIG0d
         f+qBod5zopd80n+0TgoLdhzDqjXxxP6PupGKKeG6uZ6MU9Zwzo90tzUsSGjf+zqB+w1c
         iBAA==
X-Forwarded-Encrypted: i=1; AKwUvBxP9V0ve3GytXhBxBZ3cth+igevEN06/qXQ/i/qcIW3qQejxVOzfCapQWKFPNVoyfvZmEKVCiqrWOfbCzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKi4hNjDzkPhHEa+xGAYTT23NvzpUAXJ1HGavVJWBxx8byU0awW
	Z1icWbs2Bww2GQBLU0H3jEf4tt8IaOGX7lsDmMvRRrFxA6HAeoa2hCybtjS5HMWOWA==
X-Gm-Gg: AYBFou3wChS1XPTRbNziWR9E7djoSHfIQFA3fj237JRBrHbXwSdEhelhQavaNGkQqhk
	qusblSy5hTviA3rgHPqi5iYEtXeAef3FW4Bie1vHEAOCCmmttV1ODNVI9zZnLnYE+j/xUTLT6KA
	D76LxMopcO/gXHQTa61th2+K7h9m+IRSFyoTd2tIObjJ7O2zdYeFIidcg9CoNubyhUF4m7cyUnZ
	/H3IoIM2yBwoFteYcEPncZrDhafYMge/PP7s+dWFAmzVWkx/as+526YzU6ItUNUC0aqZIekVTpi
	8s/JW3f4ihUJu5pmF8nGqwlFAy5EukEo9GV+r7fTpTe0FHS9Oi5pTKgCCb7bGzgwdMfkxOvg9FZ
	VsrxXQGRCuQJM5JS5lC83ZCRuAYXnbIkzZn7gBZcs4QHAJd3q+gGy9VXsgHOQUOKMeyyK/xNfK5
	LFMezPYD2cOeSJ4EGJylG3C+dncZKymxrGqRL9AsEYZFOham/GTJcktRz4zajldnPDXMycTu4cy
	9pCQU8kjWqi0HzuPZP+qwYQLtwHwDalLt/mmA6A6kE3Ld3XqwE=
X-Received: by 2002:a05:6870:9a8f:b0:4a2:4dcb:fa75 with SMTP id 586e51a60fabf-4a7dbf5c94cmr3318921fac.2.1792676491930;
        Thu, 22 Oct 2026 06:41:31 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4501140fac.1.2026.10.22.06.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:41:31 -0700 (PDT)
Message-ID: <4c393ce3-41ae-4f4e-9af0-4eb7cf1c425a@ieee.org>
Date: Thu, 22 Oct 2026 08:41:29 -0500
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
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
To: Julia Lawall <julia.lawall@inria.fr>
Cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, vireshk@kernel.org, rmfrfs@gmail.com,
 dtwlin@gmail.com, linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
 <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
 <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <d0a4a257-1ec9-7096-11db-5ff4b3244bac@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 8:35 AM, Julia Lawall wrote:
> Does anyone on the greybus list know anything about this person:
> 
> Bryan O'Donoghue <pure.logic@nexus-software.ie>
> 
> The email address is not valid, which is somewhat tiresome...

Bryan was on the Greybus kernel team.  Remove that address from
the list.  I'll let him know that e-mail is bouncing so he can
add himself back.

					-Alex

> 
> julia
> 
> 
> 
> On Thu, 22 Oct 2026, Alex Elder wrote:
> 
>> On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Unsigned variables are printed using %d.
>>> Replace them with %u to match their types.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> I have reviewed every one of these and they look good.  Quite a few
>> of them--because the size of the value being formatted is less than
>> 32 bits--would print correctly no matter what their value.  But I
>> think it at least does no harm to convert the format specifier to
>> unsigned in all of these cases.
>>
>> I have highlighted below an existing bug that should be fixed.  It
>> gives an example of something to look for when you do this sort of
>> activity.  Please arrange to get that bug fixed.
>>
>> I also pointed out one other observation for you to think about.
>>
>> Thanks for sending this.  I didn't check to find any other instances
>> you might have missed, but you seem to have found quite a few.
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
>>> ---
>>>    drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
>>>    drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
>>>    drivers/staging/greybus/bootrom.c        |  2 +-
>>>    drivers/staging/greybus/fw-download.c    |  2 +-
>>>    drivers/staging/greybus/fw-management.c  |  2 +-
>>>    drivers/staging/greybus/gpio.c           |  2 +-
>>>    drivers/staging/greybus/light.c          |  2 +-
>>>    drivers/staging/greybus/log.c            |  4 ++--
>>>    drivers/staging/greybus/loopback.c       |  4 ++--
>>>    drivers/staging/greybus/power_supply.c   |  2 +-
>>>    drivers/staging/greybus/raw.c            |  2 +-
>>>    drivers/staging/greybus/sdio.c           |  4 ++--
>>>    drivers/staging/greybus/spilib.c         |  2 +-
>>>    drivers/staging/greybus/uart.c           |  4 ++--
>>>    14 files changed, 41 insertions(+), 41 deletions(-)
>>>
>>
>> . . .
>>
>>> diff --git a/drivers/staging/greybus/bootrom.c
>>> b/drivers/staging/greybus/bootrom.c
>>> index 83921d90c322..fb1fbd3f7b99 100644
>>> --- a/drivers/staging/greybus/bootrom.c
>>> +++ b/drivers/staging/greybus/bootrom.c
>>> @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct
>>> gb_operation *op)
>>>    	size_response = op->response->payload;
>>>    	size_response->size = cpu_to_le32(bootrom->fw->size);
>>>    -	dev_dbg(dev, "%s: firmware size %d bytes\n",
>>> +	dev_dbg(dev, "%s: firmware size %u bytes\n",
>>>    		__func__, size_response->size);
>>
>> This line actually contains an error (and it was there before).
>>
>> The type of gb_bootrom_firmware_size_response->size is __le32.
>> So the value being formatted needs to be converted into CPU
>> byte order before being used.  That could be done this way:
>> 	le32_to_cpu(size_response->size)
>> or just use this, which is known from a few lines above to
>> have the proper value and byte order:
>> 	bootrom->fw->size
>>
>> Please add this to your list of things to fix, and submit it
>> as a separate patch.  This would be a bug fix, which would
>> also give you a little bit of a new experience.
>>
>>>      unlock:
>>
>> . . .
>>
>>> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
>>> index 4f1b3f4db404..2314496a858a 100644
>>> --- a/drivers/staging/greybus/raw.c
>>> +++ b/drivers/staging/greybus/raw.c
>>> @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation
>>> *op)
>>>    	receive = op->request->payload;
>>>    	len = le32_to_cpu(receive->len);
>>>    	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
>>> -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
>>> +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
>>>    			(int)(op->request->payload_size - sizeof(__le32)));
>>
>> The above size calculation was done somewhere else without the
>> (int) cast, and the format specifier was %zu in that case.
>> I don't think this needs to be changed necessarily, but it's
>> something inconsistent across the Greybus code.  Consistency
>> helps readability and maintainability.
>>   >   		return -EINVAL;
>>>    	}
>>
>> . . .
>>
>>


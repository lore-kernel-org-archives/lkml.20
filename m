Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697373;
	b=LYbSpytPhgMPnPVRSZAdpYV3E4ONTOzy15H7eKVzEeTTqFV2lP23I0Q26PNVkkIarfMJ
	 odiKZut/BWmAkQ0N5vjHOwqXALjlEKR/pEgp+9jIgeNnGLI6vbRpiwKV3cf4AU3QN1K1t
	 Le0pH+yF8JAGgyZpQZ1Z3yz9rmq4Aw2cjAsOa5dN/nLwxmm4aD+y5VJS/lcgXYbdOjsqr
	 0Qh3RnLmwqelHSGc0/MY6C+zDz8WT3P9kl3VzCAcA9IAE7bJKC4CyoquU45Ej4y+nGtXf
	 BZj9a3RlA3oOmGQhYjRc7otpvVvmFvS3BpOg+ONgbDtxZrwzVcI6zDlOHBTAdARWwQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
	b=ylxX7XD5k+dq/I4bnTMRHZjkPq4f5oT4hmEpN6017XWL+Bm/GujfC6jBf++A4tq7z0bo
	 oGnH4QlNKvJCWE3JnyGHtrTMLw47XURzZ9IvDAdYSvochzkKOklRfoI/GWTvcl6p5DSE7
	 FHpt3V7ugF2CfuEQMeJPikL+DgpGl8xC4ewBJ+BF1D5f4tz9i+mw60ZOowU+DnmfoT5ti
	 WGUAPLcdtClunL6PS0m/OlIRsDttVqRVsledhEw0VtFwD5SPxW0vt0JpezSHSFuMLL4Rv
	 GiNBuQqhpdVEKsr6tbUnVr8FNeaWbAaZh0RtV0fThljG18Rggg0TFDkgSkEfh1d7MEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OPrQxawG;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA724606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA724606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OPrQxawG
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de1ca1b05aso104933eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792697371; x=1793302171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
        b=OPrQxawGwlnDpw5uY43sifYd5c/xLnZG0farwLqGa+sabqukoDv26jrNhJphHuBpp9
         bhYMaGIwkqrwMvSCr8Ua8qdvIDoN8SpLCIdFY7rggGccwDgxxzUDGhxZJwxRGuTH4CjY
         Puc4C5mVvkrz0LxmWKc0ux5GQHubWRBCWqLAf4iNidtX+QFHHl/2FXbF1m4/JNBQAiyD
         8V4iWjV8SGEJHQNViRvUoEw4wD2pCy0RsH9mcIbQfegIIeu6sgxOV0YBulHziwvEhokS
         rRgp8sCyknSSh2wA3XewdCy7FXEp3cglGOJom2EddjT7ERT6O01mRrw6s3HdNI+9J/Wd
         XfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697371; x=1793302171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtIDxskl9CL4u3HCClPUlqLnyLEWtYjRFUBbhD8dpoA=;
        b=YAdmGV4AjVglLWKiSp80ggOWmaO+nXDSOpBDLlzO5cvc7NZkqEsEnQWr0U2ibTd7EZ
         VWe8E52PxwJ4hxJzp06Hc4KxrhM8Oa6lHVqQWgd67S/nDKT7Z5Yl7OlYRlYgV8nDrfkp
         5NXYZXC+6NeaXzmMXPxUXmP2nlgSlDGdqbVEku6QGxUjXPmEifKwXG1QeL1vbXokYNuU
         3RFJqknuwz/aoHNNjaYIsDz2WGUOHvKiG4H9M4QWkcF9WUJOj86ahqSxJKna58WQu5by
         BSXQgXBeU7MLyG3iPSMaz+mnI1cIxOsSHnryRrtuBejD7QL6DX7Dd+zmkP0ZBdgnwZI+
         nEww==
X-Forwarded-Encrypted: i=1; AKwUvBxV3WxBivPgtGW9LJUiO9KvRctoI1mVAMo6EdZWmUW3OC/7X2kBqyCltXwqEhgYsfVm9L3kahK+MP8ex2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrSEUfSVbiflLkB8kwq3MxX5gyRLu/0o/lHszIb5dgY8j0Ql2w
	wkOg9y2EW8hfADhBFm5NAhS9eXGOeYgdaoP2hUOAE/h/nae/VhcUHItW3v2OfFd2Sup+kbVQhuM
	EibCN7ik=
X-Gm-Gg: AYBFou2lvwxgY6gvwDElrj7YDBdG504+fMtzX2ytzCANmTeWSqYkIMAW48J+dO3MJu+
	GU56SIyzjVUWzWl7Bir2mgh7YkzSEBKlhxAJ/f/7OD4VeI9qoSy4OnDOMo7FLEQiWo7Oc5UE1z2
	QAU9eJTGBozUtmSb+fdRZXIxAf8+NWZhplBkbgzK2ndbtQY+RWDC9r/HcriLwqOSSNQLAfoRRO+
	5pjm50Fxz6YKvgfMRNiFdo96i6qIZNgFfx2Q3dU+ZY1rem2ureUGUbpuYpruysbFQ6g+Swe2CJG
	hT3Z9PcBWywDf3C84NOyAqIAT5FIHd536Sdob2HQ90bENDDgYRCSbt5F2gzFMk0RtH8ahp/J80R
	KSW/sJyCsiOi3se+uwKAnE9XzFa1PWVEoDqwkYPwln7MTAjhb0u2IGbjl1MrlAX+l83sbGy+LEN
	syH92iCfJQn86XtJAPOJSUzWpRLpg46iu+vdTHIFwYMqLEhIFFsyZIPdpvStZaHby84nUJ+hBqO
	YkSoicch4cDKHlaX5pt6aIFU+vMZ7Wu90Xs4XAwZhM4mzieKwcwDO5S
X-Received: by 2002:a05:6820:5611:b0:6f6:b13f:5d2d with SMTP id 006d021491bc7-70b8884d3acmr221772eaf.12.1792697371436;
        Thu, 22 Oct 2026 12:29:31 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b266f0bsm19815eaf.6.2026.10.22.12.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:29:31 -0700 (PDT)
Message-ID: <c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com>
Date: Thu, 22 Oct 2026 14:29:29 -0500
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
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: greybus-dev@lists.linaro.org, outreachy@lists.linux.dev,
 pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
 <6d683673-39de-4986-a593-68a5a495e764@riscstar.com> <atpggBthwjZIFwXR@user>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <atpggBthwjZIFwXR@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 2:14 PM, Yalagada Pavan Kumar wrote:
> On Thu, Oct 22, 2026 at 08:28:23AM -0500, Alex Elder wrote:
>> On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> In the loopback function, usleep_range() is used for short delays
>>> and msleep() for longer delays. This requires choosing the delay
>>> function based on the requested time and converting microseconds
>>> to milliseconds when using msleep().
>>>
>>> Replace both functions with fsleep(), which selects a suitable
>>> delay method based on the requested time. This avoids the need
>>> to choose the delay function and convert the time manually.
>>>
>>> Suggested-by: Alex Elder <elder@riscstar.com>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> Your description above is pretty good, but I agree with
>> Johan's comment.  In fact, you should think about and
>> understand exactly how that behavior changes with the
>> switch to using fsleep().
>> - When would the delay be different from before?
>> - When it differs--by how much does it differ?

FYI, I was not really looking for a response here
(other than you sending a new version of the patch
that provides some additional information).  I was
simply suggesting the way you should approach
making a change like this.

> The current code uses usleep_range() for delays below 20
> milliseconds and msleep() for longer delays. When using
> msleep(), it converts microseconds to milliseconds by
> rounding down, which can make the delay shorter than
> requested.
> 
> For example, a requested delay of 20,500 microseconds
> becomes msleep(20), which requests a 20 millisecond
> sleep.
> 
> With fsleep(), the kernel selects the delay method
> based on the requested time. For a 1000 microsecond
> delay, the current code allows 100 microseconds of
> extra time, while fsleep() allows up to 250 microseconds.

Well it depends on the value of HZ, but I think it's
typically 1000.

>> - Is this amount significant?
>> And the third question gets at exactly what Johan was
>> saying should be included in the patch description.
>>
>> We want to know not just the mechanics of the change,
>> but at a higher level, what is its effect?
> 
> The change may affect the time between loopback operations
> and the reported performance. The code does not seem to
> need an exact delay, so i think using fsleep() is reasonable.
> However, testing is needed to confirm its actual effect.

This is technically right, but you have already shown
a little intuition about what the change does.  And
my point was that you should approach making changes
to the code with this kind of analysis in mind.

Simple fixups like this are great, but ideally they
should produce *zero* change in behavior.  In this
particular case, there *is* a change, and you should
make sure you understand it, and as Johan suggested,
make a comment on it.

> I do not have Greybus hardware to test the driver at runtime,
> so my assessment is based on reviewing the code and fsleep()
> implementation.
> 
> If possible, could you please check the runtime behavior or
> and let me know if you find any issues with this change?

I am not set up to do any testing like this either.
I don't think you strictly need to test this (other
than doing compile testing and things like checkpatch).
I'm just trying to suggest good practice for you to
follow when proposing changes.

					-Alex>
> Thanks,
> Pavan
> 
>>
>> You don't need to provide a super high level of detail
>> in this particular change, but you should demonstrate
>> somehow that you've thought about these things.
>>
>> Please submit a new version of the patch and reword
>> the description a bit to concisely capture why it
>> makes sense to make the change, and why you believe
>> that the change in behavior is likely harmless.
>>
>> Thanks.
>>
>> 					-Alex
>>
>>> ---
>>>    drivers/staging/greybus/loopback.c | 8 ++------
>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
>>> index efc69c10cffe..2fe845eaef29 100644
>>> --- a/drivers/staging/greybus/loopback.c
>>> +++ b/drivers/staging/greybus/loopback.c
>>> @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
>>>    		gb->send_count++;
>>>    		mutex_unlock(&gb->mutex);
>>> -		if (us_wait) {
>>> -			if (us_wait < 20000)
>>> -				usleep_range(us_wait, us_wait + 100);
>>> -			else
>>> -				msleep(us_wait / 1000);
>>> -		}
>>> +		if (us_wait)
>>> +			fsleep(us_wait);
>>>    	}
>>>    	gb_pm_runtime_put_autosuspend(bundle);
>>


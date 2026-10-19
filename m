Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC774EC662
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411785; cv=none; b=Wb7VwHymX++EoAehqJtnjsJYL//h14c93EM3A9zK0kn7CeM4/yEVBFJtjFAxP1ySOxQyF4LdQXd60HJiuX+lnoiwv9dXgIfe6jmnBbhAzf2iEWvlXp4q5HNt8D1iu1njiFc7r26izQJC113PeBDrNlb1cSxtjr2kt2M62MdblFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411785; c=relaxed/simple;
	bh=nVoYwK6h+y+Te91/ACo26V6pW3by7vFNDYQmaVQSNIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVFZfdEnZnWHH2IrguwGXDIsPJQ0uWH9PEe1L0D49Zl2A0AP1YYWQUy+j+cYYZMvzwqww2pgzXxba7zNIXJ1fCULbJQ2WXGt42BDvfsx+VC8O2Cq1L4ssRjc8A69dKBQOJM+VOjlJQMbf2NcrALeeo1vkGQQy1WHou2pdlelNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=ZyjxxT7Z; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="ZyjxxT7Z"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53397554beaso24083621cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792411780; x=1793016580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNC7zOFArXbnYHi9LwZ86fn2ykdanOuG0zEVBU7RnSA=;
        b=ZyjxxT7ZpGj1OlokyjKW32adDrDFozIR+qmHW8MAQ1G1M0I/iBX1W7Lk15iVMYfHhs
         mjdz4wSEOH1g/lnJY+kGjeyIbI3PdfsETqp4Ez6REhTA961sV0lvdQUyqHu8zEheZgOH
         qoMgR3D5s2Z7WoWgqppMSyuWpYjI2FGpTbsAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411780; x=1793016580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNC7zOFArXbnYHi9LwZ86fn2ykdanOuG0zEVBU7RnSA=;
        b=2RvnyajfdhnauO+7C38s3qCZlAcl1We9tYZXc416o5rfqYYpIPWY2bYIGnGpIsNOTu
         XrgeTBYtvrytZA5TBdTLPx0DlJ3DnA00uvOUYByw5lbn2pGBIpgXD5AN87bNG/jlYVa6
         mIgjEHsBWGr2mKBYAV79/c5eTXvfYpZBwz8/f39cJXgHgwVjjxHBgI23kkx1WeanJrhY
         Mjqg/9j/CzW1znAz/hAc5RPQhz7+VUHRaJw2E9r8P16OmBnJtMbZh4dnxUcxi/dGdKXZ
         KBWY/OOLuw1r4p5GZIHyZoAaQe3UrRqElZadvJMF6sxfirTqRtOt34iAO09CXOzDuQ1J
         VKvA==
X-Forwarded-Encrypted: i=1; AKwUvBwdgRtyIUxNuZ/st/ztrAOT3wlEsA5wdUrIyoHCm9p+cNRds4TfPm87X9G52XH0ixD4Ej6is4PMJnJEsmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfMhGS7IfD3byAVZ6/OfsVqKI7VBF0O5o1Kg9pmT4lc1R0+wGO
	F53gE2+2t+UkNCiThOsDb1yiT8kYjAPGkeVits0zb1CCjsAMZv0EHIP3gAjtpaPNKA==
X-Gm-Gg: AYBFou2oow+Y+0RKJkPrbJfPYtNvyPaQIc0NItLmHiA5NGORewVX5W+4y60+80+abF/
	FhaYu9LT6QoWX/xNzj7lXdsyHD/FeViEjCi7gMM7oSOGPcVKTGZSGj7HbAdvh0HpA/AVp6luGlh
	t4BBsRiDQpOwpsCC5qiwwAOEdOJQxsdHQEspT0ygR4j+iZoMfcVuled9xFcgEKDi0Hw+Uw+UMVw
	ACXr2/mBWrbN3aFz5kA0qC4hg7vbLZw6729CJgbcWsdVict62wtkM7O6Qk/mchE5P/Rneuk0DmN
	eQQ7QGruUTcjDnoPzKYwNKPWdrN6kELidYgw5lM52I3IOZPMcq0yWjOz5sKt45EVgFzWKM5CwBX
	IysRruFzdb2dVIm8nJBW2Xd/Q3w5H+ICGYZb91aafdid5VD2mRRMlZq91cGCbpELErPSjm+erTQ
	jKdxdKr2OINsVD9tAPScIF6aqTDZdq7zoCjXoaLplCBZOoB67s39vOBX3R4gZ0n9psFXwZ2PB9B
	rgV
X-Received: by 2002:a05:622a:144e:b0:533:33ed:c39d with SMTP id d75a77b69052e-53645c1fa2cmr98728271cf.7.1792411779813;
        Mon, 19 Oct 2026 05:09:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-536448b6ce6sm72242721cf.28.2026.10.19.05.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:09:39 -0700 (PDT)
Message-ID: <e24ea2a1-9fad-4990-8392-fa075217f3fe@ieee.org>
Date: Mon, 19 Oct 2026 07:09:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: greybus: use %pe in error messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, elder@kernel.org,
 dtwlin@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Elder <elder@riscstar.com>
References: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
 <atXDvg_u1hQAZiYX@hovoldconsulting.com> <atXgBFNsXG6w30EQ@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <atXgBFNsXG6w30EQ@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 4:16 AM, Yalagada Pavan Kumar wrote:
> On Mon, Oct 19, 2026 at 09:16:14AM +0200, Johan Hovold wrote:
>> On Sun, Oct 18, 2026 at 02:19:25PM +0530, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Use %pe to print the error pointer directly and display its
>>> error name.
>>>
>>> Keep PTR_ERR() calls when the numeric error value is needed
>>> for returning the error code.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>> ---
>>> v5:
>>> - Drop arche-apb-ctrl.c and arche-platform.c changes because the
>>>    files were removed.
>>> - keep only the uart.c change, as the fw-core.c changes are already
>>>    present in staging/staging-next.
>>
>> The commit summary (Subject) is a bit misleading now.
>>
>>> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
>>> index d47f00751e7a..74c9898c0eed 100644
>>> --- a/drivers/staging/greybus/uart.c
>>> +++ b/drivers/staging/greybus/uart.c
>>> @@ -956,7 +956,7 @@ static int gb_tty_init(void)
>>>   	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
>>>   					 TTY_DRIVER_DYNAMIC_DEV);
>>>   	if (IS_ERR(gb_tty_driver)) {
>>> -		pr_err("Can not allocate tty driver\n");
>>> +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
>>
>> There's really no need to print the errno here as it will always be
>> -ENOMEM if we ever hit it. You could even remove the error message
>> completely.
> 
> Since the error message is no longer needed, I will remove it in a separate
> patch rather than in this revision.

So doesn't this mean that your original patch can change from
adding %pe to a single spot, to removing the error message
entirely?

If so, I would prefer you just do version 6 of the patch that
does exactly that.  And if you do that, you can preserve my
Reviewed-by tag.

					-Alex>
> Thanks,
> Pavan
> 
>>
>>>   		retval = PTR_ERR(gb_tty_driver);
>>>   		goto fail_unregister_dev;
>>>   	}
>>
>> Johan


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761488;
	b=zwZQ9ztaD44uIJFB+V5EeBIeYASoRlrCq1O/eyNc9+pFSTrNvWJbrhc6347/xZ2YNsmt
	 0hgj5vUjTWKy5fLB/KY9eEQgQmtqDsM62BigUNQyY4o59JKaEJiqUuIj+OpkcUNlW+491
	 tO0dU1Gr18FBzMsnpWjE6U3+DaXBYh51QFcs+qwS+Oz6eNx9OdAeBQriFgL0Xrv1E2TAF
	 ja02X3U5Y+q5y79Vg41ZNxgumsbJlxNDg1zWDn7xwK1kovWkUw81Quy+vW+X9x0n7en24
	 RXWD3SsHAPITDPBTk+5BzFSY2TVsCAK+ZzgkoLwS3QIInsa+n802TWwDhW/hKqyNRiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
	b=jRODHaT/c9XiE6b5bqw4utoSSH4GaEiNJTBw/R7BNRrlNofBfgGQhHvK7mLprDH+hcbO
	 1Gxy29SS0F9HhhrZWov4lPohhop6zgy7C8T35afd2UDS8i4IL+i3/pJe0yxAtGcKWEwe3
	 NT0xoBeQcOxKndk6RN6L3rFIfO3o8v6WeMmuHAplEznFjeeuTOIMvGXneSGI8bEKPewbj
	 WX9zoGS3z2yWKt8yCrGpkSVfdz8he4mpPmcVfL6vtLo5bfHvJGV37giEAV+mkEzj56ot0
	 ip8UiVdH49gGBHSvOtLQA4wp36fqpwTmq/JiBOJ5U/zDNZBqa2n2OpNgWTReF0kw/Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=n0rWQwXy;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB878606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB878606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=n0rWQwXy
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8490a7d6696so461842a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792761486; x=1793366286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
        b=n0rWQwXyIV/EIUQujoilUdowokticzbV4wcb8j3mOhEPTuEJh/IvJPf6BafOM4nnTj
         /JZ21xQhWrNbnAlw46vrfVXGKf2o8vS1mPE5TkZgHpUp2hpOA/bZqWNXDEyTPMXA6via
         Dl6hEi/vjLBipabZhZA9DLV+vlgM0eH3pqBMuYd2NXES5sW99mufVMJzXeCXc6cs7EWe
         RFvi73goDtwvepcVThgzMSJ6mug4TAkEvGXKaUYSEgUTpVV1B/tMkgyQbn5G2B+YtNYo
         5aVQdsn9dohqG2DidTMvvTQtDmao5DrhgTW5RfZ6tSSO8Z3idC6ixiIhMg9niB80iIQT
         eb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792761486; x=1793366286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO18/VDYKQ9K6+z12qbV2AuMLMhBQkemvCDskvO0ydg=;
        b=Mjj9rCmDq/Shf2cNQNEk+3fPHy8YtMP8jAIEAFIksD2VbtCuwdmI5cTRWeklOxj8f8
         CEPSCwvoUgLCw5kuo0ZQnn5+Pf+2Xn+nJebzYv9kjH8sq4xn9HRvQn1BQwPAsH7EuCaw
         83H8VXFDFKpmuUmypS1ubS940BxywugBNvwc93fQZHFNEE3VRXpq/J16DQ2y11wu4LFI
         WMizJg7xZatT7l32wbFopJvdvf7KHHD5EdNysLjARC8Xx+y4dpoVKQeIfRaUAVwRupFo
         NXy829c6VySt2kuduKZwmyd5P/Jarg7h3kme5Y32IGps09gEvPYjBm0MZmFwtzPkd50V
         grzw==
X-Forwarded-Encrypted: i=1; AKwUvBxsgIn8zFGHFk/RVrCV3KqOnJfXqAwOz6NwFC9grgERwj0W0yU8MkF9JJ2T2SvXODlWu/vteiT5jii66XQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvBremn9LIWoAymuQ4NK6q+lTrKDrvmvyT6AITa3vggWf00j93
	cvoadFQzbkTe7ZGH+ndbCbREyWKfoyYhamvpZeP4KGOoPadkRNyNojcwPnlOSmsUit0=
X-Gm-Gg: AYBFou2FNWHaw7WBnRMPHRZehNYVpGZrv5/O96jt5aUhhw0YFYD5RmZ7SiecEuoXhYI
	T1C577ig6J6QTrIGHTTZM+y0Kaez8VHIZ+wB4UMwv/uBvMcX1ir0GBQqOov8QDY6VmV4dqMlQSp
	XzTnlqF1J4WNkp7MJETaxLkbEhf/9sRro455PGqOT1aMjxmLjn647Vr4gBcZerZcdh9A15rge/Y
	D/h5CT4XzRn5kTAeCivDp2lRN/7LoW+4DGgZFhc80SCH7k6pXmVnkAqQHWbs8kx129Qq7oZx2Eo
	P9Dt+8Qo2ETdNqQvsJKGnuzEtP7IfuMc52unX5Ntla6BrP8I/L6vZ1hp+xcDdDnDB/9qUYhgYnt
	bTZwthfssVQud2BdlKmD7oocDGPU9bRUQ7IG9kH8hFfuWxqaTCrKxHlM1H5un2IRntkcHWdu3vZ
	XculLslC2OC5n4Wlpl22uMcFhwjRSwJr2XkvE00WMyucnP6tNvu/c99j8HkAqP6nwc/PlazTd5B
	nUN4AA5ztXmmMrrnJAfGkzEwOImce+QN4anxU1gokQzT3/LwWSLXNBR
X-Received: by 2002:a05:6820:498e:b0:700:da68:7398 with SMTP id 006d021491bc7-70b88a4894dmr1285740eaf.43.1792761486541;
        Fri, 23 Oct 2026 06:18:06 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9ae63d9asm8548eaf.8.2026.10.23.06.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:18:06 -0700 (PDT)
Message-ID: <fc3a1fb9-181d-4994-9bf2-45272dafc86e@riscstar.com>
Date: Fri, 23 Oct 2026 08:18:04 -0500
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
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
To: Greg KH <gregkh@linuxfoundation.org>
Cc: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev, pure.logic@nexus-software.ie, johan@kernel.org,
 elder@kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
 <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
 <2026102338-rack-garland-2a29@gregkh>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <2026102338-rack-garland-2a29@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 8:04 AM, Greg KH wrote:
> On Fri, Oct 23, 2026 at 07:48:54AM -0500, Alex Elder wrote:
>> On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> In the loopback function, usleep_range() is used for short delays
>>> and msleep() for longer delays. This requires choosing the delay
>>> function based on the requested time and converting microseconds
>>> to milliseconds when using msleep().
>>>
>>> Replace both functions with fsleep(), which chooses a delay
>>> delay method based on the requested time. For short delays,
>>
>> s/delay delay/delay/
>>
>> I think "checkpatch.pl" would have caught this.
>>
>> Maybe Greg can fix this up.
> 
> Nope, not for staging patches, this is for "learning" :)

Sounds good.

Please provide version 3.  And given that, I'll add one more
suggestion.

You don't provide the *reason* for making this change in your
description.  You say that fsleep() does roughly the same thing
as the existing code.  But... why make the change?

The answer is roughly that fsleep() is a common or "standard"
function, and it's better to use those where available.  I can
think of at least three reasons:
- It's better to use a well-known common function where available,
   because reviewers will already be familiar with what it does
- A common function might get optimizations and improvements that
   your code would otherwise not benefit from
- It might (slightly) reduce code size

I am not suggesting you include all that, but you should
understand it.  My point is that you should be clear on
the reason for the suggested change in your patch header.

Even something like:
   Replace this block of code with a simple call to fsleep(),
   which does the same thing.
is enough to explain *why*.

Also, before sending *any* patch for review, please *always*
re-run checkpatch.pl so it can find trivial problems for you.

					-Alex

> 
> thanks.
> 
> greg k-h


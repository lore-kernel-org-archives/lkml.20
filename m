Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819144;
	b=QTJ7xKgyJfU5J3RyshtIJjOVxhopO0gIx0/SattoN5dkW5U/7/ebRmwTcqZY1/jGy7qV
	 D9picihQSYdfjEJn31/jCa3O7VsBRjbhddHJOVEcRzlS9vu9QKAcjUqLIsCh4xRPP7iFj
	 YOviqBIWIlm2tq4DxzHkBVgnULfORHXIt+6D4UNd07RtWUaxecBym6Cmr7HZ6999veQo2
	 EwF2h2w6de2y+K6+IKhWc5kEHL25hHXCJU4ouNDguVi3kIbL1fIwlx14/urFKliWRWy8W
	 1gHMnMS/QxMlHIq+dZ9UaeX6orlQvG8GlammigcWGPYuE3eodQp4B/Cm3VK4fTu8mGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
	b=u04m6xIyB5f7ccLHtEkHzvYiReB7lZSsxis3tEsmwUY354GcWUTKykjmUKfBq52Mf83Z
	 bJTJLeZv7AKrrF72zO+dzcDUczzbxsh8YImHCh63vAtF6pxMXK5habqo3OxvsaKwHaXeP
	 R3xu5jX2ng+3w/uHZC2TpOGShRy2miCxQMJWUBjSAGYGwLe7G9K+5gAYaz2iNWF9FVhdc
	 nvME+ZcNXbqmLEzJHmhlX6Wt/DDsEo5dTn2r9oMsisHwhixlaqDbyHMxzEu01aote6fAs
	 21xnC9CHdHCP+pkgZ6PWgV70nw/pjYbyS4l+4upgRQQMFl3joinhWjpogUj18D3LEiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEtdHqB8;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FD4606A33C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4FD4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEtdHqB8
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so1500857c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819143; x=1794423943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
        b=MEtdHqB86xZ2D7eNBZrPkkUQcehhYt1vPlaBX3c7MZ1SXry3ZhhPHQVsjY8kr6Xajv
         hV2sEdfatE7yUMrohim3sPyPbi4k4n888A23qCb3SBVkB4DWEMLQmKjehPzaoEML5Dy8
         VrlFoqQkAVO5hzhEEOP/H9ZtPWPtsuJtgmPImqMQiFtueU9094P6YWLhaJ+93wFsvi0s
         0vKHBToJtstoVO94e5vCV0eF1/9iJ/hgLbmJYEQlNCADZrNikyfUaa0CBP3sDFB3yMx6
         2Z1vqdwM6yAnaw/vAwoZhJ0JZm0Au+ONlenPwfXhJ18jiA2+9ki5xfrYFJVBtfbc68Hy
         glSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819143; x=1794423943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75HJWwF/RnbUopgDHMkFvMSL8L7W5xVT0WXc+61KCU=;
        b=oa1V2S1xsIeYfel2dlfLlrGB+jafxEX/CuCHo+oCYkoEgpP49ULopgi2XDSuAEMeOv
         WYSFzl7iqw4TlSSickLtmdmLkckLib6WfXHupb7AnELts/SvzPDem8Cy6sZeEsu3/tTd
         yZMhQOGmH/qDMPDIzwzEZq7xxbD7aRzjl2XINX+zgW7ebCFvfVHTzEpQPbWH/+cwlVzi
         TPEF+jsH69hZLphPWtmRa7cdF44SptZNBZ4rUHioP3tRA8pFPu6ILE6OonlNjcxewY4w
         o3fFFpPMPinqTG4J/VJ7xrne9kO6LLoCKPmahcxP6pa+92sE8pUF3yORINVJdL1q8DqF
         acGw==
X-Forwarded-Encrypted: i=1; AKwUvBxz5Q8FF9yPMYoEbhfxaU1DmiRFR5e1B7QVk2h0o/shOfhFCTfwvq9so5np1IYF1lWsbuLoph5J6QrbCi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DwseVOB4zrdxpf1LEBlytrowkMCjGXgaQQrqCj84sDq+RMsw2
	o4uGQWo2v8oMy1cCQuVyI72h9sYr3TZXMHytwrcmY+5ohJ93OfwGAFMX
X-Gm-Gg: AYBFou24Rt9qVKen7d0bBIqVQkcdNqYblK76Qe8LLOHC/B35UBRfOrDjmlNk70k+24O
	Wc2eCwqW/gebvwQKsEoBXj1CCxUGmZr2yxuLZAYBMYUbdwx5JWd1IIBEj07sCZRETklMDW5TSz2
	4lXSxf3jKTedWYE7lBnEVHlOMnNGMN4iNYYvDbAcaUsr4VVF2dgs4lJuRP3mjSdzxIPplcbSun/
	9mjLxe+/pkSDeH/0qM0XdALwNXYAjcYzU4a/DhzsikWw8munGjK3mvtCJfcgzhuotkWCC9I56u/
	6KZGUzLmVWTeZr3O8bW8I82fXyTuCBflWH9SN/R4cal/bzusmNnCSvuKwHQ0p2KNSzCREh6lyUd
	yGe8UMqzLsxpuz6IoBz5O/EdpHSsL5BuUL8v+ukLYryk/rYnIoArXDU+kheWxjqPvB/WZf92nw+
	E3RUQYaV5iSrb2PXqOy0v2RGPLk2xHUluuXX19t56lEfbRwxtWhudUuJPoP+VrfGvhf/3k32CSU
	5hY0lgO+HQnYGhEP9mxQEJSQSV/DRNdhf0BVj194lqjYR/3IntzQOat/+wHhRXsC7UV0EXesU0V
	Q1t85QmoLnbMnbo+w85XURS6RqhLcVlCvvCI40YTcZ1aQcLeCxCwkaEqcos1qxK0hGaKcHBSFXt
	YdytA
X-Received: by 2002:a05:7022:1608:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1ac56302329mr19046948c88.1.1793819142508;
        Wed, 04 Nov 2026 11:05:42 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::5:74b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm8999881c88.11.2026.11.04.11.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:05:41 -0800 (PST)
Message-ID: <aa4f18b3-0628-4f29-8e12-894e53adacea@gmail.com>
Date: Wed, 4 Nov 2026 11:05:40 -0800
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
Subject: Re: [PATCH net v2] selftests: drv-net: pause: Avoid cleanup failures
 for unsupported link settings
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261103190622.3981970-1-mohsin.bashr@gmail.com>
 <4f90c4b1-98d3-4e98-bcfc-d9f2d17b4391@bootlin.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <4f90c4b1-98d3-4e98-bcfc-d9f2d17b4391@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 2:57 AM, Maxime Chevallier wrote:
> Hi,
> 
> On 11/3/26 20:06, Mohsin Bashir wrote:
>> From: Mohsin Bashir <hmohsin@meta.com>
>>
>> pause_setup() saves the initial link settings and queues a deferred
>> restore. For devices that report forced link settings but do not support
>> changing link settings, this can queue a restore even when setup never
>> changes the link. On fbnic, the deferred restore returns EOPNOTSUPP and
>> turns pause tests that use pause_setup() into cleanup failures.
>>
>> Fix this by queuing the forced-link restore only after setup successfully
>> enables link autonegotiation. Keep pause_test_support coverage for devices
>> that cannot change link settings by falling back to forced MAC pause on the
>> current link. Run the extra link autoneg on/off checks only when those link
>> setting requests are accepted.
>>
>> Results on fbnic:
>>
>>    Before: # Totals: pass:0 fail:4 xfail:0 xpass:0 skip:24 error:0
>>    After:  # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:24 error:0
>>
>> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
>> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
> 
> That looks better, this patch ran on the netdev CI and no regressions on
> stmmac,
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Maxime
> 

Hi Maxime,

Thanks for the feedback on V1 and review of V2.

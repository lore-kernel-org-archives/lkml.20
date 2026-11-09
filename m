Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223343;
	b=Ht8JIB+Km9C3rrPovd89kmT58ty9pWsozuqxeStT4NWqqEqAZAHxM+kCLTuPWOtnSfmc
	 B8dvNDqIWyPsehOFXNxW+KQqKwY2DXpypwJcL+/Ii0c5dzW+eMK9KGbIf/Mq233u4K9Ca
	 NxXC0tJtHB/mQ6MeGsZZ9cUk6CsdU6tw97amnPZNwRMioqR8pqT5DuS8Io8lvfK+Fpxng
	 qnbux/AZtrNePUltg/tFVpiwp+7uq8fCaif7fMeYDB4eutvkCws+UeWMmmQsm2PiLpKzw
	 TZ44xq/YWYzE5UGOyPeWAWj0gySc9+60PX+19bmdkUWLGWoL3VM0wo0wW0sJsRRNwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
	b=sfFZ57mjr+AN135r068NJWcnTKKVFGC17WRCeRb1R0i2RVRtSD2l1CAmguQ8DpHeIbBk
	 OoJe0c8sldEnJPEC3ywBzV7h9Y5dWzVqr9qkT/QcJbqOuvwG4Z9jvIBj0qpzO4ndIfnlz
	 Dau1r9WE7A1PqrHXO8EWnRnf7tbA56FPEJQW/meQenQA/r3hYlQ5psbfH2Kc8Xcx4ZyWX
	 4D1krqQPh2AzLUiDn+PsL66md5ogDyGKTF9Vle0e6VCNffJVpNHW1ZqbxwqwkJaUuUWFu
	 j1DJbdMxLrdKR8tAiKLR0tv12OD83g+pOZqQEBWhE10nwx4/M/TFNlxBsNJFhmwuOFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28233606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28233606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jfCMgCBl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so6924675e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794223341; x=1794828141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=jfCMgCBlY9RopVhaSNRGgRHB2LGNqgbKO3lacuno07E4l5GQXAsyg1vIl8S5+G2Hib
         WTLw2oluK8WNJay+xGNbCFdu6rq8+RDVil/5vmziw5ZhveSVb8Atdc2u5pvDPCBvRp7W
         mDSeD4hJWBHULWqzSZckEGzQidvexDgEHLApAeQxwCB3A60sCys5acrGlV0L1jCdpgJl
         MMG0JYRz5npQt1V8W9XihEPoF8aXciUcRAkdAYSPy/CfMcTwM7WcyYwwTKIoBiPVWx4r
         /950l0jX8a6fWRBfhoEWuSpzXO5jPFNAVhZuWSXgV49epv0XwFNSUbjMHzqeZ1jfm5J7
         xMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223341; x=1794828141;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xs5F7SiyTqAcRrucFvs27Y3YEdp5GXJ0oQ8KE7Wc5ME=;
        b=mOj7qF4cv/EkeyyeooNotZRyPa1dUKL8qqpWRPA60DQu/q09xfJebPiuIvvBV27sN6
         Hi9B8I7qCvXw1jKvieHH0jHu6LEzzz5oA44kNfM5jSuyOlsR5mjigJNJFH9KpOhBU5Uy
         vQc4wsMXq8ksb+oEMFsWFIijdub9ypqcKgfl9ceVt8hB3hR7u6RqNsVr20Vcifx5wfb7
         4/sAFnnS53l1Rwf3N/dgznGU5eUlzLOwPVLw2athIsaJBn7ye59LYo4R7qCPlwaQpdGD
         Zy0umkSaQZpZ24+y6pUSs43vV/whrGAB9v0wewr99eo0tduix8oYCU6CFc136U1NiHP4
         Qc8A==
X-Forwarded-Encrypted: i=1; AL+hErE9z9P9lhWN86OrRS3Hus7lm0MboDbJSBcPyqzj0vHNoPCcC6d1X2KKAiekS4fKvip7IJA9D9s3PiBu12E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cu0KLTWHLBgjYlr8B59ptKQ9PAJEpMVhgDZyrxTXVBW625L4S
	AomLnO2bdJdTN+4WwJg0Tj2LjUgrcPZrj3ar24C4y1KJRnxFySXS89gwQbwPus2lkfU=
X-Gm-Gg: AYBFou0WT0gFMNhSwz0vnyU4lCF8dTsI97g7/vA4SkUZLmi2GFg8Y7Daq3FxYao7q99
	YDo04jEq7buHNYIX/sf+106FAI8/n6IiTj5yx1mp2K6TRlygMTA8o0aTQ50EIyPL1v4jyUp6MHk
	8Cc8n9N/B154Y6F6X4LXk4mSn3YKdtdSySgqfwaJocsc6R6P6sYMmuiu4WAN4R0sUDYM1agvFLb
	5TGFTLZ9OJ2NJ+vH7bXFAkNUyiKZHLhXsA9Lyli7tl6c7mCiW3Mu0fvLkpHmj/AdBSv4czHeObx
	hD7q9OLGP+jZWSvTM469DizlMi/YPCnWPyl9vkXpri3y0xgcGoaKUndlBLbEbMlNwTnATuefP/k
	R3wBbF7CIEniPjq8iKqI73bfGcXkpKS5M+TQr9U8yF+n7eV4WXScUaRXIcIKt7ECCHRLCXct43E
	btx3NcBY8HWbmPMcWpDpkn3r5rxgwHeD5WEAe75uOcBHUjdfpkBKUP+0nPoOe1fvSf842argQYn
	NJVU9KXExhy6jY8yCq48j2MXZ8SKqMYykb334I8BY/tFDe3OuHFAg4C0tMP2gDICYD8BbmwiYi5
	5H3YECwv0Cwi6uLMY12RMO59KlR/ZTjPhipXYQ==
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr72108245e9.7.1794223341348;
        Mon, 09 Nov 2026 03:22:21 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm272724515e9.1.2026.11.09.03.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 03:22:20 -0800 (PST)
Message-ID: <7a2e44a7-41af-461a-96c6-ea91780bf524@linaro.org>
Date: Mon, 9 Nov 2026 11:22:19 +0000
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
Subject: Re: [PATCH 3/3] media: iris: Fix use-after-free on unbind with open
 sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <2rWHCgRwgvQ8e4bhpYnYDjIzh1pjQNSNjdBFELmGe_h6iZzVLuoQDpUPAD64feN0mYHgyoDf3AYwIu-5ilkZdA==@protonmail.internalid>
 <20261017-iris-handle-unbind-v1-3-7809148eb90f@oss.qualcomm.com>
 <46e9506d-1eae-48d4-803d-d731d85fd376@kernel.org>
 <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <831090d5-57c6-46dd-559a-bd6abebb982c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2026 05:08, Vishnu Reddy wrote:
>>> +static void iris_core_release(struct v4l2_device *v4l2_dev)
>>> +{
>>> +    struct iris_core *core = container_of(v4l2_dev, struct iris_core,
>>> v4l2_dev);
>>> +
>>> +    mutex_destroy(&core->lock);
>>> +    put_device(core->dev);
>>> +    kfree(core);
>>> +}
>>> +
>> What you would have here is an admixture of devm allocated stuff and
>> hand-allocated, refcounted with custom v4l2_release() which might all work
>> but, it's not obvious to me does work i.e. core is hand allocated while
>> reg_base, response_packet etc are devm() managed.
> reg_base and response_packet are safe: after iris_remove() the IRQ is
> freed and the core is in IRIS_CORE_DEINIT, so nothing uses them. Only
> the core structure must outlive remove(), so only that is refcounted.

Right and you can confidently assert that for clocks, regulators, power 
domains and ICC ?

TBH I think this is pretty hacky and unlikely to be safe.

Another way I don't think this approach works is an ioctl() waiting on 
firmware do do whatever. If the ioctl wakes up after the devres() 
removal - then what ?

>> A much simpler solution to your problem is :
>>
>> static struct platform_driver iris_driver = {
>>      .driver = {
>>          .suppress_bind_attrs = true,
>>          ...
>>      },
>> };
>>
> This was discussed in [1]. Dmitry noted it is a sign of a badly written driver,
> and I agree: it removes the unbind interface to avoid the problem instead of
> fixing remove().
> 
> [1]
> https://lore.kernel.org/all/ 
> CAO9ioeUvV+3sME9P1bJTpDOSty=uojOKak659XCf337++vPVNg@mail.gmail.com

In which case I think you need to do more poving/reasoning here about 
admixture of devm and hand-rolled allocations.

Like what's the use-case you are supporting here with the unbind exactly ?

---
bod

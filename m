Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153450;
	b=X9rSsdaiJpC8oQapZCoHVn5bKW7tU1vVSxq3sie17U7IjLToVAu69V80zJ4+z3pmZNqN
	 m1CtuZ24/tHQP1MKuaY4o/OqnTp7SGos1zVvQJk30Od1dkN8AVIkPecrLJvNx4Ip02ZcP
	 p5rLCyzciU9+4/zGtWL1ocBVXx8kb4cdlZBqL8pXC0NX2ZplKzS1ayJLGE/YRT9FgsQr2
	 MpaEFRqVGZULFTWu8XwB45LEpHE3Nq4p+9de8PzMDj93aqR95/qP9jlUxvJOpLsOU6QqS
	 leYh1vzUmpUNdh2moR2UL9ZBcYzRCpQ4ycJTUza3u9SmUC6t5J77GJQAU8zv9miSlcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AvuI3gC9LanuHQ2FDq1C+CTX7nYtjKmGTaboMiFjFuo=;
	b=mGZGQXoEa8SzoGrWTPw7PyoMYBSqv2i4eLbzz9+laIqp4F4d4xo3OQnhvvnFXoye27Tj
	 qUfGF4U/5MKcxTkMRUHeFfV6eMxjgcqkBtewn7uOIh6BSRi0k2qcP3cKDhdj+YJccy6ep
	 bbs674X2QLY5kYxaHdlgzmj7bqDgI4UrUAWzZIIyCqgTSq+iZKpzN2wv269slSu4Fasfi
	 WehZunWeQAq11thIrw886sB434T19DfOSbkScc+Bak+a3m4eq3dp59PlXcxfeWS0itC2+
	 HaPmWv0A+bH7NfJ8VuerMrt59OkQCLwMnRB1hYewAGDq+Gu2vSMgiURu2cPU2gjhufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tXW8CSOr;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tXW8CSOr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d885929so331871f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793153448; x=1793758248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvuI3gC9LanuHQ2FDq1C+CTX7nYtjKmGTaboMiFjFuo=;
        b=tXW8CSOr/LLhoCMkN2OUIXIon5e2dj20gG5c0ahVh0wRr26kPo53CKN2BPQXHIRmxM
         BOowAaPpg3PkpG7DRm1a/2LGuHVA5Zv/MT8WtW38YotGZ2BqSsLJf1YENB5+yIV40VHB
         GJgAOf5JmiyHtVojPtN/7nAY/711wT5+zvJNUqhYq8JYXgHjanx5C4HTQ+NtpehLuZp1
         WUB3G+RpHGt6JJkI/RaV6hJiuhTTRbTOGUKo5xY5BzOmhvDs8ksYFaEWC2h+ptoiBs42
         ivZ2BFB8q8WIDbJD1ZscC+Tq+bbeYLkrw5+yzOjvrzTqpWyZWMon78v4BB4QVpFiUjfY
         Ay/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153448; x=1793758248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvuI3gC9LanuHQ2FDq1C+CTX7nYtjKmGTaboMiFjFuo=;
        b=GsP6jlNpb+EXlzflGQ9FNDg3ijQ+TyKk8JXKRXCQBCwn+phqJoOlLx1p2IM3BQ54gY
         C7lMeLPCfhGeNrX8kLx4//pTCOH2++9eit40u7bHoofaEW4/KGoYUwiEHDLSB/JfWChv
         vI+SdY+FJnRyGbu/t2Jk1DV8BLb7qWnsvOH02l7PZT/SBeK2Odl4csF243YcnRSuhNJ8
         y8+4mlV2R6YRpskiDYbuv9chBcazNsMfO8efXn9tuvNvyFSM7H8i5opUcAsrGREKL0GA
         CoOV8p96Z/1d8WZeuC8ukEgO0q7+XKBbtVdDIPTLfkmoWO4kWrQrx583Ti57JLWyw98S
         /CaA==
X-Forwarded-Encrypted: i=1; AKwUvBz/hx8YRV83ANl5ynomRPsM9vlPj0CoB5keoiUo3mBsqqarG4n5QX7mdxeEhbpPWTNmyC5r6rlZ5T3BI+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDMxEEKNfvCZbH8kC3H0+/6H5C0U5tNV0PoYxMoTD3AHid24+Y
	RY70NuM7Mla7/9AYiXFdJ5qCdf0Y0qKRn0moeaNGX4QDJPHSsl63jn5bX65SARfC8cE=
X-Gm-Gg: AYBFou22P9SNHn7eaIxrrIlvn1A+E8pdeM/OosWO/UADRxfHBsKOFUqIm2a7ThlS4ap
	NpMSrYE6ZfXAjEKUZy/aPGwIIGSo7y0hC4BrIIcg8pxW5GxujNBUoFJEW7ZtS1RVVEJ8GK8LgM5
	C24fuAIlARbUfcBNDzSCcBsML4JXx51xh1BXkkAtTw75hmQApgZFLTg8mFowGoeP8ybCxbzBQBM
	DFW5LcRJ6YF460X6hRoWL2HcBTulo6JXzWzyhcI2L3/M4MO/5NkRJsjjK0OnPi4zO7UuXBrBzdZ
	OyDDEoT+qiK/mTbbBn4WuBz/R6RbZdWZb0CAHonvIeiF/fyDT3dYLwT37WSqrBy43za0vQZh1sy
	8843wTYDZDWISUhZVd43FZPr8g0xkuh9s1pu9WIDS0zaEmtnGKHeNlE1dT8lW9Rsf4ulzCUXBtk
	ZuQ6433mQd5yc9lYHza8zjc5g1cRikVEakb1bkgUelV30iwHI3ENRy5WNyTimD1M8mOcmKuUh8D
	fSWa77+/wyIxCTzZs/HUlVnxmkb7aQJkq3y81AD9QKWMHHCsItS/UkPg9OJ3OUwalZyDS0NiOP9
	udHnJGjYrqnskfr9/oaBF2lCZdhR/I1CLxMpCI6DZHg8qEbQLcJg8j60o+7P1pH0iYA1j7rQ37a
	ZZTQfE+ZJpK2f1A==
X-Received: by 2002:a5d:534c:0:b0:48e:1b11:7ee5 with SMTP id ffacd0b85a97d-48e5d2e4a57mr1986425f8f.11.1793153447902;
        Tue, 27 Oct 2026 19:10:47 -0700 (PDT)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm23989902f8f.22.2026.10.27.19.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 19:10:47 -0700 (PDT)
Message-ID: <e4c97fa1-9d4e-4d1c-bcd2-af3d40dafa84@layalina.io>
Date: Wed, 28 Oct 2026 02:10:45 +0000
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
Subject: Re: [PATCH v2] sched/uclamp: Fix race condition leading to imbalanced
 uclamp_rq
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Wei Wang <wvw@google.com>
References: <20261025162612.360033-1-qyousef@layalina.io>
 <20261026101254.GA2668200@noisy.programming.kicks-ass.net>
 <9054450c-f85f-402a-a2ff-fa5f314f92c5@layalina.io>
 <20261026115900.GG2668200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <20261026115900.GG2668200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 11:59, Peter Zijlstra wrote:
> On Mon, Oct 26, 2026 at 11:24:31AM +0000, Qais Yousef wrote:
>> On 10/26/26 10:12, Peter Zijlstra wrote:
>>
>>>> +static inline bool __uclamp_is_imbalanced(struct rq *rq, enum uclamp_id clamp_id)
>>>> +{
>>>> +	struct uclamp_bucket *bucket = rq->uclamp[clamp_id].bucket;
>>>> +	int bucket_id = UCLAMP_BUCKETS - 1;
>>>> +
>>>> +	/*
>>>> +	 * On idle all bucket.tasks must be 0, or we have hit imbalance
>>>> +	 * problem.
>>>> +	 */
>>>> +	for ( ; bucket_id >= 0; bucket_id--)
>>>> +		if (bucket[bucket_id].tasks)
>>>> +			return true;
>>>> +
>>>> +	return false;
>>>> +}
>>>> +
>>>> +static inline bool uclamp_is_imbalanced(struct rq *rq)
>>>> +{
>>>> +	enum uclamp_id clamp_id;
>>>> +
>>>> +	for_each_clamp_id(clamp_id)
>>>> +		if(__uclamp_is_imbalanced(rq, clamp_id))
>>>> +			return true;
>>>> +
>>>> +	return false;
>>>> +}
>>>
>>> Anyway; I was thinking, since we have a hole in struct uclamp_rq; and
>>> also uclamp_flags. Can we fold uclamp_flags into the hold, and also use
>>> UCLAMP_FLAG_IDLE to detect if we need this bucket scan at all?
>>
>> Actually maybe we can just check if the flag is not set then this means we
>> have a corruption without scanning the buckets. I didn't like the scan, but
>> seemed safer for a backport. Let me try that and update.
>>
>> I can fold the uclamp_flags into buckets, I don't think this will grow and I
>> do have a path to help us get rid off uclamp_rq (hopefully) in the future.
>>
>> Okay to do this as a separate follow up patch? Since this will go to LTS, I
>> think safer keep it minimalist and do the folding bit in a separate patch.
> 
> Sure; I just noticed these separate things while trying to re acquaint
> myself with uclamp ;-)

I posted new version along with some clean up that makes this conversion 
slightly easier, but didn't go all the way in as the flag being per 
uclamp_id didn't make sense and if I moved it to uclamp_rq or 
uclamp_bucket it meant we'll need to set and clear the two IDs which 
didn't feel much better. We can discuss on the new series.

Turns out no need to scan too and can just check if the flag is not set 
to detect the imbalance.

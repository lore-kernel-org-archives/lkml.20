Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714645;
	b=4eSheYZbuYFiT8CuASoj/+gs55JJYEJB1IqmfGFOf+tlhKxtOAxP+m5midUPRwkPg/Tl
	 wIXu5QeIybgjGVAEvxFJ3TVuFR1TrQaBpU7mpSXEiF78R6lWRxp/QCoqUfPqwWnvKmcx3
	 6VwHwqzczXkOm/gJmBt/UX8m8e2do2fepmSB/1ddh+JLehkgmoCZ82uXNTJ6BgHiL47L4
	 ZhBzeSCysF8KkMnzVS/LGl7iDxqOJIgGGRL1YoQODUTYON8rdihOmfP91AlGG6ZhAOQCa
	 7zUWCxMAEd5hIzy5jAAYpsZaAoT1gTwAsmSJml9Z+HGv2BndLa3P3Q6PXamZqH55/hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
	b=GL4aKCu6fCvH49lpTtk8/ETcqpNJ2HN6YSrJwvvYCiHCVHRpxr0BwPrYOEDLPrGJ283I
	 OTH/MQScKk+RjHfIuO27m1S0gzjoLqnp2zis1Blo4MGNsQh3qpKw76eNu61SOPBGDlPJZ
	 UBetAgWN3XqmDOp7JfatfifSJKN2MDV8BuEtMlkFQ4baZwa+sfKvzKuaEoW1whqH2FeRm
	 aI7qP1dknAL33qy23cbXcgHaoLxRhq71StMv3tNv1Yi3m88vprdQD7VgD/SCrJmHVlLub
	 TxRBOE4kJ6wWlYnYh04XNOoDS2wuCtHdiKGNAdU+k1c6i7PEI56FgRnPfj0fAjmgIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cKX4C2tt;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A04606EEBF
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A04606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=cKX4C2tt
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a2551d7b5so801555eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793714642; x=1794319442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
        b=cKX4C2tt/oUl2bICPTmb+I0OANuqboJ1woNLF0wAsC2QQtG9f6FaeuPJdnEG1rM10d
         3qB+BVJzaFQmRi9yGFdldQmEJmw4QJ4G6QvZhDf15mrwbmBMyuhHRjBp2I5Ws1c9FWHR
         ISt2Y+XKeFe65kKWIOq81X7v6coa5pa//pCCgFVBhGHCb1K7N/2O1lsGFkyBJiPJGCRh
         TpR7KhKTHiXnFWNPpGky4NUo5YKR1JF0lBF6vmvxDGjHxw0a/rT0L82LZv1nhhiRqcoh
         sLN2XAnirWo850ZXMIMAGOJVOY70Un3+0vnt8dVmao2ASChN2zw7faiNmQbvKOUJcYyq
         euGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714642; x=1794319442;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1iAN0p5dieYdZLEK3xpx31mXg9Eu11cuHDKy4H/K8U=;
        b=KIfuzBh/yiws2NVPhbSsgk5pOHLBCTy2g6Sg+LLGjVOD/ZagtYwEAiGG+0UYKoFhGc
         BqTw/QjBnV26mOcUOLp0mjeFjpVxBEifY1YiQr8XC5r7MAZrXdmOh6798S2R9z8LZA5m
         6J1l+qeAG5SRRUPQn82Y63CvLrWiNVjNsto3KNFDNA9WQjhN5rwFyTV6ER46Hg4jE7bl
         A9SgwZV1XGcXNQvJMG1cM7zJ1wyCGcB9LpitbGN4aNUWbdBh3U5V8P7wX30NGzOTN98+
         yW4ApXqJSiPFzAJMJHviqXUNjIcZ4/NbXeAexASH6bwKC016R5m4nKcjPerM/6EJCgdq
         OKYA==
X-Forwarded-Encrypted: i=1; AKwUvBx47Qz5b8gWch2/TwpGgmFZbIAbpWlgcwpnVStpbAhdIHsXBbmYrBKOuGRBcFhRmjZs9mAbMi3jwixtSZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E1PDKuQtWH5KvX0oG8rcqpQRP9l7OIpFXZtOJNK9IT2HjVovq
	NBfYYGm+WUYEf4thIsbRjxdGUvRM+qVNIQSEUyG0CpqquCQ4fqdUU2zh5JB3PgReqbQ=
X-Gm-Gg: AYBFou3SqmyAIkcrWehPfeptPPFvqdQzZ+BPiiJ4HpPPReTIh8FGqrP2lp+b4r0Vl+v
	1K5FmP3L72BTDCvsElSNYpr3o2f8oS/ER/Vrn8fy8rsyQdscRvTMVo8HikwG3iuRlTelNFb7aX6
	u91zNBRydJy47M83LrpUuWUQYVBlQwRTMRzrA4OCmA4dZcSkJ5T2Rcw4p6lFbKc+7C64ZJWrSvO
	8yPjaJrJ7MZ8ai39yLf+lLGV8F2tiwucUUts508GSiSJA/xhcd1dMiq/2KJToEw6qi5wGLbDpZ1
	N7ASfGmQZrBjepF0PNC6Drkg/djebw/gd54Xn76A/v0hVpUWwonIV9/sXdMT3sTI87tP105VJrS
	K8Js/uBjI4J+SIK9fc4SyqrymWOYYbIO7mwov9tOC2MkYw92l+lDAQrnaItpyIj6q+oCirXxZlN
	1zfgKsncCR0svbCejxI3i0Q3vv6aW5JICQt2U5MBNzQo/ruiDkFl5Jby0uPwSfhbrOCFGOWM62Y
	kObeg902tLNQH9UZ8+w1vVXsptxPEj9y1fqT5cgBOpZb/LExqgM1QNwLNg2rHUlGxzG4WFh9u3F
	Lg1KPjtpg1cWNXnweFsyMbbJ81V9FFm0toO5Bc0e20Lr7ymyN4FeY2CSob3HPH4q+hewcu8ik3F
	ie2xfgBJd9QM=
X-Received: by 2002:a05:701b:4514:20b0:181:6b8:31f1 with SMTP id a92af1059eb24-1a9494d8c4amr21843054c88.10.1793714636313;
        Tue, 03 Nov 2026 06:03:56 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm50764623eec.20.2026.11.03.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:03:55 -0800 (PST)
Message-ID: <bb881af7-4912-40a3-a5c5-7f4af35e59de@kernel.dk>
Date: Tue, 3 Nov 2026 07:03:54 -0700
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
Subject: Re: [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on
 thread exit
To: Breno Leitao <leitao@debian.org>, Shuai Liu <847807867@qq.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+675af112519ca34f5502@syzkaller.appspotmail.com
References: <tencent_BB08960D79E0261B5C1EB1E589787734E907@qq.com>
 <auncyphG6lXI7rvo@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <auncyphG6lXI7rvo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 6:09 AM, Breno Leitao wrote:
> On Mon, Nov 02, 2026 at 04:05:42PM +0800, Shuai Liu wrote:
>>   WARNING: io_uring/sqpoll.c:88 at io_sq_thread_stop
>>   Workqueue: iou_exit io_ring_exit_work
>>   Call Trace:
>>    io_put_sq_data
>>    io_sq_thread_finish
>>    io_ring_ctx_free
>>    io_ring_exit_work
> 
> I've started seeing this issue on my debug kernels.
> 
> Not sure if this is the right approach to fix it, but, I've tested this
> patch, and the warning went away.
> 
> Jens, feel free to add my `Tested-by: Breno Leitao <leitao@debian.org>'
> if you decide to get this patch in.

Thanks for testing - I'll get this queued up, but heads-up to the
original submitter, I'm going to trim the comment. LLM's love
their lengthy comments...

-- 
Jens Axboe


Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FE3E7BCC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292780; cv=none; b=IcnA77PodiINFeTzCLSKYHYPNczXJX4jRAc7PgNfvYHeGcGkQlZZ/icm50QNx69sGEjLk8fFpZUbCSyOyDGJca8A5U91Z9BQjbYGxFRcrIq9YNlS/tZGFnXbvcmnt5rr9gLg8NQEIukIsIIM+hpJbNLEakJMQknGUrDRayCIUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292780; c=relaxed/simple;
	bh=kTnPWWQ2BIcJljm1EN+fW/0QPHIPCTLuXWEVNgYv8HY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SkruJxet14mZ6xGo6Rk2zNdFTC1+7zm5swWoMDoVAN/lzrx+mNtUCMud9B5/oJdZtG8+OnY/OQEZgfSHK6bHe5/y30dU1Q48MvlF7YcDDEHYtqWCrDsCOvO+ECCSfx1WKru6rgYMCWneSRUcNo26yuGm+azDEjv8RTbiEGq12N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=NaWDhvoR; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="NaWDhvoR"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3413069aa25so161215eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790292777; x=1790897577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LXZmjhFB9CuarkGAqk43Kn1bH+0V6owkhXtkgSKcCIE=;
        b=NaWDhvoRmhXhgoBA3nw2GcHWlsN2HsivhYh7p6l8U9jBBtwg5zLviEK93dTjeeK7cJ
         qtzrFvX0hhiejFhJd3+clIkDF+l8fiILibhuNLArnJnqJLr0otmVGTvOP4mFI6bOwEIk
         FmqE7Hp/05j8VDMvwpnRZ8XT241ctQRLmkk0uMZJ4dyn4BAO6+HHlP6ROwabjMv+pCg6
         1KBzSqmvXDexEcWhARfHnU/z9bw+5NTWm/edlETCNm2VnMpBa+YdStIrDXnsvDPkRXFu
         EdSlLm07IBE7TECRHFjnZVVgoETqT8oGNfD+8Fr0fRKZqMj5+YveQQ8oX8bJXtJ83DQ6
         X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292777; x=1790897577;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXZmjhFB9CuarkGAqk43Kn1bH+0V6owkhXtkgSKcCIE=;
        b=XKY4nHpRXXkrJO48L8Cany3/3iYy6EkDqP6PGAis7gPbQD9pSWYsskzdNH5FG1mWDd
         o7xX8wbqajaM+pt4cK5BpTYwT4wRv7gl7ONkrVXxEr5xE79NRlPxPEU2+kINI6UDyiR7
         71chVQIQfGg9DSueXCPwIlI1MPbLIWz1x/T0VQx75eq9NUxrca60GwODOD2O9e9FHCdM
         0R6q75wtvdD1GHuX9CIMuhLZE6Zke//QTN6GRHGowMCQ62K6j47mcwawe2zuAokeqEu1
         88pBosEXWecK7dqyWaYyOCm/bpPyIPsOgZODDZPkvR4ezf/Dpjz7rSoc3jLi2Tgk+WQl
         092A==
X-Forwarded-Encrypted: i=1; AKwUvBwAyV+mK8+cw+MJ9tXncf63cBxCOxcf3Gy56sAXxX1SE/+u+4EGzTaXnj7d+B0bd1Aki6H/G3Qyu/IL7JA=@vger.kernel.org
X-Gm-Message-State: AFuF++lZaEJezXzX701eC/foCQBvs0zTaIyHUDkvpROIqrVLFo7MxTOB
	NZx2X6+sQQh11MAigdCqGZw+D/f1FmdduWRaubnubNge5bJB1CjVcXUOZXru/fmKa5I=
X-Gm-Gg: AYBFou24CDo86pbfF43B+NAu5KY13cObeAM1FoKuAaqVlrNs+WdhypudsP9KwjoJNed
	CCUXhTY4DbyEjYd2Ybe4aoZzDJHfA0AJcvJS905/aUvE5yZJ3kgLn3iT45UPYHyMEwa3MBaZxY4
	GIjal8RLO2gpHcExuLbkZDY56iEMVv+cKc/Vmwlngv1ynrhg2xw5E/pKSXz/Wv0Sv4/dc3rUU1D
	kzeN7Tr3qxoH5pCrr/2aEHuLF+QL+DWk+4hTEd9Dg+7Sw6yvyYXA+KVBPFMEDTAZ+YmOAOPNowQ
	EqkOFHLwNW74IBOvHuKRHj1tSgdaRP3KVM7VARSqjmxbj2JBtmnvUgv/U2zNdPaK6KX6RvfxUfc
	SAi1kv30nYIjhLO0xC4p/tDkMc1YucvSukBjEsovgJ0TnD+KZRMIpD2sktUTkqFwkvopSpUDzMY
	l7xawAnMHMIrw7GtBZISXkF32RhUYW+za6W6ZtF/pMbRbdkwl64cb9tFBEd7kmuUEBOl3GFNYvd
	EOd6AQLfVIoPtOp2MWONLqwgegaSWdloXvQ9zw1teZ8mKjAM6/1n6A=
X-Received: by 2002:a05:7300:c88:b0:33b:b4b8:ac57 with SMTP id 5a478bee46e88-34006772e80mr5319034eec.29.1790292777252;
        Thu, 24 Sep 2026 16:32:57 -0700 (PDT)
Received: from [172.16.11.208] ([4.39.28.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm1607341eec.5.2026.09.24.16.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 16:32:56 -0700 (PDT)
Message-ID: <39b2bee2-84d1-498b-a5e0-1f2307bd31d3@kernel.dk>
Date: Thu, 24 Sep 2026 17:32:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/sqpoll: pin task across task-work publication
From: Jens Axboe <axboe@kernel.dk>
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Content-Language: en-US
In-Reply-To: <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 4:59 PM, Jens Axboe wrote:
> On 9/24/26 2:50 PM, J?r?my Jean wrote:
>> SQPOLL can consume a request immediately after mpscq_push(). If this
>> drops the final ring reference, ctx and tctx may be freed before
>> io_req_normal_work_add() finishes using them. KASAN reports:
>>
>>   BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
>>   Read of size 4 at addr ff11000000ca0000 by task repro/55
>>   (...)
>>   BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
>>   Write of size 8 at addr ff11000000c3bd00 by task repro/55
>>
>> Handle SQPOLL before publication. Pin tctx->task, publish the request,
>> then use only the pinned task so the publication tail cannot dereference
>> freed contexts.
>>
>> Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")
> 
> Was going to say this isn't correct, as the mpscq is newer than that.
> But I suppose this already existed before that, with the previous switch
> to private task work for SQPOLL? I'll dig into that a bit...
> 
>> diff --git a/io_uring/tw.c b/io_uring/tw.c
>> index f573bcc3af6a..2e37a3fd7a33 100644
>> --- a/io_uring/tw.c
>> +++ b/io_uring/tw.c
>> @@ -210,6 +210,19 @@ void io_req_normal_work_add(struct io_kiocb *req)
>>  	struct io_uring_task *tctx = req->tctx;
>>  	struct io_ring_ctx *ctx = req->ctx;
>>  
>> +	/* SQPOLL may consume and retire the request immediately after push. */
>> +	if (ctx->flags & IORING_SETUP_SQPOLL) {
>> +		struct task_struct *task = tctx->task;
>> +		bool first;
>> +
>> +		get_task_struct(task);
>> +		first = mpscq_push(&tctx->task_list, &req->io_task_work.node);
>> +		if (first)
>> +			__set_notify_signal(task);
>> +		put_task_struct(task);
>> +		return;
>> +	}
> 
> There's no point in having a 'first' variable. LLM's love bools...
> 
> 		if (mpscq_push(&tctx->task_list, &req->io_task_work.node))
> 			__set_notify_signal(task);
> 
> would be better.

Thinking about this a bit more, I think the following fix would be
better:

1) Add a guard(rcu)(); in io_req_normal_work_add() at the top, which is
how we handle this for DEFER_TASKRUN as well.

2) And similarly, expand the synchronize_rcu() run in
io_ring_exit_work() to also include IORING_SETUP_SQPOLL.

I think that's both a cleaner and more efficient fix, rather than fiddle
with task_struct references.

-- 
Jens Axboe

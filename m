Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506980;
	b=ji8l1US/oxXUBGRzILuj0epkrsCkIvNwcRkry8zQoRtF1I/xZogjW7FZrGbvzvuPXuiw
	 ftUS8K0C3CASMUKu/+P3pmrh5FqNIRJCvmnpRhlCwPT2wgDC89N3bYeR/7pFJFWCenWUW
	 AqcVRvKgSITlc9T1X37FPQVgHnesQmlpAs0/O2xU70+nAzAPO2+BnBN3YYtzrdtXH4lmL
	 grLVbaw4UUk8X9ygYRnPY48smrCLFY/T7UM/KDAB9eJ2tG5CLOSWaepwVwRoGcw5swbkk
	 CXVv1q7Q6TNmArjZPbl1m1KqYnusVPtMy2Yf8dqjLLHfJgDAa0xfGP1DPlF2Nz7I8yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
	b=dy9kvkctNIKz8HmsFrKZWiTssyhjFF0IUBsbpnsEHlVo3fmCzmk8QsvV3WhYTSP8X86v
	 6aOt0WR1TLlm7wq6gJT9lgI1WpZ+Rrl00XZ6L/TM2iPS6wKyUNxVWZefYs9VfGQCVmDw8
	 2RbrhdkBitD44CRTbMN8C5c3qkQGdECM06G1UXlPqHayp7nF0Sx2Y27oOUfRBo2McugLS
	 EF5OrGUiD1gw0U3cgYBBZlAo+8RkJSIA3PMbq1V1XyyDoCJ0eRdBFmii13PwIfHMBKGY7
	 HNo7LjEt5SwXxYixDTCxqxYybRZnKAEBGN2GMTDN3tvHfr6ZhpsCKAEu9dSZUq0CKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=heyiTCJ5;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FD606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85FD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=heyiTCJ5
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-17bc533fda3so3892311c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792506979; x=1793111779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
        b=heyiTCJ5gvzLY6aZ1GHKww1GiVNPC4yv+O5aOgSX652Q7Me0YRmk/aD56ARp9sJmH4
         /7wxHYWtVt+Q/X+182E5xa9IxSeKiCdkzrhV5s4Jzo0z5zg9kuMAV7BtzZ7QO7ZBO+1b
         +kL+2XJbckN8g3FGZ5TZYFT0ztN2RcafkZCghXFob075370uuO5e0VETx5xE8Vyf8EQZ
         9paZf+8c6OCEPtVfkFQ3YTb8thK5fF0KGQKnYQ/Zy+8QkvKWxbIHEZXu/hWkA7iV3/Cb
         gjbbRgvSzYGxSI9uL7Qy1ul4fZtOoFxJqVCASCkf5cocCPjBAwN7sD6T6zpBE6ktz9Pd
         nuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506979; x=1793111779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR1+dS7v7LccK2f/cm83IFIuuzYbBQwl7Z5inKNTp64=;
        b=uSKF/u787nDkxZtpGSNOoqWqHxRoc+mtNzhrNzdTsGnfQs3/1W+Y4KZE846zYYovoQ
         M/eUnJYspIZ39LoZwepaP5EeJ+7nBXVQLWaCimZh5LhRxNiOeu9T0psimHAB2E0D7o+Z
         6iPqBHALz58V3g5CGlmhka6NH1a57I8uAIf0RmqOwXFn3hmc9vnINGBTwh5KXGquK80t
         BlbM6TryOoVDbCsDaQZueeLgD/nmbd1S6osrxbwzGiC0Uv/n2ZK2Qlij8VJP6FZejT+B
         Zu/3lAhIri1AD9OoHNs+8te3dsbYdlrEi5zETuRCfaqXbwtdW9ua5S7tzFPvB66+r/Z2
         9Yxw==
X-Forwarded-Encrypted: i=1; AKwUvBybtYwp0f0f6xPgPri7MjCceKn5uQdKbmbZUXlFCCfqfoB+NtSuqfnxLY1XT/nyj6V65caV2875/2Ij1ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCyIbRxPpx8PKuZD+trV/BKoS89d8AGsIob6Qmmtx/24AWE0DU
	m4fVBMRb8HpNxCbrhzOyAGURNYA07ntuWtrWmHZ3nw48JMy77fqoRnMpuFbRpMsG3SnSwi7Slwg
	J6PtTMtk=
X-Gm-Gg: AYBFou2TDYmTfuAWzf9cNwgFAM2QaOPHCDjUyFbL4WTTrqe9AIVTb2KcxoUXSmkcTew
	EgycKB8lCjoKQKyvOeMk8s1Cw5CAngNiX3azPH6OTNNt0QyuvpzQo6sKvpqV3hsEHiaMzShIoR8
	LdBUirI9S3zVIDW9HAHG4BR2J+4WjhkXDIdtVAUj4y4EYmEi7f9v+MDPOtdc9CS5D1sQwChK834
	ubaNLrIwe12tQsvd8LCtWtUbOQbocaWkPgHiX5iYibTXdkNO1nknU5zwextcdHEYGK9/1/kLtLZ
	pIezv3dcjtFMibdGC4db1sIbQlP62kVdwLc89x9GdLAS/oMMKS9ac0e4rT9xQq4lO6mOfwMXJsq
	LAqoIzAZiaVBCLZUMgnWRzQOOOL+ncpiMykOt3N0deN/oFlNvZGJk6kJCNEj7gE/5fI5Y0RVDSG
	b/sitoUPEUi3FxNlYQ0xaIPVX9mUTEzwfQrl63fchg23y0GsxdMYUA0+QTwFuiTQ3LLQRCHy/DF
	VUs5NB7T9gn7iDYa2JEU8L7/IOwgwL2goTwX+0fHJdbs/ApOiomiMvGU3iWC5f81VyPGHPvkQI+
X-Received: by 2002:a05:7022:ea9c:b0:149:49c:233 with SMTP id a92af1059eb24-185138b5a78mr13727639c88.27.1792506975944;
        Tue, 20 Oct 2026 07:36:15 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm34657256c88.10.2026.10.20.07.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:36:15 -0700 (PDT)
Message-ID: <933e2d11-5bec-4737-8e5a-9b0c2a8cad60@kernel.dk>
Date: Tue, 20 Oct 2026 08:36:14 -0600
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
Subject: Re: [PATCH] io_uring: clear IO_RING_F_DRAIN_ACTIVE on drain
 completion flush
To: Wei Gao <wegao@suse.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261018070154.16944-1-wegao@suse.com>
 <ae73d8b4-c2b9-4a9c-adca-8c995ac92975@kernel.dk>
 <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <atbWH7hdrvLQJhOl@autotest-wegao.qe.prg2.suse.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 8:46 PM, Wei Gao wrote:
> On Mon, Oct 19, 2026 at 02:50:16PM -0600, Jens Axboe wrote:
>> On 10/18/26 1:01 AM, Wei Gao wrote:
>>> Fix:
>>> Make io_queue_deferred() return a bool indicating whether any drain
>>> request was active or deferred. In __io_submit_flush_completions(), track
>>> whether any completing request had REQ_F_IO_DRAIN. Clear
>>> IO_RING_F_DRAIN_ACTIVE only when a drained request has completed
>>> (has_drain), no drain was active or deferred (!drain_dispatched), and
>>> ctx->defer_list is empty. This prevents premature clearance if an
>>> unrelated completion flushes while a drain request is still executing
>>> in io-wq.
>>
>> Didn't quite feel right to me, below is with some LLM assistance
>> to try and get to the bottom of it.
>>
>> Thanks for digging into this. I don't think it's just a race with a
>> slow io-wq free, though. DRAIN_ACTIVE is still set when the next request gets initialized, so it's forced async and goes through the defer list
>> every time, even if the drain request is freed in time.een read.
>>
>> Basing the clear off any REQ_F_IO_DRAIN request in the flush is not
>> enough:
>>
>> - A drain request marked REQ_F_REISSUE counts as has_drain, but
>>   io_free_batch_list() punts it back to io-wq in that same flush. With
>>   an empty defer list, we clear DRAIN_ACTIVE while the drain is still
>>   pending.
>>
>> - A second IOSQE_IO_DRAIN request that fails init after io_init_drain()
>>   has run gets completed via io_req_defer_failed() right away. If that
>>   happens while an earlier drain is still running in io-wq, we end the
>>   drain, and the next request is issued before the earlier drain
>>   completes.
>>
>> It also only works if the drain request completes through the flush.
>> Without DEFER_TASKRUN, io-wq posts the CQE directly from
>> io_req_complete_post(), so the application can see the CQE and submit
>> before anything clears the flag.
>>
>> A drain request dispatched from the defer list always runs alone, so
>> we can just remember which one it is and end the drain when its CQE is
>> flushed, and have io-wq complete drain requests via task_work so that
>> happens under ->uring_lock. Something like the below. Can you give it
>> a spin with your reproducer?
> Thanks a lot for the thorough explanation and pointing out the edge cases.
> Your proposed fix works as expected. I ran 10,000 iterations of test with 
> your patch applied, and all tests passed without hitting the timeout.
> 
> Feel free to add:
> Tested-by: Wei Gao wegao@suse.com

Great thanks, done. Thanks for the report and initial patch
and the testing!

-- 
Jens Axboe


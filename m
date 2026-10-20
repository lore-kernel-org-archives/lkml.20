Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506860;
	b=3ylJhFwV+TkIJjG+RME9j9rOg4PcsO9IOuqfLZD+irOak/LAPZudKz+9Zi5wCe3v7Deg
	 gIbwmnaByEqACP8NGdIOcMDi5j8/9zlfeVh6qSO8MFu5TWeRPEdByKWFcFGeW238WVRJk
	 dS3t/mOCGisd0inSqi3T8YC13URu2qdOOUTpB+MSu+msxwW9mNR4ghvBXvBMZp96m5wf1
	 7AY0mhBg6B6C92BH15uH+mSyzFddyRRUwyRCeRElVLzccM1Fw8qAz9QP8MFt7FHJqAILV
	 i9khXeJXvj3PHcBxdUe4FgYKP/j9if67AITOLEk9epRwIn9AuEuCDubwZF5+TawZOPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LacCtC4LHtfTUN0mt4AFbAZKWltnHsvV8EMXxVqac+s=;
	b=fJaFCp4zbSavCFfawuWG8ExXT05Z27/BYE3CobgYOzSRU5ZRzFMl5tRcBQ6iTu5CPXL3
	 s3SSApezrs8rCQvVaiMzRoiSVcHXO+kRYyGFBpu9dwl9Fl9lZFGJZS2v5Tyj7ASnR7Kcp
	 hLypSB+FtlLSDToBc6BGRVaxAVsMgc8/QusbyR/mgUqTpxzDWyl6EMNfwOAp4KjQohi/7
	 FP0esg1Yc1yGtyhiwVp3UQu99VG82bz7JBPu1zAX2QDtR5pjzCEJjFhlvh3Z65at4zSMt
	 qrimS8zBj5X/rN/VG1xVaALx+K8lxcaAfNihXzemDrFgWcwxqEA3FwkcIJ85boSPkTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ho6+5tNI;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA24606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ho6+5tNI
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so6254389eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792506854; x=1793111654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LacCtC4LHtfTUN0mt4AFbAZKWltnHsvV8EMXxVqac+s=;
        b=ho6+5tNIlsv2O/rGJadjvBx67j8kRzgpiuh+eOMQapgDdF74wb4fh8HYVpgt4aIwxC
         2p57be5gV6+Ram+cAUpYmk+Kd6+eSnbp+H/rAb62P+FxBRUQE00S+EGEghiQ+7GgZQ23
         8QS8tXQH3aP8lznDrU2MTIpB2R12QJYR+4YM9BK1FLvDJguehC4WDYz67eOsCyaAnCWX
         J6TNjWEBpHp94G9UxB3TIb8/HsLBcRXr9gbDJoMALJVNC65v5xVPxamXyZJTMlIV5dh/
         iEFDN4xQDeQu+bI+JO4627PbHuzGDv7v0Uh1F31RNhdlqaLCd5ne2pZz8MFOC61Ejcdz
         k+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506854; x=1793111654;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LacCtC4LHtfTUN0mt4AFbAZKWltnHsvV8EMXxVqac+s=;
        b=c0/xYC/5c4RBEf7SGbcXMc5QL9tATOp+4Lq2E4Y4Bed9SJYsFgtKTLLfmWVz6vcT53
         jGl5wlj8SZbru6Gxj9Lcun2E9fglX5Lz8ueU0AvXsNTH2B0iOcrG8fShVm3i9XewGc2d
         x0yl+69UzPEJFxhnN5Fy0HfdFqMy11D8QrwF8bLsRg2D421kDV1ixhE8JxgP4Yl6KJ5X
         /jGeVu3qLswx+7Y9sp18PhemGCpRvkqSOLXq4xWpSM8O47S09VwkKJlA7VS4hab1JYUI
         u7eaJYhwGdUT9sJwNiR9/bwLrQ2XCVd153foG8En45c++XRbGw4XRoz2z6zUteHZuX+y
         CowA==
X-Forwarded-Encrypted: i=1; AKwUvByovYUKGXOhef1S0W5EW0poGW9JAHEYXGuV6ZPeqjHpZN8lMVJOrm3GL2TsD8KQ7bPWe6GYP0203HwSfn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5H2mmSKD51HlZ28uEmsu2Is6EipT3sGtgRLOG0PRb3J2HMZtI
	5pNwvtp0bPg5oHL5+FBWQWhcaqFNRDVd4RCNM7mvAceYKKG9z9xlwQnADJZoMrGTVuA=
X-Gm-Gg: AYBFou1j0xHYWhUqeY+Rr8kezrUwCO+EbOczkA8tIAYs/qRuBu4Cgtz14a6KZS0VcWO
	l/7P33fHb+u2LR1WHWbTid973WSI/7ThAe12yuWFDv1xTVYxmE51nSmxufzVj7RmgcOdOlme1Vi
	GQu6qe3tYkNz3W0Q+MHKtA9OM38o/7Fnq3pu/TyxHloVZvMZakVEJu+QxDU3Lj2ANWMpV77NhwA
	aL8ZWoBQm3W5xrJAkwoSfmUKW7xi5xz4VfVF9BG6kBNf/pwMcUmRTKvwgsrieIv7MXJlZhrrTEd
	oXYdQfz4MyQjeRnKCvIUPlR+G7VI1eXS6Nnepq+6Ol8ikVpnIGYA0fdZruKLmTLAp6dUbU7eWLv
	O93vJr75j6TexRp+GCz2rVEdpL+S4G094G/e+FZI6u/irSP0h/QeKsgxAjM9bIWwWXgLxYCIYX+
	xL9UEEc3u4eTjQlZy4ZxjWii2G2QJjaC1St2AbbvsQXk8dKnokavD90lpcSg/dnGnHKggLl6S/i
	mDLf0ca/LuJkzUhtvkHS7XA4zOJSiMXvrwh0Q2G819BmvWP92bVT5S5PrsuAIxN1TTnyngrKAJx
	Cg==
X-Received: by 2002:a05:7300:f00a:b0:366:b36f:a9ac with SMTP id 5a478bee46e88-366b37ef050mr1350685eec.34.1792506853754;
        Tue, 20 Oct 2026 07:34:13 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm39239436eec.22.2026.10.20.07.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:34:13 -0700 (PDT)
Message-ID: <062de5f7-ad04-40bf-ba4a-ef573d9ba161@kernel.dk>
Date: Tue, 20 Oct 2026 08:34:12 -0600
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
Subject: Re: [PATCH] io_uring/futex: return a wait's data to the cache when it
 fails to arm
To: Austin Schuh <austin.linux@gmail.com>
Cc: peterz@infradead.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019231243.802569-1-austin.linux@gmail.com>
 <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
 <CABsbf=Gnw0+u80oebHZf24m94YSHDxFtYY2-Bq_=bMfvqUUvkg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CABsbf=Gnw0+u80oebHZf24m94YSHDxFtYY2-Bq_=bMfvqUUvkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 11:29 PM, Austin Schuh wrote:
> On Mon, Oct 19, 2026 at 5:54?PM Jens Axboe <axboe@kernel.dk> wrote:
>> Patches like this have been posted before, and my question is
>> always "is this a common case?"? Reading this:
>>
>>> Notes:
>>>     Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
>>>     PREEMPT_RT, W=1, no new warnings.  The numbers are from an equivalent
>>>     change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/kfree
>>>     by call site with bpftrace while a test loops on IORING_OP_FUTEX_WAIT
>>>     with a value the futex word doesn't hold.  Happy to turn that into
>>>     a liburing test if it's useful.
>>
>> makes me very much think "nope, not at all", as it's a deliberately
>> failing test case. And yes if you keep issuing failing waits,
>> then it'll drain the cache. The cache is for the hot FAST path,
>> which is not an error path.
> 
> Fair on the test case, it only showed the mechanism.  But for an event
> loop, -EAGAIN from a futex wait isn't an error path.  Right before
> io_uring_enter() re-arms the wait that just fired, the event loop loads
> its futex word.  If the word has already changed, it handles the
> new message and re-arms with the new value instead.  A message published
> between that load and futex_wait_setup() checking the word makes the
> wait return -EAGAIN, and that is how the loop learns there is more to
> do.  The window can be shrunk, but not removed; nearly all of what is
> left is inside io_uring_enter().
> 
> Here's how often that happens, measured on a Jetson Orin Nano running
> for-7.4/io_uring with PREEMPT_RT.  The event loops are AOS (a robotics
> framework).  Each one keeps one IORING_OP_FUTEX_WAIT armed per channel,
> on the channel's queue index, and re-arms it after every wake.  One
> channel: a SCHED_FIFO 40 publisher at 2 kHz with a SCHED_FIFO 40
> subscriber, then low-priority processes publishing and subscribing on
> the same channel as well, then interrupt and system load on top.
> bpftrace on fexit:io_futex_wait counted, per process, the waits armed
> (IORING_OP_FUTEX_WAIT issued) and how many of them returned -EAGAIN
> instead of sleeping.  Two minutes each:
> 
>                              real-time subscriber    low-priority procs
>                  messages/s  arms/s  -EAGAIN  rate   arms/s  -EAGAIN  rate
>   pair only           2,000   2,000        0    0%        -        -     -
>   + low-priority     12,200  11,020    1,292   12%   14,760    1,229    8%
>   + load             12,200   9,830    2,797   28%    4,120      377    9%
> 
> (messages/s is everything published on the channel, arms/s and
> -EAGAIN are per second.  A subscriber arms fewer times than messages
> arrive because one wake can cover several messages.  Under load the
> low-priority processes arm less often because the load takes their CPUs.)
> 
> In all, 2,520 and 3,170 arms a second failed in the last two runs.
> bpftrace also read the futex word as each failed arm returned.  Of the
> 683,303 failures across both runs, 88% found the word exactly one
> message past the value the wait was armed with.  So the arm raced a
> single publish, not a backlog.  Load makes it more likely because the
> stretch between that load and the kernel's check gets longer.
> 
> Timed from syscall entry to io_futex_wait() returning, 74% of the
> real-time subscriber's failures came within 6 us.  For the low-priority
> processes, which can be preempted in there, a third took more than
> 40 us.
> 
> Without the patch, each of those failures is a kfree() and then a
> kmalloc() on the next arm: about 3,000 a second here, from a slab cache
> shared system-wide, and more the busier the system gets.  On PREEMPT_RT
> the slab slow path's list_lock is a sleeping lock, which is where this
> started for us.  The patch doesn't change the armed path at all; it
> only stops the cache from draining.
> 
> I can send a v2 with these numbers and this explanation in the commit
> message, in place of the synthetic test.
> 
> What I'm after is a futex wait an event loop can reliably re-arm without
> latency spikes.  Is there a better way to avoid the allocation here?  If
> you'd rather not have every failure refill the cache, I can limit it to
> -EAGAIN, the one failure an event loop hits in normal operation, and
> keep the kfree() for the rest.

That's great info, and I agree it differs from the usual forced
error path. Futexes are inherently racy. Thanks, I'll get this
queued up.

-- 
Jens Axboe

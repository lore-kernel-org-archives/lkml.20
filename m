Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457675;
	b=gOs8YoOo4rO1z4SM44oSHtDMgmPrvYRLNMlE3JO4OGKdkxNxuGu1eeuxKM+mXXYurvi8
	 zXzdKbDVHyiL1SexkNGeYZ9vRhAwlC9AEC7IQ4RpkL2fkjGpYXFchTIMeebAAdKxrIDDo
	 KDiMv17EgVaHjkpEChrL5km1uDNAfTr1cmfodm0ZPC3wWHSCGvG+fU/+c5H8mmOUsX3ia
	 60l5aHk8Wo5hXP0aTld3C7b2mWAS9oCnG1ECfMtOsyPxKayc8xK+lf1p41HiRj2Bf0mhT
	 SnMKcY44mjoKldjnkU5SfDNXuXCWImgO0laCrIvZwDyFIrYyJXShbO9mrnjOXhr40QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
	b=v0dHM39Mr/Lng6MyP+mEc3dbEXCirOHPUrkOizxaRCospHTM7fp1ww1hIR/37LkGaSk9
	 hfLv9OedirSjp3Mo0me6kwVhMAxfHdJlLThIklbJkx3o+tkKdplvIT9wOH0o4g6lZo1oO
	 GiT+YCCOCwsoTpraRCnBo1lbqeUqz88M4L9RmsXNmlriKYoS5RWC+PHXuQmiBlEEnZhbh
	 NBbXgE2w1Wy9x73yezWDOzOd8s3/fJJ+X8tg6B05zScPQOEicHBJnY/uuL3REtB/UQ5VP
	 eEtoo0O6fakswYSK+PxnkOAuf/zffpxDE62iKp0F0LGCkL2MpsPSZsGSyRSXzqifYqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6E0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-705cb6cedd5so126435eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792457668; x=1793062468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
        b=PkMfJZUOFRCxLcMlRL0ZVTWuCLtlBoNPC9FNtc1Iavq5b3XBGwzw0hQlrucBM3w2R/
         MpDcL55XZEkJEsaqs+VKX/LQR+rB6ZPywqquFh4wB0qBym+bFZz+PBkbdQBrix8u4DIx
         xoJX5gtSj7Dn1FNRMpgA/JAY5NUFwsyxd6SvQ3NgyZ8UkY2McGVv3AsJbwCi84oHPO9j
         Z1Mw6ndyCbMtuXYXqpOy6lLKjDxhfEHZvstkZGPW+uvx8+iVwYeohIYPK0dFnfGIDrsZ
         x+t9LyaivIOuH/MY3cJP+vWcY5QMAMYCSIeJaPZu8NE6O3FAy2cKenK1W6zBoIAdtf4w
         7ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457668; x=1793062468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZ7Pz6/D14wpEk1Ddz2f2Hy8tiok/YGXHe6Nz544rD4=;
        b=OJJV/+tEidk0DsJLDGwuEpc8muOBPETUYZrW6MJpT0pauklOkpOZFJ2aK/Li3HYAIc
         0D14AKPzHuRm6IAkbwdt156IupkOy6jflrT/Pl+KcXQH/sqgnsugoC+S6xY+m+UkKabW
         FiZ4GLF7t2iQ68TDQl+WHbMJmRjJzvnPNJ0fG6dmqHDwYpqeO/ti54pGf6CFypwo8rMU
         3gSPekvziKek4J3RvlJeHsh+6U2eF3feyA9pseWZylfIViDHsySCXOlcuyiCUYPglfrI
         QRyZk4KK2WXIGjCI93UxYYXUvt+Wy48FEGMkD/pgCQwSKyC/E9/a3Zjal35Y4pFQh5WH
         9hHA==
X-Forwarded-Encrypted: i=1; AKwUvByZhaDU+qHQ2m3cAYKs+k7cu7zU6RV6OA9lvExrFLzBCFYqq0WAXdiimBRnqdr0gvZuS2BobMI5PWscoQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI8RkMrEpEKqnU3WBFS+Uk3T4KEttAf5vNFHnDgM/ktYeqZqL5
	yHNfofHDRCFnvcGE+zhaJJcp13S9dl7kz6embgfQCUjGhNgSIxjCt/uraHfyjZiWYEE=
X-Gm-Gg: AYBFou0yM+v0mMsuuw9kOM0r+9qKtNRyVzgFGag8OdEP5/zvfVOFJHBSwVr+MNwW5nM
	dcYmyIOme7ejOB+Qvp5PcE1jj1JkZyPf8ST3fBePOVWaW7Vycq0dpLC+giRqx9Mi+tZeMvYzVoP
	hhjO8En6LPX5LY8VApjbvgsLU3kfsUoRoQUVLjftWeO6zDIYLV1daTuMfF/Tu7a5keh4Q1FPmYz
	Rp9NOdL730z7iCU4sL7LFncCN3pNSdv/TSFG0J2TP51mQL3onSLAYaiybPaTysf/6GwNwEyjfcp
	xmtEKwe1ZdwUm4KHDrHgYgAzGbaliQjRhr/FyUR4TjLAlmij93Fs3A5xDrUJhU1JITIfw4umttm
	Z7jqmwEU/LbNP3MA7M1pBW920QO2L0MuCYxc/5TeQyWNVO7U2m4fEb2Ywfa56X8E4Vw9hZRIul5
	8v+fItBoXBKdRW4zQf4sx9Fqs+2yFjWDQuuiioJvPti//RSQ/PCJc6q5msPqLiPTKf+pk9NQjLn
	78jlZQNAdZFTVk1AkTQ03oehPfSwV1TMFPx6IErCRNsHnlhfcZMvEv+NQ==
X-Received: by 2002:a05:6820:2224:b0:6f8:2e98:cfd7 with SMTP id 006d021491bc7-707b9615335mr482415eaf.9.1792457667825;
        Mon, 19 Oct 2026 17:54:27 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f0asm9634317a34.5.2026.10.19.17.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 17:54:27 -0700 (PDT)
Message-ID: <6bc4e237-353b-462f-b388-3844821dd67f@kernel.dk>
Date: Mon, 19 Oct 2026 18:54:25 -0600
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261019231243.802569-1-austin.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 5:12 PM, Austin Schuh wrote:
> io_futex_wait() takes its io_futex_data from ctx->futex_cache, and a
> completed wait gives it back in io_futex_complete().  A wait that fails
> to arm kfree()s it instead.
> 
> The usual failure is -EAGAIN from futex_wait_setup(): the futex word no
> longer holds the expected value.  That is routine for a waiter that
> re-arms with the value it last read, since the word changes whenever
> there is something to wake for.  Each such failure takes an object out
> of the cache for good, so the cache drains and from then on waits
> allocate.
> 
> The cache exists so that arming a wait doesn't have to go to the slab
> allocator, and that matters most to the waiters that re-arm the most:
> event loops, often real-time ones.  A kmalloc() or kfree() that misses
> the per-CPU slab takes the node's list_lock, shared with every other
> user of that kmalloc size on the system, and may go on to the page
> allocator.
> 
> On PREEMPT_RT list_lock is a sleeping lock.  A real-time task that
> finds it held waits for the holder, which may be any task on any CPU,
> to get to run and release it.  Priority inheritance boosts the holder
> only up to the waiter's priority, so the waiter still sits behind
> whatever outranks that on the holder's CPU, such as threaded interrupt
> handlers.  Re-arming a futex wait should not depend on any of that.
> 
> Put the data back in the cache on that path too, while the submit lock
> still protects it.
> 
> In an event loop re-arming one IORING_OP_FUTEX_WAIT per message under
> load, 0.39 arms per message failed with -EAGAIN, and io_futex_wait() did
> 0.39 kmalloc()s and kfree()s per message.  With this change, 100,000
> waits that all fail with -EAGAIN do one kmalloc() in total.

Patches like this have been posted before, and my question is
always "is this a common case?"? Reading this:

> Notes:
>     Based on for-7.4/io_uring (5b01d5955ac2).  Built for arm64 with
>     PREEMPT_RT, W=1, no new warnings.  The numbers are from an equivalent
>     change on 6.18.39-rt on a Jetson Orin Nano, counting kmem:kmalloc/kfree
>     by call site with bpftrace while a test loops on IORING_OP_FUTEX_WAIT
>     with a value the futex word doesn't hold.  Happy to turn that into
>     a liburing test if it's useful.

makes me very much think "nope, not at all", as it's a deliberately
failing test case. And yes if you keep issuing failing waits,
then it'll drain the cache. The cache is for the hot FAST path,
which is not an error path.

Hmm?

-- 
Jens Axboe


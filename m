Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807852;
	b=ZzxDG7gWAi4lYz2qbwHH3L6rfvF2tapVAPFJH/Y4Q4GwTIS19+Sr/f7dFAZWV32VNfcO
	 8hnc7btq5Rf2mUgGF2Iv1hmPq4FjSKdE2Bu5FkOskjxRMfk+83tLNosd2h4Of02Hg/pkp
	 79TQ2k1ZWzdZYgnkJ0fKOmMlDRBYM2fPGwVgQmUTrp5SN2g7KQ4MELQgaZ0PipsBuAVYS
	 zYGvunaJcjjQqAU6nvXHcw/JnZhS2Gy4OK+lrz2SMHkiLppeqdRpY259wQLf7Ug0/WyL7
	 clMoGJ9bhPu5surA8XF87s6ho9/m5eCTg6rYPAl9QnEx3lJqET5k18+79wmL5YbHJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
	b=3wr2rZmv22fN6nntH9xRUVP15UW3bFZ1MrXjy3OX+VHQZQpvqtZ1wfzVm5x0frfmXUZV
	 yHy/8pMFJwwihEXyzIlw/Cobx0+fz8wCarfVoZXhziFXo5thLhnwcjYzjcwJMX6e8+/Ct
	 nPkCyBsS4gbAJxiO0B1uvGTfLfy1KkrBQiV2M5yect0RQf2w2fYXimR8VD4trXHhtMKtN
	 ue6UVR0n1ZOGjp066wSJBw+c40yItF1FZmB3wTKQrKBTqtd7fruSL1UN/tIST6+sy48pf
	 GLxG6PxMYhOzCuyl9VH3CU/612guF14byQy2TV/WxjsdhGbi69DMQBnPOAsy8e1NMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rh+5Wr6X;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C9F606D839
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C9F606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rh+5Wr6X
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a822463a22so565643fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793807850; x=1794412650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
        b=Rh+5Wr6X0oJFm7cUtmnB780WmqbM/ENM3a8i2ARjLYHWZFLrgnXMokIAg9EzVsahYr
         RjoQ6dClfy1+V69Qqaf8SZLKHdaQierrZ2THnuYOS3F60chX6B/5exw+4FHxXh5VtOIs
         kwN6mfyJssWVU+e6UI/1TLMWxBg8VhXwI/Rf3vaaopL9niHXsEL3TTkOjGOF28lO2YPA
         o20ctc06w5gQGEFeiLEl4NHfsHQ3p4byMxd66mKvn1JScKFb3EOmNE6/Z6AE63IlYQUw
         CBiIz3CVAyEZhh9M1zNDg9y2aX0N2N5qXm2AFoXGPwZyPzDt/inp8Bfa4L8zSPx7MJyf
         Vu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807850; x=1794412650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk7WaUVAPHjwSZ8WgmPUlAUmwEhJpE2sjlLBaU/kUfY=;
        b=Dq/RY3ljJszexKjWsp7/4xvnu2j45PWzgr/yuRmmpfjInoiGvxsqNfNPebwdpOg28U
         VBCv49jJGlBLmhs416hcq16e/2kmES4LiKF3nlPJ5dgtBRtJkSXCSa1snzsxMfncTQ43
         S1GnUDlOGy+rk+7zkgbfrEPahYiMMAiBu0ULfZWL0ET5247nNfxLTf4HyRMDnt743o34
         uj3iSSU5hhiGUBHptd517UKnbGsNB97jNWpcPwEAkpEPa8msoZKVfKw29r5E89zsD7KM
         ZvI4LvfUjOHSewtJdIcaSYszgCBXC6xu2TlvfpNusJo0IZtA9gDmmSJqcPDw25tiblLL
         UzsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYI0cVitoPaHURBsKYC4WtyrMfHfzv61xvMSm2l8VreP7hj2rRZgKK/jqJndHdJAI5v/pidpLd87B0GZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Y55IKGPzmObNZyVKgbaOQ9/ysil4S1Ovpp434wB33kSSD+ot
	jUXin8j8baDi1B3qeojtFhny7c95ieoDosnjorQ8g5u+dz4ieZFE7SUH+vmnNR7Q7M7l0m5KlDs
	t4D7RBnw=
X-Gm-Gg: AYBFou0SBEcfYrZJK8kuaO57x3c5V1UbfGd4WcWFg2lWnj2hZcwyBCBsNf4mzSGBW8/
	oobXHjz/+FCh1LNVv3uigL2oEalm2cQKVboJeKa1zVcgNXFROMnXvWVDcU9WFBnRTzH1ztWzto8
	JLKChaGyQ0qNdjmFGNG/xQOzN0itnRt7//Z58TS6HIICn4cPDw45A+GkPNfOkOoDTlFdbVHnQUs
	GgKgZq6ddaV34wrr8o4j525QCpvXu3roMA2EJ7ArEHkjHJqs4Eer3ioODvMMGauYxFyPZqohHW+
	LebLLyF/C6/lUulTkgoSypXXiiAZH23EMkD8O7ElvPIXbj3R3VZLdzzPe/DdaB8j9LpUnATvxgl
	XRSqk2g2WBcRpFMuYxk+bavpG5EQpnP55pGoVDj2end+s/7zqNft/+DyJkY5iaOWZoz98MqglvV
	vrfbxonRGpC7sxDDOLqjCKSizUhk7vrTI2BBGfhJ8YhK1KfPtiERl7HN1zrVGR4FiMmdQ0j/1Ir
	GeOv534pKpC8zIwrsvORiUUHJShGkcxZXM2B6frVm6oTIa7qItQaR4RwRUvEYDgJKLhFqkAK7rq
	b75k6LYh8gK3bOw4qvGWKuTmyA50AexPWq8akn0r9n/CzCMFvadffURfXLfF6Sx6Kq+A874P/C3
	5AB1bpOWlHjMapgRbc4H12DVtgvQZhA==
X-Received: by 2002:a05:6871:2b17:b0:494:895e:c3e2 with SMTP id 586e51a60fabf-4a90764ca88mr11054199fac.20.1793807850283;
        Wed, 04 Nov 2026 07:57:30 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea5f93b7sm2261237fac.12.2026.11.04.07.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:57:29 -0800 (PST)
Message-ID: <b0cf7a92-02ca-431e-9210-f76b205487fe@kernel.dk>
Date: Wed, 4 Nov 2026 08:57:28 -0700
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
Subject: Re: [PATCH] io_uring: only wait for in-flight requests if the closing
 task uses the ring
To: sariorkunemin@gmail.com
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261104-io-uring-wait-inflight-v1-1-4361a0905e20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 4:56 AM, orkunsari via B4 Relay wrote:
> From: orkunsari <sariorkunemin@gmail.com>
> 
> Since commit 13d3783a55b7 ("io_uring: wait for in-flight requests on
> ring release"), the task dropping the last reference to a ring file
> waits in io_ring_ctx_wait_inflight() until every request on the ring
> has completed, and only a fatal signal ends the wait early.  The
> requests may belong to other tasks and may not complete for an
> unbounded time, e.g. a read on a FUSE file whose server never replies.
> A process that merely received the ring fd over a UNIX socket and
> closes it then blocks in close(2) for as long as those requests stay
> in flight.
> 
> The comment in io_ring_ctx_wait_and_kill() states that the wait is
> meant for requests owned by the task closing the ring.  Only tasks that
> created or submitted to a ring have a node for it in their
> io_uring_task, so skip the wait for any other task and leave the
> remaining requests to io_ring_exit_work() as before.
> 
> A thread of the same process that never attached to the ring no longer
> waits either when it drops the last reference.  A task that is attached
> can still be held up by requests submitted by other tasks; that case
> is not addressed here.

Fix looks fine, few things to sort out on your end:

> This was found by AI-assisted code review (Claude Code).  The fix has
> been build-tested with W=1 only; no reproducer was run.

Just drop this.

Also fix silly double spaces in commit message, thanks LLM, and
verbosity is also overkill.

Signed-off-by is a legal contract, use a real identity, not some
handle.

> @@ -2547,7 +2547,16 @@ static __cold void io_ring_ctx_wait_inflight(struct io_ring_ctx *ctx)
>  
>  	if (current->flags & (PF_KTHREAD | PF_EXITING))
>  		return;
> -	if (tctx && atomic_read(&tctx->in_cancel))
> +	/*
> +	 * Tasks that have attached to this ring (created it, submitted to it,
> +	 * registered its fd, ...) have a node for it in their io_uring_task.
> +	 * A task without one owns no requests here, e.g. one that received
> +	 * the fd over a socket, and must not be made to wait for requests it
> +	 * has no control over.
> +	 */
> +	if (!tctx || !xa_load(&tctx->xa, (unsigned long)ctx))
> +		return;
> +	if (atomic_read(&tctx->in_cancel))

Similarly, this comment is way too long. Cut it down.

Resend with those things fixed, thanks.

-- 
Jens Axboe


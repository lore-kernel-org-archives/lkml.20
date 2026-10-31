Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477609;
	b=xQ16jdc8jKNGKc8gB9otp53URJTM3FGeIY9hcHXvXupm+EMUWh6CmKx+yqMcvuaeOp9Z
	 MLN7cCEZWKXF9kR6XcyieLTeAyGRamtbH7n66mzXW49Nom5B1KhWN0L0HyeJUunJQlKPU
	 SkdAFqDDlAQD2Q3/c++sgUPYpGJ38Fx2Ku0492PSbG/hvv5g31KhLbpVdzutqtSezyuCI
	 rBYly4fVUn+8DuhGHEelMGpwsPhAWt99HE7KUUCi+9KYNLrurl+vx1MIWfdOLYEWx3gjR
	 RZaaa25i6Zrswh21c1OzXSf6B1gfayWZh4RncsRrZyx2Et1rh8WcvqkMBeVe3Cgs7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ECtJrZ810nCPL/tA58/OGxY/aV7ZpN5NiiX8ilCDeYc=;
	b=fIilRebuz/kUbRtxV9qHalivvarf6ScQuKw1CzA/TWOolv0KJOUO2Y7BnZeyMKXx5ra8
	 qnWGHcLwHlfottCDJGvBXAHP1ivrAtqmvjT415WPydt/P40h7/UVgBYZ9pLAqTBaDoD9h
	 jYFD7wetxmOOAAVelTrmYX2LlTWKQawTJ4K+r6FFq8aNuNeAEhmJaYH3gOiaQqTOHLQV3
	 7kbx3Hw4jSoZme9MQ3NSuTm804T7drPMNi4ID4qDoWChNxMmtdFvrmOcNyznVefwSqZcD
	 CKFonR/Ic0R5t8ZuOM0v7+bhMck/jayd6yyzoGhwsbwWgaQOX00w5WAxTljvuhrg3BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO0s5P9L;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D2606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JO0s5P9L
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so1084105e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793477608; x=1794082408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECtJrZ810nCPL/tA58/OGxY/aV7ZpN5NiiX8ilCDeYc=;
        b=JO0s5P9LKzHMJsghAXI2fQw6MYABlSmwkj7a/v+KCDLJELV+EzUS4lOt9yLLHatFyy
         JZZX7Fyqc5ctSKdH0f4WVFOKCDTdqVh3Pw5f/96Xil7dHguEAG/XjLRcdfbkP1iYhrLp
         XLNkiUEWR6+m8Qa0h0L2+FsdNgCjFv3LxSkYKn7DGpdgluvTptcNwtsspo++cZbrIwM6
         NUnb2xa/u1yknNCSPFGTPtTxFJs/ZhdimnLAsjKZKJquGA0pvpKrKfBn6WVFoMjoagNH
         4jREjFmhaaBiYS7aIZraF8v7Yzl0f5N5Z8Pl7Azm511BDTwh69lw6fLU5eyB2X1pOBJL
         O9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477608; x=1794082408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECtJrZ810nCPL/tA58/OGxY/aV7ZpN5NiiX8ilCDeYc=;
        b=dL6yDjYjgt1WbFbpxiOOPo4/nXdP1bSW/TdQw1v0wyUlZ9uxmFosGZ+5J2xE3we/3E
         A+u7BUEIAj+q0TRG/E+SvynaYmeF4tNVznWGQyOy2ZktVbI8kfW0ANiBWnjOBiXUKpff
         VXDWZel0hAVyPoPASng5vY0+mJU0G53P/xxhtc6yeDeVmfXZEnCryIs2M9V85dxBc79J
         b8ucF5YKM5wZX+R6GqqC3LxcBESla4HH8nr2W3AXpcIv8VgW9jfv9Hfgsfc3y/FoR5sS
         y/ypCQasFvdKpq9Yd/x75hvQDemn91AoqJZ1/YpUf5NpSLwna9XoZHc2TPpE5kYz1pzU
         FFcw==
X-Forwarded-Encrypted: i=1; AKwUvBz4aB1vQtlKi77ZjRwu4vuf37GGtK9p1aToNA2bRYMMtg9btIHD2Qumk4wpJ+XWgDR38XVM+6/n6rn/X58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLYfRHz8/aIqjAuW5kpDrDvrp/2faATnm0XCZYPXcpd+b3TB3R
	pYcNFP/jRaI3KutJu5Sk/bhab78Z8PpZAc5yqKyozSKvGQj7h8u3t5hLpR34gB4m
X-Gm-Gg: AYBFou3S4M2k+q5itVWLlauYMeLMXMffqKqWJz2JvYmUnZyNFJt5gBl6Q+GOy0eIeLv
	N9930JpUwBKJXacYznJQaSnpyC5zwLNayIdFRdjy2eCu2Uwgj/f/vga++dxN3COhQOIytGshsVr
	xFwHidEVOe50+F7VyLcbxvNnoWars6+svoeeiV2zAgMfGgviC7rS8l6kZB2GMDzDyB92pyqe11D
	oUYGirKz8KX29inAxW9kipZtCWtzXdYkV2reWi3j8GkYNRl5NzN1aUEOUV8AE76ZKWNVpRVHiuq
	TLVKa5lLADKQIHwgx66VX+j8jcQuycr5LkbgFpGxhhLSmAMcOcn2paCUD8DRk7z3zmQxFSW42PR
	+mkDq1wWlfmMMD18mNiX24FReZqLQKz3wjbJXV+DfpZClwXTAc1gqoNRH/FbCjmSNDkfB/vVmDF
	5o6PfNBLjtEs1ws++GFr1ebR4uhG6oYy/+cirhTak1ikbfcvm6tyEMbtuYhrYz6qv8oY9akyD10
	qE4sEfi1aUSsLBiXRO3g2FrMuzE+3S3OSDEUDxqhxBKqjomH3ZvV0UQWpbrhdl7mhZc7StKdxXu
	XzDzO9vIJfnAXYHo8zxJ0bIK
X-Received: by 2002:a05:600c:198c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4ac151a9a36mr144521815e9.4.1793477607538;
        Sat, 31 Oct 2026 13:13:27 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm11733605f8f.31.2026.10.31.13.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 13:13:26 -0700 (PDT)
Message-ID: <751f878c-1a2f-4fbe-a255-3520ffaa2f28@gmail.com>
Date: Sat, 31 Oct 2026 21:13:25 +0100
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
Subject: Re: [PATCH] mm/userfaultfd: store the child's new uffd context in the
 wait queue entry
To: Tal Zussman <tz2294@columbia.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261031-uffd-fork-ctx-v1-1-a837fd576ffc@columbia.edu>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261031-uffd-fork-ctx-v1-1-a837fd576ffc@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 4:47 PM, Tal Zussman wrote:
> A UFFD_EVENT_FORK message cannot carry the child's fd when it is queued,
> because the fd has to be installed in the fd table of whichever task
> reads the event. The forking task has to hand the reader the new context
> itself. It does that by casting the child's userfaultfd_ctx pointer into
> the arg.reserved.reserved1 field of the UAPI struct uffd_msg, which the
> readers cast back.
> 
> That temporarily puts a kernel pointer in a struct that is copied to
> userspace, and results in ugly casts when passing the uffd context
> around. While resolve_userfault_fork() currently zeroes reserved1 before
> it is exposed to userspace, this unnecessarily risks leaking a kernel
> pointer to userspace if future modifications are buggy.
> 
> Store the fork_ctx pointer in struct userfaultfd_wait_queue instead,
> which is kernel-internal and passed around anyway. The casts and the
> zeroing go away, at the (negligible) cost of 8 more bytes on the
> stack.
> 
> No functional change.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  mm/userfaultfd.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 3b71712edab4..cae70df89c00 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -2430,6 +2430,8 @@ struct userfaultfd_wait_queue {
>  	struct uffd_msg msg;
>  	wait_queue_entry_t wq;
>  	struct userfaultfd_ctx *ctx;
> +	/* UFFD_EVENT_FORK: the context created for the child */
> +	struct userfaultfd_ctx *fork_ctx;
>  	bool waken;
>  };
>  
> @@ -3006,14 +3008,8 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
>  			 * didn't.
>  			 */
>  			__remove_wait_queue(&ctx->event_wqh, &ewq->wq);
> -			if (ewq->msg.event == UFFD_EVENT_FORK) {
> -				struct userfaultfd_ctx *new;
> -
> -				new = (struct userfaultfd_ctx *)
> -					(unsigned long)
> -					ewq->msg.arg.reserved.reserved1;
> -				release_new_ctx = new;
> -			}
> +			if (ewq->msg.event == UFFD_EVENT_FORK)
> +				release_new_ctx = ewq->fork_ctx;
>  			break;
>  		}
>  
> @@ -3111,7 +3107,7 @@ static void dup_fctx(struct userfaultfd_fork_ctx *fctx)
>  	msg_init(&ewq.msg);
>  
>  	ewq.msg.event = UFFD_EVENT_FORK;
> -	ewq.msg.arg.reserved.reserved1 = (unsigned long)fctx->new;
> +	ewq.fork_ctx = fctx->new;
>  
>  	userfaultfd_event_wait_completion(ctx, &ewq);
>  }
> @@ -3404,7 +3400,6 @@ static int resolve_userfault_fork(struct userfaultfd_ctx *new,
>  	if (fd < 0)
>  		return fd;
>  
> -	msg->arg.reserved.reserved1 = 0;
>  	msg->arg.fork.ufd = fd;
>  	return 0;
>  }
> @@ -3482,9 +3477,7 @@ static ssize_t userfaultfd_ctx_read(struct userfaultfd_ctx *ctx, int no_wait,
>  			*msg = uwq->msg;
>  
>  			if (uwq->msg.event == UFFD_EVENT_FORK) {
> -				fork_nctx = (struct userfaultfd_ctx *)
> -					(unsigned long)
> -					uwq->msg.arg.reserved.reserved1;
> +				fork_nctx = uwq->fork_ctx;
>  				list_move(&uwq->wq.entry, &fork_event);
>  				/*
>  				 * fork_nctx can be freed as soon as
> 
this LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a

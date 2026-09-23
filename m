Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FAC56B854
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200983; cv=none; b=VYR7raVhbb0Pmg/EUIWjwL+QfK5F03eXakkx69O5U1k2LLSzyv4hqG9/Dec/P1PuCJRA0tNgkU4lQyqnOhUnch88ZqN3I0mcTOo4Iy6tOwhLarvSfe4XVRjFYs7inuyKIH33eter0QeA7tAOTdcbEUJzRwVv5LiRCXaUMfTR1yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200983; c=relaxed/simple;
	bh=IQtfIdTPCoyj/LPOzXy9L2pCnsbge+BJ7cQPYEUyr6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hF+UyPdhqxvlUa3RbYIEDx0SlYFHMig7QKoRN9FingZOu639kjo76kTzK+Kv7uSe31/r9h4OjpgZlNzTzmSZrPFYb6V8kqpQGw/IU8Gst4v77wUuOm3UcBXRbBzVPgeUI/O9MZzv3q0wBXZjkmsxiOjJROaFSWTBAr5iIgYfazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ntSHQ0Ah; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ntSHQ0Ah"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b445a84fso10035ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790200982; x=1790805782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gMihycRIEpInWCX7IHH7D7knBcA2qQpts3hSkXUP8RQ=;
        b=ntSHQ0AhWmy/sLTCM242dl76zWZxjF5/x3mW3AfGkk2KvSE6LAnv85P/IgdCWD+dA2
         7WqgfPo+qDPQ7uw5yVu8TEHpaiq25qmzOREotpwwj5ZAgOKJ9Wc6oCg9VpjFpfqysbAE
         /lyFQq5htC38onk8IFlQdIBT98PtjB88orn6IYGOeHfSmgcmbo2kc7tHiIkQZuozrRlW
         hYv/M3gFzt86617yEU1lnDud5GijqSPFi6UpjcbYlvttlLODMrfjGkQvz4kIR2iLsR0I
         j2sKEQUpmjVdMSPqmJdyCKaOdRgnLN9/XnDbW9iZAVAreO8nJnI2ooTSOTO3PVUxZQ2l
         ErYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790200982; x=1790805782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMihycRIEpInWCX7IHH7D7knBcA2qQpts3hSkXUP8RQ=;
        b=fUbYnNS9SbpLBSBteQ7U7gZ2LGciJltqEiMPZiUcv5Qm1+l6/mMroaePIT52EEhVGw
         X47bA+Yb7vHsm/06AuZxsqqjsA1vTDyFtZMsb0nda3Sw20S/RgDQgkGP2PHUGpKzns/b
         A9sk3TmcMmeIu+TR0lVhYy4e81hqUSHrIosE4c4MQorKwbvfUeUwHzng+bsjsrwa9Dk7
         M18kQILlRZexiyoQsLYNKGRqz4JXCL3B+Y4h9vRE7X7kCoIRT0svTFfEzfX3We//n0vn
         B7HCiONu28eLSrPCzPgGwmCj35bRsUcb2xl9aRjvQL5TFftTDRhh1aAupf3EVO9bZcix
         YG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqDJsvHGy0ExPJfAFvsn3Jm3WG3/5WGiY8MxaqLWGOzjXENsLNS5ufUBjmFjWclUyYcwihIai8CxlSV6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k4fy/ZC64panMc1nDHn+oNw1TLCa/xwuGgz+ktIv9PPT24fR9K
	yQ3Pb9Wx+Cl4CMKjbEvOv+jdWttTfqyQKbpB8Dps7lq4tQ08jV9FznY5fopTq1E+bQ==
X-Gm-Gg: AYBFou37EcYtLLGt3ZJnfl++WVs/U74XxWv8yyUHxewliXAbC3z/DpKsvvjcjX8pUKo
	q0UCzFeIZSgaE/WGgQwNbIIbcweUKbK4i+JVJwem6sD+xUAftHWFM/TZN0WTvm6vwwqFWO7JggZ
	271NYxNC5YrMCNW0B9mQAslPHLmNavVR9vvy3R2Plhf0mnBGLkbVcPRXiril+LX6ZTlAywW4p0D
	il/Xo9OpVx0aV1R4rx2nuVh9hy2UByknbmE+rX4ipP1sDE5LBNgtMepeS+aJcCCNR3Znbv1rbq4
	6mtYTcosk8zLPy7OlImRHl4FaXRGi9X0WIYwlCpj2YpT8cd3iT0t64CSsHWkaTKC13HBNMeLSz4
	nP4hz7bPT0bLwuSAGWEWwrXbRmZAwU8xc6oi9rOAe0oQmqVzRKBQQ7AlSiSsOUd2jhJOPxA5/IX
	4wKCQKWXepY4Kb/HiMqdkvoYmgVXfyyknuFZ+wiEmpQGBSa3OoC8NhgzWBskAqWWjeSLcc6Rki9
	1Duwl4oayN9iDkSzs9LlJm4xXQGd3j7EocVwyum+cWOeoKwRWElOIB2xrMkHk7HQMTpt3w6rt3l
	CYeOT5MhQAUnLvkdGHXgY4A5tqHvnPeSOLsJOi/3qaldJFQ=
X-Received: by 2002:a17:902:ce11:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2df7b013b36mr2724855ad.2.1790200981090;
        Wed, 23 Sep 2026 15:03:01 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976ca5f9sm987192a91.14.2026.09.23.15.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:03:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:02:56 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: free transaction buffer in binder_release_work()
 on BINDER_THREAD_EXIT
Message-ID: <arRMkOarT9VuUqmV@google.com>
References: <20260919213651.3316944-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213651.3316944-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:51PM +0000, Hui Peng wrote:
> When a binder thread exits via `BINDER_THREAD_EXIT` (`binder_ioctl()` ->
> `binder_thread_release()`) while the process itself is still alive
> (`!proc->is_dead`), `binder_release_work(proc, &thread->todo)` drains
> pending `BINDER_WORK_TRANSACTION` items queued specifically on
> `thread->todo`.
> 
> For each `BINDER_WORK_TRANSACTION`, `binder_release_work()` calls
> `binder_cleanup_transaction(t, "process died.", BR_DEAD_REPLY)` without
> clearing `t->buffer->transaction` or calling `binder_free_buf(proc,
> NULL, buffer, true)`. Because `allow_user_free` is still `0` (the
> transaction was never read by userspace) and `proc` is still alive
> (`binder_deferred_release()` will not run until the process exits),
> `t->buffer` and all translated `binder_node`/`binder_ref` references
> inside `t->buffer` are leaked in the active binder mmap pool, and
> `t->buffer->transaction` is left as a dangling pointer to the freed `t`!

I agree this is a leak. However, the buffer->transaction will also be
cleared so there is no risk of a dangling pointer here.

> 
> Clear `buffer->transaction = NULL` before
> `binder_cleanup_transaction()`, and when `!proc->is_dead && buffer`,
> free `buffer` via `binder_free_buf(proc, NULL, buffer, true)`.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

This commit is again incorrect.

> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> 
> ---
>  drivers/android/binder.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 8f2ef1bd539f..1c7218e599a1 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -5206,11 +5224,17 @@ static void binder_release_work(struct binder_proc *proc,
>  		switch (wtype) {
>  		case BINDER_WORK_TRANSACTION: {
>  			struct binder_transaction *t;
> +			struct binder_buffer *buffer;
>  
>  			t = container_of(w, struct binder_transaction, work);
> +			buffer = t->buffer;
> +			if (buffer)
> +				buffer->transaction = NULL;
>  
>  			binder_cleanup_transaction(t, "process died.",
>  						   BR_DEAD_REPLY);
> +			if (!proc->is_dead && buffer)
> +				binder_free_buf(proc, NULL, buffer, true);
>  		} break;
>  		case BINDER_WORK_RETURN_ERROR: {
>  			struct binder_error *e = container_of(


The fix itself looks good to me, but could you please fix up the commit
message?

Thanks
Carlos Llamas

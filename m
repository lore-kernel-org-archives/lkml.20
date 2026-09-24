Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D743F0BF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290796; cv=none; b=Sh8Q/S3adf1m7HXIIxU/tpIK0qRTFQzWPwScx6kzs/G5d+5CeWzqR3SBcyevWBzwP3TasPDo+qlPP5wtUCtzA8JPr1nIgkfkd8zYHXm3fbnCDMessxbImRz+BeZc0jU66R89+153/mlF3seahMZaItBOthT5sLkk9IXFaZ8j3ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290796; c=relaxed/simple;
	bh=pJS20lYE7XpUn2yFrnpiOdX+vGhq2WQcLhWqRTWScEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHmeiHHDmwCLi+dhwBuAEhyJyDkPh0z4b4G8TUrsUGv7hGlGGIjjuDlBi7XhTMULSHb4Kfu+fy33RyRsVgeJXqP789fi3SPxh3RaaOzOzK2uytFLXKceTAdlyRNEXGphmltBlsA9Lt/M4lNk4Gkl5FXTzYno/RkSIGC+jkTt8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=oilmx+V6; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="oilmx+V6"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace19so126701eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790290793; x=1790895593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZKY5d3/Dytyzq83xaE0ybg0ezdV/AE3RMLYgKKHzPQ=;
        b=oilmx+V6M2Cpr0FGNXxL5euQpJ23gaVOdE7tku7DCR5I4TrmRr4F+GT1Sv7XfBB4W8
         Are6So0xlhA9mJIbzS0WaTWaODWagfInWGW5/cvzeEFjqoD6f+4Tk97qrovIYfGsXqVt
         nwguhSbcYjHskwxpntVhwIKS0nB65jEuKbegtFDDKJee3UbM6/UccS5muTG5q8T6wbTt
         I40jCbRt5f2LwZeAPeJpQznbCOrnKMEIJg3artRZxnMaoVaMMjxlurH8+QLMJEbQbXsh
         ywvNRSmfRZ4AdZPC3MEtMIJy/BmHttum4rxNTsFgc+nPLjDo0+fb4LHrneF8ujxfNTQF
         bdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290793; x=1790895593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZKY5d3/Dytyzq83xaE0ybg0ezdV/AE3RMLYgKKHzPQ=;
        b=zP8zc/RAD9fBERk2/foZLG7GRMsCD2oAjnnz2FiwZ1ofWOjNCLlNAnaiUE/s6e22nM
         kn40vAWqzIDc4ZzSIOw3qNZswGuJHIf9j9Tu9AyHDneQkxK3JwnOtnoEG3GpHZx5Je3z
         7YUWyqvndUGvkrSBeoYwkc9zH6SbXS9y2NwOehSNb1/s/NA5ZJF+NNPMb+a8Mv4Xa/56
         19Olm/+AvILZM9dYIRCSZb1csHqOuaOXK9jRFTh9lYdXPP/jbHUaLKQ5IX/zO9KR4auz
         mdkgrc4jSRs9zIsA2tb6yv4xPHsubSyPMKk88VbF8zaoLMRg8gKe4IvoQmQcB/Q3lSB0
         NWmQ==
X-Forwarded-Encrypted: i=1; AKwUvByhWwzKKOPuzKHG9W03iZGI2bQFhbyK/pe2hfSVpL6HYVx4mRS6ZydylUUDkEveSkZsvRaE6WwBRwVB65k=@vger.kernel.org
X-Gm-Message-State: AFuF++lKKahZ5I2JSGopMB5b1buxn+MLkHURV04DfE7jLifUbOgd1K+e
	VwSPpAanKVDc1ZiCMf5VT7iWYE50hue691XCBuYz80QPL2p6D2znOAUp8w3mxVgZOsOsK5IVL/T
	yHqY+Dlk=
X-Gm-Gg: AYBFou3yK2OsHEOZMjqKddo4yRPLySQtO/HSq19qIgN2MY8juo6zPo3FwRBRV+8yoWm
	K9r/fVgdJoLl/HEjc0FqYHv998u2/BOy8FoQsoGZA1rrA3BGxZiqSYm153P3B6i+swDSQ/Se1mu
	sYWNt1YyG9UTYsRJ229gFA1hoHXf7Mi/tjlPO3SK91XN2NC/4kCieHkd+//CurgAL0Lu0A/Zesm
	OPZ5bjibiKrltoj87Ga7kY0xG+qFkoHk/v8sZviuj+JpOBz4qy7H+n2q2emE1BozAoF1AeuktUO
	5JTEEw9t4tw0FP47O6H8j6ViW4xqcV102x7zc4xl6FL7EzyjJvWW8vU+4RPZ3hGJjjz7oOJnIGF
	fgg/UtFwrpJph00v02bcyV22K61vSe10dmB/SXTp7YNwx0jYhCm3Z6QJbXpfFUO958EovTS4nw2
	qQDkxtbXF8++ymB07HClj0HN7ggufToXv1laEgH+h5VilePBl5G+jhmgbn0z6Aq/sum1/+37h4v
	kL0ax9DEk8o7iig4wfOTG4eIsdA/mt7b/C598S8Zg/thXCSjcez8vs=
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr2933698eec.7.1790290792990;
        Thu, 24 Sep 2026 15:59:52 -0700 (PDT)
Received: from [172.16.11.208] ([4.39.28.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407d18fsm1457174eec.10.2026.09.24.15.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 15:59:52 -0700 (PDT)
Message-ID: <096d996d-3028-41ea-bf0c-f7eef1281fcb@kernel.dk>
Date: Thu, 24 Sep 2026 16:59:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/sqpoll: pin task across task-work publication
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260924205056.3759980-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 2:50 PM, J?r?my Jean wrote:
> SQPOLL can consume a request immediately after mpscq_push(). If this
> drops the final ring reference, ctx and tctx may be freed before
> io_req_normal_work_add() finishes using them. KASAN reports:
> 
>   BUG: KASAN: slab-use-after-free in io_req_normal_work_add+0x439/0x510
>   Read of size 4 at addr ff11000000ca0000 by task repro/55
>   (...)
>   BUG: KASAN: slab-use-after-free in queue_work_on+0x25/0x70
>   Write of size 8 at addr ff11000000c3bd00 by task repro/55
> 
> Handle SQPOLL before publication. Pin tctx->task, publish the request,
> then use only the pinned task so the publication tail cannot dereference
> freed contexts.
> 
> Fixes: af5d68f8892f ("io_uring/sqpoll: manage task_work privately")

Was going to say this isn't correct, as the mpscq is newer than that.
But I suppose this already existed before that, with the previous switch
to private task work for SQPOLL? I'll dig into that a bit...

> diff --git a/io_uring/tw.c b/io_uring/tw.c
> index f573bcc3af6a..2e37a3fd7a33 100644
> --- a/io_uring/tw.c
> +++ b/io_uring/tw.c
> @@ -210,6 +210,19 @@ void io_req_normal_work_add(struct io_kiocb *req)
>  	struct io_uring_task *tctx = req->tctx;
>  	struct io_ring_ctx *ctx = req->ctx;
>  
> +	/* SQPOLL may consume and retire the request immediately after push. */
> +	if (ctx->flags & IORING_SETUP_SQPOLL) {
> +		struct task_struct *task = tctx->task;
> +		bool first;
> +
> +		get_task_struct(task);
> +		first = mpscq_push(&tctx->task_list, &req->io_task_work.node);
> +		if (first)
> +			__set_notify_signal(task);
> +		put_task_struct(task);
> +		return;
> +	}

There's no point in having a 'first' variable. LLM's love bools...

		if (mpscq_push(&tctx->task_list, &req->io_task_work.node))
			__set_notify_signal(task);

would be better.

-- 
Jens Axboe

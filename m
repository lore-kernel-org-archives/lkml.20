Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701799;
	b=XlK0+OZNpZsN8LaTmPFO9HuAbBEy04lT7mZW1NGKp6EebaG6pJEljMrne/Mcc5DVZAhv
	 cvAIAWbpCZXwKX6vJqaOYNlOvQxlVv5z9PZTER6TMO3hoFx2HSLnjlgww4te2BU3El9LN
	 9g6OXRMWi1NggCJQgvgadGimN9gGuM+K1hm8WF+G3pOL+N8WDFzvEfjwV1IlqOFnRk50S
	 1HRmzdV9r97ZBCcE8MvCP6QeCCOHCL1cb6MGPv6bCfm2ocas7XLGJCu+e/GKmGXdqQmAn
	 VPCxGFCas75fJ8wJP3CumA4YKs4NlvGHMTkRNbItheX3fUcK8Q0IJB7mo5NcUBgHI8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VEBzE1knwqMxBYVeqkNmuJaFWfXuXmCAgemIUauhHa0=;
	b=NlgAbKjvihIolVfDsd87dwTR8XsF5t2P55wEQ5vjta+ob/RpdsZ2J13JSDYB3x5xYdPX
	 PeavGX4gDrU4Y/4n6EXfwJTx0+YFAoXdupE4i3J0WtvGvcKEbZlEi8GI65nBa8S1Yf31r
	 8r+CrZVutQKXaSqSxmn/AuuJINyDCYBU53xkSPHiahwNu+lvV2d36i2d4+zijn10p///g
	 z20ztWlneVSXTuk7gTKKN6du2rKMewVDTND9wNM8Bp0uxobzLm2Cfo7qgatin9xU7vTkB
	 MwmiMpYUwCw4ad8ufZzc4ke7eOvbiKgSc1es8un5mFo6UhY8QtOxbdQee337QxKV/sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=izAWa80e;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B40606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B40606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=izAWa80e
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53fdd2fb171so36637791cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794701797; x=1795306597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VEBzE1knwqMxBYVeqkNmuJaFWfXuXmCAgemIUauhHa0=;
        b=izAWa80emUNgO47E34Ip0dphvGCCx6mqhJZZLPZQrzTx1vrjgkrya+suDkNBT+2MP/
         JhDUKGVelW+Dsz3PWo61oqpgNO2TgdCdAesi+hFSYJUOJEzAjVbwkykQAuf3hryFwFGc
         SrfKLupg4gbamE6TbtnPdLfNp7T/p4IIyKSgCGFNosdb4dpQ/0PG3ahElS6rO8fk909a
         DnjZBRoMyDUxyZ7bOtzFTS3Ku2NxklCvwvy246oLeoiRuQwti2g32uBa7nSZMoXOQ65Y
         9PvBWt9wTF/DEaF6JReif4w8yfR65PI56WiJXVxJIZ1FRPAbHNzG8RydAJzz+EBISp7I
         HYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794701797; x=1795306597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEBzE1knwqMxBYVeqkNmuJaFWfXuXmCAgemIUauhHa0=;
        b=l/QDHnEpkaHeZ3aUR24s4POxI1j/MDmCHfuMSrTku0HH6zViI7YtFl3+QfMaBpnODB
         81snhms6LY6SMRjxmdabwyn2Xa4sN3e7kAV9wM040kzR+4LuBomlOC2LMesKGD3EY9JL
         2BSKJjF4/VaojJFzSyqETQ3tQ5WJV9RT7iiIrrWGdNqNHYdLCvM0Mg78BiNnE3tUyAHZ
         Atb1P+/PK7VRJXkwIaJgdjZFXf3X0Vu93qJHmr21xvjSMU178Sp3ueRHprCnFH9KYQ44
         PEJJf2QDHLDlrioFanJYEXYgru88xi7VYivr9zpbkFvXX+rUDo2U/BRrLVoO6dyI/6Fy
         HOYw==
X-Forwarded-Encrypted: i=1; AL+hErG17Q4ciDnt4GLaKVqHGIOLqB8pIc6xmYXFVqPWxHkIMHMKW5KCqO9W8JEG4g4S+0TG7n1NJ6PWCH/gf2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KO6V12HLoLH4/YzoTjappg1BVqqFtLSd0fYtmxJ86CDsS8U/G
	JqvSy7w3st8PzhnGp4wrHCX3mNZSm8oKue/l/PfDqj1Qct1+sVAfVND/CBoWSix+8zzJVXSWSCe
	72eya
X-Gm-Gg: AYBFou0LbNkdfMVtKt/rH72BfcIRDUIlE8fNKxU6t9lpwLnRIcLmfsGd0bwP6IptjvS
	zicRLHTWGdVAentXtBgy+FkYyZpPkEOW+hMebgmPQ6kmxuraY4Ajse86YA1hCQvWexGpJ9Yini7
	svVSSIeb4qt03/yrLJc+OeLaeIhCREx3OF2U86WAupBt49MhOJOUQ4pCtT+sliMroLmwO3aok4k
	DxjL5yN9Vnns5Xs1T8ryxb+d2nCdUyTP70rc2Z7sz/4OvIJ8c/ombmeoARFSf/n+uSEiwLybypD
	sK1A3WkZrdUrlTNFx6hCoyzRIbuSmIIrBgFf9EinGbnX/l0DkKWg2NZiemZ8HDBNqXEQcdgF56t
	3hv4KsPnc8nW9iEzzwudY5VXIu4tfO/kJUALlvjuLzlunXWn7lzYH9cuKLt0k1pekYhnQmPs1aa
	U0fJAonnpzpc1kotpibx1QvSPN5BF2VrhzEtcCx4JLa86dyqU9aORxUuwE+/TL8ppuO3Iff20OS
	KwXPyAMWmG/CZvE/cvLCkZ1yMbD6SRvYNTioI+0Qr8pHCBtM21gLIEkg59a/67mPvpnvxjL4yW0
	pcsueg==
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr103255151cf.68.1794701797437;
        Sat, 14 Nov 2026 16:16:37 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b11d9csm50567131cf.28.2026.11.14.16.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:16:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSNv7-00000005EDn-1Vc8;
	Sat, 14 Nov 2026 20:16:33 -0400
Date: Sat, 14 Nov 2026 20:16:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
Cc: linux-rdma@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 rdma-rc] RDMA/ucma: free a queued CONNECT_REQUEST with
 its new context
Message-ID: <20261115001633.GG2532299@ziepe.ca>
References: <20261112-ucma-conn-req-ctx-v2-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-ucma-conn-req-ctx-v2-1-yuehongwu@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 09:42:00AM +0800, Yuehong Wu wrote:
> --- a/drivers/infiniband/core/ucma.c
> +++ b/drivers/infiniband/core/ucma.c
> @@ -534,8 +534,25 @@ static int ucma_cleanup_ctx_events(struct ucma_context *ctx)
>  	/* Cleanup events not yet reported to the user.*/
>  	mutex_lock(&ctx->file->mut);
>  	list_for_each_entry_safe(uevent, tmp, &ctx->file->event_list, list) {
> -		if (uevent->ctx != ctx)
> +		/*
> +		 * A CONNECT_REQUEST that has not been delivered to user
> +		 * space is queued on the listening context but stores a
> +		 * pointer to the new connection context.  The new context is
> +		 * live in ctx_table before the event is queued, so it can be
> +		 * destroyed before the event is fetched; the event can then
> +		 * no longer be acted upon.  Drop it instead of leaving a
> +		 * dangling conn_req_ctx in the event list.
> +		 */
> +		if (uevent->ctx != ctx) {
> +			if (uevent->resp.event == RDMA_CM_EVENT_CONNECT_REQUEST &&
> +			    uevent->conn_req_ctx == ctx) {
> +				list_del(&uevent->list);
> +				/* Return the slot taken for this request. */
> +				atomic_inc(&uevent->ctx->backlog);
> +				kfree(uevent);
> +			}

The seems like it defeats the cleanup process, or moves the race
around.

I would expect the solution to this problem to hold some kind of
reference while the uevent is alive.

Or perhaps blocking ucma_destory_id while the event still exists.

Jason

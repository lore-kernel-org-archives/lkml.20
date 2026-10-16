Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838B37A485
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792119062; cv=none; b=jpPnWR6jjTTTYe1FeQWrfnAPJQfo5Uxd5wSZAtb7Rck99Y+7qVs3QIdrX4fP2ptrP4wWobLsj26GQIOJNCxNeYB94LAEOtR+2dBJTwgycETckIsC2OmqQIrLyZYMrDXzgcmPIbcitH3ZcXd4mlDFhqvhUm67Z8Mm+N1sF2Q4ymQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792119062; c=relaxed/simple;
	bh=OzhKQ0zjdHqPgB7S+Ikgz64g07wCTq53XVCI+H2FpN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHzKMxQO5Z/ExYjf/Wsby0BtvdbdlX/oGQAZwfsbxGktf7UiOKxlWQS+Rw6X3tTV5H6I03AOUIf1D8Lp6UVxE3B6z4+0uLCOUG0nxjIcoBB1GptxnwIr8Pz+Pc208kNJKB2CDCEj+4jErvF8qsImx8idoiGOt60Bct4Y2/Mpcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqT2McTD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqT2McTD"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-884062f3296so3590397b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792119061; x=1792723861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=te0aRe2cAvi4B71/ALfBS1DPp0JoXviSgYqxKkN67ro=;
        b=kqT2McTDjVGEe4vsEDUEnE21LbEsyHigEO2pK0ihU47yud3o+uv3WmqK1khacT1qRi
         IGtpASV6dK+Y/XCDSB3btoOVWuxsBfRIGp77SwOuM/pF18VcZl6QKzcR7NcxeQXTM5MC
         8W51peLLI96FI3Yqueo4zZopnkg21/FonIihI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792119061; x=1792723861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=te0aRe2cAvi4B71/ALfBS1DPp0JoXviSgYqxKkN67ro=;
        b=z4ljrX4p66H5fKzYMPNC/gwJUEmdDdS9RhzpXzS6e+XzUMN+mWjovEsK5YqKF1TmqT
         S+ifFAqubnkiWTmeeiDRk1jBcmF2zWwIXMG3BJFUQqZPoaFzcadIRemLN9OfhT5IVqbN
         skeW356cFOloVrIGBJm+JPgyz8DcZ96h1h/x5Tz99591F6IuhdE0PRNeGWBTNOTQu/Nm
         7ckWExNGVdnKNWlGF1R6f3OSKkoIGioIbl3esJKidzpr3kQryWnB+/ONlh7xonMlZNxR
         29b934z4TItEOPNbID4dIQkO0umhWpaCJ5z3vzanuwurx9qsksxbRo6GUbCdTuBP1C9w
         OMlA==
X-Forwarded-Encrypted: i=1; AKwUvBxj4OgdixqA0Flm/2bxHimnFnANP+2OS7B7XyzW5jjCvK+xZutODWw/EcqDZFHzY4LsyysM7NADfuOOBZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUUaTDKXpj8wR+dHawf99eCYkpL17Nmcv6O0ldt1EdwgVzOJDH
	R51PcW+xZzI5TnYTQjaxhOckYAdDxgsGtKK/aYIGtosl+bUWf3fHtNue2rXbgWb8WQ==
X-Gm-Gg: AYBFou0W9PVg0+etsoCfRqwnYOA7HvRSWk9A/7Pq8TPA/zwecQIOQaQAfySWdR38LWI
	KsV5tND2dndiOcZB5iB2WZ3W32CpxtgDlQ357UCK+yWx9x1aUa581BmnPuws3GBtLkBhMGB8hEM
	5YlyhYtU4VBQxQQUmF98ftaN/WynhNvcwN5ZndFkp+/+WHmjJ+isGu102aeDSE3yMXmODZrzb2p
	566uDlwRWqHQuoYX+F3cdSW+J4ure1rkIV5fobbmV/0LLlso83T4nNc/RnH2V0ShrTy3m4HBWTF
	O7R6wnPaWSyQzc1eChUvVleaeYr/b+8sz7Bk8RAKfTia4qwtif8XhU6Es8ZVbWDcaFi949H6dV3
	tlqpxsf0583KuNHZUaqFMbjx4STTN8g7t2ALPfV1FPtdcy2U1Lq+zTWPD0cN8KyqVyiptYBC/XV
	ZwQaDGzvnLe57WINromgRiYq/SZ8NH5hNWjtojeBqZ2PHNu6kgoi04eYqhESN/aS1zS1+jPjJY+
	lc7wNUTLzFenw+vq3KLqV8Zw/vNW+uyzkXojgxgfici0mzpSiR4q+h8Gk0c0/Zo/AIEW7A2ERfd
	++vnX1S4JAdibRSrsiq2
X-Received: by 2002:a05:6a00:189b:b0:88b:7278:ebf4 with SMTP id d2e1a72fcca58-897c70104e6mr21100989b3a.18.1792119060609;
        Thu, 15 Oct 2026 19:51:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c87e66sm390668b3a.13.2026.10.15.19.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 19:50:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:50:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: senozhatsky@chromium.org, akpm@linux-foundation.org, baohua@kernel.org, 
	bgeffon@google.com, minchan@kernel.org, richardycc@google.com, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Message-ID: <atGPwJL6XzlRaMva@google.com>
References: <atBh9xfpOji_A7A_@google.com>
 <20261015112440.1491168-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015112440.1491168-1-zhangbo56@xiaomi.com>

On (26/10/15 19:24), Bo Zhang wrote:
> On Thu, 15 Oct 2026 12:19:49 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> > Or perhaps we can avoid vm_map/unmap.  A slightly different approach.
> > kmalloc on fast path + memcpy (zsmalloc objects are strictly less than
> > PAGE_SIZE bytes)
> 
> I applied the kmalloc+memcpy variant on-device and re-ran the same
> Android A/B. It removes the exclusive path entirely in our workload.
> 
>                       9+10       9+10 + kmalloc fastpath
>   read contended      ~1,959     0
>   read wait_ns total  ~12 s      0
>   read wait_ns max    72-96 ms   0
>   shared              76.7%      100%
>   exclusive           23.3%      0%
>   dpin_contended      0          0
> 
> Every decompression now takes the shared (down_read) path, including the
> cross-page objects that previously had to go exclusive. The ~1,959
> residual contentions on the exclusive path are gone, and pin contention
> stays at zero, so the full read side runs concurrently with no stream
> contention.
> 
> Read-side contention end to end:
> 
>                  baseline   9+10      9+10 + kmalloc
>   read contended 24,749     ~1,959    0
>   shared         0%         76.7%     100%

Thank you.  I'll include kmalloc patch to v4 of the series.

> This is a stateless-backend result (lzo-rle). zstd/deflate have
> create_dctx and stay exclusive, so they don't benefit from shared reads
> at all - which, as you noted, is the sad part about zstd on that list.
> 
> For those backends the serialization is unavoidable, but the actual
> root cause of the long waits is still the holder being preempted or
> migrated while holding the stream. So on top of 9+10+kmalloc I tried
> a quick-and-dirty preempt-disable for synchronous backends. Allocation
> can no longer sleep under the stream, so a two-stage zram_zs_malloc()
> does a non-sleeping attempt first and, on failure, bounces into a kmalloc()
> buffer, drops the stream and retries with a sleeping GFP_NOIO.
> 
> zstd backend, same A/B workload, on top of 9+10+kmalloc:
> 
>                        9+10+kmalloc   + preempt-disable
>   cwrite_contended     14,880         48          (-99.7%)
>   cwrite_wait_ns_total 137 s          0.32 s      (-99.8%)
>   cwrite_wait_ns_max   243 ms         43 ms       (-82%)
>   dexcl_contended      15,919         54          (-99.7%)
>   dexcl_wait_ns_total  109.6 s        0.68 s      (-99.4%)
>   dexcl_wait_ns_max    145 ms         34.6 ms     (-76%)
> 
> zstd stays 100% exclusive either way; the win comes purely from the
> holder no longer being preempted/migrated, so the hold time stays short.
> It's the same mechanism that took lzo-rle read contention from 24,749 to
> 406 earlier. So the two are complementary: shared reads remove
> reader-vs-reader queuing for stateless backends, and preempt-disable
> covers the exclusive/write serialization that stateful backends can't
> avoid.
> 
> Quick and dirty, for discussion only - Patch below.

Yeah... I need to think about it, before I can join discussions
in a meaningful way.

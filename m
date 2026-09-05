Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F5352030
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613490; cv=none; b=pS049CtDfk1oV/Tp0TVuuncepCgxUbTvMSjruvK6iI3A8kCLopSwaUEZGPsbaPCiA9+DXgx+zU3gVFvy8dhB7Ye+PPzNjx5G6ZTY/mX4SyRAZvD8dbxaR0TKxzI9vCi0YadGDHYJ3wx/gcAqkCyeeh3GjIiV7hS8gZDmr5zj6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613490; c=relaxed/simple;
	bh=J+rRKtgAlEjfqxSZXZsYqEuQQycmsbgN57qptwdUxp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9j4ggHBjr4yCUc4rAcjtCWbHhTTw+DaeHz8YQrlXuEQEFBgmo1wS5KpoNzodvatrxTAvGK1CZqZQ/qkTZuIKE77d5YfOM3BPfJo0fpnqOGlO7zl/Vijja6GbMZcSM7VGK/6QeNM//h7OCUQFETetN86kg+QLuBddKIO/NChkyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivtYRXoi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivtYRXoi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2401215f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788613487; x=1789218287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKCYHYnz4LwrqJmGzipTMr7mOO6sdij85Eh/KU1PCWk=;
        b=ivtYRXoiaYM7B9UTPrd+eVTrrCDQnDSLfmsSy+C3419e5vcI6OhLDd+syjsZ+oPqMZ
         EUAyOcycB9SrD5B0Jzn1pfB0g4f/5JPp7SXFIeZT9pJkmZEWy2i81I//bPxlbdRFikyc
         lpB9vjJLR0jexhk39dffFSC5g3ogpu4p8Spw58Uajnhu10ZOf0+T9BbIbcW2+XP7fMx6
         0uvYqTgBnTMhfAXAWisIVox2lqcJ+NZW/4lNma9vAq7PT6nx9hqEbVoY+v1IiNlkQ4Xn
         omKhZwQn0+1szquHSFwKlIGEuq3wACM7SjoBPSv6uGXRRDmG23UcRwc3bJ7nDUBBZ7eT
         jbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613487; x=1789218287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKCYHYnz4LwrqJmGzipTMr7mOO6sdij85Eh/KU1PCWk=;
        b=mWM8CaKJ3Atsze8IXV+9RkO8yo9yZsk1sfuJkBmXJb7wTFfWPmRMMfiWw01Sj3/gNx
         tXVwoWSvRYgM0LPliimHZ4w3nXKUk6CsSf2Hvz+dudp1Zz+vaDGJVD0UUyKRgVM/Rp/s
         zdGgxAPp3d7edaL2vHpJ970WkU9UU5GH2UVpBW8FosnoqTVZQZX9AjlPrU9TuIs/W8l6
         esILbscOaGA9DplAjO+T3H8/dcnoGre/1qmMkpNASOjMN2XQ+dEXOW6Zq3ND4DAVqDzM
         A91Ih7FEOilR4vVzo4vDJfHOWSToUuL+rcAwx97MVU+6BvdxDZXMe83NGzjNKRF44kZE
         eBDA==
X-Gm-Message-State: AFuF++maQDaRPf6hmDCMr4Qan4wta8n1naz5HIMwg5cWVUFH00cchXOR
	YPZZiai+n8r1ZjyxNn2DtatsFQtXpdTI4BkbpYXPNlbSgos9MELpGr4pT3AP9dsEYQ==
X-Gm-Gg: AYBFou1RcW1DqH8sp91V5E/cZarIMA1QSpj+pveHlszba4qSQh5AFTjhWD5ZxxCYkiD
	AK1jZmgKuhUnBJshHaynO/y+k8Tu/Tb2dWiDXPELOgBmARQ9ktD4raUIqETvXRqHsoBgG1ALFyB
	CvW6YeunI2mJoWo38e0+MnhMkugrYOU/qKS9gYfloLh5Gv/t+ep6dQtl/aZ1mGLMbPKxLv6rdpl
	UoAdyWb8yef+nviUHeFz/wSRm2qANFMSxGLeqKtausDgkzurzfBjl/GMJF3UQ3AFEbY2X7f91ar
	RQ0hWKyW/K1j7qA/iLOHhxTiyk6cQuIUcwWwWhWvm3mn/XUwwGMRhCbk8WDYH2e5mzbsDze1YW9
	JpguWeEj+aZ+UV2XgZB1uh9C1btSDMur3IwE7RhQRdalN3NYJkc/GCdaurOvM05kpEijuyA6f/g
	Ww7zUWXFDBVDefcSYW5Y4q2yo9UNYMX7XGRqC/MjfHgC9OJ/8qBlWfSvYqpoBaAhURUeiqNA4sZ
	kMPXMqbl9hLwl4kFoapfAzc3a+RfVVo
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id ffacd0b85a97d-485870902eamr22317816f8f.21.1788613486296;
        Sat, 05 Sep 2026 06:04:46 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm10315802f8f.11.2026.09.05.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:04:45 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:04:42 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] tracing: Fix comment in tracing_buffers_splice_read()
Message-ID: <apwTapbe4CHPA1h3@google.com>
References: <20260904144902.506862a1@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904144902.506862a1@gandalf.local.home>

On Fri, Sep 04, 2026 at 02:49:02PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The comment about returning an error if the read fails on the first
> iteration is slightly incorrect. It makes it sound like the only reason it
> could fail on a later iteration is if the subbuf order changed. That is
> incorrect, it could also fail if the length passed in was not a multiple
> of the subbuf size. Fix the comment.
> 
> Link: https://lore.kernel.org/all/20260904143527.40e73d36@gandalf.local.home/
> Fixes: TBD
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  kernel/trace/trace.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index b26c4c277ce5..8658cad53cb5 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -7296,11 +7296,13 @@ ssize_t tracing_buffers_splice_read(struct file *file, loff_t *ppos,
>  			r = ring_buffer_read_page(ref->buffer, ref->rpage, len, iter->cpu_file, 1);
>  		} else if (!i) {
>  			/*
> -			 * We failed to read because the length is too small
> -			 * or unaligned. If this is the first iteration, it's
> -			 * an invalid userspace input. Otherwise, this is due
> -			 * to a subbuf order change. Do not report an error
> -			 * and just finish the read.
> +			 * If this fails to read on the first iteration, it
> +			 * means the length was too small and an error should
> +			 * be returned to user space. Otherwise, at least
> +			 * one sub-buffer was successfully read but this failed
> +			 * due to either the length was unaligned or the
> +			 * subbuf order changed. Either case, do not report
> +			 * an error.
>  			 */
>  			ret = -EINVAL;
>  		}
> -- 
> 2.53.0
> 

Ha yes, I see the missing case you were refering to now.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

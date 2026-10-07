Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C0331EDF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352579; cv=none; b=iITIAho5904gj+g9pY3Sp7ThS8ys1A+frc6rcG9Li7/TaUabpd7yrdsSVMNi+g4uKuVsgasrkrf/ld/F41kEUWw+9BJk930MJ91Qm3OrFd/jOgsPaDPjFasgBAq3vArBsHBobPBPW5bdLQJp+4hKPUnGhVuJ60Wm3ygj3S3uUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352579; c=relaxed/simple;
	bh=tN36ci4IovZxa177e6ZIcYcj/xxHlJyHAOWZAih5w4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb6Vjm69Ew+Sy1AOfJB1glvxk6tTDs+jXFawPJDCRWt4AL2qq1WP9i8eRPC9N4yQ4YHc7L3CkQDBQptqtijQMGRi1UaPmC7Z680SR1KOSQkP7rNwnccKsRT8n1bmWE/oBpO6Nd/mpn/IU5zIjZ5EqgZ0Pd80TWNubIeNP8PXxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=G8aed7PZ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="G8aed7PZ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49e1d10ccbdso407525fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791352576; x=1791957376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXBQtCNU8FUq8Qg2PYU28JD3k9JJVaiWZX17kjJP17A=;
        b=G8aed7PZMlLTTD0ALVIFpoG5Hu8TLlFiy/czIU7jxg33jGDICKywZy5FVmAt5ON1hc
         TUC2cp+XnlRLR5WKuOkfjVQzscMLdGf5k3lvtYpT/Oedj3DbcWEg1T5vxcgeJvlNJS6B
         EgFoJBKeFOjETA4s//E2t/rqsOV+mdOn0b/7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352576; x=1791957376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXBQtCNU8FUq8Qg2PYU28JD3k9JJVaiWZX17kjJP17A=;
        b=zeMhqQ9xl2b1bZVjQ+1kTwONPd2sAWef+c+fqG+TScAGnyLMpKsFNO8QED/7hKwB0B
         cQbYkJAdVGhGkxi3TBMZEic8z9Sfqra9QeTB5Q1ejAvhtX8Z6uNHlZsPwSVzd35P1CDY
         5DkaSW1iEw+SlT/HFYArME8DEHQ8li2nE6iTIZHhH2fLO78XiM9NJw3YXz+nSirdY825
         QIwhtqNoAN3TXuyYXBk6l2vMXKQfxznIsWo05ZmealN8LPOALTVBres+e96tsTAdp3lg
         KhIbLMeJ5P5EnxPT3ahpY2wMvfEO6NEcVPTq2zezcSdrWxfV7WwGieEqAsONiyb01PSF
         0G5A==
X-Forwarded-Encrypted: i=1; AKwUvBz9/7LXV9WESqvsKbal8ROxmvG8cjCpmijoArCTTewXDHmjttRW/EHBqozlTsaRIrFoF8UiTSBO38xXlSE=@vger.kernel.org
X-Gm-Message-State: AFuF++lwq6HqoxIQQqRouSsXWVXoxp1INoyLigw1b8hYKUeKSnZLS38R
	Mjz2BQ6PTjOuayCPk9gAdtU6cGg7afX8ZhWzHM/M5vGos51kP0noxDVCn/w3ikgjp/0=
X-Gm-Gg: AYBFou3NVz/Z2YbDp/azjAJNKsVULhbYgSmQ0nnfaJmr6meiMHm6rXDQ+jbzjprwARR
	khwBaH4g4zyvQBmJmiKy76gRkTOMGM6ust+DSGoqySKX+N2DpxYI5yJJiPRyDjbkWuli+5mVnVh
	yMMqTAbO3mims37e7DAErmLfpktMmmd6grHGQTeV/FWu0EMeKGMYOR7U8fEjH3hbpIeaWawanbA
	vUxtSGP+I6JTZP0kmaqdgxnxnHWqmTrDaV03NYRletP5n4eoirZnH+oySs1P/gaKqnRJaHXT2oy
	2iyV5dYcuobMEAPEiOv6LHICaJ3Aa6e/PyqCBKXRaFF/5jwnIt1bFRGqvMX0sZgaPef3jwFTvv7
	01+mokR2qg1Qtz53uk2ktoo9YWt08awPDjCTM/EqXO8zSorOaJRnk+8Jpm429fEXn721PqxiPP1
	aHrRqy9reKP+Sa1XL0J+CZtAi8Lrb1/RAi3xxhYmUc9Es8HjnMoiUhK1/IOGdUAg96VA5DLj/9l
	2rR7X0O3b4LNyqyZf8MZPqAUkXy0P1BGchKHkr0le81a+yTv5WND1q4U4A0vQ47
X-Received: by 2002:a05:6871:2b16:b0:49e:3edb:987f with SMTP id 586e51a60fabf-4a2594c418dmr1203497fac.11.1791352575733;
        Tue, 06 Oct 2026 22:56:15 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2571cab91sm1335158fac.11.2026.10.06.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 22:56:15 -0700 (PDT)
Date: Tue, 6 Oct 2026 22:56:12 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org, outbounddisclosures@openai.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] tracing/filters: Check perf permissions before resolving
 .function
Message-ID: <asXe_NWiBtGDXZVN@com-75606>
References: <asXAxf0edslJI-Ge@com-75606>
 <20261007055225.32DDA1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007055225.32DDA1F0089B@smtp.kernel.org>

On Wed, Oct 07, 2026 at 05:52:22AM +0000, Masami Hiramatsu wrote:
> On Tue, 06 Oct 2026 20:47:17 -0700, Kyle Zeng <kylebot@openai.com> wrote:
> > On Wed, Oct 07, 2026 at 03:44:20AM +0000, Masami Hiramatsu wrote:
> > > On Tue, 06 Oct 2026 15:51:12 -0700, Kyle Zeng <kylebot@openai.com> wrote:
> > > > perf_trace_event_perm() allows tracepoint counters that do not request
> > > > PERF_SAMPLE_RAW without raw tracepoint permissions. A self-targeted,
> > > > disabled event with exclude_kernel=1 can therefore reach the filter
> > > > compiler even at perf_event_paranoid=2.
> > > >
> > > > The .function suffix accepts any field of sizeof(long) and resolves its
> > > > operand through kallsyms_lookup_name() and kallsyms_lookup_size_offset().
> > > > The success or failure of a numeric filter discloses whether an address
> > > > belongs to a known kernel symbol range. On x86-64 this can be used to
> > > > recover the randomized kernel image base. A named filter also exposes
> > > > the resolved symbol range through the counter when the tracepoint field
> > > > is controlled by the caller, as with a syscall argument.
> > > >
> > > > Pass the filter's perf origin to the predicate parser and require
> > > > perf_allow_tracepoint() before resolving a .function operand. This uses
> > > > the same sysctl, initial-namespace capability and LSM policy as raw
> > > > tracepoint access, and closes both the numeric and named-symbol oracles.
> > > > Do not change ordinary perf counting filters or filters created through
> > > > the separately controlled tracefs interfaces.
> > > 
> > > Good catch!
> > > 
> > > >
> > > > Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: Codex:gpt-6-astra
> > > 
> > > nit: This should be 
> > > 
> > > Assisted-by: LLM
> >
> > Didn't know there was a change of convention. Should I send in a v2 or
> > it will be picked up automatically?
> 
> We can change the tag when picking up, so you don't need to resend it only
> for tag update. But for this patch, please update according to Sashiko's
> comment.

Thanks for the explanation.
I just sent a v2: https://sashiko.dev/#/message/20261007050315.65139-1-kylebot%40openai.com

Best,
Kyle

> 
>  https://lore.kernel.org/all/sashiko-outbox-162502@kernel.org/
> 
> Thanks,
> 
> >
> > Thanks,
> > Kyle
> >
> > > 
> > > > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> > > 
> > > Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > > 
> > > Thanks!
> > > 
> > > 
> > > -- 
> > > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

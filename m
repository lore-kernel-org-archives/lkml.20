Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793304199;
	b=SSD4F89fMm4akFgtEOH4Tp0O+VueF9j/jfjydFdsez8uwDq8kVz/hgqUB7+LZRDOb41I
	 G6jcnEkdzD0mm2Rg3mx0WWS76Mujr5bthWrj/budWpa0MZwVqKwAUo7NXb/bOmXyWMonh
	 d7up/pEbMZ/C5dkQvK7ooba2hYD2iz5JOiRIhHfTcbWIJiTAlVZ4DWYMaj+24Qp71zLaW
	 iquZVoPVOTLVxdaMxLulypXaUJldfUJjaxDNdz8tIMf8//rS4ZgYfdpsGnTLJrbsGBFYP
	 gyEy4Mf4AO7bKpN078xSpeUrazf5He3TR2lM3oPvLcLvLM4NtW03mWFoyogdsprZRgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ftnielukM6uo0o23y4MkFIiqFTBwHPktb7DlZc4YxrY=;
	b=vQA0dX4T4i+MQqlqwfYQOfhTY5FoAwSNjJPizL7gFJt8CEh4DgbI5+dWtee1505CFT0B
	 XfHHzq+7zFhLqCvotL37MHAG90IriPmKALEXbBbxHhaS1Z60tOSgCka+Ht5TpehH+Be2+
	 IOCvGVKkc1HXi4/PUFA8NV7CpdlzUR9MNbS0R5gnwLexDBHvpM72zecInrZwfQkaBYTGk
	 aQwCu38K9iFdUJrADicpP1xOS8ME49+89Yk6rYA6bmDxElAnpGM39KeXPbxgNXB0DXCp6
	 D1Nz2QnW0HbQ41nskn/e2vB4KkscOGqn6T0Q0i/ZFHuz0cRhLD7FQnZnsR9TQ9A+HoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIqrAftd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D298606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D298606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fIqrAftd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22845705e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793304197; x=1793908997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftnielukM6uo0o23y4MkFIiqFTBwHPktb7DlZc4YxrY=;
        b=fIqrAftdm3ad0YHNmcL5gVwcLyhXX3sjl4LR74o2xqWv5EQsN7wWyhN+4/9Ex1pfVH
         EaegO8LUvc715F2kRy1eZD2czFIrLY7Fg0dmBitSB7j2N8ibX/Km53YC5+wudsFV1o0j
         fO+xOlZI/Y7MmZYCfRpa+bb8SubeFo/i2bHxCBABMmQuN1F4SF8asYa5Iq+Db0yHhYfC
         qxUUHGYDY1ne0WvtYCAWSJZE+gSZxoMD4xlDAYlTwxySYAlgQbV7uRyX+/2p5TPMtUR9
         4iGYCHP/xZuJoqpe5zguqoiygdxi8BdEJwhP/ZEuGb1E8kOd4jP4SWJQqDL3j0bFugKj
         BEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304197; x=1793908997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftnielukM6uo0o23y4MkFIiqFTBwHPktb7DlZc4YxrY=;
        b=edp8HxVGDsLeYt5Lt7UWKVkTuqAQh1fne6mPNPTOJO3p5boIPEd7lDAt1kGVxbj4Sm
         cgBPpjT1QJ5CUYxwX66qjVz8xCJYyp3o6ZH7AAUfxFq0Od4N1T9J/eXVq8ErV8CyQUzD
         ++Oy2v/Q8wuFhR2Sa7JWrVo9s2lf6U5N8rGz/nzRmXy/CyKqNTPQ3ZV4gK/LcFmbnhdS
         Zi+hcy8d0AQrbO+3X8gbfG0+vGoZKM2SzndOqv1yEKHuYejaA6nBoT83aH7+i7QawNEI
         JsqwACEqisdVgwHgj4xrS5inlG2sB/V+1qvH/AdO7cx4AZ5s8uHyriXJ7pWxCvFUEbfB
         UClA==
X-Forwarded-Encrypted: i=1; AKwUvBzPgsh4/k7zmP+jrlGYLysLH+fZT846h10kq/kjTbF7otX8DRwHTnTOGBPFMlu64AfOtGfVhtbosFDn5iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDEeV0BE+MUimL4jpeAasreKtxdmUJqk8L4kgaBD3uDJ9L2dYp
	7fXl3lbwSnQcNiNAtpqxKDQ2I8iG1VoDmvvOdjxpVC+v0X5MU4jKhgqB
X-Gm-Gg: AYBFou1o/Nbu2ZXlOxdJqeqHN1HpYshL4NuCR917LqGKl6cN8Cq6SvHrqXd20c/Qf6w
	XRjeufj6/88nN8mJAymvyqQNOwxxxVupS3dAu9nP6X1Z7Ntj7JJCOb4dgcmLbJtBvYpbtmen08B
	Cph8qx0rtj9+UjkhyZ+Cj/FY/wcpl9Cg2VlL1HeQ4FzAS3mwDpZ3D2YMKOjoUTttebUHyNXnNQd
	6sQex992sV0UOKDKlTbjqflqxIUekXI2OZzELdvVqsKHJjoKAmjrQKDZq/w9l9KUfPwreapLRGQ
	NSd+QohpOI0fxZEKmF/PaUg6nfEsM18sxTGi/bpGcp5+HLZFPJsOwuYFjbWM7lPrZA+WDFDk6ox
	xkJMqzfvf5c713jYnzWk+OXO0pFDzwtC2Tyw2d/GlnqJwu/R9HmM68V1nGsJJ4H3zWZTtYzCihk
	y7Ay5E/CupPd46ks6pr0a3C+Y1TS6e3V4hjmicC60dic+/Ac6gwpRFDzyQZsnmpSAVSzigj8rIg
	aA72jGQ+7REGNWU3iGmhjigfg0l0QsEedPSNlolniMOvNKkvo2o/QRQ8BVWU2sTyPfZMeDupP5p
	97F6L/Qr4sqo+tMixm0uXS5wycPPqPhl9EjflwDucTE3PVzEEQ+NybkGQnAX953e/2s=
X-Received: by 2002:a05:600c:4f82:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4ac1889d525mr637875e9.21.1793304197263;
        Thu, 29 Oct 2026 13:03:17 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf723b5dcsm7913645e9.14.2026.10.29.13.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:03:16 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:03:14 +0100
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-kernel@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>
Subject: Re: [PATCH bpf] libbpf: Reject excessive program counts in generated
 loaders
Message-ID: <auOmggldtZA9AlDV@gmail.com>
References: <20261028183947.9606-1-mahe.tardy@gmail.com>
 <DMHGTWQSAWG9.NUHU0WK9KRK8@gmail.com>
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
In-Reply-To: <DMHGTWQSAWG9.NUHU0WK9KRK8@gmail.com>

On Thu, Oct 29, 2026 at 04:33:56PM +0000, Alexei Starovoitov wrote:
> On Wed, Oct 28, 2026 at 11:39 AM Mahe Tardy <mahe.tardy@gmail.com> wrote:
> > @@ -122,6 +122,11 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
> > +	if (nr_progs > MAX_USED_PROGS) {
> > +		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
> > +		gen->error = -E2BIG;
> > +		return;
> > +	}
> 
> nr_progs is obj->nr_programs. It counts subprogs and progs with
> autoload == false too. See commit 259172bb6514
> ("libbpf: Fix gen_loader assumption on number of programs.").
> Only a prog that reaches bpf_gen__prog_load() takes a slot in prog_fd[].
> 
> Two objects with obj->nr_programs == 33:
> 
>   object               today            this patch     should be
>   -------------------  ---------------  -------------  -------------
>   33 progs             -EACCES at load  -E2BIG at gen  -E2BIG at gen
>   1 prog, 32 subprogs  -EACCES at load  -E2BIG at gen  loads
> 
> The second object fails today because of the cleanup loop in
> bpf_gen__init(). It closes nr_progs slots of prog_fd[], and
> prog_fd[32] is at r10 + 0:
> 
>   r1 = *(u32 *)(r10 +0)
>   invalid read from stack R10 off=0 size=4
> 
> Lets fix both: clamp the loop and check the limit where a prog takes
> the slot, like add_map_fd() does.
> Something like this (not even compile tested):
> 
> diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
> --- a/tools/lib/bpf/gen_loader.c
> +++ b/tools/lib/bpf/gen_loader.c
> @@ -139,6 +139,8 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level, int nr_progs, int nr_maps
>  	emit(gen, BPF_MOV64_IMM(BPF_REG_3, 0));
>  	emit(gen, BPF_EMIT_CALL(BPF_FUNC_probe_read_kernel));
>  
> +	/* nr_progs includes subprogs and progs that are not loaded */
> +	nr_progs = min(nr_progs, MAX_USED_PROGS);
>  	/* amount of stack actually used, only used to calculate iterations, not stack offset */
>  	nr_progs_sz = offsetof(struct loader_stack, prog_fd[nr_progs]);
>  	/* jump over cleanup code */
> @@ -1134,6 +1136,11 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
>  		gen->attach_kind = 0;
>  	}
>  	emit_check_err(gen);
> +	if (gen->nr_progs == MAX_USED_PROGS) {
> +		pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
> +		gen->error = -E2BIG;
> +		return;
> +	}
>  	/* remember prog_fd in the stack, if successful */
>  	emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_7,
>  			      stack_off(prog_fd[gen->nr_progs])));
> 
> since it was already applied. pls send a follow up.

Ah yes this is correct, I bumped into this trying extend the lskel (but
mostly trying to understand their generation for now to be honest) to
allow them to call BPF_LINK_CREATE and somehow I adjusted the nr_progs
passed to bpf_gen__init() earlier to the actual number of progs so I was
not paying attention.

Your patch makes sense to me now and works locally (since
bpf_object__load_progs() is filtering the subprogs and autoload=false we
have at the stage of filling the prog_fd, of course, the correct number
of progs), I tested on an object with 1 prog and 32 subprogs and it's
good now.

I'll send this shortly! Thanks!

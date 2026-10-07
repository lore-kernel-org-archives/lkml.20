Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8143612F8
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791344843; cv=none; b=Ouk9++0Q4nJeg6lMVItXeLwPPKSA8UON4Vpfzax1/A6xE3HeKh5gNgUnux8n2HcXxvpN5kZd0RG197/CZt+8RF2fILOu3/zAQxpyGssLa/N9fc/mAgOkKBBjYaMJYRa8g1R79BypWkomovFh5+BfByhPqIq8uEDdgjRjxsCXOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791344843; c=relaxed/simple;
	bh=P7R8JZjiBrTHiAAONEx9yZI6Ih9pbShIqDH/cZv1PHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp2MnYhgUBzqcMjLo8nESPEAgeLqQAnwgQ4p9AUX412c83fWHehNcg19asbpJIUxLOxz+xmMN+yiRr8jB6zy5dEAxYfETJ0JeJjHKWCtRaxf/6JrpSCmtle3mmolXTze97pSTeTOHt6WK0ckSrldYOHA1qfuOitoEHI09+Dwu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=dSSXB0I/; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="dSSXB0I/"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d68de53053so547208eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791344841; x=1791949641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lt1iwnmKZ6euKsofomnQEm4d0oQu1LOx3t5oA2yJCYg=;
        b=dSSXB0I/kORu84IXeIDftaUPD1HSbMiBA4UnM9MSpFHJbxFBygr1DFXL3cDVmonAwo
         aKbLB3RwWhslvpbJf4SDZ4zDoQDPVdQ0CM4Z9zirL9yG+V+nPcj5GKS+WGUUCQA6Fp3Z
         m/tCNQJsEsGAA3syZ4w0RSS3V4sE2+5IZF0Y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791344841; x=1791949641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lt1iwnmKZ6euKsofomnQEm4d0oQu1LOx3t5oA2yJCYg=;
        b=fpguuaH+0SZBb0PEgyDay1qp9qGfT7/UtltPyI420s9S3ogH/cmHnf15eXRHKMAOiA
         LJrsrTry1k8c2JCyvcZbFphSmv3qXlo0CXjNrh2xDanc/dIqT8XwY9bDEUDgy7zRtfl1
         Qnf09PKb3sTxmerWFSVZUjIjX+YH4JQQiNx1tMiusQIyAnr1K6ejJhinpY4Ev4l0erX1
         /5SM22903YV9B+jBYFVZBZ5QK1bVzwxnNj8gt3X9aNVgYQiFFEd0AT/ddOsYDzTUX2H6
         va+UXPXf4iQK0UsP3Y2XqBte7C8EhV+pWJsM925C3Y/2tOzBs4ArvVJqIa8hl63h2vrC
         YzaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLOqUCM3C+/Vaa7jLxGMak840C3vsmTQFFJMM3yHaOFcZYO+hKvMdIeKiP1ikTAxEyc+2RhejrqzTJRx8=@vger.kernel.org
X-Gm-Message-State: AFuF++nGqGWJb5uwHs2kUiG+ApTuYDN28vzdF06XxpZCeoBjQ6+/CLD5
	soMqKEhR2CIPYFQJnDIJiMEZl0JNgXClQFsc+68atxqdiiVQGrwOK914AUjShAPhwDQ=
X-Gm-Gg: AYBFou2V7scPlC/o02VuwGNTwajYWM699T+At2j4LgLYIKIwstQ48n3XM9IkUiTVTJG
	D96ZwET5D+fKzkWPCBzWaDBQGc0mEshRoIUfn+ebImNkfnxelaQfiCHTSQpP5QmzO6KHaQsqg4o
	SL4B8SjpuVALGOlVTBb3K3Uax4Vdhrp3aYuAWZaoUa7jaanWZklI/dz8s3KM+HZuKrLSw/gkx54
	jQu0EYISGJ+MoCzzx8SlzvXGJtR2Uv0HPfckOnCRVIQtBtHdiAwds8eKmJtsKWGw1DBQ7fw2KKo
	1Nkbe3sYB4QmNALX0autYFWy8HcL2idaOZsNk8F4iQ6UGBDRvsduGitr6nagjH+98uRsEcDi/3Q
	F6X0mqRrtIvxuReaDUn3EKPadIf+TTNYfcsTe8FQBCrcFYOSn3ceu1WYOezLSCjOOQ+GFWCoscM
	fDw1m6rC//Uz68tUTJfBdPHl0ZZp+RN8ekbVrk1FhZQzbty6iCNSZ5RlsQbOhWJqqdzB7mXWaQy
	byeNz44sfel3pOnzA8yfV8lFOIr58CyM6KRdQGmM/FEy/cDxu416A==
X-Received: by 2002:a05:6820:80c5:b0:6d7:7979:bbb4 with SMTP id 006d021491bc7-6e7a58815abmr1344307eaf.7.1791344841160;
        Tue, 06 Oct 2026 20:47:21 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e79447d888sm1152148eaf.12.2026.10.06.20.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:47:20 -0700 (PDT)
Date: Tue, 6 Oct 2026 20:47:17 -0700
From: Kyle Zeng <kylebot@openai.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org, outbounddisclosures@openai.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] tracing/filters: Check perf permissions before resolving
 .function
Message-ID: <asXAxf0edslJI-Ge@com-75606>
References: <20261006225112.53503-1-kylebot@openai.com>
 <20261007034423.310311F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007034423.310311F0089B@smtp.kernel.org>

On Wed, Oct 07, 2026 at 03:44:20AM +0000, Masami Hiramatsu wrote:
> On Tue, 06 Oct 2026 15:51:12 -0700, Kyle Zeng <kylebot@openai.com> wrote:
> > perf_trace_event_perm() allows tracepoint counters that do not request
> > PERF_SAMPLE_RAW without raw tracepoint permissions. A self-targeted,
> > disabled event with exclude_kernel=1 can therefore reach the filter
> > compiler even at perf_event_paranoid=2.
> >
> > The .function suffix accepts any field of sizeof(long) and resolves its
> > operand through kallsyms_lookup_name() and kallsyms_lookup_size_offset().
> > The success or failure of a numeric filter discloses whether an address
> > belongs to a known kernel symbol range. On x86-64 this can be used to
> > recover the randomized kernel image base. A named filter also exposes
> > the resolved symbol range through the counter when the tracepoint field
> > is controlled by the caller, as with a syscall argument.
> >
> > Pass the filter's perf origin to the predicate parser and require
> > perf_allow_tracepoint() before resolving a .function operand. This uses
> > the same sysctl, initial-namespace capability and LSM policy as raw
> > tracepoint access, and closes both the numeric and named-symbol oracles.
> > Do not change ordinary perf counting filters or filters created through
> > the separately controlled tracefs interfaces.
> 
> Good catch!
> 
> >
> > Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-6-astra
> 
> nit: This should be 
> 
> Assisted-by: LLM

Didn't know there was a change of convention. Should I send in a v2 or
it will be picked up automatically?

Thanks,
Kyle

> 
> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> 
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Thanks!
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

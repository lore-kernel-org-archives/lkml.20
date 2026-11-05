Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870151;
	b=pUQXfnsmwHmRN/Kq/zEYYN2j4Fjk+Tz1lL3VND5qHQZJV/2wTKPdHduO35+DwzBPzARA
	 73JSwnwn94kwdtEfCi3FdkQBOVyYYgsbz1HAAr/bTQybbMFpPCIuXYBE9mp1omEtmfnvm
	 rft3ntQt7tLAf9hCGgl8VpWYe+/b2lZ5qzRuz6AWxXn9AAMFfeZcPSRxCDTPAFGK7+o4g
	 N4d0hSc2ElVav9fP9dG4NWJg2SjRKxL2L8RDmd1ns7ommFpsbfaWh6fNmTFCG1n/7YnGx
	 A/7yQvRNwB+iqw6slTkb9WfjF/CZuUDhriqqHyDNbrXwy/xCdXoCp5+4TkIaKYJbYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X2YbtttX2ljZ/Cx/Wqr/rTeYStGymakIlZJnGpjWoAU=;
	b=CyPkd1SYq96KH6OBP0BvkpQKJ74NvnG/FcQPWcSWEe1R3Rex2Be/SmIaVikI3m4oQOoU
	 DK9MREgtYJBBoLoNi40AUIs/y4EeuI1MZ4n9dk/cqSA9oY+S7OWkLH2i8Onc0Rt/LDH4d
	 3TLzsjcFOdqN2qjKPjIbvldDpLoKpSCa/y1i1k31P6MhCA8+tQDOqNqHsysFuq7tsp3aV
	 sqR+O5c2V5+iAK+60QcmQvWX2U+UzazAlwWYo6oUu6Y649cWSeY/3D0eLiax8d/XfdSRg
	 h13rFCKEusbHi0ddW5g0qx4MCSrzGAnc3MxnXBpUwHym3Ho03TEGOt8cXXz5ENHnKwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ik+qj3YW;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4FE4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ik+qj3YW
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1438144f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793870148; x=1794474948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2YbtttX2ljZ/Cx/Wqr/rTeYStGymakIlZJnGpjWoAU=;
        b=Ik+qj3YW6/tbM0GfgqD8u9GFlUuLRupsrDPDM3W86HK70+lqjEU0Ib2ss3aYQH7hIK
         laxrlJD7u6ZwtCfi3T0HBPL52puC2CEJ5iHpdMuUvjelxMt2yN+KntPUAIzmsX9f0Fnq
         C4JfHCYGQhEk5YpwZyfpPNIDDUME/xjqlb49duzpOn150X/42LPUkw7KqKHlFGmqArZ4
         NQJWqwzcU0HmJvYHR8wcaNd4FV1+pFK4/JxZOsPm4vLsn77OmuE5/i7EUfcuVJg80wNu
         /SLifkZMAJgpz95tXpEyw2rh4K4dYfJzP6ay7SfuFRq9lOttoEc3p5CLto02EYjtF7ON
         0xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870148; x=1794474948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2YbtttX2ljZ/Cx/Wqr/rTeYStGymakIlZJnGpjWoAU=;
        b=Zf3fgimLui2G8qn+m3+CYRNW9jf8GyCdo9Svd5/JZYWgmN70IzohdqJYDgJe4Tje3x
         RHs7gIgUjiAjgR9EQ7dlhE8amKg8fPHI29virhWk48V2MIc/ICihVTtDiFhy8fS17hHZ
         zupKxSxy+vJVQ0ChO1ePP5km7jMZwv/KFbjaUmyWMKjmSW5vvjKJlF2pWVK9J+tJQ0c/
         jik5K/Ac7CMuTgnwob9TtJbWCeFFZnddd9WPfT1PAFixwQ4gj4UFYiQ74yT+JER+rNhb
         +YKrBqyaff8NTmux7FBN3ZGEdDyfDyh1YSY+Yzs4F00E+dCI8810Qx0pQng7sI8w1EGM
         TjIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6GnydzfS66rq2VGsbbDdKjfXSiWxKwdzxdRAU6FceI7t4llTpeSmaUkWAP1XHbQQmmkybEfV7MXxOP4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uB5WTMGk0Je6iRu9Wa1klrn/Q1OWPh97SN0UWdodhMurdV9y2
	lkO9j3hoTQi6j8OQmCaXJxCQTzCy67yTBzKdcIiERawFHpAdhcaMrw3ZETDjNXlSXbXqbfXqyC7
	gQgbGxA==
X-Gm-Gg: AYBFou3UE8dnEpEfl0GDUxeoYLYEMTiN525kLvjZQZNkwvPztzmKIXJNUXg8sevHm2S
	GJt1p22lzgR/Xpv5mbXUGle0aSNPesQ4as/HEJFAR3BnHHWfePDJttnu6P+gEL4mS02BAXfPH/D
	Xn+ajpn7RWmTWrQ/vvENsoFyYXpq1Cj33oW+EErmaqejho+EAGISMAUhXxrmXf7bRSU/gaO6P+6
	QV7D371HGuLD8jqB1AJeTWRYya/6y9Izb6ILbzZkEF5vVl27tBYzUKRY5/+h4zJjGeQ6pVKXaMC
	1UE+qy78wSh8szzx/B6RgtbLbzFWsxgZOwdb5Bh7U8u4cc3A9VT5HuqsPk+dMo/bHvgvokpKHMR
	fH54fyC67DgCFs5UcTdhfoV+qRXhlQied0N2rFu1ndT9Q5R/6VDtsDVyhcMFgv5SlgXasjQA/9a
	xIYNjcUYN4sI3Pm2bX6/vk8Wzo3xokKeTtkXaiVFJdwyYRODp2DXGkgVNSzZqSIis/8tpOYc2+7
	AIdXxYgq8YC8jxNvKoXzOYKKojvK4C1mdu1vxKznaCRNu6rBgOwfws3ZPKIKPhINEplWcyiSzjx
	MqywcMFDM68RUNuiFxRNsKMjf+gP6KdsPz9JWXMzVIiGkqR/4sy0x9lu4Y7c7XCwhNmcdRBEstp
	SY9tkI2Mf6Q==
X-Received: by 2002:a5d:5e8d:0:b0:48d:fd53:828d with SMTP id ffacd0b85a97d-48e6e50d75fmr36610544f8f.30.1793870147754;
        Thu, 05 Nov 2026 01:15:47 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm8550950f8f.11.2026.11.05.01.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:15:46 -0800 (PST)
Date: Thu, 5 Nov 2026 09:15:43 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Breno Leitao <leitao@debian.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <srostedt@redhat.com>, kernel-team@meta.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] ring-buffer: Handle a reader taking the new head in
 rb_handle_head_page()
Message-ID: <auxJP5fkEQOkvicE@google.com>
References: <20261102-ring-buffer-head-moved-v1-1-165973790be4@debian.org>
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
In-Reply-To: <20261102-ring-buffer-head-moved-v1-1-165973790be4@debian.org>

On Mon, Nov 02, 2026 at 06:30:11AM -0800, Breno Leitao wrote:
> I am occasionally seeing the following  KASAN warning when running

a KASAN warning?

> some debug kernel at Meta's fleet:
> 
>   WARNING: kernel/trace/ring_buffer.c:3793 at rb_move_tail+0xf78/0x1050
>   Call trace:
>    rb_move_tail+0xf78/0x1050 (P)
>    __rb_reserve_next+0x648/0xac0
>    ring_buffer_lock_reserve+0xd00/0xf00
>    trace_buffer_lock_reserve+0x28/0x188
>    trace_graph_return+0x220/0x3e8
>    ftrace_return_to_handler+0x2bc/0x5a8
>    return_to_handler+0x20/0x48
>    __arm64_sys_sched_yield+0x18/0x30 (F)
> 
> I've understood that rb_handle_head_page() moves the head page forward

Drop "I've understood". 

> in two steps: it marks the pointer to the old head page UPDATE, then
> marks the pointer to the page after it (new_head) HEAD. The second
> cmpxchg is assumed to return only HEAD or NORMAL, but it can also return
> RB_PAGE_MOVED:
> 
>   CPU 0 (writer)                        CPU 1 (reader)
>   ------------------------------------  --------------------------------
>   rb_handle_head_page()
>     old head ptr: HEAD -> UPDATE
>     new_head = page after old head
>     <interrupt: nested write>
>       sees UPDATE, marks new_head
>       HEAD and moves the tail page
>     </interrupt>
>                                         rb_get_reader_page()
>                                           swaps new_head out for the
>                                           reader page
>     cmpxchg(new_head|NORMAL ->
>             new_head|HEAD) -> MOVED
>     RB_WARN_ON()
> 
> RB_WARN_ON() disables the whole ring buffer, and the function returns
> without clearing its UPDATE flag, so tracing stays off until the buffer
> is reset.
> 
> Do not treat RB_PAGE_MOVED as fatal, retry after clearing UPDATE. The
> head already advanced past both pages, so the caller can simply try
> again without losing tracing.
> 
> Fixes: 77ae365eca89 ("ring-buffer: make lockless")
> Cc: stable@vger.kernel.org
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> A nested writer and a consuming reader can race so that the second
> cmpxchg of a head page move in rb_handle_head_page() returns
> RB_PAGE_MOVED. That trips RB_WARN_ON(), which disables the ring buffer
> and leaves the old head pointer flagged UPDATE. The patch handles the
> return like the RB_PAGE_MOVED case of the first cmpxchg: clear the
> UPDATE flag if this writer set it, and retry.
> 
> Testing, on arm64 KVM guests under virtme-ng (32 vCPUs, KASAN config,
> next-20261030; kernel/trace/ring_buffer.c is identical in v7.4-rc1):
> - Setup: function_graph tracer filtered to "*sched*", buffer_size_kb=7
>   (two pages per CPU), overwrite on, a trace_pipe_raw reader on every
>   CPU plus a trace_pipe reader, and stress-ng --yield/--timer/--futex.
> - Without the patch the warning fired after about 12 minutes. With a
>   debug-only 50us udelay() between computing new_head and the cmpxchg
>   it fired within a second, and a debug print showed ret ==
>   RB_PAGE_MOVED, type == RB_PAGE_HEAD and new_head being the reader's
>   page.
> - With the patch: no warning in a 5 minute run with the udelay() (the
>   RB_PAGE_MOVED case ran about 1000 times) or in a 25 minute run
>   without it (it ran once), and the buffer kept recording in both.
> - checkpatch --strict is clean, and kernel/trace/ring_buffer.o builds
>   without warnings at W=1 on v7.4-rc1.
> 
> Not tested: the fix has not run on the arm64 Grace host where the
> original WARN was seen.
> 
> The original WARN came from a next-20261030 KASAN kernel on an NVIDIA
> Grace host under stress-ng, after an interrupted ftracetest run had left
> that tracing setup in place.
> 
> The analysis, reproducer and patch were developed with an AI coding
> assistant (Claude Code). It triaged the WARN from the netconsole logs,
> wrote the virtme-ng reproducer and the debug instrumentation, and
> drafted the fix and changelog.
> ---
>  kernel/trace/ring_buffer.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 1fd28a72e6ee13..7a60fa175e2cc6 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -3789,6 +3789,15 @@ rb_handle_head_page(struct ring_buffer_per_cpu *cpu_buffer,
>  	case RB_PAGE_NORMAL:
>  		/* OK */
>  		break;
> +	case RB_PAGE_MOVED:
> +		if (type == RB_PAGE_HEAD) {
> +			ret = rb_head_page_set_normal(cpu_buffer, next_page,
> +						      tail_page,
> +						      RB_PAGE_UPDATE);
> +			if (RB_WARN_ON(cpu_buffer, ret != RB_PAGE_UPDATE))
> +				return -1;
> +		}

We should avoid duplicating this.

> +		return 1;

Besides, I am not sure about returning 1. If the nested writer interrupts
between rb_head_page_set_head() and rb_head_page_set_normal(), it can also get
RB_PAGE_MOVED and skipping rb_tail_page_update() means the retry will observe
the old tail.

All in all, I wonder if it shouldn't simply be: 

  case RB_PAGE_MOVED:
     break;

Additionally, the comment with "Valid returns" must be amended.

>  	default:
>  		RB_WARN_ON(cpu_buffer, 1);
>  		return -1;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261102-ring-buffer-head-moved-f9caf5da9444
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

-- 
Vincent

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904341;
	b=zbE9xqsZcjeVXkfrmluysic+Gmsb1F9AfUrZUZmgEePvxPvrxZicC304zTT/PQa3tRYx
	 Z9cVuNWwbcsdPb8jtxm7yP8lPraa8S+tTyYzjLarN19mEciVd5+xH3tcljzGYLPgDh//m
	 EhQiXaeXNujIem2DMbOjbhbkcFYy46TQtaNYJf8ilQL5+wTZyDEp39GsCdYKFsfC/nMEt
	 Umxk8xWcnr1PKpxEXDM8VSLL9AmNDupduKtMGajh5oIf1/dIWaXnD440qkS8wL7Uk+Kme
	 g5SAlI2mzJvOHbytfg3SOhbe+Z1Lw+NalsXeEu+KP0TlGb5t659NC5A52cHkc5QUq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d7/gLkEErw2NrwM3emgVckiNuqhq20xmOd1kL4guWgU=;
	b=S80nl58WS88UqRKBiqnOpkVSQdcqowj7mUJk8dcY87NOu6FT4X4xhn7TPUJSzA0yW+zn
	 V+xxpUEHbwuNAsnc0XcrMCkJXlfY1NJNB6XtCnThrzqMQS7YOSzrYoPKZ1+WuH7DwUeS4
	 753kYMaIoBWGPcXdLo4sXPiFjrQTKTeblbM7OjBpRddBU4+4pIomb7xeqDieVCAwPMYlU
	 sEU424uEooxhZ2yoOgSBK/LlWJCvlATQrcikpX6DY1YrCEY34VIQdS3FA979UubZ9lpgi
	 +R7f06D9oFMjxV9yui1ovcMWYyM+mPfeqqfm2BnJMbUSfo0lz7EjF8y0xmZZ64jl0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mnkuH3i/";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A26606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A26606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mnkuH3i/
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so2235536f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794904339; x=1795509139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7/gLkEErw2NrwM3emgVckiNuqhq20xmOd1kL4guWgU=;
        b=mnkuH3i/90KfiqGeu2NXWx6xeI666iqO2uBKK6C1elQ4hg/iiC13DqJ8ThUxV39dFp
         I23qnrNEgnclpLQVFHbej7GkYAKL/q2ofVxB2RjP1G9quwfqWlwUqTrs8q364NTyh9A7
         yeLWDQbZel24U5kehuXvfe0AsfDMjxXeE0QvB/S0opUrBuIbTFMm376WApHI2zBOzVkg
         HX+ZmyXM6VAn+JO6PvfCa5hw7VGorhQOV3Ya8NVL//XHCtZ8AtOVHRE1u0ZYxoLttXts
         ATs/jkH8dpuCcQDRhnaZC+HHugBTq2yB7gMdParcfeguF/t6pbhTfC85Whd2QX4Svmgr
         NQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904339; x=1795509139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7/gLkEErw2NrwM3emgVckiNuqhq20xmOd1kL4guWgU=;
        b=bbD0auTSgLlVNEwj0QqXNc+P1duyHpSy+CzxHLolmNsK6FwUju+gMaw03CoBy/RzFv
         ZefVZAkpxdvyBUmjKEd8IeIVLX+WKvT6UWatKU59CJ43e4OF3N6RLyLT70TAaVzQSinC
         tpLm8NKpIQ8t0B9XNcuhojjrMPvCFzdskSXfTmsSgvAK43X54DtaR3Ob6/CQ9vxaXrrV
         zmfG2SUeWRkDpyO7ySqBCwHAjH5E/VGXNT+Hi4S2qQZjLqRc8koIs+x/g27WznrM8Rx8
         aq4iqnIxWrWAFbjbtPxndVyUlvvFIGmZRV3FIWeiaBmp1dPFzKVagGiKQxQ5lu9UtPmF
         SfRg==
X-Forwarded-Encrypted: i=1; AL+hErE7P9Z5jXzf42FmpC/Myzp8DwxWPkFSZUIh0q+9QIwMZJ28811kLlIxtokj8DXfw4Xt+aSGOwUbYbYdfGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FwWk002x3w7yW9aLbPG5Zvd4v21kDxcd7tE3KkZWOLEsuYcly
	gKD38aWSNl+jBpUt9V0ne8U26GoA266OIOE+7DOaOLfPW67Vq5Yw969pvpQWo9B2rA==
X-Gm-Gg: AZFdTZfGshrgZ/NxVbHL34zKbLMdK/TjZjKnQehYCNZRfDzamSexjWfIMIg7+gw6xpR
	axZwoGca2/f19pw0bFCyt+81fR4D14NdPA222Zt019C6BY/OAR2pSDd1Y/4MkscM1BuiCo54ypq
	igCSY9VylM7EYkp7kZDKirOnzs1+2k9muqR1IEqcvt8hY/ZtP5kK69CPue0kfDwSVLi0xRkpxQJ
	ogUZ1V++2YvUE7x4aoWjRdxcchT+BsU9HXMkLD7yMETwTom753sAX9ti0ga0a0ISZ2bBa9mCbfF
	1kt1NN/+0aC7CSlKBejmr4iymSgfhwnBhNuf07AeghnlaJC9qWKLZScV/wVNYBeyD1x9QcZZqJ0
	3Jp7w4YoMbc7BfunD2zwVEthz1zXy90SMW7CNEyVbMFbpf6VFkxhR4RJ4hp5qcGKwzYSTIXSIve
	J2XSxoLB4IxQiqDrYD+6BQD2fgKMwokPk8GOMLBUIz+fK5SIAiMIykiXc4GK/0qVdPMbn+QVi8D
	OgwmHkOT0mW9eM6vMn8pe4P+/GaNw4jVf9A5sS32qoZtcgZLfpZHq96qQ5WR/vkt7y7gRC6rTCS
	WuW/Fgd0c8JpIrywvA+yxLf7O2aeRGNgkVhPfFJ3Iyd3GPaFDzQjapLVbyS8dCmjfsXvb4KFRY9
	yib4mKcjdQc4=
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr26046506f8f.26.1794904338606;
        Tue, 17 Nov 2026 00:32:18 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c888b90d4sm26790072f8f.9.2026.11.17.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:17 -0800 (PST)
Date: Tue, 17 Nov 2026 08:32:14 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] tracing: trace_pipe reads out of bounds when it races with
 the ring buffer mmap reader
Message-ID: <avwRDoDJF_oj1xWM@google.com>
References: <179485165154.2547186.6129837870360499372@gmail.com>
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
In-Reply-To: <179485165154.2547186.6129837870360499372@gmail.com>

On Mon, Nov 16, 2026 at 09:56:31AM -0800, Kyuwon Cho wrote:
> Hi Steve, Masami, Vincent,
> 
> While testing v7.4-rc3 with an LLM-guided test generator that we are
> developing as a research prototype, we found that reading a CPU's
> trace_pipe while another task consumes the same CPU buffer through the
> mmap interface (TRACE_MMAP_IOCTL_GET_READER) makes trace_pipe print
> entries that have already been overwritten. With KASAN this ends in an
> out-of-bounds read in the event output code:
> 
>   BUG: KASAN: use-after-free in string (lib/vsprintf.c:650 lib/vsprintf.c:732)
>   Read of size 1 at addr ff11000011e2d8ed by task test/89
>   Call Trace:
>    <TASK>
>    string (lib/vsprintf.c:650 lib/vsprintf.c:732)
>    vsnprintf (lib/vsprintf.c:2948)
>    seq_buf_vprintf (lib/seq_buf.c:74)
>    trace_seq_vprintf (kernel/trace/trace_seq.c:175)
>    trace_event_printf (kernel/trace/trace_output.c:360)
>    trace_raw_output_workqueue_rescued (include/trace/events/workqueue.h:210)
>    print_trace_line (kernel/trace/trace.c:3082 kernel/trace/trace.c:3248)
>    tracing_read_pipe (kernel/trace/trace.c:5475)
>    vfs_read (fs/read_write.c:552)
>    ksys_read (fs/read_write.c:696)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:89)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>   The buggy address belongs to the physical page:
>   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11e2d
>   page_type: f0(buddy)
> 
> and the type check in trace_assign_type() fires as well:
> 
>   WARNING: kernel/trace/trace_output.c:1798 at trace_print_print+0xeb/0x130, CPU#1: test/89
>   Call Trace:
>    <TASK>
>    print_trace_line (kernel/trace/trace.c:3082 kernel/trace/trace.c:3248)
>    tracing_read_pipe (kernel/trace/trace.c:5475)
>    vfs_read (fs/read_write.c:552)
>    ksys_read (fs/read_write.c:696)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:89)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
> 
> The stale entry carries another event's type, so that event's output
> function decodes trace_marker data as its fields, including __data_loc
> offsets and lengths that point outside the ring buffer page. Other runs
> reported slab-out-of-bounds and global-out-of-bounds reads from the same
> path; the ring buffer pages themselves are not freed.
> 
> tracing_buffers_ioctl() calls ring_buffer_map_get_reader() without
> trace_access_lock():
> 
> 	if (cmd == TRACE_MMAP_IOCTL_GET_READER) {
> 		...
> 		return ring_buffer_map_get_reader(iter->array_buffer->buffer,
> 						  iter->cpu_file);
> 	}


Indeed, that's an omission from when we brought this support.

I have just sent a fix [1]. 

Thanks for the report.

-- 
Vincent

[1] https://lore.kernel.org/all/20261117082932.3441173-1-vdonnefort@google.com/

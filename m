Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743497;
	b=1YtnBPbvhrn/sdg6EzAAocD2r5SY5fiyeW5/BMOTLUrl3c9vbmgrRUhMW9lPgPqfeBQC
	 gfk/Fxxa1za0Z/ALu6JM5wx+vWQHAxIBQ1EN8+rLdcZDqRbGKWq779BXRTIj0gtOG9tcf
	 Sbi9FZ3JIhHhO53+PFPpRbAQCCQLQp9yyaAvGPFIqGJMk15NLab9r29GRr4bdcj4NuMhP
	 X+BMdK96TFmIBwZM/bZy9yo349l2bQ80K1ena5H5NFaaV0Ybs/pW6DRjbR1ehCl7Lvsf/
	 AsPMBx5SJ5HTQrr3V73Iy8fBw62I2RZDf7u1W/lEGizC0B+q2Rxe8xykvhFvxMIhr1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=5oVeJI18w0YWnW1MyEvLa+/8268RVOyYzuorpmt19/c=;
	b=iP1OsGE9B/PTHXOtgQZLYRnHinTUkbazeQ8kxAVZpeVYc/MwqCVtuJqERFfuuK0FkB+6
	 gMcgysOabTjLE0nGN5LgdHjGVLUE4a6rfbqlusYLejaxS1RAk7hgo2nwMb9ixe673W18B
	 9vxJFy2O1MnLrlLVI5ca2HmyF2WL1VoUaf0obfpWKOkWZ57MXvvqfb0er1txRs5SOK+w9
	 RREjL0fdgNnNkLIP865fT2/3iXAy38KWO9gRiHW7m0q6byCOEdfygg5ke3NzVEv20BK7p
	 OvPPZB2ElpdoRCzsu3FS0CvtsyEHawZGdEeJCjQnJdurJqzbexAPZSySVMf3h5aQisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RrWV1pl+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E26C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RrWV1pl+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so5117145e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792743495; x=1793348295; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5oVeJI18w0YWnW1MyEvLa+/8268RVOyYzuorpmt19/c=;
        b=RrWV1pl+3EtmVhDk3j+FSUjGfIGHBGcq03rhpg7WHleDgWouEuAzLqoTyRgDy5fvz+
         wF4UwPvIifknkCZJ1PyVasiujDFi1GArPhxOLkP1kt0rlZ76Wimqmbi6lRV7CAe335li
         nBN6RuojRiEjRPUXQXtFCRmcizH9AjfxZLYTp9mEVgDdPbIRcaS/V2y+lW/YTHj0zgLN
         3/8M6w9m9KPXRpZeM767NWZkPimFSwtRCFhSCyNwuaWR9n+Yp67SOJtl9ONCDR3PThcC
         Hy2hN4n6do3y8bjEGk7YwetK5ZH6Q27eSVvNfCqUcRHWRJNJuRAwCVBgCixX2iBkqZcn
         E+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743495; x=1793348295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5oVeJI18w0YWnW1MyEvLa+/8268RVOyYzuorpmt19/c=;
        b=sMxW6FFYx0hWM1sw148JaD2wwDFQj/nkPVadHO9mIJv9bXFZQa6REHgWiQqbzBMQvB
         XjiF5Gg9a8J7EQMo+ML4KeQ9cDt+vz3MAKaOhBiruaGMlH6LosmG0LfD7p34PIUc0Wb9
         5iJyYggsys3LjQNQUV1/FZM8UNZwFM/4SPwfdqt11G1XAdTOcL52J8XcXriD2EerQU/C
         FxouaXw8CuY98MZxZb2e3iOKWuIJN8osWYG2jI3jQ90Tesc3RUwaBZPokzvS2myDgjsP
         12Y/ApBLwG6xsRAxkcwqnKi0XYzeeFyEm7nnYx3FI6QpY7dH14O3Z7dwkf7OkKi8au+p
         eJlw==
X-Forwarded-Encrypted: i=1; AKwUvBwtIT9PtABlh2m2gep6OdJzwNJEo8oPcl22pHJI3c18BcIDAKn9S1H7fHXli1C9/xINiU6Hlunp307Jp2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKefSTAD+tG4Ti9YErh1kVFng06HElzJTA3B7G9lyGs3iLtWa28
	TefV1eF4bHuvXEwJdyX9shJonPsQ3MkAENYCyCIhMSHljI7Ep1mSlPTj5cfSCbWF6g==
X-Gm-Gg: AYBFou10e66g6Y7Hu30qncR/kSaIqU5fk2dy4LRVBQcJovmS0BqTVXdZojwLKRniidu
	aPdcf1+q1dFNBW6XI7zFjkGUNDXMRsrqA/GJxWbqxGtFN6LjLl0dopeW4cm+v4PkNvKibVhnIiG
	nl25EwufOgeN6JF0Ipx7b+XdlrjByhImE6f72Jel7Rm+7VG2nhC+iKw/hwMjLc9hfPbNApS7uEZ
	BgiuFX2UyJ3WxvtUZ/TipeydZFR0xVqFGEUGY012EOUQMG5+NqneAmvEtkBbJK8THxW2V09rBmp
	v/bhM/XeJQTA8/LEszLb4Bv5nLldkwd5wqoJa2vlfLjX3Ib5IUcs2rtN+neTOvhkk2iyD6+ar+j
	5B2v8Q1gL3AvJGSJCW5q7R6oqigaM8/A2A+SccVI78rx79XnLfWtifaVdZVfU7lkMbMqs1c10Ie
	J8ewAUUfDQ1S2wwRB3UibHqylCNovOuFoknaQYzcVE8/Vy6/57TFg7DJac8IIET5FMDhZY6gqx7
	B0Loy5WI/5SOnkkehFBQNZY8+vqJDqwIbfjGptSkmC0Ys/DwXyUhd7jES9Sux117FFLoqskX95A
	7RjCeoVoT1nR9iz6BXCtN1eT
X-Received: by 2002:a05:600c:524b:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4a211ed3f5emr23048395e9.24.1792743494996;
        Fri, 23 Oct 2026 01:18:14 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm68556225e9.8.2026.10.23.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:18:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:18:10 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-ppc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] ring-buffer: Do not check si_mem_available() before
 deferred init completes
Message-ID: <atsYQtXHRH_cCQ5A@google.com>
References: <20261016134247.70722-1-amachhiw@linux.ibm.com>
 <20261022181817.49717-1-amachhiw@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261022181817.49717-1-amachhiw@linux.ibm.com>

On Thu, Oct 22, 2026 at 11:48:17PM +0530, Amit Machhiwal wrote:
> During early boot (early_trace_init() called from start_kernel()),
> tracing allocates initial ring buffers (temp_buffer, array_buffer, and
> snapshot_buffer) for CPU 0.  Later, as secondary CPUs come online during
> smp_init(), each CPU's ring buffer is allocated via trace_rb_cpu_prepare().
> 
> Before attempting page allocation, __rb_allocate_pages() performs a
> heuristic check using si_mem_available() to return early with -ENOMEM if
> memory appears insufficient.
> 
> However, on kernels built with CONFIG_DEFERRED_STRUCT_PAGE_INIT=y,
> NR_FREE_PAGES only reflects the initial non-deferred pool across the entire
> period from early_trace_init() through smp_init().  defer_init() leaves
> only a single section per node (e.g.  16 MiB with 64 KB pages) initialized
> up-front, and on kernels with large static binary footprints (debug
> configurations enabling PAGE_OWNER, DEBUG_PAGEALLOC, KFENCE, or SLUB_DEBUG),
> early core initialisations (SLUB caches, vmalloc, static ftrace records)
> consume virtually all managed pages in this pool.
> 
> si_mem_available() therefore returns a false negative (often 0-1 pages)
> across both SYSTEM_BOOTING (for the initial CPU 0 buffers) and
> SYSTEM_SCHEDULING (for secondary CPU buffers via trace_rb_cpu_prepare()),
> causing __rb_allocate_pages() to prematurely abort with -ENOMEM.
> 
> This failure is false: the buddy allocator is designed to replenish
> ZONE_NORMAL on demand via deferred_grow_zone() when an actual allocation
> is attempted.  Checking si_mem_available() before calling alloc_pages_node()
> short-circuits this on-demand growth entirely.
> 
> deferred_grow_zone() is only permanently disabled after page_alloc_init_late()
> completes (it spawns per-node kthreads and blocks until done), which happens
> inside kernel_init_freeable() — before system_state is set to
> SYSTEM_FREEING_INITMEM.  Skip the si_mem_available() check until
> SYSTEM_FREEING_INITMEM, at which point all deferred pages are initialized
> and si_mem_available() is accurate.
> 
> Wrap the guard in #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT so that on kernels
> without deferred init the original check is preserved unchanged.
> 
> Fixes: 2a872fa4e9c8 ("ring-buffer: Check if memory is available before allocation")
> Cc: stable@vger.kernel.org
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/all/arYskzbiaNzBR9MD@kunlun.suse.cz/
> Link: https://lore.kernel.org/all/arYskzbiaNzBR9MD@kunlun.suse.cz/
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>

It is usually good practice to not use in-reply-to to link the series between
each other.

> ---
> Changes since v2:
>  - Rebase on top of upstream ring_buffer.c changes from Vincent Donnefort;
>    update threshold to i < (nr_pages << subbuf_order). (Michal Suchánek)
> 
> Changes since v1:
>  - Extend the guard to cover SYSTEM_SCHEDULING as well: smp_init() calls
>    trace_rb_cpu_prepare() -> __rb_allocate_pages() before page_alloc_init_late()
>    completes, so the false negative window spans both SYSTEM_BOOTING and
>    SYSTEM_SCHEDULING. Use system_state >= SYSTEM_FREEING_INITMEM as the correct
>    boundary.  (Sashiko, Vincent Donnefort)
>  - Wrap in #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT to preserve the original
>    check unchanged on non-deferred kernels. (Vincent Donnefort)
>  - Drop Tested-by: guard condition changed, requesting fresh test.
> 
>  kernel/trace/ring_buffer.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c4e40847e43..8e5a59a7b69b 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -2463,10 +2463,27 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
>  		 * memory. It may not be accurate. But we don't care, we just want
>  		 * to prevent doing any allocation when it is obvious that it is
>  		 * not going to succeed.
> +		 *
> +		 * With CONFIG_DEFERRED_STRUCT_PAGE_INIT, NR_FREE_PAGES only
> +		 * reflects the initial non-deferred pool during early boot and
> +		 * throughout SMP bring-up (smp_init() runs before
> +		 * page_alloc_init_late() completes deferred initialization).
> +		 * si_mem_available() returns a false negative across this
> +		 * entire window while actual allocations succeed by growing the
> +		 * zone on demand via deferred_grow_zone(). Only re-enable the
> +		 * check from SYSTEM_FREEING_INITMEM onward, after
> +		 * page_alloc_init_late() has finished and si_mem_available() is
> +		 * accurate.

This is quite a massive comment for something simple: When
CONFIG_DEFERRED_STRUCT_PAGE_INIT, si_mem_available() will reflect the actual
available memory only after SYSTEM_FREEING_INITMEM.

>  		 */
>  		i = si_mem_available();
> +#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
> +		if (system_state >= SYSTEM_FREEING_INITMEM &&
> +		    i < (nr_pages << subbuf_order))
> +			return -ENOMEM;
> +#else
>  		if (i < (nr_pages << subbuf_order))
>  			return -ENOMEM;
> +#endif

Could we avoid the double i < (nr_pages << subbuf_order) with something like

if (IS_ENABLED(CONFIG_DEFERRED_STRUCT_PAGE_INIT) &&
    system_state < SYSTEM_FREEING_INITMEM)
       i = LONG_MAX;

>  
>  		user_thread = current->mm != NULL;
>  	}
> 
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Vincent

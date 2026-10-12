Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198474AD7C9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823134; cv=none; b=J68BXvPhjwupmJicyfhLR998vYDTtw2pBUM0GOC8vo+UbYKnwdOrTw2zXBwHht202To1D2eFokOwmlFKvp8i5tM+bh3DZghVXTy5hiUA4V9TB3LAnrfkFdDsANzri5oXX24SLVdu3WnOpYGLkB7wYS/AVD1g2a2ghTIM/1YnpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823134; c=relaxed/simple;
	bh=F1H5MyQMuXam71E+nKkOYHzZwg6EalJS+Z3MC7TNSRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzrqHt+mXfHDKBsDyPp2BqMyex+p1vd1Qi/gUzmbJgNzx/4tqDxIMG9xmOpob0LrY+wnU+mLR72qYSAt1uO0ReMfXTOv+YNovBVovPVnVWKluktTTsTbTf7SjDzKMMTmm8hrvHvkqVfmVMNqHRkwcFAZXOZ/abwQsUqAFIP+F1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OaRyrzcm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OaRyrzcm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c02782159so1280277f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791823128; x=1792427928; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HuWCbCHALjFKQvI6kk2Kyts8iE/+EiR+kuOdFcAFHro=;
        b=OaRyrzcm/6gD+o7+BEmLhi5mzagEMcFzuXzlcCwSqbFaRsmfrW7kG1B984Qbi1sHLM
         QQKi/qpfxUsh9eKwC5IIonJHtnA4zkcTKx0I4+UHqnQw5skScqyv1WjxBlk3Jd25pqee
         eFCfOY1hi/qk4A6NSnzHH8KWQOcegWZjFhRCLCRhlFBqvWQXx7asu0PKdUqBy0RVhaZ5
         jK6UH5KQ9j3+NpkJXVZK+uN1u4XqMcvXuTJryuEl6NztgY5K90I189ECQk13Gq4Frg58
         44b1BiQKtUsNG4ox9yeeX11fMX5/q5ZawnI/Dy2EixgSKifp4beRY9QJroMNe7r+Uzn5
         PUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823128; x=1792427928;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HuWCbCHALjFKQvI6kk2Kyts8iE/+EiR+kuOdFcAFHro=;
        b=lbvsizf5QUiavIusaCzkl1j4nOdoCA6ZQ96dn0BLr5FhFGPoE3f/iInYvDlFmt0kyf
         uovdc8Pcs7jOiC0VgVWFSXTxruJy70jS7OqQ4ovjvO93sAGxJ/8QwYwLqZkMI9oMDGyd
         ndTDqH9UDNZ+rOIxi4gBHO6jKUUcG3n4oziKi1ro994hZnBRVlCSJPzersXqAzjZ0beE
         PGmWk5UB8vkrSHkGnDTGFTcPMfDl/LPv7kyHX4j0V3NmGmjmMc0TopvoPqntYxG9CDG/
         Xz+uxwXOO544fNzObTaaJDTjsPUMmM9ZoP/Yp2d76rQPEODLkfwX77vX7XJn03GQ0DSK
         stqA==
X-Forwarded-Encrypted: i=1; AKwUvBy4e+vG2w/fhN+Esq2nVxjTpGW8yjcLTmFG+VvzXVnfgyuZ+nnRNeulRbMUhrn3X+tGCpy/igYI55AI0Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLetSlXu8WC8OkQcA1169HLB64qY7GgHBjBG26F8fE6bWuu+Tq7
	+SC6UlHaVPu7WF+Bsu2b7pvWrPwWnZ2aanwkwdftpGyryIfwiCdpH2RyGvFbiIbIhw==
X-Gm-Gg: AYBFou0lq+l84D0dxOAwZrjNonytVqAn6/fkd6tmDvDYT2Cm0AlKzmz4Rtlsftj5hvI
	+LL0Tf/jn3kxkLZnSu4hhimiYjj6o8QiYprOhI60XuigKvpLUyK6r2k50J61a7Y/XdL7M4uZp5V
	S7edCspOGf/U+w5ptnJT9asUXNt0Y1t2cW1HwZVJWBxs8zQhXYoMmH6pvco6WsrpZdd3jDgPoyd
	AwKyR9hVMZVYfutxldUP1VHz1Z7gDYZRs+u8fdv3noK5RKYF8PU4lTcQ9thwAgLtya/Bj4gg48T
	Taie16Q8QjqP9MZJX37/+1l84jgnPSKHExuOX63aBSpFaE0sIJFb+oriYGYaCSRWwlx+CbhtrKt
	7y2Onq6l+HRg4S5XJgaDSV77wityxCP9lJKiJvrr5HmFW0jYxu0/v5VJd2rrbUzdNpak3xpQEJ5
	Cg8ueZkUE49M8DHXzF9M+NodRxk80FAW86iqhIx8/aBo9LnBPMjW1JH8Wvk0RVGpuw0Hpdo56M/
	1TzfcrCsdK+skBOv+x6RrprQuh9NwgabKL17Qc1Mv0=
X-Received: by 2002:a05:6000:4a0b:b0:48b:11e1:8bc8 with SMTP id ffacd0b85a97d-48dbace678emr18199465f8f.39.1791823126911;
        Mon, 12 Oct 2026 09:38:46 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc91e2sm297646f8f.55.2026.10.12.09.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:38:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:38:39 +0100
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
	kvm-ppc@vger.kernel.org, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ring-buffer: Do not check si_mem_available() during
 SYSTEM_BOOTING
Message-ID: <as0NDyaXsfQnWPQ4@google.com>
References: <20261009163557.88467-1-amachhiw@linux.ibm.com>
 <20261009163557.88467-3-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009163557.88467-3-amachhiw@linux.ibm.com>

On Fri, Oct 09, 2026 at 10:05:57PM +0530, Amit Machhiwal wrote:
> During early boot (early_trace_init() called from start_kernel()),
> tracing allocates initial ring buffers (temp_buffer, array_buffer, and
> snapshot_buffer) for CPU 0.
> 
> Before attempting page allocation, __rb_allocate_pages() performs a
> heuristic check using si_mem_available() to return early with -ENOMEM if
> memory appears insufficient.
> 
> However, on kernels built with CONFIG_DEFERRED_STRUCT_PAGE_INIT=y,
> defer_init() leaves only a single section per node (e.g.  16 MiB with 64
> KB pages) initialized up-front.  On kernels with large static binary
> footprints (such as debug configurations enabling PAGE_OWNER,
> DEBUG_PAGEALLOC, KFENCE, or SLUB_DEBUG), the static kernel image and
> early core initialisations (SLUB caches, vmalloc, static ftrace records)
> consume virtually all managed pages in this initial pool.
> 
> At T=0.000000, watermarks have not yet been established
> (totalreserve_pages = 0), so si_mem_available() returns the raw free
> page count (often 0-1 pages).  When the snapshot buffer or global trace
> buffer attempts to allocate 2 sub-pages, si_mem_available() returns <
> nr_pages and prematurely aborts with -ENOMEM.
> 
> This failure is false: if the page allocation were actually attempted
> via alloc_pages_node(), the page allocator would trigger
> deferred_grow_zone() on demand to initialise additional deferred memory
> sections.  Checking si_mem_available() before attempting the allocation
> short-circuits this on-demand growth.
> 
> Skip the si_mem_available() check when system_state == SYSTEM_BOOTING.
> Once the system transitions past early boot and page_alloc_init_late()
> initialises all deferred memory, si_mem_available() accurately reflects
> system-wide free memory and the check operates as intended for runtime
> allocations.
> 
> Fixes: 2a872fa4e9c8 ("ring-buffer: Check if memory is available before allocation")
> Cc: stable@vger.kernel.org
> Reported-by: Michal Suchánek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/all/arYskzbiaNzBR9MD@kunlun.suse.cz/
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
>  kernel/trace/ring_buffer.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 04bb94c29f58..a9f82e2f8fad 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -2452,9 +2452,15 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
>  	 * memory. It may not be accurate. But we don't care, we just want
>  	 * to prevent doing any allocation when it is obvious that it is
>  	 * not going to succeed.
> +	 *
> +	 * Skip this check during early boot: with CONFIG_DEFERRED_STRUCT_PAGE_INIT,
> +	 * NR_FREE_PAGES only reflects the initial non-deferred pool at this
> +	 * stage. si_mem_available() returns a false negative while actual
> +	 * allocations succeed by growing the zone on demand via
> +	 * deferred_grow_zone().

As Sashiko pointed-out, if si_mem_available() is only ready after
page_alloc_init_late() when CONFIG_DEFERRED_STRUCT_PAGE_INIT, then checking for
system_state >= SYSTEM_FREEING_INITMEM might be more correct.

Also I wonder if we don't want to guard with CONFIG_DEFERRED_STRUCT_PAGE_INIT,
to keep the verification when CONFIG_DEFERRED_STRUCT_PAGE_INIT is unset.

>  	 */
>  	i = si_mem_available();
> -	if (i < nr_pages)
> +	if (system_state != SYSTEM_BOOTING && i < nr_pages)
>  		return -ENOMEM;
>  
>  	/*
> -- 
> 2.54.0 (Apple Git-157)
> 
> 

-- 
Vincent

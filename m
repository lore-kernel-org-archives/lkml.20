Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EF3A7582
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090992; cv=none; b=ZhA4WTHO2Eeo8zWoEOk+7Vbpc+ngjGd7zYiK1RFB0md5jG4pE8/d4YV3z6SBd7cb4ff4WM2QOTSXx0zJYq/u40cdOIuHBwQrcgOCdzKuoRGsGQvtihZARwBfjP9GnVxCBTWVN2fRjQPfZcx+21Ym/IcXX0DkC5CEP5g9rEvHvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090992; c=relaxed/simple;
	bh=CUW/t2DMGC6KDSVpvSRK/dfZFN7R1fhGqhxAik9+46o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqwSt11myRIehAMFpGJtF+OdEkDfemJCAYA6gOkrTPoeEfR/3CVSlf5hucchTm+a8Dbcj42WdToDeVia1NFDF0IPEsOZF+Fsl7eZBy5ADXEuoyyNEsvqNk3ZIwvi8Hyc2E1LXdjKmGSRRIJS958HZMt6w2ZSM9xSX5ul0Daon5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WImjeYPV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WImjeYPV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so18587405e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790090988; x=1790695788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1DGnyimutypPX7y/xqfpAs9eZjemWTA2RU3uj5JDyxc=;
        b=WImjeYPVaA+9aNuCCHjHV8h2elkCDlK2xo3xHhNpzebtPy1Oxjf+41Uy9uLZ6J5kZ/
         Kk1PDvRecpUs8GZPX80GhAYRmPfMruDjZ6TynRd9omfKEJrU98Qi/wRgQgr3gYh8M9ck
         WGQRLTkPLyv88pTLVLuGEKtujWM6xhF1UJc3OVaWb4d5eBqGygvcXG9W1JURMPeVxQ9N
         y4srb+3fPcegkRhLII2RMnCCWVJDPBE1cOhndtfIwLq7hkwSnxqr/1jBax18gUApZlCs
         KYDVRqtQc48wnTVlzDZ5EFzomZ6cyD9kvTfpxOviqzfnOR0BPoCCriMuEqk5k7/pnz62
         2Bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090988; x=1790695788;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DGnyimutypPX7y/xqfpAs9eZjemWTA2RU3uj5JDyxc=;
        b=HgsBdGp/g7ICxPyTUu9ZEVO5DUw9jh8H+WE1t3GSplmRJ797bxg+U/cE8L+6uJQGrW
         fA/ZtYDgiRJg9i8RUyzRduQZWugI9BC5w4TLwWezy/34jmo4a+6flT+ft3Jt5u4XWOFR
         6ppAA9ssLF9w92dFUzXHNae8a3CnRz1V1Vy2Z3gznIRadXzzoWgGi5fGzlPDf0kD//rN
         f23poJwNoFOWwqKy4m034PNzdfQn6eTsGdjWgM+pP7gnxhP+CGNgstDmz61CHKsx4em8
         ZcgqUXQ+IyQZLDKhkOaXEy8Eu/Bl0J6mv2NH+6FNMYGYpP+ruTrKsfkBHpDWXE0OzoPp
         m/0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2Hq884WrXnYR0vMVrdl1Hrgot3srXp8cEiVJ1Ksfqob3AkNLRMhIjyl/uzo9Q2Bw7RY8zJVnurX6VNq8=@vger.kernel.org
X-Gm-Message-State: AFuF++n9141jBq9nWK9VcDOwSd5+weBcWAff61j7ciGVknl1wxwqTHri
	NOm1neW4HMvU5spWLXnUoRwSCOjPs1NwoIjWByQ2LYkRoNNdnEPsBfZF4sUbPrFBaaYgT0Kyk2g
	9h5KvdPw=
X-Gm-Gg: AYBFou3NytZ/fDV1sxeQ4g89QZtvnJwHMbTU88EoQ3jVM0+dh+VPVQuCSqjJlvn+Uqz
	8TkQFg2Kf1yQkED82mUjj7GDDSEcnhFVACXNQQLY/4z32350Y6h/GpcGxfJJzrNsRaCdPkruPr+
	mut1RhaYUPwOwS6jmBni981nkZC2OTzm3xKsD0hVMUbhY5WWjisbgws9sOhM4L1AXEy+RykRiKf
	cKtthR5R1GA6A1zeuQh+T+edtAiRaTsA7ERuWQMfipeVb6LVYIPnfU8TuHkJ+dC2dxDd+oJa12s
	MiF+XuBuVcKcX27Hs9MxspeLwnzMKSM6nZ/1V2K55sTAWCiSj0//BBa4l+/B0xBitCv1Xf/Iwtz
	UwXwqS5QimvxGyEu6oc+b+FuGIkOVQILcN4HayKGFpchYzFUmwqVtwe3FKjrMSR/iRdsnbnTtm4
	sf3wBjnP8qOq2uJtyi8fpDvh8CSk0HR+WfPNcdHPQWnxDI4rMvY03LRVWbC0sbOgVJ9qgVPtSmR
	kt01u5AvYA=
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr56471145e9.5.1790090988292;
        Tue, 22 Sep 2026 08:29:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde064b0asm1128295e9.3.2026.09.22.08.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:29:47 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:29:45 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, neelx@suse.com, sean@ashe.io,
	rishil1999@outlook.com, linux-kernel@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	john.ogness@linutronix.de
Subject: Re: [RFC PATCH] panic, printk, sys_info: Introduce
 crash_kexec_in_memory_sys_info
Message-ID: <arKe6WiDWKpv-_S3@pathway.suse.cz>
References: <20260916201546.661384-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916201546.661384-1-atomlin@atomlin.com>

Adding Guilherme and John into Cc.

On Wed 2026-09-16 16:15:46, Aaron Tomlin wrote:
> When investigating kernel panics, capturing post-mortem diagnostic
> telemetry (e.g. memory zone metrics, lock states, active timers, and
> blocked tasks) is vital for root-cause analysis.
>
> While crash_kexec_post_notifiers allows executing panic notifiers and
> sys_info() before jumping to the kdump kernel, it is frequently avoided
> in production environments due to the risk of watchdog timeouts induced
> by synchronous hardware console emission.

There seems to be various motivations to set/clear
crash_kexec_post_notifiers.

Guilherme wanted to add some filtering because some notifiers
were failing, see
see https://lore.kernel.org/all/20220108153451.195121-1-gpiccoli@igalia.com/

I believe that they are called after kdump by default because
the information provided by them is included in the dump.
This idea is supported by the commit f06e5153f4ae2e2f3
("kernel/panic.c: add "crash_kexec_post_notifiers" option
for kdump after panic_notifers").

On the other hand, crash_kexec_post_notifiers is explicitely when
the kernel is running on some hypervisors because the hypervisors
need to get notified about the panic() before crash dump.

All I want to say is that the situation around
crash_kexec_post_notifiers is much more complicated. And I hear
about the watchdog timeouts in this context for the first time.

> To resolve this dilemma, introduce the crash_kexec_in_memory_sys_info
> boot parameter. When enabled, it captures diagnostic telemetry directly
> into the printk ring buffer entirely in RAM before jumping to
> __crash_kexec(), completing in milliseconds rather than tens of seconds.
> 
> To make this safe, fast, and reliable without risking buffer overflow:
>     1.  Scoped console flush suppression
> 
>         Provide printk_suppress_console_flush(bool) to clear the console
>         flush mask in printk_get_console_flush_type(). Messages written
>         via vprintk_store() remain in the printk ring buffer in memory
>         and avoid synchronous hardware console emission and waking
>         kthreads.

This might help when the claim about watchdog reports is true.
I am not sure about it. Anyway, there are other ways how to
prevent watchdogs stepping in (touching them, disabling them, ...)

The console output is important when the crashdump fails.

>      2. Scoped ring buffer tail freezing
> 
>         Introduce printk_freeze_tail(bool) in printk_ringbuffer. When
>         active, desc_push_tail() and data_push_tail() refuse to advance
>         the tail. If diagnostic logging exhausts available ring buffer
>         headroom, new records are safely dropped, guaranteeing that the
>         initial panic Oops, faulting registers, and primary stack trace
>         are never overwritten.

This is another questionable feature. The ring buffer would need to be
super big to hold all messages since the boot. IMHO, servers are
normally running hundreds of days and the log buffer gets rotated,
like the user space logs, ...


>     3.  Execution sequence reordering
> 
>         Reorder __sys_info() so compact, high-signal subsystems (e.g.
>         memory) are collected first, leaving high-volume dumps (all CPU
>         backtraces, full task lists, and ftrace) for last.

This might make sense. I am just afraid that it might be a personal
opinion and we might end up with an endless shuffling here.

My opinion:

IMHO, it does not make much sense to dump sys_info() before kdump
and block consoles. The information is lost when kdump fails.
The information can be extracted from the crashdump when
kdump succeeds.

Best Regards,
Petr

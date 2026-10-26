Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021120;
	b=4zUeM47K782gSUsh117uaVxK2nZb3gzYzoKT+Pqwq2W+rLclsXStNduOcGV2U/q3xU73
	 PkHNOL3QU21Eg+UxggNI1T1pQLbaGRxDTMJRUIsBD4I74dr3Y9Q4SlcGytQRoBS8lB8p7
	 o4SjRd7zLwSeMdb+VZ4fZWdmJhCBPmYdbF3sC1na8bfDjNO363RUI5blGGtuvqAjgiELv
	 XPqOtL/91QetNP2H3Pv0Rj1L3axIU2gI9xrUuhrSMZRobkmnVOEswvWcrdE0aNA0djR/v
	 0NimfamwfLZ5+k5xO69pbFMXUpnkDZlesxSFhgmvPYPWTfFfWE6jt2Q1i7p49zGKssQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g7BPjwdQUuNpmHvOse2mCXwpXwEdTu7dWjfatxiVZq8=;
	b=fj44wWud/5VesSOE90SzEqnihMygKQt6y+A+6O2d3i/4719OcXlpSIOwzT9Pdi6RSdoz
	 psFt7erq2WjDSGoh0YFKRRGlMK5iXPl+4W7AwpYI4mmCPZA4bszA8czSttmQ1PDG4sucu
	 gi6CIrH1CrLr7x3IUDhfI0Stkq/XMRWvh7HdFejynlrKkMkhT/YGTum3tHKilQztQKQOu
	 QKxL7VYobK3XHhaWepDjTDkJyyZasUEWj+0kqP/alBY43X82Dupu5oAx4T4XE0sMUiriy
	 TU15qiOGOJNagBqHWcQoKzTvDkzYczxRbqxgn4WIZQ3KHnfP/UaI/Fn3bLFfOXCXASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LF9OHp0v;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AADD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AADD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LF9OHp0v
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1914543f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793021119; x=1793625919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7BPjwdQUuNpmHvOse2mCXwpXwEdTu7dWjfatxiVZq8=;
        b=LF9OHp0vDN0saiZPZWcdZLty6irByd0/+ApH7YGhIeAmf3M5SI7XrR+bMyNFjyHB9x
         Rm81Gtt/rS205XrxPKvBF9jCpAwlOvph9wQ/0UyYpXN29PtEmxb9c0qWJZBDGE1NI/R5
         eyH3+2hNW2FuJBgB9H+wh4QGhuRQ/zT+AyQrCKAAD9sFw2QaPGx4IncnFwzI07FWf3n2
         btEKplCd7lJmXVftS7YteUKRDvZHBISpD5ZaACLertVxHY7mrbKSUFDZWaoEaBdDbj4N
         bN+eUs9oby1VLL1gjz5+DGIfqLIf6n3ehYbfn9q3Hhh+UlYmbajUQoVcJGQjiza/3Ejo
         HBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021119; x=1793625919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7BPjwdQUuNpmHvOse2mCXwpXwEdTu7dWjfatxiVZq8=;
        b=OCFwz2+DMuoDvPhgzDn2EOB0uOL6ASw6dWhRdpUjj8oV7fF7UW540uUkG6yyLQhXKq
         kSprYAiuNhKvqLLI1Fe8XHeDeNPAjKsgpsuuiUbm+2sN6nVcVpVWEPPY4ATDEZ98+BXw
         ToIrqFUKDMz3M/qRh9kkoT2oPf9mMxmHeXVkjbLaX16R7HxgdY0tKMuQvgsekDaHEv1r
         P5W57EgYjAalxaH4bRaOtElNkazdSSCLAxKZQ1Jg7XyLbCosfrR2KaoCTfNzEDXl1sWp
         qm/jvP9aVD9man0IizhNDPoppqNZfcx+MM+7mwGYsiS5EQvXDbYOhtRWSW9sfeTejaO7
         SIlw==
X-Forwarded-Encrypted: i=1; AKwUvBxsq6qx624SR+YR6sYX/XHBed/WTwW4CKZ6AwsZzdPJyxa6JtwMWMlP1fS/4/HfWROrUYfXhlKC/vRMIMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/pEbHdWa/z0f564zojRBBe59Hp2FU2NMEJAGcN4LhENLRUcDf
	0nMzE97UBaZaPfiMovmCyxCiwUBbD8Y3BOGBlQG8boV18VcGy/D6wbPHnNAYUNVklbo=
X-Gm-Gg: AYBFou1MtiZNPbw9/T1j1GgIgm0azprxQvQzwZN9HpGDDjaskfZGWTrKGhDwgCXqkIQ
	tmyAKOxsWMjzZy4h9ReRHLkOdfl6TxMhtunvvzBrPgs/ImP8ipSKlQkRojVDxS0TK7OxDDfY7Iq
	hl0eR0suRfZgTA1G9CccpMB1CdfzC9vDP0qVDeIXePiGKjmOdd9YXXa1ZnSmZ9Alr4S7jQKlgNR
	JGOB7ZmfJva68WiZqWwt8kRQioq6rbwU+BkFi0YoStT7Z32M/Qv9PgW1Khrl6o1UKXKA7fikO91
	1zkeiu5GbQcwz4Lz8NkvbIDmTjT7+TBMWt9zjhNbUhuFu2gJhZvkcnnXODC1fQagQntAD75LKcY
	abOdJOavAez2KrgB8HJ6ZbQfO42RZ0O1ODWam5mBuCfcFfGEqWhbAbc0oILGeSiisdUduKrM1R6
	ltN0BdsFsT13I15zSpo1bJM16+nOzRa4A6pIsdSibaHI4ayAErOnNFkCHqvqX4ULfQw7ar4aaaQ
	8J5i4SnyxP4+vyzaiJP8q6l47tSKYlpspW4NCpSB/hYIq3mBM51kVaMhA==
X-Received: by 2002:a5d:64eb:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-48e3ed37174mr13935861f8f.18.1793021118626;
        Mon, 26 Oct 2026 06:25:18 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm16468655f8f.14.2026.10.26.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:25:17 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:25:15 +0100
From: Petr Mladek <pmladek@suse.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] panic: zero the dynamically allocated taint buffer
Message-ID: <at9Uu4hCYPhZTT4P@pathway.suse.cz>
References: <20261024020153.830459-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261024020153.830459-1-nickolai@csail.mit.edu>

On Fri 2026-10-23 22:01:52, Nickolai Zeldovich wrote:
> A %s read of print_tainted()'s string can run past the end of the taint
> buffer while another CPU rebuilds a longer string in it, reading slab
> memory out of bounds into the kernel log (a KASAN slab-out-of-bounds
> report at taint_buf + size). A warning or an unhandled-signal dump on
> another CPU reaches print_tainted() through dump_stack_print_info().
> 
> alloc_taint_buf() sizes the buffer for the longest taint string and
> allocates it with kmalloc(), so the bytes past that string are never
> written and the object holds no permanent NUL terminator. _print_tainted()
> rebuilds the string in place without locking and writes the terminator
> last, so a reader that overtakes a writer extending the string past the
> previous high-water mark finds no terminator inside the object and walks
> off its end. print_tainted()'s kernel-doc promises the string is "always
> NULL terminated", a guarantee the previous zero-filled static buffer kept.
> 
> Allocate the buffer with kzalloc() so its trailing bytes stay NUL and
> every reader stops inside the object.
> 
> Reproduced on QEMU riscv64 under KASAN by growing the taint set while
> processes took unhandled-signal dumps on several CPUs: the unpatched
> kernel reports a slab-out-of-bounds read at taint_buf + size, the patched
> one is clean.
> 
> Fixes: a9dff0d0d11c ("kernel/panic: allocate taint string buffer dynamically")
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     This is a race on the shared taint_buf: the fix removes the memory-safety
>     consequence (a buffer with no terminator inside it), but two concurrent
>     callers can still garble each other's "Tainted:" string. That is accepted
>     behaviour -- print_tainted()'s kernel-doc already says the string is
>     overwritten by the next call.

Great catch and explanation.

The taint flags are only added and never cleared so the printed
string might only grow. The racy printing is acceptable. The last
backtrace should show the full string.

The racy string manipulations are not safe when the shared buffer is not zeroed
at the beginning. The use of kzalloc() seems to be the right fix.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

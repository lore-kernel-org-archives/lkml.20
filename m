Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330420;
	b=bNWicCihPFyenPF+Ry6gmcSkTyUtLYh2N6k/Q9Rv160m5yhyku1FCajjhOj7lYXC9z/+
	 fl1hPZZ4jYDi2hd0v4d4qY5OF76zVP3FteOvQDQXdpmBmt0a+aW9yFi0TKXAk5F2DD32d
	 8YS3kU7fzj2gT/qdUbxkpJHmC8JtLsLHrDWov86J/MOQgauU0Ld1LrPqJOPWlZfibNPxz
	 wjysQcnpJFzIVzhrdEF5k+G5LP6W5k89Tv4scBmeZcbwYNgTvQtbFwgnpCrdBmMensTq9
	 VYL+KCGQacnSVHB5atkbU2Nu1ihgjCNGSpVW28BkNO+1vgWZUq5rSrCcuesUtAdlanA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rkFto3jsu24UNspAu8ukWf6eKe87/3a2PjFJlbS4SBA=;
	b=Qum67ZRQ967xAkyUMsdYkyHAUJSVgc0hUmPktVleCht3gbLzt4AWxCDUmCeFxc19aFcU
	 KWyTFA0DrTp1MBDvO0idyGhmL5mBYDY4dF+zNJZnKn6yR356/Kx0/3e8sFTO7QJvluVm5
	 TpA5rUU1gcH4ZLR15bS5dF5E2C6ITgg3xpBuhRTuiK+Uxjwe7XwNQScLfsu02aOxhuUmg
	 2zjPLSTaFWdMhqqO/jroRUgs2o8eJvlSYH6Z/ukIoixoEzXG/ihF7xavEAGeM8nlSurMZ
	 BGAmpJRmNMWW6a4I5cR9IrJbo9udL6hGg52bblOICxAX+4RlrTr/7pwT11rqG8gibjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAf+HIkO;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAf+HIkO
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16795595e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330418; x=1794935218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkFto3jsu24UNspAu8ukWf6eKe87/3a2PjFJlbS4SBA=;
        b=HAf+HIkOmDr5RpykzTtLvsO0AK1HH7evKevPeKyyOe0EXhGyq/VMe5iFJ7uyJomcYh
         QF+VLcmNeb/1X3U9ylF6XpGbWU6q733cRqFeXOL4//8jmMHuBl1I1cmZ/EI4ZIQT13yZ
         BoRGTVlzzP1wahHSna6mlMVnjhlMvgt7LIeTZCLRQz/tOTIVeynY2lr9SxnA0RMBxDRW
         cqKsMl5ZzW04LTeFSels4vTTb2Z9FVrif+JmN/tfLei0g7DmjkwdsmQmYXwsr/hY7Q39
         HKuqOvtV8ncpz2m0hHtK/xWrCztuZu7WrwUd1qvKrAQDcpT7iZSS5F/uRoBMu2OVjlaV
         c+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330418; x=1794935218;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkFto3jsu24UNspAu8ukWf6eKe87/3a2PjFJlbS4SBA=;
        b=c/Xx9QdhausOjDpqDY4YUvW1PyQl5Cx6d8dzcnxcq/Qj0cUa96rDa9IP8peb9+tE5d
         SxAbxK6fBwX2C32IhOLqpUuTl9cmpbc66y2JeQM7jhHlkCvuAQ6cQWSQcMcSeXCzOcs5
         FZaQpQGVxZG94hN7gcTC9EtC7luVeUgGOF4OVARi3Pa++1nMEtalv6WLEUr0L5EA7EJw
         ScDGfKlYo63rGObVXYRAacpfGjjQbEMyLyMHfC75SGbPfh51Q/RTvGza5xlKNFhvcJm6
         J4Z414TDQT1TbO2bcqUYkrqYekGq6vaww3cVdvhAkLKRmNk4sPVtJWioUJs61tsPa3OY
         co4Q==
X-Forwarded-Encrypted: i=1; AL+hErGneVPEb+ClirFdyoI+TmBqjs1n8VC/+DOKFsGs5l2x8fM/x6vLOO4Ha0RT5mwZoVjyHcvOLnTCg5+NKhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uc+dkyhlvP0nhnZRcXA9+UKt1eMqoJ2d24JmvKTcLtm1WmSZu
	DrAZPbk0SekSEgR6EzsT5WVlg3jrMeGbTNTaVQsVw49JxelaMKKV7Yc5
X-Gm-Gg: AYBFou2hL5h9RhhQHo/CtQ0UnmuOF5ZQlyZGdcsKMfgTSOxx9tSWk9HMZLwT1v50oxL
	MwFePP59sBFCIfw29KUZMX6BZAQra0N2cR59uzsaLF/O7QIcJmlJnYoutmorCsY8jPwDEHrlttD
	voiu/2iFuUHu/RQbbZF0obaJMXDC5Arl4pxlx+zQBRSd2esrheUNtWjsSI3ZWqq5KcycRreu1dq
	za/9P+DQKt6bdrMkzsjrJ9buzSMQDQ0C0pL5k3KL6u34ivky1WXvYOiDYGyA6X2FpEIswFSlr4P
	OHaIgbm8yLSA1iggB6DZ5yaikby/fDFs9bdQYl8jmCBlbb8zrj/XchuJvdUxw+Mko5F64SYHafi
	2XRapDk+jePwthQxU7hKNVZc2PgJABI7clXoLZCjaogGH4Ff4R0MjKfhIIu8BTc2gxpmkfjnjOQ
	vvwDPqjlAJnqLPqI9sapwzkbTXcvxvotOYg0ZsBd1Xr2ytXIis6BzH3NiFjD8gjZVPFkysPX/ZN
	sc9Lhh3pcxs/5fFWQ+V3zfC5bAodWlYPwxd4LQrmPj0VyXtC5HNoBsrp1+c+S0v29RmlhGbP3+J
	1CNlwa+DqXzZ0PqsiPj7TTh2Ad0Me6M0uQqRnGAcXZhOuxF5aMhRNtBnF0ZY18y7WA==
X-Received: by 2002:a05:600c:4e42:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ba02356af1mr58778345e9.29.1794330417851;
        Tue, 10 Nov 2026 09:06:57 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm77453625e9.2.2026.11.10.09.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:06:57 -0800 (PST)
Date: Tue, 10 Nov 2026 17:06:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, bp@alien8.de,
 dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, torvalds@linux-foundation.org,
 hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev,
 kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261110170655.35a7c439@pumpkin>
In-Reply-To: <avNEZ6Zz5IhN2Zao@thinkstation>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
	<avNEZ6Zz5IhN2Zao@thinkstation>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 16:25:54 +0000
Kiryl Shutsemau <kas@kernel.org> wrote:

> On Wed, Nov 04, 2026 at 02:28:06PM -0800, Usama Arif wrote:
> > +#ifdef CONFIG_MITIGATION_ITS
> > +	/*
> > +	 * Returns are patched before alternatives. Align the replacement
> > +	 * source so its return is in the first half of a cache line and ITS
> > +	 * retains its thunk. The copied return can then execute in either
> > +	 * half of a cache line.
> > +	 */
> > +	.pushsection .altinstr_replacement, "ax"
> > +	.balign 64
> > +	.popsection
> > +#endif
> > +	ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> > +		    __stringify(rep movsb; RET), X86_FEATURE_FSRM  
> 
> Does this mean any RET in a replacement needs the same alignment? Would
> anything catch it if the next one doesn't have it?

My suspicion is that ideally 'yes'.
But someone said (in this thread) that it is worse for RET in the first
half a cache line - so aligning the replacement that way is better.)

> Linus' layout keeps the RET out of the replacement, with no padding:
> 
> 	movq %rdi, %rax
> 	movq %rdx, %rcx
> 	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> 	RET
> 
> Non-FSRM takes the same jump it takes today. Does that avoid the ITS
> problem? Why not this layout?

It adds a jump to the non-FSRM path.
Cold cache that is likely to be measurable.
(But not if RET ends up being anything other than 0xc3 -  that will
just kill everything.)

> 
> > +	/*
> > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > +	 * The 10-byte alternative fits a NOP without ERMS.
> > +	 */
> > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS  
> 
> The RCX/RDX swap is most of the diff, and all it saves is one MOV on
> copies of 2K and up.

Register-register moves don't cost much (they can even be done my the
register renaming logic rather than the alu - but still have to be
fetched and decoded), but needing them is a bit of 'lack of attention
detail' when a simple backtrack can get the value where it is needed.
gcc is very bad at it, a compiler really ought to do a lot better.

David

> 
> What about something like this? Untested.
> 
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -31,11 +31,9 @@
>   * which the compiler could/should do much better anyway.
>   */
>  SYM_TYPED_FUNC_START(__memcpy)
> -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> -
>  	movq %rdi, %rax
>  	movq %rdx, %rcx
> -	rep movsb
> +	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
>  	RET
>  SYM_FUNC_END(__memcpy)
>  EXPORT_SYMBOL(__memcpy)
> @@ -45,11 +43,11 @@ SYM_PIC_ALIAS(memcpy)
>  EXPORT_SYMBOL(memcpy)
> 
>  SYM_FUNC_START_LOCAL(memcpy_orig)
> -	movq %rdi, %rax
> -
>  	cmpq $0x20, %rdx
>  	jb .Lhandle_tail
> 
> +	ALTERNATIVE "", __stringify(shrq $11, %rcx; jnz .Lerms), X86_FEATURE_ERMS
> +
>  	/*
>  	 * We check whether memory false dependence could occur,
>  	 * then jump to corresponding copy mode.
> @@ -169,5 +167,10 @@ SYM_FUNC_START_LOCAL(memcpy_orig)
> 
>  .Lend:
>  	RET
> +
> +.Lerms:
> +	movq %rdx, %rcx
> +	rep movsb
> +	RET
>  SYM_FUNC_END(memcpy_orig)
> 
> If you keep the swap, please make it a separate patch with no functional
> change.
> 


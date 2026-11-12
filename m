Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476253;
	b=Kl82ntBmcg+WB4yXat6puBjWTiafcE9rAOg4UBqPMPaNLMJQg3Dz6o5l2zA2XlvtJu3y
	 mBa5C0D2hI8JEfyAAqL3xcRtIx8U4n2qN4YiB9pkrTnv9Xj3feDcFhw3nUNOU73wnYTln
	 d+dRfeleZAfeJZbsrBEQLm8z+zHYCogoqTP5CHeUPAuNOlJRKPDt97VF8xQh2PufZjyZz
	 xe6HW9axN7DaO3pZmicjtPsUQZdsBYNyJYBJUQHUy2pNAznuNxYavbIeyq9lx0MTRL1XM
	 tG/0hz1XPsckBWfY72HN+N99Fa+vuPGQAciLO0y8N4ANU6pdpDm3CMjs3JLvayWnWJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1IW9KyipSWLPAEu5xb5QpLIQLFWXd1BmUfUPzKRDpdU=;
	b=LMI3QnBabR68BRRmhKcF+X5OiWe9uOUU43qZxZ1WOAlJrc1nv5qzsO2He8afnFD+GN6S
	 qp3SXXVFmlF7tPDQkdBWWDTbLxevp/RgqVEIyWx4h4FpAUSmfGXtm6APshB+Wq2YwQ2JO
	 SEb8O1+YFg6wG8Hctec4OuTdMScKLPJv8haC7BTtaShOyYUMx3WViblJtvKLYQm2sD6S2
	 sHTozELDM/ZRKgn4konLz4ELef0Hrfpobqxe86gE0nbnoWnPCSIlyMBd2ckzS2vttS6Xn
	 eE64KRJuOrRyrDGe79DO2H3Q4/9c14iT852S1OAGJSd0Cv4/cWbP1yRFH1QAJoufW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJLyYvNu;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJLyYvNu
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so38718545e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794476252; x=1795081052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1IW9KyipSWLPAEu5xb5QpLIQLFWXd1BmUfUPzKRDpdU=;
        b=vJLyYvNuaETUPKH0F2yxMu4eoX69HjFbmZevDfwnULaz6SdWvln1Jd+F3sdSSqxRKc
         qKf/NgoYX5KdGngKfSknINNgCKJOsE2UkTKj3X4i6Bn2UK/AaI2lV4SVjLjc52Xx5t9w
         Qwulg6liOTWuJ3ieYoZFr5tEi6uUFqJe4x8+QBh37aXdZG1mVCGKI9cbHjCqyaXdYJ1W
         7ZnywccXPpgYWEumiL+SwCb054ialjucq+5xGZV1T/6GkRHyz1ZpKrS1wUNEDc5CUFkK
         JFhZa311s4n9fPqbGnfDSnTbhzLoqEiHVhiIUma6UTbSaN7DQviUvzvk9cwdGPGpW+5B
         GHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476252; x=1795081052;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IW9KyipSWLPAEu5xb5QpLIQLFWXd1BmUfUPzKRDpdU=;
        b=1krMI3bgnXFAfhqsnp6tiH2txO1tSKDNdc/Zl7sIaEkflTuKXrUnC91Qm9kzN2E5Qi
         62ismTx9okSOMYupdGIkb0mjpp+rQ4T09Ez+Jj2RyQn5OQR2HFfJEy7nd0LjC7bGmp3W
         22S+e41N2JX1EWm7bSViQW4GA5QGSlg6zcGIpgMztHmTxWQbKRFfKnzL0TlOecJJIEo4
         liOFNpWOFFzScpPtiN039YXdUKoidNZCrMpJi/XuXzMglqoKy2/5btHZdtVjsaP21B1p
         Zq0NSoivsflFgiIHi76MvIT0diDqsyuFRLTuhE5iKjFMymfjTPhjkH9JcgdMcVTrHXNf
         3ZjA==
X-Forwarded-Encrypted: i=1; AL+hErHprST7yvTSAtIS/oYN8zoIZTV5oEoKTlSYEha5HqeLy/zHUPm23YFLwmyKA5sgq6xFfYL0AOcmlSm6ufo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/26zbkWwvmnmHzvavVJb/pLQhm4uORxsEmYD2lKMCHJ2Db7jbn
	eWiHAdx/AuHdQdODRrdRPgm8CC48BuFtguIB6wnlhrAeh/pZ6dic3/s3
X-Gm-Gg: AYBFou080IV9LwNriKXGdQLUG6f7DLCXdsrnsqU3pFfh39WECTeXi52Es+W1yBld6KV
	/bjOzgn9T1hMFYnBsx1W8N3SjXkJ9hyLKbkabaPgd3aR4FdBAtTDebXC6OvkrnzttsECeSbh7Uk
	FHs8T1YNuw20hRjOhvA5f+MMZZQMMAzPqxhdfs5oiDUqyUG9xzBi8kXZS2SO52tCZ74LbTrJsfI
	zF2+1q6XNBJcFH12Hal7/x0f4NZwUYf4upp5s5HTZPklsGjFANQVbnK+qQhdldctTZGz7jUert8
	fq7samK83IaJZkAgLJjICbOw35VXqohVTJIgIdOQlxTZ7wvleUxJWWDl0aIZgf7WVVrhLHH4UqT
	0OM/uW7gqOmV31O1qNW/cb/SesHA8gYxwB7VKrD7A0BFNN3tUL/yGSOh1c+taNeSdRMq7kIztbm
	A7zCr+/QQwxseJ6mrfPKv2vRQA3PpuwKLpsbCH6xLOmNqOHnj8WP9I4x5bbRmxWrjI6Vdm7KhcH
	pZYbMmuPufZDK1ZlKq1NJaAr9sdZX1C1fOTvWdpM13v9KNBpnhRJKPkuAqa1a0onfSYnmzENAh9
	jT5c82TDHYFERo3oIYnoswLOpV6af/wK0+M5hR6Z7fjBFyhOAUFXSYU5dC5b12bXGA==
X-Received: by 2002:a05:600c:8707:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ba091aa248mr93355435e9.0.1794476251437;
        Thu, 12 Nov 2026 01:37:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm53011905e9.11.2026.11.12.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:37:31 -0800 (PST)
Date: Thu, 12 Nov 2026 09:37:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Usama Arif <usama.arif@linux.dev>, dave.hansen@linux.intel.com,
 dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
 torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on
 ERMS CPUs without FSRM
Message-ID: <20261112093729.065afd6c@pumpkin>
In-Reply-To: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
References: <20261111132214.2979125-1-usama.arif@linux.dev>
	<20261111132214.2979125-3-usama.arif@linux.dev>
	<20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
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

On Wed, 11 Nov 2026 15:46:08 -0800
Borislav Petkov <bp@alien8.de> wrote:

> On Wed, Nov 11, 2026 at 05:20:53AM -0800, Usama Arif wrote:
> > diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> > index 7bb146c811029..5320862e0274e 100644
> > --- a/arch/x86/lib/memcpy_64.S
> > +++ b/arch/x86/lib/memcpy_64.S
> > @@ -27,15 +27,13 @@
> >   *
> >   * The 'rep movsb' itself is small enough to replace the call, but the
> >   * two register moves blow up the code. And one of them is "needed"
> > - * only for the return value that is the same as the source input,
> > + * only for the return value that is the same as the destination input,
> >   * which the compiler could/should do much better anyway.
> >   */
> >  SYM_TYPED_FUNC_START(__memcpy)
> > -	ALTERNATIVE "jmp memcpy_orig", "", X86_FEATURE_FSRM
> > -
> >  	movq %rdi, %rax
> >  	movq %rdx, %rcx
> > -	rep movsb
> > +	ALTERNATIVE "jmp memcpy_orig", "rep movsb", X86_FEATURE_FSRM
> >  	RET
> >  SYM_FUNC_END(__memcpy)
> >  EXPORT_SYMBOL(__memcpy)
> > @@ -45,12 +43,16 @@ SYM_PIC_ALIAS(memcpy)
> >  EXPORT_SYMBOL(memcpy)
> >  
> >  SYM_FUNC_START_LOCAL(memcpy_orig)
> > -	movq %rdi, %rax
> > -	movq %rdx, %rcx
> > -
> >  	cmpq $0x20, %rcx
> >  	jb .Lhandle_tail
> >  
> > +	/*
> > +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> > +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> > +	 * The 10-byte alternative fits a NOP without ERMS.
> > +	 */
> > +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS  
> 
> Sorry, this is adding more JMPs in "conditional" alternatives code and thus
> turns this into a bigger and unmaintainable mess than it already is.
> 
> The 2K limit looks like something conjured out of a thin air as it seems it
> work for your particular case. I'm sure we will have to whack it in the future
> because someone else will complain of the opposite.
> 
> This needs to be done with alternative_call*, even at the price of some
> duplicated code but without turning what already is a mess, into a bigger one.

Multiple functions seems like a good idea.

In some cases you can patch the constant in the instruction.
That is safe here even if a multi-byte constant crosses a cache line
because it is only an optimisation.

Patching the call sites would certainly be cleaner.
More interesting would be having a function with a non-standard calling
convention (%rdi, %rsi, %rcx, everything else preserved, void result)
so that the 5 byte call can be patched with "rep movsb; nop3".
I can't see anywhere that uses the result.
Maybe start with "rep movsb; nop3" and patch with the call?
You'd still need a normal memcpy() for the calls gcc makes and if the
address is taken.

A special function to do the patching would also make sense.
All Intel non-atom cpu since sandy bridge run 'rep movsb' as fast
as 'rep movsq' - so you only need to worry about short copies.
Whereas some of the older Zen cpu run misaligned copies slowly.
So you could pick/patch the most appropriate code using more complex
logic than just whether one of the X86_FEATURE_xxx bits is set.

The same calling convention might make sense for memmove().
Although it probably wants a scratch register for the (dst - src < len)
check (it might want dst in the scratch register!).

David

> 
> Or a static key or even with stop_machine_nmi() (currently in review) which
> patches the kernel even later, when it is convenient to do so.
> 
> Whatever it takes to keep this code readable and sane.
> 
> But not this.
> 
> Sorry.
> 


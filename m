Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440808;
	b=2c/WHUU7xvVG9yWV/aAI9hiX8dVIarJigNrz42cnhVsgtcj4NNZ/a8PsyaJwVxpGdhvA
	 sMUVtEHULVoohtXZ0KB/Mk3gnY51oxZNGYiZFIqGGTW3+lGXCixEHnv4v03UR812U6lIZ
	 lXguAdXSTFQdxm2WyiQp0Wz9neQt1OVu+YjkHgGddwvIbEB/ZFJ5rWhx4l0XePWKNUnu6
	 opi2jjE4wS31sfnic83boGUFKhvhUBesvyKLOrwmNJ7pTWHSoArc9lNRfPLlo+uUB2klK
	 cHvUVeNqjnOuDhul2MYamGY4hBOJQYKkyi6kAFbwhlltpxLCiWzYoQ5cSHeereeldaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440808;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8AZdaQqyQXPs5g0zywn6Yjq6k1JFMUQHaphCD5EDm/o=;
	b=mt3hAnOq6bJmBDIJNWjw09E4J5IHmzQlwpDZNvNycBAW4lGOntx/xPs0jMOXXSr2JEyi
	 01BYvZTRfLwnYhRycptLSjuWc4v7WYx+hV2v0IXHFB2QeT7FJUr8JqBsNo4G5GFm5zIwp
	 4Zis8zmbUwelPg25PhTNrAlfn3+/SGFAQb1ObRSlsuXiDrwQS8U8U7sHUCpJTyYFRStPW
	 ftPpr5ti9XjxAwVtJLZlRCrt3mR4Fj/XCpmPEBOe6elrfzAfKKIUeIwoQbuBlRSzYjM5G
	 JvsTIvUnjy/yWZz1EUxNAHjs6MTvDoKdnv7b6gnRhiHqoXd2NhQUFRX12wiB3NtX3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Nim5WA3o;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Nim5WA3o
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 531C140E021B;
	Wed, 11 Nov 2026 23:46:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id voosb1uhMyQJ; Wed, 11 Nov 2026 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794440801; bh=8AZdaQqyQXPs5g0zywn6Yjq6k1JFMUQHaphCD5EDm/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nim5WA3o6dpIUXLZ4zkdIqoBMXYvHYNRlKVIdfR+w+yBlO8CZQMAZWcPnIgjsKp9B
	 h3Yz449/YvKp8QWQmbJ+/7vG3xz+9cubgouUmCWNerwIqJVd2I1/0ESI9ZkPdJcdkg
	 7ohk7mdfZN77yeP+u11vkslOMKbZy+jnEChbkIHHP5No6NughMw/1Zh38sCVGB0PcE
	 USgleSFIW2UF97kWbprRHgYT8JGZ86C1qeAXetukveWm8jkBoER2iz8sVKeuHw5Wmb
	 9XbUi+jYv/zi2apKlgfIpZVtzPKlciOhiysi6cNHk5k2+KM6Doxi2rS0HO1zUzvCSE
	 YeaPc+IWuHaeT+24FdZnOIDC8Ja95cgRykoP+4MHX+F2QYBkEmPv3Wz9zJUecBOga/
	 PXSVd232C+rxiEtXiMdJIDIVDtJ/cLc6QNSigZvPYVl6jDPpC+Ytuqwu0aZ2FRyGzQ
	 dos1HicHgsrPIu6J4n9HMFbjPk9YFiFJLnfOHDMinkuD7RExEDpqsYPGP1NX9p4k1+
	 wVK0OrWzi1pvt9+NsR5gOs9FZ6bbXHlKtfoByIekqbsGLB3h/bHQTxnH6HNvpl8Pd1
	 ZsfSyxycs5bwTzYhJyuz61cX/rMRn2NzVFCmbUItT2r11mNCu6F8k2HXTxsXegb4W5
	 4Xhpp379+UgkKdfwvvEQVnVM=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5675E40E0218;
	Wed, 11 Nov 2026 23:46:24 +0000 (UTC)
Date: Wed, 11 Nov 2026 15:46:08 -0800
From: Borislav Petkov <bp@alien8.de>
To: Usama Arif <usama.arif@linux.dev>
Cc: david.laight.linux@gmail.com, dave.hansen@linux.intel.com,
	dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org,
	torvalds@linux-foundation.org, kas@kernel.org, hannes@cmpxchg.org,
	riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v3 2/2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261111234608.GAavT-QFRo6EtvoL0y@fat_crate.local>
References: <20261111132214.2979125-1-usama.arif@linux.dev>
 <20261111132214.2979125-3-usama.arif@linux.dev>
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
In-Reply-To: <20261111132214.2979125-3-usama.arif@linux.dev>

On Wed, Nov 11, 2026 at 05:20:53AM -0800, Usama Arif wrote:
> diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
> index 7bb146c811029..5320862e0274e 100644
> --- a/arch/x86/lib/memcpy_64.S
> +++ b/arch/x86/lib/memcpy_64.S
> @@ -27,15 +27,13 @@
>   *
>   * The 'rep movsb' itself is small enough to replace the call, but the
>   * two register moves blow up the code. And one of them is "needed"
> - * only for the return value that is the same as the source input,
> + * only for the return value that is the same as the destination input,
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
> @@ -45,12 +43,16 @@ SYM_PIC_ALIAS(memcpy)
>  EXPORT_SYMBOL(memcpy)
>  
>  SYM_FUNC_START_LOCAL(memcpy_orig)
> -	movq %rdi, %rax
> -	movq %rdx, %rcx
> -
>  	cmpq $0x20, %rcx
>  	jb .Lhandle_tail
>  
> +	/*
> +	 * RCX holds the count for REP MOVSB and scalar copying; RDX is scratch.
> +	 * Shift RDX to check length >= 2048 without destroying the REP count.
> +	 * The 10-byte alternative fits a NOP without ERMS.
> +	 */
> +	ALTERNATIVE "", __stringify(shrq $11, %rdx; jnz .Lerms), X86_FEATURE_ERMS

Sorry, this is adding more JMPs in "conditional" alternatives code and thus
turns this into a bigger and unmaintainable mess than it already is.

The 2K limit looks like something conjured out of a thin air as it seems it
work for your particular case. I'm sure we will have to whack it in the future
because someone else will complain of the opposite.

This needs to be done with alternative_call*, even at the price of some
duplicated code but without turning what already is a mess, into a bigger one.

Or a static key or even with stop_machine_nmi() (currently in review) which
patches the kernel even later, when it is convenient to do so.

Whatever it takes to keep this code readable and sane.

But not this.

Sorry.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

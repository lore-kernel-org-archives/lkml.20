Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778046;
	b=LxyjvlBvYoxGAzBY2XxL8y8qy2Xs9YVkpzU92h1hFmpI9oFcTkrP6qRyih08O1czgP8b
	 +XYtVAJmYrfw8g3mu58ggEEyoWkZJvQyXyrGAQQ/av7pgBCqfv2z3IIyDD2kq3KJk8DJS
	 D/p0+axlQ+EoCt99dVOyYjsvkWkaXYcF+G88F/YDPGXc4h6mCLIMEmznc3kW5zeq7hydg
	 p/Kes+dgD0mfhgNxx9tEK3GulmN/ZYhYTtfPRiyGFUVJ+MUVHyiQehC2lUmWdVROT0MtM
	 7g9p4aiAZjUobIj4ilnLUhNUG5AKLhjBgEwk2jTjD8ljLB1cEfr5wlUpiOe5irogg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778046;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=jdkx1jkWgH2UKTead65t6S1xgvf3aXx5Pam6zn2Qcds=;
	b=xipiCUIfd1jIE7lfeXN1ZU8nMBxEYHhbdKlxXWnx+YyCviyW3WeopnN/kn2AqNzJNs2h
	 al3ROqqDRD8fY+ubZi76eqyFggigGXqhtgXuhyT5j6B/L9P78pUKL8OfQiJ2+AtJByroN
	 mktdcIkfeQcCkbwnOZVdSd6nttWmC1T3FCOCuN6MaAd0+mDAqZBf8evCq9jNG+3Zr1JEB
	 ZXQcdy3CcXnudinZc0coMIL9WwOFulFhN8eU/tJjUXXeMf76UsL8J/2NHjvC8Sp05PUrj
	 mkHl4Iiq1LJ3VwjR4jFANoMOEhc2UAo4aIB9IfOujHoaZ4X0GupjRkhd76HHo/LND+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="dIJPBt/7";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LFF26dGc;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2656606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2656606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dIJPBt/7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LFF26dGc
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D4EF1140010C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:40:44 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 02:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793778043;
	 x=1793864443; bh=jdkx1jkWgH2UKTead65t6S1xgvf3aXx5Pam6zn2Qcds=; b=
	dIJPBt/7j8f74KC8/4cLcqbGWejqqTHbBvnq4/tkEuCt7o/Qiz6s+z1+4FDQGXod
	RAQjw0n8RjPS/fXdRcJMxEz6uEx6J/dM1z72i63dH0fYFOrp+EpK0b577yw1fdYn
	WTrYxyUsd6wdMPCmgco0vX/wl7lc2++MhsN2waVnJTEguvkLKr7rMh5gZCHk4Sec
	IqpqrKtjlR7N8a/h/4dTCXuk2mD+Ab5KZ4oZqAySgjqbmLsn4vB26KWa5Nj7pCJd
	keiBgm/eSubYAy/QfqRmC+eu3+Z/hWXolNzKjkBd7uMU0uWCU4OFn+0VzWIRRZol
	I9TtbEgcbEZnH7pvxirAxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793778043; x=
	1793864443; bh=jdkx1jkWgH2UKTead65t6S1xgvf3aXx5Pam6zn2Qcds=; b=L
	FF26dGcW7egzKPlx7Imrvif8PACTJ7VG8LM6Htb7/CXmTb6l/8UbNw6E6YiTILbM
	A16Z/BoUrsJkuxJw1XN6JWwS9obeqaU/gXgPqGmLlAeERPBbW1zaZJ/CMMXw2FXg
	HCLGaLSW+LK9nmfU7wua+w8YlPIGABIhYjePAlddkABDlmJ0RxCu9ViDVnigDuXz
	aP7Jpq7jhTUcOo3K+8DdJXbFePgu4nCVsjP0EeyDoKrvb6hNNkEttdHqPwvuRe3r
	G5dNiY1APBPYhLHUVGMGTJadQwi1QUPqcdBEjhb9WXlDM/aaujWLLYvEo0q/b5V5
	c+sws2ep7+2px6ws3Ak0g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793778043; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:WAoOvGJ11Ow2FNVS+0XLDBd3U01DySlcRsAe4xJyY4xhO+a
	YWP2sRI+fcaeYtfmIGAsh/AfUeLOuA+nMl4+QoD0Bu0BJIMZU783/cGMc4F4nItz
	pPlVLuWCrbctmadDwxCCjbQaewHQ7I4kntkpaBCWp+M2hbvKNNv5MssSvD1hyxcv
	+CSML3zR0dW+nwO4X0/CluldBeOfLeQrvqt7f/YbnlHOIRRCk1cy6jFlVceLV4DO
	zHRCoLHxlheTY6ilQZWJt7WFhuAuT1DUhI/KN8Ei8Q2VnB5MzUx2FjqHlbwSQuzs
	3Sb2y3YXgb/jN6o5aXgtE5I8olqMnvr2TuIGECw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BHCyfsEGgeB6KE/p7k2Lzxtudau9dPthb4f5ddUkBqg=:sFKbGl7M+bmc6GP2/YZhSxV5JsfWAqh3vfY6lKIjxME=;
X-ME-Sender: <xms:eOHqaoXOGtAOJsvTMTzC0E2zfVwcGHJtDlWLsYuMTZjVvTWsJSYfrw>
    <xme:eOHqanZAIEUvVSAZA2oMzHxzcOTuzGT8IF4oMpnW-Ug4WpxTmkCmdxK7qe0xCVE4J
    0Oy3vKVbWG3kP3ngLT0nWFm6O82nY_2PAeqhIu2mg6gf6alIqAymMk>
X-ME-Proxy-Cause: dmFkZTGFdExFfau+0t646T9zM/MAKUgZ7uWeewKlQBMdWAx1tBWSsutEr3o9tFN5Kl3CNO
    UlE7joIk1WLEPl5HMSkQ920hqV6tDHkUDBC7dvxiEiDhmsmbrTNqEZduWj2CkAVTq1k3Tc
    DuNxyW0S9kP1QS/aZ6U4eP2KuABXH4A7bYYRl9+uitHMFNG/J/DQiOdSENb8fKMPCTLb05
    eXqeNOifiq+hfeTTa30HgAuoZ4Suzp0ycxaatMn9fg3kF/mo0P4YcE3s6cJ0D3Ewb1nwaE
    RBfLDsKw2hP0mL+mklIgUqcK3OMqbe5xag8EgEP/KpcxLaxmt3KDtmJQBown5o7idSPiZg
    RtSaYeJG1b4Rpc66VlXpDtfImOBPw8R/yIsixXrlr/P2sMjpAP0QguXePwi3W3izBF9GZF
    rfuT7XfiAYl6CsKMwvifVSnCUVdhmeCLuapSxhyu2/i3BnsOTya9b0W0Qw6m6EKo6HpBqe
    i5JZsUAP2y1L4Bl+43ZI6zJj8ibb4KZoVCBmWGR2MnB9h95WMFVK/33SZ4zxiktFqWes2I
    vhE9biwoYBiNGlgX8PS+BuHQpBbtFSjA7qa0PyXARAajStrvr0OkF2NfK5QJQ0mW5hUq5i
    dTnenav3so5asH6hxOsart5TDPRb5GSfhuXLymdWCGzn5FZSABZ4Y7D7Wzng
X-ME-Proxy: <xmx:eeHqan4s4IhfPOCVnLN58KwuRzj5P5pjVW8E8Z8vtRS3xty1vI_zCw>
    <xmx:eeHqatCmJQLDLY9SFWzdfaqoQaMBVDQbYtH1Qr4F_fvr27ALutwSaw>
    <xmx:eeHqambweVNtC9qydigArcvefnsFCv4JldmPRt3VvOgX0YAUCX6UGg>
    <xmx:eeHqagbAHY52aDMqID7Uzm51YUZu_uvx1tTkwWsvol90Gyk0LloNyA>
    <xmx:e-HqatsZOxPZzy8FZwTJvCxo2KlrFkK2upd0tyRkHcpI2lf0LNLIVDPS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C7BD732A0093; Wed,  4 Nov 2026 02:40:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A0YankKnQQSw
Date: Wed, 04 Nov 2026 08:40:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <6534a171-9e74-4e69-bee2-3a499798cffa@app.fastmail.com>
In-Reply-To: <20261104043535.2039948-3-vgupta@kernel.org>
References: <20261104043535.2039948-1-vgupta@kernel.org>
 <20261104043535.2039948-3-vgupta@kernel.org>
Subject: Re: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 4, 2026, at 05:35, Vineet Gupta wrote:
> ARC MMIO accessors use inline asm, which isn't really needed. It was
> introduced with the original port back in 2013.
>
> As the previous patch showed, inline asm can be error-prone. Letting the
> compiler emit the accesses also allows 16-bit encodings, scaled-index
> loads and folding constant offsets (s9) into the access.
>
> Without the asm, ARC's __raw_{read,write}{b,w,l}(), *_relaxed(),
> {read,write}{b,w,l}() and io{read,write}{16,32}be() are the same as the
> asm-generic/io.h versions, so drop them and use the generic ones.

Hi Vineet,

In my experience, the generic helpers are also fragile, they just lead
to different problems when the compiler optimizes them in ways it
should not.

I would recommend keeping the __raw helpers with the workaround from
the first patch, possibly both variants depending on the compiler
version.

Using the generic higher level interfaces is a very welcome change
though, I hope we can eventually get to the point where every
architecture just needs to provide the __raw_*() ones.

> Two things stay ARC-specific:
>
> - The barriers, now hooked into the generic accessors through
>   __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
>   On ARCompact they were empty, relying on the asm "memory" clobber
>   as a compiler barrier, so make them barrier() explicitly.
>   The generic defaults would be mb(), i.e. the heavyweight SYNC.
>   The *_relaxed() accessors only need ordering against other MMIO
>   accesses, which volatile guarantees.

Sounds good.

> - The {read,write}s{b,w,l}() string helpers, which, unlike the generic
>   ones, cope with an unaligned memory buffer. They are defined before
>   asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
>   so they do the volatile access directly rather than via __raw_*().

I don't think we want a custom version here. Do you know the reason this
tries to handle unaligned buffers? If there are drivers that require it,
we can change the generic implementation to be more like the arc version,
otherwise this likely just causes larger object code for all users that
don't ever need unaligned access.

I see that the sparc version does the same thing, other ones without
unaligned access (in particular armv5 and riscv) assume that the
memory buffer is aligned. On alpha and parisc, there is an alignment
check for insl()/outsl() but not readsl()/writesl(). I suspect this
is not intentional.

If they do run into this problem, they will fix it up with a slow
fault handler on the unaligned memory access.

      Arnd

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755933;
	b=RA1CqbCB4TtU3qJ160rC6MYWkdwS9vFOH2kkTTgBbdpGn+sAM+5VCz/3qyvzWHIbqbSY
	 7RtwfZSuuPYVK4s7X/CC7s9W+0JkuNSXdsaaYvQ26Xsg4bX8o0b2C8Ly9DgU0KOQ3eDsp
	 M06hhsC87H1HKAK6oygZLwpP/JYpwEn5jbHDbSvcdPR6fQicInwnWcKAPVcBDmEyjyS7m
	 Y+YEKidy30uHXjGBUI6Z7dk0F1Jmg5bUlx4oKr5pZcLwXLuxMf8tdFyd9T41k8zGsFRk9
	 JxPFEE22Fx9kzx0zXF6MMsZoQcMx+xfNBHkN6BwCUB35iZmVB46nhHrqkUThkxyZtZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755933;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=;
	b=hdPkyzhHWDkM+8QkJj9fdd61q8Cd6wF3lyxXUwTOqiEdsv0pMBflh51gry9XHCUF6PBS
	 B8cyCGW0Fi/zOeiQ0ZJF8XSP9obtCD5EPMOYKnlJ2qkGX9W6rOVvwydM4yhnlNptftvNH
	 R4y+40LF3U++Oi/Je+2MK13HR9QyK3JFzxAT5+uiBGFIjWuaAY77nbQLM+WCC07eSpkGk
	 62i1cbBY0svM81KqWx077FNL9OG4hjQJ8AjQ9/TPhdWYTdeMBAPxCCY4HlY8Tj9e1oQck
	 6+1zMz2HARDq3O1zA0XrP1c+X8WbD2jg7T7zkuM2Oo143VN3puBtrL4FfsuWaV//0uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=X3fyl0AE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LN+XwsJg;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA3606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=X3fyl0AE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LN+XwsJg
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 819A47A0050
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:18:52 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 15 Nov 2026 10:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794755929;
	 x=1794842329; bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=; b=
	X3fyl0AEfeBvHFst5Q0V1UEsQeby1BM81HLqcTKPmAuriRvCkJtvXMNqjk3o21zv
	tRZTqOGdm041GVhK72a39b/+gfrMUE98uXp4FKhaSjZZV8oiFStFk3YJoUx30HFu
	emCd5JhI4WFKRIwA0vTUqrxqf7llJjPNxk8UNRXyPYXOGmwjzoGCK/AVELeqyA1T
	Mf3+GebDYnpJmA8POXM/TzFfW6cYecKlX9syieJT3Fc/T/Pfi/I/VHV1QIetjC/K
	ngKqz1MHdYO9Wot9lKt5+xBAcbRSb6bfwcUppMqESa6XU/J/ngZvm1xn67zg7zlH
	CqSBjwTZpNagioRE6sbHXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794755929; x=
	1794842329; bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=; b=L
	N+XwsJgSy6unJDUxVhbAN9jjR4ChGLpK09UWox0eeTi3aau0ZlGYyDgSYisfeo6H
	V0NpLW6Wt0EJ7sWWpm7PoXWnfTsm6X7EAaLlF2pdx6Hv6tBfS406PDbg7DqMSX9e
	pX20y1bpyPyRZEb+MLH/aF1FGcYJSvyuQMNb+5+S0ZXXSMhvoqIvLWjE7OI18ZOJ
	FXewkwQADJnGK1i8pVgotICZYo1BGU7w/2XVhokJKwC8EzlpkX+pzpVfrN5CrhEq
	aRem9s9O2dN16nywVapYeU0fUkXegPHJ6YXhVJ1yEfu9weCAN/BYB0d3rQtw37zH
	OqGoGoEgun05KfNlkXs2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794755929; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:IwaZYG+qMpODE/j+/NhCHdCFMdF/+09GEYxXr7m5PV9XoFv
	zUddAOnJemOCNRuRMLpdJBwI/Q9obAIWC0JmXe/WJNOOmayHgKnCaLlmzfEz+rGW
	/MWoLLFDfeID/iIwLYjGXj+wWbNUNJ9vPimKwXaSTqvUVu3vxY/Dkw9Kuj8UE+BV
	nGl2zgDdI6nnefrNP1aQNUQ7nYeTEpbKPSl/XBS+v/x+DpPI3Phvqu0fpoVxuU8/
	+5VKXn141jC7ekMQxN3rxWfPT0WKII2gveh7jBAQVR+AM9n2Mi2PMcGz7AafNHHq
	2Sp+pMLWGXE0VnALbaB0QpwlirUKDq7Fgqn/yGw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RPRGmgdxnBnNv5uquxYy8MBAVAddXarUAKannPbarMQ=:LPIofgvPCh59qWtpBBu3/xvmkCvTHB5eJOFqs6HnklQ=;
X-ME-Sender: <xms:Vs35auF3ZKeoxzwOsUYqSkStVskbs4R-NGUIdeyhfyeixyyk9EN3ZA>
    <xme:Vs35aqIEdga0nfRUy1jvgxGicKyLl7wz4lxqhsowM6MD8fEPuqveb7hRDmyeV22hw
    eqH_O14ewKa36SMvMq3UQGHhWn8C5qo0Qy9uxzoAAV37KTnw9Vp-1Hs>
X-ME-Proxy-Cause: dmFkZTG0KPJjbF0MaYzlr1rMKbFVKZccD29mlx5DJ2nDT7gsDYCCpAPlozFsGDxohcC0/r
    rBNTGt6QIyhi+iHgRSTHcMZwGyMov7EYB/dRho9I5EtscXX8S47EQ95GzVnNrVZ7/87yQl
    W+t2L/rmREhnML0NmZgivhr89fiMdi0TupTTBVSxjvICnNewjWK5RL/9Aauzl1KonQ6Nxe
    NEWqX4k3HjKJETMzrTNMg238sNyGliWAM3YNCpjFRAvg+11+z0nJt6eJjlFMdihuPNbgIm
    oYg+mzbAvXGVjFYQFNtth3taHKaeWEkuhsGKNyHHNPiZcPoe08V914VpI6+MtAPh2X17cw
    FuBgm7wf7JfRdStmmfKL1GwGzkX4/BxT6+huZ7YIOqNgCkcHUAVroQ0OnY222fxJk82r9S
    UouzJSAmkJtqWmfeYCPE7yv5BfOT00gCZ9RF/HnUOSO2cSH4QXPDYMPsFB1melKmKAd5DE
    U8ZEMFMDe3MXzPL0Bf060i9FZ/du702JWrVBV7M8iUjqjTFwJk2g2RT2y3wMmwXo2p31BO
    TS/nfxaAXtBzKxURMxws+YH3t11fQ7Sj2TFX0JKgypZhMZtveSU2ZgNCOA9Z3ygn7G4BG7
    imxonf/MrJU+NVTafWwmyXTbOjFMBCs94nvQjGLiLz4+9S7XgAPqgyQWVsGg
X-ME-Proxy: <xmx:V835ahrv4y2-PQDiHSsLS0XYo1QHdz5R1BdqX1MXkUm-FttaFVZsxg>
    <xmx:V835al4upEkIi7RJYjYyJk2fjijUGXxBNFBHDXaCSkP3X5EicHxwUg>
    <xmx:V835agcOfApQazsMJguSEf37x-hfOcQn58VFpyTCxaMteRTE03SfOw>
    <xmx:V835ai6xj3oYcT99JabivV--4v_uh8k8TdJQfAbpvVX23n2U379t3g>
    <xmx:Wc35amsAonV99wwPoCZRTnv44dyVVUBYx-zoO6bdqCvwHDlfQyhY36aI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5C25C32A009C; Sun, 15 Nov 2026 10:18:46 -0500 (EST)
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
X-ThreadId: A4hrlnFi848o
Date: Sun, 15 Nov 2026 16:18:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Kees Cook" <kees@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Message-Id: <dbf6e2a3-ac52-4d0f-a2df-b78163e9d57a@app.fastmail.com>
In-Reply-To: 
 <20261114-lkdtm-usercopy-wunsequenced-v1-1-d9f288701932@kernel.org>
References: 
 <20261114-lkdtm-usercopy-wunsequenced-v1-1-d9f288701932@kernel.org>
Subject: Re: [PATCH] lkdtm/usercopy: Avoid unsequenced accesses to cache_size in
 lkdtm_usercopy_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2026, at 05:37, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in lkdtm_usercopy_init(),
> which can break the build with CONFIG_WERROR=y / W=e:
>
> drivers/misc/lkdtm/usercopy.c:431:9: error: unsequenced accesses to 
> volatile qualified 'cache_size' [-Werror,-Wunsequenced]
>   429 |                 kmem_cache_create_usercopy("lkdtm-usercopy", 
> cache_size,
>       |                                                              
> ~~~~~~~~~~
>   430 |                                            0, 0,
>   431 |                                            cache_size / 4,
>       |                                            ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior.  Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
>
> cache_size is marked as volatile to hide its value from the compile time
> constant checks in the hardened usercopy routines. Refactor the
> calculations based on cache_size into their own volatile variables to
> keep the values hidden while avoiding unsequenced accesses on the same
> object.
>
> Cc: stable@vger.kernel.org
> Fixes: e47e311843de ("lkdtm: Update usercopy tests for whitelisting")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2195
> Link: 
> https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 
> [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

lgtm,

Acked-by: Arnd Bergmann <arnd@arndb.de>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424457;
	b=2/Pjs5Dt9/0WRgTRSki8eWwb4jIPxegnYB/FQuRG4KArIbZd9ynuAYYHFZsZhxmhQ2gF
	 mLXRUV0tNkLjGt2KATPtADEWNMkvOGkHvBqVv9dxKwbb4488NSiIO7W96EufHCpNmX9di
	 nLzBa1PtFujkGZYpi6KhjPzhli4Qjc+ePDTI/n5kYVO6QJYmujiERfQSVc92P/U8pbAuM
	 04I6mD8PEN70b/YVo2IoyWGeTIlO2tD2uoXWL97vv+5Jp5EgwUa2PaV1C218Kb5guaT7h
	 M83ViRzOJhHh60uyZNxanvYYl0wXpX9paMtPf4X+Qs6sZpqMyJlxj4MKbtfDPbQgtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424457;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cKoVV6V6fmU6HOc5eMuK29xaIYpzKJr/vyMLJDrUU04=;
	b=iSkRnKxF6bmuChpSORzpr21ZosbKX7tMresBoXPJPB4VFOtf+Oolg63gxS4f2uYOt2X4
	 5e8ma5mOO4OtAQ4GWJjAyHpMtzdbTt6ooIcDQ+kLH5i7+nzv4appNVhhptIgdZUkaCab/
	 TJJlJiUuPvp/5Rj345YfDXZK/UeVm2O7rvsDDnuuYpfxV9tRLCUats0XLdncyI8DEJRph
	 7MPRR9MasUjw2tesZ/OmnxQpRZfRF9QJIo8/Yoi/DlGrNKJQJ76Tgjh7Ky93NV1vBvieY
	 uY4W9cwc254neqTl9PIUT5YwFosIpg9S/JCMPMlG3VJEb4r1Uc7lKitNrM/qrvn1LIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kew72xrO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3FNAlxDq;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1064E60705E3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1064E60705E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kew72xrO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3FNAlxDq
Date: Mon, 19 Oct 2026 17:40:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792424455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKoVV6V6fmU6HOc5eMuK29xaIYpzKJr/vyMLJDrUU04=;
	b=kew72xrOiTlYrMB+7URpf3K1PvqYT6fC/vE/yBA1KMOM51Tnz2ZOAb+TZ/KuHUe9VL+FEI
	ELZt4v/cnAbcUBJO+InQwug/dqs359n3VgMg3Gn6UIrFwbDhhtHlmeDivbbRhX21DBH2ZA
	MnIPFH1ZjA5lBHGnkJe4Zr9FayciUfyGI6hAUPGfba5U79FU6zJ2XstT1gX6oht4B3Upo5
	zHiAo71YgZi4AQv1sj8ppPAEotphAjkFdIkwD3rNHUhG2XeKsF58sTlZiOS+EaOHtRpvLF
	8SeIyOZmdQOkHv3BVXZgxA4S16kgSwci7h5Rw/FtMcMpmCGCWbwGwZ/ZymgslA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792424455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKoVV6V6fmU6HOc5eMuK29xaIYpzKJr/vyMLJDrUU04=;
	b=3FNAlxDqBP08WCFSvTwrqcNPQ5H3AJ84gVDU9j+sPXvxtqvefP/7kZ7oJE3qgmfwm2Zy4A
	SH8RS4ccvOEB9cBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <20261019154053.iXYCoEV0@linutronix.de>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
 <atY4apm9PB_vQpKB@pathway.suse.cz>
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
In-Reply-To: <atY4apm9PB_vQpKB@pathway.suse.cz>

On 2026-10-19 17:34:02 [+0200], Petr Mladek wrote:
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -483,7 +483,8 @@ static int __sprint_symbol(char *buffer, unsigned long address,
> >  	len = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
> >  				       buffer);
> >  	if (!len)
> > -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> > +		return snprintf_default_pointer(buffer, KSYM_SYMBOL_LEN,
> > +						(void *)(address - symbol_offset));
> 
> I do not see any obvious problem with using:
> 
> 	return snprintf(buffer, KSYM_SYMBOL_LEN, "%p",
> 			(void *)(address - symbol_offset));
> 
> What was the motivation to create a custom wrapper, please?

Overseeing the simple solution.

> Best Regards,
> Petr

Sebastian

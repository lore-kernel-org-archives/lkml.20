Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793905302;
	b=G3XpDU6U/v1oXGcn1xTQ2JMkm0TH+9JmXkcnGxpsIAkacSMWW4Pfld+VqlCeQGpn5rVG
	 DTymTQvT1p5AHyJ+Xuh/r0v3ySVjK51sO11ekQu0TNUVCppfG41KDwQHk6k2IfRnSa77K
	 9IAMYAILAdu8BIiBejkObtpQNsCme7PxOgV/VUc2KptztdK8J8wqfxiFtepvXt6cZnkM7
	 YTBsVUQHMcCDa+LoxTxcoOQCPo/1Pfn0kkIbuKUP1FayxpKkFRdEi+nG6kjmmIxRn+TBx
	 uWvbgHFVOp9gKr/M7f6gOLwcZWMLkeQppRfqbthTAYmPXA4s4HEIhG8dGhC+wk6CsLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905302;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=OmR/Ycb/8Y1Gv4EyGNP8sFc8583lU5p/wM5MZManZrw=;
	b=uAaKETE3udlzMpf/BpCH3DXm1ibMn619Z9WPqKv4ltSVJ/c00M8AJv3pnHnb+7RqLtyC
	 wtbguMgfAgSnYs/91e1vbQCsM7dcrHralsMdx8E2orVlKGDkZq0pwd+tObopf9M02130t
	 f+491RHrzHeHBxWV/piHPF/3vjqLwBY2xVDs9+0z4r2MpwaWDHAzpfNdRbsYmhtpIgVkt
	 k5NX9FLVZxYQSBA1PLbxnArPl67Lkqv7dc+iogWSkwxTNDm67udHRfYgruGKMa6MkMzRx
	 VSl4n4JUIusgtTbCYK6OAODyux9vs1YnPC0N/GkYbU7FueZzLNGVJ7iDMjBwqGUbzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LlYlOjYc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SZyH+mLf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F8B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LlYlOjYc;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SZyH+mLf
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793905298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmR/Ycb/8Y1Gv4EyGNP8sFc8583lU5p/wM5MZManZrw=;
	b=LlYlOjYcgTaR2ydF9P3PnbHrJ3oHUEtbis8kWfcJIzIE9GEltPduHQwvHQWK9Uxammc+aI
	Uqk9LA1ISy2iagJsG8KsMhDqbL0vi/7PtwRWXn3nsobAaEiAVSo/9wUumyQ/n1+LSlrqa6
	5tZwDG4rTEGvDKq7u6f7JlOi1fKhS9BaIZv+RPcPjprBYkf00i9eIbBW6do6YN11sy3tK7
	bHaS3py0Bu1NeeyzW6XDlFEpqgt6uNPG6zXY4l/gIVvS4cmZW56Ff0grhRUQYoUbNbSM99
	l0QqwCOggK6+oHxRkcrS+iXE1TGUn4Vk8BJvck7wxz8JyK0QJo0KdCX6Gjl7gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793905298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmR/Ycb/8Y1Gv4EyGNP8sFc8583lU5p/wM5MZManZrw=;
	b=SZyH+mLfKrYKn4Y+0L/y2LmINzZbZjr+vNkfKJOGisH23bu7A+0jEwuN9iU9ucpsWWoQxb
	H2XuH5n9Jq7KMVCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Rio
 <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
In-Reply-To: <auyz7JPCK7K9QFT_@pathway.suse.cz>
References: <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de> <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de> <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com> <auhl3cdwrHt4Vw7U@pathway>
 <87v76e3mcc.fsf@jogness.linutronix.de> <auniMWhvteH8C3E0@pathway.suse.cz>
 <8733tgc0b5.fsf@jogness.linutronix.de> <auyz7JPCK7K9QFT_@pathway.suse.cz>
Date: Thu, 05 Nov 2026 20:01:38 +0100
Message-ID: <87v76bf6gd.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-05, Petr Mladek <pmladek@suse.com> wrote:
>> And maybe users want safe drivers (such as 8250) to enter "hope and
>> pray mode" on kernel ending sites, which is something even legacy
>> consoles could not always do.
>
> I think that I finally understand your concern. You would like to
> add a per-console flag for "debugging" or "safe" mode. But
> it might be weird when:
>
>   + netconsole is in the "debugging" mode by default.
>
>   + other serial consoles are in the "safe" mode by default.

Yes. Although I would not call it "debugging" and "safe".

> I see two solutions:
>
>    1. Keep all NBCON consoles consistent and allow unsafe takeover
>       on more locations, independently whether they have safe
>       or unsafe write_atomic().
>
>    2. Allow the unsafe takeover on more locations only for netconsole.
>       And later allow to set both per-console policies: "debugging"
>       vs. "safe".  And accept that netconsole has different default
>       policy.
>
> I personally prefer the 2nd solution. Netconsole has always been
> a bit special. And maybe someone would implement the safe write_atomic
> in the future which will make it more normal, ...

I agree. I am preparing a patch that should allow exactly that and
hopefully make my idea with the policies clear.

John

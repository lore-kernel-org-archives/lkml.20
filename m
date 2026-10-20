Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524368;
	b=nXCJHNPmmYZ/ZGUQbxij3HadgHjj5dIzk2S52qVo/jWF+ZiSacKqIQziH6bLCTGNGF3q
	 /+ijjLiHhBbAZ1xu50VEfaUEhO65jepz84UNfa6eGM5jxptL7DaKY223Yac3zigGj3Nu+
	 pcyM6o9KWTDxYIZnCJyj1lkVPoZMFSB2yHmWVkiXMs6X3LAFJ7lWUrXrrXIWn6nw3x8QM
	 YDPdl8vMkXYHlBGwn/TJLjfjtDOKkyBExIQXGEnzpJHY/kygEuxXFczeLzEKZC6eAoEfz
	 usblAgmglTPJvFiC+hJW/QZGyUsUElwNWkMvlI6dhAqTs+TBAoGghq2Ye3hwxUgFmGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524368;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=d8iT+nIigZclQtdJb3ocEDCDEeLGdU8ozshP6cEFsSU=;
	b=DKLkCj3+44EazQPpv80sR2uLlP4PqOUOcn0aX56WM7FFo4K1o0f7pvBHoNwVnKXuUM4e
	 jHOjIyBk0BjkYAbAl7BJd/9+wfHFWLxomPxiqkZgRcWFSZbhYSNCHLO2R+rWst1sfEoEe
	 2ilbuZEnpXyPwedalVPhW3gCpzkyRVDxJ5jKdPpVqUGJ5aJiWlp6cZQWXF6Cr3BRvwwgT
	 ABEgwsxB8TiPWi6WCuR4nq3oJw9XqtY3lQxQA6bNTDkTm7Ty/GsR91fRHZ7tdhrHFv2zf
	 zooKv4sV+wWUZniLVZgJItFpE2je8z2e8VY7SsGoHAP6ktkqDGKINGR8UfZBx/MgPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=NtvrTuaT;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=bfyt4A+9;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DE606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=NtvrTuaT;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=bfyt4A+9
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792524362; bh=d8iT+nIigZclQtdJb3ocEDC
	DEeLGdU8ozshP6cEFsSU=; b=NtvrTuaTZydKV1C9o6JTzJVg4sCpdtlR0qKjAS/gzewSCGXnH8
	3P7DGKoi6GivCxcTf6aGqNPXZQQJe4qMmjZaXxyzbD6pfoZGGxR3LW106t0D4zv6mPazpNT1y2r
	BYMydwIUuMVBtOgsMDM8uVUlk/LYTHvj+B7423rIGFlysPtLw+6ldeKtULMrNu0/1+xbZlcQLa1
	aBYYNVIu1c8JfN9BtRkvq47kWCptH+bXRzZq9Vtqakzpd0coiR4gOCxMdHHM/VNZTgLBC5meVcb
	lIWt6Z911wgofYHn+V9C6f0LCBg9SlvZ/5V8742UFOamM0uVNhH56aBnf50z7M19XKQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792524362; bh=d8iT+nIigZclQtdJb3ocEDC
	DEeLGdU8ozshP6cEFsSU=; b=bfyt4A+9rqoMWhqmYdO9idYwsGEZlQA+i1jCzNMpZk+ftYof2v
	+lkXKSBZCY7dLj1Oib9O2rFa3tTa+NAif/Aw==;
Date: Tue, 20 Oct 2026 20:26:01 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
CC: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
In-Reply-To: <4162b48c-0101-4900-9d80-3c091774bb09@paulmck-laptop>
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop> <2f65337241e230cd26c130bc3183ad230c7c40e4.camel@physik.fu-berlin.de> <62138DD6-F054-4992-810C-EDE92C835346@mainlining.org> <4162b48c-0101-4900-9d80-3c091774bb09@paulmck-laptop>
Message-ID: <ADFC31D3-392F-4789-8CC7-842ACD2A26F2@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 20 October 2026 20:21:31 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Tue, Oct 20, 2026 at 07:54:38PM +0100, Bradley Morgan wrote:
>> On 20 October 2026 19:48:32 BST, John Paul Adrian Glaubitz
>> <glaubitz@physik.fu-berlin.de> wrote:
>> >Hi Paul,
>> >
>> >On Fri, 2026-10-16 at 20:51 -0700, Paul E. McKenney wrote:
>> >> However, it sadly does not permit easy implementation of all
>algorithms
>> >> needing on two-byte atomic operations because there are some systems
>> >still
>> >> supported by Linux that do not have native two-byte store
>instructions.
>> >> There is reason to believe that these systems will soon no longer be
>> >> supported by Linux.
>> >
>> >Since this paragraph has produced a headline today [1], would you mind
>> >clarifying what you meant here? What architectures are you talking
>about?
>> >
>> >Thanks,
>> >Adrian
>> >
>> >> [1] https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG
>> 
>> Annoyingly my name isn't on there :(
>
>But your name is prominently mentioned in the pull request linked to by
>the
>article.

I bet they saw Bradley Morgan and went, ^W^W^W^W^W^W^W^W^Wmeh, Paul is more
famous
let's
involve him and not the guy who made the patches^W^W^W^W^W^W^W^W^W^W

>
>> But I'm happy it IS a headline :)
>
>Me, I am a bit surprised that this made Phoronix, especially given that
>Linus hasn't pulled it yet.  Perhaps there is someone out there who,
>like a number of the commenters, got confused and read "architecture"
>when both the article and the pull request said "system".  ;-)

Me personally I got a notification on my phone, they tend to talk about
arch "improvements" anyway. I like pheronix.

>
>							Thanx, Paul

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89154707C;
	Sat, 26 Sep 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459304; cv=none; b=oXzMDsJ5+QTRH6zCkSjDamaaS7I27dA9CirynVCH3KqbpRtymFGUvryFwmqvi0MmMbJSSGWy9qIPNeXTeqZ/CfEi7gEmIvtAdI+XXl/U6ejlzDLaDhvsaiPHjQdJzE/urLZtBtT3Ip1hLz8yxEjqCZiiXqIYvvqSs6XV6XzdUT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459304; c=relaxed/simple;
	bh=ucXZo2p7oZxJdfVvZZ3OdgBEh4w+gPSQU48CB2mZV3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wr9eQ37s/yukDPCRK85HjXmMTbR5OhiLrdA+UN0NCMmpU+xjr+mg3qTL893QqJYyzMqamSLLDN9FbcOaDGZ9eQalsaRPGbNyTJUKZq9LNg2m8hL8k0JGDU20Bo08ZZiNdkFSNLgB5ZZlUYgIwOeAU6eimGoPh0cEGH12KvavdzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PyRlLUZj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PyRlLUZj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA137408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790459302; bh=NQ4g88hUtxw5ccEaHuRAimoweueIHKaBh/K8hKSxftE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PyRlLUZj8XwFhNSlwRpPqIuGfIxtBgVFUoEnClEP6OlWVkhE9ADJH57kY/w/hqoTw
	 JMrdPsQWYtnFOVClviiWn2Zcn5NrUyOYTwurbZvI3yhoQTgJ4R9iSS+p3Llt7fi3kC
	 pQG7ROLt+1h7ZFMjZKTdNAa+FvGHAD3D7dSe0eCn7jAnWfBKjx2sUW3DYylak4+4D9
	 GUpL+02KsHhLV3W0Cf6vOZTEQ3459ytmhSPOtL+Mic7xGL40yxGEHFjOjDnoJ6heJ/
	 DIuvDKE8lCOsKwRuNIijOiLyobvH/yE421Q6IrO2SWPxiauArKpjgPUoIbaEtsXA2Y
	 jUUtzhzr0gVgg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA137408DB;
	Sat, 26 Sep 2026 21:48:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Habil Eren =?utf-8?Q?T=C3=BCrker?= <habilerenturker@gmail.com>,
 clemens@ladisch.de,
 tglx@kernel.org
Cc: skhan@linuxfoundation.org, anna-maria@linutronix.de,
 frederic@kernel.org, linux-doc@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Habil Eren =?utf-8?Q?T=C3=BCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH v2 1/2] [PATCH v2 1/2] docs: timers: hpet: Modernize
 file references
In-Reply-To: <87o6dj4rf4.fsf@trenco.lwn.net>
References: <87o72mg21g.fsf@moria.home.lwn.net>
 <20260926180838.8145-1-habilerenturker@hotmail.com>
 <20260926180838.8145-2-habilerenturker@hotmail.com>
 <87o6dj4rf4.fsf@trenco.lwn.net>
Date: Sat, 26 Sep 2026 15:48:20 -0600
Message-ID: <87jyo74rbv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> writes:

> "Habil Eren T=C3=BCrker" <habilerenturker@gmail.com> writes:
>
>> The current HPET documentation contains outdated 'file:' prefixes for
>> source tree references, which breaks proper rendering and hyperlink
>> generation under the modern Sphinx-based documentation ecosystem.
>>
>> Fix this by modernizing the paths using the standard literal backticks
>> formatting.
>>
>> Signed-off-by: Habil Eren T=C3=BCrker <habilerenturker@hotmail.com>
>> ---
>>  Documentation/timers/hpet.rst | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.r=
st
>> index c9d05d3ca..fe02bfd5d 100644
>> --- a/Documentation/timers/hpet.rst
>> +++ b/Documentation/timers/hpet.rst
>> @@ -23,8 +23,8 @@ The driver supports detection of HPET driver allocatio=
n and initialization
>>  of the HPET before the driver module_init routine is called.  This enab=
les
>>  platform code which uses timer 0 or 1 as the main timer to intercept HP=
ET
>>  initialization.  An example of this initialization can be found in
>> -arch/x86/kernel/hpet.c.
>> +``arch/x86/kernel/hpet.c``.
>>=20=20
>>  The driver provides a userspace API which resembles the API found in the
>>  RTC driver framework.  An example user space program is provided in
>> -file:samples/timers/hpet_example.c
>> +``samples/timers/hpet_example.c``
>> \ No newline at end of file
>
> That last line is something you should really have fixed before sending
> this patch.

I guess the next patch does fix it, so no need to resend for that.

One other question: did you write these patches yourself, or was there
LLM assistance involved?  In the latter case, they need Assisted-by
tags.

Thanks,

jon

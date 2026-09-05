Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8F36D4FC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788645611; cv=none; b=mIB9zUARz0rNPIOmpnwtXMJ0AwQHEzm7pAyZka7S2RJSYo9l2Ka2SEQzdFC1Ix0wtX9QNZcg2Dys7KoOCvturtTkEAc454QYYDDbSnvXY+AiXQPyhWv7J4FsrnCAsckv7aaMITAcD7LqyeRSTa/CsFKdnp+To/62mLYoNEULSdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788645611; c=relaxed/simple;
	bh=8HYgZ8ZgxawoVMyKOgFwItMt5JpraBiDnJuGrppbSDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D5ni5wz7bImnnBWnJCzXhm2UzEsatkPuMKSsN2NJRjgyrpJrbmKt9eeE6llfQ2cKB8EBzWxA9WC40KMXTRCzXC6eCgpXlX+12fdhnOqH7CQPhvKPptvsDnLfBA9QTtrWxbL5FmzYYTSP6Y0cley8zKJ4z5pexXO9j5YldNCFVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eGeJoYBO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y9U3PNYf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eGeJoYBO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y9U3PNYf"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788645606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NhmJThPSMPRUR+LcHYg6FIZCVHPmiiEIMERd1C9NtI=;
	b=eGeJoYBOfsZkxYRFUxnnC96ReQ3gJr11cV4JDwHEHHvar1v0yhSjDvc66hzpGCHELz6WPi
	hiXg+Zd3K3plwSr6SaZCxgahjtT49J+XG5Sntd18yTXyEdFoyA8EgpF2aLWMzHkr0FFBiP
	KDLA9eSbkmv9cKrDKHvYorTlvlyVuAIMnFc7+i1LM69iJmqAdOudM79eyJ1t0HcA1y0c98
	q508d973jODtqiP9wSzQV5qUqRK+o5U9csMqhBES6C/0Hy1dCfOjAt5EfsYlNm51Zgr8ro
	07XLqnJMEQ/K6EjFdmq6IQ0YiDFJYsCazuZ6qx0U1BXY6LZmkgiPT8cTK0wiyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788645606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NhmJThPSMPRUR+LcHYg6FIZCVHPmiiEIMERd1C9NtI=;
	b=y9U3PNYf0vbdGeJHL4Q+AoGB11W4Pw2utr9/6hK4/loMvUJ+FpcYrYew+/103yTD2DlGc6
	FFprNTTHtkw302Cw==
To: Bradley Morgan <brads@mainlining.org>, liushugao@xiaomi.com
Cc: daniel.lezcano@linaro.org, frederic@kernel.org,
 isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com,
 wengjinfei@xiaomi.com, xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com,
 zhukaiqian@xiaomi.com
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
 <87h5k34cob.ffs@fw13>
 <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
Date: Sun, 06 Sep 2026 00:00:05 +0200
Message-ID: <87bjab4avu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Sep 05 2026 at 22:24, Bradley Morgan wrote:
> On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de> wrote:
>>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>>> Hi, I have a pixel 7, if I could be asked to backport this, then I'll be
>>> happy to, for the fix, add:
>>>
>>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>
>>It would be helpful to respond to the actual patch and not to some
>>arbitrary reply. That way you might avoid your tags to be overseen by
>>tools.
>>
> Sorry my mail client sometimes glitches,

I fail to see how your mail client is responsible for you to hit reply
on the wrong mail.

But what do I know about all these new fangled mail clients who decide
on their own what to do. When this happens to me I'm 100% confident that
_I_ got it wrong and not my mail client. Maybe I'm just too old-school.

Thanks,

        tglx


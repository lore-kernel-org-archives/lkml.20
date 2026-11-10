Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300558;
	b=XgBFM/nn/wKxjt9Mf2+61iPndk81/SJfMvATCxiIK8TT+x8c9q9+jXlxWZvp3bbixsUZ
	 77mcoC/DK1LvSGlmQqGQqQVxEgCIVU632nE9/gXN7Z2kZUMOCmQuna9yq8Paw+Gx51YPe
	 xlage4COjVUv8eeEr8FvQCLX4LgP+2RjwZfuwDUrIuNtunpElqkJJiXQQmncVEQz7hMKl
	 56jZvxXtpCpM4si3ImFv4ewY+l1AvoF6DGehRS34WQMfj5mdZF7PxBSf8MJ5A3nH60CzV
	 JXLkIBe6pzwvWrSdZGIncly/p1WqgetjiV1vG0/jbGH1KZ7wqVC2brn1B6MY2bkBN5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300558;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=mA2kKVvz8Zo1bjkKdij3A3VIEQ8ORUrZ6l6fiNtUyi8=;
	b=lNb0C1lAlJfUDeTfKQG0jCfgA6KdfmvXsxj/LO6odm8HfxPxoi2oBG8zK7c2B2BVW8Pd
	 Jd2QwBKFHBrNNprMar7PtDZi6uaDPVUcQeIFw4F1VucjGLqGncmQ7v3p5HOy72kZQ+JR5
	 3b5ebujTpoe+HtTMPEUpWpeez/mDti/cmIOhhG/LZBY6E6cglWT+tGgzuX7f1eTcBJAiF
	 2bUM/ezAVwC8SWkG9SEsi6ySlErru4qSnQ48Jpv4QQy2nLQctmxj7xEs0407/7UcC7C+m
	 u4bIrOAMbh78n9ms2o1MWLKb/E56guLrRMiNl3Ze/phN3kXOxgAMd/poqbfhLfoySZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zay7kTVV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DJB3Lig9;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D59606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D59606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zay7kTVV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=DJB3Lig9
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794300556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mA2kKVvz8Zo1bjkKdij3A3VIEQ8ORUrZ6l6fiNtUyi8=;
	b=zay7kTVVp2m+o7JUTTJzwebW9g/+E+6XATtuJB9qSxEXtOhBN5CY7+Fk4Y64T6STe2Qei9
	mLmc4lpsmshlbd8J7ktCjE3J7eUMg5LDD1Crt0z666v1ViWzpOK6yUtr0Fq6DkyGis1JAx
	adpU+7bx9tL6Nn/kxSsU/cOVDhHTD2vPL/EWUFwi8GFhCnFghrfAuzAl+AopzrpndIP8Ok
	YfXDUXhJi8qgCcV3xm6ln++rrqHpnfbp8XKaOdLJW5yxKFB7FQvA4OlpePC1MC3BlNl7HR
	g3WlNx9zuEvV5H+H4zuGYd1hl4F/ApHE5ucOnWKzI2zox9a+HrbF4gFoGHp7Dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794300556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mA2kKVvz8Zo1bjkKdij3A3VIEQ8ORUrZ6l6fiNtUyi8=;
	b=DJB3Lig9c+2HLwJJWpCu0mz+rX2WorbSM7AdpdZYwKv5olp6yDiU8/HQrOa5VcFoejL2Bg
	8nHObyL1Dxp5LsBg==
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Breno Leitao <leitao@debian.org>,
 printk@lists.linux.dev, linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 2/6] console: Introduce unsafe flush policy flags
In-Reply-To: <avJDvDl0Hcx_CEGY@ashevche-desk.local>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-3-john.ogness@linutronix.de>
 <avJDvDl0Hcx_CEGY@ashevche-desk.local>
Date: Tue, 10 Nov 2026 09:55:15 +0106
Message-ID: <87eccthy0k.fsf@jogness.linutronix.de>
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

On 2026-11-10, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> On Mon, Nov 09, 2026 at 01:37:19PM +0106, John Ogness wrote:
>> Prepare for per-console atomic flushing policies by introducing a
>> new nbcon-specific console field @unsafe_flush_flags to store the
>> unsafe flush policies for a console. The policies are represented
>> by bits, specified by enum nbcon_unsafe_flush_flags.
>> 
>> Currently it is expected that any @unsafe_flush_flags bits are set
>> prior to console registration and do not change while registered.
>> 
>> No functional change.
>
> ...
>
>> +	int			unsafe_flush_flags;
>
> Why are flags signed?

It is not relevant and all other flags in struct console are signed, so
I figured it would blend in. I will change it to unsigned for v2.

Thanks for taking a look.

John

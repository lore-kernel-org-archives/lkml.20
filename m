Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124486;
	b=cyj7zJV0U1dPGnv5IUdjcCvNuQ3A88kBDE5WNahMZ5l0b7cTcsoWYrqxjg4Lcw1vVZou
	 2wdbND4Q5jPDV6Rcqo9olzrAmyUil0csRNI9oHgytOD6jZK+sQ+BWp6kEY2R1QnaNNaN5
	 SUjqK5Ag0o+X+q+Jw38dpoYsptYJBao0qN/CBlIZDNYYIN8hiqWV2iRBmmmou0DYBQuM6
	 gUZhXvaIDQuZ9wqArTLz1UcLxZT5++x6LWPSB7KxiR+tifSno4Q8y5h5Jg1hcD+Un8ORW
	 cUBB1ouCICCXRe4FKiLsAzViAjPBqlmhywLLCI00HnFwiYokKRpTBVm3zVcdljjiM4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124486;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=YvMmlbSBEAfPJmfj4jHcpwrF8L1GJRuNQP61xROBbd0=;
	b=m1w+yimpHw1bilk78p6IZCYn2Qi7wB/ycwxZO848/j2wJbWW+Wr3deq1NNHiqr6o1srv
	 JSKmYdtS8pvyDWsa8uynA4RIXoLq5xyhV5Qr2OE4Obbmua91ghyS+crYKHrPBZQzFZZXw
	 C+Avcjkv3I5j2FfJ0xGphGBW9j6Z6n/hrzNLeOM+N3L81OHLR18+MxLqQZaWIaGZkpVSh
	 /2IyPd2MJjJpri3YT7XRxgC8G5P7vwfQxAY+3xO9A2d81OABoarGqmXqiN6k/4T23Xtpr
	 ljkTqXJ1AmTQt1srrqGjsKpg4HZlt8a7U/tK3P0v6jRHXkIykLM1rviyf7gr99lYATg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KofaQf93;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WDaCFBDr;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C01606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KofaQf93;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WDaCFBDr
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793124483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvMmlbSBEAfPJmfj4jHcpwrF8L1GJRuNQP61xROBbd0=;
	b=KofaQf936dgJpy78aclAaJRRHbMNimeZraaZvvctS8D2xjFyokv2h1pWcZKBdWHfHwdbrU
	Qlr/kB0q5JZPUkYymdpmySYEkaZVVHjWZV1WjN+FJbGcomfr6TwAT5dA78WwNbjkycBpic
	7Rkqcst7p9hrzURgi8okqiFV8vMv8DgKQr7shoZcgltS+scG710CB53XFJ11A+uJZsBx6d
	7mhlsSmXUKgoGZOI3AwmihUIvJeeIpApnbf22LebbdD711lIc9F5F5OzO82CaEPj9cT3cJ
	ZdgyQTjnOapBHS0FbdW3ylzjFUAPdbCXChYv9WsuenF/nkOdVq7W3leNebaSng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793124483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YvMmlbSBEAfPJmfj4jHcpwrF8L1GJRuNQP61xROBbd0=;
	b=WDaCFBDrds32NzN3exnQ1+muuhffGOOcmkn4AtvWw/RbRlT8UFXPz7/IO0mO357FjQoe6J
	zRHjaR6Mf7yD+cDw==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Chris
 Down <chris@chrisdown.name>, Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com>, linux-kernel@vger.kernel.org, Petr Mladek
 <pmladek@suse.com>
Subject: Re: [PATCH v5 06/16] printk: Check that index is not defined when a
 console is preferred via devname
In-Reply-To: <20260929120546.328616-7-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-7-pmladek@suse.com>
Date: Tue, 27 Oct 2026 19:14:03 +0106
Message-ID: <87se1r2f0c.fsf@jogness.linutronix.de>
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

On 2026-09-29, Petr Mladek <pmladek@suse.com> wrote:
> The current code makes sure that a valid index is defined when a console
> is preferred via a name.
>
> On the contrary, the index must not be defined when the console is
> defined via a devname. The index will be defined later when the device
> matches and gets registered.
>
> Enforce the 2nd rule. Make the checks symmetric in the code.
> Do not ignore the errors quietly.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: John Ogness <john.ogness@linutronix.de>

Minor nit below.

> ---
>  kernel/printk/printk.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 0199c918ef03..b8c348e305eb 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2559,7 +2559,7 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
>   * it updates some global variables which are used to make the right decisions
>   * in register_console(). Finally, it enforces some rules:
>   *
> - *   1. Either @name OR @devname are allowed. [*]
> + *   1. Either @name and valid @idx OR @devname and @idx=-1 are allowed.
>   *
>   *  [*] A valid @name and @idx will get assigned for a devname later when
>   *	@devname matches during the device initialization, see

You drop the [*] from rule #1. I think this was unintentional,
considering you later add a [**] for rule #4.

John

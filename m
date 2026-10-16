Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15A556BBC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170773; cv=none; b=sG+IFlOzDFfkTk07mjharAAnenk8UUZCjGefJ8WYHiT1ky/iEBX/15ai2mIYFDMLkAFfqw4B7S5xcbSBQQH3AKbkLIms1+DVUWlvKp8X6wrbR7GlwgxUH6F3NPIPLVZ7BeiZUzAYAk4ZO0/+XweAjRUe+a8B3t5P6eBHDYWCqYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170773; c=relaxed/simple;
	bh=bRX4vdTwM0uOkJPPEDFyz3oV42mOf5PihQ8xFO95TNU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Zxy5ta6NxSg314ieZ0LR8/K+Be3L6VdxoJ4tIQ8cFjb4ZiJLRhImmOFBKaWbjUaeB+W8dKsJemzbiWJak6rYNKtFJp+hkSWC39U6azoBSm4wY1/V1vr78QKCWEb/2yx1YCRQ2ZbA610CJ5+r3qY9XYJh3hdxYAxarKqed5kAQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CuBbJFPU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K47iH6m+; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CuBbJFPU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K47iH6m+"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 14A5014000CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:12:50 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 16 Oct 2026 13:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792170765;
	 x=1792257165; bh=S1eCJyYP6zvzSL58EPlStO4BsCLHm7I3zghN15Chmro=; b=
	CuBbJFPUiluyvjyq5F+i8FcDlyoPrXkt5CzfLsrimQVoBPpCZYtsLQcRw1Qz3njI
	30fz+ooNdUo6fwxi+DweoBU+ydL2YFYDmsoAohoLVmT/XsCAFojsQ4rnlM9QIjiW
	NLLml28s2kOdZbZEQkujU8Hcl6Lr9ijwKaClCS1p/bze8UQw9raUD1U0LOO1ofoo
	MbQQaGNhhT5bj0atQvgYR/5VnakgXin/o3k5gvWGZGeri3nZg3MfnbMVmIGKrNgq
	zuqwAaOO3OgmCXiQrCLv+o+DhkTjX93ybBvzgpfR55aMcrCFuAid7E2E1Rlp7l10
	hGQBmqmza/W/AzFdYhICuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792170765; x=
	1792257165; bh=S1eCJyYP6zvzSL58EPlStO4BsCLHm7I3zghN15Chmro=; b=K
	47iH6m+21jSE13QQDkWi3fyW7VE6AoSHX2SsNSl18ZbmKGWSdip2WOSIxM48OuZu
	27zUgYuD04SoHLpyaCdzgcqBAdNqyteA4SrNnsCcQsTjCN0t94fkSB5lKTpstE2g
	NQbK6xLn1JwxewwCoCFQr/8esrhoxo0Op7FJs+ed+a5I5iFVJ91V4nqbsmk5/o/V
	X7fNxgr0XU+a6Fp6ctYQaSzeA9blgmt3DQRKPaNTs75Zi4znzKdtujsE504NEo8v
	uazNEwy9x1uNzXp7SNggxLctYzFeCkgcWW5pYOJpp5qhe8eKPmg49aCq6XexQWvr
	XX5wv8gZVyaZ0adAwuc/g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792170765; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:KWlzXL5v4cjihAC8vkvhOEYtqg6oByqMkCfO2lD0sDbDAPe
	Py7xBqfK+O0y0nJu+gdNPPzIPemVQusLzY2ibyfxKCLx3FoinePnm6BmEN7uFtC+
	W9eGDI4hepRNi3D7JjhXyK+f5hl+g7cMNakLDF1lLXU3yuaxM/s9eSG/kwlAJzkc
	jRLuP0RKK7RU0zpCHioRYPDlvg/fWTHi7Y/xOdSpO4EKaW2EomMwzBNC0Obhy8pf
	8BR71JTw1yxsTFxzxnAr1nCkg7iZEbQEbdVcq2JE5VdwNVnkR2VcYScZtam4jj+C
	aRjw9JPNcXYoeewMOkRRfrUjA/Sej9TD/ZAt/pw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cDtuQHZVCFgaSoidsPDi/aAYkhqTeRG54fWVxKdPpN0=:bRX4vdTwM0uOkJPPEDFyz3oV42mOf5PihQ8xFO95TNU=;
X-ME-Sender: <xms:CFvSaqA2pehRpXgV9syxx7nBjYjv4JtdP75XiXJ8WUGN7WkHvOCPxQ>
    <xme:CFvSavXVenSOPhs8VSDPQkp3rgTGy4FJ7XXhGlvHkX8UV5hcKdRWxu5RanAg-OGIM
    LD-ebC1eNykIxZlbNY2WUm4ahjilKyv1SuDsjoaCs7VTiPwdaSiUzWO>
X-ME-Proxy-Cause: dmFkZTEePUHGAZhuWrU9DSd/9CBcIP0ODRfy6jaCyM2UMwXEhqrm4+Ely0VpVZcrsM5ce4
    zbNa+k+TvmAhyKYsdVQPaRiRStkGnBIiOYOdo79JO1LkYc5Dp26jcrgVK/Lp4v/wfIxIUL
    J7EcNPSBkc3y4SxkJOZNSH4U3u1S1h6MAgMfrPiCc7JaqnJWvmx/DUcu3OApMHYkOoe2wa
    Ar6uUvk8zMkoUL3yob2bPdkH9g7oApcvHGuYDrDITUYG1u8qoCHY+RiAzwX3ABkd7UX8Tp
    a18Cd23UIHCEi5OzVerQL2diprke7uH/XooUZn3GAOtgjFTNTISv/cs3MjCTy5pexvuBO8
    rQKAnbol0sgFTUiwfOK4uEmyNs/BBl6dynj27C0aXMFOWSqrs6cX9khewKqzDBWAL/OGnx
    JCXxG87gxC3VpHlIVCjl6bJDvbiLojzTQ83s1RGJLpQyoR0UAkXH/AY+wYWkh0/rXexVpX
    tNLlSptMTP/VZ4qLvzU6dpTsgOUMFqYxqo9iKiSiXC4+ZmPlZ+7ql+AKEUBSSpsnfwpFYW
    qfcThBjjMXFHNBAz8ImL9mYWUwochXms4wt8+RPKZ48JjZRS9hDl6XXuPCXFpLIAkK8Byu
    utfDAAxtckoOOELtAu+M13EIYK7vbED74OxhwJ+cLkU5dNhTZgxrLQ6nJVBA
X-ME-Proxy: <xmx:ClvSan5ZzT8sfCyUhOHvN8lKazYZAWzAG32mlGo1Se3AcygTW6H8_A>
    <xmx:ClvSalAg_ZfV5V6Yol2gCDqRaHO10Wt2jTXTihpwjoyCohm1916cbg>
    <xmx:ClvSat-vJxXUmrn8ENu5W6fqp06ig7KxzayIjCrW0QYap4y__6CKmQ>
    <xmx:ClvSaoG65n9UMSGQDrhfl7ojV0HbBAcVt3uUfLF8QgwmoqyhhINrxA>
    <xmx:DVvSarOYx1aAg05uKqzR6kHlJtXfeItkKZg-g-wwX0QgBTJKsvK2JXDz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 373FC32A008F; Fri, 16 Oct 2026 13:12:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4WN0AQLOakc
Date: Fri, 16 Oct 2026 19:12:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Message-Id: <aace8c7a-61ab-4b54-8563-3e1ab0f99e56@app.fastmail.com>
In-Reply-To: <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2026, at 18:48, Hugo Villeneuve wrote:
> On Fri, 16 Oct 2026 14:59:47 +0200

>> -			scnprintf(buf, size, " I/O:0x%lx, offset 0x%x", port->iobase, port->hub6);
>> +		scnprintf(buf, size, " I/O:0x%lx", port->iobase);
>>  	}
>
> With this simplification, you can now remove the {} braces...

Done

>> diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
>> index 4ff3e5c41dab..f43b802add12 100644
>> --- a/drivers/tty/serial/sunsu.c
>> +++ b/drivers/tty/serial/sunsu.c
>> @@ -106,10 +106,6 @@ static unsigned int serial_in(struct uart_sunsu_port *up, int offset)
>>  	offset <<= up->port.regshift;
>>  
>>  	switch (up->port.iotype) {
>> -	case UPIO_HUB6:
>> -		outb(up->port.hub6 - 1 + offset, up->port.iobase);
>> -		return inb(up->port.iobase + 1);
>> -
>>  	case UPIO_MEM:
>>  		return readb(up->port.membase + offset);
>
> Maybe change to a simple if/else?
>
> 	if (up->port.iotype == UPIO_MEM)
> 		return readb(up->port.membase + offset);
> 	else
> 		return inb(up->port.iobase + offset);
>

I think I'd rather not change sunsu.c any more than necessary.

      Arnd

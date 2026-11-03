Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720721;
	b=NPmjAw3XD4TtfuhsPtR5Y7oN8/wwjCbwmj8OJDA5TSwdbWkeDAdEI2eGdRPYpE9GJZIj
	 XCPgnVWRu/bl4OuQugZVwScPVtOHaBdzjImQhpmaKm7Go98G19md9w165zX8l4GgVrd4h
	 tht/CDbLUZ2rXM5TdaOE9TCy5Rk9wgGo1chUZeMPuMkJZP7bui/dS8wIPFLAG4XOJIH0y
	 VKhBnz98giRMu26uAxHihlV8FmPiW5OOMYIVl0SFHfiptGLl7KDUCU7HLexpfG4eZqj0k
	 vPpRhew/w/C5bAqb9citpuhTX0uJpm4VUqGaapAp7vAsoXHqi6sVbMv60Jd1MyGbdDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720721;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=SiytGBhgzZ09rAONJq1IaSf7tIhNVqE41LCjDlYFROM=;
	b=KNbzHHwDpwykC/UKXPiNB6mBc8Q6BYE6vAlQ+HJkoXZQJWJy2mhwAM2xMLNStlnymVJL
	 VCYPwA7WcwBU+gh0mEJEWPP+MwfIky1On3XNqAK680ZGLWcTqq3DzQHI7ismhmGUUk5y2
	 LHstXluTXDDw85IbdiM9DFjD+yVwZsC0nNw+NHJudhOq+vKBIei8SZqfpKz+CGrggylDA
	 EDPN1YK2RfDq1iKBxTHU6Kx9H72QdUnrIQazLNQPziSXaTd29IIO2oYDjw3SLouXqPBNS
	 N6zMh2EI2e1b12+UHCllagdxPLF353Jv6o1BPXhAqrIoSi0+LNFWo3ER5qE9yheTcBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WuIegm9W;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OID1om6u;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF2606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DF2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WuIegm9W;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OID1om6u
Date: Tue, 3 Nov 2026 16:45:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793720718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiytGBhgzZ09rAONJq1IaSf7tIhNVqE41LCjDlYFROM=;
	b=WuIegm9W+uKwY1JtlXCdP6dABmV2AabSrZZSswEIOiKJc5uNH8+ifJOeCwbTEzdkl6SsdN
	kwqdZk+x2dVVFzu3Mu8D37tvyoSc6ihJDvBmNN0PEytON3raZx31aP1MR/zZq2f39IsAXH
	uLuxsDMODjI8ogGbWr4z+ctD+2NLTcCwc5QTyiPQP3x0inza3mN8ryTw+6v9Jf9q6ymZCM
	X3L4KS+re5giC3ccLP47iw4gR7JOuhtxNu/ejlPk/x7H6R+n1o7/wHVx8sBsIRMsMnevwx
	WlyganyiFeG5iNW3iEGFduxaFrGPfaVTqoY98jrU91X+Bhh/oGgB3DXwk3rjng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793720718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiytGBhgzZ09rAONJq1IaSf7tIhNVqE41LCjDlYFROM=;
	b=OID1om6uYsE+YjViTz6vrwodkoqU1tVw1evdAegwK9BwFEoyUNmVcAPdRYjjeIFaTr7Tws
	RNEn4gA923/TfpCA==
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
Subject: Re: [PATCH v5 0/2] vsprintf: Don't leak pointers
Message-ID: <20261103154517.a2llJhoy@linutronix.de>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <aunrc5atzlyf0TM9@pathway.suse.cz>
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
In-Reply-To: <aunrc5atzlyf0TM9@pathway.suse.cz>

On 2026-11-03 15:10:59 [+0100], Petr Mladek wrote:
> JFYI, the patchset has been committed into printk/linux.git,
> branch for-7.5-vsprintf-kallsyms.

Thank you for the update.

> Best Regards,
> Petr

Sebastian

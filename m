Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713920;
	b=rar6myfGgl/ULhnAI349a0c2ht7gSfpfNvzXXqtOVOKJZoUoWaiKCPsMTea9PbOKvjB0
	 UTPzztqv1Q0lTGP1vENr7hFctCzywvEHysuvdZkULAY3IRFyLZ+8rCmj3ozmTGhAbRagc
	 y6wLn6xJYJtUg553vlNL2+vhCNUGFqmTKO3lATn4RyqQqCwOu9OmsGwCQiOams/+y8ZF3
	 FnnGmhAzSZBXxtw0GCbvAeuwUudYRLuJV+duo5BUERLL8RjtTogOBcdadRC0wbMOlKKGI
	 Y/B5a8d9Bj/ThoeTPWAKCSlBy3BrLSSNKxfur3K6tftJsCBxzUuS8slh+DTYwUhWhuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
	b=mccz64Y+IFD+fRYDEgGAHULT7zGoWcGGyRjnXQJvNgPZ3RipUokg+dTWnJ8LPxj1zq3X
	 wmDuvAPAHMoHJGZ6tOokbEv3XBDIp72NYdrPpeUzXh+gRAJlQpZglwgNvg+7ZHLL2c1E0
	 SYKCF9nanq6CBcfJVNqNXlMBm+56C+eXmHBkwAFcyQjrCz2d7ywELzW5N2Al772v24U1X
	 mT1tYpQTqVejZ6yfT3qpt8EO9NMTaKcMxnKoP+0EqJX3CFYJq8J7nXcLAPcLt7T0R5yL5
	 99DRPNmy5Aac4vp6anuAZlcwELgzwDTijBx4EocvpO+V2+U9FjOTd2Z/WEskkjftfiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VjP1wFON;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01F606D806
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF01F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VjP1wFON
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so35777425e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793713918; x=1794318718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
        b=VjP1wFONSQKTy2IGML5V4SycmUL9GDfKc9sioR6EKAxygpnYCJMcGjW2JPwg6wHeO8
         q7K2xWjlfjUJqBhx6PlEZE8RmFaJuGL7AXvO2iGu7BhM4yj54PViv9w3Qis1R6E8KWBB
         ymPEWt+Jw9hZkQV6Lew3pPI6lwXLaMWjGHYTy47rKJCmhaToKBL8EnB3+5Z8RsGgDTym
         5LiVo3DODGCgW66HxYR6TUzVjSD7O3DOrWpfIB/FeltvgmuvUBukPHHcJJQpoecukGwS
         VI41Z6RhiPf6B/64XFgIuCQiWAfyM9cvy4dJnp3oGrbDw5z5c04bTeqeCAiEK5hJMCqK
         IEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713918; x=1794318718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1Q1TGLPbIUVWrlqriCkZBVHwkEIWrEvexoFYfF54PE=;
        b=r1QJ/8XQRlSvGiHjciw6yx2eZJCQWgmgxRaNQVdw/tHeh/EP/ly2/6VDjmkXFseUSC
         1B9Fah3hy93Z9G375oqE0yRpPJkElwNALDX6nSxoCmi1bN+lVSa1Xu6JBS0zYSriCm+H
         UffXsocYw0ToBoa95aYEhrNNoTUYjLM4PSJdUNQsMig6f4D0KlsFpVo9+AN3y53RlAzS
         5lQbTow/TIyTuqfNTmehGHU5Mqwhw+eJ7Ye3XrwE7EsW5wc+H2jh6BIs5gczGeSfyNLA
         N0c8BwmW6nvQHOkaQgTPZKtxf3y/yn6ZMMeAzuB4fTVY/sfiLRAlM7e8E3JRoOHq65NW
         WjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBypHDlMl7RlasLILQpRTMFDWp4phyFbqjjDybn5SFPIm4jVxCaeOu9JKWAp8mcOcbS9qIeDq60cj85OsRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FBaoFZQDU3fwfPkO0MhNs1XEsGLlGSVhVnhsSW1vyJu1HVm/D
	00Rjoym6s2FQoK9x7yoc+T+HsQTI/a+1lh3rT9Pe1hvOPezFvRoPoArvMDlOySx6OH0=
X-Gm-Gg: AYBFou2pKUeRUrl5fu1o29B4+Wr1u4ahqLsVIus+Dtbp1Wta0FTBYF099Wny9TH6nGh
	SVV9qE7Im91H4rOJKuNnN81cP5X7SsYDALX7R47qR9RKzFUIiLfWSWhD1RZaXIJ7x2QfeSrQIQQ
	xsQCBV5An2FulS28XCUdQc0nTFQ34ZxyzDiXYub9nJ/w+ys2ho3sheFsJJSiMVmqTS8wZ/UgY2z
	JKA4Gzqp63wNxQmqO+tGpyfKqfB1vUZQg1Q9PDn/Vu9XIp5XHN1rGovwAg2trUWW6eYmOwZYVmq
	dZAGJaFdBKlR+DY9+BMoINeLXqY1vjfGV2mofQUyjT6FZ7DbEmOJyMJSwYKDeITSwGdIZSv0ViX
	CJJWfliRDDU1oPCpYvxQhIxL2HcAh7IWWd2lVlh9PJ6/26OB2D5otYubq8u9t7JxHn7/10JgC9O
	NmYhXIIjdR4MULb9UfkWdE7qioSLEAhgbsY65fT9vHhRDgR1cV6RwVWYNEgWGG9dhGgDvx2L1LX
	h0mItf6Zx784K6wNiB7H7/DqlsZNnINZvhwPWUG2JIosdorYJV+0EmgD8s6Xj+4A6e0jCQSW0HJ
	p/+paWAW3LfgfFupw+5xYzZKoqGXDQ==
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr309529445e9.31.1793713918332;
        Tue, 03 Nov 2026 05:51:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm115096725e9.14.2026.11.03.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:57 -0800 (PST)
Date: Tue, 3 Nov 2026 14:51:55 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk v2] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <aunm-2bPiq2xSZFW@pathway.suse.cz>
References: <20261030135802.663893-1-john.ogness@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030135802.663893-1-john.ogness@linutronix.de>

On Fri 2026-10-30 15:03:55, John Ogness wrote:
> unregister_console_locked() is called from within
> hlist_for_each_entry_safe(console_list) loops. This would be safe if
> unregister_console_locked() only unregistered the specified console. After
> all, that is what the _safe variant is for.
> 
> However, unregister_console_locked() calls printk_kthreads_check_locked(),
> which can unregister _multiple_ consoles if kthreads fail to start. This
> could lead to hlist_for_each_entry_safe() use-after-free scenarios because
> not only was the list entry removed, but possibly the following entry as
> well (the @n temporary storage of the next entry).
> 
> Move the call to printk_kthreads_check_locked() outside of
> unregister_console_locked(). Add comments to both functions to clarify
> if they are safe to be used in hlist_for_each_entry_safe(console_list)
> loops.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

JFYI, the patch has been committed into printk/linux.git,
branch for-7.4-fixups.

Best Regards,
Petr

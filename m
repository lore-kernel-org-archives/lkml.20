Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108853;
	b=LSIerRzGGYC2pGoP8tZgneOkVFbnWeffLiQKaMwpQDUNYs+uXYWp5ARjpsbaNiaCD4ZH
	 CyIQcqLJwIURx5Wkxfz7BkVvnwWwuFqyaOcBy8NJER0CTQ1Gx4LSQ1EzcuEt951waDQcf
	 euj88NhzsZsOiYivYIb/JpnPppvR4EwTLQ03VThHCgsLOyOFHPk8vD1nzZMJYn7kxK2ld
	 734tOmRlZKa0+YoBO606Ze39wK9+mSlA/erUlNXlPVkxPGeGKPA6FTMxev2xp7BkzWLo2
	 fFjQ8x0An/nzNIC/cmNxujPyyNnX+Otjb8TPJ1JoUyhxEr8YQUo+3DgzXCOwzByfFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
	b=VqSF+mgvtReGjdsvAWKaD09uPcvnet+8FNDW0lDVu7R3enU9jWkxaXA+rV2zqhmQzB6J
	 gFCU1I2+4IMktmdhgnnd/lf6+EpDv+zTSOBx9dFJKwFqgF3RwF8oVq4tHRrVMlK3tQH4a
	 b6WdI38EFPX7gesfneT1yhLHcs0fTpUVR19OiYc5ABEZEm0iPik8mUYFTuSudg7Nvat+r
	 FtZv/mTCLA9AcEiLqi+t4bAaBfHpfezhH3xZ6YR6jV6rL/TTkvXCd83FXJjRiQcAqC9rr
	 vYGQhnJGUVjnMqsMkaiKFGiYW3Dw9T1ulaJqAG7j+Pq+dTQF4wndHBTxdYmV1h8LGIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B52Xihmr;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B465F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B52Xihmr
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4697404c2bso539302866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793108846; x=1793713646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
        b=B52Xihmri68zEQvOwl0tik89nRtTdSvySUKtMLXC2dQa/2PIgZ+TqYVkwSGWfj6CLl
         fmUxnQLmnJTCCasfhumf/8XYsj1jH9CNWubsIqmQo37PVxYt/Lfl0aDxbI+Gvl0wgZTV
         vHjLMOphw3xRMpdsdwPxgavAmAb8/neFssd1A1L8ci+yspEuWJtchXTVqEmlLO8XgcQx
         xoCVYSNUqrJMnbEhrgdfdGpf7Y4xJVvf7RX1KVEBrmtM06CSZud3KU4Cq6mJA/aJFF+O
         H/O2V7URqxLCi73ulwpwCjk3aXhqOib2v/f2/2yB8tuRo8IYv9MCuxgh+SrcAofSghCa
         d/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108846; x=1793713646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi2VyxWb8hUzIvesy3TGk19mK9cZ4B2w+p8Em2DTRI4=;
        b=VaiEkF3nKXSekt7NOVcDVUBD71Rw87mPem4vRBdIvyn2tPYs7jzMv2fIaUm6XNpibS
         cG0iEYSlkVe+M+B2eX4nxw90Ds8B7EYEogw4Pmx9NSXrCwFxIQrYwZ+V/e8197NWebN3
         c5nUTPII1A4nqAoD+1dmpJzh6bz0HUln46Wdca0tnmv/eyB/Hw0q2ysO5ffRUuiUm8zc
         17h8D8VFydUHwhSN2wsa1JiGtI6sUEStbK3LEryE6U4sRgtB3Hd4UzLOd8e4MwTQB82h
         Y6UqOvUbgGBNOZ3Xhzkk8dSXsAKvSLSspNeLAMjqXF54ic1rTa3plM9IMWwsG3/8083l
         Sr8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnCGVQH3oio8ZQZkXrCmBIHoeRBzDCwpm+p/HoXxjQxDDLiyrP7mA40lW1HfH/pnUIoPTPEg771LfGMkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyFwWM+Pk6kkaTDr4IjeDiZTbmOd6kyNQA7D93tsmwXIdGXYHY
	3Zwve1s2f68OLC00Jc4YS4jIi4HmnHNd0pq1QltsBtpP5KzM8TtrDr71e+Q+vQPJytE=
X-Gm-Gg: AYBFou3WWlQjAYyDFxLi7JVQPzBmhDNKDTCNvePggBMv29l6xdI8hMfvfor/olSs5Jt
	BrB10rJUJE+adgCpBTt1VPilet+rf4ZsVqQWi4S+riglsYvGQe/U+xXEIWSpf3iPT2ta27gxI1+
	VfzIczCa4/292Zuf8fWY7PebsJgBOjWapUY+qZ+r3gmIcgy+mqGg4ArE0No7Yu0MJoHU8ajXXuX
	5736LdGq/cai1EUvXmQjzqn63kOKXqaoRkywxYPuqgoPoJFyj/paK3vNHx57Sh9waQCD+R+Tv5K
	NwAeMWJRQZmIW4ToCApBC/UhWv/ivt5WEGhFwsAIeSIRS+JEJhExsQOvY/PKe4Smvwa/4DTM+8D
	HI6MLvp1umcDb1lo7mwBpi0urbR5/wkrZzVXCpXFqGkSrr5IrnozbNjEoj8d8clt16Bm/ppLVak
	GaTM/qamSAOsI54Xqyxz+e3FJqwIL2Kzad70cDx1UfL2cAi3KSKCJD0zc8q4y9Makz8yDxHhoit
	W1aTbwfdDGale0pHYfUAxtt1GXnONj4H4xEyICDhIs7DRZiK1TREPq6FiKd/7LHMWkh4fYIXVp2
	A3u5jVaa2G4eBUXLZs897Yg5JWAG+y/8gHOnAZyp4/LHofe3kOd+
X-Received: by 2002:a17:907:d649:b0:c36:7579:fe6d with SMTP id a640c23a62f3a-c46bddce8edmr1009655366b.11.1793108845951;
        Tue, 27 Oct 2026 06:47:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm460325266b.33.2026.10.27.06.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:47:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:47:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: John Ogness <john.ogness@linutronix.de>, chris@chrisdown.name,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <auCraiuMZApQHiNA@pathway.suse.cz>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
 <87a4o0k3qa.fsf@jogness.linutronix.de>
 <at9qgBucVm-QHnye@pathway.suse.cz>
 <87zew0ifpp.fsf@jogness.linutronix.de>
 <at-Ppa86sBw7mO8W@gmail.com>
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
In-Reply-To: <at-Ppa86sBw7mO8W@gmail.com>

On Mon 2026-10-26 10:49:32, Breno Leitao wrote:
> A bit of context on the use case from our side.
> 
> In an ideal world netconsole is enabled from early boot through the
> kernel command line, but in some case this is impossible
> (linux as bootloaders - ipxe/sd-stubs/etc).
> 
> The other way to setup netconsole is to create a new target at runtime
> through configfs. Netconsole then only sends messages from the time the
> target is enabled.
> 
> For this second case, I would like to replay the whole kernel log on
> netconsole, such as previous messages. Something might have happened
> before the target was enabled, and we want visibility into that.

Just to be sure that I understand it correctly. 

Is the netconsole registered before it gets functional, please?

Is it possible to detect that the netconsole is not yet functional
and when it could start working?

I ask because there is the flag CON_PRINTBUFFER which should cause
re-playing all messages on the console during registration.

A solution might be to delay the console registration until
the netwok target is really working.

Another solution might be to temporary block/disable the console
until it gets operational. We already have console_suspend()/resume()
API. But we might need something new to distinguish it from
the system suspend/resume handling.

> That said, the "per-console counter" might work as well, since it would
> start as 0, thus, we know that netconsole target would be behind, and
> try to replay? (not sure how yet)

This is what the console_try_replay_all() does. The only difference
is that it resets the counter to the oldest available message,
see __console_rewind_all(). It is just a small optimization
when the ring buffer is already full and the oldest messages
are gone.

> That said, one way or another might work for our purposes ?!

Best Regards,
Petr

Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2EF37E2E9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555991; cv=none; b=c0tGVQoVDEN5h5XjZjd1IxgfeI7tSU5vC/IyiiX2qpxnqGtLfSYE+QZyQ3Q1sduqqMVaxaIamYqG92ca0K9eLUgDLhZkLR0QofOBqdgCIFQpFTy8jQ0NsV9namiqBpL71294DsKbB9PcWIar5zF58xOHR7Ca/hDW5aTITuqSdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555991; c=relaxed/simple;
	bh=z8Ql0rx9474CVXsbDoQ1DGgX6nKH4NOGjG3vyIDSecA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=njejjiCk7COEIPfTV6N1HJs1B9yLWRb4KVKVRKFR0ihxecqb/HHcC3Bs4JcPDN6AUZrZi/B7BG2EXNU8Fuc0biQueI+Jgl44wo+1LBBhz95vMVyr6vWuFW0UUMjk0x41UBI5YXn8PUamGIxAMfxCWWjZg9m0GSHQoSbYEQ6B8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcZIUlgn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FcZIUlgn"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c6f764f82so1560024f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791555989; x=1792160789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kpVKujAoxSPhrY4wgMm8ZhIwBFuY1fo6PWDoxAdBmY=;
        b=FcZIUlgnw6Z/4WnopPtuEKfuilNNisRomUJVEA8Kz6gkmJ7vGThNbEoWdYfljjKdqY
         v6MH8NdOzhsAl8vXVaUJrc4e1WB75B3fNKyiPyuoA7jgIo4ryIsfR22/NLof7xcEs+9O
         9AR9OepJUJ5sh2MKtSa+bysa41xI2QdCYHyg86GS32w+34AeeYLbIFKvoKlcDMkf4lrY
         jzxspygyU5BhJO3/JqFZXaTZAS2QrY/oFYUhOBlo3l9YO0HRo+LxH6PU+H+gFvpGUgwh
         r6Kam7DVsuwQTZQ2Zmp9/v1tytFCYmovI4z5zEmV2gdbE6yRO/q8RvNmhJCc/PrQZVrZ
         If0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555989; x=1792160789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kpVKujAoxSPhrY4wgMm8ZhIwBFuY1fo6PWDoxAdBmY=;
        b=GdgIIvTk5X/7/o5Y+UIue/dh3BfAICkNrTlcF2qqeKBsV8MWmgT9YGcdOaNJqoEvMZ
         VR2Kv6zRG3epBTLM7HsnrWdd8HMM7j4VthUK0OmQhL/0W01maLiIKRn1fueB1KqgZDCn
         b1Nx7s+uMqTpYKFetoYmKVMZYcm58eVrZGmoOL2eLysINzJ672lqdJcyPBMt60BDJbuy
         4B4N8KCxuJ1OyAyo4mqC8RqEhhRpNPe0Bsq7SZLjhFmXlz2PZtQ9c4JMttcXS7+Mvl3F
         wqEv8Wl5g7xldmUIy2tL+KysGyHuyey6G7jrb4OO6dFePb9oqQB1odaT4DqQCBd/54iT
         lvOw==
X-Forwarded-Encrypted: i=1; AKwUvBxBAssz6m+vsI8ZxTQPSMvauj+snOKuQJWHxUhKQOu9jKx1uqbAeMqvsGCOVMdR29HGhFqed3aktynQE8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8ahkgcuxpgAcQNwyZbEge0YfwXm65ql+ZYVlSF8CxLJ/mKl6L
	L60qSYAuMGsiw7wSbQfhS4bLUfZ/Uw7PoFn8wQ6NHPFTfMAP2pQNDOOS
X-Gm-Gg: AYBFou21oOJobQR3u7bAXZRXH9j5IO+JS8nO1Jfwy0373L1WKrXWbyx5m1zZKiAdTor
	XuKI9/uz3MiwCo5Vedx7CTuWSGmQ3u5X8Ayc6DL4f/Mctcav3n3rbi+dDyTtaKq/ZSi84ahIpLr
	dF8dN3kJ5Q8UknyFJmt8EXkI9Hfw7l+yJ1t0lbk6nMFK8LCr6eV9HajwCytOQYBG5oSgVJgctmX
	O5xINwK04oGe2XilcIEuhXm7KyrR4ZlrUH0Lk4hAmaStu1A5HqxHL+ZG3gOaIdbQnDPcTJ3+URu
	ikv/h0Y83t/jWuMxpgVYfkC7GYIZWORHR7Glk03qSOQPea7UUpxrpn7kQ976E2rHC84963r5wxl
	+jiY3wosJNNs9sKHprK23oJIV5GvEFJlxFdvGvbNMqllea9XAFMf/4LXrTXzZmEO3YYKdTXdq81
	nVbEI7W+yr+Xaq0HSqXfZupVeQqZ+XPBn3F/g40YNL/0035bNyjoeg0Xu8HYfYoGKiDyR7YK9K0
	xu+zzkXlhspTJe/r3jyZ3Hul9SxWU9wskTe
X-Received: by 2002:a05:6000:29c3:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48dba7892f4mr2610537f8f.4.1791555988382;
        Fri, 09 Oct 2026 07:26:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm4591765f8f.16.2026.10.09.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:26:28 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:26:27 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: helpdesk@kernel.org, Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <20261009152627.285d814b@pumpkin>
In-Reply-To: <asjrq9g8EoUGepcH@pathway.suse.cz>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 15:27:07 +0200
Petr Mladek <pmladek@suse.com> wrote:

> Address    : printk@lists.linux.dev
> Description: Linux printk and kernel string formatting development
> Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> Allow HTML : N
> Archives   : Y
> 
> Reasons for the list and additional info:
> 
> Honestly, the main motivation is to allow sending Sashiko review
> for changes in PRINTK and VSPRINTF subsystems as a reply to
> the mailing list.

There is also the smaller/faster printf code in 'nolibc'.
Might be worth mentioning that as well.

David

> 
> I have discussed this with John at Plumbers conference. We both
> agree that Sashiko review is useful and often has to be addressed.
> It is much easier to reply a mail than searching for the review
> via the WebUI, copy/paste it to a mail, and comment on it.
> 
> In addition, there are several people interested into printk and
> string formatting code. The mailing list would make it easier to get
> all interested people notified about new patches and problems
> in this area.
> 
> That said, printk and string formatting are related only to some
> degree. The printk() code is more about tricks how to store
> the messages and show them in various context. While the string
> formatting is about tricky buffer manipulation and helpers for
> generating a human readable output of various data structures.
> 
> There is only partial overlap of people interested into these
> two areas. Each group might deserve its own mailing list. But
> I would start simple with a common mailing list. We could always
> add another one when needed.
> 
> Best Regards,
> Petr


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422127;
	b=GCl9SwLEuGHubAbZKIwnLYPBjxiGFipCfLnXIb10H+XX+XLkkKYPtSpJLBHOutS+fU3h
	 BfcdxA5BIm1yBiLlk/kRUQI3wbNuMqX3EspKQahjQizPh7QmzRSSKmbke0gZoan8/+Kyy
	 pFTkP4DIBSR4iYzaM63BG+7GnrSlCyTBDFiV98ke9P9y7povM3yjA3aQ1WZ/Xg1cskUii
	 dkPv1ZSY80KNNQtQWfXRxueQCiFvU1xNZmpzEkNyUedkTCah19kOzEyPvcepbNL1e8aAQ
	 6oCwjrlTM4L88YGKcn4K2I14gOJrC5Y/3btEq6aK87fKLi+229lcGogxGRd47DZZWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LfVfcu6Q4N47G8JbJZh5nvYxBcoldWLFlOXsTDJqUUY=;
	b=IF5aY0W3G/zdnIqFS2gUvz0bfLyT/UhYYEAH2zrRq22YzqXcb9tNypKzzR0O200REnZs
	 bTjQIbar5IPXNy65+hpg/3OwYcZvUfGFq/HEFMeOQgclPJEMhgF0FiwJZZO7nvzg2L6RF
	 WI0TELSr1VYAPX5s3nHUihZHZcR1NuJyLwjcwc4cH+NkFLstlCWJE4ymVnX5wGvkHdXpk
	 g+vyRN4AvhjJE9BAqw+GAohUqUiQUwhLxvC8sWy7bMqZA8NBuaJ6fv9z5gvjBqt5sEj+f
	 9xQWpNdYnF7D+4Z0xvri/hpGmk0jKxF+aP9YhAcUgigd0VlIGlbfgxVHT3HKyBo1PwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CWAXXSP8;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E5607BF05
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C98E5607BF05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CWAXXSP8
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so23828265e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792422125; x=1793026925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfVfcu6Q4N47G8JbJZh5nvYxBcoldWLFlOXsTDJqUUY=;
        b=CWAXXSP8CaunJtTJwVG3h32oKKfHYIYoz4wfhmWfq6d3Uz6J8+Vt2iktVwLhdbNJHB
         CMsRQiQy+8kIhoArKZsRSzPwjDf+li+gHarpXfdTFz2USc2kpQKYQccSB4z9nV5DhfN3
         cm+2YnIdBNYxpIa0QezdpTJphdL4CQDWJHLbTK1QEelmk+qQG/USFVN75D0tTnK+hj2S
         0fLTh7z4hmhfajWQ/BnPl9drHn8jRLcVwjW2bPyUWhYxF6NIclDMTwWQzDuuqlp33crh
         DwIKGlb0fWQgiCSA/MS0ajZQrhH6XRJtrOwukR0+iYZpKdz/Y3mcXAIHdGZMPJgQAleL
         Lv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422125; x=1793026925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfVfcu6Q4N47G8JbJZh5nvYxBcoldWLFlOXsTDJqUUY=;
        b=KYZgLQOF+a0aWWgNE4Q5Al3xkss8pROz93MhvOmEJfb509EfO02vVOm+kT4ajf/r0S
         uVFDFv78DZiihJGYbAv8y/emvJ4nJtbPseahC2Mzcf0kxL33pozIZBkBp1+cDgAeJvgs
         7pl6z5pptAi6wHpWy1QFCu2DhD8pLYEYlIUSWaUv1HhWUkQe2AL2P7masrqV1x9ZfqOb
         5nFd4zdM51XG68ziuODFEGT7I0Iq6AlgC0DWDXZ+QwzaPjlUAx57IUH4Rxthe+5yQHCK
         wM3gUwjy6Ck3QnGXjnHsX94sx0otlCHX++bW4Ye7deX6jl2CbOxAPWHU/+sRGyfx4Cc9
         hr0g==
X-Forwarded-Encrypted: i=1; AKwUvBwb5SOkuZ7IvKmwlwSXbUkj/kPpu76XCxi2XZjER5M2o0fc7sEcTJZ+HQPk5xCEE+csggetVxo2FCc3Ajs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9OhtfrMOP4GwDc9fm/1ITzVZY3CrvQU0OKPX/lodRxM8Nvj17
	/IDZ73uO4lctXap3mLLEWeVpczx9uT4umLCR+R6qxDSokmlhrP8r4qLj3PxwqZEwjck=
X-Gm-Gg: AYBFou2IQyAxWMR56AWrbQlI+tb6v4UvvsTe0NMipsebP24yzNrVoJ4cf6GcRyRyjCI
	W6iirokZMU9F8in04ctDW1XMNWbagy4y10WQ4YKcqcWbd78JcyjUzl32bxanaL323pxmYUuZ2ZN
	jirrRAZPDO07M4oNqXRHXDo4Ba1sEu+cDdWFWvp11U3DlJAxgR0Jehl4DdrB1kjkAw5t+JeGyVC
	qVEMrNCUoaYXkXnNG9nN+jWuPPv9BUvoyuIAR3QQ83AkNwvkImaifnxnbL90Vs4kictw2UFyNVk
	5gVyTyMCTFB3qqNJeDojWHm29bA2Vqs/00kZdvg6QGso/YeArTNo/L7o/hrlq4/GhplLqeJdSku
	xNduC3A+0UtpY07vjwYVF5G6a6Uqnmw5Q0C+yHUQAHnRFLdMZ9OZXcz74WCCtCi0OU9CaEc5kvF
	nhydIGPEIkBuygPpY3RDh/ogGwXFxYKg1wqs1hkIk2jeZFgGdGT6Nxsh6AsZrft90OqY9xMXrl
X-Received: by 2002:a05:600c:1d0e:b0:4a1:e5ad:33b0 with SMTP id 5b1f17b1804b1-4a1e5ad3b54mr72083215e9.8.1792422124943;
        Mon, 19 Oct 2026 08:02:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d28b698asm290421435e9.11.2026.10.19.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:02:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:02:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: helpdesk@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: Create printk@lists.linux.dev
Message-ID: <atYw6G8V1gP-ksTM@pathway.suse.cz>
References: <asjrq9g8EoUGepcH@pathway.suse.cz>
 <as3UxRboBZYY3oCH@ashevche-desk.local>
 <as3VC2TmhcRXg0Xj@ashevche-desk.local>
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
In-Reply-To: <as3VC2TmhcRXg0Xj@ashevche-desk.local>

Hi, helpdesk,

gently ping.

On Tue 2026-10-13 09:51:55, Andy Shevchenko wrote:
> On Tue, Oct 13, 2026 at 09:50:50AM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 09, 2026 at 03:27:07PM +0200, Petr Mladek wrote:
> > > Address    : printk@lists.linux.dev
> > > Description: Linux printk and kernel string formatting development
> > > Owners     : pmladek@suse.com, john.ogness@linutronix.de, andriy.shevchenko@linux.intel.com, rostedt@goodmis.org
> > > Allow HTML : N
> > > Archives   : Y
> > > 
> > > Reasons for the list and additional info:
> > > 
> > > Honestly, the main motivation is to allow sending Sashiko review
> > > for changes in PRINTK and VSPRINTF subsystems as a reply to
> > > the mailing list.
> > > 
> > > I have discussed this with John at Plumbers conference. We both
> > > agree that Sashiko review is useful and often has to be addressed.
> > > It is much easier to reply a mail than searching for the review
> > > via the WebUI, copy/paste it to a mail, and comment on it.
> > > 
> > > In addition, there are several people interested into printk and
> > > string formatting code. The mailing list would make it easier to get
> > > all interested people notified about new patches and problems
> > > in this area.
> > > 
> > > That said, printk and string formatting are related only to some
> > > degree. The printk() code is more about tricks how to store
> > > the messages and show them in various context. While the string
> > > formatting is about tricky buffer manipulation and helpers for
> > > generating a human readable output of various data structures.
> > > 
> > > There is only partial overlap of people interested into these
> > > two areas. Each group might deserve its own mailing list. But
> > > I would start simple with a common mailing list. We could always
> > > add another one when needed.
> > 
> > Fine by me. Should I do anything, or will I be subscribed automatically
> > (as an owner)?
> 
> Ah, and it's better to have my andy@kernel.org address.

I hope that anyone from helpdesk will actually create the mailing list ;-)

Or I wonder if I did something wrong.

Best Regards,
Petr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783985;
	b=phK2Il5MA5mnvloa7AFLMlYRg5A4Mtkuxjw0jhULMyWwJxoJlSQjAXm7INsbfCHQWyoi
	 oTdh+ZhAFIBAnuBipltpUuln7sWYokQx9ql0D2fxp2b8ui5RpMhutHZwcD4zovE4J/4sL
	 OYD8/2yBOqDbhuA4s+Ra3uoWVh7aosowXgPdXNq5fa8n/uysQrqn5OFdjI8szuOqSIiGM
	 eng/gjQcrgLDYgu2qypbBMohA5zPx1AvQeIdaDnHvExaeRwLugAPnXBq+LSychk9fMazf
	 I6+si+lSon8+m/hgWVIPNfoelDYP3bHiA4cHF2DtbYbGEJdRCM1Ot5CGTRDY5n6q7fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Yvthss1FZeqCIQjhmXOlwbHPhSn4bLFrdViNSfOo4xU=;
	b=BqnvpwG0QAj4vXYMnluYW6PeqItYAW0aDTLrWU9kxnPHbTX0Brm0pYDdyWWQon6jrWdc
	 1ouEN+B9sQpUn5UsO1Y60KG0VM/h/MvkiymdQgs4UorMg+fBRlXjGpsnzNhcQ8tOEYErp
	 sojzhlOnh3xdESuG8aRgmz7PO0sT+0QBVGGjun7rAK1U80+XkjeLSW1WjLHmNFo2vcPG2
	 cC6E2Ie5QyS3aRA7CH/1dNhtJ4ZEbtjDBeWZDhyNWTyP24L2/0vlUrxBDIFt1vcq45CpP
	 WYRybLjzCjtVRDodXtr6fz463kGIdEkPmJsZFybD8FVgXL9MI7ACQq4SH0TxgL0R6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LVX6uB0U;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD3606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDD3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LVX6uB0U
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d1da913so275057f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793783983; x=1794388783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yvthss1FZeqCIQjhmXOlwbHPhSn4bLFrdViNSfOo4xU=;
        b=LVX6uB0UN29QGoJeeILMlfSf4xkWp9eJHzmH8AL68jmVRQQ6penYb2AEn3/UC7h6Bi
         s1y3to3xsoZYyRLQZsgqwdriHzemIN75tVrdwGLHZlcCCe1l5fV0CdopkX/Ugb+86sds
         vWMcJ8HwkUUm6IMJmfyFjdlgCmEUfCdw8TfPgaOAyghjsCBl7RY6RsfjAMZawyWZgsuR
         eXKw8E+uuRChm7/+7RbMt4JHdFW+cTPWpMM/4s0777SwK245T2hdro1k7wc1dcLC7F1+
         JMGh2/1p9i//YE602wFMmPAcHwvOrhohz7tsmps2c/6JUXmxzBpEWlMpOSthufxSKbiZ
         76ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783983; x=1794388783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yvthss1FZeqCIQjhmXOlwbHPhSn4bLFrdViNSfOo4xU=;
        b=G1ggi+91H15oGSFipDyI95ASX6mI9nX/YVNOdvXRFzidmZCU+ctYFJUEtbU6ONMyY3
         I85I2eqAj/4/oaNF2FRIBxGM0IcMLiyv23zr0UxmdhtRrzmlSWjZ/skmOXSwXb0nGRC2
         CUdJgKRNXCWA+pAgB87DO5LDMKCKEkaFR6pM5ga+OfsnexYogzw8G6iUfT1ws7oRmhmV
         npQp8+mo41O3c1ZB0gAwgRFxNjQfZlh+Ivem+9gsm8LtAip41ZoxDNnrpfYwC+JFm5x8
         zg/o308OQ0ssC7kU/ltIq200pipS09iaV+e0UqbiN5fW7Tkxreq9jmARgXcDrfcVSubm
         7kQA==
X-Forwarded-Encrypted: i=1; AKwUvByEKisa+Gsive1iouMufoTYzYiIEdj8D2Pnybrp0nx3fqP0pxm+pzY7qEkteLIcVNwkNytnQ4xDJhAY18I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DBoFdcud/IjsmOxNQmMFHwS3DG2RwjPkWx/Wx9PkVjitV0AY6
	Ua6IDvqLH+NS6QtBG5Iki1Rh83PTJqIb6HYo9cHRUXlN0Rsk+xqu6ktzeZIKvFZyJ1g=
X-Gm-Gg: AYBFou2NHGw4cT5PqCyKS4SCLHEOkNHIzATyOY7hp+ctjiYCRKyF1sV/OobYy3Rr9nw
	3dCUhyYVrOseSDslCwl+CcSNoDwfu2uigTRY8rY0Y47QeTS4TYi2hYxx+kvbQvP309csku8wl2/
	P5+ALdNrGOB2fRyShx6zN6HTXC8JGfewxjVSrKOaKrmdhj1n2UIX5ArpJHPnZfYjMbp70V5U10U
	U6SWeG1QJ6aCHOnAOIxvv0QeL3RATg6yfYOlMwjelfifV5HKuYafhvJBA5f5YAaFit3wM0+S4u8
	IzrXyubohH47mZ+CLnxj1iWWtlUWvR5Yv/uTnWWe/UTdDpwgErAIMshhISNqvIH7f4lrjfcO1HY
	6LqSMrx3zzluuI+6Harmdch7n1dPeCv6r3WBuZU9FdA/xwofK6hiReyxSYbISreLyoeEHYeUYUO
	bQjR8qPrYNIPd79ifyN4KtsTqc/3fV97H9dc1FRfxS+z23P12on/MWN8wCN9hGeMrEmKNxfpTwO
	VBrrw5PIB5nQFmtsMVraUYV8+vV/aMeGNpvu4RGajTDGPZCSwqAQz2W63Cfsc0RsYvXMZVzXt08
	V3n8CYp5TpYuEt+FOlHLQhpPkRBSusr9vM91IpkSRB9G
X-Received: by 2002:a05:6000:3106:b0:48f:bbea:1a93 with SMTP id ffacd0b85a97d-48fbbea1c39mr8637656f8f.15.1793783983526;
        Wed, 04 Nov 2026 01:19:43 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea1811c4sm2887982f8f.3.2026.11.04.01.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:19:43 -0800 (PST)
Date: Wed, 4 Nov 2026 10:19:41 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] stackdepot: don't WARN when the depot runs out of pools
Message-ID: <aur4rU-I1BhxrxYK@pathway.suse.cz>
References: <20261103-stackdepot-full-warn-v1-1-41f1fc651b64@debian.org>
 <87wlqtxb14.fsf@jogness.linutronix.de>
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
In-Reply-To: <87wlqtxb14.fsf@jogness.linutronix.de>

On Wed 2026-11-04 09:26:55, John Ogness wrote:
> On 2026-11-03, Breno Leitao <leitao@debian.org> wrote:
> > That deferral only applies to legacy consoles. ON nbcon WARN() puts the
> > CPU in emergency mode, and in emergency mode printk() flushes all
> > pending records to the nbcon consoles from the calling context.
> 
> Yes. WARN() is supposed to be for critical issues.

I thought whether it is fine that NBCON consoles ignored printk
deferred context. I could imagine that WARN() is used just to
generate the backtrace but the message itself is not that critical.

Well, it was added to the stackdepot code by the commit a914d8d6cf204287aa
("lib/stackdepot: add printk_deferred_enter/exit guards"). And the
reason was to avoid deadlocks in the console code. And the deadlock
is prevented in the NBCON code by using try_lock approach. So that
NBCON consoles do not need to be deferred to prevent deadlocks.

And if anyone wants a less critical backtrace then we should introduce
another API for this, e.g. INFO().

> > With
> > a slow serial console (pl011 is an nbcon console) and a backlog of
> > messages, that flush can outlast the hard lockup threshold, all of it
> > with pool_lock held and IRQs disabled, while every other CPU that needs
> > to save a new stack trace spins on pool_lock.
> 
> Several serial drivers call touch_nmi_watchdog() (such as 8250) to avoid
> this issue. Perhaps the pl011 should be doing this as well (at least for
> the write_atomic() path)?

I agree that it would make sense.

> > Running out of depot space is an expected condition under heavy debug
> > load, not a kernel bug, so report it with pr_warn_once() instead.
> 
> This is the key takeaway. WARN() is not appropriate here.

I agree:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

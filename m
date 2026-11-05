Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920916;
	b=o09+W7JZnvtjqPlAfKN33l1HCtS+E24CH9OhhoX6umO6wnvGgp7uwL/kySavbmqj77vu
	 TOKkyIaB+Rg4Kc2P38s0s8AW0dVKKjRtSkfKU1kEhFjEp5eaKmW9KDBqKi8Q1jravYW1Q
	 u5w2pis6cV00s5Aj++K7NDeFIL21uM/UlQw/NlLuPRcv4RHp4IXa6I31OyHUbZHkRsUnW
	 9fZ5TnbYr3WJbuzqmkFnKY2OayQzHa9aiGoPsCIX0x4E+kigFcb2vXM93Eu5p/VbKPh1h
	 i9H2yZ8A75Wx/LA3Q/z8yq8/fQjxoxyFxf04c2VH+ivSD0K7oNWaGP0mIx1tUi6mguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
	b=dtwAbCm1yTNZs69ytLsJaDAO9tpzOJL2QrWbBhMbuyeJ09Jt2rbNqAog3zmgNVmYyuSH
	 D2aq0NkONdY/HKbGfE888gEZiujHuFue7cS/ZNbunAx1fjN2Lu/RL6O+IppebbpSz/j2t
	 bojzIORkGv3x9KlxD7Zw2CoewNWeXwWDavAiNEZObPQ1kMYnLNkuJi3cIjyxRo9exzk9P
	 UXTDwp3j4vEXcUDLhJSmFfyZz4ztv7SjXcH0HoF1ZX91q23SXE1XIVwyY5OnV93k8I7EU
	 XEmUz1Q2i0LdPJexEgPJMHb6AyMF0SA0272xAl+ltARP38GMgjy5EZAkaQOIRL1YpSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gPo9SPxF;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0809C606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0809C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gPo9SPxF
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c445c95d553so7020466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793920913; x=1794525713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=gPo9SPxFi2rVLsKhGrCqqE5hE92NbFoq1Zi2JOci1ChfKUbD/F6dG9k1a30KNoO4ZF
         wClRGp+wp2ZjBS96hWxBSQamrLKtcD7VPC+k7NnmR7j7oQdpAKf8jlOaJBX3V5M92Mfj
         b85PiFEwv9zEk1nfcT8S76Bsz/+2lc4z+sJno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920913; x=1794525713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CY6kteulYS6YGOwsvXKGn1qUkLcgM9XJ2I0e0tk+JA=;
        b=gmKzHs7GQUenJI5gjhanlMj4qvcFg0+96O+BV44p/dici/QTLy4XBHMQgAJVdpcA+b
         XVuS2dEDkORwBVmWMGRNHkkT6jRjCpNiuWmYTkwZrJEOyNnulFJ46XlCyUldJcl8rh5d
         JOt+K3RPCTOCZUEP9F3XQSTecYUGSk5P2FyjmxcYGjUbmsArl7grraZMNdVx7gLueO+W
         GPYmoR0rUtbCIWjhURV495pu9bCKmLpSBXtLj7BT8fwTLGc35KeiiVg7zscXd9KjiJ+i
         OYArkW5fjqgsXStZVStithTYxS7QVbty0mYBJfcZDpXE6ItaWqf7lyraF1h7CneFAKET
         DXSA==
X-Forwarded-Encrypted: i=1; AKwUvBwDyiUFrqmj0fcez+LH8zT7bNPPugBANByV4BMNC/PdRNiFLp3vpeS30abv6O5Hrg5CFCNlOciHKwmKaro=@vger.kernel.org
X-Gm-Message-State: APuU4Z91zHFVODf9wKHQqHRAOzU1AW8O8cHm859sKVGhahCfG2DBwPbZ
	DYcXuTbI3EJGJ2RG4jPGInbffwaT/xVseimtwt9tQGRYuTCjFSQHLlNprEdLPqqqNPnI5r+cD4/
	sxE+yTfgY1g==
X-Gm-Gg: AYBFou03JFn+tPqA8gNgsI3HPqfHTQLONxNCLtVqHiZ2F3Nwhl82eGrPOFQvqMwcK6a
	I2yyYdeWeHsYGIwPXfXr4692F/ksM34QPAeKzzt/gUD7dOuYuMiehpkaA/5iyNwTjOGQ5wr1Z+p
	7pQnbr0KYp0e6NjUmJ+rbeTvleq4AfbBC+FOpVsGig0dwwes4RDhrWsEousT1sq8dS5N1KG/CAq
	b2G4p5tPKKiTITUQkj/LZCtwm2QDVyaUjnkUemx9kbAkWyIM4nSShvqApDrfn/kCnt1c53Duigv
	NJJLlLMgMbA58wqjYmZ0IIjpti8akmj91PQtWmJfbZoQxVPKIRJ9eWUPGKGxDS1WyLjkI9vuhvr
	qmXOBkOfgUfFJ5j7engPEIJifqUw8snM+WvsjZrdjRnKxUp1ZYwWryj7FEASdGzrSDTCQkzBi9J
	3uM00UxNuTsMKXnhzq2Obq6T3McEomhJPVj13qSbEM88in2iot5/5UIElsvrL2zZNTJ0gypiaDI
	TqA9bcKrpr90gUl2RJxTcz/TwTo15V7jQWVIqyWsrg0cmr5757YBrngh2mUp1GO1S+dRSb6HeR5
	gcvqQX2VzRpNjyuhGKoC634xAGTJnv7eM0CjySpGIHWfpqy4CrheD0JgoXL4RVnBpuy37zAkdUn
	R7w==
X-Received: by 2002:a17:907:fd17:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c4d344a88eamr72631966b.2.1793920913270;
        Thu, 05 Nov 2026 15:21:53 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562eb04sm26266266b.23.2026.11.05.15.21.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:21:52 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c445c95d553so7018066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2sT2AsQUFzqu7150GI1dIa5tDOxvb/m+xi9XWLKM79OcMKa/buFHiLDoysrmuQWkQf761zhz2RFjUXfk=@vger.kernel.org
X-Received: by 2002:a17:907:9c05:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c4d34c42700mr81823766b.32.1793920911855; Thu, 05 Nov 2026
 15:21:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793876837.git.alx@kernel.org> <9c81f6f62fd0e908e683c4c08b09a1f95bc2ec9c.1793876837.git.alx@kernel.org>
 <20261105111423.360f4ba8@gandalf.local.home> <auyuINXEJKc1KoG7@devuan>
 <20261105115019.2fe7c91b@gandalf.local.home> <auy0O467UqOzqYub@devuan>
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local>
 <auzxXyAU6zyHtMtn@devuan> <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
 <auz79Izf6Q5qOQPi@devuan>
In-Reply-To: <auz79Izf6Q5qOQPi@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 15:21:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
X-Gm-Features: AclHuK-tRyoIoIlVqV1ObINoCwGUeXX8nUrj1waZW-FHLSpz23irfQuKt09nDLk
Message-ID: <CAHk-=wgGLZRQj_a9r9i2ZdhGZKKVxG+-mAj=pb=pRYyJaHAquw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andreas Schwab <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 14:25, Alejandro Colomar <alx@kernel.org> wrote:
>
> I'm not a fan of git-grep(1), because it's easier to remember grep(1),
> as I already need to remember it for other stuff.

Why?

"git grep" is *literally* the exact same thing as "git ls-files |
xargs grep" that you apparently find so natural. It takes all the same
arguments as "grep" does.

Except "git grep" is way more capable if you ever go "Oh, but I'd like
to go back to an older version".

That makes no sense.

> I'm finding some issues with git-ls-files(1), though: it's listing
> symlinks, which grep(1) complains about.  I wish I could discard those
> with something like '-type f'.

Christ.

"Doctor, doctor, it hurts when I hit myself in the face with a spiky object".

Stop doing that. You're just being silly for no reason.

>         $ time git ls-files | xargs grep ARRAY_SIZE | wc -l

Just do the sane thing. Look:

   git grep ARRAY_SIZE | wc -l

Trust me. Just learn to write "git grep". After five minutes of doing
that, you'll realize that you should always have done it, and you were
silly thinking anything else.

And it's faster too:

  $ time git ls-files | xargs grep ARRAY_SIZE 2&>1 > /dev/null

  real 0m0.636s
  user 0m0.367s
  sys 0m0.307s

  $ time git grep ARRAY_SIZE > /dev/null

  real 0m0.519s
  user 0m1.837s
  sys 0m1.719s

(I used that "2&>1" to obviously remove the errors from the stupid
mis-used of xargs).

And it's *safer* too, because if you have filenames with spaces, "git
grep" does the right thing. Your xargs thing now needs to start using
"-z" to git ls-files and "-0" to grep to actually be safe.

So just embrace "git grep". I can pretty much guarantee that if you
use it a while you'll never go back.

            Linus

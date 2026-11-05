Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915318;
	b=hiGTJw46AK1MrrB+aKP6KaM0SE1bG6ckt2132oNbTMDT1Skw4LVBfGrpnKShF+L6+wJA
	 k+L1rqj7VhTo7M3rRZ2VmTo0m7bMiZHrvZDrQatxVsrRRDDbHPKGcn+FlycXPRi+M/bmf
	 waKaslzvpa+fz5GNvJ5dzcuzK0YTLWDaVryPdUXGIN5jjbNKGPw5nw9pTr+CnW2jZNNax
	 cXjBnY6QIq5ZXxlIPrr5SAsBQb59o39JV+syC3uFtCaIHCqEbL0oAaAKVC+n+lZ8EQS47
	 qAlqQha6MfqC/pa6VepKg35XWlkDYKHN6ZcXaZdhqH+vTAPmCr+kkmih/kdwCqq3DnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
	b=OacZlGgQIDjQ4T4JASkOWcU95x8kDzojMXg9TVf2M592yskgiM8oGA4RN81DN3BzoK6K
	 OFauxwTqu2gYciZ+kK6sOz1Vpo7TwGVM+33q6XVoTJSsqTaI4zhvwiTHhva5vWd4nSNkH
	 bsemWJGjs7qDIZhPZkj88D+QaYCU+I5t2BOuLhAA7Uo9PrxIuaAjALJ2uVY4Zf0rKaYMt
	 n/fWZ7j4EXP5csk+bARjIrS++O5uBFZ+GImlYjPh0nN7B6bnZdEhfdemd3yHpagOmRf/p
	 pXJFZrK2Lj4HHrf/hSk+vVwwL88p0wsQOjxJ2kyxGaF3aTV7r23pc3RGqm35iDQJ4Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GYG6ANvW;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A69606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A69606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=GYG6ANvW
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3fd91337baso112756266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793915316; x=1794520116; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=GYG6ANvW8yahXDU/pTBi7oSrLWIjSfviQLzqNss9PeKHJqcnNlN43kKhIXi71bFcRU
         SWOOCSE687gYqBn3ISNFzXXAo6dGSGmypKyGLGNVgbpnfB0P+6wnPMqGaBCGnGh5jJmm
         V9/9P8+GPlpbKzI0IgyGTW01mFLJGBb+kMJPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915316; x=1794520116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l8n+OopgLwypxqFGetb5HIgCgsMRDuPspITkC+2T1Gk=;
        b=WBvhI2OuSB3hzCXvq/8hXBim1fORca1WnMSgDIg45hWB5oRvkd9Nsg5MX15Y7DuGyM
         F+9mFg7gkPLVXRBiEq3x7jIPzFQmv8PJXDDh+YNBLBUP5qK3lSpgSNcYSAMKE5yH92iI
         IABNtdWDagJOK9Y+oHIAxNFm2EOorST4Vy5gKyCH4QX2lqEM6kWrMpbXzxR0jQie3AbQ
         YiMv4rUgaLY2DxhRZczRzjXzehz5AP13KXgzgGEMjDEo9i9fji1cd2qT7mMEQNgqILxA
         h2tGHY5MG7/tLO6vf0m+77OQSZpfBmuAWjVBkPHEadPijovD1gDdLI9nQg+ffjin5dJ1
         AcXw==
X-Forwarded-Encrypted: i=1; AKwUvBxWhsdq6tHLPZu0WYHbj8kLk4ITDcet7yAbxyvJttneRR9xPAVV3U0Zz70De5J2bPMQB0dDw02WOvqRzgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bVAiqVjdT5S00bYJmVX1VgwrkPv42OMyac+QIzEw3A7THJp28
	tJSkcukoac/59SSp4lqhaFM7Y+WQ+hNAxnl0bVLm2gBSkWaYyxIrfK0zzv+HVPsCSBrOsBC+l/Q
	Tw+SlBVLuDg==
X-Gm-Gg: AYBFou2+tYgBu4JSJIcGpAeKsefKkCthYqiBuiLXfw3JpzATzZt9oAOBBvSeAzqQCUb
	Cw4cwAr1OcxI2Yvedr8e9jdvDIxcq2p1yOjEnEumcK0saurEgbEJ+PT5bw/qCQb3WkO20lUbCiq
	Yq0KTl5eWgVxoPRG4WmVKcx9mHTCUQIBrkDDIivUyiVLp+iUOXOEBGq4HkktqkbuulsByuJmrQW
	L59RFNJEbgkgZlFgswAZYryB99A4V1WP15tM8cDPza4QdTY6CpQss7WLOEF48brtNEFZH2tvfay
	R6VckTtbCbFrEGd3fB0r16S4/PHn8SR2J49PwOzABjwJhLfjHJUz/3/m3pDnfP5oNcMLdalx+fV
	MEaT9KE5djyd8w4tqFbxVK+NXJ5BXTmd+56fjgM9KgmyENc8tzJtH38XN/Ksf0TGokYdgmNBrQG
	JTT/o7xRdsiw/FAKyPJ8zZkZTaCVkWcrP7ZDKgFxRayuWw3Ro1OL8ek8rodGpL7X+jeRucmEzHX
	0U1/4bIb0JkkrV0e8GnGH/gi+3liFrud+JLOerfDBghzslCEwRKsw7A/wM5+qHbqVMR4mGqMjVv
	7WE7RSZJ0YMUqjWhxM/jsiksU7ePn0m4lMD6i2fuWb8QQDDuW1PA/f+bv1+d3VXKzW9QMuUcRJC
	NCA==
X-Received: by 2002:a17:906:f58c:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c4d34cc020dmr75533066b.24.1793915315727;
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35670910sm20136566b.40.2026.11.05.13.48.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:48:35 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4322d310e7so128040666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:48:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxPj3jGyAmHaHo/pEp9wuxtKBJmp9ZZrZNaV3m6rMox6/q0Acqfd+mIjflewgF8MuudFJ8d4msxdJ0pL/s=@vger.kernel.org
X-Received: by 2002:a17:907:2da2:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4d34d39a58mr58567866b.44.1793915314942; Thu, 05 Nov 2026
 13:48:34 -0800 (PST)
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
 <auzGMV1YbO9DodBq@ashevche-desk.local> <auzHFRzd86iV4-RA@ashevche-desk.local> <auzxXyAU6zyHtMtn@devuan>
In-Reply-To: <auzxXyAU6zyHtMtn@devuan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Nov 2026 13:48:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
X-Gm-Features: AclHuK9v-o21t8pmiI4INk2NQJoSrOcmPCpk8IDpuzUs81f6KLpwaM7gxXogW80
Message-ID: <CAHk-=wjD-fQvBvozu7+TjXa4=arAFgVzyixw4W_A=14Y8rhSLA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] string: Add strprefix(), and deprecate str_has_prefix()
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Alejandro Colomar <alx@kernel.org>, linux-hardening@vger.kernel.org, 
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

On Thu, 5 Nov 2026 at 13:24, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I think it might indeed be that find(1) is slow at filtering, because
> using git-ls-files(1) is faster without piping to grep(1):

No. Your find | grep" speedup is because you use two cores for this.
So it's slower, but does it in parallel, which is faster on a machine
with idle cores.

The reason git ls-files is faster is different: it's because git
ls-files is just that fast.

And it's so fast that now the pipe overhead is much much more
expensive than git itself, and so doing "git ls-files | grep" is
slower and only adds overhead even if you have idle cores.

And the reason git ls-files is so fast is because it doesn't do any
directory searches. It just looks at the git index file.

So git ls-files really does something very different from 'find'. It
just looks at the files that git already knows about, and it basically
only opens '.git/index' and parses it.

You can *make* git ls-files do a directory read: if you ask for "other
files" (with the -o option) then git ls-files will basically do that
whole directory traversal that 'find' does.

Anyway, if you search sources and don't want to care about object
files or other generated files etc, I'd heavily suggest using "git
ls-files" and "git grep" exactly because it's much faster.

(Ok, "git grep" isn't always faster, the whole regex algorithm issue
can go both ways, but 'git grep' does do the same "just look at files
that are actually known to git" thing, and obviously it can look at
different revisions etc too, so it's really *good* at greapping the
actual committed history, although if you go back in history you'll
obviously be paying a much higher price because now the cost is often
not the regex, but the unpacking of the objects etc)

            Linus

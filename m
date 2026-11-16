Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829984;
	b=GKSrNPHyQfD+Ff8c0DLqIqN93eZTP1AUW/uCLNoy26KQx/S0w5yp/x7yoyd3/a0TsEyt
	 sbsrdlZ9+eJe2PxrbXmOjmIwuGo0UyUJPzqnaDosTCtWp27oaS16D1Zkb4fxoNh4PuOOy
	 WL2pG/B3GkOlFx2sEhwkvQ/A312q6TvHLIyu9c2Oq+FwrnAsch1z9Hl4v3Cf7aKlV7Sp1
	 bGIbcvun9fxKIIRTUMXOO/Y4SSHvuM5Mxfaaloac3M8svQjHJm7I81xR+zctRfnIHwFMu
	 OzJ6Snq7zpKI591ldzSUGMgMdqQv8N39tlCXtHQ9mgFaRVJ7Ji1SiL6Jj5cdCB+v/ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
	b=dxfsnvC0KRwNHMeDGE52xw+Jp1g5OXzN8zHaGs7XEpDbcIhaqyJK7shdQMUnsWPGQRof
	 lM7+fskZhKvqIHmYa6p5dl05CR1rO8vP6al2O39blS0o9mpb/Z3BjwDEh5U3QcQupj3nH
	 0YJbTmq+h/TW79i9/PzyRngXpY1sum1SBRq0WHsvGioJLN2JAeyAg6/OXX/kULmADf7AT
	 HKX1PCw8s+SMeoyXsCWNlDG58Kq43Kv2ckPLSShicHuP0bBWiyUhrKZBTyRwrSJnRG8r2
	 VGH4fAm4LR16twH7uQiNkL0NVjLx97fOGOcyPUPu7FiF7mltBAtECLOC2w70EARykPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EQorfjr/";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626F606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9626F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EQorfjr/
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1380780f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829983; x=1795434783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=EQorfjr/le+xrt6rRx0aqewV5C/72AyI7slViP9I2mMqrY2frCMiC9eA2kU6PldTfe
         d2ppNxxBW57kub0UzJYDi2m1bmxBnaQkiv+DBn7m73b82wtWpXZge2XEBVq8Yj5BdyiG
         YuY+Hzn4cGfJDC2pvnbKrEDdfYWt2Z2iBDbH4ycXbvMHzeqt/2lqu3i70CUXVOK26kmu
         GVLINhavriOSnCa0I1E/mKgT9MiAv+t0eJFkLeN7vlyZTXhcdbFV3CpeBKR3d8JeJxZI
         3rV3PATeMttVTD4o/HvUX4HGKlhQviYoK1XMcV4K8Zc9LjGTSHhnLxeKxHdxvvktLTto
         fhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829983; x=1795434783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO7ejxuisYFiK67OM4MpgvsVQ7/7ICx6J2Ag4S25/oU=;
        b=Dc4jOkjxis/HYAk6uqVTt9oW1yGIIoEgOH//gZjMu++8Z4BuQ0GEctHfcY5DLWXAek
         iz5LuVcKp222PSfs+JX5GfsvYlwhbgsurvWJztKyjLFV9GFWmXuw+OPtFpqKmqEx4xe+
         UK0OmqaQEPY8PgjdN4qFySOTm1zigh7ounAZ3VHiXKOK3HJgyx09elQ+hPenhDwhN2Yh
         YICOzN/xVrS6d6Ja2Jn7PZIxn3Hd8r5OHMQf9nI5LNJMfnAK3fL6yu+OiH5U1iikJ+Qj
         mb24QOctDgLZOBRJ5J+ImWeSiQDrG643jskxpqpwOeKEcr5KMdlpU7yItgXx1+Wd8WXS
         z8MA==
X-Forwarded-Encrypted: i=1; AL+hErGCSoR8lKcMX85a1eeFAoikhGRlnyTWx7nWyZDLmMo3UU21W8NjKJiZTpHxWlu13aamSJkU9xxhLNIE1j0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nxERsKOAt1m4de9P0yoKyAEwkdU3ssyc7d15Ex7z0CjgFqhwW
	7JWQQ0ux8gM0Di6ZtmiG/uQ3ZVVHkF6yOhtylzyl/O8uYSQxRUYhHUwD
X-Gm-Gg: AZFdTZd/4WUn5Kxfgyc5XKYIaTT/8dq3HKrpXBZeeDPwvg78gjUwVWgxv09sLH7f9Oq
	Nw8aW4c6QdZfqHDecjcEiq4klpUiZmZIqYW7F4hIA6qAvy7WHQq9AiEWzh8Af5y/i6YLLGmkX/P
	5woHiNU9CJPghNPu6l9nitPps5TEIKyoP3RuRViy2iMXRHf7xA1eSfOyR+cTflA8iYCgJsn+m70
	TyzbpFb/6eTFygCnXh7AJGw/yi+DhmggXiiwu8P4rZ9ysNStysYjOLotjUXZZD0+XbmYq4FkT3Q
	V7s0Ia1nY1NOBXfsKrlMACjbRjmLylifFoBAfa0pVUVfl3hYJ0sRuQcy8H25NFTizSqGJQqOkjI
	2hJ/z3pCvS0xGp9go23v2ArWGrj+rEAKTADvAaQmIkx/2h/I89bcXii1UjMHLsXSlhh5/0TLKwv
	i6OvCgHzD++UkwFeShubgZiuCdQEVQvoJE/PV0tYs7vWMq9Sqsw+CcFLKN3cXy0wNiMqx5vNDFf
	6PHEdWouBcJ4l0dtahWwxpxddHR6z4r1+xjW+bP/O9Gp4E3AwV4WJud7TZfRFrRUNnmNQRxVYq5
	UqBj9AvgFBwQek++iAMBe1hAgDEcvFsAy8RK5akr8jvgNr3ZHzFKMndqv2wsogrTKw==
X-Received: by 2002:a05:6000:2c01:b0:499:1c0d:4568 with SMTP id ffacd0b85a97d-49c741b14a0mr24577066f8f.48.1794829982872;
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm23686370f8f.0.2026.11.16.03.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:53:02 -0800 (PST)
Date: Mon, 16 Nov 2026 11:53:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, linux-mips@linux-mips.org, Ralf Baechle
 <ralf@linux-mips.org>, Joe Perches <joe@perches.com>, Alejandro Colomar
 <alx@kernel.org>, linux-hardening@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Daniel Scally <djrscally@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Johan Hovold
 <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>,
 linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: Off-by-one in arch/mips/bcm47xx/time.c (was: [PATCH v6 02/19]
 string: Add strprefix())
Message-ID: <20261116115300.544a33ec@pumpkin>
In-Reply-To: <avriaVSTl4jL0OEo@ashevche-desk.local>
References: <cover.1794667407.git.alx@kernel.org>
	<0eaa4ce73a2b164fd49e3a9f71244a2e3f45b7bb.1794667407.git.alx@kernel.org>
	<c113f651d1ce1b2d42ab9d0c59ae5a0cd17ddb6a.camel@perches.com>
	<avi54hgKgovNHfKy@devuan>
	<avriaVSTl4jL0OEo@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 13:00:57 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Sat, Nov 14, 2026 at 08:49:21PM +0100, Alejandro Colomar wrote:
> 
> [...]
> 
> > > And these are all candidates for converted uses to
> > > whatever is the function name or steq:
> > > 
> > > $ git grep -P '[^w]strncmp\s*\(\s*[\w\.\-\>\s]*,\s*\"\w*"\s*,\s*\d+\s*\)' -- '*.[ch]' | wc -l
> > > 946  
> > 
> > Looking at those, I've seen a bug in BCM47XX, introduced in 2224de9d152b
> > (2013-10-29; "MIPS: BCM47XX: Fix clock detection for BCM5354 with 200MHz
> >  clock").
> > 
> > Look at this line of code:
> > 
> > 	$ grep strncmp arch/mips/bcm47xx/time.c
> > 			if (len >= 0 && !strncmp(buf, "200", 4))
> > 
> > That strncmp(3) call is wrong, as it's really behaving as strcmp(3),
> > since the 4 is off-by-one.  I'd like to know what was the intention.
> > Was it meant to be !strncmp(buf, "200", 3)?  Or was it meant to be just
> > !strcmp(buf, "200")?  
> 
> When in doubts, preserve current behaviour over refactoring.
> 

That entire function is strange...

David

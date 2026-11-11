Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390938;
	b=VWoQs6tW2WgkqEQjWXGoy4gMli9kOM4OfxFH7oBq1BIM9RiaQlB/OP1t5sDS6bPWi+Kl
	 XOQp147luHuIBcvRA3KgavIbwJRwoYGP6TkGZvDuTo6T1s7XQ/V1aB0N/u0/7mNA45/rL
	 KTdwbYwodiPUGfwmKK5nb7nFMHGvtwcxEjJ9h9QO50AlCVIBhdzQ5mYnDo/hP1i4CkJ8l
	 ka6gel7+ofEv5yEQOuRlGtZP0KlKAGL7ficQClCthvVbyNwUXHrW2KY6KaQ7ekLl3D09i
	 as/cQ6pbnR6mVonCXW72dyXGPPZmqd+AAZoEejhUnvEocpEs18M5U/gqeJ9s/RtiDIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
	b=ylkifrgsmFa8AkjXyYrwRNCZV7ZgQq4D/v/VHargeBSGNAQWGPBbQLzaA1ZyYWAwltU4
	 iVQW43Ne46gwELO2j+McMxu5etUctKnb/NaQHxBo076yIZLHbFunie7elP4ZPLVNA1zPs
	 ++TVrvz/7azYovK28MLHl0rGupHOJBS9TQfLXfQh6Bo18dcakM1vVE2WMw54IRtYym4DA
	 TZPdN+QJZCrXAHnjiD4OVgzLatOsvv0mHKCOz0tOaVLELO9NGGn+YNIKFPU2hV1LF/m7p
	 rwglj1pahdqo8ece1mYTrps7Qv+KqAajzUgE1jXde+JdgKuhsUGBk9PJ2X9Ekwr147g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ByvdQeCW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ByvdQeCW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so26865625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794390936; x=1794995736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=ByvdQeCW97xpSfcywMgPEu3DP4l6m75jFToER/s6KG1w+8ssAoQnPmSm57oSzHn5tI
         ELjceSIB+TCPO8pi5TX0CIIVX7c6D8BbZlkwNDnfPDxq3LsBxF9HgJEEjTcFRraPDmV0
         ZcJmKGSnRSQ+zjBi3rGryGI7LrkHAJq0J4PK/yab6XEqA+GM/LLi6jmIDYQOy+dA8I2g
         kqzNwqz1o9UScfI18ESZ2XxEsQlZe9eIbXvVQdY5gVIGcyO7DOpa2aRA+tEUyidpzHuD
         t8yuHY5e6B24caunJCU+D71G6P/moCeidVFRvkBAMGO1V37deG8+6CMKhtMyXsVOSteq
         b7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390936; x=1794995736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=cboSKUG5eCcw0xtBsBCxWJUn46skn9+w63h0pOenRt7nIUdRCXJYp455gVtBEP4qeW
         HCsoktb40J1WKN1g+p0T510p4kBysMIkDL7GmLsx4FCPVNovgJsZqoQCzid1j4UK6vNu
         rxMXYnrsfGsS465c7K9L2QxBESeqrZYZiXdZaIutHsfOBg6z0nzaRn2E2R+PJaUgE5lW
         dZ7gV7dbpbcrUCobCtuvyaA+ug6xBZo0aoXz+bZob6rD7WfLAIH0gb8Gi81/RCHhFMQw
         dbes4tOeSUfjznkPk9Zb90naDSo5BaqpNz9cmoBj0wIIlCiAJLGpxjQPvDZ6O77tD/AZ
         wgkw==
X-Forwarded-Encrypted: i=1; AL+hErHv7pW3KVe4hMKTwXETJzaCFIVoxXLTqHrm4GzK+NyPE4HlT+d9bsP8LuKTG0NdEwzR/R1vhprVi6czCqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GAI1W6oz1PiR+ptS+nwljFzz4iVPB4ftzDnuusI0okoT9dc8g
	bPkScMA4BoXq1myndL34GE2rJJLZYFPUo5yXnLck5fL8m2VL0BJBzz8caTfEM6YjfiU=
X-Gm-Gg: AYBFou2p60oe3Da0L0vmWTHZmKkJJ8+jNuBqqF0RduWcTrmuvDaTEsWJ7ZNUGs/utKW
	1kGO2NjLQ43N0xWwKbTjKqBeyrhvxwoH9OU+wPAQlCarokgMKX8ACZMafGF+Z2SSQNS7JVNmNDh
	z6ZOKtiZTaywSn9T5gBq+ANUb54WW9Sxse3RHjMftfdCw7ueXQVCph63UCqeHzavzse02aShWMF
	Sq5SYfk4MxmrkiwMwJxNtxxJi53MvJJ0fbBaoqRrsd6EMw744ai0ksJe3XyMUpl9xhkdWYjfmL9
	poJp1hGbn3cJblIpu9xRGeyF+jqTg8J18IDTecvmq6tdcqV3ukCnurbIc8HxEUnRX2wv3hA9+lM
	iVVycGd/EEd1is5QCEQxD6HTebBy5e4aq+km0N6CqGcCcF6FxnL+QW7iyA3e1MpP4rG5vrsPk1n
	WRI1t9qjSDuBc/XR0VHdg3bxpzrj0SShBNQOeUap4W5iQlYwG6hONJcuXKp8rsjP8gDl2tUPK7w
	TMAJTq7AsPWCiuJrLFd/xxqTzBSN4F4aWVTeSbJe5i8UU933RAvBj3dtf6k5GPOoScmmLCMT7rC
	F8GFeFzRklHMWHKFTQzyJUGTIkUokSJXK5Z4ToRJV9LHZxV42Q5JtITDEoB1K9Dt22uCvh9VGkL
	ZtSW2M6DoNZHIXw==
X-Received: by 2002:a05:600c:8b83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ba0935bde1mr34105275e9.5.1794390936037;
        Wed, 11 Nov 2026 01:55:36 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fea9eesm204694395e9.11.2026.11.11.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:55:35 -0800 (PST)
Date: Wed, 11 Nov 2026 10:55:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
Message-ID: <avQ19KBnQ2mnhZa-@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4cbpzud5ptt3x2g"
Content-Disposition: inline
In-Reply-To: <avQrO4etMgpOhvwF@ashevche-desk.local>


--h4cbpzud5ptt3x2g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

[adding Pawel to Cc:]

Hello Andy,

On Wed, Nov 11, 2026 at 10:45:47AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 10:54:35PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > acpi_device_id that replaces .driver_data by an anonymous union.
> >=20
> > This patch doesn't modify the compiled arrays, only their representation
> > in source form benefits.
>=20
> I don't know who is the first, you, guys, collaborate together and come u=
p with
> a solution, but I have reviewed already this
> https://lore.kernel.org/lkml/20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodp=
enguin.co.uk/

Oh, I wasn't aware that Pawel is still on that. Initially we had a list
where Pawel indeed was assigned for acpi_device_id. Since then I went on
to do these changes per subsystem for several *_device_id at once
(instead of per *_device_id and subsystem) and stopped looking after the
initial list. I might have mentioned that in our internal chat, but I
take the blame on the lack of coordination.

Looking through the differences I found:

 - different commit log
 - I have a cleanup to drivers/mfd/kempld-core.c which conflicts with
   Pawel's series

@Lee: If you take Pawel's series, I can rebase and resend. Most of my
patches still apply just fine on top of Pawel's series, so you can
preempt parts of my rebase using

	b4 am -P 1,2,4-6,8,9,11-15,17-20 cover.1794347059.git.u.kleine-koenig@bayl=
ibre.com

Just give me a poke when you made up your mind how to proceed and sorry
for missing that conflict.

Best regards
Uwe

--h4cbpzud5ptt3x2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0O5MACgkQj4D7WH0S
/k5a3Af/bShGrqVRN2amCZ3YsA8JwcyDvTbN7ekxEzRPDe3bdsK6O+VNVq3fu6+A
rXE/yf27jSePTzpLzVN5UjaJUtgdLpi8JIUz8tFpWvLxcQ7XJGC09ZljCzmR9D1+
wCj7azL1dvdk+jjz7tZ+RnsUPK6bvSWhgvEV2mbVfggFIU/YqhySmIhYBhrc50mN
1GRlU5cIuEyXVwwmIk9BRNv9drjXrFZfkJTd+H4hbRAFOfVq1QmIjHDUl6qi3Rbz
ubQBpDM96XgUe5HUTXgG0Ho9KdASNlB+OVv+iwb32nfc2PZjPPmSKFjK7bKTV1Lh
3u6/0xqIvwenZeWxe7CkONoCcve8kw==
=t/3h
-----END PGP SIGNATURE-----

--h4cbpzud5ptt3x2g--

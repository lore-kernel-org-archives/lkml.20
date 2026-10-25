Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932491;
	b=YONq9MOnVGXvKh8h/SSOlsQJ2RgfbqfYxwjqxmBoky9bpy+6Ol6dKP2Wwes9SSHswsir
	 djmfn+sAZKISnuIB0PVP9Tsvy/cSz94a1oSeWI00Q0jvQs+HvseI1HCqf9J+00mElXZSE
	 RFnkfsbZjjxXgEObLb6s6nvf+Dpz5aaPpCW2VlVmWfjGTzu6aNmTm1XjtyICy+AWne4Wd
	 YpRRcNWa2xb2V8rHSUSsFpKythMSDNXCrxAfeaODiXm8M6C5yT4gosa39Fx+A+il07+kj
	 E9XJXPS52nESiwbwzwI3k/Bo60Q0nm+Jj/elstOZ7U1oS+bVpnVmdHmIcnCSCHb6aLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
	b=B0AzykeT1PzjXjrsypmPQnktG+RPWurHheNzyQEwGTxQWkIk/ZPx5NBiOmowtY8R8yIE
	 yaT8cYkGaSpjPE0hyNASmpT9jvRymdoRrhb6xIxpSJtw9CdQ3t4Xr2Ifhd3G9J1Bc+M04
	 mC6j69g7kTYVWu0GBtoXqabhKggOOaStFwWkjbPbg8LCpIw/kvTGOIPQeP7tTs2cIRvm5
	 v990VmCC/M+BhGj0V39C5Aj77R7V204ijiOQR6dWzoM4hJeBELBdY0wgjqo169CaDKPAm
	 Fpk7RRVc8PL5nUMHwUk2yqifUR8QShr1eEm3qnei5AHFgEHH3al9ScoxRatsHc3+IAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pg8FDG9O;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0FC606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pg8FDG9O
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso20573135e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792932488; x=1793537288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=pg8FDG9OpzKln8+QRdvhMAtMVp0WQ1NMYaLASyxAEYJWLNST/WK5rNIhMJud+ol1qL
         fnBQe5FIbncQ9e7Yf2jY5Avm2y32XlQwi8zLdEdscaiuJNlhCMoPO1s4R86eAMZm65+N
         4wN667A/guovDHJDdgGvxXS+E40NfJnWTsV/VNIYrlv42LuwoD8jhjPqOl8WFcqIB9pB
         a1e9nczTgOPdUb4RwVqkaM30MzLLvdbX8vRjHV0JGK6vlZjszCVuRfZPWEEEj2bVwOtS
         Onb1sPkJ2qFK+BNjMAVgcE1OO2VGj/K5/NoSG134pZJDNd8mh6bvz+WE17qQMRc8Utq5
         4GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932488; x=1793537288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=ByEuV6Lh9z7XvlEZl/hmjYN5N6CyVB67PTTapx3MTKnOTh1lvr48xvoyju0eFkMQHU
         4lIQfn1s0zaC3U7xqxRGSAUqzC9wiWz2AfiDoh9SuSrz1Ap4Nd2+qgwAcjLSa1IU3aBE
         FyeQH3Z4ZeY7lm3+gR/YRM48YSPAtrgeSPIWNq9yCmlufvcG5ekteWAI245y3g1SdDwV
         P2CyPOOSnOJotD+fsC9OkGRfAB0umz4aPTEzk/WWjbRa/xSrUlSs0UtmMMpynTJUrIpC
         VFE8NC5+PaKGJgbnbqFkybThTD0zBQy+CJmNoCHHWmkksicYvhkydxAirxb77zJoyUf/
         xrBw==
X-Forwarded-Encrypted: i=1; AKwUvBw4MUs70uKrDFmeXYifrymtX6+1ZKNxNJMWvJS9KpsSCa1Nk1GGlismbImgrD+D5zGLIuBaiDJ1U83kh+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1rYLsDELBUhxI9dcceJZumvGZn6UJvGUHjo2UntSJvVcVpulO
	6SKF0hoiqP4tpdVCXchZEVIOiC3623/4XNjyXECi2D7Bi2BCulaRvA+8/7Qr2wUT+fk=
X-Gm-Gg: AYBFou28U9sRtUfGqzXktQpy1Hu1b1cghLxC1/M0ZkEzTMov9nLsDFpzInXwYq8tcPR
	NtmNyzdZjqaElV6HFZEZrEvz9SOcL+YOEYUGslFCRegrgauQ2jha8h5wUDs/Z7xVtLznGS8Epdv
	Icp3KCFDSkZNiFU9w9vsSDjq04YOnyuU1jD1M/neBHcpOBF4rx3BGR7ICxmB1e1E38K+X5kA1Ce
	OIlOX0pHkePdITyZJfAaZNn17ZsvDGbxcu/NZ7SKw06AgHI961/NN8PcKMOAoMWaoXt8Jgn7w4i
	2hU3lj2rUCUPXlXfeVUW0S4qC6EG4hC3Uyw8tRwCBfrlHZi2SN0GclFDCGvwBz0KfHNBhQlpFOA
	tvJug/LyniaXd4KeXoJrZt5M3rN2lFaXPTMIt0Pz2IUCWu4wYYyDTyX1kr0GE3RBEcka0cqhtIq
	qqoVprSmsNZpANnmAuNTihwRm0MJHEqaIUxq+WFd/bUDU9EwYVIKAEzQ9rRGac3a153IPxTyuvr
	PVvD4B/zaIVUxSSOdpWKco5sqz3jp7fYPKENA3kso61qf/ERL5l91KlyvOuJotJ6FqovpM52GBL
	hF/f/w==
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr71714575e9.18.1792932488137;
        Sun, 25 Oct 2026 05:48:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a04ad39sm326937255e9.1.2026.10.25.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:48:06 -0700 (PDT)
Date: Sun, 25 Oct 2026 13:48:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <at34UOuYv3NtX36R@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
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
	protocol="application/pgp-signature"; boundary="hexcezj4rledtjd3"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--hexcezj4rledtjd3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> So what is the real use case here, taking any type of any device and
> thinking you can bind a random kernel driver to it and it will work ok?
> You all have specific platform and pci vfio drivers, why not use the
> proper device ids there instead, or better yet, bake-in this type of
> functionality into the bus-specific logic so that you can have generic
> userspace control of a device (like usbfs and uio does today)?

Also note that even if the platform and pci busses implement
bus-specific code to pass a given device to userspace and/or a VM, you
need proper unbind support in the driver currently managing the device
(or cripple the mechanism to only work for devices that were not bound
to a host driver before).

The more I think about this taint, the more I believe the commit should
be reverted and replaced by a some stop gaps for driver_override. (Be it
a taint or better yet
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
.)

Best regards
Uwe

--hexcezj4rledtjd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrd+oIACgkQj4D7WH0S
/k6aewf/a1J79AfBUwvrOd6Ba/0Y7Snc6nW1R3bcrJe5+V181tlQ+NubUnz+DJdu
l8Jqw1xcQaALmyYYZ+CaEenSacHj9TFNREGi92ZjNkN8m6+iH5soIV1vTHPZaevX
R9oV4vf5RnsRXugZv92lNktCGbzbu2ceTDhJU4IoX5FyuqL95AVajJ4awrTw+nol
Y+gyqcgb8mzONrS7D52rBINMIjpn9/nmcPs4bVkXCZjAvPg+MFRZTpjwZ7hB3Guo
GM19dH/Q7rfMakDFZ/TJqgDbxuKHrPdU/EFkrRXiolTo+VEKvUOmiiW/JK6zrFH9
WNnJHHFnJdcfBwsazk9IIqGimnpBHQ==
=zFX2
-----END PGP SIGNATURE-----

--hexcezj4rledtjd3--

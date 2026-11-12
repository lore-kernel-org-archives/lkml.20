Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525273;
	b=VQFFx83zzOpBo8J4Etzq3Venk0QIgPjpRYJ1gsgThz4EpoXnRpCbLiRjT79SAB5FPXhS
	 x0dXYXA0p2ZNQaIrsH/rL0ICOvW4x6TbvCnwSBEEj3eoj35C4gtZGUU/TwT67GO4wDPiM
	 2Ffakyc16a91Bns/wKqjy2uXPsOYFuW4wpkIhyVwnCQIJJf7Nh21cnQnk55UQBMZqantS
	 JjNu+8NVqzHc/pU6ghqtxbpA032H95TRCgV0g+fULiFs5xmG/CMFBPxfzbqF57yloysne
	 aWT28N1LZ6hhH6cMrVd3rbCXDlHT4dUEa7AdfJmU4u3LNL1tbX5SvrLr0F0JPhhngSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
	b=2VRhyLHQi7nDYNfJ4TrietGhe1Fra0oYW13Y35kCXn5L1DKGVdY3RXlhK+8enpnCIpNc
	 88YHR7NU2YksqucyLnp3mR8a3cbVY4z+pg5R4TvEC5l0zU1uCAJr9ooR8TVuQOJkucSTx
	 3sLvd0dwk6afEoSDW49aUagS817X53An+9nAg5OGhwjLyRj7t5E04P516EO/llErFyFbK
	 E+CN8fgg1DsMH5GPb+sD8WpgSBlZPTYywLjGJX6TAldAGgXhtNUwA4AkNqw58gapdxFVF
	 YglpCLGknL09LT9GOHtHpbNkG+9tW6sM3I5l9w81H0TC/4+7DCKPMEJmecTuQ5cZ6TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBB606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsvJdqN+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2291155e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794525272; x=1795130072; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=EsvJdqN+wWCfOMVWs6MUfw7XtuobuRCUPvEe6yaTTEFIspcg/SFHUzBExrtZtJMH+/
         WfIz7fdJHXtBzhFUxWQ/vq9c2Y71iKDMQOjJM099c77pSaaK3RtGVGFNi9grouSdUDYx
         d/Xw3C5QjmcT0YCXCLUQNfKxeqDOLGmvrP9bhZhxEycST49kjuObKaXrXzJonXajTTD8
         ItxcN/ZJpvZ2Kd38Tkvl/LO+v9rvYVLaGNtZr2F/tTd0ejZ5cQhKzW8y9QcZBJVficIz
         N2DVpC+JtYfBVIfCGC/Zs1ayz3EM8nKfaJCkx5jf5B+1tf5Hk2rqteKfCXH6HiVyYDk1
         kCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794525272; x=1795130072;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN/qNmYDsOB9nL6rphMvlGN6Wu4Xb8ATnikeAxhxNfo=;
        b=w+7a2fKM88+ct1PlRA1wNn9nLANhLrvGsDA9W+4i/S4mkoCcJDZklqGUcRJES2YjlB
         FYfPZpYYGyDoSk8Xrew6v8EQuwHQZ7DlwXfLVKE9UqHTCEh8PNGLexl+nWgVy42mrsNa
         U6tw7q1IZCF6ws3y/rjwuTtBYeQvTQ3Gqz9HBpe+N1sdXkevVKuIGv68Km263yHeAjaQ
         j8NUJP62wOKTOQI6M67R1B3rWV5KjcAx8taT1gl0+rRzo91f9LeXLzAS8xlR7VvYCAJH
         sGzvcPn0jR4BAC4O7rT187jca7RddigvFthf/DaVLz9qF5r3fkDX3rwyUachUZRQ5n3z
         ibfQ==
X-Forwarded-Encrypted: i=1; AL+hErHITwQqe2TX+YTNCktT0Ip52HYL657JMqetSgcBK8zK4gg1YtiI6PWA/kCj13dtJVojYz3hub9V5arP/J8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bGmVghov8iKC4YrA68I2rIlc92a/KD4dNxArqc++oKkiC69dv
	a6VyjlxzfS2WSM3t1BRQQBN641Z0HE/WQoVWS1z9xZBQ/7EP/W2moFWJ
X-Gm-Gg: AYBFou2fGr1diMVwl2UymPFEIx+mFI60UjfXRnugNjDdknY1X5SxHKiggWh/I92x4Wm
	X7NLxpHEeBjrAIH2W3cuTet02oBDdy5twAMCMSiEdDfJgslxI5eQbqP33s90P3wDkAtL/fZNma7
	E0aAyQoBDTzrajqmKxsvL6kfYCXaPTCN3dBRAFkVBozzhBvIoDAueTsVOdxt6UYXSRAkR2xU4sb
	ng4qHJnBmG1r8lw/uefNcwq/3n9uAs1QWYKnvqggfvIVb/xSMqVun8YILfJY3/LD+hZEE0Ln/el
	+jNmAxwTkNyBIT+5hRJm3+kcSkVDBfT29yJixVEkG7VMM5A2hAoH4YOFa5dVqyUgMVVJKbdTKYN
	3ZzgODKmN7a/Ls3vw/3Put3kjvZjrC9NyW4bua41CgyJCixDs2P+n55W2ebNx1WM3POxLGkjNUZ
	HYNtR9clJ1XYWv6bRja8jXAJD7cyDHzGaHqMgfgZ/YOjLxmtEvLhL9+3MqrPfQktpi1gNLE0Qwv
	JAHzMUWPKUrDIaWXkyJmS7GtYzDVojRLvtcid35N6NQ3nsk8qywaq7JJqQ6mVj9ZtgpxRQb+lwc
	CCD5bpoYBRTwmi4KLjgAEfMfWfP+eThJiw4VZ1Prd8j0qbaBWbokWSKoHYnQ1sEAC9SANtF11fb
	g38Q6ZLFVUngfUGlzkQ==
X-Received: by 2002:a05:600c:46d5:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4bb55a8329amr13702305e9.13.1794525271736;
        Thu, 12 Nov 2026 15:14:31 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm96030325e9.14.2026.11.12.15.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:14:30 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K2GKi8S106PfrZNN3W4EREbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: multipart/mixed; boundary="------------onQYsP5IVHvnHSUuO3vsIGv7";
 protected-headers="v1"; hp="clear"
Message-ID: <2226c85e-2902-4964-858a-2d1603263252@gmail.com>
Date: Thu, 12 Nov 2026 23:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Nicolas Schier <nsc@kernel.org>
Cc: Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <avQNdicGzL3De556@derry.ads.avm.de> <avWy2r1BcDatzwo1@lx-t490>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <avWy2r1BcDatzwo1@lx-t490>

--------------onQYsP5IVHvnHSUuO3vsIGv7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/12/26 12:36, Ahmed S. Darwish wrote:
> Hi Nicolas,
>=20
> On Wed, 11 Nov 2026, Nicolas Schier wrote:
>> Thanks!  I know some people who are definitly interested in such a
>> config policy checker.
>>
> Great, thanks!
>=20
> I hope this leads to more mainline kernel configuration policies as wel=
l.
>=20
> On the user-space side, it's one of the reasons I'm versioning the sche=
ma
> in v2.  This way, projects like systemd can ship their own kernel polic=
y
> file, and that policy will be guaranteed to work with all future versio=
ns
> of this tool.
>=20
> So it's all mainline-first; both kernel upstream and userspace downstre=
am.
>=20
>> Please prepare a new MAINTAINERS entry in a respin.
> Sure.
>=20
> Beside a separate entry for the checker itself, I'll also add:
>=20
>     F: tools/kconfig-audit/policies/preempt_rt.yml
>=20
> to the 'Real-time Linux (PREEMPT_RT)' entry.
>=20
>> Are you planning to maintain it after inclusion?
> Yes, I'll be happy to maintain it.
>=20
> Would it be OK if one or two people from the Kconfig side also step-up =
as
> reviewrs?  Julian? Nicolas? Nathan?

I will politely decline the official title, but I will (unofficially)
watch and review some patches if merged :)

- Julian Braha

--------------onQYsP5IVHvnHSUuO3vsIGv7--

--------------K2GKi8S106PfrZNN3W4EREbC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavZIVQUDAAAAAAAKCRDElYPCBXNxICgY
AQCrg7omkjFSbzIwDbf86DhWih90vS9Sw1cD5XogAdL8JQEAugMEfkQyo0VYrMXEMxzxjaqaD4Dv
40JhZXotRyfJ9A8=
=Wy7B
-----END PGP SIGNATURE-----

--------------K2GKi8S106PfrZNN3W4EREbC--

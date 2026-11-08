Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164371;
	b=gEZgck9O04mfsDck3KQH4mQixcslO/sdILnIa+f+sulzirI7o+Luh47AxHcrpo5thtOY
	 cDtwiZVaKJaRz3jGwjA1N8alh11kDeTlkeM/OXcYXhv6CFf7WlXcgO4N8aB4xpgUmSEqC
	 7KGMZfYQwOIr1K1IhNQL2XDMWBjZZJ6DHQ46vfTeSUS8V+Sp52l7OSKmYuue29QlaNNm+
	 AbmRnWsNGF8V4XFEGZZMCoO5ByZGwHSK7ZWRZybX7+YHUKbXIm9ZA7xFyMOxW1sXfj5mA
	 GWxNxphDUObXCYLlEB1R3usHPscXG7GYc3aTmwY6i8LcVQQf571V8X6422eFdnIdSeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
	b=YiN7p0JXhWp3xIAnxlGN5UKbimHfFIUafTX3bABrcUyPLXC9/zOQZwJWL2WjfV0JuMFF
	 31rdlmmwGtOF6D/3WjAL4FuZb4R55/THxFIO3mv9mR9VE5uaZNm/YapGhdxUodmAdUM+D
	 dSK30XNhVVuHBYwBUW3f6uFGLkFnjZbW4Ff6sAhFP0lfqxWOnYOlchWAxGLSVtCRDzaLu
	 3JkaylQj58Bog3tWheHBpM278dk+lw2YcQZOpqvxnZQy7z+6ohq3tA1vJIFbBpmVjFMgI
	 fBLgj8zQ/1DuFaSMNy/tiCk5bqCI3iOyr8w0BvMmf6Px/ZqAmKQ8wohecXBA+0HHakg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9d2HZ78;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93C3606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93C3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9d2HZ78
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so1593685e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164369; x=1794769169; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
        b=r9d2HZ78YbTj/Kq3GKpr4ll6KcSqDsjfQ36hAEcveVM3BdSy3bM1RhlTRLT78iknd5
         cQZoQNTwWF3o76pb5x1OWVqfmHtAAMkVImeo8udHq/L7eURVCdK7YI4CJ3urpzD7m7X5
         5GyhPyMwGHZah7PKpgR6YVngS/PKh/iKbsZMiQKuahPxCiP6h8EA15R/m5iJiC9T8AX/
         m8f2c5QBRirITjAotPbPDKkE5hU1JDiILfZI4E+tzPHeVudJlk796dytDVrbur5RMI1W
         nSi+ILbIEF5LGVgvOO6qoVo4oP6JQUyLoiTHCdy8+hnj3P8jQEwfEHI2nROC3Fuix50F
         7YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164369; x=1794769169;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
        b=cp7uKRbS+I6ehkus302aAGg2tdxEkRZqFEWc0NeWGzHRSjj3njsyasAy3K/VinnN8f
         AraO1kqn8nPb08uOFD9jOipovqRZf0eyF/iE2+GufO4FQCEeWdzk788/3E1nwcq6m3b1
         QPZyyrcfKkqiCM6LXauidHXOUZBIADeULlKULwwdusI9h+5Rz1+7PSajUGV196ccEOFY
         vNDmHa6tqV9Ia+VsuoU2sTvhPjZ38dP38kG+ySMOhIrTryu9KeqbcCblBfB/dtyhjG5+
         IOiowmV+06u3XoTjylQTT6KnppkOdnzSiko5Oqh7fGGiQaE2UBTvuH4pg+NxQu7/bXeH
         g89w==
X-Forwarded-Encrypted: i=1; AL+hErG0RjIg9b2OvVPe1uY/Gdka10JQaRtADYa7svbYeg1hkyuTFZeyasDWsh5RSPM8GanZWKtu/Q0n1RoLpnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dnVIcItVUXTrtAC4P8jSWUVVu4Q2LtuCyHUGqX0Tjn8kaGuux
	Qoq6BAXWyMZZKagacbWcEvOL278A+9u3Tlu9TqtH7w2c83VNiGaJC/vF
X-Gm-Gg: AYBFou0wEN+fn8UjC7E3m0/d0p3AOihmzGbUGlEcJqd1P1QpK6YCoGed+/BCa4g3Xsx
	4D80pcpGxH7yDnliW2aPj/hg5eNHovTJ7NapSaBj4mkwl0qn1P7WxZgJoNSrz9jQgUgdDqSDTFs
	5k8R2VQoYshn0+cXb8eemm6DGbP3SsRG/vOh/Y5hQihaizVSvtlKE5MgXuIvlAd3i1EdWqZOb1/
	g/1giWOWDaKAFjQzGi/5Kbc6gCX7x3U78kP2reM4ndBp5xNoOT57/3ZQ+o2PpGKSE6ezbywm+b5
	oYcYFjceg2FAMMR5yYhqaTqGdUFxD31XVqjsdH0ARcUB27UeTOFCu/kbLtx/tR0aZLM67t9lzIs
	onoHYEC5yNNRwtiDVxaUWw/3WDIUUDHcXB3ums3E/JQ3uIb0qSt5Or4QJMN95tRIDGWddXfGfSx
	2yf1TMabBqp56BFyYWsHYesPrzz/yDVMEl4oDeeuUIhJ6Wf13G6/7DqkOTHRXHwU4hkmy5R61xJ
	jNQETnME8eFFKUO5Lo0IxXvVwgPQjmChpNXR/kcs4WTPVja6i5CBTQNWdq62Eg8Fx801digXVhK
	vNrPjbZlqiYjMEsOJ30Mjcc/rIpqj7EXx4eoe89gLU8173LZbFDs8YjX+i0IlJxPU86Vl/Zkmvj
	ejxkTQKDqHV7i3QGKdYki
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr39222205e9.18.1794164368936;
        Sun, 08 Nov 2026 10:59:28 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm116251035e9.4.2026.11.08.10.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:28 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com>
Date: Sun, 8 Nov 2026 18:59:26 +0000
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
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RdQycBE5cMMMiUBKuDcENBzr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RdQycBE5cMMMiUBKuDcENBzr
Content-Type: multipart/mixed; boundary="------------DqGXJIIQNEu3dpPKwL26zFRE";
 protected-headers="v1"; hp="clear"
Message-ID: <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com>
Date: Sun, 8 Nov 2026 18:59:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>

--------------DqGXJIIQNEu3dpPKwL26zFRE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ahmed,

Cool tool :)

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Hi,
>=20
> A month ago in Prague I proposed a kernel configuration checker:
>=20
>     PREEMPT_RT configuration: Best practices with kconfig-checker
>     https://youtu.be/hqnOmdpGBdQ
>=20
> This series adds kconfig-checker: a Python tool that checks the kernel
> .config against a set of YAML rules and reports all issues by severity.=

>=20
> The series also adds:
>=20
>      - a PREEMPT_RT configuration ruleset
>      - a make checkconfig target
>      - support for ruleset overlays
>=20
> Example:
>=20
>     $ make defconfig
>     $ ./tools/kconfig-checker/check.py check -c .config -r preempt_rt
>=20
>       Configuration Issues with severity =3D FATAL
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * CONFIG_PREEMPT_RT is not in .config
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#config-preempt-rt
>=20
>       Configuration Issues with severity =3D HIGH
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is unset
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#config-cpu-freq-default-gov-performance
>=20
>       * Below options are set:
>=20
>         CONFIG_SLUB_DEBUG
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#kernel-debug-options
>=20
>       Configuration Issues with severity =3D MEDIUM
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * Below options are set:
>=20
>         CONFIG_CPU_FREQ_GOV_USERSPACE
>         CONFIG_CPU_FREQ_GOV_ONDEMAND
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#non-performance-cpu-frequency-governors
>=20
>       ### ...
>       ### More output
>       ### ...
>=20
> The same check can be run through make:
>=20
>     $ make RULES=3Dpreempt_rt checkconfig
>=20
> If no ruleset is specified, the target prints the available rulesets:
>=20
>     $ make checkconfig
>       Usage: make RULES=3D<profile> [OVERLAY=3D<overlay>] checkconfig
>       Available RULES: preempt_rt
>=20
> The overlay mechanism allows distributions, CI systems, and Board Suppo=
rt

On the topic of distributions, this seems *a lot* like Canonical's
Annotations [1], albeit yours uses YAML and supports matching option
names with regex. As you say about PREEMPT_RT configuration not being
"one-size-fits-all", similarly there are 100+ Ubuntu kernels that need
to adhere to a configuration "policy".

So this seems to be a real problem that others are having.

> Packages to apply additional policy or override existing mainline rules=
=2E
>=20
> For example:
>=20
>     $ ./tools/kconfig-checker/check.py check	\
>           -c path/to/.config			\
>           -r preempt_rt				\
>           -o path/to/overlay.yml
>=20
> or:
>=20
>     $ make RULES=3Dpreempt_rt OVERLAY=3Dpath/to/overlay.yml checkconfig=

>=20
> Patch 09/10 documents the overlay format and gives an example use case.=

>=20
> My goal is to get this into the kernel and have Debian's PREEMPT_RT ker=
nel
> packaging to use it.  I'd also like systemd to use it: its README lists=
 60
> kernel CONFIG_* symbols with different requirements severity.
>=20
> Thank you!
> Ahmed
>=20
> 8<-----
>=20
> Ahmed S. Darwish (10):
>   kconfig-checker: Add schema for rule files
>   kconfig-checker: Introduce PREEMPT_RT configuration rules
>   kconfig-checker: Add the configuration checker code
>   kconfig: Introduce checkconfig target
>   Documentation: Describe kconfig-checker usage and design
>   kconfig-checker: Split schema to support component reuse
>   kconfig-checker: Introduce overlays schema
>   kconfig-checker: Add support for rule overlays
>   Documentation: Describe kconfig-checker overlays
>   kconfig: Introduce OVERLAY=3D for make checkconfig
>=20
>  Documentation/admin-guide/README.rst          |  29 +
>  .../real-time/kernel-configuration.rst        |   3 +
>  Documentation/tools/index.rst                 |   1 +
>  Documentation/tools/kconfig_checker.rst       | 101 +++
>  scripts/kconfig/Makefile                      |  25 +
>  tools/kconfig-checker/check.py                | 686 ++++++++++++++++++=

>  tools/kconfig-checker/rules/preempt_rt.yml    | 169 +++++
>  tools/kconfig-checker/schemas/base.yml        | 114 +++
>  tools/kconfig-checker/schemas/overlay.yml     |  28 +
>  tools/kconfig-checker/schemas/rules.yml       |  20 +
>  10 files changed, 1176 insertions(+)
> =20
>  create mode 100644 Documentation/tools/kconfig_checker.rst
>  create mode 100755 tools/kconfig-checker/check.py
>  create mode 100644 tools/kconfig-checker/rules/preempt_rt.yml
>  create mode 100644 tools/kconfig-checker/schemas/base.yml
>  create mode 100644 tools/kconfig-checker/schemas/overlay.yml
>  create mode 100644 tools/kconfig-checker/schemas/rules.yml
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 2.56.0
>=20

I think the name will cause confusion.

We already have some "kconfig checkers" in-tree, like
scripts/kconfig-sym-check.pl

But actually, your tool is quite unrelated, because that one checks
'Kconfig' source files, while yours checks the user's '.config' file.

This has already caused some confusion in the past, for example in this
thread [2], someone misunderstood which one 'kconfig-sym-check'
actually checks.

In addition to .config vs Kconfig, the name is similar to
'kconfig-sym-check', but is not as descriptive about *what kind* of
checks it performs.

[1] https://lists.ubuntu.com/archives/kernel-team/2023-June/140230.html
[2] https://lore.kernel.org/all/ajo4DVWoSaEZtBDa@google.com/

- Julian Braha

--------------DqGXJIIQNEu3dpPKwL26zFRE--

--------------RdQycBE5cMMMiUBKuDcENBzr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGjgUDAAAAAAAKCRDElYPCBXNxIFSI
AQCDtDk4+oYBccZZgs+OoTuGu0I3s6o7yQXNz7whYRGfogEA7DEWidXa/2MWHU9Jv6J8SSA+WGkh
n7X58cRcqhQiDwk=
=cRiT
-----END PGP SIGNATURE-----

--------------RdQycBE5cMMMiUBKuDcENBzr--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164389;
	b=19hUR+tq6TVZss0WSNeFG0rVKjjj/wzlOCAV3N+09M641Q8C57TdtoKSCvsX2/8Uha6x
	 Tc1EG7v7O9EaFnxZyW6XLAbME+mYYQpOWQtW1acnWM7/efjUczXNtuyIvNm4WVHWzQugg
	 nKVI4SlvtBorRXzS+fXfw4WBbEq0yTISO+gcnK5/RDoMqmE/71WN370Lsg6yxq4z3rfTQ
	 uN3D8SUu4VfoKOuRv/kPPR7jCsp/HvwNBAdWLkM8R7vgfxXvUmLhg604IYKeSaAKIqdJX
	 KVlphYEJKtxdPSJjyZnVF6Yoj1MmuOAtvxzX7M61cNAO9vCt4HIOV3DGAQSdTGMocxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
	b=Or3WDF6M/bVi7R1YdfZtum09pjyo2TpptzNDoZnDmONE0FbTojbb/jOf2DUqH3H2YYbr
	 kZor7SZDRhOjjbxV10MXV+2zydSNgSaQKXL/2evZ5EZ0HbsE/O7x5kLYnYu14CAZoEEq8
	 UJyXwdFBQdrnvky3/kopMg7J3WmoY3+X9R1Vwb4XFrdgQD5iawV/EjOOpWWgIY2w25ywX
	 f1m8JGTpavMQcDyJiDzR7guEuCEmQ9HoQn4NTvIv1dLt8bpY3zjRgZ0VZYKfbGDdw/KMz
	 LHs5mk01frdiBe6Sb3PcWyY9lUmuWib/7Vr9o0A6iPI4V8GWzW5HnRQC4P+bYJChxUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A55606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A55606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so1457035e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164387; x=1794769187; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=J5dWnNiFRKZj0dtJfdFFjQLklNQbzPYUrEh25hgk7Motlge51LERu4P4P/TQlOUbgq
         iBlijpaSV/UfK5kMduDdxTVwVINj3JbvY6soIiXQQvfEdCOsmSjKq1rviZWtK1iaoaXF
         6IDxeEL6xY8eT5LA1UYCJ4UkJOO3eL6uOspPn8HF0IGUihihkerf/MBFkAioF5nInmZM
         drHx4xFDCHd8+Ek7/nkf3Gwg4H1KSB7v4XnA4oKWTzmwfb6d8+4EEuQdYnQxbST1abWl
         DbUlOOu86QNHAzYgk6o/bC3OfsXOkpfa1ZYNjle/htFyJ21zhRyCYbtO8MCxvowUMQhZ
         sKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164387; x=1794769187;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=1b4g2+PIpA5tB6fYzecRfLURSbx0S/Uu9dvecsY48U6aAu691UfttOi9ix4mthd84c
         /Ezu0D7FEyMooWNc0TsNpbiUJz3ngLWG6RRAQNhAhnZWH28ZfhSkUgwUaR/SSFCu1r27
         jiTnyeBbE0mxzUuatpZauJAVnbEPjn31jrXMWDlBIINdMvr0TJig3024sjYsHra/rixa
         w6//SQI2JpN6AOILF83NRgXzLDAKHXyd79Y7Qa8IaIuDFrrXJZe+tVT60g4FSv+wZrxz
         Zxql9SpB499JFe1Fzm117aQNG18eTNM//W90LBDqwus2T2koUCX4ULfSfU7KteitWLoB
         IULQ==
X-Forwarded-Encrypted: i=1; AL+hErHr9HTdciklAqLtAaxEe4uf0909TQVbJsIPVruST93BsT99ZywTyktbo50KlgAjw2JNx3craJwcKkEN0Ak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9yDgrZWbFrK0GB+FtNH/lFj4NkDcRkcrqfFB1xMYVs8IcQA6t
	TrLVMx8NVIAO/kEpdtC7A0WMSHTRtrc0zIcqxGKxjRFepiKWqEIYqAvS
X-Gm-Gg: AYBFou1GWFrn+tGjOMXf30fdf5/j0WGUjI1smSSQnJ4ffywHJXDZCpsxTVKSR+ho/h6
	BCFCVDLhOmAGyEQnnDYHGu8F783DpWBFqK9dVUVtn2Xnvr1xon1VJWikjBSxue6BnlHtjpb2nfl
	mgikYZgE5fBumqWvFGfpXC9t3mryI0qccT6LtgHwY3WVvYJEy7R1HRLGmJp/ARchdsDZ2Em0ss/
	wDuvaGmn/m8N4f5YYxo+evMYjQ1JHKZbVqRj7cFV7BqvxydDMdz4qlUiQJinYi59Mnt2mlgMei/
	XEZq4c/G60yjndy7uu5yym+6sZYX1cOk3HdIXsRlVInNrl/g4Ur5P+6to10vyWior6J6k1XH3Tw
	W/7fhNdt0fEQHzJxclmu9AnTyKHUwr85lIwbYsSueaYSL6uYtepmpCdXKwNZ6LA6ccK2lgzrA1b
	jIPdgK4CFsfan6eFSGbrCTP8wq+XYSeIVuLMIgwiIRIxlZXGqcNDV25CFDkZH7VgcFZJiTHvnpP
	yjYttpch0+3uVh4TjjigQmqEFEOl9dJj/4cEuQL/nDacgGGtF3b6XKK7EFjfkoer6xTXRCRindK
	szIaRL144IzawplOrzknzfTnYIJApqcY3w3VHQFR48xVu2mTBnblH0Fz7OtHIYKT9FrZkVkYW3q
	nw3vK3/I44p4usP1Vdp3MDk8+tKzhrDi6i7VA9RyyTw==
X-Received: by 2002:a05:600c:3ba4:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b963c65a88mr49152645e9.11.1794164387223;
        Sun, 08 Nov 2026 10:59:47 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:46 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
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
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ScbaGCYTbGeYkRt0jz5kpka"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: multipart/mixed; boundary="------------NII28W9PtdHxoeuGqG7HRNpZ";
 protected-headers="v1"; hp="clear"
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>

--------------NII28W9PtdHxoeuGqG7HRNpZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Add a checkconfig target to validate the current kernel .config against=
 a
> set of rules.  Select the rules using a mandatory RULES=3D make variabl=
e.
>=20
> Example usage:
>=20
>    make RULES=3Dpreempt_rt checkconfig
>=20
> Use the kconfig-checker to perform all sanity checks.
>=20
> Document the new target at the 'make help' text.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  scripts/kconfig/Makefile | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5baf1c44ffa2..d67a23730259 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -125,6 +125,26 @@ testconfig: $(obj)/conf
>  	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=3Dno)
>  clean-files +=3D tests/.cache
> =20
> +checkconfig :=3D $(PYTHON3) -B $(srctree)/tools/kconfig-checker/check.=
py
> +list_checkconfig_rules =3D						\
> +	echo -n >&2 "Available RULES: ";				\
> +	$(checkconfig) list-rules >&2;					\
> +	echo >&2
> +
> +PHONY +=3D checkconfig
> +checkconfig:
> +	$(Q)if [ -z "$(RULES)" ]; then					\
> +		echo >&2 "Usage: make RULES=3D<profile> checkconfig";	\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)if ! $(checkconfig) list-rules | grep -qw "$(RULES)"; then	\
> +		echo >&2 "Unknown RULES profile =3D $(RULES)";		\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)"
> +
>  # Help text used by make help
>  help:
>  	@echo  'Configuration targets:'
> @@ -154,6 +174,9 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and=
 pytest)'
> +	@echo  '  checkconfig	  - Check current config against sanity rules s=
pecified by RULES'
> +	@echo  '                    Example usage: "make RULES=3Dpreempt_rt c=
heckconfig"'
> +	@echo  '                    (requires python3, PyYAML, and jsonschema=
)'
>  	@echo  ''
>  	@echo  'Configuration topic targets:'
>  	@$(foreach f, $(all-config-fragments), \
> -- 2.56.0
>=20

I think this tool may belong in scripts/ due to the kbuild integration,
as was mentioned in the past on another tool review:

https://lore.kernel.org/linux-kbuild/20260428183101.GA3304253@ax162/

- Julian Braha

--------------NII28W9PtdHxoeuGqG7HRNpZ--

--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGoQUDAAAAAAAKCRDElYPCBXNxICr8
AP9ab7lj4yj0R79XczFEOb9wo5VIMZGC3vGZY5oFqemP3wEA3AwrJodpubXiVsw04hceTbqM6l8E
RZBUQogdrKCHxwU=
=wQlh
-----END PGP SIGNATURE-----

--------------3ScbaGCYTbGeYkRt0jz5kpka--

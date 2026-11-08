Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164381;
	b=W2KwY+zjijRKYltkYUld+pLBJoMP88aeAXGAmwJpG4IbulU9FU34XpIwAK2GiptcTbEd
	 +DOb6mIpHBvTz8b2kvsfaDD2ofrD53j0OA4hjQvsAGk+j2lGh6iJ4pcs24A0MKhHHnfPZ
	 CAr1y5cTvVCaB/23PJ/INxZsQrcsWtB5sF6s46cGiPPp3WVsCndFVmeWM84pzkWNbLrBa
	 VJHTscXStg/HRX0g6l16sNeDMoGPm8Ht2AH71Ys1crNgWTr3cLkP7Q9LqeR2pOLuOXp8f
	 iZfwZpdprKA7CZIEEJBb9qFdBAK9SaTlgQnLNXIqi3H6SK8ZXtuwcMtIiY22WjDrN4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
	b=AJZl/XtMETI4AU7wLkaTVrlM9ePeq5CzxdiQEieSpUlRBSeKdHqjBApGutNrBNy42lY1
	 9oqrKDPk2/jv7P4v8K5Ta0NDnYpwN7ZOT2gKN6mzNXmfUE+wAxZ21k/ekDkdfim0Q17k9
	 N5o5cQI5dJBeYPC7zwwH77onk6hf/Nc5Fr6YdaR4ZKvPt9+H7ECMv1FB2dObWD8PCzJS4
	 sivOG4rZOUGKiFTDDeyQZ4d8MqCo/7/3Zh1QK+M5st7udcv+eLw0RfNwiTMUTVTDNOtf3
	 jg1Az1TpPXzepwrZ48UAPn/KLLWKzQ+LoUY1tPp75wWjuVT4QUyzcLc4aH8rIcyWqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC69606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC69606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1959465e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164379; x=1794769179; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=LZiPLsrlu1x8AztRr9Uq6JLLsP7Yb+7eubPrBwFxd8nZPLedfudb5+EUpZi1R3Zd6t
         kdLmKiiLo0hfGZAP7cEuHoJIPs70tvyFELtdLlN1XdvrhI7QJHcJY/U+S7kV2m01vCrj
         uHEzeYRrLKlN6+0dE1mYTwuTWt2Ywkuedk0qTtLZN2NrAmJpNUYApx6likhuTN/VvrkY
         rL51UfQ4i7FagdSGbb56a6go7X0Nt0FXxKcHbn0hstftBI2m6nv4R2BylyLDyckEQwV6
         AZAv5gwpIGj3xQjsPRpl+Exm/kqHQhOECoX/7bJfjkGP1nDZE9TJX7QvaSr0s36996TR
         IYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164379; x=1794769179;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=ZFrx9LSct/Jbl+6yNiU3zIovkpXhAB9Ydnmh1mblSaxojaPLZ2A27wu4O30Ulz/lq5
         wgumxzt7ks6KQ/Y3OCiP36LdKtlFXN556Po90GfHsApC0t2SxNGciz8inW0N8rWdgyb+
         2Ux8fAZNPBZjnsRXsJ2OF7cffBSvF4xkm5/lp1Y7u2XQey9zyoyY2kTlwrvl1pJCIBOc
         HZjpmTznykLMk0gmUBiwti3BAeH5JW/XQwEIbu3itk7YT7svlMCVcDUi6Pum72mXnrSO
         HXn6s/xmfFzjucUOLDaA3qyIlCeoQbab8+CrTZGI6s0aUngmTHpBnel7sQwUqqHKQuIW
         AVgg==
X-Forwarded-Encrypted: i=1; AL+hErFg9dQZDIgQWbqozvQQXJZyVzbUA3b8WFAPlnLLYoP719tzeIAVMuHxGruyrybUJz1x0Ul1fiXdPy5iQoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fEeiCJaDtNG5MYSFyFFJyV0U3Mnb6PN1ntsNP0vljJEPvv90T
	5fIejn1AxzJCneY6EUV3ik2UDbtA/LAVvDRD+rZn/jUEOJ8ODNOCsgVD
X-Gm-Gg: AYBFou1jCf7UOM4/ex/cj2xmd6BEdtjMoR6ShMhr78svML56oge/CWrDSNLbo/t+j54
	EIR/jcbUM2MozgvqimzjwqtYul9rTTqvdOi++N62WtdMyJL3lyGuaWMyaQHCItFR3ZkOA5auDoK
	RkUcXCs14mqjiS5YRVezNe+s7+PM4T+AVQjsD1OyyrcI/8JEEoHt452xYvBoMS25ZqIWXWRHc+W
	ECOPH+Yxk1zVMw3w0PSiDlQhxwOJYIjETZXUgTdD8/LpRNz7aFw6d7DVWFZc56R/55OLbNA8pTv
	jb6UWgiYnJTNsvcj9Oa0YmTwpEbBNzcja6VXurYqnh+ZSCRstBc8rhCLH6aRohFBq7HfwQQsfwb
	uHznu4bj/ExOMtaNgzhc9QNbD3k/W7oUtba6Q+vjMPPstvM2My06NRtVgyLz+K2Xf19cX0TQS7C
	Y6mZ9iU+1CipGIP79hJMrXkuci+NcC8qDEgexpaxlhaxINUIyynIggI7GmuK3bB10HfopXQnbwc
	vpEH+DYmTB/ZckBRD1wp2g6celMmyzeNWFNY0iIF/jzo+lt2gUXzLvs4jYcGWHHEqGcZ48YQeO1
	2rZApmDwQXlMWIeC5mRjfTjaBy31TyAx84d1BRMsRgnkkHbJVPO84+NdwZ0kCZ/8FhfMzUsc0bH
	utZPhx6NzDKeQf5Yl9AUr
X-Received: by 2002:a05:600c:4e50:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4b963c7d01fmr38198605e9.17.1794164379254;
        Sun, 08 Nov 2026 10:59:39 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:38 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
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
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
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
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n0jyBVewKwmhUucz3R1v1dT0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: multipart/mixed; boundary="------------DIHfuWC5H49s70Tk4afQiYfK";
 protected-headers="v1"; hp="clear"
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
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
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>

--------------DIHfuWC5H49s70Tk4afQiYfK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> The kconfig-checker YAML rule files describes which kernel .config symb=
ols
> are expected to be enabled or disabled. Introduce a schema for such fil=
es.
>=20
> Describe and add rational for each element in the schema as well.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  tools/kconfig-checker/schema.yml | 115 +++++++++++++++++++++++++++++++=

>  1 file changed, 115 insertions(+)
>  create mode 100644 tools/kconfig-checker/schema.yml
>=20
> diff --git a/tools/kconfig-checker/schema.yml b/tools/kconfig-checker/s=
chema.yml
> new file mode 100644
> index 000000000000..a7f1b0a78cc7
> --- /dev/null
> +++ b/tools/kconfig-checker/schema.yml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"$schema": "https://json-schema.org/draft-07/schema"
> +
> +title: Schema for kconfig-checker rule files
> +type: object
> +required: [rules]
> +additionalProperties: false
> +
> +properties:
> +  #
> +  # Optional base URL for the documentation page used by rationale
> +  # links.  See `docs_hint`.
> +  #
> +  docs_url:
> +    type: string
> +    format: uri
> +
> +  rules:
> +    type: array
> +    minItems: 1
> +    items:
> +      type: object
> +      oneOf:
> +        - required: [name]
> +        - required: [name_pattern]
> +      required: [expected, severity]
> +      additionalProperties: false
> +
> +      properties:
> +        #
> +        # Exact kernel configuration symbol to check.
> +        #
> +        # Example: CONFIG_PREEMPT_RT
> +        #
> +        name:
> +          type: string
> +          pattern: '^CONFIG_[A-Z0-9_]+$'
> +
> +        #
> +        # Regex matching one or more kernel configuration symbols.
> +        #
> +        # Example: CONFIG_DEBUG_.*
> +        #
> +        name_pattern:
> +          type: string
> +          format: regex
> +
> +        #
> +        # Expected value for the matching kernel configuration option.=

> +        #
> +        # Values:
> +        #
> +        #   y        option is expected to be enabled (built-in or mod=
ule).

Kconfig's tristates use 3-state logic. It seems like you're
approximating 'm' as 'y'?

These are meaningfully different values :/

> +        #   n        option is expected to be disabled or unset.
> +        #   allowed  option is permitted and must not be reported as a=
 violation.
> +        #            This is used to exempt a specific symbol from a b=
roader
> +        #            `name_pattern` rule  with `expected: n`.
> +        #
> +        expected:
> +          type: string
> +          enum: [y, n, allowed]

What if a user wants to specify that the value can be 'n' or 'y', but
not 'm'?

- Julian Braha

--------------DIHfuWC5H49s70Tk4afQiYfK--

--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGmQUDAAAAAAAKCRDElYPCBXNxIBhZ
AP0St5Gm6t5qmVeEmHVFmeBETjuK3DVAGHB6hDtQY4jQcQD/ZxYo1ObM3GAgg5kaUzxTu4/2XW7B
bUrRbAjtbCe3pQs=
=jHVw
-----END PGP SIGNATURE-----

--------------n0jyBVewKwmhUucz3R1v1dT0--

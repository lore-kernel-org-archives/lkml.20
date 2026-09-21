Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD44FDA6C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016356; cv=none; b=MNDTh+VpnRS/zxdkWP6B0hPZn8HoPSKRUjTg1iizkdJdO04u/IOiB9yopWqe5SvqyP2F9chJhseR1NpPp+JgCpd/gT7Iy+Z1iSW1zsgI+Ev/HQlAYd13m7Y6lARYueOOASHqFbvsJmqjDaTRMI/pBcHYCKD+Hs0R1Zt6HB7zirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016356; c=relaxed/simple;
	bh=mU3SJQj/Ljuf4rusWj3TAk8ojCBaQTagmgHF5316+EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyndekmUOkpucdDfEn4lITVPKG6R41B4dJLcM6qvolfen7hmh3V03HuKXjHpSVqqLyY20CqfPpXdirFI+RdrDJqnUBtqYd2l05P43WE3Dzt49yxtUxQhot2SphM7odXqrROhzrBLm/3JJAkh75IialjQTam/SxTN9KlkcGCTNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xb47BrxU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xb47BrxU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so23041735e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790016352; x=1790621152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STMR9cPkSJS6c7hhUU9aRGO6TIwHhxC6csGMBSs/0OA=;
        b=Xb47BrxUvpSucOSOwf9eZK1Av+rUwagEHsQk1s0QxGqVImIuipls+pQvlT4MgfJMKC
         LL37RSXkQ/2lCphsvvWRRDXz+BN6HAr2dldJ9ac6xZ40SW2+HzOx3JjJbkY01GLVhOq+
         qqLd9M/LQ9qKZcO2qxVq/DgWpUxWRj0ls7EdykXgUpyIIiy3kgfejXeiIF5r9V7oRMqp
         fDAI+gFa3UsN3JhHSJ+uOapJ/WPDPATn9nbSL7e1/LP+s15q7ope4nZ0N0Fi/lEdGENJ
         7SRYSQ5wFvQd2fIz0ZpHGpHgez7HJoEOXa7H2ziULm2w2fQDL8ONdKwPtPBUmy0ggaB1
         lGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016352; x=1790621152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STMR9cPkSJS6c7hhUU9aRGO6TIwHhxC6csGMBSs/0OA=;
        b=KVZpPP+Kd26156ur3wPy18Kn2Gpsy9PyQWAeA8l1Cquf/xmfYhsSZ/sacqrRxkP60f
         +LrTPKgJM4eJqi+t6qIZLZFYHEF/QXlxyNeeH4lN+8gMsFK9ZCeq1BxAzWY2qE045CMo
         iTQzn1IRZn6kIRsK1RNdVTTC1fEZn0qTVlMmtPD//mbusu3/Ayg3myKT1tKRx24rNE8O
         sbkaHHwvrJmcqnv5xguTmKoSx5PZEnAMo6uMOgVfIQ8xR8x/8At86bSFdtLWNK3g5g/W
         GBjC4ZSXXaYqXr/7sH08c83vGasvOGTa7m6LgFduwfyHR6SWas26rSzAtmjAFLG2+6S4
         L1oQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoEw+Olpwk3nu73w7URvsak5Qy7RMEQDr3IaJCZ9MILuIt68PYSM8GGmE5obVGPjoRBfJWSlLJrW5hCYc=@vger.kernel.org
X-Gm-Message-State: AFuF++kmY4ndgeJBrKH7xdGQZ3qkzG0S8bTedYhmSARmcd9vy1jCbeC4
	k/Np/90YqFo9Tl9GmGdYwFvdz9FedkoVKMhYtkAXbktGoHyk4fSLJ/rZjguA6YZrUyc=
X-Gm-Gg: AYBFou1PBavwZMAZtmOycQMYic62IO9jzitktN3bksXVswzmiyqDa0vDRFmLR9Az4YS
	hzRYYto+JjpvDnoikuWIiFRio2mzU8w5OMMq11Isp1H/9KakqxdfYD9d23hctvPagdiTQ6z57JY
	0p1WWsxO+fCqKNFTWKPUlLI0D+rptmpQMn4SU9NcM+v4J5ZkFka/kY6rRFojOkegzJlOgK/XrIx
	NfbzgNiW5ZoZt9XufAoY373M0KAxKfm/n55Qt+UXRv1NNMfohm5SE228PlrCF/vBhIclGw1xTf8
	G++v82wQNaqMY6kr21ekYyl5Kid9ftylsI2qH9SuxG3Ttnqw/kA020HQnIFP9O550L7jwv+YgmD
	+TwdOOuKK7Rq+1cqQgjcxDbjSG+e8v8xj83zbDE0eDB0f5K/63S4bRPyg9xX+oxt+XRzGxE0/bl
	BrbzjtvS9PbXmfomEQ8NJ0dDVVfgY8QwdhNXSXm/esSVacp7XdMnx/868FgybIylyBpstdcAp1u
	PSniPlvaoB9Dnk=
X-Received: by 2002:a05:600c:8b35:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49fc573602fmr153846395e9.19.1790016351932;
        Mon, 21 Sep 2026 11:45:51 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc585920fsm660931585e9.4.2026.09.21.11.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:45:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 20:45:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Bradford Love <brad@nextdimension.cc>, 
	Kees Cook <kees@kernel.org>, Deepanshu Kartikey <kartikey406@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
Message-ID: <arF61V7vW3EWZxG8@monoceros>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
 <20260804114625.2314430-4-linkmauve@linkmauve.fr>
 <arA3TaFiFOx7ubjj@monoceros>
 <arFixwvATR2hkp68@desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnkrf5vqwa353ko3"
Content-Disposition: inline
In-Reply-To: <arFixwvATR2hkp68@desktop>


--bnkrf5vqwa353ko3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
MIME-Version: 1.0

Hello,

On Mon, Sep 21, 2026 at 07:00:55PM +0200, Link Mauve wrote:
> On Sun, Sep 20, 2026 at 09:46:42PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > If desired you can keep all the assignments here using:
> >=20
> > 	regmap_config =3D (typeof(regmap_config)){
> > 		.reg_bits =3D 8,
> > 		.val_bits =3D 8,
> > 		.lock =3D ts2020_regmap_lock,
> > 		.unlock =3D ts2020_regmap_unlock,
> > 		.lock_arg =3D dev,
> > 	};
> >=20
> > > +	dev->regmap =3D regmap_init_i2c(client, &regmap_config);
>=20
> I think I still prefer my approach, there is very little usage of the
> typeof() pattern in the kernel, the only benefit would be to keep
> lock_arg in the same location as the rest of the initial values.

If it's just the typeof you don't like, you can also use:

	regmap_config =3D (struct regmap_config){
		.reg_bits =3D 8,
		...
	};

=F0=9F=A4=B7

Best regards
Uwe

--bnkrf5vqwa353ko3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxe1IACgkQj4D7WH0S
/k5gJgf8DOeDLdq5H+KaWBbvCYrLvFFtm262RF24rQw0QA48ypLMv2avfJ+JvYVI
IILIVFl82+x/PUKioml6DEpGoeRMQkr/BTCeMFOrKUBgxaoUjt5pCrtkelvfwMAu
gJxqT4sI/68tmGqiQ5ArCaEwPySjnKxDdhEGSBXBhyUmFNgf9BsPeKpPrw6hPL/f
rQf2SsDlbeNm2FJvGejmwlYuZT/51+/TtQmlzuZbBakKann13BiHs0AbRXPhy9xW
8qxzD3iIBd6wA9bKY4NNpYL0WCjw1z5z3ZEvD4qwGZ2gDr0vIydPeSmSrhZqGi/f
6UpNlgAcqxLN7HmTgjuRrJzeXHcaaA==
=b5nS
-----END PGP SIGNATURE-----

--bnkrf5vqwa353ko3--
